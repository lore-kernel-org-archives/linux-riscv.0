Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E886BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f60puNkRU7+iBMIdtsDhtBS8eiwowLN6pbF6RUVXzeI=; b=pCr7uGT28Rw798
	NXWwgB0w94EI4FzvpsXpZfjktO8PGTTno/TdhQb4/V/KZfxTRmLYUj3iH3plkhVk48mKmqyVahD1X
	U4vLbBCVCXReM/aQQwsah1F8Nt64BM46Vygqpo1wT7xX7UD7UY42duebLGC3b7fY5+ijgoZ3bRy0Z
	D2+y9kNG++w8CE8Inuou8RdfaQGwLw/Y+WdQTCJGvy7EEVK7XJ8TH5M1Fz8beSyySagK1jU2oFnMe
	QUI+DFnYd/uQhzYt2qK2NLFw4lGXsli6ueIPGeRGNqz3SyyZoD5M8lwTq8ts4ZfI5KtCdwrdYmrHX
	795Gdu+kNZVjay97tiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzf7-007rjF-KV; Wed, 04 Jan 2023 09:02:17 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzcE-007qJn-5a
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 08:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672822747; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d5eZy/gk6QR6EU8i/njR8r3ZZHpMWIMIVJFfLzXnm9HTVOKh8dNr4ki5iBl/sOoehHF0/KrFDKJgmKV5JPPlcv49uPpxrSJnTUiB8/eGp0Awy7FkSoI4Xz/dj2Olbosu3Dw0mkOtZaBvlPZOuRqz+4a9jgE9M2S6Sm0MBhtg53Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672822747; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=mGVEEqg9y41OGC1daXDP6Rf+M/fdNyUu5fMaF3ljaNI=; 
	b=bwcTxJ1E3mJQjGu/+VVD0QgaBlmG2zMZqIKQuyREfU7F0ufSfziXCIrCUezt0gk+z9tduvBZ2mnghYM0FNL8Jt377qrdnhOmxHRcDhZRz9RutqAuwYeN+TPRGkm1Qquht4D44i+tTnSwCsf6gOIcvs+nvwQyGSjSmPCH9wND8a4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672822747;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=mGVEEqg9y41OGC1daXDP6Rf+M/fdNyUu5fMaF3ljaNI=;
	b=Vk0Fjlc3K4sq3GmQZCScu/Z96MNb3aTZ31Uaa8YkZD3/jSWd5Mn0V53D5N2pI1jZ
	ZFXGTNMO6iqbV9c0Llx99tDnXG1X8ZW5OaurALPzzX28GFKPDG9xG6o5UGlvKDodDOf
	yRLAsdWCSIygmH/ofZ8YLlpoJGGatmTT3ggpFhfQ=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672822745390708.8255740342773; Wed, 4 Jan 2023 00:59:05 -0800 (PST)
Message-ID: <a2a8c7522b9b57f074d6962511b6d779cfd4b56b.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA
 synchorization
From: Icenowy Zheng <uwu@icenowy.me>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	 <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>, Conor Dooley
	 <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Jan 2023 16:59:00 +0800
In-Reply-To: <CAJF2gTSb4qEPHw8hy1ro+UMoyKQaoQESNGveSGLdPL=cXac8jQ@mail.gmail.com>
References: <20230104074146.578485-1-uwu@icenowy.me>
	 <20230104074146.578485-3-uwu@icenowy.me>
	 <CAJF2gTSb4qEPHw8hy1ro+UMoyKQaoQESNGveSGLdPL=cXac8jQ@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_005918_295654_4438F596 
X-CRM114-Status: GOOD (  16.00  )
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

