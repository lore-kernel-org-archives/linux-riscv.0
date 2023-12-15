Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8695FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 06:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLy6j7MJcTxF9Aqars+WS29c2TVEtFo9qQmXRiZNFhs=; b=3nLhMiJmMsTvIa
	xjtk0fBhWkgA/F4aQlHR8FjTwOcUNduS17DKZ44V1rGcmKcX+Uxw5oJyc+6C1zQBgvchKCaZR/RjF
	AMh5iUk7aq/DUWky3siu6zUEb+C1Z9mrg4aiohN8fIl9ZDOFVUJ27bpDff2UoAPgQwfTUjE/f3Jjo
	nQp83Rmck1Supm0fFR6amuMd0y0EHCoEQcU5b8P367s+7s0TStmxoe7E1D/toQJrhuH02selVqvMU
	PAx9S3LTElCLvAhPUCTFpzCV2A615TT0Kx0E4C3Lr65c9L7p/3Sbf1fK79YazHFcbg/ZgzBcfvKv2
	+B7pV/B5A64xh4eFDlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1e3-002BSt-2B;
	Fri, 15 Dec 2023 06:25:59 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1e1-002BSP-0b
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 06:25:59 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6da2e360861so607842a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 22:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702621553; x=1703226353; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wuXBaeVrHc7OV9XwrCuRv2hZbg0gExZatTNdba8ubaU=;
        b=SEQdyRMJVNuskukbGe4l831qsIrp/DOmh/m6mV/5hA1drvZG2wryc9PkCx2U6uri8/
         qVvMzjejpsLCzrX2BHaPigwCRa3MBMbBJS4xe70N6tAsDZ7HiWwFevQcrw62TEq+qBM4
         y8KsN3QBLM8Pb3ZuqY8SLsQKLaG/ew49+weNzl9scVPFZVC7yAKcq8YVklVaUCKOioC+
         gq7KOCuJ7HmLNaGFEScpLgiuIElY09vS0/R1ARYZkK7NVqGl6mHFtkicSlogXCSZ+TPg
         QN+kiufWbDhEXuU4v37VMmJB34I6NN2MwSpOhLBfhAB6x8dvAEGXD6dZ4PQqOfWrLkY5
         ujdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702621553; x=1703226353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuXBaeVrHc7OV9XwrCuRv2hZbg0gExZatTNdba8ubaU=;
        b=m2ZwyKeUUlQmTEpsHbGiEWICVVdehcWhBrkoe8vxU9U6SNA87K8e8VXXbtfMlpkSUf
         032H/FxgjAITt2i8CE/Ju4u96iYRks6yL+3a9PZ95Q32F8E8VxPQuV8JnEIqLc7iJnQb
         iLTI5yMJdCqKgU0kaaXxy/1TzQMA8JYZDWi04QpusbmIsT1lrJ99wt1dbt8+t7MKtas5
         oIB5Ffy9HTXSo6wSFZbFrWhBroT84eeG6zB7kr3XHsYQOt3St9ckp1Mk2AKRvnHVZ8G7
         hqr0k4+nHLdb1ZAnzy1FGlyqjyKghhscC7wg1BGE3Yj9tq/QR/tKVat4K+QF6dQG6wkN
         jqqg==
X-Gm-Message-State: AOJu0YxPuTKpqrnk5Tgo6KSfLQ67EPzkdFxBzlL6Uo+SSDNK/4F0NsrX
	D8kdELw1MFLZ+EVU/hFBeIArbQ==
X-Google-Smtp-Source: AGHT+IG7LFuX+mkoXj2GyVetzE/ryNamPtQqGREnLnRZI68v7owE68kU5qe9TXmWPsC61Wmym7LDpA==
X-Received: by 2002:a05:6830:68c7:b0:6d9:d87c:35f6 with SMTP id cw7-20020a05683068c700b006d9d87c35f6mr4639859otb.22.1702621552964;
        Thu, 14 Dec 2023 22:25:52 -0800 (PST)
Received: from ghost ([2601:642:4c00:261c:91c3:e862:22d2:ad26])
        by smtp.gmail.com with ESMTPSA id c9-20020a056830000900b006d87b167c41sm3483143otp.8.2023.12.14.22.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 22:25:52 -0800 (PST)
Date: Thu, 14 Dec 2023 22:25:49 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org,
	ardb@kernel.org, arnd@arndb.de,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Aurelien Jarno <aurelien@aurel32.net>, Bo YU <tsu.yubo@gmail.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Subject: Re: [v5, 5/6] riscv: lib: vectorize copy_to_user/copy_from_user
Message-ID: <ZXvxbbBWXqIy/05b@ghost>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
 <20231214155721.1753-6-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214155721.1753-6-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_222557_224986_240E79D9 
