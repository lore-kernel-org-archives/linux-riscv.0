Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD69C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZDPdYyyNwbxhi7zSBT/PZLLkNyNQPMTSY+FJGmLJrA=; b=dIQ5C792SjNVSd
	3B1IZFvwA0ikzy3RGKqBi3P9akwIhxjIaDCYloSSAMMkQzLgvwzY3t6/yRo9/DOs37xopp5GlQvSU
	PNf3KRiejFc2BhrY/TFtZAuLrro1eBCnsKgqjSyh7j3r3FuESeV1iunjx4fmT9vGRwYy2y3VU+GcA
	WPazntXhb2IZ9Hb4djPJ0XyDlklLdfvLoAns1aSjIbJ9ROGbIx4GFBukNOrOIMGkQI9kMLXdclyr6
	sPfgZm/89YzdBNoDjtIVDvLeXh8FjPuaMWobCTKVBDDNfA3yT6L/5oBaXIH7FjPKCTfkN/Z/Nv5Tc
	nJnejGpooQV4cFJFCBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUz6-000000076mt-3WXU;
	Tue, 17 Jun 2025 12:00:12 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRUvA-0000000762N-2B3T
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 11:56:10 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250617115558euoutp010dab00bcc4ceb432d21ddedebf2ba496~J0nuApLqL0243002430euoutp01d
	for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 11:55:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250617115558euoutp010dab00bcc4ceb432d21ddedebf2ba496~J0nuApLqL0243002430euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750161358;
	bh=oofikVxRsBxHxPSDdlnvLJyVhdL+RF7rzHi6wUMuvQs=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hk3/aRhfplI0MimyM+0Ny2W5f3hpPbZ//3yhhymz2n67YIKDfT3D3KCZ2wiRiOJ7x
	 iR2hztlhHdIbLNoFSk5f7oeOHipEVMXkbWJ04oYrtS/1qML0eCIb9xeIW1IVjbbN22
	 ENbXparJC5pyBqD0Dfc75BwwVviBUUsgvb8Bcm1s=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250617115557eucas1p1fe0dc838ed601d75fe7deba27d312aa7~J0ntgrNum2233822338eucas1p1l;
	Tue, 17 Jun 2025 11:55:57 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250617115556eusmtip1a9ce151263637f622a84b2312a20b25d~J0nsOwoz40555305553eusmtip1i;
	Tue, 17 Jun 2025 11:55:56 +0000 (GMT)
Message-ID: <b1c7c305-fad9-4161-b627-b5c1db9cb0ee@samsung.com>
Date: Tue, 17 Jun 2025 13:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] pwm: Add Rust driver for T-HEAD TH1520 SoC
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
In-Reply-To: <5aam5ff3m24yzsqdh7w2zplccuwmmr2no7jhgmdnxggmhpo4hl@r6iawlw7f42m>
X-CMS-MailID: 20250617115557eucas1p1fe0dc838ed601d75fe7deba27d312aa7
X-Msg-Generator: CA
X-RootMTR: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
X-EPHeader: CA
X-CMS-RootMailID: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d@eucas1p1.samsung.com>
	<20250610-rust-next-pwm-working-fan-for-sending-v2-2-753e2955f110@samsung.com>
	<jbm3qvowi5vskhnjyqlp3xek36gzzqjt35m66eayxi6lmi525t@iefevopxjl53>
	<d1523586-82ca-4863-964f-331718bb1f0e@samsung.com>
	<5aam5ff3m24yzsqdh7w2zplccuwmmr2no7jhgmdnxggmhpo4hl@r6iawlw7f42m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_045608_990999_51D0E67D 
X-CRM114-Status: GOOD (  23.46  )
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

