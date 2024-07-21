local function Extends_Fun(super,callback)
  return lambda ...:callback(super,...)
end
print=Extends_Fun(print,function(super,...)
  $a={...}
  pcall(function() super(table.unpack(a)) end)
  return table.unpack(a)
end)

function namespace(name)
  if not rawget(_ENV,name) and name~="" and name~="_ENV" and name~="_G"
    rawset(_ENV,name,{_DATA=_ENV})
  end
  rawset(_ENV,"_namespace_N_",name)
  rawset(_ENV,"_namespace_U_",{})
end
function using(name)
  if name~="" and name~="_ENV" and name~="_G"
    rawset(rawget(_ENV,"_namespace_U_"),#rawget(_ENV,"_namespace_U_")+1,name)
  end
  return using
end
function rawenv(key,value)
  rawset(_ENV,key,value)
end
_namespace_E_=getmetatable(_ENV)
_namespace_E_.__index=Extends_Fun(_namespace_E_.__index,function(super,self,key)if rawget(self,"_namespace_N_") and--找不到吧，这里没有凸(>皿<)凸
    rawget(self,"_namespace_N_")~="" and
    rawget(self,"_namespace_N_")~="_ENV" and
    rawget(self,"_namespace_N_")~="_G" then
    $data= rawget(rawget(self,rawget(self,"_namespace_N_")),key)
    if data
      return data
    end
    for k,v pairs(rawget(self,"_namespace_U_"))
      if rawget(rawget(self,v),key)
        return rawget(rawget(self,v),key)
      end
    end
    return super(self,key)
   else
    if rawget(self,"_namespace_U_")
      for k,v pairs(rawget(self,"_namespace_U_"))
        if rawget(rawget(self,v),key)
          return rawget(rawget(self,v),key)
        end
      end
    end
    return super(self,key)
  end
end)
_namespace_E_.__newindex=function(self,key,value)
  if rawget(self,"_namespace_N_") and
    rawget(self,"_namespace_N_")~="" and
    rawget(self,"_namespace_N_")~="_ENV" and
    rawget(self,"_namespace_N_")~="_G" then
    return rawset(rawget(self,rawget(self,"_namespace_N_")),key,value)
   else
    return rawset(self,key,value)
  end
end
