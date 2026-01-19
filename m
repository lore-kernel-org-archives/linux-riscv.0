Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0030CCF2F2
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 12:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/t0P+GxBz5XUOvjK+3GxoFVJgZB2XlOpzp0Dca4ut90=; b=A98D1Mxhc9XYdx
	PWLRteZyQSnIP/dznFZDcXkvS4TlmlsyZlJiV5/pvIRVZzJquLDdEq3aXZm3nqNJUwv9wDrhLMs+k
	SLdUj5l8iakQTN+gYUFSygDC0WL1TE0sXVpd7x2w6eCw3MicMexOkOG+3xdlO/K5DDN/UQyNufD7Z
	vCU34WkLDG9yFHIPuPQ+VFbaOv44nRgRvfRn+iquj5LjWjdp6zq5IUSf0yn6E/vL3DYzbUi48+ztS
	gxcTN8OtLHWcvc9NJ+twxguHK5wfaaKSX0oUZELqU8kdZ6L8C+5cqYRRWBAfi6R7GkG+2AiMunoNw
	fdHzDhdJHO2QC07cpBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho9L-00000001ydU-2Qz5;
	Mon, 19 Jan 2026 12:14:30 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vho9G-00000001ycY-1Mro
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 12:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768824845; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KcH7GdA7xBbH241i8NfLausAddZyz5ZlVGcytkTvCFJXBaA1vUO5Rp034wbCuKZ3Fqjbxmu4MCMOzor6ONFvrToKZPNYfAJ3q5tUMVj58cLajsxQ5nJhuQWyJradG4fePU7j+UhLknsTkcd1UGRIj+PBk4zWKSadvCwhWUdTRg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768824845; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BfXcIt0tBHjjnsqIXHlPzY4FaLVvmObvvbSPyRVGDJw=; 
	b=B7r2bhf1aqYK4OQhfSjxB7LKy2l0mXKBzV0JObD+J5aXvnXABeA37KdUMKgFJQGsmxTjK1gaW83dsmhSIrxSh4K1wue3eMmCWMvOSwVGPpMwpMDKOxrIfGX3e2+tKPKsizJOhH5yl9g6G5Kafs1SszcRV+ZUPOtNNndiz5jwRh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768824845;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=BfXcIt0tBHjjnsqIXHlPzY4FaLVvmObvvbSPyRVGDJw=;
	b=LlhyNelPGUcdcnD3sv710vqtJ394DhGzCFIYy1VDO/AqvAtqn8iV315jYgwKQTkg
	iVh6l9dmKL+dt+yz7PIARqIJV3TJEzHUjI7ZVsNDS7ctjEzlzypmJnIIsqCbfSz9y/N
	02gC9vOvF/g4PJdAVl1/5lqZQqQxaSO9WWtyAJPo=
Received: by mx.zohomail.com with SMTPS id 1768824843531275.960036876614;
	Mon, 19 Jan 2026 04:14:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260119-thundering-tested-robin-4be817@houat>
Date: Mon, 19 Jan 2026 09:13:43 -0300
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
Message-Id: <14A9284F-A773-4F21-A5FC-9762AE5A5390@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_041422_400236_864A62B7 
X-CRM114-Status: GOOD (  26.83  )
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

