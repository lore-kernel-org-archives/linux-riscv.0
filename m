Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5D7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxWNUcWxdV+pNd8RQmjt7FNNwZNOHMNVhHFlkMh2IRk=; b=yuBv+mMT2NnFDK
	qYNO3pGJo37qp6CCfxDDHzy9ipkoErewlesJhp9q2fEEgaaI/qvarjDqMGPp8ieGxuTTg4Q1+qWKv
	4sXCHKCAPEUCbBkkk5LK8FSZV4dz1Lk1A5xd6m+0pKJidAvvZaiJY6ZkorKffilx1LJg4wNTkSYa1
	vvKyBpYngShcPqAdfQCD2doHlk79lZT0Gy2ltv8eC/GTVSekLYDgFFlO8yDzyEWnLVQFg+D82iUVF
	baQXMgCbfCPjfq8dBTlO1ES3QkP0Ap9txy6IlFA6HQKsluIrWpWKYJbhRXtSTsaOHisu+d7pGM0qX
	B8fHxZa0k3OEhtyjRKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwsWD-00BOTq-AV; Mon, 13 Dec 2021 21:05:57 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwsW9-00BOS6-T6
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 21:05:55 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id e136so41413763ybc.4
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYjNY84xxrPtnEGblOzPGQWS8v7Li5XOXn2Tp1iLBGY=;
 b=cOQQaWK6nxqOwPzOEkcF+NLdghu46He4GyafQsnxU4kKmr0hWInEIeBcbv4R6HgJuz
 OiPwq7pyhIMZPfD6OiQTXBDQOo1eMI0Q3IIM+6ee/PPR1dYyi2HZfv1rGTEIMcRTd78e
 EtlpvdFuBAAq8hcw6z8iwdDjWK8bm9vvBE9fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYjNY84xxrPtnEGblOzPGQWS8v7Li5XOXn2Tp1iLBGY=;
 b=UqoI0Ntl5NQH6clBhoFHZWAwj8shQw/Lqr6vToYyYE0G0XuO4MnXguqb69dbPZyAyL
 3UM1pwewWMwB1PbSyQFfBOYUyWmLB8YJ3fxDnn5jYFvzSkl9hL53E4eWqTBEBsBRwfFh
 A2UeRWTiJeqHda8yOStbF80T1l4L1rVPU9vYYQSghDcYD2iYSMlu34xguPsWqFjMEeVe
 LfL7imyjtlQu8Ef1FW3qBwi6aMwupUFBblHIc09LjzzV2LjD4dqEZ4qi39IHtsKuaTTv
 PYjqr2zTyVS+fuRvQ3af7IwBc3a42td5QxteWQx2iDSq9QpkmWTfOxHdFaSjEe24EeGF
 xqpA==
X-Gm-Message-State: AOAM530mNo9NXKV62zKN0Pig/Jxvxe3QbVGig3ayfiBp+bFa/cMj/Twh
 1Q1Q9Ew4IO29g0T7mO53K9zG7mizYSdUQrcHg3qT
X-Google-Smtp-Source: ABdhPJwv4zvaS/MXEq/62jU1x4Jh98JJGkhOxuqvK8SRBYpuk/KNwhnQ0QlAbQZppUF4cZbzcOpESNWMSQhiKTdVi8A=
X-Received: by 2002:a5b:b92:: with SMTP id l18mr1124278ybq.10.1639429551777;
 Mon, 13 Dec 2021 13:05:51 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-2-atishp@atishpatra.org>
 <CAAhSdy2YsrGSk4P41hneNkJJg6je9fMYV9-py6vim=ZEexigOQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2YsrGSk4P41hneNkJJg6je9fMYV9-py6vim=ZEexigOQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 13:05:41 -0800
Message-ID: <CAOnJCU+cgrC=uYJjVUQzpONeMJMxW06g5eoPKB_PfDRY5tPSNw@mail.gmail.com>
Subject: Re: [RFC 1/6] RISC-V: Avoid using per cpu array for ordered booting
To: Anup Patel <anup@brainfault.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>, 
 Vincent Chen <vincent.chen@sifive.com>, Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_130554_050244_FA63F0EA 
X-CRM114-Status: GOOD (  29.42  )
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

