Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B60EC54FB3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jun 2025 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NqqVeI7tSMgM/fCQDRXcvwaqFrJfC4+eSPoz52dLics=; b=rwQwrSxPpPb6V4
	53U9s8/b5xmtXjFQ9EGBsMOoSJ4HB9kd4GcZIaIDEsqGUQcvReF1m1+Wri79L8nqN2IokUIGnxfUT
	gaqiwNUGdOfdS2RlsMM1mMm357nSUUAG7Qjq6KGRkEc8pIf0UIe00M9DDZCcsrk1dQjEkTEtfqRf0
	BwE0y3Fk/RWfaifAVt0TYM/Rgb6KlsNVqROb4ZkBLrtRoUUmS4uOALodNiTv1/w9YIkhkEzYMrvD7
	i6P3De0no+dg9JrIEdZVniNcOpQ1HChv91rTSYm88hI40Q5yAJzSSWIjBafr+y28dd3xSfmJqIV7O
	lyNzLOlWGyfkYcUNOD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLdTJ-000000052wD-0cgD;
	Sun, 01 Jun 2025 07:51:09 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLdTD-000000052vl-1TBT
	for linux-riscv@lists.infradead.org;
	Sun, 01 Jun 2025 07:51:08 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250601075055euoutp02000faeed27b320c71c7fa3e77552a47c~E29McJ2tQ2237322373euoutp02H
	for <linux-riscv@lists.infradead.org>; Sun,  1 Jun 2025 07:50:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250601075055euoutp02000faeed27b320c71c7fa3e77552a47c~E29McJ2tQ2237322373euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748764255;
	bh=hqMY6JBjFHLi1UGuQGIN1VxhuxOXkbW6BShlkS0Hdbw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=UGCFgDVRJfMsNd/HFXPrc3FxhgoON0esubBU904ELGdFgoc5nag30aAx/Zq6I6Anq
	 wU81Hq0tIJkAqltlzi08+tzT/6bx9zT4Xg5krOQ6NwdpjEagLv6hDb7i0fNyU8I7Bo
	 aJU1ON/FyAqKxKsp6hdOAPnSeEr8mfb6diXcIBC0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250601075053eucas1p1a6f3d7c11210b61ea1d0c62f7f52cabd~E29LH_2j60784107841eucas1p1m;
	Sun,  1 Jun 2025 07:50:53 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250601075052eusmtip272f1587c5683112656d6389dcaa6908e~E29KC_7vN1949419494eusmtip2B;
	Sun,  1 Jun 2025 07:50:52 +0000 (GMT)
Message-ID: <61eecafb-8ad1-4306-88cb-a032eefb2e48@samsung.com>
Date: Sun, 1 Jun 2025 09:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] riscv: dts: thead: Add PVT node
To: Drew Fustini <drew@pdp7.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Miguel Ojeda
	<ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng
	<boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice
	Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
	Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <aDVxDJi0KkWXiPCK@x1>
X-CMS-MailID: 20250601075053eucas1p1a6f3d7c11210b61ea1d0c62f7f52cabd
X-Msg-Generator: CA
X-RootMTR: 20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01
X-EPHeader: CA
X-CMS-RootMailID: 20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
	<CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
	<20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
	<aDVxDJi0KkWXiPCK@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_005103_968402_013C911B 
X-CRM114-Status: GOOD (  19.16  )
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

