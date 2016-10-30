CREATE TABLE Carrera
(
	codCarrera integer UNIQUE NOT NULL ,
	nombre varchar(256),
	PRIMARY KEY (codCarrera)
);

CREATE TABLE Ramo
(
	codRamo integer UNIQUE NOT NULL,
	nombre varchar(256),
	PRIMARY KEY (codRamo)
);

CREATE TABLE Alumno
(
	matricula integer UNIQUE NOT NULL,
	nombre varchar(256),
	codCarrera integer NOT NULL,
	PRIMARY KEY (matricula),
	FOREIGN KEY (codCarrera) REFERENCES Carrera(codCarrera) ON DELETE CASCADE
);

CREATE TABLE Comentario
(
	idComentario integer UNIQUE NOT NULL,
	texto varchar(500),
	fecha date NOT NULL,
	puntuacion integer CHECK (puntuacion >= 0 AND puntuacion <= 5),
	PRIMARY KEY (idComentario)
);

CREATE TABLE AlumnoRealizaComentario
(
 	matricula integer NOT NULL,
 	idComentario integer NOT NULL,
 	FOREIGN KEY (matricula) REFERENCES Alumno(matricula) ON DELETE CASCADE,
 	FOREIGN KEY (idComentario) REFERENCES Comentario(idComentario) ON DELETE CASCADE
);

CREATE TABLE AlumnoPuntuaComentario
(
 	matricula integer NOT NULL,
 	idComentario integer NOT NULL,
 	puntuacion integer CHECK (puntuacion >= 0 AND puntuacion <= 5),
 	FOREIGN KEY (matricula) REFERENCES Alumno(matricula) ON DELETE CASCADE,
 	FOREIGN KEY (idComentario) REFERENCES Comentario(idComentario) ON DELETE CASCADE
);

CREATE TABLE Habilidad
(
	idHabilidad integer UNIQUE NOT NULL,
	nombre varchar(256), 
	descripcion varchar(50),
	PRIMARY KEY (idHabilidad)
);

CREATE TABLE ComentarioHabilidad
(
	idComentario integer NOT NULL,
	idHabilidad integer NOT NULL,
	FOREIGN KEY (idComentario) REFERENCES Comentario(idComentario) ON DELETE CASCADE,
	FOREIGN KEY (idHabilidad) REFERENCES Habilidad(idHabilidad) ON DELETE CASCADE
);

CREATE TABLE Encuesta
(
	idEncuesta integer UNIQUE NOT NULL,
	observaciones varchar(500), 
	PRIMARY KEY (idEncuesta)
);

CREATE TABLE Profesor
(
	rutProfesor varchar(12) UNIQUE NOT NULL,
	nombre varchar(256),
	departamento varchar(256), 
	puntuacionEvaluacion integer,
	PRIMARY KEY (rutProfesor)
);

CREATE TABLE AlumnoEncuesta
(
	matricula integer NOT NULL,
	idEncuesta integer NOT NULL,
	FOREIGN KEY (matricula) REFERENCES Alumno(matricula) ON DELETE CASCADE,
	FOREIGN KEY (idEncuesta) REFERENCES Encuesta(idEncuesta) ON DELETE CASCADE
);

CREATE TABLE AlumnoComentaProfesor
(
	matricula integer NOT NULL,
	rutProfesor varchar(12) NOT NULL,
	textoComentario varchar(500),
	FOREIGN KEY (matricula) REFERENCES Alumno(matricula) ON DELETE CASCADE,
	FOREIGN KEY (rutProfesor) REFERENCES Profesor(rutProfesor) ON DELETE CASCADE
);

CREATE TABLE EncuestaSobreProfesor
(
	idEncuesta integer NOT NULL,
	rutProfesor varchar(12) NOT NULL,
	FOREIGN KEY (idEncuesta) REFERENCES Encuesta(idEncuesta) ON DELETE CASCADE,
	FOREIGN KEY (rutProfesor) REFERENCES Profesor(rutProfesor) ON DELETE CASCADE	
);

CREATE TABLE ProfesorTitular
(
	rutTitular varchar(12) UNIQUE NOT NULL,
	FOREIGN KEY (rutTitular) REFERENCES Profesor(rutProfesor)  ON DELETE CASCADE
);

CREATE TABLE ProfesorAsistente
(
	rutAsistente varchar(12) UNIQUE NOT NULL,
	FOREIGN KEY (rutAsistente) REFERENCES Profesor(rutProfesor) ON DELETE CASCADE 
);

CREATE TABLE ProfesorAsociado
(
	rutAsociado varchar(12) UNIQUE NOT NULL,
	FOREIGN KEY (rutAsociado) REFERENCES Profesor(rutProfesor) ON DELETE CASCADE
);