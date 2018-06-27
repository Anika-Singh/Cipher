#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include "vigenere.h"
#include "affine.h"
#include "atbash.h"
#include "dvorak.h"
#include "keyword.h"
#include "xor1.h"
 
#define NUM_THREADS 6
typedef enum{
        Affine = 0,
        XOR = 1,
        Vigenere = 2,
        Atbash = 3,
        Keyword = 4,
        Dvorak = 5
} ciphersEnum;
        

/* create thread argument struct for thr_func() */
typedef struct _thread_data_t {
  int tid;
  double stuff;
  int cipherType;
  string cipherText;
} thread_data_t;
 