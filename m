Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E381C46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 01:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWVrNeAmU2nqCl+WM2TtuGoYsz17ZI1/GnU/fX+Ys2U=; b=ij/PkI5s81xtV+
	Q3Gax4dejGrtGHd0aVKgsKl51wcs6o2ziNaCfPGqTaFkF+Nl6PCcgnPfiAY98tZBGx4vZLKHALU8F
	ICm4R3oN9Gtgwqh7cL2qvl2dNTZUdy7C38qo96lQH2eCNQCYZQ3FBQXcTXolYGDsAc2zhvNVmWlrm
	xFI1hZJ7NmlHoVijNaDsgs6n3UY/P3whZILGKtLxVd4St4q2ph+rDXOT1f07MDGmhhW1moj+rdzH+
	WDBImbr1lJr+DoXna/YgvQG9Xd6mY88rD0L1+4DIBFocaN1dL+InAOUnkN5aMqyRe+p/fQnQFLWfI
	537dHV3tR4iE1y+rwv5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIIhh-00Dll3-0m;
	Wed, 27 Dec 2023 01:27:25 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIIhd-00DlkO-11
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 01:27:23 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5918f11099dso3117714eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 17:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703640439; x=1704245239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDtbpOMdL5+N77GB2ANFSKQ+wRh75+kxKbBjKg9eMzs=;
        b=BVWu1yQoH+GCMeQKUC9KQxWUpxlpnBVD1ypWjuAuX7VwBJW0U3k82r57+hARFzsajK
         jm3Gp5Rb5vyvQlfkqO6Q8TAdqqziXtKCBPPATrA805/7xgFY8lYGLNZVy6MGp1JAlqfQ
         tCnX59AGAZxm3e/vM8aISJjpGYcVqihwCb0vYtKY9dma5u92bWrF+VofOGFkhGkA6GUm
         8OMFPU2duhfFGhKP1eFe7GRL7lg+KasKKz1tjOuPVBpRdw737Hen7Xoi5xW91eh/5sik
         Pe7eeUDkuZOcUp0c4Bmo4gZcKVJB7eFLaiSUCXRyV1dRnYDLfkefuYWPXtVMHIf9x4b1
         SW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703640439; x=1704245239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDtbpOMdL5+N77GB2ANFSKQ+wRh75+kxKbBjKg9eMzs=;
        b=ESPMeoh7EmNNoxgO9ZhwevQs4zZhWVDhbbxfLP6rWRHNFuQ3u1rV3JNkU5HIA3RvVb
         6PyiEUfApTQg6a0W/JsXiw/zkVGisnvFW8mPNhFceQ/pYObsIvDhXMac0d8NorRo7i5X
         E6bItUBoavTcsWbyJYXRcrsX8RfPY0PeqRyiNXd622Xllmirc99lNFYsZNm0qY5CHjF0
         z1Kc+JM0j4utf88hD8HRHnN7Ncg5kAPaO1LlcGERsD7BHlhZKs75pmLDRDjMCBy2ujiF
         xVlafQ3y31mj0KnYLQxvGMAmrzumPXAlr4zbwuFXeztDqR1ju95PdYgs2Nr3CvCus7dl
         ZdVg==
X-Gm-Message-State: AOJu0YwR/N/q7Rhm4qdWuVDASXkbe8201lesBw4ceGI+Wp7bn55vaWzI
	t5nL7I/537lYvyhYjAUFUgCX1f5zGlV8Dg==
X-Google-Smtp-Source: AGHT+IFa8BpqK4HGTFZl+gM6p5bieFSqzE3CVB3+xeXaWFPrRiZoVZVKbyW4vZhQHLAV+44qziLMHg==
X-Received: by 2002:a05:6870:4192:b0:204:60fd:8112 with SMTP id y18-20020a056870419200b0020460fd8112mr4548488oac.14.1703640439457;
        Tue, 26 Dec 2023 17:27:19 -0800 (PST)
Received: from ghost (070-095-050-247.res.spectrum.com. [70.95.50.247])
        by smtp.gmail.com with ESMTPSA id v1-20020a056870954100b00203d8ce415bsm2949431oal.50.2023.12.26.17.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 17:27:19 -0800 (PST)
