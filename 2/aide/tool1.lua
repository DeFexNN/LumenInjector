pcall(function()
  if not Settings.canDrawOverlays(this)
    if Build.VERSION.SDK_INT >= 23
      iosAlertDialog(this)
      .setOnClick(function(d,l,v)
        $intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
        intent.setData(Uri.parse("package:" .. activity.getPackageName()));
        activity.startActivityForResult(intent, 100);
        os.exit()
      end)
      .setTitle("没有悬浮窗权限！")
      .setMessage("检测到您没有给予悬浮窗权限，请点击跳转授权。")
      .setButton("跳转授权")
      .setCancelable(false)
      .show()
     else
      iosAlertDialog(this)
      .setOnClick(function(d,l,v)
        os.exit()
      end)
      .setTitle("没有悬浮窗权限！")
      .setMessage("检测到您没有给予悬浮窗权限，请前往应用详情开启权限。")
      .setButton("我知道了")
      .setCancelable(false)
      .show()
    end
  end
end)
function 初始化(l,v,dia)
  local a,t,w
  if not dia
    a,t,w=l.flags,l.title,this.getSystemService(Context.WINDOW_SERVICE)
   else
    w=this.getSystemService(Context.WINDOW_SERVICE)
  end
  return {
    隐藏=function()
      if v
        w.removeView(v)
      end
      if not dia
        l.flags=a|WindowManager.LayoutParams().FLAG_DITHER | 1048576 | 262696 | 131072 | 4136
       else
        l.addFlags(WindowManager.LayoutParams().FLAG_DITHER | 1048576 | 262696 | 131072 | 4136)
        l.setDimAmount(0)
      end
      if RomUtil.isMiui()
        l.title="com.miui.screenrecorder"
       elseif RomUtil.isEmui()
        l.title="ScreenRecoderTimer"
       elseif RomUtil.isVivo()
        l.title="screen_record_menu"
       elseif RomUtil.isOppo()
        l.title="com.coloros.screenrecorder.FloatView"
       elseif RomUtil.isSmartisan()
        l.title=""
       elseif RomUtil.isFlyme()
        pcall(function()
          l.title="SysScreenRecorder"
          $MeizuParamsClass = Class.forName("android.view.MeizuLayoutParams");
          $flagField = MeizuParamsClass.getDeclaredField("flags");
          flagField.setAccessible(true);
          $MeizuParams = MeizuParamsClass.newInstance();
          flagField.setInt(MeizuParams, WindowManager.LayoutParams().FLAG_DITHER | 1048576 | 262696 | 131072 | 4136);
          $mzParamsField = l.getClass().getField("meizuParams");
          mzParamsField.set(l, MeizuParams);
        end)
      end
      if v
        w.addView(v,l)
      end
    end,
    显示=function()
      if v
        w.removeView(v)
      end
      l.flags=a
      l.title=t
      if v
        w.addView(v,l)
      end
    end
  }
end
dm = DisplayMetrics();
activity.getWindowManager().getDefaultDisplay().getRealMetrics(dm);
function 屏幕高()
  local a = dm.widthPixels;
  local b = dm.heightPixels;
  if tonumber(a)>tonumber(b) then
    b=a
   else
    b=b
  end
  return tonumber(b)
end
function 屏幕宽()
  local a = dm.widthPixels;
  local b = dm.heightPixels;
  if tonumber(a)>tonumber(b) then
    a=b
   else
    a=a
  end
  return tonumber(a)
end


画布管理 = activity.getSystemService(Context.WINDOW_SERVICE)
wmManagers=画布管理
画布容器 = WindowManager.LayoutParams()
wmParam=画布容器
if tonumber(Build.VERSION.SDK) >= 26 then
  wmParam.type = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else
  wmParam.type = WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end

wmParam.format = PixelFormat.RGBA_8888

wmParam.flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
| WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE
| WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL
--| WindowManager.LayoutParams.FLAG_HARDWARE_ACCELERATED--硬件加速
| WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
| WindowManager.LayoutParams.FLAG_FULLSCREEN
| WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS

wmParam.gravity = Gravity.LEFT | Gravity.TOP
wmParam.width = 屏幕高()
wmParam.height = -1
window=View(this)
wmManagers.addView(window,wmParam)
画布伪装=初始化(wmParam,window)

方框画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(1.5)

背景填充=Paint()
.setAntiAlias(true)
.setColor(0x2100FF00)

瞄准画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(5)
.setColor(0xffffFFFF)
.setShadowLayer(12,0,0,0xff00FFFF)

人数画笔1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)


人数画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xffffffff)
.setTextAlign(Paint.Align.CENTER)
.setTextSize(30)
.setFakeBoldText(true)
.setColor(0xffffffff)


射线画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStrokeWidth(2)
.setColor(0xdfffffff)


背敌画笔1=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)


背敌画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setStyle(Paint.Style.STROKE)
.setStrokeWidth(3)


背敌文字=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setTextSize(30)
.setFakeBoldText(true)
.setTextAlign(Paint.Align.CENTER)



信息画笔=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xaf303030)

信息画笔2=Paint()
.setAntiAlias(true)
.setStrokeCap(Cap.ROUND)
.setColor(0xaf303030)


