# Generated by Django 5.1.3 on 2024-11-16 20:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestion_ganado', '0003_reses_genero'),
    ]

    operations = [
        migrations.AddField(
            model_name='reses',
            name='nombre',
            field=models.CharField(default=1, max_length=100),
            preserve_default=False,
        ),
    ]