CgpPbiA2LzEyLzI1IDIyOjM2LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBNaWNo
YWVsLAo+IAo+IE9uIFRodSwgSnVuIDEyLCAyMDI1IGF0IDEwOjE0OjEzQU0gKzAyMDAsIE1pY2hh
bCBXaWxjenluc2tpIHdyb3RlOgo+PiBPbiA2LzExLzI1IDA4OjU4LCBVd2UgS2xlaW5lLUvDtm5p
ZyB3cm90ZToKPj4+IEh1aCwgaWYgeW91IGRvIHRoZSBuZXdzdHlsZSBzdHVmZiwgLmdldF9zdGF0
ZSgpIGlzIHdyb25nLiBJdCdzIGVpdGhlcgo+Pj4gLnJvdW5kX3dhdmVmb3JtX3RvaHcoKSArIC5y
b3VuZF93YXZlZm9ybV9mcm9taHcoKSArIC5yZWFkX3dhdmVmb3JtKCkgKwo+Pj4gLndyaXRlX3dh
dmVmb3JtKCkgb3IgLmFwcGx5KCkgKyAuZ2V0X3N0YXRlKCksIGJ1dCBkb24ndCBtaXggdGhlc2Uu
Cj4+Cj4+IEluIHRoZSBwcm9jZXNzIG9mIGltcGxlbWVudGluZyB0aGUgZnVsbCAibmV3c3R5bGUi
IHdhdmVmb3JtIEFQSSBhcyB5b3UKPj4gc3VnZ2VzdGVkLCBJIGRpc2NvdmVyZWQgYSBoYXJkd2Fy
ZSBsaW1pdGF0aW9uLiBBZnRlciB3cml0aW5nIG5ldyB2YWx1ZXMKPj4gdG8gdGhlIHBlcmlvZCBh
bmQgZHV0eSBjeWNsZSByZWdpc3RlcnMsIHJlYWRpbmcgdGhlbSBiYWNrIGRvZXMgbm90Cj4+IHJl
dHVybiB0aGUgcHJvZ3JhbW1lZCB2YWx1ZXMsIHdoaWNoIG1ha2VzIGl0IGltcG9zc2libGUgdG8g
cmVsaWFibHkKPj4gcmVwb3J0IHRoZSBjdXJyZW50IGhhcmR3YXJlIHN0YXRlLgo+Pgo+PiBUaGlz
IGFwcGVhcnMgdG8gYmUgYSBrbm93biBxdWlyayBvZiB0aGUgaGFyZHdhcmUsIGFzIHRoZSByZWZl
cmVuY2UgQwo+PiBkcml2ZXIgZnJvbSBULUhFQUQgWzFdIGFsc28gb21pdHMgdGhlIC5nZXRfc3Rh
dGUgY2FsbGJhY2ssIGxpa2VseSBmb3IKPj4gdGhlIHNhbWUgcmVhc29uLgo+IAo+IERvIHlvdSBy
ZWFkIGNvbXBsZXRlIG5vbi1zZW5zZSBvciBlLmcuIHRoZSBvbGQgY29uZmlndXJhdGlvbiB1bnRp
bAo+IHRoZSBjdXJyZW50IHBlcmlvZCBlbmRzPwo+IAo+IEkgZ3Vlc3Mgd291bGQgYmUgdGhhdCAu
Z2V0X3N0YXRlIHdhc24ndCBpbXBsZW1lbnRlZCBiZWNhdXNlIHRoaXMgaXMgYW4KPiBvbGRvbGRz
dHlsZSBkcml2ZXIgYW5kIGl0IHdvcmtzIGFsc28gd2l0aG91dCB0aGF0IGZ1bmN0aW9uLgoKSGkg
VXdlLAoKTXkgYXBvbG9naWVzIGZvciB0aGUgY29uZnVzaW9uLiBBZnRlciBmdXJ0aGVyIHRlc3Rp
bmcsIGl0IGFwcGVhcnMgSSB3YXMKbWlzdGFrZW4sIGFuZCB0aGUgaGFyZHdhcmUgcmVhZHMgYXJl
IHdvcmtpbmcgY29ycmVjdGx5LiBJIG11c3QgaGF2ZSBtYWRlCmFuIGVycm9yIHdoZW4gdGVzdGlu
ZyB2aWEgc3lzZnMuCgpJJ2xsIGJlIHN1Ym1pdHRpbmcgYSB2MyB0aGF0IGltcGxlbWVudHMgdGhl
IGZ1bGwgcm91bmRfd2F2ZWZvcm1fdG9odygpLApyb3VuZF93YXZlZm9ybV9mcm9taHcoKSwgcmVh
ZF93YXZlZm9ybSgpLCBhbmQgd3JpdGVfd2F2ZWZvcm0oKQpjb21iaW5hdGlvbiBhcyB5b3UgaW5p
dGlhbGx5IHN1Z2dlc3RlZC4KCj4gCj4+IEdpdmVuIHRoaXMsIHdvdWxkIGl0IGJlIGFjY2VwdGFi
bGUgdG8gcHJvdmlkZSBhIHdyaXRlLW9ubHkgZHJpdmVyPyBNeQo+PiBwcm9wb3NlZCBzb2x1dGlv
biB3b3VsZCBiZSB0byBvbWl0IHRoZSAucmVhZF93YXZlZm9ybSgpIGFuZAo+PiAucm91bmRfd2F2
ZWZvcm1fZnJvbWh3KCkgaW1wbGVtZW50YXRpb25zIGZyb20gbXkgUHdtT3BzIHRyYWl0LiBUaGlz
Cj4gCj4gUGxlYXNlIGRvbid0IHNraXAgLnJvdW5kX3dhdmVmb3JtX2Zyb21odygpLCB0aGF0IG9u
ZSBpcyBuZWVkZWQgZm9yCj4gcHdtX3JvdW5kX3dhdmVmb3JtX21pZ2h0X3NsZWVwKCkuCj4gCj4g
SSBkb24ndCBsaWtlIGl0LCBidXQgZ2l2ZW4gdGhhdCB0aGUgaGFyZHdhcmUgZG9lc24ndCBwbGF5
IGFsb25nIHRoZXJlIGlzCj4gbm8gYWx0ZXJuYXRpdmUuCj4gCj4+IHdvdWxkIG1lYW4gdGhlIGRy
aXZlciBjYW4gY29ycmVjdGx5IHNldCB0aGUgUFdNIHN0YXRlLCBidXQgYXR0ZW1wdGluZyB0bwo+
PiByZWFkIGl0IGJhY2sgdmlhIHN5c2ZzIHdvdWxkIGZhaWwgKGUuZy4sIHdpdGggLUVPUE5PVFNV
UFApLCByZWZsZWN0aW5nCj4+IHRoZSBoYXJkd2FyZSdzIGNhcGFiaWxpdHkuCj4gCj4gSSB0aGlu
ayB0aGVyZSBtaWdodCBiZSBhbm90aGVyIHBhdGNoIG9wcG9ydHVuaXR5IHRoZW4gdG8gbWFrZSBQ
V01fREVCVUcKPiB3b3JrIHdpdGggdGhhdC4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCkJlc3Qg
cmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
