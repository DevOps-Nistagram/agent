from django import forms
from django.contrib.auth.models import User
from .models import Product

class ProductUpdateForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = ['title', 'image']
