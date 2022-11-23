Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8646C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mH07sA+UPUrh4Uo9bX7UzI8ofo++rLeuigc5I2Iy2pw=; b=jHCGZP5xsO/XF+
	UP7+2HSKzPnARxmEbIXvbdJYv9aaIwXEP4YDSvzY2NHxS96ru27E6yFuGGCV7oKNcjsBXEZaEwGab
	Dg6kkfgTs5eyQLhwX43pHsduLGCTx6B8kaMd1glFDhDLCluJQlG8KcGxYl+qQVrowKritJpxz+BDX
	CAvfiegJf60pI0xiKqIXi27/KgEQFzHFf6nmyV/pLMka+hwmV+d6YxR6JDDUixyIzG+4UUKFx2vNK
	mtbsUhJ4GXyvvEYIJFflDyaaqIABUFN58CNLDn+jT6XLcmPonFfXmCWyET04GWcuB0+3PBXRPpDAj
	VA7qDnEsiVaSr8zGHU9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpbt-00HAj0-Bj; Wed, 23 Nov 2022 13:16:17 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpbr-00HAhs-5j
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 13:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669209367; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VgJ7rsfjU0vkSBmmZa0LW45iT+Tnqilgx1INQNmYo8429dTFqritHdkdWjiU33jiWT25bhzHu02W6LnUT0jPLoDof0bnPRpqAeyz28ynCWrlmDBW55vrdyMAUR4hMqXn6NWVGIny3IPd2egwEYpbRrsB1n6YIpvv6jluLEOsXqE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669209367; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UDJV2XySpjIKGCIbE8woRdDrQFpOJvF+DUQItZkefkk=; 
	b=L6coffg38kauvPZAlzGSccLygADXGt3O7vIsN728twyZKNIPw8JOMZSC+mAliEpCPJJDIj0RCi5QY7PMNiuwXhvhnLx4AxvS4J1aqbZiFf1Q3e21eDxeNl/srMTSDm3wfx2+wgV1/uP7vhR0lTEpP1hJI0D1IrM9Jedx+UXmPJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669209367;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=UDJV2XySpjIKGCIbE8woRdDrQFpOJvF+DUQItZkefkk=;
	b=CQaMyzP7Nt5gKdXrbT9jvzUK5Yrt+pTmEYUbegAPsMLjsU9n4Wwp+2s31TC8sw6r
	SIPFBNmhi9adIqaRInQdEMm41HeJkmlWxM3o2P92zJC8GHt/QAEqAbZoc1BgjAJKN5n
	2O7AiB5EhdRTPIb7LjDB5tJrCERgJCFWJbRiy/9E=
Received: from edelgard.fodlan.icenowy.me (112.94.103.239 [112.94.103.239]) by mx.zohomail.com
	with SMTPS id 1669209364789380.3220861886971; Wed, 23 Nov 2022 05:16:04 -0800 (PST)
Message-ID: <402eb920c5ca84e7d751ec7bd9b7f4f512a66921.camel@icenowy.me>
Subject: Re: [PATCH] irqchip/sifive-plic: drop quirk for two-cell variant
From: Icenowy Zheng <uwu@icenowy.me>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt
 <palmer@dabbelt.com>,  Paul Walmsley <paul.walmsley@sifive.com>, Samuel
 Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Wed, 23 Nov 2022 21:16:01 +0800
In-Reply-To: <86ilj5oltb.wl-maz@kernel.org>
References: <20221121042026.419383-1-uwu@icenowy.me>
	 <86o7syoq4t.wl-maz@kernel.org>
	 <16d01eebc1693916fc74e1e75458d6c0f080cf37.camel@icenowy.me>
	 <86ilj5oltb.wl-maz@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_051615_281280_3BFD92D2 
X-CRM114-Status: GOOD (  33.21  )
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

