路径方框=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(2)
.setColor(0xffffffff)

人数画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xffffffff)
.setTextAlign(Paint.Align.CENTER)
.setTextSize(30)
.setFakeBoldText(true)
.setColor(0xffffffff)

距离画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(20)
.setFakeBoldText(true)
.setColor(0xFFFFFFFF)
.setTextAlign(Paint.Align.RIGHT)

阵营画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(20)
.setFakeBoldText(true)
.setColor(0xFFFFFFFF)
.setTextAlign(Paint.Align.CENTER)

伤害画笔1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(35)
.setFakeBoldText(true)
.setColor(0xFFFF0000)
.setStrokeWidth(3)
.setTextAlign(Paint.Align.CENTER)

伤害画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(35)
.setFakeBoldText(true)
.setColor(0xFFFF0000)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(1)
.setTextAlign(Paint.Align.CENTER)

名字画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(25)
.setFakeBoldText(true)
.setColor(0xFFFFFFFF)
.setTextAlign(Paint.Align.CENTER)

名字画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(30)
.setFakeBoldText(true)
.setColor(0xFFFFFFFF)
.setTextAlign(Paint.Align.CENTER)

血条画笔1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(2)
.setColor(0xFFFF0000)

血条画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStrokeWidth(1)
.setColor(0xFFFF0000)

血条画笔3=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setFakeBoldText(true)
.setTextSize(20)
.setColor(0xFFFF0000)

血条画笔4=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setFakeBoldText(true)
.setTextSize(18)
.setColor(0xFFFF0000)

准星画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xffff0000)

FPS画笔=Paint()
.setAntiAlias(true)--抗锯齿
.setStrokeCap(Cap.ROUND)--圆润边角
.setTextSize(30)--字体大小
.setTextAlign(Paint.Align.CENTER)--字体居中
.setFakeBoldText(true)


width=屏幕高()
height=屏幕宽()
width_2=width/2
height_2=height/2

$list={}
function setColor(a,b)
  local d,p
  if not list[a]
    list[a]={}
  end
  d=list[a]
  p=d[b]
  if p
    if _ENV[a]~=p
      _ENV[a]=p
    end
   else
    d[b]=Paint()
    d[b].set(_ENV[a])
    d[b].color=b
    _ENV[a]=d[b]
    paint[#paint+1]=d[b]
  end
end

paint={瞄准画笔,信息画笔2,伤害画笔1,伤害画笔2,FPS画笔,准星画笔,方框画笔,人数画笔1,人数画笔2,射线画笔,背敌画笔1,背敌画笔2,背敌文字,信息画笔,路径方框,距离画笔,阵营画笔,名字画笔,血条画笔1,血条画笔2,血条画笔3}



function split2(szFullString, szSeparator)
  local nFindStartIndex = 1
  local nSplitIndex = 1
  local nSplitArray = Split_Table
  while true
    local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
    if not nFindLastIndex then
      nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
      break
    end
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
    nFindStartIndex = nFindLastIndex + string.len(szSeparator)
    nSplitIndex = nSplitIndex + 1
  end
  return nSplitArray
end

function split3(a,b)
  $idx=0
  a:gsub("[^"..b.."]+",function(w)
    idx=idx+1
    Split_Table[idx]=w
  end)
end

xpcall(function()
  split1=import "demo".split
end,function()
  split1=split2
end)

string.split=split1
Split_Table={}

draw=setmetatable({},{
  __newindex=function(self,key,value)
    if key=="ttf"
      $a=Typeface.createFromFile(File(activity.getLuaDir(tostring(value))))
      for k,v pairs(paint)
        v.setTypeface(a)
      end
    end
  end
})

function 屏幕方向()
  $a=activity.getWindowManager().getDefaultDisplay().getSize(Point());
  local 状态=tostring(a):match("rotation%s-(%d-)%s-,%s-density")
  return 状态=="1"
end


window.getViewTreeObserver().addOnGlobalLayoutListener(ViewTreeObserver.OnGlobalLayoutListener{
  onGlobalLayout=function()
    if 矫正
      if not 屏幕方向()
        width_2=(屏幕高()/2.0)
       else
        width_2=(width/2.0)
      end
    end
  end
});

function 振动(d)
  $a=activity.getSystemService(Context.VIBRATOR_SERVICE)
  $b=long{0,d}
  return lambda:a.vibrate(b,-1)
end

function MD提示(str,color,color2,ele,rad)
  if time then toasttime=Toast.LENGTH_SHORT else toasttime= Toast.LENGTH_SHORT end
  toasts={
    CardView;
    id="toastb",
    CardElevation=ele;
    radius=rad;
    backgroundColor=color;
    {
      TextView;
      layout_margin="7dp";
      textSize="13sp";
      TextColor=color2,
      text=str;
      layout_gravity="center";
      id="mess",
    };
  };
  local toast=Toast.makeText(activity,nil,toasttime);
  toast.setView(loadlayout(toasts))
  toast.show()
end


