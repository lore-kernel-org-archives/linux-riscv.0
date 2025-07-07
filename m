Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6022CC83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOHu/ctI7BUnJVF+MNzty8PA5oh/d+Jn7qqiMEoN7KI=; b=v/mDUuoV9f6b7e
	9XkDqsjX/qqSdpxojeBaBilbYYkP+hj8fLwC5hMLe4/STmQCLPV5JvRR9yr+vxflxNe5ZA3UHQVr+
	vWxq3qP06cTwM8WkV+JMtcMxHKi0eRB26w/9MqAEO33PeDLbgP+bVj0gw+JJUI6NXq9l5/c4WAHIz
	3//wqk13NUvDuahlXBPEJfAbMuVEUw6m33RfY98hZaui1n01joYvE260M2srB48ptlhOxJcU/pmzh
	1t2/NYQk35N1G/zhFtFaGrwy9zTyMYZIK2XVLFSg0vWaZXTItDicxjVXkiR7/IoD9maVR/sLrvK7K
	yRPMkNBfygF2KZ0EJBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhsR-00000001wLC-1V18;
	Mon, 07 Jul 2025 09:11:07 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgxi-00000001p3I-0XaA
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 08:12:32 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250707081224euoutp012264abe696fbce9877f37c5bdfdc3485~P6eOoobQo0732107321euoutp01k
	for <linux-riscv@lists.infradead.org>; Mon,  7 Jul 2025 08:12:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250707081224euoutp012264abe696fbce9877f37c5bdfdc3485~P6eOoobQo0732107321euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751875944;
	bh=dnqfahgdX+avAWwRgYn51cRHDYqFSaWYH3r+HyZbJc8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gJeqK7e3jDPeVpycraAkwzXkgeJ6egUTI8EfY/qJ4rrdgpNX3mkIiI3++hO4huJVT
	 FTMvgYO8vE5z6vBQP4BTPHmKyH09L6kO5GEay51OavXiZ39FsgvAveWa80D3d3UHUQ
	 zUibBhrSui29xcxj3q7yQkIWIAIvvlnLBdMKAcIw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250707081223eucas1p170446baf185b93004844de16952f1225~P6eOCmy__0035700357eucas1p1v;
	Mon,  7 Jul 2025 08:12:23 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250707081222eusmtip127c52a8d31ab35fe240938c0c347f713~P6eM6tJWH2076020760eusmtip1L;
	Mon,  7 Jul 2025 08:12:22 +0000 (GMT)
Message-ID: <9ec72ebf-33cb-466d-a41b-ea593e63b5e2@samsung.com>
Date: Mon, 7 Jul 2025 10:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] rust: pwm: Add complete abstraction layer
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Danilo
	Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas
	Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
	Gross <tmgross@umich.edu>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Drew Fustini <fustini@kernel.org>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <yxtnwax73wkliqkbq5736tswbxrblpwx4bn6z257tyd2xu23jx@y6k6iwdhmsgy>
X-CMS-MailID: 20250707081223eucas1p170446baf185b93004844de16952f1225
X-Msg-Generator: CA
X-RootMTR: 20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2
X-EPHeader: CA
X-CMS-RootMailID: 20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2
References: <20250706-rust-next-pwm-working-fan-for-sending-v9-0-42b5ac2101c7@samsung.com>
	<CGME20250706114605eucas1p17d1cbd035d14d95f4ad0588c2572b3e2@eucas1p1.samsung.com>
	<20250706-rust-next-pwm-working-fan-for-sending-v9-2-42b5ac2101c7@samsung.com>
	<aGpqqGMTU3a3O8cn@pollux>
	<yxtnwax73wkliqkbq5736tswbxrblpwx4bn6z257tyd2xu23jx@y6k6iwdhmsgy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_011231_540037_95BB93CA 
X-CRM114-Status: GOOD (  18.13  )
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

