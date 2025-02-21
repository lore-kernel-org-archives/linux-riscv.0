Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1692BC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVtTPFRbTEWAVlG7oMgn+rn8k8UgAssHokuipsF1I1s=; b=YVj4Gg1LGgtx6U
	A7M4RRaFPxOq6waXme9I8ePjWyhA0DkRX5io/s2noaA5atyFXhKYIvtyoqa+J5LwALDGjIwAKa+Xm
	jVd8bdJ/OujPEMy7QfIJ1mjeQxPFT2UP9QlV39bkrmTDKGshDgYd9usGVzBLFoT6faAlfyO9Wc4nK
	rswy4PdkDzy4NXEVFwA6qr3yPJIhRzk9LtvZkWp+A6SZYDVhuS7Z3upvop4WorAUHTXTxRwCmDMpa
	S3g0I4vQFluVOu5jG/7m8qsQow6q6FRjD1kJSA3q0PKmkD0UMnIcKLLiWjANuRWgjIE9klN/PevBJ
	EEdN43YYBscpgWaw+jhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlS2B-00000005SkO-0Wcv;
	Fri, 21 Feb 2025 12:21:35 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlS28-00000005SjO-2AVt
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 12:21:33 +0000
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 134FF3430CB;
	Fri, 21 Feb 2025 12:21:29 +0000 (UTC)
Date: Fri, 21 Feb 2025 12:21:25 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Chen Wang <unicorn_wang@outlook.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
Message-ID: <20250221122125-GYA35549@gentoo>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
 <CAMRc=MdJszmZ8d1MGo=bfJ8TwqOYBPLe2Jfc9MfbErDUCMQktg@mail.gmail.com>
 <MA0PR01MB567180C0FE89E3BEBAF2B12EFEC42@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
 <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MdX6KiGk1zBRK3bZpN3iM16-8mDq40sTez6YO2kJEq0zQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_042132_580188_EDD51A77 
X-CRM114-Status: GOOD (  16.26  )
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

SGkgQmFydG9zeiBHb2xhc3pld3NraToKCk9uIDA5OjM3IEZyaSAyMSBGZWIgICAgICwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiBPbiBGcmksIEZlYiAyMSwgMjAyNSBhdCAxMjozNuKAr0FN
IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4g
T24gMjAyNS8yLzIwIDIxOjM0LCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+ID4gPiBPbiBN
b24sIEZlYiAxNywgMjAyNSBhdCAxOjU44oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+
IHdyb3RlOgo+ID4gWy4uLi4uLl0KPiA+ID4+ICsjZGVmaW5lIHRvX3NwYWNlbWl0X2dwaW9fYmFu
ayh4KSBjb250YWluZXJfb2YoKHgpLCBzdHJ1Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5rLCBnYykKPiA+
ID4+ICsKPiA+ID4+ICtzdHJ1Y3Qgc3BhY2VtaXRfZ3BpbzsKPiA+ID4+ICsKPiA+ID4+ICtzdHJ1
Y3Qgc3BhY2VtaXRfZ3Bpb19iYW5rIHsKPiA+ID4+ICsgICAgICAgc3RydWN0IGdwaW9fY2hpcCAg
ICAgICAgICAgICAgICBnYzsKPiA+ID4+ICsgICAgICAgc3RydWN0IHNwYWNlbWl0X2dwaW8gICAg
ICAgICAgICAqc2c7Cj4gPiA+PiArICAgICAgIHZvaWQgX19pb21lbSAgICAgICAgICAgICAgICAg
ICAgKmJhc2U7Cj4gPiA+PiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW5kZXg7Cj4gPiA+PiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXJx
X21hc2s7Cj4gPiA+PiArICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaXJx
X3Jpc2luZ19lZGdlOwo+ID4gPj4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlycV9mYWxsaW5nX2VkZ2U7Cj4gPiA+PiArfTsKPiA+ID4+ICsKPiA+ID4+ICtzdHJ1Y3Qg
c3BhY2VtaXRfZ3BpbyB7Cj4gPiA+PiArICAgICAgIHN0cnVjdCAgZGV2aWNlICAgICAgICAgICAg
ICAgICAgKmRldjsKPiA+ID4+ICsgICAgICAgc3RydWN0ICBzcGFjZW1pdF9ncGlvX2JhbmsgICAg
ICBzZ2JbTlJfQkFOS1NdOwo+ID4gPj4gK307Cj4gPiA+IFBsZWFzZSBkb24ndCB1c2UgdGFicyBp
biBzdHJ1Y3QgZGVmaW5pdGlvbnMuCj4gPgo+ID4gV2h5IG5vdO+8n0kgc2VlCj4gPiBodHRwczov
L3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL21haW50YWluZXItdGlwLmh0
bWwjc3RydWN0LWRlY2xhcmF0aW9ucy1hbmQtaW5pdGlhbGl6ZXJzCj4gPgo+IAo+IFRoaXMgaXMg
Zm9yIHRoZSB0aXAgdHJlZSwgbm90IHRyZWV3aWRlLgo+IAo+IEl0J3MgbXkgcGVyc29uYWwgbWFp
bnRhaW5lciBwcmVmZXJlbmNlLiBXZSBkbyB1c2UgYm90aCB1bmRlcgo+IGRyaXZlcnMvZ3Bpby8g
YnV0IEkgcHJlZmVyIG5vLXRhYnMgaW4gbmV3IGNvZGUuCj4gCgp0aGFua3MgZm9yIHRoaXMgZXhw
bGFuYXRpb24uLgoKbXkgaW50ZW50aW9uIHdhcyB0cnlpbmcgdG8ga2VlcCBzdHJ1Y3QgbWVtYmVy
cyBhbGlnbmVkCmlmIHRhYnMgaXMgYSBuby1nbywgd291bGQgdXNpbmcgbXVsdGkgYmxhbmsgc3Bh
Y2VzIHRvIGFsaWduIGJlIGFjY2VwdGFibGU/Cgpzb21ldGhpbmcgbGlrZToKCnN0cnVjdCBzcGFj
ZW1pdF9ncGlvX2JhbmsgewoJc3RydWN0IGdwaW9fY2hpcCAgICAgICBnYzsKCXN0cnVjdCBzcGFj
ZW1pdF9ncGlvICAgKnNnOwoJdm9pZCAgIF9faW9tZW0gICAgICAgICAqYmFzZTsKICAgICAgIC4u
Lgp9Cgo+IEJhcnQKCi0tIApZaXh1biBMYW4gKGRsYW4pCkdlbnRvbyBMaW51eCBEZXZlbG9wZXIK
R1BHIEtleSBJRCBBQUJFRkQ1NQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
