Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EF3C79FB7
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBDHD+tyuy/+Y9504rtjrb3wWYKJuVvVemhoBgtrZq0=; b=l5jjPPV6tsXdZ1
	X46ECdoRpCwYpygUFZaie+kwiSS92sfge5+bg8xMYKmcG8FRUCShBq0AxwVC4MeAar0PxfXKuSOAo
	6Zp/GUBHiL9b/9tK6Vve486JIqNnd2x/NMt2EEdAjSl3sL29YTuxgLbDBXw5sk5D5nGReW3eBaAgg
	1BnvyG2gOu7ZgDajchZwUVUEcW6v9H/4WB8qyqRRSR6OSOocemLxXixpop9i/KbqeKg5E0xFFnwcn
	GA2CJpi56RnfMes7tRWZi6i+j0SC5P5+uAOANBMXIYdrgx+PnvQ77Tiq7D8ASWEPehqbFaSja3bcO
	SJLICnT/a750uKTI7HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JG9-0000000BxuB-4451;
	Wed, 09 Sep 2026 14:26:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JG8-0000000BxtO-2Mqq;
	Wed, 09 Sep 2026 14:26:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5E4141392;
	Wed,  9 Sep 2026 14:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5935C1F00A3E;
	Wed,  9 Sep 2026 14:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788964003;
	bh=gic5TB1gjIu6RSleeqefVviRlVsBU2B+Giz1F9TOV84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hJGsxqSPGASMshdRSJCdjqaV2MTHzCBOelFMCkNds3SUKI1cp6lgYYL9WvlWqpKiY
	 u+Kr8fJtqUm+2F0r5r+yWto5EILdK28AmJteGlYqyv06gteJ/wga1IEVp7sbb09ZMa
	 nDUytFsFJVzuptuOydFiRQr9qOr4s+rVgAcsjl1yHrkj9q81/ZBU8Q4w71vItIdb7Q
	 6FKrgP0eG1rOEQkj4gVKSakS0M+h2v/B/FCSAMQ+KSwhdA7w5QK8j1eIsAjVFXEOpa
	 ot1NILoh0llV+mv2GC1wRWyTS2CYE2y9cXqBghpj95qgm3Bs0kubAcZIAqnS0JByoE
	 cjOuGdB7tC82A==
Date: Wed, 9 Sep 2026 15:26:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: =?utf-8?B?QmrDtnJu?= Baron <bjorn3_gh@protonmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
Message-ID: <aqFsNv9MDwYq9kbL@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
 <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
 <CANiq72=rUrjFD8dHggtO5g0D5Yu-LjO4s7t=+yoKtteD56KfXw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72=rUrjFD8dHggtO5g0D5Yu-LjO4s7t=+yoKtteD56KfXw@mail.gmail.com>
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

