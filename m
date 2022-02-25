Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8659C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Feb 2022 00:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ5PqYdRHt/R8n1+wgByykhuO70R13ayA2B9dljwOrY=; b=e39LBdxfCAB56M
	uFcGEV5jgyUcu2slz5v/oTe8sPR6FAd2uD2OQDQtP90OoLpJmtLNZt9A/PGq9x8CQ6kSBPzL9vpAp
	gDJWRTH/G85gFp/THuitnfXrA6VckALdh3Zu/glJ6ur3sVRmNPMhbef/WIZHr92Y688qCs32SP8f5
	pmmC+JpP72Yn0ZUeRjprhQe0qvB4wBEbfukLcmpT+uu131RVtvvhyTpw7f7/HSY48+7h184V8zCUE
	Nnh5hU0lo3p7o9npdB1zWimOXEszSHrwSHcVHcoOwsm1w/GXQWPcT/NM66vTwWpzI8mEXMUlBu8Ad
	WJFtMwHcGca1bpRhrzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNOBY-002lV4-O2; Fri, 25 Feb 2022 00:10:12 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNOBU-002lUL-Fv
 for linux-riscv@lists.infradead.org; Fri, 25 Feb 2022 00:10:10 +0000
Received: by mail-qk1-x736.google.com with SMTP id f10so3239379qkg.9
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 16:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q3CZZYtJeP2l+fxZkQ3EE8z5FRZjqoAzMgZD2lUMhaY=;
 b=NRkreSDDXeHNVpp+KFf6lQSzOPpT9NHg2GR/fPCDbm1eCzU+Rtdpor+JhP6a8uqIzb
 Fw4y5Ob2v1bb3nMN8dpAxK5Ohmovip3TND9+tPlBksVABsi4v53UNL1Xi+iV29Hsklff
 yq4PN5BAs7KUjz06ZWKols8vMwffplq/2UKgEXFa0V3dYxxfJzdc606AdoUjLzIzLLNo
 +/DRiE/zLlBIHyW/rK2x/x+u0wTVNc01Pd8N1aDuR7pXGpn4r6IBR26h09NS9hArRB46
 Xy3jZZ9ZYcq5IJ/g2bBUKJtEti3kQv6v7a6idW3cHcGUbSc6uDC+dz5ZdBtdsOXe9EUO
 EEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q3CZZYtJeP2l+fxZkQ3EE8z5FRZjqoAzMgZD2lUMhaY=;
 b=u4tEM8UdmAVvs13yEjQt63iOoSakVzNVZnDySS8BOzywydacC/LrBWpmcx9+riZvFi
 h7Nd23QzR9X/yGpIBqtuyFSiGiA8YosxRaSAeIpPDe/b44Pm0Xxv035n06ebijwlZ18p
 Q5irHsXVjSYDhxIlosH4wY/cprEzemsW0YxwKbLSvpAKmKtgFZW68ir56B8sK6PAoju0
 0IESTRvw4O4P9Rf802jKVLpa8iXCB184O4b9f0HJZLHvdQXiocw3wT0vt/GQCvh9ku48
 rEUem2NbysTC3xKvfB1y6SyUGeX6d+GZBfbW6ByzwKVlmnwvxoB87BG/pT7b625LodIR
 l5jw==
X-Gm-Message-State: AOAM533EqmPcooLbzMuisBLOGeA+ttqPjC1II0t1wGvBKjTwCpls5WR1
 iOqTB70P7e11y3FhW5qRuAo=
X-Google-Smtp-Source: ABdhPJyspLle6NbiBmylr3EspweP3JKDTgqfBvWF9lLpytXvapkdzq4IJrEMzXuwpUS7dqZh8blbLw==
X-Received: by 2002:a05:620a:1124:b0:62c:eb56:d7a9 with SMTP id
 p4-20020a05620a112400b0062ceb56d7a9mr3439793qkk.353.1645747806474; 
 Thu, 24 Feb 2022 16:10:06 -0800 (PST)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a37a616000000b00547b8839339sm523743qke.77.2022.02.24.16.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 16:10:06 -0800 (PST)
