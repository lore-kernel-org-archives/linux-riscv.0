Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA6DCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAyHKBmESmm3BFcBadYHMrN1GnPEKH8oEZaVQumgoEM=; b=nIQFRWKkz0kxcU
	GDpdKJM445o8Z2spthCzzJWA0ogVpQ3ytraT9lIQ7XqtUlCaOI3rnd5cADQYIvyq8mYFu+o+3Fic1
	9hkOyePp+3Fe4JTJnfr/YtdOPCMBAoJy6Wo9cI/fZHDiPOhSpmTKSKS7G/zvwMmERKoyIKdMSimBh
	pQ3YLu8dxf8GwTjqegBCxrfFdDPZCQeyZpLJWXfeSgSsHHyVqFdH7VlL+MY+eYNdtDtfjqtAdX/0M
	cJ9PnCK8elxK4cMzq2CM6eKJEVoVRmyyJfd4VP3Vy3ga5TqiyXzUY0BhpQ81r9rZwFRzeiad5z9q3
	gvx9rR9N9g8mcsJX0iIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE41y-00000000tey-0fuV;
	Wed, 29 Oct 2025 11:07:54 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE41v-00000000tcd-0djX
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:07:53 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251029110744euoutp01ae169989e34f0e49f5c16b99040f297a~y8Z3cfiPJ1502815028euoutp01E
	for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 11:07:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251029110744euoutp01ae169989e34f0e49f5c16b99040f297a~y8Z3cfiPJ1502815028euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761736064;
	bh=lPkyz42wIiMyZmus3DHo3oNI5NGGYmhnJqmDuHgt9uk=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YpDVt42i6ENE90ifkPIK8ff7mUWGpAs48GVM277YEUpoZdL0YMzvdGQlg7soPU+ee
	 I3u7UjbsCTWJYGcObN4COCMicvvRC/pdHqUUE66u6Y85gah/knLAPkzS9ghrGTF3m3
	 +5DAIIXEouCH3JTqnFtJzw5Xi3WcKuGw1kKf3lIs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029110744eucas1p2f95c4c628e2ff2b2366972eda79aa4c0~y8Z3GEnOl2119121191eucas1p2v;
	Wed, 29 Oct 2025 11:07:44 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251029110743eusmtip2db58b6b7ea6eca6ca55bb0d62e38368f~y8Z2VSdww0319503195eusmtip2j;
	Wed, 29 Oct 2025 11:07:43 +0000 (GMT)
Message-ID: <df1827bd-628b-424f-80a6-63cea6bf7a39@samsung.com>
Date: Wed, 29 Oct 2025 12:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Introduce import_ns support for Rust
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
	<dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Stephen Rothwell
	<sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
X-CMS-MailID: 20251029110744eucas1p2f95c4c628e2ff2b2366972eda79aa4c0
X-Msg-Generator: CA
X-RootMTR: 20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5
X-EPHeader: CA
X-CMS-RootMailID: 20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5
References: <CGME20251028122315eucas1p159b65037cf6f3f710c1917e2464399b5@eucas1p1.samsung.com>
	<20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
	<2dedlnknikkrwg5f6ocuvjrogdjuqyg4sg6zkkao4w4yyvvsje@dkt7rco3fen3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_040751_774969_DD7AC45D 
X-CRM114-Status: GOOD (  23.05  )
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

