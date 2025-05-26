Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D118C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PLn1m5emqOrYuhbHfBuewblbkIhyKqC2FxmzLJFSUs=; b=gGDKLG24I/t5uG
	66j3Cgd8akErUZVRuFTOESqchD9L6+zOLu7Bhae5nShMTRPbwkbZQc41ck1YeXL57X8EzUlAuyn+2
	1CarRd/pyLyN12Bn1JiPFEgMcK/D4vTlEFles/xPbUUjmmAVwL4wy2hfjwZkeBeppfmOFx/dS7tKT
	rXzos77qqmfW02/yxsp1bskSEqE0/y2t3AOS12/Um+kjEpVBjd1nQpZ2HD4L0pKRaRp+vAtlI6rd0
	uoxurY8/PNCTLY2luorxeqAjYMbWT5qiEeDyPBORCUuoj+uF3jhdAGByoCD5budkC04Cnq6WhAd60
	gMYHvJfrTaf76vVh7uqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYPW-00000008xAa-0cvQ;
	Mon, 26 May 2025 14:02:38 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYPS-00000008x8v-3jYA
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 14:02:37 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250526140229euoutp01f81f5ecbd25566714e88fc4620429400~DGJ6Ysk2R0721607216euoutp01j
	for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 14:02:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250526140229euoutp01f81f5ecbd25566714e88fc4620429400~DGJ6Ysk2R0721607216euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748268149;
	bh=X9hidhnbjeXr79/7hjWdiP66/YfJFrDGrP9fti1zI8k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=LncjDDatBDAFyd8dSMOXhSUWNzHT/wRYhIls3esbaJZnr9ufGHCuIeBUqXlzPNEAn
	 3yRKkT6HOjdP0cSwXC6CW+HiLrwjwQ3sgaPFtLfKxXVvJTiPOmoItgIt/Ep0dyYhTH
	 +zvLkck0VJPtip1ZELVDgfYh7qfus1bqVVLUqPUk=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250526140229eucas1p29ab92fba79975fb3f6f5d3f9831f9da6~DGJ5v-bu92582525825eucas1p2e;
	Mon, 26 May 2025 14:02:29 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250526140227eusmtip1fc55917f132ab805ce6dd5cdab5f4fe9~DGJ4sSGgu1355013550eusmtip1C;
	Mon, 26 May 2025 14:02:27 +0000 (GMT)
Message-ID: <fec3e2d8-592a-4474-9a15-3a196829c9f6@samsung.com>
Date: Mon, 26 May 2025 16:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/6] rust: Add basic PWM abstractions
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
In-Reply-To: <enxctdseecqz765nmd24vziiaksmyhltqfwycdszmfq3s7orjm@lnpc7czuluis>
X-CMS-MailID: 20250526140229eucas1p29ab92fba79975fb3f6f5d3f9831f9da6
X-Msg-Generator: CA
X-RootMTR: 20250524211520eucas1p1378fbab27f4b1ae8808706c074fa217c
X-EPHeader: CA
X-CMS-RootMailID: 20250524211520eucas1p1378fbab27f4b1ae8808706c074fa217c
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<CGME20250524211520eucas1p1378fbab27f4b1ae8808706c074fa217c@eucas1p1.samsung.com>
	<20250524-rust-next-pwm-working-fan-for-sending-v1-1-bdd2d5094ff7@samsung.com>
	<enxctdseecqz765nmd24vziiaksmyhltqfwycdszmfq3s7orjm@lnpc7czuluis>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_070235_506454_6950D6C5 
X-CRM114-Status: GOOD (  13.72  )
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

CgpPbiA1LzI2LzI1IDA5OjUzLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBNaWNo
YWwsCj4gCj4gT24gU2F0LCBNYXkgMjQsIDIwMjUgYXQgMTE6MTQ6NTVQTSArMDIwMCwgTWljaGFs
IFdpbGN6eW5za2kgd3JvdGU6Cj4+IEludHJvZHVjZSBpbml0aWFsIFJ1c3QgYWJzdHJhY3Rpb25z
IGZvciB0aGUgTGludXggUFdNIHN1YnN5c3RlbS4gVGhlc2UKPj4gYWJzdHJhY3Rpb25zIHByb3Zp
ZGUgc2FmZSB3cmFwcGVycyBhcm91bmQgdGhlIGNvcmUgQyBkYXRhIHN0cnVjdHVyZXMgYW5kCj4+
IGZ1bmN0aW9ucywgZW5hYmxpbmcgdGhlIGRldmVsb3BtZW50IG9mIFBXTSBjaGlwIGRyaXZlcnMg
aW4gUnVzdC4KPiAKPiBPaCB3b3csIHRoYW5rcyBmb3IgcnVzdGlmeWluZyBQV00uIFRoYXQgbWln
aHQgYmUgbXkgY2hhbmNlIHRvIGFjdHVhbGx5Cj4gbGVhcm4gUnVzdC4KPiAKPiBJIGRvbid0IGtu
b3cgd2hlbiBJIHdpbGwgZmluZCB0aGUgdGltZSB0byBsb29rIGludG8gdGhhdCBpbiBkZXRhaWwg
YnV0Cj4gb25lIHRoaW5nIEknZCBsaWtlIHRvIGhhdmUgZm9yIFJ1c3Qgc3VwcG9ydCBpcyB0aGF0
IHRoZSBkcml2ZXJzIHVzZSB0aGUKPiBuZXcgYWJzdHJhY3Rpb24gKGkuZS4gLnJvdW5kX3dhdmVm
b3JtX3RvaHcoKSArIC5yb3VuZF93YXZlZm9ybV9mcm9taHcoKQo+ICsgLnJlYWRfd2F2ZWZvcm0o
KSArIC53cml0ZV93YXZlZm9ybSgpKSBpbnN0ZWFkIG9mIHRoZSBvbGRlciAuYXBwbHkoKQo+IGNh
bGxiYWNrLgoKSGkgVXdlLAoKVGhhbmtzIGZvciB0aGUgdmFsdWFibGUgZmVlZGJhY2suIFlvdSdy
ZSByaWdodCwgYnVpbGRpbmcgb24gdGhlIG5ld2VyCndhdmVmb3JtIGFic3RyYWN0aW9ucyBpcyBh
IGNvcnJlY3QgYXBwcm9hY2guCgpJJ2xsIHJld29yayB0aGUgcGF0Y2hlcyB0byB1c2UgLnJvdW5k
X3dhdmVmb3JtX3RvaHcoKSwKLnJvdW5kX3dhdmVmb3JtX2Zyb21odygpLCAucmVhZF93YXZlZm9y
bSgpLCBhbmQgLndyaXRlX3dhdmVmb3JtKCkgYXMgeW91CnN1Z2dlc3RlZCwgaW5zdGVhZCBvZiB0
aGUgLmFwcGx5KCkgY2FsbGJhY2suCgpJIGFwcHJlY2lhdGUgeW91IHN0ZWVyaW5nIG1lIGluIHRo
ZSByaWdodCBkaXJlY3Rpb24uCgo+IAo+IEJlc3QgcmVnYXJkcwo+IFV3ZQoKQmVzdCByZWdhcmRz
LAotLSAKTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
