Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6818CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvEDVWoIyi2+hd4x5yuUu2E9tucqfkIYipI+T8cpWkM=; b=FiJeDw9Nsni78X
	sjBhGTl108IVQLyaajlATc/Km95fah2c4lOVHNa6hWi5B7xpgd9NZi5r0rIAoCwK/agafaplw6SAL
	It1Xq90FsKIJMW8VuOj3Irktjvo5UfC2D/lZ4AEGs+qzg8kC3W3THL+dVBM8ElgrOLVMVYcI9K0yg
	CzvwbhkX1UVQYv5NyIKuE3lbjk665CWlIJAutJ+cq15/gyVEFE9yAKYOHUMBsOdZdcbq16OCOzFkt
	b+rEICpcORmK8CgfRvCt1/1shaJ4q8Z/2Bz1E3LReJZnJ+s8nPotRHvpt8cMM43Grg0jl8+h58t+s
	x6OCC/x639PmR2q3T0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloJ8-0000000AnqY-0T7q;
	Tue, 12 Aug 2025 12:40:50 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullII-0000000ANiv-2QNn
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 09:27:50 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250812092742euoutp02275d961da51e4e039833d6682faddd89~a_uQNdyzr2713027130euoutp02p
	for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 09:27:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250812092742euoutp02275d961da51e4e039833d6682faddd89~a_uQNdyzr2713027130euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754990862;
	bh=g5AHVnaN02SeQdkCUMm3F2XPQfpkP2d1uFtnb+36e6Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BH8Y9mqlR6X9EU5moo2uOBrTPNczuunrcW8Ux10UL2wyrvY6vSPwG4QNWW46ESur9
	 p2aY8bBqiCXDxtdwd7SytNYVQhwDR05pieKCiv73sttnT69PpAG+4Cm0cfBxsh6Ax7
	 brkLi2eSJYaMJ9d6/Zs+7zjt/inUnI/tcYMKuWao=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250812092741eucas1p18ed7f17ece1be26778845f58868fb528~a_uPpEoNJ3008930089eucas1p1V;
	Tue, 12 Aug 2025 09:27:41 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250812092740eusmtip28fd35ea1890563e079e686f04b78ca2c~a_uOfedmj3004730047eusmtip2C;
	Tue, 12 Aug 2025 09:27:40 +0000 (GMT)
Message-ID: <00ea8f31-140f-467f-8083-e1c044afa391@samsung.com>
Date: Tue, 12 Aug 2025 11:27:40 +0200
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
In-Reply-To: <8C20C615-DBF2-4DF9-9AB3-E78C4B1E7493@collabora.com>
X-CMS-MailID: 20250812092741eucas1p18ed7f17ece1be26778845f58868fb528
X-Msg-Generator: CA
X-RootMTR: 20250717090833eucas1p16c916450b59a77d81bd013527755cb21
X-EPHeader: CA
X-CMS-RootMailID: 20250717090833eucas1p16c916450b59a77d81bd013527755cb21
References: <20250717-rust-next-pwm-working-fan-for-sending-v12-0-40f73defae0c@samsung.com>
	<CGME20250717090833eucas1p16c916450b59a77d81bd013527755cb21@eucas1p1.samsung.com>
	<20250717-rust-next-pwm-working-fan-for-sending-v12-3-40f73defae0c@samsung.com>
	<42C9DF97-2E0F-453B-800A-1DA49BF8F29F@collabora.com>
	<8ad10cc3-6e7d-4a8b-b6f6-9568403ee2b3@samsung.com>
	<8C20C615-DBF2-4DF9-9AB3-E78C4B1E7493@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_022748_020507_9F9437D4 
X-CRM114-Status: GOOD (  30.19  )
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

