Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACD2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 12:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueolSKnAbmus3klYTec8wSmzzPt079wzr/LW7BlTMe4=; b=UGe+YBcq5qgPJP
	Lxs8S2vW6/6RrZMI7hwE06rIFYbeWg/Lj7hmIHsZwwqqvaMsLBaHr1RateNXexYkJaZObjeUuXznQ
	PwwqsAWXBV/uw07Xd0JMi74r4Zu7h41XSb4kuxuQ6BFQYi+wogY7DSdeI7DRfbxF8SQ4GTAQwPZQY
	drB5+UXQmVSyKh78XDLySiJmNEPh6Fi7ou4CISDk199cT7NUnYNwWDoVKp+1BNfQyqyseqSOdx2BL
	W8BREjLi5TVo5z6dYPxWlyTgmuBLjwF6Nm4dK0fOHeKgjyTpC9GU4YFTM8bxExfePcf+ZiB1LM5oU
	XQF7FUbquXh1po9KziRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH3IP-00AAoB-4v; Mon, 07 Feb 2022 12:39:05 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH3IL-00AAmX-Mv
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 12:39:03 +0000
Received: by mail-qk1-x72c.google.com with SMTP id o10so10769507qkg.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Feb 2022 04:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DkD54i2Pug3GcN0vGMXIwskw5kZ403zclucyP/4FADw=;
 b=jejLNq9ZkAUM/1vtLhdi/Te45wokvj6FjwIW8AlLB1k5NEm5TM5g0CwJk0HDNunq/c
 6W4b+6p5XRj7BipndV9DVl6qeBQUDxuA2t9aVfsgHBtTUreGRF2VJlsJST0i7l+dGEAU
 jXKut7VfVCZ2E+hEy2gkxGuFJNezlflnLtRFakk/VIJbd/sgO3BccmoGlfvC0JCvzp3J
 2tMID7ZZ1b4NXRSy1Ykde3PurFm0gp35wEBgEZsJn2KO1xguHtzTQjSW4F1PNUcl8+b4
 HdNHI0HdCBlheN6vmAvm84gJKD5z/UurHEfshXaDAVDLPeLnCNSSIeFWZs/nklfcXELn
 Gzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DkD54i2Pug3GcN0vGMXIwskw5kZ403zclucyP/4FADw=;
 b=WHuW9u7zyaB3rnem4qZuWyH0F+NzCLsfijTFThoW0XXYL/39rBhrMNilpUI9xmI1aq
 t4B5fIPMo2M20NkzE9LPancZoK2U5L4Xa+f7gojhEe2fvCIl+yAUbMUQL8y+QQYknNlQ
 I7pAl3GhR7ylEK4xjxFrkGPiCw02+SpxhqwkV55QEAr5KdKqxr4zFYkfkYYDWswxz7Zc
 hp+Q7UVwCXJYi0sxqGNTxs0ok29KW/y5urLpuHK9wUoidd4LtNT34HDioHZhYjsk51uU
 bwmsJddjiKHu2FiG5W/baf/buQzZne53XnoF1RPiwxTkr2PwSZ9wyQU0R9SOzf27Ma06
 41vw==
X-Gm-Message-State: AOAM5335xlt40fbptj9tphjMNo7wvem393wVkfKdIDiJeu6UsUwFY5YX
 wk58xhJgG466bunnMsMbfFE=
X-Google-Smtp-Source: ABdhPJyZ0PJvzdTaMnj9syEuoj2Q+oZ9zjRD3eKKtBRLXKGxSCHQAcviLNhn4SyqNt+ctfVL07Y++g==
X-Received: by 2002:a05:620a:2443:: with SMTP id
 h3mr6108230qkn.258.1644237538894; 
 Mon, 07 Feb 2022 04:38:58 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id 134sm5114278qkl.50.2022.02.07.04.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 04:38:58 -0800 (PST)
