Orbital Mechanics
=================

所有代码均摘自*Orbital mechanics for engineering students. Howard D. Curtis.（轨道力学. [美]Howard D. Curtis. 科学出版社. 2009）*的附录。
其中xxxx.m为算法，Example_x_xx.m为算法的具体算例。使用时请注意保持所有文件均位于同一目录内。

下面是算法的具体功能：

| 算法名称      |    功能               | 
| :--------:    | :-----:               |
| kepler_E.m    | 使用牛顿法求解椭圆轨道的开普勒方程:E - e*sin(E) = M         |  
| kepler_H.m    | 使用牛顿法求解双曲线轨道的开普勒方程:e*sinh(F) - F = M      |
| stumpS.m |斯达姆夫函数S(z)|
| stumpC.m |斯达姆夫函数C(z)|
| kepler_U.m |使用牛顿法解全局变量的开普勒方程|
| f_and_g.m |计算全局变量下的拉格朗日系数f,g|
| fDot_and_gDot.m |计算全局变量下的拉格朗日系数f',g'(fdot,gdot)|
| ra_and_dec_from_r.m |已知位置矢量，求解地心赤道坐标系下的赤经和赤纬|
| coe_from_sv.m |已知状态矢量(位置矢量R,速度矢量V)，求解六个轨道根数
| atan2d_0_360.m |计算y/x的arc tan值|
| dcm_to_euler.m ||
| dcm_to_ypr.m||
| sv_from_coe.m| 已知六个轨道根数，求解状态矢量(位置矢量R,速度矢量V)|
| ground_track.m |画出地球卫星的星下点轨迹|
| gibbs.m |运用吉伯斯法确定初始轨道|
| lambert.m |兰伯特问题的求解|
| J0.m |计算儒略日|
| LST.m| 计算当地恒星时|
| rv_from_observe.m |观测法确定状态矢量|
| gauss.m| 高斯法确定初始轨道|
| integrate_thrust.m||
| rkf45.m| 四阶、五阶龙格库塔方法|
| rv_from_r0v0.m| 由初始状态矢量和时间计算现在的状态矢量|
| rva_relative.m |两航天器相对运动的位置、速度、加速度矢量|
| planet_elements_and_sv.m |计算任意时间行星的状态|
| month_planet_names.m |根据输入数字返回月份、行星名称|
| interplanetary.m |根据出发、到达时间确定行星际转移轨道|
| dcm_from_q.m ||
| q_from_dcm.m||
