Return-Path: <SRS0=wFsd=DO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8993BC4363C
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 19:46:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD516206F4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2020 19:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y/jT+yjI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="OB47xNTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD516206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I8B6IOEJARciy8z7ZBhHuph6HVoKeaPpBt/NrGu40Y4=; b=y/jT+yjIby+2+vBDZfmuCi1Xi
	zqU1+0fmbshGTw4fgB1vtFODug0ccHvXS+Ps3NEwd+3tmaEChVTmYH6eJnUoU+SIS6iuLVMnP82ld
	HvlxS173ax8N6oabcK6KE68AdBP6/+8RK01AvQEoOrSTCtZQxoctFtObSb5WKd0AG17+ynbS8f2C9
	TH2OFYWwn7cJilUKlz20Ci7z2oEYrEDe1M8/HaD2GBYHPzBry18zAIXe7iKLc/lMsElMh/CbR97CI
	om4vfbx5gnfiY44Nl5ZtxSXhOd33Gzdw9ZHIrFRNahMquqxYOBbpn6YlwcGKnI1ie90VEKUw7lkv/
	3dwsGed6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQFOS-0006R1-Uj; Wed, 07 Oct 2020 19:46:32 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQFOQ-0006QK-ED
 for linux-riscv@lists.infradead.org; Wed, 07 Oct 2020 19:46:31 +0000
Received: by mail-il1-x144.google.com with SMTP id q7so3458879ile.8
 for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2020 12:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JM6PxcQ3LGHks2+mGz99vC/06U4p761keHZ7ERniGBY=;
 b=OB47xNTS1zJv6s44IjAotftweuAKfy2y2v+sX2nYd26rFOIpOhdVVZUdCVjO+r9KDA
 MsasD6B8z2bGQOVcYu6zy5ZcBsSoHWM52A3aLPOq+m//HxowaJc/iDFp85eh14jQQppD
 o9ujPINYXfSwctbHtM7fXcDkMNPsDALnun0/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JM6PxcQ3LGHks2+mGz99vC/06U4p761keHZ7ERniGBY=;
 b=RcMZGjh8BbIlBF779S/yB8dlmnnROR6TfaewQw9cF8U7yzRosegroqKcccSbt5hEkB
 y8DjehCcJ8Tw/viY9KbToQJwSUpq+l9Y5GA4t4XAw3AZbFEeH8Tjpush/Rk5of3DaELd
 P25amInWk4eYDR4LJiG3NiJ4iYZvVRqe/qgdBzcb4pYNiP4kDigviZNjGVvxyG116H+K
 qQdK9qSXThtjTmjbiBE1XRNtUZx4EU1BGlCok3xrMAGpy1JKX5hYZY8Kl/3sRpV1VEb8
 EpQOf2hwOaVnLHfG3eeGE3QZX8O2FRA0f7jClMkBZifcXuBaADWpfKd1C/0TKcvbV4O1
 TxqQ==
X-Gm-Message-State: AOAM532XsRe8jV7M38Eh10npGwPLajo+F7oOJiBmhyMr/DlyGY6roIrq
 zOVMWIGjgA76uM/6tSvgmwjwoS5LxZZUj0NBfbI1bnX4wIY3
X-Google-Smtp-Source: ABdhPJxvJpcWYRR+CXcZhf02pO5Q0FuWDjQ3poFL2YnWfxqvvvzu2AoisfS6JoNWihbR4svKiMNb2c8lw+lmLPvbCYM=
X-Received: by 2002:a92:91db:: with SMTP id e88mr3847157ill.126.1602099988095; 
 Wed, 07 Oct 2020 12:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <1602083313-19239-1-git-send-email-guoren@kernel.org>
 <1602083313-19239-2-git-send-email-guoren@kernel.org>
In-Reply-To: <1602083313-19239-2-git-send-email-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Oct 2020 12:46:17 -0700
Message-ID: <CAOnJCU+xwnQz9tbCDjBbstOzBFT-DU-uTcc0K_M7ppT_Z-V1Fg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: Fixup static_obj() fail v2
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_154630_567237_247C8717 
X-CRM114-Status: GOOD (  23.21  )
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

