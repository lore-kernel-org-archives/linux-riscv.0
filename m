Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C6EC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 08:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSWR5g3J0o/O6vWXMDxJ4Tj9RAidyEgswCw+4W+XELE=; b=RDvEnK6uOdK/lJ
	FR6VSlAo58S3v9HDW175gzmiWfMZU6gSL0opHzpmNWWx414/obGRigm9gSEZ4wlRusI2ExHFDOQmC
	upGbGVxAotIpFRv/sONtiB9byGx0mU5P3ZKpFwu0fIuR/AqXekosVJ7ThlFKFZW/U3UJ/rqPJ8ASa
	qBrrHE0eyxDNM5gTZO1AnE3ebqbrXZqTxz46wjKdENPLObtxp+W2ZBwd0DPwVYLuKx+VBXaXBxee/
	pSa2SbCFVn8VEIVqS26mlze4HOy3GG7zzEaBykGuX1NQM5jltACmDY18s2svstvc949bKpSIuTCdB
	CLV5qozQ81cGbbzhW8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvw9Q-00HZOD-2z;
	Mon, 08 May 2023 08:23:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvw9M-00HZNX-1S
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 08:23:18 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pvw99-0003K2-5u; Mon, 08 May 2023 10:23:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Date: Mon, 08 May 2023 10:23:02 +0200
Message-ID: <7518428.EvYhyI6sBW@diego>
In-Reply-To: <394696a52bf1d767044e3f990cebfbaf69dabe70.camel@icenowy.me>
References:  <20230507182304.2934-1-jszhang@kernel.org>
 <20230507-calamari-gentleman-bbe62af06f92@spud>
 <394696a52bf1d767044e3f990cebfbaf69dabe70.camel@icenowy.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_012316_505874_41A124EB 
X-CRM114-Status: GOOD (  21.06  )
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

