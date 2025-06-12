Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9E0C61CE8
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 08:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heo7pDap4fUTH14U08zB5v+2lbNTjy15J0E98s77iMI=; b=xOwLXBbysCZpHE
	QQBHQ0JjofZ6J/jLtL0REH4qsYNXc5HZtY2lz6YONiP5yJJ5EziwPmJQqT9B9CAkgC0iqyVx9Y2je
	UdB+8oAGY+trFUxs/FU4i2yHTA0jCfD6Ps58qEzdcW4IbgMauWt5z5myEWO3YxgN5Jee9lGJQtb5S
	RISV6a+P8TUGZw089LHj6g0b7vzoro+9ii46fpQObj+LaxzQlLKu/qFGhJnzj6hvNECnzbDRBHBCc
	9IZ5iUVe7BCEvRMzyc1HJxHjnKPufiHHMZfxw9Now8au8abFI2vhr8YmGoVj+ZdGw0Ftb5Uv1/94D
	jz+ok0B3l7gJxd/je10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdkY-0000000Ck8c-1os4;
	Thu, 12 Jun 2025 08:57:30 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd4n-0000000CZhG-1fKN
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 08:14:24 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250612081416euoutp01287c807b166bb66066a94a1d8e1a98b4~IPXuKS3Wq2336523365euoutp01D
	for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 08:14:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250612081416euoutp01287c807b166bb66066a94a1d8e1a98b4~IPXuKS3Wq2336523365euoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749716056;
	bh=/VOe1tEPEUiWf+yiC0MtudUMPxShLqsFiTfwLc2Ert0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=IS4jiy/qFsRCS3Gg9TZjyHnrCsU66P75Itwnb4oQ494v95PikpmcOTXnh/3YRDwCM
	 OXCBoeCvNH+FEbvDAWbQSbFq1PJ1PE/9cOww+3FgZocmukDVpD7OQCJkCltMsabXXt
	 TiHRv0LjcuyEr0jTLVE5OzEhqptX3yoqfhjGaQMo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250612081415eucas1p229fc20aa3f3252e93349c606f4a8dbd2~IPXtmCWFa0599605996eucas1p2p;
	Thu, 12 Jun 2025 08:14:15 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250612081414eusmtip158dc80f809c9f48925cc69e56d3e5521~IPXsaMu1q2395823958eusmtip1O;
	Thu, 12 Jun 2025 08:14:14 +0000 (GMT)
Message-ID: <d1523586-82ca-4863-964f-331718bb1f0e@samsung.com>
Date: Thu, 12 Jun 2025 10:14:13 +0200
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
In-Reply-To: <jbm3qvowi5vskhnjyqlp3xek36gzzqjt35m66eayxi6lmi525t@iefevopxjl53>
X-CMS-MailID: 20250612081415eucas1p229fc20aa3f3252e93349c606f4a8dbd2
X-Msg-Generator: CA
X-RootMTR: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
X-EPHeader: CA
X-CMS-RootMailID: 20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d
References: <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
	<CGME20250610125333eucas1p16126b64a0f447a5e9a5ad553d9d7d79d@eucas1p1.samsung.com>
	<20250610-rust-next-pwm-working-fan-for-sending-v2-2-753e2955f110@samsung.com>
	<jbm3qvowi5vskhnjyqlp3xek36gzzqjt35m66eayxi6lmi525t@iefevopxjl53>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_011422_809038_53886EF5 
X-CRM114-Status: GOOD (  13.33  )
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

