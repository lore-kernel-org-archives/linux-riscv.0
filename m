Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C30C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vjW912O3HG+qgxDEN3ax+v8SBNCRTU0Gtz/ABB0NNU=; b=xCsnQP+l6Vvx/6
	MXjVkswz0XlVuxRO90VAG14krB+9AU3cvQu14geIC91bRPf6uxNCfj9fyobSmSX1Y/0Zk3xNt64u2
	EJwF3MREx0VinFESoRDi7GNSXHnbC8xYhkF1z4tkNdZqpkaDEFCzxTIiVJmOqpyje7fdSDBda+h90
	Rq/vKR9DMIaBJI5GU+eifTZ7NnBnjMtrCWEt22n4dC5I8zqrrU5WnJ7kTlQFvXaF8rBuHr0nJmC5f
	L8Wje0gpSArTmBuepdkNXCEC4pyXXn2StD/GcVjavps8VZ31l7lGp0km1neCy0nBzIsuBsH+S/ior
	Koh9qmJ3yc1B58WawLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0FU-00898h-J8; Wed, 04 Jan 2023 09:39:52 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD047-00830D-RI
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672824480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YIQEWIVUbVNMgNztNFFri95OdmgMmxigoGRuhNY2lA3lC+hXUYFloEI0ZVp+n+lZeMkGPXSJxPmAqP4R+tC7CqUK5xKt7YVbgdrO5Z57IGTzzNVc+vz3jbvb/6y9Q1jq9OwZorTNcHhC3jzwIZiZMfw8x+tMTrtDCcIzodJmkEo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672824480; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qOyZw4bDsbr4qmAwh80v8EC9v0GlEpJUlytQ5kcN9NY=; 
	b=Wy3CI+/FjgcivUTTfZLrmhtrF5bn92hUWwJiA/5OoPwugqTOUbAdWDVwG3I63YcWQek0LiNf/n325jdMFA99GNzuhi1ZBpiFMtjlzjCtqzBeZ/Ct1qmxOnFEsBya1nlq/BvQXYPUPS/21aafpQcWgJGIaZdG2PxWa5uBK3yEIDo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672824480;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=qOyZw4bDsbr4qmAwh80v8EC9v0GlEpJUlytQ5kcN9NY=;
	b=g14rhF5tT9CDSwd63E/2rt2pKxWw6CA/D1cF3bBJjl/9KomlccYJMnpI4FG8I2it
	fiXLrauBXt9pj4dmZ14Uzz3YKZ30vz2VhuCht41d3m8Q38PZ9hcQmvq0HQDN/FlK44r
	Ok1FOxgXv65iUnTA40WI/nnrNwQBkz491WKPt+Lw=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672824477989662.3660256766193; Wed, 4 Jan 2023 01:27:57 -0800 (PST)
Message-ID: <bcce507a31662004262fa3bbe911f1b1ff7f27af.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA
 synchorization
From: Icenowy Zheng <uwu@icenowy.me>
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner
	 <heiko@sntech.de>, Samuel Holland <samuel@sholland.org>, Conor Dooley
	 <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Jan 2023 17:27:53 +0800
In-Reply-To: <CAJF2gTTO3jx8FqMVRmfgkjO02sCVx2SVbe-Sn1uKXojyn8RDaA@mail.gmail.com>
References: <20230104074146.578485-1-uwu@icenowy.me>
	 <20230104074146.578485-3-uwu@icenowy.me>
	 <CAJF2gTSb4qEPHw8hy1ro+UMoyKQaoQESNGveSGLdPL=cXac8jQ@mail.gmail.com>
	 <a2a8c7522b9b57f074d6962511b6d779cfd4b56b.camel@icenowy.me>
	 <CAJF2gTTO3jx8FqMVRmfgkjO02sCVx2SVbe-Sn1uKXojyn8RDaA@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_012808_188151_281D9155 
X-CRM114-Status: GOOD (  19.64  )
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

