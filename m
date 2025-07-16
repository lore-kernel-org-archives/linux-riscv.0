Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBE7C83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7keKrmErqZoTUeLZAlTav+MHSGR0K9q3zvIBIG5aCg=; b=rKVoSTGPzhYAnR
	GAg/+uxLycOPhmYp6U54pb7tqwmVEwfHw/hXTBpey9gLbUteyeI0d1nSIwIobEoG+PFQJPm6qP4Mu
	2IGsJvcraq3170G1REHV2G4jghoAg1hf7Ho7n2qXEV4jVQRd4e7G20DRQxI5mMROcfp/cNWjXXUNC
	AmKrocPzpkLDr8HJpNRtsm04ZR9p0ixKLRs9UDRoYB2QIHWCr55Vmq2PaSDD0stSU7U3KyKj5Eq2z
	hu1JWZv2FKrHSAsjQwlV+C6IsUO+msDJuMGvYKYvSkQR6NFx2u48s02T2xCMGOMqYK30SZcXUOwl7
	bVO9vHh4OQ3CRX9ob+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0bl-00000007aob-2GLt;
	Wed, 16 Jul 2025 11:47:33 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0Of-00000007ZVL-2CB3
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 11:34:02 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B619C340EC9;
	Wed, 16 Jul 2025 11:33:58 +0000 (UTC)
Date: Wed, 16 Jul 2025 19:33:54 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	palmer@dabbelt.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device
 tree
Message-ID: <20250716113354-GYB546922@gentoo>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
 <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
 <20250715102534-GYA542593@gentoo>
 <95125019-8eaa-4242-8e68-78771ce85947@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95125019-8eaa-4242-8e68-78771ce85947@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_043401_590602_B5C8291C 
X-CRM114-Status: GOOD (  22.35  )
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

