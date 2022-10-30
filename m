Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2919DC38A02
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwcaYnBJIZftsOdF5FQ+JUp9zl/AezzqGvcB95xKfOM=; b=ZdL4bD2UKVTAG9
	RKVwnrp1ex6F4WUBMlAm6FPpoy3vKVc/7y380ymCnqyF5WHWqWS9aRkwaGr1nTj/qEuWT8Wq5STio
	iKJfxlPO20NyctsYrYgu4g147TYVfa+jMenJo5T1lN1nCF330P+sEBpbbQ3QkSshmc0PhU/VpC92x
	xEROdU04Zfu4XqWOPZCJiirt/6RhrVFRMqBEX9fkT8+AwCyS/80MNjKe8YuD2NjQRYv0m2RhTabmK
	JTgVTHuPrSPqQ6v153x+Oo5H4ctIfqk5/OTOC0jCqB5MfePRBe0FfOS/TqYjNKp2/iHMl9yd6He+2
	+w3RkIgV5BZ//heqSiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFqR-003ML4-LI; Sun, 30 Oct 2022 21:27:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFqO-003MJO-O0; Sun, 30 Oct 2022 21:27:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D53060F43;
	Sun, 30 Oct 2022 21:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58400C433D6;
	Sun, 30 Oct 2022 21:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667165267;
	bh=hHbxadVCC4B5v6Tjj8NIRTHFDpbNIcgDjHduURyEaoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spO/tKyKEaBCHSdhQSjF/JUGYXyS2dMvy7NrHqsdvf1DXNo/p7zYptzFTEPtbXppY
	 Z0NKNg9vDeIh/r5t7kw3gMXTeuRRB2zjzjZyZRHXm4KQofQWoOHaEDSt+RkHX9qGS1
	 CxtL1pzlgmUTNqWC2isfwB5WBZ9UZ8gknsm/iQ4cSdpNW7QaKDfOa6vZetah3o1W4H
	 TC/dqFnMbpMBwGqXo3rK/evoSu/h7gBIF4YUcaDMunW7SuzddTpU59z18D6ouZ/t7Q
	 KRlrkqDJNRh8VqB5ZT9+ptIFJDB06tTe3FYEA6r8H0Evdt8tVjUhWPCJUlSaoDwt/n
	 A+xCf104jotAA==
Date: Sun, 30 Oct 2022 21:27:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 7/9] RISC-V: lib: Improve memset assembler formatting
Message-ID: <Y17sTkBtemXU0Uc/@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-8-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-8-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_142748_882073_3D6F135D 
X-CRM114-Status: GOOD (  22.95  )
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

On Thu, Oct 27, 2022 at 03:02:45PM +0200, Andrew Jones wrote:
> Aligning the first operand of each instructions with a tab is a
> typical style which improves readability. Apply it to memset.S.
> While there, we also make a small grammar change to a comment.
> 
> No functional change intended.

