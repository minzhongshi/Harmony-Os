interface obj {
  a: string,
  b: string
}

@Entry
@Component
struct StatePage {
  @State message: obj = {a:'1',b:'2'}
  build() {
    Row() {
      Column() {
        Text(this.message.a)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            this.message.a = 'SMZ'
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}