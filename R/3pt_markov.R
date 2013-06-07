######################################################################
# figure 5: Markov property for 3pts in 8-way RILs
######################################################################

source("colors.R")
attach("ril_3pt.RData")
source("study_probs.R")
mark8AI[,-(1:2)] <- log2(mark8AI[,-(1:2)])
mark8ANI[,-(1:2)] <- log2(mark8ANI[,-(1:2)])

colors <- c("white", colors)

pdf("../Figs/3pt_markov4.pdf", width=9, height=5.7,
    pointsize=16, onefile=TRUE)
par(mar=c(5.1,4.1,0.6,0.6),las=1,fg="white",col="white",
    col.axis="white",col.lab=textcolor["blue"],
    bg=bgcolor)
plot(0,0,type="n",ylab="",xlab="",
     xlim=c(0,0.5),ylim=c(-4,2.64), xaxs="i")
#abline(h=0,lty=3,col="gray45",lwd=2)
mtext(side=2,expression(paste(log[2]," probability ratio")),line=2.3,las=0, col=textcolor["blue"])
mtext(side=1,"recombination fraction",line=2.5, col=textcolor["blue"])
wh <- c(1:3,5:7)
for(i in 6:1) {
  lines(mark8AI[c(1,i+15)],lwd=2,lty=2,col=color[wh[i]])
  lines(mark8ANI[c(1,i+15)],lwd=2,col=color[wh[i]])
}
u <- par("usr")
let <- LETTERS[wh]
let[4] <- paste(let[4:5],collapse="/")
let <- let[-5]
legend(u[2],u[3],yjust=0,xjust=1,paste("x = ",let),
       lwd=2,col=color[wh[-5]],ncol=1,y.intersp=0.9)
dev.off()
