Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731AFC88E4A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 10:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3ZjtfopTBus2HIfjTQKoieDFendgHn8jW7vE0cF4So=; b=30y+H19vrkZEt5
	zwcz2QZPQ/7x0ddhEt2uw+QBtsFBcg8nbNeHxhh8B+gyg6IcvG4byiHwbuo5Vi0N1jatdAJinChBs
	kLPmsVQ8SYTTcQ5wFPxIq8Cv1Xnck/IEPGZ9b7olyHvfVV7Cc11Adnh12aDLvHIS3zs5d8TtANdhr
	fkY8CnS3k4uqyW1/GNn9hJVBCA7Bl4rqnobYQktFXIyO36SDldD9fH26c9l7Vh4ylubEZpRWBtmSA
	MgLkuQ+zMW3UvSC22bjwKe3E8bFeRytr0ZeeKrKItd0pyWbbjDtMQIB0gmpcAYZWYeixz3tLo9454
	1Z05fnPuthwd2GvJxVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yT6-0000000GNeR-3gKB;
	Fri, 11 Sep 2026 10:26:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yT4-0000000GNdv-2ULI;
	Fri, 11 Sep 2026 10:26:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F37EC41499;
	Fri, 11 Sep 2026 10:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7391F000FF;
	Fri, 11 Sep 2026 10:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789122409;
	bh=1b/qcPuJz2i8RCf8tb4bNixsUCkYKAvDGjoKk0PZqp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kFDpyBDdyQKph0hYEm2EtP4fmdTwsH5ae1psCQ+iIewwia0k0QRGTo5Nt0s92YAzz
	 FuESck15gxApqv4piu1r+cD9sUZpRnhD48odPTpilTg6mN4SRcykIsTjS7fHCX8phu
	 WGD8JxPG0wpWKwgrbgPdj6tDHS9sTCTympSwtMe3xWCmh5wpolpZwsAVU2dS5NINN+
	 jVMV1xpdTN3v0SYWjh2cljHWZD+pdGkLEH/BPbnjakFxD/qiHfiegGVUcjKB1C/Q1X
	 aimrZRPcUZh9/wF8gNvM+kOUTOOLvjJd0Z3XSXGfoVs8ZldqVWiDMdG0Zlscj5WDM+
	 nbPKE+h4wTTEQ==
Date: Fri, 11 Sep 2026 11:26:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
Message-ID: <aqPW1FsBVYHSWl1r@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178901395292.3971858.13236774094648272066.b4-review@b4>
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

On Wed, Sep 09, 2026 at 09:19:12PM -0700, Nathan Chancellor wrote:
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 8583d9f06c52..3c92c87254a3 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -144,6 +144,44 @@ config CC_HAS_ASSUME
> >  config CC_HAS_NO_PROFILE_FN_ATTR
> >  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
> >
> > +config CC_HAS_ZERO_INIT_PADDING_BITS
> > +	def_bool $(cc-option,-fzero-init-padding-bits=all)
> > +
> > +config CC_HAS_NO_STACK_CLASH_PROTECTION
> > +	def_bool $(cc-option,-fno-stack-clash-protection)
> > +
> > +config CC_HAS_NO_ADDRSIG
> > +	def_bool $(cc-option,-fno-addrsig)
>
> I am generally in favor of this proposal since I think these checks
> should be cached by Kconfig where possible to clear up running them
> twice. That said, I wonder if we should pick a better dumping ground for
> these checks other than init/Kconfig. Maybe init/Kconfig.tools or
> scripts/Kconfig.tools or something?

Yeah makes sense to separate them out so they're not all clumped with unrelated
stuff.

It feels like init is the right place, having actual substantive Kconfig entries
in scripts/ feels a bit weird.

I can add an extra patch to move existing entries over before adding these in in
the next patch?

>
> I also worry about backsliding and growing cc-option checks. Should we
> update the documentation to state that it is preferrable for these
> checks to live in Kconfig so that they can be properly cached?

Yeah makes sense. I can add a patch to update the docs too?

>
> --
> Cheers,
> Nathan
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
