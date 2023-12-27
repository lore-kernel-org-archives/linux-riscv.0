Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CD8C46CD3
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 01:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AWna5f7VzOKrk189gFZY0UDgE2s6uLzU4J6TY5dnE0=; b=kDbOF4trI7kNT6
	HNMkVaB5CG0vXlq5MR/4o+KS010jce2npp3DC5WdjdhNXPMkbhjX83NF6zrWZ+LTPVf9OHBkFa/pF
	MM9hoL0HOTHqbq2g9pspHG9ZDiRfHxkLJc7wswSFA32eDIKgCxg3nD9odeDyCy1mNpJY2rJPmTlPR
	c5c+0a+a6jXGClMKjUycI6OyVK1hscP3YvXPIC46eE8iz9kneZJmHV88Y4XgxW4LGaEMgWw2s3Vxg
	NR16DFnYOS73ww5tKEmSExerTHzce6hdolFdhUeKrmYPwQsuGKqA+epGtPH9KXXsun0VgQjpLVylj
	enah2dIq9xN4cdfRXEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIIwM-00DmYP-2R;
	Wed, 27 Dec 2023 01:42:34 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIIwJ-00DmXn-0J
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 01:42:32 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b9d8bfe845so3819186b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Dec 2023 17:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703641348; x=1704246148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYwgmiGq7421hbU3Fw6GZtvYYiHuskLqQf5f3TJTBds=;
        b=3ClDx3Tynd/k0vgK7ZoU+23vI1H4ct5+tK1MAmgCsSMhrWUOIrXz0RerkI//cqrS5F
         PM63Fgj6LIR0Mkz/9uvJerqHsFMejbiRpf1H0gqK4K3gNIjgukbazZJfz2N3K825Mhzt
         bMHBn6dqrm8LcNRN0qsJrKavz6YL10Wkjg801EopuwrqlEHESxUYcRn8RISgk2OdiVZc
         XVoMY5HcGLoPkHtn+YergITtzfXP9tkQjYTvBM4F+99u7Gy/xuUBJTrO/Ox0SfqtqtIx
         p1ZG161fAxyzDMBN4arjfTtyhnx+upn8hncC6Caa8fcnjfDYd6N5zxEVFMUoQlcemf0K
         SgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703641348; x=1704246148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYwgmiGq7421hbU3Fw6GZtvYYiHuskLqQf5f3TJTBds=;
        b=HLvuqg+C5iPESOI+TuBnzwlavhNW/GW/ETUZXQIhQv6HV6KzxZ3xPYT+SJ3ooeSxbr
         arC2a/C4ANryWB3tSKYWhrxIy82QS8cb4z5pb3wxg2lvflzQPiDuUDr1GGCTwCvIqKr/
         p8KjE8cOkHlH+nhPK5lEj6denxMyIoirxutVi20/mtU9trM4RTPhefkqa4l/GQ+KJ1vz
         wiCzAUtwWM+UgoCDPgkzhCu6UAZdlqt3PlpuVxWYLDjzoYQslVsMb0opSoyDhK9GGfCm
         evCp5WwAqAYGEAkO6FLtuzOS8ZIQ3ms5u+wzBRjD7H2CnWM3FFvriCT8dQa6v0jhLOa7
         EhSQ==
X-Gm-Message-State: AOJu0Yy85BUF19D6Rpa/kFb0hvjrYKk4bIf3GyiAnPJoNQaqxHdiEINU
	C9vahKAGeZUufnS5XRKZxiA0K/wjhreBZw==
X-Google-Smtp-Source: AGHT+IEXC7mBe9JHuYtIfumDVXpdLpvzH80FWN8L5l6taBNHUMi2u3m7rpYudv1Vo5UWtJGsDajrzQ==
X-Received: by 2002:a05:6808:1b28:b0:3bb:9b57:36da with SMTP id bx40-20020a0568081b2800b003bb9b5736damr6072800oib.81.1703641348308;
        Tue, 26 Dec 2023 17:42:28 -0800 (PST)
Received: from ghost (070-095-050-247.res.spectrum.com. [70.95.50.247])
        by smtp.gmail.com with ESMTPSA id v4-20020a626104000000b006d9c972ec57sm3386122pfb.174.2023.12.26.17.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 17:42:27 -0800 (PST)
Date: Tue, 26 Dec 2023 17:42:25 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, ardb@kernel.org,
	arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de,
	ebiggers@kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [v8, 06/10] riscv: lib: add vectorized mem* routines
Message-ID: <ZYuBAVwjOZ0A8j3J@ghost>
References: <20231223042914.18599-1-andy.chiu@sifive.com>
 <20231223042914.18599-7-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231223042914.18599-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_174231_133088_3CEBE9A7 
