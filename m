Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A46C83F1D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUSrEA/TWafV9abeOobNYLj9mh7R6NE7p9Q7oRxGNKg=; b=oJANEVOzPmNKYH
	mrm5nkyxNX4VWenuRApBiUFknt0lZvXtRlD03Kmu3pJRmsuwJWlvbpF+FOw4lizvxosy8qkM6/4Z4
	8P7fSfDv855SIUtrQH+orHNEmIlE9CS+11in8CSmNeOwxDQyOYFZF/uQMRDAIBJyz1qR/1bgT8hwN
	GGZo15nAQtWrEXafRxOeO3LJ69qeYO6glGTygAutswdI6FMwAhUPdjHFMTpq+PfUsJcVJkqVh8wya
	V3tyW19WRD46R3r/hfv+Oc1Rlj2hTdEB0XbzPeLVXry81iiCv58gjrwVqr/LcyoUlhwmYr3YN+yVq
	UWv+8N8wHXeJVRAhu+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAfF-0000000ERRk-38jA;
	Fri, 11 Jul 2025 10:07:33 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaA0U-0000000EIWm-3z6y
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 09:25:30 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250711092520euoutp021e21d0af9558a7733d187c68b67c633f~RKDDt2CUq1741617416euoutp02z
	for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 09:25:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250711092520euoutp021e21d0af9558a7733d187c68b67c633f~RKDDt2CUq1741617416euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752225920;
	bh=HzPkVcD7EBpLB077YuBkrkHkCg7R8v/lMTm610TXX5M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=lofho167lt5+OYJKtBe7YUJJ6Lp8NKwqQQRQ7gDsuC9W+lVy6exTq5fHdfWYhe22o
	 vEyaZAuzdXF8zK35Ok8wiQ6GXPvEe3pOz7xS/3yD6eQjEVnIw9Y9fMfMKUsSta1ehf
	 RtER64Nyp3VUGFlwOF8ft24Iy/Ad9RidLep8Ptjg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250711092520eucas1p2c27be54c048556b3ce54242ab3d228e4~RKDDMne5X0267102671eucas1p2P;
	Fri, 11 Jul 2025 09:25:20 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250711092518eusmtip1c7e57196a1c1e0613b9ecfbad261718a~RKDCD2bkB3095630956eusmtip1K;
	Fri, 11 Jul 2025 09:25:18 +0000 (GMT)
Message-ID: <e6d85387-b46e-4e4f-90a3-f60a800f1c2e@samsung.com>
Date: Fri, 11 Jul 2025 11:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] pwm: Export `pwmchip_release` for external use
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini
	<drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob
	Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
	Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <tepvopkizn4jezpqcbhwrcsnsrjacztv6kuv53hidcjbrnrs3c@pfcp45jarcoy>
X-CMS-MailID: 20250711092520eucas1p2c27be54c048556b3ce54242ab3d228e4
X-Msg-Generator: CA
X-RootMTR: 20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6
X-EPHeader: CA
X-CMS-RootMailID: 20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6
References: <20250710-rust-next-pwm-working-fan-for-sending-v11-0-93824a16f9ec@samsung.com>
	<CGME20250710185439eucas1p2684255d83d807dfd6f8b9b3caea65df6@eucas1p2.samsung.com>
	<20250710-rust-next-pwm-working-fan-for-sending-v11-1-93824a16f9ec@samsung.com>
	<tepvopkizn4jezpqcbhwrcsnsrjacztv6kuv53hidcjbrnrs3c@pfcp45jarcoy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_022527_577337_F4B64EFB 
X-CRM114-Status: GOOD (  19.63  )
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

