Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07D7E87827
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRQceZJ3P34u2500zP4txTjfjcD2j4Zm0OokKgS5M24=; b=VgP0mx7HWl9lDj
	EZrNtKx9O599jeyz1LcQHOqMrUez6I0sAbordzt4lDOFDFiXG72cyMRtODVYY8F2+RWOHYkJVSAsH
	KBDR3mNtPQMsaipmWagHTWXMFi752QaufPdnptb9+r2qnnZi9Ov9BGTqROBfW9vgvdtXwrC9itKWl
	ubFIlK6/IMW77/Ev9qxyJa5qxI504wLXbhOgUjITGv7azMJf6QrI1/i1r8Sc924JtK862uGenQNtC
	Nnu+1NPP3W4qrNo6CaaCiownISqHfZrBxa+CWgHU7dHU7Km5lwNAwWFwIOKU7uzyPJHBrsfuR1q/Z
	GM8WWyeAuySy7RKH+/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGbK-00000006gb4-2npO;
	Tue, 03 Feb 2026 13:37:54 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGbI-00000006gYp-0n3w
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770125858; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jyI4meaWQ7AMWPlr3ocZeP4a8Leb/wZOp6iLnXi41aC7iUIHpQuEGlDlwkLwa+f7H4TLTJisCBJT8Clo30XcZi5xvOAlCWZabHyL+2GXK8GUTG3qHYqcjUoH412VFP4nasbIC6Kiak7FB1NMfNpgh4KHyQcxxNOZSx4ADoGRBvs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770125858; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cJJwZPpkNEwlLug5p0tuaBK7xgapljD5Xt4JXpkrlyw=; 
	b=MRa59Jwa7oNC5AYrn5rgeKyRz6HAyygP+X1pqE9EynAdArLENNm1NR9e1tzJDLNO0C8ksqvfvTbgeSWc+PnCPC1m7BccbXw7NUq/MPayX4XJWouUPdopkDonMkq1r5s8ZS4Z1Th/AVTqNqRU5hAQ7g4JfB+x1u3+My0hD0Ci/vw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770125858;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=cJJwZPpkNEwlLug5p0tuaBK7xgapljD5Xt4JXpkrlyw=;
	b=gqfrGukEUbepacr6QOMH1Ji7Ud533J90A6PfT/bryn8vRrSuE+XWziJoQwD5x0SU
	ThakrPXNSrs/P4CkGg9JH5P4MyVAK7qNv2ESK8H9PHp8yhOgXJiyjuyTerOjgPYnxN3
	YEjh6zBSDKCrzpLDwMuk0dpA9fMfPm7FItPtVY3Y=
Received: by mx.zohomail.com with SMTPS id 1770125856001677.2359332250752;
	Tue, 3 Feb 2026 05:37:36 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203100913.6d224657@fedora>
Date: Tue, 3 Feb 2026 10:37:15 -0300
Cc: Gary Guo <gary@garyguo.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Message-Id: <E786E2B1-E233-45D3-923D-A2DBA54BB166@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net> <20260202171038.10e51e18@fedora>
 <20260203100913.6d224657@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_053752_296212_3A7889A5 
X-CRM114-Status: GOOD (  13.66  )
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

