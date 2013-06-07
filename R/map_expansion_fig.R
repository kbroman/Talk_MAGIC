source("map_expansion_func.R")
source("colors.R")
pdf("../Figs/map_expansion.pdf", height=6, width=9, pointsize=16, onefile=TRUE)

maxgen <- 20
source("colors.R")
color <- c(rgb(102,203,254,maxColorValue=255),
           rgb(254,102,254,maxColorValue=255),
           rgb(102,254,102,maxColorValue=255),
           rgb(254,203,102,maxColorValue=255)) # yellow

par(mar=c(4.1,4.1,1.1,1.1),las=1,fg="white",col="white",
    col.axis="white",col.lab=textcolor["blue"],
    bg=bgcolor)
plot(0:maxgen, c(0,meself2(1:maxgen)), xlab=expression(paste("Generation ", F[k])),
     ylab="Map expansion",
     type="l", lwd=2, col=color[2],
     xaxs="i", yaxs="i", ylim=c(0, 7), lty=2)
axis(side=1, at=c(1:4, 6:9, 11:14, 16:19, 21:24), labels=rep("",20), tck=-0.015)
lines(0:maxgen, c(0, meself4(1:maxgen)), col=color[3], lwd=2, lty=2)
lines(0:maxgen, c(0, meself8(1:maxgen)), col=color[1], lwd=2,lty=2)
text(17.0, mesibA8(17)-0.1, "Eight-way", col=color[1], adj=c(0,1))
text(17.0, mesibA4(17)-0.1, "Four-way",  col=color[3],   adj=c(0,1))
text(17.0, mesibA2(17)-0.1, "Two-way",   col=color[2],  adj=c(0,1))

lines(0:maxgen, mesibA2(0:maxgen), lwd=2, col=color[2])
lines(0:maxgen, mesibA4(0:maxgen), lwd=2, col=color[3])
lines(0:maxgen, mesibA8(0:maxgen), lwd=2, col=color[1])

legend("bottomright", lwd=2, lty=1:2, c("Sib-mating", "Selfing"))

dev.off()
