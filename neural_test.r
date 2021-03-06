source(neural.r)


search_interval=c(-300,300)
default_threshold=0.005

default_lambda=0

#testing0:

n_data=10
nnds=c(2,1)
y0=1
x0=c(1,0)
y1=matrix(y0+rnorm(n_data*length(y0),mean=0,sd=0.1),nnds[length(nnds)])
x1=matrix(x0+rnorm(n_data*length(x0),mean=0,sd=0.1),nnds[1])
newnn0=nn.initialize(nnds,mean=0,sd=1)
newnn0
nn.forward(newnn0,x0)$y

newnn0=nn.learn(newnn0,x1,y1,lambda=default_lambda,visualize=TRUE)
newnn0
nn.forward(newnn0,x0)$y


#testing1: 

default_threshold=0.001
yand=t(as.matrix(c(1,0,0,0)))
yor=t(as.matrix(c(1,1,1,0)))
yxor=t(as.matrix(c(0,1,1,0)))
ynxor=t(as.matrix(c(1,0,0,1)))


n_data=50
nnds=c(2,10,1)
y=yxor
x=rbind(c(1,1,0,0),c(1,0,1,0))

yy=matrix(as.numeric(y)+rnorm(n_data*length(y),mean=0,sd=0.1),nnds[length(nnds)])
xx=matrix(as.numeric(x)+rnorm(n_data*length(x),mean=0,sd=0.1),nnds[1])
newnn=nn.initialize(nnds,mean=0,sd=0.5)
newnn


for (i in 1:dim(x)[2]){print(nn.forward(newnn,x[,i])$y)}
newnn=nn.learn(newnn,xx,yy,lambda=default_lambda,visualize=FALSE)
newnn
for (i in 1:dim(x)[2]){print(nn.forward(newnn,x[,i])$y)}
visualize(newnn,step=0.05)

#testing2: 

n_data=500
nnds=c(2,10,1)
y=c(0,0,0,0,1)
x=rbind(c(1,1,0,0,0.5),c(1,0,1,0,0.5))

yy=matrix(as.numeric(y)+rnorm(n_data*length(y),mean=0,sd=0.1),nnds[length(nnds)])
xx=matrix(as.numeric(x)+rnorm(n_data*length(x),mean=0,sd=0.1),nnds[1])
newnn=nn.initialize(nnds,mean=0,sd=0.5)
newnn


for (i in 1:dim(x)[2]){print(nn.forward(newnn,x[,i])$y)}
newnn=nn.learn(newnn,xx,yy,lambda=default_lambda,visualize=FALSE)
newnn
for (i in 1:dim(x)[2]){print(nn.forward(newnn,x[,i])$y)}
visualize(newnn,step=0.05)



