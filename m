Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2656C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjmICBKsfl22PZ2akkTKRHPGkParYS4oGik1vuXosDs=; b=K9rIlfObA88fc/
	Vel3PPf60iojjSKLD2cD5ttunN9AvHsD3z4CAs5fj89RxQQQFTRmJ9Q638MWiVXU788DV/LEx1nMq
	TufruImsp3LE7PYXzpSJB1QiaRRAtwzEWj9kziHlkG/pm9gKv5vQPyNQqXWzt0yS3ADAFyvDIGIEt
	EXh6ODiomsf8ZH2GDG5YBYCZhbfDJ8vQqh30Hy6vE8Aq2ZlU+bIsWWUlRzpQLvfAncvFNiDJ2Z7yY
	p+Pd/JMOAr41zUXM6xBB0Ad7yAup/qC0lvhTUnmjiO8BdKWE2d6oMxusSOsq5V+t+w1u0CNKQtEBv
	nreoajHDwnfcC7Iqv1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Qg-009z44-KI; Wed, 04 Jan 2023 15:11:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2hI-0090Eh-9E
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 12:16:45 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pD2h2-0006Bl-K6; Wed, 04 Jan 2023 13:16:28 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guo Ren <guoren@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA synchorization
Date: Wed, 04 Jan 2023 13:16:27 +0100
Message-ID: <2135147.irdbgypaU6@diego>
In-Reply-To: <bcce507a31662004262fa3bbe911f1b1ff7f27af.camel@icenowy.me>
References: <20230104074146.578485-1-uwu@icenowy.me> <CAJF2gTTO3jx8FqMVRmfgkjO02sCVx2SVbe-Sn1uKXojyn8RDaA@mail.gmail.com> <bcce507a31662004262fa3bbe911f1b1ff7f27af.camel@icenowy.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_041644_363810_57E2BD91 
X-CRM114-Status: GOOD (  26.36  )
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