T24gV2VkLCBTZXAgMDksIDIwMjYgYXQgMDI6NTk6MTNQTSArMDIwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIFdlZCwgU2VwIDksIDIwMjYgYXQgMTI6MjLigK9QTSBCasO2cm4gQmFyb24gPGJq
b3JuM19naEBwcm90b25tYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlcmUgYXJlIHN0aWxsIHNl
dmVyYWwga25vd24gcmVwcm9kdWNpYmlsaXR5IGlzc3VlcyBmb3IgdGhlIHBhcmFsbGVsCj4gPiBm
cm9udGVuZFsxXSBhbmQgYXQgbGVhc3QgdW50aWwgZmFpcmx5IHJlY2VudGx5IHRoZXJlIHdlcmUg
YWxzbyBkZWFkbG9jawo+ID4gaXNzdWVzIGFuZCBpbmNvcnJlY3QgZXJyb3JzWzJdLCBzbyBJIHdv
dWxkIG5vdCByZWNvbW1lbmQgZW5hYmxpbmcgaXQgd2l0aG91dAo+ID4gYW4gZXhwbGljaXQgcmVx
dWVzdCBmcm9tIHRoZSB1c2VyLiBQZXJoYXBzIGV2ZW4gb25seSBhbGxvdyBpdCBvbiBuaWdodGx5
Cj4gPiBydXN0YyBmb3Igbm93LCB0aGVuIHlvdSBkb24ndCBuZWVkIHRvIGNoZWNrIHdoaWNoIG9m
IHRoZSB0d28gc3BlbGxpbmdzIG9mCj4gPiB0aGUgZmxhZyBpcyBzdXBwb3J0ZWQuCj4KPiBUaGFu
a3MgYSBsb3QgZm9yIHRha2luZyBhIGxvb2sgQmrDtnJuLgo+Cj4gSWYgdGhlcmUgYXJlIHN0aWxs
IG1ham9yIGlzc3VlcyBldmVuIGluIG5pZ2h0bHksIHRoZW4gSSB3b3VsZCBzYXkKPiBsZXQncyBu
b3QgYWRkIGl0IHlldCAtLSBzb21lIHVzZXJzL0NJcyBhcmUgdGVzdGluZyB3aXRoIG5pZ2h0bHkK
PiByb3V0aW5lbHksIHNvIGl0IGlzIHByb2JhYmx5IGJlc3QgdG8gYXZvaWQgc3VycHJpc2VzIGZv
ciB0aGVtLiAoSWYKPiBzb21lb25lIHdhbnRzIHRvIHRlc3QgdGhlIGZsYWcsIHRoZXkgY2FuIHN0
aWxsIHBhc3MgaXQgbWFudWFsbHkuKQo+Cj4gT24gdGhlIG90aGVyIGhhbmQsIGlmIHRoZXJlIGFy
ZSBubyBtYWpvciBpc3N1ZXMgbGVmdCBhbmQgaXQgaXMganVzdAo+IHJlcHJvZHVjaWJpbGl0eSBp
c3N1ZXMsIHRoZW4gSSBndWVzcyB3ZSBjb3VsZCBhZGQgaXQgdG8gaGVscCBmaWd1cmUKPiB0aG9z
ZSBpc3N1ZXMgb3V0IGFuZCBhdm9pZCBzdXJwcmlzZXMgbGF0ZXIgb24uCgpZdXAsIEkgYW0gZW5j
b3VyYWdlZCBieSAndW50aWwgZmFpcmx5IHJlY2VudGx5JyBvbiB0aGF0IDspIHNvIG1heWJlIGp1
c3QKYnVtcCB2ZXJzaW9uIHJlcXVpcmVtZW50IHRvIHdoYXRldmVyIHRoaXMgcmVjZW50bHkgd2Fz
PwoKPgo+ID4gQnkgdGhlIHdheSwgY3VycmVudGx5IGJhY2tlbmQgcGFyYWxsZWxpc20gaXMgZW50
aXJlbHkgZGlzYWJsZWQgZHVlIHRvIHRoZQo+ID4gdXNhZ2Ugb2YgLS1lbWl0IG9iaiAod2hpY2gg
Zm9yY2VzIC1DY29kZWdlbi11bml0cz0xKS4gRm9yIC1PMi8zIGJ1aWxkcwo+Cj4gWWVhaCwgd2Ug
ZXZlbiBzZXQgYC1DY29kZWdlbi11bml0cz0xYCBleHBsaWNpdGx5IGF0IHRoZSBtb21lbnQsIHNv
IHdlCj4gd291bGQgbmVlZCB0byBjaGFuZ2UgdGhhdCB0b28gKGFuZCBsaWtlbHkgbWFrZSBpdCBh
biBvcHRpb24sIGJlY2F1c2UKPiBub3JtYWxseSBlbmQgdXNlcnMgd2lsbCB3YW50IHRoZSBiZXN0
IHJlc3VsdHMsIHdoaWxlIGRldmVsb3BlcnMgbWF5Cj4gd2FudCBzcGVlZCBvZiBpdGVyYXRpb24p
Lgo+Cj4gQ2hlZXJzLAo+IE1pZ3VlbAoKLS0KQ2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