CgpPbiA3LzEwLzI1IDIyOjUyLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBNaWNo
YWwsCj4gCj4gT24gVGh1LCBKdWwgMTAsIDIwMjUgYXQgMDg6NTQ6MjhQTSArMDIwMCwgTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3B3bS5oIGIv
aW5jbHVkZS9saW51eC9wd20uaAo+PiBpbmRleCA4Y2FmYzQ4M2RiNTNhZGRmOTU1OTFkMWFjNzQy
ODc1MzJjMGZhMGVlLi44ZjA2OThjMDllNjJiODkzZDYzZmMyNThkYTNjMzQ3ODExODMwNTZmIDEw
MDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3B3bS5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgv
cHdtLmgKPj4gQEAgLTQ3OCw2ICs0NzgsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgcHdtX21pZ2h0
X3NsZWVwKHN0cnVjdCBwd21fZGV2aWNlICpwd20pCj4+ICAKPj4gIC8qIFBXTSBwcm92aWRlciBB
UElzICovCj4+ICB2b2lkIHB3bWNoaXBfcHV0KHN0cnVjdCBwd21fY2hpcCAqY2hpcCk7Cj4+ICt2
b2lkIHB3bWNoaXBfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpOwo+IAo+IEkgd2FudCB0aGlz
IGluIGEgc2VwYXJhdGUgc2VjdGlvbiBiZWNhdXNlICJub3JtYWwiIHByb3ZpZGVyIGRvbid0IG5l
ZWQKPiB0aGF0LiBQbGVhc2UgYWRkIGEgY29tbWVudCB0aGF0IHRoaXMgaXMgb25seSBwdWJsaWMg
Zm9yIHRlY2huaWNhbAo+IHJlYXNvbnMgZm9yIHRoZSBSdXN0IHdyYXBwZXJzLgoKT0ssIHRoYW5r
cyAhCgo+IAo+IEkgdW5kZXJzdGFuZCB5b3UgYXJlIGVhZ2VyIHRvIGdldCB0aGlzIG1lcmdlZCwg
YnV0IHN0aWxsIEknZCBhc2sgeW91IHRvCj4gc2xvdyBkb3duIHlvdXIgcGF0Y2ggc2VuZGluZyBm
cmVxdWVuY3kuIEN1cnJlbnRseSBJIHRlbmQgdG8gbm90IGFwcGx5IGl0Cj4gZm9yIHY2LjE3LXJj
MSBhcyBJJ2QgbGlrZSB0byBoYXZlIHRoYXQgaW4gbmV4dCBmb3Igc29tZSB0aW1lLgoKVGhhbmsg
eW91IGZvciB0aGUgZmVlZGJhY2suIEFsbCBvZiB5b3VyIHBvaW50cyBtYWtlIHBlcmZlY3Qgc2Vu
c2UuCgpNeSBhcG9sb2dpZXMgZm9yIHRoZSByYXBpZCBwYWNlIG9mIHN1Ym1pc3Npb25zOyBJIHdp
bGwgZm9sbG93IHlvdXIKc3VnZ2VzdGlvbiBhbmQgYmUgc3VyZSB0byBhbGxvdyBtb3JlIHRpbWUg
Zm9yIGRpc2N1c3Npb24gYmV0d2VlbiBmdXR1cmUKdmVyc2lvbnMuCgo+IAo+IFdpdGggeW91IHdh
aXRpbmcgYSBiaXQgbG9uZ2VyIGJlZm9yZSB2MTEgSSB3b3VsZCBoYXZlIHdyaXR0ZW4gdGhhdCBp
bgo+IHJlcGx5IHRvIHRoZSBleHBsYW5hdGlvbiBpbiB0aGUgdjEwIHRocmVhZCBhbmQgd2UgbWln
aHQgaGF2ZSBzYXZlZAo+IG9uZSBpdGVyYXRpb24gLi4uCj4gCj4+ICBzdHJ1Y3QgcHdtX2NoaXAg
KnB3bWNoaXBfYWxsb2Moc3RydWN0IGRldmljZSAqcGFyZW50LCB1bnNpZ25lZCBpbnQgbnB3bSwg
c2l6ZV90IHNpemVvZl9wcml2KTsKPj4gIHN0cnVjdCBwd21fY2hpcCAqZGV2bV9wd21jaGlwX2Fs
bG9jKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgdW5zaWduZWQgaW50IG5wd20sIHNpemVfdCBzaXpl
b2ZfcHJpdik7Cj4+ICAKPj4gQEAgLTU1MSw2ICs1NTIsMTAgQEAgc3RhdGljIGlubGluZSB2b2lk
IHB3bWNoaXBfcHV0KHN0cnVjdCBwd21fY2hpcCAqY2hpcCkKPj4gIHsKPj4gIH0KPj4gIAo+PiAr
c3RhdGljIGlubGluZSB2b2lkIHB3bWNoaXBfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+
ICt7Cj4+ICt9Cj4+ICsKPiAKPiBJcyB0aGlzIG5lZWRlZD8gVGhlcmUgaXMgbm8gdXNlciBvZiB0
aGlzIGZ1bmN0aW9uIHRoYXQgZG9lc24ndCBkZXBlbmQKPiBvbiBDT05GSUdfUFdNPyEKClNpbmNl
IG9ubHkgUnVzdCBpcyB1c2luZyB0aGlzIGl0J3Mgbm90IG5lZWRlZC4gVGhhbmtzICEKCj4gCj4+
ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBwd21fY2hpcCAqcHdtY2hpcF9hbGxvYyhzdHJ1Y3QgZGV2
aWNlICpwYXJlbnQsCj4+ICAJCQkJCSAgICAgdW5zaWduZWQgaW50IG5wd20sCj4+ICAJCQkJCSAg
ICAgc2l6ZV90IHNpemVvZl9wcml2KQo+Pgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKQmVzdCBy
ZWdhcmRzLAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
