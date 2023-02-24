Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A73C678DB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnIfgJl0d4TppuHbiUs97uifgG6MQF3FDKzQ3vJuaoY=; b=28ri96uOpuJJVB
	I7rz8RqpeWXeyD60hLnzdb/sc2JL7o/bVR0lcGK5vTRj0NijPkFuT6/EsFM3scdQiNRBCwdt8WH5b
	DIRJHI0u5yKAZar1kWJYOZWlFFnmViSdC2pFeN9eBTRNac4iw7j3dcOADBI2X5+0tg72TYb3gJCb8
	QMk/XVlv8re5U6nZJopAHd4S0sa9rHGR0D+ZuGjizNxkyxIdB6d1W4Bqo6PYOEfE1ZMyNZRcuSiMw
	ikXxfTafGiG2Eld3CD5wDFdHj3m/Ptyz/mm0roljBbpz7mQANqiS+DiV3uDqJhV/CVtkmupYQc4r5
	30/1HNG5tuorGreS8zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVAr-001y7P-6a; Fri, 24 Feb 2023 10:19:33 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVVAk-001y21-2I
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 10:19:31 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id 7DF89FF80D;
	Fri, 24 Feb 2023 10:19:14 +0000 (UTC)
Message-ID: <651d5f06-a22b-4cd9-1ec7-d198adf0a6f1@ghiti.fr>
Date: Fri, 24 Feb 2023 11:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Content-Language: en-US
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-3-jeeheng.sia@starfivetech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230221023523.1498500-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_021926_494594_6BD91805 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Sia,

On 2/21/23 03:35, Sia Jee Heng wrote:
> The cpu_resume() function is very similar for the suspend to disk and
> suspend to ram cases. Factor out the common code into restore_csr macro
> and restore_reg macro.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>   arch/riscv/include/asm/assembler.h | 62 ++++++++++++++++++++++++++++++
>   arch/riscv/kernel/suspend_entry.S  | 34 ++--------------
>   2 files changed, 65 insertions(+), 31 deletions(-)
>   create mode 100644 arch/riscv/include/asm/assembler.h
>
> diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
> new file mode 100644
> index 000000000000..727a97735493
> --- /dev/null
> +++ b/arch/riscv/include/asm/assembler.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> + */
> +
> +#ifndef __ASSEMBLY__
> +#error "Only include this from assembly code"
> +#endif
> +
> +#ifndef __ASM_ASSEMBLER_H
> +#define __ASM_ASSEMBLER_H
> +
> +#include <asm/asm.h>
> +#include <asm/asm-offsets.h>
> +#include <asm/csr.h>
> +
> +/*
> + * restore_csr - restore hart's CSR value
> + */
> +	.macro restore_csr
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
> +		csrw	CSR_EPC, t0
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
> +		csrw	CSR_STATUS, t0
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
> +		csrw	CSR_TVAL, t0
> +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
> +		csrw	CSR_CAUSE, t0
> +	.endm
> +
> +/*
> + * restore_reg - Restore registers (except A0 and T0-T6)
> + */
> +	.macro restore_reg
> +		REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
> +		REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
> +		REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
> +		REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
> +		REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
> +		REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
> +		REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
> +		REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
> +		REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
> +		REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
> +		REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
> +		REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
> +		REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
> +		REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
> +		REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
> +		REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
> +		REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
> +		REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
> +		REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
> +		REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
> +		REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
> +		REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
> +		REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> +	.endm
> +
> +#endif	/* __ASM_ASSEMBLER_H */


You introduce assembler.h which in the future may contain other assembly 
functions not related to suspend: I'd rename those macros so that we 
know they are suspend related, something like 
suspend_restore_regs/suspend_restore_csrs.

And instead of (SUSPEND_CONTEXT_REGS + PT_XXX) you could introduce 
SUSPEND_CONTEXT_REGS_PT_XXX in asm-offsets.c?


> diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
> index aafcca58c19d..74a8fab8e0f6 100644
> --- a/arch/riscv/kernel/suspend_entry.S
> +++ b/arch/riscv/kernel/suspend_entry.S
> @@ -7,6 +7,7 @@
>   #include <linux/linkage.h>
>   #include <asm/asm.h>
>   #include <asm/asm-offsets.h>
> +#include <asm/assembler.h>
>   #include <asm/csr.h>
>   #include <asm/xip_fixup.h>
>   
> @@ -83,39 +84,10 @@ ENTRY(__cpu_resume_enter)
>   	add	a0, a1, zero
>   
>   	/* Restore CSRs */
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
> -	csrw	CSR_EPC, t0
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
> -	csrw	CSR_STATUS, t0
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
> -	csrw	CSR_TVAL, t0
> -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
> -	csrw	CSR_CAUSE, t0
> +	restore_csr
>   
>   	/* Restore registers (except A0 and T0-T6) */
> -	REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
> -	REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
> -	REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
> -	REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
> -	REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
> -	REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
> -	REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
> -	REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
> -	REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
> -	REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
> -	REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
> -	REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
> -	REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
> -	REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
> -	REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
> -	REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
> -	REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
> -	REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
> -	REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
> -	REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
> -	REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
> -	REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
> -	REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> +	restore_reg
>   
>   	/* Return zero value */
>   	add	a0, zero, zero

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
