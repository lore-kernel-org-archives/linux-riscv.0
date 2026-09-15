Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3849DC88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 11:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxsmxiRqFhUxZGx3gmheUBVs4NM17bV6it+9c2tufGs=; b=byVUm9YqXl26UG
	Gm14C/MTFVg3pFWfFDyeYOfeB3VkaRMF+F62B7CynuH102TvxsdVcStQEz+D7Q7arQ3SGlop1c0fS
	t03eKpf0L5cwJVJCwxLPBuKRVPCK4V40Vi5FmZBdr6SYp/UQ1uybnDMiXbKSGI3Dl9QD61vl922wP
	NsSw1uprnimp0yMJVN5cZTlDHW/9fs5IPD+RBUH42kRMGWag89gtP/GgeSHAen+s0Os8Z04J84Fh3
	OKcqcFAoqux6IrvMeD4hSE7dLIWx2kq8sXiOegq6bzFyg8LJZNlXgslELRKX9S1TBZm37e/LOX2uU
	9q9KGgp2NnckZY0b424A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R8M-00000006407-157Z;
	Tue, 15 Sep 2026 11:15:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6R8K-000000063zl-0KgQ;
	Tue, 15 Sep 2026 11:15:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 82D63400A3;
	Tue, 15 Sep 2026 11:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510AF1F000FF;
	Tue, 15 Sep 2026 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789470927;
	bh=CF9ILI9YM/ucBOuS3A2BK2pXreguJU8zji6+GHWCn/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HrcUwFpyn8QxcQDzf1FyVXGhUv9Lvg+4uU5E5bksCbsM9xdWQVrx98pc4yo5aA+mL
	 /smED3Qg96hQ77uOKN5kSpRex+1sMKBAgSH6rVtHuRG0KSweeezfj9161+GZyDIhxu
	 rqyDXPog32TZyUFO9M96tfLSTMSBb1ZwlW2nJ0jhRptBBwghRvEysKhjWr0fcJnc3b
	 ZUCY6fuqbEWIqEpyTj0PILNuJcstedkZMTgj+LfmOeuWZPF1Jd3xSB24NDrnq7CNmo
	 fXjIYvRnslBc73/r7L63E9zDh4vwZ+MVJCsTHtoyA4LPCvTionLdwhARWG6BtGpp7Z
	 9MAWzvtJ/r/pA==
Date: Tue, 15 Sep 2026 12:15:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
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
	Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 18/21] kbuild: rust: optionally parallelise rustc
 front end
