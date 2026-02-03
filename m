Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA0E8783A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEd/Us58C+uLncljAJWHW04li25Hc3/xQdYYF48zht4=; b=ZrJYKB3nM/D/1i
	16Qpm/IEIzd4E1NMiw/CcXUoAU4OIESTxJLZmCpSbDYk7JXvRRDuVrBbY99AfZJCYlCW7CewJ/RVf
	xYDMXCZU6w36rxt+hXP2PDtvAwtGdkIVnAvhvcAf1ixDCJW44MhvBDOjG5C82YdZ9TFxU7fM4DkXj
	engacuwQ2LaCAmeOyxoPKExzMcIsVmiBvURu1r5alnijyKN/Jw4PuLJCA3dDjT+9S+0AlLLMPdSma
	5aXtKWiTSfbcvJ7mRV/Q0E40pNSXsPFiI/eLW+MO1LITotmYqY2l9DPCC+CU63vIkDENbm1Si6moK
	xKCz/FCBh+u3tdhWpAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHT6-00000006lyf-33ge;
	Tue, 03 Feb 2026 14:33:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHT3-00000006lyJ-3aB4
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 14:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770129203;
	bh=GE45IF9BTKapMK7Wz2pnLi4JhSkRouCp88scmTlp9SM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e8RhOKAmEl/cYUyU+pzDXzhJqm83CEQFc02TaliSQk/VzcvUmxLX0xW2ZErKFCNxL
	 9kfyHU5HbpTnKv3JoulgswfcjyFXghUm7Wun2EPutZESsk5kRG027tZEBu2vZXdrr0
	 g5T+SHDwRv5fe956N2CjI0e2TJcnu4XulHxJTbxAtb4bQAYGDMn2XSavR2jm0xewmA
	 jlRP89gF0Ko7hoFXt1MPk49MDs9kDv9KbhDJA7oW+T2nNCuj3Ov8esbyNqlUKgxw4c
	 uMSowRXaIzIdHYU86bDXassySAthDEi2DxzOI40XA2E66EglVdLDSZAvGYPrxopIyO
	 tQuZNZuOefLvA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7967017E12E5;
	Tue,  3 Feb 2026 15:33:22 +0100 (CET)
Date: Tue, 3 Feb 2026 15:33:16 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Maxime
 Ripard <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren
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
Message-ID: <20260203153316.3a645635@fedora>
In-Reply-To: <20C2CC23-4558-4490-A5A9-E46AA150E7DD@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
	<20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
	<20260108-delectable-fennec-of-sunshine-ffca19@houat>
	<98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
	<20260119-thundering-tested-robin-4be817@houat>
	<aW4lCfUyumOKRRJm@google.com>
	<20260203113902.501e5803@fedora>
	<E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
	<DG5DCYIUHCF5.3JL8I7GQ8REI8@garyguo.net>
	<20C2CC23-4558-4490-A5A9-E46AA150E7DD@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_063326_113433_F2269EC5 
X-CRM114-Status: GOOD (  37.66  )
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

