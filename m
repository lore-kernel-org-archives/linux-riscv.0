Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2688E8782A
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VsijEr7ei/xZVEQe3hgLYK9MDmOL6MKmA3xJ7XD4kc=; b=xta2DT5jUtgy4c
	J/lp0YeqwmeMhEtNAbv8l3l3vi20xo94SGTo27AKYD7bDi27Yn8gI/v4hMtuOPYW0JGzsPq8Ue0vw
	Jf9xs4Bf/pyXzJW/atg+qv3pS+0sDWdAWRsCFXvczmsZi8a/SMXSMEyP08FOBB+HQVjI7IF3oDLMU
	mFKBW3wqc3GOo1JWtBYX6I6zoAnf5H1fDJ8AtDLIzeP/G1IeIlIyu6ghIBeT616emNG/xoUVu8eSk
	EwPZxjaEpaV0C3J56fgRm22wWKzWBUEgL4k0q7J2sP0SnmZm9gYu0FirAr35kPPgTu6IiItU/53WX
	CQC+ryVqOWvMsw2dBpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGXr-00000006fYi-2Jd2;
	Tue, 03 Feb 2026 13:34:19 +0000
Received: from sender4-pp-e107.zoho.com ([136.143.188.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGXp-00000006fYA-39MZ
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 13:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770125637; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C1GbKPfFkTdX3EQDiy0qa9/CKZhWiApFO8NLGPDE6I8dBZr+hSDQJjBYjD31uKofyr4BKwbxxzHy8In87h6bMY1wNCN8bcAxmsKbIUrWXCXS52Edu6f3aMgYCMgdWmxsKtw9XTlgFkjP26XQ1TQKpDrFJ7oYRU5upEkDtiBGjRM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770125637; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HyBOdQqWUtuQacZEEr3ql23BswwmLu6r6afyPnxrMoA=; 
	b=N2r0FU1b18zkOKUUhM4R7bNfxM8CRkG9/BoQJNg6pFKNLIfmNbzwCZ1Ui5mCUfzsDA0cVUgYDD981n6nvWwuf0ocKvEIpSZ39v/PuqKz6I2Ni/BDaX02EShynz35Uus3gdhAy27jYUFSxjXv0/2PMVJbjNRzC6lsk/UFDAJ7YcI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770125637;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=HyBOdQqWUtuQacZEEr3ql23BswwmLu6r6afyPnxrMoA=;
	b=OA7UxvT7iiUq1OUz1gxbHI8H2/t6OL0y+g8hem3/mGpjMJ37P3mnyQWH28GnvFKs
	NkbuY3U7FX8T5dN3q8TC6MzsJU/jZxX2IknKIZIpHar1udK5OXVCW5S949s0L9cKpRn
	84RC8g3iE9sRI4ni8Dn3rt9Odhx5CpN3FL93OcXM=
Received: by mx.zohomail.com with SMTPS id 1770125634489679.9066983046164;
	Tue, 3 Feb 2026 05:33:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260203113902.501e5803@fedora>
Date: Tue, 3 Feb 2026 10:33:34 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
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
Message-Id: <E7286D12-0BD9-4726-B072-FE5A040312B1@collabora.com>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat> <aW4lCfUyumOKRRJm@google.com>
 <20260203113902.501e5803@fedora>
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_053417_844492_26734066 
X-CRM114-Status: GOOD (  19.46  )
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

SGkgQm9yaXMsCgo+IE9uIDMgRmViIDIwMjYsIGF0IDA3OjM5LCBCb3JpcyBCcmV6aWxsb24gPGJv
cmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiAKPiBPbiBNb24sIDE5IEphbiAy
MDI2IDEyOjM1OjIxICswMDAwCj4gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+IHdy
b3RlOgo+IAo+PiBPbiBNb24sIEphbiAxOSwgMjAyNiBhdCAxMTo0NTo1N0FNICswMTAwLCBNYXhp
bWUgUmlwYXJkIHdyb3RlOgo+Pj4gT24gVGh1LCBKYW4gMDgsIDIwMjYgYXQgMTE6MTQ6MzdBTSAt
MDMwMCwgRGFuaWVsIEFsbWVpZGEgd3JvdGU6ICAKPj4+Pj4gRm9yIGV4YW1wbGUsIGl0J3MgcXVp
dGUgdHlwaWNhbCB0byBoYXZlIChhdCBsZWFzdCkgb25lIGNsb2NrIGZvciB0aGUgYnVzCj4+Pj4+
IGludGVyZmFjZSB0aGF0IGRyaXZlcyB0aGUgcmVnaXN0ZXIsIGFuZCBvbmUgdGhhdCBkcml2ZXMg
dGhlIG1haW4KPj4+Pj4gY29tcG9uZW50IGxvZ2ljLiBUaGUgZm9ybWVyIG5lZWRzIHRvIGJlIGVu
YWJsZWQgb25seSB3aGVuIHlvdSdyZQo+Pj4+PiBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVycyAoYW5k
IGNhbiBiZSBhYnN0cmFjdGVkIHdpdGgKPj4+Pj4gcmVnbWFwX21taW9fYXR0YWNoX2NsayBmb3Ig
ZXhhbXBsZSksIGFuZCB0aGUgbGF0dGVyIG5lZWRzIHRvIGJlIGVuYWJsZWQKPj4+Pj4gb25seSB3
aGVuIHRoZSBkZXZpY2UgYWN0dWFsbHkgc3RhcnRzIG9wZXJhdGluZy4KPj4+Pj4gCj4+Pj4+IFlv
dSBoYXZlIGEgc2ltaWxhciB0aGluZyBmb3IgdGhlIHByZXBhcmUgdnMgZW5hYmxlIHRoaW5nLiBU
aGUgZGlmZmVyZW5jZQo+Pj4+PiBiZXR3ZWVuIHRoZSB0d28gaXMgdGhhdCBlbmFibGUgY2FuIGJl
IGNhbGxlZCBpbnRvIGF0b21pYyBjb250ZXh0IGJ1dAo+Pj4+PiBwcmVwYXJlIGNhbid0Lgo+Pj4+
PiAKPj4+Pj4gU28gZm9yIGRyaXZlcnMgdGhhdCB3b3VsZCBjYXJlIGFib3V0IHRoaXMsIHlvdSB3
b3VsZCBjcmVhdGUgeW91ciBkZXZpY2UKPj4+Pj4gd2l0aCBhbiB1bnByZXBhcmVkIGNsb2NrLCBh
bmQgdGhlbiBhdCB2YXJpb3VzIHRpbWVzIGR1cmluZyB0aGUgZHJpdmVyCj4+Pj4+IGxpZmV0aW1l
LCB5b3Ugd291bGQgbXV0YXRlIHRoYXQgc3RhdGUuICAKPj4gCj4+IFRoZSBjYXNlIHdoZXJlIHlv
dSdyZSBkb2luZyBpdCBvbmx5IHdoaWxlIGFjY2Vzc2luZyByZWdpc3RlcnMgaXMKPj4gaW50ZXJl
c3RpbmcsIGJlY2F1c2UgdGhhdCBtZWFucyB0aGUgRW5hYmxlIGJpdCBtYXkgYmUgb3duZWQgYnkg
YSBsb2NhbAo+PiB2YXJpYWJsZS4gV2UgbWF5IGltYWdpbmUgYW46Cj4+IAo+PiAgICBsZXQgZW5h
YmxlZCA9IHNlbGYucHJlcGFyZWRfY2xrLmVuYWJsZV9zY29wZWQoKTsKPj4gICAgLi4uIHVzZSBy
ZWdpc3RlcnMKPj4gICAgZHJvcChlbmFibGVkKTsKPj4gCj4+IE5vdyAuLi4gdGhpcyBkb2Vzbid0
IHF1aXRlIHdvcmsgd2l0aCB0aGUgY3VycmVudCBBUEkgLSB0aGUgY3VycmVudAo+PiBFbmFibGVk
IHN0YXRlZCBvd25zIGJvdGggYSBwcmVwYXJlIGFuZCBlbmFibGUgY291bnQsIGJ1dCB0aGUgYWJv
dmUga2VlcHMKPj4gdGhlIHByZXBhcmUgY291bnQgaW4gYHNlbGZgIGFuZCB0aGUgZW5hYmxlZCBj
b3VudCBpbiBhIGxvY2FsIHZhcmlhYmxlLgo+PiBCdXQgaXQgY291bGQgYmUgZG9uZSB3aXRoIGEg
Zm91cnRoIHN0YXRlLCBvciBieSBhIGNsb3N1cmUgbWV0aG9kOgo+PiAKPj4gICAgc2VsZi5wcmVw
YXJlZF9jbGsud2l0aF9lbmFibGVkKHx8IHsKPj4gICAgICAgIC4uLiB1c2UgcmVnaXN0ZXJzCj4+
ICAgIH0pOwo+PiAKPj4gQWxsIG9mIHRoaXMgd291bGQgd29yayB3aXRoIGFuIGltbXV0YWJsZSB2
YXJpYWJsZSBvZiB0eXBlIENsazxQcmVwYXJlZD4uCj4gCj4gSG0sIG1heWJlIGl0J2QgbWFrZSBz
ZW5zZSB0byBpbXBsZW1lbnQgQ2xvbmUgc28gd2UgY2FuIGhhdmUgYSB0ZW1wb3JhcnkKPiBjbGsg
dmFyaWFibGUgdGhhdCBoYXMgaXRzIG93biBwcmVwYXJlL2VuYWJsZSByZWZzIGFuZCByZWxlYXNl
cyB0aGVtCj4gYXMgaXQgZ29lcyBvdXQgb2Ygc2NvcGUuIFRoaXMgaW1wbGllcyB3cmFwcGluZyAq
bXV0IGJpbmRpbmdzOjpjbGsgaW4gYW4KPiBBcmM8PiBiZWNhdXNlIGJpbmRpbmdzOjpjbGsgaXMg
bm90IEFSZWYsIGJ1dCBzaG91bGQgYmUgcmVsYXRpdmVseSBlYXN5Cj4gdG8gZG8uIFBvc3Rpbmcg
dGhlIHF1aWNrIGV4cGVyaW1lbnQgSSBkaWQgd2l0aCB0aGlzIGFwcHJvYWNoLCBpbiBjYXNlCj4g
eW91J3JlIGludGVyZXN0ZWQgWzFdCj4gCj4gWzFdaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2JicmV6aWxsb24vbGludXgvLS9jb21taXQvZDVkMDRkYTRmNGY2MTkyYjZlNjc2MGQ1Zjg2
MWM2OTU5NmM3ZDgzNwoKVGhlIHByb2JsZW0gd2l0aCB3aGF0IHlvdSBoYXZlIHN1Z2dlc3RlZCBp
cyB0aGF0IHRoZSBwcmV2aW91cyBzdGF0ZSBpcyBub3QKY29uc3VtZWQgaWYgeW91IGNhbiBjbG9u
ZSBpdCwgYW5kIGNvbnN1bWluZyB0aGUgcHJldmlvdXMgc3RhdGUgaXMgYSBwcmV0dHkga2V5CmVs
ZW1lbnQgaW4gZW5zdXJpbmcgeW91IGNhbm5vdCBtaXN1c2UgaXQuIEZvciBleGFtcGxlLCBoZXJl
OgoKbGV0IGVuYWJsZWRfY2xrID0gcHJlcGFyZWRfY2xrLmNsb25lKCkuZW5hYmxlKCk/OwovLyBk
byBzdHVmZgovLyBlbmFibGVkX2NsayBnb2VzIG91dCBvZiBzY29wZSBhbmQgcmVsZWFzZXMgdGhl
IGVuYWJsZQovLyByZWYgaXQgaGFkCgpwcmVwYXJlZF9jbGsgaXMgc3RpbGwgYWxpdmUuIE5vdywg
dGhpcyBtYXkgbm90IGJlIHRoZSBlbmQgb2YgdGhlIHdvcmxkIGluIHRoaXMKcGFydGljdWxhciBj
YXNlLCBidXQgZm9yIEFQSSBjb25zaXN0ZW5jeSwgSSdkIHNheSB3ZSBzaG91bGQgcHJvYmFibHkg
YXZvaWQgdGhpcwpiZWhhdmlvci4KCkkgc2VlIHRoYXQgQWxpY2Ugc3VnZ2VzdGVkIGEgY2xvc3Vy
ZSBhcHByb2FjaC4gSU1ITywgd2Ugc2hvdWxkIHVzZSB0aGF0Cmluc3RlYWQuCgrigJQgRGFuaWVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