Message-ID: <aqknp-KvE9woa760@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-18-39817ec5db23@kernel.org>
 <CANiq72naY0=iBaxfbWQaPv_06X4SjFSix4NybDQdht33+Tcs0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72naY0=iBaxfbWQaPv_06X4SjFSix4NybDQdht33+Tcs0g@mail.gmail.com>
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

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgMDc6MzI6MDJBTSArMDEwMCwgTWlndWVsIE9qZWRhIHdy
b3RlOgo+IE9uIE1vbiwgU2VwIDE0LCAyMDI2IGF0IDEwOjI04oCvQU0gTG9yZW56byBTdG9ha2Vz
IChBUk0pIDxsanNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gUnVzdCBjcmF0ZXMgYXJlIGNv
bXBpbGVkIGluIGEgc2VyaWFsIGNoYWluIG9uIHRoZSBjcml0aWNhbCBwYXRoIC0gY29yZSwKPiA+
IGJpbmRpbmdzLCBrZXJuZWwgY3JhdGVzIGFuZCB0aGVuIHRoZSBkcml2ZXJzIC0gZWFjaCBhIHJ1
c3RjIGludm9jYXRpb24uCj4KPiBUaGlzIGNvbmZ1c2VkIHRoZSBMV04gYXJ0aWNsZS4uLiA6KQoK
U29ycnkgOikKCj4KPiBUaGVyZSBpcyBhIGNyaXRpY2FsIHBhdGggaW4gdGhlIGdyYXBoLCBpbmRl
ZWQsIGFuZCBkb2luZyBpdCBpbgo+IGBwcmVwYXJlYCBpcyBwYWluZnVsLCBidXQgdG8gY2xhcmlm
eTogZWFjaCBjcmF0ZSBpcyBhbHJlYWR5IGJ1aWx0IGluCj4gcGFyYWxsZWwgd2l0aCBvdGhlcnMg
d2hlcmUgcG9zc2libGUsIGFuZCB0aGUgZmFjdCB0aGF0IGVhY2ggY3JhdGUgaXMKPiBidWlsdCBi
eSBvbmUgYHJ1c3RjYCBpcyB1bnJlbGF0ZWQsIHBsdXMgdGhlIGZsYWcgdGhpcyBwYXRjaCBwcm9w
b3Nlcwo+IGlzIGFsc28gdW5yZWxhdGVkIHRvIHRoYXQuCgpBY2suIEFuZCB0aGUgb3RoZXIgcnVz
dCBjaGFuZ2VzIGhlbHAgbWF4aW1pc2UgdGhlIHBhcmFsbGVsaXNhdGlvbgp0aGF0IGV4aXN0cyA6
KQoKPgo+IEkgZ3Vlc3MgdGhlIExMTSB3YXMgdHJ5aW5nIHRvIGFkZCBjb250ZXh0IHRvIHRoZSBu
dW1iZXJzIGJlbG93LCBidXQgaXQKPiBsb29rcyBsaWtlIGl0IHdpbGwgZWFzaWx5IGNvbmZ1c2Ug
cmVhZGVycy4KPgo+ID4gRWFjaCB0aW1lIGEgY2hhbmdlIGlzIG1hZGUgdG8gYW55IG9mIHRoZSBi
aW5kaW5ncywgaXQgdHJpZ2dlcnMgYSByZWJ1aWxkLgo+Cj4gVGhpcyBzZWVtcyBvZGRseSBmb2N1
c2VkIChpLmUuIG5vdCBzdXJlIHdoeSBgYmluZGluZ3NgIGlzIG1lbnRpb25lZCBpbgo+IHBhcnRp
Y3VsYXIpLiBJdCBpcyBhbHNvIGF0IGxlYXN0IGluZGVwZW5kZW50IG9mIHRoaXMgcGF0Y2gsIGku
ZS4gaXQKPiB3aWxsIHJlbWFpbiB0cnVlIHJlZ2FyZGxlc3Mgb2YgdGhlIHBhdGNoLgo+Cj4gPiBy
dXN0YyBoYXMgYSBwYXJhbGxlbCBmcm9udCBlbmQsIGVuYWJsZWQgd2l0aCAtWnRocmVhZHMsIGF2
YWlsYWJsZSBzaW5jZQo+ID4gcnVzdCAxLjg0IFswXSBhbmQgdGhlcmVmb3JlIG9uIGV2ZXJ5IHJ1
c3RjIHRoZSBrZXJuZWwgc3VwcG9ydHMuCj4gPgo+ID4gSXQgaXMgbm90IHlldCBzdGFibGUgYW5k
IGl0cyBvdXRwdXQgaXMgbm90IHJlcHJvZHVjaWJsZSwgc28gaXQgY2Fubm90IGJlCj4gPiB1c2Vk
IGJ5IGRlZmF1bHQgLSBzdGFiaWxpc2F0aW9uIGlzIGJlaW5nIHdvcmtlZCBvbiBbMV0uCj4KPiBO
b3Qgc3VyZSB3aGF0IGl0IG1lYW5zIGJ5ICJieSBkZWZhdWx0Ii4gSW4gYW55IGNhc2UsIHRoZSBt
YWluIGlzc3VlCj4gd2l0aCB0aGUgZmxhZyBpcyB0aGF0IGl0IGhhcyBoYWQgaXNzdWVzIHJlY2Vu
dGx5LCBub3Qgc28gbXVjaCB0aGUgZmFjdAo+IHRoYXQgaXQgaXMgdW5zdGFibGUuCj4KPiA+IEFk
ZCBvcHRpb25hbCBidWlsZCBwYXJhbWV0ZXIgS0JVSUxEX1JVU1RfVEhSRUFEUywgd2hpY2ggd2hl
biBzZXQgcGFzc2VzCj4gPiB0aGF0IG1hbnkgdGhyZWFkcyB0byBydXN0Yy4KPiA+Cj4gPiBPYnNl
cnZlZCBidWlsZCB0aW1lIGNoYW5nZXMgd2l0aCBLQlVJTERfUlVTVF9USFJFQURTPTggKHJ1c3Rj
IDEuOTgsIGNsYW5nKToKPgo+IEkgYXNzdW1lIHRoZSBpbXByb3ZlbWVudHMgYXJlIG1vc3Qgbm90
YWJsZSBkdWUgdG8gdGhlIHdvcmsgYmVpbmcgb24KPiBgcHJlcGFyZWAsIGkuZS4gdGhlcmUgaXMg
bm8gb3RoZXIgd29yayBhdmFpbGFibGUuIFdoZW4gdGhhdCBpcwo+IHJlbGF4ZWQsIHRoaXMgc2hv
dWxkIGJlIHdheSBsZXNzIG5lZWRlZC4gVGhvdWdoIGl0IHdpbGwgYmUgc3RpbGwgdmVyeQo+IG5p
Y2UgdG8gaGF2ZSBmb3IgZnVsbCBSdXN0IHJlYnVpbGRzLCBsaWtlIHdoZW4gY2hhbmdpbmcgdGhl
IGNvbXBpbGVyCj4gdmVyc2lvbnMgb2Z0ZW4sIGR1ZSB0byBgY29yZWAgbWFpbmx5IChlLmcuIEkg
aGF2ZSB0byBkbyB0aGF0IG9mdGVuLCBzbwo+IEkgd291bGQgbGlrZSBpdCA6KS4KCll1cCB0aGF0
IHN0YWxsaW5nIGlzIHRoZSBrZXkgaXNzdWUuCgpJIG1lYW4gS1JVU1RGTEFHUz0tWnRocmVhZHM9
OCBnaXZlcyB5b3UgYSB3YXkgdG8gYWNoaWV2ZSB0aGF0LCBJJ2xsIHN0aWNrCnRoYXQgaW50byBt
eSBzY3JpcHRzIGxvY2FsbHkgZm9yIG5vdyB0b28gSSB0aGluayBhcyBJJ3ZlIGZvdW5kIGl0IHRv
IGJlCmNvbXBsZXRlbHkgc3RhYmxlIGF0IGxlYXN0IG9uIG15IG1hY2hpbmUgKFRNKS4KCkJ1dCBk
ZWZpbml0ZWx5IGEgVE9ETyB0byBwaW4gZm9yIHlvdSBndXlzIG9uY2UgdGhpcyBpcyBzdGFiaWxp
c2VkIC0gaXQKbWFrZXMgYSBiaWcgZGlmZmVyZW5jZSBzbyB3aGVuIGEuIHN0YWJpbGlzZWQgYW5k
IGIuIGtlcm5lbCByZXF1aXJlZCBtaW5pbXVtCnZlcnNpb24gaGFzIHRoZSBzdGFiaWxpc2VkIGZl
YXR1cmUgLT4gZWFzeSB0byBzd2l0Y2ggb24gOikKCj4KPiBJbiBhbnkgY2FzZSwgSSBhbSBub3Qg
c3VyZSBhYm91dCBhZGRpbmcgYSBLYnVpbGQgdmFyaWFibGUgYWxyZWFkeSBmb3IKPiB0aGlzIGF0
IHRoZSBtb21lbnQsIGVzcGVjaWFsbHkgd2l0aCB0aGF0IG5hbWUsIGkuZS4gaXQgaXMgbm90IHJl
YWxseQo+ICJ0aHJlYWRzIiBidXQgImZyb250ZW5kIGpvYnMiIGFuZCB0aGUgZmxhZyB3aWxsIG5v
dCBiZSBjYWxsZWQgdGhhdCBpbgo+IHRoZSBmdXR1cmUgYW55d2F5Lgo+Cj4gQW5kIGlmIHNvbWVv
bmUgd2FudHMgdG8gcmlzayB0aGVpciBrZXJuZWwgYnVpbGRzLCB0aGVuIHRoZXkgY2FuCj4gYWxy
ZWFkeSBwYXNzIHRoZSBmbGFnIHRvZGF5Li4uCgpJIGFncmVlLCBiZXN0IHRvIGRyb3AgdGhpcyBp
biBnZW5lcmFsLCBkb25lIGZvciB2MyBhbHJlYWR5LiBJJ3ZlIHVwZGF0ZWQKdGhlIGNvdmVyIGxl
dHRlciB0byBzYXkgdGhhdCBLUlVTVEZMQUdTPS1adGhyZWFkcz04IGlzIHdoYXQgd2FzIGRvbmUg
d2l0aAp0aGUgYnVpbGQuCgo+Cj4gKFdlIHByb2JhYmx5IGFsc28gd2FudCB0byBrbm93IHdoYXQg
dGhlIGZsYWcgd2lsbCBmaW5hbGx5IGRvIGJlZm9yZQo+IGNvbW1pdHRpbmcgdG8gcGFydGljdWxh
ciBuYW1lcywgZS5nLiB3aGV0aGVyIGl0IGFmZmVjdHMKPiBjb2RlZ2VuL3JlcHJvZHVjaWJpbGl0
eSBpbiBhbnkgd2F5LiBCdXQgcGVyaGFwcyBLYnVpbGQgZG9lc24ndCBtaW5kCj4gaGF2aW5nIG5l
dyB2YXJpYWJsZXMgdGhhdCBtYXkgYmUgcmVwbGFjZWQgc29vbi4pCgpJIGRvbid0IHRoaW5rIGl0
J3MgdG9vIGVncmVnaW91cyBlaXRoZXIgd2F5IHRiaCwgYnV0IGluIGFueSBjYXNlIGRyb3BwaW5n
CnRoaXMgZm9yIG5vdyBpcyB0aGUgd2F5IHRvIGdvLgoKPgo+IFRoYW5rcyEKPgo+IENoZWVycywK
PiBNaWd1ZWwKCi0tCkNoZWVycywgTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