CgpPbiA1LzI3LzI1IDEwOjAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4gT24gU2F0LCBNYXkgMjQs
IDIwMjUgYXQgMTE6MTQ6NTlQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kgd3JvdGU6Cj4+IEFk
ZCBQVlQgRFQgbm9kZSBmb3IgdGhlcm1hbCBzZW5zb3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1p
Y2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4+IC0tLQo+PiAgYXJj
aC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8IDExICsrKysrKysrKysrCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhl
YWQvdGgxNTIwLmR0c2kKPj4gaW5kZXggZjI0ZTEyZDcyNTlmYWJjZmJkYzJkZmE5NjZkNzU5ZGIw
NjY4NGFiNC4uZmFmNWMzYWFmMjA5YjI0Y2Q5OWRkYzM3N2E4OGUwOGE4Y2NlMjRmZSAxMDA2NDQK
Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+PiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4+IEBAIC02NDgsNiArNjQ4LDE3
IEBAIHBhZGN0cmxfYW9zeXM6IHBpbmN0cmxAZmZmZmY0YTAwMCB7Cj4+ICAJCQl0aGVhZCxwYWQt
Z3JvdXAgPSA8MT47Cj4+ICAJCX07Cj4+ICAKPj4gKwkJcHZ0OiBwdnRAZmZmZmY0ZTAwMCB7Cj4+
ICsJCQljb21wYXRpYmxlID0gIm1vb3J0ZWMsbXI3NTIwMyI7Cj4+ICsJCQlyZWcgPSA8MHhmZiAw
eGZmZjRlMDAwIDB4MCAweDgwPiwKPj4gKwkJCSAgICAgIDwweGZmIDB4ZmZmNGUwODAgMHgwIDB4
MTAwPiwKPj4gKwkJCSAgICAgIDwweGZmIDB4ZmZmNGUxODAgMHgwIDB4NjgwPiwKPj4gKwkJCSAg
ICAgIDwweGZmIDB4ZmZmNGU4MDAgMHgwIDB4NjAwPjsKPj4gKwkJCXJlZy1uYW1lcyA9ICJjb21t
b24iLCAidHMiLCAicGQiLCAidm0iOwo+PiArCQkJY2xvY2tzID0gPCZhb25zeXNfY2xrPjsKPj4g
KwkJCSN0aGVybWFsLXNlbnNvci1jZWxscyA9IDwxPjsKPj4gKwkJfTsKPj4gKwo+PiAgCQlncGlv
QGZmZmZmNTIwMDAgewo+PiAgCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1ncGlvIjsKPj4g
IAkJCXJlZyA9IDwweGZmIDB4ZmZmNTIwMDAgMHgwIDB4MTAwMD47Cj4+Cj4+IC0tIAo+PiAyLjM0
LjEKPj4KPiAKPiBJIGZvdW5kIHRoYXQgb24gbXkgbHBpNGEgdGhhdCBib290IHdoaWxlIGhhbmcg
YWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaC4KPiBJIHRoaW5rIHRoYXQgaXQgaXMgcmVsYXRlZCB0
byBjbG9ja3MgYXMgYm9vdCBmaW5pc2hlZCBva2F5IHdoZW4gdXNpbmcKPiBjbGtfaWdub3JlX3Vu
dXNlZCBvbiB0aGUga2VybmVsIGNtZGxpbmUuIERvIHlvdSBoYXBwZW4gaGF2ZSB0aGF0IGluIHlv
dXIKPiBrZXJuZWwgY21kbGluZT8KPiAKPiBJIG5lZWQgdG8gaW52ZXN0aWdhdGUgZnVydGhlciB0
byB1bmRlcnN0YW5kIHdoaWNoIGNsb2NrcyBhcmUgY2F1c2luZyB0aGUKPiBwcm9ibGVtLgo+IAo+
IFRoYW5rcywKPiBEcmV3Cj4gCgpUaGFua3MgZm9yIHlvdXIgZWFybGllciBtZXNzYWdlLiBJJ3Zl
IGludmVzdGlnYXRlZCwgYW5kIHlvdSB3ZXJlIHJpZ2h0CmFib3V0IHRoZSBjbG9ja3Mg4oCTIHRo
ZSBzcGVjaWZpYyBvbmUgY2F1c2luZyB0aGUgaGFuZyBpcyBDTEtfQ1BVMkFPTl9YMkguCgpUaGlz
IGFwcGVhcnMgdG8gYmUgYW4gQUhCIGJ1cyBjbG9jayByZXF1aXJlZCBmb3IgQ1BVIGFjY2VzcyB0
byB0aGUgQU9OCmRvbWFpbi4gTXkgcHJvcG9zZWQgc29sdXRpb24gaXMgdG8gbWFrZSB0aGUgcHZ0
IG5vZGUgYSBjaGlsZCBvZiBhIG5ldwpwYXJlbnQgYnVzIG5vZGUgaW4gdGhlIERldmljZSBUcmVl
LiBUaGlzIG5ldyAiQU9OIGJ1cyIgbm9kZSB3b3VsZCB0aGVuCmV4cGxpY2l0bHkgcmVxdWVzdCBh
bmQgbWFuYWdlIENMS19DUFUyQU9OX1gySCwgZW5zdXJpbmcgaXQncyBlbmFibGVkCndoZW4gaXRz
IGNoaWxkcmVuIGFyZSBhY2Nlc3NlZC4KCldoYXQgYXJlIHlvdXIgdGhvdWdodHMgb24gdGhpcyBh
cHByb2FjaD8KCkJlc3QgcmVnYXJkcywKLS0gCk1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5z
a2lAc2Ftc3VuZy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
