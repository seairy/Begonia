Administrator.create!(account: 'admin', password: '123456', password_confirmation: '123456', name: '管理员', available: true)
Vehicle.create!([
  { name: '福特 F150', visible: true },
  { name: '丰田 坦途', visible: true },
  { name: '丰田 霸道', visible: true },
  { name: '奔驰 凌特', visible: true }
  ])
Angle.create!([
  { vehicle: Vehicle.first, name: '车辆外观' },
  { vehicle: Vehicle.first, name: '车辆内饰' },
  { vehicle: Vehicle.first, name: '车顶装备' },
  { vehicle: Vehicle.first, name: '车后装备' }
  ])
Category.create!([
  { angle: Angle.first, name: '车顶摄像头' },
  { angle: Angle.first, name: '天线' }
  ])
Equipment.create!([
  { category: Category.first, name: '腾威 - 模拟夜视高速云台摄像机YH3020' },
  { category: Category.first, name: '腾威 - 高清夜视高速云台摄像机HDH3020' },
  { category: Category.second, name: '亚安 - 双偏置天线' },
  { category: Category.second, name: '亚安 - 高束天线' },
  ])