Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86774C54788
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIlZFR04hNjHydtHPQ4DiOfoI5FioHrLrFo2l8L82A4=; b=wUJdWt4n4YSec1
	Q96AfouO3f8BKw+93f6p6GSmlqHx0vgW+8rZHllIcGgUs7jTeO7HobllPszXBX2FS3tXADPPPOsfO
	solcN7pl7qtJyTQjBh24kB4QaANjcPd3rNezODSgJjMsQD9McRbCpwFdvudcH/ECcLlP5e3U7lwMX
	b8JCcctP9gzjXkbstwRXrOUa4SIhKP3swdGwTbt3XO9q+//Np8RSHWBoc6PQ6uZ2Z3apSBIs4u4Pt
	XTTcVRoClq6de3tpPcbE/dQ8ZbgI99LNJ1n3ja3h4XpAZJXLrqkaTep6eMiCF/Qkh8oBBY4Wy+8tE
	qtFLcWXQV6y4P0K4EHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9hx-00000005AbL-0IUR;
	Thu, 22 Feb 2024 14:05:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd9hs-00000005AYl-1uB8;
	Thu, 22 Feb 2024 14:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D063CE2303;
	Thu, 22 Feb 2024 14:05:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFFAC43390;
	Thu, 22 Feb 2024 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708610745;
	bh=3oLeLa6rd2L74GgGe1DmbMXwWVI+cNrH91RsxvM/HdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GIWgfYuUsPS4XvVO2lTxlI17U35koeY34HM6mt79Jdy7hxI109bKBGWOs/zgGbOwj
	 c5G4vORDQGBHPM/buap+bKoyjEnq1COlebNehisFZdyb7KMz14Vaw6pGu427gsqxoB
	 ze8LKrgoEqYOuxTFFufpQJuOqjel2fpCpj4LSQGKlV9xbWSptu/UmoyicZdGThVqHN
	 BmqMWhQc3A9RCrxc1M/13CwnB0Me43A1TV3WAtYkKDBnHrDUpTS5M8NP6JBNDyVVVB
	 pyX/9/tKgD7jyxA620LQigX1ApQ7KfH5puEh+QMQgDYgALF12EIuWct9Ev4v9A0IGw
	 9fNADVe3cCeaA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Atish Patra
 <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v14 13/18] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
In-Reply-To: <CAAhSdy3DtDFnZKQLXXJ2OPPSv5s8bbGvm8Mmqhg_F2rPneQ3sw@mail.gmail.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-14-apatel@ventanamicro.com>
 <87msrstzck.fsf@all.your.base.are.belong.to.us>
 <CAAhSdy3DtDFnZKQLXXJ2OPPSv5s8bbGvm8Mmqhg_F2rPneQ3sw@mail.gmail.com>
Date: Thu, 22 Feb 2024 15:05:41 +0100
Message-ID: <87edd4twzu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_060549_444955_943CB6C0 
X-CRM114-Status: GOOD (  18.11  )
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

QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JpdGVzOgoKPiBPbiBUaHUsIEZlYiAy
MiwgMjAyNCBhdCA2OjQ04oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4+Cj4+IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cml0ZXM6Cj4+
Cj4+ID4gVGhlIExpbnV4IFBDSSBmcmFtZXdvcmsgc3VwcG9ydHMgcGVyLWRldmljZSBNU0kgZG9t
YWlucyBmb3IgUENJIGRldmljZXMKPj4gPiBzbyBleHRlbmQgdGhlIElNU0lDIGRyaXZlciB0byBh
bGxvdyBQQ0kgcGVyLWRldmljZSBNU0kgZG9tYWlucy4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+PiA+IC0tLQo+PiA+ICBkcml2
ZXJzL2lycWNoaXAvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKwo+PiA+ICBk
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgfCAzNSArKysrKysrKysr
KysrKysrKysrKy0tCj4+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvS2NvbmZp
ZyBiL2RyaXZlcnMvaXJxY2hpcC9LY29uZmlnCj4+ID4gaW5kZXggODVmODZlMzFjOTk2Li4yZmMw
Y2IzMjM0MWEgMTAwNjQ0Cj4+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPj4gPiAr
KysgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZwo+PiA+IEBAIC01NTMsNiArNTUzLDEzIEBAIGNv
bmZpZyBSSVNDVl9JTVNJQwo+PiA+ICAgICAgIHNlbGVjdCBHRU5FUklDX0lSUV9NQVRSSVhfQUxM
T0NBVE9SCj4+ID4gICAgICAgc2VsZWN0IEdFTkVSSUNfTVNJX0lSUQo+PiA+Cj4+ID4gK2NvbmZp
ZyBSSVNDVl9JTVNJQ19QQ0kKPj4gPiArICAgICBib29sCj4+ID4gKyAgICAgZGVwZW5kcyBvbiBS
SVNDVl9JTVNJQwo+PiA+ICsgICAgIGRlcGVuZHMgb24gUENJCj4+ID4gKyAgICAgZGVwZW5kcyBv
biBQQ0lfTVNJCj4+ID4gKyAgICAgZGVmYXVsdCBSSVNDVl9JTVNJQwo+PiA+ICsKPj4gPiAgY29u
ZmlnIEVYWU5PU19JUlFfQ09NQklORVIKPj4gPiAgICAgICBib29sICJTYW1zdW5nIEV4eW5vcyBJ
UlEgY29tYmluZXIgc3VwcG9ydCIgaWYgQ09NUElMRV9URVNUCj4+ID4gICAgICAgZGVwZW5kcyBv
biAoQVJDSF9FWFlOT1MgJiYgQVJNKSB8fCBDT01QSUxFX1RFU1QKPj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1wbGF0Zm9ybS5jCj4+ID4gaW5kZXggZTIzNDRmYzA4ZGNhLi45
MGRkY2RkMGJiYTUgMTAwNjQ0Cj4+ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bXNpYy1wbGF0Zm9ybS5jCj4+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1wbGF0Zm9ybS5jCj4+ID4gQEAgLTE0LDYgKzE0LDcgQEAKPj4gPiAgI2luY2x1ZGUgPGxpbnV4
L2lycWRvbWFpbi5oPgo+PiA+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4+ID4gICNpbmNs
dWRlIDxsaW51eC9tc2kuaD4KPj4gPiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+PiA+ICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4+ID4gICNpbmNsdWRlIDxsaW51eC9zcGlu
bG9jay5oPgo+PiA+ICAjaW5jbHVkZSA8bGludXgvc21wLmg+Cj4+ID4gQEAgLTIwOCw2ICsyMDks
MjggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpcnFfZG9tYWluX29wcyBpbXNpY19iYXNlX2RvbWFp
bl9vcHMgPSB7Cj4+ID4gICNlbmRpZgo+PiA+ICB9Owo+PiA+Cj4+ID4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfSU1TSUNfUENJCj4+ID4gKwo+PiA+ICtzdGF0aWMgdm9pZCBpbXNpY19wY2lfbWFza19p
cnEoc3RydWN0IGlycV9kYXRhICpkKQo+PiA+ICt7Cj4+ID4gKyAgICAgcGNpX21zaV9tYXNrX2ly
cShkKTsKPj4gPiArICAgICBpcnFfY2hpcF9tYXNrX3BhcmVudChkKTsKPj4gPiArfQo+PiA+ICsK
Pj4gPiArc3RhdGljIHZvaWQgaW1zaWNfcGNpX3VubWFza19pcnEoc3RydWN0IGlycV9kYXRhICpk
KQo+PiA+ICt7Cj4+ID4gKyAgICAgaXJxX2NoaXBfdW5tYXNrX3BhcmVudChkKTsKPj4gPiArICAg
ICBwY2lfbXNpX3VubWFza19pcnEoZCk7Cj4+ID4gK30KPj4gPiArCj4+ID4gKyNkZWZpbmUgTUFU
Q0hfUENJX01TSSAgICAgICAgICAgICAgICBCSVQoRE9NQUlOX0JVU19QQ0lfTVNJKQo+PiA+ICsK
Pj4gPiArI2Vsc2UKPj4gPiArCj4+ID4gKyNkZWZpbmUgTUFUQ0hfUENJX01TSSAgICAgICAgICAg
ICAgICAwCj4+ID4gKwo+PiA+ICsjZW5kaWYKPj4gPiArCj4+ID4gIHN0YXRpYyBib29sIGltc2lj
X2luaXRfZGV2X21zaV9pbmZvKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwKPj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlycV9kb21haW4gKnJlYWxfcGFy
ZW50LAo+PiA+IEBAIC0yMzEsNiArMjU0LDEzIEBAIHN0YXRpYyBib29sIGltc2ljX2luaXRfZGV2
X21zaV9pbmZvKHN0cnVjdCBkZXZpY2UgKmRldiwKPj4gPgo+PiA+ICAgICAgIC8qIElzIHRoZSB0
YXJnZXQgc3VwcG9ydGVkPyAqLwo+PiA+ICAgICAgIHN3aXRjaCAoaW5mby0+YnVzX3Rva2VuKSB7
Cj4+ID4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfSU1TSUNfUENJCj4+ID4gKyAgICAgY2FzZSBET01B
SU5fQlVTX1BDSV9ERVZJQ0VfTVNJOgo+PiA+ICsgICAgIGNhc2UgRE9NQUlOX0JVU19QQ0lfREVW
SUNFX01TSVg6Cj4+ID4gKyAgICAgICAgICAgICBpbmZvLT5jaGlwLT5pcnFfbWFzayA9IGltc2lj
X3BjaV9tYXNrX2lycTsKPj4gPiArICAgICAgICAgICAgIGluZm8tPmNoaXAtPmlycV91bm1hc2sg
PSBpbXNpY19wY2lfdW5tYXNrX2lycTsKPj4KPj4gaXJxX3NldF9hZmZpbml0eSgpPwo+Cj4gSXQn
cyBhbHJlYWR5IHNldCBieSB0aGUgc3dpdGNoLWNhc2UgYWJvdmUuCgpBaCwgcmlnaHQgLS0gdGhl
IG5ldyAuYnVzX3NlbGVjdF90b2tlbiEgVGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
