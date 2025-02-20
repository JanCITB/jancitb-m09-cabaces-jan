## Construcció de la imatge amb Docker

Per a construir la imatge, utilitza l'ordre següent dins del directori on es troba el `Dockerfile`:

```bash
docker build -t nom_usuari/nom_imatge:latest .
```

- `-t nom_usuari/nom_imatge:latest` assigna un nom i una etiqueta a la imatge.
- `.` indica que es vol construir la imatge a partir del `Dockerfile` present en el directori actual.

## Execució d'un nou contenidor

Per a executar un nou contenidor basat en la imatge creada:

```bash
docker run -d --name nom_contenidor -p 5901:5901 -p 6080:6080 nom_usuari/nom_imatge:latest
```

- `-d`: Executa el contenidor en segon pla.
- `--name nom_contenidor`: Assigna un nom al contenidor.
- `-p 5901:5901`: Mapeja el port **5901** (VNC).
- `-p 6080:6080`: Mapeja el port **6080** (Accés via navegador si hi ha un client VNC via web).

## Connexió amb un client VNC

Per a connectar-se al contenidor amb un client VNC:

1. Obre un client VNC com **TigerVNC** o **RealVNC**.
2. Connecta a l'adreça següent:
   ```
   vnc://IP_DEL_SERVIDOR:5901
   ```
3. Introdueix la contrasenya (si n'hi ha) i accedeix a l'entorn gràfic.

Alternativament, si el contenidor té **novnc** instal·lat, pots accedir via navegador:
   ```
   http://IP_DEL_SERVIDOR:6080
   ```

## URL pública de DockerHub

La imatge està disponible a DockerHub en el següent enllaç:

👉 [https://hub.docker.com/r/nom_usuari/nom_imatge](https://hub.docker.com/r/nom_usuari/nom_imatge)

Per a descarregar-la directament:

```bash
docker pull nom_usuari/nom_imatge:latest
```


