Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66ECC88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 11:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9KGf4/m70RhRiVHEsNWEs7ThjM49jDpalLqOzOzbIw=; b=h3afLRl0rNinOq
	F6wfLSENJ9Qkdaq0mxdDsauHsAD0IrZBtuV9osvlIA8/hlcaJ8W/nFAsVnUb3m9ofyK7USXZadXCV
	YiboRquKwPnqGp0WZAq6OUOVTb8izI7LmOS0ou8h7z8L+xXwDB3ybqaee3YyVGxaILCQoamk9N0VG
	d9/uAGjl8QGZ5y8MS4Kfl7MdgYtUbFo4zO7a+a1Km44Fwvu4cDjVcDuWn6TbkRFXBiS/DvKvJCtFd
	od2EgdjFmEC/gpZrUK5ks5atCliZCTS3s8B3m1CxkfkdxjSxvgimDaYruYTNc4uVVqbRy4IXSG1Em
	YtvvGfJfWzF0g7snuAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zOF-0000000GUdv-4BNh;
	Fri, 11 Sep 2026 11:25:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zOD-0000000GUbI-1kB9;
	Fri, 11 Sep 2026 11:25:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D3D5A60A59;
	Fri, 11 Sep 2026 11:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E071F000FF;
	Fri, 11 Sep 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125952;
	bh=limdG7iqTJH4ElLSnmTuuK3uee/BjGUPcvZqHysHW0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ovdJkn1+n2Xa/HSnex3YjDFO2KbfhBxhc0ZdaLdHyehs1gqEr51Nzw2uwYipYaf+3
	 ShJd7JPRyZyDSCQfG1A/B1KlXaZIsedvL3nJMTxIhzKoTY8n59OEYX2qKsowcDVzF8
	 pu44Si6aULXKS8aAqrd9mM9S6BBNtnqbk81Eaaru496HCuu1b71N/gTwC45BRGxYg0
	 mj5FhIO3UbgDmDuo2E4Ezz5g76L6FGXyqaHbYCfq9tDi5eK3K0qQga4bPbTWgZmtub
	 eLBHaP6WpPrv35lwy0BOxJ32kvrvGPCDN617FVQ1ORpnq/7MZ3nMUdH3GBDnOksEhS
	 6Wc0bT7UpLvlQ==
Date: Fri, 11 Sep 2026 12:25:38 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
Message-ID: <aqPjmExe9j1fSNV0@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com>
 <aqFptJRjLZIL-NX7@gremlin>
 <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
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

