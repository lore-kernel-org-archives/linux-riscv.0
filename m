Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690BBECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG3f5R/f8U9dv96FW9WDOq+7v/lGD1fjoxcZaKESSic=; b=V+/JLpQXLYjNPX
	hj0hWHJMyUoNY55Xf5MPVvwo6COAP31m3S89hgHkiUTWgir9fJai+JV9PmyuSbZKBg101yEkCmGL4
	BZ4aXg0LavyKQty+/EwbgCsMujaAsMN37nQlz+gjvgHontChHPj7X06B36EuWMAt49VuyaY85mZ58
	4ygISdywi+N6TdyCxZbPHfz6oJBk5V2/SqTNMRbqNHjd5KfWeNBcztFL0ut+vJnyoWEx6rYP0WQB+
	cXTUMJeSV2oEYaWj6ygbTOjar4MvUsJ6/mMuQtLv9KOo0G0vtUtZvmU+IlktNp2uLQIhqsabvzTEO
	Hb0Hm8FxXBrLL7IVvAbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGaz-003nd0-FR; Sun, 30 Oct 2022 22:15:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGav-003naQ-O9; Sun, 30 Oct 2022 22:15:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CACF9B8106C;
	Sun, 30 Oct 2022 22:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A67C433C1;
	Sun, 30 Oct 2022 22:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667168148;
	bh=cjpWdniuTBwif95kyi3xkYS8GdSiLzkW4WEnDty1q84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nD7DhJ377MMZwDkG3AUaxUbB5mOsI95kw5B22kTNkLwFpWXXiuu0S1jtLid52GkXx
	 0G7Ipva34GNu4YSwnwx6IRfK1jqlj88sqAIxiu7U/hEwegtta7rJtJFGKPu05wuPPY
	 PTGkotachsILNlVREYCiJ0uMLxCtI1CzJStJjHSNuxnz9Gvwp39UgKh7laVePZkvXQ
	 1TQ2lNDCtKcexCuvg3pxm5+rGsXNjSWH+ofQN1QK/qfiYk8p7H8tW1/Jh96Wp0AJu4
	 PInRRiv4ZOOb8l+kVP0e0X8nrC0WgOTEbPWTaIKMtdacR0NEFTYm5RlQTsAUiFPES+
	 KW9FxJdk0sX7Q==
Date: Sun, 30 Oct 2022 22:15:43 +0000
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
Subject: Re: [PATCH 8/9] RISC-V: lib: Use named labels in memset
Message-ID: <Y173j6+YaxpLgf4E@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-9-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-9-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_151554_106851_433232A5 
X-CRM114-Status: GOOD (  19.82  )
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

On Thu, Oct 27, 2022 at 03:02:46PM +0200, Andrew Jones wrote:
> In a coming patch we'll be adding more branch targets. Let's

rather minor nit: I don't think "In a coming patch" will be
particularly meaningful if anyone does some history diving.

> change the numeric labels to named labels to make it easier
> to read and integrate with.
> 
> No functional change intended.

It looks fine to me..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/lib/memset.S | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index e613c5c27998..74e4c7feec00 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -13,7 +13,7 @@ WEAK(memset)
>  
>  	/* Defer to byte-oriented fill for small sizes */
>  	sltiu	a3, a2, 16
> -	bnez	a3, 4f
> +	bnez	a3, .Lfinish
>  
>  	/*
>  	 * Round to nearest XLEN-aligned address
> @@ -21,17 +21,18 @@ WEAK(memset)
>  	 */
>  	addi	a3, t0, SZREG-1
>  	andi	a3, a3, ~(SZREG-1)
> -	beq	a3, t0, 2f		/* Skip if already aligned */
> +	beq	a3, t0, .Ldo_duff	/* Skip if already aligned */
>  
>  	/* Handle initial misalignment */
>  	sub	a4, a3, t0
> -1:
> +.Lmisaligned1:
>  	sb	a1, 0(t0)
>  	addi	t0, t0, 1
> -	bltu	t0, a3, 1b
> +	bltu	t0, a3, .Lmisaligned1
>  	sub	a2, a2, a4		/* Update count */
>  
> -2: /* Duff's device with 32 XLEN stores per iteration */
> +.Ldo_duff:
> +	/* Duff's device with 32 XLEN stores per iteration */
>  	/* Broadcast value into all bytes */
>  	andi	a1, a1, 0xff
>  	slli	a3, a1, 8
> @@ -48,7 +49,7 @@ WEAK(memset)
>  	add	a3, t0, a4
>  
>  	andi	a4, a4, 31*SZREG	/* Calculate remainder */
> -	beqz	a4, 3f			/* Shortcut if no remainder */
> +	beqz	a4, .Lduff_loop		/* Shortcut if no remainder */
>  	neg	a4, a4
>  	addi	a4, a4, 32*SZREG	/* Calculate initial offset */
>  
> @@ -57,13 +58,13 @@ WEAK(memset)
>  
>  	/* Jump into loop body */
>  	/* Assumes 32-bit instruction lengths */
> -	la	a5, 3f
> +	la	a5, .Lduff_loop
>  #ifdef CONFIG_64BIT
>  	srli	a4, a4, 1
>  #endif
>  	add	a5, a5, a4
>  	jr	a5
> -3:
> +.Lduff_loop:
>  	REG_S	a1,        0(t0)
>  	REG_S	a1,    SZREG(t0)
>  	REG_S	a1,  2*SZREG(t0)
> @@ -98,17 +99,17 @@ WEAK(memset)
>  	REG_S	a1, 31*SZREG(t0)
>  
>  	addi	t0, t0, 32*SZREG
> -	bltu	t0, a3, 3b
> +	bltu	t0, a3, .Lduff_loop
>  	andi	a2, a2, SZREG-1		/* Update count */
>  
> -4:
> +.Lfinish:
>  	/* Handle trailing misalignment */
> -	beqz	a2, 6f
> +	beqz	a2, .Ldone
>  	add	a3, t0, a2
> -5:
> +.Lmisaligned2:
>  	sb	a1, 0(t0)
>  	addi	t0, t0, 1
> -	bltu	t0, a3, 5b
> -6:
> +	bltu	t0, a3, .Lmisaligned2
> +.Ldone:
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
