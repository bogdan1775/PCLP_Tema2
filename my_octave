// Copyright Croitoru Constantin-Bogdan Grupa 314CA 2022-2023
#include <stdio.h>
#include <stdlib.h>
#define D_MOD 10007

//antet functie de eliberare resurse
void eliberare(int ***v_mat, int *n, int *dim_mat);

// se incarca in memorie o matrice
void incarcare_matrice(int ****v_mat2, int *n, int **dim_mat2)
{
	int nr_l, nr_c, i, j;
	int ***v_mat = *v_mat2, *dim_mat = *dim_mat2;

	// se aloca spatiu pentru matrice in vectorul de matrice
	// se aloca spatiu pentru vectorul care retine dimensiunea matricelor
	scanf("%d%d", &nr_l, &nr_c);
	if (*n == 0) {
		v_mat = (int ***)malloc(((*n) + 1) * sizeof(int **));
		dim_mat = (int *)malloc((((*n + 1) * 2)) * sizeof(int));
	} else {
		v_mat = (int ***)realloc(v_mat, (*n + 1) * sizeof(int **));
		dim_mat = (int *)realloc(dim_mat, (*n + 1) * 2 * sizeof(int));
	}

	if (!v_mat) {
		fprintf(stderr, "Nu s-a putut aloca");
		exit(-1);
	} else {
		// se aloca spatiu pt matrice in fuctie de nr de linii si coloane
		v_mat[*n] = (int **)malloc(nr_l * sizeof(int *));
		if (!v_mat[*n]) {
			fprintf(stderr, "Nu s-a putut aloca");
			free(v_mat[*n]);
			eliberare(v_mat, n, dim_mat);
			exit(-1);
		} else {
			for (i = 0; i < nr_l; i++) {
				v_mat[*n][i] = (int *)malloc(nr_c * sizeof(int));
				if (!v_mat[*n][i]) {
					fprintf(stderr, "Nu s-a putut aloca");
					for (int k = 0; k <= i; k++)
						free(v_mat[*n][k]);
					eliberare(v_mat, n, dim_mat);
					exit(-1);
				}
			}
		}
	}

	if (!dim_mat) {
		fprintf(stderr, "Nu s-a putut aloca");
		eliberare(v_mat, n, dim_mat);
		exit(-1);
	}

	// se citesc elementele
	for (i = 0; i < nr_l; i++)
		for (j = 0; j < nr_c; j++)
			scanf("%d", &v_mat[*n][i][j]);

	// se retin nr de linii, respectiv de coloane in vectorul de dimensiune
	dim_mat[(*n) * 2] = nr_l;
	dim_mat[(*n) * 2 + 1] = nr_c;

	(*n)++;
	*v_mat2 = v_mat;
	*dim_mat2 = dim_mat;
}

// se afiseaza din vectorul de dimesiuni, dimensiunea matricei cu indicele cit
void dimensiune(int n, int *dim_mat)
{
	int indice;
	scanf("%d", &indice);
	if (indice >= n || indice < 0)
		printf("No matrix with the given index\n");
	else
		printf("%d %d\n", dim_mat[indice * 2], dim_mat[indice * 2 + 1]);
}

// se afiseaza elementele matricei cu indicile citit
void afisare(int ***v_mat, int n, int *dim_mat)
{
	int i, j, indice;
	scanf("%d", &indice);

	if (indice >= n || indice < 0) {
		printf("No matrix with the given index\n");
	} else {
		// nr_l numarul de linii, nr_c numarul de coloane
		int nr_l = dim_mat[indice * 2], nr_c = dim_mat[indice * 2 + 1];
		for (i = 0; i < nr_l; i++) {
			for (j = 0; j < nr_c; j++)
				printf("%d ", v_mat[indice][i][j]);
			printf("\n");
		}
	}
}

