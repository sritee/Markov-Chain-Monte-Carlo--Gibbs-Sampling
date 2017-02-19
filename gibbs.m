%Gibbs Sampling code 
%Here we will be sampling from a 2d gaussian, assuming 
%we can sample for 1d gaussian which is the conditional distributio
sample=[-3 3]; %Storing the 2d values obtained after initilizing
param=0.5; 
sigma=[1,param;param,1];% Covariance matrix, with correlation along one dimension
mean = [0 0];       %Zero mean for our example.
num_samples=10;
%First let us plot the contours and hold the figure to visualize the
%sampling.
a = -3:.1:3;
b = -3:.2:3;

[A,B] = meshgrid(a,b);
F = mvnpdf([A(:) B(:)],mean,sigma);
F = reshape(F,length(b),length(a));

mvncdf([0 0],[1 1],mean,sigma);
figure;
hold on;
contour(a,b,F,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);
xlabel('xvalue'); ylabel('yvalue');

for i=1:num_samples
   plot(sample(i,1),sample(i,2),'g.','MarkerSize',25);
   sample(i+1,1)=normrnd(param*(sample(i,2)),1-param^2); %We have derived the conditional distribution formula
   sample(i+1,2)=normrnd(param*(sample(i+1,1)),1-param^2);
   %pause
end
hold off;