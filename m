Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BAFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AraoN2j22XG++g+/B1eHCb9Nu8wkf4w3TAmiUrp7A0=; b=vxmnrQTrlxGCje
	BkzNpiUY+ASYST1ccTvoZtOmBa4KSb7ilz3lI0LZMbnCRYoNTgYONzYWAceNcn/Pe8/GPsczMKdVZ
	gMQjbsd+Td+Hhs7reQI1U+VNTUoQbCJ6HzvaAX0m1c2IHp9aAjykUXVh4FuRmsPHpeCyJkeg/t9t2
	eNHoKw0oS8pj44h3RxxsetwZO/IdTxQToOFySq4FJ73DYTLQKH6YDJ10wad0zPYYW+BWYiLhV9jdC
	p0qScn2Vq3igVt1I1ysPVetKJSvSS1m26PbR9G+S/TV9vxOHmx0ocGCnSTUOL08kJL/tNCtco9sf8
	pTyP/QwQYUmGztuexp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxp2E-00GyFS-Hy; Wed, 23 Nov 2022 12:39:26 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxp2B-00GyD2-CL
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 12:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669207143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ikEiYeHuptVDuqrf0mTh4ZCwfw+gCxpPKR+0ZP72uK5BCWIbdxOpJ7nJscVwM2M5XHjsG9EUSxja5MyK9RGnWq5BXKlz2H5DlVPphOuecUHSfHIQAOYa/dac5uwPob0gKjFj+faKcyBeuxXjNoNQHEbQ4Or4GAP6VwRNFtv6dvc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669207143; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=s9PPGCpeJg603JwEoPuSbAcaz9zus2eoJM9ERQFOsvw=; 
	b=e2vxqdbJyy6tbN0/17QWTmp/lnS4USAj1OlF7MUN6tCBcv1/e2mBNjwPwqujZ2ASafClJT3dyvWZC9XlaA2hXBFmaPekNc4NUYNCiClXwK8PJf8ZKD4ft03MSMYSNDXVCXiWdjnJr8CPvDLy5hvwEZg1N3oMZqm7TDL55Sxucjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669207143;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=s9PPGCpeJg603JwEoPuSbAcaz9zus2eoJM9ERQFOsvw=;
	b=ZKHhqsxgPF95Y3GJOiZLgVhq+j7w8SfzEzRp30NyXrtjHxe027arWHJDFzQKoUnO
	hpLGJFDf9+5Stiwl3FPOQQ/NjA4ZPUmH2AOlPP5v6KQxcu3nkPWyo56JBbOjiNRKNRy
	HF3QyU+lfXKWbW9PFddxLXx9Erifg94dCkMb7Bdc=
Received: from edelgard.fodlan.icenowy.me (112.94.103.239 [112.94.103.239]) by mx.zohomail.com
	with SMTPS id 1669207140839317.13150239847846; Wed, 23 Nov 2022 04:39:00 -0800 (PST)
Message-ID: <16d01eebc1693916fc74e1e75458d6c0f080cf37.camel@icenowy.me>
Subject: Re: [PATCH] irqchip/sifive-plic: drop quirk for two-cell variant
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>,  Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 23 Nov 2022 20:38:56 +0800
In-Reply-To: <86o7syoq4t.wl-maz@kernel.org>
References: <20221121042026.419383-1-uwu@icenowy.me>
	 <86o7syoq4t.wl-maz@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_043923_503925_766C3506 
X-CRM114-Status: GOOD (  22.39  )
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

