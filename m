Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C12E87830
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I57/gHGblBvqBezF1wWLgAg4KWWRE356d42vQF/iizk=; b=va0V3OGKuXyMG0
	Lq/GKteIh1gBv37Jnqx0JixtC6/eZhKeELpnmz7L0bdvXF1aqY8sUKs0D8CGxEzaANRqn9Y2/DoWb
	cwuMhKG7KtZ87BvtCJVjUf9KfRkknxNJDojAd5nmETtcjss+CIZxfJxo7hb8GJzAhJIz85c44cIEc
	x6mbNflQ3frkA25TCvuTeSCfZWca9c7WdjuaYcPqAGgrEuXDriiGM99ImySAfwk5CTqvS90gY01v3
	hWA+hJowKY0l8dJ2fRhu/GUPnUA9//iASOmMgkYBcZdqkq5wmHDWneL37at1avbGR84ZH5Tqo0IlM
	8gYfW+mYzh0LjblrLeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGsa-00000006iNu-1xRL;
	Tue, 03 Feb 2026 13:55:44 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGsX-00000006iNZ-3Xrk
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770126925; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mqpErazCYJwWsKbalny940d+xNG67LuWdf+RjZkkuq/biWxMMJZK5jB0JBDew84/XQMe+ZPPQlxiNIwNz+Y09GEbgaAatTzrluKXr/66AjzNJ7n9gjcKYmhg11lcKrl+DX87eHhgREAotCYYZHLfKA6Iw3qkCiaf7vLnKMk6pTM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770126925; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2blSuRUPsP6+4ceJBo384cKeJKIWx4uTqBEcRiz5ods=; 
	b=W5puTORxBCCUx5ioGJP5obhlLJLb3U1CH1/frhpZEcsr0ydo0e8t5fZMO5gNb8yRazIKpH5CplFPDhlTHncOGTy93cBN8uhimwZLK/ZCXBknWzZIK10VQqp0SxY1kDhFKPJHOhcyDzytntI20XkCbDk9SclS57zFAkhlDGPMapQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770126925;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=2blSuRUPsP6+4ceJBo384cKeJKIWx4uTqBEcRiz5ods=;
	b=TEQQT4xbTfWVfPNOg0xCXb4lASGYx+OI0vE+k0g0C53zBi5kGDHziUlC8sPs37pC
	J1akyXM96Jugpf5zq+PuZf3cgjPoa2o164mWE4yMsSpW/akFV/lQ47P+RB+M5QulQO8
	6qRchcKH4FaTpf/tHdZWDT5OKasnsWHhw8EQFzmo=
Received: by mx.zohomail.com with SMTPS id 1770126924198180.96689099106857;
	Tue, 3 Feb 2026 05:55:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DG5DCYIUHCF5.3JL8I7GQ8REI8@garyguo.net>
Date: Tue, 3 Feb 2026 10:55:05 -0300
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>,
 Maxime Ripard <mripard@kernel.org>,
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
Message-Id: <20C2CC23-4558-4490-A5A9-E46AA150E7DD@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <20260203113902.501e5803@fedora>
 <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
 <DG5DCYIUHCF5.3JL8I7GQ8REI8@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_055541_949587_CFC62AD0 
X-CRM114-Status: GOOD (  27.42  )
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

