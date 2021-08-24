# simple_sqflite
## simple_sqflite能做什么
`simple_sqflite` 是一个对插件sqflite进行主要简化封装

可使用单条增、删、改、查、多条事务提交功能

本插件在原有sqflite基础上进行封装省去手写创建db文件，关闭流等操作、只需手写sql调用函数即可

> 如有反馈请加qq：2096099156    wx：WX2096099156

## 能力

- 手机上创建本地数据库，提供单条增、删、改、查、多条事务提交功能.

## 准备

#### Android

使用本插件需要修改一些配置，以便您正常运行

android/build.gradle

```gradle
minSdkVersion 26    // 版本目前26为稳定版本
```

## 安装

使用安装依赖命令：

```shell
flutter pub add simple_sqflite
```

在`pubspec.yaml` 文件中添加local_automatic_album依赖:

```yaml
dependencies:
  simple_sqflite: ^0.0.1
```
## 使用

```dart
// 创建实例
SimpleSqflite sqflite = new SimpleSqflite();

// 修改数据库DB文件名称 无返回值
sqflite.editDBPath('test');

// 传入sql语句并单独执行这一条语句
// 成功：操作成功
// 失败：操作失败 打印报错
var createMessage = 
    await sqflite
    .RunSQL('CREATE TABLE Config(idvarchar2(255),value varchar2(100));');

// 传入sql语句并单独执行这一条插入语句
// 成功：插入成功
// 失败：插入失败 打印报错
var insertMessage = 
    await sqflite
    .RunInsert("INSERT INTO Config (id,value) values('1','2');");

// 传入sql语句并单独执行这一条搜索语句
// 成功：查询数据
// 失败：返回空 打印报错
var selectMessage = 
    await sqflite
    .RunSelect("SELECT * FROM Config");

// 传入sql语句并单独执行这一条修改语句
// 成功：修改成功
// 失败：修改失败 打印报错
var updateMessage = 
    await sqflite
    .RunUpdate("UPDATE Config SET id = '2'");

//  传入sql语句并单独执行这一条删除语句
//  成功：删除成功
//  失败：删除失败 打印报错
var deleteMessage = 
    await sqflite
    .RunDelete("DELETE FROM Config");

// 传入sql语句并单独执行这一条修改语句
// 成功：修改成功
// 失败：修改失败 打印报错
List<String> sql = [];
sql.add("INSERT INTO Config (id,value) values('3','4');");
sql.add("INSERT INTO Config (id,value) values('5','6');");
var message = await sqflite.RunBatch(sql);

```

## 依赖

本插件依赖于:

[sqflite](https://pub.flutter-io.cn/packages/sqflite)、[path](https://pub.flutter-io.cn/packages/path)

## QA

本人为开发插件新手，如有考虑不周或者代码上问题，欢迎您提问以及指教

如果能帮得上您，请您传播本插件，您的支持是我继续写下去的动力

qq：2096099156

wx：WX2096099156

## 作者
本人是一个将他人插件上复杂代码框架进行整理封装成某一功能的大学生（代码整理搬运工0.0）

感谢您的支持！

宣传一下作者其他插件：

[local_automatic_album](https://pub.flutter-io.cn/packages/local_automatic_album)

## LICENSE

    Copyright 2018 OpenFlutter Project
    
    Licensed to the Apache Software Foundation (ASF) under one or more contributor
    license agreements.  See the NOTICE file distributed with this work for
    additional information regarding copyright ownership.  The ASF licenses this
    file to you under the Apache License, Version 2.0 (the "License"); you may not
    use this file except in compliance with the License.  You may obtain a copy of
    the License at
    
    http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
    License for the specific language governing permissions and limitations under
    the License.





