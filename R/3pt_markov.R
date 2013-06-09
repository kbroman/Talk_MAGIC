# non-Markov property for 3pts in 8-way RILs


library(broman)
source("colors.R")
attach("ril_3pt.RData")
source("study_probs.R")
mark8AI[,-(1:2)] <- log2(mark8AI[,-(1:2)])
mark8ANI[,-(1:2)] <- log2(mark8ANI[,-(1:2)])

color <- c("black", sexcolor[2], hetcolor, sexcolor[1], sexcolor[1], "pink", color[4])

pdf("../Figs/3pt_markov4.pdf", width=9, height=5.7,
    pointsize=16, onefile=TRUE)
par(mar=c(3.1,3.6,0.6,1.1),las=1,fg="white",col="black",
    col.axis="white",col.lab=textcolor["blue"],
    bg=bgcolor)
grayplot(0,0,type="n",
         ylab=expression(paste(log[2]," probability ratio")),
         xlab="recombination fraction",
         xlim=c(0,0.5),ylim=c(-4,2.64), xaxs="i",
         xat=seq(0, 0.5, by=0.1), yat=seq(-4, 2, by=1),
         vlines=seq(0, 0.5, by=0.05), hlines=seq(-4, 2, by=1),
         vlines.col="gray90", hlines.col="gray90",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1, 0.4, 0))
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
       lwd=2,col=color[wh[-5]],ncol=1,y.intersp=0.9,
       bg="gray80", box.col="black", box.lwd=2)
dev.off()
