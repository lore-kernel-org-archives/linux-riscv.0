Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD872C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 02:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZjEIoIxvmyaLH8shyNNAPJDALEXO7Gnf2hVhVIZ5rM=; b=KkI4p2t58ooDu9
	ge03EGeSb0cwsTj0lapg1tHM+VXH4miPgrN7EEiu6qcjXak3sKGyPUY80jOkSROrUtKK0IGYPkpoX
	EIhP3AiC37ukRdGCvT+SysIJLPvBThAQtaRytTQXx8gX9cygJWS6MPtdoUyAVn8KyYBMU0sB4KnZT
	ruQv4nuNKedsT3jnRHwMgN1veT8w42qyQeYCje8ieEV2AqU70Gm2ump6SogLSCpnO/HGl2HFehgvu
	vel2V8yLYLjGiEqNImrmlqpaSfBkirObXqfi5NmXYnQEJypozq2oD/X2M1JWaI/ho54zWLgxFKx0B
	/6lXxxqJ5SX+bOpxYywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWT9Y-008HS8-KH; Mon, 27 Feb 2023 02:22:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWT9V-008HRR-Cu
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 02:22:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 67AA524E1F5;
	Mon, 27 Feb 2023 10:21:57 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 10:21:57 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 10:21:57 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Mon, 27 Feb 2023 10:21:57 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Alexandre Ghiti <alex@ghiti.fr>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>, Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v4 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Thread-Topic: [PATCH v4 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Thread-Index: AQHZRZ0usaQdEx0RFEu95aWg+gkHKK7dYYwAgAS2G0A=
Date: Mon, 27 Feb 2023 02:21:56 +0000
Message-ID: <3415321bb1a1451ca7cca68c9eae9511@EXMBX066.cuchost.com>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-3-jeeheng.sia@starfivetech.com>
 <651d5f06-a22b-4cd9-1ec7-d198adf0a6f1@ghiti.fr>
In-Reply-To: <651d5f06-a22b-4cd9-1ec7-d198adf0a6f1@ghiti.fr>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_182209_719324_D598C023 
X-CRM114-Status: GOOD (  24.79  )
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



> -----Original Message-----
> From: Alexandre Ghiti <alex@ghiti.fr>
> Sent: Friday, 24 February, 2023 6:19 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu
> Cc: linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo
> <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v4 2/4] RISC-V: Factor out common code of __cpu_resume_enter()
> 
> Hi Sia,
> 
> On 2/21/23 03:35, Sia Jee Heng wrote:
> > The cpu_resume() function is very similar for the suspend to disk and
> > suspend to ram cases. Factor out the common code into restore_csr macro
> > and restore_reg macro.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > ---
> >   arch/riscv/include/asm/assembler.h | 62 ++++++++++++++++++++++++++++++
> >   arch/riscv/kernel/suspend_entry.S  | 34 ++--------------
> >   2 files changed, 65 insertions(+), 31 deletions(-)
> >   create mode 100644 arch/riscv/include/asm/assembler.h
> >
> > diff --git a/arch/riscv/include/asm/assembler.h b/arch/riscv/include/asm/assembler.h
> > new file mode 100644
> > index 000000000000..727a97735493
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/assembler.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Jee Heng Sia <jeeheng.sia@starfivetech.com>
> > + */
> > +
> > +#ifndef __ASSEMBLY__
> > +#error "Only include this from assembly code"
> > +#endif
> > +
> > +#ifndef __ASM_ASSEMBLER_H
> > +#define __ASM_ASSEMBLER_H
> > +
> > +#include <asm/asm.h>
> > +#include <asm/asm-offsets.h>
> > +#include <asm/csr.h>
> > +
> > +/*
> > + * restore_csr - restore hart's CSR value
> > + */
> > +	.macro restore_csr
> > +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
> > +		csrw	CSR_EPC, t0
> > +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
> > +		csrw	CSR_STATUS, t0
> > +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
> > +		csrw	CSR_TVAL, t0
> > +		REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
> > +		csrw	CSR_CAUSE, t0
> > +	.endm
> > +
> > +/*
> > + * restore_reg - Restore registers (except A0 and T0-T6)
> > + */
> > +	.macro restore_reg
> > +		REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
> > +		REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
> > +		REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
> > +		REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
> > +		REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
> > +		REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
> > +		REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
> > +		REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
> > +		REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
> > +		REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
> > +		REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
> > +		REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
> > +		REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
> > +		REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
> > +		REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
> > +		REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
> > +		REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
> > +		REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
> > +		REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
> > +		REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
> > +		REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
> > +		REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
> > +		REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> > +	.endm
> > +
> > +#endif	/* __ASM_ASSEMBLER_H */
> 
> 
> You introduce assembler.h which in the future may contain other assembly
> functions not related to suspend: I'd rename those macros so that we
> know they are suspend related, something like
> suspend_restore_regs/suspend_restore_csrs.
Sure, these can be done.
> 
> And instead of (SUSPEND_CONTEXT_REGS + PT_XXX) you could introduce
> SUSPEND_CONTEXT_REGS_PT_XXX in asm-offsets.c?
There are already PT_XXX defined in the asm-offset.c, we should not create another set of SUSPEND_CONTEXT_REGS_PT_XXX because we can just re-use the definition instead of duplicate another set of offset which are doing the same thing. So, I would rather stick with the current definition.
	DEFINE(PT_SIZE, sizeof(struct pt_regs));
	OFFSET(PT_EPC, pt_regs, epc);
	OFFSET(PT_RA, pt_regs, ra);
	OFFSET(PT_FP, pt_regs, s0);
	OFFSET(PT_S0, pt_regs, s0);
	OFFSET(PT_S1, pt_regs, s1);
	OFFSET(PT_S2, pt_regs, s2);
