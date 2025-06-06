Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBBEC61DB8
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgYGOQJP8Tn5GDlq1NwyqBuFqa6xgj5MqWgfiwQYbwo=; b=2Cb/5KsKOWYK+W
	gzK5arJefB4BT05VsIGydNMbhYv9wmNtY+VBMAYi078Ky8B6sZg027TAvoi13ghompKKzvb0Bp/fF
	gJ6KQpWjLMXNiQgRARXbf1++qRWRsf+bLmGGpBPkgqSSPtjaI32tUeymRrLeDrBwtBxTFtU63uSEf
	yRU5/LDmHZMgRulF+TW2BX/kYdBuThohXNOwkSsR1w+wTV+x1KkQ7OXn1oYLotvUv3/DPpv8xwlDJ
	iApXYfvI88AHCiFARavD+yACtR1znwh9MhPBML0B3X/hnXJBb67FMPCdGyLpchg6RLt+mkJnrwKMc
	LHcrleI8L8zIFsDoHJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNa9S-00000000ej3-30Ob;
	Fri, 06 Jun 2025 16:42:42 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNa8T-00000000ed6-1U5r
	for linux-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 16:41:43 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250606164136euoutp01ef210e7f39e144aeaa0b89c996691c9a~Gga_YmzO00233002330euoutp01G
	for <linux-riscv@lists.infradead.org>; Fri,  6 Jun 2025 16:41:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250606164136euoutp01ef210e7f39e144aeaa0b89c996691c9a~Gga_YmzO00233002330euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749228096;
	bh=mnJFHA5ulRzhgLwxfNjBRQiUqguX++zUd23VHbe6KTM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XaAYnvb/Ep9aLxZsG8vG9FWKd4UTZwDZf1KlD/Pz/MnP8g+MH+tQ3RWIybPNDc17x
	 cV4kFkg8QdTRSB4TmDAdkww0WGdVXvetW13q58BLhKbRcA1JNlwbgDNgGe2q3QmyJL
	 pZ/4yztur7q3V1D2oQ6uqgl6I7SXwx6b+xd/Z3e8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250606164134eucas1p1b26805254a1a3e07a7318211bf834e28~Gga89mTvh1202912029eucas1p1J;
	Fri,  6 Jun 2025 16:41:34 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250606164133eusmtip157467893c23ece40f4eb41f3dd30ea84~Gga74zGnv2294722947eusmtip1l;
	Fri,  6 Jun 2025 16:41:33 +0000 (GMT)
Message-ID: <62085c76-7a5e-42f2-acee-138622d7d481@samsung.com>
Date: Fri, 6 Jun 2025 18:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] pwm: Add Rust driver for T-HEAD TH1520 SoC
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren
	<guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
	Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
	Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPLSQfXXLW7X3cw@mail.gmail.com>
X-CMS-MailID: 20250606164134eucas1p1b26805254a1a3e07a7318211bf834e28
X-Msg-Generator: CA
X-RootMTR: 20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0
X-EPHeader: CA
X-CMS-RootMailID: 20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<CGME20250524211521eucas1p1929a51901c91d1a37e9f4c2da86ff7b0@eucas1p1.samsung.com>
	<20250524-rust-next-pwm-working-fan-for-sending-v1-2-bdd2d5094ff7@samsung.com>
	<q6dkihyfosi3k4mtrvyff54nbsjpovmujdbmoqhapo7daznpja@of2p5gtmcq2m>
	<b1c4792e-f997-4eba-a8ed-d2e3f76e3fdd@samsung.com>
	<CANiq72kVvLogBSVKz0eRg6V4LDB1z7b-6y1WPLSQfXXLW7X3cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_094141_972243_07C12D56 
X-CRM114-Status: GOOD (  20.62  )
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