Cool, nice cleanup :)
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thanks,
Conor.

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/lib/memset.S | 143 ++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 71 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index 34c5360c6705..e613c5c27998 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -3,111 +3,112 @@
>   * Copyright (C) 2013 Regents of the University of California
>   */
>  
> -
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
>  
>  /* void *memset(void *, int, size_t) */
>  ENTRY(__memset)
>  WEAK(memset)
> -	move t0, a0  /* Preserve return value */
> +	move	t0, a0			/* Preserve return value */
>  
>  	/* Defer to byte-oriented fill for small sizes */
> -	sltiu a3, a2, 16
> -	bnez a3, 4f
> +	sltiu	a3, a2, 16
> +	bnez	a3, 4f
>  
>  	/*
>  	 * Round to nearest XLEN-aligned address
> -	 * greater than or equal to start address
> +	 * greater than or equal to the start address.
>  	 */
> -	addi a3, t0, SZREG-1
> -	andi a3, a3, ~(SZREG-1)
> -	beq a3, t0, 2f  /* Skip if already aligned */
> +	addi	a3, t0, SZREG-1
> +	andi	a3, a3, ~(SZREG-1)
> +	beq	a3, t0, 2f		/* Skip if already aligned */
> +
>  	/* Handle initial misalignment */
> -	sub a4, a3, t0
> +	sub	a4, a3, t0
>  1:
> -	sb a1, 0(t0)
> -	addi t0, t0, 1
> -	bltu t0, a3, 1b
> -	sub a2, a2, a4  /* Update count */
> +	sb	a1, 0(t0)
> +	addi	t0, t0, 1
> +	bltu	t0, a3, 1b
> +	sub	a2, a2, a4		/* Update count */
>  
>  2: /* Duff's device with 32 XLEN stores per iteration */
>  	/* Broadcast value into all bytes */
> -	andi a1, a1, 0xff
> -	slli a3, a1, 8
> -	or a1, a3, a1
> -	slli a3, a1, 16
> -	or a1, a3, a1
> +	andi	a1, a1, 0xff
> +	slli	a3, a1, 8
> +	or	a1, a3, a1
> +	slli	a3, a1, 16
> +	or	a1, a3, a1
>  #ifdef CONFIG_64BIT
> -	slli a3, a1, 32
> -	or a1, a3, a1
> +	slli	a3, a1, 32
> +	or	a1, a3, a1
>  #endif
>  
>  	/* Calculate end address */
> -	andi a4, a2, ~(SZREG-1)
> -	add a3, t0, a4
> +	andi	a4, a2, ~(SZREG-1)
> +	add	a3, t0, a4
>  
> -	andi a4, a4, 31*SZREG  /* Calculate remainder */
> -	beqz a4, 3f            /* Shortcut if no remainder */
> -	neg a4, a4
> -	addi a4, a4, 32*SZREG  /* Calculate initial offset */
> +	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> +	beqz	a4, 3f			/* Shortcut if no remainder */
> +	neg	a4, a4
> +	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
>  
>  	/* Adjust start address with offset */
> -	sub t0, t0, a4
> +	sub	t0, t0, a4
>  
>  	/* Jump into loop body */
>  	/* Assumes 32-bit instruction lengths */
> -	la a5, 3f
> +	la	a5, 3f
>  #ifdef CONFIG_64BIT
> -	srli a4, a4, 1
> +	srli	a4, a4, 1
>  #endif
> -	add a5, a5, a4
> -	jr a5
> +	add	a5, a5, a4
> +	jr	a5
>  3:
> -	REG_S a1,        0(t0)
> -	REG_S a1,    SZREG(t0)
> -	REG_S a1,  2*SZREG(t0)
> -	REG_S a1,  3*SZREG(t0)
> -	REG_S a1,  4*SZREG(t0)
> -	REG_S a1,  5*SZREG(t0)
> -	REG_S a1,  6*SZREG(t0)
> -	REG_S a1,  7*SZREG(t0)
> -	REG_S a1,  8*SZREG(t0)
> -	REG_S a1,  9*SZREG(t0)
> -	REG_S a1, 10*SZREG(t0)
> -	REG_S a1, 11*SZREG(t0)
> -	REG_S a1, 12*SZREG(t0)
> -	REG_S a1, 13*SZREG(t0)
> -	REG_S a1, 14*SZREG(t0)
> -	REG_S a1, 15*SZREG(t0)
> -	REG_S a1, 16*SZREG(t0)
> -	REG_S a1, 17*SZREG(t0)
> -	REG_S a1, 18*SZREG(t0)
> -	REG_S a1, 19*SZREG(t0)
> -	REG_S a1, 20*SZREG(t0)
> -	REG_S a1, 21*SZREG(t0)
> -	REG_S a1, 22*SZREG(t0)
> -	REG_S a1, 23*SZREG(t0)
> -	REG_S a1, 24*SZREG(t0)
> -	REG_S a1, 25*SZREG(t0)
> -	REG_S a1, 26*SZREG(t0)
> -	REG_S a1, 27*SZREG(t0)
> -	REG_S a1, 28*SZREG(t0)
> -	REG_S a1, 29*SZREG(t0)
> -	REG_S a1, 30*SZREG(t0)
> -	REG_S a1, 31*SZREG(t0)
> -	addi t0, t0, 32*SZREG
> -	bltu t0, a3, 3b
> -	andi a2, a2, SZREG-1  /* Update count */
> +	REG_S	a1,        0(t0)
> +	REG_S	a1,    SZREG(t0)
> +	REG_S	a1,  2*SZREG(t0)
> +	REG_S	a1,  3*SZREG(t0)
> +	REG_S	a1,  4*SZREG(t0)
> +	REG_S	a1,  5*SZREG(t0)
> +	REG_S	a1,  6*SZREG(t0)
> +	REG_S	a1,  7*SZREG(t0)
> +	REG_S	a1,  8*SZREG(t0)
> +	REG_S	a1,  9*SZREG(t0)
> +	REG_S	a1, 10*SZREG(t0)
> +	REG_S	a1, 11*SZREG(t0)
> +	REG_S	a1, 12*SZREG(t0)
> +	REG_S	a1, 13*SZREG(t0)
> +	REG_S	a1, 14*SZREG(t0)
> +	REG_S	a1, 15*SZREG(t0)
> +	REG_S	a1, 16*SZREG(t0)
> +	REG_S	a1, 17*SZREG(t0)
> +	REG_S	a1, 18*SZREG(t0)
> +	REG_S	a1, 19*SZREG(t0)
> +	REG_S	a1, 20*SZREG(t0)
> +	REG_S	a1, 21*SZREG(t0)
> +	REG_S	a1, 22*SZREG(t0)
> +	REG_S	a1, 23*SZREG(t0)
> +	REG_S	a1, 24*SZREG(t0)
> +	REG_S	a1, 25*SZREG(t0)
> +	REG_S	a1, 26*SZREG(t0)
> +	REG_S	a1, 27*SZREG(t0)
> +	REG_S	a1, 28*SZREG(t0)
> +	REG_S	a1, 29*SZREG(t0)
> +	REG_S	a1, 30*SZREG(t0)
> +	REG_S	a1, 31*SZREG(t0)
> +
> +	addi	t0, t0, 32*SZREG
> +	bltu	t0, a3, 3b
> +	andi	a2, a2, SZREG-1		/* Update count */
>  
>  4:
>  	/* Handle trailing misalignment */
> -	beqz a2, 6f
> -	add a3, t0, a2
> +	beqz	a2, 6f
> +	add	a3, t0, a2
>  5:
> -	sb a1, 0(t0)
> -	addi t0, t0, 1
> -	bltu t0, a3, 5b
> +	sb	a1, 0(t0)
> +	addi	t0, t0, 1
> +	bltu	t0, a3, 5b
>  6:
>  	ret
>  END(__memset)
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
