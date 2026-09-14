Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93192C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU9Cpagf/di5FDo2TiW+TvkWYfeLTMCfD0oUI95KeJ0=; b=vTcnb7ARGLvl3y
	+Wo4mGjdYNsrQLzFNPK69AyitbhBcXQnyDcvhb95B79c35qF3xhgVQQ+H/xOVGD1IebWPROoaFQOb
	+lngo5v3FJQ95Vo0+t/zah9WMbz+wBzxCSa5zAx4PtIRiFrebb2Ooggv4y5/Rw5NTbhPGLS2cSb78
	MQM2aXubbcE/0fBqS855x8WL/8TvERQjQOwCbtLyLNdEfiDXB1KKR2fa6UPs6MEBEY2GQDI+f5ekK
	Pm+ZHBdb7p1m2A81DpFGZPYD03RDKii1fwi6oJyZOS4AmmYGF1g0WbDNWuUnfEP/QTVwKafpFB7g/
	plhmSZu+PVGYKNllaqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68YD-000000049LO-1zKI;
	Mon, 14 Sep 2026 15:24:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68YC-000000049L6-0u7g;
	Mon, 14 Sep 2026 15:24:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5ECB660142;
	Mon, 14 Sep 2026 15:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28771F000FF;
	Mon, 14 Sep 2026 15:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399495;
	bh=WL86cKdk/ZUM1qTOZj4B+L+bc1frQqDRCUlhlSxv/JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D6by0sBSuPsWnPY/q+3+4xxuX6qvTRutko6G8MFgm2Cgx7icFf77LFko08xgOogFa
	 Q7hoHM9IO7d/MfeE/M35aFQUHhgNS8dCHhTb2vdRWWhepoRdkSG+3aIrGEpcO2uL1O
	 SGeyDR+u4PbiXRNjfxFaz4YYPqI/uqF6Q1hTc37azbSMl2Z+PG2xV7V/wVVpLW1+5N
	 jKCFeGb0EYtA5i/SCA7hk6dbkuVRO9cq3VEyZas+X47IL8Eijo12e4khM0fl5mUJV2
	 Hg+16wB7QyUOYfGnlM4ppjr1ZK+lmVnEEdNmQ/oqGVaJ3hUpBtr7eI85g02Pn16I33
	 zLHsGFg95m+vg==
Date: Mon, 14 Sep 2026 16:24:41 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: John Stoffel <john@stoffel.org>
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
Subject: Re: [PATCH v2 11/21] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <aqgRXk6DXyAah488@gremlin>
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-11-39817ec5db23@kernel.org>
 <27304.3198.867048.379684@quad.stoffel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27304.3198.867048.379684@quad.stoffel.home>
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

On Mon, Sep 14, 2026 at 11:02:22AM -0400, John Stoffel wrote:
> >>>>> "Lorenzo" == Lorenzo Stoakes (ARM) <ljs@kernel.org> writes:
>
> > Each kernel make invocation begins with ~30 compiler and linker runs each
> > of which performs duplicate probe for a number of compiler and linker
> > options.
>
> > This is useless work - the compiler and its version is known, so use these
> > to determine which options are available, once.
>
> > A convention already exists for this - CC_HAS_xxx, LD_HAS_xxx in Kconfig
> > files (for example, CC_HAS_COUNTED_BY), so convert these probes to Kconfig
> > options where appropriate.
>
> > This change avoids a sublte issue with ppc32 (big endian) - clang doesn't
>                        ^^^^^^
>
> subtle

Oops!

I love that I ran this through AI review several times and it missed
something as simple as this :)

>
> > accept -fno-stack-clash-protection on this sub-target, so keep this option
> > in the Makefile.
>
> > With gcc and clang, defconfig and allmodconfig, the recorded command
> > lines are unchanged, a build with nothing to do rebuilds nothing and W=1
> > continues to function correctly.
>
> > Doing this improves all builds, but has a particularly positive impact on
> > no-op builds (builds where nothing has changed).
>
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
>
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 defconfig, no-op make, gcc           0.78s    0.60s    -0.18s (-23%)
> >   x86 defconfig, no-op make, clang         0.94s    0.66s    -0.28s (-30%)
> >   x86 defconfig, touch mm/vma.c, gcc        8.6s     8.5s    -0.16s (-2%)
> >   x86 defconfig, touch mm/vma.c, clang      8.0s     7.7s    -0.24s (-3%)
> >   x86 defconfig, clean, clang              29.8s    29.4s    -0.37s (-1%)
> >   x86 allmodconfig, no-op make, gcc        12.9s    12.7s    -0.23s (-2%)
> >   x86 allmodconfig, no-op make, clang      14.2s    13.9s    -0.29s (-2%)
> >   x86 allmodconfig, touch mm/vma.c, clang  32.2s    31.9s    -0.30s (-1%)
>
> Are these deltas just per-patch, but cumulative with all the previous
> patches applied?
>

Per-patch. I let the threadripper do builds for a LONG time to accumulate
these... :)

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
