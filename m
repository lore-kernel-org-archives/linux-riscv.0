Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD2FC2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 08:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:Mime-Version:From:Cc:
	Subject:Date:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dv5V4T9QOhN78srekl8x3aC9+rZxgFe4GwIGjEFhPBE=; b=X5AvYFXdNBgzUP
	KVb4q1Wxqj9YMFLkKREOs9ZD1J8SEwUBWfEA7pFMNsnLtiwSUEp8hd56k5VXcEALMdERoLddaFAci
	eCuoR5ODwBaPgDhGpdH+4Ij6wtLyPTtcP1FhQfb8DEym1UI/o13Ig2b0CbhZ0xaQYkBkUelAeTrFw
	eCNJ2BIIoFmC2WsX5NfQ3PHAwnJpgN1Qc8XivLkYlc/LFfvLTyzdIWXYOIo+2Ez40LW4Wr1mLj/I6
	+g2Gyf9h4VdyXv3ylLIe4mafWPlOGDsiZ8OiC407oic9adtj/P1+1RP1B7rzkvPct4JzqBiGLRk8c
	Osd6uPwCgxqVhXol/fbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0O5-0000000HVp0-2as8;
	Sat, 06 Jul 2024 08:03:17 +0000
Received: from va-1-17.ptr.blmpb.com ([209.127.230.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0O0-0000000HVo2-3nga
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 08:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2303021642; d=spacemit.com; t=1720252978; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=YwRsSs/oKAKDshInedUrk2wajjIOyuTY+S2UpWMr3Fw=;
 b=y1dhAhUaCr6Em1kMgXSo6szlHwAd7BOf2ONI2Ex+GjWbZ218kHedtJPS4qaN4tGU+D/PrC
 UmDE2iHSIjPlVQ0y8JOcvH+smNAhVaYy9wBDs9eAp3KryHPtJwpfUad6dmyeCLfLx6hbf8
 EcFmYcOaVIbr6iSFoe4okOQxlnIhmugmlXpQzeJ/USJAXGMcv0Rxb1e/15yMAJaeW3QF2C
 RYAlCx1BZXXwqaq3eF2S6ulD5YJtHksR8dL/xp1zcVKH3JoYKd6XyvEISffGA2L/FLR9Hq
 qSb8Wyg1EKBXBYh5loiDze/DeVISd7VBIW+RGXxRA/IahXxyqM7KpyrLzqwW2g==
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org> <20240703-k1-01-basic-dt-v3-6-12f73b47461e@gentoo.org> <ZoarsYMNJRu1-_wn@xhacker>
	<20240705064721.GB3042186@ofsar>
In-Reply-To: <20240705064721.GB3042186@ofsar>
Date: Sat, 06 Jul 2024 16:02:57 +0800
Subject: Re: [PATCH v3 06/11] dt-bindings: serial: 8250: Add SpacemiT K1 uart compatible
Cc: "Jisheng Zhang" <jszhang@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Conor Dooley" <conor@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Daniel Lezcano" <daniel.lezcano@linaro.org>, 
	"Thomas Gleixner" <tglx@linutronix.de>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Anup Patel" <anup@brainfault.org>, 
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, 
	"Jiri Slaby" <jirislaby@kernel.org>, "Lubomir Rintel" <lkundrak@v3.sk>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Yangyu Chen" <cyy@cyyself.name>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Inochi Amaoto" <inochiama@outlook.com>, <linux-serial@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
From: =?utf-8?q?=E5=BC=A0=E7=8C=9B?= <zhangmeng.kevin@spacemit.com>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+16688fa31+0990bd+lists.infradead.org+zhangmeng.kevin@spacemit.com>
Message-Id: <21b192b47649688e2400e3968e28905bba186d51.42926de8.32d7.41ea.b98f.6e2edb5e6c5a@feishu.cn>
To: "Yixun Lan" <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_010313_350436_E28D4156 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Cj4gRnJvbTogIllpeHVuIExhbiI8ZGxhbkBnZW50b28ub3JnPgo+IERhdGU6wqAgRnJpLCBKdWwg
NSwgMjAyNCwgMTQ6NDcKPiBTdWJqZWN0OsKgIFJlOiBbUEFUQ0ggdjMgMDYvMTFdIGR0LWJpbmRp
bmdzOiBzZXJpYWw6IDgyNTA6IEFkZCBTcGFjZW1pVCBLMSB1YXJ0IGNvbXBhdGlibGUKPiBUbzog
Ikppc2hlbmcgWmhhbmciPGpzemhhbmdAa2VybmVsLm9yZz4KPiBDYzogIlJvYiBIZXJyaW5nIjxy
b2JoQGtlcm5lbC5vcmc+LCAiS3J6eXN6dG9mIEtvemxvd3NraSI8a3J6aytkdEBrZXJuZWwub3Jn
PiwgIkNvbm9yIERvb2xleSI8Y29ub3IrZHRAa2VybmVsLm9yZz4sICJDb25vciBEb29sZXkiPGNv
bm9yQGtlcm5lbC5vcmc+LCAiUGF1bCBXYWxtc2xleSI8cGF1bC53YWxtc2xleUBzaWZpdmUuY29t
PiwgIlBhbG1lciBEYWJiZWx0IjxwYWxtZXJAZGFiYmVsdC5jb20+LCAiQWxiZXJ0IE91Ijxhb3VA
ZWVjcy5iZXJrZWxleS5lZHU+LCAiRGFuaWVsIExlemNhbm8iPGRhbmllbC5sZXpjYW5vQGxpbmFy
by5vcmc+LCAiVGhvbWFzIEdsZWl4bmVyIjx0Z2x4QGxpbnV0cm9uaXguZGU+LCAiU2FtdWVsIEhv
bGxhbmQiPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+LCAiQW51cCBQYXRlbCI8YW51cEBicmFp
bmZhdWx0Lm9yZz4sICJHcmVnIEtyb2FoLUhhcnRtYW4iPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPiwgIkppcmkgU2xhYnkiPGppcmlzbGFieUBrZXJuZWwub3JnPiwgIkx1Ym9taXIgUmludGVs
Ijxsa3VuZHJha0B2My5zaz4sIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz4sIDxsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnPiwgIllhbmd5dSBDaGVuIjxjeXlAY3l5c2VsZi5uYW1lPiwg
IkNvbm9yIERvb2xleSI8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+LCAiSW5vY2hpIEFtYW90
byI8aW5vY2hpYW1hQG91dGxvb2suY29tPiwgPGxpbnV4LXNlcmlhbEB2Z2VyLmtlcm5lbC5vcmc+
LCA8bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZz4sICJNZW5nIFpoYW5nIjx6aGFuZ21l
bmcua2V2aW5Ac3BhY2VtaXQuY29tPgo+IE9uIDIyOjAzIFRodSAwNCBKdWwgwqAgwqAgLCBKaXNo
ZW5nIFpoYW5nIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMDI6NTU6MDlQTSAr
MDAwMCwgWWl4dW4gTGFuIHdyb3RlOgo+ID4gPiBGb3VuZCBTcGFjZW1pVCdzIEsxIHVhcnQgY29u
dHJvbGxlciBpcyBjb21wYXRpYmxlIHdpdGgKPiA+ID4gSW50ZWwncyBYc2NhbGUgdWFydCwgYnV0
IGl0J3Mgc3RpbGwgd29ydGggdG8gaW50cm9kdWNlIGEgbmV3IGNvbXBhdGlibGUuCj4gPsKgCj4g
PiBQZXIgdmVuZG9yJ3Mga2VybmVsIHNvdXJjZSBjb2RlLCBhbGwgdGhlIHVhcnRzIHN1cHBvcnQg
NjRCeXRlcyBGSUZPLgo+ID4gU28gaWYgaXQncyBjb21wYXRpYmxlIHdpdGggWHNjYWxlLCBpdCdz
IGEgeHNjYWxlIHVhcnQgNjQgQnl0ZXMgRklGTy4KPiB5ZXMsIEkgYWdyZWUKPsKgCj4gZnVydGhl
ciBxdWVzdGlvbiB3b3VsZCBob3cgdG8gaW1wbGVtZW50IHNwZWNpZmljIHN1cHBvcnQgZm9yIHNw
YWNlbWl0J3MgazEgU29DCj4gb25lIHBvc3NpYmxlIG9wdGlvbiB0byBhZGQgYSBQT1JUX1NQQUNF
TUlUIGNvbXBhdGlibGUgZGF0YSB0byA4MjUwX3BvcnQuYyAtIHVhcnRfY29uZmlnW10KPsKgCj7C
oAo+ID4gPkZyb20gdGhpcyBQb1YsIHRoZSB1YXJ0IGlzbid0IGEgWHNjYWxlIGJ1dCBhIG1ydmwg
cHhhLgo+IHNlZSBteSBwcmV2aW91cyBjb21tZW50LCBwcm9iYWJseSBuZWVkIGZ1cnRoZXIgY2xh
cmlmaWNhdGlvbi9pbnZlc3RpZ2F0aW9uLi4KPsKgCj4gPsKgCj4gPiBCdXQgSSBoYXZlIG9uZSBx
dWVzdGlvbjogaXMgdGhlIHVhcnQgcmVhbGx5IGEgbXJ2bC9pbnRlbCBweGEgdWFydD8gb3IgaXMg
anVzdAo+IE5vLCBJJ20gdW5hYmxlIHRvIGFuc3dlciB0aGlzLCBJJ20gbm90IGFuIGVtcGxveWVl
IG9mIFNwYWNlbWlUCj4gQWxsIGluZm9ybWF0aW9ucyBhcmUgYmFzZWQgb24gcHVibGljIGF2YWls
YWJsZSBzb3VyY2UgKyBkb2NzLi4KPsKgCj4gPiByZWcgcHJvZ3JhbW1pbmcgY29tcGF0aWJsZSB3
aXRoIHB4YT8KPiA+wqAKPiBUbyBteSBrbm93bGVkZ2UsIGl0J3MgY29tcGF0aWJsZSB3aXRoIHB4
YSwgYnV0IGl0IHdvdWxkIGJlIGdyZWF0IHRoYXQgdmVuZG9yIGNhbiBjbGFyaWZ5IHRoaXMKWWVz
LCB0aGUgcHJvZ3JhbW1pbmcgbW9kZWwgaXMgY29tcGF0aWJsZSB3aXRoIHB4YS4KPsKgCj4gPiA+
wqAKPiA+ID4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+ID4g
PiAtLS0KPiA+ID7CoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsLzgy
NTAueWFtbCB8IDQgKysrLQo+ID4gPsKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+ID7CoAo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC84MjUwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc2VyaWFsLzgyNTAueWFtbAo+ID4gPiBpbmRleCA2OTJhYTA1NTAwZmQ1
Li4wYmRlMjM3OWU4NjQ3IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc2VyaWFsLzgyNTAueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsLzgyNTAueWFtbAo+ID4gPiBAQCAtMTExLDcgKzExMSw5
IEBAIHByb3BlcnRpZXM6Cj4gPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgwqAgLSBtZWRpYXRlayxt
dDc2MjMtYnRpZgo+ID4gPiDCoCDCoCDCoCDCoCDCoMKgIC0gY29uc3Q6IG1lZGlhdGVrLG10ay1i
dGlmCj4gPiA+IMKgIMKgIMKgwqAgLSBpdGVtczoKPiA+ID4gLSDCoCDCoCDCoCDCoMKgIC0gY29u
c3Q6IG1ydmwsbW1wLXVhcnQKPiA+ID4gKyDCoCDCoCDCoCDCoMKgIC0gZW51bToKPiA+ID4gKyDC
oCDCoCDCoCDCoCDCoCDCoMKgIC0gbXJ2bCxtbXAtdWFydAo+ID4gPiArIMKgIMKgIMKgIMKgIMKg
IMKgwqAgLSBzcGFjZW1pdCxrMS11YXJ0Cj4gPiA+IMKgIMKgIMKgIMKgIMKgwqAgLSBjb25zdDog
aW50ZWwseHNjYWxlLXVhcnQKPiA+ID4gwqAgwqAgwqDCoCAtIGl0ZW1zOgo+ID4gPiDCoCDCoCDC
oCDCoCDCoMKgIC0gZW51bToKPiA+ID7CoAo+ID4gPiAtLcKgCj4gPiA+IDIuNDUuMgo+ID4gPsKg
Cj4gPiA+wqAKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo+wqAKPiAtLcKgCj4gWWl4dW4gTGFuIChkbGFuKQo+IEdl
bnRvbyBMaW51eCBEZXZlbG9wZXIKPiBHUEcgS2V5IElEIEFBQkVGRDU1CgoKVGhpcyBtZXNzYWdl
IGFuZCBhbnkgYXR0YWNobWVudCBhcmUgY29uZmlkZW50aWFsIGFuZCBtYXkgYmUgcHJpdmlsZWdl
ZCBvciBvdGhlcndpc2UgcHJvdGVjdGVkIGZyb20gZGlzY2xvc3VyZS4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSwgcGxlYXNlIGRlbGV0ZSBpdCBh
bmQgYW55IGF0dGFjaG1lbnQgZnJvbSB5b3VyIHN5c3RlbSBhbmQgbm90aWZ5IHRoZSBzZW5kZXIg
aW1tZWRpYXRlbHkgYnkgcmVwbHkgZS1tYWlsLiBVbmludGVuZGVkIHJlY2lwaWVudHMgc2hvdWxk
IG5vdCB1c2UsIGNvcHksIGRpc2Nsb3NlIG9yIHRha2UgYW55IGFjdGlvbiBiYXNlZCBvbiB0aGlz
IG1lc3NhZ2Ugb3IgYW55IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UuIEVt
YWlscyBjYW5ub3QgYmUgZ3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3IgZnJlZSBhcyB0
aGV5IGNhbiBiZSBpbnRlcmNlcHRlZCwgYW1lbmRlZCwgbG9zdCBvciBkZXN0cm95ZWQsIGFuZCB5
b3Ugc2hvdWxkIHRha2UgZnVsbCByZXNwb25zaWJpbGl0eSBmb3Igc2VjdXJpdHkgY2hlY2tpbmcu
IAogCuacrOmCruS7tuWPiuWFtuS7u+S9lemZhOS7tuWFt+acieS/neWvhuaAp+i0qO+8jOW5tuWP
r+iDveWPl+WFtuS7luS/neaKpOaIluS4jeWFgeiuuOiiq+aKq+mcsue7meesrOS4ieaWueOAguWm
gumYgeS4i+ivr+aUtuWIsOacrOmCruS7tu+8jOaVrOivt+eri+WNs+S7peWbnuWkjeeUteWtkOmC
ruS7tueahOaWueW8j+mAmuefpeWPkeS7tuS6uu+8jOW5tuWwhuacrOmCruS7tuWPiuWFtuS7u+S9
lemZhOS7tuS7jumYgeS4i+ezu+e7n+S4reS6iOS7peWIoOmZpOOAguWmgumYgeS4i+W5tumdnuac
rOmCruS7tuWGmeaYjuS5i+aUtuS7tuS6uu+8jOaVrOivt+WIh+WLv+S9v+eUqOOAgeWkjeWItuOA
geaKq+mcsuacrOmCruS7tuaIluWFtuS7u+S9leWGheWuue+8jOS6puivt+WIh+WLv+S+neacrOmC
ruS7tuaIluWFtuS7u+S9leWGheWuueiAjOmHh+WPluS7u+S9leihjOWKqOOAgueUteWtkOmCruS7
tuaXoOazleS/neivgeaYr+S4gOenjeWuieWFqOWSjOS4jeS8muWHuueOsOS7u+S9leW3rumUmeea
hOmAmuS/oeaWueW8j++8jOWPr+iDveS8muiiq+aLpuaIquOAgeS/ruaUueOAgeS4ouWkseaIluaN
n+Wdj++8jOaUtuS7tuS6uumcgOiHquihjOi0n+i0o+WBmuWlveWuieWFqOajgOafpeOAggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
