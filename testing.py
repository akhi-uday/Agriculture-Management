import os
import unittest
from models import app, db,Farmer


class FlaskTestcase(unittest.TestCase):

    def test_welcome(self):
        tester=app.test_client(self)
        response=tester.get('/login',content_type='html/text')
        self.assertEqual(response.status_code,200)

    def test_crop(self):
        tester=app.test_client(self)
        response=tester.get('/crop_price',content_type='html/text')
        self.assertEqual(response.status_code,200)

    def test_price(self):
        tester=app.test_client(self)
        response=tester.get('/crop_info',content_type='html/text')
        self.assertEqual(response.status_code,200)

    def test_input(self):
        tester=app.test_client(self)
        response=tester.get('/crop_input',content_type='html/text')
        self.assertEqual(response.status_code,200)

    def test_admin(self):
        tester=app.test_client(self)
        response=tester.get('/admin_login',content_type='html/text')
        self.assertEqual(response.status_code,200)

    def test_mod1(self):
        tester=app.test_client(self)
        response=tester.get('/modify_crop',content_type='html/text')
        self.assertEqual(response.status_code,200)

    def test_welcome(self):
        tester=app.test_client(self)
        response=tester.get('/modify_price',content_type='html/text')
        self.assertEqual(response.status_code,200)

if __name__ == "__main__":
    unittest.main()
