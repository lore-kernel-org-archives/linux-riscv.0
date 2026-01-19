Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEB0D2ECEC
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE/1cyRtKRpmM+SuvYpL9k/sUcZgru62U0mddm5zsXQ=; b=UzDiQ7eOlBFb23
	b4ufutkffemtliV+4O/pmc0745j9DSC4cTP/eXOoiKHBilWQz4L7FLFvzBoMVOvw9RCB4vHtgvAmz
	dhEGjHLiGh94js57nJvAMBAjyV6mtXltXq78MxVkPXX/0zLZD3FL2+Fo6/UEyQRErB15zXoItlXdV
	gkMz9+hAd6EF6+tzNF6IdJV3v+pxKq6kbNUeeyH4yHgY8rdOC7DzWKsijlO4LVa7dVcHvEgWml2VI
	O8Fvb7QlYZq8UESyXuJEcsGghr7mMn/aalVvANzzBTuTyWyfNWKBsv+9fhzYp3VcNYG5J1w5Q+PwL
	yNQKvUNHT1H6GhCgmUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx71-00000002uxq-3jJy;
	Mon, 19 Jan 2026 21:48:39 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhx6w-00000002uxI-3Ttx
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 21:48:36 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260119214832euoutp015d31052b2108f6c9b74563da2db96d30~MQCxenNmZ1258012580euoutp01B
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 21:48:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260119214832euoutp015d31052b2108f6c9b74563da2db96d30~MQCxenNmZ1258012580euoutp01B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1768859313;
	bh=cCm71GD0cs8rUf+b/+Yue313FKPYNV9mxHzm/pCITyE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=rEXc5uaAZUh3C4E0l7XA5sknffFZQjzYlguMbXAt4FInYJTkNIsMIf60gIZ6IBAOI
	 zh63b2PoDfQx2/vpg8EGR2AHwCoGY9pE+U5QtDabBQRyrcbyqMLo5QOXenS2MC0lOT
	 NQ0lVGrnoa68zCzgy4AQYCibXu68ADOWVLnVBGdk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260119214832eucas1p167fdf88f95104f679bcddca93e2042e5~MQCw7jTSn1492514925eucas1p1m;
	Mon, 19 Jan 2026 21:48:32 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260119214831eusmtip14c7fc135b79501a10d3681c98444622b~MQCwEMDUo1429314293eusmtip1f;
	Mon, 19 Jan 2026 21:48:31 +0000 (GMT)
Message-ID: <2cdba52f-9bec-4550-912f-d61c58e2852a@samsung.com>
Date: Mon, 19 Jan 2026 22:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Tamir
	Duberstein <tamird@gmail.com>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
X-CMS-MailID: 20260119214832eucas1p167fdf88f95104f679bcddca93e2042e5
X-Msg-Generator: CA
X-RootMTR: 20260119165319eucas1p23ae598d689d6a25d631f7c74368156d7
X-EPHeader: CA
X-CMS-RootMailID: 20260119165319eucas1p23ae598d689d6a25d631f7c74368156d7
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
	<CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
	<CGME20260119165319eucas1p23ae598d689d6a25d631f7c74368156d7@eucas1p2.samsung.com>
	<2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_134835_135615_FD36D3E2 
X-CRM114-Status: GOOD (  14.40  )
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

