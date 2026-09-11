Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA7AC88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmNnEJyEb7By8NrH5x/ExpEGEBP7lhzEgoVMiOdw0uY=; b=V6el8GSSUhYW6q
	lp+/hAfgMHe83dBrCSgmkJ0IOc7ccXKoDV1XyeAwEbZQiKJcy5i1M7LKDhRrpJVVDbhYBBYvitrXP
	qNE8LJ/or6h0E+8Cd1TzYmQ1AW1t4GwipxbR+HGHPdGgFI7ZxbGkJ35qDLWurOmgvbnZgVrjqZApp
	vQaflf1zyvKPPx6R0CtTvZNgsxfFNw4nfU3Vym4gQ6A60wctgcnlrRNf7y4FMYf9RRuUmfQyirSHN
	5TDHNrf1xoo5P7LSYYmDMmAg4a+5077hMP+E2KZmOuZfsXzBnFhEQTt/CfDjXzQoAo0XGA6Ym+uRe
	oPin4tgHBSIpfJ3fmJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z3A-0000000GSgv-2Gv2;
	Fri, 11 Sep 2026 11:04:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4z38-0000000GSgZ-1FGk;
	Fri, 11 Sep 2026 11:04:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68FD46025A;
	Fri, 11 Sep 2026 11:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C031F000FF;
	Fri, 11 Sep 2026 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789124645;
	bh=alqEY8dnDva6F4/EFxAYV7W6BWJYz3u01M3s7WRVjzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d3GL+lR19THU5SBCGyL+xEEr0naqO1SarQ3qNZC9ZLWdENLkTSVMcdRDJoBzhxjhG
	 F+mcqlc8tU9Nm4Czy07P+0FLLJIN0s2o/fiJpxlOsJuGYK3NBsPtufEkgYbjPywuo+
	 3X0HRzYV9KBUy+5i0WEOecFyiSRN3gMD8CsMexCB1Bkfnf9mlgpjH53Ora7YXXXb2j
	 oRVHuibhURwT2w+2ijqiHEWUqzrwoDoAbffw9LNgtabmhIIT7LrAOwtMqfhqmRWE4D
	 ZD5rSVLb3kSPGR2AELWg6xCb14S7tv6go7sz2k/htC6UQ6DmekxUeeAjRtIHnumI8M
	 gfjXtM3jHVpOg==
Date: Fri, 11 Sep 2026 12:03:51 +0100
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
Subject: Re: [PATCH 23/23] kbuild: use pigz for gzip compression if available
Message-ID: <aqPdP_0eh0OYY6gZ@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-23-5dc1ac01672d@kernel.org>
 <178901395293.3971858.15429964442902485180.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178901395293.3971858.15429964442902485180.b4-review@b4>
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
> > The gzip step of a kernel build is very lengthily, especially for larger
> > builds such as allmodconfig.
> >
> > gzip itself cannot be run in parallel, however an alternative tool exists
> > that can, providing the same feature set as gzip itself - pigz - which
> > works as a drop-in replacement.
> >
> > On a 128-core Threadripper, gzip -9 of a 36 MiB x86-64 vmlinux.bin takes
> > 1.6s, and with pigz it takes 0.09s, so the performance increase is
> > significant.
> >
> > It is already possible to specify the KGZIP environmental variable to make
> > use of pigz, however it seems sensible to make use of pigz if it is
> > available.
> >
> > Therefore default to using pigz if it is available on the system upon which
> > the kernel is being built, otherwise fall back to gzip.
> >
> > The output is byte-for-byte identical between pigz/gzip invocations, but
> > gzip and pigz do not produce the same stream as one another.
> >
> > Therefore, for reproducible builds, the same set of tools should be used.
> >
> > This seems to already be an implicit requirement in any case, but update
> > the reproducible build documentation to make this clear.
> >
> > Also update the kbuild documentation to reflect the change.
> >
> > Every x86 build ends with the compression of vmlinux.bin, 36MB for
> > defconfig and over 200MB for allmodconfig, no-op builds are unchanged.
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 defconfig, touch mm/vma.c, gcc        7.4s     5.4s     -2.0s (-27%)
> >   x86 defconfig, touch mm/vma.c, clang      6.6s     4.9s     -1.7s (-26%)
> >   x86 defconfig, clean, gcc                26.2s    24.4s     -1.8s (-7%)
> >   x86 defconfig, clean, clang              25.8s    24.3s     -1.5s (-6%)
> >   x86 allmodconfig, touch mm/vma.c, gcc    23.7s    15.3s     -8.4s (-35%)
> >   x86 allmodconfig, touch mm/vma.c, clang  22.1s    15.2s     -6.9s (-31%)
> >   x86 allmodconfig, clean, gcc            291.4s   275.2s     -16.2s (-6%)
> >   x86 allmodconfig, clean, clang          278.3s   265.7s     -12.6s (-5%)
> >
> > Link: https://zlib.net/pigz/
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ...
> > diff --git a/Makefile b/Makefile
> > index a0d29dee81d7..efa6a2d77e6b 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -561,7 +561,7 @@ PERL		= perl
> >  PYTHON3		= python3
> >  CHECK		= sparse
> >  BASH		= bash
> > -KGZIP		= gzip
> > +KGZIP		:= $(if $(shell command -v pigz 2>/dev/null),pigz,gzip)
>
> This should be '?=', right? Sashiko also notes a concern around parallel

Actually make KGZIP=foo will override this still. But it doesn't take an
environment variable for make -e.

However, that's consistent with other variables there like KBZIP2 etc.

Probably the wording in the docs should be tweaked!

> module installation with gzip module compression since there is no
> thread limitation, which could bring a little risk to doing this by
> default? Might not be that big of a deal though?

Yeah, will modify so it single threads for things that aren't vmlinux on
respin!

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