// redimensioneaza matricea cu indicele citit
void redimensionare(int ****v_mat2, int n, int **dim_mat2)
{
	int indice, nr_l, nr_c, j, i;// nr_l numar de linii, nr_c numar de coloane
	int ***v_mat = *v_mat2, *dim_mat = *dim_mat2;
	scanf("%d", &indice);
	scanf("%d", &nr_l);

	int *l_indici = (int *)malloc(nr_l * sizeof(int));// vec care retine linii
	if (!l_indici) {
		fprintf(stderr, "Nu s-a putut aloca");
		eliberare(v_mat, &n, dim_mat); exit(-1);
	}
	for (i = 0; i < nr_l; i++)
		scanf("%d", &l_indici[i]);

	scanf("%d", &nr_c);
	int *c_indici = (int *)malloc(nr_c * sizeof(int));// vec care retine col
	if (!c_indici) {
		fprintf(stderr, "Nu s-a putut aloca");
		eliberare(v_mat, &n, dim_mat); exit(-1);
	}
	for (i = 0; i < nr_c; i++)
		scanf("%d", &c_indici[i]);

	if (indice >= n || indice < 0) {
		printf("No matrix with the given index\n");
	} else {
		int **aux;// matrice auxiliara
		aux = (int **)malloc(nr_l * sizeof(int *));
		if (!aux) {
			fprintf(stderr, "Nu s-a putut aloca");
			eliberare(v_mat, &n, dim_mat); exit(-1);
		} else {
			for (i = 0; i < nr_l; i++) {
				aux[i] = (int *)malloc(nr_c * sizeof(int));
				if (!aux[i]) {
					fprintf(stderr, "Nu s-a putut aloca");
					for (j = 0; j <= i; j++)
						free(aux[j]);
					eliberare(v_mat, &n, dim_mat); exit(-1);
				}
			}
			for (i = 0; i < nr_l; i++)
				for (j = 0; j < nr_c; j++)
					aux[i][j] = v_mat[indice][l_indici[i]][c_indici[j]];

			for (i = 0; i < dim_mat[indice * 2]; i++)
				free(v_mat[indice][i]);
			free(v_mat[indice]);

			v_mat[indice] = (int **)malloc(nr_l * sizeof(int *));
			if (!v_mat[indice]) {
				fprintf(stderr, "Nu s-a putut aloca");
				free(v_mat[indice]);
				eliberare(v_mat, &n, dim_mat); exit(-1);
			}
			for (i = 0; i < nr_l; i++) {
				v_mat[indice][i] = (int *)malloc(nr_c * sizeof(int));
				if (!v_mat[indice][i]) {
					fprintf(stderr, "Nu s-a putut aloca");
					for (int k = 0; k <= i; k++)
						free(v_mat[indice][k]);
					eliberare(v_mat, &n, dim_mat); exit(-1);
				}
			}
			for (i = 0; i < nr_l; i++)
				for (j = 0; j < nr_c; j++)
					v_mat[indice][i][j] = aux[i][j];// se pun elem in transpusa
			for (i = 0; i < nr_l; i++)
				free(aux[i]);
			free(aux);

			dim_mat[indice * 2] = nr_l;// se actualizea dimensiunile
			dim_mat[indice * 2 + 1] = nr_c;
			*v_mat2 = v_mat;
			*dim_mat2 = dim_mat;
		}
	}
	free(l_indici);
	free(c_indici);
}

// se realizea inmultirea a doua matrice
void inmultire(int ****v_mat2, int *n, int **dim_mat2)
{
	int indice1, indice2;
	int ***v_mat = *v_mat2, *dim_mat = *dim_mat2;

	scanf("%d%d", &indice1, &indice2);
	if (indice1 >= (*n) || indice1 < 0 || indice2 >= (*n) || indice2 < 0) {
		printf("No matrix with the given index\n");
	} else {
		if (dim_mat[indice1 * 2 + 1] != dim_mat[indice2 * 2]) {
			printf("Cannot perform matrix multiplication\n");
		} else {
			// se aloca in vectorul de matrice o noua matrice pentru rezultat
			//se aloca in vectorul de dimensiuni inca 2 pozitii
			v_mat = (int ***)realloc(v_mat, (*n + 1) * sizeof(int **));
			dim_mat = (int *)realloc(dim_mat, ((*n + 1) * 2) * sizeof(int));
			if (!v_mat) {
				fprintf(stderr, "Nu s-a putut aloca");
				exit(-1);
			}

			v_mat[*n] = (int **)malloc(dim_mat[indice1 * 2] * sizeof(int *));
			if (!v_mat[*n]) {
				fprintf(stderr, "Nu s-a putut aloca");
				free(v_mat[*n]);
				eliberare(v_mat, n, dim_mat);
				exit(-1);
			}

			for (int i = 0; i < dim_mat[indice1 * 2]; i++) {
				int aux = dim_mat[indice2 * 2 + 1];
				v_mat[*n][i] = (int *)malloc(aux * sizeof(int));
				if (!v_mat[*n][i]) {
					fprintf(stderr, "Nu s-a putut aloca");
					for (int k = 0; k <= i; k++)
						free(v_mat[*n][k]);
					eliberare(v_mat, n, dim_mat);
					exit(-1);
				}
			}
			if (!dim_mat) {
				fprintf(stderr, "Nu s-a putut aloca");
				eliberare(v_mat, n, dim_mat);
				exit(-1);
			}

			int i, j, k;
			// se realizea operatia de inmultire
			for (i = 0; i < dim_mat[indice1 * 2]; i++)
				for (k = 0; k < dim_mat[indice2 * 2 + 1]; k++) {
					int a = 0;
					for (j = 0; j < dim_mat[indice1 * 2 + 1]; j++) {
						int aux = v_mat[indice1][i][j];
						a = (a + aux * v_mat[indice2][j][k]) % D_MOD;
					}
					a = a % D_MOD;
					if (a < 0)
						a += D_MOD;
					v_mat[*n][i][k] = a;
				}

			//se retine dimensiunea matricei rezultate
			dim_mat[*n * 2] = dim_mat[indice1 * 2];
			dim_mat[*n * 2 + 1] = dim_mat[indice2 * 2 + 1];
			(*n)++;
			*v_mat2 = v_mat;
			*dim_mat2 = dim_mat;
		}
	}
}

