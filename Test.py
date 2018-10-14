import io
import os

# Imports the Google Cloud client library
from google.cloud import vision
from google.cloud.vision import types

"""
def explicit():
    from google.cloud import storage

    # Explicitly use service account credentials by specifying the private key
    # file.
    storage_client = storage.Client.from_service_account_json(
        '/Users/griffinmalm/Downloads/ReceiptParser-72c86e6231fe.json')

    # Make an authenticated API request
    buckets = list(storage_client.list_buckets())
    print(buckets)

explicit()"""

def test(req,res):
    # Instantiates a client
    client = vision.ImageAnnotatorClient()

    # The name of the image file to annotate
    file_name = os.path.join(
        os.path.dirname(__file__),
        'resources/wakeupcat.jpg')

    # Loads the image into memory
    with io.open(file_name, 'rb') as image_file:
        content = image_file.read()

    image = types.Image(content=content)

    # Performs label detection on the image file
    response = client.label_detection(image=image)
    labels = response.label_annotations

    print('Labels:')
    for label in labels:
        print(label.description)