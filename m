Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6CBC88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 11:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRCntxC2yxcvWHy2rIl29mYhzIajWhMGX2H2Q5yn5I0=; b=EcdFoPa2sw6F1i
	LyBY+6TBucqOIAe+fCMOZu27VOZF4SYXJoWtRLuop5u6iikdjvHWSoDJZ6wrYFePew5b5HRmorUCA
	JLtgtVNke8l6OkBUwkPCszl+euKM5sgzusiBogRjADRtFRMBpXhTV2NTyGmPLs1XgAChLzfC099VH
	HieeSvDihbYlfeEMtObGM8uug6asTCVJNu79N7TZGp+C9UhTEvBpkUtOPe2P2TkIUq7shvktzGu4r
	E7SV6JYBfRrt1uAMV6ye+RoBPLRqQuWHf4AsQtFL/ETzF6z1Hx7IyGQQs1oli9L/AObPPorZx+fJF
	Gnq2ZewmFxx/uEWBKWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zCt-0000000GTeI-2Bf7;
	Fri, 11 Sep 2026 11:14:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zCr-0000000GTdz-0tIw;
	Fri, 11 Sep 2026 11:14:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B662C4193B;
	Fri, 11 Sep 2026 11:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C7B21F000FF;
	Fri, 11 Sep 2026 11:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125248;
	bh=eEiu+dYbooe4FFdt2OzJ4X3pzYtltDuzxKebV5om8a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ApN9Jd2LSZsZuEwCALwQVmenV2EiisMRIX1KmZ+bpVPAI55c6M3ivFvOuAjGNynP0
	 OhLYDDhy9XUDrYd26JdxA0XHZt6KmCJU6Yxdn/velVaZ8GoDkfazt9Q/7zAYq5JEDZ
	 baIPdR6L+/JOCYMGNnwnw2yvI+RfIB+zXglYQy6aYP1Kt02uqCnGi1uOPY3FULKQpf
	 WwEm2fi4fzE52u1un8rCGKBqEQqqkOrMQ5N7QiWQgN0fTBn0DVdKKFMNsZq0fk3FYO
	 S2BQ0X4N58BZwStf/GCh/OAFe6rWRhriOYn590HCkXaWmu7PvhjzvSDmgdGxrh26Mi
	 nRqTdGWvzhEXg==
Date: Fri, 11 Sep 2026 12:13:54 +0100
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
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
Message-ID: <aqPhbrUQaqpdgFsW@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <178901395286.3971858.10992395592923835285.b4-review@b4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <178901395286.3971858.10992395592923835285.b4-review@b4>
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
> > A typical kernel build consists of a frustratingly large amount of time
> > spent stuck in single-threaded bottlenecks.
> >
> > It turns out that there's a lot we can do about this and doing so
> > significantly impacts kernel build times.
> >
> > This series makes allmodconfig builds up to 36% faster, incremental builds
> > up to ~70% faster, and noop builds up to ~90% faster.
> >
> > Builds are faster across the board on every device I tested.
> >
> > Machines used for perf testing:
> >
> > * Threadripper -   x86, AMD Threadripper 9980X, 64 cores, 128 threads
> > * EPYC         -   x86, 2 socket EPYC 9754, 256 cores, 512 threads
> > * M2           - arm64, 2022 M2 macbook pro, 8 cores, 8 threads
> >                         (4 perf, 4 efficiency)
> >
> > Cutting to the chase:
> >
> > 		== allmodconfig FULL build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)
> > Threadripper, clang     345.5s   265.7s    -79.8s (-23%)
> > EPYC, gcc               188.6s   121.1s    -67.5s (-36%)
> > EPYC, clang             261.7s   184.6s    -77.1s (-29%)
> >
> > 		== allmodconfig INCREMENTAL build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc        46.4s    15.3s    -31.1s (-67%)
> > Threadripper, clang      44.4s    15.2s    -29.1s (-66%)
> > EPYC, gcc                82.0s    24.3s    -57.7s (-70%)
> > EPYC, clang              77.6s    24.3s    -53.3s (-69%)
> >
> > 		== allmodconfig NO-OP build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc       12.97s    1.18s   -11.79s (-91%)
> > Threadripper, clang     13.84s    1.64s   -12.20s (-88%)
> > EPYC, gcc               25.92s    1.52s   -24.40s (-94%)
> > EPYC, clang             27.58s    2.17s   -25.41s (-92%)
> >
> > 		== defconfig FULL build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc        35.3s    28.6s     -6.7s (-19%)
> > Threadripper, clang      33.5s    26.1s     -7.4s (-22%)
> > EPYC, gcc                31.2s    20.6s    -10.6s (-34%)
> > EPYC, clang              38.6s    32.2s     -6.4s (-17%)
> > M2, gcc                 564.0s   512.4s    -51.6s (-9%)
> > M2, clang               616.1s   569.4s    -46.7s (-8%)
> >
> > 		== defconfig INCREMENTAL build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc        11.6s     5.5s     -6.1s (-53%)
> > Threadripper, clang      11.6s     5.0s     -6.6s (-57%)
> > EPYC, gcc                19.3s     9.2s    -10.1s (-52%)
> > EPYC, clang              20.1s     8.6s    -11.5s (-57%)
> > M2, gcc                  18.6s     9.9s     -8.7s (-47%)
> > M2, clang                18.6s     8.2s    -10.4s (-56%)
> >
> > 		== defconfig NO-OP build ==
> >
> >                         before    after     delta
> >                       ----------------------------------
> > Threadripper, gcc        0.96s    0.47s    -0.49s (-51%)
> > Threadripper, clang      1.21s    0.55s    -0.66s (-55%)
> > EPYC, gcc                1.47s    0.66s    -0.81s (-55%)
> > EPYC, clang              1.87s    0.80s    -1.07s (-57%)
> > M2, gcc                  5.59s    1.69s    -3.90s (-70%)
> > M2, clang                6.62s    1.74s    -4.88s (-74%)
> >
> > Further performance numbers are provided for each commit giving a sense of
> > what each contributes to the final result.
> >
> > 			== Testing ==
> >
> > Beyond x86, allmodconfig was built with the series for arm64, arm, riscv,
> > powerpc64, s390 and loongarch, and for arm64, arm, s390 and loongarch the
> > System.map is identical to what the previous shell mksysmap produces for
> > the same vmlinux.
> >
> > Also tested were parisc64 and m68k build as far as mainline lets them
> > (a driver's static assertion and an undefined-symbol check on parisc, gcc
> > 16 internal compiler errors on m68k, none of it from this series).
> >
> > Kernels for x86, arm64, arm, riscv, loongarch, powerpc64, s390, m68k and
> > parisc64 all boot under qemu, every text symbol of System.map is in
> > /proc/kallsyms at the relocated address, and a module loads and unloads.
> > The s390, arm and loongarch kernels also pass the kallsyms selftest.
> >
> > An x86 kernel with CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> > CONFIG_MODULE_SRCVERSION_ALL boots, loads and unloads modules. External
> > modules build against both in-tree and O= builds, and every commit builds
> > on x86 defconfig.
> >
> > Build times are the best of several runs, no unexpected errors or
> > warnings were seen.
> >
> > While some aspects of the build process have been changed, all tooling
> > should function identically to before.
>
> I appreciate all of the testing that you have done! I will test this
> side by side on a couple of my own machines to see what results I get
> but I do like those results.

