# Advanced build recipes for [Capytaine](https://github.com/capytaine/capytaine)

See also [Capytaine's documentation](https://capytaine.github.io/stable/user_manual/installation) and [Capytaine's standalone distribution](https://github.com/capytaine/capytaine-standalone).

## Run Capytaine in Docker

Build the docker image:
```
curl -o Capytaine_2.2.1__Ubuntu_Noble.Dockerfile https://raw.githubusercontent.com/capytaine/capytaine-extra-build-recipes/master/Capytaine_2.2.1__Ubuntu_Noble.Dockerfile
docker build -t capytaine:v2.2.1 - < Capytaine_2.2.1__Ubuntu_Noble.Dockerfile
```

And execute it:
```
docker run -it capytaine:v2.2.1 python
```

Or the following command to make the current directory accessible from the Docker image and run the file `my_script.py` from the current directory:
```
docker run -i -v (pwd):/home/user -t capytaine:v2.2.1 python my_script.py
```

Note that graphical displays (matplotlib, vtk, ...) might require a complex setup to work from the Docker image.

## Build with Guix

For advanced users, `Guix <https://guix.gnu.org/>`_ package definitions are available at the root of the repository:

```
curl -o capytaine.scm https://raw.githubusercontent.com/capytaine/capytaine-extra-build-recipes/master/capytaine.scm
guix shell -f capytaine.scm python -- python3 -c 'import capytaine; print(capytaine.__version__)'
```

TODO: fix Guix recipe for newer versions of Capytaine
