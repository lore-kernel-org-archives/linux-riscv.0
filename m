Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A021AC79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 04:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp6BlHUawkMo1ViO1cXjbSLEE7d1BoBBXXWwd94nYP0=; b=XZb7OXQPWxUOHd
	whCiKMG7cjDwEgpLj3IICn1pQ96sXWUe/RBfB7Apm0vZc9RpkDsjn/KaD8OO0jZB+EZ48ZEkEnPsP
	/OBVVEFBkj/QFmvfQDvBel6BHCN/3UU8zHgW/rWe/nMqltJBlMh/8mViDgh0oRXJYcYTn+TaRYFzb
	Fp12J/BrBMDS1FVuXJmD4SVU5F+SCWnmyVKmV3LxRhdne5fxfuzWl1E4vvemjV2Kag0j42162uA1t
	qUmVPPu7+JU5IVvBbGdq6Q0Uqs+CqHPQ9WaklwV0qMLV620YDXO+YXOi4D98EjyPnGUldF13stTr3
	umwXtNUKEYQ6r0Ki5FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WHV-0000000DM9f-32N3;
	Thu, 10 Sep 2026 04:21:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WHU-0000000DM8F-0VLm;
	Thu, 10 Sep 2026 04:21:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86FBB601EF;
	Thu, 10 Sep 2026 04:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21F11F00899;
	Thu, 10 Sep 2026 04:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789014059;
	bh=cMnHIsMT3Av8PvHpH9hpF6YHkNFuphcbfvagp11LhEI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LOau81+Dv/xKL32e2arFIbHaGoSgQpb+AI2gkMiaJCJaeihtQd5swFCINh0NS/fXY
	 27Kt0zTV6Qx+rt+tNM7e3LiacUYitVE3VbDUYt4fK3CxkqLOWV8xMZnj9b0EZaaydq
	 x0ITEU+kRT6oChGTaf5tWJyEVskqbznIU/K9ReMlsMJoT3+t8D3HQePN+NPTwG2FxI
	 UlvQCa33hH+CiLDyMyotExom0wtrjvND/SnFBGLN8IV1HUDxDHY5+PXIS4qVzJlL8i
	 oScYkSwU5i3KJoGevo7zXbKO++vOgA/m63IBuYnGKTZQPikQrdB4KNGx3nNtljAEQZ
	 HAum+WwKel+ig==
MIME-Version: 1.0
Subject: Re: [PATCH 23/23] kbuild: use pigz for gzip compression if
 available
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
In-Reply-To: <20260908-build-speedup-v1-23-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-23-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:19:12 -0700
Message-Id: <178901395293.3971858.15429964442902485180.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2892; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Q9fpS3QOis8VywAZ/qxPoy8tzjaMXYquN4IKUkvKQhc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmL9I9/nfxO72ppzjS5mYt/nszesc/yM3fFVJtNm524b
 /7wEcje1VHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmEsnAyPDvwIes2Wk3VQ7X
 VDzfe5qnb6OioMqiD+w2Ts4O2huWrlBj+Gf3oltEibvv7B0LRkems/f6hV3mWe7U3JB5ZYXFtSs
 /DzEAAA==
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

> The gzip step of a kernel build is very lengthily, especially for larger
> builds such as allmodconfig.
> 
> gzip itself cannot be run in parallel, however an alternative tool exists
> that can, providing the same feature set as gzip itself - pigz - which
> works as a drop-in replacement.
> 
> On a 128-core Threadripper, gzip -9 of a 36 MiB x86-64 vmlinux.bin takes
> 1.6s, and with pigz it takes 0.09s, so the performance increase is
> significant.
> 
> It is already possible to specify the KGZIP environmental variable to make
> use of pigz, however it seems sensible to make use of pigz if it is
> available.
> 
> Therefore default to using pigz if it is available on the system upon which
> the kernel is being built, otherwise fall back to gzip.
> 
> The output is byte-for-byte identical between pigz/gzip invocations, but
> gzip and pigz do not produce the same stream as one another.
> 
> Therefore, for reproducible builds, the same set of tools should be used.
> 
> This seems to already be an implicit requirement in any case, but update
> the reproducible build documentation to make this clear.
> 
> Also update the kbuild documentation to reflect the change.
> 
> Every x86 build ends with the compression of vmlinux.bin, 36MB for
> defconfig and over 200MB for allmodconfig, no-op builds are unchanged.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        7.4s     5.4s     -2.0s (-27%)
>   x86 defconfig, touch mm/vma.c, clang      6.6s     4.9s     -1.7s (-26%)
>   x86 defconfig, clean, gcc                26.2s    24.4s     -1.8s (-7%)
>   x86 defconfig, clean, clang              25.8s    24.3s     -1.5s (-6%)
>   x86 allmodconfig, touch mm/vma.c, gcc    23.7s    15.3s     -8.4s (-35%)
>   x86 allmodconfig, touch mm/vma.c, clang  22.1s    15.2s     -6.9s (-31%)
>   x86 allmodconfig, clean, gcc            291.4s   275.2s     -16.2s (-6%)
>   x86 allmodconfig, clean, clang          278.3s   265.7s     -12.6s (-5%)
> 
> Link: https://zlib.net/pigz/
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
...
> diff --git a/Makefile b/Makefile
> index a0d29dee81d7..efa6a2d77e6b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -561,7 +561,7 @@ PERL		= perl
>  PYTHON3		= python3
>  CHECK		= sparse
>  BASH		= bash
> -KGZIP		= gzip
> +KGZIP		:= $(if $(shell command -v pigz 2>/dev/null),pigz,gzip)

This should be '?=', right? Sashiko also notes a concern around parallel
module installation with gzip module compression since there is no
thread limitation, which could bring a little risk to doing this by
default? Might not be that big of a deal though?

-- 
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
