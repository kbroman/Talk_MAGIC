
source("colors.R")
color <- c(rgb(102,203,254,maxColorValue=255),
#           rgb(254,102,254,maxColorValue=255),
           rgb(254,  0,128,maxColorValue=255),
           rgb(102,254,102,maxColorValue=255),
           rgb(128,  0,128,maxColorValue=255),
           rgb(203,102,254,maxColorValue=255),
           rgb(254,203,102,maxColorValue=255),
           rgb(  0,128,128,maxColorValue=255),
           rgb(102,102,102,maxColorValue=255))

pdf("../Figs/rf_by_sim.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(4.1, 4.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,bty="n")
load("ri8_onestep_rev.RData.gz")
rf <- as.numeric(names(onestep))
wh <- which(rf*1000 == round(rf*1000))

xat <- seq(0, 0.5, by=0.05)
yat <- seq(0, 0.8, by=0.1)
grayplot(rf[wh], onestep[wh], xlab="r", ylab="", xat=xat, yat=yat,
         hlines=yat, vlines=xat, ylim=c(0, 7/8+0.02), xaxs="i", yaxs="i",
         pch=21, col="black", bg=color[1], xlim=c(0, 0.5),
         mgp=c(2.1, 0.4, 0))
mtext(side=2, "R", srt=90, line=2.6)
abline(h=7/8, col=color2[3], lwd=2)
u <- par("usr")
mtext(side=2, at=7/8, "7/8", col=color2[3], line=0.4)

dev.off()
