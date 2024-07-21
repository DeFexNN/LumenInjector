require "import"
import "init"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.net.*"
import "android.provider.Settings"
import "android.content.Context"
import "java.io.FileOutputStream"
import "java.util.zip.ZipFile"
import "java.io.File"
import "android.graphics.Typeface"
import "android.graphics.drawable.GradientDrawable"
import "android.view.animation.AnimationSet"
import "android.view.animation.LayoutAnimationController"
import "android.view.animation.AlphaAnimation"
import "android.content.Intent"
import "android.net.Uri"
import "android.content.pm.PackageManager"
import "layout"
import "su"
import "AndLua"
import "zip4j"
import "java.util.zip.*"
import "java.io.*"
import "android.media.MediaPlayer"
os.execute("su")


activity.setTheme(R.AndLua13)
activity.ActionBar.hide()
activity.setContentView(loadlayout(layout))


import "android.graphics.PorterDuffColorFilter"
import "android.graphics.PorterDuff"


----------------------Animation-----------------------

import "android.view.animation.AnimationUtils"
import "android.view.animation.LayoutAnimationController"



animation = AnimationUtils.loadAnimation(activity,android.R.anim.slide_in_left)
lac = LayoutAnimationController(animation)
lac.setOrder(LayoutAnimationController.ORDER_RANDOM)
--LayoutAnimationController.ORDER_NORMAL   顺序显示
--LayoutAnimationController.ORDER_REVERSE 反显示
--LayoutAnimationController.ORDER_RANDOM 随机显示
anim.setLayoutAnimation(lac)

import "android.view.animation.TranslateAnimation"
TranslateBAWAH=TranslateAnimation(0, 0, 1000, 0)
TranslateBAWAH.setDuration(800)
TranslateBAWAH.setFillAfter(true)