X-CRM114-Status: GOOD (  36.18  )
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

On Thu, Dec 14, 2023 at 03:57:20PM +0000, Andy Chiu wrote:
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
> Changelog v4:
>  - new patch since v4
> ---
>  arch/riscv/lib/Makefile          |  2 ++
>  arch/riscv/lib/riscv_v_helpers.c | 38 ++++++++++++++++++++++
>  arch/riscv/lib/uaccess.S         | 11 +++++++
>  arch/riscv/lib/uaccess_vector.S  | 55 ++++++++++++++++++++++++++++++++
>  4 files changed, 106 insertions(+)
>  create mode 100644 arch/riscv/lib/riscv_v_helpers.c
>  create mode 100644 arch/riscv/lib/uaccess_vector.S
> 
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 494f9cd1a00c..1fe8d797e0f2 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -12,3 +12,5 @@ lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>  
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
> diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
> new file mode 100644
> index 000000000000..d763b9c69fb7
> --- /dev/null
> +++ b/arch/riscv/lib/riscv_v_helpers.c
> @@ -0,0 +1,38 @@
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
> +size_t riscv_v_usercopy_thres = 768;
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
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 3ab438f30d13..ae8c1453cfcf 100644
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
> @@ -11,6 +13,14 @@
>  	.endm
>  
>  SYM_FUNC_START(__asm_copy_to_user)
> +#ifdef CONFIG_RISCV_ISA_V
> +	ALTERNATIVE("j fallback_scalar_usercopy", "nop", 0, RISCV_ISA_EXT_v, CONFIG_RISCV_ISA_V)

has_vector uses riscv_has_extension_unlikely, but this is the equivalent
of riscv_has_extension_likely. It seems like this should be consistent
across all call sites. Since has_vector uses the unlikely version, this
should probably be rearranged so that the nop is in the non-vector
version and the jump is for the vector version.

A neat optimization you can do here is replace the "nop" with the
instruction that will be executed first. With how it's written right now
you could replace the nop with the la instruction. It's just a nop so
the performance difference is probably not going to be noticable but
it's theoretically better without the nop. The downside of doing this is
that it seems like alternatives do not work with macros so you couldn't
replace the nop with a REG_L instruction, unless there is some trick to
make it work.

> +	la	t0, riscv_v_usercopy_thres
> +	REG_L	t0, (t0)

The assembler does something really silly here it seems. With both
binutils 2.41 and clang 18 the following is generated:

6:   00000297                auipc   t0,0x0
a:   00028293                mv      t0,t0
e:   0002b283                ld      t0,0(t0) # 6 <__asm_copy_from_user+0x4>

However, this la is not needed. You can replace the la + REG_L with just
a REG_L as follows:

REG_L   t0, riscv_v_usercopy_thres

This then generates the following code:

6:   00000297                auipc   t0,0x0
a:   0002b283                ld      t0,0(t0) # 6 <__asm_copy_from_user+0x4>

> +	bltu	a2, t0, fallback_scalar_usercopy
> +	tail enter_vector_usercopy
> +#endif
> +SYM_FUNC_START(fallback_scalar_usercopy)
>  
>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -181,6 +191,7 @@ SYM_FUNC_START(__asm_copy_to_user)
>  	sub a0, t5, a0
>  	ret
>  SYM_FUNC_END(__asm_copy_to_user)
> +SYM_FUNC_END(fallback_scalar_usercopy)
>  EXPORT_SYMBOL(__asm_copy_to_user)
>  SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)
>  EXPORT_SYMBOL(__asm_copy_from_user)
> diff --git a/arch/riscv/lib/uaccess_vector.S b/arch/riscv/lib/uaccess_vector.S
> new file mode 100644
> index 000000000000..5bebcb1276a2
> --- /dev/null
> +++ b/arch/riscv/lib/uaccess_vector.S
> @@ -0,0 +1,55 @@
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
> +#define pDstPtr a4
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
> +	/* Save for return value */
> +	mv	t5, a2

What's the point of this?

> +
> +	mv pDstPtr, pDst

Why do this move? pDst isn't used anywhere else so you can safely
continue to use pDst everywhere that pDstPtr is used.

- Charlie

> +loop:
> +	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +	fixup vle8.v vData, (pSrc), 10f
> +	fixup vse8.v vData, (pDstPtr), 10f
> +	sub iNum, iNum, iVL
> +	add pSrc, pSrc, iVL
> +	add pDstPtr, pDstPtr, iVL
> +	bnez iNum, loop
> +
> +.Lout_copy_user:
> +	/* Disable access to user memory */
> +	csrc CSR_STATUS, t6
> +	li	a0, 0
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
