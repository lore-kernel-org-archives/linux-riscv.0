Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5EFC88E63
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 20:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maD24DR7ZMC3RkmMsiHApxDiXVeax+/Qoyj2OLs2R2s=; b=YyhCER4dzPqTP2
	TsZuKtyurrXUwySM/DRizlxiCo+qrATTJJsxj07fvGhbzRtPwoIx00xr1xgYdw9t7AcyjPJYxI7cw
	mpTY2YGHLCSM3eBn4AhHJZ35xFO6cKynI5dM7O9UrH2zX6nV6ZhnwFd1JTOfnnvM2j4qB+nrDD6IV
	C01QHh1O8vWGdLmRzVOVQQV0eJ0kHmTjOIogRT4N4L9LLm6Bqx5mR3PoPfd67WkLrea9eRgMLyjJy
	d7SZWzfd5b5XtjOv8T/g1EpH9w3I0HnEY80Hqr/K+iT6plMRbskmy5aAjgqoLYzI2i765fMRx0q9x
	mh389o7FP+nTZH3/+vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qPm-000000020tv-0r7N;
	Sun, 13 Sep 2026 20:03:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5qPj-000000020tl-2mLx;
	Sun, 13 Sep 2026 20:02:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C529140B7A;
	Sun, 13 Sep 2026 20:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9299F1F000FF;
	Sun, 13 Sep 2026 20:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789329778;
	bh=FIkAWUWlN6IulmoamTUqkqG8+2dVERWLnANwGikeBxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HlDGsq4/UmYfY5watxSUp7cF5BqBu/g1fAq4lP+77QRdJlpCZqGH4mQ52EiBUPykr
	 Cd0+VHZFXQUlRaRYDhuLoSpQ6FEq0qzmKfJBGEVC9mszdpLneVm8nzdWMjqYWt+YJs
	 jWXqr77zpV3n3Eg0kcjyUT2JBjO+NPlDBxPLNxWlRmlG2ft3w25fXSmaWC6wnopsJU
	 XXVX1gLesBdp5t4hb9bolEagqKfVnSVlUcSLdX9Bw7PA4bFOXWSYqSKsNLE0uRQDfM
	 Tm+p4o7rMkUbztOOJig9dDty0W0F+k/TWF4/7FArPHjjsrjsRaye8GzyFHaa+x3sQv
	 isR4zk4sqpvIg==
Date: Sun, 13 Sep 2026 21:02:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, 
	David Laight <david.laight.linux@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
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
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker probes
Message-ID: <aqcAqth2Bhx7J9BT@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
 <178901395292.3971858.13236774094648272066.b4-review@b4>
 <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
 <20260911183333.1df0f2e2@pumpkin>
 <20260911-invaluable-indigo-seal-e31aec@l-nschier-aarch64>
 <aqRGYXKDzXZMXmmp@gremlin>
 <20260912071128.GD2002951@ax162>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260912071128.GD2002951@ax162>
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

On Sat, Sep 12, 2026 at 12:11:28AM -0700, Nathan Chancellor wrote:
> On Fri, Sep 11, 2026 at 07:24:50PM +0100, Lorenzo Stoakes (ARM) wrote:
> > I mean this is a problem that already exists for any flags already specified in
> > Kconfig.
> >
> > Out-of-tree modules are historically something that we don't go to great lengths
> > to support and haven't historically worried about breaking, either.
> >
> > I'm sure distros can find ways around this if a problem were to arise. But I
> > don't think it's something to worry about all that much.
> >
> > I expect a _lot_ of these, in any case, would only require the compilers to be
> > within a fair few major versions of one another anyway.
>
> Yeah, while I know distributions will try to maintain a stable kernel
> ABI to allow updating modules without updating the main kernel, I would
> be very very surprised if they guaranteed compatability when building
> external modules with a compiler different from the main kernel. If so,
> I think they get to pick up the pieces :)
>
> One issue that I found with my test matrix building with LLVM is that
> cc-option in Kconfig does not guarantee use of either '-m32' / '-m64' or
> '-mbig-endian' / '-mlittle-endian' to properly flip these options, which
> could result in a flag being set (or not set) when it should be. For
> example, building ARCH=powerpc pmac32_defconfig results in
>
>   clang: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]
>   make[4]: *** [scripts/Makefile.build:193: kernel/bounds.s] Error 1
>
> because the 64-bit PowerPC little endian target supports this flag in
> the PowerPC LLVM backend but the 32-bit big endian target does not.

Ack, reproduced locally thanks!

I had the LLM probe every flag the patch moves in both directions with
clang across ppc32/64 BE and LE, x86 -m32, mips 32/64, rv32, s390x, arm and
arm64 BE and with gcc -m32.

(We really have to stop supporting some of this stuff...!)

It seems that only -fno-stack-clash-protection is problematic for
ppc32/clang.

So in v2 I'll keep that probe in the Makefile and move the rest, have
confirmed that fixes the problem.
>
> I am not really sure what the best way to avoid this would be off the
> top of my head... it might be safer to start with moving only the
> warning flags to Kconfig since that is a truly frontend query.

Given the testing above I think we _should_ be OK :)

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