On Wed, Oct 7, 2020 at 8:09 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> v1 is commit: 6184358da0004c8fd940afda6c0a0fa4027dc911 which has
> been reverted.
>
> When enable LOCKDEP, static_obj() will cause error:
>
> [    0.067192] INFO: trying to register non-static key.
> [    0.067325] the code is fine but needs lockdep annotation.
> [    0.067449] turning off the locking correctness validator.
> [    0.067718] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc7-dirty #44
> [    0.067945] Call Trace:
> [    0.068369] [<ffffffe00020323c>] walk_stackframe+0x0/0xa4
> [    0.068506] [<ffffffe000203422>] show_stack+0x2a/0x34
> [    0.068631] [<ffffffe000521e4e>] dump_stack+0x94/0xca
> [    0.068757] [<ffffffe000255a4e>] register_lock_class+0x5b8/0x5bc
> [    0.068969] [<ffffffe000255abe>] __lock_acquire+0x6c/0x1d5c
> [    0.069101] [<ffffffe0002550fe>] lock_acquire+0xae/0x312
> [    0.069228] [<ffffffe000989a8e>] _raw_spin_lock_irqsave+0x40/0x5a
> [    0.069357] [<ffffffe000247c64>] complete+0x1e/0x50
> [    0.069479] [<ffffffe000984c38>] rest_init+0x1b0/0x28a
> [    0.069660] [<ffffffe0000016a2>] 0xffffffe0000016a2
> [    0.069779] [<ffffffe000001b84>] 0xffffffe000001b84
> [    0.069953] [<ffffffe000001092>] 0xffffffe000001092
>
> Because some __initdata static variables is before _stext:
>
> static int static_obj(const void *obj)
> {
>         unsigned long start = (unsigned long) &_stext,
>                       end   = (unsigned long) &_end,
>                       addr  = (unsigned long) obj;
>
>         /*
>          * static variable?
>          */
>         if ((addr >= start) && (addr < end))
>                 return 1;
>
>         if (arch_is_kernel_data(addr))
>                 return 1;
>
> We could implement arch_is_kernel_data to fixup it.
>
> Link: https://lore.kernel.org/linux-riscv/1593266228-61125-1-git-send-email-guoren@kernel.org/T/#t
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Atish Patra <atishp@atishpatra.org>
> Cc: Andreas Schwab <schwab@linux-m68k.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/include/asm/sections.h | 20 ++++++++++++++++++++
>  arch/riscv/kernel/setup.c         |  9 +++++++++
>  2 files changed, 29 insertions(+)
>  create mode 100644 arch/riscv/include/asm/sections.h
>
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> new file mode 100644
> index 00000000..2317b9e
> --- /dev/null
> +++ b/arch/riscv/include/asm/sections.h

You may want to rebase it on top of for-next as UEFI series also adds this file.
.

> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_RISCV_SECTIONS_H
> +#define _ASM_RISCV_SECTIONS_H
> +
> +#define arch_is_kernel_data arch_is_kernel_data
> +
> +#include <asm-generic/sections.h>
> +
> +extern bool init_mem_is_free;
> +
> +static inline int arch_is_kernel_data(unsigned long addr)
> +{
> +       if (init_mem_is_free)
> +               return 0;
> +
> +       return addr >= (unsigned long)__init_begin &&
> +               addr < (unsigned long)__init_end;
> +}
> +#endif /* _ASM_RISCV_SECTIONS_H */
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c6dd32..9ebd5eb4 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -17,6 +17,7 @@
>  #include <linux/sched/task.h>
>  #include <linux/swiotlb.h>
>  #include <linux/smp.h>
> +#include <linux/poison.h>
>
>  #include <asm/cpu_ops.h>
>  #include <asm/setup.h>
> @@ -112,3 +113,11 @@ static int __init topology_init(void)
>         return 0;
>  }
>  subsys_initcall(topology_init);
> +
> +bool init_mem_is_free = false;
> +
> +void free_initmem(void)
> +{
> +       free_initmem_default(POISON_FREE_INITMEM);
> +       init_mem_is_free = true;
> +}
> --
> 2.7.4
>

Looks good. Much cleaner than the first approach.
FYI: I am still looking into separating __init text & data so that
different permissions can be applied to them.
With this patch, we can just separate it on top of _stext.


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
