Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9518FE77188
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2024 05:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJP+XEmEvjTJYs17lP76Jn+AbwtaYijRf4sCAsGLNPM=; b=ru0HxuiOfHlo5B
	FWjIMV38TCtj3xCaarhgXHt15I72pkxieA7qVrg0fkoEXXC7i63Ya9S7tQnCcU18Zcl3UinmnNxBG
	w8s6zQBY8vgGqQWyaqBwgDYwptuPHqPfdliMNCZSKMHtZYp8zJ8Qkr7Qm2q/oUPCmHrCsaycxTdSQ
	R9+09hqHyg+9DTGxsUlUq/2a8iWMuzHoShOmX+nMIIjzsQ6cId2zkSyO4Orai0M8y9w3MQQdq7MYr
	+xsc1VnT85EfhmosvtLxw3LsqWgZZoNGdcmfRXQWeIDV16zIsmyevTJbSkjEilEUp5ddl1VLFpExg
	VY4EjGZQTVflPLazOQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRPDm-00000001Pn2-3prL;
	Sat, 28 Dec 2024 05:18:42 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRPDh-00000001Pm8-0zND
	for linux-riscv@lists.infradead.org;
	Sat, 28 Dec 2024 05:18:41 +0000
Date: Sat, 28 Dec 2024 13:18:24 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20241228051824-GYA1079860@gentoo>
References: <20241225-03-k1-gpio-v3-0-27bb7b441d62@gentoo.org>
 <20241225-03-k1-gpio-v3-1-27bb7b441d62@gentoo.org>
 <CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZPD2C2iPwOX_kW1Ug8jVkdHhhc7iFycHtzj5LQ0XWNgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_211837_309159_0DA63635 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTGludXM6Cgp0aGFua3MgZm9yIHlvdXIgcmV2aWV3CgpPbiAxNzozNCBGcmkgMjcgRGVjICAg
ICAsIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24gV2VkLCBEZWMgMjUsIDIwMjQgYXQgMTozM+KA
r0FNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiAKPiA+IFRoZSBHUElPIGNv
bnRyb2xsZXIgb2YgSzEgc3VwcG9ydCBiYXNpYyBmdW5jdGlvbnMgYXMgaW5wdXQvb3V0cHV0LAo+
ID4gYWxsIHBpbnMgY2FuIGJlIHVzZWQgYXMgaW50ZXJydXB0IHdoaWNoIHJvdXRlIHRvIG9uZSBJ
UlEgbGluZSwKPiA+IHRyaWdnZXIgdHlwZSBjYW4gYmUgc2VsZWN0IGJldHdlZW4gcmlzaW5nIGVk
Z2UsIGZhaWxpbmcgZWRnZSwgb3IgYm90aC4KPiA+IFRoZXJlIGFyZSBmb3VyIEdQSU8gYmFua3Ms
IGVhY2ggY29uc2lzdGluZyBvZiAzMiBwaW5zLgo+ICguLi4pCj4gPiArZGVzY3JpcHRpb246Cj4g
PiArICBUaGUgY29udHJvbGxlcidzIHJlZ2lzdGVycyBhcmUgb3JnYW5pemVkIGFzIHNldHMgb2Yg
ZWlnaHQgMzItYml0Cj4gPiArICByZWdpc3RlcnMgd2l0aCBlYWNoIHNldCBjb250cm9sbGluZyBh
IGJhbmsgb2YgdXAgdG8gMzIgcGlucy4gIEEgc2luZ2xlCj4gPiArICBpbnRlcnJ1cHQgaXMgc2hh
cmVkIGZvciBhbGwgb2YgdGhlIGJhbmtzIGhhbmRsZWQgYnkgdGhlIGNvbnRyb2xsZXIuCj4gCj4g
SSBsb29rZWQgYXQgdGhlIGRyaXZlciBhbmQgY2FtZSB0byB0aGUgY29uY2x1c2lvbiB0aGF0IGl0
J3MgYmV0dGVyIHRvIHVzZQo+IDQgZGlmZmVyZW50IGluc3RhbmNlcyBvZiB0aGUgY2hpcCwgb25l
IGZvciBlYWNoIHNldCBvZiAzMmJpdCByZWdpc3RlcnMsCj4gc28gdGhlc2UgNCBHUElPIGNvbnRy
b2xsZXJzIGFyZSBpbnN0YW50aWF0ZWQgc2VwYXJhdGVseS4KPiAKc291bmRzIGdvb2QgdG8gbWUs
IEkgd2lsbCB3b3JrIGFjY29yZGluZyB0byB0aGlzIGluIG5leHQgdmVyc2lvbgoKPiBUaGUgb3Bl
cmF0aW5nIHN5c3RlbSBjYW4gaGFuZGxlIHRoZSBzaGFyZWQgaW50ZXJydXB0LCB0aGVyZSBpcyBu
bwo+IG5lZWQgdG8gdXNlIGEgc2luZ2xlIGRldmljZSBpbnN0YW5jZSBqdXN0IGJlY2F1c2UgdGhl
IGludGVycnVwdCBpcwo+IHNoYXJlZC4KPiAKPiBEVCBiaW5kaW5ncyBhcmUgb3BlcmF0aW5nIHN5
c3RlbSBuZXV0cmFsLCBidXQgZm9yIGV4YW1wbGUgaW4gTGludXgKPiAoaWYgd2UgcHJldGVuZCB0
aGlzIGlzIGp1c3Qgb25lIHBvc3NpYmxlIGV4YW1wbGUpIHRoZW4gYSBkcml2ZXIKPiBoYW5kbGlu
ZyBhIHNoYXJlZCBJUlEgY2FuIGJlIHJlcXVlc3RlZCB3aXRoIHRoZSBmbGFnIElSUUZfU0hBUkVE
Cj4gYW5kIHRoZSBkcml2ZXIgY2FuIGp1c3QgcmV0dXJuIElSUV9IQU5ETEVEIGlmIGl0IGhhbmRs
ZWQgYW4gSVJRCj4gb3IgSVJRX05PTkUgaWYgaXQgZGlkbid0IGhhbmRsZSB0aGUgaXJxIChzbyBv
dGhlciBpbnN0YW5jZXMgY2FuCj4gaGFuZGxlIGl0KS4KPiAKYWdyZWUsIG1ha2Ugc2Vuc2UKCj4g
WW91cnMsCj4gTGludXMgV2FsbGVpagoKLS0gCllpeHVuIExhbiAoZGxhbikKR2VudG9vIExpbnV4
IERldmVsb3BlcgpHUEcgS2V5IElEIEFBQkVGRDU1CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
