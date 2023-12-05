@Entry
@Component
struct ImagePage {
  @State imageWidth: number = 150
  build() {
      Column() {
        Row() {
          Image($r('app.media.icon'))
            .width(this.imageWidth)
            .interpolation(ImageInterpolation.High)
        }
        .width('100%')
        .height(400)
        .justifyContent(FlexAlign.Center)

        Column(){
          Row() {
            Text($r('app.string.width_label'))
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
            TextInput({placeholder: '请输入图片宽度',text: this.imageWidth.toString()})
              .width(150)
              .backgroundColor('#FFF')
              .type(InputType.Number)
              .onChange((value)=>{
                if (value) {
                  this.imageWidth = parseInt(value)
                }
              })
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({left: 14, right: 14})

          Divider()
            .width('91%')
            .height(3)
            .margin({top:20})
        }
        Row() {
            Button('缩小')
              .width(80)
              .fontSize(20)
              .type(ButtonType.Capsule)
              .onClick(()=>{
                if (this.imageWidth >=10) {
                  this.imageWidth -= 10
                }
              })
            Button('放大')
              .width(80)
              .fontSize(20)
              .onClick(()=>{
                if (this.imageWidth <=300) {
                  this.imageWidth += 10
                }
              })
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({top:35, bottom:35})

        Row(){
          Slider({
            min: 100,
            max: 300,
            value: this.imageWidth,
            step: 10
          })
            .width('90%')
            .blockColor('#36D')
            .trackThickness(7)
            .showTips(true)
            .onChange((value)=>{
              this.imageWidth = value
            })
        }
      }
      .width('100%')
    .height('100%')
  }
}