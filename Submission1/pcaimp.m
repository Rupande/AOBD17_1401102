X1 = im2double(imread('subject01.gif'));
X2 = im2double(imread('subject01.happy'));
[L1,S1] = RobustPCA(X1);
[L2,S2] = RobustPCA(X2);
subplot(2,3,1)
imshow(X1);
subplot(2,3,2)
imshow(L1);
subplot(2,3,3)
imshow(S1);
subplot(2,3,4)
imshow(X2);
subplot(2,3,5)
imshow(L2);
subplot(2,3,6)
imshow(S2);