// se sorteaza vectorul de matrice in functie de suma elem fiecarei matrice
void sortare(int ****v_mat2, int n, int **dim_mat2)
{
	int i, j, s = 0, k;
	int ***v_mat = *v_mat2, *dim_mat = *dim_mat2, *a;

	//a=vector care retine suma pentru fiecare matrice
	a = (int *)malloc(n * sizeof(int));
	if (!a) {
		fprintf(stderr, "Nu s-a putut aloca");
		free(a);
		eliberare(v_mat, &n, dim_mat);
		exit(-1);
	}

	//se calculeaza suma pentru fiecare matrice si e retinuta in a
	for (i = 0; i < n; i++) {
		s = 0;
		for (j = 0; j < dim_mat[i * 2]; j++)
			for (k = 0; k < dim_mat[i * 2 + 1]; k++)
				s = (s + v_mat[i][j][k]) % D_MOD;
		s = s % D_MOD;
		if (s < 0)
			s = s + D_MOD;
		a[i] = s;
	}

	// se ordoneazam vectorul de sume a
	for (i = 0; i < n - 1; i++)
		for (j = i + 1; j < n; j++)
			if (a[i] > a[j]) {
				int aux1 = a[i];
				a[i] = a[j];
				a[j] = aux1;

				// se interschimba adresele matricelor pentru a le ordona
				int **aux2 = v_mat[i];
				v_mat[i] = v_mat[j];
				v_mat[j] = aux2;

				//se schimba dimensiunile matricelor
				int aux_dim1 = dim_mat[i * 2];
				int aux_dim2 = dim_mat[i * 2 + 1];
				dim_mat[i * 2] = dim_mat[j * 2];
				dim_mat[i * 2 + 1] = dim_mat[j * 2 + 1];
				dim_mat[j * 2] = aux_dim1;
				dim_mat[j * 2 + 1] = aux_dim2;
			}

	*v_mat2 = v_mat;
	*dim_mat2 = dim_mat;

	free(a);
}

