Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87F9C6FA86
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3QxY43mUpUWjwmFhPHEWeNfDilcBfeVsxIOXGYnMFaw=; b=yOS4y21zkM0PE/
	ACJW7m8/YvUUKTPAxYPMfotozvL+sCjxH1a9n5eQaRrWu2nLDaOQcjzZWQvHO5rbner9JY07QkNmS
	5OebnYdQyAv3rhcrSVv1j0Q+dhGZdTfphCocxYOJDn5quZJkR9IxipgdsUJBi6tFd1XPnKJ8ZPtOJ
	nhr4SLvGzWsNkAC5fapTbvM2a/HyyXN0aBeQuF1FAC6GKEA2w0uR/jfDzJZlni7XxfnBvH0iuBmFY
	MVHsvhCvSvQzNpJxEJHY0kdo3ZqiBtjmP3d+p3gOskgAmoBPIO+KzbncjY+Nk/C5WtvZBdi07YUvC
	M5wmylVDVCGwv8VIMP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzR7-0032MS-5z; Tue, 13 Sep 2022 06:30:21 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXzMi-002yCj-AU
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 06:25:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663050340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SBbsnTF0mmIk8XctndvQxJ7VHgdEbI/tPfEWU27bVoLBmXEQ1mcZSPkYJkflOKnOs31vXhEUr6i5qZ47HDr8uP6ygj26RFj9jZo7RK04Mse0w28rjApGEcGLQQfGu7hlpeMmsuUg6Euo69QCAWTJSnSckgyErhRfVVFvqfwAhz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663050340; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Kt9GG+vFMkvYqRZ8Ba6A24wrF5ruQ3PEeYC0nAL8AF0=; 
	b=fF8yhTQxmD8hswdcA9s4osNiN9x95LSBjBvmQRN3cKktd4Fzi/BvJr7Fw2zD/e/h6ITkJ8loTS3gq5Y12HuwrjYhdYiwTwJIA/pqZ/WBzWsIIT9DuIBwMWZSLuwMK2JkEcijDpPuIRGT+KArpPZz7acfEKYnBKZ4ovaq95tND0g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663050340;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Kt9GG+vFMkvYqRZ8Ba6A24wrF5ruQ3PEeYC0nAL8AF0=;
	b=XIbg26RYbDve31xqcdSLlTLc4fB04ecJeXlXhXk9jUKk++EA8Xc8DKwUGbXnXnww
	Pt37fhHgHsisEl8IDkm8amvQyAUiOjzbiT0xYvo9vfSuXyjWEWbMhG4QdWXTXi71ODx
	2ficgIY0Th29N3LbPZUC/RT/vkWFawX5FMpmS9l0=
Received: from edelgard.icenowy.me (112.94.103.212 [112.94.103.212]) by mx.zohomail.com
	with SMTPS id 1663050338560674.3690213218844; Mon, 12 Sep 2022 23:25:38 -0700 (PDT)
Message-ID: <ebc846c11b22d14805682ded6436a6a0ef9c512a.camel@icenowy.me>
Subject: Re: [PATCH] PCI: fu740: do not use clock name when requesting clock
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor.Dooley@microchip.com, paul.walmsley@sifive.com, 
 greentime.hu@sifive.com, lpieralisi@kernel.org, robh@kernel.org,
 kw@linux.com,  bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Tue, 13 Sep 2022 14:25:33 +0800
In-Reply-To: <752ea700-bdef-25ca-c922-fd79ea34c8af@microchip.com>
References: <20220907054020.745672-1-uwu@icenowy.me>
	 <8d7b8514-efe0-d3e3-8458-f4f003f10154@microchip.com>
	 <b1a3f887fd037fd18c45ac020c6142cedba58ca7.camel@icenowy.me>
	 <752ea700-bdef-25ca-c922-fd79ea34c8af@microchip.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_232548_552391_5800E685 
X-CRM114-Status: GOOD (  33.92  )
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

