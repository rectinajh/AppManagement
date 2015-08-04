# AppManagement

1.UIView的常见属性和方法

	* 纯代码方式实现九宫格的步骤：
	* 1，明确每一块用的是什么view
	* 2，每个view之间的父子关系
	* 3，加载app数据，根据数据长度创建对应个数的格子
	* 4，加载格子内部的子控件
	* 5，给格子内部的自空间装配数据
	* 6，九宫格计算方法
	* 7，先尝试逐个添加格子，最后使用for循环添加

2.字典转模型

	copy : NSString 
	strong : 一般对象
	weak : UI控件
	assign : 基本数据类型

	* 什么是模型
	其实就是数据模型，专门用来存放数据的对象，用它来表示数据更加专业。
	
	* 好处分析
	设置数据和取出数据都使用“字符串类型的key”，👋敲打这些key，编译器不会有任何友善的提示，容易造成设错或者取错数据。
	
	模型设置数据和取出数据都是通过它的属性，如果写错了，编译器会报错，保证数据的正确性。
	
	* 将字典转换为模型
	字典转模型，最好封装到内部。
	
	id 与 instancetype的区别？
	ios7以后，app建议用instancetype
	id：可以作为参数，可以表示任何对象类型，不知道返回值的类型
	instanceType:万能指针的意思，只能用在返回值类型，不能像id一样用在参数类型，编译器会检测真实类型。
	
	* 模型提供字典转模型的构造方法
	先加载plist，然后将字典转化成模型。

3.使用xib文件

	* 用来描述九宫格
	* 用来描述中间的提示信息
	
	加载xib文件
	NSArray *objs = [bundle loadNibNamed:@"JHAppView" owner:nil options:nil];
	
	
	
	

4.自定义view（封装）

	1，新建一个继承UIView的自定义view，类名叫JHAppView
	2，新建一个JHAppView.xib文件来描述JHAppView内部结构
	3，修改UIView的类型为JHAppView的类型
	4，将内部的子控件跟JHAppView进行属性连线
	5，MJAppView提供一个模型属性
	6，重写模型属性的set方法，因为set方法中可以拿到外界传递的模型数据
	7，把模型数据拆开，分别设置数据到对应的子控件中
	8，提供创建JHAppView的类方法，将读取xib文件的代码隐藏起来
	
	* 纯代码的封装
	* xib的封装

5，简单MVC

Model:				数据模型：			JHApp
View:				视图界面:				JHAppView
Controller:			控制器:				JHViewController


