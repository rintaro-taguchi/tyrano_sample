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
; オープニングBGN
[playbgm storage="opening.mp3" loop="true"]
[title name="Narita to Sakura ～電車通学マジック～"]
;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;背景画像を設定
[image layer="base" storage="train2.png"]
[image layer=1 storage="../image/title/logo.png" visible=true top=100 left=430 width=400 height=400]
[image layer=1 storage="normal.png" visible=true top=100 height=700 width=700 left=700]
[image layer=1 storage="../image/title/catch.png" visible=true top=50 left=0 width=600 height=600]

[locate x=460 y=500]
[button graphic="title/button_start2.png" target=*narita]

[s]

*narita
[stopbgm]
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
※この作品はフィクションです。実在の人物、団体、事件などとは一切関係ありません。[p]

[bg storage=train2.png time=500]

[cm]

俺の名前は成太郎（なりたろう）。今日こそ、あの子のハートをいただくぜ！[l][r]
二人で話せるのは、京成成田から京成佐倉までの5駅分の時間。勝負は今、ここで決める！[l][r]

[cm]
#
【京成成田駅→公津の杜駅】[p]

#
「や、やあ。奇遇だね...同じ電車なんて」[p]

; ヒロイン登場
[chara_show name="sakurako"]

#sakurako:default
[playse storage="ohayo.mp3" loop=false ]
「おはよう、確か同じクラスの...」[l][r]
（あー、何君だっけ...）[p]

[cm]

#
「あ、成太郎です。よ、よろしく...」[l][r]
（おっふ、緊張しちまうぜ。平常心平常心っと）[p]

#
「今日はお日柄もよく...ってそうじゃなくて...」[l][r]
（なんか気の利いたことを言わないと！）[r]

[link target=*tere] →桜子さんだよね？なんか照れちゃうな [endlink][r]
[link target=*kawaii] →今日もかわいいね [endlink][r]
[link target=*kaori] →君は危険な香りがするね [endlink][r]
[s]

*tere

[cm]

#sakurako:sad
[playse storage="ji.mp3" loop=false ]
「え、うんそうだね。改めて話すのは初めてだもんね。」[l][r]
（何この人...変な人じゃないよね...）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*kawaii

[cm]

#sakurako:default
[playse storage="ehehe.mp3" loop=false ]
「え、えへへ、ありがとう？どうしたの急に...」[l][r]
（嬉しいけど、距離感ミスってるなこの人）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*mori]

*kaori

[cm]

#
「君の香りでくらっときそうだぜ」[p]

#sakurako:angry
[playse storage="uu.mp3" loop=false ]
「...は？」[l][r]
（なんだこいつ...きもっ）[p]

#
「あ、ごめん...」[l][r]
（褒めたつもりだったのに...）[p]

; 好感度+0
現在の好感度：[emb exp="f.love"][l][cm]


*mori
#
【公津の杜駅→宗吾参道駅】[p]

#
「えっと...そうだ！部活は？部活何やってるの！？」（部活トークは鉄板でしょ！）[l][r]
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
[playse storage="ji.mp3" loop=false ]
「へぇ、そうなんだ。」[l][r]
（うーん、頑張ってるならいいけど、サッカーやってる自分が好きそうだな...）[p]

#
（あんまり反応良くないな...）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*kendo

[cm]

#
「剣道部。俺は剣に生きてるんだ」[l][r]
（これは決まったぜ...！）[p]

#sakurako:angry
[playse storage="ee.mp3" loop=false ]
「へぇ、すごいね～」[l][r]
（キザすぎ！部活はいいけど、厨二病じゃん）[p]

; 好感度+0
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*art

[cm]

#
「美術部。絵を描くのが好きなんだ。」[l][r]
（ど、どうかな...？）[p]

#sakurako:default
[playse storage="oo.mp3" loop=false ]
「おお、素敵だね！私はソフトボール部だよ！」[l][r]
（えーいいじゃん、真面目な人そう！）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

*sando
#
【宗吾参道駅→京成酒々井駅】[p]

#sakurako:default
[playse storage="akubi.mp3" loop=false ]
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
（インテリ作戦！）[p]

#sakurako:sad
[playse storage="uhuhu.mp3" loop=false ]
「ふふ、そうだね。でもあけぼのはもっと夜明けだよ」[l][r]
（なんか楽しいかも...？）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

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
[playse storage="uhuhu.mp3" loop=false ]
「ふふ、清少納言もテン上げだったのかもね」[l][r]
（いい人かも...）[p]

#
（お！以外にもいい反応！）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*shisui]

*agemono

[cm]
#
「って言ってるしね！」[l][r]
（渾身のボケ！）[p]

#sakurako:angry
グ～。さくらこの腹の虫が鳴いた。[l][r]
「き、聞いてないよね...？」[l][r]
[playse storage="ji.mp3" loop=false ]
（ダイエット中なのに！）[p]

#
「おなか減ってるの？」[p]

#sakurako:angry
「ふん！」[l][r]
（デリカシーなさすぎ！）[p]
[playse storage="naniyo.mp3" loop=false ]

現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*shisui]

*shisui
#
【京成酒々井駅→大佐倉駅】[p]

#sakurako:default
[playse storage="akubi.mp3" loop=false ]
「...」[p]

#
「あのー、アニメとか漫画好き...？俺は」[l][r]
（そろそろトークデッキが...まずい！）[p]

