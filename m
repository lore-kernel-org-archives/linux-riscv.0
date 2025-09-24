Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E568ECAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 19:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmyPlYCdAjg8jytqc9UrA41aDj3hx1TH7ovTOWpr8IM=; b=TOahlc0vtzM8pW
	NN7/uZregGmmGv4tSnkk/sBwXiVPREff4HLgpRNiOqXHPXguRbGyAVtvysvmyzVYNG2G4h4T7V332
	m9MQpLwkPkWEhBzIIoVXFQLVH+kgwD3SNF0i0LQTAZRgkHQYe3gfrEkfchJVRZ5Mq+XCxa8b3HPbO
	C93hkiRpg6bj+uTCgyyu3hFnpGICpNqPimO4I9R0uDnfFSo0HvOm1HUDLoEgBZO0lu+Pfw9j1ii86
	pvlZR8Yy8fuJURnWOa4iRy0BwyH1A6Lia+0CHQ31VEc7cH/NLMKcXHQHPbN7EmfDgkR6D/pZ/CmWR
	XWmtQOXc9Bm7rsAWKkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VCO-000000035E5-3r6T;
	Wed, 24 Sep 2025 19:30:44 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VCL-000000035BU-29Ss
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 19:30:43 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250924193036euoutp02fe892bfe1ffa30ff0615e43c7584f26d~oTr74OUg32356323563euoutp02D
	for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 19:30:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250924193036euoutp02fe892bfe1ffa30ff0615e43c7584f26d~oTr74OUg32356323563euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758742236;
	bh=/Gk+JQ7pocHBfcq36N6Notv0uvwakh9CVF4aSzWJ8hw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=feWL4jvyddS/Rk6tUEFJ/d1jrrrJBbbtVkvIx0lREBNp6qbVJJBagYq/pHWTX/7dr
	 Jy9Tqwk2nl7h4GTXgG+Z5lJ71I7YLU/Y/bXia+wqA6iDqDIw88WMHgAFG45hB+WETa
	 Wk+fRSdNiGjlGnD1BkNB5oZ0FjK2jZZC5VzY2ZzI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250924193035eucas1p18bc9f48e524c3824662031da8261758e~oTr7TWTQq1522115221eucas1p1B;
	Wed, 24 Sep 2025 19:30:35 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250924193034eusmtip2cbf8bf03a89dc1fb923f25bee047d0da~oTr6PXOuQ0163201632eusmtip2W;
	Wed, 24 Sep 2025 19:30:34 +0000 (GMT)
Message-ID: <67e3a691-0ba8-4c21-97e1-4471f2a1a87c@samsung.com>
Date: Wed, 24 Sep 2025 21:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 1/7] pwm: Export `pwmchip_release` for external use
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, Benno
	Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Drew Fustini <fustini@kernel.org>, Daniel Almeida
	<daniel.almeida@collabora.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <3jxl6gpxwv376ooyny7qkeokeh7nzafttbyoehmwqzrccn5oip@747v6zdnogso>
X-CMS-MailID: 20250924193035eucas1p18bc9f48e524c3824662031da8261758e
X-Msg-Generator: CA
X-RootMTR: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
X-EPHeader: CA
X-CMS-RootMailID: 20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9
References: <20250820-rust-next-pwm-working-fan-for-sending-v14-0-df2191621429@samsung.com>
	<CGME20250820083541eucas1p2ad7d78418576b8bc8cbddd8efe83bbe9@eucas1p2.samsung.com>
	<20250820-rust-next-pwm-working-fan-for-sending-v14-1-df2191621429@samsung.com>
	<3jxl6gpxwv376ooyny7qkeokeh7nzafttbyoehmwqzrccn5oip@747v6zdnogso>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_123042_146564_65B3ED79 
X-CRM114-Status: GOOD (  17.84  )
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

