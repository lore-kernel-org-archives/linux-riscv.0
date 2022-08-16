Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9FDC2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yDb1gNCA0vnI+zPZ0oLUsXU6NNaZNN2kwNx/myxv2s=; b=ZAbq1bct8Lvir8
	DAcQJH/VrPj6IpbTRTa/QN3HFgyP2F3RXqrBMz1NsfIAQ416kh7na2Q/2z+oPx7aAKUOhKG7QZwdc
	RqxQyNoasht/agyt1vVMH39TpMqfgwlzrWLgiB2QovIFR8U1QXQO90uGGtrInnCbH5AOxuPYlkGPz
	FiATa1qFokrzak0qtSKcJf0SygVGDYkuQ5T7POfjSuQt1CbS1nNoGGwNd7up0kT0h3mHt48mKR3vn
	o+8cU7CtGlVUrsTBRYGMv4oXRiB1SHg6zkuwU2sM1GhV67zpPhemetcb94vOoQ3wJWaK6JWS6Q5l5
	EKiTqReaAy8Oi/5pu12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNscd-00HX67-7f; Tue, 16 Aug 2022 09:12:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNscN-00HWwO-PP
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:12:13 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oNscI-0002ox-1h; Tue, 16 Aug 2022 11:12:06 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
Date: Tue, 16 Aug 2022 11:12:05 +0200
Message-ID: <3881930.ZaRXLXkqSa@diego>
In-Reply-To: <5593349.DvuYhMxLoT@jernej-laptop>
References: <20220815050815.22340-1-samuel@sholland.org> <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org> <5593349.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_021211_858563_A2A22AFA 
X-CRM114-Status: GOOD (  10.84  )
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

QW0gRGllbnN0YWcsIDE2LiBBdWd1c3QgMjAyMiwgMDk6NDk6NTggQ0VTVCBzY2hyaWViIEplcm5l
aiDFoGtyYWJlYzoKPiBEbmUgdG9yZWssIDE2LiBhdmd1c3QgMjAyMiBvYiAwOTo0MTo0NSBDRVNU
IGplIEtyenlzenRvZiBLb3psb3dza2kgbmFwaXNhbChhKToKPiA+IE9uIDE1LzA4LzIwMjIgMDg6
MDgsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gPiArCj4gPiA+ICsJZGU6IGRpc3BsYXktZW5n
aW5lIHsKPiA+ID4gKwkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxLWRpc3BsYXkt
ZW5naW5lIjsKPiA+ID4gKwkJYWxsd2lubmVyLHBpcGVsaW5lcyA9IDwmbWl4ZXIwPiwgPCZtaXhl
cjE+Owo+ID4gPiArCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gPiArCX07Cj4gPiA+ICsKPiA+
ID4gKwlvc2MyNE06IG9zYzI0TS1jbGsgewo+ID4gCj4gPiBsb3dlcmNhc2UKPiA+IAo+ID4gPiAr
CQljb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPiA+ID4gKwkJY2xvY2stZnJlcXVlbmN5ID0g
PDI0MDAwMDAwPjsKPiA+IAo+ID4gVGhpcyBpcyBhIHByb3BlcnR5IG9mIHRoZSBib2FyZCwgbm90
IFNvQy4KPiAKPiBTb0MgbmVlZHMgMjQgTUh6IG9zY2lsbGF0b3IgZm9yIGNvcnJlY3Qgb3BlcmF0
aW9uLCBzbyBlYWNoIGFuZCBldmVyeSBib2FyZCBoYXMgCj4gaXQuIEhhdmluZyBpdCBoZXJlIHNp
bXBsaWZpZXMgYm9hcmQgRFQgZmlsZXMuCgpJIGd1ZXNzIHRoZSBvc2NpbGxhdG9yIGlzIGEgc2Vw
YXJhdGUgY29tcG9uZW50IG9uIGVhY2ggYm9hcmQsIHJpZ2h0PwpBbmQgRFQgb2J2aW91cyBpcyBt
ZWFudCB0byBkZXNjcmliZSB0aGUgaGFyZHdhcmUgLSBpbmRlcGVuZGVudGx5IGZyb20KaW1wbGVt
ZW50YXRpb24tc3BlY2lmaWMgY2hvaWNlcy4KClN0YXJ0aW5nIHRvIGRpc2N1c3Mgd2hpY2ggZXhj
ZXB0aW9ucyB0byBhbGxvdyB0aGVuIG1pZ2h0IGxlYWQgdG8gZXZlbiBtb3JlCmV4Y2VwdGlvbnMu
CgpBbHNvIGhhdmluZyB0byBsb29rIGZvciBhIGJvYXJkLWNvbXBvbmVudCBpbiB0aGUgc29jIGR0
c2kgYWxzbyBpcyBzdXJwcmlzaW5nCmlmIG9uZSBnZXRzIHRvIHRoZSBwYXJ0eSBsYXRlciBvbiA6
LSkgLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