T24gV2VkLCBTZXAgMDksIDIwMjYgYXQgMDM6MDk6MTBQTSAtMDcwMCwgTmljayBEZXNhdWxuaWVy
cyB3cm90ZToKPiBPbiBXZWQsIFNlcCA5LCAyMDI2IGF0IDc6MTfigK9BTSBMb3JlbnpvIFN0b2Fr
ZXMgKEFSTSkgPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIFNlcCAwOCwg
MjAyNiBhdCAwMjowNjoxOFBNIC0wNzAwLCBOaWNrIERlc2F1bG5pZXJzIHdyb3RlOgo+ID4gPiBJ
dCB3b3VsZCBiZSBjb29sIGlmIHlvdXIgTExNIGNvdWxkIGdlbmVyYXRlIGFueSB2aXN1YWxpemF0
aW9ucyBvZgo+ID4gPiB3aGF0J3MgZ29pbmcgb24gZHVyaW5nIGEgYnVpbGQ/IFNlZWluZyB3aGF0
J3Mgc2VyaWFsIHZzIHBhcmFsbGVsaXplZAo+ID4gPiBpbiBwZXJoYXBzIHVzZWZ1bC4gUGFydGlj
dWxhcmx5IHdoZW4geW91IGNhbiBjb21wYXJlIHRoZSBiZWZvcmUgdnMKPiA+ID4gYWZ0ZXIuCj4g
Pgo+ID4gR3JlYXQgaWRlYSEKPiA+Cj4gPiBJIGFza2VkIGl0IHRvIGRvIGV4YWN0bHkgdGhhdCwg
YXR0YWNoZWQuIENhbWUgb3V0IHF1aXRlIG5pY2UgYW5kIHN1bXMgaXQgdXAKPiA+IG5pY2VseSA6
KQo+ID4KPiA+IEl0IGFsc28gcHJvdmlkZWQgYW4gQVNDSUkgdmVyc2lvbjoKPgo+IHVucmVhZGFi
bGUsIGJ1dCB0aGUgcGljdHVyZXMgeW91IGF0dGFjaGVkIGFyZSB3b3J0aCBhIHRob3VzYW5kIHdv
cmRzLgoKOikgWWVhaCBJIGRpZG4ndCB0aGluayB0aGUgQVNDSUkgd2FzIGFtYXppbmcgZWl0aGVy
IGJ1dCBmdW4gdGhhdCBpdCB0cmllZCA7KSBhbmQKeWVhaCBJIHdhcyBzdXJwcmlzZWQgYXQgaG93
IG5pY2UgdGhlIGdyYXBoaWMgY2FtZSBvdXQuLi4hCgo+IFBhcnRpY3VsYXJseSBleGNpdGluZyBh
cmUgdGhlIHNwZWVkIHVwcyB0byB0aGUgdXN1YWwgZWRpdCtjb21waWxlK3J1bgo+IGxvb3AuCgpZ
ZXMhIEkgbmV2ZXIgcmVhbGx5IGV4cGVjdGVkIHRoYXQgb3V0IG9mIHRoaXMhCgpJIG1lYW4gSSBk
aWRuJ3QgdGhpbmsgdGhlcmUnZCBiZSBzdWNoIGEgYmlnIHNwZWVkIHVwIGluIGdlbmVyYWwsIHRo
b3VnaCBJCmV4cGVjdGVkIGF0IGxlYXN0IHRvIHNoYXZlIG9mZiBhIGJpZyBjaHVuayBvZiB0aGUg
ZGVsdGEgYmV0d2VlbiBjb21waWxlICsgZnVsbApidWlsZCBvbiBhIGRlZmNvbmZpZyBjbGVhbiBi
dWlsZC4KCkJ1dCB0aGUgaW5jcmVtZW50YWwvbm9vcCBidWlsZCBpbXByb3ZlbWVudHMgYXJlIHJl
YWxseSBpbXBvcnRhbnQgdG8gZGF5LXRvLWRheQp1c2UuCgo+Cj4gRm9yIHRoZSBibHVlIGdyYXBo
ICh0aGUgdG9wIG9uZSwgZmlyc3QpLCBhbnkgaWRlYSB3aGF0IHRoYXQgZGlwIGluIHRoZQo+IG1p
ZGRsZSBpcz8gVGhhdCdzIGFsd2F5cyB3aGF0IGFubm95ZWQgbWUuCgpUaGF0J3MgbGQgLXIgb2Yg
dm1saW51eC5vLCB0aGVuIG1vZHBvc3QgYW5kIG9ianRvb2wgd2hpY2ggYXJlIGNyaXRpY2FsIHBh
dGgKYmxvY2tlcnMgb24gdGhlIHJlc3Qgb2YgdGhlIGJ1aWxkLgoKQmVmb3JlIHRoZSBzZXJpZXMg
dGhhdCB3YXMgMjMgc2Vjb25kcyBmb3IgYWxsbW9kY29uZmlnIG9uIHRoZSB0aHJlYWRyaXBwZXIs
IG5vdwo3cyA6KQoKVGhlcmUncyBzdGlsbCBtb3JlIG9ianRvb2wgc3R1ZmYgdGhhdCBjb3VsZCBi
ZSBkb25lIHRoYXQgSSBvcHRlZCBub3QgdG8gZG8geWV0LAppdCB0YWtlcyA2cyB0byBydW4gc28g
ZG9taW5hdGluZy4KCj4gLS0KPiBUaGFua3MsCj4gfk5pY2sgRGVzYXVsbmllcnMKCi0tCkNoZWVy
cywgTG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