5ZyoIDIwMjMtMDEtMDTmmJ/mnJ/kuInnmoQgMTY6NTAgKzA4MDDvvIxHdW8gUmVu5YaZ6YGT77ya
Cj4gT24gV2VkLCBKYW4gNCwgMjAyMyBhdCAzOjQzIFBNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4gRE1BIHN5bmNob3JpemF0aW9uIGlzIGRvbmUgb24gUEEg
YW5kIHRoZSBWQSBpcyBjYWxjdWxhdGVkIGZyb20gdGhlCj4gPiBQQS4KPiA+IAo+ID4gVXNlIHRo
ZSBhbHRlcm5hdGl2ZSBtYWNybyB2YXJpYW50IHRoYXQgdGFrZXMgYm90aCBWQSBhbmQgUEEgYXMK
PiA+IHBhcmFtZXRlcnMsIHRodXMgaW4gY2FzZSB0aGUgSVNBIGV4dGVuc2lvbiB1c2VkIHN1cHBv
cnQgUEEKPiA+IGRpcmVjdGx5LCB0aGUKPiA+IG92ZXJoZWFkIGZvciByZS1jb252ZXJ0aW5nIFZB
IHRvIFBBIGNhbiBiZSBvbWl0dGVkLgo+ID4gCj4gPiBTdWdnZXN0ZWQtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1QGlj
ZW5vd3kubWU+Cj4gPiAtLS0KPiA+IMKgYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYyB8
IDggKysrKy0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVy
ZW50LmMgYi9hcmNoL3Jpc2N2L21tL2RtYS0KPiA+IG5vbmNvaGVyZW50LmMKPiA+IGluZGV4IGQ5
MTllZmFiNmViYS4uYTc1MWY0YWVjZTYyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9k
bWEtbm9uY29oZXJlbnQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQu
Ywo+ID4gQEAgLTE5LDEzICsxOSwxMyBAQCB2b2lkIGFyY2hfc3luY19kbWFfZm9yX2RldmljZShw
aHlzX2FkZHJfdAo+ID4gcGFkZHIsIHNpemVfdCBzaXplLAo+ID4gCj4gPiDCoMKgwqDCoMKgwqDC
oCBzd2l0Y2ggKGRpcikgewo+ID4gwqDCoMKgwqDCoMKgwqAgY2FzZSBETUFfVE9fREVWSUNFOgo+
ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUChjbGVhbiwgdmFkZHIs
IHNpemUsCj4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgQUxUX0NNT19PUF9WUEEoY2xlYW4sIHZhZGRyLCBwYWRkciwgc2l6ZSwKPiA+
IHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gQUxUX0NNT19PUCAtPiBBTFRfQ01PX09QX1ZQQSwg
aXMgdGhlIHJlbmFtaW5nIG5lY2Vzc2FyeT8KCkkgZGlkbid0IHJlbmFtZSB0aGUgb3JpZ2luYWwg
QUxUX0NNT19PUCwgQUxUX0NNT19PUF9WUEEgaXMgc29tZXRoaW5nCm5ldy4KCj4gCj4gT3RoZXJz
Ogo+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+IMKgwqDCoMKgwqDCoMKgIGNhc2Ug
RE1BX0ZST01fREVWSUNFOgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NN
T19PUChjbGVhbiwgdmFkZHIsIHNpemUsCj4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUF9WUEEoY2xlYW4sIHZhZGRy
LCBwYWRkciwgc2l6ZSwKPiA+IHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiDCoMKgwqDCoMKgwqDCoCBjYXNlIERNQV9C
SURJUkVDVElPTkFMOgo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19P
UChmbHVzaCwgdmFkZHIsIHNpemUsCj4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUF9WUEEoZmx1c2gsIHZhZGRyLCBw
YWRkciwgc2l6ZSwKPiA+IHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0Ogo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gQEAgLTQyLDcgKzQyLDcg
QEAgdm9pZCBhcmNoX3N5bmNfZG1hX2Zvcl9jcHUocGh5c19hZGRyX3QgcGFkZHIsCj4gPiBzaXpl
X3Qgc2l6ZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+IMKg
wqDCoMKgwqDCoMKgIGNhc2UgRE1BX0ZST01fREVWSUNFOgo+ID4gwqDCoMKgwqDCoMKgwqAgY2Fz
ZSBETUFfQklESVJFQ1RJT05BTDoKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFM
VF9DTU9fT1AoZmx1c2gsIHZhZGRyLCBzaXplLAo+ID4gcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFMVF9DTU9fT1BfVlBBKGZsdXNoLCB2
YWRkciwgcGFkZHIsIHNpemUsCj4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+ID4gwqDCoMKgwqDCoMKgwqAgZGVmYXVs
dDoKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+IC0tCj4gPiAy
LjM4LjEKPiA+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
