Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B72C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciZsZ3wQ4vlG7LdnFReVOMtbGvIrmUmUNMfS0qaDjJM=; b=GEha4udkGPs8yN
	r0CInT4CrcRvIet+8Qbd9Cclr/X1qHsuz779s+Bbm/GCZNPI+ZyQctqm5zcDpV4imPW4szWvJZNui
	OxZ6JM40uw6YvYZqoNJ8U9TQex1xXcB8dBGELWPg6vcDqIfRX4DdzYXaI2kSFF8alDP94Ki9F3I8N
	z5/004nAetLvXQaJ2FIGlnKJmYuYxSKRMgdmGjoa5Euh17zRFOKT8AlnpUHxwYAaRaiMsFs1Q+4g8
	lzcS6eE5lZuR4u1flN0EjO8FAbbEAJAriWz1whbpBlScIPiyFCSQxkQDw4gxN6Hd8B1zGx3tgrQ7A
	lYM11EKnZUnqGzY+0x/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWjD-00000004Tog-3aAX;
	Tue, 01 Jul 2025 08:52:36 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWIX-00000004PPv-2vrD
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 08:25:04 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250701082456euoutp020eee5041c25873921636764fabca0529~OExd1UxmI2192621926euoutp02q
	for <linux-riscv@lists.infradead.org>; Tue,  1 Jul 2025 08:24:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250701082456euoutp020eee5041c25873921636764fabca0529~OExd1UxmI2192621926euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751358296;
	bh=KfdpUFAVhAyxGqE9eLEIBkkqrEYX2W0imprAxbQivkU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=PwQsOHJXGkU9mixvHQse3EYengfFoqHmA30yZ29Nwz9nTmg5Vjvv3Mjnkdj2yQTO+
	 HA7ti9PjBheHdgVw6q3trtWTW6m0QWrOBK8uQ0cUBq4yTUAK1j2qGYkWFUG+eAtdKk
	 Zd1cwp+uPNs5SfmyqgTwNswNIlSbQiMFzoMmeoPY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250701082456eucas1p27ac527ab6df65b4ad24af9f1936ee772~OExdUXUK-0564305643eucas1p2z;
	Tue,  1 Jul 2025 08:24:56 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250701082454eusmtip179c87208d9c76abee9ff0a1bd9cb19a6~OExcL0hDa2415924159eusmtip1p;
	Tue,  1 Jul 2025 08:24:54 +0000 (GMT)
Message-ID: <ca58f110-7f9a-427d-b018-e514cf34adaf@samsung.com>
Date: Tue, 1 Jul 2025 10:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
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
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <n5zfbzu3hn7kqdf3xc7orpeovvdprc2xlf7w3f62uoohkxdk5c@cc24urt5xf36>
X-CMS-MailID: 20250701082456eucas1p27ac527ab6df65b4ad24af9f1936ee772
X-Msg-Generator: CA
X-RootMTR: 20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5
X-EPHeader: CA
X-CMS-RootMailID: 20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
	<CGME20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5@eucas1p1.samsung.com>
	<20250623-rust-next-pwm-working-fan-for-sending-v5-1-0ca23747c23e@samsung.com>
	<q7sz7uci5vnyc24laqzs56vgt4i2jamb3ifyxkqom6qcml5kkv@642prvwxjkxc>
	<c127e368-8c1f-4299-b222-a105940ac34e@samsung.com>
	<1450a457-4bd3-4e9c-a74f-3be15c9ec84f@samsung.com>
	<n5zfbzu3hn7kqdf3xc7orpeovvdprc2xlf7w3f62uoohkxdk5c@cc24urt5xf36>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_012502_308134_11CDBA2A 
X-CRM114-Status: GOOD (  13.51  )
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

