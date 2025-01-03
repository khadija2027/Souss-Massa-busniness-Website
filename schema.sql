# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)
    name = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()
    first_name = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    action_time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class PlaygroundAlumni(models.Model):
    nbl = models.FloatField(db_column='NbL', blank=True, null=True)  # Field name made lowercase.
    echange = models.PositiveIntegerField(blank=True, null=True)
    insertion = models.PositiveIntegerField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_alumni'


class PlaygroundAlumniDeplome(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    deplome = models.ForeignKey('PlaygroundDeplome', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumni_deplome'
        unique_together = (('alumni', 'deplome'),)


class PlaygroundAlumniHistoire(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    histoire = models.ForeignKey('PlaygroundHistoire', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumni_histoire'
        unique_together = (('alumni', 'histoire'),)


class PlaygroundAlumniReseau(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    reseau = models.ForeignKey('PlaygroundReseau', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumni_reseau'
        unique_together = (('alumni', 'reseau'),)


class PlaygroundAlumniRetour(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    retour = models.ForeignKey('PlaygroundRetour', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumni_retour'
        unique_together = (('alumni', 'retour'),)


class PlaygroundAlumnideplome(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    deplome = models.ForeignKey('PlaygroundDeplome', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumnideplome'


class PlaygroundAlumnihistoire(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    histoire = models.ForeignKey('PlaygroundHistoire', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumnihistoire'


class PlaygroundAlumnireseau(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    reseau = models.ForeignKey('PlaygroundReseau', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumnireseau'


class PlaygroundAlumniretour(models.Model):
    alumni = models.ForeignKey(PlaygroundAlumni, models.DO_NOTHING)
    retour = models.ForeignKey('PlaygroundRetour', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_alumniretour'


class PlaygroundBda(models.Model):
    titre = models.CharField(max_length=100)
    paragraphe = models.TextField(blank=True, null=True)
    motpresident = models.TextField(db_column='MotPresident', blank=True, null=True)  # Field name made lowercase.
    presidentname = models.CharField(db_column='Presidentname', max_length=100)  # Field name made lowercase.
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_bda'


class PlaygroundBdaMission(models.Model):
    bda = models.ForeignKey(PlaygroundBda, models.DO_NOTHING)
    missionbda = models.ForeignKey('PlaygroundMissionbda', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_bda_mission'
        unique_together = (('bda', 'missionbda'),)


class PlaygroundBdamission(models.Model):
    bda = models.ForeignKey(PlaygroundBda, models.DO_NOTHING)
    mission = models.ForeignKey('PlaygroundMissionbda', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_bdamission'


class PlaygroundBde(models.Model):
    description = models.TextField(blank=True, null=True)
    instagram_link = models.CharField(max_length=200, blank=True, null=True)
    facebook_link = models.CharField(max_length=200, blank=True, null=True)
    tiktok_link = models.CharField(max_length=200, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_bde'


class PlaygroundBdeMission(models.Model):
    bde = models.ForeignKey(PlaygroundBde, models.DO_NOTHING)
    missionbde = models.ForeignKey('PlaygroundMissionbde', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_bde_mission'
        unique_together = (('bde', 'missionbde'),)


class PlaygroundBdePartenaire(models.Model):
    bde = models.ForeignKey(PlaygroundBde, models.DO_NOTHING)
    partenairebde = models.ForeignKey('PlaygroundPartenairebde', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_bde_partenaire'
        unique_together = (('bde', 'partenairebde'),)


class PlaygroundBdemission(models.Model):
    bde = models.ForeignKey(PlaygroundBda, models.DO_NOTHING)
    mission = models.ForeignKey('PlaygroundMissionbde', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_bdemission'


class PlaygroundBdeparteanire(models.Model):
    bde = models.ForeignKey(PlaygroundBde, models.DO_NOTHING)
    partenaire = models.ForeignKey('PlaygroundPartenairebde', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_bdeparteanire'


class PlaygroundClub(models.Model):
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_club'


class PlaygroundClubClubs(models.Model):
    club = models.ForeignKey(PlaygroundClub, models.DO_NOTHING)
    clubs = models.ForeignKey('PlaygroundClubs', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_club_clubs'
        unique_together = (('club', 'clubs'),)


class PlaygroundClubclubs(models.Model):
    club = models.ForeignKey(PlaygroundClub, models.DO_NOTHING)
    clubs = models.ForeignKey('PlaygroundClubs', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_clubclubs'


class PlaygroundClubs(models.Model):
    name = models.CharField(unique=True, max_length=100)
    image = models.CharField(max_length=100, blank=True, null=True)
    instagram_link = models.CharField(max_length=200, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_clubs'


class PlaygroundDeplome(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    poste = models.CharField(max_length=100, blank=True, null=True)
    promo = models.CharField(max_length=100, blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_deplome'


class PlaygroundEquipe(models.Model):
    name = models.CharField(max_length=200, blank=True, null=True)
    position = models.CharField(max_length=200, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    publish = models.BooleanField()
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_equipe'


class PlaygroundEvent(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    theme = models.CharField(max_length=50, blank=True, null=True)
    created = models.DateTimeField()
    event_start_date = models.DateTimeField(blank=True, null=True)
    event_finish_date = models.DateTimeField(blank=True, null=True)
    publish = models.BooleanField()
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)
    lieu = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_event'


class PlaygroundFormati(models.Model):
    name = models.CharField(max_length=200, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    presentation = models.TextField(blank=True, null=True)
    formation_type = models.CharField(max_length=50, blank=True, null=True)
    conditions_access = models.CharField(max_length=100)
    programme = models.CharField(max_length=100)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)
    im = models.CharField(max_length=100, blank=True, null=True)
    ima = models.CharField(max_length=100, blank=True, null=True)
    imag = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_formati'


class PlaygroundFormatiObj(models.Model):
    formati = models.ForeignKey(PlaygroundFormati, models.DO_NOTHING)
    objec = models.ForeignKey('PlaygroundObjec', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formati_obj'
        unique_together = (('formati', 'objec'),)


class PlaygroundFormatiPrerequi(models.Model):
    formati = models.ForeignKey(PlaygroundFormati, models.DO_NOTHING)
    prerequi = models.ForeignKey('PlaygroundPrerequi', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formati_prerequi'
        unique_together = (('formati', 'prerequi'),)


class PlaygroundFormatiProf(models.Model):
    formati = models.ForeignKey(PlaygroundFormati, models.DO_NOTHING)
    prof = models.ForeignKey('PlaygroundProf', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formati_prof'
        unique_together = (('formati', 'prof'),)


class PlaygroundFormation(models.Model):
    name = models.CharField(max_length=200, blank=True, null=True)
    formation_type = models.CharField(max_length=50, blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_formation'


class PlaygroundFormationObj(models.Model):
    formation = models.ForeignKey(PlaygroundFormation, models.DO_NOTHING)
    objec = models.ForeignKey('PlaygroundObjec', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formation_obj'
        unique_together = (('formation', 'objec'),)


class PlaygroundFormationobjec(models.Model):
    formation = models.ForeignKey(PlaygroundFormati, models.DO_NOTHING)
    objec = models.ForeignKey('PlaygroundObjec', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formationobjec'


class PlaygroundFormationprerequi(models.Model):
    formation = models.ForeignKey(PlaygroundFormati, models.DO_NOTHING)
    prerequi = models.ForeignKey('PlaygroundPrerequi', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formationprerequi'


class PlaygroundFormationprof(models.Model):
    formation = models.ForeignKey(PlaygroundFormati, models.DO_NOTHING)
    prof = models.ForeignKey('PlaygroundProf', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'playground_formationprof'


class PlaygroundHistoire(models.Model):
    title = models.CharField(max_length=100, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_histoire'


class PlaygroundMissionbda(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_missionbda'


class PlaygroundMissionbde(models.Model):
    title = models.CharField(max_length=100)
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_missionbde'


class PlaygroundNews(models.Model):
    title = models.CharField(max_length=200, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    theme = models.CharField(max_length=50, blank=True, null=True)
    publish = models.BooleanField()
    created = models.DateTimeField()
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)
    date = models.DateTimeField(blank=True, null=True)
    lieu = models.CharField(max_length=200, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_news'


class PlaygroundObjec(models.Model):
    title = models.CharField(max_length=100, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_objec'


class PlaygroundObjectif(models.Model):
    title = models.CharField(max_length=100, blank=True, null=True)
    description = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_objectif'


class PlaygroundPartenaire(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_partenaire'


class PlaygroundPartenairebde(models.Model):
    title = models.CharField(max_length=100)
    image = models.CharField(max_length=100, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_partenairebde'


class PlaygroundPrerequi(models.Model):
    description = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_prerequi'


class PlaygroundProf(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    position = models.CharField(max_length=100, blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_prof'


class PlaygroundReseau(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    poste = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_reseau'


class PlaygroundRetour(models.Model):
    name = models.CharField(max_length=100, blank=True, null=True)
    comment = models.TextField(blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_retour'


class PlaygroundSport(models.Model):
    title = models.CharField(max_length=100, blank=True, null=True)
    image = models.CharField(max_length=100, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'playground_sport'
