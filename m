Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B15D0D17F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEosL3zjM+xKVHrYqAyunVo412QroA9HOdMcfrQVyUA=; b=4bMzkcdguJ0DYs
	htI4lyYTNRl5X2gy2Z0PpDkXKyBuNKSxfMh/s11OugAX8LRhcJ1n3tyjmclmeBvEU24aKmZHKGskC
	SdHowDGeTk8UNAKWi52ovrs0MwtGhqOhsRNtnZXNn3n0PSxirn2deIGmR006BNoCzOb8B2h+9aIDc
	Y1u6O1WeiJyUgBWbbtqdWzrH+PtvbvVuxKuPYVqnZUAE2jp1amic7ie3XDgcVfDkQHQocm2COV4LE
	XXLVIMYNFgkD4tOY0AVMHWMJ2reWUJzL23kJUGmjFvJrVrJU5QYu8kSqcfm6deMXFX4ZQvwTL8ASJ
	XJ4WXpOgHKRDuI1zXOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqrK-0000000HJ6J-3QIU;
	Thu, 08 Jan 2026 14:19:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqrI-0000000HJ4k-3Wm0
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 14:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767881954; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BBGSzaRsEJqZsvO1HpX/hKogi+VqGwt8a7LPvUSAFynOoyqffEdMc9Qr+7R2IIR4l9pelvKaiC4ca8aoRjLdd77cN4Kr//pWDmI1ixoF/5TxpIfJGY0cxEPOa5jH0aDMUvNg53gza47/nqwtchzMJBC9tQ7AcHi8EKYHlqcwLzk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767881954; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3zz6a3BMr2dfAzv+YoO5B8KGEMHeg6suRN4rMzqljFs=; 
	b=I8Ot6vUy0Vz8MiT3dfC/NVer8UkuX/tQ1Kb6KbOZTWAS59zjFpNXUGzu1BCBGqx6cpieP82l/Zax9BYSKp0kuf117sq7StP+PfRpUYksOk52NC6oINCiyLZKfbE/+iZuOZLHzEoHeTLX1iQ21jWDLhG1gp2o8oqnqb6WSuQNW3A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767881954;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=3zz6a3BMr2dfAzv+YoO5B8KGEMHeg6suRN4rMzqljFs=;
	b=VbA8UffGuc5UL/XYfaeXeMSJPiV44xD5qtehsqkQRKeP0AdyLr5yyeoKRIr/6Kes
	RXBPxHHx04baIOYHlqqFmMnjM5ywFy+1LCZ5URfG/J23ZMBAceoe0tEwKa1yl/QRUr5
	FxwCizG5CzDRFkCXgELDDqr5sihhf3L87Q5G3/gs=
Received: by mx.zohomail.com with SMTPS id 1767881952278596.4068382305078;
	Thu, 8 Jan 2026 06:19:12 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72=38RO9PGAMDtnTK8wj-yRSmg9UOfq7D6af7AwAKwn=DA@mail.gmail.com>
Date: Thu, 8 Jan 2026 11:18:53 -0300
Cc: Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Gary Guo <gary@garyguo.net>,
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
Message-Id: <16DA3CAF-098A-444F-83C1-AF7BCE149937@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <CANiq72=38RO9PGAMDtnTK8wj-yRSmg9UOfq7D6af7AwAKwn=DA@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_061928_932040_269BFBA5 
X-CRM114-Status: GOOD (  12.46  )
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

Cgo+IE9uIDggSmFuIDIwMjYsIGF0IDEwOjU3LCBNaWd1ZWwgT2plZGEgPG1pZ3VlbC5vamVkYS5z
YW5kb25pc0BnbWFpbC5jb20+IHdyb3RlOgo+IAo+IE9uIFRodSwgSmFuIDgsIDIwMjYgYXQgOTow
N+KAr0FNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4+IAo+PiBB
RkFJVSwgZW5jb2RpbmcgdGhlIHN0YXRlIG9mIHRoZSBjbG9jayBpbnRvIHRoZSBDbGsgdHlwZSAo
YW5kIHRodXMKPj4gZm9yY2luZyB0aGUgc3RydWN0dXJlIHRoYXQgaG9sZHMgaXQpIHByZXZlbnRz
IHRoYXQgbXV0YXRpb24uIElmIG5vdCwgd2UKPj4gc2hvdWxkIG1ha2UgaXQgY2xlYXJlciAoYnkg
ZXhwYW5kaW5nIHRoZSBkb2MgbWF5YmU/KSBob3cgc3VjaCBhIHBhdHRlcm4KPj4gY2FuIGJlIHN1
cHBvcnRlZC4KPiAKPiBPbmUgcG9zc2liaWxpdHkgdG8gY29uc2lkZXIgaW4gY2FzZXMgbGlrZSB0
aGlzIGlzIHdoZXRoZXIgc3VwcG9ydGluZwo+IGJvdGggY2FzZXMgZGlmZmVyZW50bHkgbWFrZXMg
c2Vuc2UsIGkuZS4gb25lIGZvciB0aGF0IGNvdmVycwo+IGVhc2lseS9zYWZlbHkvLi4uIHRoZSB1
c3VhbCAiODAlIiBvZiBjYXNlcywgYW5kIGFub3RoZXIgImFkdmFuY2VkIiBvbmUKPiAocG9zc2li
bHkgdW5zYWZlIGV0Yy4pIGZvciB0aGUgcmVzdC4KPiAKPiBXaGlsZSBpdCBtYXkgYmUgYSBiaXQg
bW9yZSB0byBtYWludGFpbiwgaXQgbWF5IHBheSBpdHNlbGYgb2ZmIGJ5Cj4gbWFraW5nIGl0IGVh
c2llciB0byByZXZpZXcgdGhlIGVhc3kgb25lcyBpZiB0aGUgbWFqb3JpdHkgb25seSBuZWVkCj4g
dGhhdCBldGMuCj4gCj4gQ2hlZXJzLAo+IE1pZ3VlbAoKVGhpcyBpcyBhbHJlYWR5IHRoZSBjYXNl
LiBUaGUgZGV2bV8qIHN0dWZmIGluIHRoZSBuZXh0IHBhdGNoIGNvdmVycyBhIGxvdCBvZgpzaW1w
bGVyIGRyaXZlcnMgKHdobyBtaWdodCBzaW1wbHkgd2FudCB0byBlbmFibGUgdGhlIGNsaywgcGVy
aGFwcyB3aXRoIGEgZ2l2ZW4KcmF0ZSksIHdoaWxlIHRoZSB0eXBlc3RhdGUgcGF0dGVybiBhbGxv
d3MgZm9yIG1vcmUgY29udHJvbCB3aGVuIG5lZWRlZC4gVGhlcmUKd2lsbCBiZSB1c2VycyBmb3Ig
Ym90aCwgSU1ITy4KCuKAlCBEYW5pZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
