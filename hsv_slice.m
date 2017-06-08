X = rgb2hsv(imread('flower.jpg'));
%X = double(X);
Y = imread('flower.jpg');
%Y = double(Y);

r = Y(:,:,1);
g = Y(:,:,2);
b = Y(:,:,3);

ri = zeros(size(r));
bi = zeros(size(b));
gi = zeros(size(g));

ind = find(ri == 0);
ri(ind) = 0.5;
bi(ind) = 0.5;
gi(ind) = 0.5;


Y(:,:,1) = ri;
Y(:,:,2) = gi;
Y(:,:,3) = bi;

%figure;imshow(Y);

h = X(:,:,1)*360;
s = X(:,:,2);
v = X(:,:,3);

%figure;imshow(h/360);
%figure;imshow(s);
%figure;imshow(v);

hi = zeros(size(h));
vi = zeros(size(v));
vi = v;

hi_ind = find(h<=55);
hi(hi_ind) = h(hi_ind);


hi = hi/360 ;

X(:,:,1) = hi;
%X(:,:,2) = s;
X(:,:,3) = vi;

ri(hi_ind) = r(hi_ind);
gi(hi_ind) = g(hi_ind);
bi(hi_ind) = b(hi_ind);

Y(:,:,1) = ri;
Y(:,:,2) = gi;
Y(:,:,3) = bi;

figure;imshow(Y);

T = hsv2rgb(X);

%figure;imshow(T); 


