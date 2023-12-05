// 统一的卡片样式
@Styles function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius:6, color: '#1D000000', offsetX:2, offsetY: 4})
}

import {TaskStatistics} from '../components/TaskStatistics'
import {TaskList} from '../components/TaskList'


@Entry
@Component
struct PropPage {
  // 总任务数量
  @State totalTask: number = 0
  // 已完成任务数量
  @State finishTask: number = 0


  build() {
    Column({space: 10}){
      // 1.任务进度卡片
      TaskStatistics({totalTask:this.totalTask, finishTask: this.finishTask})

      // 2. 新增任务卡片
      TaskList({totalTask:$totalTask, finishTask: $finishTask})
    }
    .height('100%')
      .width('100%')
      .backgroundColor('#F1F2F3')
  }

}