// se realizeaza transpunerea unei matrice
void transpunere(int ****v_mat2, int n, int **dim_mat2)
{
	int indice, i, j;
	int ***v_mat = *v_mat2, *dim_mat = *dim_mat2;

	scanf("%d", &indice);
	if (indice >= n || indice < 0) {
		printf("No matrix with the given index\n");
	} else {
		int **a;// matrice auxiliara care retine elemetele matricei
		a = (int **)malloc(dim_mat[indice * 2] * sizeof(int *));
		if (!a) {
			fprintf(stderr, "Nu s-a putut aloca");
			eliberare(v_mat, &n, dim_mat);
			exit(-1);
		} else {
			for (i = 0; i < dim_mat[indice * 2]; i++) {
				a[i] = (int *)malloc(dim_mat[indice * 2 + 1] * sizeof(int));
				if (!a[i]) {
					fprintf(stderr, "Nu s-a putut aloca");
					free(a[i]);
					eliberare(v_mat, &n, dim_mat);
					exit(-1);
				}
			}
		}

		// se copiaza elementele
		for (i = 0; i < dim_mat[indice * 2]; i++)
			for (j = 0; j < dim_mat[indice * 2 + 1]; j++)
				a[i][j] = v_mat[indice][i][j];

		for (i = 0; i < dim_mat[indice * 2]; i++)
			free(v_mat[indice][i]);
		free(v_mat[indice]);
		int aux = dim_mat[indice * 2];
		dim_mat[indice * 2] = dim_mat[indice * 2 + 1];
		dim_mat[indice * 2 + 1] = aux;

		// se aloca spatiu pentru transpusa
		v_mat[indice] = (int **)malloc(dim_mat[indice * 2] * sizeof(int *));

		int dim = dim_mat[indice * 2 + 1];
		for (i = 0; i < dim_mat[indice * 2]; i++)
			v_mat[indice][i] = (int *)malloc(dim * sizeof(int));

		// se copiaza in matrice elementele, dar cu indicile schimbat
		for (i = 0; i < dim_mat[indice * 2]; i++)
			for (j = 0; j < dim_mat[indice * 2 + 1]; j++)
				v_mat[indice][i][j] = a[j][i];

		// se elibereaza memoria pentru matricea a
		for (i = 0; i < dim_mat[indice * 2 + 1]; i++)
			free(a[i]);
		free(a);

		*v_mat2 = v_mat;
		*dim_mat2 = dim_mat;
	}
}

// functie folosita pentru inmultirea a doua matrici de la ridicarea la putere
// retine rezultatul in prima matrice din antet
void inmultire_mat_R(int **a, int **b, int dim)
{
	int **mat_rez;// retine rezultatul inmultirii
	mat_rez = (int **)malloc(dim * sizeof(int *));
	if (!mat_rez) {
		fprintf(stderr, "Nu s-a putut aloca");
		exit(-1);
	} else {
		for (int i = 0; i < dim; i++) {
			mat_rez[i] = (int *)malloc(dim * sizeof(int));
			if (!mat_rez[i]) {
				fprintf(stderr, "Nu s-a putut aloca");
				for (int j = 0; j <= i; j++)
					free(mat_rez[j]);
				exit(-1);
			}
		}

		// se realizeaza inmultirea
		for (int i = 0; i < dim; i++)
			for (int k = 0; k < dim; k++) {
				int c = 0;
				for (int j = 0; j < dim; j++)
					c = (c + a[i][j] * b[j][k]) % D_MOD;
				c = c % D_MOD;
				if (c < 0)
					c += D_MOD;
				mat_rez[i][k] = c;
			}

		// se copiaza rezultatul in prima matrice din antet
		for (int i = 0; i < dim; i++)
			for (int j = 0; j < dim; j++)
				a[i][j] = mat_rez[i][j];

		// se elibereaza memoria pentru matricea mat_rez
		for (int i = 0; i < dim; i++)
			free(mat_rez[i]);
		free(mat_rez);
	}
}

// se ridica o matrice la o putere in timp logaritmic
void ridicare(int ****v_mat2, int n, int **dim_mat2)
{
	int index, putere, i, j, k, ***v_mat = *v_mat2, *dim_mat = *dim_mat2;
	scanf("%d%d", &index, &putere);
	if (index >= n || index < 0) {
		printf("No matrix with the given index\n");
	} else {
		if (putere < 0) {
			printf("Power should be positive\n");
		} else if (dim_mat[index * 2] != dim_mat[index * 2 + 1]) {
			printf("Cannot perform matrix multiplication\n");
		} else {
// matricea ce retine rezutatul inmultirii in cazul in care puterea e impara
// initial aceasta e In( elementul neutru)
			int **b;
			b = (int **)malloc(dim_mat[index * 2] * sizeof(int *));
			if (!b) {
				fprintf(stderr, "Nu s-a putut aloca");
				eliberare(v_mat, &n, dim_mat);
				exit(-1);
			}

			for (i = 0; i < dim_mat[index * 2]; i++) {
				b[i] = (int *)malloc(dim_mat[index * 2] * sizeof(int));
				if (!b[i]) {
					fprintf(stderr, "Nu s-a putut aloca");
					for (k = 0; k <= i; k++)
						free(b[k]);
					eliberare(v_mat, &n, dim_mat);
					exit(-1);
				}
			}

			for (i = 0; i < dim_mat[index * 2]; i++)
				for (j = 0; j < dim_mat[index * 2]; j++)
					if (i == j)
						b[i][i] = 1;
					else
						b[i][j] = 0;

		if (putere == 0) {
			for (i = 0; i < dim_mat[index * 2]; i++)
				for (j = 0; j < dim_mat[index * 2]; j++)
					if (i == j)
						v_mat[index][i][j] = 1;
					else
						v_mat[index][i][j] = 0;
		} else {
			int aux = dim_mat[index * 2]; // pentru a nu depasi 80
			while (putere > 1) {
				if (putere % 2 == 1)
					inmultire_mat_R(b, v_mat[index], dim_mat[index * 2]);

				inmultire_mat_R(v_mat[index], v_mat[index], aux);
				putere = putere / 2;
			}

			// rezultatul e retinut direct in matrice
			inmultire_mat_R(v_mat[index], b, aux);

			for (i = 0; i < dim_mat[index * 2]; i++)
				free(b[i]);
			free(b);
		}
		*v_mat2 = v_mat;
		*dim_mat2 = dim_mat;
	}
	}
}

