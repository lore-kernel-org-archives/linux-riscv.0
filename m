Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16F0CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXh3ezx4eSuogOkBGK2Z4SIAdhgexS8YbuaJTUECnZ4=; b=X2OdspRjalCt1i
	qP40geU71vCTCrErZwpe3nVZNLN3CC3aMflZbvqe2NVmoGCgn89tpbTYRx80v+fpESFTkaBm/OcrW
	qd7wMbaxo29Pm0dmubZtURgfw5AnKfW7zoPhiktWMki5Axf/KNmuDKy6WJlhojvJvP0Ijj7dKfBwF
	uh+NikxXGp2ZA2afBF6WQSSeisGugWzABPixAWgfqk4uavbrEwcxd1xAinChL1k22oZGNKCFDZCb7
	PBingmBV6Qy9L0CSSeujVTlv2cpEyOfK3ef0QFnn8zwY7uA8F9Hp8MRezEfav3Y3C/zTAtRoAmfLY
	cXUtJPxxr1GxM1jxeiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElP3-000000048IH-0ZHH;
	Thu, 08 Oct 2026 10:31:09 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElP0-000000048HG-3AaH
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 10:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1791455464; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PXhlqnbIPeeyBMoq4zj6OsSao1PWn2yoke5wffLUsWw9+hZSA3HE8mAowQUYiWMyY0qtCoENa+kjOMJ56T+/8kdKmNUbp4qZMwYm08jJAm55Y7CHf2n1p5S5gfYGlomKC5mwQ0PMkJDbAey8lYRjL+SvKn6xWr3xKYqCcVSmk8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791455464; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TEVIQ7jUIEPxC+HGK4sUt5stotdCUh3Q7I4XuQyq/vU=; 
	b=fXr22wZyjecSTBJj/MHndJ36pVf9nqiRyPB7zHwKZzGkKj05HnSbZjcxsKt69n2eJ50BhpTY4d7sbrCwCTNQjovej0+HKmC+B9hEdoTMBamGg7aBh+5P9DarQWekC5wvg7gqsThh8ooSsV7MgTVabyr3tjDvKeksDJzW1jkr6PE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791455464;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=TEVIQ7jUIEPxC+HGK4sUt5stotdCUh3Q7I4XuQyq/vU=;
	b=Xa4CCTGdyQqhGs5mz5XWPtLsG3z3tv3u/QC4Tm+jFyOf5gdqI08/GkVxdXDsiihg
	M/SxIwLKYhKiq/yRo+yK7sYinL9mvGL9AdSK9JCmSDVH+ItV5tYKD8Xi9KjNqprp0uc
	pvc+sfdr2Hsg58RX6Npl9fb0qsGzLihjTkNyOM1yyN1HCS3S3Y4QDTItjBEVCvxzOhZ
	a0QBXFNNJi5d/IGDzMBDhs9vOfvIcHPh8M5aPjUrt/zqt75nhNefFXpitQEgPPY1GUD
	r0hdD9TywyaqYQhr2uwSq/Zrl9O8bMD59JyL0A+3Nd3F3vffidBWaYN8WW/JI+kd7W1
	XDv+CgxSCA==
Received: by smtp.zohomail.com with SMTPS id 1791455462271972.5250923053629;
	Thu, 8 Oct 2026 03:31:02 -0700 (PDT)
Message-ID: <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Iker Pedrosa
 <ikerpedrosam@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 18:30:55 +0800
In-Reply-To: <20261008-df80c21d73b287d09b6baa78@squawk>
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
	 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org>
	 <20261008-df80c21d73b287d09b6baa78@squawk>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_033106_859612_57270D88 
X-CRM114-Status: GOOD (  15.52  )
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

