import router from '@ohos.router';

@Entry
@Component
struct Second {
  @State message: string = 'Second Page'
  @State src: string = (router.getParams() as Record<string, string>)?.['src'];

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.src)
        Blank()
        Button('Back')
          .onClick(()=>{
            router.showAlertBeforeBackPage({
              message: '确定要返回？'
            })
            // router.hideAlertBeforeBackPage()

            router.back({
              url: 'pages/UIAbility/State',
              params:{
                src: 'Second页面传来的数据'
              }
            })
          })
      }
      .width('100%').height(140)
    }
    .height('100%').backgroundColor(0xF1F3F5)
  }
}