T24gVHVlLCAzIEZlYiAyMDI2IDEwOjU1OjA1IC0wMzAwCkRhbmllbCBBbG1laWRhIDxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gPiBPbiAzIEZlYiAyMDI2LCBhdCAxMDo0
MiwgR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5uZXQ+IHdyb3RlOgo+ID4gCj4gPiBPbiBUdWUgRmVi
IDMsIDIwMjYgYXQgMTozMyBQTSBHTVQsIERhbmllbCBBbG1laWRhIHdyb3RlOiAgCj4gPj4gSGkg
Qm9yaXMsCj4gPj4gICAKPiA+Pj4gT24gMyBGZWIgMjAyNiwgYXQgMDc6MzksIEJvcmlzIEJyZXpp
bGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4+PiAKPiA+Pj4g
T24gTW9uLCAxOSBKYW4gMjAyNiAxMjozNToyMSArMDAwMAo+ID4+PiBBbGljZSBSeWhsIDxhbGlj
ZXJ5aGxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPj4+ICAgCj4gPj4+PiBPbiBNb24sIEphbiAxOSwg
MjAyNiBhdCAxMTo0NTo1N0FNICswMTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOiAgCj4gPj4+Pj4g
T24gVGh1LCBKYW4gMDgsIDIwMjYgYXQgMTE6MTQ6MzdBTSAtMDMwMCwgRGFuaWVsIEFsbWVpZGEg
d3JvdGU6ICAgIAo+ID4+Pj4+Pj4gRm9yIGV4YW1wbGUsIGl0J3MgcXVpdGUgdHlwaWNhbCB0byBo
YXZlIChhdCBsZWFzdCkgb25lIGNsb2NrIGZvciB0aGUgYnVzCj4gPj4+Pj4+PiBpbnRlcmZhY2Ug
dGhhdCBkcml2ZXMgdGhlIHJlZ2lzdGVyLCBhbmQgb25lIHRoYXQgZHJpdmVzIHRoZSBtYWluCj4g
Pj4+Pj4+PiBjb21wb25lbnQgbG9naWMuIFRoZSBmb3JtZXIgbmVlZHMgdG8gYmUgZW5hYmxlZCBv
bmx5IHdoZW4geW91J3JlCj4gPj4+Pj4+PiBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVycyAoYW5kIGNh
biBiZSBhYnN0cmFjdGVkIHdpdGgKPiA+Pj4+Pj4+IHJlZ21hcF9tbWlvX2F0dGFjaF9jbGsgZm9y
IGV4YW1wbGUpLCBhbmQgdGhlIGxhdHRlciBuZWVkcyB0byBiZSBlbmFibGVkCj4gPj4+Pj4+PiBv
bmx5IHdoZW4gdGhlIGRldmljZSBhY3R1YWxseSBzdGFydHMgb3BlcmF0aW5nLgo+ID4+Pj4+Pj4g
Cj4gPj4+Pj4+PiBZb3UgaGF2ZSBhIHNpbWlsYXIgdGhpbmcgZm9yIHRoZSBwcmVwYXJlIHZzIGVu
YWJsZSB0aGluZy4gVGhlIGRpZmZlcmVuY2UKPiA+Pj4+Pj4+IGJldHdlZW4gdGhlIHR3byBpcyB0
aGF0IGVuYWJsZSBjYW4gYmUgY2FsbGVkIGludG8gYXRvbWljIGNvbnRleHQgYnV0Cj4gPj4+Pj4+
PiBwcmVwYXJlIGNhbid0Lgo+ID4+Pj4+Pj4gCj4gPj4+Pj4+PiBTbyBmb3IgZHJpdmVycyB0aGF0
IHdvdWxkIGNhcmUgYWJvdXQgdGhpcywgeW91IHdvdWxkIGNyZWF0ZSB5b3VyIGRldmljZQo+ID4+
Pj4+Pj4gd2l0aCBhbiB1bnByZXBhcmVkIGNsb2NrLCBhbmQgdGhlbiBhdCB2YXJpb3VzIHRpbWVz
IGR1cmluZyB0aGUgZHJpdmVyCj4gPj4+Pj4+PiBsaWZldGltZSwgeW91IHdvdWxkIG11dGF0ZSB0
aGF0IHN0YXRlLiAgICAKPiA+Pj4+IAo+ID4+Pj4gVGhlIGNhc2Ugd2hlcmUgeW91J3JlIGRvaW5n
IGl0IG9ubHkgd2hpbGUgYWNjZXNzaW5nIHJlZ2lzdGVycyBpcwo+ID4+Pj4gaW50ZXJlc3Rpbmcs
IGJlY2F1c2UgdGhhdCBtZWFucyB0aGUgRW5hYmxlIGJpdCBtYXkgYmUgb3duZWQgYnkgYSBsb2Nh
bAo+ID4+Pj4gdmFyaWFibGUuIFdlIG1heSBpbWFnaW5lIGFuOgo+ID4+Pj4gCj4gPj4+PiAgIGxl
dCBlbmFibGVkID0gc2VsZi5wcmVwYXJlZF9jbGsuZW5hYmxlX3Njb3BlZCgpOwo+ID4+Pj4gICAu
Li4gdXNlIHJlZ2lzdGVycwo+ID4+Pj4gICBkcm9wKGVuYWJsZWQpOwo+ID4+Pj4gCj4gPj4+PiBO
b3cgLi4uIHRoaXMgZG9lc24ndCBxdWl0ZSB3b3JrIHdpdGggdGhlIGN1cnJlbnQgQVBJIC0gdGhl
IGN1cnJlbnQKPiA+Pj4+IEVuYWJsZWQgc3RhdGVkIG93bnMgYm90aCBhIHByZXBhcmUgYW5kIGVu
YWJsZSBjb3VudCwgYnV0IHRoZSBhYm92ZSBrZWVwcwo+ID4+Pj4gdGhlIHByZXBhcmUgY291bnQg
aW4gYHNlbGZgIGFuZCB0aGUgZW5hYmxlZCBjb3VudCBpbiBhIGxvY2FsIHZhcmlhYmxlLgo+ID4+
Pj4gQnV0IGl0IGNvdWxkIGJlIGRvbmUgd2l0aCBhIGZvdXJ0aCBzdGF0ZSwgb3IgYnkgYSBjbG9z
dXJlIG1ldGhvZDoKPiA+Pj4+IAo+ID4+Pj4gICBzZWxmLnByZXBhcmVkX2Nsay53aXRoX2VuYWJs
ZWQofHwgewo+ID4+Pj4gICAgICAgLi4uIHVzZSByZWdpc3RlcnMKPiA+Pj4+ICAgfSk7Cj4gPj4+
PiAKPiA+Pj4+IEFsbCBvZiB0aGlzIHdvdWxkIHdvcmsgd2l0aCBhbiBpbW11dGFibGUgdmFyaWFi
bGUgb2YgdHlwZSBDbGs8UHJlcGFyZWQ+LiAgCj4gPj4+IAo+ID4+PiBIbSwgbWF5YmUgaXQnZCBt
YWtlIHNlbnNlIHRvIGltcGxlbWVudCBDbG9uZSBzbyB3ZSBjYW4gaGF2ZSBhIHRlbXBvcmFyeQo+
ID4+PiBjbGsgdmFyaWFibGUgdGhhdCBoYXMgaXRzIG93biBwcmVwYXJlL2VuYWJsZSByZWZzIGFu
ZCByZWxlYXNlcyB0aGVtCj4gPj4+IGFzIGl0IGdvZXMgb3V0IG9mIHNjb3BlLiBUaGlzIGltcGxp
ZXMgd3JhcHBpbmcgKm11dCBiaW5kaW5nczo6Y2xrIGluIGFuCj4gPj4+IEFyYzw+IGJlY2F1c2Ug
YmluZGluZ3M6OmNsayBpcyBub3QgQVJlZiwgYnV0IHNob3VsZCBiZSByZWxhdGl2ZWx5IGVhc3kK
PiA+Pj4gdG8gZG8uIFBvc3RpbmcgdGhlIHF1aWNrIGV4cGVyaW1lbnQgSSBkaWQgd2l0aCB0aGlz
IGFwcHJvYWNoLCBpbiBjYXNlCj4gPj4+IHlvdSdyZSBpbnRlcmVzdGVkIFsxXQo+ID4+PiAKPiA+
Pj4gWzFdaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2JicmV6aWxsb24vbGludXgvLS9j
b21taXQvZDVkMDRkYTRmNGY2MTkyYjZlNjc2MGQ1Zjg2MWM2OTU5NmM3ZDgzNyAgCj4gPj4gCj4g
Pj4gVGhlIHByb2JsZW0gd2l0aCB3aGF0IHlvdSBoYXZlIHN1Z2dlc3RlZCBpcyB0aGF0IHRoZSBw
cmV2aW91cyBzdGF0ZSBpcyBub3QKPiA+PiBjb25zdW1lZCBpZiB5b3UgY2FuIGNsb25lIGl0LCBh
bmQgY29uc3VtaW5nIHRoZSBwcmV2aW91cyBzdGF0ZSBpcyBhIHByZXR0eSBrZXkKPiA+PiBlbGVt
ZW50IGluIGVuc3VyaW5nIHlvdSBjYW5ub3QgbWlzdXNlIGl0LiBGb3IgZXhhbXBsZSwgaGVyZToK
PiA+PiAKPiA+PiBsZXQgZW5hYmxlZF9jbGsgPSBwcmVwYXJlZF9jbGsuY2xvbmUoKS5lbmFibGUo
KT87Cj4gPj4gLy8gZG8gc3R1ZmYKPiA+PiAvLyBlbmFibGVkX2NsayBnb2VzIG91dCBvZiBzY29w
ZSBhbmQgcmVsZWFzZXMgdGhlIGVuYWJsZQo+ID4+IC8vIHJlZiBpdCBoYWQKPiA+PiAKPiA+PiBw
cmVwYXJlZF9jbGsgaXMgc3RpbGwgYWxpdmUuIE5vdywgdGhpcyBtYXkgbm90IGJlIHRoZSBlbmQg
b2YgdGhlIHdvcmxkIGluIHRoaXMKPiA+PiBwYXJ0aWN1bGFyIGNhc2UsIGJ1dCBmb3IgQVBJIGNv
bnNpc3RlbmN5LCBJJ2Qgc2F5IHdlIHNob3VsZCBwcm9iYWJseSBhdm9pZCB0aGlzCj4gPj4gYmVo
YXZpb3IuICAKPiA+IAo+ID4gSXMgdGhpcyBhbiBpc3N1ZSB0aG91Z2g/IFlvdSBjYW5ub3QgbWlz
dGFrZW5seSBvd24gYENsazxFbmFibGVkPmAgd2hpbGUgdGhlIGNsawo+ID4gaXMgbm90IGVuYWJs
ZWQsIChhbmQgc2ltaWxhcmx5IGZvciBgUHJlcGFyZWRgKSwgYW5kIHRoYXQgc2hvdWxkIGJlIHN1
ZmZpY2llbnQuICAKPiAKPiBJdCBpcyBub3QgYW4gaXNzdWUuIEhvd2V2ZXIsIEkganVzdCBmaW5k
IGl0IGEgYml0IGNvbmZ1c2luZy4gV2l0aCBhIHR5cGVzdGF0ZSwgb25lCj4gdXN1YWxseSBleHBl
Y3RzIHN0YXRlIHRyYW5zaXRpb25zIHdoZXJlIGEgbmV3IHN0YXRlIGZ1bGx5IGNvbnN1bWVzIHRo
ZSBwcmV2aW91cwo+IG9uZSwgYW5kIHRoYXQgYXNzdW1wdGlvbiBpcyDigJxicm9rZW7igJ0gaW4g
YSB3YXkgd2hlbiB5b3UgYWRkIGNsb25lKCkuCgpJdCdzIGp1c3QgdGhlIHdheSBjbGtzIHdvcmsg
aW4gcHJhY3RpY2U6IHlvdSBoYXZpbmcgYSBDbGs8VW5wcmVwYXJlZD4KZG9lc24ndCBtZWFuIHRo
ZSB1bmRlcmx5aW5nIGNsa19odyAodGhlIEMgb2JqZWN0KSBpcyBpbiBhbiB1bnByZXBhcmVkCnN0
YXRlLCBiZWNhdXNlIHNvbWUgb3RoZXIgdXNlcnMgbWlnaHQgcG9pbnQgdG8gdGhlIHNhbWUgY2xr
X2h3IGFuZCBoYXZlCml0IGVuYWJsZWQgYWxyZWFkeS4gV2hhdCBDbGs8U3RhdGU+IG1lYW5zIGhl
cmUgaXMgdGhhdCB5b3UgaGF2ZSBhIGxvY2FsCnZpZXcgb2YgYSBjbGsgdGhhdCdzIGluIGF0IGxl
YXN0IHRoaXMgU3RhdGUuIEluIG9yZGVyIHRvIGd1YXJhbnRlZSB0aGF0CnRoZSBjbGsgaXMgYXQg
bGVhc3QgT3RoZXJTdGF0ZSwgeW91J2xsIGhhdmUgdG8gdHJhbnNpdGlvbiB5b3VyIHZpZXcgdG8K
dGhpcyBPdGhlclN0YXRlLgoKQ2xvbmUgaGVyZSBqdXN0IG1lYW5zIHlvdSdyZSBjbG9uaW5nIGEg
dmlldyBvZiB0aGlzIGNsb25lIGluIGl0cwpvcmlnaW5hbCB2aWV3IHN0YXRlLiBUaGVuIHlvdSdy
ZSBmcmVlIHRvIGRvIHdoYXRldmVyIHlvdSB3YW50IG9uIHRoaXMKbmV3IHZpZXcuIFNvIGlzIHRo
ZSBvcmlnaW5hbCBvd25lciBvZiB0aGUgb2JqZWN0IHlvdSBjbG9uZSBmcm9tLgoKPiAKPiA+IAo+
ID4gSGF2aW5nIGBDbGs8UHJlcGFyZWQ+YCBtYWtlcyBubyBndWFyYW50ZWUgb24gaWYgdGhlIGNs
ayBpcyBlbmFibGVkIG9yIG5vdCBhbnl3YXkKPiA+IGFzIHlvdSBjYW4gaGF2ZSBhbm90aGVyIHVz
ZXIgZG8gYENsazxVbnByZXBhcmVkPjo6Z2V0KCkuZW5hYmxlKClgLiAgCj4gCj4gQWx0aG91Z2gg
eW914oCZcmUgcmlnaHQgaGVyZSwgSSBmaW5kIHRoaXMgbGVzcyBjb25mdXNpbmcgdGhhbiBjbG9u
ZSgpLiBZb3UKPiBoYXZlIHRvIGV4cGxpY2l0bHkgY3JhZnQgYSBuZXcgQ2xrPEVuYWJsZWQ+LCB3
aGVyZSBhIGNsb25lKCkgaXMgYSBzaG9ydGVyIHdheQo+IHRvIGJhc2ljYWxseSBnZXQgYXJvdW5k
IHRoZSDigJxzdGF0ZSB0cmFuc2l0aW9u4oCdIGlkZWEgb24gYW4gX2V4aXN0aW5nXyBDbGsKPiBy
ZWZlcmVuY2UuCgpUaGUgaWRlYSBiZWhpbmQgdGhlIGNsb25lKCkgaXMgdGhhdCB5b3UgY2FuIHRy
YW5zaXRpb24gZnJvbSBvbmUgc3RhdGUKdG8gYW4gaGlnaGVyIHN0YXRlIChwcmVwYXJlZCAtPiBl
bmFibGVkIGZvciBpbnN0YW5jZSkgZm9yIGEgc2hvcnRlcgpwZXJpb2Qgb2YgdGltZSB0aGFuIHRo
ZSBjbG9uZWQgY2xrIGxpZmV0aW1lLiBTb21ldGhpbmcgbGlrZSB0aGF0LCBmb3IKaW5zdGFuY2U6
CgoJbGV0IE15RGV2aWNlIHsKCQlwcmVwYXJlZF9jbGs6IENsazo6Z2V0KC4uLik/LnByZXBhcmUo
KT8sCgl9CgoKCWltcGxlbSBNeURldmljZSB7CgkJZm4gZG9fc3R1ZmYoJnNlbGYpIHsKCQkJbGV0
IGVuYWJsZWRfY2xrID0gc2VsZi5wcmVwYXJlZF9jbGsuY2xvbmUoKTsKCgkJCS8vIGRvIHN0dWZm
IHRoYXQgbmVlZCB0byBiZSBndWFyYW50ZWVkIHRoYXQgY2xrCgkJCS8vIGlzIGVuYWJsZWQKCQkJ
c2VsZi5kb19vdGhlcl9zdHVmZihlbmFibGVkX2Nsayk7CgoJCQkvLyB0aGUgZW5hYmxlZF9jbGsg
b2JqZWN0IGlzIGRyb3BwZWQsIGJ1dCB0aGUKCQkJLy8gY2xrIHJlbWFpbnMgcHJlcGFyZWQgYmVj
YXVzZQoJCQkvLyBzZWxmLnByZXBhcmVkX2NsayBpcyBzdGlsbCB0aGVyZQoJCX0KCX0KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
