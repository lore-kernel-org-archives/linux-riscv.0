Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25753C433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:16:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF14322282
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:16:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sl/BfIS5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="M34auMKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF14322282
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UuRT1rz+xoCtOOGjecw32oXdJ3rBqzBs04HKg6ISEuo=; b=sl/BfIS50wRnpNbR3t9qC26lD
	Y+ZmyD20rskWuW1l9v9leXLU+I8o3WxOSc0drXq3KgKycG8S8snvDNihQbmxN1dbbNaRzoLVNwsZq
	C5+0KtfAEqvmRnwOLohpSUu+5QGiHE6A05k5+ZE63DsiHRSrjtz5U+CONxbdKNdxj9/Wfb2lglpaa
	IWXCp3q5HhaweB8FtsH6u7AZEPKA9W6OTQa+0btht3xDuwCBH8xWwM0VFXtZTlG6FwCjnhXmUpWk2
	sCoLPbu9tsMqhXSEs34mmqO4RXACxtSwSFYtNYkbOmyR+5wgbdsXovwpgNQqfoyIfG6BWfkHf8iLW
	6Z1ZIQfLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQzkQ-00059C-MJ; Fri, 09 Oct 2020 21:16:18 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQzkN-00058E-ML
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:16:16 +0000
Received: by mail-io1-xd44.google.com with SMTP id k6so11669870ior.2
 for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2020 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cj0AOr19taccvBKtxwBkDF7KCRmextTNA9u4OCHvj9Q=;
 b=M34auMKs1ahm9/p7uy8MqFSqqP2PLqC63j1cWuQCZWPpbX6wNNNN+jxwm8y+pyRdIC
 w1S682tD9Xbr+GEBUqWoUXSgv5RHFuhL4/Wd9y4Pa2vP38/F796ZyRCwdkJmvkBVTuan
 qApwUd+FVK2QnEoTMQzE9ooT/IV1JqJpv0FCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cj0AOr19taccvBKtxwBkDF7KCRmextTNA9u4OCHvj9Q=;
 b=FUtveQ3Z5yMxfg4UMOC2bDbepxilZFkHI280Z4aoWeLxLBuT/Ez6YUqVWTnNVyxpEo
 Ccu1y89ww/TDPtgyM5PQNtWUb+C+QTPAZOgltccPB6tW9MGXjaFWvqfeE5zkBfbq8AgP
 t8lN05QlUXe06AjqxQRpnyBUyc2vffZjKv7DtEZj/bwUt1iA6kVQYJxqsUIjE34E83B/
 UcAqy8zf0g/8umvB7Ks/A7mFfFQvaQuDMPi9mWcx5GUW6eGsXpLzIN4HVK071UfIolc0
 DpzQYBMdIXkBqHoSrpvj1HjqTZQxdZDdGQPqr2A/DUwNy8hafIODNCmL+MDTJPhNphrm
 DxIQ==
X-Gm-Message-State: AOAM532ZiJboKAPWqeG675Tl7eWzBgLQSFTzaARIh07ZEefhTwcbMx0G
 VeaLmNCSHzOKJ80V66JB12zfEPKdd/A11KR+cX5k
X-Google-Smtp-Source: ABdhPJxkgl4vNLERrb5Gargj+UTG7edsH7GwiClpb5zouGJfu70iqMCIbxTYFwjIxcS2AXtopjJktwQch75NBz+Jn4Q=
X-Received: by 2002:a05:6638:2b3:: with SMTP id
 d19mr12269215jaq.141.1602278172649; 
 Fri, 09 Oct 2020 14:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <1602083313-19239-2-git-send-email-guoren@kernel.org>
 <mhng-81dee5c2-f8ee-4ab5-92d7-0e46dc952e87@palmerdabbelt-glaptop1>
 <CAJF2gTS2fTQNYAtK=FfVHR8g49vfm7mQPe72xD+RRpa4C3T9Dw@mail.gmail.com>
