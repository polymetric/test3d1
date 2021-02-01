void keyPressed() {
  float speed = 0.1;
  float angleOffset = 0;
  switch (key) {
    case 'r':
      setup();
      break;
    
    case 'w':
      camX += sin(camYaw) * speed;
      camZ += cos(camYaw) * speed;
      break;
    case 's':
      camX += sin(camYaw + angleOffset + PI / 2) * speed;
      camZ += cos(camYaw + angleOffset + PI / 2) * speed;
      break;
    case 'a':
      camX += sin(camYaw + angleOffset - PI / 2) * speed;
      camZ += cos(camYaw + angleOffset - PI / 2) * speed;
      break;
    case 'd':
      camX += sin(camYaw + angleOffset + PI) * speed;
      camZ += cos(camYaw + angleOffset + PI) * speed;
      break;
    case ' ':
      camY -= speed;
      break;
  }
  switch (keyCode) {
    case SHIFT:
      camY += speed;
      break;
  }
}