X-CRM114-Status: GOOD (  25.84  )
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

On Sat, Dec 23, 2023 at 04:29:10AM +0000, Andy Chiu wrote:
> Provide vectorized memcpy/memset/memmove to accelerate common memory
> operations. Also, group them into V_OPT_TEMPLATE3 macro because their
> setup/tear-down and fallback logics are the same.
> 
> The optimal size for the kernel to preference Vector over scalar,
> riscv_v_mem*_threshold, is only a heuristic for now. We can add DT
> parsing if people feel the need of customizing it.
> 
> The original implementation of Vector operations comes from
> https://github.com/sifive/sifive-libc, which we agree to contribute to
> Linux kernel.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v7:
>  - add __NO_FORTIFY to prevent conflicting function declaration with
>    macro for mem* functions.
> Changelog v6:
>  - provide kconfig to set threshold for vectorized functions (Charlie)
>  - rename *thres to *threshold (Charlie)
> Changelog v4:
>  - new patch since v4
> ---
>  arch/riscv/Kconfig               | 24 ++++++++++++++++
>  arch/riscv/lib/Makefile          |  3 ++
>  arch/riscv/lib/memcpy_vector.S   | 29 +++++++++++++++++++
>  arch/riscv/lib/memmove_vector.S  | 49 ++++++++++++++++++++++++++++++++
>  arch/riscv/lib/memset_vector.S   | 33 +++++++++++++++++++++
>  arch/riscv/lib/riscv_v_helpers.c | 26 +++++++++++++++++
>  6 files changed, 164 insertions(+)
>  create mode 100644 arch/riscv/lib/memcpy_vector.S
>  create mode 100644 arch/riscv/lib/memmove_vector.S
>  create mode 100644 arch/riscv/lib/memset_vector.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 3c5ba05e8a2d..cba53dcc2ae0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -533,6 +533,30 @@ config RISCV_ISA_V_UCOPY_THRESHOLD
>  	  Prefer using vectorized copy_to_user()/copy_from_user() when the
>  	  workload size exceeds this value.
>  
> +config RISCV_ISA_V_MEMSET_THRESHOLD
> +	int "Threshold size for vectorized memset()"
> +	depends on RISCV_ISA_V
> +	default 1280
> +	help
> +	  Prefer using vectorized memset() when the workload size exceeds this
> +	  value.
> +
> +config RISCV_ISA_V_MEMCPY_THRESHOLD
> +	int "Threshold size for vectorized memcpy()"
> +	depends on RISCV_ISA_V
> +	default 768
> +	help
> +	  Prefer using vectorized memcpy() when the workload size exceeds this
> +	  value.
> +
> +config RISCV_ISA_V_MEMMOVE_THRESHOLD
> +	int "Threshold size for vectorized memmove()"
> +	depends on RISCV_ISA_V
> +	default 512
> +	help
> +	  Prefer using vectorized memmove() when the workload size exceeds this
> +	  value.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index c8a6787d5827..d389dbf285fe 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -16,3 +16,6 @@ lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= memset_vector.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= memcpy_vector.o
> +lib-$(CONFIG_RISCV_ISA_V)	+= memmove_vector.o
> diff --git a/arch/riscv/lib/memcpy_vector.S b/arch/riscv/lib/memcpy_vector.S
> new file mode 100644
> index 000000000000..4176b6e0a53c
> --- /dev/null
> +++ b/arch/riscv/lib/memcpy_vector.S
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
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
> +
> +/* void *memcpy(void *, const void *, size_t) */
> +SYM_FUNC_START(__asm_memcpy_vector)
> +	mv pDstPtr, pDst
> +loop:
> +	vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +	vle8.v vData, (pSrc)
> +	sub iNum, iNum, iVL
> +	add pSrc, pSrc, iVL
> +	vse8.v vData, (pDstPtr)
> +	add pDstPtr, pDstPtr, iVL
> +	bnez iNum, loop
> +	ret
> +SYM_FUNC_END(__asm_memcpy_vector)
> diff --git a/arch/riscv/lib/memmove_vector.S b/arch/riscv/lib/memmove_vector.S
> new file mode 100644
> index 000000000000..4cea9d244dc9
> --- /dev/null
> +++ b/arch/riscv/lib/memmove_vector.S
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +#define pDst a0
> +#define pSrc a1
> +#define iNum a2
> +
> +#define iVL a3
> +#define pDstPtr a4
> +#define pSrcBackwardPtr a5
> +#define pDstBackwardPtr a6
> +
> +#define ELEM_LMUL_SETTING m8
> +#define vData v0
> +
> +SYM_FUNC_START(__asm_memmove_vector)
> +
> +    mv pDstPtr, pDst
> +
> +    bgeu pSrc, pDst, forward_copy_loop
> +    add pSrcBackwardPtr, pSrc, iNum
> +    add pDstBackwardPtr, pDst, iNum
> +    bltu pDst, pSrcBackwardPtr, backward_copy_loop
> +
> +forward_copy_loop:
> +    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +
> +    vle8.v vData, (pSrc)
> +    sub iNum, iNum, iVL
> +    add pSrc, pSrc, iVL
> +    vse8.v vData, (pDstPtr)
> +    add pDstPtr, pDstPtr, iVL
> +
> +    bnez iNum, forward_copy_loop
> +    ret
> +
> +backward_copy_loop:
> +    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +
> +    sub pSrcBackwardPtr, pSrcBackwardPtr, iVL
> +    vle8.v vData, (pSrcBackwardPtr)
> +    sub iNum, iNum, iVL
> +    sub pDstBackwardPtr, pDstBackwardPtr, iVL
> +    vse8.v vData, (pDstBackwardPtr)
> +    bnez iNum, backward_copy_loop
> +    ret
> +
> +SYM_FUNC_END(__asm_memmove_vector)
> diff --git a/arch/riscv/lib/memset_vector.S b/arch/riscv/lib/memset_vector.S
> new file mode 100644
> index 000000000000..4611feed72ac
> --- /dev/null
> +++ b/arch/riscv/lib/memset_vector.S
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +#define pDst a0
> +#define iValue a1
> +#define iNum a2
> +
> +#define iVL a3
> +#define iTemp a4
> +#define pDstPtr a5
> +
> +#define ELEM_LMUL_SETTING m8
> +#define vData v0
> +
> +/* void *memset(void *, int, size_t) */
> +SYM_FUNC_START(__asm_memset_vector)
> +
> +    mv pDstPtr, pDst
> +
> +    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +    vmv.v.x vData, iValue
> +
> +loop:
> +    vse8.v vData, (pDstPtr)
> +    sub iNum, iNum, iVL
> +    add pDstPtr, pDstPtr, iVL
> +    vsetvli iVL, iNum, e8, ELEM_LMUL_SETTING, ta, ma
> +    bnez iNum, loop
> +
> +    ret
> +
> +SYM_FUNC_END(__asm_memset_vector)
> diff --git a/arch/riscv/lib/riscv_v_helpers.c b/arch/riscv/lib/riscv_v_helpers.c
> index 6cac8f4e69e9..c62f333ba557 100644
> --- a/arch/riscv/lib/riscv_v_helpers.c
> +++ b/arch/riscv/lib/riscv_v_helpers.c
> @@ -3,9 +3,13 @@
>   * Copyright (C) 2023 SiFive
>   * Author: Andy Chiu <andy.chiu@sifive.com>
>   */
> +#ifndef __NO_FORTIFY
> +# define __NO_FORTIFY
> +#endif
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  
> +#include <asm/string.h>
>  #include <asm/vector.h>
>  #include <asm/simd.h>
>  
> @@ -42,3 +46,25 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
>  	return fallback_scalar_usercopy(dst, src, n);
>  }
>  #endif
> +
> +#define V_OPT_TEMPLATE3(prefix, type_r, type_0, type_1)				\
> +extern type_r __asm_##prefix##_vector(type_0, type_1, size_t n);		\
> +type_r prefix(type_0 a0, type_1 a1, size_t n)					\
> +{										\
> +	type_r ret;								\
> +	if (has_vector() && may_use_simd() &&					\
> +	    n > riscv_v_##prefix##_threshold) {					\
> +		kernel_vector_begin();						\
> +		ret = __asm_##prefix##_vector(a0, a1, n);			\
> +		kernel_vector_end();						\
> +		return ret;							\
> +	}									\
> +	return __##prefix(a0, a1, n);						\
> +}
> +
> +static size_t riscv_v_memset_threshold = CONFIG_RISCV_ISA_V_MEMSET_THRESHOLD;
> +V_OPT_TEMPLATE3(memset, void *, void*, int)
> +static size_t riscv_v_memcpy_threshold = CONFIG_RISCV_ISA_V_MEMCPY_THRESHOLD;
> +V_OPT_TEMPLATE3(memcpy, void *, void*, const void *)
> +static size_t riscv_v_memmove_threshold = CONFIG_RISCV_ISA_V_MEMMOVE_THRESHOLD;
> +V_OPT_TEMPLATE3(memmove, void *, void*, const void *)
> -- 
> 2.17.1
> 

Thank you for adding the kconfigs for the thresholds.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
