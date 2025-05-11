((a,b,c)=>{a[b]=a[b]||{}
a[b][c]=a[b][c]||[]
a[b][c].push({p:"main.dart.js_6",e:"beginPart"})})(self,"$__dart_deferred_initializers__","eventLog")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,A={
aan(d,e,f){var y,x,w=null,v=new B.dG(),u=new B.dG()
u=new A.Cg(v,u)
u.jU(d,w,e,w)
y=u.a
x=v.r
x.toString
y.r=x
v.r=A.amu(u)
return u},
amp(d,e){switch(e){case"meta.locale":return"zh"
case"meta.description":return"\u6708\u7403\u7740\u9646\u5668\u6e38\u620f\u7b80\u4f53\u4e2d\u6587\u7ffb\u8bd1"
case"game.initializing":return"\u521d\u59cb\u5316\u4e2d..."
case"game.welcome":return new A.a1j()
case"game.permissionDenied":return"\u65e0\u9ea6\u514b\u98ce\u6743\u9650\u3002\n\u70b9\u51fb\u91cd\u8bd5"
case"game.recorderError":return"\u9ea6\u514b\u98ce\u9519\u8bef\u3002\n\u70b9\u51fb\u91cd\u8bd5"
case"game.audioError":return"\u97f3\u9891\u6545\u969c\u3002\n\u70b9\u51fb\u91cd\u8bd5"
case"game.retryingAudioSetup":return"\u91cd\u8bd5\u97f3\u9891\u8bbe\u7f6e..."
case"game.allLevelsCleared":return"\ud83c\udf89 \u4f60\u8d62\u4e86\uff01\ud83c\udf89\n\u70b9\u51fb\u91cd\u65b0\u5f00\u59cb"
case"game.crashedOnLevel":return new A.a1k()
case"game.levelCleared":return new A.a1l()
case"hud.fuel":return new A.a1w()
case"hud.vSpeed":return new A.a1H()
case"hud.level":return new A.a1R()
case"hud.micVolume":return new A.a1S()
case"hud.threshold":return new A.a1T()
default:return null}},
amu(d){return new A.a1X(d)},
Cg:function Cg(d,e){var _=this
_.f=d
_.y=_.x=_.r=$
_.a=e
_.e=_.d=_.b=$},
a0z:function a0z(){},
a0E:function a0E(){},
a1X:function a1X(d){this.a=d},
a1j:function a1j(){},
a1k:function a1k(){},
a1l:function a1l(){},
a1w:function a1w(){},
a1H:function a1H(){},
a1R:function a1R(){},
a1S:function a1S(){},
a1T:function a1T(){}}
B=c[0]
A=a.updateHolder(c[7],A)
A.Cg.prototype={
gDb(){var y=this.r
if(y===$){y!==$&&B.W()
y=this.r=this}return y},
gbR(){var y=this,x=y.x
if(x===$){y.gDb()
y.x!==$&&B.W()
x=y.x=new A.a0z()}return x},
gfH(){var y=this,x=y.y
if(x===$){y.gDb()
y.y!==$&&B.W()
x=y.y=new A.a0E()}return x},
gjG(){return this.f}}
A.a0z.prototype={
gjg(){return"\u521d\u59cb\u5316\u4e2d..."},
is(d){return"\u8bf4 AAA \u7136\u540e\u8d77\u98de\uff01\n"+d+" \u4e2a\u7ea7\u522b\uff01\n(\u70b9\u51fb\u5f00\u59cb)"},
gik(){return"\u65e0\u9ea6\u514b\u98ce\u6743\u9650\u3002\n\u70b9\u51fb\u91cd\u8bd5"},
ghu(){return"\u9ea6\u514b\u98ce\u9519\u8bef\u3002\n\u70b9\u51fb\u91cd\u8bd5"},
gks(){return"\u97f3\u9891\u6545\u969c\u3002\n\u70b9\u51fb\u91cd\u8bd5"},
glp(){return"\u91cd\u8bd5\u97f3\u9891\u8bbe\u7f6e..."},
gkn(){return"\ud83c\udf89 \u4f60\u8d62\u4e86\uff01\ud83c\udf89\n\u70b9\u51fb\u91cd\u65b0\u5f00\u59cb"},
kD(d){return"\u7830\uff01\u7b2c "+d+" \u5173\uff01\n\u70b9\u51fb\u91cd\u8bd5"},
l_(d,e){return"\u7b2c "+d+" \u5173\u5b8c\u6210\uff01\n\u70b9\u51fb\u8fdb\u5165\u7b2c "+e+" \u5173"}}
A.a0E.prototype={
kT(d){return"\u71c3\u6599: "+d},
lv(d){return"\u5782\u76f4\u901f\u5ea6: "+d},
kZ(d){return"\u7ea7\u522b: "+d},
l5(d){return"\u9ea6\u514b\u98ce\u97f3\u91cf: "+d},
lq(d){return"\u9608\u503c: "+d}}
var z=a.updateTypes([])
A.a1X.prototype={
$1(d){return A.amp(this.a,d)},
$S:25}
A.a1j.prototype={
$1$maxLevels(d){return"\u8bf4 AAA \u7136\u540e\u8d77\u98de\uff01\n"+B.i(d)+" \u4e2a\u7ea7\u522b\uff01\n(\u70b9\u51fb\u5f00\u59cb)"},
$S:36}
A.a1k.prototype={
$1$level(d){return"\u7830\uff01\u7b2c "+B.i(d)+" \u5173\uff01\n\u70b9\u51fb\u91cd\u8bd5"},
$S:37}
A.a1l.prototype={
$2$currentLevel$nextLevel(d,e){return"\u7b2c "+B.i(d)+" \u5173\u5b8c\u6210\uff01\n\u70b9\u51fb\u8fdb\u5165\u7b2c "+B.i(e)+" \u5173"},
$S:33}
A.a1w.prototype={
$1$value(d){return"\u71c3\u6599: "+B.i(d)},
$S:5}
A.a1H.prototype={
$1$value(d){return"\u5782\u76f4\u901f\u5ea6: "+B.i(d)},
$S:5}
A.a1R.prototype={
$1$value(d){return"\u7ea7\u522b: "+B.i(d)},
$S:5}
A.a1S.prototype={
$1$value(d){return"\u9ea6\u514b\u98ce\u97f3\u91cf: "+B.i(d)},
$S:5}
A.a1T.prototype={
$1$value(d){return"\u9608\u503c: "+B.i(d)},
$S:5};(function inheritance(){var y=a.inherit,x=a.inheritMany
y(A.Cg,B.bT)
y(A.a0z,B.je)
y(A.a0E,B.jf)
x(B.dR,[A.a1X,A.a1j,A.a1k,A.a1l,A.a1w,A.a1H,A.a1R,A.a1S,A.a1T])})()
B.vN(b.typeUniverse,JSON.parse('{"Cg":{"bT":[],"dc":["cd","bT"]}}'))};
((a,b)=>{a[b]=a.current
a.eventLog.push({p:"main.dart.js_6",e:"endPart",h:b})})($__dart_deferred_initializers__,"WCCpv50cdXTlYuwVlM/CtKDEZ7I=");