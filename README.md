**Exercise 1. Metric functions**

I implemented all required metric functions in Matlab - Minkowski for p=1(Manhattan),
p=2(Euclidean), p=Infinity(Chebyshev), Canberra, Mahalanobis and Cosine. Functions
work with vectors of arbitrary dimensions. Functions are used in exercises 2 and 3.

**Exercise 2. Representative based clustering**

I implemented k-means algorithm in Matlab. I used all metric functions, I implemented
in exercise 1.

![K-means clustering](/Pictures/Hw1MlKmeans.JPG)

**Exercise 3. Density based clustering**

I implemented DBSCAN algorithm in Matlab. I used metric functions, I implemented
in exercise 1. For DBSCAN, you do not have to specify cluster count but instead it is
crucial to determine correct values for radius and points count in the given radius.

![DBSCAN clustering](/Pictures/hw1MlDbscan.JPG)

**Exercise 4. Dataset generation**

Generated dataset in three dimensional space. Following conditions are satisfied:

Three clusters constitute data set;
Clusters 1 and 2 are distinguishable only using features 1 and 2 but
indistinguishable with respect to feature 3;
Clusters 2 and 3 are distinguishable only using features 2 and 3 but
indistinguishable with respect to feature 1.

![Dataset creation](/Pictures/hw1MlDataCreation.png)

I implemented Hopkins statistics to support findings. Results are as follows:

![Dataset creation results](/Pictures/Hw1MlTable1.JPG)

This table clearly shows that clusters that are indistinguishable in one dimension, have
smaller Hopkins statistics score. For clusters 1 and 2, indistinguishable feature was 3 -
and its corresponding score is 0,4891. For clusters 2 and 3, indistinguishable feature was
1 - and its corresponding score is 0.5000. For clusters 1 and 3, all features are
distinguishable so all the features scores are over 0,9.