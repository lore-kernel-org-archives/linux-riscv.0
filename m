Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8C3FA3743
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 22:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3x5YzGl/oV9TcH39rRorL86fC1mOVQxWyVBMkZ/D+A=; b=DV9lfLx+QeyPWK
	OG9fSJKwdOHpnJV+vqXC9WvPNSPPBYvqhh8Eh8mI/tW0ki2wMxHWo71Kww+9PNbghbi2xDo0lQS6S
	Prdy/RPNFuZ8/CJ9MVFt54BC6T/RJRvlHcqKjdNzMpp9mKar6u9bXzRewTRdk3jczuh7L+CjTIJX2
	rCAauO03MPcH0BPKJ+P5QRoxrbQdVtE93TvPEt1Wp1YKTTOgmvyXaaRpXJhLFV3fbWicUO+jpoLLH
	Z3VOK/2iLLL/SSJImx6qHgDADrGJUalNYXYNNmiombAHRaaFPuP5I2wYNdFnGHBkuyOnJs7DDAdJj
	lX/61grA/uJpK19tagyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGuN-003yDO-1R; Sun, 30 Oct 2022 22:35:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opGuJ-003yB8-5x; Sun, 30 Oct 2022 22:35:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9373CB810A3;
	Sun, 30 Oct 2022 22:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030E7C433C1;
	Sun, 30 Oct 2022 22:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667169352;
	bh=vyh5zuJ1ZTea0c0ag38Tw7CFATZvL2b3wYVdNkKJ78w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1SEDUqBAOiKLz/J0eYqfwdDSt35gYShfMdQ17C8v2aoTmihXCavWNc2JZQqI/t00
	 IM+tyWneF622MwaqAg+0S0GomcctCObDnl8MNtZUyQD5ogEvW0BHEHpfJ1oY50QESq
	 +FvSyvXQYgjJMwmThZF/5dv7Zvmp/oXdOFYWhPBOP8PUWhqOrOaLE2yJqgQ2vf1ppM
	 fBdwAB2zcaDZYSIDcgEv/ESrcxDil2c7fYrsZou+O2MiXzXKwrFzAgCJLhLlxHBe5N
	 4maT9A96DoD+ruCfgRPGvMztNuLBJ2NS7Sj8RkN97zz6Ng1Tw8vrAaLd/SWZhFc0fj
	 qZtLxVFvoavpQ==
Date: Sun, 30 Oct 2022 22:35:47 +0000
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
Subject: Re: [PATCH 9/9] RISC-V: Use Zicboz in memset when available
Message-ID: <Y178Q/szFZNlaFej@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-10-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-10-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_153555_530033_FC76103A 
X-CRM114-Status: GOOD (  30.67  )
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

On Thu, Oct 27, 2022 at 03:02:47PM +0200, Andrew Jones wrote:
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
> +	/*
> +	 * t1 will be the Zicboz block size.
> +	 * Zero means we're not using Zicboz, and we don't when a1 != 0
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^
I find this second half a little hard to parse. Do you mean "we don't
use zicboz when a1 != 0"? IOW, is my rewording of this comment accurate?
"A block size of zero means we're not using Zicboz. We also do not use
Zicboz when a1 is non zero".

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

This one is a little hard too, I think it's because you're switching
from "did" to "have". Maybe this is only an issue for me because this
stuff is beyond me in terms of reviewing, so I relying on the comments a
lot - although I suppose that makes me the target audience in a way.

I think it'd make more sense to me as "Did we go too far, or did we not
find any blocks".

Thanks,
Conor.

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