In-Reply-To: <CAJF2gTS2fTQNYAtK=FfVHR8g49vfm7mQPe72xD+RRpa4C3T9Dw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 Oct 2020 14:16:00 -0700
Message-ID: <CAOnJCUKcs8quZdHDx6SZ0USbOifE1D_zeL7XaGqMr+-DuN1MwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fixup static_obj() fail v2
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171615_769394_CFB87AD6 
X-CRM114-Status: GOOD (  35.48  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, aurelien@aurel32.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 8, 2020 at 6:53 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Thu, Oct 8, 2020 at 11:54 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> >
> > On Wed, 07 Oct 2020 08:08:33 PDT (-0700), guoren@kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > v1 is commit: 6184358da0004c8fd940afda6c0a0fa4027dc911 which has
> > > been reverted.
> > >
> > > When enable LOCKDEP, static_obj() will cause error:
> > >
> > > [    0.067192] INFO: trying to register non-static key.
> > > [    0.067325] the code is fine but needs lockdep annotation.
> > > [    0.067449] turning off the locking correctness validator.
> > > [    0.067718] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7-dirty #44
> > > [    0.067945] Call Trace:
> > > [    0.068369] [<ffffffe00020323c>] walk_stackframe+0x0/0xa4
> > > [    0.068506] [<ffffffe000203422>] show_stack+0x2a/0x34
> > > [    0.068631] [<ffffffe000521e4e>] dump_stack+0x94/0xca
> > > [    0.068757] [<ffffffe000255a4e>] register_lock_class+0x5b8/0x5bc
> > > [    0.068969] [<ffffffe000255abe>] __lock_acquire+0x6c/0x1d5c
> > > [    0.069101] [<ffffffe0002550fe>] lock_acquire+0xae/0x312
> > > [    0.069228] [<ffffffe000989a8e>] _raw_spin_lock_irqsave+0x40/0x5a
> > > [    0.069357] [<ffffffe000247c64>] complete+0x1e/0x50
> > > [    0.069479] [<ffffffe000984c38>] rest_init+0x1b0/0x28a
> > > [    0.069660] [<ffffffe0000016a2>] 0xffffffe0000016a2
> > > [    0.069779] [<ffffffe000001b84>] 0xffffffe000001b84
> > > [    0.069953] [<ffffffe000001092>] 0xffffffe000001092
> > >
> > > Because some __initdata static variables is before _stext:
> > >
> > > static int static_obj(const void *obj)
> > > {
> > >         unsigned long start = (unsigned long) &_stext,
> > >                       end   = (unsigned long) &_end,
> > >                       addr  = (unsigned long) obj;
> > >
> > >         /*
> > >          * static variable?
> > >          */
> > >         if ((addr >= start) && (addr < end))
> > >                 return 1;
> > >
> > >       if (arch_is_kernel_data(addr))
> > >               return 1;
> > >
> > > We could implement arch_is_kernel_data to fixup it.
> > >
> > > Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > Cc: Atish Patra <atishp@atishpatra.org>
> > > Cc: Andreas Schwab <schwab@linux-m68k.org>
> > > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  arch/riscv/include/asm/sections.h | 20 ++++++++++++++++++++
> > >  arch/riscv/kernel/setup.c         |  9 +++++++++
> > >  2 files changed, 29 insertions(+)
> > >  create mode 100644 arch/riscv/include/asm/sections.h
> > >
> > > diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> > > new file mode 100644
> > > index 00000000..2317b9e
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/sections.h
> > > @@ -0,0 +1,20 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +
> > > +#ifndef _ASM_RISCV_SECTIONS_H
> > > +#define _ASM_RISCV_SECTIONS_H
> > > +
> > > +#define arch_is_kernel_data arch_is_kernel_data
> > > +
> > > +#include <asm-generic/sections.h>
> > > +
> > > +extern bool init_mem_is_free;
> > > +
> > > +static inline int arch_is_kernel_data(unsigned long addr)
> > > +{
> > > +     if (init_mem_is_free)
> > > +             return 0;
> > > +
> > > +     return addr >= (unsigned long)__init_begin &&
> > > +             addr < (unsigned long)__init_end;
> > > +}
> > > +#endif /* _ASM_RISCV_SECTIONS_H */
> > > diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> > > index 2c6dd32..9ebd5eb4 100644
> > > --- a/arch/riscv/kernel/setup.c
> > > +++ b/arch/riscv/kernel/setup.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/sched/task.h>
> > >  #include <linux/swiotlb.h>
> > >  #include <linux/smp.h>
> > > +#include <linux/poison.h>
> > >
> > >  #include <asm/cpu_ops.h>
> > >  #include <asm/setup.h>
> > > @@ -112,3 +113,11 @@ static int __init topology_init(void)
> > >       return 0;
> > >  }
> > >  subsys_initcall(topology_init);
> > > +
> > > +bool init_mem_is_free = false;
> > > +
> > > +void free_initmem(void)
> > > +{
> > > +     free_initmem_default(POISON_FREE_INITMEM);
> > > +     init_mem_is_free = true;
> > > +}
> >
> > I'm a bit confused as to what you're trying to do here.  Yesterday I got
> > another version of this patch set that moves init data around, today a
> > different one.  Yesterday's is tested and simpler, and given it's so late in
> > the process I'm inclined to take that as I don't want to break anything.
> >
> > Right now I have
> >
> > 84814460eef9 ("riscv: Fixup bootup failure with HARDENED_USERCOPY")
> > a78c6f5956a9 ("RISC-V: Make sure memblock reserves the memory containing DT")
> > 549738f15da0 ("Linux 5.9-rc8")
> >
> > Unless there's some functional bug, that's what I'm going to send out for 5.9
> > -- I'm not all that worried about lacking the ability to free init data.  The
> > above seems like fine 5.10 material.
> >
> > Let me know if I'm missing something here.
> 84814460eef9 could resolve the problem and Atish ask for any other
> idea? So It's another choice, I forgot RFC in prefix.
>

I prefer this fix as it is cleaner and doesn't waste memory. I have
sent another series
on top of this fix, that addresses the init section protections we
talked about. All of these are definitely
next merge window material.

> 6184358da0004c8fd940afda6c0a0fa4027dc911("riscv: Fixup static_obj()
> fail") is a sloppy patch that introduces another problem. Sorry about
> that.
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
