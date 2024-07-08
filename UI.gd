extends CanvasLayer

var coins = 0


func _ready():
	
	var coinNode= get_tree().get_root().find_node("coin2d",true,false)	
	coinNode.connect("coinColected",self,"handleCoinColected")
	
	$coinscolected.text = String(coins)


func handleCoinColected():
	print("Coin Collected")
	coins+=1
	$coinscolected.text = String(coins)
