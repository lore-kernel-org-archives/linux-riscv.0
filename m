Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98272C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yMb4JKlqGwAsdtLa1RwpNsDGfNl53gBNZzZeAA84FM=; b=z2KsUCK3QuRsuE
	vpYdiRhqaXEq0YOsKD6laqaG4XjMgLY0XzufEY3IoYgO91yJ02LH382asPTjMAKKh7m1/TV9ihhwv
	7vpTT9ejhGLBtNAZ8lXRf0KQWCd529YKUaflDK+YVfjXvN1u/BeaqvR1L/kmyfeMPIvb44eNq1b44
	pf7T3oVid97HCXexKpYyk2dN4hUHqP3x8bCh5ZJvxMXCsT5cVBCVbeWpXG3qPFQFlLOlUThu2/Hno
	okz0PKGuyCnqvePjWBFpontHt+aex7p9B7CNRaa37ErFvLvGhlkNy52CmfB9kPAZ+W59HU6UYPqmE
	cgjHhZ1tlCorty/9TIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26sk-00GGZ7-Qm; Mon, 05 Dec 2022 08:31:22 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26sg-00GGX2-SX
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 08:31:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670228159; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=im1tnFABP6Gq5f5JgX0Hlm4K4O61YYWtd/r1+1NTljCowLPOqjaGZmT6GszUALt805dTNEF2r7u/o2smKe5g0oeSxG+bQ1i9IGj+Z7d33oEVz8AjpPKrOAx1IPqRcsJDpRS8/dnNF1d+vjfjOp0gPCsd5cF/A8U1OSfQpkri4sc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670228159; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=G6hbPiBt/fhMbeRAyCrqatnfivN1dw3GU+vvJg5sKf0=; 
	b=BqEXUBHV9uCV0MCmPrylLpkyOdC8rz6ABe4X+QtUuxN/TFYBAEB547n+RiWsR3rh/x4uaAlBeFO64HLHNzplClYrNMC9q6XdWAA9q4rnBKqe4Xrop1ussRhaucavhI5ElyELmKyIfQxaKH7oCiyt0YJTvq/MIXdTPhHdE7JipLQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670228159;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=G6hbPiBt/fhMbeRAyCrqatnfivN1dw3GU+vvJg5sKf0=;
	b=c31wsBQmxQnjKdYlMWxWKqAUw5y7jjGRURbD/homkCVKVSnUSxg92EOmRzTnJwfS
	a1dNpVsqCrz0nppdUzXbXCJTHHhzWsvgl3KcEhcgk9B53NMX7Js1H3BLjYb9sDs1LOM
	Olb+D6mIxGOUD1UTFVgmykvqLZc8TX1T3oLIrKlw=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 1670228157594162.27257640298603; Mon, 5 Dec 2022 00:15:57 -0800 (PST)
Message-ID: <f5a07ab14341d3a7ce8faf38f1d603eb4aed3c7b.camel@icenowy.me>
Subject: Re: [PATCH v2 7/9] riscv: dts: bouffalolab: add Sipeed M1s SoM and
 Dock devicetree
From: Icenowy Zheng <uwu@icenowy.me>
To: Samuel Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Date: Mon, 05 Dec 2022 16:15:46 +0800
In-Reply-To: <91d7eebd-7433-c06d-6d14-a01d11af9df9@sholland.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
	 <20221127132448.4034-8-jszhang@kernel.org>
	 <91d7eebd-7433-c06d-6d14-a01d11af9df9@sholland.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_003119_034998_C0E302DA 
X-CRM114-Status: GOOD (  19.79  )
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

