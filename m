Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01259C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CueycqKP9SIlmHhG6uHOHu4SGunxRbfRqVdxRfNjqis=; b=FLOXt7zThLtUGS
	pj1hz0yGeFWVJQyG+XXsy1wQk0/H+I/8ebWOsgpuMQ0pPpJiwF51131W1V+Xs3gs4L4j7ODzE7CbI
	B4ZKTyJIZbZrHW3BO1Cl2TkdMXaEvcU4kr7m1aokO5a3u8uAkUkyrUSB1OYnuibjVvGba/tY/9r+Z
	ntIj/kD9FzxfyhvAdTDUHktnRjhzvFuAcGuvQ51ekf48dKSymYDm+T29DkIOjDXEQDfpSG/MXmIpC
	JrpYLI/XXxAY+RsC6jJ90QsOwhhH7SM1f5BQ7k6P/RBHpKyDKH5LVIrR0in6IP74hKVLt4Wm+JhYX
	0eqSo9SKmZSGiWEoMRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpU5b-001vLf-GS; Tue, 23 Nov 2021 11:35:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpU5Y-001vL5-53
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 11:35:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso1927000wmr.4
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 03:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eAAW0gxyL3spMyvFzNZU55TiEHcEGOqrLOJJuSa53K4=;
 b=4DcfipfNqoq+i8lFBnrntKi3GtNw6X6goztOuq6ZWKhQSuytROlnv18WHcqZhYeh7c
 GVU/3OFgl1BHcS7c/eSK80Hd36UAWzHFaJQ7HvRGjxLRLvpehVgy/qTdPSxdV6jRIKiv
 KUBmhXNq4YZ4w4kuOliUyM4YnBMkn32OaZgo2ZnT5yRTOGg+SKtgVsnOrk+YNVJYy4lD
 7TEDEgB7kTo/0ZPFJUO/BGCiAWb/fgXgFHc2FALVFLl/gTQYgATMGes7lqe/uUECmQQU
 R5HUDVzCCKPG4/3yDD7kX7/tYF3JE3XCuXq1TzyesuDP+b2eYPrk/jOyI/1Nqgi6l4DO
 DWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eAAW0gxyL3spMyvFzNZU55TiEHcEGOqrLOJJuSa53K4=;
 b=uR17C5G9kSQNNoo3qT+uQdHpT2dbNRyQUzILl+rX9dZ8ZGOui6NyJaDO7apyhZh7ZS
 Ks9lM7ltoc3nV+at9PHNzIeSjU0cIMCCiQ9pe1YMCROnIhukZL71sFciOPcmZop71gYH
 /6Wn+KT0IMlk0m80A3t51D3FYmK7vRxc5proAbZysYor5zeziE1f15Upfr3MmnQfdYJH
 IHQsa+3Bty/a/TDpT5n/BfBorEKH+/T8sPAMMOul52prMU1FmAgG/zs+xOLAVSi/UUm+
 EffCkrMHXF8put9Er1G4OIeRxxHnhuq0ltj0aBmzYb6ru/7hW2ZxtNBgR9G6rLHLK3CA
 Z+sQ==
X-Gm-Message-State: AOAM533473LnABXe+68TPKGFoSBclhnIwZ474SGyhEdhe06q6yYBeR6E
 tWaTnyz9FQ7NGW7ImhY2U9vhzM3bawxI18zh9xI+Aw==
X-Google-Smtp-Source: ABdhPJyDTgRgvUuV98CyCHfOL5hAURr2qDU4kKqY5aPJ10aLAJMLU+4E45XfCOWPhiTSevTsW28+O1m1n9x86/UMTho=
X-Received: by 2002:a7b:c017:: with SMTP id c23mr2193327wmb.137.1637667350407; 
 Tue, 23 Nov 2021 03:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-2-conor.dooley@microchip.com>
 <272946671.hFph3VMliC@diego>
In-Reply-To: <272946671.hFph3VMliC@diego>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 17:05:38 +0530
Message-ID: <CAAhSdy2yr+a7=7Crk7s3pAVbVcYjTdOtRfAaQXBkTVsUpfG20g@mail.gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: interrupt-controller: create a header
 for RISC-V interrupts
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, bgolaszewski@baylibre.com, 
 Rob Herring <robh+dt@kernel.org>, jassisinghbrar@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, 
 broonie@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lewis.hanly@microchip.com, 
 conor.dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>, 
 Atish Patra <atish.patra@wdc.com>, ivan.griffin@microchip.com, 
 linux-gpio@vger.kernel.org, DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-crypto@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_033552_269544_739D92F8 
X-CRM114-Status: GOOD (  19.99  )
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

