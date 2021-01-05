import os
from PIL import Image
from werkzeug import secure_filename
import random, string
from flask import url_for,current_app
import urllib
from PIL import Image

def add_picture(image):
    filename = secure_filename(image.filename)
    filepath = os.path.join(current_app.root_path,'static/',filename)
    output_size = (720,720)
    pic = Image.open(image)
    pic.thumbnail(output_size)
    pic.save(filepath)
    return filename
