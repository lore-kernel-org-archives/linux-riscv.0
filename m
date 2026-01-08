Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A17D0D17B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khb6raFIoMtKePjHjc9D06V0gWO2FF7tnmx/gkuHn6g=; b=Q57u4LPxXNUH+l
	oD2ryr+oM4Wp5DGJIJI6JrHXiJIi1/EJJf8+gjCIx+Jokht5kmO5DWTIRXdduYlClWomL96NQuErw
	xyMr14L/frc6nLoraxGH0sChkdeGeg2I71Pw0a/Sgi47ZfKfiFKrsXOL/KFXwgrGgSS2eqe+3tDPw
	BaoCHzRHjUxljVb7Unf2gNE4dTqa/8vdHm4iU7DRKlG/GLx5MsEK+NYk/vi5bgXV54ZdelUB/54g/
	5UsOt8sHVIzQP4T9OqQtAcc0oHbVgaUr8s0r2nHCFsEb+9ndtBpdLI1b3YSigaw7XXjBm6qnnvwO/
	OSjHP1Z3t/e5UZAySXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqnG-0000000HIP5-3B7G;
	Thu, 08 Jan 2026 14:15:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqnE-0000000HIOc-21OX
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 14:15:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767881700; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OgOvL1Aj2mnVcSiCXZanKA1S2JdaXAst4uy2XsutDQ64qK5oFfGqRgArHiHCtndDXzUHyUglqp4e1p9rkbhB2n49oY4Xfilsi2M9jg0wFw1h2CRYWss+qp68deHhYUG46wLfl8tTD7BDelMwiu6JEoSGy0hvabtZfkM9wXLv74Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767881700; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8UM2EJGpOoTDr6b1jkTnYeu3NfhCiVAeZ2kTc9yJTiU=; 
	b=AD5CegN4htv3QyoMFvZpDT+YdBJBhdtnI7h9fdWt0CNf3Izg69j1OZnXioURgb+4WkvTzWkSbMmW7QPbxTodVhnJXQagYghw/9JcQ8PrcphqG+/Tmst1UUoB5hWWtBOEWMdKByYbnEv8G0oldS5fSqSFFVJuBj77WLlnPU0rrPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767881700;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=8UM2EJGpOoTDr6b1jkTnYeu3NfhCiVAeZ2kTc9yJTiU=;
	b=Q33QbIuWQqMUSKdgziXZxyPQwxnQgEqOfTPTd/jfY10/4wxZfV95J4iBJSGVD4i0
	W0gRtPHqTzxUelPNlZg39Mx3gLKNHuSuAKKDRmWAmfORaK8B4uzbpKMtLhttQNVN+oW
	OhlEFTn4MRJkMinkcQUfSZM4U61Wh3EQ7djT+4qg=
Received: by mx.zohomail.com with SMTPS id 1767881698439518.0714680558849;
	Thu, 8 Jan 2026 06:14:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260108-delectable-fennec-of-sunshine-ffca19@houat>
Date: Thu, 8 Jan 2026 11:14:37 -0300
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
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
Message-Id: <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_061516_604021_0FA9011F 
X-CRM114-Status: GOOD (  19.50  )
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

