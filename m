Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445F3EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUCEQha/3evqeHtbo+yJaHltp6qOLIoDCkZ+Xc85QAA=; b=WBxlKCADEQusaz
	hVSAXZ20GNVokKg12VdGDuoy1C7vA8BCbhwy+SXLZXCvIQua8lEc/IcA+lYHvzCrIdxxsKlhBlsb0
	LXYv06gMLqLe2hA/GVSxhl4HLc3TH0knhO3Wh2IvTKJJQgKZPvZmA0Foqp8ZICWwRF6cxx94twXLj
	XVk/ZfSOhd1nZt04bThbIXI+OzyEuMf+/3E2Le/w4AwGjDSOAxHVxAW1mQfqiixQ8X2ERAgm31b9T
	Fyk2PW334F7xrSalMx1NuwF0vZupj1XRqc0Tn/UGpMu44zZnSbV4TDd2r0d4bf6azIRV2Zx1c/GbA
	5mxecyf8cP3NClj0i5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqOs-0011Le-2x;
	Thu, 29 Jun 2023 12:05:26 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqOp-0011K8-0V
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 12:05:24 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-15--5xlMR_NMheo5ckPJhB_mw-1; Thu, 29 Jun 2023 13:05:16 +0100
X-MC-Unique: -5xlMR_NMheo5ckPJhB_mw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 29 Jun
 2023 13:05:14 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 29 Jun 2023 13:05:14 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Evan Green' <evan@rivosinc.com>, Jessica Clarke <jrtc27@jrtc27.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley
	<conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang
	<jszhang@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
	"Jonathan Corbet" <corbet@lwn.net>, Xianting Tian
	<xianting.tian@linux.alibaba.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, Li
 Zhengyu <lizhengyu3@huawei.com>, Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Ley Foon Tan" <leyfoon.tan@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, Anup
 Patel <apatel@ventanamicro.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>
Subject: RE: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Thread-Topic: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Thread-Index: AQHZqSszK74IXZi1x0Sk5pxi8WFXO6+hr6jw
Date: Thu, 29 Jun 2023 12:05:14 +0000
Message-ID: <53dc6959cc8849d6b66676ad48c1376a@AcuMS.aculab.com>
References: <20230623222016.3742145-1-evan@rivosinc.com>
 <20230623222016.3742145-2-evan@rivosinc.com>
 <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com>
 <CALs-HssZG8daTJaRK8JPT0VRk=23CtO6B_5kq4Xa_DdLELjaZw@mail.gmail.com>
In-Reply-To: <CALs-HssZG8daTJaRK8JPT0VRk=23CtO6B_5kq4Xa_DdLELjaZw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_050523_486352_B9EB3481 
X-CRM114-Status: GOOD (  20.11  )
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