CgpPbiA2LzExLzI1IDA4OjU4LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbywKPiAK
PiBIdWgsIGlmIHlvdSBkbyB0aGUgbmV3c3R5bGUgc3R1ZmYsIC5nZXRfc3RhdGUoKSBpcyB3cm9u
Zy4gSXQncyBlaXRoZXIKPiAucm91bmRfd2F2ZWZvcm1fdG9odygpICsgLnJvdW5kX3dhdmVmb3Jt
X2Zyb21odygpICsgLnJlYWRfd2F2ZWZvcm0oKSArCj4gLndyaXRlX3dhdmVmb3JtKCkgb3IgLmFw
cGx5KCkgKyAuZ2V0X3N0YXRlKCksIGJ1dCBkb24ndCBtaXggdGhlc2UuCgpJbiB0aGUgcHJvY2Vz
cyBvZiBpbXBsZW1lbnRpbmcgdGhlIGZ1bGwgIm5ld3N0eWxlIiB3YXZlZm9ybSBBUEkgYXMgeW91
CnN1Z2dlc3RlZCwgSSBkaXNjb3ZlcmVkIGEgaGFyZHdhcmUgbGltaXRhdGlvbi4gQWZ0ZXIgd3Jp
dGluZyBuZXcgdmFsdWVzCnRvIHRoZSBwZXJpb2QgYW5kIGR1dHkgY3ljbGUgcmVnaXN0ZXJzLCBy
ZWFkaW5nIHRoZW0gYmFjayBkb2VzIG5vdApyZXR1cm4gdGhlIHByb2dyYW1tZWQgdmFsdWVzLCB3
aGljaCBtYWtlcyBpdCBpbXBvc3NpYmxlIHRvIHJlbGlhYmx5CnJlcG9ydCB0aGUgY3VycmVudCBo
YXJkd2FyZSBzdGF0ZS4KClRoaXMgYXBwZWFycyB0byBiZSBhIGtub3duIHF1aXJrIG9mIHRoZSBo
YXJkd2FyZSwgYXMgdGhlIHJlZmVyZW5jZSBDCmRyaXZlciBmcm9tIFQtSEVBRCBbMV0gYWxzbyBv
bWl0cyB0aGUgLmdldF9zdGF0ZSBjYWxsYmFjaywgbGlrZWx5IGZvcgp0aGUgc2FtZSByZWFzb24u
CgpHaXZlbiB0aGlzLCB3b3VsZCBpdCBiZSBhY2NlcHRhYmxlIHRvIHByb3ZpZGUgYSB3cml0ZS1v
bmx5IGRyaXZlcj8gTXkKcHJvcG9zZWQgc29sdXRpb24gd291bGQgYmUgdG8gb21pdCB0aGUgLnJl
YWRfd2F2ZWZvcm0oKSBhbmQKLnJvdW5kX3dhdmVmb3JtX2Zyb21odygpIGltcGxlbWVudGF0aW9u
cyBmcm9tIG15IFB3bU9wcyB0cmFpdC4gVGhpcwp3b3VsZCBtZWFuIHRoZSBkcml2ZXIgY2FuIGNv
cnJlY3RseSBzZXQgdGhlIFBXTSBzdGF0ZSwgYnV0IGF0dGVtcHRpbmcgdG8KcmVhZCBpdCBiYWNr
IHZpYSBzeXNmcyB3b3VsZCBmYWlsIChlLmcuLCB3aXRoIC1FT1BOT1RTVVBQKSwgcmVmbGVjdGlu
Zwp0aGUgaGFyZHdhcmUncyBjYXBhYmlsaXR5LgoKRG9lcyB0aGlzIHNvdW5kIGxpa2UgYSByZWFz
b25hYmxlIGFwcHJvYWNoIHRvIHlvdT8KClsxXSAtIGh0dHBzOi8vZ2l0aHViLmNvbS9yZXZ5b3Mv
dGhlYWQta2VybmVsL2Jsb2IvbHBpNGEvZHJpdmVycy9wd20vcHdtLWxpZ2h0LmMKCj4gCj4+ICsg
ICAgICAgIGxldCBkYXRhOiAmU2VsZiA9IGNoaXAuZHJ2ZGF0YSgpLm9rX29yKEVJTlZBTCk/Owo+
PiArICAgICAgICBsZXQgaHdwd20gPSBwd20uaHdwd20oKTsKPj4gKyAgICAgICAgbGV0IGlvbWVt
X2d1YXJkID0gZGF0YS5pb21lbS5hY2Nlc3MocGFyZW50X2Rldik/Owo+PiArICAgICAgICBsZXQg
aW9tYXAgPSBpb21lbV9ndWFyZC5kZXJlZigpOwo+PiArICAgICAgICBsZXQgY3RybCA9IGlvbWFw
LnJlYWQzMih0aDE1MjBfcHdtX2N0cmwoaHdwd20pKTsKPj4gKyAgICAgICAgbGV0IHBlcmlvZF9j
eWNsZXMgPSBpb21hcC5yZWFkMzIodGgxNTIwX3B3bV9wZXIoaHdwd20pKTsKPj4gKyAgICAgICAg
bGV0IGR1dHlfY3ljbGVzID0gaW9tYXAucmVhZDMyKHRoMTUyMF9wd21fZnAoaHdwd20pKTsKPj4g
Kwo+PiArICAgICAgICBzdGF0ZS5zZXRfZW5hYmxlZChkdXR5X2N5Y2xlcyAhPSAwKTsKPj4gKwo+
PiArICAgICAgICBsZXQgcmF0ZV9oeiA9IGRhdGEuY2xrLnJhdGUoKS5hc19oeigpOwo+PiArICAg
ICAgICBsZXQgcGVyaW9kX25zID0gKHBlcmlvZF9jeWNsZXMgYXMgdTY0KQo+PiArICAgICAgICAg
ICAgLm11bF9kaXYodGltZTo6TlNFQ19QRVJfU0VDIGFzIHU2NCwgcmF0ZV9oeiBhcyB1NjQpCj4+
ICsgICAgICAgICAgICAudW53cmFwX29yKDApOwoKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCkJlc3Qg
cmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
