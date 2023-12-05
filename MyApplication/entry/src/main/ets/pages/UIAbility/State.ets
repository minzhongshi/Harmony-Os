// @ts-nocheck
import router from '@ohos.router';

let msg: string = 'Index页面传来的数据'

@Entry
@Component
struct State {
  @State message: string = 'State Page'
  @State src: string = ''

  onPageShow(){
    this.src = (router.getParams() as Record<string, string>)?.['src']
  }

  build() {
    Row() {
      Column() {
       Text(this.message)
       Text(this.src)
        Blank()
        Button('Next')
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/UIAbility/Second',
              params:{
                src: msg
              }
            },router.RouterMode.Single)
          })
      }
      .width('100%').height(140)
    }
    .height('100%').backgroundColor(0xF1F3F5)
  }
}