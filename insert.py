import sys

fileName = sys.argv[1]
file = open(fileName + ".txt", 'r')

lineas =  file.read().split('\n')

query = ""

for registro in lineas:
	query = ""
	registro = registro.split(',')
	query += "INSERT INTO %s VALUES(" % (fileName)
	count = 0
	for value in registro:
		if count != 0:
			query += ","
		query += "\'%s\'" % (value)
		count += 1
	query += ");"
	print query
