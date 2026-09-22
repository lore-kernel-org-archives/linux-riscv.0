Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B94FC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZD4oPoEyn3g9Rk/Gumwbm1ak72IWzQccbiCsYJxJKM=; b=XJ7NPxOKhZUXYt
	JILWFQ2ZCwaldP1IIw08H203TkYrhdKcwLeFgd1b6KOiWSVv3K3OEbdYcVd0zpemeTlUNB9nn1vAs
	ugWP19DTP95J49YKIaTql0C3xjcb2kvh7bJggGUW89xPqcjmtiDT9Fs2NFhaG9k35hi3ZRuoh8bJY
	kx8x61a8SKzcPJFMBJQb7kDnDA3SGUNUsoUV8PWXHXH+UPO5ZRxvheeWuqdhwMGhe7hx+W1pxNGRZ
	/ndf9+tv1cslvxAkb1x74QEk9OlHFTVJp2HU5ADwcadLRwNXROxhU8IJVOs0+c85ja10r+SOgwvCw
	8RuXIfbrRhkTcXZ9EYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x2g-00000004xJH-3DhZ;
	Tue, 22 Sep 2026 09:44:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x2f-00000004xIe-26tS;
	Tue, 22 Sep 2026 09:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 958D360DE3;
	Tue, 22 Sep 2026 09:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113741F0089A;
	Tue, 22 Sep 2026 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790070240;
	bh=YTT+dkVu7tWPKjS3DFi060r/rlKRC0HzmitVIec+iIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jy3U+JxcId7zmfYkIr1r7u3noV5oRtTv3+3FbbQxFWzLtL+STTIwAbXmdb0Ene9HI
	 1+a7y9W33iqDoUkRTyaFkdEdhyxU4mtChStxqOWiYEMJ8Jqg7m0YmoABhfoSe9DgVF
	 pi4hN43C7Rs7zg5iDpGuqFUPaDmHfpRsFefjZ/gma6zPCY0usIXBeI1wBK+qR6PYJH
	 iesQMJwGVINhl3cSO+pgnPecINN1L34B75FLiqqDn/ulF582FizRK6GnDfJw2+2hPD
	 rsneXl39GgR4xuDRTGTeKge+B4Zs7cN7OXc3v+uw4jHCi4Yw/YppZ87MJ321hS8QYh
	 xNfZ0IyAbqvAw==
Date: Tue, 22 Sep 2026 10:43:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
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
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 17/20] objtool: decode instructions and resolve branch
 targets in parallel
Message-ID: <arJFPXN5SsrkUyJY@gremlin>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-17-9ecf4163ff36@kernel.org>
 <arICcrXVFLVzO-Jx@jpoimboe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arICcrXVFLVzO-Jx@jpoimboe>
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

On Mon, Sep 21, 2026 at 09:27:33PM -0700, Josh Poimboeuf wrote:
> On Thu, Sep 17, 2026 at 05:06:27PM +0100, Lorenzo Stoakes (ARM) wrote:
> > During a kernel build objtool is used to decode vmlinux.o's instructions
> > and resolve every jump and call destination.
> >
> > This forms a large part of the work objtool does during the build process,
> > and it is all done in serial.
> >
> > Decode these in parallel at a function granularity to speed things up, but
> > limit this to invocations that pass --link, and only where the there is 8
> > MiB or more text to justify it.
> >
> > In practice this limits this to processing vmlinux.o in the kernel build
> > and modules are processed as they were before.
> >
> > Only the instruction hash is shared between the threads and nothing is ever
> > removed from it, so an insertion is a compare-and-swap on the bucket head.
> >
> > Threading is limited to decoding and the jump pass, so the gain flattens
> > out at 16 threads and any further threads were found to only add overhead.
> >
> > When performing an allmodconfig build, the clang invocation of objtool when
> > processing vmlinux.o took 5.93s on 1 thread, 4.56s on 8, 4.51s on
> > 16 and 4.63s on 128.
> >
> > Therefore cap the thread count at 16 or the number of CPUs, whichever is
> > fewer.
> >
> > The output of objtool before and after this change was confirmed to be
> > byte-for-byte identical for x86_64 defconfig and allmodconfig with gcc and
> > clang, and for a loongarch defconfig, where objtool runs on every object.
> >
> > On a 128-thread machine, objtool on the clang allmodconfig vmlinux.o goes
> > from 5.2s to 4.4s (6.5s to 4.4s together with the previous two patches),
> > and on defconfig from 1.99s to 1.38s.
> >
> > objtool on vmlinux.o is on the serial tail of every build that links
> > vmlinux, no-op builds are unchanged.
> >
> > Whole build, 128-thread Threadripper 9980X, best of N runs:
> >
> >                                          before   after     delta
> >                                          -------------------------------
> >   x86 defconfig, touch mm/vma.c, gcc        8.2s     7.7s    -0.55s (-7%)
> >   x86 defconfig, touch mm/vma.c, clang      7.3s     6.9s    -0.44s (-6%)
> >   x86 defconfig, clean, gcc                28.6s    28.2s    -0.47s (-2%)
> >   x86 defconfig, clean, clang              29.1s    28.7s    -0.45s (-2%)
> >   x86 allmodconfig, touch mm/vma.c, gcc    25.7s    23.7s     -2.0s (-8%)
> >   x86 allmodconfig, touch mm/vma.c, clang  24.1s    22.5s     -1.6s (-7%)
> >
> > Assisted-by: LLM
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  tools/objtool/Makefile  |   2 +-
> >  tools/objtool/check.c   | 717 ++++++++++++++++++++++++++++++++++++------------
> >  tools/objtool/objtool.c |  14 +-
> >  3 files changed, 546 insertions(+), 187 deletions(-)
>
> This is an interesting patch, but I'm not really convinced it's worth
> the pain.

Obviously I defer to you as the maintainer :)

But I think the numbers are pretty significant, certainly for allmodconfig
incremental it's a fairly significant chunk of the improvement.

Yes it's a relatively large-ish change but it's sensible and
straight-forward one and certainly in the direction you'd expect to see
changes in (parallelise things we can do less work where possible).

And note that the work is limited only to those tasks which have
singificant data to process and only if --link is specified, so the scope
is relatively small.

We could add a flag for this also potentially?

Obviously if you feel firmly that this isn't something you want I can also
drop it but I think it is worth having.

One thing to note is that I went through a (bloody painful :) process of
dropping everything that felt like bad RoI which the LLM came up with, it
started at something crazy like 30-35 patches :)

(This was prior to reworking code, checking everything, etc. - gawd the
schloppers have it easy not doing all that! :)

Anyway let me know what makes sense.

>
> --
> Josh

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