Date: Fri, 25 Feb 2022 08:10:00 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Changbin Du <changbin.du@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: fix oops caused by irqsoff latency tracer
Message-ID: <20220225001000.ccxaotz6v64ldlap@mail.google.com>
References: <20220213081845.9864-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220213081845.9864-1-changbin.du@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_161008_569625_A7BE42B0 
X-CRM114-Status: GOOD (  25.45  )
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

hello, kindly ping for review status. :)

On Sun, Feb 13, 2022 at 04:18:45PM +0800, Changbin Du wrote:
> The trace_hardirqs_{on,off}() require the caller to setup frame pointer
> properly. This because these two functions use macro 'CALLER_ADDR1' (aka.
> __builtin_return_address(1)) to acquire caller info. If the $fp is used
> for other purpose, the code generated this macro (as below) could trigger
> memory access fault.
> 
>    0xffffffff8011510e <+80>:    ld      a1,-16(s0)
>    0xffffffff80115112 <+84>:    ld      s2,-8(a1)  # <-- paging fault here
> 
> The oops message during booting if compiled with 'irqoff' tracer enabled:
> [    0.039615][    T0] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000f8
> [    0.041925][    T0] Oops [#1]
> [    0.042063][    T0] Modules linked in:
> [    0.042864][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.0-rc1-00233-g9a20c48d1ed2 #29
> [    0.043568][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.044343][    T0] epc : trace_hardirqs_on+0x56/0xe2
> [    0.044601][    T0]  ra : restore_all+0x12/0x6e
> [    0.044721][    T0] epc : ffffffff80126a5c ra : ffffffff80003b94 sp : ffffffff81403db0
> [    0.044801][    T0]  gp : ffffffff8163acd8 tp : ffffffff81414880 t0 : 0000000000000020
> [    0.044882][    T0]  t1 : 0098968000000000 t2 : 0000000000000000 s0 : ffffffff81403de0
> [    0.044967][    T0]  s1 : 0000000000000000 a0 : 0000000000000001 a1 : 0000000000000100
> [    0.045046][    T0]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
> [    0.045124][    T0]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000054494d45
> [    0.045210][    T0]  s2 : ffffffff80003b94 s3 : ffffffff81a8f1b0 s4 : ffffffff80e27b50
> [    0.045289][    T0]  s5 : ffffffff81414880 s6 : ffffffff8160fa00 s7 : 00000000800120e8
> [    0.045389][    T0]  s8 : 0000000080013100 s9 : 000000000000007f s10: 0000000000000000
> [    0.045474][    T0]  s11: 0000000000000000 t3 : 7fffffffffffffff t4 : 0000000000000000
> [    0.045548][    T0]  t5 : 0000000000000000 t6 : ffffffff814aa368
> [    0.045620][    T0] status: 0000000200000100 badaddr: 00000000000000f8 cause: 000000000000000d
> [    0.046402][    T0] [<ffffffff80003b94>] restore_all+0x12/0x6e
> 
> This because the $fp(aka. $s0) register is not used as frame pointer in the
> assembly entry code.
> 
> 	resume_kernel:
> 		REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
> 		bnez s0, restore_all
> 		REG_L s0, TASK_TI_FLAGS(tp)
>                 andi s0, s0, _TIF_NEED_RESCHED
>                 beqz s0, restore_all
>                 call preempt_schedule_irq
>                 j restore_all
> 
> To fix above issue, here we add one extra level wrapper for function
> trace_hardirqs_{on,off}() so they can be safely called by low level entry
> code.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> 
> ---
> v4: update explanation.
> v3: fix warning reported by documentation system.
> v2: fix compile warning.
> ---
>  arch/riscv/kernel/Makefile    |  2 ++
>  arch/riscv/kernel/entry.S     | 10 +++++-----
>  arch/riscv/kernel/trace_irq.c | 27 +++++++++++++++++++++++++++
>  arch/riscv/kernel/trace_irq.h | 11 +++++++++++
>  4 files changed, 45 insertions(+), 5 deletions(-)
>  create mode 100644 arch/riscv/kernel/trace_irq.c
>  create mode 100644 arch/riscv/kernel/trace_irq.h
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 612556faa527..ffc87e76b1dd 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -51,6 +51,8 @@ obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
>  obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
>  obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
>  
> +obj-$(CONFIG_TRACE_IRQFLAGS)	+= trace_irq.o
> +
>  obj-$(CONFIG_RISCV_BASE_PMU)	+= perf_event.o
>  obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
>  obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index ed29e9c8f660..d6a46ed0bf05 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -108,7 +108,7 @@ _save_context:
>  .option pop
>  
>  #ifdef CONFIG_TRACE_IRQFLAGS
> -	call trace_hardirqs_off
> +	call __trace_hardirqs_off
>  #endif
>  
>  #ifdef CONFIG_CONTEXT_TRACKING
> @@ -143,7 +143,7 @@ skip_context_tracking:
>  	li t0, EXC_BREAKPOINT
>  	beq s4, t0, 1f
>  #ifdef CONFIG_TRACE_IRQFLAGS
> -	call trace_hardirqs_on
> +	call __trace_hardirqs_on
>  #endif
>  	csrs CSR_STATUS, SR_IE
>  
> @@ -234,7 +234,7 @@ ret_from_exception:
>  	REG_L s0, PT_STATUS(sp)
>  	csrc CSR_STATUS, SR_IE
>  #ifdef CONFIG_TRACE_IRQFLAGS
> -	call trace_hardirqs_off
> +	call __trace_hardirqs_off
>  #endif
>  #ifdef CONFIG_RISCV_M_MODE
>  	/* the MPP value is too large to be used as an immediate arg for addi */
> @@ -270,10 +270,10 @@ restore_all:
>  	REG_L s1, PT_STATUS(sp)
>  	andi t0, s1, SR_PIE
>  	beqz t0, 1f
> -	call trace_hardirqs_on
> +	call __trace_hardirqs_on
>  	j 2f
>  1:
> -	call trace_hardirqs_off
> +	call __trace_hardirqs_off
>  2:
>  #endif
>  	REG_L a0, PT_STATUS(sp)
> diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
> new file mode 100644
> index 000000000000..095ac976d7da
> --- /dev/null
> +++ b/arch/riscv/kernel/trace_irq.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
> + */
> +
> +#include <linux/irqflags.h>
> +#include <linux/kprobes.h>
> +#include "trace_irq.h"
> +
> +/*
> + * trace_hardirqs_on/off require the caller to setup frame pointer properly.
> + * Otherwise, CALLER_ADDR1 might trigger an pagging exception in kernel.
> + * Here we add one extra level so they can be safely called by low
> + * level entry code which $fp is used for other purpose.
> + */
> +
> +void __trace_hardirqs_on(void)
> +{
> +	trace_hardirqs_on();
> +}
> +NOKPROBE_SYMBOL(__trace_hardirqs_on);
> +
> +void __trace_hardirqs_off(void)
> +{
> +	trace_hardirqs_off();
> +}
> +NOKPROBE_SYMBOL(__trace_hardirqs_off);
> diff --git a/arch/riscv/kernel/trace_irq.h b/arch/riscv/kernel/trace_irq.h
> new file mode 100644
> index 000000000000..99fe67377e5e
> --- /dev/null
> +++ b/arch/riscv/kernel/trace_irq.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
> + */
> +#ifndef __TRACE_IRQ_H
> +#define __TRACE_IRQ_H
> +
> +void __trace_hardirqs_on(void);
> +void __trace_hardirqs_off(void);
> +
> +#endif /* __TRACE_IRQ_H */
> -- 
> 2.32.0
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
