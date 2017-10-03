///newBvrArr(behavior, sprIndex, roomSpd, imageSpd, ..., ..., ..., ..., ......);

arr[0, 0] = 0;

var curArg = 0;

//print("book");
for (var i=0;i<argument_count/4;i+=1){
    for (var j = 0; j <= 3; j++){
        arr[i, j] = argument[curArg++];
        //print(arr[i,j]);
    } 
}
//print("back");

return arr;
