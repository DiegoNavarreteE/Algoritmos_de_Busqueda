#Función para encontrar la ruta directa
def metodo_bfs_2(mapa, ciudad_start, meta):

    cola = deque([ciudad_start]) #Crea la cola y agrega ciudad donde empieza el recorrido
    nivel = {ciudad_start: 0} 
    padre = {ciudad_start: None} 
    encontrado = False
    print("---------------------------------------------------")
    while cola: #Mientras exista datos en la cola
        v = cola.popleft() #Quita y devuelve un valor por la izq     
        
        for vecino in mapa[v]: #Recorre todos los vecinos encontrados en el diccionario
            if vecino not in nivel: #Verifica si el vecino ha sido visitado            
                cola.append(vecino) #Agrega a la cola
                nivel [vecino] = nivel [v] + 1 #Va asignando niveles a medida que va realizando la búsqueda
                padre [vecino] = v #Asigna un nombre como padre al punto anterior de la cola
                if vecino == meta:
                    encontrado = True
                    break
        if encontrado is True:
            break
            
    hijo = list(padre.keys())[-1] #Obtiene el nombre de la última ciudad encontrada (ciudad meta) en el diccionario padre
    nivel_max = int(nivel[hijo]) #Obtiene el nivel máximo de la iteración
    recorrido = [hijo] #Crea un vector para ir guardando la ruta directa

    while nivel_max>0:
        nivel_max -= 1
        hijo = padre[hijo] #Hace un seguimiento de los padres de cada nivel
        recorrido.append(hijo) #Agrega los hijos que serán las ciudades que tuvo que pasar para alcanzar la meta

    print(recorrido[::-1]) #Imprime el vector invertido para poder ver la ruta desde el nivel 0
    print("---------------------------------------------------\n")

print("****** Método 2, encuentra la ruta directa ******")
metodo_bfs_2(mapa, ciudad_start = "BEMIDJI", meta = "LACROSSE") #Colocar la ciudad desde la que se quiere partir