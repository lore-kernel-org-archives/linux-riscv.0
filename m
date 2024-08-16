Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBB0C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLLucQREcPgs1sVfv1Pbrd9LfVMI1EEOluMw2Se+SuA=; b=bTv+vaEzijP6Jx
	o0kLinz3TJyrkW2q4chSd7TKz1UKGpMQWRfptLTjbaTmoMfWkHJF6fUjiRPHxRp899MojpBMhzrb5
	gZeUY7vgdL7jhuElLwh9kocJxbjRQlo4UEe9S3oFdmsEoXt23QC+MbTa7zh1Q1U5vConjR7j+VejR
	5U9m8D+sb+prwFhFYhisExeD7CneG965TNM2V5L3KSfCPSzqy8SMLsYL03ZGvnRLEL8X5DvCKGUHL
	mHFEVE65q+ueWgaGOctJdU4J/vjlwpwn2LjFtgekvcF+FjLE3Pe3J0keFMpX5XqrbU/WfKwCJ6Sov
	XNMa4cLETGefbSWNoEOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seqFP-0000000BvMB-3WKn;
	Fri, 16 Aug 2024 06:15:39 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seqFN-0000000BvLh-1Zhe
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 06:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1723788933; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NffyhWjs0v579e98Jq4Vbg1JHIF1GgQaeBr43KRcITG1jIbfVyP6hKQ0Mbz65dXEa5AHon2fyUHB6tO3ZbtSYHmc0jjT2SNPN9AkPd2TJm5bSTvTQG2bbZSCS+MK+mIOSvL02ieaMLUVRQFjrcaaQ8I7ZNVNHPnGafMG59xrHMQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723788933; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KmfzcANG1jJYcmlBv8tTgZiMUSg7kBDe4kW7Q+be5pQ=; 
	b=TdlhgD3kIEGG1YlYzCL8nxGcEuPM7gR5QD93gMJpf80oiba+8oJh5bfkvsD/2X4IL0U3ftjyMD9jt68H50sxNeC25hqVHIRkgcFAArMksXT/Q/UhJ0DK3ZpYmfQV5maRz7fRmFnrlneRbKXuQ5ztqUXjyWCN+pMsZPWzIv8C2ms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723788933;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=KmfzcANG1jJYcmlBv8tTgZiMUSg7kBDe4kW7Q+be5pQ=;
	b=njbwOQDaP5uNdwchtKxgRAv93Vgq6F6nVHPEmNa/e7//lR8hhorizQeITg7Q0rjI
	5y1KAJNo2G4+WTBJRXcLUe6TvHYXqPuUhN/NB1cCAYsTAT9ICEJVVgNGC/XbbFawSVM
	Xq5sD0ofJfsB9R1t9v1e9TsPCY1piYm9GWHcoGf+6vMLxiOreBLcALlNZmOiSHbHU6V
	9XJpjngWoBPJq3V8hk0A8+eHu7DleWVU4OQCnj3YY2ns2ufrCHfnGOyIytVpBtjRb+v
	5WvycTuJ6cNT5ZF6tLhEk9Px7b9EpqYv6Vb0W9gxmbSihq8IPRJeI979Z2ieFcX4Qy/
	e6RxXaA9gQ==
Received: by mx.zohomail.com with SMTPS id 1723788931430682.4435507538188;
	Thu, 15 Aug 2024 23:15:31 -0700 (PDT)
Message-ID: <0ab5fcb4ace2e009556b6a597a55b143a00a6093.camel@icenowy.me>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
From: Icenowy Zheng <uwu@icenowy.me>
To: Palmer Dabbelt <palmer@dabbelt.com>, tglx@linutronix.de
Cc: Renner Berthing <emil.renner.berthing@canonical.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	apatel@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	samuel.holland@sifive.com, aou@eecs.berkeley.edu, daniel.lezcano@linaro.org
Date: Fri, 16 Aug 2024 14:15:25 +0800
In-Reply-To: <mhng-5403a4a9-4cdf-447f-9c7e-ea655a2f86fc@palmer-ri-x1c9>
References: <mhng-5403a4a9-4cdf-447f-9c7e-ea655a2f86fc@palmer-ri-x1c9>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_231537_491915_AA386154 
X-CRM114-Status: GOOD (  42.95  )
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

