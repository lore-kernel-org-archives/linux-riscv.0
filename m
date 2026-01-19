Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB7AD489B8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2fv/EIADnAtOZk60oiiXxJVH/V1ILIPX3rMJx5qsIw=; b=YpZsPH5xMhtYaj
	fPw0Dxur5i6hnQek2mTMwYeloe/4CW6lvcmpBUb2RblrhgpysldXWltyMXvorsDBbFLc8U4AQlw57
	Nj9kwhTOy7IXjKwzFxRP/PqIj5ah6hKgg3Nf2DuCfkWmjYds5fxRqSZy5kcK8rYPXzWlOPa+4qQy8
	knuClx+UM3X/h5Bw7bv/pS5Y9hbHk4adLoG5wCJbvuUHeJdx3J2o9peFHLjL0vT0g1PJOh76RvCQJ
	bbgXqWKkCclgVph9YL39ZvOGtDB2zYtndptqkhLOdFeXUy8CTZeZCDAndAj1k0sPJSoRUlj1Sj0DU
	22uTBWXVfjuBCGJr8sRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhomQ-000000026NH-01fg;
	Mon, 19 Jan 2026 12:54:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhomM-000000026MM-2hsd
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 12:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768827273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EMz8U/slnbqZVwl92w3iqz0shk9k0y/WL1n4Htr0AfZoktCSU5Zn2K/B6CnCFrrc9d6+/HFPvpmxX8rA/xcsSKodl2lTrrHK9qDyE4QOUpOcFw6O+4ImOfsARRtC6sPthf005IKkfRFZH/io0om/gAaUyjIzngjBGg5Jur98t94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768827273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zLDnJZLgAOrpoEGFnBjgHoA0s4migwFpwVUCiQLiYbE=; 
	b=auuDHlGY39i8UFoY2S3ax0Ylo3TMvo/gCo8Ydo+0OembHXTR86/6E4pnwWPkDsEKL9KRxX74cIxpKPpo4tuJUwu3ADAT2EQIaUJOW+LqGXakCFnPJJJjBbShQyJH3mCRJD8xRYOO2M7VG2EaqSDqK3jtsJWkSVDyI2kr7zugf7s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768827273;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=zLDnJZLgAOrpoEGFnBjgHoA0s4migwFpwVUCiQLiYbE=;
	b=R4MWI0V3IEJiVaX8Hq9T9sxTQcgm9LF2HJ0ECpjnvRIG7s4E4c2DlRzP2kCq2vZt
	vxIbkTXjyOlGqjskS0iuccLwzIKp8dRdbmkrLrmlBjWafvqM8YlWU3GlUj+sR0rs3N4
	HzPR0YjucxiEXXyp95gt6LvlwbYSs8Hmlcc5DVS4=
Received: by mx.zohomail.com with SMTPS id 176882727146931.323097316967164;
	Mon, 19 Jan 2026 04:54:31 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aW4lCfUyumOKRRJm@google.com>
Date: Mon, 19 Jan 2026 09:54:10 -0300
Cc: Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Danilo Krummrich <dakr@kernel.org>,
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
Message-Id: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_045446_731311_097B305B 
X-CRM114-Status: GOOD (  30.07  )
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

