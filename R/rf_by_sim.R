
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
wh <- (rf*1000 == round(rf*1000))

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


dat <- data.frame(rf=rf, R=onestep)
out <- nls(R ~ a*rf/(1+b*rf), data=dat, start=list(a=4, b=6))

pdf("../Figs/rf_by_sim2.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(4.1, 4.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,bty="n")
load("ri8_onestep_rev.RData.gz")
rf <- as.numeric(names(onestep))
wh <- (rf*1000 == round(rf*1000))

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

x <- seq(0, 0.5, length=251)
lines(x, 7*x/(1+6*x), col=color2[1], lwd=2)
points(rf[wh], onestep[wh], col="black", bg=color[1], pch=21)

rect(0.305, 0.403, 0.445, 0.497, col="gray80", border="gray80", alpha=0.7)
text(0.375, 0.45, "R = 7 r / (1 + 6 r)", col="black")

dev.off()

pdf("../Figs/rf_by_sim3.pdf", width=9, height=6, pointsize=16, onefile=TRUE)
par(mar=c(4.1, 4.1, 1.1, 1.1),las=1,fg="white",col="white",col.axis="white",col.lab="white",
    bg=bgcolor,bty="n")
load("ri8_onestep_rev.RData.gz")
rf <- as.numeric(names(onestep))
wh <- (rf*1000 == round(rf*1000))

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

x <- seq(0, 0.5, length=251)
lines(x, 7*x/(1+6*x), col=color2[1], lwd=2)
points(rf[wh], onestep[wh], col="black", bg=color[1], pch=21)
points(rf[!wh], onestep[!wh], col="black", bg=color[3], pch=21, cex=0.6)

rect(0.305, 0.403, 0.445, 0.497, col="gray80", border="gray80", alpha=0.7)
text(0.375, 0.45, "R = 7 r / (1 + 6 r)", col="black")

dev.off()