5ZyoIDIwMjQtMDgtMTXmmJ/mnJ/lm5vnmoQgMTA6NTEgLTA3MDDvvIxQYWxtZXIgRGFiYmVsdOWG
memBk++8mgo+IE9uIFdlZCwgMTQgQXVnIDIwMjQgMTA6MzA6NDggUERUICgtMDcwMCksIHRnbHhA
bGludXRyb25peC5kZcKgd3JvdGU6Cj4gPiBPbiBXZWQsIEF1ZyAxNCAyMDI0IGF0IDE2OjU2LCBF
bWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+ID4gQXMgZGVzY3JpYmVkIGluIHRoZSB0aHJl
YWQgYmVsb3dbMV0gSSBoYXZlbid0IGJlZW4gYWJsZSB0byBib290Cj4gPiA+IG15Cj4gPiA+IGJv
YXJkcyBiYXNlZCBvbiB0aGUgQWxsd2lubmVyIEQxIFNvQyBzaW5jZSA2Ljkgd2hlcmUgeW91Cj4g
PiA+IGNvbnZlcnRlZCB0aGUKPiA+ID4gU2lGaXZlIFBMSUMgZHJpdmVyIHRvIGEgcGxhdGZvcm0g
ZHJpdmVyLgo+ID4gPiAKPiA+ID4gVGhpcyBpcyBjbGVhcmx5IGEgcmVncmVzc2lvbiBhbmQgdGhl
cmUgaGF2ZW4ndCByZWFsbHkgYmVlbiBtdWNoCj4gPiA+IHByb2dyZXNzCj4gPiA+IG9uIGZpeGlu
ZyB0aGUgaXNzdWUgc2luY2UgdGhlbiwgc28gaGVyZSBpcyB0aGUgcmV2ZXJ0IHRoYXQgZml4ZXMK
PiA+ID4gaXQuCj4gPiA+IAo+ID4gPiBJZiBubyBvdGhlciBmaXggaXMgZm91bmQgYmVmb3JlIDYu
MTEgSSBzdWdnZXN0IHdlIGFwcGx5IHRoaXMuCj4gPiAKPiA+IFNvIHRoaXMgbWVzcyBoYXMgYmVl
biBpZ25vcmVkIGZvciB0d28gbW9udGggbm93Pwo+ID4gCj4gPiA+IEZyb20gdGhlIHBhc3RlYmlu
IGluIHRoZSBpbml0aWFsIHJlcG9ydDoKPiA+IAo+ID4gW8KgwqDCoCAwLjAwMDAwMF0gaXJxOiBu
byBpcnEgZG9tYWluIGZvdW5kIGZvcgo+ID4gaW50ZXJydXB0LWNvbnRyb2xsZXJAMTAwMDAwMDAg
IQo+ID4gW8KgwqDCoCAwLjAwMDAwMF0gRmFpbGVkIHRvIG1hcCBpbnRlcnJ1cHQgZm9yIC9zb2Mv
dGltZXJAMjA1MDAwMAo+ID4gW8KgwqDCoCAwLjAwMDAwMF0gRmFpbGVkIHRvIGluaXRpYWxpemUg
Jy9zb2MvdGltZXJAMjA1MDAwMCc6IC0yMgo+ID4gCj4gPiBUaGlzIGNvbWVzIGJhY2sgd2l0aCAt
RUlOVkFMLiBTbyB0aGUgdGltZXIgY2Fubm90IGZpbmQgYW4KPiA+IGludGVycnVwdCwKPiA+IHdo
aWNoIG1ha2VzIGl0IHByZXR0eSBvYnZpb3VzIHdoeSB0aGUgc3lzdGVtIHN0b3BzIHRvIGJvb3Qs
IHVubGVzcwo+ID4gdGhlcmUKPiA+IGlzIHNvbWUgb3RoZXIgdGltZXIgYXZhaWxhYmxlLgo+ID4g
Cj4gPiBUaGlzIGlzIG9idmlvdXNseSByZWxhdGVkIHRvIHRoZSBTVU40SV9USU1FUiBiZWNhdXNl
IHRoYXQgbWVzc2FnZQo+ID4gd2VudAo+ID4gYXdheSB3aGVuIGl0IHdhcyBkaXNhYmxlZCBhY2Nv
cmRpbmcgdG8gdGhlIG5leHQgcGFzdGViaW4uCj4gPiAKPiA+IE9idmlvdXNseSB0aGF0IGNhbid0
IHdvcmsgYmVjYXVzZSB0aGUgU1VONEkgdGltZXIgZHJpdmVyIGlzIHVzaW5nCj4gPiB0aW1lcl9v
Zl9pbml0KCkgd2hpY2ggY2Fubm90IGhhbmRsZSBkZWZlcnJlZCBwcm9iaW5nLgo+ID4gCj4gPiBE
YW5pZWw6IFRoZXJlIHdhcyBhIHBhcnRpYWwgZml4IGZvciB0aGUgc3VuNGkgZHJpdmVyLCB3aGlj
aCB5b3UKPiA+IHNhaWQgeW91Cj4gPiBhcHBsaWVkOgo+ID4gCj4gPiDCoAo+ID4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzEyMTkyNTE5LjE2MDI0OTMtMS1zYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tCj4gPiAKPiA+IEJ1dCB0aGF0IHRoaW5nIG5ldmVyIG1hdGVyaWFsaXplZCBp
biBhIHB1bGwgcmVxdWVzdC4KPiA+IAo+ID4gQW5kIG9mIGNvdXJzZSBldmVyeW9uZSBpbnZvbHZl
ZCBpZ25vcmVkIHRoZSBwcm9ibGVtIHNpbmNlIE1hcmNoCj4gPiAxM3RoCj4gPiAyMDI0LCBpLmUu
IGFsbW9zdCBoYWxmIGEgeWVhci4KPiA+IAo+ID4gU2VyaW91c2x5Pwo+ID4gCj4gPiBDYW4geW91
IFJJU0NWIGZvbGtzIGdldCB5b3VyIGFjdCB0b2dldGhlciBhbmQgZW5zdXJlIHRvIGZpeCB0aGlu
Z3MKPiA+IHlvdQo+ID4gYnJva2Ugb24gdGhlIHdheT8gRXNwZWNpYWxseSB3aGVuIEVtaWwgcmVw
b3J0ZWQgdGhpcyBub2JvZHkgcG9pbnRlZAo+ID4gaGltCj4gPiB0byB0aGlzIHBhdGNoIGFuZCBu
b2JvZHkgbm90aWNlZCB0aGF0IGl0J3Mgc3RpbGwgbm90IG1lcmdlZD8KPiA+IAo+ID4gSXQgdG9v
ayBtZSBsZXNzIHRoYW4gMTUgbWludXRlcyB0byBmaW5kIHRoYXQgcGF0Y2ggYW5kIHRoZQo+ID4g
Y29ycmVsYXRpb24sCj4gPiBidXQgdGhpcyBpcyBhYnNvbHV0ZWx5IG5vdCBteSBqb2IuCj4gCj4g
U29ycnksIEkgZ3Vlc3MgSSdkIGp1c3Qgc29ydCBvZiBiZWVuIGlnbm9yaW5nIHRoZSBwbGF0Zm9y
bS1zcGVjaWZpYwo+IHNpZGUgCj4gb2YgdGhpbmdzIGJlY2F1c2UgaXQncyBzbyBmcnVzdHJhdGlu
ZyB0byBkZWFsIHdpdGgsIGJ1dCB0aGF0J3MgbGVkIHRvCj4gYSAKPiBidW5jaCBvZiBicmVha2Fn
ZXMgc28gaXQncyBvYnZpb3VzbHkgdGhlIHdyb25nIHRoaW5nIHRvIGRvLgo+IAo+ID4gSSdtIHNl
cmlvdXNseSBncnVtcHkgYWJvdXQgdGhhdC4gVGhpcyBpcyBub3QgaG93IGl0IHdvcmtzLiBJZiB5
b3UKPiA+IGJyZWFrCj4gPiBzdHVmZiwgdGhlbiB5b3UgdGFrZSBjYXJlIHRvIGZpeCBpdCBiZWZv
cmUgeW91IHNob3ZlIG1vcmUgY2hhbmdlcwo+ID4gaW50bwo+ID4gdGhlIHRyZWUgYW5kIHdhc3Rl
IG15IHRpbWUuCj4gPiAKPiA+IEknbSB2ZXJ5IG11Y2ggaW5jbGluZWQgdG8gdGFrZSB0aGUgcmV2
ZXJ0cyByaWdodCBub3csIHNlbmQgdGhlbSB0bwo+ID4gTGludXMKPiA+IGZvciAtcmM1IHRhZ2dl
ZCB3aXRoIGNjOiBzdGFibGUgYW5kIGlnbm9yZS9uYWsgYW55IGlycWNoaXAgcmVsYXRlZAo+ID4g
cmlzY3YKPiA+IHBhdGNoZXMgdW50aWwgdGhlIG5leHQgbWVyZ2Ugd2luZG93IGlzIG92ZXIuCj4g
Cj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IGlm
IHlvdSB3YW50IHRvIHRha2UgdGhlIHJldmVydC4KPiAKPiBJSVVDIHRoZSBwYXRjaCBhYm92ZSBk
b2Vzbid0IGFjdHVhbGx5IGZpeCBpdCwgdGhhdCdzIHdoYXQgbGVkIHRvIGp1c3QKPiBzZW5kaW5n
IHRoZSByZXZlcnRzIC0tIGF0IGxlYXN0IHJldmVydHMgYXJlIGJldHRlciB0aGFuIGJyZWFraW5n
Cj4gdXNlcnMuwqAgCj4gSSdsbCBwb3N0IG92ZXIgdGhlcmUgdG9vLi4uCj4gCj4gQW5kIGl0J3Mg
bm8gYmlnIGRlYWwgaWYgd2UncmUgaW4gdGhlIGRvZ2hvdXNlIGZvciBhIGJpdC7CoCBSZWdyZXNz
aW9ucwo+IHNob3VsZCBnZXQgZml4ZWQgZmFzdGVyIHRoYW4gdGhpcywgc28gd2UgZGVzZXJ2ZSBp
dC4KPiAKPiBQcm9iYWJseSBhbHNvIGFub3RoZXIgc2lnbiB3ZSdyZSB3YXkgdG9vIGZvY3VzZWQg
b24gZ2V0dGluZyBuZXcKPiBmZWF0dXJlcyAKPiBtZXJnZWQsIGFzIHRoYXQncyBjb21pbmcgYXQg
dGhlIGV4cGVuc2Ugb2YgbWFraW5nIGV4aXN0aW5nIHBsYXRmb3JtcyAKPiB3b3JrLsKgIElNTyB3
ZSd2ZSBiZWVuIHdheSB0b28gZm9jdXNlZCBvbiBnZXR0aW5nIHN1cHBvcnQgZm9yIHNwZWNzCj4g
dGhhdCAKPiBkb24ndCBldmVuIGhhdmUgaW1wbGVtZW50YXRpb25zLCBhbmQgbm90IGVub3VnaCBv
biBidWlsZGluZyByZWFsCj4gd29ya2luZyAKPiBzeXN0ZW1zLgoKV2VsbCBJIHRoaW5rIGFsbCBl
eGlzdGluZyBwbGF0Zm9ybXMgYXJlIG1vcmUgb3IgbGVzcyB3ZWlyZCAoaW4Kc3BlY2lmaWNhdGlv
bi1jb21wYXRpYmlsaXR5LCBzdGFiaWxpdHksIGV0YykuIChNYXliZSBGVTU0MCBpc24ndCBzbwp3
ZWlyZCwgYnV0IGl0IGhhcyB0b28gZmV3IHBlcmlwaGVyYWxzIHRvIGJlIHJlYWxseSB1c2VmdWws
IGFuZCBpdCdzCmRpc2NvbnRpbnVlZDsgRlU3NDAgaGFzIHNvbWUgc3RhYmlsaXR5IGlzc3Vlcy4p
Cgo+IAo+ID4gRW1pbCwgY2FuIHlvdSBnaXZlIHRoYXQgc3VuNGkgZml4IGEgdGVzdCByaWRlIHBs
ZWFzZT8KPiA+IAo+ID4gVGhhbmtzLAo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoCB0Z2x4Cj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
