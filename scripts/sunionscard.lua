local inter = redis('sunion', KEYS[1], KEYS[2]) 
return table.getn(inter)
