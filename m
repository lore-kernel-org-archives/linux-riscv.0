Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA52C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 19:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdIiFDN56RzcP0SoVmbOpFzshQwCsczFgvyFb2b7/Cs=; b=whU83vHAbxL/lu
	N31yJKD9ggQ3Kr2I9upZfmO6HWa09LAmx87dNpCPdH/7TSWtVdtUk7pSHVOCRJHpyxs8MaECxc4Cu
	uTI3NdVAbGnK48WxKxPhnr+K41Aqn5fGVuQZfvYeslm5nUAckpE2v9BDoSIQRAE5yjqnlyLYAaGTw
	o/Z7A7ymZw9AyJTrACTY7D2JeY1KFYuTsxCnFbprC/PRpmFtbRsM+7yxOq0BJKI1CPkymnHtmAhRh
	E5aBVEoU8Lk4V64wnBQquqiRL1Yiq+2iuUOPFfVinpWrRTJsUM2cu0MZsESvygqM3qnr/Wy2+XwSA
	rnJDwCGqwwgTaxV4sWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEJ7-004Oef-0q;
	Fri, 15 Dec 2023 19:57:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEEJ4-004Odz-0L
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 19:57:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so723292b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 11:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702670225; x=1703275025; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nB4xL1M1m2QJSdBQsW9FzDRCdkQQxzJkwayQCZN5FG4=;
        b=fC8geT2aLJL1iROGxMA2tQk2bycXTVoBrBTYvtJ0QjDnu1GF6KTmwfKyYxoUi1LEOE
         7wWzBEMheARPQAfNt3iRyxdiXooXn0mxAI3Pfl3EriRB+ilNBLw3m0Z90ZVCAjzWnoIR
         /vuQ/CWhUquIfE0r49/7R7jIf/TYiJD+Q4oSnYTzb2Tph8FmLPltvQWSjnkYoz8o7rOW
         gkbSg+ICjHo0g8PZMG96tt6OOABxFP2F3JhErU+5blbGZb6pawrB8sKxRGlWe+X8kccF
         l5SQ0kKgbYqoNJytQq9DiXRV5Ser7EwDhTlofJUF47noXGVzx2T5XIRL6BvPcsOLnkAw
         wLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702670225; x=1703275025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB4xL1M1m2QJSdBQsW9FzDRCdkQQxzJkwayQCZN5FG4=;
        b=aEPwtu40B4ONBYc9ZSDVRTEa0W0bL7EQQbVhwr0R0l2eG3duF3s+g7H4R/fnCg/f1L
         z/pxfjypJzEKldLp0yX3McnkF8yQwY6RRvBLf/cjLFqCzl6IYNdieSQIvtaLk74ejmLr
         Hxu6PyHkjpk7LIQjQ4VuYNwbpS/EAjXNLj5fx4cIc+iI3cOWi+4rd4pKnSvhIwAYm+mD
         D0NCrgI7T0dTMFJDJQ1dOp0DaODOo8llVPZt6Xu/kWryzt4m016z0Am54KYkxSCIGTID
         2Mm69rt0PdZvQl+EEz5/EXmeKMh3txaV4OugUSGzXpaWQMK/DIEn/SER36fOzmeAXNUY
         jZQw==
X-Gm-Message-State: AOJu0Yw66Skli7QH2XmzdFOWcUm+4XgOwmk6WQjmenVPG7Hqe67kuWXB
	+raeyoS36iy5j41MYI5ZN1orXuPV9PR8k/KQurY=
X-Google-Smtp-Source: AGHT+IFz3xCkn8cDDxJfwaSjZUm+9cjcJXOlJ8XXOyfwk55XeC74iVlvaSBICn8ec2ALKQClTlz8SA==
X-Received: by 2002:a05:6a20:12c7:b0:18f:97c:4f38 with SMTP id v7-20020a056a2012c700b0018f097c4f38mr7192646pzg.68.1702670225336;
        Fri, 15 Dec 2023 11:57:05 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001d076ebf328sm14648157plr.8.2023.12.15.11.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 11:57:04 -0800 (PST)
Date: Fri, 15 Dec 2023 11:56:52 -0800
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
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [v5, 6/6] riscv: lib: add vectorized mem* routines
Message-ID: <ZXyvhJuPM+xpzbe3@ghost>
References: <20231214155721.1753-1-andy.chiu@sifive.com>
 <20231214155721.1753-7-andy.chiu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214155721.1753-7-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_115710_359442_A8CEB60E 
X-CRM114-Status: GOOD (  23.76  )
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

On Thu, Dec 14, 2023 at 03:57:21PM +0000, Andy Chiu wrote:
> Provide vectorized memcpy/memset/memmove to accelerate common memory
> operations. Also, group them into V_OPT_TEMPLATE3 macro because their
> setup/tear-down and fallback logics are the same.
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
>  arch/riscv/lib/Makefile          |  3 ++
>  arch/riscv/lib/memcpy_vector.S   | 29 +++++++++++++++++++
>  arch/riscv/lib/memmove_vector.S  | 49 ++++++++++++++++++++++++++++++++
>  arch/riscv/lib/memset_vector.S   | 33 +++++++++++++++++++++
>  arch/riscv/lib/riscv_v_helpers.c | 21 ++++++++++++++
>  5 files changed, 135 insertions(+)
>  create mode 100644 arch/riscv/lib/memcpy_vector.S
>  create mode 100644 arch/riscv/lib/memmove_vector.S
>  create mode 100644 arch/riscv/lib/memset_vector.S
> 
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 1fe8d797e0f2..3111863afd2e 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -14,3 +14,6 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
>  lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
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
> index d763b9c69fb7..12e8c5deb013 100644
> --- a/arch/riscv/lib/riscv_v_helpers.c
> +++ b/arch/riscv/lib/riscv_v_helpers.c
> @@ -36,3 +36,24 @@ asmlinkage int enter_vector_usercopy(void *dst, void *src, size_t n)
>  fallback:
>  	return fallback_scalar_usercopy(dst, src, n);
>  }
> +
> +#define V_OPT_TEMPLATE3(prefix, type_r, type_0, type_1)				\
> +extern type_r __asm_##prefix##_vector(type_0, type_1, size_t n);		\
> +type_r prefix(type_0 a0, type_1 a1, size_t n)					\
> +{										\
> +	type_r ret;								\
> +	if (has_vector() && may_use_simd() && n > riscv_v_##prefix##_thres) {	\

I forgot to bring it up on the other patch, but the phrase "thres" is
not intuitive to me. I think spelling threshold out is better, or using
"thresh" instead would make this much more clear.

> +		kernel_vector_begin();						\
> +		ret = __asm_##prefix##_vector(a0, a1, n);			\
> +		kernel_vector_end();						\
> +		return ret;							\
> +	}									\
> +	return __##prefix(a0, a1, n);						\
> +}
> +
> +static size_t riscv_v_memset_thres = 1280;
> +V_OPT_TEMPLATE3(memset, void *, void*, int)
> +static size_t riscv_v_memcpy_thres = 768;
> +V_OPT_TEMPLATE3(memcpy, void *, void*, const void *)
> +static size_t riscv_v_memmove_thres = 512;

How were these values selected? I would imagine that this could be
different for different vector hardware and it might be valuable to make
these the default values but allow a kconfig option to change it.

- Charlie

> +V_OPT_TEMPLATE3(memmove, void *, void*, const void *)
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
