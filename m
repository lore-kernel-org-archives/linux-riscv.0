Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12882C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 09:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCOHTSOY00rflW+hnIa1tCUP671+77C858TzqDVCLGs=; b=huLiOKpEXhgwoR
	mgdJTopHJDwAjFi7SKFodIsa/X0Q0MKEJHk7KXtwmVBI5Ylpt4hSZWVETdU1UvOKIpy9ymSXFiYAl
	Lry6RtgB+V0MJkmCDPbV8MT1kk085k1a+z6i/iyAmDJehDginAHmiCtUJKtv9nGpTmkdhBmdKTBsZ
	7gUI/7aHqa6qGu4YMU1yvweqh12eD/8vYcMy4EbaEn+f+xINcPRQ6k4a0LEzisSzHc65mkMoEu5jH
	gbsrQBguRI5/+XfBPHfPB34/htTNXoNvdU2+/PEmlVHNVXLTotbnt2k8l2EOOFbX0CZAUpZpVfr7c
	B//NFh5jMpxcbDGXOVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quriN-006ygo-24;
	Mon, 23 Oct 2023 09:59:15 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quriL-006yfA-0C
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 09:59:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-538e8eca9c1so4478240a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698055148; x=1698659948; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2OmZDh8zFkt2im5G0Ax6bYEcMQDHeA27n8h3Y3jQvbM=;
        b=j0WgzuRNJFXSiRrcOefrxAOB0yYIvxnlwhen7JDELw4H5tyY2JIaj7KaefWgjID50T
         gvEqLUBxig6RwgRjSYWal1n6LbOZwCDxThKAI/SVQT5sBR1EI2v96EcX53bhjHPf77GQ
         A6iOsrvsn/mHy+3XQ57ozRFiPTz07pc+jBkzllJmAxdujDFxlXVe+Sh5/YFalr2LNSm5
         q0s5CBdp167z2XHQNMH0xRA0mhkNo1tAi5tIcOI7UClfXBfN+sNIN5cksM9sfx1TjlNK
         DR1hDOi/ZT4X3Tg2DrmyjgNWnOnMiq5JtL4wwn8LWZQFNZl/xxaLR7Fz2D1y5SgqVYOs
         ycvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055148; x=1698659948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2OmZDh8zFkt2im5G0Ax6bYEcMQDHeA27n8h3Y3jQvbM=;
        b=N48mBG1Cpl9J/x01nfmvRkbFb18ohzjTqBL2RQKiaO2ZYRtblhCEyCHMl62LO8i3R3
         bQ9q6sRpjRRoMkUzeQcEZgSfbG1o/k46BF9S0UqyXearsguyc2E2DWvESTrvB0xJfOh6
         Dpui6+cNLvOPVuhDA6WEhuST9DrFb6KqLdTUsFDhsXBl5sXQ2+9LMvDrPm5r7djxrR8Q
         ETSA73niwK4LUDLxX4Lu37+ejGqG9tuA86x03OCuJbV0hga3dpbQ4UwqQLiSCpD4hnjE
         EgTK1CeU4nLZfObY1S88+UYQQ8YUrLg86RTjs/ll1ouZ7drzCcMF5J9AmUI3z5bq2Iae
         PuXg==
X-Gm-Message-State: AOJu0YzqgeMjNh5MlwO3C9V0jaz+RSoeKGuw0YcUsVNZ7W2QMpZX3NDv
	HpQEAXerq0O/OZZZURS7pCec/Q==
X-Google-Smtp-Source: AGHT+IHRYa8NKx/W61EUWyQsjouRtZ7JYz3USclA7m0EOfz/Cuu6SSfbR3giCiKx5DNBdpsLukoaCQ==
X-Received: by 2002:a17:906:6a19:b0:9bd:a165:7822 with SMTP id qw25-20020a1709066a1900b009bda1657822mr7556299ejc.47.1698055148535;
        Mon, 23 Oct 2023 02:59:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906234a00b009b29668fce7sm6355325eja.113.2023.10.23.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:59:08 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:59:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] riscv: Use SYM_*() assembly macros instead of
 deprecated ones
Message-ID: <20231023-136cad6e15a2c5c27b6176af@orel>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004143054.482091-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025913_095415_E8B4DD3E 
X-CRM114-Status: GOOD (  14.57  )
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

On Wed, Oct 04, 2023 at 04:30:51PM +0200, Cl=E9ment L=E9ger wrote:
...
> diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
> index 1930b388c3a0..5130033e3e02 100644
> --- a/arch/riscv/lib/memmove.S
> +++ b/arch/riscv/lib/memmove.S
> @@ -7,7 +7,6 @@
>  #include <asm/asm.h>
>  =