Cgo+IE9uIDE5IEphbiAyMDI2LCBhdCAwNzo0NSwgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJu
ZWwub3JnPiB3cm90ZToKPiAKPiBPbiBUaHUsIEphbiAwOCwgMjAyNiBhdCAxMToxNDozN0FNIC0w
MzAwLCBEYW5pZWwgQWxtZWlkYSB3cm90ZToKPj4gSGkgTWF4aW1lIDopCj4+IAo+Pj4gCj4+PiBJ
IGRvbid0IGtub3cgdGhlIHR5cGVzdGF0ZSBwYXR0ZXJuIHRoYXQgd2VsbCwgYnV0IEkgd29uZGVy
IGlmIHdlIGRvbid0Cj4+PiBwYWludCBvdXJzZWx2ZXMgaW50byBhIGNvcm5lciBieSBpbnRyb2R1
Y2luZyBpdC4KPj4+IAo+Pj4gV2hpbGUgaXQncyBwcmV0dHkgY29tbW9uIHRvIGdldCB5b3VyIGNs
b2NrIGZyb20gdGhlIGdldCBnbyBpbnRvIGEgc3RhdGUsCj4+PiBhbmQgdGhlbiBkb24ndCBtb2Rp
ZnkgaXQgKGxpa2Ugd2hhdCBkZXZtX2Nsa19nZXRfZW5hYmxlZCBwcm92aWRlcyBmb3IKPj4+IGV4
YW1wbGUpLCBhbmQgdGhlIHR5cGVzdGF0ZSBwYXR0ZXJuIGluZGVlZCB3b3JrcyBncmVhdCBmb3Ig
dGhvc2UsIHdlCj4+IAo+PiBNaW5vciBjb3JyZWN0aW9uLCBkZXZtX2Nsa19nZXRfZW5hYmxlZCBp
cyBub3QgaGFuZGxlZCBieSB0aGUgdHlwZXN0YXRlCj4+IHBhdHRlcm4uIFRoZSBuZXh0IHBhdGNo
IGRvZXMgaW5jbHVkZSB0aGlzIGZ1bmN0aW9uIGZvciBjb252ZW5pZW5jZSwgYnV0Cj4+IHlvdSBn
ZXQgYSBSZXN1bHQ8KCk+LiBUaGUgdHlwZXN0YXRlIHBhdHRlcm4gaXMgdXNlZCB3aGVuIHlvdSB3
YW50IG1vcmUKPj4gY29udHJvbC4KPj4gCj4+PiBhbHNvIGhhdmUgYSBzaWduaWZpY2FudCBudW1i
ZXIgb2YgZHJpdmVycyB0aGF0IHdpbGwgaGF2ZSBhIGZpbmVyLWdyYWluZWQKPj4+IGNvbnRyb2wg
b3ZlciB0aGUgY2xvY2sgZW5hYmxlbWVudCBmb3IgUE0uCj4+PiAKPj4+IEZvciBleGFtcGxlLCBp
dCdzIHF1aXRlIHR5cGljYWwgdG8gaGF2ZSAoYXQgbGVhc3QpIG9uZSBjbG9jayBmb3IgdGhlIGJ1
cwo+Pj4gaW50ZXJmYWNlIHRoYXQgZHJpdmVzIHRoZSByZWdpc3RlciwgYW5kIG9uZSB0aGF0IGRy
aXZlcyB0aGUgbWFpbgo+Pj4gY29tcG9uZW50IGxvZ2ljLiBUaGUgZm9ybWVyIG5lZWRzIHRvIGJl
IGVuYWJsZWQgb25seSB3aGVuIHlvdSdyZQo+Pj4gYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMgKGFu
ZCBjYW4gYmUgYWJzdHJhY3RlZCB3aXRoCj4+PiByZWdtYXBfbW1pb19hdHRhY2hfY2xrIGZvciBl
eGFtcGxlKSwgYW5kIHRoZSBsYXR0ZXIgbmVlZHMgdG8gYmUgZW5hYmxlZAo+Pj4gb25seSB3aGVu
IHRoZSBkZXZpY2UgYWN0dWFsbHkgc3RhcnRzIG9wZXJhdGluZy4KPj4+IAo+Pj4gWW91IGhhdmUg
YSBzaW1pbGFyIHRoaW5nIGZvciB0aGUgcHJlcGFyZSB2cyBlbmFibGUgdGhpbmcuIFRoZSBkaWZm
ZXJlbmNlCj4+PiBiZXR3ZWVuIHRoZSB0d28gaXMgdGhhdCBlbmFibGUgY2FuIGJlIGNhbGxlZCBp
bnRvIGF0b21pYyBjb250ZXh0IGJ1dAo+Pj4gcHJlcGFyZSBjYW4ndC4KPj4+IAo+Pj4gU28gZm9y
IGRyaXZlcnMgdGhhdCB3b3VsZCBjYXJlIGFib3V0IHRoaXMsIHlvdSB3b3VsZCBjcmVhdGUgeW91
ciBkZXZpY2UKPj4+IHdpdGggYW4gdW5wcmVwYXJlZCBjbG9jaywgYW5kIHRoZW4gYXQgdmFyaW91
cyB0aW1lcyBkdXJpbmcgdGhlIGRyaXZlcgo+Pj4gbGlmZXRpbWUsIHlvdSB3b3VsZCBtdXRhdGUg
dGhhdCBzdGF0ZS4KPj4+IAo+Pj4gQUZBSVUsIGVuY29kaW5nIHRoZSBzdGF0ZSBvZiB0aGUgY2xv
Y2sgaW50byB0aGUgQ2xrIHR5cGUgKGFuZCB0aHVzCj4+PiBmb3JjaW5nIHRoZSBzdHJ1Y3R1cmUg
dGhhdCBob2xkcyBpdCkgcHJldmVudHMgdGhhdCBtdXRhdGlvbi4gSWYgbm90LCB3ZQo+Pj4gc2hv
dWxkIG1ha2UgaXQgY2xlYXJlciAoYnkgZXhwYW5kaW5nIHRoZSBkb2MgbWF5YmU/KSBob3cgc3Vj
aCBhIHBhdHRlcm4KPj4+IGNhbiBiZSBzdXBwb3J0ZWQuCj4+PiAKPj4+IE1heGltZQo+PiAKPj4g
SUlVQywgeW91ciBtYWluIHBvaW50IHNlZW1zIHRvIGJlIGFib3V0IG11dGF0aW5nIHRoZSBzdGF0
ZSBhdCBydW50aW1lPyBUaGlzIGlzCj4+IHBvc3NpYmxlIHdpdGggdGhpcyBjb2RlLiBZb3UgY2Fu
IGp1c3QgaGF2ZSBhbiBlbnVtLCBmb3IgZXhhbXBsZToKPj4gCj4+IGVudW0gTXlDbG9ja3Mgewo+
PiBVbnByZXBhcmVkKENsazxVbnByZXBhcmVkPiksCj4+ICAgICAgICBQcmVwYXJlZChDbGs8UHJl
cGFyZWQ+KSwKPj4gRW5hYmxlZChDbGs8RW5hYmxlZD4pLCAKPj4gfQo+PiAKPj4gSW4gZmFjdCwg
SSBzcGVjaWZpY2FsbHkgd2FudGVkIHRvIGVuc3VyZSB0aGF0IHRoaXMgd2FzIHBvc3NpYmxlIHdo
ZW4gd3JpdGluZwo+PiB0aGVzZSBwYXRjaGVzLCBhcyBpdOKAmXMgbmVlZGVkIGJ5IGRyaXZlcnMu
IElmIHlvdSB3YW50IHRvLCBJIGNhbiBjb3ZlciB0aGF0IGluCj4+IHRoZSBleGFtcGxlcywgbm8g
d29ycmllcy4KPiAKPiBZZXMsIHRoYXQgd291bGQgYmUgZ3JlYXQuIEkgZG8gd29uZGVyIHRob3Vn
aCBpZiBpdCB3b3VsZG4ndCBtYWtlIHNlbnNlCj4gdG8gdHVybiBpdCB0aGUgb3RoZXIgd2F5IGFy
b3VuZC4gSXQgY3JlYXRlcyBhIGZhaXIgc2hhcmUgb2YgYm9pbGVycGxhdGUKPiBmb3IgYSBudW1i
ZXIgb2YgZHJpdmVycy4gQ2FuJ3Qgd2Uga2VlcCBDbGsgdGhlIHdheSBpdCBpcyBhcyBhCj4gbG93
ZXItbGV2ZWwgdHlwZSwgYW5kIGNyYXRlIGEgTWFuYWdlZENsayAob3Igd2hhdGV2ZXIgbmFtZSB5
b3UgcHJlZmVyKQo+IHRoYXQgZHJpdmVycyBjYW4gdXNlLCBhbmQgd291bGQgYmUgcmV0dXJuZWQg
YnkgaGlnaGVyLWxldmVsIGhlbHBlcnMsIGlmCj4gdGhleSBzbyBjaG9vc2U/CgpUaGUgcHJvYmxl
bSB3aXRoIGtlZXBpbmcgaXQgdGhlIHdheSBpdCBpcyB0aGF0IHlvdeKAmXJlIGJhY2sgdG8gbWFu
dWFsCnByZXBhcmUvdW5wcmVwYXJlIGFuZCBlbmFibGUvZGlzYWJsZSwgYXMgdGhlIHR5cGUtc3Rh
dGUgaXMgd2hhdOKAmXMgZW5mb3JjaW5nCnRoZSBjb3JyZWN0IG9yZGVyIG9mIGNhbGxzLiBUaGlz
IGlzIGFsc28gdGhlIGNhc2Ugd2hlbiB0aGUgdHlwZSBpcyBkcm9wcGVkLgoKSW4gZmFjdCwgb25l
IG9mIHRoZSBhaW1zIG9mIHRoaXMgcGF0Y2ggaXMgdG8gZ2V0IHJpZCBvZiB0aGUgY3VycmVudCBD
bGsgdHlwZQpiZWZvcmUgd2UgaGF2ZSBtb3JlIHVzZXJzLiBUaGUgY3VycmVudCBzZXJpZXMgZml4
ZXMgdGhpcyBieSBlbmZvcmNpbmcgYSBzYW5lCm9yZGVyIG9mIG9wZXJhdGlvbnMuIE1vc3QgaW1w
b3J0YW50bHksIGl0IGVuZm9yY2VzIHRoYXQgdGhlIHJlZmNvdW50cyB0byBnZXQoKSwKZW5hYmxl
KCkgYW5kIGV0YyBhcmUgaGFuZGxlZCBjb3JyZWN0bHkgdXNpbmcgdGhlIHR5cGUgc3lzdGVtLgoK
SXQgcmlkcyB1cyBvZiB0aGlzIHByb2JsZW0sIHdoaWNoIGlzIHBvc3NpYmxlIHRvZGF5OgoKY2xr
LmVuYWJsZSgpOwpjbGsucHJlcGFyZSgpOwpjbGsucHJlcGFyZSgpOwpjbGsuZGlzYWJsZV91bnBy
ZXBhcmUoKTsKY2xrLnNldF9yYXRlKCk7CgoKPiAKPiBUaGF0IHdheSwgd2UgZG8gaGF2ZSB0aGUg
dHlwZXN0YXRlIEFQSSBmb3Igd2hvZXZlciB3YW50cyB0bywgd2l0aG91dAo+IGNyZWF0aW5nIHRv
byBtdWNoIGJvaWxlcnBsYXRlIGZvciBldmVyeWJvZHkgZWxzZS4KCgpCdXQgdGhhdCdzIGhvdyBp
dCB3b3JrcyBpbiB0aGlzIHNlcmllcy4gVGhlIHR5cGVzdGF0ZSBwYXR0ZXJuIGlzIG9wdC1pbi4g
SWYgeW91Cm5lZWQgdG8gInNldCBhbmQgZm9yZ2V0IiB0aGVyZSdzIHRoZSBkZXZtIEFQSSB0aGF0
J3MgaW50cm9kdWNlZCBieSB0aGUgbmV4dApwYXRjaC4gSSBjYW4gZXhwb3NlIG1vcmUgZGV2bV8q
IEFQSXMgaWYgeW91IHdhbnQuCgpJJ20gbm90IHN1cmUgdGhlIGJvaWxlcnBsYXRlIGlzIHNpZ25p
ZmljYW50LCBieSB0aGUgd2F5LiBZb3UgY2FuIGp1c3QgZG86CgoKQ2xrOjo8RW5hYmxlZD46Omdl
dCgpOwoKCkFzIGEgc3RhcnRpbmcgcG9pbnQsIGFuZCBoYXZlIHRoZSBlbnVtIHRoaW5nICh3aGlj
aCBpcyBhbHNvIHNpbXBsZSkgX2lmXyB5b3UKbmVlZCB0byBtYW51YWxseSBlbmFibGUvZGlzYWJs
ZSBhdCBydW50aW1lLiBNb3N0IG9mIHRoZSB0aW1lLCB5b3Ugd2lsbCBvbmx5Cm5lZWQgdG8gbWVu
dGlvbiB0aGUgdHlwZSBzdGF0ZSBvbmNlLCBsaWtlIEkgZGlkIGluIHRoZSBjYWxsIGFib3ZlLCBh
bmQgdGhlbgp0aGUgdHlwZSBzeXN0ZW0gd2lsbCBmaWd1cmUgb3V0IHRoZSByZXN0IHdoZW4gdHJh
bnNpdGlvbnMgdGFrZSBwbGFjZS4KCldoYXQgYm9pbGVycGxhdGUgZGlkIHlvdSBoYXZlIGluIG1p
bmQ/CgrigJQgRGFuaWVsCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
