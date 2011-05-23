local inter = redis('sinter', KEYS[1], KEYS[2]) 
return table.getn(inter)