5ZyoIDIwMjItMDktMTLmmJ/mnJ/kuIDnmoQgMTA6MTMgKzAwMDDvvIxDb25vci5Eb29sZXlAbWlj
cm9jaGlwLmNvbeWGmemBk++8mgo+IE9uIDEyLzA5LzIwMjIgMDI6MzgsIEljZW5vd3kgWmhlbmcg
d3JvdGU6Cj4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdQo+ID4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPiAKPiA+
IOWcqCAyMDIyLTA5LTA45pif5pyf5Zub55qEIDE4OjE0ICswMDAw77yMQ29ub3IuRG9vbGV5QG1p
Y3JvY2hpcC5jb23lhpnpgZPvvJoKPiA+ID4gT24gMDcvMDkvMjAyMiAwNjo0MCwgSWNlbm93eSBa
aGVuZyB3cm90ZToKPiA+ID4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzCj4gPiA+ID4geW91Cj4gPiA+ID4ga25vdyB0aGUgY29u
dGVudCBpcyBzYWZlCj4gPiA+ID4gCj4gPiA+ID4gVGhlIERUIGJpbmRpbmcgb2YgRlU3NDAgUENJ
ZSBkb2VzIG5vdCBlbmZvcmNlIGEgY2xvY2stbmFtZXMKPiA+ID4gPiBwcm9wZXJ0eSwKPiA+ID4g
PiBhbmQgdGhlcmUgZXhpc3Qgc29tZSBkZXZpY2UgdHJlZSB0aGF0IGhhcyBhIGNsb2NrIG5hbWUg
dGhhdAo+ID4gPiA+IGRvZXMgbm90Cj4gPiA+ID4gc3RpY2sgdG8gdGhlIG9uZSB1c2VkIGJ5IExp
bnV4IERUIChlLmcuIHRoZSBvbmUgc2hpcHBlZCB3aXRoCj4gPiA+ID4gY3VycmVudAo+ID4gPiA+
IFUtQm9vdCBtYWlubGluZSkuCj4gPiA+IAo+ID4gPiBJIHJlY2VudGx5IGFkZGVkIHRoZSBtaXNz
aW5nIGVuZm9yY2VtZW50Ogo+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9scGllcmFsaXNpL3BjaS5naXQvY29tbWl0Lz9oPXBjaS9kdCZpZD1iNDA4
ZmFkNjFkMzRjNzY1YzNlMDE4OTUyODYzMzJhZjJkNTA0MDJhCj4gPiAKPiA+IFVuZm9ydHVuYXRl
bHkgYmluZGluZyB3L28gY2xvY2stbmFtZXMgZW5mb3JjZW1lbnQgaGFzIGFscmVhZHkKPiA+IGVu
dGVyZWQgYQo+ID4gc3RhYmxlIHJlbGVhc2UgKDUuMTkpLCBhbmQgdGhlIHJlYWwgY2xvY2sgbmFt
ZSAicGNpZV9hdXgiIGlzIG5ldmVyCj4gPiBlbmZvcmNlZCBiZWZvcmUgKHRoZXJlJ3MgYSBEVCBp
biBVLUJvb3QgdGhhdCB1c2VzICJwY2llYXV4Igo+ID4gaW5zdGVhZCksCj4gPiBzaG91bGQgdGhp
cyBiZSBjb25zaWRlcmVkIGFzIGJyZWFrYWdlIHRvIHN0YWJsZSBEVCBiaW5kaW5nPwo+IAo+IERv
ZXMgYW55dGhpbmcgaW4gVS1Cb290IGFjdHVhbGx5IHVzZSB0aGF0IGNsb2NrIG5hbWU/IFRoZSBj
bG9jayBuYW1lCj4gaXMKPiBjdXJyZW50bHkgYmVpbmcgcmVsaWVkIG9uIGJ5IGJvdGggTGludXgg
YW5kIEJTRCAoYWx0aG91Z2ggQlNEIGRvZXMKPiBoYXZlCj4gYSBmYWxsYmFjayB0byB0aGUgVS1C
b290IHByb3ZpZGVkIG5hbWUuIFRoZXJlJ3Mgb25seSBvbmUgY2xvY2sgc28gaXQKPiBzZWVtcyBm
aW5lIHRvIG1lIHRvIHN0b3AgdXNpbmcgdGhlIG5hbWUsIGJ1dCB0aGUgRFQgaW4gVS1Cb290IHNo
b3VsZAo+IGJlCj4gZml4ZWQgc28gdGhhdCBQQ0kgd29ya3MgSU1PLgoKSW4gZmFjdCwgbm9uZS4K
CkJ1dCB0aGUgaXNzdWUgaXMgdGhhdCB0aGUgY2xvY2sgbmFtZSBzdHJpbmcgaXMgbmV2ZXIgZW5m
b3JjZWQgaW4gRFQKYmluZGluZywgc28gYXQgbGVhc3Qgd2UgbWF5IHN1cHBvcnQgdW5uYW1lZCBj
bG9ja3MgYXMgZmFsbGJhY2sgaWYgd2UKYXJlIHRyeWluZyB0byBhbGxvdyBhIERUIHRoYXQgc3Rp
Y2tzIHRvIHByZXZpb3VzIDUuMTkgZHQtYmluZGluZ3MgdG8Kd29yay4KCj4gCj4gZndpdzoKPiA+
IAo+ID4gQW55d2F5LCBJIGhhZCBzZW50IG91dCBhIHBhdGNoIHRoYXQgc3luY2hvcml6ZXMgYWxs
IEZVNzQwLXJlbGF0ZWQKPiA+IERUCj4gPiBmaWxlcyB0byBVLUJvb3QsIHNlZSBbMV0uCj4gPiAK
PiA+IFsxXQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwODI1MDgxMTE5LjE2
OTQwMDctMi11d3VAaWNlbm93eS5tZS8KPiAKPiDCoEZyb20gdGhhdCBwYXRjaCwgc2hvdWxkIHRo
aXMgYmUgY2hhbmdlZCB0b28/Cj4gCj4gLcKgwqDCoMKgwqDCoMKgW1BSQ0lfQ0xLX1BDSUVBVVhd
IHsKPiArwqDCoMKgwqDCoMKgwqBbRlU3NDBfUFJDSV9DTEtfUENJRV9BVVhdIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gInBjaWVhdXgiLAoKVGhpcyBpcyBhbiBp
bnRlcm5hbCBuYW1lIG9mIHRoZSBkcml2ZXIsIEkgdGhpbmsuCgo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLnBhcmVudF9uYW1lID0gIiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAub3BzID0gJnNpZml2ZV9mdTc0MF9wcmNpX3BjaWVhdXhfY2xrX29wcywKPiAK
PiA+IAo+ID4gPiAKPiA+ID4gU2luY2UgdGhlcmUncyBvbmx5IG9uZSBjbG9jayB0aG91Z2gsIEkn
ZCBpbWFnaW5lIGl0IG1ha2VzIGxpdHRsZQo+ID4gPiB0byBubwo+ID4gPiByZWFsIGRpZmZlcmVu
Y2UgaWYgdGhlIGNoZWNrIGhlcmUgaXMgcmVsYXhlZC4KPiA+ID4gCj4gPiA+IFJldmlld2VkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPiAKPiA+ID4g
PiAKPiA+ID4gPiBEcm9wIHRoZSBuYW1lIGluIHRoZSBjbG9jayByZXF1ZXN0LCBpbnN0ZWFkIGp1
c3QgcGFzcyBOVUxMCj4gPiA+ID4gKGJlY2F1c2UKPiA+ID4gPiB0aGlzIGRldmljZSBzaG91bGQg
aGF2ZSBvbmx5IGEgc2luZ2xlIGNsb2NrKS4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoCBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMgfCAyICstCj4gPiA+ID4gwqAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAu
Ywo+ID4gPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiA+
ID4gaW5kZXggMGM5MDU4M2MwNzhiLi5lZGIyMThhMzdhNGYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiA+ID4gKysrIGIvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiA+ID4gQEAgLTMxNSw3ICsz
MTUsNyBAQCBzdGF0aWMgaW50IGZ1NzQwX3BjaWVfcHJvYmUoc3RydWN0Cj4gPiA+ID4gcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihhZnAtPnB3cmVuKSwKPiA+ID4gPiAi
dW5hYmxlIHRvIGdldCBwd3Jlbi1ncGlvc1xuIik7Cj4gPiA+ID4gCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoCAvKiBGZXRjaCBjbG9ja3MgKi8KPiA+ID4gPiAtwqDCoMKgwqDCoMKgIGFmcC0+cGNp
ZV9hdXggPSBkZXZtX2Nsa19nZXQoZGV2LCAicGNpZV9hdXgiKTsKPiA+ID4gPiArwqDCoMKgwqDC
oMKgIGFmcC0+cGNpZV9hdXggPSBkZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgIGlmIChJU19FUlIoYWZwLT5wY2llX2F1eCkpCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJS
KGFmcC0KPiA+ID4gPiA+cGNpZV9hdXgpLAo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAicGNpZV9hdXggY2xvY2sKPiA+ID4gPiBzb3VyY2UKPiA+ID4gPiBtaXNzaW5n
IG9yIGludmFsaWRcbiIpOwo+ID4gPiA+IC0tCj4gPiA+ID4gMi4zNy4xCj4gPiA+ID4gCj4gPiA+
IAo+ID4gCj4gPiAKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
