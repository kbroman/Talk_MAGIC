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

library(broman)
source("colors.R")
color <- c(sexcolor[2], hetcolor, sexcolor[1])

pdf("../Figs/fixation_time.pdf", height=6, width=9, pointsize=16, onefile=TRUE)
maxgen <- 20
par(mar=c(3.1,3.6,1.1,1.1),las=1,fg="white",col="black",
    col.axis="white",col.lab=textcolor["blue"],
    bg=bgcolor)
grayplot(0:maxgen, c(0,self(1:maxgen)), xlab=expression(paste("Generation ", F[k])),
         ylab=expression(paste("Pr( fixed  by  ", F[k], " )")),
         type="l", lwd=2, col=color[1],
         xaxs="i", yaxs="i", ylim=c(0, 1),
         xat=seq(0, 20, by=5), yat=seq(0, 1, by=0.2),
         vlines=1:20, hlines=seq(0, 1, by=0.1),
         vlines.col=c(rep("gray90", 4), "gray60"), hlines.col="gray90",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1, 0.4, 0))
lines(0:maxgen, sibA(0:maxgen, "2"), lwd=2, col=color[2])
lines(0:maxgen, sibX(0:maxgen, "2"), lwd=2, col=color[2], lty=2)
lines(0:maxgen, sibA(0:maxgen, "4"), lwd=2, col=color[3])
lines(0:maxgen, sibX(0:maxgen, "4"), lwd=2, col=color[3], lty=2)
legend("bottomright",
       c("selfing", "2-way, sib-mating, X chr", "2-way, sib-mating, autosome", 
         "4-way, sib-mating, X chr", "4-way, sib-mating, autosome"), lwd=2,
       col=color[c(1,2,2,3,3)], lty=c(1,2,1,2,1),
       bg="gray80", box.col="black", box.lwd=2)
dev.off()
