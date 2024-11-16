from django.db import models
from django.utils import timezone
# Create your models here.



class Genero(models.Model):
    nombre = models.CharField(max_length=45)
    descripcion = models.TextField()
    activo=models.BooleanField(default=True)

    def __str__(self):
        return self.nombre

class Reses(models.Model):
    nombre = models.CharField(max_length=100)
    numero_registro = models.FloatField()  # Field name made lowercase.
    edad = models.CharField(max_length=50)
    peso = models.FloatField()
    raza = models.CharField(max_length=50)
    genero = models.ForeignKey(Genero, on_delete=models.CASCADE, related_name='generocat')
    timestamp = models.DateTimeField(default=timezone.now)
    descripcion = models.TextField()
    fecha_creacion = models.DateTimeField(auto_now_add=True)
    modificacion_date = models.DateTimeField(auto_now=True)

    def estado_salud(self):
        if self.peso < 500:
            return 'Bajo'
        elif 500 <= self.peso <= 650:
            return 'Normal'
        return 'Alto'

    def __str__(self):
        return self.nombre
