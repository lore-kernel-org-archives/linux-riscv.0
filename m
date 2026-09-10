Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539C4C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 04:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TsfyU8MYAT2mvWYLYWxkEd0HPTBg/ItoylPT7KfnLOs=; b=gCgc5w9lPDHd/u
	mnqcPxFb8TD37fek5NMeZcrK92F878gJ9vXkYkFp9nZBUg/yVKZtAfJBq4O5wabgC6GFhwHI7sjmZ
	ACVM2WqelipFZquQ4TA4OoIV3RMwzRj6FTsue01ifCoHbB7rJ8OJpYUyj04eeBqNZrOPT7Qxmnzie
	MmdUDOk5L37y70rl6B8dG4Y/fMrn1SjxrCV3VpG0hv5PoJbAcYh2WC275Ij6uFuHhSLgwN59Nu5Ll
	WyNe+c8mTuYqRoBcuPM700XYvzkkveMwrpUaVfOJHa+jYFMkLM0VZCr1elAiS2wABOTm94cVbaWl/
	3p8DEf0u/KQVGaJCDwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGP-0000000DLi7-3PRy;
	Thu, 10 Sep 2026 04:19:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WGO-0000000DLhw-0OKi;
	Thu, 10 Sep 2026 04:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D84AE4038F;
	Thu, 10 Sep 2026 04:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68AFF1F00893;
	Thu, 10 Sep 2026 04:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789013990;
	bh=Aoi7a+3WGl9CNODLL1/W4K0SdnGMJudXan1R4lUIjtk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CVPdJjw83eUFJISLERNXzrNmyhsl0ErTlof4MjCPoVTXA0zzWVN/6SWWEcqb3jxfV
	 B+6fobIJE9dNLqvW2u56pDh19LNzIXJ0Dxifq+OpAFDzVwmmxSPGTq4IHBTrnUzB8r
	 o630OqQLfyZbxUoE08QQlWCCWsbNiNqMwKLHBJYHmAu65vQ4i6z2Uv6Znpcd7Jj2w8
	 eI6EHd6hQLrsRr5Kqx5540qzYxchQgVY5ma/oNpo0muIe3BQYy1lNIlDak1/ui+ZCV
	 0PVFUFOadjazcL9BxCIs9KgUILx24pBuTJpMUyIPpPlCD4D43J8yOyu4UXzABgXPrZ
	 dsEAQtc8ZMS6A==
MIME-Version: 1.0
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:19:12 -0700
Message-Id: <178901395286.3971858.10992395592923835285.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7031; i=nathan@kernel.org;
 h=from:subject:message-id; bh=HRFN1L75iygYN0nJ/ENZdhVHG78m4oGJxQBTk8H2ZwE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmL9I9Jz3jq4cq9rM5zeaqc1pRtTQoZhxcp7i3geXRYc
 cW1/2rcHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiDEcZ/temr4tQzrp77+AD
 KZnLEod7uZY+a1fUT/jSoe2654SJWAAjQ4eyhHTCg8uJGw2THi6aeCFutsi5zbs+mT7tnG587R7
 jIj4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

