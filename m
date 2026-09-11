Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08777C88E4D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUaGho7ZrHyjIDknSo5GxN7vata7Im4JPoLbAxtQX/o=; b=3yABaBzc7UW5B6
	i2Sy4QLkOtVV7envurGKPH9/BobQ3vvpH4Memgx2u39exXxDjPt3CpOuG9eL9FYoWqp1cxh5xoVAN
	8ld0Q6fKWO44dcIBuj+1WI61mZmYm0dTwJt5z3Ev1TpYqe1q2PF3vQrUNDS6PZY/aEdGwRrnc7QGd
	Ix1RWdD4i36gd4JubZoY/81qomm7/GKwFVNuYljT6bmNfhVofQ2Ux77ZZH+p2AtNGDY8rnYMk4gff
	okCTA2hAmdowui0af9xzlb3oR0M60f4tqm7GpXtw94iLTZtm+6KhCVs1ysZRbU58nFdtZ7zKKibCl
	KD5bG5oNWFv9Fm8QfSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yWd-0000000GOKd-0L84;
	Fri, 11 Sep 2026 10:30:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yWY-0000000GOJk-3CH9;
	Fri, 11 Sep 2026 10:30:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63FE6404BA;
	Fri, 11 Sep 2026 10:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4EE1F00893;
	Fri, 11 Sep 2026 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122626;
	bh=HvFCGCANaLFVV/N2IK8KH4LaOjgAeqgCzbjmvYneKXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JZS/pO7H1pqAZlMiQfD69ngRhDMlBggb2cf7WXqq35hVdt6EJaURUBtmC4djm7YlO
	 xyjg+nnrOjmg2UqBoa2RhbyP0vDv4NP7gutpfcXXNf8+8Jb7DARVGX5NbEmBeqrkhL
	 J6WFa/UqRcOepTtPh7h7pANQKHrW3T9qJbQmAr+uJbt8OZbzEiWD4+lu0YVWY2Y7Vc
	 ybOd5FOj4FYTQ20nMKw8qnkWY/MsN/C3euDfdcLLm0itz4z6/liMd1loce9nvjp4nb
	 on/xsdRR27N/vMX5OG+ddPelyz4EOT6o95KJVuDyPXA1MiXZ9sjuF6rqvoqse3QloP
	 7P4oppuiKyBBw==
Date: Fri, 11 Sep 2026 11:30:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
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
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <aqPXj1nDQ06KRhf4@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
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

On Thu, Sep 10, 2026 at 05:42:35PM +0200, Nicolas Schier wrote:
> On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index 8583d9f06c52..3c92c87254a3 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> > >  config CC_HAS_NO_PROFILE_FN_ATTR
> > >  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> > >
> > > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > > +	def_bool $(cc-option,-fzero-init-padding-bits=all)
> > > +
> > > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > > +
> > > +config CC_HAS_NO_ADDRSIG
> > > +	def_bool $(cc-option,-fno-addrsig)
> >
> > I am generally in favor of this proposal since I think these checks
> > should be cached by Kconfig where possible to clear up running them
> > twice. That said, I wonder if we should pick a better dumping ground for
> > these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> > scripts/Kconfig.tools or something?
>

(Sorry hadn't seen you'd replied also!)

> Yes, skimming through the patch, I thought about that, too.  Moving more
> cc option checks to Kconfig will make building out-of-tree kmods with a
> different compiler more dangerous.  Maybe we will have to make the
> warning in Makefile's prepare (external kmods) target a bit louder.

I guess this bit can be a follow up potentially?

>
> > I also worry about backsliding and growing cc-option checks. Should we
> > update the documentation to state that it is preferrable for these
> > checks to live in Kconfig so that they can be properly cached?
>
> Sounds good, yes.

I can add a doc update as part of this series, unless you guys want to handle
separately?

>
> --
> Nicolas

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
