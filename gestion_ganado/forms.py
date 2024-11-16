from django import forms
from  gestion_ganado.models import *

class ResesForm(forms.ModelForm):

    class  Meta:
            model = Reses
            fields = [ 'nombre','numero_registro','edad', 'peso', 'raza','genero']