class Sistema{

  ArrayList<Particula> particulas = new ArrayList();
  int totalParticulas = 700;

  Sistema() {

    //Instanciamos objetos
    for(int i=0; i<totalParticulas; i++) {
      Particula p = new Particula(random(width)//Posicion x
      ,random(height)//Posicion y
      ,0.1 //Aceleración de acercamiento mínima
      ,0.1 //Aceleración de acercamiento máxima
      ,3 //Velocidad mínima
      ,8 //Velocidad máxima
      ,2 //Tamaño mínimo
      ,12 //Tamaño máximo
      ); 
      particulas.add(p);
    }
  }

  void run() {
    for(int i=0; i< particulas.size(); i++) {
      Particula p = particulas.get(i);
      p.calcularAcercamiento();
      p.run();
    }
  }

}
