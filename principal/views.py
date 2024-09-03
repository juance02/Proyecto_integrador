from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
# Create your views here.


def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data['username']
            password = form.cleaned_data['password1']
            user = authenticate(username=username, password=password)
            login(request, user) 
            messages.success(request, f'Usuario {username} creado')         
            return redirect('Form')
            
    else:
        form = UserCreationForm()

    return render(request, 'registration/register.html', {"form": form} )


def Inicio(request):
    #product = producto.objects.all()
    #categorias=Categorias.objects.filter(activo=True)
    #context = { 'product': product,'categorias':categorias}
    return render(request, "index.html")


