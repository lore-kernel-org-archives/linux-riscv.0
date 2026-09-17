Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CAEC982D2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 17:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EiCq5A+C9QGf1UxCabhUkLy0+NZJ4vivNLS2D8nGwHw=; b=wgVQEYDH3/1w1R
	CdB0B51WHh4xVshey+aDd/vfqMXy6tKvQ8/D5ioDKEg7S0OkGl2F6FHm7IxlhqDon302p3cpUHR0k
	52DrOEebHhqwKV4KulQkfts7worY6aGEG0MYWKw0sW1aeGMiyWQKSX13LuKEpEKG0/+S0erBkfG4a
	so8iU+t6mFOtfYJt8FeUiwPFCYEdmZ8ScwtyelEtKq1smCy/0gciQJ8ZoUCtvoH8zIM5qGfHNiW7Q
	tDLkrVtOKtK10svkdgRJrIbMkaqhemI6DtbESedSvIvoLQAMcLCVAkpi7LQCnFb5StmTjn4QaxdSy
	key3ESY7ZuJH26Sqlf5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G7M-0000000C74c-1Pg2;
	Thu, 17 Sep 2026 17:41:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G7K-0000000C73y-3CQz;
	Thu, 17 Sep 2026 17:41:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A94C43B8F;
	Thu, 17 Sep 2026 17:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C33F1F000FF;
	Thu, 17 Sep 2026 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789666910;
	bh=Uh0DnghKUQkR5OlPXn3bepA6xTGTHb5e2CJRGs+0Cdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZQSNhIXjS4Rf6c7O0fzir52Dyukvpz6zlKyqkusDAk6bn/UAXdp+/2ljGiZEmQ8Tk
	 HFXtpxsS2Dwb2xp0bZtHlPuiHBw6g38BAPqNGBUHIUya6ojfFb3bauBjpRJ+bg/Lt8
	 NrcJeHI/6/+bs8BjIVrOeBezFILAX+UaN1gac6ntowyoBgb+3d4/dh4Jo5Qz8Pt1io
	 FciLuu0U3rlvweOipPfcC8NoOKRNA4BY7ESlXQEYrFwZw5wh8TvvEj+A646vXtcxUE
	 ojbFoj8Q9n1P86a3vwz3uDKcBQdxJSx+uhEUw562G5v1J2T1tvuq/63Lse83xvsVZJ
	 bqEnqm9esY7Yw==
Date: Thu, 17 Sep 2026 10:41:50 -0700
From: Kees Cook <kees@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 05/20] kbuild: only emit vmlinux relocations when
 required
Message-ID: <202609171039.A9B14A02A@keescook>
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <20260917-build-speedup-v3-5-9ecf4163ff36@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917-build-speedup-v3-5-9ecf4163ff36@kernel.org>
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

On Thu, Sep 17, 2026 at 05:06:15PM +0100, Lorenzo Stoakes (ARM) wrote:
> A kernel build consists of more than one linking pass on vmlinux.o and
> vmlinux, at minimum two, and with CONFIG_KALLSYMS and BTF enabled on x86-64
> for example there are 5 such stages.
> 
> For architectures that build their own relocation tables (x86, riscv, mips,
> s390), vmlinux is linked with the --emit-relocs parameter specified.
> 
> However, this is only required on the final vmlinux link.
> 
> Symbol tables of trial links preceding it don't need it because they
> already check that System.map matches kallsyms symbols on each build.
> 
> GNU ld is slow at emitting relocation tables, so this results in a
> reduction in build time.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        9.5s     9.1s    -0.42s (-4%)
>   x86 defconfig, clean, gcc                30.1s    29.5s    -0.59s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    37.2s    35.8s     -1.4s (-4%)
> 
> Note that this has little impact on LLVM ld which performs this operation
> more efficiently.
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  Makefile                | 2 +-
>  scripts/link-vmlinux.sh | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 0f1b80100b47..dd4c10afbb7f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1263,7 +1263,7 @@ LDFLAGS_vmlinux += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  endif
>  
>  ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> -LDFLAGS_vmlinux	+= --emit-relocs --discard-none
> +LDFLAGS_vmlinux	+= --discard-none
>  endif

Nit: I think a comment here is worth adding, like in link-vmlinux.sh.
They're separate files, and it's kind of weird that ...NEEDS_RELOCS
doesn't actually add --emit-relocs here unless you go find how
--emit-relocs is used later.

>  
>  # Align the architecture of userspace programs with the kernel
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 970ca10f8fa9..ed5ff97c0667 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -96,6 +96,11 @@ vmlinux_link()
>  		ldflags="${ldflags} ${wl}--strip-debug"
>  	fi
>  
> +	# Only the final link actually requires the relocations.
> +	if [ "${output}" = "${VMLINUX}" ] && is_enabled CONFIG_ARCH_VMLINUX_NEEDS_RELOCS; then
> +		ldflags="${ldflags} ${wl}--emit-relocs"
> +	fi
> +
>  	if [ -n "${generate_map}" ];  then
>  		ldflags="${ldflags} ${wl}-Map=vmlinux.map"
>  	fi

But yeah, otherwise, another "don't generate something that doesn't get
used" improvement. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
