Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 315A9E7B61F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHDoLA+N0+XfjcLBM/cROXEA+3jtsOpnSdj0aV1gCuI=; b=KJMqC5gPFsmRVj
	Vdvt+MG/LO6Xnr3PFxeHhBLv66MqW5QiJTK1izmuoN6TsNz+SB6RMSywX/xItDDnOFa7wsDeuzgPd
	c88TcSYX8q5b1ZilkruDV50lgdtDDU0K/Uc7mXo/xldD4IpUNpNIqDccm4rrlfQSv4mK+TwnJnGXe
	O6CMB3LkoDItS1xnRejUmVfhx0UlIm8fEH0PS+aR4CSWT8CwlNsMbfZY/cFXHTPD4QTzfj1ua6/I2
	Lx5m3cawDGZ4EpqGFDx/SpizKSh5qUQGkVwUjspSmRF0+IbjVcnn+lxTnpGmc5+k4d2uz441ZFU5u
	FfqilRN9lrqABIYjS0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2U7-000B86-0P;
	Wed, 04 Oct 2023 14:04:19 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2U3-000B7Y-0k
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:04:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1696428194; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=htY/wMSm8p5yOySCFhqa3AixtriFzYJljC9Xt5ZgC+gBFjrOokXJaZMfffRHj0RwddItBtQVcvw//Kn7f2l640u9tw/Y06DV7k6yFGRZU6fq78QYZfA+0u2+PnTPG1J1XzL4maOvZBQGeg7I+UWxJbOSQouvXlx+O7jYSeL9Lf0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696428194; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lfdKBiEfg7M6MID6J3Whfh516eqSiysLzgdeOPdxLNo=; 
	b=hkkRE6KV9t1KaXMoYj2CIxqpb7UEVOwthTAOEMjKsXeMfeTVF02YFDsfbKmC98yih+SevSonzQ0VtqL2LN2opV4KbEsOShk5Z1viHZTligl/jTQpLgna6v2gCUvOjn9nS/yZyiKaswaL1cEpx7XZhbplGDqd9FkfHP6XO1i2Yys=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696428194;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=lfdKBiEfg7M6MID6J3Whfh516eqSiysLzgdeOPdxLNo=;
	b=jy8qBi1ka9ufG3CGbI7zefjIAOFCPfybagWCJ2Bm46BnaquEmcDcR6E8FW6Buz7a
	Qer6p4hsooPZ8X9tKsq4Al+ZjYg0vc3WBZTmRL/I5V02D5JM36JkkpIOKSy8Anh0RU3
	t90csO4+uDHgmxdW03FHDdLaasKAgVwG2ZARWHNVSe5HPqu4RTx4PBv2mG+6nZHvDbo
	XK6+SFzMTR4cOLJsCWlm17+W5q33FScXNC75Tw2ih7zMIG+aMVXhMV9xVMkpLgMWBLg
	Tl9yTMvHpEKNZDSXOT49lAmtncep6Vb87oPMzu+Ph7cx7SuFAKbFXR8jiq7rK3rEWc9
	hlayoPbKAg==
Received: from edelgard.fodlan.icenowy.me (120.85.98.65 [120.85.98.65]) by mx.zohomail.com
	with SMTPS id 1696428191465788.6446738676636; Wed, 4 Oct 2023 07:03:11 -0700 (PDT)
Message-ID: <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
From: Icenowy Zheng <uwu@icenowy.me>
To: Robin Murphy <robin.murphy@arm.com>, "Lad, Prabhakar"
	 <prabhakar.csengg@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Christoph Hellwig <hch@lst.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Robert Nelson
 <robertcnelson@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, Fu
 Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor
 Dooley <conor@kernel.org>, Jason Kridner <jkridner@beagleboard.org>, Xi
 Ruoyao <xry111@xry111.site>, Han Gao <gaohan@iscas.ac.cn>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Linux-MM <linux-mm@kvack.org>
Date: Wed, 04 Oct 2023 22:02:56 +0800
In-Reply-To: <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
	 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
	 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
	 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker>
	 <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
	 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_070415_342270_E5712CFF 
X-CRM114-Status: GOOD (  47.94  )
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

