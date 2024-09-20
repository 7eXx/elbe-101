# ELBE 101
This simple project will help you get started with ELBE 101.

## Requirements
FIrst install elbe using official guide [here](https://elbe-rfs.org/docs/sphinx/article-quickstart.html).
Than you need to create an ***initvm*** machine used as base build source:
```
$ sudo elbe initvm create 
```

## How to use
To use a custom xml project file:
```
$ sudo elbe initvm submit <project.xml>
```

## Day by day work
To make the job easier, using the ***control*** command, you can do the following:
Creathe the project and assign information:
```sh
$ PRJ=$(sudo elbe control create_project )
```
Define image/system to build based on XML file
```sh
$ sudo elbe control set_xml $PRJ <project.xml>
```
Start the build and wait for it to finish
```sh
$ sudo elbe control build $PRJ
$ sudo elbe control wait_busy $PRJ
```
Now you can twick your project XML file and restart build.  
To do so, repeat latest three steps.

## Automatic script
Using the **build-image.sh** script, you can build your image in one command.  
NB: Remmber to assign the project ID in **.env.local** file or it will create a new one.