function Waterdropanimation(Controls,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(Controls,"scaleX",{1,.8,1.3,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(Controls,"scaleY",{1,.8,1.3,.9,1}).setDuration(time).start()
end



------------LOGIN-------------

function nizar(mo,oj,l)
  Loadin= {
    LinearLayout;
    orientation='vertical';
    {
      CardView;
      radius=oj;
      CardElevation="0dp";
      CardBackgroundColor=l;
      layout_height="wrap_content";
      layout_width="wrap_content";
      layout_gravity="center";
      {
        LinearLayout;
        layout_height="wrap_content";
        layout_width="wrap_content";
        orientation="vertical";
        {
          ImageView;
          id="mImageView";
          src="iconn.png";
          layout_width="80sp";
          layout_height="80sp";
          layout_margin="7dp";
          layout_gravity="center";
        };
        {
          TextView;
          layout_hright="-2";
          layout_width="-2";
          layout_margin="7dp";
          layout_gravity="center";
          textSize="18sp";
          textColor="0xFFCDCDCD";
          id="txta";
        };
      };
    };
  };
  local D=AlertDialog.Builder(this)
  D.setView(loadlayout(Loadin))
  D.setCancelable(false)
  Mo=D.show()
  txta.text=mo
  import "android.graphics.drawable.GradientDrawable"
  local radiu=10
  Mo.getWindow().setBackgroundDrawable(GradientDrawable().setCornerRadii({radiu,radiu,radiu,radiu,radiu,radiu,radiu,radiu}).setColor(0x00000000))
end

function nizar1(id,zpa)
  import "android.view.animation.LinearInterpolator"
  import "android.animation.ValueAnimator"
  import "android.animation.ObjectAnimator"
  Animation = ObjectAnimator()
  Animation.setTarget(id);
  Animation.setDuration(zpa);
  Animation.setRepeatCount(ValueAnimator.INFINITE)
  Animation.setPropertyName("rotation");
  Animation.setFloatValues({0,720});
  Animation.setRepeatMode(ValueAnimator.INFINITE)
  Animation.setInterpolator(LinearInterpolator() )
  Animation.start();
end
function nizar2(id,icon)
  id.setImageBitmap(loadbitmap(icon))
end




URLserver="https://defexgg.000webhostapp.com/"

function LoginFunction()
  logged=false
  local user,pass
  local pref = activity.getSharedPreferences("LieShooter", Context.MODE_PRIVATE);
  user = pref.getString("username", "");
  pass = pref.getString("password", "");
  txtUsername.text = user;
  txtPassword.text = pass;
  function LoginOnClick()
    local username = txtUsername.text
    local password = txtPassword.text
    import "android.provider.Settings$Secure"
    local uuid = Secure.getString(activity.getContentResolver(), Secure.ANDROID_ID)
    if !username || username == "" && !password || password == "" then
      Toast.makeText(activity, "Username and password is required.",Toast.LENGTH_SHORT).show()
     else
      nizar("Loading...",15,0x00000000)
      nizar2(mImageView,"iconn.png")
      nizar1(mImageView,2500)
      task(2500,function()
        Http.post(URLserver.."login.php","username="..username.."&password="..password.."&uuid="..uuid,nil,"utf8",nil,function(code,body,cookie,header)
          Mo.dismiss()
          if code == 200 then
            if body:match("Login success") then
              Toast.makeText(activity, "Login success.",Toast.LENGTH_SHORT).show()
              local pref = activity.getSharedPreferences("LieShooter", Context.MODE_PRIVATE)
              local save = pref.edit()
              save.putString("username", username)
              save.putString("password", password)
              save.commit()
              userlogged=body:match("Username=(.-);")
              explogged=body:match("Expired=(.-);")
              uuidlogged=body:match("UUID=(.-);")
              logged=true
              HomeFunction()
             elseif body:match("Username not registered") then
              Toast.makeText(activity, "Username not registered.",Toast.LENGTH_SHORT).show()
             elseif body:match("Password invalid") then
              Toast.makeText(activity, "Password invalid.",Toast.LENGTH_SHORT).show()
             elseif body:match("UUID invalid") then
              Toast.makeText(activity, "UUID not registered.",Toast.LENGTH_SHORT).show()
             elseif body:match("Username expired") then
              Toast.makeText(activity, "Account has expired.",Toast.LENGTH_SHORT).show()
            end
           else
            Toast.makeText(activity, "Can't connect to server.",Toast.LENGTH_SHORT).show()
          end
        end);
      end);
    end
  end
  if user == "" && pass == "" then
   else
    LoginOnClick()
  end
end

LoginFunction()

function HomeFunction()
  if logged then
    Layout1.addView(mWindow,WmHz2)
    CircleButton2(bbw,0xFF000000,0,0x66FF0000)
    CircleButton2(mmss,0xAB000000,0,0x66FF0000)
    CircleButton2(bww,0xFF000000,0,0x66FF0000)

    function TIMELEFT()
      tt=Ticker()
      tt.start()
      tt.onTick=function()
        now = Date().getTime()
        distance = explogged - now;
        days = Math.floor(distance / (1000 * 60 * 60 * 24))|0
        hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))|0
        minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))|0
        seconds = Math.floor((distance % (1000 * 60)) / 1000)|0
        if distance < 0 then
          tt.stop()
         else
          if days == 0 and hours == 0 and minutes == 0 then
            txtExpired.setText(seconds.."s ")
            txtExpire.setText(seconds.."s ")
           elseif days == 0 and hours == 0 then
            txtExpired.setText(minutes.."m "..seconds.."s ")
            txtExpire.setText(minutes.."m "..seconds.."s ")
           elseif days == 0 then
            txtExpired.setText(hours.."h "..minutes.."m "..seconds.."s ")
            txtExpire.setText(hours.."h "..minutes.."m "..seconds.."s ")
           else
            txtExpired.setText(days.."d "..hours.."h "..minutes.."m "..seconds.."s ")
            txtExpire.setText(days.."d "..hours.."h "..minutes.."m "..seconds.."s ")
          end
        end
      end
    end
    TIMELEFT()
   else
    os.exit()
  end
end

-----Menu-----------------------------------



os.execute("su")

if Build.VERSION.SDK_INT >= 21 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xff4285f4);
end
if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end