> A typical kernel build consists of a frustratingly large amount of time
> spent stuck in single-threaded bottlenecks.
> 
> It turns out that there's a lot we can do about this and doing so
> significantly impacts kernel build times.
> 
> This series makes allmodconfig builds up to 36% faster, incremental builds
> up to ~70% faster, and noop builds up to ~90% faster.
> 
> Builds are faster across the board on every device I tested.
> 
> Machines used for perf testing:
> 
> * Threadripper -   x86, AMD Threadripper 9980X, 64 cores, 128 threads
> * EPYC         -   x86, 2 socket EPYC 9754, 256 cores, 512 threads
> * M2           - arm64, 2022 M2 macbook pro, 8 cores, 8 threads
>                         (4 perf, 4 efficiency)
> 
> Cutting to the chase:
> 
> 		== allmodconfig FULL build ==
> 
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       345.3s   275.2s    -70.1s (-20%)
> Threadripper, clang     345.5s   265.7s    -79.8s (-23%)
> EPYC, gcc               188.6s   121.1s    -67.5s (-36%)
> EPYC, clang             261.7s   184.6s    -77.1s (-29%)
> 
> 		== allmodconfig INCREMENTAL build ==
> 
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        46.4s    15.3s    -31.1s (-67%)
> Threadripper, clang      44.4s    15.2s    -29.1s (-66%)
> EPYC, gcc                82.0s    24.3s    -57.7s (-70%)
> EPYC, clang              77.6s    24.3s    -53.3s (-69%)
> 
> 		== allmodconfig NO-OP build ==
> 
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc       12.97s    1.18s   -11.79s (-91%)
> Threadripper, clang     13.84s    1.64s   -12.20s (-88%)
> EPYC, gcc               25.92s    1.52s   -24.40s (-94%)
> EPYC, clang             27.58s    2.17s   -25.41s (-92%)
> 
> 		== defconfig FULL build ==
> 
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        35.3s    28.6s     -6.7s (-19%)
> Threadripper, clang      33.5s    26.1s     -7.4s (-22%)
> EPYC, gcc                31.2s    20.6s    -10.6s (-34%)
> EPYC, clang              38.6s    32.2s     -6.4s (-17%)
> M2, gcc                 564.0s   512.4s    -51.6s (-9%)
> M2, clang               616.1s   569.4s    -46.7s (-8%)
> 
> 		== defconfig INCREMENTAL build ==
> 
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        11.6s     5.5s     -6.1s (-53%)
> Threadripper, clang      11.6s     5.0s     -6.6s (-57%)
> EPYC, gcc                19.3s     9.2s    -10.1s (-52%)
> EPYC, clang              20.1s     8.6s    -11.5s (-57%)
> M2, gcc                  18.6s     9.9s     -8.7s (-47%)
> M2, clang                18.6s     8.2s    -10.4s (-56%)
> 
> 		== defconfig NO-OP build ==
> 
>                         before    after     delta
>                       ----------------------------------
> Threadripper, gcc        0.96s    0.47s    -0.49s (-51%)
> Threadripper, clang      1.21s    0.55s    -0.66s (-55%)
> EPYC, gcc                1.47s    0.66s    -0.81s (-55%)
> EPYC, clang              1.87s    0.80s    -1.07s (-57%)
> M2, gcc                  5.59s    1.69s    -3.90s (-70%)
> M2, clang                6.62s    1.74s    -4.88s (-74%)
> 
> Further performance numbers are provided for each commit giving a sense of
> what each contributes to the final result.
> 
> 			== Testing ==
> 
> Beyond x86, allmodconfig was built with the series for arm64, arm, riscv,
> powerpc64, s390 and loongarch, and for arm64, arm, s390 and loongarch the
> System.map is identical to what the previous shell mksysmap produces for
> the same vmlinux.
> 
> Also tested were parisc64 and m68k build as far as mainline lets them
> (a driver's static assertion and an undefined-symbol check on parisc, gcc
> 16 internal compiler errors on m68k, none of it from this series).
> 
> Kernels for x86, arm64, arm, riscv, loongarch, powerpc64, s390, m68k and
> parisc64 all boot under qemu, every text symbol of System.map is in
> /proc/kallsyms at the relocated address, and a module loads and unloads.
> The s390, arm and loongarch kernels also pass the kallsyms selftest.
> 
> An x86 kernel with CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> CONFIG_MODULE_SRCVERSION_ALL boots, loads and unloads modules. External
> modules build against both in-tree and O= builds, and every commit builds
> on x86 defconfig.
> 
> Build times are the best of several runs, no unexpected errors or
> warnings were seen.
> 
> While some aspects of the build process have been changed, all tooling
> should function identically to before.

I appreciate all of the testing that you have done! I will test this
side by side on a couple of my own machines to see what results I get
but I do like those results.

> 			== LLM usage ==
> 
> An LLM was used to first determine where the bottlenecks were then to
> figure out how to improve them.
> 
> It generated a lot of code, much of it hideous.
> 
> I extensively audited and rewrote a lot of it, and heavily edited commit
> messages, the cover letter and comments.x
> 
> The LLM has also orchestrated build runs, testing, debugging and analysis.
> 
> I have manually checked for correctness in both build and running kernels
> generated with this series applied.
> 
> Performance improvements were also verified manually.
> 
> Since an LLM was used extensively, each commit carries an Assisted-by tag.

Thank you for calling all of this out as well.

> 			== What was changed? ==
> 
> Fundamentally the series improves build times by parallelising
> single-threaded tasks as much as possible and improving the efficiency of
> code used in the build process.
> 
> kbuild, kallsyms, modpost, objtool, mksysmap and the rust build system were
> all updated as part of this change.
> 
> Nothing too controversial was included. There are further improvements that
> could be made, but they would either by very invasive (large scale C header
> changes) or generate diminishing returns.
> 
> 			== Patches ==
> 
>    mksysmap (1, 2):  A couple of bugfixes the rest of the series relies
>                      upon.

As I note in other threads of this review, I think we should take these
to Linus now, they seem Obviously CorrectTM and it helps chunk out the
series.

I have just reviewed a few of the low hanging fruit patches. I will try
to take a look at the rest over the next couple of weeks but I might not
get to them until after Plumbers. I would greatly appreciate if there
are others who are more knowledgeable in these areas who could review
these changes, as I don't know too much about some of the corners of
Kbuild yet.

-- 
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
