Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A007C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 12:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC9A610A1
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 12:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC9A610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:
	Subject:Cc:To:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/whZ9hq/2m1BTBWbWonP16A3Hg6ig3nKxRq+uT5cdkM=; b=IrMa/s0ZRQm4zc
	E65eojFz+yZpPTClmaLnt3YVRkUsi8GNAoCr2E2xpJQVtMbHVCD2FGCQB5gtPuRSFd6Jg4IZ8Q2re
	bj9J4W9N8Vy525o6Pm2YMU6hshwCAv5D2O9tTGFRpcioySghBFYpLfqA5CV3vSiPA1jB0AYhTHvQq
	DttSyK04o/E7YRZ8zLntTj/8Xn8sEdD5vl/fNM+5iH0BQ3uEjwbkIFclgIgCKC2e63/y9fj1Cdi5x
	lmQEe/4q7Z6KqtXKlWibmk37L3hk8QOKigi8L/9tQKnwQBTA0VfFk0wK7PfteRp2LCSkdl7hjnrKd
	cNGZO46XFYWvtgfdX6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lomHZ-008aTI-AH; Thu, 03 Jun 2021 12:17:05 +0000
Received: from mail-m17641.qiye.163.com ([59.111.176.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lomHW-008aSJ-3A
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 12:17:04 +0000
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17641.qiye.163.com (Hmail) with ESMTP id 5C555601C2;
 Thu,  3 Jun 2021 20:16:57 +0800 (CST)
Message-ID: <AOUAGADjDgLoPa*jUlFgu4pV.3.1622722617365.Hmail.wanjiabing@vivo.com>
To: "Wu X.C." <bobwxc@email.cn>
Cc: Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bernard Zhao <bernard@vivo.com>, Fangrui Song <maskray@google.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gW3YzXSBkb2NzL3poX0NOOiBhZGQgdHJhbnNsYXRpb25zIGluIHpoX0NOL2Rldi10b29scy9rYXNhbg==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 58.213.83.158
In-Reply-To: <20210603120308.GB5502@bobwxc.top>
MIME-Version: 1.0
Received: from wanjiabing@vivo.com( [58.213.83.158) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 3 Jun 2021 20:16:57 +0800 (GMT+08:00)
From: Jiabing Wan <wanjiabing@vivo.com>
Date: Thu, 3 Jun 2021 20:16:57 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGk1NHVZPSBlJQxlCSR1OTUJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1PS0hPTExOSU1DN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6NC46PDo*ET8cNxQrGlERLhc9HA5PCy1VSFVKTUlJTElJTUpMTUNJVTMWGhIXVQwaFRESGhkS
 FRw7DRINFFUYFBZFWVdZEgtZQVlOQ1VJSkhVQ0hVSk5DWVdZCAFZQUNPQ043Bg++
X-HM-Tid: 0a79d1ce202bd997kuws5c555601c2
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_051702_499235_9221FE34 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

IAo+T24gVGh1LCBKdW4gMDMsIDIwMjEgYXQgMDU6NDc6MjVQTSArMDgwMCwgV2FuIEppYWJpbmcg
d3JvdGU6Cj4+IEFkZCBuZXcgemggdHJhbnNsYXRpb25zCj4+ICogemhfQ04vZGV2LXRvb2xzL2th
c2FuLnJzdAo+PiBhbmQgbGluayBpdCB0byB6aF9DTi9kZXYtdG9vbHMvaW5kZXgucnN0Cj4+IAo+
PiBSZXZpZXdlZC1ieTogRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFdhbiBKaWFiaW5nIDx3YW5qaWFiaW5nQHZpdm8uY29tPgo+PiAtLS0KPj4gQ2hh
bmdlbG9nOgo+PiB2MzoKPj4gLSBGaXggYWxpZ25zIGFuZCBpbmFjY3VyYXRlIHRyYW5zbGF0aW9u
Cj4+IHYyOgo+PiAtIERlbGV0ZSBzcGFjZXMgc3Vycm91bmQgd2l0aCBFbmdsaXNoIHdvcmRzLgo+
PiAtLS0KPj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRvb2xzL2luZGV4LnJzdCAgICAg
ICAgIHwgICAyICstCj4+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10b29scy9rYXNhbi5y
c3QgICAgICAgICB8IDQxNyArKysrKysrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdl
ZCwgNDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXYtdG9vbHMva2FzYW4ucnN0Cj4+
IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRv
b2xzL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10b29s
cy9pbmRleC5yc3QKPj4gaW5kZXggZmQ3M2M0Ny4uZTZjOTlmMiAxMDA2NDQKPj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRvb2xzL2luZGV4LnJzdAo+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXYtdG9vbHMvaW5kZXgucnN0Cj4+
IEBAIC0xOSwxMyArMTksMTMgQEAKPj4gICAgIDptYXhkZXB0aDogMgo+PiAgCj4+ICAgICBnY292
Cj4+ICsgICBrYXNhbgo+PiAgCj4+ICBUb2RvbGlzdDoKPj4gIAo+PiAgIC0gY29jY2luZWxsZQo+
PiAgIC0gc3BhcnNlCj4+ICAgLSBrY292Cj4+IC0gLSBrYXNhbgo+PiAgIC0gdWJzYW4KPj4gICAt
IGttZW1sZWFrCj4+ICAgLSBrY3Nhbgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vZGV2LXRvb2xzL2thc2FuLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNs
YXRpb25zL3poX0NOL2Rldi10b29scy9rYXNhbi5yc3QKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
Pj4gaW5kZXggMDAwMDAwMC4uYTEyYjNiMAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2Rldi10b29scy9rYXNhbi5yc3QKPj4gQEAgLTAs
MCArMSw0MTcgQEAKPj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsK
Pj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdAo+PiArCj4+ICs6T3JpZ2lu
YWw6IERvY3VtZW50YXRpb24vZGV2LXRvb2xzL2thc2FuLnJzdAo+PiArOlRyYW5zbGF0b3I6IOS4
h+WutuWFtSBXYW4gSmlhYmluZyA8d2FuamlhYmluZ0B2aXZvLmNvbT4KPj4gKwo+PiAr5YaF5qC4
5Zyw5Z2A5raI5q+S5YmCKEtBU0FOKQo+PiArPT09PT09PT09PT09PT09PT09PT09PQo+PiArCj4+
ICvmpoLov7AKPj4gKy0tLS0KPj4gKwo+PiArS2VybmVsQWRkcmVzc1NBTml0aXplcihLQVNBTinm
mK/kuIDnp43liqjmgIHlhoXlrZjlronlhajplJnor6/mo4DmtYvlt6XlhbfvvIzkuLvopoHlip/o
g73mmK8KPj4gK+ajgOafpeWGheWtmOi2iueVjOiuv+mXruWSjOS9v+eUqOW3sumHiuaUvuWGheWt
mOeahOmXrumimOOAgktBU0FO5pyJ5LiJ56eN5qih5byPOgo+PiArCj4+ICsxLiDpgJrnlKhLQVNB
Tu+8iOS4jueUqOaIt+epuumXtOeahEFTYW7nsbvkvLzvvIkKPj4gKzIuIOWfuuS6jui9r+S7tuag
h+etvueahEtBU0FO77yI5LiO55So5oi356m66Ze055qESFdBU2Fu57G75Ly877yJCj4+ICszLiDl
n7rkuo7noazku7bmoIfnrb7nmoRLQVNBTu+8iOWfuuS6juehrOS7tuWGheWtmOagh+etvu+8iQo+
PiArCj4+ICvnlLHkuo7pgJrnlKhLQVNBTueahOWGheWtmOW8gOmUgOi+g+Wkp++8jOmAmueUqEtB
U0FO5Li76KaB55So5LqO6LCD6K+V44CC5Z+65LqO6L2v5Lu25qCH562+55qES0FTQU4KPj4gK+WP
r+eUqOS6jmRvZ2Zvb2TmtYvor5XvvIzlm6DkuLrlroPlhbfmnInovoPkvY7nmoTlhoXlrZjlvIDp
lIDvvIzlubblhYHorrjlsIblhbbnlKjkuo7lrp7pmYXlt6XkvZzph4/jgIIKPj4gK+WfuuS6jueh
rOS7tuagh+etvueahEtBU0FO5YW35pyJ6L6D5L2O55qE5YaF5a2Y5ZKM5oCn6IO95byA6ZSA77yM
5Zug5q2k5Y+v55So5LqO55Sf5Lqn44CC5ZCM5pe25Y+v55So5LqOCj4+ICvmo4DmtYvnjrDlnLrl
hoXlrZjpl67popjmiJbkvZzkuLrlronlhajnvJPop6Pmjqrmlr3jgIIKPj4gKwo+PiAr6L2v5Lu2
S0FTQU7mqKHlvI/vvIgjMeWSjCMy77yJ5L2/55So57yW6K+R5pe25bel5YW35Zyo5q+P5qyh5YaF
5a2Y6K6/6Zeu5LmL5YmN5o+S5YWl5pyJ5pWI5oCn5qOA5p+l77yMCj4+ICvlm6DmraTpnIDopoHk
uIDkuKrmlK/mjIHlroPnmoTnvJbor5HlmajniYjmnKzjgIIKPj4gKwo+PiAr6YCa55SoS0FTQU7l
nKhHQ0PlkoxDbGFuZ+WPl+aUr+aMgeOAgkdDQ+mcgOimgTguMy4w5oiW5pu06auY54mI5pys44CC
5Lu75L2V5Y+X5pSv5oyB55qEQ2xhbmcKPj4gK+eJiOacrOmDveaYr+WFvOWuueeahO+8jOS9huS7
jkNsYW5nIDEx5omN5byA5aeL5pSv5oyB5qOA5rWL5YWo5bGA5Y+Y6YeP55qE6LaK55WM6K6/6Zeu
44CCCj4+ICsKPj4gK+WfuuS6jui9r+S7tuagh+etvueahEtBU0FO5qih5byP5LuF5ZyoQ2xhbmfk
uK3lj5fmlK/mjIHjgIIKPj4gKwo+PiAr56Gs5Lu2S0FTQU7mqKHlvI/vvIgjM++8ieS+nei1lueh
rOS7tuadpeaJp+ihjOajgOafpe+8jOS9huS7jemcgOimgeaUr+aMgeWGheWtmOagh+etvuaMh+S7
pOeahOe8luivkeWZqAo+PiAr54mI5pys44CCR0NDIDEwK+WSjENsYW5nIDExK+aUr+aMgeatpOao
oeW8j+OAggo+PiArCj4+ICvkuKTnp43ova/ku7ZLQVNBTuaooeW8j+mDvemAgueUqOS6jlNMVULl
koxTTEFC5YaF5a2Y5YiG6YWN5Zmo77yM6ICM5Z+65LqO56Gs5Lu25qCH562+55qES0FTQU7nm67l
iY0KPj4gK+S7heaUr+aMgVNMVULjgIIKPj4gKwo+PiAr55uu5YmNeDg2XzY044CBYXJt44CBYXJt
NjTjgIF4dGVuc2HjgIFzMzkw44CBcmlzY3bmnrbmnoTmlK/mjIHpgJrnlKhLQVNBTuaooeW8j++8
jOS7hQo+PiArYXJtNjTmnrbmnoTmlK/mjIHln7rkuo7moIfnrb7nmoRLQVNBTuaooeW8j+OAggo+
PiArCj4+ICvnlKjms5UKPj4gKy0tLS0KPj4gKwo+PiAr6KaB5ZCv55SoS0FTQU7vvIzor7fkvb/n
lKjku6XkuIvlkb3ku6TphY3nva7lhoXmoLg6Ogo+PiArCj4+ICsJICBDT05GSUdfS0FTQU49eQo+
PiArCj4+ICvlkIzml7blnKggYGBDT05GSUdfS0FTQU5fR0VORVJJQ2BgICjlkK/nlKjpgJrnlKhL
QVNBTuaooeW8jynvvIwgYGBDT05GSUdfS0FTQU5fU1dfVEFHU2BgCj4+ICso5ZCv55So5Z+65LqO
56Gs5Lu25qCH562+55qES0FTQU7mqKHlvI8p77yM5ZKMIGBgQ09ORklHX0tBU0FOX0hXX1RBR1Ng
YCAo5ZCv55So5Z+65LqO56Gs5Lu25qCH562+Cj4+ICvnmoRLQVNBTuaooeW8jynkuYvpl7Tov5vo
oYzpgInmi6njgIIKPj4gKwo+PiAr5a+55LqO6L2v5Lu25qih5byP77yM6L+Y5Y+v5Lul5ZyoIGBg
Q09ORklHX0tBU0FOX09VVExJTkVgYCDlkowgYGBDT05GSUdfS0FTQU5fSU5MSU5FYGAKPj4gK+S5
i+mXtOi/m+ihjOmAieaLqeOAgm91dGxpbmXlkoxpbmxpbmXmmK/nvJbor5Hlmajmj5Lmoannsbvl
novjgILliY3ogIXkuqfnlJ/ovoPlsI/nmoTkuozov5vliLbmlofku7bvvIwKPj4gK+iAjOWQjuiA
heW/qzEuMS0y5YCN44CCCj4+ICsKPj4gK+imgeWwhuWPl+W9seWTjeeahHNsYWLlr7nosaHnmoRh
bGxvY+WSjGZyZWXloIbmoIjot5/ouKrljIXlkKvliLDmiqXlkYrkuK3vvIzor7flkK/nlKgKPj4g
K2BgQ09ORklHX1NUQUNLVFJBQ0VgYCDjgILopoHljIXmi6zlj5flvbHlk43niannkIbpobXpnaLn
moTliIbphY3lkozph4rmlL7loIbmoIjot5/ouKrnmoTor53vvIwKPj4gK+ivt+WQr+eUqGBgQ09O
RklHX1BBR0VfT1dORVJgYCDlubbkvb/nlKggYGBwYWdlX293bmVyPW9uYGAg6L+b6KGM5byV5a+8
44CCCj4tLS0tLS0tLV4KPgo+bWlzc2VkIGEgc3BhY2UgaGVyZQo+Cj5CdWlsZCBpdCwganVzdCBo
ZXJlLgo+Cj5UaGFua3MsCj4JV3UgWC5DLgo+CgpUaGFuayB5b3UhCgpOaWNlIGNhdGNoIQoKSSB3
aWxsIGJ1aWxkIGl0IGFuZCByZXZpZXcgYWdhaW4uCgpZb3VycywKSmlhYmluZyBXYW4KDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