5ZyoIDIwMjYtMTAtMDjlm5vnmoQgMDg6MjcgKzAxMDDvvIxDb25vciBEb29sZXnlhpnpgZPvvJoK
PiBPbiBUaHUsIE9jdCAwOCwgMjAyNiBhdCAwMzo0NDoyOUFNICswMDAwLCBZaXh1biBMYW4gd3Jv
dGU6Cj4gPiBBZGQgaW5pdGlhbCBwb3dlciBkb21haW4gZHJpdmVyIHN1cHBvcnQgZm9yIFNwYWNl
bWlUIEsxL0szIFNvQywgVGhlCj4gPiBQb3dlcgo+ID4gRG9tYWluIENvbnRyb2xsZXIgaXMgU29D
IGludGVybmFsIG1vZHVsZSB3aGljaCBpcyBwYXJ0IG9mIEFQTVUKPiA+IChBZHZhbmNlZAo+ID4g
UG93ZXIgTWFuYWdlbWVudCBVbml0KSwgaXQgaXMgcmVzcG9uc2libGUgZm9yIG1hbmFnaW5nIHBv
d2VyIGFjcm9zcwo+ID4gbXVsdGkKPiA+IHBvd2VyIGRvbWFpbnMsIHdoaWNoIGluY2x1ZGVzIHBv
d2VyIG9uL29mZiwgaXNvbGF0aW9uLCBwb3dlci1vbgo+ID4gc2VxdWVuY2UuCj4gCj4gWW91IHNo
b3VsZCBwcm9iIG1lbnRpb24gdGhhdCB0aGlzIEFQTVUgaXMgYWxyZWFkeSBkb2N1bWVudGVkCj4g
ZWxzZXdoZXJlLgoKTWF5YmUgaXQncyBhbHNvIG1lYW5pbmdmdWwgdG8gbWVudGlvbiB0aGF0IEFQ
TVUgYWxyZWFkeSBoYXMgI3Bvd2VyLQpkb21haW4tY2VsbHMgcHJvcGVydHksIGJlY2F1c2UgdGhl
IGZpcnN0IHJlYWN0aW9uIG9mIG1lIGlzIHRvIGFkZCBzdWNoCmEgcHJvcGVydHkgKGFuZCB0aGVu
IGZvdW5kIGl0IGFscmVhZHkgdGhlcmUpLgoKVGhhbmtzLApJY2Vub3d5Cgo+IEFja2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IHB3LWJvdDogbm90LWFw
cGxpY2FibGUKPiAKPiBUaGFua3MsCj4gQ29ub3IuCj4gCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6
IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiDCoGluY2x1ZGUvZHQtYmlu
ZGluZ3MvcG93ZXIvc3BhY2VtaXQsazEtcG93ZXIuaCB8IDE0ICsrKysrKysrKysrKysrCj4gPiDC
oGluY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvc3BhY2VtaXQsazMtcG93ZXIuaCB8IDEyICsrKysr
KysrKysrKwo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcG93ZXIvc3BhY2VtaXQsazEtcG93ZXIu
aAo+ID4gYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL3NwYWNlbWl0LGsxLXBvd2VyLmgKPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQxZWY1NDBiNWM0
NAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9z
cGFjZW1pdCxrMS1wb3dlci5oCj4gPiBAQCAtMCwwICsxLDE0IEBACj4gPiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLwo+ID4gKwo+
ID4gKyNpZm5kZWYgX0RUX0JJTkRJTkdTX1NQQUNFTUlUX0sxX1BPV0VSX0hfCj4gPiArI2RlZmlu
ZSBfRFRfQklORElOR1NfU1BBQ0VNSVRfSzFfUE9XRVJfSF8KPiA+ICsKPiA+ICsjZGVmaW5lIEsx
X1BNRE9NQUlOX1ZQVQkJMAo+ID4gKyNkZWZpbmUgSzFfUE1ET01BSU5fR1BVCQkxCj4gPiArI2Rl
ZmluZSBLMV9QTURPTUFJTl9MQ0QJCTIKPiA+ICsjZGVmaW5lIEsxX1BNRE9NQUlOX0lTUAkJMwo+
ID4gKyNkZWZpbmUgSzFfUE1ET01BSU5fQVVESU8JNAo+ID4gKyNkZWZpbmUgSzFfUE1ET01BSU5f
R05TUwk1Cj4gPiArI2RlZmluZSBLMV9QTURPTUFJTl9IRE1JCTYKPiA+ICsKPiA+ICsjZW5kaWYK
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Bvd2VyL3NwYWNlbWl0LGszLXBv
d2VyLmgKPiA+IGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9wb3dlci9zcGFjZW1pdCxrMy1wb3dlci5o
Cj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi41MTlmYmY5
NDYzMTIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcG93
ZXIvc3BhY2VtaXQsazMtcG93ZXIuaAo+ID4gQEAgLTAsMCArMSwxMiBAQAo+ID4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8KPiA+
ICsKPiA+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19TUEFDRU1JVF9LM19QT1dFUl9IXwo+ID4gKyNk
ZWZpbmUgX0RUX0JJTkRJTkdTX1NQQUNFTUlUX0szX1BPV0VSX0hfCj4gPiArCj4gPiArI2RlZmlu
ZSBLM19QTURPTUFJTl9WUFUJCTAKPiA+ICsjZGVmaW5lIEszX1BNRE9NQUlOX0dQVQkJMQo+ID4g
KyNkZWZpbmUgSzNfUE1ET01BSU5fQVVESU8JMgo+ID4gKyNkZWZpbmUgSzNfUE1ET01BSU5fTENE
MAkzCj4gPiArI2RlZmluZSBLM19QTURPTUFJTl9MQ0QxCTQKPiA+ICsKPiA+ICsjZW5kaWYKPiA+
IAo+ID4gLS0gCj4gPiAyLjU2LjAKPiA+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
