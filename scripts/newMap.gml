///newMap(behavior, sprIndex, roomSpd, imageSpd, ..., ..., ..., ..., ......);

map = ds_map_create();
var mapKey = 0;


for (var i=0;i<argument_count;i+=4)
{
    var argStr = string(argument[i+1]) + "," + string(argument[i+2]) + "," + string(argument[i+3]);
    ds_map_add(map, mapKey, argStr);
    mapKey++;
}

print("BEHAVIOR MAP: ");
for (var i = 0; i < ds_map_size(map); i++){
    print(ds_map_find_value(map, i));
} 

return map;
