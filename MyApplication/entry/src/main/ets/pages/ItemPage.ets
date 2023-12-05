interface Item {
  name: string,
  img: ResourceStr,
  price: number,
  discount?: number
}

import {Header} from '../components/Header'

// @Builder function ItemCard(item: Item){
//   Row({space: 10}){
//     Image(item.img)
//       .width(80)
//     Column(){
//       Text(item.name)
//         .fontSize(20)
//         .fontWeight(FontWeight.Bold)
//         .height(30)
//       if (item.discount){
//         Row(){
//           Text('原价：￥')
//             .fontSize(14)
//             .fontColor('#CCC')
//             .decoration({type: TextDecorationType.LineThrough})
//           Text(item.price.toString())
//             .fontSize(14)
//             .fontColor('#CCC')
//             .decoration({type: TextDecorationType.LineThrough})
//         }
//         Text('折扣价：￥' + (item.price - item.discount))
//           .fontColor('#F36')
//         Text('补贴：￥' + item.discount)
//           .fontColor('#F36')
//
//       }else{
//         Row(){
//           Text('￥')
//             .fontSize(19)
//             .fontWeight(250)
//           Text(item.price.toString())
//             .margin({left:5})
//             .fontSize(19)
//         }
//         .colorBlend('red')
//       }
//     }
//     .height('100%')
//     .margin({left:20})
//     .alignItems(HorizontalAlign.Start)
//   }
//   .width('100%')
//   .height('120')
//   .padding(10)
//   .borderRadius(20)
//   .backgroundColor('#fff')
// }

// 全局样式
// @Styles function fillScreen() {
//   .width('100%')
//   .height('100%')
//   .backgroundColor('#EFEFEF')
//   .padding(20)
// }

// 继承
@Extend(Text) function priceText(){
  .fontColor('#f36')
  .fontSize(18)
}

@Entry
@Component
struct ItemPage {
  @State private items: Array<Item> = [
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999, discount: 500},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999},
    {name:'华为Mate60', img:$r('app.media.mate60'),price:6999}
  ]

  // 局部样式
  @Styles  fillScreen() {
  .width('100%')
  .height('100%')
  .backgroundColor('#EFEFEF')
  .padding(20)
}

  @Builder ItemCard(item: Item){
  Row({space: 10}){
    Image(item.img)
      .width(80)
    Column(){
      Text(item.name)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .height(30)
      if (item.discount){
        Row(){
          Text('原价：￥')
            .fontSize(14)
            .fontColor('#CCC')
            .decoration({type: TextDecorationType.LineThrough})
          Text(item.price.toString())
            .fontSize(14)
            .fontColor('#CCC')
            .decoration({type: TextDecorationType.LineThrough})
        }
        Text('折扣价：￥' + (item.price - item.discount))
          .fontColor('#F36')
        Text('补贴：￥' + item.discount)
          .fontColor('#F36')

      }else{
        Row(){
          Text('￥')
            .fontSize(19)
            .fontWeight(250)
          Text(item.price.toString())
            .margin({left:5})
            .fontSize(19)
        }
        .colorBlend('red')
      }
    }
    .height('100%')
    .margin({left:20})
    .alignItems(HorizontalAlign.Start)
  }
  .width('100%')
  .height('120')
  .padding(10)
  .borderRadius(20)
  .backgroundColor('#fff')
}

  build() {
    Column({space: 8}){
      Header({title: '商品列表'})
      .margin({bottom:20})

      List({space: 10}){
        ForEach(
          this.items,
          (item: Item) =>{
            ListItem(){
              this.ItemCard(item)
            }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
    }
    .fillScreen()
  }
}