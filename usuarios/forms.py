from dataclasses import fields
from pyexpat import model
from django import forms
from usuarios.models import Cuentas

class registrarseGanaderoForm(forms.ModelForm):

    password = forms.CharField(widget=forms.PasswordInput(attrs={
        'placeholder': 'Ingrese password'
    }))

    confirmar_password = forms.CharField(widget=forms.PasswordInput(attrs={
        'placeholder': 'Confirmar password'
    }))
    class Meta:
        model = Cuentas
        fields = ['nombres', 'apellidos', 'numero_telefono', 'email','password']

    def clean(self):
        cleaned_data = super(registrarseGanaderoForm, self).clean()
        password = cleaned_data.get('password')
        confirmar_password = cleaned_data.get('confirmar_password')

        if password != confirmar_password:
            raise forms.ValidationError(
                "La contraseña no coiciden"
            )
