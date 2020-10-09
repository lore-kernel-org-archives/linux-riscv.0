Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6601FC433E7
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 01:54:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE35522248
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 01:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jBqhDIES";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQlab+a1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE35522248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xr3fUfHaYABu74GIEbm9ujZm76kwLTLab2W1exIVPS0=; b=jBqhDIES9ZMWpZQItTRfZ73jf
	nFjf98Us0BtfZevE9B0kZnCYWLoUAxwoNJ3yqkfaYPOhwRXeDMw/TEYcz25eCeEsp9GdTpCSoM+n6
	oaxJBIVXNfiiOHwVTc+37d07NRGBDkpNfUv8G9dC6J9mleU7EK70r6v/XLsQxI9RHTV95prWzoAn6
	wzkQrHcxgWgAryrArK1BPgzmDkxdNiGfxYUHY4ZC1W4nfgLgmdzAWwS/xrCE9uaYwfeXasQpe5aqh
	5cmYo8M/4eXNdhNOjBFqN1CYHUJuPBIuEZkiepwxzh+fQ1BSp/EN7VXjCvFUuyFBNcFEUrLsyN40O
	0VnI9rjlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQhbT-0007OH-W7; Fri, 09 Oct 2020 01:53:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQhbQ-0007Nk-Lk
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 01:53:49 +0000
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BD4622258
 for <linux-riscv@lists.infradead.org>; Fri,  9 Oct 2020 01:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602208423;
 bh=jCIrFu87d+E1x9HacgfDZzXwSuHK9+KJTI3Z1+eyGrg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vQlab+a1/Cl38vpMTmcKxX9R/giFpyoI0LiOj/h3Pml0/SnJP40BkruI/oFIdEIxE
 1qc0P16buykkFgbPa+WyCs5ETRMcz13PzMr9eRhYQJsvuuOAD+B3P1qSEXph36jBCA
 lXAh0sPnVLNPjo/lYtJN4ayqZgdkeYyJaAqL3YmU=
Received: by mail-lj1-f171.google.com with SMTP id m16so7981120ljo.6
 for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2020 18:53:43 -0700 (PDT)
X-Gm-Message-State: AOAM531Aquf/KAlN2lGiHlQlwHzmAKTcr+40TtT8KEd2zZJwzjHzND5v
 2KqyShxpyJKspYmW94T/l2DytQKpKfJTqvbl+fY=
X-Google-Smtp-Source: ABdhPJzRIpxykDRUax0a099/OVW8djIDlZt78680SFqpzIGdY54NwH7FhXdSJmz/fQfLlDZtH7SeSsV3EHpAHsu5oas=
X-Received: by 2002:a05:651c:510:: with SMTP id
 o16mr3940739ljp.79.1602208421742; 
 Thu, 08 Oct 2020 18:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <1602083313-19239-2-git-send-email-guoren@kernel.org>
 <mhng-81dee5c2-f8ee-4ab5-92d7-0e46dc952e87@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-81dee5c2-f8ee-4ab5-92d7-0e46dc952e87@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 9 Oct 2020 09:53:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS2fTQNYAtK=FfVHR8g49vfm7mQPe72xD+RRpa4C3T9Dw@mail.gmail.com>
Message-ID: <CAJF2gTS2fTQNYAtK=FfVHR8g49vfm7mQPe72xD+RRpa4C3T9Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fixup static_obj() fail v2
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_215348_841621_603018E5 
X-CRM114-Status: GOOD (  33.72  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, aurelien@aurel32.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 8, 2020 at 11:54 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
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
84814460eef9 could resolve the problem and Atish ask for any other
idea? So It's another choice, I forgot RFC in prefix.

6184358da0004c8fd940afda6c0a0fa4027dc911("riscv: Fixup static_obj()
fail") is a sloppy patch that introduces another problem. Sorry about
that.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
