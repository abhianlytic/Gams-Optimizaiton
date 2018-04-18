* assignment2-q1

set i representing number of facility / 1*9 /;
set j representing number of warehouse / 1*14 /;

Binary Variables y(i);
*Variables y(i);
Variables x(i,j) number of unit shipped from facility i to warehouse j
          z total cost;

Positive Variable x;


Parameters
         f(i)    opening cost of any facility
         /1      85
          2      65
          3      94
          4      77
          5      67
          6      93
          7      75
          8      75
          9      68         /

         u(i)    opening upper bound cost of any facility
         /1      188
          2      182
          3      141
          4      170
          5      137
          6      181
          7      140
          8      192
          9      182
                           /

         b(j)     Demand of each warehouse
         /1      9
          2      1
          3      7
          4      8
          5      2
          6      8
          7      1
          8      1
          9      1
          10     4
          11     10
          12     2
          13     1
          14     1       /        ;

Table c(i,j)    cost of shipping from i to j
  1  2 3  4  5  6 7  8  9  10 11 12 13 14
1 1  4 10 9  8  1 10 7  2  3  10 10 3  3
2 9  7 3  2  10 6 7  1  9  3  1  8  8  7
3 9  1 9  6  6  1 1  9  8  8  5  1  1  9
4 4  5 8  7  3  5 8  10 2  10 1  4  5  9
5 8  1 3  3  10 9 10 2  2  6  1  3  4  1
6 2  3 5  9  4  2 6  2  7  5  1  4  3  5
7 9  4 3  6  4  4 4  4  6  6  7  8  3  9
8 10 5 1  9  1  3 5  10 10 3  10 8  9  3
9 2  9 9  10 3  8 2  1  6  4  9  10 8  5 ;
Equations obj,m(i),k(j),jj;

obj.. z=E=sum(i,f(i)*y(i))+sum((i,j),c(i,j)*x(i,j));
m(i)..  sum(j,x(i,j))=L=u(i)*y(i);
k(j)..  sum(i,x(i,j))=E=b(j);
jj..  y("2")=G=y("1");


Model a2q1f1/all/;

Solve a2q1f1 using MIP minimizing z;
*Solve a2q1f1 using LP minimizing z;

Display z.L,x.L;