Cgo+IE9uIDE5IEphbiAyMDI2LCBhdCAwOTozNSwgQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2ds
ZS5jb20+IHdyb3RlOgo+IAo+IE9uIE1vbiwgSmFuIDE5LCAyMDI2IGF0IDExOjQ1OjU3QU0gKzAx
MDAsIE1heGltZSBSaXBhcmQgd3JvdGU6Cj4+IE9uIFRodSwgSmFuIDA4LCAyMDI2IGF0IDExOjE0
OjM3QU0gLTAzMDAsIERhbmllbCBBbG1laWRhIHdyb3RlOgo+Pj4+IEZvciBleGFtcGxlLCBpdCdz
IHF1aXRlIHR5cGljYWwgdG8gaGF2ZSAoYXQgbGVhc3QpIG9uZSBjbG9jayBmb3IgdGhlIGJ1cwo+
Pj4+IGludGVyZmFjZSB0aGF0IGRyaXZlcyB0aGUgcmVnaXN0ZXIsIGFuZCBvbmUgdGhhdCBkcml2
ZXMgdGhlIG1haW4KPj4+PiBjb21wb25lbnQgbG9naWMuIFRoZSBmb3JtZXIgbmVlZHMgdG8gYmUg
ZW5hYmxlZCBvbmx5IHdoZW4geW91J3JlCj4+Pj4gYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMgKGFu
ZCBjYW4gYmUgYWJzdHJhY3RlZCB3aXRoCj4+Pj4gcmVnbWFwX21taW9fYXR0YWNoX2NsayBmb3Ig
ZXhhbXBsZSksIGFuZCB0aGUgbGF0dGVyIG5lZWRzIHRvIGJlIGVuYWJsZWQKPj4+PiBvbmx5IHdo
ZW4gdGhlIGRldmljZSBhY3R1YWxseSBzdGFydHMgb3BlcmF0aW5nLgo+Pj4+IAo+Pj4+IFlvdSBo
YXZlIGEgc2ltaWxhciB0aGluZyBmb3IgdGhlIHByZXBhcmUgdnMgZW5hYmxlIHRoaW5nLiBUaGUg
ZGlmZmVyZW5jZQo+Pj4+IGJldHdlZW4gdGhlIHR3byBpcyB0aGF0IGVuYWJsZSBjYW4gYmUgY2Fs
bGVkIGludG8gYXRvbWljIGNvbnRleHQgYnV0Cj4+Pj4gcHJlcGFyZSBjYW4ndC4KPj4+PiAKPj4+
PiBTbyBmb3IgZHJpdmVycyB0aGF0IHdvdWxkIGNhcmUgYWJvdXQgdGhpcywgeW91IHdvdWxkIGNy
ZWF0ZSB5b3VyIGRldmljZQo+Pj4+IHdpdGggYW4gdW5wcmVwYXJlZCBjbG9jaywgYW5kIHRoZW4g
YXQgdmFyaW91cyB0aW1lcyBkdXJpbmcgdGhlIGRyaXZlcgo+Pj4+IGxpZmV0aW1lLCB5b3Ugd291
bGQgbXV0YXRlIHRoYXQgc3RhdGUuCj4gCj4gVGhlIGNhc2Ugd2hlcmUgeW91J3JlIGRvaW5nIGl0
IG9ubHkgd2hpbGUgYWNjZXNzaW5nIHJlZ2lzdGVycyBpcwo+IGludGVyZXN0aW5nLCBiZWNhdXNl
IHRoYXQgbWVhbnMgdGhlIEVuYWJsZSBiaXQgbWF5IGJlIG93bmVkIGJ5IGEgbG9jYWwKPiB2YXJp
YWJsZS4gV2UgbWF5IGltYWdpbmUgYW46Cj4gCj4gICAgbGV0IGVuYWJsZWQgPSBzZWxmLnByZXBh
cmVkX2Nsay5lbmFibGVfc2NvcGVkKCk7Cj4gICAgLi4uIHVzZSByZWdpc3RlcnMKPiAgICBkcm9w
KGVuYWJsZWQpOwoKCk5vdCBzdXJlIEkgdW5kZXJzdGFuZC4gWW91IGNhbiBnZXQgYSBDbGs8RW5h
YmxlZD4sIGRvIHdoYXQgeW91IG5lZWQsIGFuZCB0aGVuCmNvbnN1bWUgQ2xrPEVuYWJsZWQ+IHRv
IGdvIGJhY2sgdG8gQ2xrPFByZXBhcmVkPi4gSSB0aGluayBJIGFkZGVkIHRoaXMsIGJ1dCBpZgpJ
IGRpZG7igJl0LCBpdOKAmXMgYSB0cml2aWFsIHRoaW5nIHRvIGRvLgoKPiAKPiBOb3cgLi4uIHRo
aXMgZG9lc24ndCBxdWl0ZSB3b3JrIHdpdGggdGhlIGN1cnJlbnQgQVBJIC0gdGhlIGN1cnJlbnQK
PiBFbmFibGVkIHN0YXRlZCBvd25zIGJvdGggYSBwcmVwYXJlIGFuZCBlbmFibGUgY291bnQsIGJ1
dCB0aGUgYWJvdmUga2VlcHMKPiB0aGUgcHJlcGFyZSBjb3VudCBpbiBgc2VsZmAgYW5kIHRoZSBl
bmFibGVkIGNvdW50IGluIGEgbG9jYWwgdmFyaWFibGUuCj4gQnV0IGl0IGNvdWxkIGJlIGRvbmUg
d2l0aCBhIGZvdXJ0aCBzdGF0ZSwgb3IgYnkgYSBjbG9zdXJlIG1ldGhvZDoKPiAKPiAgICBzZWxm
LnByZXBhcmVkX2Nsay53aXRoX2VuYWJsZWQofHwgewo+ICAgICAgICAuLi4gdXNlIHJlZ2lzdGVy
cwo+ICAgIH0pOwo+IAo+IEFsbCBvZiB0aGlzIHdvdWxkIHdvcmsgd2l0aCBhbiBpbW11dGFibGUg
dmFyaWFibGUgb2YgdHlwZSBDbGs8UHJlcGFyZWQ+Lgo+IAo+Pj4+IEFGQUlVLCBlbmNvZGluZyB0
aGUgc3RhdGUgb2YgdGhlIGNsb2NrIGludG8gdGhlIENsayB0eXBlIChhbmQgdGh1cwo+Pj4+IGZv
cmNpbmcgdGhlIHN0cnVjdHVyZSB0aGF0IGhvbGRzIGl0KSBwcmV2ZW50cyB0aGF0IG11dGF0aW9u
LiBJZiBub3QsIHdlCj4+Pj4gc2hvdWxkIG1ha2UgaXQgY2xlYXJlciAoYnkgZXhwYW5kaW5nIHRo
ZSBkb2MgbWF5YmU/KSBob3cgc3VjaCBhIHBhdHRlcm4KPj4+PiBjYW4gYmUgc3VwcG9ydGVkLgo+
Pj4+IAo+Pj4+IE1heGltZQo+Pj4gCj4+PiBJSVVDLCB5b3VyIG1haW4gcG9pbnQgc2VlbXMgdG8g
YmUgYWJvdXQgbXV0YXRpbmcgdGhlIHN0YXRlIGF0IHJ1bnRpbWU/IFRoaXMgaXMKPj4+IHBvc3Np
YmxlIHdpdGggdGhpcyBjb2RlLiBZb3UgY2FuIGp1c3QgaGF2ZSBhbiBlbnVtLCBmb3IgZXhhbXBs
ZToKPj4+IAo+Pj4gZW51bSBNeUNsb2NrcyB7Cj4+PiAgICBVbnByZXBhcmVkKENsazxVbnByZXBh
cmVkPiksCj4+PiAgICBQcmVwYXJlZChDbGs8UHJlcGFyZWQ+KSwKPj4+ICAgIEVuYWJsZWQoQ2xr
PEVuYWJsZWQ+KSwgCj4+PiB9Cj4gCj4gSSBiZWxpZXZlIHlvdSBuZWVkIGFuIGV4dHJhIHN0YXRl
IGlmIHRoZSBzdGF0ZSBpcyBub3QgYm91bmQgdG8gdGhlIHNjb3BlCj4gb2YgYSBmdW5jdGlvbjoK
PiAKPiBlbnVtIE15Q2xvY2tzIHsKPiAgICBVbnByZXBhcmVkKENsazxVbnByZXBhcmVkPiksCj4g
ICAgUHJlcGFyZWQoQ2xrPFByZXBhcmVkPiksCj4gICAgRW5hYmxlZChDbGs8RW5hYmxlZD4pLCAK
PiAgICBUcmFuc2l0aW9uaW5nLAo+IH0KPiAKPiBzaW5jZSBtZW06OnJlcGxhY2UoKSBuZWVkcyBh
IG5ldyB2YWx1ZSBiZWZvcmUgeW91IGNhbiB0YWtlIG93bmVyc2hpcCBvZgo+IHRoZSBleGlzdGlu
ZyBDbGsgdmFsdWUuCgpSaWdodCwgSSBuZWVkIHRvIHVwZGF0ZSB0aGUgZG9jcyB0byBhY2NvdW50
IGZvciB0aGlzLCBhcyB0aGV5IGltcGx5IHRoYXQgeW91CmNhbiBkbyB0aGlzIHdpdGggb25seSB0
d28gc3RhdGVzLgoKPiAKPj4+IEluIGZhY3QsIEkgc3BlY2lmaWNhbGx5IHdhbnRlZCB0byBlbnN1
cmUgdGhhdCB0aGlzIHdhcyBwb3NzaWJsZSB3aGVuIHdyaXRpbmcKPj4+IHRoZXNlIHBhdGNoZXMs
IGFzIGl04oCZcyBuZWVkZWQgYnkgZHJpdmVycy4gSWYgeW91IHdhbnQgdG8sIEkgY2FuIGNvdmVy
IHRoYXQgaW4KPj4+IHRoZSBleGFtcGxlcywgbm8gd29ycmllcy4KPj4gCj4+IFllcywgdGhhdCB3
b3VsZCBiZSBncmVhdC4gSSBkbyB3b25kZXIgdGhvdWdoIGlmIGl0IHdvdWxkbid0IG1ha2Ugc2Vu
c2UKPj4gdG8gdHVybiBpdCB0aGUgb3RoZXIgd2F5IGFyb3VuZC4gSXQgY3JlYXRlcyBhIGZhaXIg
c2hhcmUgb2YgYm9pbGVycGxhdGUKPj4gZm9yIGEgbnVtYmVyIG9mIGRyaXZlcnMuIENhbid0IHdl
IGtlZXAgQ2xrIHRoZSB3YXkgaXQgaXMgYXMgYQo+PiBsb3dlci1sZXZlbCB0eXBlLCBhbmQgY3Jh
dGUgYSBNYW5hZ2VkQ2xrIChvciB3aGF0ZXZlciBuYW1lIHlvdSBwcmVmZXIpCj4+IHRoYXQgZHJp
dmVycyBjYW4gdXNlLCBhbmQgd291bGQgYmUgcmV0dXJuZWQgYnkgaGlnaGVyLWxldmVsIGhlbHBl
cnMsIGlmCj4+IHRoZXkgc28gY2hvb3NlPwo+PiAKPj4gVGhhdCB3YXksIHdlIGRvIGhhdmUgdGhl
IHR5cGVzdGF0ZSBBUEkgZm9yIHdob2V2ZXIgd2FudHMgdG8sIHdpdGhvdXQKPj4gY3JlYXRpbmcg
dG9vIG11Y2ggYm9pbGVycGxhdGUgZm9yIGV2ZXJ5Ym9keSBlbHNlLgo+IAo+IEkgdGhpbmsgdGhh
dCBpZiB5b3Ugc3RpbGwgd2FudCBhbiBBUEkgd2hlcmUgeW91IGp1c3QgY2FsbCBlbmFibGUvZGlz
YWJsZQo+IGRpcmVjdGx5IG9uIGl0IHdpdGggbm8gcHJvdGVjdGlvbiBhZ2FpbnN0IHVuYmFsYW5j
ZWQgY2FsbHMsIHRoZW4gdGhhdAo+IHNob3VsZCBiZSB0aGUgc3BlY2lhbCBBUEkuIFByb2JhYmx5
IGNhbGxlZCBSYXdDbGsgYW5kIGZ1bmN0aW9ucyBtYXJrZWQKPiB1bnNhZmUuIFVuYmFsYW5jZWQg
Y2FsbHMgc2VlbSByZWFsbHkgZGFuZ2Vyb3VzIGFuZCB1c2Ugc2hvdWxkIG5vdCBiZQo+IGVuY291
cmFnZWQuCgpJIHRoaW5rIHdlIHNob3VsZCBkaXNjb3VyYWdlIFJhd0NsayBpZiBhdCBhbGwgcG9z
c2libGUuIEJ1dCBpZiB0aGUgY29uc2Vuc3VzCmlzIHRoYXQgd2UgKnJlYWxseSogbmVlZCB0aGlz
IGVhc2lseS1hYnVzZWQgdGhpbmcsIEkgY2FuIHByb3ZpZGUgYSBmb2xsb3ctdXAuCgo+IAo+IFRo
ZSBjdXJyZW50IHR5cGUtc3RhdGUgYmFzZWQgQVBJIGlzIHRoZSBsZWFzdC1ib2lsZXJwbGF0ZSBv
cHRpb24gZm9yCj4gZHJpdmVycyB0aGF0IGV4aXN0IHRvZGF5Lgo+IAo+IEFsaWNlCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
