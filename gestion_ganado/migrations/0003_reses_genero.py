# Generated by Django 5.1 on 2024-10-30 16:00

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestion_ganado', '0002_genero_rename_nombre_reses_raza_remove_reses_image'),
    ]

    operations = [
        migrations.AddField(
            model_name='reses',
            name='genero',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, related_name='generocat', to='gestion_ganado.genero'),
            preserve_default=False,
        ),
    ]
