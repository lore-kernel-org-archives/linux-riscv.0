Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40327C021B5
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U53kjAQ8JV7dYizh58CTLG7YwsDfTRv4R2TsvoO+9iQ=; b=tALPc2Irt6Nvud
	iGXX7LZ5ngmbi+vyDQTAlDOFDUJF6iLDqWNLuAf6Cr6ewvJYrXmkobXwcOwYzmjxW3xmZiO3IgH61
	4p6WvGITJ6dguiLUjHKnvMh+Pmod/YG3UCTgv115rqMA+sDPchDAJp0CNfpeZyXQrUZzxa3hFuuPQ
	rxU3unH5MIfeWs3GwIgRl+UI4w81ArF16DDY5t9cQnXFsdeQIdfXshH29iVxNeUfHqjdop2B/EF+Y
	Cysw3EcV8CfHvpGBJIZEo+G1ICzByr5/Mg46pk96dOd0fbpJInkVF+1auwLvjxnent4i+LX+ilwg2
	flrPLD8AyOVivYG2AGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpTN-000000084mO-3w5D;
	Sat, 22 Feb 2025 13:23:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlpTK-000000084lt-2Bw8
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 13:23:11 +0000
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21D1C3431F0;
	Sat, 22 Feb 2025 13:23:06 +0000 (UTC)
Date: Sat, 22 Feb 2025 13:23:01 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v5 1/5] gpio: of: support to add custom add pin range
 function
Message-ID: <20250222132301-GYA37325@gentoo>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
 <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_052310_755063_1AEF38A2 
X-CRM114-Status: GOOD (  22.84  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmFydG9zeiBHb2xhc3pld3NraToKCk9uIDExOjIyIFRodSAyMCBGZWIgICAgICwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBNb24sIEZlYiAxNywgMjAyNSBhdCAxOjU44oCvUE0g
WWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+ID4KPiA+IEV4cG9ydCBjdXN0b20g
ZnVuY3Rpb24gdG8gYWRkIGdwaW8gcGluIHJhbmdlIGZyb20gcGluY3RybAo+ID4gc3Vic3lzdGVt
LiBUaGlzIHdvdWxkIG1ha2UgaXQgcG9zc2libGUgdG8gYWRkIHBpbnMgdG8gbXVsdGkKPiA+IGdw
aW8gY2hpcHMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5v
cmc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jICAgfCA1ICsrKystCj4g
PiAgaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oIHwgNyArKysrKysrCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmMgYi9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5j
Cj4gPiBpbmRleCAyZTUzN2VlOTc5ZjNlMmI2ZThkNWY4NmYzZTEyMWE2NmYyYThlMDgzLi42NGM4
YTE1M2I4MjNkNjVmYWViZWQ5YzRjZDg3OTUyMzU5YjQyNzY1IDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncGlvL2dwaW9saWItb2YuYwo+ID4gKysrIGIvZHJpdmVycy9ncGlvL2dwaW9saWItb2Yu
Ywo+ID4gQEAgLTExNzAsNyArMTE3MCwxMCBAQCBpbnQgb2ZfZ3Bpb2NoaXBfYWRkKHN0cnVjdCBn
cGlvX2NoaXAgKmNoaXApCj4gPiAgICAgICAgIGlmIChjaGlwLT5vZl9ncGlvX25fY2VsbHMgPiBN
QVhfUEhBTkRMRV9BUkdTKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4K
PiA+IC0gICAgICAgcmV0ID0gb2ZfZ3Bpb2NoaXBfYWRkX3Bpbl9yYW5nZShjaGlwKTsKPiA+ICsg
ICAgICAgaWYgKCFjaGlwLT5vZl9hZGRfcGluX3JhbmdlKQo+ID4gKyAgICAgICAgICAgICAgIGNo
aXAtPm9mX2FkZF9waW5fcmFuZ2UgPSBvZl9ncGlvY2hpcF9hZGRfcGluX3JhbmdlOwo+ID4gKwo+
ID4gKyAgICAgICByZXQgPSBjaGlwLT5vZl9hZGRfcGluX3JhbmdlKGNoaXApOwo+ID4gICAgICAg
ICBpZiAocmV0KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaCBiL2luY2x1ZGUvbGludXgvZ3Bpby9k
cml2ZXIuaAo+ID4gaW5kZXggMmRkN2NiOWNjMjcwYTY4ZGRlZGJjZGQ1ZDQ0ZTBkMGY4OGRmYTc4
NS4uYTdiOTY2Yzc4YTJmNjIwNzVmYjc4MDRmNmU5NjAyODU2NGRkYTE2MSAxMDA2NDQKPiA+IC0t
LSBhL2luY2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9n
cGlvL2RyaXZlci5oCj4gPiBAQCAtNTI4LDYgKzUyOCwxMyBAQCBzdHJ1Y3QgZ3Bpb19jaGlwIHsK
PiA+ICAgICAgICAgICovCj4gPiAgICAgICAgIGludCAoKm9mX3hsYXRlKShzdHJ1Y3QgZ3Bpb19j
aGlwICpnYywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBvZl9waGFu
ZGxlX2FyZ3MgKmdwaW9zcGVjLCB1MzIgKmZsYWdzKTsKPiA+ICsKPiA+ICsgICAgICAgLyoqCj4g
PiArICAgICAgICAqIEBvZl9hZGRfcGluX3JhbmdlOgo+ID4gKyAgICAgICAgKgo+ID4gKyAgICAg
ICAgKiBDYWxsYmFjayB0byBhZGQgcGluIHJhbmdlcyBmcm9tIHBpbmN0cmwKPiA+ICsgICAgICAg
ICovCj4gCj4gUGxlYXNlLCBtYWtlIHRoZSBBUEkgY29udHJhY3QgbW9yZSBzcGVjaWZpYzogZGVz
Y3JpYmUgdGhlIHJldHVybiB2YWx1ZQo+IGFuZCBjaGVjayBpdCBpbiB0aGUgY2FsbCBwbGFjZSBp
ZiBpdCBjYW4gcmV0dXJuIGVycm9ycy4KPiAKPiBBbHNvOiBpcyB0aGlzIGV2ZW4gT0Ytc3BlY2lm
aWMgaWYgaXQgZG9lc24ndCB0YWtlIGFueSBPRiBhcmd1bWVudD8gV2h5Cj4gbm90IGp1c3QgYWRk
X3Bpbl9yYW5nZSgpPwo+IApub3csIHRoaXMgcGF0Y2ggaXMgb2Jzb2xldGUsIHBsZWFzZSBpZ25v
cmUKaXQgd2lsbCBiZSByZXBsYWNlZCBieSB0aGUgb25lIHNlbnQgYnkgTGludXNXCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIxOC1ncGlvLXJhbmdlcy1mb3VyY2VsbC12MS0wLWIx
ZjNkYjZjODAzNkBsaW5hcm8ub3JnLwoKPiBCYXJ0Cj4gCj4gCj4gPiArICAgICAgIGludCAoKm9m
X2FkZF9waW5fcmFuZ2UpKHN0cnVjdCBncGlvX2NoaXAgKmNoaXApOwo+ID4gICNlbmRpZiAvKiBD
T05GSUdfT0ZfR1BJTyAqLwo+ID4gIH07Cj4gPgo+ID4KPiA+IC0tCj4gPiAyLjQ4LjEKPiA+Cj4g
CgotLSAKWWl4dW4gTGFuIChkbGFuKQpHZW50b28gTGludXggRGV2ZWxvcGVyCkdQRyBLZXkgSUQg
QUFCRUZENTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
