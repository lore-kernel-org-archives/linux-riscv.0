Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB033C83F25
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8/Qj5JGQvGJiPW3Me83NCywlat9xIXfFf22nvsegZo=; b=kfBFvYChoOPz3y
	JlrktfCG1ucyXy7PzK3b5SYfYFabYM1hIDgE3Y8S923KUUSZ2bDU3mCNd1J+pjrEMks2dyeY86aKT
	TvEOjWHMVSNmWfZySfxEZmuepSg5gH3FpHKUMJ/YjzZ9GAFg0yapM13aK4ACEgn6jPqykB9g6AAIt
	Yk49YYmfRF59HRcojI+64sg4dEgvjIm7mscdQKXeBuKZ75fR2qe5nKZ7fORQ5H+ix0M93GWXh7FKY
	YE71JSnW2ZlY3CGLGmKFA/2JD1QKTWN0IGjGfOdlYZa3w40l9HmvPzfwYMQnkhR4bewQEJTd7RbAa
	35rnUYvhi+dKM3hVx6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q6-0000000DPzs-3qsF;
	Fri, 11 Jul 2025 01:19:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyg0-0000000D3GS-3DEu
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 21:19:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ED2D460DF;
	Thu, 10 Jul 2025 21:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8929FC4CEE3;
	Thu, 10 Jul 2025 21:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752182371;
	bh=0zK4b9WCKbhDn6z7GD5R0mIS3pwTZmyc1BLcnwDAQs4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=vPkUlA0NUJLGY/Q4PvaaFqidAOKuSwxT+5jVUD9cwF/qy/NHVyyVRYgDzjtWs51TE
	 TgfvcQUsC55IDISpn13HnEy7SQybmToEkjdwJDu6iiQhJ16+k+cc+5JqQ/vj4m4ToW
	 iwjYVqttFqRRFrilkHJAj3kMi4f91IftPYkBz3+9Sg2wTit/UprIqtsoNOOs13Rc1K
	 voWpDI6wCmV+valiZDVLyo+3C9G/cVISn5p7R4pRMdHs2LFlrbAcGt+TnTUCjNihET
	 +Hiva66FTC+buuJJFdmDf+A+Dk/vyqoKWkVhxvpzUQq68t25OH58dtSdlTeCaWfIX0
	 /c+ZvJbVzx/cg==
Mime-Version: 1.0
Date: Thu, 10 Jul 2025 23:19:24 +0200
Message-Id: <DB8OT5ZZ4SRO.WP5PBFLML683@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Cc: "Michal Wilczynski" <m.wilczynski@samsung.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Benno Lossin" <lossin@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Drew Fustini"
 <fustini@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
References: <CGME20250707094926eucas1p155bd967b6986c4a999776839b1aa1fc6@eucas1p1.samsung.com> <20250707-rust-next-pwm-working-fan-for-sending-v10-0-d0c5cf342004@samsung.com> <e8a4a821-e7e4-4bcd-a2ac-f6b684b6ceea@samsung.com> <ipvaegqlkco5qinhvn33mqvg7ev2walvs74xtzvhimxsfsfzhv@gcmpxcdtetdn> <e77eab1c-446f-4620-95be-d343684d1e95@samsung.com> <4hmb3di5x2iei43nmrykrj5wzlltrf3vrnqvexiablonbscn57@4bbsz5c76t63> <DB8I5J8ZY7QF.2D8HEN6JX4HSZ@kernel.org> <cbxpqormchajfcnf7xxopd7j7igriqus4cuu5jfvxb3mbfb5tu@qz4rc67vjyif>
In-Reply-To: <cbxpqormchajfcnf7xxopd7j7igriqus4cuu5jfvxb3mbfb5tu@qz4rc67vjyif>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141932_848168_6D2BFBF1 
X-CRM114-Status: GOOD (  22.69  )
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