5ZyoIDIwMjItMTEtMjLmmJ/mnJ/kuoznmoQgMTc6MjggKzAwMDDvvIxNYXJjIFp5bmdpZXLlhpnp
gZPvvJoKPiBPbiBNb24sIDIxIE5vdiAyMDIyIDA0OjIwOjI2ICswMDAwLAo+IEljZW5vd3kgWmhl
bmcgPHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4gQXMgdGhlIHNwZWNpYWwgaGFuZGxp
bmcgb2YgZWRnZS10cmlnZ2VyZWQgaW50ZXJydXB0cyBhcmUgZGVmaW5lZCBpbgo+ID4gdGhlCj4g
PiBQTElDIHNwZWMsIHdlIGNhbiBhc3N1bWUgaXQncyBub3QgYSBxdWlyaywgYnV0IGEgZmVhdHVy
ZSBvZiB0aGUKPiA+IFBMSUMKPiA+IHNwZWM7IHRodXMgbWFraW5nIGl0IGEgcXVpcmsgYW5kIHVz
ZSBxdWlyay1iYXNlZCBjb2RlcGF0aCBpcyBub3Qgc28KPiA+IG5lY2Vzc2FyeS4KPiAKPiBJdCAq
aXMqIG5lY2Vzc2FyeS4KPiAKPiA+IAo+ID4gTW92ZSB0byBhICNpbnRlcnJ1cHQtY2VsbHMtYmFz
ZWQgcHJhY3RpY2Ugd2hpY2ggd2lsbCBhbGxvdyBib3RoCj4gPiBkZXZpY2UKPiA+IHRyZWVzIHdp
dGhvdXQgaW50ZXJydXB0IGZsYWdzIGFuZCB3aXRoIGludGVycnVwdCBmbGFncyB3b3JrIGZvciBh
bGwKPiA+IGNvbXBhdGlibGUgc3RyaW5ncy4KPiAKPiBOby4gWW91J3JlIHR5aW5nIHRvZ2V0aGVy
IHR3byB1bnJlbGF0ZWQgY29uY2VwdHM6Cj4gCj4gLSBFZGdlcyBnZXQgZHJvcHBlZCBpbiBzb21l
IGltcGxlbWVudGF0aW9ucyAoYW5kIG9ubHkgc29tZSkuIFlvdSBjYW4KPiDCoCBhcmd1ZSB0aGF0
IHRoZSBhcmNoaXRlY3R1cmUgYWxsb3dzIGl0LCBidXQgSSBzZWUgaXQgaXMgYW4KPiDCoCBpbXBs
ZW1lbnRhdGlvbiBidWcuCgpBcyB0aGUgc3BlY2lmaWNhdGlvbiBhbGxvd3MgaXQsIGl0J3Mgbm90
IGFuIGltcGxlbWVudGF0aW9uIGJ1ZyAtLSBhbmQKZm9yIHRob3NlIHdoaWNoIGRvIG5vdCBzaG93
IHRoaXMgcHJvYmxlbSwgaXQncyBwb3NzaWJsZSB0aGF0IGl0J3MganVzdAphbGwgdXNpbmcgdGhl
IHNhbWUgdHJpZ2dlciB0eXBlIChlLmcuIFJvY2tldCkuCgo+IAo+IC0gVGhlIG5lZWQgZm9yIGV4
cHJlc3NpbmcgYWRkaXRpb25hbCBpbmZvcm1hdGlvbiBpbiB0aGUgaW50ZXJydXB0Cj4gwqAgc3Bl
Y2lmaWVyIGlzIG5vdCBuZWNlc3NhcmlseSByZWxhdGVkIHRvIHRoZSBhYm92ZS4gT3RoZXIgaW50
ZXJydXB0Cj4gwqAgY29udHJvbGxlcnMgdXNlIGV4dHJhIGNlbGxzIHRvIGVuY29kZSB0aGUgaW50
ZXJydXB0IGFmZmluaXR5LCBmb3IKPiDCoCBleGFtcGxlLgoKSSB0aGluayBpbiB0aGVzZSBzaXR1
YXRpb25zLCBpZiB0aGUgaW50ZXJydXB0IGNvbnRyb2xsZXIgZG9lcyBub3QKY29udGFpbiBhbnkg
c3BlY2lhbCBoYW5kbGluZyBmb3IgZWRnZSBpbnRlcnJ1cHRzLCB3ZSBjYW4ganVzdCBkZXNjcmli
ZQp0aGVtIGFzIGxldmVsIG9uZXMgaW4gU1cuCgo+IAo+IEkgd2FudCB0aGVzZSB0d28gdGhpbmdz
IHRvIGJlIGtlcHQgc2VwYXJhdGUuIE90aGVyd2lzZSwgb25jZSB3ZSBnZXQKPiBzb21lIGZhbmN5
IEFDUEkgc3VwcG9ydCBmb3IgUklTQ1YgKG5vLCBwbGVhc2UuLi4pLCB3ZSdsbCBoYXZlIHRvIHJl
ZG8KPiB0aGUgd2hvbGUgdGhpbmcuLi4KPiAKPiA+IEluIGFkZGl0aW9uLCB0aGlzIGFkZHJlc3Nl
cyBhIHN0YWJsZSB2ZXJzaW9uIERUIGJpbmRpbmcgdmlvbGF0aW9uIC0KPiA+IC0KPiA+IExpbnV4
IHY1LjE5IGNvbWVzIHdpdGggInRoZWFkLGM5MDAtcGxpYyIgd2l0aCAjaW50ZXJydXB0LWNlbGxz
Cj4gPiBkZWZpbmVkIHRvCj4gPiBiZSAxIGluc3RlYWQgb2YgMiwgdGhpcyBjb21taXQgd2lsbCBh
bGxvdyBEVHMgdGhhdCBjb21wbGllcyB0bwo+ID4gTGludXgKPiA+IHY1LjE5IGJpbmRpbmcgd29y
ayAoYWx0aG91Z2ggbm8gc3VjaCBEVCBpcyBkZXZsaWVyZWQgdG8gdGhlIHB1YmxpYwo+ID4gbm93
KS4KPiAKPiAqVGhhdCogaXMgd2hhdCBzaG91bGQgZ2V0IGZpeGVkLgoKU3VwcG9ydGluZyBhbGwg
c3RhYmxlIHZlcnNpb25zJyBEVCBiaW5kaW5nIGlzIG91ciBwcm9taXNlLCBJIHRoaW5rLgoKPiAK
PiBUaGFua3MsCj4gCj4gwqDCoMKgwqDCoMKgwqDCoE0uCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
