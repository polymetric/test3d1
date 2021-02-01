float[] applyMatrix(float[] v, float[][] m) {
  float[] out = new float[4];
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      out[i] += v[j] * m[i][j];
    }
  }
  return out;
}

float[][] multMatrix(float[][] a, float[][] b) {
  float[][] out = new float[4][4];
  for (int r = 0; r < 4; r++) {
    for (int c = 0; c < 4; c++) {
      out[r][c] = 0;
      for (int o = 0; o < 4; o++) {
        out[r][c] += a[r][o] * b[o][c];
      }
    }
  }
  return out;
}

float[][] getRotationMatrix(float angle, float x, float y, float z) {
  float s, c;
  s = sin(angle);
  c = cos(angle);
  float[][] out = new float[][] {
    {   x*x*(1-c)+c,      x*y*(1-c)-z*s, x*z*(1-c)+y*s, 0,  },
    {   y*x*(1-c)+z*s,    y*y*(1-c)+c,   y*z*(1-c)-x*s, 0,  },
    {   z*x*(1-c)-y*s,    z*y*(1-c)+x*s, z*z*(1-c)+c,   0,  },
    {   0,                0,             0,             1,  },
  };
  return out;
}

float[][] getXRotationMatrix(float angle) {
  float s, c;
  s = sin(angle);
  c = cos(angle);
  float[][] out = new float[][] {
    {  1,  0,  0,  0 },
    {  0,  c, -s,  0 },
    {  0,  s,  c,  0 },
    {  0,  0,  0,  1 },
  };
  return out;
}

float[][] getYRotationMatrix(float angle) {
  float s, c;
  s = sin(angle);
  c = cos(angle);
  float[][] out = new float[][] {
    {  c,  0,  s,  0 },
    {  0,  1,  0,  0 },
    { -s,  0,  c,  0 },
    {  0,  0,  0,  1 },
  };
  return out;
}

float[][] getZRotationMatrix(float angle) {
  float s, c;
  s = sin(angle);
  c = cos(angle);
  float[][] out = new float[][] {
    {  c, -s,  0,  0 },
    {  s,  c,  0,  0 },
    {  0,  0,  1,  0 },
    {  0,  0,  0,  1 },
  };
  return out;
}

float[][] getScaleMatrix(float x, float y, float z) {
  float[][] out = new float[][] {
    { x, 0, 0, 0, },
    { 0, y, 0, 0, },
    { 0, 0, z, 0, },
    { 0, 0, 0, 1, },
  };
  return out;
}

float[][] getTranslationMatrix(float x, float y, float z) {
  float[][] out = new float[][] {
    { 1, 0, 0, x, },
    { 0, 1, 0, y, },
    { 0, 0, 1, z, },
    { 0, 0, 0, 1, },
  };
  return out;
}


float[][] getProjectionMatrix(float fovy, float aspect, float zNear, float zFar) {
  float f = 1/tan(fovy/2);
  float zm = zFar - zNear;
  float zp = zFar + zNear;
  float[][] out = new float[][] {
    { f/aspect, 0,  0,     0,               },
    { 0,        f,  0,     0,               },
    { 0,        0,  zp/zm, 2*zFar*zNear/zm, },
    { 0,        0, -1,     0,               },
  };
  return out;
}

float[][] getIdentityMatrix() {
  float[][] out = new float[][] {
    { 1, 0, 0, 0, },
    { 0, 1, 0, 0, },
    { 0, 0, 1, 0, },
    { 0, 0, 0, 1, },
  };
  return out;
}

float[][] vertexArrayAddW(float[][] vertices) {
  float[][] out = new float[vertices.length][4];
  for (int i = 0; i < vertices.length; i++) {
    for (int j = 0; j < vertices[i].length; j++) {
      out[i][j] = vertices[i][j];
    }
    out[i][3] = 1;
  }
  return out;
}

float[] mapWorldToPix(float[] v) {
  float[] out = new float[2];
  out[0] = map(v[0], -1, 1, 0, width);
  out[1] = map(v[1], -1, 1, 0, height);
  return out;
}

void printMatrix(float[][] m) {
  for (int c = 0; c < 4; c++) {
    for (int r = 0; r < 4; r++) {
      System.out.printf("%12.6f ", m[c][r]);
    }
    System.out.println();
  }
  System.out.println();
}