if Settings.canDrawOverlays(activity) then
 else
  intent=Intent("android.settings.action.MANAGE_OVERLAY_PERMISSION");
  intent.setData(Uri.parse("package:" .. this.getPackageName())); this.startActivity(intent);
end

import "menu"
Layout2=activity.getSystemService(Context.WINDOW_SERVICE)
isMax=false
WmHz=WindowManager.LayoutParams()
if Build.VERSION.SDK_INT >= 26 then WmHz.type =WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else WmHz.type =WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end
import "android.graphics.PixelFormat"
WmHz.format =PixelFormat.RGBA_8888
WmHz.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
WmHz.gravity = Gravity.LEFT| Gravity.TOP
WmHz.x = 333
WmHz.y = 333
WmHz.width = WindowManager.LayoutParams.WRAP_CONTENT
WmHz.height = WindowManager.LayoutParams.WRAP_CONTENT
bWindow = loadlayout(bigger)


Layout1=activity.getSystemService(Context.WINDOW_SERVICE)
isMax2=false
WmHz2=WindowManager.LayoutParams()
if Build.VERSION.SDK_INT >= 26 then WmHz2.type =WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else WmHz2.type =WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end
import "android.graphics.PixelFormat"
WmHz2.format =PixelFormat.RGBA_8888
WmHz2.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
WmHz2.gravity = Gravity.LEFT| Gravity.TOP
WmHz2.x = 333
WmHz2.y = 333
WmHz2.width = WindowManager.LayoutParams.WRAP_CONTENT
WmHz2.height = WindowManager.LayoutParams.WRAP_CONTENT
mWindow = loadlayout(mini)

isMax2=true

function mmw.OnTouchListener(v,event)
  if event.getAction()==MotionEvent.ACTION_DOWN then
    firstX=event.getRawX()
    firstY=event.getRawY()
    wmX=WmHz2.x
    wmY=WmHz2.y
   elseif event.getAction()==MotionEvent.ACTION_MOVE then
    WmHz2.x=wmX+(event.getRawX()-firstX)
    WmHz2.y=wmY+(event.getRawY()-firstY)
    Layout1.updateViewLayout(mWindow,WmHz2)
   elseif event.getAction()==MotionEvent.ACTION_UP then
  end return false
end

function bbw.OnTouchListener(v,event)
  if event.getAction()==MotionEvent.ACTION_DOWN then
    firstX=event.getRawX()
    firstY=event.getRawY()
    wmX=WmHz.x
    wmY=WmHz.y
   elseif event.getAction()==MotionEvent.ACTION_MOVE then
    WmHz.x=wmX+(event.getRawX()-firstX)
    WmHz.y=wmY+(event.getRawY()-firstY)
    Layout2.updateViewLayout(bWindow,WmHz)
   elseif event.getAction()==MotionEvent.ACTION_UP then
  end return true
end

function close.onClick(v)
  if isMax==false then
    isMax=true
    Layout1.removeView(mWindow)
    Layout2.addView(bWindow,WmHz)
   else
    isMax=false
    Layout2.removeView(bWindow)
    Layout1.addView(mWindow,WmHz2)
  end
end

function mmw.onClick(v)
  if isMax==false then
    isMax=true
    Layout1.removeView(mWindow)
    Layout2.addView(bWindow,WmHz)
   else
    isMax=false
    Layout2.removeView(bWindow)
    Layout1.addView(mWindow,WmHz2)
  end
end





menu1.onClick=function()
  pg.showPage(0)
end
menu2.onClick=function()
  pg.showPage(1)
end
menu3.onClick=function()
  pg.showPage(2)
end
menu4.onClick=function()
  pg.showPage(3)
end
menu5.onClick=function()
  pg.showPage(4)
end



