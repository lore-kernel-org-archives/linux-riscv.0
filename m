Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D33C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 02:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GhC4pzzxcfoPMfBhyluxq8wmyPYkIshSnZdM2GTX+Jo=; b=TV1hwY+sFWx+O9UHGlrC493biz
	pV5PrryCqYMlCkEQemr94tXscJfNypE9LzxvnMfXtbhRu47MeUrJBPzN/ytoC/vvPvO2MEcJruQ+1
	HLZKURlX3xFzUoy69C2jhNxqgL3VqJxOTvJXNhKXAfPYO7RzpQDakLjR0tLet7E8WF1Bz9EkCwlTt
	q7kABaD3TntdEOd8iJjV0+jX5eiyuQdFs+jPNn/2gbukN+3enhmfqvSmfQafcIYsg3UDB0qlbUGBW
	hAhAVMB0OD3CpF2+ih+krAXoa3vun1N8AIoreBJ+OHZnMMX6ovHClAbUTat/us+N3vXYPNmJ5Rz8g
	NtH1c/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQCK-00FfYK-6z; Thu, 03 Nov 2022 02:43:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqQCF-00FfX2-Vj
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 02:43:14 +0000
Received: by mail-pl1-x630.google.com with SMTP id p21so637715plr.7
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 19:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=genMKu/rjqrPTEn1YVVQQa+NkKKI8uLP+jPx3EN3/IE=;
        b=3zrD7PUs3/GndBivWvPTyjRg39tfJrQ9N5gcUXHLomPtJB78j8SgaE49nld2hvhf0s
         2UEGhezTmKEboK+hBuoIH6She3Sh/FdM4FtoVy8VdH9NG1tu88SLnmjVEhWx4izuyTzp
         B71rhVmadkgggq5Q2zWY7b4LO62VANTZ8kt6UNoWtuJVOSu/8xsLj+NVf/uUgacuqqIJ
         sBTCGp0XoADS5Km3PGP4vMHPP7G1sIkE3wRDHoKNwsf88k26sZU8Pzx6KGgfqL8uy0nw
         +FZdOwbPVemUCrw+/bGjo2AnXUKZKdcFB/CfZPiszzOm/y0gm4t1XwhiM3C6EBMtFE+g
         mxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=genMKu/rjqrPTEn1YVVQQa+NkKKI8uLP+jPx3EN3/IE=;
        b=CkK+kIklcTQwIsJduiXlb1Se9nUCb0CzyFMKgTB82lE0UwcNvTOFHXEMCYbgCWhGuD
         yi8FirUfsftEdUBfTVQYM+DrpK6rw+EYzhXZju/9eDEUK5OhojlWF6p75gpEPFZz77zW
         /Vvm5mlzZZNGZDLwsa2uGv3Z8TIZg4Ngglj7hayZw/aKn3mnN0qzHlFdeSk6B2W1Bpb0
         GzZdTXJw8MDIQg3eqa/ICo4AfN1wXJ0gPsMzwKc5lgTSc13isdUOBp+DJLGRmoQgoD5M
         1Y9zsEQYQDBFs7lqkHhqutDIJhf2WG2MR1/7Z5/9eIget9AB00yRIO20T5LtQnCBFVQ7
         ClJw==
X-Gm-Message-State: ACrzQf3/g2TfZcSaj/O66ibqiJjlkQ5is1qGdpCklcIW17TbntjX/MTQ
	8kycyZxaDTvf36Wk/27cPpNIHjKChidVuQ==
X-Google-Smtp-Source: AMsMyM4w9eO7Vp9SYEw2OjYPSbKz9hEtCKTk8P35tJa8putmMLH+K+sBEhdXF0aHPHNtswpLPMudGg==
X-Received: by 2002:a17:903:120d:b0:178:a6ca:b974 with SMTP id l13-20020a170903120d00b00178a6cab974mr27695993plh.8.1667443384516;
        Wed, 02 Nov 2022 19:43:04 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jc22-20020a17090325d600b00186b8752a78sm9108001plb.80.2022.11.02.19.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 19:43:03 -0700 (PDT)
Date: Wed, 02 Nov 2022 19:43:03 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Nov 2022 19:43:01 PDT (-0700)
Subject: Re: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
In-Reply-To: <20221027130247.31634-10-ajones@ventanamicro.com>
CC: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, apatel@ventanamicro.com, heiko@sntech.de,
  Conor Dooley <conor.dooley@microchip.com>, Atish Patra <atishp@rivosinc.com>, jszhang@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-4fd71e9d-58b8-4e65-812f-bf0624628de7@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_194312_028356_F6753EA9 