5ZyoIDIwMjItMTEtMjPmmJ/mnJ/kuInnmoQgMTM6MTMgKzAwMDDvvIxNYXJjIFp5bmdpZXLlhpnp
gZPvvJoKPiBPbiBXZWQsIDIzIE5vdiAyMDIyIDEyOjM4OjU2ICswMDAwLAo+IEljZW5vd3kgWmhl
bmcgPHV3dUBpY2Vub3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4g5ZyoIDIwMjItMTEtMjLmmJ/mnJ/k
uoznmoQgMTc6MjggKzAwMDDvvIxNYXJjIFp5bmdpZXLlhpnpgZPvvJoKPiA+ID4gT24gTW9uLCAy
MSBOb3YgMjAyMiAwNDoyMDoyNiArMDAwMCwKPiA+ID4gSWNlbm93eSBaaGVuZyA8dXd1QGljZW5v
d3kubWU+IHdyb3RlOgo+ID4gPiA+IAo+ID4gPiA+IEFzIHRoZSBzcGVjaWFsIGhhbmRsaW5nIG9m
IGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdHMgYXJlCj4gPiA+ID4gZGVmaW5lZCBpbgo+ID4gPiA+
IHRoZQo+ID4gPiA+IFBMSUMgc3BlYywgd2UgY2FuIGFzc3VtZSBpdCdzIG5vdCBhIHF1aXJrLCBi
dXQgYSBmZWF0dXJlIG9mIHRoZQo+ID4gPiA+IFBMSUMKPiA+ID4gPiBzcGVjOyB0aHVzIG1ha2lu
ZyBpdCBhIHF1aXJrIGFuZCB1c2UgcXVpcmstYmFzZWQgY29kZXBhdGggaXMKPiA+ID4gPiBub3Qg
c28KPiA+ID4gPiBuZWNlc3NhcnkuCj4gPiA+IAo+ID4gPiBJdCAqaXMqIG5lY2Vzc2FyeS4KPiA+
ID4gCj4gPiA+ID4gCj4gPiA+ID4gTW92ZSB0byBhICNpbnRlcnJ1cHQtY2VsbHMtYmFzZWQgcHJh
Y3RpY2Ugd2hpY2ggd2lsbCBhbGxvdyBib3RoCj4gPiA+ID4gZGV2aWNlCj4gPiA+ID4gdHJlZXMg
d2l0aG91dCBpbnRlcnJ1cHQgZmxhZ3MgYW5kIHdpdGggaW50ZXJydXB0IGZsYWdzIHdvcmsgZm9y
Cj4gPiA+ID4gYWxsCj4gPiA+ID4gY29tcGF0aWJsZSBzdHJpbmdzLgo+ID4gPiAKPiA+ID4gTm8u
IFlvdSdyZSB0eWluZyB0b2dldGhlciB0d28gdW5yZWxhdGVkIGNvbmNlcHRzOgo+ID4gPiAKPiA+
ID4gLSBFZGdlcyBnZXQgZHJvcHBlZCBpbiBzb21lIGltcGxlbWVudGF0aW9ucyAoYW5kIG9ubHkg
c29tZSkuIFlvdQo+ID4gPiBjYW4KPiA+ID4gwqAgYXJndWUgdGhhdCB0aGUgYXJjaGl0ZWN0dXJl
IGFsbG93cyBpdCwgYnV0IEkgc2VlIGl0IGlzIGFuCj4gPiA+IMKgIGltcGxlbWVudGF0aW9uIGJ1
Zy4KPiA+IAo+ID4gQXMgdGhlIHNwZWNpZmljYXRpb24gYWxsb3dzIGl0LCBpdCdzIG5vdCBhbiBp
bXBsZW1lbnRhdGlvbiBidWcgLS0KPiA+IGFuZAo+ID4gZm9yIHRob3NlIHdoaWNoIGRvIG5vdCBz
aG93IHRoaXMgcHJvYmxlbSwgaXQncyBwb3NzaWJsZSB0aGF0IGl0J3MKPiA+IGp1c3QKPiA+IGFs
bCB1c2luZyB0aGUgc2FtZSB0cmlnZ2VyIHR5cGUgKGUuZy4gUm9ja2V0KS4KPiAKPiBXaGF0IGFy
ZSB5b3UgYWdhaW5zdD8gVGhlIGZhY3QgdGhhdCB0aGlzIGlzIGZsYWdnZWQgYXMgYSBxdWlyaz8K
PiBIb25lc3RseSwgSSBkb24ndCBjYXJlIGFib3V0IHRoYXQuIElmIHdlIGNhbiBmb2xkIGFsbCBp
bXBsZW1lbnRhdGlvbnMKPiBpbnRvIHRoZSBzYW1lIHNjaGVtZSwgdGhhdCdzIGZpbmUgYnkgbWUu
CgpUaGVuIHdoYXQgc2hvdWxkIEkgZG8/Cgo+IAo+ID4gCj4gPiA+IAo+ID4gPiAtIFRoZSBuZWVk
IGZvciBleHByZXNzaW5nIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gaW4gdGhlIGludGVycnVwdAo+
ID4gPiDCoCBzcGVjaWZpZXIgaXMgbm90IG5lY2Vzc2FyaWx5IHJlbGF0ZWQgdG8gdGhlIGFib3Zl
LiBPdGhlcgo+ID4gPiBpbnRlcnJ1cHQKPiA+ID4gwqAgY29udHJvbGxlcnMgdXNlIGV4dHJhIGNl
bGxzIHRvIGVuY29kZSB0aGUgaW50ZXJydXB0IGFmZmluaXR5LAo+ID4gPiBmb3IKPiA+ID4gwqAg
ZXhhbXBsZS4KPiA+IAo+ID4gSSB0aGluayBpbiB0aGVzZSBzaXR1YXRpb25zLCBpZiB0aGUgaW50
ZXJydXB0IGNvbnRyb2xsZXIgZG9lcyBub3QKPiA+IGNvbnRhaW4gYW55IHNwZWNpYWwgaGFuZGxp
bmcgZm9yIGVkZ2UgaW50ZXJydXB0cywgd2UgY2FuIGp1c3QKPiA+IGRlc2NyaWJlCj4gPiB0aGVt
IGFzIGxldmVsIG9uZXMgaW4gU1cuCj4gCj4gTm8sIHRoYXQncyB1dHRlcmx5IHdyb25nLiBXZSBk
b24ndCBkZXNjcmliZSBhbiBlZGdlIGFzIGxldmVsLiBFdmVyLgo+IAo+ID4gCj4gPiA+IAo+ID4g
PiBJIHdhbnQgdGhlc2UgdHdvIHRoaW5ncyB0byBiZSBrZXB0IHNlcGFyYXRlLiBPdGhlcndpc2Us
IG9uY2Ugd2UKPiA+ID4gZ2V0Cj4gPiA+IHNvbWUgZmFuY3kgQUNQSSBzdXBwb3J0IGZvciBSSVND
ViAobm8sIHBsZWFzZS4uLiksIHdlJ2xsIGhhdmUgdG8KPiA+ID4gcmVkbwo+ID4gPiB0aGUgd2hv
bGUgdGhpbmcuLi4KPiA+ID4gCj4gPiA+ID4gSW4gYWRkaXRpb24sIHRoaXMgYWRkcmVzc2VzIGEg
c3RhYmxlIHZlcnNpb24gRFQgYmluZGluZwo+ID4gPiA+IHZpb2xhdGlvbiAtCj4gPiA+ID4gLQo+
ID4gPiA+IExpbnV4IHY1LjE5IGNvbWVzIHdpdGggInRoZWFkLGM5MDAtcGxpYyIgd2l0aCAjaW50
ZXJydXB0LWNlbGxzCj4gPiA+ID4gZGVmaW5lZCB0bwo+ID4gPiA+IGJlIDEgaW5zdGVhZCBvZiAy
LCB0aGlzIGNvbW1pdCB3aWxsIGFsbG93IERUcyB0aGF0IGNvbXBsaWVzIHRvCj4gPiA+ID4gTGlu
dXgKPiA+ID4gPiB2NS4xOSBiaW5kaW5nIHdvcmsgKGFsdGhvdWdoIG5vIHN1Y2ggRFQgaXMgZGV2
bGllcmVkIHRvIHRoZQo+ID4gPiA+IHB1YmxpYwo+ID4gPiA+IG5vdykuCj4gPiA+IAo+ID4gPiAq
VGhhdCogaXMgd2hhdCBzaG91bGQgZ2V0IGZpeGVkLgo+ID4gCj4gPiBTdXBwb3J0aW5nIGFsbCBz
dGFibGUgdmVyc2lvbnMnIERUIGJpbmRpbmcgaXMgb3VyIHByb21pc2UsIEkgdGhpbmsuCj4gCj4g
QWJzb2x1dGVseS4gQW5kIEknbSBhc2tpbmcgeW91IHRvIGZpeCBpdC4gQW5kIG9ubHkgdGhhdC4K
ClRoZW4gd2hhdCBzaG91bGQgSSBkbz8gTWFzayB0aGlzIGFzIGFub3RoZXIgcXVpcmsgdGhhdCBp
cyBvbmx5CmFwcGxpY2FibGUgdG8gYzkwMC1wbGljPwoKU291bmRzIG1vcmUgY3JhenkuLi4KCj4g
Cj4gVGhhbmtzLAo+IAo+IMKgwqDCoMKgwqDCoMKgwqBNLgo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
