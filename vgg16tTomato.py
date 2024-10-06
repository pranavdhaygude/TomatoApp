import torch
from torch import nn
import matplotlib.pyplot as plt
from torchvision import transforms, datasets
from torch.utils.data import DataLoader
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix
import numpy as np
from torchvision import models
import os
import zipfile
from tqdm import tqdm  # Import tqdm for progress tracking

# Define the paths
zip_file_path = r'C:\Users\Sujal Joshi\Downloads\archive.zip'
extracted_path = r'C:\Users\Sujal Joshi\Downloads\archive'

# Extract the dataset
with zipfile.ZipFile(zip_file_path, 'r') as zip_ref:
    zip_ref.extractall(extracted_path)

# Set the root path for the dataset
root_path = os.path.join(extracted_path, 'tomato')

# Define transformations
transformation = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.RandomHorizontalFlip(),
    transforms.RandomVerticalFlip(),
    transforms.RandomRotation(30),
    transforms.ToTensor(),
])

# Load the data
train_path = os.path.join(root_path, 'train')
train_data = datasets.ImageFolder(root=train_path, transform=transformation)

val_path = os.path.join(root_path, 'val')
test_data = datasets.ImageFolder(root=val_path, transform=transformation)

# Get the class names
classes_name = train_data.classes

# Set batch size and create data loaders
BATCH_SIZE = 32
train_dataloader = DataLoader(train_data, batch_size=BATCH_SIZE, shuffle=True)
test_dataloader = DataLoader(test_data, batch_size=BATCH_SIZE, shuffle=False)

# Load pre-trained VGG16 model
vgg16 = models.vgg16(pretrained=True)

# Modify VGG16 to fit your classification task
num_classes = len(classes_name)
vgg16.classifier[6] = nn.Linear(vgg16.classifier[6].in_features, num_classes)

# Define your loss function and optimizer
loss_fn = nn.CrossEntropyLoss()
optimizer = torch.optim.SGD(vgg16.parameters(), lr=0.001)

# Training loop
epochs = 20
model_path = 'tomato_vgg16_model.pth'

for epoch in range(epochs):
    print(f"Epoch: {epoch + 1}\n-------")

    # Wrap the train_dataloader with tqdm for progress tracking
    for batch, (X, y) in tqdm(enumerate(train_dataloader), total=len(train_dataloader)):
        vgg16.train()
        y_pred = vgg16(X)
        loss = loss_fn(y_pred, y)
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

    # Save the model as a checkpoint after each epoch
    checkpoint_path = f'tomato_vgg16_checkpoint_epoch_{epoch + 1}.pth'
    torch.save(vgg16.state_dict(), checkpoint_path)

    # Validation and accuracy calculation for each epoch
    vgg16.eval()
    test_predictions = []
    test_labels = []

    with torch.no_grad():
        for X, y in test_dataloader:
            y_test = vgg16(X)
            _, predictions = torch.max(y_test, 1)
            test_predictions.extend(predictions.cpu().numpy())
            test_labels.extend(y.cpu().numpy())

    test_accuracy = accuracy_score(test_labels, test_predictions)
    print(f"Test accuracy for epoch {epoch + 1}: {test_accuracy * 100:.2f}%")

# Save the model from the 20th epoch separately
torch.save(vgg16.state_dict(), model_path)

# Print classification report
print("Classification Report:")
print(classification_report(test_labels, test_predictions, target_names=classes_name))

# Calculate and plot the confusion matrix
conf_matrix = confusion_matrix(test_labels, test_predictions)
plt.figure(figsize=(8, 6))
plt.imshow(conf_matrix, interpolation='nearest', cmap=plt.cm.Blues)
plt.title('Confusion matrix')
plt.colorbar()

tick_marks = np.arange(len(classes_name))
plt.xticks(tick_marks, classes_name, rotation=45)
plt.yticks(tick_marks, classes_name)

plt.ylabel('True label')
plt.xlabel('Predicted label')
plt.show()
