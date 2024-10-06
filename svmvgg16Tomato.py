import numpy as np
from sklearn import svm
from sklearn.metrics import accuracy_score, classification_report
import os
import zipfile
import torch
from torchvision import datasets, transforms, models
import matplotlib.pyplot as plt
from sklearn import metrics
from torch.utils.data import DataLoader 
from torch import nn
import joblib


# Specify the paths
zip_file_path = r'C:\Users\Sujal Joshi\Downloads\archive.zip'
extracted_path = r'C:\Users\Sujal Joshi\Downloads\archive'

# Extract the dataset from the ZIP file
with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
    zip_ref.extractall(extracted_path)

root_path = os.path.join(extracted_path, 'tomato')



transformation = transforms.Compose([
    transforms.Resize((224, 224)),  # Adjust the input size for VGG16
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])  # Use ImageNet normalization
])

# Loading data
train_path = os.path.join(root_path, 'train')
train_data = datasets.ImageFolder(root=train_path, transform=transformation)

val_path = os.path.join(root_path, 'val')
test_data = datasets.ImageFolder(root=val_path, transform=transformation)

classes_name = train_data.classes

print(train_data.shape[1])

BATCH_SIZE = 32
train_dataloader = DataLoader(train_data, batch_size=BATCH_SIZE, shuffle=True)
test_dataloader = DataLoader(test_data, batch_size=BATCH_SIZE, shuffle=False)

# Use pre-trained VGG16 for feature extraction
vgg16 = models.vgg16(pretrained=True)

# Remove the last classification layer to use it as a feature extractor
vgg16 = nn.Sequential(*list(vgg16.features.children()))

# Define a function to extract features from VGG16
def extract_features(model, dataloader):
    model.eval()
    features = []
    labels = []
    with torch.no_grad():
        for inputs, labels_batch in dataloader:
            features_batch = model(inputs).view(inputs.size(0), -1)  # Flatten the features
            features.append(features_batch)
            labels.append(labels_batch)
    return torch.cat(features), torch.cat(labels)


# Extract features from VGG16 for both the training and test datasets
train_features, train_labels = extract_features(vgg16, train_dataloader)
test_features, test_labels = extract_features(vgg16, test_dataloader)

# Convert features and labels to numpy arrays
train_features = train_features.numpy()
test_features = test_features.numpy()
train_labels = train_labels.numpy()
test_labels = test_labels.numpy()

# Create and train the SVM model on the extracted features
svm_model = svm.SVC(kernel='linear', C=1.0, random_state=42)
svm_model.fit(train_features, train_labels)

# Predict on the test set using the SVM
y_pred = svm_model.predict(test_features)

# Calculate accuracy
accuracy = accuracy_score(test_labels, y_pred)
print('Test Accuracy:', accuracy)

# Print a classification report
print('Classification Report:')
print(classification_report(test_labels, y_pred))

# Confusion matrix and plotting code (unchanged)
conf_matrix = metrics.confusion_matrix(test_labels, y_pred)

# Plot the confusion matrix
plt.figure(figsize=(8, 6))
plt.imshow(conf_matrix, interpolation='nearest', cmap=plt.cm.Blues)
plt.title('Confusion matrix')
plt.colorbar()

classes = np.unique(test_labels)
tick_marks = np.arange(len(classes))
plt.xticks(tick_marks, classes)
plt.yticks(tick_marks, classes)

plt.ylabel('True label')
plt.xlabel('Predicted label')
plt.show()

svm_model = svm.SVC(kernel='linear', C=1.0, random_state=42)
svm_model.fit(train_features, train_labels)

# Save the SVM model to a file using joblib
model_filename = "svm_model.joblib"
joblib.dump(svm_model, model_filename)
print(f"Model saved to {model_filename}")
