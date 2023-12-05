import {TaskItem} from './TaskItem'
//任务类
@Observed
export class Task {
  static id: number = 1

  //任务名称
  name: string = `任务${Task.id++}`

  //任务状态
  finished: boolean = false
}



@Component
export struct TaskList {
  // 总任务数量
  @Link totalTask: number
  // 已完成任务数量
  @Link finishTask: number
  // 任务数组
  @State tasks: Task[] = []

  handleTaskChange(){
    // 更新任务总量
    this.totalTask = this.tasks.length

    // 更新任务数量
    this.finishTask = this.tasks.filter(item => item.finished).length

  }
  // 自定义组件生命周期
  aboutToAppear(){
    // 创建实例后，运行build()前
    // UI数据初始化或申请定时器资源等操作
  }
  aboutToDisappear(){
    // 实例销毁时
    // 销毁不用的资源
  }

  build() {
    Column(){
      Button('新增任务')
        .width(200)
        .onClick(()=>{
          this.tasks.push(new Task())
          this.handleTaskChange()
        })

      List({space: 10}){
        // 3. 任务列表
        ForEach(
          this.tasks,
          (item: Task, index) => {
            ListItem(){
              TaskItem({item:item, onTaskChange: this.handleTaskChange.bind(this)})
            }
            .swipeAction({end: this.DeleteButton(index)})
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
      .alignListItem(ListItemAlign.Center)
    }
  }

  @Builder DeleteButton(index: number){
    Button(){
      Image($r('app.media.ic_public_delete_filled'))
        .fillColor(Color.White)
        .width(20)
    }
    .width(40)
    .height(40)
    .type(ButtonType.Circle)
    .backgroundColor(Color.Red)
    .margin(5)
    .onClick(()=>{
      this.tasks.splice(index, 1)
      this.handleTaskChange()
    })
  }
}