On Mon, Dec 13, 2021 at 4:49 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Dec 4, 2021 at 5:50 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > From: Atish Patra <atishp@rivosinc.com>
> >
> > Currently both order booting and spinwait approach uses a per cpu
> > array to update stack & task pointer. This approach will not work for the
> > following cases.
> > 1. If NR_CPUs are configured to be less than highest hart id.
> > 2. A platform has sparse hartid.
> >
> > This issue can be fixed for ordered booting as the booting cpu brings up
> > one cpu at a time using SBI HSM extension which has opaque parameter
> > that is unused until now.
> >
> > Introduce a common secondary boot data structure that can store the stack
> > and task pointer. Secondary harts will use this data while booting up
> > to setup the sp & tp.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpu_ops_sbi.h | 28 ++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpu_ops_sbi.c      | 23 ++++++++++++++++++++---
> >  arch/riscv/kernel/head.S             | 19 ++++++++++---------
> >  3 files changed, 58 insertions(+), 12 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h
> >
> > diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
> > new file mode 100644
> > index 000000000000..ccb9a6d30486
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/cpu_ops_sbi.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2021 by Rivos Inc.
> > + */
> > +#ifndef __ASM_CPU_OPS_SBI_H
> > +#define __ASM_CPU_OPS_SBI_H
> > +
> > +#ifndef __ASSEMBLY__
> > +#include <linux/init.h>
> > +#include <linux/sched.h>
> > +#include <linux/threads.h>
> > +
> > +/**
> > + * struct sbi_hart_boot_data - Hart specific boot used during booting and
> > + *                            cpu hotplug.
> > + * @task_ptr: A pointer to the hart specific tp
> > + * @stack_ptr: A pointer to the hart specific sp
> > + */
> > +struct sbi_hart_boot_data {
> > +       void *task_ptr;
> > +       void *stack_ptr;
> > +};
> > +#endif
> > +
> > +#define SBI_HART_BOOT_TASK_PTR_OFFSET (0x00)
> > +#define SBI_HART_BOOT_STACK_PTR_OFFSET RISCV_SZPTR
>
> Don't manually create these defines instead generate this
> defines at compile time by adding entries in kernel/asm-offsets.c
>

Sure. I will fix this in the next version.

> > +
> > +#endif /* ifndef __ASM_CPU_OPS_H */
> > diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
> > index 685fae72b7f5..2e7a9dd9c2a7 100644
> > --- a/arch/riscv/kernel/cpu_ops_sbi.c
> > +++ b/arch/riscv/kernel/cpu_ops_sbi.c
> > @@ -7,13 +7,22 @@
> >
> >  #include <linux/init.h>
> >  #include <linux/mm.h>
> > +#include <linux/sched/task_stack.h>
> >  #include <asm/cpu_ops.h>
> > +#include <asm/cpu_ops_sbi.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> >
> >  extern char secondary_start_sbi[];
> >  const struct cpu_operations cpu_ops_sbi;
> >
> > +/*
> > + * Ordered booting via HSM brings one cpu at a time. However, cpu hotplug can
> > + * be invoked from multiple threads in paralle. Define a per cpu data
> > + * to handle that.
> > + */
> > +DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
> > +
> >  static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
> >                               unsigned long priv)
> >  {
> > @@ -58,9 +67,17 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
> >         int rc;
> >         unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
> >         int hartid = cpuid_to_hartid_map(cpuid);
> > -
> > -       cpu_update_secondary_bootdata(cpuid, tidle);
> > -       rc = sbi_hsm_hart_start(hartid, boot_addr, 0);
> > +       unsigned long hsm_data;
> > +       struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
> > +
> > +       /* Make sure tidle is updated */
> > +       smp_mb();
> > +       bdata->task_ptr = tidle;
> > +       bdata->stack_ptr = task_stack_page(tidle) + THREAD_SIZE;
> > +       /* Make sure boot data is updated */
> > +       smp_mb();
> > +       hsm_data = __pa(bdata);
> > +       rc = sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
> >
> >         return rc;
> >  }
> > diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> > index f52f01ecbeea..40d4c625513c 100644
> > --- a/arch/riscv/kernel/head.S
> > +++ b/arch/riscv/kernel/head.S
> > @@ -11,6 +11,7 @@
> >  #include <asm/page.h>
> >  #include <asm/pgtable.h>
> >  #include <asm/csr.h>
> > +#include <asm/cpu_ops_sbi.h>
> >  #include <asm/hwcap.h>
> >  #include <asm/image.h>
> >  #include "efi-header.S"
> > @@ -167,15 +168,15 @@ secondary_start_sbi:
> >         la a3, .Lsecondary_park
> >         csrw CSR_TVEC, a3
> >
> > -       slli a3, a0, LGREG
> > -       la a4, __cpu_up_stack_pointer
> > -       XIP_FIXUP_OFFSET a4
> > -       la a5, __cpu_up_task_pointer
> > -       XIP_FIXUP_OFFSET a5
> > -       add a4, a3, a4
> > -       add a5, a3, a5
> > -       REG_L sp, (a4)
> > -       REG_L tp, (a5)
> > +       /* a0 contains the hartid & a1 contains boot data */
> > +       li a2, SBI_HART_BOOT_TASK_PTR_OFFSET
> > +       XIP_FIXUP_OFFSET a2
> > +       add a2, a2, a1
> > +       REG_L tp, (a2)
> > +       li a3, SBI_HART_BOOT_STACK_PTR_OFFSET
> > +       XIP_FIXUP_OFFSET a3
> > +       add a3, a3, a1
> > +       REG_L sp, (a3)
> >
> >         .global secondary_start_common
> >  secondary_start_common:
> > --
> > 2.33.1
> >
>
> Regards,
> Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
