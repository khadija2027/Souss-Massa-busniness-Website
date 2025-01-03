# Generated by Django 5.1.4 on 2024-12-18 21:02

import django.core.validators
import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Alumni',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('NbL', models.FloatField(null=True)),
                ('echange', models.PositiveIntegerField(null=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(100)])),
                ('insertion', models.PositiveIntegerField(null=True, validators=[django.core.validators.MinValueValidator(1), django.core.validators.MaxValueValidator(100)])),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='BDA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('titre', models.CharField(max_length=100)),
                ('paragraphe', models.TextField(null=True)),
                ('MotPresident', models.TextField(null=True)),
                ('Presidentname', models.CharField(max_length=100)),
                ('description', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Club',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Clubs',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='club_images/')),
                ('instagram_link', models.URLField(blank=True, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='ClubClubs',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('club', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.club')),
                ('clubs', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.clubs')),
            ],
        ),
        migrations.AddField(
            model_name='club',
            name='clubs',
            field=models.ManyToManyField(to='playground.clubs'),
        ),
        migrations.CreateModel(
            name='Deplome',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
                ('poste', models.CharField(max_length=100, null=True)),
                ('promo', models.CharField(max_length=100, null=True)),
                ('image', models.ImageField(null=True, upload_to='deplomes/')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='AlumniDeplome',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('alumni', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.alumni')),
                ('deplome', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.deplome')),
            ],
        ),
        migrations.AddField(
            model_name='alumni',
            name='deplome',
            field=models.ManyToManyField(to='playground.deplome'),
        ),
        migrations.CreateModel(
            name='Equipe',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, null=True)),
                ('position', models.CharField(max_length=200, null=True)),
                ('content', models.TextField(blank=True, null=True)),
                ('image', models.ImageField(null=True, upload_to='equipe_images/')),
                ('publish', models.BooleanField(default=False)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['publish'],
            },
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('content', models.TextField(blank=True, null=True)),
                ('image', models.ImageField(null=True, upload_to='events_images/')),
                ('theme', models.CharField(blank=True, choices=[('Associations', 'Associations'), ('artistique', ' Artistique'), ('compétition', 'Compétition'), ('conférence', 'Conférence'), ('ecole', 'Ecole'), ('entreprises', 'Entreprises'), ('entreprenariat', 'Entreprenariat'), ('formations', 'Formations'), ('sportif', ' Sportif'), ('international', 'International')], max_length=50, null=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('event_start_date', models.DateTimeField(null=True)),
                ('event_finish_date', models.DateTimeField(null=True)),
                ('publish', models.BooleanField(default=False)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['created', 'publish', 'event_finish_date'],
            },
        ),
        migrations.CreateModel(
            name='Formati',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, null=True)),
                ('description', models.TextField(null=True)),
                ('presentation', models.TextField(null=True)),
                ('formation_type', models.CharField(max_length=50, null=True)),
                ('conditions_access', models.FileField(blank=True, upload_to='formations/documents/')),
                ('programme', models.FileField(blank=True, upload_to='formations/documents/')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Histoire',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, null=True)),
                ('content', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='AlumniHistoire',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('alumni', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.alumni')),
                ('histoire', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.histoire')),
            ],
        ),
        migrations.AddField(
            model_name='alumni',
            name='histoire',
            field=models.ManyToManyField(to='playground.histoire'),
        ),
        migrations.CreateModel(
            name='MissionBDA',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('description', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='BDAMission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bda', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.bda')),
                ('mission', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.missionbda')),
            ],
        ),
        migrations.AddField(
            model_name='bda',
            name='mission',
            field=models.ManyToManyField(to='playground.missionbda'),
        ),
        migrations.CreateModel(
            name='MissionBDE',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('description', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='BDEMission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bde', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.bda')),
                ('mission', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.missionbde')),
            ],
        ),
        migrations.CreateModel(
            name='BDE',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField(null=True)),
                ('instagram_link', models.URLField(blank=True, null=True)),
                ('facebook_link', models.URLField(blank=True, null=True)),
                ('tiktok_link', models.URLField(blank=True, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('mission', models.ManyToManyField(to='playground.missionbde')),
            ],
        ),
        migrations.CreateModel(
            name='News',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, null=True)),
                ('content', models.TextField(blank=True, null=True)),
                ('image', models.ImageField(null=True, upload_to='news_images/')),
                ('theme', models.CharField(blank=True, choices=[('Aasociations', 'Associations'), ('compétition', 'Compétition'), ('conférence', 'Conférence'), ('distinction', ' Distinction'), ('ecole', 'Ecole'), ('entreprises', 'Entreprises'), ('entreprenariat', 'Entreprenariat'), ('formations', 'Formations'), ('international', 'International')], max_length=50, null=True)),
                ('publish', models.BooleanField(default=False)),
                ('created', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['publish', 'created'],
            },
        ),
        migrations.CreateModel(
            name='Objec',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, null=True)),
                ('description', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='FormationObjec',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('formation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.formati')),
                ('objec', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.objec')),
            ],
        ),
        migrations.CreateModel(
            name='Formation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, null=True)),
                ('formation_type', models.CharField(max_length=50, null=True)),
                ('image', models.ImageField(null=True, upload_to='formations/')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('obj', models.ManyToManyField(to='playground.objec')),
            ],
        ),
        migrations.AddField(
            model_name='formati',
            name='obj',
            field=models.ManyToManyField(to='playground.objec'),
        ),
        migrations.CreateModel(
            name='Objectif',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, null=True)),
                ('description', models.CharField(max_length=100, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Partenaire',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
                ('description', models.TextField(null=True)),
                ('image', models.ImageField(null=True, upload_to='partenaires/')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='PartenaireBDE',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('image', models.ImageField(blank=True, null=True, upload_to='partenairebdes_images/')),
                ('description', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='BDEParteanire',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('bde', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.bde')),
                ('partenaire', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.partenairebde')),
            ],
        ),
        migrations.AddField(
            model_name='bde',
            name='partenaire',
            field=models.ManyToManyField(to='playground.partenairebde'),
        ),
        migrations.CreateModel(
            name='Prerequi',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='FormationPrerequi',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('formation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.formati')),
                ('prerequi', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.prerequi')),
            ],
        ),
        migrations.AddField(
            model_name='formati',
            name='prerequi',
            field=models.ManyToManyField(to='playground.prerequi'),
        ),
        migrations.CreateModel(
            name='Prof',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
                ('position', models.CharField(max_length=100, null=True)),
                ('image', models.ImageField(null=True, upload_to='professors/')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='FormationProf',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('formation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.formati')),
                ('prof', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.prof')),
            ],
        ),
        migrations.AddField(
            model_name='formati',
            name='prof',
            field=models.ManyToManyField(to='playground.prof'),
        ),
        migrations.CreateModel(
            name='Reseau',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
                ('poste', models.CharField(max_length=100, null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='AlumniReseau',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('alumni', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.alumni')),
                ('reseau', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.reseau')),
            ],
        ),
        migrations.AddField(
            model_name='alumni',
            name='reseau',
            field=models.ManyToManyField(to='playground.reseau'),
        ),
        migrations.CreateModel(
            name='Retour',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, null=True)),
                ('comment', models.TextField(null=True)),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='AlumniRetour',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('alumni', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.alumni')),
                ('retour', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='playground.retour')),
            ],
        ),
        migrations.AddField(
            model_name='alumni',
            name='retour',
            field=models.ManyToManyField(to='playground.retour'),
        ),
        migrations.CreateModel(
            name='Sport',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, null=True)),
                ('image', models.ImageField(null=True, upload_to='sports/')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
