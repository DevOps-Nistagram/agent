from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='product-home'),
    path('about/', views.about, name='product-about'),
]