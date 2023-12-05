import {Task} from './TaskList'

// 任务完成样式
@Extend(Text) function finishedTask(){
  .decoration({type:TextDecorationType.LineThrough})
  .fontColor('#B1B2B1')
}
// 统一的卡片样式
@Styles function card(){
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
  .shadow({radius:6, color: '#1D000000', offsetX:2, offsetY: 4})
}


@Component
export struct TaskItem {
  @ObjectLink item: Task
  onTaskChange: () =>void

  build(){
    Row(){
      if (this.item.finished){
        Text(this.item.name)
          .finishedTask()
      }else{
        Text(this.item.name)
      }
      Checkbox()
        .select(this.item.finished)
        .onChange((val)=>{
          // 更新任务状态
          this.item.finished = val
          // 更新任务长度
          this.onTaskChange()
        })
    }
    .card()
    .justifyContent(FlexAlign.SpaceBetween)
  }

}