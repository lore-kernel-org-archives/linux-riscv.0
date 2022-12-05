Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221FBC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaO15E6yfuj8mG4ZTSMuiWrVwjc8rPx1MjDYSJ3VE08=; b=v/fFPxNjWnKu11
	pk+/DB4WOYV1VaXKVTD7f3utxowXzud4G0cRmVE+uq87BISYM87suwl3noYPjBzwORCgRS4rD02wG
	PBM8DsBhIb4wwWAy7poRiZCKLHv6k+jyBSzCxo0encdccH2KyViZmG/CH0e0oW7z1BKLDCAKZeIRX
	ePhW/fiLEb+0atEqgOMGvU0jpYugRFEG14xKv80p4cER+T81QyfWIEZgxV1UDB72PbQq28OiTSVl6
	08+eDjUUHo1+HYmniCFB4iPGEmxOIcJhhopqEPaOgga3fbbABUVRUYdd+vFpl2GFFdMAHxPzqPP6t
	gDN1kRZQbRzLSO0dUK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Dk8-005Qae-FQ; Mon, 05 Dec 2022 15:50:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Dk4-005Ps1-Uz; Mon, 05 Dec 2022 15:50:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A077261188;
	Mon,  5 Dec 2022 15:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFD2C433C1;
	Mon,  5 Dec 2022 15:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670255442;
	bh=BrRYDcdqex/nHeWDnae0HV8ylVvWCOMmR2Y6LeHY7UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cjn8mreHX80R07iq01rF++P1NhPciHE+E9EB79drk27KNwHA4kxC9+SsXSTRwQAcw
	 CmH2Oze0JK9DBc3IgwEOd7j1PC9uwN1Kt76YlDcpzbAqD8T0JaTlmPg89YrlkvCknz
	 0S+UmKVMdtbj4pGLcsQotUX6Z3nOQXEA6DH81VnSIT56AISzAfXdC4XXeY25wKD6WH
	 RTX/oKh++dovsJct0+hCvgyTzEh6dgpFkpL3APgGvR5M9P+7vDuqevMz9RwmwjkmMI
	 LYqcpsoaB7IVwR1bKH+UKj/kDNo4YPiCRyWQpYusaXzcXLQRcMNOS+E7vPKFH/2Zd9
	 I5rHjN+0ouXNA==
Date: Mon, 5 Dec 2022 23:40:44 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y44Q/B6THtP38eyL@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-2-jszhang@kernel.org>
 <4764569.GXAFRqVoOG@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4764569.GXAFRqVoOG@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_075053_128239_3535BA63 
X-CRM114-Status: GOOD (  31.74  )
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