SGkgSGVuZHJpaywKCk9uIDExOjM3IFdlZCAxNiBKdWwgICAgICwgSGVuZHJpayBIYW1tZXJuZXQg
d3JvdGU6Cj4gSGVsbG8sCj4gCj4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+IAo+IE9uIDcv
MTUvMjUgMTI6MjUsIFlpeHVuIExhbiB3cm90ZToKPiA+IE9uIDIwOjMyIEZyaSAxMSBKdWwgICAg
ICwgSGVuZHJpayBIYW1lcmxpbmNrIHdyb3RlOgo+ID4KPiA+PiArLyogQ29weXJpZ2h0IChjKSAy
MDIzIEt5LCBJbmMgKi8KPiA+IENvcHlyaWdodCBzaG91bGQgY292ZXIgY3VycmVudCB5ZWFyLCB3
aGljaCBpcyAyMDI1Li4KPiA+IHdoYXQncyAiS3kiIHN0YW5kIGZvcj8gQ2FuIHlvdSBnaXZlIGEg
ZnVsbCBkZXNjcmlwdGlvbiBoZXJlCj4gUmVnYXJkaW5nIHRoZSBvcmlnaW5hbCBjb3B5cmlnaHQ6
Cj4gVGhpcyBmaWxlIHdhcyBiYXNlZCBvbiBhIHZlcnNpb24gZnJvbSB0aGUgS3ksIEluYyBkb3du
c3RyZWFtIGtlcm5lbCwgd2hpY2gKPiBpdHNlbGYgYXBwZWFycyB0byBiZSBhZGFwdGVkIGZyb20g
ZWFybGllciBTcGFjZW1pVCBzb3VyY2VzIChkYXRlZCAyMDIzKS4KPiBUaGUgT3JhbmdlIFBpIFJW
MiBib2FyZCwgaG93ZXZlciwgd2FzIG9ubHkgcmVsZWFzZWQgaW4gMjAyNSwgc3VnZ2VzdGluZwo+
IHRoYXQgdGhlIEt5IHZlcnNpb24gd2FzIGxpa2VseSBjb3BpZWQgYW5kIHJlbmFtZWQgZnJvbSBl
YXJsaWVyIGdlbmVyaWMKPiBTcGFjZW1pVCBmaWxlcy4KPiAKPiBJbiByZXZpZXdpbmcgdGhlIEt5
IGRvd25zdHJlYW0gdHJlZSwgSSBhbHNvIG5vdGljZWQgdGhhdCBzZXZlcmFsIGZpbGVzIGhhZAo+
IHRoZWlyIGNvcHlyaWdodCBzdGF0ZW1lbnRzIG92ZXJ3cml0dGVuIHdpdGggIkt5LCBJbmMiLCB3
aGlsZSB0aGUgb3JpZ2luYWwKPiB5ZWFycyAoZS5nLiwgMjAyMykgcmVtYWluZWQgdW5jaGFuZ2Vk
LiBUaGlzIG1ha2VzIHRoZSBwcm92ZW5hbmNlIGEgYml0Cj4gdW5jbGVhci4KPiAKPiBTaW5jZSBJ
J3ZlIHNpZ25pZmljYW50bHkgcmV3b3JrZWQgdGhlIGZpbGUgZm9yIHRoZSBhY3R1YWwgT3Jhbmdl
IFBpIFJWMgo+IGhhcmR3YXJlLCBJ4oCZZCBwcmVmZXIgdG8gYXR0cmlidXRlIGl0IHVuZGVyIG15
IG93biBuYW1lLCB1bmxlc3MgcmV0YWluaW5nCj4gdGhlIG9yaWdpbmFsICJLeSwgSW5jIiBpcyBy
ZXF1aXJlZC4KPiAKUGVyc29uYWxseSwgeW91ciBhcHByb2FjaCBsb29rcyBnb29kIHRvIG1lCgo+
IFBsZWFzZSBsZXQgbWUga25vdyB3aGF0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGhlcmUuCj4gCkkn
bSBubyBleHBlcnQgb24gdGhpcywgdW5sZXNzIHBlb3BsZSB3YW50IHRoZSBtb3JlIHN0cmljdCB3
YXkuLgoKUGVyc29uYWxseSwgdGhlIGR0cyBmaWxlIGFscmVhZHkgaGFzIGNvcnJlY3QgQ29weXJp
Z2h0IGluZm8gd2l0aAp0aGUgIlNQRFgtTGljZW5zZS1JZGVudGlmaWVyIiBsaW5lLCBhZGRpdGlv
bmFsIGluZm8gZ2l2ZXMgY3JlZGl0cwpmb3IgcGVvcGxlIHdobyByZWFsbHkgY29udHJpYnV0ZWQg
b24gdGhpcy4uCgo+ID4+ICsJbWVtb3J5QDAgewo+ID4+ICsJCWRldmljZV90eXBlID0gIm1lbW9y
eSI7Cj4gPj4gKwkJcmVnID0gPDB4MCAweDAwMDAwMDAwIDB4MCAweDgwMDAwMDAwPjsKPiA+PiAr
CX07Cj4gPj4gKwo+ID4+ICsJbWVtb3J5QDEwMDAwMDAwMCB7Cj4gPj4gKwkJZGV2aWNlX3R5cGUg
PSAibWVtb3J5IjsKPiA+PiArCQlyZWcgPSA8MHgxIDB4MDAwMDAwMDAgMHgwIDB4ODAwMDAwMDA+
Owo+ID4+ICsJfTsKPiA+PiArCj4gPiBmb3IgdGhlIG1lbW9yeSBub2RlcywgdGhlcmUgYXJlIDIv
NC84R0IgdmFyaWFudHMgZnJvbSB0aGUgTGluayBbMV0sIGFuZAo+ID4geW91IGNvdWxkbid0IGNv
dmVyIGFsbCBvZiB0aGVtIGluIG9uZSBkdAo+ID4KPiA+IGJlc2lkZXMsIEkgdGhvdWdodCBib290
bG9hZGVyICh1LWJvb3QpIHdpbGwgcG9wdWxhdGUgdGhlc2UgaW5mbywgcmlnaHQ/Cj4gPiBzbyB0
aGUgYWJvdmUgbm9kZXMgaXNuJ3QgcmVhbGx5IG5lY2Vzc2FyeQo+ID4KPiBZb3UncmUgYWJzb2x1
dGVseSByaWdodCwgVS1Cb290IGRvZXMgcG9wdWxhdGUgdGhpcyBpbmZvcm1hdGlvbiBjb3JyZWN0
bHkKPiBhdCBydW50aW1lLiBJIHdpbGwgcmVtb3ZlIHRoZSBtZW1vcnkgbm9kZXMgaW4gdGhlIG5l
eHQgdmVyc2lvbi4KPiAKPiBJIGFsc28gbm90aWNlZCB0aGF0IHRoZSBhbGlhc2VzIHNlY3Rpb24g
aXMgbWlzc2luZyBpbiB0aGlzIHZlcnNpb24sIHdoaWNoCj4gbWVhbnMgdGhlIGNob3Nlbi5zdGRv
dXQtcGF0aCA9ICJzZXJpYWwwIiByZWZlcmVuY2Ugd29u4oCZdCByZXNvbHZlIHVubGVzcwo+IHNl
cmlhbDAgPSAmdWFydDA7IGlzIGRlZmluZWQuIEkgZGlkbid0IGVuY291bnRlciBpc3N1ZXMgZHVy
aW5nIHRlc3RpbmcKPiBiZWNhdXNlIEknbSBvdmVycmlkaW5nIHRoZSBib290IGNvbW1hbmQgaW4g
bXkgQnVpbGRyb290IHNldHVwLCBidXQgSeKAmWxsCj4gYWRkIHRoZSBwcm9wZXIgYWxpYXNlcyBu
b2RlIGluIHRoZSBuZXh0IHZlcnNpb24gdG8gZW5zdXJlIHVwc3RyZWFtCj4gY29tcGF0aWJpbGl0
eS4KPiAKcmlnaHQsIHBsZWFzZSEKCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
