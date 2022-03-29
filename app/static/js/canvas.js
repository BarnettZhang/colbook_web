// Put the original image on the canvas
function setImage(){   
    
    var image = new Image();
    image.src = image_path;
    console.log("Load image in %s successful", image.src);
    // Set the size of the canvas equals to the size of original image
    image.onload = function(){
        canvas.height = image.height;
        canvas.width = image.width;
        ctx.drawImage(image, 0, 0);
        console.log("ctx.drawImage(image, 0, 0); executed", image.src);
    }      
}

function drawCurve() {
    penType = 1;
}

function drawLine() {
    penType = 2;
}

function drawRectangle() {
    penType = 3;
}

function drawCircle() {
    penType = 4;
}

function changeColor(ele) {
    // Set the drawing color
    draw_color = ele.style.background;
}

function undoLast() {
    
    // If there is only one action have done
    if(restore_index < 1){
        // Reset the canvas directly
        clearCanvas();
    }else{
        // Return to the last action
        restore_index -= 1;
        restore_array.pop();
        ctx.putImageData(restore_array[restore_index], 0, 0);
    }

}

function clearCanvas() {
    
    // Cover the canvas with a rectangle
    ctx.fillStyle = background_color;
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    // Reload the original image
    setImage();
    // Reset parameters for undo function
    restore_array = [];
    restore_index = -1;
}

function startDrawing(e){
    
    is_drawing = true;
    // Get the position of mouse   
    beginX = e.clientX - canvas.getBoundingClientRect().left;
    beginY = e.clientY - canvas.getBoundingClientRect().top;
    // Save the canvas contents before start drawing
    tmp = ctx.getImageData(0, 0, canvas.width, canvas.height);
    console.log("Save status");     
    
    // If drawing curve, the brush will begin to move
    if(penType == 1){
        ctx.beginPath();
        ctx.moveTo(beginX, beginY);
    }   
    e.preventDefault();
}

function drawing(e){
    
    if(is_drawing){
        
        // Get the position of mouse 
        currentX = e.clientX - canvas.getBoundingClientRect().left;
        currentY = e.clientY - canvas.getBoundingClientRect().top;
        // Set drawing settings
        ctx.strokeStyle = draw_color;
        ctx.lineWidth = draw_width;
        ctx.lineCap = "round";
        ctx.lineJoin = "round";        
        
        // If drawing curve
        if(penType == 1){            
            ctx.lineTo(currentX, currentY);
            ctx.stroke();
        }
        // If drawing line
        if(penType == 2){
            // The canvas contents must be refreshed for every time the mouse moves                     
            ctx.putImageData(tmp, 0, 0);
            console.log("Load status");            
            ctx.beginPath();
            ctx.moveTo(beginX, beginY);            
            ctx.lineTo(currentX, currentY);
            ctx.closePath(); 
            ctx.stroke();             
        }
        // If drawing rectangle
        if(penType == 3){
            // The canvas contents must be refreshed for every time the mouse moves
            ctx.putImageData(tmp, 0, 0);
            console.log("Load status");
            ctx.beginPath();
            ctx.strokeRect(Math.min(currentX,beginX), Math.min(currentY,beginY), Math.abs(currentX-beginX), Math.abs(currentY-beginY));
        }
        // If drawing circle
        if(penType == 4){
            // The canvas contents must be refreshed for every time the mouse moves
            ctx.putImageData(tmp, 0, 0);
            console.log("Load status");
            ctx.beginPath();
            ctx.arc(beginX, beginY, Math.abs(currentX-beginX), 0, 2*Math.PI);
            ctx.stroke();
        }                
    }
    e.preventDefault();
}

function stopDrawing(e){

    is_drawing = false;
    e.preventDefault();
    
    // If the current action has been done
    if(e.type != 'mouseout'){
        // Store the current status for the undo function 
        restore_array.push(ctx.getImageData(0, 0, canvas.width, canvas.height));
        restore_index += 1;
    }

}


const canvas = document.getElementById("canvas");

// Default setting for drawing
let penType = 0;
let background_color = "white";
let draw_color = "black";
let draw_width = "2";
let is_drawing = false;

let restore_array = [];
let restore_index = -1;
let tmp = null;
index = 0;

const ctx = canvas.getContext("2d");
ctx.fillStyle = background_color;
ctx.fillRect(0, 0, canvas.width, canvas.height);

// Load the original image
setImage();

// When the mouse/finger is downing
canvas.addEventListener("mousedown", startDrawing, false);
canvas.addEventListener("touchdown", startDrawing, false);

// When the mouse/finger is moving
canvas.addEventListener("mousemove",drawing, false);
canvas.addEventListener("touchmove",drawing, false);

// When the mouse/finger is uping
canvas.addEventListener("mouseup", stopDrawing, false);
canvas.addEventListener("mouseout", stopDrawing, false);
canvas.addEventListener("touchend", stopDrawing, false);

