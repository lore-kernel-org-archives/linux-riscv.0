Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E92C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 01:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCnwpDaIiQLfOMy6SDApyuXvMKHir7xHIcWFM2dkf2g=; b=COsUqWCJEfyCgO
	f+15Ehh8i5lTkX/c/eblMGetL6J53YgX54Gg1ayR2Gxb0KGdv3Un9c6Ym8TEypn+RXoZztPAAWlRB
	0W99I/WyH3D9knmcgvu3XuXyqBBsVOK65pU5rqKcrrKMpp7Eaq6wacP5/T7y0KgVU+0DdLR5A7IeO
	+JACGlIpWmSxeWVwyv/unHkDlcwzWkSCXy+0WHAQleveSnBWWvkYBgPffv05BrU2zJG1kI3CDTjJf
	7HzxmziHXwlNhtBSoVo4aNbGFSi8zl/FP7SJx9TUR+N1relY9E9Lh4QgXsDrDdzkzJ14VxVJYqq6L
	W7+LyY4oz2Usu3IDUklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVMyO-000sj6-Ba; Fri, 24 Feb 2023 01:34:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVMyJ-000sc9-Lk
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 01:34:06 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2A76B24E24E;
	Fri, 24 Feb 2023 09:33:17 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 09:33:17 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Feb
 2023 09:33:16 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 24 Feb 2023 09:33:16 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v4 1/4] RISC-V: Change suspend_save_csrs and
 suspend_restore_csrs to public function
Thread-Topic: [PATCH v4 1/4] RISC-V: Change suspend_save_csrs and
 suspend_restore_csrs to public function
Thread-Index: AQHZRZ0s27ZIes8WRE6urFHZP2L6bK7bkdoAgAHCyCA=
Date: Fri, 24 Feb 2023 01:33:16 +0000
Message-ID: <e2a0b59ebe464d79af30a16bd1075f3d@EXMBX066.cuchost.com>
References: <20230221023523.1498500-1-jeeheng.sia@starfivetech.com>
 <20230221023523.1498500-2-jeeheng.sia@starfivetech.com>
 <20230223063936.6tsqh57lom3tvjxo@orel>
In-Reply-To: <20230223063936.6tsqh57lom3tvjxo@orel>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.50.196.81]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_173404_009681_1B2438DB 
X-CRM114-Status: GOOD (  19.36  )
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
> Sent: Thursday, 23 February, 2023 2:40 PM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org; Leyfoon Tan <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>; Conor Dooley
> <conor.dooley@microchip.com>
> Subject: Re: [PATCH v4 1/4] RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public function
> 
> On Tue, Feb 21, 2023 at 10:35:20AM +0800, Sia Jee Heng wrote:
> > Currently suspend_save_csrs() and suspend_restore_csrs() functions are
> > statically defined in the suspend.c. Change the function's attribute
> > to public so that the functions can be used by hibernation as well.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/suspend.h | 3 +++
> >  arch/riscv/kernel/suspend.c      | 4 ++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> > index 8be391c2aecb..75419c5ca272 100644
> > --- a/arch/riscv/include/asm/suspend.h
> > +++ b/arch/riscv/include/asm/suspend.h
> > @@ -33,4 +33,7 @@ int cpu_suspend(unsigned long arg,
> >  /* Low-level CPU resume entry function */
> >  int __cpu_resume_enter(unsigned long hartid, unsigned long context);
> >
> > +/* Used to save and restore the csr */
> 
> s/the csr/CSRs/
> 
> > +void suspend_save_csrs(struct suspend_context *context);
> > +void suspend_restore_csrs(struct suspend_context *context);
> >  #endif
> > diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> > index 9ba24fb8cc93..3c89b8ec69c4 100644
> > --- a/arch/riscv/kernel/suspend.c
> > +++ b/arch/riscv/kernel/suspend.c
> > @@ -8,7 +8,7 @@
> >  #include <asm/csr.h>
> >  #include <asm/suspend.h>
> >
> > -static void suspend_save_csrs(struct suspend_context *context)
> > +void suspend_save_csrs(struct suspend_context *context)
> >  {
> >  	context->scratch = csr_read(CSR_SCRATCH);
> >  	context->tvec = csr_read(CSR_TVEC);
> > @@ -29,7 +29,7 @@ static void suspend_save_csrs(struct suspend_context *context)
> >  #endif
> >  }
> >
> > -static void suspend_restore_csrs(struct suspend_context *context)
> > +void suspend_restore_csrs(struct suspend_context *context)
> >  {
> >  	csr_write(CSR_SCRATCH, context->scratch);
> >  	csr_write(CSR_TVEC, context->tvec);
> > --
> > 2.34.1
> >
> 
> Otherwise,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Noted with thanks
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