T24gVGh1IEp1bCAxMCwgMjAyNSBhdCAxMDo1NyBQTSBDRVNULCBVd2UgS2xlaW5lLUvDtm5pZyB3
cm90ZToKPiBPbiBUaHUsIEp1bCAxMCwgMjAyNSBhdCAwNjowNjoyNlBNICswMjAwLCBEYW5pbG8g
S3J1bW1yaWNoIHdyb3RlOgo+PiBPbiBUaHUgSnVsIDEwLCAyMDI1IGF0IDU6MjUgUE0gQ0VTVCwg
VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+ID4gSGVsbG8gTWljaGFsLAo+PiA+Cj4+ID4gT24g
VGh1LCBKdWwgMTAsIDIwMjUgYXQgMDM6NDg6MDhQTSArMDIwMCwgTWljaGFsIFdpbGN6eW5za2kg
d3JvdGU6Cj4+ID4+IE9uIDcvMTAvMjUgMTU6MTAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+
PiA+PiA+IE9uIFRodSwgSnVsIDEwLCAyMDI1IGF0IDEwOjQyOjA3QU0gKzAyMDAsIE1pY2hhbCBX
aWxjenluc2tpIHdyb3RlOgo+PiA+PiA+PiBPbiA3LzcvMjUgMTE6NDgsIE1pY2hhbCBXaWxjenlu
c2tpIHdyb3RlOgo+PiA+PiA+Pj4gVGhlIHNlcmllcyBpcyBzdHJ1Y3R1cmVkIGFzIGZvbGxvd3M6
Cj4+ID4+ID4+PiAgLSBFeHBvc2Ugc3RhdGljIGZ1bmN0aW9uIHB3bWNoaXBfcmVsZWFzZS4KPj4g
Pj4gPiAKPj4gPj4gPiBJcyB0aGlzIHJlYWxseSBuZWNlc3Nhcnk/IEkgZGlkbid0IHRyeSB0byB1
bmRlcnN0YW5kIHRoZSByZXF1aXJlbWVudHMKPj4gPj4gPiB5ZXQsIGJ1dCBJIHdvbmRlciBhYm91
dCB0aGF0LiBJZiB5b3UgZ2V0IHRoZSBwd21jaGlwIGZyb20KPj4gPj4gPiBfX3B3bWNoaXBfYWRk
KCkgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIHRvIHJlbGVhc2UgaXQgaXMgdG8gY2FsbAo+PiA+PiA+
IHB3bWNoaXBfcmVtb3ZlKCkuIEZlZWxzIGxpa2UgYSBsYXllciB2aW9sYXRpb24uCj4+ID4+IAo+
PiA+PiBJdCdzIHJlcXVpcmVkIHRvIHByZXZlbnQgYSBtZW1vcnkgbGVhayBpbiBhIHNwZWNpZmlj
LCBjcml0aWNhbCBmYWlsdXJlCj4+ID4+IHNjZW5hcmlvLiBUaGUgc2VxdWVuY2Ugb2YgZXZlbnRz
IGlzIGFzIGZvbGxvd3M6Cj4+ID4+IAo+PiA+PiAgICAgcHdtOjpDaGlwOjpuZXcoKSBzdWNjZWVk
cywgYWxsb2NhdGluZyBib3RoIHRoZSBDIHN0cnVjdCBwd21fY2hpcCBhbmQKPj4gPj4gICAgIHRo
ZSBSdXN0IGRydmRhdGEuCj4+ID4+IAo+PiA+PiAgICAgcHdtOjpSZWdpc3RyYXRpb246OnJlZ2lz
dGVyKCkgKHdoaWNoIGNhbGxzIHB3bWNoaXBfYWRkKCkpIGZhaWxzIGZvcgo+PiA+PiAgICAgc29t
ZSByZWFzb24uCj4+ID4KPj4gCj4+IChKdXN0IHRyeWluZyB0byBoZWxwIGNsZWFyIHVwIHRoZSBj
b25mdXNpb24uKQo+Cj4gVmVyeSBhcHByZWNpYXRlZCEKPgo+PiA+IElmIHlvdSBjYWxsZWQgcHdt
Y2hpcF9hbGxvYygpIGJ1dCBub3QgeWV0IHB3bWNoaXBfYWRkKCksIHRoZSByaWdodAo+PiA+IGZ1
bmN0aW9uIHRvIGNhbGwgZm9yIGNsZWFudXAgaXMgcHdtY2hpcF9wdXQoKS4KPj4gCj4+IFRoYXQg
aXMgZXhhY3RseSB3aGF0IGlzIGhhcHBlbmluZyB3aGVuIEFSZWY8Q2hpcD4gaXMgZHJvcHBlZC4g
SWYgdGhlIHJlZmVyZW5jZQo+PiBjb3VudCBkcm9wcyB0byB6ZXJvLCBwd21jaGlwX3JlbGVhc2Uo
KSBpcyBjYWxsZWQsIHdoaWNoIGZyZWVzIHRoZSBjaGlwLiBIb3dldmVyLAo+PiB0aGlzIHdvdWxk
IGxlYXZlIHRoZSBkcml2ZXIncyBwcml2YXRlIGRhdGEgYWxsb2NhdGlvbiBiZWhpbmQsIHdoaWNo
IGlzIG93bmVkIGJ5Cj4+IHRoZSBDaGlwIGluc3RhbmNlLgo+Cj4gSSBkb24ndCB1bmRlcnN0YW5k
IHRoYXQuIFRoZSBjaGlwIGFuZCB0aGUgZHJpdmVyIHByaXZhdGUgZGF0YSBib3RoIGFyZQo+IGxv
Y2F0ZWQgaW4gdGhlIHNhbWUgYWxsb2NhdGlvbi4gSG93IGlzIHRoaXMgYSBwcm9ibGVtIG9mIHRo
ZSBkcml2ZXIKPiBwcml2YXRlIGRhdGEgb25seSB0aGVuPyBUaGUga2ZyZWUoKSBpbiBwd21jaGlw
X3JlbGVhc2UoKSBpcyBnb29kIGVub3VnaAo+IGZvciBib3RoPyEKCk5vdCBpbiB0aGUgY3VycmVu
dCBhYnN0cmFjdGlvbnMsIHRoZXJlIGFyZSB0d28gYWxsb2NhdGlvbnMsIG9uZSBmb3IgdGhlIENo
aXAgYW5kCm9uZSBmb3IgdGhlIGRyaXZlcidzIHByaXZhdGUgZGF0YSwgb3IgaW4gb3RoZXIgd29y
ZHMgdGhlIGFic3RyYWN0aW9uIHVzZXMKcHdtY2hpcF9zZXRfZHJ2ZGF0YSgpIGFuZCBwd21jaGlw
X2dldF9kcnZkYXRhKCkuCgpIYXZpbmcgYSBicmllZiBsb29rIGF0IHB3bWNoaXBfYWxsb2MoKSwg
aXQgc2VlbXMgdG8gbWUgdGhhdCBQV00gc3VwcG9ydHMgdGhlCnN1YmNsYXNzaW5nIHBhdHRlcm4g
d2l0aCBwd21jaGlwX3ByaXYoKS4KCldlIHNob3VsZCBwcm9iYWJseSB0YWtlIGFkdmFudGFnZSBv
ZiB0aGF0LiBBc3N1bWluZyB3ZSBkbyB0aGF0LCB0aGUgUnVzdAphYnN0cmFjdGlvbiBzdGlsbCBu
ZWVkcyBhIHJlbGVhc2UoKSBjYWxsYmFjayBiZWNhdXNlIHdlIHN0aWxsIG5lZWQgdG8gY2FsbApk
cm9wX2luX3BsYWNlKCkgaW4gb3JkZXIgdG8gZ2V0IHRoZSBkZXN0cnVjdG9yIG9mIHRoZSBkcml2
ZXIncyBwcml2YXRlIGRhdGEKdHlwZSBjYWxsZWQuIFdlIGFjdHVhbGx5IG1pc3NlZCB0aGlzIGlu
IERSTSBhbmQgSSBmaXhlZCBpdCB1cCByZWNlbnRseSBbMV0uCgpATWljaGFsOiBXaXRoIHRoZSBz
dWJjbGFzc2luZyBwYXR0ZXJuIHRoZSBDaGlwIHN0cnVjdHVyZSB3b3VsZCBsb29rIGxpa2UgdGhp
czoKCgkjW3JlcHIoQyldCgkjW3Bpbl9kYXRhXQoJcHViIHN0cnVjdCBDaGlwPFQ+IHsKCSAgIGlu
bmVyOiBPcGFxdWU8YmluZGluZ3M6OnB3bV9jaGlwPiwKCSAgICNbcGluXQoJICAgZGF0YTogVCwK
CX0KCkFuZCBpbiB0aGUgcmVsZWFzZSgpIGNhbGxiYWNrIHdvdWxkIGxvb2sgbGlrZSB0aGlzOgoK
ICAgIGV4dGVybiAiQyIgZm4gcmVsZWFzZShwdHI6ICptdXQgYmluZGluZ3M6OnB3bV9jaGlwKSB7
CiAgICAgICAgLy8gQ0FTVDogQ2FzdGluZyBgcHRyYCB0byBgQ2hpcDxUPmAgaXMgdmFsaWQsIHNp
bmNlIFsuLi5dLgogICAgICAgIGxldCB0aGlzID0gcHRyLmNhc3Q8Q2hpcDxUPj4oKTsKCiAgICAg
ICAgLy8gU0FGRVRZOgogICAgICAgIC8vIC0gV2hlbiBgcmVsZWFzZWAgcnVucyBpdCBpcyBndWFy
YW50ZWVkIHRoYXQgdGhlcmUgaXMgbm8gZnVydGhlciBhY2Nlc3MgdG8gYHRoaXNgLgogICAgICAg
IC8vIC0gYHRoaXNgIGlzIHZhbGlkIGZvciBkcm9wcGluZy4KICAgICAgICB1bnNhZmUgeyBjb3Jl
OjpwdHI6OmRyb3BfaW5fcGxhY2UodGhpcykgfTsKICAgIH0KClRoaXMgaXMgZXhhY3RseSB3aGF0
IHdlJ3JlIGRvaW5nIGluIERSTSBhcyB3ZWxsLCBJIHdvdWxkIGhhdmUgcmVjb21tZW5kZWQgdGhp
cwp0byBiZWdpbiB3aXRoLCBidXQgSSBkaWRuJ3QgcmVjb2duaXplIHRoYXQgUFdNIHN1cHBvcnRz
IHN1YmNsYXNzaW5nLiA6KQoKSSByZWNvbW1lbmQgaGF2aW5nIGEgbG9vayBhdCBbMl0uCgpbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwNjI5MTUzNzQ3LjcyNTM2LTEtZGFrckBr
ZXJuZWwub3JnLwpbMl0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9taXNjL2tl
cm5lbC8tL2Jsb2IvZHJtLW1pc2MtZml4ZXMvcnVzdC9rZXJuZWwvZHJtL2RldmljZS5ycwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
