Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0447C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPzkAJF8StZhYA0BERlqWX8DbFDoZGxU8RBWWAr0d2o=; b=CIoo6lerWG+ggG
	Su4ademwDsCl5FpKbylXvQoi7puPq6YgWZTMZgrdN2TJ2bI6b84VuDRFJ5M/ij8H9je5DVlUoNhSy
	dekIceKqWY7gy7O11cvdWeTehWkFCnXi2P/2KjlBwp+7ddfmPJ5s3doxUgpJXA6A1ftsHYfqsAXUu
	yLaCsC56VQB+HMZ+fP5s9qN/CbQtQR2EnQl+AJlJJyXI1KxMS9A0z3IyJu1j8TJZWx1uhrymzfEOu
	i+kai0lnqSiF/KJDPXoKrGXG2psVp26oEZ/hEq727Nfyan7+T4j5sdUwuWV0xHjYfrdeLuO68Tctk
	XxXFQ6l4Cp2a4mC+wzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFro-000000031Wa-3hiE;
	Tue, 22 Jul 2025 16:29:24 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFLR-00000002vi1-2MUy
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 15:55:59 +0000
Date: Tue, 22 Jul 2025 23:55:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753199752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8KY8tFgOhzhn8LNLMXuaA9xgGEARgCxSjBTz/EP1VVU=;
	b=R2kR/Wp2Mi8qtrn439VWPFydY4QshjUyYiawYDYZeGH/x+EbV4oDOYKzqSVYo36mR8xw2r
	vPOYdVTKNiLmmtAN0XeGDnyKuVc5H3jGinAYZScLSCcT2BuQfa8AMm6vCd5Brxvu9XXLgz
	4BVvqd01NDmH8FlEpM+GoLB1VQ6zIOQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Yao Zi <ziyao@disroot.org>, Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@ieee.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: dwc3: add generic driver to support flattened
Message-ID: <aH-0d0OyLIo9tlkd@monica.localdomain>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
 <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
 <aHyN3-uoHofF8Hg3@monica.localdomain>
 <aH4tpgVPbf9DOzSe@monica.localdomain>
 <aH7cpr0faRPVnxXL@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH7cpr0faRPVnxXL@pie>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_085557_744343_839781BE 
X-CRM114-Status: GOOD (  36.53  )
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

