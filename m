Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C46C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 00:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXs9oJmWvkQoZmGVkCK0nF7zfgtCm/4ITzxoaXaMeIY=; b=Cv6FKpnm5F8Dej
	F5jX0R6VGVvhR+DiibKtvnDICRVWSXXynMltt3PzWvJ9zmtkT5ssjyrkYH0oABI25OTYuc38bSqtk
	ZElKEXKhyaYWQoj9Uyx+QeFsSK4rbCy1BuxVwTHl6HWG4ABvxUQ3GHdCcdBdggeNPdWOICQMSFF8N
	ViUcSGrZ6cqY3o0G9l9X//UfrsQM58q4JSbtDLvt5bW0utuwR3YOct7Pugi2s5KtciKWjUTnLyTFg
	XD+cuIkqv9MpLyMUcJFWJkW9rbq6Yr7DZUiwvWHmCdoUDFl5LtZnWmx9DF9Zdot1ZOkBhu+YSp4vV
	Y49WmVpeiwvvTB+cIyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1TV-00D4Qv-84; Thu, 26 May 2022 00:35:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu1TR-00D4QU-Lx
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 00:35:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E56D561683
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 00:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5256BC34114
	for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 00:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653525332;
	bh=Ub70rkaNu77ijQoyYKCRXS4Ea2ip8iV3HKvu4YbNWlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pojJk6JMGa1thYQxtIyFREeWASDOVko4ZwaA7AyztUdQHkCA53Q2Oi3lx29yK6FT7
	 34a5Dwa1a5+urSYRHq7cYmXTNcphsrutcrI2xHUOklTiIjZRHGo0cGVQI+Lz4SzmHV
	 whuFCzWWG+Am5NtBTiEqKvCKacZ+lESbtUJamk2Rre4zWyI/ODaUsQfGvURB88c2xb
	 HEL9J0zYjIIs4qVI07tTAJV90tKNEvD5WIur11kLmBPPDzLUbHtChIjv8UivY90nRT
	 cEJzShDbYeCUggKumWO6yTsFL7Hh5OZ6kbd8D930uK5B+VPfLIVbnDP3BLGogKtR83
	 frI1goyNxda8w==
Received: by mail-vs1-f51.google.com with SMTP id c62so26320vsc.10
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 17:35:32 -0700 (PDT)
X-Gm-Message-State: AOAM532CDSqPzYQKgWpG6MAvp/ZmGyh7MQn6MA9inLrJa159fWLdbgh6
	GERZCkseVRfPKbNx961i+zM9L2Zyd7iEFQfnT2g=
X-Google-Smtp-Source: ABdhPJwVzqTYj6xG358bNh9cvbAIFKwsDdwfTwd6Q796CP21Si85Rf+f2j1K7L766fD0w3GaSopvx+HcUsV/LbeQkEI=
X-Received: by 2002:a67:c89c:0:b0:335:d83b:df76 with SMTP id
 v28-20020a67c89c000000b00335d83bdf76mr12994381vsk.51.1653525331287; Wed, 25
 May 2022 17:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <a0bffec3-cf43-417e-3804-9248325266c3@roeck-us.net> <mhng-b37ccc06-67ad-4fd8-bcdb-0e5c9e5a4750@palmer-ri-x1c9>
In-Reply-To: <mhng-b37ccc06-67ad-4fd8-bcdb-0e5c9e5a4750@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 26 May 2022 08:35:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRPPTE0uHC=6iSW7AR6aESF9Zb1==RZ9xm_JW4itjP+rw@mail.gmail.com>
Message-ID: <CAJF2gTRPPTE0uHC=6iSW7AR6aESF9Zb1==RZ9xm_JW4itjP+rw@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat: Using seperated vdso_maps for compat_vdso_info
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_173533_839941_B77660AB 
X-CRM114-Status: GOOD (  21.44  )
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