function CircleButton(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({5, 5, 5, 5, 5, 5, 5, 5})
  drawable.setColor(InsideColor)
  drawable.setStroke(0, InsideColor)
  view.setBackgroundDrawable(drawable)
end

function CircleButton2(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({0, 0, 0, 0, 0, 0, 0, 0})
  drawable.setColor(InsideColor)
  drawable.setStroke(0, InsideColor)
  view.setBackgroundDrawable(drawable)
end

function exitMenu.onClick()
  os.exit()
end

import "android.graphics.Typeface"
text1.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/ttf/1.ttf")))
text2.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/ttf/1.ttf")))
txtExpired.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/ttf/1.ttf")))
txtExpire.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/ttf/1.ttf")))
text3.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/ttf/1.ttf")))
text4.setTypeface(Typeface.createFromFile(activity.getLuaDir("res/ttf/1.ttf")))


function colorGrey.onClick()
  if colorGrey.checked==true then
    CircleButton2(bbw,0xA6000000,0,0x66FF0000)
    CircleButton2(mmss,0x83000000,0,0x66FF0000)
  end
  if colorGrey.checked==false then
    CircleButton2(bbw,0xFF000000,0,0x66FF0000)
    CircleButton2(mmss,0xAB000000,0,0x66FF0000)
  end
end

function colorRed.onClick()
  if colorRed.checked==true then
    CircleButton2(bbw,0xA6FF523B,0,0x66FF0000)
    CircleButton2(mmss,0x83FF0000,0,0x66FF0000)
  end
  if colorRed.checked==false then
    CircleButton2(bbw,0xFF000000,0,0x66FF0000)
    CircleButton2(mmss,0xAB000000,0,0x66FF0000)
  end
end

function colorGreen.onClick()
  if colorGreen.checked==true then
    CircleButton2(bbw,0xDC00A575,0,0x66FF0000)
    CircleButton2(mmss,0xA333DD94,0,0xB92ADD94)
  end
  if colorGreen.checked==false then
    CircleButton2(bbw,0xFF000000,0,0x66FF0000)
    CircleButton2(mmss,0xAB000000,0,0x66FF0000)
  end
end

function animColor.onClick()
  if animColor.checked== true then
    view=bbw
    view2=mmss
    view3=assa
    color1 = 0x7CFF8080;
    color2 = 0x7C8080FF;
    color3 = 0x7C80ffff;
    color4 = 0x7C80ff80;
    color5 = 0xFF0000B1;
    color6 = 0xFF000000;

    import "android.animation.ObjectAnimator"
    import "android.animation.ArgbEvaluator"
    import "android.animation.ValueAnimator"
    import "android.graphics.Color"

    colorAnim1 = ObjectAnimator.ofInt(view,"backgroundColor",{color1, color2, color3,color4})
    colorAnim1.setDuration(3000)
    colorAnim1.setEvaluator(ArgbEvaluator())
    colorAnim1.setRepeatCount(ValueAnimator.INFINITE)
    colorAnim1.setRepeatMode(ValueAnimator.REVERSE)
    colorAnim1.start()

    colorAnim2 = ObjectAnimator.ofInt(view2,"backgroundColor",{color2, color3, color4,color1})
    colorAnim2.setDuration(3000)
    colorAnim2.setEvaluator(ArgbEvaluator())
    colorAnim2.setRepeatCount(ValueAnimator.INFINITE)
    colorAnim2.setRepeatMode(ValueAnimator.REVERSE)
    colorAnim2.start()

    colorAnim3 = ObjectAnimator.ofInt(view3,"backgroundColor",{color5, color6})
    colorAnim3.setDuration(3000)
    colorAnim3.setEvaluator(ArgbEvaluator())
    colorAnim3.setRepeatCount(ValueAnimator.INFINITE)
    colorAnim3.setRepeatMode(ValueAnimator.REVERSE)
    colorAnim3.start()
  end
  if animColor.checked==false then
    colorAnim1.pause()
    colorAnim2.pause()
    colorAnim3.pause()

    CircleButton2(bbw,0xFF000000,0,0x66FF0000)
    CircleButton2(mmss,0xAB000000,0,0x66FF0000)
  end
end


--------------------------Open-----------------

function ExecuteELF(file)
  if os.execute("su") then --Root execute
    path=activity.getLuaDir(file)
    os.execute("su -c chmod 777 "..path)
    if pcall(function()Runtime.getRuntime().exec("su -c "..path)end) then
     else
    end
   else
    path=activity.getLuaDir(file) --No Root execute
    os.execute("chmod 777 "..path)
    if pcall(function()Runtime.getRuntime().exec(""..path)end) then
     else
    end
  end
end


function Safe()
  os.execute("su -c rm -rf data/data/com.injector.lios/files/Files")
end


-----Hack-----------------------------------




import "zip4j"
import "java.util.zip.*"
import "java.io.*"

--------------ESP--------------



--------------PLAYER--------------

function fps.onClick()
  if fps.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/fps.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/fps/fps_on")
    Safe()
  end
  if fps.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/fps.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/fps/fps_off")
    Safe()
  end
end

function fps0.onClick()
  if fps0.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/fps_0.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/fps_0/fps_0")
    Safe()
  end
  if fps0.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/fps_0.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/fps_0/fps_off")
    Safe()
  end
end




function ipad.onClick()
  if ipad.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/ipad.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/ipad/ipad_on")

    Safe()
  end
  if ipad.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/ipad.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/ipad/ipad_off")
    Safe()
  end
end


function day.onClick()
  if day.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/day.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/day/day_on")
    Safe()
  end
  if day.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/day.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/day/day_off")
    Safe()
  end
end


function antena.onClick()
  if antena.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/antena.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/antena/antena_on")
    Safe()
  end
  if antena.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/antena.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/antena/antena_off")
    Safe()
  end
end

function white.onClick()
  if white.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/white_color.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/white_color/white_on")
    Safe()
  end
  if white.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/white_color.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/white_color/white_off")
    Safe()
  end
end

function night.onClick()
  if night.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/night.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/night/night")
    Safe()
  end
  if night.checked==false then

  end
end

function black.onClick()
  if black.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/black_color.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/black_color/black_on")
    Safe()
  end
  if black.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/black_color.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/black_color/black_off")
    Safe()
  end
end

function water.onClick()
  if water.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/water.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/water/water_on")
    Safe()
  end
  if water.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/water.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/water/water_off")
    Safe()
  end
end





function hide1.onClick()
  if hide1.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/hide1.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/hide1/hide1_on")
    Safe()
  end
  if hide1.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/hide1.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/hide1/hide1_off")
    Safe()
  end
end

function jump_s.onClick()
  if jump_s.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/jump_speed.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/jump_speed/jump_speed_on")
    Safe()
  end
  if jump_s.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/jump_speed.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/jump_speed/jump_speed_off")
    Safe()
  end
end



function build3.onClick()
  if build3.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/build3.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/build3/build3_on")
    Safe()
  end
  if build3.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/build3.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/build3/build3_off")
    Safe()
  end
end




function speed.onClick()
  if speed.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/speed.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/speed/speed_on")
    Safe()
  end
  if speed.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/speed.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/speed/speed_off")
    Safe()
  end
end

function antideath.onClick()
  if antideath.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/antideath.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/antideath/antideath_on")
    Safe()
  end
  if antideath.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/antideath.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/antideath/antideath_off")
    Safe()
  end
end



--------------WEAPON--------------






function akm_m762.onClick()
  if akm_m762.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/no_recoil/akm_m762")
    Safe()
  end
  if akm_m762.checked==false then

  end
end

function m4.onClick()
  if m4.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/no_recoil/m4")
    Safe()
  end
  if m4.checked==false then

  end
end

function qbz.onClick()
  if qbz.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/qbz")
    Safe()
  end
  if qbz.checked==false then

  end
end

function shotgun.onClick()
  if shotgun.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/no_recoil/shotgun")
    Safe()
  end
  if shotgun.checked==false then

  end
end

function smg.onClick()
  if smg.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/no_recoil/smg")
    Safe()
  end
  if smg.checked==false then

  end
end

function famas.onClick()
  if famas.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/no_recoil/famas")
    Safe()
  end
  if famas.checked==false then

  end
end

function uzi.onClick()
  if uzi.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/no_recoil.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/no_recoil/uzi")
    Safe()
  end
  if uzi.checked==false then

  end
end

function magic1.onClick()
  if magic1.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/magic.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/magic/magic_30")
    Safe()
  end
  if magic1.checked==false then

  end
end

function magic2.onClick()
  if magic2.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/magic.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/magic/magic_50")
    Safe()
  end
  if magic2.checked==false then

  end
end

function magic3.onClick()
  if magic3.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/magic.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/magic/magic_100")
    Safe()
  end
  if magic3.checked==false then

  end
end

function fpss.onClick()
  if fpss.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/fps2.zip"),
    activity.getLuaDir("Files/"),
    "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
    ExecuteELF("Files/fps2/fps")
    Safe()
  end
  if fpss.checked==false then

  end
end



function gm.onClick()
  if gm.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/gm.zip"),
    activity.getLuaDir("Files/"),
    "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
    ExecuteELF("Files/GM/gm")
    Safe()
  end
  if gm.checked==false then

  end
end

function reload.onClick()
  if reload.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/reload.zip"),
    activity.getLuaDir("Files/"),
    "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
    ExecuteELF("Files/reload/reload")
    Safe()
  end
  if reload.checked==false then

  end
end


function Man.onClick()
  zip4j.unZipDir(
  activity.getLuaDir("/cpp/sleep.zip"),
  activity.getLuaDir("Files/"),
  "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
  ExecuteELF("Files/sleep/man")
  Safe()
  set.backgroundColor="0xC07D8EFC";
end

function Woman.onClick()
  zip4j.unZipDir(
  activity.getLuaDir("/cpp/sleep.zip"),
  activity.getLuaDir("Files/"),
  "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
  ExecuteELF("Files/sleep/woman")
  Safe()
  set.backgroundColor="0xC07D8EFC";
end


function nomap.onClick()
  if nomap.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/nomap.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/nomap/llooiill1")
    ExecuteELF("Files/nomap/lkjhg+1")
    Safe()
  end
  if nomap.checked==false then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/nomap.zip"),
    activity.getLuaDir("Files/"),
    "txlchoirhddmmzlmjpaixyoifinvv4yvklvw")
    ExecuteELF("Files/nomap/llooiill2")
    ExecuteELF("Files/nomap/lkjhg+2")
    Safe()
  end
end


function scopex.onClick()
  if scopex.checked==true then
    zip4j.unZipDir(
    activity.getLuaDir("/cpp/10x.zip"),
    activity.getLuaDir("Files/"),
    "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
    ExecuteELF("Files/10x/RR_ON")
    Safe()
  end
  if scopex.checked==false then

  end
end

function droidfix.onClick()
  zip4j.unZipDir(
  activity.getLuaDir("/cpp/12droid.zip"),
  activity.getLuaDir("Files/"),
  "yki7wevwsaewng9sudwfgdcw1lfgci7p6ti")
  ExecuteELF("Files/12droid/fix.sh")
  Safe()
end

-------------------esp----------------------
import "zip4j"
import "java.util.zip.*"
import "java.io.*"


function 执行(二进制)
  if 检测权限==true then
    路径=activity.getLuaDir(二进制)
    os.execute("chmod 777 "..路径)
    os.execute("su -c chmod 777 "..路径)
    Runtime.getRuntime().exec("su -c "..路径)
   else
    路径=activity.getLuaDir(二进制)
    os.execute("chmod 777 "..路径)
    Runtime.getRuntime().exec(路径)
  end
end

function 执行功能(路径,循环)
  local 执行路径=activity.getLuaDir(路径)
  if os.execute("su")==true then
    import "su"
    su("chmod 777 "..执行路径)
    if 循环=="1" then
      function 线程执行(路径)
        require "import"
        import "su"
        su(路径)
      end
      thread(线程执行,执行路径)
     else
      su(执行路径)
    end
   else
    os.execute("chmod 777 "..执行路径)
    Runtime.getRuntime().exec(""..执行路径)
  end
end


function root执行(路径二,提示二)--中文函数
  调用路径二=activity.getLuaDir(路径二)--自动获取lua文件的执行路径,只需填二进制在插件的目录路径即可
  os.execute("su -c chmod 777 "..调用路径二)--授予777权限
  Runtime.getRuntime().exec("su -c "..调用路径二)--root执行二进制功能
  print(提示二)
end



os.execute("mkdir /sdcard/libUE4.so")
io.open("/sdcard/libUE4.so/dump","w"):write(""):close()

import "aide"--导入模板
import "aide/draw"

draw.ttf="res/2.ttf"--设置绘制字体

function 绘制.onClick() --监听开关按钮
  if 绘制.checked then
    os.execute("su")
    io.open("/sdcard/x","w"):write(屏幕高()):close()
    io.open("/sdcard/y","w"):write(屏幕宽()):close()
    io.open("/sdcard/a","w"):write(""):close()
    os.remove("/sdcard/stop")
    绘制开关=true
    root执行("jvav/draw")
    MD提示("开启成功","#0081FF","#ffffff","0","20")
   else
    绘制开关=false
    io.open("/sdcard/stop","w"):write(""):close()
    MD提示("关闭成功","#0081FF","#ffffff","0","20")
  end
end

os.execute("mkdir /sdcard/libUE4.so")
io.open("/sdcard/libUE4.so/dump","w"):write(""):close()

import "aide"--导入模板
import "aide/draw"

draw.ttf="res/2.ttf"--设置绘制字体

function 绘制2.onClick() --监听开关按钮
  if 绘制2.checked then
    os.execute("su")
    io.open("/sdcard/x","w"):write(屏幕高()):close()
    io.open("/sdcard/y","w"):write(屏幕宽()):close()
    io.open("/sdcard/a","w"):write(""):close()
    os.remove("/sdcard/stop")
    绘制开关=true
    root执行("jvav/draw1")
    MD提示("开启成功","#0081FF","#ffffff","0","20")
   else
    绘制开关=false
    io.open("/sdcard/stop","w"):write(""):close()
    MD提示("关闭成功","#0081FF","#ffffff","0","20")
  end
end




function 方框.onClick
  if 方框.checked==true then
    绘制方框=true
    MD提示("方框开启", "#0081FF", "#ffffffff", "0", "20")
   else
    绘制方框=
    方框.setChecked(false)
    MD提示("方框关闭","#0081FF","#ffffff","0","20")
  end
end

function 射线.onClick
  if 射线.checked==true then
    绘制射线=true
    MD提示("射线开启", "#0081FF", "#ffffffff", "0", "20")
   else
    绘制射线=false
    射线.setChecked(false)
    MD提示("射线关闭","#0081FF","#ffffff","0","20")
  end
end


function 信息.onClick
  if 信息.checked==true then
    绘制信息=true
    MD提示("信息开启", "#0081FF", "#ffffffff", "0", "20")
   else
    绘制信息=false
    信息.setChecked(false)
    MD提示("信息关闭","#0081FF","#ffffff","0","20")
  end
end


function 背敌.onClick
  if 背敌.checked==true then
    绘制背敌=true
    MD提示("背敌开启", "#0081FF", "#ffffffff", "0", "20")
   else
    绘制背敌=false
    背敌.setChecked(false)
    MD提示("背敌关闭","#0081FF","#ffffff","0","20")
  end
end


import "java.io.*"
file,err=io.open("/sdcard/hztz")
if err~=nil then
  io.open("/sdcard/hztz","w"):write("0"):close()
end

local file=io.input("/sdcard/hztz")
local str=io.read("*a")
io.close()
X轴纠正=tonumber(str)

X轴纠正=0
调整度.Max=100
调整度.min=-100
调整度.setOnSeekBarChangeListener
{
  onProgressChanged=function()
    调整值.Text=tostring(调整度.Progress)
    X轴纠正=tonumber(调整度.Progress)
    io.open("/sdcard/hztz","w"):write(X轴纠正):close()
  end
}
