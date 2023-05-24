Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D2C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzdfOGCItEHF6xZ5U1kQx65Ult52tmK5p0U/LcM8HEY=; b=0jDwwHXJYnNaaI
	xUYQdINfmYtvz9xUoxPNfcDqf3/B1q6KxisJu+tX/dWHOqhwqhjfXK1yvYk0NcfnK/dNE/H3Q61KX
	+EGfPvp4W5WLhmHtwM7kX5nJig/wgWrtbGfxiWqtKumLpuXDXWSxOjbyB/W6TYB29gGJsuSueHFgT
	RBzA2Ilg1dGpQGaVirtVmU7wpOOPlD+pWnKjbGYyFMY3+ubmgNexi0FohuvV0L/H+p5238/pPURND
	brR81NPgjRV/qVSDA1KdKrjA1UK2oKwv+8qU0Fy5fBeEOQRRFcw4MHaAYfJkRTIkDSTOajjaBGX1m
	rj4PIcTDoWD/jQt2tCbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1rvz-00E64b-0w;
	Wed, 24 May 2023 17:05:59 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1rvw-00E63k-1U
	for linux-riscv@lists.infradead.org;
	Wed, 24 May 2023 17:05:58 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-97000a039b2so203629466b.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 May 2023 10:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684947954; x=1687539954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sj3/4obWSDi+Kz/uL4bsulxX0uKEoCOYf42Tr6rYOeM=;
        b=mVjTpwfuXnxNcwIoN9DEFetzFooeBVrm1bYz4SfnJyo1MlgyKxsH1454oVTIfF+Bxd
         gAM10H5svmIO2C2UVTnR6ZzjBWkk6171lGmvwHNCYlHrp+MlcFm0jLZ/ir2LRHCBj0pM
         DBpCX1SL4XHradZ9EwbMAbWVgFg5DQgArDkPG3MkddYLwLigtifn71oxusiaqER5yPdB
         fc+l3KkEe0U5qqS/nKEhcihCFOHzMxi4s6pxQzuXyVis8OecUSC3BIUL9MyojOP9sUwj
         km4mYvBVbH4prQgLvWT/eJdRcQ9D6PnneMkvJDTUK/B0ur3389HTduVsaG9KubclhLKQ
         9gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684947954; x=1687539954;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj3/4obWSDi+Kz/uL4bsulxX0uKEoCOYf42Tr6rYOeM=;
        b=XtxLqZvT+c83MdwSapWdjrGsAtmRzwsk6sjdSFtCooWFpuxBI37pmGR6+exoP8qpy6
         QQRnxFXjhFNGEpXIRNUscKQdsxj0xp7r3F4oPIrAi+cu9csluRaDaK6RHiMrx7u9Opsf
         9sS3C3dyg93+/FgmtOQsg/Ek5vPyFQtP14foLExhVYMIbXA/zPOUv7HhZRchvGdwb8Jd
         cuQKsVk2p7D0qp3AcbBTHmUoshKVlhvLx2pCNJY9wgO2okY0L1qjm2N2bbOD3KIhBinq
         Y77cvSZHnGRyqbLSRRCDi0sxpjYw7PwPNAnDN06nKTqUNLu1h8w8SOUwg7YLVznov1RG
         hkcw==
X-Gm-Message-State: AC+VfDzjXfqd0aiV4A4XSjvbqhXjkkEGZ6UNBRkKkongIEtymc42z4hd
	2iiYxRoPs/nI5/A3wOHyeZINSg==
X-Google-Smtp-Source: ACHHUZ5tpsCIbFzY5JcA4g9NSBsdjZYjjEFwAMT/TfZivq+GPt+iRmvWyZJ7DMMBiXPIPf6hyg6Cig==
X-Received: by 2002:a17:907:97ca:b0:965:f8b7:b0cd with SMTP id js10-20020a17090797ca00b00965f8b7b0cdmr19102780ejc.25.1684947953972;
        Wed, 24 May 2023 10:05:53 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c25-20020a170906155900b0094f282fc29asm5957419ejd.207.2023.05.24.10.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 10:05:53 -0700 (PDT)
Date: Wed, 24 May 2023 19:05:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, christoph.muellner@vrull.eu, 
	David.Laight@aculab.com, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 2/2] riscv: Add Zawrs support for spinlocks