5ZyoIDIwMjItMTEtMzDmmJ/mnJ/kuInnmoQgMDE6MjUgLTA2MDDvvIxTYW11ZWwgSG9sbGFuZOWG
memBk++8mgo+IE9uIDExLzI3LzIyIDA3OjI0LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4gU2lw
ZWVkIG1hbnVmYWN0dXJlcyBhIE0xcyBzeXN0ZW0tb24tbW9kdWxlIGFuZCBkb2NrIGJvYXJkLCBh
ZGQKPiA+IGJhc2ljCj4gPiBzdXBwb3J0IGZvciB0aGVtLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+IMKgYXJjaC9y
aXNjdi9ib290L2R0cy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEgKwo+ID4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL01ha2VmaWxlwqDC
oMKgwqDCoCB8wqAgMiArKwo+ID4gwqAuLi4vZHRzL2JvdWZmYWxvbGFiL2JsODA4LXNpcGVlZC1t
MXMtZG9jay5kdHMgfCAyNQo+ID4gKysrKysrKysrKysrKysrKysrKwo+ID4gwqAuLi4vZHRzL2Jv
dWZmYWxvbGFiL2JsODA4LXNpcGVlZC1tMXMuZHRzacKgwqDCoMKgIHwgMjEKPiA+ICsrKysrKysr
KysrKysrKysKPiA+IMKgNCBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4gPiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFiL01ha2VmaWxl
Cj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2JvdWZmYWxvbGFi
L2JsODA4LXNpcGVlZC0KPiA+IG0xcy1kb2NrLmR0cwo+ID4gwqBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQtCj4gPiBtMXMuZHRz
aQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZQo+ID4g
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlCj4gPiBpbmRleCBmZjE3NDk5NmNkZmQuLmI1
MjU0NjcxNTJiMiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPiA+IEBAIC0xLDQgKzEsNSBA
QAo+ID4gwqAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArc3ViZGlyLXkg
Kz0gYm91ZmZhbG9sYWIKPiA+IMKgc3ViZGlyLXkgKz0gc2lmaXZlCj4gPiDCoHN1YmRpci15ICs9
IHN0YXJmaXZlCj4gPiDCoHN1YmRpci0kKENPTkZJR19TT0NfQ0FOQUFOX0syMTBfRFRCX0JVSUxU
SU4pICs9IGNhbmFhbgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYm91ZmZh
bG9sYWIvTWFrZWZpbGUKPiA+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9NYWtl
ZmlsZQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTQx
OTk2NGU4OTJkCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2JvdWZmYWxvbGFiL01ha2VmaWxlCj4gPiBAQCAtMCwwICsxLDIgQEAKPiA+ICsjIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArZHRiLSQoQ09ORklHX1NPQ19CT1VGRkFMT0xB
QikgKz0gYmw4MDgtc2lwZWVkLW0xcy1kb2NrLmR0Ygo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvYm91ZmZhbG9sYWIvYmw4MDgtc2lwZWVkLW0xcy0KPiA+IGRvY2suZHRzIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQtbTFzLQo+ID4gZG9j
ay5kdHMKPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmM2
YjQ4OTRhN2I4OAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQtbTFzLWRvY2suZHRzCj4gPiBAQCAtMCwwICsxLDI1
IEBACj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wKyBvciBNSVQpCj4g
PiArLyoKPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPgo+ID4gKyAqLwo+ID4gKwo+ID4gKy9kdHMtdjEvOwo+ID4gKwo+ID4gKyNpbmNs
dWRlICJibDgwOC1zaXBlZWQtbTFzLmR0c2kiCj4gPiArCj4gPiArLyB7Cj4gPiArwqDCoMKgwqDC
oMKgwqBtb2RlbCA9ICJTaXBlZWQgTTFzIERvY2siOwo+ID4gK8KgwqDCoMKgwqDCoMKgY29tcGF0
aWJsZSA9ICJzaXBlZWQsbTFzLWRvY2siLCAic2lwZWVkLG0xcyIsCj4gPiAiYm91ZmZhbG9sYWIs
Ymw4MDgiOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgYWxpYXNlcyB7Cj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VyaWFsMCA9ICZ1YXJ0MDsKPiA+ICvCoMKgwqDCoMKgwqDC
oH07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBjaG9zZW4gewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHN0ZG91dC1wYXRoID0gInNlcmlhbDA6MjAwMDAwMG44IjsKPiA+ICvC
oMKgwqDCoMKgwqDCoH07Cj4gPiArfTsKPiA+ICsKPiA+ICsmdWFydDAgewo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RhdHVzID0gIm9rYXkiOwo+ID4gK307Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9ib290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQtbTFzLmR0c2kKPiA+IGIvYXJjaC9y
aXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9ibDgwOC1zaXBlZWQtbTFzLmR0c2kKPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjUwMjZkZTc2ODUzNAo+ID4g
LS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9ib3VmZmFsb2xhYi9i
bDgwOC1zaXBlZWQtbTFzLmR0c2kKPiA+IEBAIC0wLDAgKzEsMjEgQEAKPiA+ICsvLyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIG9yIE1JVCkKPiA+ICsvKgo+ID4gKyAqIENvcHly
aWdodCAoQykgMjAyMiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiArICov
Cj4gPiArCj4gPiArL2R0cy12MS87Cj4gPiArCj4gPiArI2luY2x1ZGUgImJsODA4LmR0c2kiCj4g
PiArCj4gPiArLyB7Cj4gPiArwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gInNpcGVlZCxtMXMi
LCAiYm91ZmZhbG9sYWIsYmw4MDgiOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgbWVtb3J5QDUw
MDAwMDAwIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZpY2VfdHlwZSA9
ICJtZW1vcnkiOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDUw
MDAwMDAwIDB4MDQwMDAwMDA+Owo+ID4gK8KgwqDCoMKgwqDCoMKgfTsKPiAKPiBUaGUgUFNSQU0g
aXMgcGFydCBvZiB0aGUgQkw4MDgsIHNvIHRoaXMgc2hvdWxkIGdvIGluIHRoZSBTb0MgLmR0c2kK
PiBmaWxlLgo+IChVbmxlc3MgSSdtIG1pc3Npbmcgc29tZXRoaW5nIGFuZCB0aGVyZSBhcmUgQkw4
MDggdmFyaWFudHMgd2l0aAo+IGRpZmZlcmVudCBhbW91bnRzIG9mIG1lbW9yeS4gVGhlIFBTUkFN
IGluaXQgY29kZSBpbiB0aGUgU0RLIGRvZXMgc2l6ZQo+IGRldGVjdGlvbiwgc28gSSBzdXBwb3Nl
IGl0IGlzIHBvc3NpYmxlLikKCkkgdGhpbmsgaXQgcmVhbGx5IGhhcyB2YXJpYW50cy4KCj4gCj4g
UmVnYXJkcywKPiBTYW11ZWwKPiAKPiA+ICt9Owo+ID4gKwo+ID4gKyZ4dGFsIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoGNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDAwMD47Cj4gPiArfTsKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
