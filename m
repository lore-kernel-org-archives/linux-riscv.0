Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EECC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXZdTodaIpnG+ptvpr9GL2X1iA3iwPtUfdFmEm5zAec=; b=Ibn1b1Pgom61Vt
	/SoY9UywGRZjVN0bWTF9SMAY3Kn6OpyBFfMs89BpYuV3HwsOAiQWMU8dqJkj4ba71SOhlLiJwgf+X
	ksG8zhIEn2LwqLGAFQn24U97uU1MNB2bebhLz92dkMSBE6ntQ0uUBJJs8o3MJO/LPhXQPKS61RCLc
	wUO5qtUSENf9qKMg22L/ac/rtnlu/p3i+elFkLS7RdgvjqfR5qseCdbir508sFmOgQuAaKi3ZGXft
	QUpI/+NbDmRuUJyA94Px00KRISIG9gm531YAs3uHIl1URZ/9zzkYl8OMNrGHq3d+mIiniwgfrGopH
	+dClRW68gt4cYEy6HCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RbY-001T21-Mg; Wed, 30 Nov 2022 18:14:44 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RbV-001Sz6-Cb
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:14:43 +0000
Received: by mail-ed1-x535.google.com with SMTP id b8so25140395edf.11
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 10:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j7K3QQjgetcF0dnn3oVBs1JgDTRJdaG+fBSNdtFt0EA=;
        b=Lk7DM7XhMtPu5Cq9CE5ZDFKoOKUT6mHLWd98yCqFse4aDUwytBmZ4YTHSrCY9SDbbV
         5GNe6VYUHia592/EGt6Aw2Ms/Nxx3i5XDODt6qHqTKfiJASGf0U8v7V3b77aTTCid0f4
         RsmsbiaDAMdUiAib7vvpXjCVipj88D6c2kLSoCUojsh+N81VU5hiI/shxf2QxrE/GOBT
         giA87QJP1iqm3bte6q7Tk1AjMyo6uw15OD0B1KZpRBFHKStnGmF6TqrXmPzUnvL61AJu
         5uOjwp1O6iWjUgy7P+fzoUDCeGeLGLp54c8jYTrrL8j+n0jV7Hbl+4a0o6aM7yNPeUOV
         loog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7K3QQjgetcF0dnn3oVBs1JgDTRJdaG+fBSNdtFt0EA=;
        b=EIZ9I7cBVmozRM58FwhKWwpcuFG9VNo7WAntQDLu+Rby+bK8WrUMEAZ83eWLFcFWBj
         V2oqs8RTA0VJXso4sbZ8Cxa6KrzZSvKrfq/D9+GbNB5JWFKTB9vbkavWIaCVhGhyqKhk
         PsjNsiWDwIER58H6UxjuFcXscaswfqt5tSSclYfNzJsQegfeBLS2ieELpHodE3aC+5uc
         yrRa+4nr/m6DIfKLObuWhCmPBKFlALbnccSOR8p5v5ycagAlBE06uwnRKt372Sui72hp
         BI2JOuQg4Tw+Zk7LRudx6peoe7t/WzrU7V6vIjYHJN1Hwr1WmJmlNPogimwP5nU3pd8o
         XX0g==
X-Gm-Message-State: ANoB5pm6QevAVt7TqlAuLRa+tnmU2zbWUoDNcaAF1ECSC/iRqwQc1Qjt
	nfYx/ASl9Uwe/bUTtXPzK1FPfrRcsm4/B5/r1IPFaA==
X-Google-Smtp-Source: AA0mqf7dSb+Z4b+LNnNwU5LI2sxm66euhhg+3LH4pqNP+jRZVqBiw6TiJLwXhAFe/JBpYXUuzfFQVZtiJYwGge/i5ss=
X-Received: by 2002:aa7:c859:0:b0:461:17e9:4ea3 with SMTP id
 g25-20020aa7c859000000b0046117e94ea3mr56716157edt.49.1669832078541; Wed, 30
 Nov 2022 10:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20221129142449.886518-1-apatel@ventanamicro.com>
 <20221129142449.886518-5-apatel@ventanamicro.com> <86bkoomn4h.wl-maz@kernel.org>
 <CAAhSdy0T1G7=XVSmtYxONtfk+5-XYnv3qWyFL2Nnp-MS3aQroA@mail.gmail.com> <87o7sotj62.wl-maz@kernel.org>
In-Reply-To: <87o7sotj62.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Nov 2022 23:44:27 +0530
Message-ID: <CAAhSdy0s_GN798C_CQO_D2ewUVQnJ8PSb1SZd429q9MzG8xVoQ@mail.gmail.com>
Subject: Re: [PATCH v13 4/7] RISC-V: Treat IPIs as normal Linux IRQs
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_101441_682618_76748B9E 
X-CRM114-Status: GOOD (  35.39  )
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