Message-ID: <20230524-35efcabbbfd6a1ef83865fb4@orel>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <20230521114715.955823-3-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521114715.955823-3-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_100556_509309_7C35FD72 
X-CRM114-Status: GOOD (  41.51  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 21, 2023 at 01:47:15PM +0200, Heiko Stuebner wrote:
> From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> =

> The current RISC-V code uses the generic ticket lock implementation,
> that calls the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> Currently, RISC-V uses the generic implementation of these macros.
> This patch introduces a RISC-V specific implementation, of these
> macros, that peels off the first loop iteration

I guess this peeling off of the first iteration is because it's expected
that the load generated by READ_ONCE() is more efficient than lr.w/d? If
we're worried about unnecessary use of lr.w/d, then shouldn't we look
for a solution that doesn't issue those instructions when we don't have
the Zawrs extension?

> and modifies the waiting
> loop such, that it is possible to use the WRS.STO instruction of the Zawrs
> ISA extension to stall the CPU.
> =

> The resulting implementation of smp_cond_load_*() will only work for
> 32-bit or 64-bit types for RV64 and 32-bit types for RV32.
> This is caused by the restrictions of the LR instruction (RISC-V only
> has LR.W and LR.D). Compiler assertions guard this new restriction.
> =

> This patch uses the existing RISC-V ISA extension framework
> to detect the presence of Zawrs at run-time.
> If available a NOP instruction will be replaced by WRS.NTO or WRS.STO.
> =

> The whole mechanism is gated by Kconfig setting, which defaults to Y.
> =

> The Zawrs specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> =

> Signed-off-by: Christoph M=FCllner <christoph.muellner@vrull.eu>
> [rebase, update to review comments]
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/Kconfig                   | 10 +++++
>  arch/riscv/include/asm/barrier.h     | 64 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 14 ++++++
>  arch/riscv/include/asm/hwcap.h       |  1 +
>  arch/riscv/kernel/cpu.c              |  1 +
>  arch/riscv/kernel/cpufeature.c       |  1 +
>  6 files changed, 91 insertions(+)
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 348c0fa1fc8c..60ff303ff58a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -460,6 +460,16 @@ config RISCV_ISA_SVPBMT
>  =

>  	   If you don't know what to do here, say Y.
>  =

> +config RISCV_ISA_ZAWRS
> +	bool "Zawrs extension support"

This should be "Zawrs extension support for ..."

> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the Zawrs extensi=
on
> +	   (wait for reservation set) and enable its usage.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/ba=
rrier.h
> index 110752594228..bd64cfe5ae10 100644
> --- a/arch/riscv/include/asm/barrier.h
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -12,6 +12,8 @@
>  =

>  #ifndef __ASSEMBLY__
>  =

> +#include <asm/errata_list.h>
> +
>  #define nop()		__asm__ __volatile__ ("nop")
>  #define __nops(n)	".rept	" #n "\nnop\n.endr\n"
>  #define nops(n)		__asm__ __volatile__ (__nops(n))
> @@ -44,6 +46,36 @@ do {									\
>  	___p1;								\
>  })
>  =

> +#define ___smp_load_reservedN(pfx, ptr)					\
> +({									\
> +	typeof(*ptr) ___p1;						\
> +	__asm__ __volatile__ ("lr." pfx "	%[p], %[c]\n"		\
> +			      : [p]"=3D&r" (___p1), [c]"+A"(*ptr));	\
> +	___p1;								\
> +})
> +
> +#define __smp_load_reserved_relaxed(ptr)				\
> +({									\
> +	typeof(*ptr) ___p1;						\
> +	if (sizeof(*ptr) =3D=3D sizeof(int))				\
> +		___p1 =3D ___smp_load_reservedN("w", ptr);		\
> +	else if (sizeof(*ptr) =3D=3D sizeof(long))				\
> +		___p1 =3D ___smp_load_reservedN("d", ptr);		\
> +	else								\
> +		compiletime_assert(0,					\
> +			"Need type compatible with LR/SC instructions "	\
> +			"for " __stringify(ptr));			\
> +	___p1;								\

It's more common to use a switch for these things, embedding the
lr.w/d asm in each case, something like the macros in
arch/riscv/include/asm/cmpxchg.h. Can we stick with that pattern?

> +})
> +
> +#define __smp_load_reserved_acquire(ptr)				\
> +({									\
> +	typeof(*ptr) ___p1;						\
> +	___p1 =3D __smp_load_reserved_relaxed(ptr);			\
> +	RISCV_FENCE(r, rw);						\
> +	___p1;								\
> +})
> +
>  /*
>   * This is a very specific barrier: it's currently only used in two plac=
es in
>   * the kernel, both in the scheduler.  See include/linux/spinlock.h for =
the two
> @@ -71,6 +103,38 @@ do {									\
>   */
>  #define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
>  =

