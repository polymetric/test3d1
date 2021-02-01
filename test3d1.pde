int time;

float camX, camY, camZ;
float camPitch, camYaw;

float cubeRotX, cubeRotY;
float cubePosX;

void setup() {
  size(800, 800);
  frameRate(60);
  smooth(8);
  
  time = 0;
  
  cubeVertices = vertexArrayAddW(cubeVertices);
  
  camX = 0;
  camY = 0;
  camZ = 10;
  
  cubeRotX = 0.52;
  cubeRotY = 0;
  
  cubePosX = 0;
}

void draw() {
  float[][] viewMatrix = getIdentityMatrix();
  
  //cubePosX += 0.01;
  
  cubeRotY += 0.01;
  //cubeRotX += 0.01;
  
  //camZ += 0.1;
  
  //camPitch = map(mouseY, height, 0, -1, 1);
  //camYaw = map(mouseX, width, 0, -1, 1);
  
  // NOTE THAT MATRIX MULTIPLICATIONS ARE IN REVERSE ORDER
  // intuitively, the camera transforms are effectively applied last.
  // yes, i know that's cursed but i don't know what to do about it.
  // take it up with Jacques Binet
  // camera matrices
  //viewMatrix = multMatrix(viewMatrix, getProjectionMatrix((float) Math.toRadians(70), 1, 0.01, 100));
  //viewMatrix = multMatrix(viewMatrix, getXRotationMatrix(camPitch));
  //viewMatrix = multMatrix(viewMatrix, getYRotationMatrix(camYaw));
  //viewMatrix = multMatrix(viewMatrix, getTranslationMatrix(-camX, -camY, -camZ));
  
  // cube matrices
  //viewMatrix = multMatrix(viewMatrix, getTranslationMatrix(0, 0, 10));
  viewMatrix = multMatrix(viewMatrix, getXRotationMatrix(cubeRotX));
  viewMatrix = multMatrix(viewMatrix, getYRotationMatrix(cubeRotY));
  //viewMatrix = multMatrix(viewMatrix, getRotationMatrix(cubeRotX, 1, 0, 0));
  //viewMatrix = multMatrix(viewMatrix, getRotationMatrix(cubeRotY, 0, 1, 0));
  float scale = 1.0/5;
  viewMatrix = multMatrix(viewMatrix, getScaleMatrix(scale, scale, scale));
  
  printMatrix(viewMatrix);
  
  // actually draw
  background(0);
  stroke(0, 232, 32);
  strokeWeight(1);
  drawLines(cubeVertices, cubeIndices, viewMatrix);
  
  time++;
}
