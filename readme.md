# Demo de BaseX

---

## Administracion de BaseX con podman

En esta demo se utiliza podman para virtualizar BaseX. Puedes acceder a
la documentación de podman [aquí](https://docs.podman.io/en/latest/).

1. Crear un contenedor.

```
podman run -ti \
    --name basexhttp \
    --publish 1984:1984 \
    --publish 8984:8984 \
    --volume $(pwd)/basex:/srv:Z \
    basex/basexhttp:latest
```

2. Copiar el archivo `books.xml` al contenedor.

```
podman cp books.xml basexhttp:/srv
```

3. Uso de basexclient (el cliente CLI).

```
podman exec -ti basexhttp basexclient
```

---

## Uso de comandos basicos CLI

La documentación completa la puedes encontrar [aquí](https://docs.basex.org/wiki/Commands).

### Cambiar credenciales del administrador

```
ALTER PASSWORD admin <contraseña>
```

### Crea un nuevo usuario

Crea un nuevo usuario con permisos de lectura y escritura sobre una base de datos.

```
CREATE USER <usuario> <contraseña>
GRANT WRITE ON <base_de_datos> <usuario>
```

### Crear una base de datos

Para crear una base de datos a partir de un XML.

### Ejecucion de codigo

Para ejecutar un script:

```
RUN <script_file>
```

---

## Servidor REST

Para utilizar el servidor, vamos a necesitar un cliente HTTp. Nosotros hemos utilizado
HTTPie, puedes encontrar información sobre su uso [aquí](https://httpie.io/docs/cli/default-behavior).
Para conocer mas sobre REST, recomendamos la lectura del [blog de Red Hat](https://www.redhat.com/es/topics/api/what-is-a-rest-api).

### Acceso a un documento de la base de datos

```
http -a <usuario>:<contraseña> localhost:8984/rest/<base_de_datos>/<documento>
```

