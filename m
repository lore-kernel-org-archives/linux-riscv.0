Return-Path: <SRS0=qek1=DP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B5BC4363D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 02:30:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26576207C3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 02:30:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbbrrUhD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N/CoW0GN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26576207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R8MKNlniKTmYckEf8EZiqCFRQ/r7pyYwgcOm2423fQ0=; b=fbbrrUhDUOjRMCup7CPH8Y95n
	cqvHsBgYz+fggZg1+iwXOnBqPObZ4rIVnffMxDz3fBRCbYDAoUChtRrWxhyCb/25vohqy17LKfuXd
	fQMo2zbIRhYX9qenL2EX7MQenWQYAiZYI+MOHdihza9WJa2l5FTKI3IZmNn7tfy0rlnLyOCV4erWz
	Pbv/L0beeoHpCjOwyTLwJCuNdkJJXT+hHBEkeCk+vzb8Qbok06K5aIbwrBkRJxPpJBL9aTcZp3sKZ
	Gp47ilRGUSGz51DOFjctE48LokJmLQVtgyiJAq43sX652cxQR+25XfvI6UjSsWZqWaoVw+BJ/1yEc
	WrfjRoNvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQLhc-0000Yu-7f; Thu, 08 Oct 2020 02:30:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQLhZ-0000Wd-FX
 for linux-riscv@lists.infradead.org; Thu, 08 Oct 2020 02:30:42 +0000
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0971320B1F
 for <linux-riscv@lists.infradead.org>; Thu,  8 Oct 2020 02:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602124239;
 bh=tHJb3mueFHF3ie2tCZCZmBSRR7A+YvcAIjejINpLILc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N/CoW0GNNxVUUHpGA0WvFml8+Sp0+8lA8m6NZIAakDLBFkPqIQ3PzcUHYCX6TA4M9
 QcmsYeMhOxB0Yse31e0UiN1f06s8RpUd4MngaGawsG1qfxR6wwvjKdbqvMlHi7XCxK
 JqXVEwkrgasBpyZmROYTLKapb42jhVtSiXBHoXHw=
Received: by mail-lj1-f176.google.com with SMTP id r24so4080537ljm.3
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 19:30:38 -0700 (PDT)
X-Gm-Message-State: AOAM531+iB5nj57ANlimekovJ3Pnjt+2FM6qgkOw2SGm14MMGocEY529
 0WSdtqBJj3Yt2vfb6lvFzfSlQGHE2xo4AnLqP5Q=
X-Google-Smtp-Source: ABdhPJw2Ldv9SRuYUPdxQDut9elUb0E6sqEH/x598tBTYZMF0RG8TVWf9Og9Ua/GODwBnleetYvpvT8hEbBZ8UCE4lA=
X-Received: by 2002:a2e:6c08:: with SMTP id h8mr2128760ljc.66.1602124237280;
 Wed, 07 Oct 2020 19:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <1602083313-19239-1-git-send-email-guoren@kernel.org>
 <1602083313-19239-2-git-send-email-guoren@kernel.org>
 <CAOnJCU+xwnQz9tbCDjBbstOzBFT-DU-uTcc0K_M7ppT_Z-V1Fg@mail.gmail.com>