5ZyoIDIwMjMtMTAtMDTmmJ/mnJ/kuInnmoQgMTQ6NDkgKzAxMDDvvIxSb2JpbiBNdXJwaHnlhpnp
gZPvvJoKPiBPbiAwNC8xMC8yMDIzIDI6MDIgcG0sIExhZCwgUHJhYmhha2FyIHdyb3RlOgo+ID4g
KyBDQyBsaW51eC1tbSBhbmQgUm9iaW4gTXVycGh5Cj4gPiAKPiA+IE9uIFdlZCwgT2N0IDQsIDIw
MjMgYXQgMTI6NDLigK9QTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiB3
cm90ZToKPiA+ID4gCj4gPiA+IE9uIE1vbiwgT2N0IDAyLCAyMDIzIGF0IDA5OjM3OjQ0UE0gLTA3
MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+ID4gPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAw
NTo0ODoyMVBNIC0wNTAwLCBSb2JlcnQgTmVsc29uIHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBT
ZXAgMjIsIDIwMjMgYXQgMjowOOKAr1BNIFJvYmVydCBOZWxzb24KPiA+ID4gPiA+IDxyb2JlcnRj
bmVsc29uQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBPbiBUaHUs
IFNlcCAyMSwgMjAyMyBhdCA4OjUx4oCvUE0gRHJldyBGdXN0aW5pCj4gPiA+ID4gPiA+IDxkZnVz
dGluaUBiYXlsaWJyZS5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRo
aXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGVNTUMgb24gdGhlIEJlYWdsZVYKPiA+ID4g
PiA+ID4gPiBBaGVhZCBhbmQgdGhlCj4gPiA+ID4gPiA+ID4gU2lwZWVkIExpY2hlZVBpIDRBLiBU
aGlzIGFsbG93cyB0aGUga2VybmVsIHRvIGJvb3Qgd2l0aAo+ID4gPiA+ID4gPiA+IHRoZSByb290
ZnMgb24KPiA+ID4gPiA+ID4gPiBlTU1DLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkg
dGVzdGVkIG9uIHRvcCBvZiB2Ni42LXJjMiB3aXRoIHRoaXMgY29uZmlnIFsxXS4gSSB3YXMKPiA+
ID4gPiA+ID4gPiBhYmxlIHRvIGJvb3QKPiA+ID4gPiA+ID4gPiBib3RoIHRoZSBBaGVhZCBbMl0g
YW5kIExQaTRhIFszXSBmcm9tIGVNTUMuIFRoZSBmb2xsb3dpbmcKPiA+ID4gPiA+ID4gPiBwcmVy
ZXF1aXNpdGVzCj4gPiA+ID4gPiA+ID4gYXJlIHJlcXVpcmVkOgo+ID4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiA+IMKgwqAgW1BBVENIIHYyXSByaXNjdjogZHRzOiB0aGVhZDogc2V0IGRtYS1ub25j
b2hlcmVudCB0bwo+ID4gPiA+ID4gPiA+IHNvYyBidXMgWzRdCj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gSSBwdXNoZWQgYSBicmFuY2ggWzVdIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgYW5k
IHRoZQo+ID4gPiA+ID4gPiA+IGFib3ZlIHBhdGNoIGZvcgo+ID4gPiA+ID4gPiA+IHRob3NlIHRo
YXQgZmluZCBhIGdpdCBicmFuY2ggZWFzaWVyIHRvIHRlc3QuCj4gPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+ID4gUGxlYXNlIG5vdGUgdGhhdCBvbmx5IHRoZSBNTUMgY29udHJvbGxlciBjb25uZWN0
ZWQgdG8gdGhlCj4gPiA+ID4gPiA+ID4gZU1NQyBkZXZpY2UKPiA+ID4gPiA+ID4gPiBpcyBlbmFi
bGVkIGluIHRoZSBkZXZpY2UgdHJlZXMgZm9yIHRoZXNlIHR3byBib2FyZHMuIEkKPiA+ID4gPiA+
ID4gPiBkaWQgbm90IHlldAo+ID4gPiA+ID4gPiA+IGF0dGVtcHQgdG8gY29uZmlndXJlIGFuZCB1
c2UgdGhlIG1pY3JvU0QgY2FyZCBzbG90LiBNeQo+ID4gPiA+ID4gPiA+IHByZWZlcmVuY2UgaXMg
dG8KPiA+ID4gPiA+ID4gPiBhZGRyZXNzIHRoYXQgaW4gYSBmdXR1cmUgcGF0Y2ggc2VyaWVzLgo+
ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFJlZmVyZW5jZXM6Cj4gPiA+ID4gPiA+ID4gWzFd
Cj4gPiA+ID4gPiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy81ZmJkY2YyYTY1ZWIx
YWJkZDNhMjlkNTE5YzE5Y2RkMgo+ID4gPiA+ID4gPiA+IFsyXQo+ID4gPiA+ID4gPiA+IGh0dHBz
Oi8vZ2lzdC5naXRodWIuY29tL3BkcDcvOTFhODAxYTVmOGQxMDcwYzUzNTA5ZWRhOTgwMGFkNzgK
PiA+ID4gPiA+ID4gPiBbM10KPiA+ID4gPiA+ID4gPiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9w
ZHA3LzE0NDVjM2M5OTFlODhmZDY5YzYwMTY1Y2VmNjU3MjZhCj4gPiA+ID4gPiA+ID4gWzRdCj4g
PiA+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTIw
NzIyMzIuMjQ1NS0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+ID4gPiA+ID4gPiBbNV0gaHR0cHM6
Ly9naXRodWIuY29tL3BkcDcvbGludXgvdHJlZS9iNC90aDE1MjAtbW1jCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBUaGlzIHBhdGNoc2V0IGNhbWUgb3V0IHZlcnkgbmljZSEKPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IHY2LjYtcmMyIHdpdGggTGFzdCBSRkMgdjI6Cj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiBbwqDCoMKgIDQuMDY2NjMwXSBtbWMwOiBTREhDSSBjb250cm9sbGVyIG9uIGZmZTcw
ODAwMDAubW1jCj4gPiA+ID4gPiA+IFtmZmU3MDgwMDAwLm1tY10gdXNpbmcgUElPCj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBkZWJpYW5AQmVhZ2xlVjp+JCBzdWRvIGhkcGFybSAtdFQgL2Rldi9t
bWNibGswCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiAvZGV2L21tY2JsazA6Cj4gPiA+ID4gPiA+
IMKgIFRpbWluZyBjYWNoZWQgcmVhZHM6wqDCoCAxNTE2IE1CIGluwqAgMi4wMCBzZWNvbmRzID0g
NzU4LjA5Cj4gPiA+ID4gPiA+IE1CL3NlYwo+ID4gPiA+ID4gPiDCoCBUaW1pbmcgYnVmZmVyZWQg
ZGlzayByZWFkczrCoCA4NCBNQiBpbsKgIDMuMDEgc2Vjb25kcyA9wqAKPiA+ID4gPiA+ID4gMjcu
OTQgTUIvc2VjCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiB2cyB2Ni42LXJjMiB3aXRoIHRoaXMg
cGF0Y2hzZXQ6Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiDCoCBbwqDCoMKgIDQuMDk2ODM3XSBt
bWMwOiBTREhDSSBjb250cm9sbGVyIG9uIGZmZTcwODAwMDAubW1jCj4gPiA+ID4gPiA+IFtmZmU3
MDgwMDAwLm1tY10gdXNpbmcgRE1BCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBkZWJpYW5AQmVh
Z2xlVjp+JCBzdWRvIGhkcGFybSAtdFQgL2Rldi9tbWNibGswCj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiAvZGV2L21tY2JsazA6Cj4gPiA+ID4gPiA+IMKgIFRpbWluZyBjYWNoZWQgcmVhZHM6wqDC
oCAxNTgwIE1CIGluwqAgMi4wMCBzZWNvbmRzID0gNzkwLjk3Cj4gPiA+ID4gPiA+IE1CL3NlYwo+
ID4gPiA+ID4gPiDCoCBUaW1pbmcgYnVmZmVyZWQgZGlzayByZWFkczogNDE4IE1CIGluwqAgMy4w
MCBzZWNvbmRzID0KPiA+ID4gPiA+ID4gMTM5LjExIE1CL3NlYwo+ID4gPiA+ID4gCj4gPiA+ID4g
PiBEcmV3IHBvaW50ZWQgb3V0IG9uIFNsYWNrLCB0aGlzIHdhcyBub3QgcXVpdGUgcmlnaHQuLiBB
ZnRlcgo+ID4gPiA+ID4gbW9yZQo+ID4gPiA+ID4gZGlnZ2luZyBieSBEcmV3LCBDT05GSUdfRE1B
X0dMT0JBTF9QT09MIGlzIGNhdXNpbmcgYSBETUEKPiA+ID4gPiA+IGxpbWl0YXRpb24KPiA+ID4g
PiA+IHdpdGggdGhlIG11bHRpcGxhdGZvcm0gZGVmY29uZmlnLiBzbyB3aXRoLAo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiAuL3NjcmlwdHMvY29uZmlnIC0tZGlzYWJsZSBDT05GSUdfQVJDSF9SOUEwN0cw
NDMKPiA+ID4gPiA+IAo+ID4gPiA+ID4gKHRvIHJlbW92ZSBDT05GSUdfRE1BX0dMT0JBTF9QT09M
KS4uLiBhbm90aGVyIDJ4IGluIGJ1ZmZlcmVkCj4gPiA+ID4gPiByZWFkcy4uCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IFvCoMKgwqAgNC4wNTkyNDJdIG1tYzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZl
NzA4MDAwMC5tbWMKPiA+ID4gPiA+IFtmZmU3MDgwMDAwLm1tY10gdXNpbmcgQURNQSA2NC1iaXQK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gZGViaWFuQEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRUIC9k
ZXYvbW1jYmxrMAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAvZGV2L21tY2JsazA6Cj4gPiA+ID4gPiDC
oCBUaW1pbmcgY2FjaGVkIHJlYWRzOsKgwqAgMTYwMCBNQiBpbsKgIDIuMDAgc2Vjb25kcyA9IDgw
MC45Mwo+ID4gPiA+ID4gTUIvc2VjCj4gPiA+ID4gPiDCoCBUaW1pbmcgYnVmZmVyZWQgZGlzayBy
ZWFkczogODkyIE1CIGluwqAgMy4wMCBzZWNvbmRzID0KPiA+ID4gPiA+IDI5Ny4wNiBNQi9zZWMK
PiA+ID4gPiAKPiA+ID4gPiBJdCBzZWVtcyBDT05GSUdfRE1BX0dMT0JBTF9QT09MPXkgY2F1c2Vz
IEFETUEgYnVmZmVyIGFsbG9jIHRvCj4gPiA+ID4gZmFpbCBbMV06Cj4gPiA+ID4gCj4gPiA+ID4g
wqDCoCBtbWMwOiBVbmFibGUgdG8gYWxsb2NhdGUgQURNQSBidWZmZXJzIC0gZmFsbGluZyBiYWNr
IHRvCj4gPiA+ID4gc3RhbmRhcmQgRE1BCj4gPiA+ID4gCj4gPiA+ID4gUHJhYmhha2FyJ3MgQVg0
NU1QIG5vbi1jb2hlcmVudCBETUEgc3VwcG9ydCBbMl0gc2VyaWVzCj4gPiA+ID4gaW50cm9kdWNl
ZCB0aGUKPiA+ID4gPiBzZWxlY3Rpb24gb2YgRE1BX0dMT0JBTF9QT09MIGZvciBBUkNIX1I5QTA3
RzA0MyBhbmQgdGhlIHJpc2N2Cj4gPiA+ID4gZGVmY29uZmlnCj4gPiA+ID4gc2VsZWN0cyBBUkNI
X1I5QTA3RzA0My4KPiA+ID4gPiAKPiA+ID4gPiBQYXRjaCA1IGluIHRoZSBzZXJpZXMgWzNdIHN0
YXRlcyB0aGF0Ogo+ID4gPiA+IAo+ID4gPiA+IMKgwqAgV2l0aCBETUFfR0xPQkFMX1BPT0wgZW5h
YmxlZCBhbGwgRE1BIGFsbG9jYXRpb25zIGhhcHBlbiBmcm9tCj4gPiA+ID4gdGhpcwo+ID4gPiA+
IMKgwqAgcmVnaW9uIGFuZCBzeW5jaHJvbml6YXRpb24gY2FsbGJhY2tzIGFyZSBpbXBsZW1lbnRl
ZCB0bwo+ID4gPiA+IHN5bmNocm9uaXplCj4gPiA+ID4gwqDCoCB3aGVuIGRvaW5nIERNQSB0cmFu
c2FjdGlvbnMuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBleGFtcGxlIG9mIGEgInNoYXJlZC1kbWEt
cG9vbCIgbm9kZSB3YXMgZ2l2ZW46Cj4gPiA+ID4gCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCBw
bWFfcmVzdjBANTgwMDAwMDAgewo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21w
YXRpYmxlID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlZyA9IDwweDAgMHg1ODAwMDAwMCAweDAgMHgwODAwMDAwMD47Cj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG5vLW1hcDsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbGludXgsZG1hLWRlZmF1bHQ7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCB9Owo+ID4gPiA+
IAo+ID4gPiA+IEkndmUgY29waWVkIHRoYXQgdG8gdGgxNTIwLWJlYWdsZXYtYWhlYWQuZHRzLiBU
aGUgYWRkcmVzcyBvZgo+ID4gPiA+IDB4NTgwMDAwMDAKPiA+ID4gPiBoYXMgbm8gc2lnbmlmaWNh
bmNlIG9uIHRoMTUyMCwgYnV0IHRoZSBleGlzdGVuY2Ugb2Ygc2hhcmVkLWRtYS0KPiA+ID4gPiBw
b29sCj4gPiA+ID4gc2VlbXMgdG8gZml4IHRoZSBwcm9ibGVtLiBBRE1BIG1vZGUgWzRdIGlzIG5v
dyB3b3JraW5nIGV2ZW4KPiA+ID4gPiB0aG91Z2gKPiA+ID4gPiBDT05GSUdfRE1BX0dMT0JBTF9Q
T09MPXkuCj4gPiA+IAo+ID4gPiArIENocmlzdG9waCwgTGFkCj4gPiA+IAo+ID4gPiBJTUhPLCB0
aGlzIGlzIG5vdCBUSDE1MjAgc3BlY2lmaWMgYnV0IGEgZ2VuZXJpYyBpc3N1ZS4KPiA+ID4gCj4g
PiA+IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2FzOiBLY29uZmln
OiBTZWxlY3QgdGhlCj4gPiA+IHJlcXVpcmVkIGNvbmZpZ3MgZm9yIFJaL0ZpdmUgU29DIikgY2Fu
IGNhdXNlIHJlZ3Jlc3Npb24gb24gYWxsCj4gPiA+IG5vbi1kbWEtY29oZXJlbnQgcmlzY3YgcGxh
dGZvcm1zIHdpdGggZ2VuZXJpYyBkZWZjb25maWcuIFRoaXMgaXMKPiA+ID4gYSBjb21tb24gaXNz
dWUuIFRoZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJpc2N2IGRlZmNvbmZpZwo+ID4gPiBzZWxl
Y3RzCj4gPiA+IEFSQ0hfUjlBMDdHMDQzIHdoaWNoIHNlbGVjdHMgRE1BX0dMT0JBTF9QT09MLCB3
aGljaCBhc3N1bWVzIGFsbAo+ID4gPiBub24tZG1hLWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyBo
YXZlIGEgZG1hIGdsb2JhbCBwb29sLCB0aGlzCj4gPiA+IGFzc3VtcHRpb24KPiA+ID4gc2VlbXMg
bm90IGNvcnJlY3QuIEFuZCBJIGJlbGlldmUgRE1BX0dMT0JBTF9QT09MIHNob3VsZCBub3QgYmUK
PiA+ID4gc2VsZWN0ZWQgYnkgQVJDSF9TT0NGQU1JTElZLCBpbnN0ZWFkLCBvbmx5IEFSQ0ggdW5k
ZXIgc29tZQo+ID4gPiBzcGVjaWZpYwo+ID4gPiBjb25kaXRpb25zIGNhbiBzZWxlY3QgaXQgZ2xv
YmFseSwgZm9yIGV4YW1wbGUgTk9NTVUgQVJNIGFuZCBzbwo+ID4gPiBvbi4KPiA+ID4gCj4gPiA+
IFNpbmNlIHRoaXMgaXMgYSByZWdyZXNzaW9uLCB3aGF0J3MgcHJvcGVyIGZpeD8gYW55IHN1Z2dl
c3Rpb24gaXMKPiA+ID4gYXBwcmVjaWF0ZWQuCj4gCj4gSSB0aGluayB0aGUgYW5zd2VyIGlzIHRv
IG5vdCBzZWxlY3QgRE1BX0dMT0JBTF9QT09MLCBzaW5jZSB0aGF0IGlzCj4gb25seSAKCldlbGwg
SSB0aGluayBmb3IgUklTQy1WLCBpdCdzIG5vdCBOT01NVSBvbmx5IGJ1dCBhcHBsaWNhYmxlIGZv
ciBldmVyeQpjb3JlIHRoYXQgZG9lcyBub3Qgc3VwcG9ydCBTdnBibXQgb3IgdmVuZG9yLXNwZWNp
ZmljIGFsdGVybmF0aXZlcywKYmVjYXVzZSB0aGUgb3JpZ2luYWwgUklTQy1WIHByaXYgc3BlYyBk
b2VzIG5vdCBkZWZpbmUgbWVtb3J5IGF0dHJpYnV0ZXMKaW4gcGFnZSB0YWJsZSBlbnRyaWVzLgoK
Rm9yIHRoZSBSZW5lc2FzL0FuZGVzIGNhc2UgSSB0aGluayBhIHBvb2wgaXMgc2V0IGJ5IE9wZW5T
Qkkgd2l0aAp2ZW5kb3Itc3BlY2lmaWMgTS1tb2RlIGZhY2lsaXR5IGFuZCB0aGVuIHBhc3NlZCBp
biBEVCwgYW5kIHRoZSBTLW1vZGUKKHdoaWNoIE1NVSBpcyBlbmFibGVkIGluKSBqdXN0IHNlZXMg
Zml4ZWQgbWVtb3J5IGF0dHJpYnV0ZXMsIGluIHRoaXMKY2FzZSBJIHRoaW5rIERNQV9HTE9CQUxf
UE9PTCBpcyBuZWVkZWQuCgo+IGRlc2lnbmVkIGZvciBub21tdSBjYXNlcyB3aGVyZSBub24tY2Fj
aGVhYmxlIG1lbW9yeSBsaXZlcyBpbiBhIGZpeGVkIAo+IHBsYWNlIGluIHRoZSBwaHlzaWNhbCBh
ZGRyZXNzIG1hcCwgYW5kIHJlZ3VsYXIga2VybmVsIHBhZ2VzIGNhbid0IGJlIAo+IHJlbWFwcGVk
LiBBcyBmYXIgYXMgSSdtIGF3YXJlLCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQgaXMgdGhlIHRoaW5n
IHlvdQo+IHdhbnQsIHN1Y2ggdGhhdCBETUFfRElSRUNUX1JFTUFQIGNhbiBkeW5hbWljYWxseSBw
cm92aWRlIG5vbi0KPiBjYWNoZWFibGUgCj4gY29oZXJlbnQgYnVmZmVycyBmb3Igbm9uLWhhcmR3
YXJlLWNvaGVyZW50IGRldmljZXMuCj4gCj4gVGhhbmtzLAo+IFJvYmluLgo+IAo+ID4gPiAKPiA+
ID4gVGhhbmtzCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+IFRoYW5rcywKPiA+ID4gPiBEcmV3Cj4g
PiA+ID4gCj4gPiA+ID4gWzFdCj4gPiA+ID4gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy83
MzA0MWVkODA4YmJjN2RkNDQ1ODM2ZmI5MDU3NDk3OQo+ID4gPiA+IFsyXQo+ID4gPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwODE4MTM1NzIzLjgwNjEyLTEtcHJh
Ymhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tLwo+ID4gPiA+IFszXQo+ID4gPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwODE4MTM1NzIzLjgwNjEy
LTYtcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tLwo+ID4gPiA+IFs0XQo+
ID4gPiA+IGh0dHBzOi8vZ2lzdC5naXRodWIuY29tL3BkcDcvOTFlNzJhNjYzZDNiYjczZWIyODE4
MjMzN2FkOGJiY2IKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