On Wed, Nov 30, 2022 at 11:32 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 30 Nov 2022 17:14:09 +0000,
> Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, Nov 30, 2022 at 9:48 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Tue, 29 Nov 2022 14:24:46 +0000,
> > > Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > Currently, the RISC-V kernel provides arch specific hooks (i.e.
> > > > struct riscv_ipi_ops) to register IPI handling methods. The stats
> > > > gathering of IPIs is also arch specific in the RISC-V kernel.
> > > >
> > > > Other architectures (such as ARM, ARM64, and MIPS) have moved away
> > > > from custom arch specific IPI handling methods. Currently, these
> > > > architectures have Linux irqchip drivers providing a range of Linux
> > > > IRQ numbers to be used as IPIs and IPI triggering is done using
> > > > generic IPI APIs. This approach allows architectures to treat IPIs
> > > > as normal Linux IRQs and IPI stats gathering is done by the generic
> > > > Linux IRQ subsystem.
> > > >
> > > > We extend the RISC-V IPI handling as-per above approach so that arch
> > > > specific IPI handling methods (struct riscv_ipi_ops) can be removed
> > > > and the IPI handling is done through the Linux IRQ subsystem.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/Kconfig                |   2 +
> > > >  arch/riscv/include/asm/sbi.h      |  10 +-
> > > >  arch/riscv/include/asm/smp.h      |  35 ++++---
> > > >  arch/riscv/kernel/Makefile        |   1 +
> > > >  arch/riscv/kernel/cpu-hotplug.c   |   3 +-
> > > >  arch/riscv/kernel/irq.c           |   3 +-
> > > >  arch/riscv/kernel/sbi-ipi.c       |  81 ++++++++++++++++
> > > >  arch/riscv/kernel/sbi.c           | 106 +++-----------------
> > > >  arch/riscv/kernel/smp.c           | 155 +++++++++++++++---------------
> > > >  arch/riscv/kernel/smpboot.c       |   5 +-
> > > >  drivers/clocksource/timer-clint.c |  65 ++++++++++---
> > > >  drivers/irqchip/Kconfig           |   1 +
> > > >  drivers/irqchip/irq-riscv-intc.c  |  55 +++++------
> > > >  13 files changed, 287 insertions(+), 235 deletions(-)
> > > >  create mode 100644 arch/riscv/kernel/sbi-ipi.c
> > > >
> > >
> > > [...]
> > >
> > > > diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
> > > > new file mode 100644
> > > > index 000000000000..6466706b03a7
> > > > --- /dev/null
> > > > +++ b/arch/riscv/kernel/sbi-ipi.c
> > > > @@ -0,0 +1,81 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +/*
> > > > + * Multiplex several IPIs over a single HW IPI.
> > > > + *
> > > > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> > > > + */
> > > > +
> > > > +#define pr_fmt(fmt) "riscv: " fmt
> > > > +#include <linux/cpu.h>
> > > > +#include <linux/init.h>
> > > > +#include <linux/irq.h>
> > > > +#include <linux/irqdomain.h>
> > > > +#include <linux/percpu.h>
> > > > +#include <asm/sbi.h>
> > > > +
> > > > +static int sbi_ipi_virq;
> > > > +static DEFINE_PER_CPU_READ_MOSTLY(int, sbi_ipi_dummy_dev);
> > > > +
> > > > +static irqreturn_t sbi_ipi_handle(int irq, void *dev_id)
> > > > +{
> > > > +     csr_clear(CSR_IP, IE_SIE);
> > > > +     ipi_mux_process();
> > > > +     return IRQ_HANDLED;
> > >
> > > Urgh... I really wish I hadn't seen this. This requires a chained
> > > handler. You had it before, and yet you dropped it. Why?
> > >
> > > Either you call ipi_mux_process() from your root interrupt controller,
> > > or you implement a chained handler. But not this.
> > >
> > > Same thing about the clint stuff.
> >
> > We had chained handler all along but there is problem (which
> > was pointed to us) in using chained handler because the parent
> > RISC-V INTC irqchip driver does not have irq_eoi() so the
> > chained_irq_enter() and chained_irq_exit() will do the interrupt
> > mask/unmask dance which seems unnecessary.
> >
> > Is there a better way to avoid the interrupt mask/unmask dance ?
>
> Well, you could have an IPI-specific irqchip, with an empty EOI
> callback. Or something. But not *that*.

Is it okay to add an empty irq_eoi() in drivers/irqchip/irq-riscv-intc.c with
detailed comments since this driver uses handle_percpu_devid_irq()
flow ?

>
> And next time you change something of that importance, add it to your
> change log.

Sure, will do.

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
