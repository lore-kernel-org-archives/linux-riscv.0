Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B30EE87839
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmM6/r5wx5V5LJZp3oLM1Hm2XFMmDHQGvR85vzEmcJo=; b=DwfDWTki/sJ9kD
	SUMHFbDNrthVn9R69YWevTCwkrVXaixbWRGTEeA9ptNtg45mz4jZnuHs+lPki4XDF18gFOVEVXkN2
	47rYrr6ajcu8YnXe4QJsXNJf7Cmo8lGL7+dt1EjWiMG73hWrtqcYc2WfMw6xAtDaHS1r7VWyDrAcG
	M7ppx5kVrra8/scPypFda+cKojQQjbd8pUAsJwSBLviubnXWJLbHsMCUK3rfPYXjMNV4AVVnZ8pcj
	G2NHfjQ9obIFTp8Q0GYm2imqJSe1gwGZbeYfOSjUILYWpGkU+mmfXJmQs0J15phM+nlY726TPCzzs
	NGoDpryZiM+8OuWnjv2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHEl-00000006k8W-0yaN;
	Tue, 03 Feb 2026 14:18:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHEj-00000006k7p-1whv
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 14:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770128313;
	bh=7znWxXYIyAFor7GBuPQ2iXaTErwfqu61GaPtTURriHE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qvZA1lAt8ZY/5dEMmWSkR8L29JOmH/j4xZl98vyrl2DG/cLP2IhKeHPZAD6pz4OA1
	 g7mKVbvOzPfqqxcYxYwFq1mogaUBhh7Ao3fPd83SvvnAuxD5HhWIII9j2bb2fV4j/9
	 sDkP/3NmyDhV9xJnpYLup9AbtDdpSqzgPeZ11dAU81QbRQ/FVIBVP5A9BrcLxECw7j
	 7fZe4VVivXBnAJEQEU1Emc8VdQ/w6R9fGX7FfnxHLT/WWC31+QdnPVzUe5zaE/ks9X
	 Gz+wZ6OXmiy4g5ujtJB8f50rWEc3rvBzRHTiQRtQws0A3NWeQjp0MNm3AbfhRrm3Bo
	 SGzG3aL2hXr9A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FADB17E1276;
	Tue,  3 Feb 2026 15:18:32 +0100 (CET)
Date: Tue, 3 Feb 2026 15:18:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?= <ukleinek@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260203151828.669c29cb@fedora>
In-Reply-To: <E786E2B1-E233-45D3-923D-A2DBA54BB166@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
	<DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
	<20260202171038.10e51e18@fedora>
	<20260203100913.6d224657@fedora>
	<E786E2B1-E233-45D3-923D-A2DBA54BB166@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_061837_658208_3AE1781B 
X-CRM114-Status: GOOD (  24.39  )
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

