((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_1",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aaj(d,e,f){var y,x,w=null,v=new B.dG(),u=new B.dG()
u=new A.Cc(v,u)
u.jU(d,w,e,w)
y=u.a
x=v.r
x.toString
y.r=x
v.r=A.amy(u)
return u},
amt(d,e){switch(e){case"meta.locale":return"cn"
case"meta.description":return"\u6708\u7403\u7740\u9646\u5668\u6e38\u620f\u7b80\u4f53\u4e2d\u6587\u7ffb\u8bd1"
case"game.initializing":return"\u521d\u59cb\u5316\u4e2d..."
case"game.welcome":return new A.a1J()
case"game.permissionDenied":return"\u65e0\u9ea6\u514b\u98ce\u6743\u9650\u3002\n\u70b9\u51fb\u91cd\u8bd5"
case"game.recorderError":return"\u9ea6\u514b\u98ce\u9519\u8bef\u3002\n\u70b9\u51fb\u91cd\u8bd5"
case"game.audioError":return"\u97f3\u9891\u6545\u969c\u3002\n\u70b9\u51fb\u91cd\u8bd5"
case"game.retryingAudioSetup":return"\u91cd\u8bd5\u97f3\u9891\u8bbe\u7f6e..."
case"game.allLevelsCleared":return"\ud83c\udf89 \u4f60\u8d62\u4e86\uff01\ud83c\udf89\n\u70b9\u51fb\u91cd\u65b0\u5f00\u59cb"
case"game.crashedOnLevel":return new A.a1K()
case"game.levelCleared":return new A.a1L()
case"hud.fuel":return new A.a1M()
case"hud.vSpeed":return new A.a1N()
case"hud.level":return new A.a1O()
case"hud.micVolume":return new A.a1P()
case"hud.threshold":return new A.a1Q()
default:return null}},
amy(d){return new A.a20(d)},
Cc:function Cc(d,e){var _=this
_.f=d
_.y=_.x=_.r=$
_.a=e
_.e=_.d=_.b=$},
a0v:function a0v(){},
a0A:function a0A(){},
a20:function a20(d){this.a=d},
a1J:function a1J(){},
a1K:function a1K(){},
a1L:function a1L(){},
a1M:function a1M(){},
a1N:function a1N(){},
a1O:function a1O(){},
a1P:function a1P(){},
a1Q:function a1Q(){}}
B=c[0]
A=a.updateHolder(c[3],A)
A.Cc.prototype={
gD6(){var y=this.r
if(y===$){y!==$&&B.W()
y=this.r=this}return y},
gbR(){var y=this,x=y.x
if(x===$){y.gD6()
y.x!==$&&B.W()
x=y.x=new A.a0v()}return x},
gfH(){var y=this,x=y.y
if(x===$){y.gD6()
y.y!==$&&B.W()
x=y.y=new A.a0A()}return x},
gjG(){return this.f}}
A.a0v.prototype={
gjg(){return"\u521d\u59cb\u5316\u4e2d..."},
is(d){return"\u8bf4 AAA \u7136\u540e\u8d77\u98de\uff01\n"+d+" \u4e2a\u7ea7\u522b\uff01\n(\u70b9\u51fb\u5f00\u59cb)"},
gik(){return"\u65e0\u9ea6\u514b\u98ce\u6743\u9650\u3002\n\u70b9\u51fb\u91cd\u8bd5"},
ghu(){return"\u9ea6\u514b\u98ce\u9519\u8bef\u3002\n\u70b9\u51fb\u91cd\u8bd5"},
gks(){return"\u97f3\u9891\u6545\u969c\u3002\n\u70b9\u51fb\u91cd\u8bd5"},
glp(){return"\u91cd\u8bd5\u97f3\u9891\u8bbe\u7f6e..."},
gkn(){return"\ud83c\udf89 \u4f60\u8d62\u4e86\uff01\ud83c\udf89\n\u70b9\u51fb\u91cd\u65b0\u5f00\u59cb"},
kD(d){return"\u7830\uff01\u7b2c "+d+" \u5173\uff01\n\u70b9\u51fb\u91cd\u8bd5"},
l_(d,e){return"\u7b2c "+d+" \u5173\u5b8c\u6210\uff01\n\u70b9\u51fb\u8fdb\u5165\u7b2c "+e+" \u5173"}}
A.a0A.prototype={
kT(d){return"\u71c3\u6599: "+d},
lv(d){return"\u5782\u76f4\u901f\u5ea6: "+d},
kZ(d){return"\u7ea7\u522b: "+d},
l5(d){return"\u9ea6\u514b\u98ce\u97f3\u91cf: "+d},
lq(d){return"\u9608\u503c: "+d}}
var z=a.updateTypes([])
A.a20.prototype={
$1(d){return A.amt(this.a,d)},
$S:25}
A.a1J.prototype={
$1$maxLevels(d){return"\u8bf4 AAA \u7136\u540e\u8d77\u98de\uff01\n"+B.i(d)+" \u4e2a\u7ea7\u522b\uff01\n(\u70b9\u51fb\u5f00\u59cb)"},
$S:36}
A.a1K.prototype={
$1$level(d){return"\u7830\uff01\u7b2c "+B.i(d)+" \u5173\uff01\n\u70b9\u51fb\u91cd\u8bd5"},
$S:37}
A.a1L.prototype={
$2$currentLevel$nextLevel(d,e){return"\u7b2c "+B.i(d)+" \u5173\u5b8c\u6210\uff01\n\u70b9\u51fb\u8fdb\u5165\u7b2c "+B.i(e)+" \u5173"},
$S:33}
A.a1M.prototype={
$1$value(d){return"\u71c3\u6599: "+B.i(d)},
$S:5}
A.a1N.prototype={
$1$value(d){return"\u5782\u76f4\u901f\u5ea6: "+B.i(d)},
$S:5}
A.a1O.prototype={
$1$value(d){return"\u7ea7\u522b: "+B.i(d)},
$S:5}
A.a1P.prototype={
$1$value(d){return"\u9ea6\u514b\u98ce\u97f3\u91cf: "+B.i(d)},
$S:5}
A.a1Q.prototype={
$1$value(d){return"\u9608\u503c: "+B.i(d)},
$S:5};(function inheritance(){var y=a.inherit,x=a.inheritMany
y(A.Cc,B.bT)
y(A.a0v,B.je)
y(A.a0A,B.jf)
x(B.dR,[A.a20,A.a1J,A.a1K,A.a1L,A.a1M,A.a1N,A.a1O,A.a1P,A.a1Q])})()
B.vN(b.typeUniverse,JSON.parse('{"Cc":{"bT":[],"dc":["cd","bT"]}}'))};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_1",e:"endPart",h:b})})($__dart_deferred_initializers__,"dFZ6zkIiSSpLtxNcbiuzQv5qHoM=");