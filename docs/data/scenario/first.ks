;URL:http://127.0.0.1:5500/docs/index.html
;レイヤ0を表示
[layopt layer="0" visible="true"]

;テキスト領域をレイヤ0に作成
[ptext layer="0" name="name_space" x="180" y="400" text="" size=32]

;↑で作ったテキスト領域(name_space)をキャラ名表示用であると宣言する
[chara_config ptext="name_space"]

; ヒロイン定義
[chara_new name="sakurako" storage="normal.png" jname="さくらこ" height=700 width=700]
; ヒロイン表情差分
[chara_face name="sakurako" face="angry" storage="angry.png"]
[chara_face name="sakurako" face="sad" storage="sad.png"]

; メッセージボックス表示位置設定
[position height=250 top=440 opacity=160 left=180]
; [position frame="config/message_box.png"]

*start
*title
[title name="Narita to Sakura ～電車通学マジック～"]
;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;背景画像を設定
[image layer="base" storage=train2.png]
[image layer=1 storage="../image/title/logo.png" visible=true top=100 left=430 width=400 height=400]
[image layer=1 storage="normal.png" visible=true top=100 height=700 width=700 left=700]

[locate x=460 y=500]
[button graphic="title/button_start2.png" target=*narita]

[s]

*narita
[cm]
[freeimage layer=1]

; 好感度（love）を0で初期化
[eval exp="f.love=0"]

; Trueルート判定用
; 1 = まだTrueエンドの可能性あり / 0 = どこかで条件を外した
[eval exp="f.true_route = 1"]

[hidemenubutton]
[wait time=200]
[freeimage layer="base"]

; メッセージレイヤを表示に戻す
@layopt layer=message0 visible=true

「Narita to Sakura ～電車通学マジック～」[r]
[playbgm storage="normal.mp3" loop="true"]

[l]

[bg storage=train2.png time=500]

[cm]

俺の名前は成太郎。今日こそ、あの子のハートを打ち抜くぜ！[l][r]
二人で話せるのは、京成成田から京成佐倉までの5駅分の時間。勝負は今、ここで決める！[l][r]

[cm]

#
「や、やあ。奇遇だね...同じ電車なんて」（にやぁ）[p]

; ヒロイン登場
[chara_show name="sakurako"]

#sakurako:default
「おはよう、確か同じクラスの...」[l][r]
（やべ名前知らね―よ。気まずっ）[p]

[cm]

#
「あ、成太郎です。よ、よろしく...」[l][r]
（おっふ、緊張しちまうぜ。平常心平常心っと）[p]

#
「今日はお日柄もよく...ってそうじゃなくて...」[l][r]
（なんか気の利いたことを言わないと！）[r]

[link target=*tere] →桜子さんだよね？なんか照れちゃうな [endlink][r]
[link target=*kawaii] →今日もかわいいね [endlink][r]
[link target=*kutsushita] →かわいい靴下だね [endlink][r]
[s]

*tere

[cm]

#sakurako:sad
「え、うんそうだね。改めて話すのは初めてだもんね。」[l][r]
（なんだこいつ狙ってんのか？）[p]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*kawaii

[cm]

#sakurako:default
「え、ありがとう？どうしたの急に...」[l][r]
（距離感ミスりすぎだろ）[p]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*mori]

*kutsushita

[cm]

#sakurako:angry
「うん！これお気に入りなんだ！」[l][r]
（終わりすぎだろwww絶対変態でワロスwww）[p]

; 好感度+0
現在の好感度：[emb exp="f.love"][l][cm]


*mori

#
「えっと...そうだ！部活は？部活何やってるの！？」（いや話振るのうまいなー俺w）[l][r]
「俺はね...」[p]

[link target=*soccer] →サッカー部 [endlink][r]
[link target=*kendo] →剣道部 [endlink][r]
[link target=*art] →美術部 [endlink][r]
[s]

*soccer

[cm]

#
「俺サッカー部。まじでうまいよ！やべーよ！」[l][r]
（女子はみんなサッカー部好きやろ！決まった！）[p]

#sakurako:sad
「へぇ、そうなんだ。」[l][r]
（こういうやつって絶対レギュラーじゃないんだよね。本気のならいいけどね）[p]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*kendo

[cm]

#
「剣道部。剣に生きてるんだ」[l][r]
（剣道部とか渋いな～俺。）[p]

#sakurako:angry
「へぇ、すごいね」[l][r]
（キザすぎるだろ！何を目指してんだよまじで）[p]

; 好感度+0
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*art

[cm]

#
「美術部。絵を描くのが好きなんだ。」[l][r]
（ど、どうかな...？）[p]

#sakurako:default
「へぇ、素敵だね！私はソフトボール部だよ！」[l][r]
（えーいいじゃん、真面目な人そう）[p]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

*sando

#sakurako:default
「ふわぁ...眠いな...」[p]

#
「そうだね、朝早いもんね。でも春の朝はいいよね！清少納言も『枕草子』で...」[l][r]

[link target=*akebono] →春はあけぼの [endlink][r]
[link target=*agepoyo] →春はあげぽよ [endlink][r]
[link target=*agemono] →春は揚げ物 [endlink][r]
[s]

*akebono

[cm]

#
「って言ってるしね」[l][r]
（インテリ作戦じゃ！）[p]

#sakurako:default
「ふふ、そうだね。でもあけぼのはもっと夜明けだよ」[l][r]
（なんか楽しいかも...？）[p]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*shisui]

*agepoyo

[cm]

#
「って言ってるしね」[l][r]
（絶対滑った...やっちった...）[p]

#sakurako:default
「ふふ、清少納言テン上げだったんだね」[l][r]
（いい人かも...）[p]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*shisui]

*agemono

[cm]
#
「って言ってるしね！」[l][r]
（渾身のでき！）[p]

#sakurako:angry
グ～[l][r]
「き、聞いてないよね...？」[l][r]
（ダイエット中なのに！）[p]

[eval exp="f.true_route = 0"]
; Trueエンド条件外れ
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*shisui]

*shisui

会話（京成酒々井→大佐倉）[l][r]

[link target=*tag_7] →解答7 [endlink][r]
[link target=*tag_8] →解答8 [endlink][r]
[s]

*tag_7

[cm]

反応7[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*osakura]

*tag_8

[cm]
反応8[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*osakura]

*osakura

会話（大佐倉→佐倉）[l][r]

[link target=*tag_9] →解答9 [endlink][r]
[link target=*tag_10] →解答10 [endlink][r]
[s]

*tag_9

[cm]

反応9[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sakura]

*tag_10

[cm]
反応10[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sakura]

*sakura

[cm]

京成佐倉に到着した。[l][r]

; ここでエンディング分岐
[if exp="f.true_route == 1"]
    Trueエンド条件成立[l][r]
[elsif exp="f.love >= 8"]
    Goodエンド条件成立[l][r]
[elsif exp="f.love >= 4"]
    Normalエンド条件成立[l][r]
[else]
    Badエンド条件成立[l][r]
[endif]

[stopbgm]

[chara_hide name="sakurako"]
[freeimage layer=0]

[cm]

[jump target=*credit]

*credit

[cm]
; タイトル
【Credit】[r]

; 開発
Game Design / Script / Programming [r]
rintaro-taguchi[p]

; BGM（DOVA）
Music [r]
空を見上げて by のる[p]

; ボイス
Voice [r]
あみたろの声素材工房（https://amitaro.net/）より[r]
小春音アミ様[p]

; 終了メッセージ
Thank you for playing![p]

[wait time=1000]

[jump target=*start]

