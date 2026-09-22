Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4ADC982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SkojRzSWeLzqD2dcsfgSDK8dN9liNcNPZZ/j21e1vA=; b=dcSG7mREP3OheO
	H0RwZhtfadhdJy+WEOHzk0Jxn1PdnVNm/ukIJ/Vi4+CObnTuEw8Q4UUkgBO5lmfsqB9mTDHlqPV8x
	xNoYqL9OtGR2uqudDSHD1zjjRyhmK7mLEtv9rN6Di8nj/BGn8M0H6xsHdH6STqqCdLdnXczJbCo+r
	DxviH45tMveaIfSJa/k2iwaiCcSIQVyHc9Hi1s9TXEMtbj8HWOTlsYOXTUWxHft3CZ60tIYIfpmaf
	EtTAmaTpEX9PLZ2xac76EHbnVQWnH52isnC3j2gzguOEm1eY2b1lO3afOuT5yWNJjJSe0bAS/FOrn
	wv6iB/8bnut9E87pahAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Fg-00000005RW8-3rJC;
	Tue, 22 Sep 2026 13:09:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Ff-00000005RVJ-131o;
	Tue, 22 Sep 2026 13:09:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 651E860DFD;
	Tue, 22 Sep 2026 13:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037D31F000FF;
	Tue, 22 Sep 2026 13:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790082578;
	bh=AgYRKeGx6YrxHo5tLOfYUAdJiIfBFhEsQpTA/20bgCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MtUom7eBTFRpDBmC5PC16C5qIL5Ywu9NH+SE0K9c1jgXsItXNIbsoXLlqLDE9nyLi
	 fD7w9uOE4hQ6p5C3WrqxT9iCd0Ti9bY1Yp11pFK8cfEu4cnBoF7cmLzyf7YGb6puUL
	 ACqI1nfguAjSKdnRWZ4sCh5yWXK6a8eUMMQdhCtTvyURYIw0gBPNcz4vv6YhkLixLP
	 tucoL78ZEps4VrU6pRz+AsOmtwsdrdrlTDmZVX01Ew2uILwbH/zWwnPkDwKfCO6QOS
	 DpTalaKpOS69IVpTTWiDFgWTYeUf916M1x0zOQ/73Ce0EJamJnVZsGD0S0GuuSE19p
	 nfnZlw89sqKgA==
Date: Tue, 22 Sep 2026 14:09:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
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
Subject: Re: [PATCH v2 13/21] modpost: emit module descriptors as assembly
Message-ID: <arJ9QwpjQq5Z512z@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-13-39817ec5db23@kernel.org>
 <95baacfb-d8d9-4d2f-bc89-592df6f6f8e3@suse.com>
 <arEZrFmXeCO4hZpP@gremlin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arEZrFmXeCO4hZpP@gremlin>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2026 at 12:57:57PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Mon, Sep 21, 2026 at 01:25:09PM +0200, Petr Pavlu wrote:
> > If the <module>.mod.S files are fully self-contained and do not even use
> > something like KBUILD_MODNAME, would it be possible to name them
> > <module>.mod.s and skip the C preprocessor as well?
>
> Ack will do for v4!
>

Unfortunately this broke because the build passes flags that are only
meaningful to the preprocessor (esp. on an LLVM=1 build) and
-Qunused-arguments was removed from kbuild in commit 8d9acfce3332 ("kbuild:
Stop using '-Qunused-arguments' with clang") purposefully.

And some flags are needed and others not so keeping track of which is which
just for this is asking for things to be fragile/break, esp. on the rando
arches.

The win here isn't very much overall so I think I will revert this change
for v4.

(All your other requests have already been applied for v4 :)

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