CgpPbiAxMC8yOS8yNSAxMTowNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gVHVlLCBPY3QgMjgsIDIwMjUgYXQgMDE6MjI6MzFQTSArMDEwMCwgTWljaGFsIFdpbGN6
eW5za2kgd3JvdGU6Cj4+IFRoaXMgc2VyaWVzIGFkZHJlc3NlcyBidWlsZCB3YXJuaW5ncyByZXBv
cnRlZCBieSBgbW9kcG9zdGAgZm9yIHRoZSBSdXN0Cj4+IFBXTSBkcml2ZXIgKGBwd21fdGgxNTIw
YCkgaW4gbGludXgtbmV4dDoKPj4KPj4gV0FSTklORzogbW9kcG9zdDogbW9kdWxlIHB3bV90aDE1
MjAgdXNlcyBzeW1ib2wgcHdtY2hpcF9yZWxlYXNlIGZyb20KPj4gbmFtZXNwYWNlIFBXTSwgYnV0
IGRvZXMgbm90IGltcG9ydCBpdC4KPj4KPj4gVGhlc2Ugd2FybmluZ3Mgb2NjdXIgYmVjYXVzZSBS
dXN0IG1vZHVsZXMsIGxpa2UgQyBtb2R1bGVzLCBuZWVkIHRvCj4+IGRlY2xhcmUgdGhlaXIgZGVw
ZW5kZW5jaWVzIG9uIEMgc3ltYm9scyBleHBvcnRlZCB0byBzcGVjaWZpYyBuYW1lc3BhY2VzCj4+
ICh1c2luZyBgRVhQT1JUX1NZTUJPTF9OU2AgaW4gQykuIFRoaXMgaXMgZG9uZSBieSBlbWJlZGRp
bmcKPj4gImltcG9ydF9ucz08TkFNRVNQQUNFPiIgdGFncyBpbnRvIHRoZSBtb2R1bGUncyBgLm1v
ZGluZm9gIHNlY3Rpb24sIHdoaWNoCj4+IGBtb2Rwb3N0YCB2ZXJpZmllcy4gIFRoZSBDIG1hY3Jv
IGBNT0RVTEVfSU1QT1JUX05TKClgIGhhbmRsZXMgdGhpcywgYnV0Cj4+IHRoZSBSdXN0IGBtb2R1
bGUhYCBtYWNybyBsYWNrZWQgZXF1aXZhbGVudCBmdW5jdGlvbmFsaXR5Lgo+Pgo+PiBUaGlzIHNl
cmllcyBpbnRyb2R1Y2VzIHRoZSBuZWNlc3Nhcnkgc3VwcG9ydDoKPj4KPj4gUGF0Y2ggMSBleHRl
bmRzIHRoZSBjb3JlIGBtb2R1bGUhYCBtYWNybyBpbiBgcnVzdC9tYWNyb3MvbW9kdWxlLnJzYAo+
PiB0byBwYXJzZSBhbiBvcHRpb25hbCBgaW1wb3J0c19uczogWy4uLl1gIGZpZWxkIGFuZCBnZW5l
cmF0ZSB0aGUgcmVxdWlyZWQKPj4gYGltcG9ydF9uc2AgdGFncyBpbiB0aGUgYC5tb2RpbmZvYCBz
ZWN0aW9uLgo+Pgo+PiBQYXRjaCAyIGFkZHMgYSBjb252ZW5pZW5jZSBtYWNybyBgbW9kdWxlX3B3
bV9wbGF0Zm9ybV9kcml2ZXIhYCB0bwo+PiBgcnVzdC9rZXJuZWwvcHdtLnJzYC4gVGhpcyBtYWNy
byB3cmFwcyB0aGUgc3RhbmRhcmQKPj4gYG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIhYCBhbmQgYXV0
b21hdGljYWxseSBhZGRzIGBpbXBvcnRzX25zOiBbIlBXTSJdYCwKPj4gc2ltcGxpZnlpbmcgbW9k
dWxlIGRlY2xhcmF0aW9uIGZvciBQV00gZHJpdmVyIGF1dGhvcnMuCj4+Cj4+IFBhdGNoIDMgdXBk
YXRlcyB0aGUgYHB3bV90aDE1MjBgIGRyaXZlciB0byB1c2UgdGhlIG5ldyBoZWxwZXIgbWFjcm8s
Cj4+IGZpeGluZyB0aGUgYnVpbGQgd2FybmluZ3MuCj4gCj4gR2l2ZW4gdGhhdCBmb3Igbm93IHRo
ZSBwd21fdGgxNTIwIGRyaXZlciBpcyB0aGUgb25seSB1c2VyLCBkb2VzIGl0IG1ha2UKPiBzZW5z
ZSB0byBtZXJnZSB0aGlzIHNlcmllcyB2aWEgbXkgcHdtIHRyZWU/IElmIGl0IGdvZXMgdmlhIGEg
ZGlmZmVyZW50Cj4gdHJlZSwgSSdkIGxpa2UgdG8gaGF2ZSBhIHRhZyB0byBtZXJnZSBpbnRvIG15
IHRyZWUgdG8gaGFuZCBvdmVyIGNvZGUKPiB3aGljaCBpcyBmcmVlIG9mIHdhcm5pbmdzIHRvIExp
bnVzIGluIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4KCkhpLAoKSSBhZ3JlZSB3aXRoIHlvdS4gSG9w
ZWZ1bGx5IHdlIGNhbiBnZXQgYW4gYWNrIGZyb20gdGhlIFJ1c3QgbWFpbnRhaW5lcnMKYW5kIHRo
ZSBzZXJpZXMgY2FuIGdvIHRocm91Z2ggeW91ciB0cmVlLgoKPiAKPj4gUGF0Y2ggNCBpbmNsdWRl
cyBhIG1pbm9yIGNsaXBweSBzdHlsZSBmaXggZm9yIHRoZSBgcHdtX3RoMTUyMGAgZHJpdmVyLgo+
IAo+IElmIHlvdSBjb3VsZCBtZW50aW9uIHRoZSBjb21tYW5kIHRoYXQgbWFrZXMgdGhpcyB3YXJu
aW5nIHZpc2libGUsIEknZCBiZQo+IGdsYWQgdG8gYWRkIHRoYXQgdG8gbXkgcmVwZXJ0b2lyZSBv
ZiBidWlsZCBjaGVja3MuCgpJJ20gdXNpbmcgdGhlIGZvbGxvd2luZyBjb21tYW5kIHRvIGNvbXBp
bGUgdGhlIGtlcm5lbDoKJCBtYWtlIEFSQ0g9cmlzY3YgLWoyMCBMTFZNPTEgQ0xJUFBZPTEKCkkg
Z3Vlc3MgeW91IHdlcmUgbWlzc2luZyB0aGUgJ0NMSVBQWT0xJyBwYXJ0LgoKPiAKPiBUaGFua3Mg
Zm9yIGFkZHJlc3NpbmcgdGhlIGlzc3VlCj4gVXdlCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwg
V2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