Ack thanks :)

>
> > 			== LLM usage ==
> >
> > An LLM was used to first determine where the bottlenecks were then to
> > figure out how to improve them.
> >
> > It generated a lot of code, much of it hideous.
> >
> > I extensively audited and rewrote a lot of it, and heavily edited commit
> > messages, the cover letter and comments.x
> >
> > The LLM has also orchestrated build runs, testing, debugging and analysis.
> >
> > I have manually checked for correctness in both build and running kernels
> > generated with this series applied.
> >
> > Performance improvements were also verified manually.
> >
> > Since an LLM was used extensively, each commit carries an Assisted-by tag.
>
> Thank you for calling all of this out as well.

Of course, I am on the receiving end of a flood of LLM patches in mm, so it's
important to me to be transparent and consistent.

I repeatedly tell people - audit what it makes with a human pass, fix up
awful code/comments/commit msgs, make sure you understand it + on you to
make upstreamable + obviously ack that you used it.

So what's good for the goose is good for the gander :)

>
> > 			== What was changed? ==
> >
> > Fundamentally the series improves build times by parallelising
> > single-threaded tasks as much as possible and improving the efficiency of
> > code used in the build process.
> >
> > kbuild, kallsyms, modpost, objtool, mksysmap and the rust build system were
> > all updated as part of this change.
> >
> > Nothing too controversial was included. There are further improvements that
> > could be made, but they would either by very invasive (large scale C header
> > changes) or generate diminishing returns.
> >
> > 			== Patches ==
> >
> >    mksysmap (1, 2):  A couple of bugfixes the rest of the series relies
> >                      upon.
>
> As I note in other threads of this review, I think we should take these
> to Linus now, they seem Obviously CorrectTM and it helps chunk out the
> series.

Ack thanks. I will continue to include them in respins just to enforce the
ordering in the meantime, but it should all come out in the wash I think?

I can add something in the cover letter too about these.

>
> I have just reviewed a few of the low hanging fruit patches. I will try
> to take a look at the rest over the next couple of weeks but I might not
> get to them until after Plumbers. I would greatly appreciate if there
> are others who are more knowledgeable in these areas who could review
> these changes, as I don't know too much about some of the corners of
> Kbuild yet.

Thanks so much for taking a look! I'll be at plumbers so feel free to come
say hi + discuss any of this in person.

And thanks to everybody else reviewing also!

I've replied to the more straightforward stuff, will take a deeper look at
Linus's comments + anything else that needs a deeper think + sashiko
reports a little later before sending a v2.

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