Date: Tue, 26 Dec 2023 17:27:15 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, ardb@kernel.org,
	arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de,
	ebiggers@kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>, Bo YU <tsu.yubo@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Subject: Re: [v8, 05/10] riscv: lib: vectorize copy_to_user/copy_from_user
Message-ID: <ZYt9cxrVImrA+Yoq@ghost>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
 <20231223042914.18599-6-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223042914.18599-6-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_172721_658878_AE5B60CC 
X-CRM114-Status: GOOD (  35.73  )
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

On Sat, Dec 23, 2023 at 04:29:09AM +0000, Andy Chiu wrote:
> This patch utilizes Vector to perform copy_to_user/copy_from_user. If
> Vector is available and the size of copy is large enough for Vector to
> perform better than scalar, then direct the kernel to do Vector copies
> for userspace. Though the best programming practice for users is to
> reduce the copy, this provides a faster variant when copies are
> inevitable.
> 
> The optimal size for using Vector, copy_to_user_thres, is only a
> heuristic for now. We can add DT parsing if people feel the need of
> customizing it.
> 
> The exception fixup code of the __asm_vector_usercopy must fallback to
> the scalar one because accessing user pages might fault, and must be
> sleepable. Current kernel-mode Vector does not allow tasks to be
> preemptible, so we must disactivate Vector and perform a scalar fallback
> in such case.
> 
> The original implementation of Vector operations comes from
> https://github.com/sifive/sifive-libc, which we agree to contribute to
> Linux kernel.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v8:
>  - fix no-mmu build
> Changelog v6:
>  - Add a kconfig entry to configure threshold values (Charlie)
>  - Refine assembly code (Charlie)
> Changelog v4:
>  - new patch since v4
> ---
>  arch/riscv/Kconfig                      |  8 ++++
>  arch/riscv/include/asm/asm-prototypes.h |  4 ++
>  arch/riscv/lib/Makefile                 |  6 ++-
>  arch/riscv/lib/riscv_v_helpers.c        | 44 ++++++++++++++++++++++
>  arch/riscv/lib/uaccess.S                | 10 +++++
>  arch/riscv/lib/uaccess_vector.S         | 50 +++++++++++++++++++++++++
>  6 files changed, 121 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/lib/riscv_v_helpers.c
>  create mode 100644 arch/riscv/lib/uaccess_vector.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..3c5ba05e8a2d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -525,6 +525,14 @@ config RISCV_ISA_V_DEFAULT_ENABLE
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_UCOPY_THRESHOLD
> +	int "Threshold size for vectorized user copies"
> +	depends on RISCV_ISA_V
> +	default 768
> +	help
> +	  Prefer using vectorized copy_to_user()/copy_from_user() when the
> +	  workload size exceeds this value.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
> index 6db1a9bbff4c..be438932f321 100644
> --- a/arch/riscv/include/asm/asm-prototypes.h
> +++ b/arch/riscv/include/asm/asm-prototypes.h
> @@ -11,6 +11,10 @@ long long __ashlti3(long long a, int b);
>  
>  #ifdef CONFIG_RISCV_ISA_V
>  
> +#ifdef CONFIG_MMU
> +asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n);
> +#endif /* CONFIG_MMU  */
> +
>  void xor_regs_2_(unsigned long bytes, unsigned long *__restrict p1,
>  		 const unsigned long *__restrict p2);
>  void xor_regs_3_(unsigned long bytes, unsigned long *__restrict p1,
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 494f9cd1a00c..c8a6787d5827 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -6,9 +6,13 @@ lib-y			+= memmove.o
>  lib-y			+= strcmp.o
>  lib-y			+= strlen.o
>  lib-y			+= strncmp.o
> -lib-$(CONFIG_MMU)	+= uaccess.o
> +ifeq ($(CONFIG_MMU), y)
> +lib-y				+= uaccess.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
> +endif
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>  
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
> diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
> new file mode 100644
> index 000000000000..6cac8f4e69e9
> --- /dev/null
> +++ b/arch/riscv/lib/riscv_v_helpers.c
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 SiFive
> + * Author: Andy Chiu <andy.chiu@sifive.com>
> + */
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +#include <asm/vector.h>
> +#include <asm/simd.h>
> +
> +#ifdef CONFIG_MMU
> +#include <asm/asm-prototypes.h>
> +#endif
> +
> +#ifdef CONFIG_MMU
> +size_t riscv_v_usercopy_threshold = CONFIG_RISCV_ISA_V_UCOPY_THRESHOLD;
> +int __asm_vector_usercopy(void *dst, void *src, size_t n);
> +int fallback_scalar_usercopy(void *dst, void *src, size_t n);
> +asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
> +{
> +	size_t remain, copied;
> +
> +	/* skip has_vector() check because it has been done by the asm  */
> +	if (!may_use_simd())
> +		goto fallback;
> +
> +	kernel_vector_begin();
> +	remain = __asm_vector_usercopy(dst, src, n);
> +	kernel_vector_end();
> +
> +	if (remain) {
> +		copied = n - remain;
> +		dst += copied;
> +		src += copied;
> +		goto fallback;
> +	}
> +
> +	return remain;
> +
> +fallback:
> +	return fallback_scalar_usercopy(dst, src, n);
> +}
> +#endif
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 3ab438f30d13..a1e4a3c42925 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -3,6 +3,8 @@
>  #include <asm/asm.h>
>  #include <asm/asm-extable.h>
>  #include <asm/csr.h>
> +#include <asm/hwcap.h>
> +#include <asm/alternative-macros.h>
>  
>  	.macro fixup op reg addr lbl
>  100:
> @@ -11,6 +13,13 @@
>  	.endm
>  
>  SYM_FUNC_START(__asm_copy_to_user)
> +#ifdef CONFIG_RISCV_ISA_V
> +	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)
> +	REG_L	t0, riscv_v_usercopy_threshold
> +	bltu	a2, t0, fallback_scalar_usercopy
> +	tail enter_vector_usercopy
> +#endif
> +SYM_FUNC_START(fallback_scalar_usercopy)
>  
>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -181,6 +190,7 @@ SYM_FUNC_START(__asm_copy_to_user)
>  	sub a0, t5, a0
>  	ret
>  SYM_FUNC_END(__asm_copy_to_user)
> +SYM_FUNC_END(fallback_scalar_usercopy)
>  EXPORT_SYMBOL(__asm_copy_to_user)
>  SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
>  EXPORT_SYMBOL(__asm_copy_from_user)
> diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
> new file mode 100644
> index 000000000000..7bd96cee39e4
> --- /dev/null
> +++ b/arch/riscv/lib/uaccess_vector.S
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm-generic/export.h>
> +#include <asm/asm.h>
> +#include <asm/asm-extable.h>
> +#include <asm/csr.h>
> +
> +#define pDst a0
> +#define pSrc a1
> +#define iNum a2
> +
> +#define iVL a3
> +
> +#define ELEM_LMUL_SETTING m8
> +#define vData v0
> +
> +	.macro fixup op reg addr lbl
> +100:
> +	\op \reg, \addr
> +	_asm_extable	100b, \lbl
> +	.endm
> +
> +SYM_FUNC_START(__asm_vector_usercopy)
> +	/* Enable access to user memory */
> +	li t6, SR_SUM
> +	csrs CSR_STATUS, t6
> +
> +loop:
> +	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +	fixup vle8.v vData, (pSrc), 10f
> +	fixup vse8.v vData, (pDst), 10f
> +	sub iNum, iNum, iVL
> +	add pSrc, pSrc, iVL
> +	add pDst, pDst, iVL
> +	bnez iNum, loop
> +
> +.Lout_copy_user:
> +	/* Disable access to user memory */
> +	csrc CSR_STATUS, t6
> +	li	a0, 0

It appears that iNum will always equal 0 at this line. Can this section
be eliminated and handled by the following fixup code or is there a
reason to keep them separate?

- Charlie

> +	ret
> +
> +	/* Exception fixup code */
> +10:
> +	/* Disable access to user memory */
> +	csrc	CSR_STATUS, t6
> +	mv	a0, iNum
> +	ret
> +SYM_FUNC_END(__asm_vector_usercopy)
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
