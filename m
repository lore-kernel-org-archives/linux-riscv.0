Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18ADC982C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8cEMserRG3aHtKRLKIPwR1r2jUnmnUtPDQJczlQGMk=; b=18kg3nxkowlDvR
	KHdLg1+9z2ebKmenvlTWJjRRyHorf9t3Nw1Pie8+6OUbBrGB7QZ87X7DBJsWtRFH5ZnIZsiSkawpS
	nK+tPt64dsd7m/wzRVQVyTZCwtJJrJPqDYGLrLZU7hU8nu2Z6U4CFkjs5FrNEh2GAswqWugsV6NBc
	8oJ8L/xztgc6pxWFRaqqWDWpd8NtO/O3jEbFpJwRe4btRQmSOiLM4glHjvIraqKZe+p4Jl1aNoqxI
	x/aBXERIS0eze4wH7Fukg9sQkouoJOt+1Y0JR4pShPuHyZLwu76ZqDFDP9jEC2e8H+n7OMDF1gKQH
	uzvoKCJj+XzJ3FweU7jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qex-00000009PoB-0UDr;
	Wed, 16 Sep 2026 14:30:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qet-00000009PnA-0GNT;
	Wed, 16 Sep 2026 14:30:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 494FA602CB;
	Wed, 16 Sep 2026 14:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EF21F00893;
	Wed, 16 Sep 2026 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789569046;
	bh=Sf2nPqPSoF8deq5OYrsGYaM5lP9Vq8plK7Qs1+50D6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LNOVW3P81mUBhRO0/pMJp0Fue9fjWU1wrtHSjWyAgH85HRAoZwM4kbPCQYpxU7+le
	 Pe8FJmVgN3hXMijiNFNO2rRTXlno2shHa9jXQ2hzkn+BCFm3WG5AOkg6/YXeTPuSrM
	 WvrIm64q2uPVC/8u1Pcrn9nUz5TG1foCGquzjdG0nCoyXrCzvC4zFdCQOjOyCOyNa8
	 /5pYj780rd7HwMC54yH0Hinwfk382BKUkcENW+jOObtYMdheFRmP/EszJ/jz7x5Opi
	 4ofgkbLAD4t4kUUCmGNoohdh3rRHHbNkvI3kCNSSmLZOp2jwQB/3fpRTGKh+NtIfy/
	 wrkiSsNDvPAig==
Date: Wed, 16 Sep 2026 15:30:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 14/21] kbuild: batch module finalisation
Message-ID: <aqqn4eWZrywvSm2u@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-14-39817ec5db23@kernel.org>
 <202609141056.6AE2C82E@keescook>
 <aqkZvtAKWYf9-1ZW@gremlin>
 <202609150943.000EC9277@keescook>
 <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdms6QWc7RMW6hJb3qzgmpK+aw40C7b_h7eG161ie_Y8ZA@mail.gmail.com>
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

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMTA6NTY6MDFBTSAtMDcwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBPbiBUdWUsIFNlcCAxNSwgMjAyNiBhdCA5OjQ54oCvQU0gS2VlcyBDb29rIDxr
ZWVzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgU2VwIDE1LCAyMDI2IGF0IDEx
OjQ0OjAxQU0gKzAxMDAsIExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+ID4gT24gTW9u
LCBTZXAgMTQsIDIwMjYgYXQgMTE6MDA6MjdBTSAtMDcwMCwgS2VlcyBDb29rIHdyb3RlOgo+ID4g
PiA+IE9uIE1vbiwgU2VwIDE0LCAyMDI2IGF0IDEwOjIyOjEzQU0gKzAxMDAsIExvcmVuem8gU3Rv
YWtlcyAoQVJNKSB3cm90ZToKPiA+ID4gPiA+IE1vZHVsZSBmaW5hbGlzYXRpb24gb24gYWxsbW9k
Y29uZmlnIGJ1aWxkcyBjb25zaXN0cyBvZiBhIGxhcmdlIG51bWJlciBvZgo+ID4gPiA+ID4gdmVy
eSBzaG9ydC1saXZlZCBqb2JzLCBhbmQgdGhlIG1ha2Ugam9iIGRpc3BhdGNoZXIgY2Fubm90IHBv
c3NpYmx5IGRpc3BhdGNoCj4gPiA+ID4gPiBqb2JzIGZhc3QgZW5vdWdoLgo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyAiY2Fubm90IHBvc3NpYmx5IiBzb3VuZHMgbGlrZSBhIHdlaXJkIExMTSBsYW5ndWFn
ZSBpbnRlbnNpZmllci4gSSdkCj4gPiA+Cj4gPiA+IEFnYWluIHRoYXQncyBteSB3cml0aW5nIGFj
dHVhbGx5LCBwcm9iYWJseSBiZXN0IHRvIHN0b3AgYXNzdW1pbmcgTExNIG5vdyA7KQo+ID4KPiA+
IEFwb2xvZ2llczsgd2hhdGV2ZXIgdGhlIG9wcG9zaXRlIG9mIHRoZSBUdXJpbmcgVGVzdCBpcywg
SSBoYXZlIGZhaWxlZC4KPiA+IDpQIFRoZSBBSXMgYXJlIHdpbm5pbmc6IGh1bWFucyBhcmUgc3Vz
cGljaW91cyBvZiBlYWNoIG90aGVyIG5vdy4gOikKPgo+IElzIHRoZXJlIGEgdGVybSBmb3IgdGhp
cyB5ZXQ/ICBDeWxvbiBwYXJhbm9pYT8KCkhhaGEsIG5vdyB5b3UnbGwgZ2V0IG1lIHdhdGNoaW5n
IHRoYXQgc2VyaWVzIGFnYWluLi4uIGFuZCBpdCdsbCBhbGwKcHJvYmFibHkgZmVlbCB2ZXJ5IHBy
ZXNjaWVudCEgOykKCj4KPiAtLQo+IFRoYW5rcywKPiB+TmljayBEZXNhdWxuaWVycwoKLS0KQ2hl
ZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