T24gVHVlLCAzIEZlYiAyMDI2IDEwOjM3OjE1IC0wMzAwCkRhbmllbCBBbG1laWRhIDxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gPiBPbiAzIEZlYiAyMDI2LCBhdCAwNjow
OSwgQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6
Cj4gPiAKPiA+IEhlbGxvIERhbmllbCwKPiA+IAo+ID4gT24gTW9uLCAyIEZlYiAyMDI2IDE3OjEw
OjM4ICswMTAwCj4gPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEu
Y29tPiB3cm90ZToKPiA+ICAgCj4gPj4+PiAtI1twaW5fZGF0YShQaW5uZWREcm9wKV0KPiA+Pj4+
ICsjW3Bpbl9kYXRhXQo+ID4+Pj4gcHViKGNyYXRlKSBzdHJ1Y3QgVHlyRGF0YSB7Cj4gPj4+PiAg
ICAgcHViKGNyYXRlKSBwZGV2OiBBUmVmPHBsYXRmb3JtOjpEZXZpY2U+LAo+ID4+Pj4gCj4gPj4+
PiBAQCAtOTIsMTMgKzkyLDkgQEAgZm4gcHJvYmUoCj4gPj4+PiAgICAgICAgIHBkZXY6ICZwbGF0
Zm9ybTo6RGV2aWNlPENvcmU+LAo+ID4+Pj4gICAgICAgICBfaW5mbzogT3B0aW9uPCZTZWxmOjpJ
ZEluZm8+LAo+ID4+Pj4gICAgICkgLT4gaW1wbCBQaW5Jbml0PFNlbGYsIEVycm9yPiB7Cj4gPj4+
PiAtICAgICAgICBsZXQgY29yZV9jbGsgPSBDbGs6OmdldChwZGV2LmFzX3JlZigpLCBTb21lKGNf
c3RyISgiY29yZSIpKSk/Owo+ID4+Pj4gLSAgICAgICAgbGV0IHN0YWNrc19jbGsgPSBPcHRpb25h
bENsazo6Z2V0KHBkZXYuYXNfcmVmKCksIFNvbWUoY19zdHIhKCJzdGFja3MiKSkpPzsKPiA+Pj4+
IC0gICAgICAgIGxldCBjb3JlZ3JvdXBfY2xrID0gT3B0aW9uYWxDbGs6OmdldChwZGV2LmFzX3Jl
ZigpLCBTb21lKGNfc3RyISgiY29yZWdyb3VwIikpKT87Cj4gPj4+PiAtCj4gPj4+PiAtICAgICAg
ICBjb3JlX2Nsay5wcmVwYXJlX2VuYWJsZSgpPzsKPiA+Pj4+IC0gICAgICAgIHN0YWNrc19jbGsu
cHJlcGFyZV9lbmFibGUoKT87Cj4gPj4+PiAtICAgICAgICBjb3JlZ3JvdXBfY2xrLnByZXBhcmVf
ZW5hYmxlKCk/Owo+ID4+Pj4gKyAgICAgICAgbGV0IGNvcmVfY2xrID0gQ2xrOjo8RW5hYmxlZD46
OmdldChwZGV2LmFzX3JlZigpLCBTb21lKGNfc3RyISgiY29yZSIpKSk/OyAgICAgIAo+ID4+PiAK
PiA+Pj4gQWgsIG1vcmUgdHVyYm9maXNoLi4gSSdkIHJlYWxseSB3YW50IHRvIGF2b2lkIHRoZW0g
aWYgcG9zc2libGUuCj4gPj4+IAo+ID4+PiBBbnkgZGlzYWR2YW50YWdlIG9uIGp1c3QgYXNrIHRo
ZSB1c2VyIHRvIGNoYWluIGAuZ2V0KCkucHJlcGFyZV9lbmFibGUoKT9gPyBUaGlzCj4gPj4+IHdh
eSBpdCBpcyBhbHNvIGNsZWFyIHRoYXQgc29tZSBhY3Rpb24gaXMgcGVyZm9ybWVkLiAgICAKPiA+
PiAKPiA+PiBJJ3ZlIGp1c3QgZGlzYyAgCj4gPiAKPiA+IFNvcnJ5LCBJJ3ZlIGhpdCB0aGUgcmVw
bHkgYnV0dG9uIGJlZm9yZSBJIGhhZCBmaW5pc2hlZCB3cml0aW5nIG15Cj4gPiBhbnN3ZXIuIFNv
IEkgd2FzIGFib3V0IHRvIHNheSB0aGF0IEkgaGFkIHN0YXJ0ZWQgd3JpdGluZyBzb21ldGhpbmcK
PiA+IHNpbWlsYXIgd2l0aG91dCBrbm93aW5nIHRoaXMgc2VyaWVzIGV4aXN0ZWQsIGFuZCBJIGZl
ZWwgbGlrZSB3ZSdkIGRvbid0Cj4gPiByZWFsbHkgbmVlZCB0aG9zZSBwcmVwYXJlX2VuYWJsZSgp
IHNob3J0Y3V0cyB0aGF0IGV4aXN0IGluIEMuIFdlIG1pZ2h0Cj4gPiBoYXMgd2VsbCBqdXN0IGdv
Ogo+ID4gCj4gPiBDbGs6OmdldChkZXYsIFNvbWUoY19zdHIhKCJjb3JlIikpKS5wcmVwYXJlKCk/
LmVuYWJsZSgpPzsKPiA+IAo+ID4gYW5kIGhhdmUgdGhlIGZvbGxvd2luZyB2YXJpYW50LXNwZWNv
Zm9jIGZ1bmN0aW9ucwo+ID4gCj4gPiAtIENsazxVbnByZXBhcmVkPjo6Z2V0W19vcHRpb25hbF0o
KSAobm8gZ2V0IG9uIFByZXBhcmVkIGFuZCBFbmFibGVkCj4gPiAgdmFyaWFudHMpCj4gPiAtIENs
azxVbnByZXBhcmVkPjo6cHJlcGFyZSgpCj4gPiAtIENsazxQcmVwYXJlZD46OntlbmFibGUsdW5w
cmVwYXJlfSgpCj4gPiAtIENsazxFbmFibGVkPjo6e2Rpc2FibGV9KCkKPiA+IAo+ID4gUmVnYXJk
cywKPiA+IAo+ID4gQm9yaXMKPiA+IAo+ID4gICAKPiAKPiAKPiBJIGRvbuKAmXQgdW5kZXJzdGFu
ZCBob3cgaXMgdGhpcyBiZXR0ZXIgdGhhbiB0aGUgdHVyYm9maXNoIHdlIGN1cnJlbnRseSBoYXZl
Lgo+IAo+IEluIG90aGVyIHdvcmRzLCBob3cgaXMgdGhpczoKPiAKPiBDbGs6OmdldChkZXYsIFNv
bWUoY19zdHIhKCJjb3JlIikpKS5wcmVwYXJlKCk/LmVuYWJsZSgpPzsKPiAKPiBCZXR0ZXIgdGhh
biB0aGlzOgo+IAo+IENsazo6PEVuYWJsZWQ+OjpnZXQoLyrigKYqLyk7CgpGb3Igb25lLCBpdCBk
b2Vzbid0IGZvcmNlIHlvdSB0byBleHBvc2UgbXVsdGlwbGUgZnVuY3Rpb25zIGluIHRoZQppbXBs
ZW1lbnRhdGlvbiAoOjpnZXRbX29wdGlvbmFsXSgpIGlzIG9ubHkgcHJlc2VudCBpbiB0aGUgVW5w
cmVwYXJlZAppbXBsIHZhcmlhbnQsIG5vIHNob3J0Y3V0IHRvIGNvbWJpbmUgc3RhdGUgdHJhbnNp
dGlvbiwgLi4uKSB3aGljaCBtZWFucwpsZXNzIGNvZGUgdG8gbWFpbnRhaW4gb3ZlcmFsbC4gQnV0
IEkgYWxzbyBwcmVmZXIgdGhlIGZhY3QgdGhpcyBjbGVhcmx5CnJlZmxlY3RzIHRoZSBzdGF0ZSB0
cmFuc2l0aW9ucyB0aGF0IGV4aXN0IHRvIGdldCBhbiBFbmFibGVkIGNsayAoZmlyc3QKeW91IGdl
dCBhbiBVbnByZXBhcmVkIGNsayB0aGF0IHlvdSBoYXZlIHRvIHByZXBhcmUgYW5kIGVuYWJsZSB0
byB0dXJuCnRoYXQgaW50byBhbiBFbmFibGVkIGNsaykuIFRoYXQncyBhIG1hdHRlciBvZiB0YXN0
ZSBvZiBjb3Vyc2UsIGp1c3QKc2F5aW5nIHRoYXQgaWYgd2UgZ2V0IHJpZCBvZiB0aGUgdHVyYm9m
aXNoIHN5bnRheCBsaWtlIEdhcnkgc3VnZ2VzdGVkCmF0IHNvbWUgcG9pbnQsIEkgdGhpbmsgSSdk
IGZpbmQgaXQgY2xlYXJlciB0byBhbHNvIGp1c3QgZXhwb3NlIHRoZQp0cmFuc2l0aW9ucyBiZXR3
ZWVuIHR3byBjb25zZWN1dGl2ZSBzdGF0ZXMsIGFuZCBsZXQgdGhlIGNhbGxlciBnbwp0aHJvdWdo
IGFsbCB0aGUgc3RlcHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