CgpPbiA4LzYvMjUgMTQ6NDksIERhbmllbCBBbG1laWRhIHdyb3RlOgo+IEhpIE1pY2hhbCwKPiAK
Pj4gT24gNCBBdWcgMjAyNSwgYXQgMTk6MjksIE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+IHdyb3RlOgo+Pgo+Pgo+PiBPbiA3LzI1LzI1IDE3OjU2LCBEYW5pZWwg
QWxtZWlkYSB3cm90ZToKPj4+PiArCj4+Pj4gKyAgICAvLy8gR2V0cyB0aGUgbGFiZWwgZm9yIHRo
aXMgUFdNIGRldmljZSwgaWYgYW55Lgo+Pj4+ICsgICAgcHViIGZuIGxhYmVsKCZzZWxmKSAtPiBP
cHRpb248JkNTdHI+IHsKPj4+PiArICAgICAgICAvLyBTQUZFVFk6IHNlbGYuYXNfcmF3KCkgcHJv
dmlkZXMgYSB2YWxpZCBwb2ludGVyLgo+Pj4+ICsgICAgICAgIGxldCBsYWJlbF9wdHIgPSB1bnNh
ZmUgeyAoKnNlbGYuYXNfcmF3KCkpLmxhYmVsIH07Cj4+Pj4gKyAgICAgICAgaWYgbGFiZWxfcHRy
LmlzX251bGwoKSB7Cj4+Pj4gKyAgICAgICAgICAgIE5vbmUKPj4+PiArICAgICAgICB9IGVsc2Ug
ewo+Pj4+ICsgICAgICAgICAgICAvLyBTQUZFVFk6IGxhYmVsX3B0ciBpcyBub24tbnVsbCBhbmQg
cG9pbnRzIHRvIGEgQyBzdHJpbmcKPj4+PiArICAgICAgICAgICAgLy8gbWFuYWdlZCBieSB0aGUg
a2VybmVsLCB2YWxpZCBmb3IgdGhlIGxpZmV0aW1lIG9mIHRoZSBQV00gZGV2aWNlLgo+Pj4+ICsg
ICAgICAgICAgICBTb21lKHVuc2FmZSB7IENTdHI6OmZyb21fY2hhcl9wdHIobGFiZWxfcHRyKSB9
KQo+Pj4+ICsgICAgICAgIH0KPj4+PiArICAgIH0KPj4+Cj4+PiBuaXQ6IHRoaXMgY2FuIGJlIHdy
aXR0ZW4gbW9yZSBjb25jaXNlbHksIGJ1dCBJIHBlcnNvbmFsbHkgZG9u4oCZdCBtaW5kLgo+Pgo+
PiBEbyB5b3UgaGF2ZSBzb21ldGhpbmcgc3BlY2lmaWMgaW4gbWluZCA/IEkgdGhpbmsgdGhlIGFs
dGVybmF0aXZlIHdheSBvZgo+PiBleHByZXNzaW5nIHRoaXMgd291bGQgdXNlIE5vbk51bGwsIGJ1
dCBzb21laG93IHRoaXMgZmVlbHMgbGVzcyByZWFkYWJsZQo+PiBmb3IgbWUuCj4gCj4gWWVzLCBh
biBlYXJseSByZXR1cm4sIGkuZS46Cj4gCj4gaWYgbGFiZWxfcHRyLmlzX251bGwoKSB7Cj4gICBy
ZXR1cm4gTm9uZQo+IH0KPiAKPiBJdCBzYXZlcyB5b3Ugb25lIGxldmVsIG9mIGluZGVudGF0aW9u
IGJ5IHJlbW92aW5nIHRoZSBlbHNlIGJyYW5jaC4KPiAKPj4KPj4KPj4+PiArCj4+Pj4gKy8vLyBU
cmFpdCBkZWZpbmluZyB0aGUgb3BlcmF0aW9ucyBmb3IgYSBQV00gZHJpdmVyLgo+Pj4+ICtwdWIg
dHJhaXQgUHdtT3BzOiAnc3RhdGljICsgU2l6ZWQgewo+Pj4+ICsgICAgLy8vIFRoZSBkcml2ZXIt
c3BlY2lmaWMgaGFyZHdhcmUgcmVwcmVzZW50YXRpb24gb2YgYSB3YXZlZm9ybS4KPj4+PiArICAg
IC8vLwo+Pj4+ICsgICAgLy8vIFRoaXMgdHlwZSBtdXN0IGJlIFtgQ29weWBdLCBbYERlZmF1bHRg
XSwgYW5kIGZpdCB3aXRoaW4gYFBXTV9XRkhXU0laRWAuCj4+Pj4gKyAgICB0eXBlIFdmSHc6IENv
cHkgKyBEZWZhdWx0Owo+Pj4KPj4+IENhbuKAmXQgeW91IHVzZSBhIGJ1aWxkX2Fzc2VydCEoKSBo
ZXJlPyBpLmUuOgo+Pj4KPj4+ICAgICNbZG9jKGhpZGRlbildCj4+PiAgICBjb25zdCBfQ0hFQ0tf
U1o6ICgpID0gewo+Pj4gICAgICAgIGJ1aWxkX2Fzc2VydCEoY29yZTo6bWVtOjpzaXplX29mOjo8
U2VsZjo6V2ZIdz4oKSA8PSBiaW5kaW5nczo6UFdNX1dGSFdTSVpFIGFzIHVzaXplKTsKPj4+ICAg
IH07Cj4+Cj4+IFRoaXMgZG9lc24ndCB3b3JrIGkuZSB0aGUgZHJpdmVyIHVzaW5nIG92ZXJzaXpl
ZCBXZkh3IGNvbXBpbGVzCj4+IGNvcnJlY3RseSwgYnV0IHB1dHRpbmcgdGhlIGFzc2VydCBpbnNp
ZGUgdGhlIHNlcmlhbGl6ZSBkaWQgd29yaywgcGxlYXNlCj4+IHNlZSBiZWxvdy4KPiAKPiBDYW4g
eW91IHNob3cgaG93IGl0IGxvb2tzIGxpa2Ugd2l0aCB0aGUgYnVpbGRfYXNzZXJ0IGluY2x1ZGVk
PyBKdXN0IGFzIGEgc2FuaXR5IGNoZWNrLgoKRm9yIGEgc2FuaXR5IGNoZWNrLCBoZXJl4oCZcyB0
aGUgY29kZSBJIGFkZGVkIHRvIHRoZSBQd21PcHMgdHJhaXQsIGV4YWN0bHkKYXMgeW91IHN1Z2dl
c3RlZDoKCiNbZG9jKGhpZGRlbildCmNvbnN0IF9DSEVDS19TWjogKCkgPSB7CiAgICBidWlsZF9h
c3NlcnQhKGNvcmU6Om1lbTo6c2l6ZV9vZjo6PFNlbGY6OldmSHc+KCkgPD0gYmluZGluZ3M6OlBX
TV9XRkhXU0laRSBhcyB1c2l6ZSk7Cn07CgpUbyB0ZXN0IGl0LCBJIHdlbnQgaW50byB0aGUgcHdt
LXRoMTUyMCBkcml2ZXIgYW5kIGNoYW5nZWQgaXRzIFdmSHcKaW1wbGVtZW50YXRpb24gdG8gYmUg
bGFyZ2VyIHRoYW4gUFdNX1dGSFdTSVpFLiBJIGV4cGVjdGVkIHRoZSBidWlsZCB0bwpmYWlsIGJl
Y2F1c2Ugb2YgdGhlIGJ1aWxkX2Fzc2VydCEsIGJ1dCBpdCBjb21waWxlZCB3aXRob3V0IGFueSBl
cnJvcnMuCgpUaGlzIGlzIHdoeSBJIGNvbmNsdWRlZCBpdCAiZG9lc24ndCB3b3JrIiBpbiB0aGlz
IHBvc2l0aW9uLCB3aGVyZWFzCnBsYWNpbmcgdGhlIGNoZWNrIGluc2lkZSB0aGUgc2VyaWFsaXpl
IGZ1bmN0aW9uIGRpZCBjYXVzZSBhIChsaW5rZXIpCmVycm9yIGFzIGV4cGVjdGVkLiBJJ20gcHJv
YmFibHkgbWlzc2luZyBzb21ldGhpbmcgc3VidGxlIGhlcmUuCgo+IAo+Pgo+Pgo+Pj4KPj4+PiAr
ICAgICAgICBFcnIoRU5PVFNVUFApCj4+Pj4gKyAgICB9Cj4+Pj4gKwo+Pj4+ICsgICAgLy8vIENv
bnZlcnQgYSBoYXJkd2FyZS1zcGVjaWZpYyByZXByZXNlbnRhdGlvbiBiYWNrIHRvIGEgZ2VuZXJp
YyB3YXZlZm9ybS4KPj4+PiArICAgIC8vLyBUaGlzIGlzIHR5cGljYWxseSBhIHB1cmUgY2FsY3Vs
YXRpb24gYW5kIGRvZXMgbm90IHBlcmZvcm0gSS9PLgo+Pj4+ICsgICAgZm4gcm91bmRfd2F2ZWZv
cm1fZnJvbWh3KAo+Pj4+ICsgICAgICAgIF9jaGlwOiAmQ2hpcDxTZWxmPiwKPj4+PiArICAgICAg
ICBfcHdtOiAmRGV2aWNlLAo+Pj4+ICsgICAgICAgIF93Zmh3OiAmU2VsZjo6V2ZIdywKPj4+PiAr
ICAgICAgICBfd2Y6ICZtdXQgV2F2ZWZvcm0sCj4+Pj4gKyAgICApIC0+IFJlc3VsdDxjX2ludD4g
ewo+Pj4+ICsgICAgICAgIEVycihFTk9UU1VQUCkKPj4+PiArICAgIH0KPj4+Cj4+PiBQbGVhc2Ug
aW5jbHVkZSBhdCBsZWFzdCBhIGRlc2NyaXB0aW9uIG9mIHdoYXQgdGhpcyByZXR1cm5zLgo+Pgo+
PiBJbnN0ZWFkIEkgdGhpbmsgaXQgc2hvdWxkIGp1c3QgcmV0dXJuIFJlc3VsdCwgcmV2aWV3ZWQg
dGhlIGNvZGUgYW5kIGl0J3MKPj4gZmluZS4KPj4KPiAKPiBBY2suCj4gCj4+Pgo+Pj4+ICsvLy8g
QnJpZGdlcyBSdXN0IGBQd21PcHNgIHRvIHRoZSBDIGBwd21fb3BzYCB2dGFibGUuCj4+Pj4gK3N0
cnVjdCBBZGFwdGVyPFQ6IFB3bU9wcz4gewo+Pj4+ICsgICAgX3A6IFBoYW50b21EYXRhPFQ+LAo+
Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtpbXBsPFQ6IFB3bU9wcz4gQWRhcHRlcjxUPiB7Cj4+Pj4gKyAg
ICBjb25zdCBWVEFCTEU6IFB3bU9wc1ZUYWJsZSA9IGNyZWF0ZV9wd21fb3BzOjo8VD4oKTsKPj4+
PiArCj4+Pj4gKyAgICAvLy8gIyBTYWZldHkKPj4+PiArICAgIC8vLwo+Pj4+ICsgICAgLy8vIGB3
Zmh3X3B0cmAgbXVzdCBiZSB2YWxpZCBmb3Igd3JpdGVzIG9mIGBzaXplX29mOjo8VDo6V2ZIdz4o
KWAgYnl0ZXMuCj4+Pj4gKyAgICB1bnNhZmUgZm4gc2VyaWFsaXplX3dmaHcod2ZodzogJlQ6Oldm
SHcsIHdmaHdfcHRyOiAqbXV0IGNfdm9pZCkgLT4gUmVzdWx0IHsKPj4+PiArICAgICAgICBsZXQg
c2l6ZSA9IGNvcmU6Om1lbTo6c2l6ZV9vZjo6PFQ6OldmSHc+KCk7Cj4+Pj4gKyAgICAgICAgaWYg
c2l6ZSA+IGJpbmRpbmdzOjpQV01fV0ZIV1NJWkUgYXMgdXNpemUgewo+Pj4+ICsgICAgICAgICAg
ICByZXR1cm4gRXJyKEVJTlZBTCk7Cj4+Pj4gKyAgICAgICAgfQo+Pj4KPj4+IFNlZSBteSBwcmV2
aW91cyBjb21tZW50IG9uIHVzaW5nIGJ1aWxkX2Fzc2VydCBpZiBwb3NzaWJsZS4KPj4KPj4gU28g
SSBkaWQgdHJ5IHRoaXMgYW5kIGl0IGRvZXMgd29yaywgaG93ZXZlciBpdCByZXN1bHRzIGluIGEg
Y3J5cHRpYwo+PiBsaW5rZXIgZXJyb3I6Cj4+IGxkLmxsZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1i
b2w6IHJ1c3RfYnVpbGRfZXJyb3IKPj4+Pj4gcmVmZXJlbmNlZCBieSBwd21fdGgxNTIwLjJjMmMz
OTM4MzEyMTE0Yy1jZ3UuMAo+Pj4+PiAgICAgICAgICAgICAgZHJpdmVycy9wd20vcHdtX3RoMTUy
MC5vOig8a2VybmVsOjpwd206OkFkYXB0ZXI8cHdtX3RoMTUyMDo6VGgxNTIwUHdtRHJpdmVyRGF0
YT4+OjpyZWFkX3dhdmVmb3JtX2NhbGxiYWNrKSBpbiBhcmNoaXZlIHZtbGludXguYQo+Pj4+PiBy
ZWZlcmVuY2VkIGJ5IHB3bV90aDE1MjAuMmMyYzM5MzgzMTIxMTRjLWNndS4wCj4+Pj4+ICAgICAg
ICAgICAgICBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLm86KDxrZXJuZWw6OnB3bTo6QWRhcHRlcjxw
d21fdGgxNTIwOjpUaDE1MjBQd21Ecml2ZXJEYXRhPj46OnJvdW5kX3dhdmVmb3JtX3RvaHdfY2Fs
bGJhY2spIGluIGFyY2hpdmUgdm1saW51eC5hCj4+IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtl
ZmlsZS52bWxpbnV4OjkxOiB2bWxpbnV4XSBFcnJvciAxCj4+Cj4+IEkgYXNzdW1lIHRoaXMgY291
bGQgYmUgZml4ZWQgYXQgc29tZSBwb2ludCB0byBiZXR0ZXIgZXhwbGFpbiB3aGF0Cj4+IGZhaWxl
ZD8gSSB0aGluayBwdXR0aW5nIHRoZSBhc3NlcnQgaW4gc2VyaWFsaXplIGZ1bmN0aW9ucyBpcyBm
aW5lIGFuZAo+PiB0aGUgcHJvcG9zZWQgX0NIRUNLX1NaIGlzbid0IHJlYWxseSByZXF1aXJlZC4K
Pj4KPj4gSSB3b3VsZCBsb3ZlIHRvIGRvIHNvbWUgZGVidWdnaW5nIGFuZCBmaW5kIG91dCB3aHkg
dGhhdCBpcyBteXNlbGYgaWYKPj4gdGltZSBhbGxvd3MgOi0pCj4gCj4gVGhlcmUgaXMgbm90aGlu
ZyB3cm9uZyBoZXJlLiBBIGNhbm9uaWNhbCBSdXN0LWZvci1MaW51eCBleHBlcmllbmNlIGlzIHN0
dW1ibGluZwo+IHVwb24gdGhlIGVycm9yIGdlbmVyYXRlZCBieSBidWlsZF9hc3NlcnQgYW5kIGJl
aW5nIHJpZ2h0bHkgY29uZnVzZWQuIFBlb3BsZSBhc2sKPiBhYm91dCB0aGlzIGV2ZXJ5IGZldyBt
b250aHMgOikKPiAKPiBUaGlzIGp1c3QgbWVhbnMgdGhhdCB0aGUgYnVpbGRfYXNzZXJ0IHRyaWdn
ZXJlZCBhbmQgdGhlIGJ1aWxkIGZhaWxlZCBhcyBhCj4gcmVzdWx0LiBJT1csIGl0IG1lYW5zIHRo
YXQgeW91ciBidWlsZF9hc3NlcnQgaXMgd29ya2luZyBwcm9wZXJseSB0byBjYXRjaAo+IGVycm9y
cy4KClllYWggaXQgaXMgd29ya2luZyBjb3JyZWN0bHksIEkgd2FzIGp1c3QgaG9waW5nIGVycm9y
cyBjYW4gYmUgc29tZWhvdwptYWRlIG1vcmUgaW5mb3JtYXRpdmUgOi0pLCBidXQgaXQgaXMgaGFy
ZCBhbmQgd291bGQgcmVxdWlyZSBzb21lIHN1cHBvcnQKZnJvbSBjb21waWxlciBhcyBJIGltYWdp
bmUuCgo+IAo+IOKAlCBEYW5pZWwKPiAKPiAKCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxj
enluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