T24gVHVlLCBOb3YgMjMsIDIwMjEgYXQgNDozOCBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1vbnRhZywgOC4gTm92ZW1iZXIgMjAyMSwgMTY6MDU6NDIg
Q0VUIHNjaHJpZWIgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb206Cj4gPiBGcm9tOiBJdmFuIEdy
aWZmaW4gPGl2YW4uZ3JpZmZpbkBtaWNyb2NoaXAuY29tPgo+ID4KPiA+IFByb3ZpZGUgbmFtZWQg
aWRlbnRpZmllcnMgZm9yIGRldmljZSB0cmVlIGZvciBSSVNDLVYgaW50ZXJydXB0cy4KPiA+Cj4g
PiBMaWNlbnNlZCB1bmRlciBHUEwgYW5kIE1JVCwgYXMgdGhpcyBmaWxlIG1heSBiZSB1c2VmdWwg
dG8gYW55IE9TIHRoYXQKPiA+IHVzZXMgZGV2aWNlIHRyZWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogSXZhbiBHcmlmZmluIDxpdmFuLmdyaWZmaW5AbWljcm9jaGlwLmNvbT4KPiA+IFNpZ25lZC1v
ZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiAtLS0K
PiA+ICAuLi4vaW50ZXJydXB0LWNvbnRyb2xsZXIvcmlzY3YtaGFydC5oICAgICAgICAgfCAxOSAr
KysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykK
PiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9yaXNjdi1oYXJ0LmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdi1oYXJ0LmggYi9pbmNsdWRlL2R0LWJpbmRp
bmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jpc2N2LWhhcnQuaAo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTFjMzJmNjA5MGFjCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Jp
c2N2LWhhcnQuaAo+ID4gQEAgLTAsMCArMSwxOSBAQAo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpICovCj4gPiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjEgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5jLiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4KPiA+
ICsgKi8KPiA+ICsKPiA+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19JTlRFUlJVUFRfQ09OVFJPTExF
Ul9SSVNDVl9IQVJUX0gKPiA+ICsjZGVmaW5lIF9EVF9CSU5ESU5HU19JTlRFUlJVUFRfQ09OVFJP
TExFUl9SSVNDVl9IQVJUX0gKPiA+ICsKPiA+ICsjZGVmaW5lIEhBUlRfSU5UX1VfU09GVCAgIDAK
PiA+ICsjZGVmaW5lIEhBUlRfSU5UX1NfU09GVCAgIDEKPiA+ICsjZGVmaW5lIEhBUlRfSU5UX01f
U09GVCAgIDMKPiA+ICsjZGVmaW5lIEhBUlRfSU5UX1VfVElNRVIgIDQKPiA+ICsjZGVmaW5lIEhB
UlRfSU5UX1NfVElNRVIgIDUKPiA+ICsjZGVmaW5lIEhBUlRfSU5UX01fVElNRVIgIDcKPiA+ICsj
ZGVmaW5lIEhBUlRfSU5UX1VfRVhUICAgIDgKPiA+ICsjZGVmaW5lIEhBUlRfSU5UX1NfRVhUICAg
IDkKPiA+ICsjZGVmaW5lIEhBUlRfSU5UX01fRVhUICAgIDExCj4KPiAoMSkgRnJvbSBjaGVja2lu
ZyBjbGljIGRvYyBbMF0gSSBzZWUgYW4gYWRkaXRpb25hbAo+ICAgICAgICAgMTIgICBDTElDIHNv
ZnR3YXJlIGludGVycnVwdAo+IGRlZmluZWQuCgpMb2NhbCBJUlEgIzEyIGlzIGZvciBTLW1vZGUg
Z3Vlc3QgZXh0ZXJuYWwgaW50ZXJydXB0cyBhcy1wZXIKdGhlIHJhdGlmaWVkIEgtZXh0ZW5zaW9u
IHNwZWNpZmljYXRpb24uCgpJIGd1ZXNzIENMSUMgc3BlYyBuZWVkcyB0byBiZSB1cGRhdGVkLgoK
UmVnYXJkcywKQW51cAoKPgo+ICgyKSBUaGUgZG9jIHN0YXRlcyB0aGF0IHRoZSBvcmRlcmluZyBp
cyBhIHJlY29tbWVuZGF0aW9uIGFuZAo+ICAgICAgICAgIm5vdCBtYW5kYXRvcnkgaW4gYWxsIGlu
Y2FybmF0aW9ucyBvZiB0aGUgQ0xJQyIKPiBJcyB0aGF0IGNsYXJpZmllZCBzb21ld2hlcmUgZWxz
ZSB0aGF0IHRoaXMgbW9yZSB0aGFuIHJlY29tbWVuZGVkPwo+Cj4gVGhhbmtzCj4gSGVpa28KPgo+
Cj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1mYXN0LWludGVycnVwdC9ibG9i
L21hc3Rlci9jbGljLmFkb2MKPgo+ID4gKwo+ID4gKyNlbmRpZiAvKiBfRFRfQklORElOR1NfSU5U
RVJSVVBUX0NPTlRST0xMRVJfUklTQ1ZfSEFSVF9IICovCj4gPgo+Cj4KPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
