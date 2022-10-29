Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C89C38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 08:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2FMQCaSTOIKlTqNFGhU7wQJCA/z1pep+B+JQY6Vhb0=; b=4YtIOyTRQujL1X
	1fzdj79Bvvjct2McjR//L2BVvSG80UWovZidOcFK9iiax/PDL8Ak3shNxVXqKaJMXkf6i71qz19G8
	82Fng6/m1Z2UF4Vo3QxZwYBXuO/w3aWC+IzCfs8LF+38tl1dYFyt1eQF5vU4XkPd12Upp10MTJcdT
	lMC7i6OuwxKf27HAVUlInfXL4j7voor3Tr9MotEwnz9bxfNQmANXgidY52OA2VLIIljRjIrUR9+I9
	llGL6OQelvqC5W4AbVpI+5URoDW+1I7yx6sGSZAkHSvgtuDBnk4hXxQjNAFB6mrrseMDF7+GhpL1H
	cRMW24md1CakxcBQIAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooh3Z-005Gq7-NA; Sat, 29 Oct 2022 08:19:05 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooh3W-005GoS-Hy
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 08:19:05 +0000
X-QQ-mid: bizesmtp87t1667031502tp57gzwl
Received: from [192.168.1.231] ( [183.27.97.92])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 29 Oct 2022 16:18:20 +0800 (CST)
X-QQ-SSF: 01000000000000B0B000B00A0000000
X-QQ-FEAT: Xz3VOcA7Mr0ufGvzXNoh6TuMbfMiHqSs6DvufBwTWeiVDGCqal+16D3xUcS7i
	q9kSmz8gLzMGhc8x8OoKNlpzjIq0e8/fH3+5jlI9NSeobDa9jGYkSQbFKkg4H0gJWh9/G23
	7tw+RvBRwMl0FX9FrPxMqJq5r6xVUvqx+QOpktPeyA8l/Y/3Gf95fd1UhMZNbzT06JZNZ5b
	v0zY/R2sDa28NowoPGrmKkegKld3MOhCBxE3jBs+EWTAq1pAZxh31RXB3wb583vqs59F0BN
	EIhECwE/YFE5BOXou4yXGRpnS6k4ydyHq2AJpe1LkDAbkQwbjn2cXaCEOCqSsgN8KiZMNoq
	NzMJnGWICgOSvXbErIKUikk96KsLQXHEoGc3PyD0X/oa3hf4Nw=
X-QQ-GoodBg: 0
Message-ID: <45F9A056FE1D6D23+fa337149-3574-1687-0695-15e554e24cbd@linux.starfivetech.com>
Date: Sat, 29 Oct 2022 16:18:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 28/30] RISC-V: Add StarFive JH7110 VisionFive2 board
 device tree
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220930075353.6842-1-hal.feng@linux.starfivetech.com>
 <YzghKZ2E8AN1ajnI@spud>
Content-Language: en-US
From: Hal Feng <hal.feng@linux.starfivetech.com>
In-Reply-To: <YzghKZ2E8AN1ajnI@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_011902_945714_CE33949C 
X-CRM114-Status: GOOD (  31.72  )
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