CgpPbiA5LzE1LzI1IDEyOjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBPbiBXZWQsIEF1ZyAyMCwgMjAyNSBhdCAxMDozNTozNkFNICswMjAwLCBNaWNoYWwgV2lsY3p5
bnNraSB3cm90ZToKPj4gVGhlIHVwY29taW5nIFJ1c3QgYWJzdHJhY3Rpb24gbGF5ZXIgZm9yIHRo
ZSBQV00gc3Vic3lzdGVtIHVzZXMgYSBjdXN0b20KPj4gYGRldi0+cmVsZWFzZWAgaGFuZGxlciB0
byBzYWZlbHkgbWFuYWdlIHRoZSBsaWZldGltZSBvZiBpdHMgZHJpdmVyCj4+IGRhdGEuCj4+Cj4+
IFRvIHByZXZlbnQgbGVha2luZyB0aGUgbWVtb3J5IG9mIHRoZSBgc3RydWN0IHB3bV9jaGlwYCAo
YWxsb2NhdGVkIGJ5Cj4+IGBwd21jaGlwX2FsbG9jYCksIHRoaXMgY3VzdG9tIGhhbmRsZXIgbXVz
dCBhbHNvIGNhbGwgdGhlIG9yaWdpbmFsCj4+IGBwd21jaGlwX3JlbGVhc2VgIGZ1bmN0aW9uIHRv
IGNvbXBsZXRlIHRoZSBjbGVhbnVwLgo+Pgo+PiBNYWtlIGBwd21jaGlwX3JlbGVhc2VgIGEgZ2xv
YmFsLCBleHBvcnRlZCBmdW5jdGlvbiBzbyB0aGF0IGl0IGNhbiBiZQo+PiBjYWxsZWQgZnJvbSB0
aGUgUnVzdCBGRkkgYnJpZGdlLiBUaGlzIGludm9sdmVzIHJlbW92aW5nIHRoZSBgc3RhdGljYAo+
PiBrZXl3b3JkLCBhZGRpbmcgYSBwcm90b3R5cGUgdG8gdGhlIHB1YmxpYyBoZWFkZXIsIGFuZCBl
eHBvcnRpbmcgdGhlCj4+IHN5bWJvbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6
eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KPiAKPiBJIHN0aWxsIHNvbWV3aGF0IGRp
c2xpa2UgdGhpcyBwYXRjaC4gSXNuJ3QgaXQgcG9zc2libGUgdG8gbWFrZSB0aGUgcnVzdAo+IGFi
c3RyYWN0aW9uIHVzZSB0aGUgcG9pbnRlciB0aGF0IC5yZWxlYXNlIGlzIHNldCB0byB3aGVuIGl0
IGNhbGxzCj4gcHdtY2hpcF9hbGxvYygpPwoKSGkgVXdlLAoKU29ycnkgZm9yIHRoZSBkZWxheSAt
IEkgd2FzIG9uIHZhY2F0aW9uIGFuZCBJIGhvcGUgeW91IHJlY2VpdmVkIG15Cm91dCBvZiBvZmZp
Y2UgbWVzc2FnZS4KCkkgYWdyZWUgeW91ciBzdWdnZXN0aW9uIGlzIHRlY2huaWNhbGx5IGZlYXNp
YmxlLiBNeSBjb25jZXJuIHdhcyB0aGF0IGl0CndvdWxkIG1ha2UgdGhlIGFic3RyYWN0aW9uIGxl
c3MgcmVhZGFibGUgYW5kIG1vcmUgY29tcGxleCwgYXMgaXQgd291bGQKcmVxdWlyZSB0aGUgRkZJ
IHdyYXBwZXIgdG8gcmVhZCB0aGUgQyBmdW5jdGlvbiBwb2ludGVyIGFuZCBzdG9yZSBpdCBhcwpz
dGF0ZSB3aXRoaW4gdGhlIGRyaXZlcidzIHByaXZhdGUgZGF0YS4KClRoZSBjdXJyZW50IGFwcHJv
YWNoIG9mIGNhbGxpbmcgYSBrbm93biwgZXhwb3J0ZWQgZnVuY3Rpb24gZmVsdCBtb3JlCmRpcmVj
dC4gSG93ZXZlciwgSSBhYnNvbHV0ZWx5IGFncmVlIHdpdGggeW91ciBwb2ludCBvbiBDIEFQSSBw
dXJpdHkgYW5kLAphcyB5b3Ugc3VnZ2VzdGVkLCB0aGlzIGNhbiBiZSByZXZpc2l0ZWQgbGF0ZXIg
aWYgbmVlZGVkLgoKPiAKPiAoSSB3b3VsZG4ndCBmdXJ0aGVyIGRlbGF5IHRoaXMgc2VyaWVzIGZv
ciB0aGlzIGRpc2N1c3Npb24sIHRoaXMgY2FuIGJlCj4gaGFuZGxlZCBqdXN0IGZpbmUgYXQgYSBs
YXRlciBwb2ludCBpbiB0aW1lLikKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCkJlc3QgcmVnYXJk
cywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
