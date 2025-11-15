;レイヤ0を表示
[layopt layer="0" visible="true"]

;テキスト領域をレイヤ0に作成
[ptext layer="0" name="name_space" x="180" y="400" text="" size=32]

;↑で作ったテキスト領域(name_space)をキャラ名表示用であると宣言する
[chara_config ptext="name_space"]

; ヒロイン定義
[chara_new name="heroine" storage="normal.png" jname="ヒロイン" height=700 width=700]

[position height=250 top=440 opacity=160 left=180]

*narita

[eval exp="f.love=0"]
; 好感度（love）を0で初期化

[title name="Narita to Sakura ～電車通学マジック～"]
[hidemenubutton]
[wait time=200]
[freeimage layer="base"]



「Narita to Sakura ～電車通学マジック～」[r]
[playbgm storage="normal.mp3" loop="true"]

[l]

[bg storage=train.png time=500]

[cm]

; ヒロイン登場
[chara_show name="heroine"]

#heroine
「おはよう、今日も成田から通学？」[l][r]

[cm]

#
「ああ、そうなんだ」[l][r]

会話（京成成田→公津の杜）[l][r]

[link target=*tag_1] →解答1 [endlink][r]
[link target=*tag_2] →解答2 [endlink][r]
[s]

*tag_1

[cm]

反応1[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*mori]

*tag_2

[cm]
反応2[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*mori]

*mori

会話（公津の杜→宗吾参道）[l][r]

[link target=*tag_3] →解答3 [endlink][r]
[link target=*tag_4] →解答4 [endlink][r]
[s]

*tag_3

[cm]

反応3[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*tag_4

[cm]
反応4[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 2"]
; 好感度+2
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*sando]

*sando

会話（宗吾参道→京成酒々井）[l][r]

[link target=*tag_5] →解答5 [endlink][r]
[link target=*tag_6] →解答6 [endlink][r]
[s]

*tag_5

[cm]

反応5[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 1"]
; 好感度+1
現在の好感度：[emb exp="f.love"][l][cm]

[jump target=*shisui]

*tag_6

[cm]
反応6[l][r]
好感度変化[l][r]

[eval exp="f.love = f.love + 2"]
; 好感度+2
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

[if exp="f.love >= 7"]
    ; グッドエンド
    彼女「今日の電車、すごく楽しかった。また一緒に通学しよ？」[l][r]
    （グッドエンド演出とか）[l][r]

[elsif exp="f.love >= 3"]
    ; ノーマルエンド
    彼女「また同じ電車になったらよろしくね～」[l][r]
    （ちょっと物足りない感じの終わり）[l][r]

[else]
    ; バッドエンド
    彼女「……じゃあ、ここで。」[l][r]
    （微妙な空気で解散）[l][r]
[endif]

[cm]

[jump target=*narita]
