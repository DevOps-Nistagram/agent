from django.shortcuts import render

products = []

def home(request):
    context = {
        'products': products
    }
    return render(request, 'product/home.html', context)

def about(request):
    return render(request, 'product/about.html', {'title': 'About'})