CgpPbiAxLzE5LzI2IDE3OjUzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBPbiBTYXQsIEphbiAwMywgMjAyNiBhdCAwOTozMDozMVBNIC0wNTAwLCBUYW1pciBEdWJlcnN0
ZWluIHdyb3RlOgo+PiBPbiBNb24sIERlYyAyMiwgMjAyNSBhdCA3OjI04oCvQU0gVGFtaXIgRHVi
ZXJzdGVpbiA8dGFtaXJkQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IEZyb206IFRhbWlyIER1
YmVyc3RlaW4gPHRhbWlyZEBnbWFpbC5jb20+Cj4+Pgo+Pj4gQy1TdHJpbmcgbGl0ZXJhbHMgd2Vy
ZSBhZGRlZCBpbiBSdXN0IDEuNzcuIFJlcGxhY2UgaW5zdGFuY2VzIG9mCj4+PiBga2VybmVsOjpj
X3N0ciFgIHdpdGggQy1TdHJpbmcgbGl0ZXJhbHMgd2hlcmUgcG9zc2libGUuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJkQGdtYWlsLmNvbT4KPj4+IC0tLQo+
Pj4gIGRyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMgfCAzICstLQo+Pj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wd20vcHdtX3RoMTUyMC5ycyBiL2RyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMKPj4+IGlu
ZGV4IGUzYjdlNzczNTZmYy4uOGFlOGY4NTJlYzAyIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9w
d20vcHdtX3RoMTUyMC5ycwo+Pj4gKysrIGIvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycwo+Pj4g
QEAgLTIyLDcgKzIyLDYgQEAKPj4+Cj4+PiAgdXNlIGNvcmU6Om9wczo6RGVyZWY7Cj4+PiAgdXNl
IGtlcm5lbDo6ewo+Pj4gLSAgICBjX3N0ciwKPj4+ICAgICAgY2xrOjpDbGssCj4+PiAgICAgIGRl
dmljZTo6e0JvdW5kLCBDb3JlLCBEZXZpY2V9LAo+Pj4gICAgICBkZXZyZXMsCj4+PiBAQCAtMzI3
LDcgKzMyNiw3IEBAIGZuIGRyb3Aoc2VsZjogUGluPCZtdXQgU2VsZj4pIHsKPj4+ICAgICAgT0Zf
VEFCTEUsCj4+PiAgICAgIE1PRFVMRV9PRl9UQUJMRSwKPj4+ICAgICAgPFRoMTUyMFB3bVBsYXRm
b3JtRHJpdmVyIGFzIHBsYXRmb3JtOjpEcml2ZXI+OjpJZEluZm8sCj4+PiAtICAgIFsob2Y6OkRl
dmljZUlkOjpuZXcoY19zdHIhKCJ0aGVhZCx0aDE1MjAtcHdtIikpLCAoKSldCj4+PiArICAgIFso
b2Y6OkRldmljZUlkOjpuZXcoYyJ0aGVhZCx0aDE1MjAtcHdtIiksICgpKV0KPj4+ICApOwo+Pj4K
Pj4+ICBpbXBsIHBsYXRmb3JtOjpEcml2ZXIgZm9yIFRoMTUyMFB3bVBsYXRmb3JtRHJpdmVyIHsK
Pj4+Cj4+PiAtLS0KPj4+IGJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhk
MGQwNDAyN2NiMWU4Cj4+PiBjaGFuZ2UtaWQ6IDIwMjUxMjIyLWNzdHItcHdtLWM5YjlhNDcwMTE1
Nwo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IC0tCj4+PiBUYW1pciBEdWJlcnN0ZWluIDx0YW1p
cmRAZ21haWwuY29tPgo+Pj4KPj4KPj4gQFV3ZSBjb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBsb29r
Pwo+IAo+IEkgZGlkLCBidXQgZ2l2ZW4gSSdtIG1vcmUgb3IgbGVzcyBydXN0IGlsbGl0ZXJhdGUg
SSB3b3VsZCB3ZWxjb21lCj4gZmVlZGJhY2sgYnkgTWljaGFsIFdpbGN6eW5za2kuIEkgb25seSBu
b3cgbm90aWNlIHRoYXQgaGUgd2Fzbid0IG9uIENjOgo+IHVwIHRvIG5vdy4KPiAKPiBCZXN0IHJl
Z2FyZHMKPiBVd2UKCkkgdGhpbmsgdGhlIHBhdGNoIGlzIGNvcnJlY3QuIFRoYW5rcyAhCgpSZXZp
ZXdlZC1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
