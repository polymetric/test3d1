void drawLines(float[][] vertices, int[][] indices, float[][] viewMatrix) {
  for (int i = 0; i < indices.length; i++) {
    int[] indexPair = indices[i];
    float[] v1 = vertices[indexPair[0]];
    float[] v2 = vertices[indexPair[1]];
    v1 = applyMatrix(v1, viewMatrix);
    v2 = applyMatrix(v2, viewMatrix);
    //if (v1[2] > 0 && v2[2] > 0) {
      v1 = mapWorldToPix(v1);
      v2 = mapWorldToPix(v2);
      //System.out.printf("%12.3f %12.3f -> %12.3f %12.3f | ", v1[0], v1[1], v2[0], v2[1]);
      line(v1[0], v1[1], v2[0], v2[1]);
    //}
  }
}

void drawPoints(float[][] vertices, float[][] viewMatrix) {
  for (int i = 0; i < vertices.length; i++) {
    float[] v = vertices[i];
    v = applyMatrix(v, viewMatrix);
    if (v[2] > 0.01 && v[2] < 1000) {
      v = mapWorldToPix(v);
      //System.out.printf("%3d %12.3f %12.3f | ", i, v[0], v[1]);
      point(v[0], v[1]);
    }
  }
}
