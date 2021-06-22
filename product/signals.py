from django.db.models.signals import post_save
from django.contrib.auth.models import User
from django.dispatch import receiver
from .models import Product


@receiver(post_save, sender=Product)
def save_product(sender, instance, **kwargs):
    instance.product.save()
