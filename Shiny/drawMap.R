##This function shows the crime rate visually in a map of the United States. 

stateMap <- function(data, crimeName, color){
        ##48 types of color represents 48 states
        shades <- colorRampPalette(c(color,"white"))(48)
        
        index <- which(colnames(data) == crimeName)
        data <- data[c(-2,-11),]
        data <- arrange(data,data[,index])
        var <- data[,index]
        var <- as.numeric(var)
        percents <- as.integer(cut(var, 48, 
                                   include.lowest = TRUE, ordered = TRUE))
        ## The colors in each state 
        fills <- shades[percents]
        
        map("state", as.character(data$State), boundary = TRUE, 
            fill = TRUE, col = fills, resolution = 0, 
            lty = 1, lwd = 1, projection = "polyconic", 
            myborder = 0, mar = c(0,0,0,0))
        
        title(paste("The",crimeName, "crime rate in USA(1975)\ndarker color represents higher crime rate"))

}