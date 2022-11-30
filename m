Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7B9C352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 17:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omhwzwyLGGqUyNbkNCyt/8HLAM9Aq8ul002hYpZ0BzM=; b=YfTJ2ZvXN6FAE5
	Qc7WQz9MB2B/rlVVDTytNAGPfa1GkjjC7N8/zrOvhquXqZB/Iz0xCVmGyhBsfFH59VlP2HGKssyaD
	Y/Bp+Vu/PZKp53reQ4h8yi+juM6mYJeoazx/yeHfgAU56By4VF9Ftyxg/YB4jdkYHC7cO1gNuD3wV
	MoYncQ38N2J+07gDyjWKD0hRmYba8IvgTgolyiVwc6xStAstf8ZDiWZ9LRSAfptnmWben20XXZAtr
	2z3Sy7e1yskgnigJDmPe7/ZzgfouSzAd5EOmRHXweHINRNuFO0YQGOZo63wH8J+uVC8FdpoCn53W6
	SB4U3GlL1eM+UmLQvg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QfD-000sjH-Kj; Wed, 30 Nov 2022 17:14:27 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0QfA-000sfY-1D
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 17:14:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id e13so24957545edj.7
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 09:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj3StdHBGTawh0e6h/e+Le5dr9aX+Vm1MyzuqjyovbM=;
        b=scadwmJXHd6bp347syF/H4ak1MBvj9K1DEb/9kP+TIsR5O8zYHvZEwO+GZWZhJuZKC
         5DuqFIz+i5YyZevQxZH4jWzqELHY1hV2r+5SpE9Js4gvW6kSu1Ve2u/Ua/OC9iEKKrii
         9uRw5oFpAkeSOj4AF59t2Ape7Fta4KFwvw860JaR59lda2r1SxEuxKDXwoYsH2joxtiL
         MPChT6+w1uKq1HLeMVNkyc48sIQvi98DZoLKFOAVcfaebVmhuE4j1KxCasqBCYlWN3Zc
         FZEAtKAFgVNw5lYv1a7J4SkGFcGwGvWuuW3mc6007J9Rp9XvcVxkiBvj35EESHYpj8iu
         48dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yj3StdHBGTawh0e6h/e+Le5dr9aX+Vm1MyzuqjyovbM=;
        b=izlGb1WaTTTJ5ZMcAPC9YiwSjCAP1bFNm1svTPepN+rK+lDh7Bs3OLS7BKUup8g3V/
         JCfJ1wWdU4E0MmixPHelU2AL1Nuc5mxUNWD6v5YSmUpDfCdlNVeUfQbwL++FsCV0ZHep
         rRuPo20cE04AOvEgDfD9LPimR0UfJZQ9B6xgkDNavmcwm078S7b/hggXXAFyVUbzz7t6
         u0GFgYec2wk66Pq4IB6z3hUfTm+yEbVbjTPAip1saV+qHCYlOYgXOQ/IWY2O3yFj1Eal
         oGTtTg/cGH4HW7JRkS8RMRUdNxdQ2uknQURW3EWmlS98P4SJr2RPGrpn6v1Epuc5XXT4
         n1wg==
X-Gm-Message-State: ANoB5pnag5wU32upuo0ldPEjw2QyyzrJbKeNZjR4Wjuq0MhRv97BteMz
	RAXtNtFgLSpMvWhdnKyzp5urZx0IY6Z+w6E6qvX/kg==
X-Google-Smtp-Source: AA0mqf4xIQ+xtTOaX/KDZS3gsulsEZW7VRGmN2Lqa7e6ntq7Rf8Scl6rU0A5sUbUv17N4XKQp90JwWQgzM6iO8uUWrI=
X-Received: by 2002:aa7:d7d4:0:b0:46b:7f11:10a4 with SMTP id
 e20-20020aa7d7d4000000b0046b7f1110a4mr7764818eds.59.1669828461075; Wed, 30
 Nov 2022 09:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20221129142449.886518-1-apatel@ventanamicro.com>
 <20221129142449.886518-5-apatel@ventanamicro.com> <86bkoomn4h.wl-maz@kernel.org>