CgpPbiA3LzcvMjUgMDg6NTcsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIERhbmls
bywKPiAKPiBPbiBTdW4sIEp1bCAwNiwgMjAyNSBhdCAwMjoyMzowNFBNICswMjAwLCBEYW5pbG8g
S3J1bW1yaWNoIHdyb3RlOgo+PiBPbiBTdW4sIEp1bCAwNiwgMjAyNSBhdCAwMTo0NToxM1BNICsw
MjAwLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPj4+ICsgICAgLy8vICMgU2FmZXR5Cj4+PiAr
ICAgIC8vLwo+Pj4gKyAgICAvLy8gYGRldmAgbXVzdCBiZSBhIHZhbGlkIHBvaW50ZXIgdG8gYSBg
YmluZGluZ3M6OmRldmljZWAgZW1iZWRkZWQgd2l0aGluIGEKPj4+ICsgICAgLy8vIGBiaW5kaW5n
czo6cHdtX2NoaXBgLiBUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBieSB0aGUgZGV2aWNlIGNvcmUg
d2hlbiB0aGUKPj4+ICsgICAgLy8vIGxhc3QgcmVmZXJlbmNlIHRvIHRoZSBkZXZpY2UgaXMgZHJv
cHBlZC4KPj4+ICsgICAgdW5zYWZlIGV4dGVybiAiQyIgZm4gcmVsZWFzZV9jYWxsYmFjayhkZXY6
ICptdXQgYmluZGluZ3M6OmRldmljZSkgewo+Pj4gKyAgICAgICAgLy8gU0FGRVRZOiBUaGUgZnVu
Y3Rpb24ncyBjb250cmFjdCBndWFyYW50ZWVzIHRoYXQgYGRldmAgcG9pbnRzIHRvIGEgYGRldmlj
ZWAKPj4+ICsgICAgICAgIC8vIGZpZWxkIGVtYmVkZGVkIHdpdGhpbiBhIHZhbGlkIGBwd21fY2hp
cGAuIGBjb250YWluZXJfb2YhYCBjYW4gdGhlcmVmb3JlCj4+PiArICAgICAgICAvLyBzYWZlbHkg
Y2FsY3VsYXRlIHRoZSBhZGRyZXNzIG9mIHRoZSBjb250YWluaW5nIHN0cnVjdC4KPj4+ICsgICAg
ICAgIGxldCBjX2NoaXBfcHRyID0gdW5zYWZlIHsgY29udGFpbmVyX29mIShkZXYsIGJpbmRpbmdz
Ojpwd21fY2hpcCwgZGV2KSB9Owo+Pj4gKwo+Pj4gKyAgICAgICAgLy8gU0FGRVRZOiBgY19jaGlw
X3B0cmAgaXMgYSB2YWxpZCBwb2ludGVyIHRvIGEgYHB3bV9jaGlwYCBhcyBlc3RhYmxpc2hlZAo+
Pj4gKyAgICAgICAgLy8gYWJvdmUuIENhbGxpbmcgdGhpcyBGRkkgZnVuY3Rpb24gaXMgc2FmZS4K
Pj4+ICsgICAgICAgIGxldCBkcnZkYXRhX3B0ciA9IHVuc2FmZSB7IGJpbmRpbmdzOjpwd21jaGlw
X2dldF9kcnZkYXRhKGNfY2hpcF9wdHIpIH07Cj4+PiArCj4+PiArICAgICAgICBpZiAhZHJ2ZGF0
YV9wdHIuaXNfbnVsbCgpIHsKPj4KPj4gSXMgdGhpcyBjaGVjayBuZWVkZWQ/IEkgdGhpbmsgb25l
IGNhbid0IGNyZWF0ZSBhIHB3bTo6Q2hpcCBpbnN0YW5jZSB3aXRob3V0Cj4+IHByb3ZpZGluZyBh
IFQsIHNvIHRoaXMgcG9pbnRlciBjYW4ndCBiZSBOVUxMIEkgdGhpbmsuCj4gCj4gVGhlcmUgYXJl
IGN1cnJlbnRseSBhIGZldyBDIGRyaXZlcnMsIHRoYXQgZG9uJ3QgdXNlIGEgcHJpdmF0ZSBkYXRh
Cj4gc3RydWN0IHRoYXQgaXMgbWFuYWdlZCBieSB0aGUgcHdtY2hpcC4gT25lIG9mIHRoZW0gZG9l
c24ndCBtYWtlIHVzZSBvZgo+IHRoZSBwd21jaGlwJ3MgZHJ2ZGF0YSBhdCBhbGwuIFRoZSBsYXR0
ZXIgaXMgZHJpdmVycy9wd20vcHdtLXR3bC1sZWQuYy4KClRoYW5rIHlvdSBib3RoIGZvciB0aGUg
ZmVlZGJhY2sgb24gdGhpcyBwb2ludC4KCk15IGludGVycHJldGF0aW9uIGFsaWducyB3aXRoIERh
bmlsbydzOiB0aGUgbnVsbCBjaGVjayBpcyB1bm5lY2Vzc2FyeQp3aXRoaW4gdGhlIGNvbnRleHQg
b2YgdGhpcyBSdXN0IGFic3RyYWN0aW9uLgoKVGhlIHB3bTo6Q2hpcDo6bmV3KCkgQVBJIGFzIGRl
c2lnbmVkIGd1YXJhbnRlZXMgdGhhdCBkcml2ZXIgZGF0YSBpcwphbHdheXMgcHJvdmlkZWQuIEZv
ciB0aGUgY2FzZXMgVXdlIG1lbnRpb25lZCwgd2hlcmUgYSBDIGRyaXZlciBtaWdodCBub3QKdXNl
IHByaXZhdGUgZGF0YSwgdGhlIGlkaW9tYXRpYyBSdXN0IHNvbHV0aW9uIHdvdWxkIGJlIHRvIHVz
ZSBhCnplcm8gc2l6ZWQgdHlwZSAoZS5nLiwgYW4gZW1wdHkgc3RydWN0IG9yICgpKSBmb3IgdGhl
IFB3bU9wczo6RHJ2RGF0YS4KVGhpcyBhcHByb2FjaCBzdGlsbCByZXN1bHRzIGluIGEgdmFsaWQs
IG5vbiBudWxsIHBvaW50ZXIgYmVpbmcgcGFzc2VkIHRvCnRoZSBDIGNvcmUuCgpHaXZlbiB0aGF0
IGFsbCBwYXRocyB3aXRoaW4gdGhpcyBhYnN0cmFjdGlvbiBsZWFkIHRvIGEgbm9uIG51bGwgZHJ2
ZGF0YQpwb2ludGVyLCBJIGJlbGlldmUgcmVtb3ZpbmcgdGhlIHJlZHVuZGFudCBjaGVjayBpcyB0
aGUgY29ycmVjdCBhcHByb2FjaC4KCj4gCj4gQmVzdCByZWdhcmRzCj4gVXdlCgpCZXN0IHJlZ2Fy
ZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