Date: Mon, 7 Feb 2022 20:38:50 +0800
From: ChangbinCONFIG_IRQSOFF_TRACER Du <changbin.du@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: fix oops caused by irq on/off tracer
Message-ID: <20220207123850.l4r5qjswaegwisbx@mail.google.com>
References: <20220129004226.32868-1-changbin.du@gmail.com>
 <YgAEb425uqy5/dw1@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgAEb425uqy5/dw1@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_043901_787437_B525C6E6 
X-CRM114-Status: GOOD (  31.22  )
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

On Mon, Feb 07, 2022 at 01:25:03AM +0800, Jisheng Zhang wrote:
> On Sat, Jan 29, 2022 at 08:42:26AM +0800, Changbin Du wrote:
> > The trace_hardirqs_on/off requires at least two parent call frames.
> > If not, the code generated by CALLER_ADDR1 (aka. ftrace_return_address(1))
> > could trigger memory access fault.
> > 
> > [    0.039615][    T0] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000f8
> > [    0.041925][    T0] Oops [#1]
> > [    0.042063][    T0] Modules linked in:
> > [    0.042864][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.0-rc1-00233-g9a20c48d1ed2 #29
> > [    0.043568][    T0] Hardware name: riscv-virtio,qemu (DT)
> > [    0.044343][    T0] epc : trace_hardirqs_on+0x56/0xe2
> > [    0.044601][    T0]  ra : restore_all+0x12/0x6e
> > [    0.044721][    T0] epc : ffffffff80126a5c ra : ffffffff80003b94 sp : ffffffff81403db0
> > [    0.044801][    T0]  gp : ffffffff8163acd8 tp : ffffffff81414880 t0 : 0000000000000020
> > [    0.044882][    T0]  t1 : 0098968000000000 t2 : 0000000000000000 s0 : ffffffff81403de0
> > [    0.044967][    T0]  s1 : 0000000000000000 a0 : 0000000000000001 a1 : 0000000000000100
> > [    0.045046][    T0]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> > [    0.045124][    T0]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000054494d45
> > [    0.045210][    T0]  s2 : ffffffff80003b94 s3 : ffffffff81a8f1b0 s4 : ffffffff80e27b50
> > [    0.045289][    T0]  s5 : ffffffff81414880 s6 : ffffffff8160fa00 s7 : 00000000800120e8
> > [    0.045389][    T0]  s8 : 0000000080013100 s9 : 000000000000007f s10: 0000000000000000
> > [    0.045474][    T0]  s11: 0000000000000000 t3 : 7fffffffffffffff t4 : 0000000000000000
> > [    0.045548][    T0]  t5 : 0000000000000000 t6 : ffffffff814aa368
> > [    0.045620][    T0] status: 0000000200000100 badaddr: 00000000000000f8 cause: 000000000000000d
> > [    0.046402][    T0] [<ffffffff80003b94>] restore_all+0x12/0x6e
> > 
> 
> Hi Changbin,
> 
> Could you please provide the reproduce steps? It looks a bit
> interesting.
>
Just enable CONFIG_IRQSOFF_TRACER and rebuild kernel with llvm. Then boot the
new kernel.

> > To fix above issue, here we add one extra level wrapper so they can be
> > safely called by low level entry code.
> > 
> > Signed-off-by: Changbin Du <changbin.du@gmail.com>
> > 
> > ---
> > v2: fix compile warning.
> > ---
> >  arch/riscv/kernel/Makefile    |  2 ++
> >  arch/riscv/kernel/entry.S     | 10 +++++-----
> >  arch/riscv/kernel/trace_irq.c | 26 ++++++++++++++++++++++++++
> >  arch/riscv/kernel/trace_irq.h | 11 +++++++++++
> >  4 files changed, 44 insertions(+), 5 deletions(-)
> >  create mode 100644 arch/riscv/kernel/trace_irq.c
> >  create mode 100644 arch/riscv/kernel/trace_irq.h
> > 
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index 612556faa527..ffc87e76b1dd 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -51,6 +51,8 @@ obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
> >  obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
> >  obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
> >  
> > +obj-$(CONFIG_TRACE_IRQFLAGS)	+= trace_irq.o
> > +
> >  obj-$(CONFIG_RISCV_BASE_PMU)	+= perf_event.o
> >  obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
> >  obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index ed29e9c8f660..d6a46ed0bf05 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -108,7 +108,7 @@ _save_context:
> >  .option pop
> >  
> >  #ifdef CONFIG_TRACE_IRQFLAGS
> > -	call trace_hardirqs_off
> > +	call __trace_hardirqs_off
> >  #endif
> >  
> >  #ifdef CONFIG_CONTEXT_TRACKING
> > @@ -143,7 +143,7 @@ skip_context_tracking:
> >  	li t0, EXC_BREAKPOINT
> >  	beq s4, t0, 1f
> >  #ifdef CONFIG_TRACE_IRQFLAGS
> > -	call trace_hardirqs_on
> > +	call __trace_hardirqs_on
> >  #endif
> >  	csrs CSR_STATUS, SR_IE
> >  
> > @@ -234,7 +234,7 @@ ret_from_exception:
> >  	REG_L s0, PT_STATUS(sp)
> >  	csrc CSR_STATUS, SR_IE
> >  #ifdef CONFIG_TRACE_IRQFLAGS
> > -	call trace_hardirqs_off
> > +	call __trace_hardirqs_off
> >  #endif
> >  #ifdef CONFIG_RISCV_M_MODE
> >  	/* the MPP value is too large to be used as an immediate arg for addi */
> > @@ -270,10 +270,10 @@ restore_all:
> >  	REG_L s1, PT_STATUS(sp)
> >  	andi t0, s1, SR_PIE
> >  	beqz t0, 1f
> > -	call trace_hardirqs_on
> > +	call __trace_hardirqs_on
> >  	j 2f
> >  1:
> > -	call trace_hardirqs_off
> > +	call __trace_hardirqs_off
> >  2:
> >  #endif
> >  	REG_L a0, PT_STATUS(sp)
> > diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
> > new file mode 100644
> > index 000000000000..fc194c56a35d
> > --- /dev/null
> > +++ b/arch/riscv/kernel/trace_irq.c
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
> > + */
> > +
> > +#include <linux/irqflags.h>
> > +#include <linux/kprobes.h>
> > +#include "trace_irq.h"
> > +
> > +/**
> > + * trace_hardirqs_on/off requires at least two parent call frames.
> > + * Here we add one extra level so they can be safely called by low
> > + * level entry code.
> > + */
> 
> Hmm, I believe there's elegant solution without this grue, maybe
> fix in stacktrace implementation or something else?
> 
This is not about stacktrace. As describe in commit msg, the problem is
introduced by ftrace_return_address(1). The complier doesn't have knowledge
about how many frames available at rumtime and wether each frame is valid.

> 
> > +
> > +void __trace_hardirqs_on(void)
> > +{
> > +	trace_hardirqs_on();
> > +}
> > +NOKPROBE_SYMBOL(__trace_hardirqs_on);
> > +
> > +void __trace_hardirqs_off(void)
> > +{
> > +	trace_hardirqs_off();
> > +}
> > +NOKPROBE_SYMBOL(__trace_hardirqs_off);
> > diff --git a/arch/riscv/kernel/trace_irq.h b/arch/riscv/kernel/trace_irq.h
> > new file mode 100644
> > index 000000000000..99fe67377e5e
> > --- /dev/null
> > +++ b/arch/riscv/kernel/trace_irq.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
> > + */
> > +#ifndef __TRACE_IRQ_H
> > +#define __TRACE_IRQ_H
> > +
> > +void __trace_hardirqs_on(void);
> > +void __trace_hardirqs_off(void);
> > +
> > +#endif /* __TRACE_IRQ_H */
> > -- 
> > 2.32.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