RnJvbTogRXZhbiBHcmVlbg0KPiBTZW50OiAyNyBKdW5lIDIwMjMgMjA6MTINCj4gDQo+IE9uIE1v
biwgSnVuIDI2LCAyMDIzIGF0IDI6NDLigK9QTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMy
Ny5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gMjMgSnVuIDIwMjMsIGF0IDIzOjIwLCBFdmFuIEdy
ZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4gd3JvdGU6DQo+ID4gPg0KPiA+ID4gUmF0aGVyIHRoYW4g
ZGVmZXJyaW5nIG1pc2FsaWduZWQgYWNjZXNzIHNwZWVkIGRldGVybWluYXRpb25zIHRvIGEgdmVu
ZG9yDQo+ID4gPiBmdW5jdGlvbiwgbGV0J3MgcHJvYmUgdGhlbSBhbmQgZmluZCBvdXQgaG93IGZh
c3QgdGhleSBhcmUuIElmIHdlDQo+ID4gPiBkZXRlcm1pbmUgdGhhdCBhIG1pc2FsaWduZWQgd29y
ZCBhY2Nlc3MgaXMgZmFzdGVyIHRoYW4gTiBieXRlIGFjY2Vzc2VzLA0KPiA+ID4gbWFyayB0aGUg
aGFyZHdhcmUncyBtaXNhbGlnbmVkIGFjY2VzcyBhcyAiZmFzdCIuDQo+ID4NCj4gPiBIb3cgc3Vy
ZSBhcmUgeW91IHRoYXQgeW91ciBtZWFzdXJlbWVudHMgY2FuIGJlIGV4dHJhcG9sYXRlZCBhbmQg
YXJlbuKAmXQNCj4gPiBhbiBhcnRlZmFjdCBvZiB0aGUgdGVzdGluZyBwcm9jZXNzPyBGb3IgZXhh
bXBsZSwgb2ZmIHRoZSB0b3Agb2YgbXkgaGVhZDoNCj4gPg0KPiA+ICogVGhlIGZpcnN0IHJ1biB3
aWxsIHBvdGVudGlhbGx5IGJlIHBlbmFsaXNlZCBieSBkYXRhIGNhY2hlIG1pc3NlcywNCj4gPiAg
IHVudHJhaW5lZCBwcmVmZXRjaGVycywgVExCIG1pc3NlcywgYnJhbmNoIHByZWRpY3RvcnMsIGV0
Yy4gY29tcGFyZWQNCj4gPiAgIHdpdGggbGF0ZXIgcnVucy4gWW91IGhhdmUgb25lIHdhcm11cCwg
YnV0IHdobyBrbm93cyBob3cgbWFueQ0KPiA+ICAgaXRlcmF0aW9ucyBpdCB3aWxsIHRha2UgdG8g
Y29udmVyZ2U/DQo+IA0KPiBJJ2QgZXhwZWN0IHRoZSBjYWNoZSBwZW5hbHRpZXMgdG8gYmUgcmVh
c29uYWJseSBjb3ZlcmVkIGJ5IGEgc2luZ2xlDQo+IHdhcm11cC4gWW91J3JlIHJpZ2h0IGFib3V0
IGJyYW5jaCBwcmVkaWN0aW9uLCB3aGljaCBpcyB3aHkgSSB0cmllZCB0bw0KPiB1c2UgYSBsYXJn
ZS1pc2ggYnVmZmVyIHNpemUsIG1pbmltaXplIHRoZSByYXRpbyBvZiBjb25kaXRpb25hbHMgdG8N
Cj4gbG9hZHMvc3RvcmVzLCBhbmQgZG8gdGhlIHRlc3QgZm9yIGEgZGVjZW50IG51bWJlciBvZiBp
dGVyYXRpb25zIChvbiBteQ0KPiBUSGVhZCwgYWJvdXQgMTgwMCBhbmQgNDAwIGZvciB3b3JkcyBh
bmQgYnl0ZXMpLg0KPiANCj4gV2hlbiBJIHJhbiB0aGUgdGVzdCBhIGhhbmRmdWwgb2YgdGltZXMs
IEkgZGlkIHNlZSB2YXJpYXRpb24gb24gdGhlDQo+IG9yZGVyIG9mIH41JS4gQnV0IHRoZSBjb21w
YXJpc29uIG9mIHRoZSB0d28gbnVtYmVycyBkb2Vzbid0IHNlZW0gdG8gYmUNCj4gYW55d2hlcmUg
bmVhciB0aGF0IG1hcmdpbiAoVEhlYWQgQzkwNiB3YXMgfjR4IGZhc3RlciBkb2luZyBtaXNhbGln
bmVkDQo+IHdvcmQgYWNjZXNzZXMsIG90aGVycyB3aXRoIHNsb3cgbWlzYWxpZ25lZCBhY2Nlc3Nl
cyBhbHNvIHJlcG9ydGluZw0KPiBudW1iZXJzIG5vdCBhbnl3aGVyZSBjbG9zZSB0byBlYWNoIG90
aGVyKS4NCg0KSXNuJ3QgdGhlIEVNVUxBVEVEIGNhc2Ugc28gbXVjaCBzbG93ZXIgdGhhbiBhbnl0
aGluZyBlbHNlIHRoYXQNCml0IGlzIGV2ZW4gcHJldHR5IG9idmlvdXMgZnJvbSBhIHNpbmdsZSBh
Y2Nlc3M/DQooUG9zc2libHkgdGhlIDJuZCBhY2Nlc3MgdG8gYXZvaWQgJ2NvbGQgY2FjaGUnLikN
Cg0KT25lIG9mIHRoZSB0aGluZ3MgdGhhdCBjYW4gcGVydHVyYiBtZWFzdXJlbWVudHMgaXMgaGFy
ZHdhcmUNCmludGVycnVwdHMuIFRoYXQgY2FuIGJlIG1pdGlnYXRlZCBieSBjb3VudGluZyBjbG9j
a3MgZm9yIGEgZmV3DQooMTAgaXMgcGxlbnR5KSBpdGVyYXRpb25zIG9mIGEgc2hvcnQgcmVxdWVz
dCBhbmQgdGFraW5nIHRoZQ0KZmFzdGVzdCB2YWx1ZS4NCkZvciBzaG9ydCBob3QtY2FjaGUgY29k
ZSBzZXF1ZW5jZXMgeW91IGNhbiBhY3R1YWxseSBjb21wYXJlIHRoZQ0KYWN0dWFsIGNsb2NrIGNv
dW50cyB3aXRoIHRoZW9yZXRpY2FsIG1pbmltdW0gdmFsdWVzLg0KDQoJRGF2aWQNCg0KLQ0KUmVn
aXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRv
biBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