T24gU2F0LCAxIE9jdCAyMDIyIDEyOjE0OjQ5ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
T24gRnJpLCBTZXAgMzAsIDIwMjIgYXQgMDM6NTM6NTNQTSArMDgwMCwgSGFsIEZlbmcgd3JvdGU6
Cj4gPiBGcm9tOiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+ID4gCj4g
PiBBZGQgYSBtaW5pbWFsIGRldmljZSB0cmVlIGZvciBTdGFyRml2ZSBKSDcxMTAgVmlzaW9uRml2
ZTIgYm9hcmQuCj4gPiBTdXBwb3J0IGJvb3RpbmcgYW5kIGJhc2ljIGNsb2NrL3Jlc2V0L3BpbmN0
cmwvdWFydCBkcml2ZXJzLgo+ID4KPiAKPiBJIHdvdWxkIGxpa2UgdG8gc2VlIGEgbGluayB0byB0
aGUgcHVibGljbHkgYXZhaWxhYmxlIGRhdGFzaGVldCBvcgo+IGRvY3VtZW50YXRpb24gZm9yIHRo
ZSBib2FyZCAoYW5kIGZvciB0aGUgU29DIGluIHBhdGNoIDI4KSBwbGVhc2UuCgpBbGwgZG9jdW1l
bnRzIGNhbiBiZSBmb3VuZCBhdCBSVnNwYWNlIERvY3VtZW50YXRpb24gQ2VudGVyIG1haW50YWlu
ZWQKYnkgU3RhckZpdmUuIFRoZSByZWxhdGVkIGRvY3VtZW50cyBvZiBKSDcxMTAgU29DIGFuZCBW
aXNpb25GaXZlMiBib2FyZAphcmUgYXMgZm9sbG93cy4KClN0YXJGaXZlIEpINzExMCBTb0M6Cmh0
dHBzOi8vZG9jLWVuLnJ2c3BhY2Uub3JnL0RvY19DZW50ZXIvamg3MTEwLmh0bWwKU3RhckZpdmUg
VmlzaW9uRml2ZTIgYm9hcmQ6Cmh0dHBzOi8vZG9jLWVuLnJ2c3BhY2Uub3JnL0RvY19DZW50ZXIv
dmlzaW9uZml2ZV8yLmh0bWwKCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0
aGluZyA8a2VybmVsQGVzbWlsLmRrPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlhbmxvbmcgSHVhbmcg
PGppYW5sb25nLmh1YW5nQHN0YXJmaXZldGVjaC5jb20+Cj4gCj4gRGl0dG8gZnJvbSBwYXRjaCAy
OCByZTogdGhlIFNvQiBjaGFpbi4KPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwu
ZmVuZ0BsaW51eC5zdGFyZml2ZXRlY2guY29tPgo+ID4gLS0tCj4gCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS12
Mi5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNp
b25maXZlLXYyLmR0cwo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uNmI5ZmUzMmM3ZWFjCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLXYyLmR0cwo+ID4g
QEAgLTAsMCArMSw5MSBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
IE9SIE1JVAo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIyIFN0YXJGaXZlIFRlY2hu
b2xvZ3kgQ28uLCBMdGQuCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIyIEVtaWwgUmVubmVyIEJl
cnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4gPiArICovCj4gPiArCj4gPiArL2R0cy12MS87Cj4g
PiArI2luY2x1ZGUgImpoNzExMC5kdHNpIgo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlv
L2dwaW8uaD4KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9waW5jdHJsLXN0YXJm
aXZlLWpoNzExMC5oPgo+ID4gKwo+ID4gKy8gewo+ID4gKwltb2RlbCA9ICJTdGFyRml2ZSBWaXNp
b25GaXZlIFYyIjsKPiA+ICsJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSx2aXNpb25maXZlLXYyIiwg
InN0YXJmaXZlLGpoNzExMCI7Cj4gPiArCj4gPiArCWFsaWFzZXMgewo+ID4gKwkJc2VyaWFsMCA9
ICZ1YXJ0MDsKPiA+ICsJfTsKPiAKPiBTaG91bGQgd2UgYWxzbyBoYXZlIGEgY2hvc2VuIG5vZGUg
aGVyZT8KCldpbGwgYWRkIGl0LiBUaGFua3MuCgo+IAo+ID4gKwo+ID4gKwljcHVzIHsKPiA+ICsJ
CXRpbWViYXNlLWZyZXF1ZW5jeSA9IDw0MDAwMDAwPjsKPiA+ICsJfTsKPiA+ICsKPiA+ICsJbWVt
b3J5QDQwMDAwMDAwIHsKPiA+ICsJCWRldmljZV90eXBlID0gIm1lbW9yeSI7Cj4gPiArCQlyZWcg
PSA8MHgwIDB4NDAwMDAwMDAgMHgxIDB4MD47Cj4gCj4gV2hhdCBpcyBnb2luZyB0byBoYXBwZW4g
dG8gdGhlIDIgR0IgdmFyaWFudCBpZiB0aGV5IGF0dGVtcHQgdG8gdXNlIHRoaXMKPiBkZXZpY2V0
cmVlPwoKVGhlIFZpc2lvbkZpdmUyIGJvYXJkIG5vdyBoYXMgNEdCIHZlcnNpb24gYW5kIDhHQiB2
ZXJzaW9uIG9ubHkuIEJlZm9yZQpsaW51eCBzdGFydHVwLCB3ZSB3aWxsIGNoYW5nZSB0aGlzIHBy
b3BlcnR5IGluIGR0YiB0aHJvdWdoIHUtYm9vdCB0bwptYWtlIHN1cmUgdGhlIGJvYXJkIGNhbiBi
b290IHVwIHdpdGggdGhlIGNvcnJlY3QgbWVtb3J5IHNpemUuCgo+IAo+ID4gKwl9Owo+ID4gKwo+
ID4gKwlyZXNlcnZlZC1tZW1vcnkgewo+ID4gKwkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gPiAr
CQkjc2l6ZS1jZWxscyA9IDwyPjsKPiA+ICsJCXJhbmdlczsKPiA+ICsKPiA+ICsJCWxpbnV4LGNt
YSB7Cj4gPiArCQkJY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwo+ID4gKwkJCXJldXNh
YmxlOwo+ID4gKwkJCXNpemUgPSA8MHgwIDB4MjAwMDAwMDA+Owo+ID4gKwkJCWFsaWdubWVudCA9
IDwweDAgMHgxMDAwPjsKPiA+ICsJCQlhbGxvYy1yYW5nZXMgPSA8MHgwIDB4YTAwMDAwMDAgMHgw
IDB4MjAwMDAwMDA+Owo+ID4gKwkJCWxpbnV4LGNtYS1kZWZhdWx0Owo+ID4gKwkJfTsKPiA+ICsK
PiA+ICsJCWUyNF9tZW06IGUyNEBjMDAwMDAwMCB7Cj4gCj4gSSBoYWQgYSBjb252ZXJzYXRpb24g
cHJldmlvdXNseSB3aXRoIEljZW5vd3kgWzBdIGFib3V0IHRoZSBlMjQgb24gdGhlCj4gamg3MTAw
IHRoYXQgZGlkbid0IHJlYWxseSBjb21lIHRvIGEgY29uY2x1c2lvbiBhYm91dCBob3cgdG8gcmVw
cmVzZW50Cj4gaXQgdGhlcmUgLSBidXQgbG9va3MgbGlrZSB5b3UndmUgZGVjaWRlZCB0aGF0IGl0
IHNob3VsZCBiZSBhIHJlbW90ZXByb2MKPiBmb3IgdGhlIGpoNzEwMD8KClllcywgd2UgdHJlYXQg
aXQgYXMgYSByZW1vdGVwcm9jIG91dHNpZGUgdGhlIGNwdXMgbm9kZS4gQnV0IGFmdGVyCmNvbW11
bmljYXRpb24gd2l0aCBteSBjb2xsZWFndWVzLCBJIGZvdW5kIHRoYXQgYWxsIG5vZGVzIGluCiJy
ZXNlcnZlZC1tZW1vcnkiIGFyZSBub3QgdXNlZCBpbiB0aGUgbWluaW1hbCBzdXBwb3J0IGZvciBW
aXNpb25GaXZlMgpib2FyZC4gU28gZm9yIHRoaXMgc2VyaWVzLCBJIHdvdWxkIGxpa2UgdG8gcmVt
b3ZlICJyZXNlcnZlZC1tZW1vcnkiCmluIHYyLgoKPiAKPiBJcyB0aGlzIGFub3RoZXIgc2l0dWF0
aW9uIHdoZXJlIHBlcmlwaGVyYWxzIGFwcGVhciBhdCBkaWZmZXJlbnQKPiBhZGRyZXNzZXMgZm9y
IHRoZSBlMjQgY29tcGFyZWQgdG8gdGhlIHU3NHM/IE9yIGhhcyB0aGF0IGNoYW5nZWQgZm9yIHRo
ZT4gamg3MTAwLCBhbmQgcmVhbGx5IHRoZSBlMjQgc2hvdWxkIGJlIGRlc2NyaWJlZCBpbiB0aGUg
Q1BVcyBub2RlPyBJZiBpdAo+IGlzIHRoZSBsYXR0ZXIsIHlvdSBjYW4gcGljayB0aGUgZmlyc3Qg
cGF0Y2ggZnJvbSBbMF0gaW50byB5b3VyIHNlcmllcy4KPiAKPiAwIC0gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvZTg1NDM4MzhjZDIyMWFiNjY5OWRhMTZjOTg1ZWVkNzUxNGRh
YTc4Ni5jYW1lbEBpY2Vub3d5Lm1lPiA+ICsJCQlyZWcgPSA8MHgwIDB4YzAxMTAwMDAgMHgwIDB4
ZjAwMDA+Owo+ID4gKwkJCW5vLW1hcDsKPiA+ICsJCX07Cj4gPiArCj4gPiArCQl4cnBfcmVzZXJ2
ZWQ6IHhycGJ1ZmZlckBmMDAwMDAwMCB7Cj4gCj4gIkZvbGxvd2luZyB0aGUgZ2VuZXJpYy1uYW1l
cyByZWNvbW1lbmRlZCBwcmFjdGljZSwgbm9kZSBuYW1lcyBzaG91bGQKPiByZWZsZWN0IHRoZSBw
dXJwb3NlIG9mIHRoZSBub2RlIChpZS4g4oCcZnJhbWVidWZmZXLigJ0gb3Ig4oCcZG1hLXBvb2zi
gJ0pLiIKPiAKPiBJIHRyaWVkIGdvb2dsaW5nIGFyb3VuZCBmb3IgYW4gZXhwbGFuYXRpb24gZm9y
IHdoYXQgdGhlIHhycCB3YXMsIGFuZCBhbGwKPiBJIGNvdWxkIGZpbmQgd2FzIHRoaXMgb3V0LW9m
LXRyZWUgdGV4dCBiaW5kaW5nOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9mb3NzLXh0ZW5zYS94cnAv
YmxvYi9tYXN0ZXIveHJwLWtlcm5lbC9jZG5zJTJDeHJwLWh3LXNpbXBsZSUyQ3YxLnR4dAoKVGhl
IG5hbWUgaXMgZnJvbSB0aGUgZGV2aWNlIGRyaXZlciBvZiBIaUZpNCBEU1AgcHJvdmlkZWQgYnkg
Q2FkZW5jZSwKd2hpY2ggaXMgbm90IGluIHRoZSBtYWlubGluZS4gInhycCIgaXMgYSBzaG9ydCBu
YW1lIG9mCiJYdGVuc2EgUmVtb3RlIFByb2Nlc3NpbmciLgoKQmVzdCByZWdhcmRzLApIYWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
