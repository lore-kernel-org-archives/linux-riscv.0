Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CC5C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 01:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1otZrQtjPtOjxhx/jOKG/9+N0vwUa6H4B+6Z2LVfZuQ=; b=W3ma/NsdzRVwba
	hG1paEXi+yiruCuIGOd6+i7NsQAcoTHTNpuguX4mHwKCvOsl1aECfqvV1cYP9sJDLrDyqDO2xPC+1
	vdzUEY6R5alKVV9suy2OOBfejCTOV1AygF5ZfdqsnqN8Cl00MvQAeYyT0X4DuiL3w4qXbi9QhV1TF
	R0Z2dFMqHcatTqSjV1TmnLrBYfSwRULhZN0l2JICLH5wpzaIg8mFf2b5oSvlgd19cBaI9rkjESNdR
	1dGoC/Aq/+jCiYx5csPlmlQfiy0xyxpwqoEnyWuoYYHuUDWZ7DGAdbC8gMJe7jCA17txf4TwjwHBM
	jgvdfYROYkXryBUqdZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVMyT-000sko-Fw; Fri, 24 Feb 2023 01:34:13 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVMyN-000sfU-TD
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 01:34:12 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 0454524DB8C;
	Fri, 24 Feb 2023 09:33:42 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 09:33:41 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 09:33:41 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 24 Feb 2023 09:33:41 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v4 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Thread-Topic: [PATCH v4 2/4] RISC-V: Factor out common code of
 __cpu_resume_enter()
Thread-Index: AQHZRZ0usaQdEx0RFEu95aWg+gkHKK7blUuAgAG/cmA=
Date: Fri, 24 Feb 2023 01:33:41 +0000
Message-ID: <794606ec4f594119a71824fbf3af5921@EXMBX066.cuchost.com>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-3-jeeheng.sia@starfivetech.com>
 <20230223065155.olemrm7cskwclzt7@orel>
In-Reply-To: <20230223065155.olemrm7cskwclzt7@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.50.196.81]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_173408_233102_3BEAB684 
X-CRM114-Status: GOOD (  22.35  )
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
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Thursday, 23 February, 2023 2:52 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>
> Subject: Re: [PATCH v4 2/4] RISC-V: Factor out common code of __cpu_resume_enter()
> 
> On Tue, Feb 21, 2023 at 10:35:21AM +0800, Sia Jee Heng wrote:
> > The cpu_resume() function is very similar for the suspend to disk and
> > suspend to ram cases. Factor out the common code into restore_csr macro
> > and restore_reg macro.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > ---
> >  arch/riscv/include/asm/assembler.h | 62 ++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/suspend_entry.S  | 34 ++--------------
> >  2 files changed, 65 insertions(+), 31 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/assembler.h
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
> 
> Since there are more than one, 'restore_csrs' would be more appropriate
> and s/CSR value/CSRs/
> 
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
> 
> restore_regs
> 
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
> > diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
> > index aafcca58c19d..74a8fab8e0f6 100644
> > --- a/arch/riscv/kernel/suspend_entry.S
> > +++ b/arch/riscv/kernel/suspend_entry.S
> > @@ -7,6 +7,7 @@
> >  #include <linux/linkage.h>
> >  #include <asm/asm.h>
> >  #include <asm/asm-offsets.h>
> > +#include <asm/assembler.h>
> >  #include <asm/csr.h>
> >  #include <asm/xip_fixup.h>
> >
> > @@ -83,39 +84,10 @@ ENTRY(__cpu_resume_enter)
> >  	add	a0, a1, zero
> >
> >  	/* Restore CSRs */
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
> >  	/* Restore registers (except A0 and T0-T6) */
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
> >  	/* Return zero value */
> >  	add	a0, zero, zero
> > --
> > 2.34.1
> >
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
noted with thanks
> 
> Thanks,
> drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