QW0gTW9udGFnLCA4LiBNYWkgMjAyMywgMDU6MzI6MTcgQ0VTVCBzY2hyaWViIEljZW5vd3kgWmhl
bmc6Cj4g5ZyoIDIwMjMtMDUtMDfmmJ/mnJ/ml6XnmoQgMjI6MzUgKzAxMDDvvIxDb25vciBEb29s
ZXnlhpnpgZPvvJoKPiA+IEhleSBKaXNoZW5nLAo+ID4gCj4gPiBPbiBNb24sIE1heSAwOCwgMjAy
MyBhdCAwMjoyMzowMkFNICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4gCj4gPiA+ICsg
ICAgICAgICAgICAgICBjOTEwXzA6IGNwdUAwIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJ0aGVhZCxjOTEwIiwgInJpc2N2IjsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmlzY3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gCj4gPiBEb2VzIHRoaXMgc3VwcG9y
dCBtb3JlIHRoYW4gInJ2NjRpbWFmZGMiPwo+ID4gSSBhc3N1bWUgdGhlcmUncyBzb21lIF94dGhl
YWRmb28gZXh0ZW5zaW9ucyB0aGF0IGl0IGRvZXMgc3VwcG9ydCwKPiA+IGFsdGhvdWdoIEkgYW0g
bm90IHN1cmUgaG93IHdlIGFyZSBwcm9jZWVkaW5nIHdpdGggdGhvc2UgLSBIZWlrbyBtaWdodAo+
ID4gaGF2ZSBhIG1vcmUgbnVhbmNlZCB0YWtlLgoKSSBndWVzcyB0aGUgaW50ZXJlc3RpbmcgcXVl
c3Rpb24gc3RpbGwgaXMsIGFyZSB0aGVzZSBwYXJ0IG9mIHRoZSBpc2EKc3RyaW5nIG9yIG1vcmUg
b2YgYW4gZXJyYXRhPwoKVGhlIGJpbmRpbmcgY3VycmVudGx5IHNheXMKICAgICAgSWRlbnRpZmll
cyB0aGUgc3BlY2lmaWMgUklTQy1WIGluc3RydWN0aW9uIHNldCBhcmNoaXRlY3R1cmUKICAgICAg
c3VwcG9ydGVkIGJ5IHRoZSBoYXJ0LiAgVGhlc2UgYXJlIGRvY3VtZW50ZWQgaW4gdGhlIFJJU0Mt
VgogICAgICBVc2VyLUxldmVsIElTQSBkb2N1bWVudCwgYXZhaWxhYmxlIGZyb20KICAgICAgaHR0
cHM6Ly9yaXNjdi5vcmcvc3BlY2lmaWNhdGlvbnMvCgoKSSBndWVzcyBpZiB3ZSBkZWNpZGUgdG8g
bWFrZSB0aGVtIHBhcnQgb2YgdGhlIGlzYS1zdHJpbmcgdGhlIGJpbmRpbmcKdGhlbiBzaG91bGQg
Z2V0IGEgcGFyYWdyYXBoIG1lbnRpb24gX3hmb28gdmVuZG9yLWV4dGVuc2lvbnMgdG9vLgoKUGVy
c29uYWxseSwgbWFraW5nIHRoZXNlIHBhcnQgb2YgdGhlIElTQSBzdHJpbmcgZGVmaW5pdGx5IHNv
dW5kcyBsaWtlCnRoZSBiZXN0IHNvbHV0aW9uIHRob3VnaCA6LSkgLgoKCj4gPiA+ICsgICAgICAg
ICAgICAgICByZXNldDogcmVzZXQtc2FtcGxlIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJ0aGVhZCxyZXNldC1zYW1wbGUiOwo+ID4gCj4gPiBXaGF0IGlzIGEg
InJlc2V0LXNhbXBsZSI/Cj4gPiAKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZW50cnkt
cmVnID0gPDB4ZmYgMHhmZjAxOTA1MD47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGVu
dHJ5LWNudCA9IDw0PjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udHJvbC1yZWcg
PSA8MHhmZiAweGZmMDE1MDA0PjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udHJv
bC12YWwgPSA8MHgxYz47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNzci1jb3B5ID0g
PDB4N2YzIDB4N2MwIDB4N2MxIDB4N2MyIDB4N2MzCj4gPiA+IDB4N2M1IDB4N2NjPjsKPiA+ID4g
KyAgICAgICAgICAgICAgIH07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIHBsaWM6IGlu
dGVycnVwdC1jb250cm9sbGVyQGZmZDgwMDAwMDAgewo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gInRoZWFkLGM5MTAtcGxpYyI7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweGZmIDB4ZDgwMDAwMDAgMHgwIDB4MDEwMDAwMDA+Owo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMg
MTE+LAo+ID4gPiA8JmNwdTBfaW50YyA5PiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3B1MV9pbnRjIDExPiwKPiA+ID4gPCZjcHUxX2ludGMg
OT4sCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JmNwdTJfaW50YyAxMT4sCj4gPiA+IDwmY3B1Ml9pbnRjIDk+LAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcHUzX2ludGMgMTE+LAo+ID4gPiA8
JmNwdTNfaW50YyA5PjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNv
bnRyb2xsZXI7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMg
PSA8MT47Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LG5kZXYgPSA8MjQwPjsK
PiA+ID4gKyAgICAgICAgICAgICAgIH07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIGNs
aW50OiB0aW1lckBmZmRjMDAwMDAwIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJ0aGVhZCxjOTAwLWNsaW50IjsKPiA+IAo+ID4gImM5MDAiPyBUaGF0IGEgdHlw
byBvciBpbnRlbnRpb25hbC4gSGFyZCB0byB0ZWxsIHNpbmNlIHRoaXMKPiA+IGNvbXBhdGlibGUK
PiA+IGlzIHVuZG9jdW1lbnRlZCA7KQo+IAo+IEludGVudGlvbmFsLCBmb3Igc3VwcG9ydGluZyBi
b3RoIEM5MDYgYW5kIEM5MTAuCj4gCj4gSG93ZXZlciwgYXMgd2UgZGlzY3Vzc2VkIGluIHNvbWUg
YmluZGluZyBwYXRjaGVzLCB0aGVyZSBzaG91bGQgYmUgYSBEVAo+IGJpbmRpbmcgc3RyaW5nIHBl
ciBjaGlwLgo+IAo+IFNvIGhlcmUgc2hvdWxkIGJlICJ0aGVhZCxsaWdodC1jbGludCIsICJ0aGVh
ZCxjOTAwLWNsaW50Ii4KPiAKPiAoT3IgdXNlIHRoMTUyMCwgdGhlIG1hcmtldGluZyBuYW1lLCBp
bnN0ZWFkIG9mIGxpZ2h0LCB0aGUgY29kZW5hbWUpCgpJJ20gZGVmaW5pdGx5IGNvbmZ1c2VkIG5v
dyA6LSkKCmM5MDAgYXMgd2VsbCBhcyBzb21ldGhpbmcgbGlrZSBjOXh4IHNob3VsZCBub3QgYmUg
cGFydCBvZiBkdC1iaW5kaW5ncy4KQmluZGluZy1uYW1lcyBzaG91bGQgYWx3YXlzIGRlbm90ZSBf
YWN0dWFsXyBjb21wb25lbnQgbmFtZXMuCgpTbyB5b3UgY2FuIGRvCgkidGhlYWQsYzkwNi1jbGlu
dCIKYW5kIGZvciBleGFtcGxlCgkidGhlYWQsYzkxMC1jbGludCIsICJ0aGVhZCxjOTA2LWNsaW50
IgoKdG8gZGVzY3JpYmUgdGhhdCB0aGUgY2xpbnQgaW4gdGhlIGM5MTAgaXMgY29tcGF0aWJsZSB3
aXRoIHRoZSBvbmUgaW4gYzkwNgoKCkkgZG9uJ3QgdGhpbmsgdGhlcmUgc2hvdWxkIGJlIGEgInRo
ZWFkLGxpZ2h0LWNsaW50IiAuLi4gdGhlIGNsaW50IGlzIHBhcnQKb2YgdGhlIGNwdSBjb3JlIGl0
c2VsZiBzbyB0aGUgc29jIGl0c2VsZiBzaG91bGRuJ3QgaW50cm9kdWNlIGFueSBjaGFuZ2VzPwoK
CkhlaWtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
