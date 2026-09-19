Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE460C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9uhOiBpT4aSEgjmR+f5GvOFWa4Sp6BXLxR4qg2mtss=; b=sGeDM2YlUvyiYG
	oxzk3r0hHuFxb0r8tkpC8nwlaLo+Fpry3xw0iemDmZaJ979u6EgWk9InjW1bb77YBCXABSO2H0QIO
	fTBeTO5/3JN6aY/sKW/zzldTX2DzIp1nKhE2uetvUVXzj8GkgeINd6c1m4Yv9+6aHkSmHNwIn1ywi
	o0M0HwiTFV6mnd9+k1fyD+OlTVHgMEblbUTXyDehZaH0dPETVDkiZUCMDZar2u9F3bqYwAAsRVMWg
	lKKRQ2eKC+5f1Jr1tvrjSlTGBA64qlKb2DNtsgFNnKLRuLvbXXWhLB260wheVsbba9gtLA6bzYqjU
	TzNO8m/dawmpfl0HnfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yuX-0000000GXxw-1aci;
	Sat, 19 Sep 2026 17:31:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7yuU-0000000GXxb-3pDC;
	Sat, 19 Sep 2026 17:31:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE80D60258;
	Sat, 19 Sep 2026 17:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DA51F000FF;
	Sat, 19 Sep 2026 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789839093;
	bh=fVAHOMFqAITEt//POM6bQ9UTJyR9eAZklHX2rYYlXWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FP/+pD4up9yLl7bTC0GWYrOoNDKwzZSUigPYwOJpywqcVMfipIDe8s3Gduvwb4og0
	 rc+mr1eCvHL0HMLxlIIEaitz+zwOG8ZWJdZACY+xlJu/b05obHcF24GOHFsY9bD1Uq
	 PGgQpFnBMs/q2RDut3Zs2HMHzgy3xhc6IYch5Z3BIzyPZs5Geuetp56ld++rTjKBUn
	 +iB5hsrktSXqy6ITQW8NiAbuo+dxwOa9CnixH1MtuaPpaFglPCj/dFNjQN38IIn4FO
	 s2V0a0EDUbG9rXe5jJ7i5uCxK4oviQ4QEgMXGwIA839jGMovwvZ690hYDBWYZmtGUV
	 2bi5cG33lD/cw==
Date: Sat, 19 Sep 2026 18:31:19 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nicolas Schier <nsc@kernel.org>, 
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
	Randy Dunlap <rdunlap@infradead.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 11/20] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <aq7GOsnTqeHPedUm@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-11-9ecf4163ff36@kernel.org>
 <202609171154.BEA5134F7@keescook>
 <20260918012119.GC1585590@ax162>
 <202609172130.3DF0D66@keescook>
 <20260918054058.GA384222@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260918054058.GA384222@ax162>
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

On Thu, Sep 17, 2026 at 10:40:58PM -0700, Nathan Chancellor wrote:
> On Thu, Sep 17, 2026 at 09:44:24PM -0700, Kees Cook wrote:
> > On Thu, Sep 17, 2026 at 06:21:19PM -0700, Nathan Chancellor wrote:
> > > While we could certainly try to cook something like this up, we could
> > > also avoid the split across two files by just defining the flags in
> > > Kconfig directly and using them in the Makefile through their symbol,
> > > like we already do for -Wimplicit-fallthrough. For example, instead of
> > >
> > >   config CC_HAS_STRICT_FLEX_ARRAYS
> > >       def_bool $(cc-option,-fstrict-flex-arrays=3)
> > >
> > >   KBUILD_CFLAGS += $(if $(CONFIG_CC_HAS_STRICT_FLEX_ARRAYS),-fstrict-flex-arrays=3)
> > >
> > > We would just do
> > >
> > >   config CC_STRICT_FLEX_ARRAYS
> > >       string
> > >       default "-fstrict-flex-arrays=3" if $(cc-option,-fstrict-flex-arrays=3)
> > >
> > >   KBUILD_CFLAGS += $(CONFIG_CC_STRICT_FLEX_ARRAYS)
> > >
> > > While we still get the duplication (and we could look at getting rid of
> > > it with your cc-option-str idea or whatever), it is at least contained
> > > to the same location, so out of sync issues should be much rarer. I do
> > > diff Kconfigs so this might make certain issues with checks a little bit
> > > more obvious if something changes on the compiler side.
> >
> > Yeah, and note that cc-option-bit already exists. It's just a weird name
> > is all and there isn't an ld-option-bit.
>
> Ah, I see. I worry that the current cc-option-bit is not sufficient for
> all options that we may want to test because it uses '-E' to stop after
> preprocessing (whereas some options may need to get to code generation
> to be validated properly) and it does not use $(CLANG_FLAGS) to properly
> set the target (so we might not get consistent results). I wonder if we
> would be better off refactoring cc-option-bit into cc-option-str that
> shares most of the machinery of cc-option. Then we could just add
> ld-option-str.
>
> > As for naming conventions, I think "CC_OPT_" would be a good prefix. And
> > this works today with no change:
> >
> > config CC_OPT_STRICT_FLEX_ARRAYS
> > 	string
> > 	default "$(cc-option-bit,-fstrict-flex-arrays=3)"
>
> This does look pretty nice.
>
> > (do we need "def_string" now?)
>
> def_string would certainly make these even nicer.

Agreed :)

Done for v4 (which now cites Kees's series as a dependency and hopefully will
sit in the kbuild tree soon, maybe after 36d4a11b56aa?).

26/29 probes use cc-option-str, there were a few that had other
conditionals but nice conversion in general!

>
> --
> Cheers,
> Nathan

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