Cgo+IE9uIDMgRmViIDIwMjYsIGF0IDEwOjQyLCBHYXJ5IEd1byA8Z2FyeUBnYXJ5Z3VvLm5ldD4g
d3JvdGU6Cj4gCj4gT24gVHVlIEZlYiAzLCAyMDI2IGF0IDE6MzMgUE0gR01ULCBEYW5pZWwgQWxt
ZWlkYSB3cm90ZToKPj4gSGkgQm9yaXMsCj4+IAo+Pj4gT24gMyBGZWIgMjAyNiwgYXQgMDc6Mzks
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+
Pj4gCj4+PiBPbiBNb24sIDE5IEphbiAyMDI2IDEyOjM1OjIxICswMDAwCj4+PiBBbGljZSBSeWhs
IDxhbGljZXJ5aGxAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4+PiAKPj4+PiBPbiBNb24sIEphbiAxOSwg
MjAyNiBhdCAxMTo0NTo1N0FNICswMTAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+Pj4+PiBPbiBU
aHUsIEphbiAwOCwgMjAyNiBhdCAxMToxNDozN0FNIC0wMzAwLCBEYW5pZWwgQWxtZWlkYSB3cm90
ZTogIAo+Pj4+Pj4+IEZvciBleGFtcGxlLCBpdCdzIHF1aXRlIHR5cGljYWwgdG8gaGF2ZSAoYXQg
bGVhc3QpIG9uZSBjbG9jayBmb3IgdGhlIGJ1cwo+Pj4+Pj4+IGludGVyZmFjZSB0aGF0IGRyaXZl
cyB0aGUgcmVnaXN0ZXIsIGFuZCBvbmUgdGhhdCBkcml2ZXMgdGhlIG1haW4KPj4+Pj4+PiBjb21w
b25lbnQgbG9naWMuIFRoZSBmb3JtZXIgbmVlZHMgdG8gYmUgZW5hYmxlZCBvbmx5IHdoZW4geW91
J3JlCj4+Pj4+Pj4gYWNjZXNzaW5nIHRoZSByZWdpc3RlcnMgKGFuZCBjYW4gYmUgYWJzdHJhY3Rl
ZCB3aXRoCj4+Pj4+Pj4gcmVnbWFwX21taW9fYXR0YWNoX2NsayBmb3IgZXhhbXBsZSksIGFuZCB0
aGUgbGF0dGVyIG5lZWRzIHRvIGJlIGVuYWJsZWQKPj4+Pj4+PiBvbmx5IHdoZW4gdGhlIGRldmlj
ZSBhY3R1YWxseSBzdGFydHMgb3BlcmF0aW5nLgo+Pj4+Pj4+IAo+Pj4+Pj4+IFlvdSBoYXZlIGEg
c2ltaWxhciB0aGluZyBmb3IgdGhlIHByZXBhcmUgdnMgZW5hYmxlIHRoaW5nLiBUaGUgZGlmZmVy
ZW5jZQo+Pj4+Pj4+IGJldHdlZW4gdGhlIHR3byBpcyB0aGF0IGVuYWJsZSBjYW4gYmUgY2FsbGVk
IGludG8gYXRvbWljIGNvbnRleHQgYnV0Cj4+Pj4+Pj4gcHJlcGFyZSBjYW4ndC4KPj4+Pj4+PiAK
Pj4+Pj4+PiBTbyBmb3IgZHJpdmVycyB0aGF0IHdvdWxkIGNhcmUgYWJvdXQgdGhpcywgeW91IHdv
dWxkIGNyZWF0ZSB5b3VyIGRldmljZQo+Pj4+Pj4+IHdpdGggYW4gdW5wcmVwYXJlZCBjbG9jaywg
YW5kIHRoZW4gYXQgdmFyaW91cyB0aW1lcyBkdXJpbmcgdGhlIGRyaXZlcgo+Pj4+Pj4+IGxpZmV0
aW1lLCB5b3Ugd291bGQgbXV0YXRlIHRoYXQgc3RhdGUuICAKPj4+PiAKPj4+PiBUaGUgY2FzZSB3
aGVyZSB5b3UncmUgZG9pbmcgaXQgb25seSB3aGlsZSBhY2Nlc3NpbmcgcmVnaXN0ZXJzIGlzCj4+
Pj4gaW50ZXJlc3RpbmcsIGJlY2F1c2UgdGhhdCBtZWFucyB0aGUgRW5hYmxlIGJpdCBtYXkgYmUg
b3duZWQgYnkgYSBsb2NhbAo+Pj4+IHZhcmlhYmxlLiBXZSBtYXkgaW1hZ2luZSBhbjoKPj4+PiAK
Pj4+PiAgIGxldCBlbmFibGVkID0gc2VsZi5wcmVwYXJlZF9jbGsuZW5hYmxlX3Njb3BlZCgpOwo+
Pj4+ICAgLi4uIHVzZSByZWdpc3RlcnMKPj4+PiAgIGRyb3AoZW5hYmxlZCk7Cj4+Pj4gCj4+Pj4g
Tm93IC4uLiB0aGlzIGRvZXNuJ3QgcXVpdGUgd29yayB3aXRoIHRoZSBjdXJyZW50IEFQSSAtIHRo
ZSBjdXJyZW50Cj4+Pj4gRW5hYmxlZCBzdGF0ZWQgb3ducyBib3RoIGEgcHJlcGFyZSBhbmQgZW5h
YmxlIGNvdW50LCBidXQgdGhlIGFib3ZlIGtlZXBzCj4+Pj4gdGhlIHByZXBhcmUgY291bnQgaW4g
YHNlbGZgIGFuZCB0aGUgZW5hYmxlZCBjb3VudCBpbiBhIGxvY2FsIHZhcmlhYmxlLgo+Pj4+IEJ1
dCBpdCBjb3VsZCBiZSBkb25lIHdpdGggYSBmb3VydGggc3RhdGUsIG9yIGJ5IGEgY2xvc3VyZSBt
ZXRob2Q6Cj4+Pj4gCj4+Pj4gICBzZWxmLnByZXBhcmVkX2Nsay53aXRoX2VuYWJsZWQofHwgewo+
Pj4+ICAgICAgIC4uLiB1c2UgcmVnaXN0ZXJzCj4+Pj4gICB9KTsKPj4+PiAKPj4+PiBBbGwgb2Yg
dGhpcyB3b3VsZCB3b3JrIHdpdGggYW4gaW1tdXRhYmxlIHZhcmlhYmxlIG9mIHR5cGUgQ2xrPFBy
ZXBhcmVkPi4KPj4+IAo+Pj4gSG0sIG1heWJlIGl0J2QgbWFrZSBzZW5zZSB0byBpbXBsZW1lbnQg
Q2xvbmUgc28gd2UgY2FuIGhhdmUgYSB0ZW1wb3JhcnkKPj4+IGNsayB2YXJpYWJsZSB0aGF0IGhh
cyBpdHMgb3duIHByZXBhcmUvZW5hYmxlIHJlZnMgYW5kIHJlbGVhc2VzIHRoZW0KPj4+IGFzIGl0
IGdvZXMgb3V0IG9mIHNjb3BlLiBUaGlzIGltcGxpZXMgd3JhcHBpbmcgKm11dCBiaW5kaW5nczo6
Y2xrIGluIGFuCj4+PiBBcmM8PiBiZWNhdXNlIGJpbmRpbmdzOjpjbGsgaXMgbm90IEFSZWYsIGJ1
dCBzaG91bGQgYmUgcmVsYXRpdmVseSBlYXN5Cj4+PiB0byBkby4gUG9zdGluZyB0aGUgcXVpY2sg
ZXhwZXJpbWVudCBJIGRpZCB3aXRoIHRoaXMgYXBwcm9hY2gsIGluIGNhc2UKPj4+IHlvdSdyZSBp
bnRlcmVzdGVkIFsxXQo+Pj4gCj4+PiBbMV1odHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
YmJyZXppbGxvbi9saW51eC8tL2NvbW1pdC9kNWQwNGRhNGY0ZjYxOTJiNmU2NzYwZDVmODYxYzY5
NTk2YzdkODM3Cj4+IAo+PiBUaGUgcHJvYmxlbSB3aXRoIHdoYXQgeW91IGhhdmUgc3VnZ2VzdGVk
IGlzIHRoYXQgdGhlIHByZXZpb3VzIHN0YXRlIGlzIG5vdAo+PiBjb25zdW1lZCBpZiB5b3UgY2Fu
IGNsb25lIGl0LCBhbmQgY29uc3VtaW5nIHRoZSBwcmV2aW91cyBzdGF0ZSBpcyBhIHByZXR0eSBr
ZXkKPj4gZWxlbWVudCBpbiBlbnN1cmluZyB5b3UgY2Fubm90IG1pc3VzZSBpdC4gRm9yIGV4YW1w
bGUsIGhlcmU6Cj4+IAo+PiBsZXQgZW5hYmxlZF9jbGsgPSBwcmVwYXJlZF9jbGsuY2xvbmUoKS5l
bmFibGUoKT87Cj4+IC8vIGRvIHN0dWZmCj4+IC8vIGVuYWJsZWRfY2xrIGdvZXMgb3V0IG9mIHNj
b3BlIGFuZCByZWxlYXNlcyB0aGUgZW5hYmxlCj4+IC8vIHJlZiBpdCBoYWQKPj4gCj4+IHByZXBh
cmVkX2NsayBpcyBzdGlsbCBhbGl2ZS4gTm93LCB0aGlzIG1heSBub3QgYmUgdGhlIGVuZCBvZiB0
aGUgd29ybGQgaW4gdGhpcwo+PiBwYXJ0aWN1bGFyIGNhc2UsIGJ1dCBmb3IgQVBJIGNvbnNpc3Rl
bmN5LCBJJ2Qgc2F5IHdlIHNob3VsZCBwcm9iYWJseSBhdm9pZCB0aGlzCj4+IGJlaGF2aW9yLgo+
IAo+IElzIHRoaXMgYW4gaXNzdWUgdGhvdWdoPyBZb3UgY2Fubm90IG1pc3Rha2VubHkgb3duIGBD
bGs8RW5hYmxlZD5gIHdoaWxlIHRoZSBjbGsKPiBpcyBub3QgZW5hYmxlZCwgKGFuZCBzaW1pbGFy
bHkgZm9yIGBQcmVwYXJlZGApLCBhbmQgdGhhdCBzaG91bGQgYmUgc3VmZmljaWVudC4KCkl0IGlz
IG5vdCBhbiBpc3N1ZS4gSG93ZXZlciwgSSBqdXN0IGZpbmQgaXQgYSBiaXQgY29uZnVzaW5nLiBX
aXRoIGEgdHlwZXN0YXRlLCBvbmUKdXN1YWxseSBleHBlY3RzIHN0YXRlIHRyYW5zaXRpb25zIHdo
ZXJlIGEgbmV3IHN0YXRlIGZ1bGx5IGNvbnN1bWVzIHRoZSBwcmV2aW91cwpvbmUsIGFuZCB0aGF0
IGFzc3VtcHRpb24gaXMg4oCcYnJva2Vu4oCdIGluIGEgd2F5IHdoZW4geW91IGFkZCBjbG9uZSgp
LgoKPiAKPiBIYXZpbmcgYENsazxQcmVwYXJlZD5gIG1ha2VzIG5vIGd1YXJhbnRlZSBvbiBpZiB0
aGUgY2xrIGlzIGVuYWJsZWQgb3Igbm90IGFueXdheQo+IGFzIHlvdSBjYW4gaGF2ZSBhbm90aGVy
IHVzZXIgZG8gYENsazxVbnByZXBhcmVkPjo6Z2V0KCkuZW5hYmxlKClgLgoKQWx0aG91Z2ggeW91
4oCZcmUgcmlnaHQgaGVyZSwgSSBmaW5kIHRoaXMgbGVzcyBjb25mdXNpbmcgdGhhbiBjbG9uZSgp
LiBZb3UKaGF2ZSB0byBleHBsaWNpdGx5IGNyYWZ0IGEgbmV3IENsazxFbmFibGVkPiwgd2hlcmUg
YSBjbG9uZSgpIGlzIGEgc2hvcnRlciB3YXkKdG8gYmFzaWNhbGx5IGdldCBhcm91bmQgdGhlIOKA
nHN0YXRlIHRyYW5zaXRpb27igJ0gaWRlYSBvbiBhbiBfZXhpc3RpbmdfIENsawpyZWZlcmVuY2Uu
CgpUaGlzIGlzIGEgYml0IHBlZGFudGljIG9uIG15IHNpZGUgdGhvdWdoLCBzbyBJIGhhdmUgbm8g
cHJvYmxlbSBpbiBhZGRpbmcKY2xvbmUoKSBpZiBpdCdzIHRoZSBjb25zZW5zdXMgb2YgdGhlIG1h
am9yaXR5LgoKPiAKPiBUaGUgb25seSBndWFyYW50ZWUgaXMgdGhhdCB0aGUgc3RhdGUgdGhlIGNs
ayBoYXZlIGlzIGdvaW5nIHRvIGJlIGdyZWF0ZXIgdGhhbiBvcgo+IGVxdWFsIHRvIHRoZSB0eXBl
IHN0YXRlLCBzbyBhbGxvd2luZyBjbG9uaW5nIGFuIGludGVybWVkaWF0ZSBzdGF0ZSBpcyBubwo+
IHByb2JsZW0uCj4gCj4gQmVzdCwKPiBHYXJ5Cj4gCj4+IAo+PiBJIHNlZSB0aGF0IEFsaWNlIHN1
Z2dlc3RlZCBhIGNsb3N1cmUgYXBwcm9hY2guIElNSE8sIHdlIHNob3VsZCB1c2UgdGhhdAo+PiBp
bnN0ZWFkLgo+PiAKPj4g4oCUIERhbmllbAoKCklzIHRoZXJlIGFueSBwdXNoYmFjayBvbiB0aGUg
Y2xvc3VyZSBhcHByb2FjaD8gSWYgc28sIG1pbmQgc2hhcmluZyB3aHk/CgrigJQgRGFuaWVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
