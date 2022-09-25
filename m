Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F6EC04A95
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Sep 2022 23:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R9fJs51Yb6cCYIQb3XAjWJRPBX9nAomsyJTbsUv57B8=; b=1/DeNVqJFlXNI6
	AQZ/sdiosdNsFe2Eeq6lbZOaoemgYzQFybs/UtuwJ4atyOvX4kQcQXVQ0mU4O1L+zjiNpCjDZdIVA
	9Dc9ZZzeVtRybsN7mFCptmhHeCTms+p77kfjiR/ir7yTAO44Dkp1DBo/xGz8LoeKrX8k6XR1FBsvC
	0c5qAVRq/vMvxhsaqy9B2apvfMQ1i/k1Lqbt6gTKBAgJoZU12fy3Aynz03jwpQ+NH/x8LMIvgy5hv
	Yjwm2If+/HU0ZpiZWf9duoYOQGul+4yeJj84Emfz6DXyu6KMkuDIbCMAyRvh0i5eFesALqeMghsPo
	UN4MyZO2vhcnYjtZVFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocata-000AsJ-C7; Sun, 25 Sep 2022 23:18:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocatX-000Aqf-Up
	for linux-riscv@lists.infradead.org; Sun, 25 Sep 2022 23:18:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6438DB80E0D
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 23:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260FCC4314D
	for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664147920;
	bh=ir9kdaG2LaaAh6q3B/+kD0K7jgZwdQEk7RxO73YXov8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C6XHzStZMc34QAD1pUX5CZOj2iU/Xp8QgMlsGJ+JZJuiRN0ByXBaONRvBlamch0Ma
	 tjA9bWK08q4nCunFBLTtCLYi9vxzDS+mA3bLG0gaVmJwXh/ukCZRq6C+H92QOBExgQ
	 oKW5kSd9uZhha8Xy9WB9rmXoDSHbDM5MX0kGJ3RM9f3rP8ndFTqNkzMsbE6eNd4Eqy
	 Rr8/NHSryP9ma+eeCjy+/wqgXi2TfdZZMmNtuXf8cj0m7QIk5wXUlajLGngXmiY77S
	 CGnwFYJwj+HKgvxYgre5zBh5EEsreoXheuPiGAGmSEOxITXc1sGkzHgXkOL+LdAWk5
	 eGAuEFfbyxM5w==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-130af056397so7242566fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 25 Sep 2022 16:18:40 -0700 (PDT)
X-Gm-Message-State: ACrzQf1PB5iYQ5tnobOKNrRfyKtz0fHk8N13kxjNPomkTShsP8DQRIYn
	V5gozQu25I22WD9aAJ/7h2tzGvZuJJKiVeG8yPQ=
X-Google-Smtp-Source: AMsMyM5En5NGgLYHFu5c/5LTPvS4iDYtENMXq3gobkQCiXjCYHqIzdAuJ14JOjvxpya8Hqmy0rIjUt08Rfjuo7MzuhY=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr17385757oao.112.1664147919201; Sun, 25
 Sep 2022 16:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220925175356.681-1-jszhang@kernel.org> <20220925175356.681-2-jszhang@kernel.org>
In-Reply-To: <20220925175356.681-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 26 Sep 2022 07:18:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSXDYLk07yYU-fUNg12k_7+Pmm8tQDnsRHw4Ka5vX8JyA@mail.gmail.com>
Message-ID: <CAJF2gTSXDYLk07yYU-fUNg12k_7+Pmm8tQDnsRHw4Ka5vX8JyA@mail.gmail.com>
Subject: Re: [PATCH 1/4] riscv: remove extra level wrappers of trace_hardirqs_{on,off}
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_161844_352282_A6048C89 
X-CRM114-Status: GOOD (  18.37  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

I would involve the patch in the generic entry series, okay?

On Mon, Sep 26, 2022 at 2:03 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Since riscv is converted to generic entry, there's no need for the
> extra wrappers of trace_hardirqs_{on,off}.
>
> Tested with llvm + irqsoff.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/Makefile    |  2 --
>  arch/riscv/kernel/trace_irq.c | 27 ---------------------------
>  arch/riscv/kernel/trace_irq.h | 11 -----------
>  3 files changed, 40 deletions(-)
>  delete mode 100644 arch/riscv/kernel/trace_irq.c
>  delete mode 100644 arch/riscv/kernel/trace_irq.h
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 01da14e21019..11ee206cc235 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -69,8 +69,6 @@ obj-$(CONFIG_CPU_PM)          += suspend_entry.o suspend.o
>  obj-$(CONFIG_FUNCTION_TRACER)  += mcount.o ftrace.o
>  obj-$(CONFIG_DYNAMIC_FTRACE)   += mcount-dyn.o
>
> -obj-$(CONFIG_TRACE_IRQFLAGS)   += trace_irq.o
> -
>  obj-$(CONFIG_PERF_EVENTS)      += perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)   += perf_regs.o
>  obj-$(CONFIG_RISCV_SBI)                += sbi.o
> diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
> deleted file mode 100644
> index 095ac976d7da..000000000000
> --- a/arch/riscv/kernel/trace_irq.c
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
> - */
> -
> -#include <linux/irqflags.h>
> -#include <linux/kprobes.h>
> -#include "trace_irq.h"
> -
> -/*
> - * trace_hardirqs_on/off require the caller to setup frame pointer properly.
> - * Otherwise, CALLER_ADDR1 might trigger an pagging exception in kernel.
> - * Here we add one extra level so they can be safely called by low
> - * level entry code which $fp is used for other purpose.
> - */
> -
> -void __trace_hardirqs_on(void)
> -{
> -       trace_hardirqs_on();
> -}
> -NOKPROBE_SYMBOL(__trace_hardirqs_on);
> -
> -void __trace_hardirqs_off(void)
> -{
> -       trace_hardirqs_off();
> -}
> -NOKPROBE_SYMBOL(__trace_hardirqs_off);
> diff --git a/arch/riscv/kernel/trace_irq.h b/arch/riscv/kernel/trace_irq.h
> deleted file mode 100644
> index 99fe67377e5e..000000000000
> --- a/arch/riscv/kernel/trace_irq.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
> - */
> -#ifndef __TRACE_IRQ_H
> -#define __TRACE_IRQ_H
> -
> -void __trace_hardirqs_on(void);
> -void __trace_hardirqs_off(void);
> -
> -#endif /* __TRACE_IRQ_H */
> --
> 2.34.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