// se elibereaza memoria pentru o matrice
void eliberare_mat(int ****v_mat2, int *n, int **dim_mat2)
{
	int indice, i;
	int ***v_mat = *v_mat2, *dim_mat = *dim_mat2;

	scanf("%d", &indice);
	if (indice >= *n || indice < 0) {
		printf("No matrix with the given index\n");
	} else {
		int **aux1 = v_mat[indice], aux2 = dim_mat[indice * 2];
		int aux3 = dim_mat[indice * 2 + 1];

		// se putea adresele matricilor cu o pozitie in fata
		// se muta si dimensiunea matricelor
		for (int p = indice; p < *n - 1; p++) {
			v_mat[p] = v_mat[p + 1];
			dim_mat[p * 2] = dim_mat[(p + 1) * 2];
			dim_mat[p * 2 + 1] = dim_mat[(p + 1) * 2 + 1];
		}

		// adresa ultimei matrice primeste adresa matricei cu indicile citit
		v_mat[*n - 1] = aux1;
		dim_mat[(*n - 1) * 2] = aux2;
		dim_mat[(*n - 1) * 2 + 1] = aux3;

		//eliberam spatiu
		for (i = 0; i < dim_mat[(*n - 1) * 2]; i++)
			free(v_mat[*n - 1][i]);
		free(v_mat[*n - 1]);

		//realocam spatiul
		v_mat = (int ***)realloc(v_mat, (*n - 1) * sizeof(int **));
		dim_mat = (int *)realloc(dim_mat, (*n - 1) * 2 * sizeof(int));
		*v_mat2 = v_mat;
		*dim_mat2 = dim_mat;
		(*n) = (*n) - 1;
	}
}

// se elibereaza toata memoria
void eliberare(int ***v_mat, int *n, int *dim_mat)
{
	int i, j;
	if (*n) {
		for (i = *n - 1; i >= 0; i--) {
			for (j = 0; j < dim_mat[i * 2]; j++)
				free(v_mat[i][j]);
			free(v_mat[i]);
		}
		free(v_mat);
		free(dim_mat);
		*n = 0;
	}
}

int main(void)
{
	char comanda;
	int ***v_mat, n = 0, *dim_mat, stop = 1;
	while (stop) {
		scanf("%c", &comanda);
		if (comanda == 'L') {
			incarcare_matrice(&v_mat, &n, &dim_mat);
		} else if (comanda == 'D') {
			dimensiune(n, dim_mat);
		} else if (comanda == 'P') {
			afisare(v_mat, n, dim_mat);
		} else if (comanda == 'C') {
			redimensionare(&v_mat, n, &dim_mat);
		} else if (comanda == 'M') {
			inmultire(&v_mat, &n, &dim_mat);
		} else if (comanda == 'O') {
			sortare(&v_mat, n, &dim_mat);
		} else if (comanda == 'T') {
			transpunere(&v_mat, n, &dim_mat);
		} else if (comanda == 'R') {
			ridicare(&v_mat, n, &dim_mat);
		} else if (comanda == 'F') {
			eliberare_mat(&v_mat, &n, &dim_mat);
		} else if (comanda == 'Q') {
			eliberare(v_mat, &n, dim_mat);
			stop = 0;
		} else {
			printf("Unrecognized command\n");
		}

		getchar();
	}

return 0;
}
