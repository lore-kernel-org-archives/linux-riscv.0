Return-Path: <SRS0=qek1=DP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3845BC433E7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 17:57:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C3C320657
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2020 17:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LzZZGAcK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="ii8ikpIO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C3C320657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HLdA01QgszmS4o5i31clG36hb7D9IcStMhYI3Y1JfYQ=; b=LzZZGAcK4dOyl8/Bbu/elXLw+
	J+NMZpiMshbTb6ygyhQMgIQ6ev1xd7OubKo2HnU54B9jGFp+FyaYjHEihCbM+MvlkUHZOBelbfFKs
	yA1ADRV90Io5n5MMkSYjHagsarktMs1rpIaQXOnipBJvaElfdSSEc8voklC4YVUwN34/pYDLIdwB0
	tigq/AqPUt+aLl6mNfcT/rwpUGIjUUl+69dOrIPOH6Z0iCjGFk7BZP8yANfGYrh92Vu3HCuGjOVro
	U4vK/ioradqRfSc+i8M+Q2QbFXUBicaQP0VCodBewVlBZd+pnGlHQ3A4MGbB8f+a9TogKlau3Ekui
	lC4MngkLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQaAZ-0003r2-PL; Thu, 08 Oct 2020 17:57:35 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQaAX-0003qY-UQ
 for linux-riscv@lists.infradead.org; Thu, 08 Oct 2020 17:57:34 +0000
Received: by mail-io1-xd43.google.com with SMTP id q9so7212514iow.6
 for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2020 10:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sc1QcrS0OnFC8Z5ENT4stkA4ApYYsQnf4QmtvCnzPf0=;
 b=ii8ikpIO5iCrbNmvnUM3IVdJBik2jFmcKj/6/L6sglv88wrLDoB3fvb5RjSjNymDdE
 kwDCQu97mFvcNpy+AZE6TFRMF7r9M3M1FvdmOXj4YrhY8CzEtLPCmUJO0OqK3/SNw9h7
 4Q5QvExZA8LK1fqHFYELXvX5mIklyyhuf1Tag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sc1QcrS0OnFC8Z5ENT4stkA4ApYYsQnf4QmtvCnzPf0=;
 b=fdgeLbye5Qir2g8jTV4eOE+Bwkj1zMJIW1HwNh7dXBAhB5x3DJ27Ivj7EIKeJr6Kh2
 k/ResgGDg8UjHF8cckyicaCNE2b1FmJRokL4tFQ2BLDPyUH0NreLP0IYAx6SyCOptTiL
 isp6zC0DLJcNFga78o0wBVql7u4toqw/9DpR2u+bJWKTU+Zjm09QnpdDmhZYqfDGxcpf
 aqI7xWNsxsVZCw9O9PFaZjeV+YF0dKGxdC0wOWtyy0adwBYOuCmjCjGpsQR9mMzR/WVk
 JyMHmMmbJmwzOp67stT9SsICmPbW/0vr4w8pw4wWakQxlaNzG7+7uVCiXJv3TfMefb2u
 +2xw==
X-Gm-Message-State: AOAM532mApRAV31I4qAX7CSB1FqokpJb/tUlognqxYgKOE2r0R86/67Z
 t01ZRzGoLpRHP1SfF45hgRIgsHwbDvAgP9Cw2mk9
X-Google-Smtp-Source: ABdhPJz2irCKAJJlakYrH/VYfGOA3pk6+gO7NbUD+Etms+WgWOXh+HE+0pq56h0KjlwhpJt/hkRnIhZsbSxth+K/aNg=
X-Received: by 2002:a05:6638:2b3:: with SMTP id
 d19mr7953319jaq.141.1602179850264; 
 Thu, 08 Oct 2020 10:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <1602083313-19239-2-git-send-email-guoren@kernel.org>
 <mhng-81dee5c2-f8ee-4ab5-92d7-0e46dc952e87@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-81dee5c2-f8ee-4ab5-92d7-0e46dc952e87@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 8 Oct 2020 10:57:19 -0700
Message-ID: <CAOnJCULRKOHrixBOv2JuEppj6ApHsvGAJwn-fOwUovUZQ2M_Ag@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fixup static_obj() fail v2
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_135733_995161_80268C82 
X-CRM114-Status: GOOD (  30.47  )
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
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, aurelien@aurel32.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 7, 2020 at 8:54 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Wed, 07 Oct 2020 08:08:33 PDT (-0700), guoren@kernel.org wrote:
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
> >       if (arch_is_kernel_data(addr))
> >               return 1;
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
> > +     if (init_mem_is_free)
> > +             return 0;
> > +
> > +     return addr >= (unsigned long)__init_begin &&
> > +             addr < (unsigned long)__init_end;
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
> >       return 0;
> >  }
> >  subsys_initcall(topology_init);
> > +
> > +bool init_mem_is_free = false;
> > +
> > +void free_initmem(void)
> > +{
> > +     free_initmem_default(POISON_FREE_INITMEM);
> > +     init_mem_is_free = true;
> > +}
>
> I'm a bit confused as to what you're trying to do here.  Yesterday I got
> another version of this patch set that moves init data around, today a
> different one.  Yesterday's is tested and simpler, and given it's so late in
> the process I'm inclined to take that as I don't want to break anything.
>

I agree. This version will have some more conflicts with other patches
and it's too late in cycle.
It's best to merge it in 5.10.

> Right now I have
>
> 84814460eef9 ("riscv: Fixup bootup failure with HARDENED_USERCOPY")
> a78c6f5956a9 ("RISC-V: Make sure memblock reserves the memory containing DT")
> 549738f15da0 ("Linux 5.9-rc8")
>
> Unless there's some functional bug, that's what I'm going to send out for 5.9
> -- I'm not all that worried about lacking the ability to free init data.  The
> above seems like fine 5.10 material.
>
> Let me know if I'm missing something here.



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