> 
> 
> > diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
> > index aafcca58c19d..74a8fab8e0f6 100644
> > --- a/arch/riscv/kernel/suspend_entry.S
> > +++ b/arch/riscv/kernel/suspend_entry.S
> > @@ -7,6 +7,7 @@
> >   #include <linux/linkage.h>
> >   #include <asm/asm.h>
> >   #include <asm/asm-offsets.h>
> > +#include <asm/assembler.h>
> >   #include <asm/csr.h>
> >   #include <asm/xip_fixup.h>
> >
> > @@ -83,39 +84,10 @@ ENTRY(__cpu_resume_enter)
> >   	add	a0, a1, zero
> >
> >   	/* Restore CSRs */
> > -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_EPC)(a0)
> > -	csrw	CSR_EPC, t0
> > -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_STATUS)(a0)
> > -	csrw	CSR_STATUS, t0
> > -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_BADADDR)(a0)
> > -	csrw	CSR_TVAL, t0
> > -	REG_L	t0, (SUSPEND_CONTEXT_REGS + PT_CAUSE)(a0)
> > -	csrw	CSR_CAUSE, t0
> > +	restore_csr
> >
> >   	/* Restore registers (except A0 and T0-T6) */
> > -	REG_L	ra, (SUSPEND_CONTEXT_REGS + PT_RA)(a0)
> > -	REG_L	sp, (SUSPEND_CONTEXT_REGS + PT_SP)(a0)
> > -	REG_L	gp, (SUSPEND_CONTEXT_REGS + PT_GP)(a0)
> > -	REG_L	tp, (SUSPEND_CONTEXT_REGS + PT_TP)(a0)
> > -	REG_L	s0, (SUSPEND_CONTEXT_REGS + PT_S0)(a0)
> > -	REG_L	s1, (SUSPEND_CONTEXT_REGS + PT_S1)(a0)
> > -	REG_L	a1, (SUSPEND_CONTEXT_REGS + PT_A1)(a0)
> > -	REG_L	a2, (SUSPEND_CONTEXT_REGS + PT_A2)(a0)
> > -	REG_L	a3, (SUSPEND_CONTEXT_REGS + PT_A3)(a0)
> > -	REG_L	a4, (SUSPEND_CONTEXT_REGS + PT_A4)(a0)
> > -	REG_L	a5, (SUSPEND_CONTEXT_REGS + PT_A5)(a0)
> > -	REG_L	a6, (SUSPEND_CONTEXT_REGS + PT_A6)(a0)
> > -	REG_L	a7, (SUSPEND_CONTEXT_REGS + PT_A7)(a0)
> > -	REG_L	s2, (SUSPEND_CONTEXT_REGS + PT_S2)(a0)
> > -	REG_L	s3, (SUSPEND_CONTEXT_REGS + PT_S3)(a0)
> > -	REG_L	s4, (SUSPEND_CONTEXT_REGS + PT_S4)(a0)
> > -	REG_L	s5, (SUSPEND_CONTEXT_REGS + PT_S5)(a0)
> > -	REG_L	s6, (SUSPEND_CONTEXT_REGS + PT_S6)(a0)
> > -	REG_L	s7, (SUSPEND_CONTEXT_REGS + PT_S7)(a0)
> > -	REG_L	s8, (SUSPEND_CONTEXT_REGS + PT_S8)(a0)
> > -	REG_L	s9, (SUSPEND_CONTEXT_REGS + PT_S9)(a0)
> > -	REG_L	s10, (SUSPEND_CONTEXT_REGS + PT_S10)(a0)
> > -	REG_L	s11, (SUSPEND_CONTEXT_REGS + PT_S11)(a0)
> > +	restore_reg
> >
> >   	/* Return zero value */
> >   	add	a0, zero, zero
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