In-Reply-To: <86bkoomn4h.wl-maz@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 30 Nov 2022 22:44:09 +0530
Message-ID: <CAAhSdy0T1G7=XVSmtYxONtfk+5-XYnv3qWyFL2Nnp-MS3aQroA@mail.gmail.com>
Subject: Re: [PATCH v13 4/7] RISC-V: Treat IPIs as normal Linux IRQs
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_091424_102469_DE26117A 
X-CRM114-Status: GOOD (  28.13  )
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

On Wed, Nov 30, 2022 at 9:48 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 29 Nov 2022 14:24:46 +0000,
> Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > Currently, the RISC-V kernel provides arch specific hooks (i.e.
> > struct riscv_ipi_ops) to register IPI handling methods. The stats
> > gathering of IPIs is also arch specific in the RISC-V kernel.
> >
> > Other architectures (such as ARM, ARM64, and MIPS) have moved away
> > from custom arch specific IPI handling methods. Currently, these
> > architectures have Linux irqchip drivers providing a range of Linux
> > IRQ numbers to be used as IPIs and IPI triggering is done using
> > generic IPI APIs. This approach allows architectures to treat IPIs
> > as normal Linux IRQs and IPI stats gathering is done by the generic
> > Linux IRQ subsystem.
> >
> > We extend the RISC-V IPI handling as-per above approach so that arch
> > specific IPI handling methods (struct riscv_ipi_ops) can be removed
> > and the IPI handling is done through the Linux IRQ subsystem.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/Kconfig                |   2 +
> >  arch/riscv/include/asm/sbi.h      |  10 +-
> >  arch/riscv/include/asm/smp.h      |  35 ++++---
> >  arch/riscv/kernel/Makefile        |   1 +
> >  arch/riscv/kernel/cpu-hotplug.c   |   3 +-
> >  arch/riscv/kernel/irq.c           |   3 +-
> >  arch/riscv/kernel/sbi-ipi.c       |  81 ++++++++++++++++
> >  arch/riscv/kernel/sbi.c           | 106 +++-----------------
> >  arch/riscv/kernel/smp.c           | 155 +++++++++++++++---------------
> >  arch/riscv/kernel/smpboot.c       |   5 +-
> >  drivers/clocksource/timer-clint.c |  65 ++++++++++---
> >  drivers/irqchip/Kconfig           |   1 +
> >  drivers/irqchip/irq-riscv-intc.c  |  55 +++++------
> >  13 files changed, 287 insertions(+), 235 deletions(-)
> >  create mode 100644 arch/riscv/kernel/sbi-ipi.c
> >
>
> [...]
>
> > diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
> > new file mode 100644
> > index 000000000000..6466706b03a7
> > --- /dev/null
> > +++ b/arch/riscv/kernel/sbi-ipi.c
> > @@ -0,0 +1,81 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Multiplex several IPIs over a single HW IPI.
> > + *
> > + * Copyright (c) 2022 Ventana Micro Systems Inc.
> > + */
> > +
> > +#define pr_fmt(fmt) "riscv: " fmt
> > +#include <linux/cpu.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/percpu.h>
> > +#include <asm/sbi.h>
> > +
> > +static int sbi_ipi_virq;
> > +static DEFINE_PER_CPU_READ_MOSTLY(int, sbi_ipi_dummy_dev);
> > +
> > +static irqreturn_t sbi_ipi_handle(int irq, void *dev_id)
> > +{
> > +     csr_clear(CSR_IP, IE_SIE);
> > +     ipi_mux_process();
> > +     return IRQ_HANDLED;
>
> Urgh... I really wish I hadn't seen this. This requires a chained
> handler. You had it before, and yet you dropped it. Why?
>
> Either you call ipi_mux_process() from your root interrupt controller,
> or you implement a chained handler. But not this.
>
> Same thing about the clint stuff.

We had chained handler all along but there is problem (which
was pointed to us) in using chained handler because the parent
RISC-V INTC irqchip driver does not have irq_eoi() so the
chained_irq_enter() and chained_irq_exit() will do the interrupt
mask/unmask dance which seems unnecessary.

Is there a better way to avoid the interrupt mask/unmask dance ?

Regards,
Anup

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
