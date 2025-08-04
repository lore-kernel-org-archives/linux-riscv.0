Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF5EC87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpOKBx/uR2Lb8jBoZfOxtlhC1PxuZIDQH0YJj1/uQMs=; b=ALZMAzbhtKx1Oc
	utmsfcxmYCFET87t4ddEaVGSbf54GXwaEHEBEUXX24pw6f8t+ufIRXcfXteYgjoB2D7s3zWxIgIwg
	A9pCrzDFJmV14EsUboJZEAQQqXuveYcI/ZQFJkQZtkN+FasFxh4c1RS9hur9tJGnLsObp1WBF8rXq
	Qgmiiu41fSu72G1m9wHmzVEmW44f7T0hdBcsLNGwcOoXYfvg9Jg0bygdbw9sT4mmNcm/0hu7TK5Yc
	J4DjkIYOYto3wM28G94CV+mN8iGByuAMI4n7ILuYP5Z71+pK1+Qr4dMWbeyPElO9PZ2TiR86klt8H
	/inLr3tXsuqIMFHW/55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj3gF-0000000BPLv-1W6E;
	Mon, 04 Aug 2025 22:29:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj3gB-0000000BPKq-1YlW
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 22:29:17 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250804222909euoutp0198ecd59bc5af7ce51d29314fda351b29~YsORGNF4z1309513095euoutp01L
	for <linux-riscv@lists.infradead.org>; Mon,  4 Aug 2025 22:29:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250804222909euoutp0198ecd59bc5af7ce51d29314fda351b29~YsORGNF4z1309513095euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754346549;
	bh=+RcFBByccHQrOvrGhevDXqOYgnFEm0AztkkNSDHAn7k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Vn+YsQSaL0tPxgww8oXD504OWFUXRUE0GW+bGSWeh6qa2POk61TgkpqaJE3a8sTUd
	 E3JwCg5oUh1snmdb7S15cMQ8OqYhyTooR4N9odzWsQ0ePCsOEGWyI7T5XJzOhpiZYE
	 +O7aRtumJURiCvFQ3X/+4+apX1dTnxjz4YdtnWn8=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250804222908eucas1p2069b21749bbab1ebf085f972ec5fd707~YsOQcXlc72283222832eucas1p2i;
	Mon,  4 Aug 2025 22:29:08 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250804222907eusmtip275da20eec177f6ac18638286e0ca7330~YsOPU6M9h2458224582eusmtip2W;
	Mon,  4 Aug 2025 22:29:07 +0000 (GMT)
Message-ID: <8ad10cc3-6e7d-4a8b-b6f6-9568403ee2b3@samsung.com>
Date: Tue, 5 Aug 2025 00:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 3/3] rust: pwm: Add complete abstraction layer
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
In-Reply-To: <42C9DF97-2E0F-453B-800A-1DA49BF8F29F@collabora.com>
X-CMS-MailID: 20250804222908eucas1p2069b21749bbab1ebf085f972ec5fd707
X-Msg-Generator: CA
X-RootMTR: 20250717090833eucas1p16c916450b59a77d81bd013527755cb21
X-EPHeader: CA
X-CMS-RootMailID: 20250717090833eucas1p16c916450b59a77d81bd013527755cb21
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
	<CGME20250717090833eucas1p16c916450b59a77d81bd013527755cb21@eucas1p1.samsung.com>
	<20250717-rust-next-pwm-working-fan-for-sending-v12-3-40f73defae0c@samsung.com>
	<42C9DF97-2E0F-453B-800A-1DA49BF8F29F@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_152915_993532_9556D3A4 
X-CRM114-Status: GOOD (  28.14  )
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