X-CRM114-Status: GOOD (  28.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 27 Oct 2022 06:02:47 PDT (-0700), ajones@ventanamicro.com wrote:
> RISC-V has an optimized memset() which does byte by byte writes up to
> the first sizeof(long) aligned address, then uses Duff's device until
> the last sizeof(long) aligned address, and finally byte by byte to
> the end. When memset is used to zero memory and the Zicboz extension
> is available, then we can extend that by doing the optimized memset
> up to the first Zicboz block size aligned address, then use the
> Zicboz zero instruction for each block to the last block size aligned
> address, and finally the optimized memset to the end.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/lib/memset.S | 81 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 74e4c7feec00..786b85b5e9cc 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -5,6 +5,12 @@
>
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/insn-def.h>
> +#include <asm/hwcap.h>
> +
> +#define ALT_ZICBOZ(old, new)	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZICBOZ, \
> +					    CONFIG_RISCV_ISA_ZICBOZ)
>
>  /* void *memset(void *, int, size_t) */
>  ENTRY(__memset)
> @@ -15,6 +21,58 @@ WEAK(memset)
>  	sltiu	a3, a2, 16
>  	bnez	a3, .Lfinish
>
> +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> +	ALT_ZICBOZ("j .Ldo_memset", "nop")

This at least deserves a comment: the jump is PC-relative, so it'll only 
work if alternative processing happens in a way that ensures these PC 
offsets don't change.  I think this might actually work if all that 
section stuff avoids touching the PC, but that'd need to be written 
down if we're going to depend on it.

That said, this is really just a static_branch implemented differently.  
Can we just use one?

> +	/*
> +	 * t1 will be the Zicboz block size.
> +	 * Zero means we're not using Zicboz, and we don't when a1 != 0
> +	 */
> +	li	t1, 0
> +	bnez	a1, .Ldo_memset
> +	la	a3, riscv_cboz_block_size
> +	lw	t1, 0(a3)
> +
> +	/*
> +	 * Round to nearest Zicboz block-aligned address
> +	 * greater than or equal to the start address.
> +	 */
> +	addi	a3, t1, -1
> +	not	t2, a3			/* t2 is Zicboz block size mask */
> +	add	a3, t0, a3
> +	and	t3, a3, t2		/* t3 is Zicboz block aligned start */
> +
> +	/* Did we go too far or not have at least one block? */
> +	add	a3, a0, a2
> +	and	a3, a3, t2
> +	bgtu	a3, t3, .Ldo_zero
> +	li	t1, 0
> +	j	.Ldo_memset
> +
> +.Ldo_zero:
> +	/* Use Duff for initial bytes if there are any */
> +	bne	t3, t0, .Ldo_memset
> +
> +.Ldo_zero2:
> +	/* Calculate end address */
> +	and	a3, a2, t2
> +	add	a3, t0, a3
> +	sub	a4, a3, t0
> +
> +.Lzero_loop:
> +	CBO_ZERO(t0)
> +	add	t0, t0, t1
> +	bltu	t0, a3, .Lzero_loop
> +	li	t1, 0			/* We're done with Zicboz */
> +
> +	sub	a2, a2, a4		/* Update count */
> +	sltiu	a3, a2, 16
> +	bnez	a3, .Lfinish
> +
> +	/* t0 is Zicboz block size aligned, so it must be SZREG aligned */
> +	j	.Ldo_duff3
> +#endif
> +
> +.Ldo_memset:
>  	/*
>  	 * Round to nearest XLEN-aligned address
>  	 * greater than or equal to the start address.
> @@ -33,6 +91,18 @@ WEAK(memset)
>
>  .Ldo_duff:
>  	/* Duff's device with 32 XLEN stores per iteration */
> +
> +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> +	ALT_ZICBOZ("j .Ldo_duff2", "nop")
> +	beqz	t1, .Ldo_duff2
> +	/* a3, "end", is start of block aligned start. a1 is 0 */
> +	move    a3, t3
> +	sub	a4, a3, t0		/* a4 is SZREG aligned count */
> +	move	t4, a4			/* Save count for later, see below. */
> +	j	.Ldo_duff4
> +#endif
> +
> +.Ldo_duff2:
>  	/* Broadcast value into all bytes */
>  	andi	a1, a1, 0xff
>  	slli	a3, a1, 8
> @@ -44,10 +114,12 @@ WEAK(memset)
>  	or	a1, a3, a1
>  #endif
>
> +.Ldo_duff3:
>  	/* Calculate end address */
>  	andi	a4, a2, ~(SZREG-1)
>  	add	a3, t0, a4
>
> +.Ldo_duff4:
>  	andi	a4, a4, 31*SZREG	/* Calculate remainder */
>  	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
>  	neg	a4, a4
> @@ -100,6 +172,15 @@ WEAK(memset)
>
>  	addi	t0, t0, 32*SZREG
>  	bltu	t0, a3, .Lduff_loop
> +
> +#ifdef CONFIG_RISCV_ISA_ZICBOZ
> +	ALT_ZICBOZ("j .Lcount_update", "nop")
> +	beqz	t1, .Lcount_update
> +	sub	a2, a2, t4		/* Difference was saved above */
> +	j	.Ldo_zero2
> +#endif
> +
> +.Lcount_update:
>  	andi	a2, a2, SZREG-1		/* Update count */
>
>  .Lfinish:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