In-Reply-To: <CAOnJCU+xwnQz9tbCDjBbstOzBFT-DU-uTcc0K_M7ppT_Z-V1Fg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Oct 2020 10:30:25 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRDh=U6sP_Usvwm9C53NNBc5k_Z8UbK3gQ5+zoAGvEqzg@mail.gmail.com>
Message-ID: <CAJF2gTRDh=U6sP_Usvwm9C53NNBc5k_Z8UbK3gQ5+zoAGvEqzg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fixup static_obj() fail v2
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_223041_747489_EBD994EC 
X-CRM114-Status: GOOD (  29.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, aurelien@aurel32.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 8, 2020 at 3:46 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Oct 7, 2020 at 8:09 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > v1 is commit: 6184358da0004c8fd940afda6c0a0fa4027dc911 which has
> > been reverted.
> >
> > When enable LOCKDEP, static_obj() will cause error:
> >
> > [    0.067192] INFO: trying to register non-static key.
> > [    0.067325] the code is fine but needs lockdep annotation.
> > [    0.067449] turning off the locking correctness validator.
> > [    0.067718] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7-dirty #44
> > [    0.067945] Call Trace:
> > [    0.068369] [<ffffffe00020323c>] walk_stackframe+0x0/0xa4
> > [    0.068506] [<ffffffe000203422>] show_stack+0x2a/0x34
> > [    0.068631] [<ffffffe000521e4e>] dump_stack+0x94/0xca
> > [    0.068757] [<ffffffe000255a4e>] register_lock_class+0x5b8/0x5bc
> > [    0.068969] [<ffffffe000255abe>] __lock_acquire+0x6c/0x1d5c
> > [    0.069101] [<ffffffe0002550fe>] lock_acquire+0xae/0x312
> > [    0.069228] [<ffffffe000989a8e>] _raw_spin_lock_irqsave+0x40/0x5a
> > [    0.069357] [<ffffffe000247c64>] complete+0x1e/0x50
> > [    0.069479] [<ffffffe000984c38>] rest_init+0x1b0/0x28a
> > [    0.069660] [<ffffffe0000016a2>] 0xffffffe0000016a2
> > [    0.069779] [<ffffffe000001b84>] 0xffffffe000001b84
> > [    0.069953] [<ffffffe000001092>] 0xffffffe000001092
> >
> > Because some __initdata static variables is before _stext:
> >
> > static int static_obj(const void *obj)
> > {
> >         unsigned long start = (unsigned long) &_stext,
> >                       end   = (unsigned long) &_end,
> >                       addr  = (unsigned long) obj;
> >
> >         /*
> >          * static variable?
> >          */
> >         if ((addr >= start) && (addr < end))
> >                 return 1;
> >
> >         if (arch_is_kernel_data(addr))
> >                 return 1;
> >
> > We could implement arch_is_kernel_data to fixup it.
> >
> > Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Atish Patra <atishp@atishpatra.org>
> > Cc: Andreas Schwab <schwab@linux-m68k.org>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > ---
> >  arch/riscv/include/asm/sections.h | 20 ++++++++++++++++++++
> >  arch/riscv/kernel/setup.c         |  9 +++++++++
> >  2 files changed, 29 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/sections.h
> >
> > diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> > new file mode 100644
> > index 00000000..2317b9e
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/sections.h
>
> You may want to rebase it on top of for-next as UEFI series also adds this file.
ok

> .
>
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > +#ifndef _ASM_RISCV_SECTIONS_H
> > +#define _ASM_RISCV_SECTIONS_H
> > +
> > +#define arch_is_kernel_data arch_is_kernel_data
> > +
> > +#include <asm-generic/sections.h>
> > +
> > +extern bool init_mem_is_free;
> > +
> > +static inline int arch_is_kernel_data(unsigned long addr)
> > +{
> > +       if (init_mem_is_free)
> > +               return 0;
> > +
> > +       return addr >= (unsigned long)__init_begin &&
> > +               addr < (unsigned long)__init_end;
> > +}
> > +#endif /* _ASM_RISCV_SECTIONS_H */
> > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > index 2c6dd32..9ebd5eb4 100644
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/sched/task.h>
> >  #include <linux/swiotlb.h>
> >  #include <linux/smp.h>
> > +#include <linux/poison.h>
> >
> >  #include <asm/cpu_ops.h>
> >  #include <asm/setup.h>
> > @@ -112,3 +113,11 @@ static int __init topology_init(void)
> >         return 0;
> >  }
> >  subsys_initcall(topology_init);
> > +
> > +bool init_mem_is_free = false;
> > +
> > +void free_initmem(void)
> > +{
> > +       free_initmem_default(POISON_FREE_INITMEM);
> > +       init_mem_is_free = true;
> > +}
> > --
> > 2.7.4
> >
>
> Looks good. Much cleaner than the first approach.
> FYI: I am still looking into separating __init text & data so that
> different permissions can be applied to them.
> With this patch, we can just separate it on top of _stext.
>
>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
>
> --
> Regards,
> Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