Ck9uIDcvMjUvMjUgMTc6NTYsIERhbmllbCBBbG1laWRhIHdyb3RlOgo+PiArCj4+ICsgICAgLy8v
IEdldHMgdGhlIGxhYmVsIGZvciB0aGlzIFBXTSBkZXZpY2UsIGlmIGFueS4KPj4gKyAgICBwdWIg
Zm4gbGFiZWwoJnNlbGYpIC0+IE9wdGlvbjwmQ1N0cj4gewo+PiArICAgICAgICAvLyBTQUZFVFk6
IHNlbGYuYXNfcmF3KCkgcHJvdmlkZXMgYSB2YWxpZCBwb2ludGVyLgo+PiArICAgICAgICBsZXQg
bGFiZWxfcHRyID0gdW5zYWZlIHsgKCpzZWxmLmFzX3JhdygpKS5sYWJlbCB9Owo+PiArICAgICAg
ICBpZiBsYWJlbF9wdHIuaXNfbnVsbCgpIHsKPj4gKyAgICAgICAgICAgIE5vbmUKPj4gKyAgICAg
ICAgfSBlbHNlIHsKPj4gKyAgICAgICAgICAgIC8vIFNBRkVUWTogbGFiZWxfcHRyIGlzIG5vbi1u
dWxsIGFuZCBwb2ludHMgdG8gYSBDIHN0cmluZwo+PiArICAgICAgICAgICAgLy8gbWFuYWdlZCBi
eSB0aGUga2VybmVsLCB2YWxpZCBmb3IgdGhlIGxpZmV0aW1lIG9mIHRoZSBQV00gZGV2aWNlLgo+
PiArICAgICAgICAgICAgU29tZSh1bnNhZmUgeyBDU3RyOjpmcm9tX2NoYXJfcHRyKGxhYmVsX3B0
cikgfSkKPj4gKyAgICAgICAgfQo+PiArICAgIH0KPiAKPiBuaXQ6IHRoaXMgY2FuIGJlIHdyaXR0
ZW4gbW9yZSBjb25jaXNlbHksIGJ1dCBJIHBlcnNvbmFsbHkgZG9u4oCZdCBtaW5kLgoKRG8geW91
IGhhdmUgc29tZXRoaW5nIHNwZWNpZmljIGluIG1pbmQgPyBJIHRoaW5rIHRoZSBhbHRlcm5hdGl2
ZSB3YXkgb2YKZXhwcmVzc2luZyB0aGlzIHdvdWxkIHVzZSBOb25OdWxsLCBidXQgc29tZWhvdyB0
aGlzIGZlZWxzIGxlc3MgcmVhZGFibGUKZm9yIG1lLgoKCj4+ICsKPj4gKy8vLyBUcmFpdCBkZWZp
bmluZyB0aGUgb3BlcmF0aW9ucyBmb3IgYSBQV00gZHJpdmVyLgo+PiArcHViIHRyYWl0IFB3bU9w
czogJ3N0YXRpYyArIFNpemVkIHsKPj4gKyAgICAvLy8gVGhlIGRyaXZlci1zcGVjaWZpYyBoYXJk
d2FyZSByZXByZXNlbnRhdGlvbiBvZiBhIHdhdmVmb3JtLgo+PiArICAgIC8vLwo+PiArICAgIC8v
LyBUaGlzIHR5cGUgbXVzdCBiZSBbYENvcHlgXSwgW2BEZWZhdWx0YF0sIGFuZCBmaXQgd2l0aGlu
IGBQV01fV0ZIV1NJWkVgLgo+PiArICAgIHR5cGUgV2ZIdzogQ29weSArIERlZmF1bHQ7Cj4gCj4g
Q2Fu4oCZdCB5b3UgdXNlIGEgYnVpbGRfYXNzZXJ0ISgpIGhlcmU/IGkuZS46Cj4gCj4gICAgICNb
ZG9jKGhpZGRlbildCj4gICAgIGNvbnN0IF9DSEVDS19TWjogKCkgPSB7Cj4gICAgICAgICBidWls
ZF9hc3NlcnQhKGNvcmU6Om1lbTo6c2l6ZV9vZjo6PFNlbGY6OldmSHc+KCkgPD0gYmluZGluZ3M6
OlBXTV9XRkhXU0laRSBhcyB1c2l6ZSk7Cj4gICAgIH07CgpUaGlzIGRvZXNuJ3Qgd29yayBpLmUg
dGhlIGRyaXZlciB1c2luZyBvdmVyc2l6ZWQgV2ZIdyBjb21waWxlcwpjb3JyZWN0bHksIGJ1dCBw
dXR0aW5nIHRoZSBhc3NlcnQgaW5zaWRlIHRoZSBzZXJpYWxpemUgZGlkIHdvcmssIHBsZWFzZQpz
ZWUgYmVsb3cuCgoKPiAKPj4gKyAgICAgICAgRXJyKEVOT1RTVVBQKQo+PiArICAgIH0KPj4gKwo+
PiArICAgIC8vLyBDb252ZXJ0IGEgaGFyZHdhcmUtc3BlY2lmaWMgcmVwcmVzZW50YXRpb24gYmFj
ayB0byBhIGdlbmVyaWMgd2F2ZWZvcm0uCj4+ICsgICAgLy8vIFRoaXMgaXMgdHlwaWNhbGx5IGEg
cHVyZSBjYWxjdWxhdGlvbiBhbmQgZG9lcyBub3QgcGVyZm9ybSBJL08uCj4+ICsgICAgZm4gcm91
bmRfd2F2ZWZvcm1fZnJvbWh3KAo+PiArICAgICAgICBfY2hpcDogJkNoaXA8U2VsZj4sCj4+ICsg
ICAgICAgIF9wd206ICZEZXZpY2UsCj4+ICsgICAgICAgIF93Zmh3OiAmU2VsZjo6V2ZIdywKPj4g
KyAgICAgICAgX3dmOiAmbXV0IFdhdmVmb3JtLAo+PiArICAgICkgLT4gUmVzdWx0PGNfaW50PiB7
Cj4+ICsgICAgICAgIEVycihFTk9UU1VQUCkKPj4gKyAgICB9Cj4gCj4gUGxlYXNlIGluY2x1ZGUg
YXQgbGVhc3QgYSBkZXNjcmlwdGlvbiBvZiB3aGF0IHRoaXMgcmV0dXJucy4KCkluc3RlYWQgSSB0
aGluayBpdCBzaG91bGQganVzdCByZXR1cm4gUmVzdWx0LCByZXZpZXdlZCB0aGUgY29kZSBhbmQg
aXQncwpmaW5lLgoKPiAKPj4gKy8vLyBCcmlkZ2VzIFJ1c3QgYFB3bU9wc2AgdG8gdGhlIEMgYHB3
bV9vcHNgIHZ0YWJsZS4KPj4gK3N0cnVjdCBBZGFwdGVyPFQ6IFB3bU9wcz4gewo+PiArICAgIF9w
OiBQaGFudG9tRGF0YTxUPiwKPj4gK30KPj4gKwo+PiAraW1wbDxUOiBQd21PcHM+IEFkYXB0ZXI8
VD4gewo+PiArICAgIGNvbnN0IFZUQUJMRTogUHdtT3BzVlRhYmxlID0gY3JlYXRlX3B3bV9vcHM6
OjxUPigpOwo+PiArCj4+ICsgICAgLy8vICMgU2FmZXR5Cj4+ICsgICAgLy8vCj4+ICsgICAgLy8v
IGB3Zmh3X3B0cmAgbXVzdCBiZSB2YWxpZCBmb3Igd3JpdGVzIG9mIGBzaXplX29mOjo8VDo6V2ZI
dz4oKWAgYnl0ZXMuCj4+ICsgICAgdW5zYWZlIGZuIHNlcmlhbGl6ZV93Zmh3KHdmaHc6ICZUOjpX
Zkh3LCB3Zmh3X3B0cjogKm11dCBjX3ZvaWQpIC0+IFJlc3VsdCB7Cj4+ICsgICAgICAgIGxldCBz
aXplID0gY29yZTo6bWVtOjpzaXplX29mOjo8VDo6V2ZIdz4oKTsKPj4gKyAgICAgICAgaWYgc2l6
ZSA+IGJpbmRpbmdzOjpQV01fV0ZIV1NJWkUgYXMgdXNpemUgewo+PiArICAgICAgICAgICAgcmV0
dXJuIEVycihFSU5WQUwpOwo+PiArICAgICAgICB9Cj4gCj4gU2VlIG15IHByZXZpb3VzIGNvbW1l
bnQgb24gdXNpbmcgYnVpbGRfYXNzZXJ0IGlmIHBvc3NpYmxlLgoKU28gSSBkaWQgdHJ5IHRoaXMg
YW5kIGl0IGRvZXMgd29yaywgaG93ZXZlciBpdCByZXN1bHRzIGluIGEgY3J5cHRpYwpsaW5rZXIg
ZXJyb3I6CmxkLmxsZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1ib2w6IHJ1c3RfYnVpbGRfZXJyb3IK
Pj4+IHJlZmVyZW5jZWQgYnkgcHdtX3RoMTUyMC4yYzJjMzkzODMxMjExNGMtY2d1LjAKPj4+ICAg
ICAgICAgICAgICAgZHJpdmVycy9wd20vcHdtX3RoMTUyMC5vOig8a2VybmVsOjpwd206OkFkYXB0
ZXI8cHdtX3RoMTUyMDo6VGgxNTIwUHdtRHJpdmVyRGF0YT4+OjpyZWFkX3dhdmVmb3JtX2NhbGxi
YWNrKSBpbiBhcmNoaXZlIHZtbGludXguYQo+Pj4gcmVmZXJlbmNlZCBieSBwd21fdGgxNTIwLjJj
MmMzOTM4MzEyMTE0Yy1jZ3UuMAo+Pj4gICAgICAgICAgICAgICBkcml2ZXJzL3B3bS9wd21fdGgx
NTIwLm86KDxrZXJuZWw6OnB3bTo6QWRhcHRlcjxwd21fdGgxNTIwOjpUaDE1MjBQd21Ecml2ZXJE
YXRhPj46OnJvdW5kX3dhdmVmb3JtX3RvaHdfY2FsbGJhY2spIGluIGFyY2hpdmUgdm1saW51eC5h
Cm1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS52bWxpbnV4OjkxOiB2bWxpbnV4XSBFcnJv
ciAxCiAgCkkgYXNzdW1lIHRoaXMgY291bGQgYmUgZml4ZWQgYXQgc29tZSBwb2ludCB0byBiZXR0
ZXIgZXhwbGFpbiB3aGF0CmZhaWxlZD8gSSB0aGluayBwdXR0aW5nIHRoZSBhc3NlcnQgaW4gc2Vy
aWFsaXplIGZ1bmN0aW9ucyBpcyBmaW5lIGFuZAp0aGUgcHJvcG9zZWQgX0NIRUNLX1NaIGlzbid0
IHJlYWxseSByZXF1aXJlZC4KCkkgd291bGQgbG92ZSB0byBkbyBzb21lIGRlYnVnZ2luZyBhbmQg
ZmluZCBvdXQgd2h5IHRoYXQgaXMgbXlzZWxmIGlmCnRpbWUgYWxsb3dzIDotKQoKPiAKPj4gKyAg
ICAgICAgLy8gU0FGRVRZOiBgc2VsZi5hc19yYXcoKWAgcHJvdmlkZXMgYSB2YWxpZCBwb2ludGVy
IGZvciBgc2VsZmAncyBsaWZldGltZS4KPj4gKyAgICAgICAgdW5zYWZlIHsgKCpzZWxmLmFzX3Jh
dygpKS5ucHdtIH0KPj4gKyAgICB9Cj4+ICsKPj4gKyAgICAvLy8gUmV0dXJucyBgdHJ1ZWAgaWYg
dGhlIGNoaXAgc3VwcG9ydHMgYXRvbWljIG9wZXJhdGlvbnMgZm9yIGNvbmZpZ3VyYXRpb24uCj4+
ICsgICAgcHViIGZuIGlzX2F0b21pYygmc2VsZikgLT4gYm9vbCB7Cj4+ICsgICAgICAgIC8vIFNB
RkVUWTogYHNlbGYuYXNfcmF3KClgIHByb3ZpZGVzIGEgdmFsaWQgcG9pbnRlciBmb3IgYHNlbGZg
J3MgbGlmZXRpbWUuCj4+ICsgICAgICAgIHVuc2FmZSB7ICgqc2VsZi5hc19yYXcoKSkuYXRvbWlj
IH0KPj4gKyAgICB9Cj4+ICsKPj4gKyAgICAvLy8gUmV0dXJucyBhIHJlZmVyZW5jZSB0byB0aGUg
ZW1iZWRkZWQgYHN0cnVjdCBkZXZpY2VgIGFic3RyYWN0aW9uLgo+PiArICAgIHB1YiBmbiBkZXZp
Y2UoJnNlbGYpIC0+ICZkZXZpY2U6OkRldmljZSB7Cj4+ICsgICAgICAgIC8vIFNBRkVUWTogYHNl
bGYuYXNfcmF3KClgIHByb3ZpZGVzIGEgdmFsaWQgcG9pbnRlciB0byBgYmluZGluZ3M6OnB3bV9j
aGlwYC4KPj4gKyAgICAgICAgLy8gVGhlIGBkZXZgIGZpZWxkIGlzIGFuIGluc3RhbmNlIG9mIGBi
aW5kaW5nczo6ZGV2aWNlYCBlbWJlZGRlZCB3aXRoaW4gYHB3bV9jaGlwYC4KPj4gKyAgICAgICAg
Ly8gVGFraW5nIGEgcG9pbnRlciB0byB0aGlzIGVtYmVkZGVkIGZpZWxkIGlzIHZhbGlkLgo+PiAr
ICAgICAgICAvLyBgZGV2aWNlOjpEZXZpY2VgIGlzIGAjW3JlcHIodHJhbnNwYXJlbnQpXWAuCj4+
ICsgICAgICAgIC8vIFRoZSBsaWZldGltZSBvZiB0aGUgcmV0dXJuZWQgcmVmZXJlbmNlIGlzIHRp
ZWQgdG8gYHNlbGZgLgo+PiArICAgICAgICB1bnNhZmUgeyBkZXZpY2U6OkRldmljZTo6YXNfcmVm
KCZyYXcgbXV0ICgqc2VsZi5hc19yYXcoKSkuZGV2KSB9Cj4+ICsgICAgfQo+IAo+IElJUkMsIHRo
ZXNlIGFyZSBzdXBwb3NlZCB0byBiZSBwcmVmaXhlZCB3aXRoIOKAnC3igJwgdG8gaGlnaGxpZ2h0
IHRoYXQgaXTigJlzIGEgYnVsbGV0ZWQgbGlzdC4KPiAKPj4gKwo+PiArICAgIC8vLyBHZXRzIHRo
ZSAqdHlwZWQqIGRyaXZlciBzcGVjaWZpYyBkYXRhIGFzc29jaWF0ZWQgd2l0aCB0aGlzIGNoaXAn
cyBlbWJlZGRlZCBkZXZpY2UuCj4gCj4gSSBkb27igJl0IHRoaW5rIHRoaXMgZW1waGFzaXMgYWRk
cyBhbnl0aGluZyBvZiB2YWx1ZS4gKElNSE8pCj4gCj4+ICsgICAgcHViIGZuIGRydmRhdGEoJnNl
bGYpIC0+ICZUIHsKPiAKPiBUaGlzIGlzIG9mZi10b3BpYyAoc29ycnkpLCBidXQgSSB3b25kZXIg
aWYgdGhpcyBzaG91bGRu4oCZdCBiZSByZW5hbWVkIOKAnGRyaXZlcl9kYXRhKCnigJ0gYWNyb3Nz
IHRoZSB0cmVlLgoKQWdyZWUKCgo+IAo+IAo+IOKAlCBEYW5pZWwKPiAKPiBbMF0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcnVzdC1mb3ItbGludXgvMjAyNTA3MTEtZGV2aWNlLWFzLXJlZi12Mi0w
LTFiMTZhYjY0MDJkN0Bnb29nbGUuY29tLwo+IAo+IAoKRm9yIHJlYWRhYmlsaXR5IGN1dCB0aGUg
cmVzdCBvZiB0aGUgY29tbWVudHMsIGJ1dCB0aGV5IHdpbGwgYmUgZml4ZWQKCkJlc3QgcmVnYXJk
cywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