SGkgTWF4aW1lIDopCgo+IAo+IEkgZG9uJ3Qga25vdyB0aGUgdHlwZXN0YXRlIHBhdHRlcm4gdGhh
dCB3ZWxsLCBidXQgSSB3b25kZXIgaWYgd2UgZG9uJ3QKPiBwYWludCBvdXJzZWx2ZXMgaW50byBh
IGNvcm5lciBieSBpbnRyb2R1Y2luZyBpdC4KPiAKPiBXaGlsZSBpdCdzIHByZXR0eSBjb21tb24g
dG8gZ2V0IHlvdXIgY2xvY2sgZnJvbSB0aGUgZ2V0IGdvIGludG8gYSBzdGF0ZSwKPiBhbmQgdGhl
biBkb24ndCBtb2RpZnkgaXQgKGxpa2Ugd2hhdCBkZXZtX2Nsa19nZXRfZW5hYmxlZCBwcm92aWRl
cyBmb3IKPiBleGFtcGxlKSwgYW5kIHRoZSB0eXBlc3RhdGUgcGF0dGVybiBpbmRlZWQgd29ya3Mg
Z3JlYXQgZm9yIHRob3NlLCB3ZQoKTWlub3IgY29ycmVjdGlvbiwgZGV2bV9jbGtfZ2V0X2VuYWJs
ZWQgaXMgbm90IGhhbmRsZWQgYnkgdGhlIHR5cGVzdGF0ZQpwYXR0ZXJuLiBUaGUgbmV4dCBwYXRj
aCBkb2VzIGluY2x1ZGUgdGhpcyBmdW5jdGlvbiBmb3IgY29udmVuaWVuY2UsIGJ1dAp5b3UgZ2V0
IGEgUmVzdWx0PCgpPi4gVGhlIHR5cGVzdGF0ZSBwYXR0ZXJuIGlzIHVzZWQgd2hlbiB5b3Ugd2Fu
dCBtb3JlCmNvbnRyb2wuCgo+IGFsc28gaGF2ZSBhIHNpZ25pZmljYW50IG51bWJlciBvZiBkcml2
ZXJzIHRoYXQgd2lsbCBoYXZlIGEgZmluZXItZ3JhaW5lZAo+IGNvbnRyb2wgb3ZlciB0aGUgY2xv
Y2sgZW5hYmxlbWVudCBmb3IgUE0uCj4gCj4gRm9yIGV4YW1wbGUsIGl0J3MgcXVpdGUgdHlwaWNh
bCB0byBoYXZlIChhdCBsZWFzdCkgb25lIGNsb2NrIGZvciB0aGUgYnVzCj4gaW50ZXJmYWNlIHRo
YXQgZHJpdmVzIHRoZSByZWdpc3RlciwgYW5kIG9uZSB0aGF0IGRyaXZlcyB0aGUgbWFpbgo+IGNv
bXBvbmVudCBsb2dpYy4gVGhlIGZvcm1lciBuZWVkcyB0byBiZSBlbmFibGVkIG9ubHkgd2hlbiB5
b3UncmUKPiBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVycyAoYW5kIGNhbiBiZSBhYnN0cmFjdGVkIHdp
dGgKPiByZWdtYXBfbW1pb19hdHRhY2hfY2xrIGZvciBleGFtcGxlKSwgYW5kIHRoZSBsYXR0ZXIg
bmVlZHMgdG8gYmUgZW5hYmxlZAo+IG9ubHkgd2hlbiB0aGUgZGV2aWNlIGFjdHVhbGx5IHN0YXJ0
cyBvcGVyYXRpbmcuCj4gCj4gWW91IGhhdmUgYSBzaW1pbGFyIHRoaW5nIGZvciB0aGUgcHJlcGFy
ZSB2cyBlbmFibGUgdGhpbmcuIFRoZSBkaWZmZXJlbmNlCj4gYmV0d2VlbiB0aGUgdHdvIGlzIHRo
YXQgZW5hYmxlIGNhbiBiZSBjYWxsZWQgaW50byBhdG9taWMgY29udGV4dCBidXQKPiBwcmVwYXJl
IGNhbid0Lgo+IAo+IFNvIGZvciBkcml2ZXJzIHRoYXQgd291bGQgY2FyZSBhYm91dCB0aGlzLCB5
b3Ugd291bGQgY3JlYXRlIHlvdXIgZGV2aWNlCj4gd2l0aCBhbiB1bnByZXBhcmVkIGNsb2NrLCBh
bmQgdGhlbiBhdCB2YXJpb3VzIHRpbWVzIGR1cmluZyB0aGUgZHJpdmVyCj4gbGlmZXRpbWUsIHlv
dSB3b3VsZCBtdXRhdGUgdGhhdCBzdGF0ZS4KPiAKPiBBRkFJVSwgZW5jb2RpbmcgdGhlIHN0YXRl
IG9mIHRoZSBjbG9jayBpbnRvIHRoZSBDbGsgdHlwZSAoYW5kIHRodXMKPiBmb3JjaW5nIHRoZSBz
dHJ1Y3R1cmUgdGhhdCBob2xkcyBpdCkgcHJldmVudHMgdGhhdCBtdXRhdGlvbi4gSWYgbm90LCB3
ZQo+IHNob3VsZCBtYWtlIGl0IGNsZWFyZXIgKGJ5IGV4cGFuZGluZyB0aGUgZG9jIG1heWJlPykg
aG93IHN1Y2ggYSBwYXR0ZXJuCj4gY2FuIGJlIHN1cHBvcnRlZC4KPiAKPiBNYXhpbWUKCklJVUMs
IHlvdXIgbWFpbiBwb2ludCBzZWVtcyB0byBiZSBhYm91dCBtdXRhdGluZyB0aGUgc3RhdGUgYXQg
cnVudGltZT8gVGhpcyBpcwpwb3NzaWJsZSB3aXRoIHRoaXMgY29kZS4gWW91IGNhbiBqdXN0IGhh
dmUgYW4gZW51bSwgZm9yIGV4YW1wbGU6CgplbnVtIE15Q2xvY2tzIHsKCVVucHJlcGFyZWQoQ2xr
PFVucHJlcGFyZWQ+KSwKICAgICAgICBQcmVwYXJlZChDbGs8UHJlcGFyZWQ+KSwKCUVuYWJsZWQo
Q2xrPEVuYWJsZWQ+KSwgCn0KCkluIGZhY3QsIEkgc3BlY2lmaWNhbGx5IHdhbnRlZCB0byBlbnN1
cmUgdGhhdCB0aGlzIHdhcyBwb3NzaWJsZSB3aGVuIHdyaXRpbmcKdGhlc2UgcGF0Y2hlcywgYXMg
aXTigJlzIG5lZWRlZCBieSBkcml2ZXJzLiBJZiB5b3Ugd2FudCB0bywgSSBjYW4gY292ZXIgdGhh
dCBpbgp0aGUgZXhhbXBsZXMsIG5vIHdvcnJpZXMuCgpTYW1lIGZvciBSZWd1bGF0b3I8VD4sIGJ5
IHRoZSB3YXkuCgrigJQgRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
