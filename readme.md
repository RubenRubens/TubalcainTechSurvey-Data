# Demo de BaseX

---

## Uso con Docker


Crear un nuevo contenedor:

```
docker run -d \
    --name basexhttp \
    --publish 1984:1984 \
    --publish 8984:8984 \
    --volume $(pwd)/basex:/srv/basex \
    basex/basexhttp:latest
```

Acceso a la linea de comandos de BaseX:

```
docker exec -ti basexhttp basexclient
```

Los credenciales por defecto son usuario `admin`
y la contraseña `admin`.

---

## Uso de comandos basicos CLI

La documentación completa la puedes encontrar [aquí](https://docs.basex.org/wiki/Commands).

### Cambiar credenciales del administrador

```
ALTER PASSWORD admin <contraseña>
```

### Crear un nuevo usuario

Crea un nuevo usuario con permisos de lectura y escritura sobre una base de datos.

```
CREATE USER <usuario> <contraseña>
GRANT WRITE ON <base_de_datos> <usuario>
```

### Crear una base de datos

Vamos a crear una base de datos llamada `tech_survey`, abrirla y
añardir los datos del documento que se encuetra en `./basex/encuesta.xml`

```
CREATE DATABASE tech_survey
OPEN tech_survey
ADD basex/encuesta.xml
```

### Ejecucion de XQuery

Para ejecutar un script de XQuery:

```
RUN <script_file>
```

En nuestro caso particular tenemos que escribir:

```
RUN basex/analisis_datos.xq
RUN basex/insertar.xq
```

---

## Servidor REST

Para utilizar el servidor, vamos a necesitar un cliente HTTp. Nosotros hemos utilizado
HTTPie, puedes encontrar información sobre su uso [aquí](https://httpie.io/docs/cli/default-behavior).
Para conocer mas sobre REST, recomendamos la lectura del [blog de Red Hat](https://www.redhat.com/es/topics/api/what-is-a-rest-api).

### Acceso a un documento de la base de datos

De foma general tenemos que escribir:

```
http -a <usuario>:<contraseña> localhost:8984/rest/<base_de_datos>/<documento>
```

En este caso particular lo que vamos a necesitar es:

```
http -a admin:admin localhost:8984/rest/tech_survey/encuesta.xml
```

Si queremos realizar una consulta (por ejemplo la de `analisis_datos.xq`)
tenemos que escribir:

```
http -a admin:admin localhost:8984/rest/?run=analisis_datos.xq
```
