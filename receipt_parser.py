# Function that checks if string contains punctuation
def contains_punc(value):
    # Imports string library
    import string
    
    for c in value:
        # If char is not punctuation, add it to the result
        if c in string.punctuation:
            return 1
    return 0

def parse_receipt(picture_name):
    import io
    import os

    # Imports the Google Cloud client library
    from google.cloud import vision
    from google.cloud.vision import types
    from google.cloud import storage

    # Explicitly use service account credentials by specifying the private key file
    vision_client = vision.ImageAnnotatorClient.from_service_account_json(
        '/Users/griffinmalm/Downloads/ReceiptParser-7ffd12ec3fa2.json')

    # The name of the image file to annotate
    file_name = os.path.join(os.path.dirname(__file__), picture_name)

    # Loads the image into memory
    with io.open(file_name, 'rb') as image_file:
        content = image_file.read()
    image = types.Image(content=content)

    # Performs text detection on the image file
    resp = vision_client.text_detection(image=image)

    # Initializes array for screened items
    edited = []

    # Screens inital string items for strings that contain certain keywords (mostly,
    # common words found on receipts) and numbers/punctuation, and adds strings that
    # do not contain and of the previously mentioned items to a new array
    for i in resp.text_annotations:
        if i.description.find("kg") == -1\
        and i.description.lower() != "subtotal"\
        and i.description.lower() != "total"\
        and i.description.lower() != "cash"\
        and i.description.lower() != "change"\
        and i.description.lower() != "savings"\
        and i.description.lower() != "tax"\
        and i.description.lower() != "balance"\
        and i.description.lower() != "loyalty"\
        and i.description.lower() != "net"\
        and i.description.lower() != "grocery"\
        and i.description.lower() != "special"\
        and not any(char.isdigit() for char in i.description)\
        and not contains_punc(i.description)\
        and len(i.description) > 2:
            edited.append(i.description.lower())

        # Return array
        return edited
