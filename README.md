# PostgreSQL Pass-The-Hash

These sources, prepared based on this excellent write-up: https://hashcat.net/misc/postgres-pth/postgres-pth.pdf, might be used for quickly building 
Pass-The-Hash enabled PostgreSQL client software on recent versions of Linux & Windows

![psql-pth](https://raw.githubusercontent.com/mkopec3/postgres-pth/master/postgresql-pth.png)


## Getting Started

### Prerequisites

**Kali Linux Rolling**

```
# apt update && apt install libreadline-dev zlib1g-dev bison flex
```

**Windows 10**
* Visual Studio 2017
* Microsoft SDK 8.1
* [PostgreSQL build dependencies](https://www.postgresql.org/docs/9.0/install-windows-full.html#AEN24042)

**Docker**
* Docker :)

### Installing

**Kali Linux Rolling**

Quick mode:
```
$ wget -q -O- https://raw.githubusercontent.com/mkopec3/postgres-pth/master/kali_homedir_install.sh |sh
```
Review [kali_homedir_install.sh](kali_homedir_install.sh) for hints regarding manual installation

**Windows 10**

Make sure that GnuWin32, Perl and other required tools are visible in PATH.
From VS2017 Developer Command Prompt:
```
\postgres-pth\src\tools\msvc> build psql
```

Copy \Release\libpq\libpq.dll, \Release\psqlpsql.exe, and vcruntime140.dll (you need to find it) files to the same selected directory

**Docker**

Refer to Usage section


### Usage

**Kali Linux Rolling**

```
$ ~/psql-pth/bin/psql -h 127.0.0.1 -p 5432 -U username dbname
Hash for user username: md57bf07133****************1c058d18
```

**Windows 10**

```
$ psql.exe -h 127.0.0.1 -p 5432 -U username dbname
Hash for user username: md57bf07133****************1c058d18
```

**Docker**

```
$ docker run -it mkopec3/postgres-pth -h X.X.X.X -p 5432 -U username dbname
Hash for user username: md57bf07133****************1c058d18
```


## Issues

Report [here](https://github.com/mkopec3/postgres-pth/issues)


## Authors

PostgreSQL PTH concept comes from research work done by Jens Steube and Philipp Schmidt, which is well described [here](https://hashcat.net/misc/postgres-pth/postgres-pth.pdf).

Thank you guys for your awesome work!

~99% of the code seen here comes from [PostgreSQL](https://github.com/postgres/postgres) project.
Patches, and other small adjustments have been developed by other unknown or forgotten authors


## License

See the [COPYRIGHT](COPYRIGHT) file for details