CgpPbiA2LzI5LzI1IDEyOjI5LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBPbiBTYXQsIEp1
biAyOCwgMjAyNSBhdCAwOTo0NzoxOVBNICswMjAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToK
Cj4+Pj4+ICsgICAgLy8vIFNldHMgdGhlIHBvbGFyaXR5IG9mIHRoZSBQV00gc2lnbmFsLgo+Pj4+
PiArICAgIHB1YiBmbiBzZXRfcG9sYXJpdHkoJm11dCBzZWxmLCBwb2xhcml0eTogUG9sYXJpdHkp
IHsKPj4+Pj4gKyAgICAgICAgc2VsZi4wLnBvbGFyaXR5ID0gcG9sYXJpdHkuaW50bygpOwo+Pj4+
PiArICAgIH0KPj4+Pgo+Pj4+IFBsZWFzZSBkb24ndCBleHBvc2UgdGhlc2Ugbm9uLWF0b21pYyBj
YWxsYmFja3MuIHB3bV9kaXNhYmxlKCkgd291bGQgYmUKPj4+PiBmaW5lLgo+Pgo+PiBIbW0sIEkn
dmUganVzdCByZWFsaXplZCB0aGF0IHdpdGhvdXQgdGhvc2Ugc2V0dGVycyBpdCB3b3VsZCBtb3N0
IGxpa2VseQo+PiBpbXBvc3NpYmxlIHRvIGNvcnJlY3RseSBpbXBsZW1lbnQgdGhlIGdldF9zdGF0
ZSBjYWxsYmFjay4KPiAKPiBZb3Ugc2hvdWxkbid0IGltcGxlbWVudCB0aGUgZ2V0X3N0YXRlIGNh
bGxiYWNrIGZvciBhIHdhdmVmb3JtIGRyaXZlci4KCllvdSdyZSByaWdodCB0aGF0IGEgbmV3IGRy
aXZlciB1c2luZyB0aGUgd2F2ZWZvcm0gQVBJIHNob3VsZG4ndAppbXBsZW1lbnQgLmdldF9zdGF0
ZS4KCk15IGdvYWwgZm9yIHRoZSBhYnN0cmFjdGlvbiBsYXllciwgaG93ZXZlciwgaXMgdG8gYmUg
ZmxleGlibGUgZW5vdWdoIHRvCnN1cHBvcnQgd3JpdGluZyBib3RoIG1vZGVybiB3YXZlZm9ybSBk
cml2ZXJzIGFuZCBsZWdhY3kgc3R5bGUgZHJpdmVycwp0aGF0IHVzZSB0aGUgLmFwcGx5IGFuZCAu
Z2V0X3N0YXRlIGNhbGxiYWNrcy4KClRvIGltcGxlbWVudCB0aGUgLmdldF9zdGF0ZSBjYWxsYmFj
aywgYSBkcml2ZXIgbmVlZHMgdGhlIGFiaWxpdHkgdG8KY29uc3RydWN0IGEgU3RhdGUgc3RydWN0
IGFuZCBwb3B1bGF0ZSBpdHMgZmllbGRzIGZyb20gaGFyZHdhcmUgdmFsdWVzCmJlZm9yZSByZXR1
cm5pbmcgaXQgdG8gdGhlIFBXTSBjb3JlLiBXaXRob3V0IHRoaXMgYWJpbGl0eSB0aGVyZSBpcyBu
bwp3YXkgdG8gaW1wbGVtZW50IGdldF9zdGF0ZSBjYWxsYmFjay4KCkkgdGhpbmsgdGhlIGNsZWFu
ZXIgd2F5LCB3aXRob3V0IHRoZSBzZXR0ZXJzIHdvdWxkIGJlIHRvIHVwZGF0ZSB0aGUKYG5ld2Ag
bGlrZSBzbzoKICAgIHB1YiBmbiBuZXcoCiAgICAgICAgcGVyaW9kOiB1NjQsCiAgICAgICAgZHV0
eV9jeWNsZTogdTY0LAogICAgICAgIHBvbGFyaXR5OiBQb2xhcml0eSwKICAgICAgICBlbmFibGVk
OiBib29sLAogICAgICAgIHVzYWdlX3Bvd2VyOiBib29sLAogICAgKSAtPiBTZWxmIHsKICAgICAg
ICBsZXQgcmF3X2Nfc3RhdGUgPSBiaW5kaW5nczo6cHdtX3N0YXRlIHsKICAgICAgICAgICAgcGVy
aW9kLAogICAgICAgICAgICBkdXR5X2N5Y2xlLAogICAgICAgICAgICBwb2xhcml0eTogcG9sYXJp
dHkuaW50bygpLAogICAgICAgICAgICBlbmFibGVkLAogICAgICAgICAgICB1c2FnZV9wb3dlciwK
ICAgICAgICB9OwoKICAgICAgICBTdGF0ZShyYXdfY19zdGF0ZSkKICAgIH0KClRoaXMgd2F5IHRo
ZSBnZXRfc3RhdGUgY2FsbGJhY2sgd291bGQgYmUgcmVzcG9uc2libGUgZm9yIGNyZWF0aW5nIG5l
dwpzdGF0ZSBhbmQgaW5pdGlhbGl6aW5nIGl0LCBpbnN0ZWFkIG9mIHBhc3NpbmcgdGhlIG11dGFi
bGUgU3RhdGUgdG8KZ2V0X3N0YXRlLgoKCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCgpCZXN0IHJl
Z2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
