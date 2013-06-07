self <- function(k) 1-(1/2)^(k-1)

sibA <- 
function(k, nstr=c("2","4")) {
  nstr <- match.arg(nstr)
  if(nstr=="2")
    return(2*((1/2) + (1/5)*(1/4)^k - ((7-3*sqrt(5))/20)*((1-sqrt(5))/4)^k - ((7+3*sqrt(5))/20)*((1+sqrt(5))/4)^k))
  
  (4*(1/4 + (1/4)*(1/2)^k - (1/20)*(1/4)^k - ((9-4*sqrt(5))/40)*((1-sqrt(5))/4)^k - ((9+4*sqrt(5))/40)*((1+sqrt(5))/4)^k))
}

sibX <- 
function(k, nstr=c("2","4")) {
  nstr <- match.arg(nstr)
  if(nstr=="2")
    return(2/3 + (1/12)*(-1/2)^k-(1/4)*(1/2)^k-((5-3*sqrt(5))/20)*((1-sqrt(5))/4)^k-((5+3*sqrt(5))/20)*((1+sqrt(5))/4)^k + 1/3+(-1/12)*(-1/2)^k+(1/4)*(1/2)^k-((5-3*sqrt(5))/20)*((1-sqrt(5))/4)^k-((5+3*sqrt(5))/20)*((1+sqrt(5))/4)^k)

2*(  1/3+(1/24)*(-1/2)^k + (1/8)*(1/2)^k - ((5-2*sqrt(5))/20)*((1-sqrt(5))/4)^k - ((5+2*sqrt(5))/20)*((1+sqrt(5))/4)^k) +
  1/3 - (1/12)*(-1/2)^k + (1/4)*(1/2)^k - ((5-3*sqrt(5))/20)*((1-sqrt(5))/4)^k-((5+3*sqrt(5))/20)*((1+sqrt(5))/4)^k

}

source("colors.R")
color <- c(rgb(102,203,254,maxColorValue=255),
           rgb(254,102,254,maxColorValue=255),
           rgb(102,254,102,maxColorValue=255),
           rgb(254,203,102,maxColorValue=255)) # yellow

pdf("../Figs/fixation_time.pdf", height=6, width=9, pointsize=16, onefile=TRUE)
maxgen <- 20
par(mar=c(4.1,4.1,1.1,1.1),las=1,fg="white",col="white",
    col.axis="white",col.lab=textcolor["blue"],
    bg=bgcolor)
plot(0:maxgen, c(0,self(1:maxgen)), xlab=expression(paste("Generation ", F[k])),
     ylab=expression(paste("Pr( fixed  by  ", F[k], " )")),
     type="l", lwd=2, col=color[1],
     xaxs="i", yaxs="i", ylim=c(0, 1))
axis(side=1, at=c(1:4, 6:9, 11:14, 16:19, 21:24), labels=rep("",20), tck=-0.015)
lines(0:maxgen, sibA(0:maxgen, "2"), lwd=2, col=color[2])
lines(0:maxgen, sibX(0:maxgen, "2"), lwd=2, col=color[2], lty=2)
lines(0:maxgen, sibA(0:maxgen, "4"), lwd=2, col=color[3])
lines(0:maxgen, sibX(0:maxgen, "4"), lwd=2, col=color[3], lty=2)
legend("bottomright",
       c("selfing", "2-way, sib-mating, X chr", "2-way, sib-mating, autosome", 
         "4-way, sib-mating, X chr", "4-way, sib-mating, autosome"), lwd=2,
       col=color[c(1,2,2,3,3)], lty=c(1,2,1,2,1))
u <- par("usr")
text(u[1]-diff(u[1:2])*0.1, u[4]+diff(u[3:4])*0.16, "A", font=2, xpd=TRUE, cex=1.3)
dev.off()
