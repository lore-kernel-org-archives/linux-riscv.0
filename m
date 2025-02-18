Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98CCC02198
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9fN9p50ro+qvvc040ESFI4ATgK+PvCVF1/wU4OSIzw=; b=3j8nYyAnCdrHgS
	3KAzEGnIvztsnAZH4vjDbKpZgIOd6AYS4ZpN7+wqdWbEVmcWFk1zhLs1PS4gEwDFgJ+RWhvDxGaf0
	kTBoCNL1UCg0yku46o+PzlNLZFoLcGchb3FLsg9NANdoENdOCEES4Y7zMK7hRUAAH2cVFEpi0Lt6l
	3qvKUtyAxuWjSzzR9gD7uyK3WqzFjgGdInjXVJPIIteUfQyHN/q3eizmdh3KQVjoWFZOTHMQjKzvy
	2CYHJNcGi3qMjuYOeJSwmGBWAVN4QKpLEY3Y73Im6MxBImRlZ4a24dBvtt2HqGtk5R18HibR97qc1
	0Pe56pkuIoqocFLHl0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKWp-00000007fxB-2Zdy;
	Tue, 18 Feb 2025 10:08:35 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKKQ-00000007cas-23uM
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 09:55:47 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0DE22343022;
	Tue, 18 Feb 2025 09:55:44 +0000 (UTC)
Date: Tue, 18 Feb 2025 09:55:40 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20250218095540-GYA29065@gentoo>
References: <20250123113042-GYA38135@gentoo>
 <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org>
 <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com>
 <20250206133156-GYA5687@gentoo>
 <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
 <20250214115410-GYA21743@gentoo>
 <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdaQZ5wJ0S=FfTzBkZOfCE7zvTPQ-wn53rHcZztbHLC8xQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_015546_549464_F090E3F7 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTGludXM6CgpPbiAxMDo0NCBUdWUgMTggRmViICAgICAsIExpbnVzIFdhbGxlaWogd3JvdGU6
Cj4gT24gRnJpLCBGZWIgMTQsIDIwMjUgYXQgMTI6NTTigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2Vu
dG9vLm9yZz4gd3JvdGU6Cj4gCj4gPiB0aGFua3MgZm9yIHRoaXMgdmVyeSBkZXRhaWwgcHJvdG90
eXBlISBpdCB3b3JrcyBtb3N0bHksIHdpdGggb25lIHByb2JsZW06Cj4gPgo+ID4gaG93IHRvIG1h
cCBncGlvIGNvcnJlY3RseSB0byB0aGUgcGluIGZyb20gcGluY3RybCBzdWJzeXN0ZW0/Cj4gPgo+
ID4gZm9yIGV4YW1wbGUsIEkgc3BlY2lmeSBncGlvLXJhbmdlcyBpbiBkdHMsIHRoZW4KPiA+ICAg
ICAgICAgICAgICAgICBncGlvMDogZ3Bpb0BkNDAxOTAwMCB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LGsxLWdwaW8iOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MCAweGQ0MDE5MDAwIDB4MCAweDEwMD47Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAuLi4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8tcmFu
Z2VzID0gPCZwaW5jdHJsIDAgMCA5Nj47Cj4gPiAgICAgICAgICAgICAgICAgfTsKPiA+Cj4gPiAg
ICAgICAgICAgICAgICAgZm9vLWdwaW9zID0gPCZncGlvMCAyIDI4IEdQSU9fQUNUSVZFX0xPVz47
Cj4gPgo+ID4gSXQgc2hvdWxkIGdldCBHUElPXzkyICggOTIgPSAyICogMzIgKyAyOCksIGJ1dCB0
dXJucyBvdXQgR1BJT18yOAo+ID4KPiA+IFByb2JhYmx5IHRoZXJlIGlzIHNvbWV0aGluZyBJIG1p
c3NlZC4uLgo+IAo+IE5vIGl0J3MganVzdCBtZSBtaXNzaW5nIHRoZSBjb21wbGV4aXR5IQo+IAo+
ID4gdG8gbWFrZSB0aGUgZ3BpbyBwYXJ0IHdvcmssIHdlIG5lZWQgYWRkaXRpb25hbCBjdXN0b20g
Z3Bpby1yYW5nZXMgcGFyc2VyLAo+ID4gd2hpY2ggc2hvdWxkIHNpbWlsYXIgdG8gb2ZfZ3Bpb2No
aXBfYWRkX3Bpbl9yYW5nZSgpIGluIGdwaW9saWItb2YuYwo+ID4gKGF0IGxlYXN0IGdwaW8gY29y
ZSBuZWVkIHRvIGFkanVzdCB0byBjYWxsIGN1c3RvbSB0aGlzIGZ1bmN0aW9uKQo+IAo+IExldCBt
ZSBzZW5kIGEgcGF0Y2ggc2V0IHRvIGJyaW5nIHRocmVlY2VsbCBpbnRvIHRoZSBjb3JlIGluc3Rl
YWQsCj4gYW5kIHNlZSBpZiBpdCB3b3JrcyBmb3IgeW91IQo+IAo+IEkgd2lsbCBwb3N0IGl0IHJl
YWwgc29vbi4KPiAKY2FuIHlvdSBjaGVjayB0aGUgdjUgb2YgdGhlIHBhdGNoIGhlcmUgWzFdPyB3
aGljaCBJIGp1c3Qgc2VudCBvdXQgeWVzdGVyZGF5Cml0IGRvZXMgMSkgaW1wbGVtZW50IHhsYXRl
KCkgMikgaW5zdHJvZHVjZSBjdXN0b20gYWRkX3Bpbl9wYWdlKCkKdGhlIGdwaW8gcGFydCB3b3Jr
cyBhcyBJIHRlc3RlZCwgdGhlIGdwaW8gaXJxIHByb2JhYmx5IG5lZWQgbW9yZSB0ZXN0aW5nCgo+
IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFj
ZW1pdC8yMDI1MDIxNy0wMy1rMS1ncGlvLXY1LTAtMjg2M2VjM2U3YjY3QGdlbnRvby5vcmcvCgot
LSAKWWl4dW4gTGFuIChkbGFuKQpHZW50b28gTGludXggRGV2ZWxvcGVyCkdQRyBLZXkgSUQgQUFC
RUZENTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