> +#define smp_cond_load_relaxed(ptr, cond_expr)				\
> +({									\
> +	typeof(ptr) __PTR =3D (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	VAL =3D READ_ONCE(*__PTR);					\
> +	if (!cond_expr) {						\
> +		for (;;) {						\
> +			VAL =3D __smp_load_reserved_relaxed(__PTR);	\
> +			if (cond_expr)					\
> +				break;					\
> +			ALT_WRS_STO();					\
> +		}							\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})
> +
> +#define smp_cond_load_acquire(ptr, cond_expr)				\
> +({									\
> +	typeof(ptr) __PTR =3D (ptr);					\
> +	__unqual_scalar_typeof(*ptr) VAL;				\
> +	VAL =3D smp_load_acquire(__PTR);					\
> +	if (!cond_expr) {						\
> +		for (;;) {						\
> +			VAL =3D __smp_load_reserved_acquire(__PTR);	\
> +			if (cond_expr)					\
> +				break;					\
> +			ALT_WRS_STO();					\
> +		}							\
> +	}								\
> +	(typeof(*ptr))VAL;						\
> +})
> +
>  #include <asm-generic/barrier.h>
>  =

>  #endif /* __ASSEMBLY__ */
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/as=
m/errata_list.h
> index fb1a810f3d8c..36a72a07d62c 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -44,6 +44,20 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_=
VENDOR_ID,	\
>  		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
>  		: : "r" (addr) : "memory")
>  =

> +#define ZAWRS_WRS_NTO	".long 0x00d00073"
> +#define ALT_WRS_NTO()							\
> +asm volatile(ALTERNATIVE(						\
> +	"nop\n\t",							\
> +	ZAWRS_WRS_NTO "\n\t",						\
> +	0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))

We don't use this. Do we need to define it now?

> +
> +#define ZAWRS_WRS_STO	".long 0x01d00073"

I'd prefer we use insn-def.h to define instructions, rather than scatter
.long's around, but since this instruction doesn't have any inputs, then
I guess it's not so important to use insn-def.h.

> +#define ALT_WRS_STO()							\
> +asm volatile(ALTERNATIVE(						\
> +	"nop\n\t",							\
> +	ZAWRS_WRS_STO "\n\t",						\
> +	0, RISCV_ISA_EXT_ZAWRS, CONFIG_RISCV_ISA_ZAWRS))
> +

These alternatives aren't supporting errata, so putting them in
errata_list.h doesn't seem appropriate. I think cpufeature.h
would be better.

>  /*
>   * _val is marked as "will be overwritten", so need to set it to 0
>   * in the default case.
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e0c40a4c63d5..4233d87539ab 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -46,6 +46,7 @@
>  #define RISCV_ISA_EXT_ZICBOZ		34
>  #define RISCV_ISA_EXT_SMAIA		35
>  #define RISCV_ISA_EXT_SSAIA		36
> +#define RISCV_ISA_EXT_ZAWRS		37
>  =

>  #define RISCV_ISA_EXT_MAX		64
>  #define RISCV_ISA_EXT_NAME_LEN_MAX	32
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index c96aa56cf1c7..ac9c604d8936 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -184,6 +184,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] =3D {
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index b1d6b7e4b829..d4a22a7aed99 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -236,6 +236,7 @@ void __init riscv_fill_hwcap(void)
>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>  				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +				SET_ISA_EXT_MAP("zawrs", RISCV_ISA_EXT_ZAWRS);
>  				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
>  				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>  				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
> -- =

> 2.39.0
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
