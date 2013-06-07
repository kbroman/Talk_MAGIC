
color <- c(rgb(102,203,254,maxColorValue=255), # light blue
           rgb(254,  0,128,maxColorValue=255), # dark pink
           rgb(102,254,102,maxColorValue=255), # light green
           rgb(128,  0,128,maxColorValue=255), # dark purple
           rgb(203,102,254,maxColorValue=255), # light purple
           rgb(254,203,102,maxColorValue=255), # yellow/gold
           rgb(  0,128,128,maxColorValue=255), # dark green
           rgb(102,102,102,maxColorValue=255)) # gray

#bgcolor <- rgb(0, 0, 80, maxColorValue=255)
bgcolor <- rgb(37, 37, 37, maxColorValue = 255)

# text
color2 <- c(rgb(255, 255, 102, maxColorValue=255), # yellow
            rgb(102, 204, 255, maxColorValue=255), # light blue
            rgb(255, 102, 255, maxColorValue=255)) # pink

CCcolor <- c(rgb(240,240,  0,maxColorValue=255), # yellow
           rgb(128,128,128,maxColorValue=255),   # gray
           rgb(240,128,128,maxColorValue=255),   # salmon
           rgb( 16, 16,240,maxColorValue=255),   # dark blue
           rgb(  0,160,240,maxColorValue=255),   # light blue
           rgb(  0,160,  0,maxColorValue=255),   # green
           rgb(240,  0,  0,maxColorValue=255),   # red/pink
           rgb(144,  0,224,maxColorValue=255))   # purple

hetcolor <- rgb(0, 200, 0, maxColorValue=255)    # green
f2color <- c(CCcolor[1], hetcolor, CCcolor[5])   # yellow, green, cyan
sexcolor <- c(rgb(255,80,80, maxColorValue=255), # pink, blue
              CCcolor[5])

#par(mar=rep(0.1, 4))
#plot(0,0,type="n", xlab="", ylab="", xaxt="n", yaxt="n",
#     xlim=c(0, 100), ylim=c(0, 100))
#
#y <- seq(90, 10, length=8)
#text(rep(5, length(y)), y, seq(along=y))
#
#x <- 15
#text(x, 98, "color")
#points(rep(x, length(color)), y[seq(along=color)],
#       pch=21, col="black", bg=color)
#
#x <- 25
#text(x, 98, "color2")
#points(rep(x, length(color2)), y[seq(along=color2)],
#       pch=21, col="black", bg=color2)
#
#x <- 35
#text(x, 98, "CCcolor")
#points(rep(x, length(CCcolor)), y[seq(along=CCcolor)],
#       pch=21, col="black", bg=CCcolor)
#
#
#x <- 45
#text(x, 98, "hetcolor")
#points(rep(x, length(hetcolor)), y[seq(along=hetcolor)],
#       pch=21, col="black", bg=hetcolor)
#
#
#x <- 55
#text(x, 98, "f2color")
#points(rep(x, length(f2color)), y[seq(along=f2color)],
#       pch=21, col="black", bg=f2color)
#
#x <- 65
#text(x, 98, "sexcolor")
#points(rep(x, length(sexcolor)), y[seq(along=sexcolor)],
#       pch=21, col="black", bg=sexcolor)
