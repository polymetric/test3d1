float[][] cubeVertices = {
  { -1, -1, -1 }, // 0
  { -1, -1,  1 }, // 1
  {  1, -1,  1 }, // 2
  {  1, -1, -1 }, // 3
  
  { -1,  1, -1 }, // 4
  { -1,  1,  1 }, // 5
  {  1,  1,  1 }, // 6
  {  1,  1, -1 }, // 7
  //{ 0, 0, 0 }
};

int[][] cubeIndices = {
  { 0, 1 },
  { 1, 2 },
  { 2, 3 },
  { 3, 0 },
  
  { 4, 5 },
  { 5, 6 },
  { 6, 7 },
  { 7, 4 },
  
  { 0, 4 },
  { 1, 5 },
  { 2, 6 },
  { 3, 7 },
};
