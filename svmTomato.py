import numpy as np
from sklearn import svm
from sklearn.metrics import accuracy_score, classification_report
import os
import zipfile
import torch
from torchvision import datasets,transforms
import matplotlib.pyplot as plt
from sklearn import metrics
from torch.utils.data import DataLoader 
from torch import nn

zip_file_path = r'C:\Users\Sujal Joshi\Downloads\archive.zip'

extracted_path = r'C:\Users\Sujal Joshi\Downloads\archive'

with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
    zip_ref.extractall(extracted_path)

root_path = os.path.join(extracted_path, 'tomato')


transformation = transforms.Compose([
    transforms.Resize((64, 64)),
    transforms.RandomHorizontalFlip(),
    transforms.RandomVerticalFlip(),
    transforms.RandomRotation(30),
    transforms.ToTensor(),
])

#loading data

train_path = os.path.join(root_path, 'train')
train_data = datasets.ImageFolder(root=train_path, 
                                  transform=transformation)


val_path = os.path.join(root_path, 'val')
test_data = datasets.ImageFolder(root=val_path,
                                transform=transformation)


classes_name=train_data.classes

BATCH_SIZE=32
train_dataloader=DataLoader(train_data,
                            batch_size=BATCH_SIZE,
                            shuffle=True)

test_dataloader=DataLoader(test_data,
                           batch_size=BATCH_SIZE,
                           shuffle=False)

class TomatoCnnNetwork(nn.Module):
    def __init__(self, input_shape: int, num_classes: int):
        super(TomatoCnnNetwork, self).__init__()
        self.conv1 = nn.Conv2d(in_channels=input_shape, out_channels=32, kernel_size=3, stride=1, padding=1)
        self.conv2 = nn.Conv2d(in_channels=32, out_channels=64, kernel_size=3, stride=1, padding=1)
        self.conv3 = nn.Conv2d(in_channels=64, out_channels=128, kernel_size=3, stride=1, padding=1)
        self.pool = nn.MaxPool2d(kernel_size=2, stride=2)
        self.fc1 = nn.Linear(128 * 28 * 28, 128)
        self.fc2 = nn.Linear(128, num_classes)
        self.relu = nn.ReLU()

    def forward(self, x):
        x = self.relu(self.conv1(x))
        x = self.pool(x)
        x = self.relu(self.conv2(x))
        x = self.pool(x)
        x = self.relu(self.conv3(x))
        x = self.pool(x)
        x = x.view(-1, 128 * 28 * 28)  # Flatten the tensor
        x = self.relu(self.fc1(x))
        x = self.fc2(x)
        return x

torch.manual_seed(42)
model_tomato_cnn=TomatoCnnNetwork(input_shape=3,
                                  num_classes=len(classes_name))


# Flatten the image data for traditional SVM
X_train_flat = np.array([x.flatten() for x, _ in train_data])
X_test_flat = np.array([x.flatten() for x, _ in test_data])

# Get the labels
y_train = np.array([y for _, y in train_data])
y_test = np.array([y for _, y in test_data])

# Create and train the SVM model
svm_model = svm.SVC(kernel='linear', C=1.0, random_state=42)
svm_model.fit(X_train_flat, y_train)

# Predict on the test set

y_pred = svm_model.predict(X_test_flat)

# Calculate accuracy
accuracy = accuracy_score(y_test, y_pred)
print('Test Accuracy:', accuracy)

# Print a classification report
print('Classification Report:')
print(classification_report(y_test, y_pred))

conf_matrix = metrics.confusion_matrix(y_test, y_pred)

# Plot confusion matrix
plt.figure(figsize=(8, 6))
plt.imshow(conf_matrix, interpolation='nearest', cmap=plt.cm.Blues)
plt.title('Confusion matrix')
plt.colorbar()

classes = np.unique(y_test)
tick_marks = np.arange(len(classes))
plt.xticks(tick_marks, classes)
plt.yticks(tick_marks, classes)

plt.ylabel('True label')
plt.xlabel('Predicted label')
plt.show()