T24gVHVlLCBKdWwgMjIsIDIwMjUgYXQgMTI6MzQ6NDZBTSArMDAwMCwgWWFvIFppIHdyb3RlOgo+
IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDA4OjA4OjA2UE0gKzA4MDAsIFplIEh1YW5nIHdyb3Rl
Ogo+ID4gT24gU3VuLCBKdWwgMjAsIDIwMjUgYXQgMDI6MzQ6MDdQTSArMDgwMCwgWmUgSHVhbmcg
d3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVsIDE1LCAyMDI1IGF0IDAzOjUwOjU0UE0gLTA1MDAsIEFs
ZXggRWxkZXIgd3JvdGU6Cj4gPiA+ID4gT24gNy8xMi8yNSAyOjQ5IEFNLCBaZSBIdWFuZyB3cm90
ZToKPiA+ID4gPiA+IFRvIHN1cHBvcnQgZmxhdHRlbmVkIGR3YzMgZHQgbW9kZWwgYW5kIGRyb3Ag
dGhlIGdsdWUgbGF5ZXIsIGludHJvZHVjZSB0aGUKPiA+ID4gPiA+IGBkd2MzLWdlbmVyaWNgIGRy
aXZlci4gVGhpcyBlbmFibGVzIGRpcmVjdCBiaW5kaW5nIG9mIHRoZSBEV0MzIGNvcmUgZHJpdmVy
Cj4gPiA+ID4gPiBhbmQgb2ZmZXJzIGFuIGFsdGVybmF0aXZlIHRvIHRoZSBleGlzdGluZyBnbHVl
IGRyaXZlciBgZHdjMy1vZi1zaW1wbGVgLgo+ID4gPiA+IAo+ID4gPiA+IEknbSBub3QgZmFtaWxp
YXIgd2l0aCBkd2Mtb2Ytc2ltcGxlLmMsIGFuZCB3b24ndCBjb21tZW50IG9uCj4gPiA+ID4gaG93
IHRoaXMgZGlmZmVycyBmcm9tIHRoYXQgKG9yIGRvZXMgbm90KS4KPiA+ID4gPiAKPiA+ID4gPiBH
aXZlbiB5b3UncmUgaW1wbGVtZW50aW5nIGFuIGFsdGVybmF0aXZlIHRob3VnaCwgY2FuIHlvdSBl
eHBsYWluCj4gPiA+ID4gaW4gYSBsaXR0bGUgbW9yZSBkZXRhaWwgd2hhdCdzIGRpZmZlcmVudCBi
ZXR3ZWVuIHRoZSB0d28/ICBXaHkKPiA+ID4gPiB3b3VsZCBzb21lb25lIGNob29zZSB0byB1c2Ug
dGhpcyBkcml2ZXIgcmF0aGVyIHRoYW4gdGhlIG90aGVyIG9uZT8KPiA+ID4gCj4gPiA+IFRoZXkg
YXJlIGJhc2ljYWxseSB0aGUgc2FtZS4KPiA+ID4gCj4gPiA+IGR3Yy1nZW5lcmljIHVzZSBhIHBs
YWluIGR0IG5vZGUgd2hpbGUgZHdjLW9mLXNpbXBsZSB3aWxsIG5lc3QgdGhlIGR3YzMKPiA+ID4g
bm9kZSBhcyBpdHMgY2hpbGQuCj4gPiA+IAo+ID4gPiBCb3RoIHdpbGwgdXNlIGR3YzNfY29yZV9w
cm9iZSgpIHRvIGZpbmlzaCB0aGUgcHJvYmUgcHJvY2Vzcy4gQnV0IG5vdyB3ZQo+ID4gPiBjYW4g
c2ltcGxpZnkgdGhlIHByb2Nlc3MgYnkganVzdCBjYWxsaW5nIGl0LCBpbnN0ZWFkIG9mIGNhbGxp
bmcKPiA+ID4gb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBhbmQgY3JlYXRlIGFub3RoZXIgc25wcyxk
d2MzIGRldmljZSBkcml2ZXIuCj4gPiAKPiA+IFsuLi5dCj4gPiAKPiA+ID4gPiA+ICsJcmV0ID0g
cmVzZXRfY29udHJvbF9hc3NlcnQoZHdjMy0+cmVzZXRzKTsKPiA+ID4gPiA+ICsJaWYgKHJldCkK
PiA+ID4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGFz
c2VydCByZXNldHNcbiIpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKwlyZXQgPSBkZXZtX2FkZF9h
Y3Rpb25fb3JfcmVzZXQoZGV2LCBkd2MzX2dlbmVyaWNfcmVzZXRfY29udHJvbF9hc3NlcnQsIGR3
YzMtPnJlc2V0cyk7Cj4gPiA+ID4gPiArCWlmIChyZXQpCj4gPiA+ID4gPiArCQlyZXR1cm4gcmV0
Owo+ID4gPiA+IAo+ID4gPiA+IFRoZSByZS1hc3NlcnQgc2hvdWxkbid0IGJlIHNldCB1cCB1bmxl
c3MgdGhlIGRlYXNzZXJ0IGJlbG93Cj4gPiA+ID4gc3VjY2VlZHMuCj4gPiA+ID4gCj4gPiA+IAo+
ID4gPiBXaWxsIG1vdmUgYmVoaW5kIHRoZSBkZWFzc2VydC4KPiA+ID4gCj4gPiA+ID4gPiArCXVz
bGVlcF9yYW5nZSgxMCwgMTAwMCk7Cj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBzZWVtcyBsaWtlIGEg
bGFyZ2UgcmFuZ2UuICBZb3UgY291bGQganVzdCBkbyBtc2xlZXAoMSk7Cj4gPiA+ID4gQWxzbywg
Y2FuIHlvdSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IGEgZGVsYXkgaXMgbmVlZGVkLAo+
ID4gPiA+IGFuZCB3aHkgMSBtaWxsaXNlY29uZCBpcyB0aGUgcmlnaHQgYW1vdW50IG9mIHRpbWUg
dG8gc2xlZXA/Cj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBJIHdpbGwgY2hlY2sgdGhlIHJhbmdlIHdp
dGggc3BhY2VtaXQgYW5kIHJlcGx5IHNvb24uCj4gPiA+IAo+ID4gCj4gPiB0aGUgcmVzZXRzIGFy
ZSBhc3luY2hyb25vdXMgd2l0aCBubyBzdHJpY3QgdGltaW5nLiBCdXQgdG8gYmUgc2FmZSwgZWFj
aAo+ID4gcmVzZXQgc2hvdWxkIHN0YXkgYWN0aXZlIGZvciBhdCBsZWFzdCAx4oCvwrVzLiBJ4oCZ
bGwgc3dpdGNoIHRvIGEgdWRlbGF5KDIpCj4gPiBhbmQgYWRkIGNvbW1lbnQgYWNjb3JkaW5nbHku
Cj4gCj4gVGhpcyBtYXkgYmUgYSBsaXR0bGUgZmFyc2lnaHQ6IGRvIHlvdSB0aGluayBpdCdzIGJl
dHRlciB0byBtYWtlIHRoZQo+IHJlc2V0IHRpbWluZyBwYXJ0IG9mIHRoZSBvZl9tYXRjaF9kYXRh
PyBUaGlzIGlzIG1vcmUgZmxleGlibGUgYW5kCj4gcmVkdWNlcyBmdXR1cmUgYnVyZGVuIHdoZW4g
aW50cm9kdWNpbmcgYSBuZXcgcGxhdGZvcm0gdGhhdCBjb21lcyB3aXRoIGEKPiBkaWZmZXJlbnQg
cmVzZXQgdGltaW5nLCB3aGljaCBpcyBhIHZlcnkgbGlrZWx5IGNhc2Ugd2UnbGwgZmFjZSBzaW5j
ZQo+IGl0J3MgYSAiZ2VuZXJpYyIgZHJpdmVyLgo+IAoKSGkgWmkgWWFvLCB0aGFua3MgZm9yIHRo
ZSBzdWdnZXN0aW9uLgoKVGhlIGRlbGF5IGlzIG9ubHkgZm9yIHNhZmV0eS4gSSB0aGluayB0aGVy
ZSB3aWxsIG5vdCBiZSBtdWNoIGRldmljZSByZXF1aXJlCnRoaXMgc2V0dGluZy4gSSdkIHByZWZl
ciB0byBrZWVwIHRoZSBsb2dpYyBzaW1wbGUgYW5kIGp1c3QgY292ZXIgdGhlCmN1cnJlbnRseSBr
bm93biBjb21wYXRpYmxlIGRldmljZXMuCgpJZiB3ZSBlbmNvdW50ZXIgZnV0dXJlIHBsYXRmb3Jt
cyB0aGF0IHJlcXVpcmUgZGlmZmVyZW50IHRpbWluZyBjb25zdHJhaW50cywKd2UgY2FuIHJldmlz
aXQgdGhpcyBhbmQgaW50cm9kdWNlIG9mX21hdGNoX2RhdGEgYXMgbmVlZGVkLgoKPiA+ID4gPiA+
ICsJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkd2MzLT5yZXNldHMpOwo+ID4gPiA+ID4g
KwlpZiAocmV0KQo+ID4gPiA+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJm
YWlsZWQgdG8gZGVhc3NlcnQgcmVzZXRzXG4iKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJcmV0
ID0gZGV2bV9jbGtfYnVsa19nZXRfYWxsKGR3YzMtPmRldiwgJmR3YzMtPmNsa3MpOwo+ID4gPiA+
ID4gKwlpZiAocmV0IDwgMCkKPiA+ID4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
cmV0LCAiZmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOwo+ID4gPiA+IAo+ID4gPiA+IENhbGwgZGV2
bV9jbGtfYnVsa19nZXRfYWxsX2VuYWJsZWQoKSBpbnN0ZWFkIG9mIGRvaW5nIHRoZSB0d28KPiA+
ID4gPiBzdGVwcyBzZXBhcmF0ZWx5IGhlcmUuCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBXaWxsIGRv
LCB0aGFua3MuCj4gPiA+IAo+ID4gPiA+IAkJCQkJLUFsZXgKPiA+IAo+IAo+IFJlZ2FyZHMsCj4g
WWFvIFppCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