CgpPbiA2LzYvMjUgMTc6MjEsIE1pZ3VlbCBPamVkYSB3cm90ZToKPiBPbiBGcmksIEp1biA2LCAy
MDI1IGF0IDQ6MDjigK9QTSBNaWNoYWwgV2lsY3p5bnNraQo+IDxtLndpbGN6eW5za2lAc2Ftc3Vu
Zy5jb20+IHdyb3RlOgo+Pgo+PiBZb3UncmUgcmlnaHQsIHRoYW5rIHlvdS4gVGhlIHdyYXBwaW5n
X211bCBpcyB1bnNhZmUgZHVlIHRvIHRoZSBvdmVyZmxvdwo+PiByaXNrIHlvdSBwb2ludGVkIG91
dC4KPiAKPiBXaGF0IGRvIHlvdSBtZWFuIGJ5ICJ1bnNhZmUiPyBgd3JhcHBpbmdfbXVsYCBkb2Vz
IG5vdCB0cmlnZ2VyIFVCIGFuZAo+IGl0IGludGVudGlvbmFsbHkgcHJvdmlkZXMgd3JhcHBpbmcg
YXJpdGhtZXRpYy4KCllvdSdyZSByaWdodCwgSSBzaG91bGQgaGF2ZSBzYWlkICJtYXRoZW1hdGlj
YWxseSBpbmNvcnJlY3QiIGR1ZSB0byB0aGUKb3ZlcmZsb3csIG5vdCB1bnNhZmUKCj4gCj4+IFRo
ZSBpZGVhbCBzb2x1dGlvbiB3b3VsZCBiZSB0byB1c2UgdGhlIGtlcm5lbCdzIG93biBtdWxfdTY0
X3U2NF9kaXZfdTY0Cj4+IGhlbHBlciBmdW5jdGlvbi4KPj4KPj4gUnVzdCBtYWludGFpbmVyczog
VGhpcyBiaW5kaW5nIGRvZXNuJ3Qgc2VlbSB0byBiZSBhdmFpbGFibGUgeWV0LiBXb3VsZCBhCj4+
IHByZXBhcmF0b3J5IHBhdGNoIGludHJvZHVjaW5nIGEgbWluaW1hbCBydXN0L2tlcm5lbC9tYXRo
LnJzIHdpdGggIG9ubHkKPj4gdGhpcyBiaW5kaW5nIGJlIHRoZSBiZXN0IHdheSB0byBwcm9jZWVk
PyBJdCBzZWVtcyBsaWtlIGEgdXNlZnVsIHV0aWxpdHkKPj4gZm9yIG1vcmUgdGhhbiBqdXN0IHRo
aXMgZHJpdmVyLgo+IAo+IFNvdW5kcyBnb29kIHRvIG1lLiBXZSBhbHNvIHJlY2VudGx5IGhhZCBy
ZWxhdGVkIGRpc2N1c3Npb25zIGFib3V0Cj4gNjQtYml0IGRpdmlzaW9ucyBpbiAzMi1iaXQgYXJj
aGl0ZWN0dXJlcyBhbmQgYGNvbnN0IGZuYHMsIHlvdSBtYXkgd2FudAo+IHRvIHRha2UgYSBsb29r
Ogo+IAo+ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9ydXN0LWZvci1saW51eC9DQU5pcTcy
a2U0NWVPd2NrTWhXSHZtd3hjMDNkeHI0cm54eEt2eCtIdldkQkxvcFpmclFAbWFpbC5nbWFpbC5j
b20vCj4gICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjUwNTAy
MDA0NTI0LjIzMDU1My0xLWZ1aml0YS50b21vbm9yaUBnbWFpbC5jb20vCj4gICAgIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3J1c3QtZm9yLWxpbnV4LzIwMjUwNTAxMDE1ODE4LjIyNjM3Ni0xLWZ1
aml0YS50b21vbm9yaUBnbWFpbC5jb20vCj4gCj4gSSB3b3VsZCBhbHNvIGJlIGNhcmVmdWwgY2hv
b3NpbmcgdGhlIG5hbWVzOiBpZiB0aGV5IGFyZSBzdXBwb3NlZCB0aGUKPiBzYW1lIGJlaGF2aW9y
LCB0aGVuIHBsZWFzZSBwaWNrIHRoZSBzYW1lIG5hbWUgYXMgQy4gT3RoZXJ3aXNlLCB3ZQo+IHNo
b3VsZCBhdm9pZCBpdC4gRWl0aGVyIHdheSwgd2Ugc2hvdWxkIGRvY3VtZW50IHRoZW0uCj4gCj4g
Rm9yIGluc3RhbmNlLCBpcyB0aGlzIHN1cHBvc2VkIHRvIGJlIGBtdWxfdTY0X3U2NF9kaXZfdTY0
YD8gSSBndWVzcwo+IG5vdCwgZ2l2ZW4gZS5nLiB0aGUgYGMgPT0gMGAgY2FzZS4KClRoYW5rcyAh
IFNlZW1zIGxpa2UgcHJvdmlkaW5nIGEgc2FmZSBSdXN0IHdyYXBwZXIgZm9yCm11bF91NjRfdTY0
X2Rpdl91NjQgaXMgdGhlIGNvcnJlY3QgcGF0aCBmb3J3YXJkLiBTaW5jZSBpdCdzIGEgc3RhbmRh
cmQKaGVscGVyIGluIHRoZSBQV00gc3Vic3lzdGVtLCB1c2luZyBpdCB3b3VsZCBhbGxvdyBtZSB0
byByZW1vdmUgdGhlCnRlbXBvcmFyeSBtYXRoIGltcGxlbWVudGF0aW9uIGZyb20gdGhpcyBkcml2
ZXIgaW4gZmF2b3Igb2YgdGhlIGtlcm5lbCdzCm9wdGltaXplZCB2ZXJzaW9uLgoKPiAKPiBJIGhv
cGUgdGhhdCBoZWxwcyAmIHRoYW5rcyEKPiAKPiBDaGVlcnMsCj4gTWlndWVsCj4gCgpCZXN0IHJl
Z2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNhbXN1bmcuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
