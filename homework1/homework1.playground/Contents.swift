//1-13为黑桃，14-26为红心 27-39为w梅花，40-52为方块
var Poker=[Int]()
for i in 1...54 {
    Poker.append(i);
}
//1-13为黑桃，14-26为红心 27-39为梅花，40-52为方块
print(Poker)
func identify(num:Int)
{
    let color=num/13
    let point=num%13
    var pointValue=""
    
    switch point {
    case 0:
        pointValue="A"
    case 10:
        pointValue="J"
    case 11:
        pointValue="Q"
    case 12:
        pointValue="K"
    default:
        pointValue=String(point+1)
    }
    
    switch color {
    case 0:
        print("Spade \(pointValue)")
    case 1:
        print("Heart \(pointValue)")
    case 2:
        print("Club \(pointValue)")
    case 3:
        print("Diamond \(pointValue)")
    default:
        print("no card!!")
        print(point)
        print(color)
    }
    
}
//identify(num: 30)
func randomCards(num:Int)
{
    let random=Int.random(in: 0..<num)
    let item=Poker[random]
    Poker.remove(at:random)
    identify(num: random)
    
}

func deliver(numOfUser: Int, numOfCard: Int){
    var number=52
    for i in 0..<numOfUser
    {
        print("user"+String(i))
        for _ in 0..<numOfCard
        {
            randomCards(num: number)
            number=number-1
        }
    }
    print(Poker)
}
//randomCards()
deliver(numOfUser: 3, numOfCard: 4)