T24gVGh1LCBNYXkgMjYsIDIwMjIgYXQgNTozNCBBTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMjUgTWF5IDIwMjIgMTQ6MTU6MDMgUERUICgt
MDcwMCksIGxpbnV4QHJvZWNrLXVzLm5ldCB3cm90ZToKPiA+IE9uIDUvMjUvMjIgMDk6MDQsIGd1
b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiA+Pgo+ID4+IFRoaXMgaXMgYSBmaXh1cCBmb3IgdmRzbyBpbXBsZW1lbnRh
dGlvbiB3aGljaCBjYXVzZWQgbXVzbCB0bwo+ID4+IGZhaWwuCj4gPj4KPiA+PiBbICAgMTEuNjAw
MDgyXSBSdW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+PiBbICAgMTEuNjI4NTYxXSBp
bml0WzFdOiB1bmhhbmRsZWQgc2lnbmFsIDExIGNvZGUgMHgxIGF0Cj4gPj4gMHgwMDAwMDAwMDAw
MDAwMDAwIGluIGxpYmMuc29bZmZmZmZmOGFkMzkwMDArYTQwMDBdCj4gPj4gWyAgIDExLjYyOTM5
OF0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkCj4gPj4gNS4xOC4wLXJjNy1u
ZXh0LTIwMjIwNTIwICMxCj4gPj4gWyAgIDExLjYyOTQ2Ml0gSGFyZHdhcmUgbmFtZTogcmlzY3Yt
dmlydGlvLHFlbXUgKERUKQo+ID4+IFsgICAxMS42Mjk1NDZdIGVwYyA6IDAwZmZmZmZmOGFkYTEx
MDAgcmEgOiAwMGZmZmZmZjhhZGExM2M4IHNwIDoKPiA+PiAwMGZmZmZmZmM1ODE5OWYwCj4gPj4g
WyAgIDExLjYyOTU4Nl0gIGdwIDogMDBmZmZmZmY4YWQzOTAwMCB0cCA6IDAwZmZmZmZmOGFkZTA5
OTggdDAgOgo+ID4+IGZmZmZmZmZmZmZmZmZmZmYKPiA+PiBbICAgMTEuNjI5NTk4XSAgdDEgOiAw
MGZmZmZmZmM1ODE5ZmQwIHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6Cj4gPj4gMDBmZmZmZmY4
YWRlMGNjMAo+ID4+IFsgICAxMS42Mjk2MTBdICBzMSA6IDAwZmZmZmZmOGFkZTBjYzAgYTAgOiAw
MDAwMDAwMDAwMDAwMDAwIGExIDoKPiA+PiAwMGZmZmZmZmM1ODE5YTAwCj4gPj4gWyAgIDExLjYy
OTYyMl0gIGEyIDogMDAwMDAwMDAwMDAwMDAwMSBhMyA6IDAwMDAwMDAwMDAwMDAwMWUgYTQgOgo+
ID4+IDAwZmZmZmZmYzU4MTliMDAKPiA+PiBbICAgMTEuNjI5NjM0XSAgYTUgOiAwMGZmZmZmZmM1
ODE5YjAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6Cj4gPj4gMDAwMDAwMDAwMDAwMDAwMAo+
ID4+IFsgICAxMS42Mjk2NDVdICBzMiA6IDAwZmZmZmZmOGFkZTBhYzggczMgOiAwMGZmZmZmZjhh
ZGUwZWM4IHM0IDoKPiA+PiAwMGZmZmZmZjhhZGUwNzI4Cj4gPj4gWyAgIDExLjYyOTY1Nl0gIHM1
IDogMDBmZmZmZmY4YWRlMGE5MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOgo+ID4+IDAwZmZm
ZmZmYzU4MTllNDAKPiA+PiBbICAgMTEuNjI5NjY3XSAgczggOiAwMGZmZmZmZjhhZGUwY2EwIHM5
IDogMDBmZmZmZmY4YWRkYmE1MCBzMTA6Cj4gPj4gMDAwMDAwMDAwMDAwMDAwMAo+ID4+IFsgICAx
MS42Mjk2NzhdICBzMTE6IDAwMDAwMDAwMDAwMDAwMDAgdDMgOiAwMDAwMDAwMDAwMDAwMDAyIHQ0
IDoKPiA+PiAwMDAwMDAwMDAwMDAwMDAxCj4gPj4gWyAgIDExLjYyOTY4OF0gIHQ1IDogMDAwMDAw
MDAwMDAyMDAwMCB0NiA6IGZmZmZmZmZmZmZmZmZmZmYKPiA+PiBbICAgMTEuNjI5Njk5XSBzdGF0
dXM6IDAwMDAwMDAwMDAwMDQwMjAgYmFkYWRkcjogMDAwMDAwMDAwMDAwMDAwMAo+ID4+IGNhdXNl
OiAwMDAwMDAwMDAwMDAwMDBkCj4gPj4KPiA+PiBUaGUgbGFzdCBfX3Zkc29faW5pdCgmY29tcGF0
X3Zkc29faW5mbykgcmVwbGFjZXMgdGhlIGRhdGEgaW4gbm9ybWFsCj4gPj4gdmRzb19pbmZvLiBU
aGlzIGlzIGFuIG9idmlvdXMgYnVnLgo+ID4+Cj4gPj4gUmVwb3J0ZWQtYnk6IEd1ZW50ZXIgUm9l
Y2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9y
ZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4gPj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
Cj4gPj4gQ2M6IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gPgo+ID4gVGVzdGVk
LWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cj4KPiBTb3JyeSBJJ20gYSBi
aXQgYnVyaWVkIHJpZ2h0IG5vdywgdGhpcyBpcyBmaXhpbmcgdGhlIGlzc3VlIHlvdSBwb2ludGVk
Cj4gb3V0IGVhcmxpZXI/CkkndmUgdXBkYXRlZCBwYXRjaCBWMiwgcGxlYXNlIHVzZSB0aGF0LCB0
aHguCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjIwNTI2MDAzMzM5LjI5
NDgzMDktMS1ndW9yZW5Aa2VybmVsLm9yZy9ULyN1Cgo+Cj4gPgo+ID4+IC0tLQo+ID4+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvdmRzby5jIHwgMTUgKysrKysrKysrKysrKy0tCj4gPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNv
LmMKPiA+PiBpbmRleCA1MGZlNGM4Nzc2MDMuLjY5YjA1YjZjMTgxYiAxMDA2NDQKPiA+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvLmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92
ZHNvLmMKPiA+PiBAQCAtMjA2LDEyICsyMDYsMjMgQEAgc3RhdGljIHN0cnVjdCBfX3Zkc29faW5m
byB2ZHNvX2luZm8gX19yb19hZnRlcl9pbml0ID0gewo+ID4+ICAgfTsKPiA+Pgo+ID4+ICAgI2lm
ZGVmIENPTkZJR19DT01QQVQKPiA+PiArc3RhdGljIHN0cnVjdCB2bV9zcGVjaWFsX21hcHBpbmcg
cnZfY29tcGF0X3Zkc29fbWFwc1tdIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKPiA+PiArICAgIFtSVl9W
RFNPX01BUF9WVkFSXSA9IHsKPiA+PiArICAgICAgICAgICAgLm5hbWUgICA9ICJbdnZhcl0iLAo+
ID4+ICsgICAgICAgICAgICAuZmF1bHQgPSB2dmFyX2ZhdWx0LAo+ID4+ICsgICAgfSwKPiA+PiAr
ICAgIFtSVl9WRFNPX01BUF9WRFNPXSA9IHsKPiA+PiArICAgICAgICAgICAgLm5hbWUgICA9ICJb
dmRzb10iLAo+ID4+ICsgICAgICAgICAgICAubXJlbWFwID0gdmRzb19tcmVtYXAsCj4gPj4gKyAg
ICB9LAo+ID4+ICt9Owo+ID4+ICsKPiA+PiAgIHN0YXRpYyBzdHJ1Y3QgX192ZHNvX2luZm8gY29t
cGF0X3Zkc29faW5mbyBfX3JvX2FmdGVyX2luaXQgPSB7Cj4gPj4gICAgICAubmFtZSA9ICJjb21w
YXRfdmRzbyIsCj4gPj4gICAgICAudmRzb19jb2RlX3N0YXJ0ID0gY29tcGF0X3Zkc29fc3RhcnQs
Cj4gPj4gICAgICAudmRzb19jb2RlX2VuZCA9IGNvbXBhdF92ZHNvX2VuZCwKPiA+PiAtICAgIC5k
bSA9ICZydl92ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4gPj4gLSAgICAuY20gPSAmcnZf
dmRzb19tYXBzW1JWX1ZEU09fTUFQX1ZEU09dLAo+ID4+ICsgICAgLmRtID0gJnJ2X2NvbXBhdF92
ZHNvX21hcHNbUlZfVkRTT19NQVBfVlZBUl0sCj4gPj4gKyAgICAuY20gPSAmcnZfY29tcGF0X3Zk
c29fbWFwc1tSVl9WRFNPX01BUF9WRFNPXSwKPiA+PiAgIH07Cj4gPj4gICAjZW5kaWYKPiA+PgoK
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