[link target=*battle] →バトル系 [endlink][r]
[link target=*sport] →スポーツ系 [endlink][r]
[link target=*love] →恋愛系 [endlink][r]
[s]

*battle

[cm]

#
「バトル系が好きで...」[p]

#sakurako:sad
[playse storage="uu.mp3" loop=false ]
「あー私、グロいのだめなんだよね」[l][r]
（...気まずい）[p]

#
「あー、そうなんだ...」[l][r]
（...気まずい）[p]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*osakura]

*sport

[cm]
#
「スポーツ系が好きで...」[p]

#sakurako:default
[playse storage="oo.mp3" loop=false ]
「え！私も好き！何見てるの？」[l][r]
（めっちゃ語りたい！）[p]

#
（めっちゃ食いつきいいやん！(ﾟ∀ﾟ)ｷﾀｺﾚ!!）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*osakura]

*love

[cm]

#
「恋愛系が好きで...」[p]

#sakurako:angry
[playse storage="uso.mp3" loop=false ]
「は！？そ、そんなのハレンチだよ！」[l][r]
（朝からなんてことを...！）[p]

#
「え、ええ！？」[l][r]
（どういうこと！？）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*osakura]

*osakura
#
【大佐倉駅→京成佐倉駅】[p]

#
「そのー...えーっと...」[l][r]
（あと少しなのにもう話題がない...）[p]

#sakurako:default
「あのさ...」[l][r]
[playse storage="ji.mp3" loop=false ]
「成太郎君は私のことどう思ってるの？」[p]

#
「えっ...それは」[l][r]
（そんなの一択だ！）[p]

[link target=*suki] →好きだ！ [endlink][r]
[link target=*imouto] →妹みたいな感じかなー [endlink][r]
[link target=*kataki] →親の仇だ！ [endlink][r]
[s]

*suki

[cm]

#
「一目ぼれでした！付き合ってください！」[l][r]
（もうどうにでもなれ！）[p]

#sakurako:default
[playse storage="ehehe.mp3" loop=false ]
「えへへ...」[l][r]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sakura]

*imouto

[cm]
#
「妹みたいに思ってるよ！」[l][r]
（チ、チキったー！(´;ω;｀)）[p]

#sakurako:angry
[playse storage="ee.mp3" loop=false ]
「きも！」[l][r]
（きも！）[p]

; Trueエンド条件外れ
[eval exp="f.true_route = 0"]

[eval exp="f.love = f.love -1"]
; 好感度-1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sakura]

*kataki

[cm]
#
「親の仇だ！貴様の心臓をいただく！」[p]

#sakurako:sad
[playse storage="uhuhu.mp3" loop=false ]
「ふふっ...そういうギャグがあるの？」[l][r]

[eval exp="f.love = f.love +1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sakura]

*sakura

[cm]

京成佐倉に到着した。[l][r]
[chara_hide name="sakurako"]
[freeimage layer=0]

; ここでエンディング分岐
[if exp="f.true_route == 1"]
    [bg storage="trueend.png" time=500]

    [stopbgm]

    [playbgm storage="Brandishing_Evil.mp3" loop="true"]

    成太郎「いや本気さ」[l][r]
    さくらこ「よく気づいたな。まさかアイツの息子が勇者の役目を引き継いでいたとは...」[p]
    成太郎「ああ、そうさ。俺はおまえを倒す時期を見計らっていたんだ。その間、貴様の変化を細かく観察し、剣の技を磨き続けた！覚悟！」[l][r]
    こうして俺は伝説の勇者として、桜子を倒し、世界に平和をもたらしたのだった。[l][r]
    【True End】[l][r]
[elsif exp="f.love >= 8"]
    [bg storage="goodend.png" time=500]
    [playse storage="ehehe.mp3" loop=false ]
    さくらこ「私も成太郎君のことが好き！」[l][r]
    成太郎「BIG LOVE!!」[l][r]
    こうして俺らは学校一有名なカップルになった。[l][r]
    【Good End】[l][r]
[elsif exp="f.love >= 4"]
    [bg storage="normalend.png" time=500]
    [playse storage="gomen.mp3" loop=false ]
    さくらこ「意外と楽しかったよ。友達が待ってるから、またあとで教室で！」[l][r]
    まあ少し距離が近づいただけ良しとするか。[l][r]
    【Normal End】[l][r]
[else]
    [bg storage="badend.png" time=500]
    [playse storage="jane.mp3" loop=false ]
    さくらこ「じゃあね！彼氏が待ってるから！」[l][r]
    さくらこはイケメンの船橋と付き合っていたらしい。[l][r]
    脳が破壊される音がした。[l][r]
    【Bad End】[l][r]
[endif]

[cm]

[jump target=*credit]

*credit

[cm]
; タイトル
【Credit】[r]

; 開発
Game Design / Script / Programming [r]
rintaro-taguchi[p]

; イラスト
Illustration [r]
Generated by Gemini and ChatGPT[p]

; BGM（DOVA）
Music [r]
旅の日記 by のる[r]
空を見上げて by のる[r]
Brandishing Evil by shimtone[p]

; ボイス
Voice [r]
効果音ラボ[p]

; 終了メッセージ
Thank you for playing![p]

[stopbgm]

[wait time=1000]

[jump target=*start]

