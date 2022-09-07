Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F6FC54EE9
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmdkFNJyZvicPiXad6PMeHChvzdbVd0TPPv3zTwCe6A=; b=yF0OGlMkO1EUFV
	CF/TUG/5JxncFnBO0pvkkm3D0EQM7Lu1A5kLm8EN5V6iUHTXx9+d0LFTZvfJmTH4AIsRZaIZPJr7g
	NbIwKXDpj2tsnbHI43jmnaj3gGurlXMAtM4jchJO/3o0mgYQAOhevCnZPkmDXYXZiiuK2fBbXWMeZ
	fTYjLTkNF/AUIYu3aANsDNymXh3PEJGA18cRMQ3by4awHgG7Eg+0ItupNrXeDbbbjwl3ynuyJRudg
	LuUCmtXnUejp7jEGbZBjbSsd2IXkcfLDKCSgOGzCG6nVo4S+6dka+ktDeA2Lxv+NC1pYILfKc1so+
	kuvvOPJnWMXJYf8Yx9bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4Lz-00BNAf-2H; Wed, 07 Sep 2022 23:21:07 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4Lw-00BN7h-Ge
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 23:21:05 +0000
Received: by mail-io1-xd2e.google.com with SMTP id r141so12756745iod.4
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 16:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LTOeCjfJotr02jcfDPAY5LmPRWFwiUZOmDbbyJyKBEc=;
        b=nMgikIW25jVPRgTNTsPE+uV3ApiAjiwGNFkTu5WfstH3jXuUCVYuepPCclOtQUowmJ
         BOyF5Jk3IqveRLG322GQ2NcPPrnmutuRdgR/JJke2RXJ9gwmhn2TXdAM1uv0RNtAh6DG
         VQCL8mkLCcXfd+1NYUDPBV7UNxRQ2D58wfg/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LTOeCjfJotr02jcfDPAY5LmPRWFwiUZOmDbbyJyKBEc=;
        b=6ipi1feuIom3y46wWX2SyV0jkWrpG4DuwjTpepPPzmjEaHyT3FERetnXFgpJl7YK4v
         jnAVHhyolqo9anTUQi+w1NrH0nMUNJBQcAsN+T8r4GlCppD6f6ER6by7TyVKHifUfHXf
         sj3eW3ChXndbBD3L1qnqUNeFpUqKEgX44C+fiWa3gUYVlDCErKOAma4wnEeICk6xckhQ
         KlhReqpkOrdloAxlTgaKDE1M9TSoeTCTWlvIBwjhA8wJTFQk+kqNtjbJIKnN4cB2Pv55
         oA5GDNcfCoRma7oce2KEBJcLDERB3VhNGEHJa3Xe7tTaeW9HCfI90TamJzweBv63AVtA
         RgWA==
X-Gm-Message-State: ACgBeo2dS0r39Api44BFde4okH3OmQcEChBplK6QazmmfLPgidJQ5LEA
	rYSjyibyi3we8SAem+52LX7X0r5/ezIHZNIcbHQs
X-Google-Smtp-Source: AA6agR64N1DTyVzrg7mBpqdIyR7XJWMH1r0rpCUWpuAEztHeFYzYR6CSGZcXYectjKAYRG4/ZpSLgmBMD0Dom4N1/90=
X-Received: by 2002:a6b:c504:0:b0:68b:6802:2bfe with SMTP id
 v4-20020a6bc504000000b0068b68022bfemr2928712iof.22.1662592863904; Wed, 07 Sep
 2022 16:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220903161309.32848-1-apatel@ventanamicro.com> <20220903161309.32848-3-apatel@ventanamicro.com>
In-Reply-To: <20220903161309.32848-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Sep 2022 16:20:53 -0700
Message-ID: <CAOnJCUJU_2vfiWO7PXSpDmkBuQhw_R9iUURhSCwjU=3OW7c+eg@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] irqchip/riscv-intc: Allow drivers to directly
 discover INTC hwnode
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_162104_578485_F7B2A427 
X-CRM114-Status: GOOD (  20.17  )
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

On Sat, Sep 3, 2022 at 9:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Various RISC-V drivers (such as SBI IPI, SBI Timer, SBI PMU, and
> KVM RISC-V) don't have associated DT node but these drivers need
> standard per-CPU (local) interrupts defined by the RISC-V privileged
> specification.
>
> We add riscv_get_intc_hwnode() in arch/riscv which allows RISC-V
> drivers not having DT node to discover INTC hwnode which in-turn
> helps these drivers to map per-CPU (local) interrupts provided
> by the INTC driver.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/irq.h     |  4 ++++
>  arch/riscv/kernel/irq.c          | 18 ++++++++++++++++++
>  drivers/irqchip/irq-riscv-intc.c |  7 +++++++
>  3 files changed, 29 insertions(+)
>
> diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
> index e4c435509983..43b9ebfbd943 100644
> --- a/arch/riscv/include/asm/irq.h
> +++ b/arch/riscv/include/asm/irq.h
> @@ -12,6 +12,10 @@
>
>  #include <asm-generic/irq.h>
>
> +void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
> +
> +struct fwnode_handle *riscv_get_intc_hwnode(void);
> +
>  extern void __init init_IRQ(void);
>
>  #endif /* _ASM_RISCV_IRQ_H */
> diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> index 7207fa08d78f..96d3171f0ca1 100644
> --- a/arch/riscv/kernel/irq.c
> +++ b/arch/riscv/kernel/irq.c
> @@ -7,9 +7,27 @@
>
>  #include <linux/interrupt.h>
>  #include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
>  #include <linux/seq_file.h>
>  #include <asm/smp.h>
>
> +static struct fwnode_handle *(*__get_intc_node)(void);
> +
> +void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void))
> +{
> +       __get_intc_node = fn;
> +}
> +
> +struct fwnode_handle *riscv_get_intc_hwnode(void)
> +{
> +       if (__get_intc_node)
> +               return __get_intc_node();
> +
> +       return NULL;
> +}
> +EXPORT_SYMBOL_GPL(riscv_get_intc_hwnode);
> +
>  int arch_show_interrupts(struct seq_file *p, int prec)
>  {
>         show_ipi_stats(p, prec);
> diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
> index 499e5f81b3fe..9066467e99e4 100644
> --- a/drivers/irqchip/irq-riscv-intc.c
> +++ b/drivers/irqchip/irq-riscv-intc.c
> @@ -92,6 +92,11 @@ static const struct irq_domain_ops riscv_intc_domain_ops = {
>         .xlate  = irq_domain_xlate_onecell,
>  };
>
> +static struct fwnode_handle *riscv_intc_hwnode(void)
> +{
> +       return intc_domain->fwnode;
> +}
> +
>  static int __init riscv_intc_init(struct device_node *node,
>                                   struct device_node *parent)
>  {
> @@ -126,6 +131,8 @@ static int __init riscv_intc_init(struct device_node *node,
>                 return rc;
>         }
>
> +       riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
> +
>         cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_STARTING,
>                           "irqchip/riscv/intc:starting",
>                           riscv_intc_cpu_starting,
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
