Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCB6C761A6
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 01:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSZWIxeGCuWhjzABjUTfOKmXT7zWz6oUpx1p1QO6LYs=; b=qlyi+Gw8B3tbiV
	M30G3AtarA8UYfO5Q4c9mVR4ArbGLqziRJIFRkycfisAyu6SZDA08e68VabFXBIlKQ7oXTSLC1sxn
	Eq9NtFw/S5E/aTFvQDhAGAu+wEcgN9SGQt/Msu+5IXJF2lboNGqYAFFjiEI2AP9G055DtppHuUe0N
	vWI9F/ny4feFgFM73UUu5upM8UrVvC6JvnPM8biIKWNzod/ipF3rZ4M8wOa4mqLsSKl1czm+6xWQ7
	OPhNdgbED7vO5ag1nK4FwD9Xbl+4GXdcxsqYhRXySOR6qFeaqBpSt1ut3DyoVMs//uXwHp8/GUqRM
	HQCUvJ/EUDG0Sy+RE/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piQLD-009WNR-1w;
	Sat, 01 Apr 2023 01:47:39 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piQLB-009WLw-08
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 01:47:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680313641; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e872dxYKwpEmkU7ojBV5oxWY5yPEVsfRppSkHWLXyxK2QRHALoTZ9ES6HSu0fkI63hh9IOHCYdBwTS+ZbV3+Zls/3GA3nO3hcXl2iwSghOjUxIyJB7J0KVAyoSIes/wZwCZms0/cpoarR9COjb43mAeXnzLWeCHMbajgc4zEIsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1680313641; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=S+zGGBqMP5BV/39K5ihbzESIqXi6/hEN1mEtg1ES/40=; 
	b=btAeaJbnSX/otV9mzt0oRQCU3prXUl72yptb7/sh1Rrl+y5PyRWVjtijnSRkb0rbpdnfco6kN+279LU0EcEzyRo5BGMA2nO840LEOWEg21t6GbsNdQjSf/bjTBAOYBdTfyUNPAVSNfb3ULDG3e3CuyskO3jjDA0PU6jWsoJES5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680313641;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=S+zGGBqMP5BV/39K5ihbzESIqXi6/hEN1mEtg1ES/40=;
	b=UEXpHn7Z+mCjHatAbJ0EA4GpqEOoPHeQOAUlyvlwbEosnOLM6kNtXZ5N2bV2ZanW
	isQtmIrTPnWFFUtF/Y9pg4r5PEyaECLlf5/XHGVjA+QObak+fM3wcVGtNDAVk2cgnOb
	B8pu/N9Ybs16FU1NHih8uOiB3KMgSfSEtNDRa2so=
Received: from edelgard.fodlan.icenowy.me (120.85.97.183 [120.85.97.183]) by mx.zohomail.com
	with SMTPS id 1680313639213673.7042963583667; Fri, 31 Mar 2023 18:47:19 -0700 (PDT)
Message-ID: <40cdea465fef49a8a337b48e2a748138c66a08eb.camel@icenowy.me>
Subject: Re: [PATCH v7 0/6] RISC-V non-coherent function pointer based CMO +
 non-coherent DMA support for AX45MP
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, "Lad, Prabhakar"
	 <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley
 <conor.dooley@microchip.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Guo Ren
 <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Sat, 01 Apr 2023 09:47:05 +0800
In-Reply-To: <0d5590e4-e78b-4197-bf17-9de54466470d@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <b2dcda17-5850-47c1-94bc-4ca87f900581@spud>
	 <CA+V-a8s+=OY6CX4XTUwyAE9b=rdJZZfgAaY2nU+6aqnu=X9nxQ@mail.gmail.com>
	 <0d5590e4-e78b-4197-bf17-9de54466470d@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_184737_132310_1413B621 
X-CRM114-Status: GOOD (  17.57  )
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

5ZyoIDIwMjMtMDMtMzHmmJ/mnJ/kupTnmoQgMjE6MTUgKzAxMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBGcmksIE1hciAzMSwgMjAyMyBhdCAwODowOToxNlBNICswMDAwLCBMYWQsIFBy
YWJoYWthciB3cm90ZToKPiA+IEhpIENvbm9yLAo+ID4gCj4gPiBPbiBGcmksIE1hciAzMSwgMjAy
MyBhdCA3OjA14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPgo+ID4gd3JvdGU6
Cj4gPiA+IAo+ID4gPiBPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCAwOTo0MjoxMVBNICswMTAwLCBQ
cmFiaGFrYXIgd3JvdGU6Cj4gPiA+IAo+ID4gPiA+IC0gVGhpcyBzZXJpZXMgcmVxdWlyZXMgdGVz
dGluZyBvbiBDb3JlcyB3aXRoIHppY2JvbSBhbmQgVC1IZWFkCj4gPiA+ID4gU29Dcwo+ID4gPiAK
PiA+ID4gSSBkb24ndCBhY3R1YWxseSBrbm93IGlmIHRoZXJlIGFyZSBaaWNib20gcGFydHMsIG1h
eSBuZWVkIHRvIHRlc3QKPiA+ID4gdGhhdAo+ID4gPiBvbiBRRU1VLgo+ID4gPiBJIGhhZCB0byBy
ZXZlcnQgdW5yZWxhdGVkIGNvbnRlbnQgdG8gYm9vdCwgYnV0IG15IEQxIE5GUyBzZXR1cAo+ID4g
PiBzZWVtcyB0bwo+ID4gPiB3b3JrIGZpbmUgd2l0aCB0aGVzZSBjaGFuZ2VzLCBzbyB3aGVyZSBp
dCBpcyByZWxldmFudDoKPiA+ID4gVGVzdGVkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPiAjIHR5cmUtCj4gPiA+IGtpY2tpbmcgb24gRDEKPiA+ID4gCj4gPiBU
aGFuayB5b3UgZm9yIHRlc3RpbmcgdGhpcy4gQnkgYW55IGNoYW5jZSBkaWQgeW91IGNvbXBhcmUg
dGhlCj4gPiBwZXJmb3JtYW5jZT8KPiAKPiBObywganVzdCB0eXJlIGtpY2tpbmcuIEljZW5vd3kg
aGFkIHNvbWUgYmVuY2htYXJrIGZvciBpdCBJSVJDLCBJCj4gdGhpbmsKPiBtaW5pbmcgc29tZSBj
b2luIG9yIHcvZS4gK0NDIHRoZW0uCgpJIHByZXZpb3VzbHkgdGVzdGVkIHRoZSBmdW5jdGlvbiBw
b2ludGVyIGJhc2VkIENNTywgaXQgZG8gbm90IGFmZmVjdAp0aGUgcGVyZm9ybWFuY2UgYmV5b25k
IHRoZSBtZWFzdXJlbWVudCBlcnJvci4gTWF5YmUgaXQncyBiZWNhdXNlIENNTwpvcGVyYXRpb25z
IGFyZSBvbmx5IGRvbmUgYXQgdGhlIHN0YXJ0IGFuZCBlbmQgb2YgRE1BIG9wZXJhdGlvbnMuCgpN
eSBwcmV2aW91cyB0ZXN0IHN5c3RlbSBpcyBMaXRlWCArIE9wZW5DOTA2LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