>  SYM_FUNC_START(__memmove)
> -SYM_FUNC_START_WEAK(memmove)
>  	/*
>  	 * Returns
>  	 *   a0 - dest
> @@ -314,5 +313,6 @@ SYM_FUNC_START_WEAK(memmove)
>  =

>  SYM_FUNC_END(memmove)

Should this one above be removed?

>  SYM_FUNC_END(__memmove)
> +SYM_FUNC_ALIAS_WEAK(memmove, __memmove)
>  SYM_FUNC_ALIAS(__pi_memmove, __memmove)
>  SYM_FUNC_ALIAS(__pi___memmove, __memmove)
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 34c5360c6705..35f358e70bdb 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -8,8 +8,7 @@
>  #include <asm/asm.h>
>  =

>  /* void *memset(void *, int, size_t) */
> -ENTRY(__memset)
> -WEAK(memset)
> +SYM_FUNC_START(__memset)
>  	move t0, a0  /* Preserve return value */
>  =

>  	/* Defer to byte-oriented fill for small sizes */
> @@ -110,4 +109,5 @@ WEAK(memset)
>  	bltu t0, a3, 5b
>  6:
>  	ret
> -END(__memset)
> +SYM_FUNC_END(__memset)
> +SYM_FUNC_ALIAS_WEAK(memset, __memset)
> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
> index 09b47ebacf2e..3ab438f30d13 100644
> --- a/arch/riscv/lib/uaccess.S
> +++ b/arch/riscv/lib/uaccess.S
> @@ -10,8 +10,7 @@
>  	_asm_extable	100b, \lbl
>  	.endm
>  =

> -ENTRY(__asm_copy_to_user)
> -ENTRY(__asm_copy_from_user)
> +SYM_FUNC_START(__asm_copy_to_user)
>  =

>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -181,13 +180,13 @@ ENTRY(__asm_copy_from_user)
>  	csrc CSR_STATUS, t6
>  	sub a0, t5, a0
>  	ret
> -ENDPROC(__asm_copy_to_user)
> -ENDPROC(__asm_copy_from_user)
> +SYM_FUNC_END(__asm_copy_to_user)
>  EXPORT_SYMBOL(__asm_copy_to_user)
> +SYM_FUNC_ALIAS(__asm_copy_from_user, __asm_copy_to_user)

IIUC, we'll only have debug information for __asm_copy_to_user. I'm not
sure what that means for debugging. Is it possible to generate something
confusing?

>  EXPORT_SYMBOL(__asm_copy_from_user)
>  =

>  =

> -ENTRY(__clear_user)
> +SYM_FUNC_START(__clear_user)
>  =

>  	/* Enable access to user memory */
>  	li t6, SR_SUM
> @@ -233,5 +232,5 @@ ENTRY(__clear_user)
>  	csrc CSR_STATUS, t6
>  	sub a0, a3, a0
>  	ret
> -ENDPROC(__clear_user)
> +SYM_FUNC_END(__clear_user)
>  EXPORT_SYMBOL(__clear_user)
> diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
> index 0194f4554130..7befa276fb01 100644
> --- a/arch/riscv/purgatory/entry.S
> +++ b/arch/riscv/purgatory/entry.S
> @@ -7,15 +7,11 @@
>   * Author: Li Zhengyu (lizhengyu3@huawei.com)
>   *
>   */
> -
> -.macro	size, sym:req
> -	.size \sym, . - \sym
> -.endm
> +#include <linux/linkage.h>
>  =

>  .text
>  =

> -.globl purgatory_start
> -purgatory_start:
> +SYM_CODE_START(purgatory_start)
>  =

>  	lla	sp, .Lstack
>  	mv	s0, a0	/* The hartid of the current hart */
> @@ -28,8 +24,7 @@ purgatory_start:
>  	mv	a1, s1
>  	ld	a2, riscv_kernel_entry
>  	jr	a2
> -
> -size purgatory_start
> +SYM_CODE_END(purgatory_start)
>  =

>  .align 4
>  	.rept	256
> @@ -39,9 +34,8 @@ size purgatory_start
>  =

>  .data
>  =

> -.globl riscv_kernel_entry
> -riscv_kernel_entry:
> +SYM_DATA_START(riscv_kernel_entry)
>  	.quad	0
> -size riscv_kernel_entry
> +SYM_DATA_END(riscv_kernel_entry)

I think we could also use the shorthand version for this one-liner.

SYM_DATA(riscv_kernel_entry, quad 0)

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