SGksCgpBbSBNaXR0d29jaCwgNC4gSmFudWFyIDIwMjMsIDEwOjI3OjUzIENFVCBzY2hyaWViIElj
ZW5vd3kgWmhlbmc6Cj4g5ZyoIDIwMjMtMDEtMDTmmJ/mnJ/kuInnmoQgMTc6MjQgKzA4MDDvvIxH
dW8gUmVu5YaZ6YGT77yaCj4gPiBPbiBXZWQsIEphbiA0LCAyMDIzIGF0IDQ6NTkgUE0gSWNlbm93
eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+ID4gPiAKPiA+ID4g5ZyoIDIwMjMtMDEt
MDTmmJ/mnJ/kuInnmoQgMTY6NTAgKzA4MDDvvIxHdW8gUmVu5YaZ6YGT77yaCj4gPiA+ID4gT24g
V2VkLCBKYW4gNCwgMjAyMyBhdCAzOjQzIFBNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1l
Pgo+ID4gPiA+IHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBETUEgc3luY2hvcml6YXRpb24g
aXMgZG9uZSBvbiBQQSBhbmQgdGhlIFZBIGlzIGNhbGN1bGF0ZWQgZnJvbQo+ID4gPiA+ID4gdGhl
Cj4gPiA+ID4gPiBQQS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gVXNlIHRoZSBhbHRlcm5hdGl2ZSBt
YWNybyB2YXJpYW50IHRoYXQgdGFrZXMgYm90aCBWQSBhbmQgUEEgYXMKPiA+ID4gPiA+IHBhcmFt
ZXRlcnMsIHRodXMgaW4gY2FzZSB0aGUgSVNBIGV4dGVuc2lvbiB1c2VkIHN1cHBvcnQgUEEKPiA+
ID4gPiA+IGRpcmVjdGx5LCB0aGUKPiA+ID4gPiA+IG92ZXJoZWFkIGZvciByZS1jb252ZXJ0aW5n
IFZBIHRvIFBBIGNhbiBiZSBvbWl0dGVkLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTdWdnZXN0ZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
SWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBh
cmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jIHwgOCArKysrLS0tLQo+ID4gPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiAK
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4g
PiA+ID4gPiBiL2FyY2gvcmlzY3YvbW0vZG1hLQo+ID4gPiA+ID4gbm9uY29oZXJlbnQuYwo+ID4g
PiA+ID4gaW5kZXggZDkxOWVmYWI2ZWJhLi5hNzUxZjRhZWNlNjIgMTAwNjQ0Cj4gPiA+ID4gPiAt
LS0gYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4gPiA+ID4gPiArKysgYi9hcmNo
L3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4gPiA+ID4gPiBAQCAtMTksMTMgKzE5LDEzIEBA
IHZvaWQgYXJjaF9zeW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNfYWRkcl90Cj4gPiA+ID4gPiBwYWRk
ciwgc2l6ZV90IHNpemUsCj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAgICAgICAgc3dpdGNoIChkaXIp
IHsKPiA+ID4gPiA+ICAgICAgICAgY2FzZSBETUFfVE9fREVWSUNFOgo+ID4gPiA+ID4gLSAgICAg
ICAgICAgICAgIEFMVF9DTU9fT1AoY2xlYW4sIHZhZGRyLCBzaXplLAo+ID4gPiA+ID4gcmlzY3Zf
Y2JvbV9ibG9ja19zaXplKTsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBBTFRfQ01PX09QX1ZQ
QShjbGVhbiwgdmFkZHIsIHBhZGRyLCBzaXplLAo+ID4gPiA+ID4gcmlzY3ZfY2JvbV9ibG9ja19z
aXplKTsKPiA+ID4gPiBBTFRfQ01PX09QIC0+IEFMVF9DTU9fT1BfVlBBLCBpcyB0aGUgcmVuYW1p
bmcgbmVjZXNzYXJ5Pwo+ID4gPiAKPiA+ID4gSSBkaWRuJ3QgcmVuYW1lIHRoZSBvcmlnaW5hbCBB
TFRfQ01PX09QLCBBTFRfQ01PX09QX1ZQQSBpcwo+ID4gPiBzb21ldGhpbmcKPiA+ID4gbmV3Lgo+
ID4gVGhlICMjX1ZQQSBpcyByZWFsbHkgc3RyYW5nZS4KPiA+IAo+ID4gSG93IGFib3V0Ogo+ID4g
QUxUX0NNT19PUCAgICAgICAgICAtPiBBTFRfQ01PX09QX1ZBCj4gPiBBTFRfQ01PX09QX1ZQQSAt
PiBBTFRfQ01PX09QCj4gCj4gSXQncyB0aHVzIGEgbXVjaCBiaWdnZXIgY2hhbmdlLgo+IAo+IElm
IHlvdSBhcmUgbm90IGZvbmQgb2YgX1ZQQSwgSSBjYW4gcmVuYW1lIGl0IHRvIF9WQV9QQS4KCmJl
Zm9yZSB5b3Ugc3BlbmQgdG9vIG11Y2ggdGltZSBvbiB0aGlzLCB0aGVyZSBpcyBjdXJyZW50bHkg
YSBwYXJhbGxlbApkaXNjdXNzaW9uIHJ1bm5pbmcgYWJvdXQgaW5jbHVkaW5nIGFsbCB0aGUgb3Ro
ZXIgZGlmZmVyZW50IHZlbmRvci0Kc3BlY2lmaWMgY2FjaGUgbWFuYWdlbWVudC4KClNlZSBbMF0g
YW5kIHRoZSB0aHJlYWQgYmVmb3JlIHRoYXQgZm9yIHJlZmVyZW5jZS4KClRoZSBjb25zZW5zdXMg
c2VlbXMgdG8gYmUgdGhhdCBjYWNoZS1oYW5kbGluZyBpdHNlbGYgaXMgbm90IGZhc3QgYW55d2F5
LAphbmQgdGhlcmVmb3JlIHRvIHJlZHVjZSBjb21wbGV4aXR5IGZvciB0aGUgY2FjaGUgaGFuZGxp
bmcgYW5kIG1vdmUKbm9uLXppY2JvbSBjYWNoZS1oYW5kbGluZyBpbnRvIGEgaW5kaXJlY3QgZnVu
Y3Rpb24gY2FsbCB0aGF0IHRoZSBjYW4gYmUKb3ZlcnJpZGRlbiBhdCBydW50aW1lLgoKCkhlaWtv
CgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzQzYWVlMDAwLTViODktNGQ5NC05OGQy
LWIzN2IxYTE4YTgzZUBhcHAuZmFzdG1haWwuY29tLwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
