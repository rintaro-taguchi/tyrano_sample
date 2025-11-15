*narita

[eval exp="f.love=0"] ; 好感度（love）を0で初期化

[title name="Narita to Sakura ～電車通学マジック～"]
[hidemenubutton]
[wait time=200]
[freeimage layer="base"]

「Narita to Sakura ～電車通学マジック～」[l][r]

会話（京成成田→公津の杜）[l][r]

[link target=*tag_1] →解答1 [endlink][r]
[link target=*tag_2] →解答2 [endlink][r]
[s]

*tag_1

[cm]

[bg storage=sleep.jpg time=500]

反応1[l][r]
好感度変化[l][cm]

[eval exp="f.love = f.love + 1"] ; 好感度+1
現在の好感度：[emb exp="f.love"][l]

[jump target=*mori]

*tag_2

[bg storage=run.jpg time=500]

[cm]
反応2[l][r]
好感度変化[l][cm]

[eval exp="f.love = f.love + 2"] ; 好感度+2
現在の好感度：[emb exp="f.love"][l]

[jump target=*mori]

*mori

会話（公津の杜→宗吾参道）[l][r]

[link target=*tag_3] →解答3 [endlink][r]
[link target=*tag_4] →解答4 [endlink][r]
[s]

*tag_3

[cm]

[bg storage=sleep.jpg time=500]

反応3[l][r]
好感度変化[l][cm]

[jump target=*sando]

*tag_4

[bg storage=run.jpg time=500]

[cm]
反応4[l][r]
好感度変化[l][cm]

[jump target=*sando]

*sando

会話（宗吾参道→京成酒々井）[l][r]

[link target=*tag_5] →解答5 [endlink][r]
[link target=*tag_6] →解答6 [endlink][r]
[s]

*tag_5

[cm]

[bg storage=sleep.jpg time=500]

反応5[l][r]
好感度変化[l][cm]

[jump target=*shisui]

*tag_6

[bg storage=run.jpg time=500]

[cm]
反応6[l][r]
好感度変化[l][cm]

[jump target=*shisui]

*shisui

会話（京成酒々井→大佐倉）[l][r]

[link target=*tag_7] →解答7 [endlink][r]
[link target=*tag_8] →解答8 [endlink][r]
[s]

*tag_7

[cm]

[bg storage=sleep.jpg time=500]

反応7[l][r]
好感度変化[l][cm]

[jump target=*osakura]

*tag_8

[bg storage=run.jpg time=500]

[cm]
反応8[l][r]
好感度変化[l][cm]

[jump target=*osakura]

*osakura

会話（大佐倉→佐倉）[l][r]

[link target=*tag_9] →解答9 [endlink][r]
[link target=*tag_10] →解答10 [endlink][r]
[s]

*tag_9

[cm]

[bg storage=sleep.jpg time=500]

反応9[l][r]
好感度変化[l][cm]

[jump target=*narita]

*tag_10

[bg storage=run.jpg time=500]

[cm]
反応10[l][r]
好感度変化[l][cm]

[jump target=*narita]
