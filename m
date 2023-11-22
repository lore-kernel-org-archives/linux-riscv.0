Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF646C61D92
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1am5IQL/9KwW0ZGGltclXdeF6MLvnzC0iw4SMCB6Hc=; b=elbWhMseesBKx7
	30iBsVEddjvq3oilO8/h+vI7KOrorLjB+PiV+Nr/mzvdo33cIhA/ko/snmfnlfliJss/M+e8Kd8wn
	cBNu1SLstKr1hvW//iWi1bN2QbHnm3Oq/DzbLj1GiRhQbcX+VRULQaNPJOXIeotMDB/dLngljU5Bh
	arNIToVTJEGrO+ZOLuwmmrtOyfYFULPtHTitt5GV05Z1ugEHmlR8Pfoq/O0I17ZygPEEL4kgtWQ4w
	7qPZUPUA/jknG1zqyNEIXTo9oqtDYFU1c/BChRXFzyqbSOc8oGLysN7iZLJW6dgqfyqQeeFWnvGJm
	fwhczzYgDZ0DD5UYAe7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5imj-0015OL-2X;
	Wed, 22 Nov 2023 08:40:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r5imd-0015Nr-35;
	Wed, 22 Nov 2023 08:40:31 +0000
Date: Wed, 22 Nov 2023 00:40:31 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Pan Xinhui <Xinhui.Pan@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <ZV2+f/yu3C6xTVqn@infradead.org>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122030621.3759313-4-samuel.holland@sifive.com>
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

> -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> +	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
> +	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
> +	select DRM_AMD_DC_FP if RISCV && FPU
> +	select DRM_AMD_DC_FP if LOONGARCH || X86

This really is a mess.  Can you add a ARCH_HAS_KERNEL_FPU_SUPPORT
symbol that all architetures that have it select instead, and them
make DRM_AMD_DC_FP depend on it?

> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>  		kernel_fpu_begin();
>  #elif defined(CONFIG_PPC64)
>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> @@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
>  
>  	depth = __this_cpu_dec_return(fpu_recursion_depth);
>  	if (depth == 0) {
> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>  		kernel_fpu_end();
>  #elif defined(CONFIG_PPC64)
>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))

And then this mess can go away.  We'll need to decide if we want to
cover all the in-kernel vector support as part of it, which would
seem reasonable to me, or have a separate generic kernel_vector_begin
with it's own option.

> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> index ea7d60f9a9b4..5c8f840ef323 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
> @@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
>  dml_rcflags := -msoft-float
>  endif
>  
> +ifdef CONFIG_RISCV
> +include $(srctree)/arch/riscv/Makefile.isa
> +# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
> +dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  ifneq ($(call gcc-min-version, 70100),y)
>  IS_OLD_GCC = 1

And this is again not really something we should be doing.
Instead we need a generic way in Kconfig to enable FPU support
for an object file or set of, that the arch support can hook
into.

Btw, I'm also really worried about folks using the FPU instructions
outside the kernel_fpu_begin/end windows in general (not directly
related to the RISC-V support).  Can we have objecttool checks
for that similar to only allowing the unsafe uaccess in the
uaccess begin/end pairs?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
