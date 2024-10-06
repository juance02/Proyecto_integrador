from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
# Create your views here.


def Inicio(request):
    #product = producto.objects.all()
    #categorias=Categorias.objects.filter(activo=True)
    #context = { 'product': product,'categorias':categorias}
    return render(request, "index.html")