Cgo+IE9uIDMgRmViIDIwMjYsIGF0IDA2OjA5LCBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXpp
bGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiAKPiBIZWxsbyBEYW5pZWwsCj4gCj4gT24gTW9u
LCAyIEZlYiAyMDI2IDE3OjEwOjM4ICswMTAwCj4gQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4gCj4+Pj4gLSNbcGluX2RhdGEoUGlubmVkRHJv
cCldCj4+Pj4gKyNbcGluX2RhdGFdCj4+Pj4gcHViKGNyYXRlKSBzdHJ1Y3QgVHlyRGF0YSB7Cj4+
Pj4gICAgIHB1YihjcmF0ZSkgcGRldjogQVJlZjxwbGF0Zm9ybTo6RGV2aWNlPiwKPj4+PiAKPj4+
PiBAQCAtOTIsMTMgKzkyLDkgQEAgZm4gcHJvYmUoCj4+Pj4gICAgICAgICBwZGV2OiAmcGxhdGZv
cm06OkRldmljZTxDb3JlPiwKPj4+PiAgICAgICAgIF9pbmZvOiBPcHRpb248JlNlbGY6OklkSW5m
bz4sCj4+Pj4gICAgICkgLT4gaW1wbCBQaW5Jbml0PFNlbGYsIEVycm9yPiB7Cj4+Pj4gLSAgICAg
ICAgbGV0IGNvcmVfY2xrID0gQ2xrOjpnZXQocGRldi5hc19yZWYoKSwgU29tZShjX3N0ciEoImNv
cmUiKSkpPzsKPj4+PiAtICAgICAgICBsZXQgc3RhY2tzX2NsayA9IE9wdGlvbmFsQ2xrOjpnZXQo
cGRldi5hc19yZWYoKSwgU29tZShjX3N0ciEoInN0YWNrcyIpKSk/Owo+Pj4+IC0gICAgICAgIGxl
dCBjb3JlZ3JvdXBfY2xrID0gT3B0aW9uYWxDbGs6OmdldChwZGV2LmFzX3JlZigpLCBTb21lKGNf
c3RyISgiY29yZWdyb3VwIikpKT87Cj4+Pj4gLQo+Pj4+IC0gICAgICAgIGNvcmVfY2xrLnByZXBh
cmVfZW5hYmxlKCk/Owo+Pj4+IC0gICAgICAgIHN0YWNrc19jbGsucHJlcGFyZV9lbmFibGUoKT87
Cj4+Pj4gLSAgICAgICAgY29yZWdyb3VwX2Nsay5wcmVwYXJlX2VuYWJsZSgpPzsKPj4+PiArICAg
ICAgICBsZXQgY29yZV9jbGsgPSBDbGs6OjxFbmFibGVkPjo6Z2V0KHBkZXYuYXNfcmVmKCksIFNv
bWUoY19zdHIhKCJjb3JlIikpKT87ICAgIAo+Pj4gCj4+PiBBaCwgbW9yZSB0dXJib2Zpc2guLiBJ
J2QgcmVhbGx5IHdhbnQgdG8gYXZvaWQgdGhlbSBpZiBwb3NzaWJsZS4KPj4+IAo+Pj4gQW55IGRp
c2FkdmFudGFnZSBvbiBqdXN0IGFzayB0aGUgdXNlciB0byBjaGFpbiBgLmdldCgpLnByZXBhcmVf
ZW5hYmxlKCk/YD8gVGhpcwo+Pj4gd2F5IGl0IGlzIGFsc28gY2xlYXIgdGhhdCBzb21lIGFjdGlv
biBpcyBwZXJmb3JtZWQuICAKPj4gCj4+IEkndmUganVzdCBkaXNjCj4gCj4gU29ycnksIEkndmUg
aGl0IHRoZSByZXBseSBidXR0b24gYmVmb3JlIEkgaGFkIGZpbmlzaGVkIHdyaXRpbmcgbXkKPiBh
bnN3ZXIuIFNvIEkgd2FzIGFib3V0IHRvIHNheSB0aGF0IEkgaGFkIHN0YXJ0ZWQgd3JpdGluZyBz
b21ldGhpbmcKPiBzaW1pbGFyIHdpdGhvdXQga25vd2luZyB0aGlzIHNlcmllcyBleGlzdGVkLCBh
bmQgSSBmZWVsIGxpa2Ugd2UnZCBkb24ndAo+IHJlYWxseSBuZWVkIHRob3NlIHByZXBhcmVfZW5h
YmxlKCkgc2hvcnRjdXRzIHRoYXQgZXhpc3QgaW4gQy4gV2UgbWlnaHQKPiBoYXMgd2VsbCBqdXN0
IGdvOgo+IAo+IENsazo6Z2V0KGRldiwgU29tZShjX3N0ciEoImNvcmUiKSkpLnByZXBhcmUoKT8u
ZW5hYmxlKCk/Owo+IAo+IGFuZCBoYXZlIHRoZSBmb2xsb3dpbmcgdmFyaWFudC1zcGVjb2ZvYyBm
dW5jdGlvbnMKPiAKPiAtIENsazxVbnByZXBhcmVkPjo6Z2V0W19vcHRpb25hbF0oKSAobm8gZ2V0
IG9uIFByZXBhcmVkIGFuZCBFbmFibGVkCj4gIHZhcmlhbnRzKQo+IC0gQ2xrPFVucHJlcGFyZWQ+
OjpwcmVwYXJlKCkKPiAtIENsazxQcmVwYXJlZD46OntlbmFibGUsdW5wcmVwYXJlfSgpCj4gLSBD
bGs8RW5hYmxlZD46OntkaXNhYmxlfSgpCj4gCj4gUmVnYXJkcywKPiAKPiBCb3Jpcwo+IAo+IAoK
CkkgZG9u4oCZdCB1bmRlcnN0YW5kIGhvdyBpcyB0aGlzIGJldHRlciB0aGFuIHRoZSB0dXJib2Zp
c2ggd2UgY3VycmVudGx5IGhhdmUuCgpJbiBvdGhlciB3b3JkcywgaG93IGlzIHRoaXM6CgpDbGs6
OmdldChkZXYsIFNvbWUoY19zdHIhKCJjb3JlIikpKS5wcmVwYXJlKCk/LmVuYWJsZSgpPzsKCkJl
dHRlciB0aGFuIHRoaXM6CgpDbGs6OjxFbmFibGVkPjo6Z2V0KC8q4oCmKi8pOwoK4oCUIERhbmll
bAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
