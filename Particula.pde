class Particula {
  PVector posicion, velocidad, aceleracion;
  float tam;
  float velAcercamiento, velocidadMax;

  Particula(float x, float y, float velocidadMin, float velocidadMax, float velMin, float velMax, int tamMin, int tamMax) {
    posicion = new PVector(x,y);
    velocidad = new PVector(0,0);
    aceleracion = new PVector(0,0);
    velAcercamiento = random(velocidadMin,velocidadMax);
    this.velocidadMax = random(velMin, velMax);
    tam = int(random(tamMin,tamMax));
  }

  //Metodo util para mejorar el funcionamiento del programa
  void run() {
    update();
    drawMe();
  }

  void update() {  
    //Se actualiza la velocidad añadiendole la aceleración y la posición añadiendole la velocidad
    velocidad.add(aceleracion);
    velocidad.limit(velocidadMax);
    posicion.add(velocidad);
    aceleracion.mult(0);
  }

  void drawMe() {

    //Dibujo
    PVector dis = new PVector (mouseX-posicion.x,mouseY-posicion.y); 
    //atan2 para saber la orientacion relativa del triangulo dibujado
    //respecto al mouse (en radianes esto es, de 0 a 2*PI)
    float ang = atan2(dis.y,dis.x);
    pushMatrix();
    //Movemos el punto de referencia para el dibujo
    translate(posicion.x,posicion.y);
    //Rotamos
    rotate(ang);
    //Dibujo
    fill(255);
    triangle(0,0,-tam,tam/4,-tam,-tam/4);
    popMatrix();
  }

  void addForce(PVector f) {
    //Añadimos la fuerza a la acceleración, según el factor tamaño
    aceleracion.add(PVector.mult(f,tam));
  }

  void calcularAcercamiento() {
    //Calculamos la distáncia entre el mouse y la particula en los 2 ejes
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,posicion);
    //Normalizamos este vector de direccion. Esto es, le damos magnitud 1:
    dir.normalize();
    //Y lo multiplicamos por la velocidad:
    dir.mult(velAcercamiento);
    addForce(dir);
  }
  
}
