Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D62FC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 00:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAIr/+vbYC/HhLUtcYp0HeeTFmjpO3YDqbWMRmhcSkU=; b=HWPnHtsz2RpWCc
	hk7+VZqMvVtyU3xyLJYK1B7VAyqoNBZo9VUX/Irq8cf68ThpRN3+2ccxBvqV60gO4q+YNuirtlGag
	+dQ9JRF+VyDw07W/z8zPoycEyENn6DORxneAQRML56F1pji8LRdXMv+MSBPM210omtJDQuO3yWQ37
	oSHlGIRJSHpmnAzAPJvTT5knBs+02G9i6SiqvXA6dt3SIMqG5C2XjIy6+ge/TsG2Bkw+J6TNQ7dpi
	g0n6Vs+Ma2ESFbI/UBkXNkEeAik+0iL2xlCiF5Cadhj1y5r+7Oi2zIuj1Mk43xBcJuU/kThDXR63l
	trMozi2dC3U9PvqZTX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQs8-00GgWi-4H; Tue, 20 Sep 2022 00:12:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQs4-00GgU9-KF
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 00:12:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 96E3BB81C99
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 00:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390ACC4347C
	for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 00:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663632729;
	bh=jGh6Z/8o8phkxD6Q5ZaClfS96enuq/pckZpmt/gSUKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QxfSf0QTdMROv8kOD4YiiscBiAFwlo9PR57pV30gJmTUhrNpU/yWDrH7eLYMgP6jK
	 4AElYiaGpjieblpx1ymUfRCCwpdsuhxmRdDBBVCtNUk0JULVG7i6Tk8r8czAHGn08j
	 MBBSR5x1J3eJKDggrNpdTb7tjQ+pjnSxHlCwGTWe7w/PYA2UXRli85h6LKs+fhbjT6
	 VZx80+WFkDW30LgD7SETB2DCnkd6Krj0/cFx3zmmtk+SNp1YtBxiso4SFiIgiNvkte
	 uR3c+udyxrbhe308ZeBZELRHAlq41d1lMahVvd0r8cqTN3VJ1uvQ0eiLq32Q/8wMfa
	 Sl8TXtoN4T7og==
Received: by mail-oi1-f169.google.com with SMTP id u131so1661535oie.5
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 17:12:09 -0700 (PDT)
X-Gm-Message-State: ACrzQf3JPTD7xwzOcC96MtRelw/KxinrTHynb+Hbsald9YQwc5BFjoQ3
	z/DI4sWqnOzqaXOu/A+bL/nefm9XEhgr6ZRAjow=
X-Google-Smtp-Source: AMsMyM7q6m74X81UqNxrOeCx3Dxj/WxoLF1r3ltRRUbJziqD0ESkxDrh6zD8VT0RsW27eG0Uex4S1P+7jPii4oPq1r0=
X-Received: by 2002:a05:6808:201f:b0:34f:9fdf:dbbf with SMTP id
 q31-20020a056808201f00b0034f9fdfdbbfmr356862oiw.19.1663632728293; Mon, 19 Sep
 2022 17:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220918155246.1203293-1-guoren@kernel.org> <20220918155246.1203293-10-guoren@kernel.org>
In-Reply-To: <20220918155246.1203293-10-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Sep 2022 08:11:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRtRzeDqr3=AUkGadPMmMA6kwU86+zSNn8+0qXSk8zmVQ@mail.gmail.com>
Message-ID: <CAJF2gTRtRzeDqr3=AUkGadPMmMA6kwU86+zSNn8+0qXSk8zmVQ@mail.gmail.com>
Subject: Re: [PATCH V5 09/11] riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
To: arnd@arndb.de, guoren@kernel.org, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_171216_962516_36C88935 
X-CRM114-Status: GOOD (  23.17  )
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

On Sun, Sep 18, 2022 at 11:53 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Add the HAVE_SOFTIRQ_ON_OWN_STACK feature for the IRQ_STACKS config. The
> irq and softirq use the same independent irq_stack of percpu by time
> division multiplexing.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/riscv/Kconfig      |  7 ++++---
>  arch/riscv/kernel/irq.c | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 75db47a983f2..dfe600f3526c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -434,12 +434,13 @@ config FPU
>           If you don't know what to do here, say Y.
>
>  config IRQ_STACKS
> -       bool "Independent irq stacks" if EXPERT
> +       bool "Independent irq & softirq stacks" if EXPERT
>         default y
>         select HAVE_IRQ_EXIT_ON_IRQ_STACK
> +       select HAVE_SOFTIRQ_ON_OWN_STACK
>         help
> -         Add independent irq stacks for percpu to prevent kernel stack overflows.
> -         We may save some memory footprint by disabling IRQ_STACKS.
> +         Add independent irq & softirq stacks for percpu to prevent kernel stack
> +         overflows. We may save some memory footprint by disabling IRQ_STACKS.
>
>  endmenu # "Platform type"
>
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index 5ad4952203c5..6dc9ccd01470 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -11,6 +11,7 @@
>  #include <linux/seq_file.h>
>  #include <asm/smp.h>
>  #include <asm/vmap_stack.h>
> +#include <asm/softirq_stack.h>
>
>  #ifdef CONFIG_IRQ_STACKS
>  static DEFINE_PER_CPU(ulong *, irq_stack_ptr);
> @@ -38,6 +39,21 @@ static void init_irq_stacks(void)
>                 per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
>  }
>  #endif /* CONFIG_VMAP_STACK */
> +
> +#ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
Sorry, it should be. If you compiled an error, please modify it manually,
+#ifdef CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK

> +static void do_riscv_softirq(struct pt_regs *regs)
> +{
> +       __do_softirq();
> +}
> +
> +void do_softirq_own_stack(void)
> +{
> +       ulong *sp = per_cpu(irq_stack_ptr, smp_processor_id());
> +
> +       call_on_stack(NULL, sp, do_riscv_softirq, 0);
> +}
> +#endif /* CONFIG_SOFTIRQ_ON_OWN_STACK */
> +
>  #else
>  static void init_irq_stacks(void) {}
>  #endif /* CONFIG_IRQ_STACKS */
> --
> 2.36.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