5ZyoIDIwMjMtMDEtMDTmmJ/mnJ/kuInnmoQgMTc6MjQgKzA4MDDvvIxHdW8gUmVu5YaZ6YGT77ya
Cj4gT24gV2VkLCBKYW4gNCwgMjAyMyBhdCA0OjU5IFBNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4g5ZyoIDIwMjMtMDEtMDTmmJ/mnJ/kuInnmoQgMTY6NTAg
KzA4MDDvvIxHdW8gUmVu5YaZ6YGT77yaCj4gPiA+IE9uIFdlZCwgSmFuIDQsIDIwMjMgYXQgMzo0
MyBQTSBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gd3JvdGU6Cj4gPiA+ID4g
Cj4gPiA+ID4gRE1BIHN5bmNob3JpemF0aW9uIGlzIGRvbmUgb24gUEEgYW5kIHRoZSBWQSBpcyBj
YWxjdWxhdGVkIGZyb20KPiA+ID4gPiB0aGUKPiA+ID4gPiBQQS4KPiA+ID4gPiAKPiA+ID4gPiBV
c2UgdGhlIGFsdGVybmF0aXZlIG1hY3JvIHZhcmlhbnQgdGhhdCB0YWtlcyBib3RoIFZBIGFuZCBQ
QSBhcwo+ID4gPiA+IHBhcmFtZXRlcnMsIHRodXMgaW4gY2FzZSB0aGUgSVNBIGV4dGVuc2lvbiB1
c2VkIHN1cHBvcnQgUEEKPiA+ID4gPiBkaXJlY3RseSwgdGhlCj4gPiA+ID4gb3ZlcmhlYWQgZm9y
IHJlLWNvbnZlcnRpbmcgVkEgdG8gUEEgY2FuIGJlIG9taXR0ZWQuCj4gPiA+ID4gCj4gPiA+ID4g
U3VnZ2VzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiAtLS0KPiA+ID4g
PiDCoGFyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMgfCA4ICsrKystLS0tCj4gPiA+ID4g
wqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiA+
IAo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2RtYS1ub25jb2hlcmVudC5jCj4g
PiA+ID4gYi9hcmNoL3Jpc2N2L21tL2RtYS0KPiA+ID4gPiBub25jb2hlcmVudC5jCj4gPiA+ID4g
aW5kZXggZDkxOWVmYWI2ZWJhLi5hNzUxZjRhZWNlNjIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJj
aC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQuYwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0v
ZG1hLW5vbmNvaGVyZW50LmMKPiA+ID4gPiBAQCAtMTksMTMgKzE5LDEzIEBAIHZvaWQgYXJjaF9z
eW5jX2RtYV9mb3JfZGV2aWNlKHBoeXNfYWRkcl90Cj4gPiA+ID4gcGFkZHIsIHNpemVfdCBzaXpl
LAo+ID4gPiA+IAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIHN3aXRjaCAoZGlyKSB7Cj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqAgY2FzZSBETUFfVE9fREVWSUNFOgo+ID4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIEFMVF9DTU9fT1AoY2xlYW4sIHZhZGRyLCBzaXplLAo+ID4gPiA+IHJp
c2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgQUxUX0NNT19PUF9WUEEoY2xlYW4sIHZhZGRyLCBwYWRkciwgc2l6ZSwKPiA+ID4gPiByaXNj
dl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gPiBBTFRfQ01PX09QIC0+IEFMVF9DTU9fT1BfVlBBLCBp
cyB0aGUgcmVuYW1pbmcgbmVjZXNzYXJ5Pwo+ID4gCj4gPiBJIGRpZG4ndCByZW5hbWUgdGhlIG9y
aWdpbmFsIEFMVF9DTU9fT1AsIEFMVF9DTU9fT1BfVlBBIGlzCj4gPiBzb21ldGhpbmcKPiA+IG5l
dy4KPiBUaGUgIyNfVlBBIGlzIHJlYWxseSBzdHJhbmdlLgo+IAo+IEhvdyBhYm91dDoKPiBBTFRf
Q01PX09QwqDCoMKgwqDCoMKgwqDCoMKgIC0+IEFMVF9DTU9fT1BfVkEKPiBBTFRfQ01PX09QX1ZQ
QSAtPiBBTFRfQ01PX09QCgpJdCdzIHRodXMgYSBtdWNoIGJpZ2dlciBjaGFuZ2UuCgpJZiB5b3Ug
YXJlIG5vdCBmb25kIG9mIF9WUEEsIEkgY2FuIHJlbmFtZSBpdCB0byBfVkFfUEEuCgo+IAo+ID4g
Cj4gPiA+IAo+ID4gPiBPdGhlcnM6Cj4gPiA+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiA+ID4gCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIGNhc2UgRE1BX0ZST01fREVWSUNFOgo+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFMVF9DTU9fT1AoY2xlYW4sIHZhZGRy
LCBzaXplLAo+ID4gPiA+IHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUF9WUEEoY2xlYW4sIHZhZGRyLCBwYWRkciwg
c2l6ZSwKPiA+ID4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBjYXNlIERN
QV9CSURJUkVDVElPTkFMOgo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFM
VF9DTU9fT1AoZmx1c2gsIHZhZGRyLCBzaXplLAo+ID4gPiA+IHJpc2N2X2Nib21fYmxvY2tfc2l6
ZSk7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUF9WUEEo
Zmx1c2gsIHZhZGRyLCBwYWRkciwgc2l6ZSwKPiA+ID4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUp
Owo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoCBkZWZhdWx0Ogo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsKPiA+ID4gPiBAQCAtNDIsNyArNDIsNyBAQCB2b2lkIGFyY2hfc3luY19kbWFf
Zm9yX2NwdShwaHlzX2FkZHJfdCBwYWRkciwKPiA+ID4gPiBzaXplX3Qgc2l6ZSwKPiA+ID4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqAgY2FzZSBETUFfRlJPTV9ERVZJQ0U6Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgY2FzZSBETUFf
QklESVJFQ1RJT05BTDoKPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBTFRf
Q01PX09QKGZsdXNoLCB2YWRkciwgc2l6ZSwKPiA+ID4gPiByaXNjdl9jYm9tX2Jsb2NrX3NpemUp
Owo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFMVF9DTU9fT1BfVlBBKGZs
dXNoLCB2YWRkciwgcGFkZHIsIHNpemUsCj4gPiA+ID4gcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsK
PiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqAgZGVmYXVsdDoKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjM4LjEKPiA+ID4gPiAKPiA+ID4gCj4gPiA+
IAo+ID4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