T24gTW9uLCBEZWMgMDUsIDIwMjIgYXQgMDQ6MzE6MDhQTSArMDEwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gQW0gU29ubnRhZywgNC4gRGV6ZW1iZXIgMjAyMiwgMTg6NDY6MjAgQ0VUIHNjaHJp
ZWIgSmlzaGVuZyBaaGFuZzoKPiA+IEFsdGVybmF0aXZlcyBsaXZlIGluIGEgZGlmZmVyZW50IHNl
Y3Rpb24sIHNvIG9mZnNldHMgdXNlZCBieSBqYWwKPiA+IGluc3RydWN0aW9uIHdpbGwgcG9pbnQg
dG8gd3JvbmcgbG9jYXRpb25zIGFmdGVyIHRoZSBwYXRjaCBnb3QgYXBwbGllZC4KPiA+IAo+ID4g
U2ltaWxhciB0byBhcm02NCwgYWRqdXN0IHRoZSBsb2NhdGlvbiB0byBjb25zaWRlciB0aGF0IG9m
ZnNldC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJu
ZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hbHRlcm5hdGl2ZS5o
IHwgIDIgKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jICAgICAgfCAzOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jICAgICAgIHwgIDMgKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0
aXZlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FsdGVybmF0aXZlLmgKPiA+IGluZGV4IGM1
OGVjM2NjNGJjMy4uMzNlYWU5NTQxNjg0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9hbHRlcm5hdGl2ZS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Fs
dGVybmF0aXZlLmgKPiA+IEBAIC0yOSw2ICsyOSw4IEBAIHZvaWQgYXBwbHlfbW9kdWxlX2FsdGVy
bmF0aXZlcyh2b2lkICpzdGFydCwgc2l6ZV90IGxlbmd0aCk7Cj4gPiAgCj4gPiAgdm9pZCByaXNj
dl9hbHRlcm5hdGl2ZV9maXhfYXVpcGNfamFscih2b2lkICphbHRfcHRyLCB1bnNpZ25lZCBpbnQg
bGVuLAo+ID4gIAkJCQkgICAgICBpbnQgcGF0Y2hfb2Zmc2V0KTsKPiA+ICt2b2lkIHJpc2N2X2Fs
dGVybmF0aXZlX2ZpeF9qYWwodm9pZCAqYWx0X3B0ciwgdW5zaWduZWQgaW50IGxlbiwKPiA+ICsJ
CQkgICAgICAgaW50IHBhdGNoX29mZnNldCk7Cj4gPiAgCj4gPiAgc3RydWN0IGFsdF9lbnRyeSB7
Cj4gPiAgCXZvaWQgKm9sZF9wdHI7CQkgLyogYWRkcmVzcyBvZiBvcmlnaW5hbCBpbnN0cnVjaXRv
biBvciBkYXRhICAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0
aXZlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9hbHRlcm5hdGl2ZS5jCj4gPiBpbmRleCAyOTJjYzQy
ZGMzYmUuLjlkODgzNzU2MjRiNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Fs
dGVybmF0aXZlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2FsdGVybmF0aXZlLmMKPiA+
IEBAIC0xMjUsNiArMTI1LDQ0IEBAIHZvaWQgcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X2F1aXBjX2ph
bHIodm9pZCAqYWx0X3B0ciwgdW5zaWduZWQgaW50IGxlbiwKPiA+ICAJfQo+ID4gIH0KPiA+ICAK
PiA+ICsjZGVmaW5lIHRvX2phbF9pbW0odmFsdWUpCQkJCQkJXAo+ID4gKwkoKCh2YWx1ZSAmIChS
Vl9KX0lNTV8xMF8xX01BU0sgPDwgUlZfSl9JTU1fMTBfMV9PRkYpKSA8PCBSVl9JX0lNTV8xMV8w
X09QT0ZGKSB8IFwKPiA+ICsJICgodmFsdWUgJiAoUlZfSl9JTU1fMTFfTUFTSyA8PCBSVl9KX0lN
TV8xMV9PRkYpKSA8PCBSVl9KX0lNTV8xMV9PUE9GRikgfCBcCj4gPiArCSAoKHZhbHVlICYgKFJW
X0pfSU1NXzE5XzEyX09QT0ZGIDw8IFJWX0pfSU1NXzE5XzEyX09GRikpIDw8IFJWX0pfSU1NXzE5
XzEyX09QT0ZGKSB8IFwKPiA+ICsJICgodmFsdWUgJiAoMSA8PCBSVl9KX0lNTV9TSUdOX09GRikp
IDw8IFJWX0pfSU1NX1NJR05fT1BPRkYpKQo+ID4gKwo+ID4gK3ZvaWQgcmlzY3ZfYWx0ZXJuYXRp
dmVfZml4X2phbCh2b2lkICphbHRfcHRyLCB1bnNpZ25lZCBpbnQgbGVuLAo+ID4gKwkJCSAgICAg
ICBpbnQgcGF0Y2hfb2Zmc2V0KQo+ID4gK3sKPiAKPiBJIHRoaW5rIHdlIG1pZ2h0IHdhbnQgdG8g
dW5maXkgdGhpcyBpbnRvIGEgY29tbW9uIGZ1bmN0aW9uIGxpa2UKPiAKPiAJcmlzY3ZfYWx0ZXJu
YXRpdmVfZml4X29mZnNldHMoLi4uKQo+IAo+IHNvIHRoYXQgd2Ugb25seSBydW4gdGhyb3VnaCB0
aGUgY29kZSBibG9jayBvbmNlCj4gCj4gCWZvciAoaSA9IDA7IGkgPCBudW1faW5zdHI7IGkrKykg
ewo+IAkJaWYgKHJpc2N2X2luc25faXNfYXVpcGNfamFscihpbnN0MSwgaW5zdDIpKSB7Cj4gCQkJ
cmlzY3ZfYWx0ZXJuYXRpdmVfZml4X2F1aXBjX2phbHIoLi4uKQo+IAkJCWNvbnRpbnVlOwo+IAkJ
fQo+IAo+IAkJaWYgKHJpc2N2X2luc25faXNfamFsKGluc3QpKSB7Cj4gCQkJcmlzY3ZfYWx0ZXJu
YXRpdmVfZml4X2phbCguLi4pCj4gCQkJY29udGludWU7Cj4gCQl9Cj4gCX0KPiAKPiBUaGlzIHdv
dWxkIGFsc28gcmVtb3ZlIHRoZSBuZWVkIGZyb20gY2FsbGluZyBtdWx0aXBsZSBmdW5jdGlvbnMK
PiBhZnRlciBwYXRjaGluZyBhbHRlcm5hdGl2ZXMuCgpZZXN0ZXJkYXksIEkgYWxzbyB3YW50ZWQg
dG8gdW5pZnkgdGhlIHR3byBpbnN0cnVjdGlvbiBmaXggaW50bwpvbmUuIEJ1dCB0aGF0IHdvdWxk
IG5lZWQgdG8gcm9sbCBiYWNrIHRoZQpyaXNjdl9hbHRlcm5hdGl2ZV9maXhfYXVpcGNfamFscigp
IHRvIHlvdXIgdjEgdmVyc2lvbi4gQW5kIElNSE8sCml0J3MgYmV0dGVyIGlmIHlvdSBjYW4gc3Bs
aXQgdGhlIFpiYiBzdHJpbmcgb3B0aW1pemF0aW9ucyBzZXJpZXMKaW50byB0d286IG9uZSBmb3Ig
YWx0ZXJuYXRpdmUgaW1wcm92ZW1lbnRzLCBhbm90aGVyIGZvciBaYmIuIFRoZW4Kd2UgbWF5IGdl
dCB0aGUgYWx0ZXJuYXRpdmUgaW1wcm92ZW1lbnRzIGFuZCB0aGlzIGluc3QgZXh0ZW5zaW9uCnNl
cmllcyBtZXJnZWQgaW4gdjYuMi1yYzEuCgo+IAo+IFRob3VnaHRzPwo+IAo+IAo+IEhlaWtvCj4g
Cj4gPiArCWludCBudW1faW5zdHIgPSBsZW4gLyBzaXplb2YodTMyKTsKPiA+ICsJdW5zaWduZWQg
aW50IGNhbGw7Cj4gPiArCWludCBpOwo+ID4gKwlpbnQgaW1tOwo+ID4gKwo+ID4gKwlmb3IgKGkg
PSAwOyBpIDwgbnVtX2luc3RyOyBpKyspIHsKPiA+ICsJCXUzMiBpbnN0ID0gcmlzY3ZfaW5zdHJ1
Y3Rpb25fYXQoYWx0X3B0ciwgaSk7Cj4gPiArCj4gPiArCQlpZiAoIXJpc2N2X2luc25faXNfamFs
KGluc3QpKQo+ID4gKwkJCWNvbnRpbnVlOwo+ID4gKwo+ID4gKwkJLyogZ2V0IGFuZCBhZGp1c3Qg
bmV3IHRhcmdldCBhZGRyZXNzICovCj4gPiArCQlpbW0gPSBSVl9FWFRSQUNUX0pUWVBFX0lNTShp
bnN0KTsKPiA+ICsJCWltbSAtPSBwYXRjaF9vZmZzZXQ7Cj4gPiArCj4gPiArCQkvKiBwaWNrIHRo
ZSBvcmlnaW5hbCBqYWwgKi8KPiA+ICsJCWNhbGwgPSBpbnN0Owo+ID4gKwo+ID4gKwkJLyogZHJv
cCB0aGUgb2xkIElNTXMsIGFsbCBqYWwgaW1tIGJpdHMgc2l0IGF0IDMxOjEyICovCj4gPiArCQlj
YWxsICY9IH5HRU5NQVNLKDMxLCAxMik7Cj4gPiArCj4gPiArCQkvKiBhZGQgdGhlIGFkYXB0ZWQg
SU1NcyAqLwo+ID4gKwkJY2FsbCB8PSB0b19qYWxfaW1tKGltbSk7Cj4gPiArCj4gPiArCQkvKiBw
YXRjaCB0aGUgY2FsbCBwbGFjZSBhZ2FpbiAqLwo+ID4gKwkJcGF0Y2hfdGV4dF9ub3N5bmMoYWx0
X3B0ciArIGkgKiBzaXplb2YodTMyKSwgJmNhbGwsIDQpOwo+ID4gKwl9Cj4gPiArfQo+ID4gKwo+
ID4gIC8qCj4gPiAgICogVGhpcyBpcyBjYWxsZWQgdmVyeSBlYXJseSBpbiB0aGUgYm9vdCBwcm9j
ZXNzIChkaXJlY3RseSBhZnRlciB3ZSBydW4KPiA+ICAgKiBhIGZlYXR1cmUgZGV0ZWN0IG9uIHRo
ZSBib290IENQVSkuIE5vIG5lZWQgdG8gd29ycnkgYWJvdXQgb3RoZXIgQ1BVcwo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L2NwdWZlYXR1cmUuYwo+ID4gaW5kZXggYmE2MmE0ZmY1Y2NkLi5jNzQzZjBhZGM3OTQgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4gQEAgLTMyNCw2ICszMjQsOSBAQCB2b2lkIF9f
aW5pdF9vcl9tb2R1bGUgcmlzY3ZfY3B1ZmVhdHVyZV9wYXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50
cnkgKmJlZ2luLAo+ID4gIAkJCXJpc2N2X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKGFsdC0+
b2xkX3B0ciwKPiA+ICAJCQkJCQkJIGFsdC0+YWx0X2xlbiwKPiA+ICAJCQkJCQkJIGFsdC0+b2xk
X3B0ciAtIGFsdC0+YWx0X3B0cik7Cj4gPiArCQkJcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X2phbChh
bHQtPm9sZF9wdHIsCj4gPiArCQkJCQkJICBhbHQtPmFsdF9sZW4sCj4gPiArCQkJCQkJICBhbHQt
Pm9sZF9wdHIgLSBhbHQtPmFsdF9wdHIpOwo+ID4gIAkJfQo+ID4gIAl9Cj4gPiAgfQo+ID4gCj4g
Cj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
