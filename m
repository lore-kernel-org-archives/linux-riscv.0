Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFB4C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 13:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdCTlc3ZLvwh3GQ26+FljWaVTeX8VhSLLrsNdq+oGfE=; b=F6wdAemTQlZYZM
	CTiYBcqO+5meQU6ucUOcxVMfRBYH23qIT697B4ANcQrQpO/xOoCqtSBkRKauekr/DhhtrWuzG7fUZ
	Ef+pqNOO7U49YwYxKZfTuVhQlvDjHUMYlT8uzhjVr8w74dSNNgZkHjGg8Zb4SwH2YXnDlu+aO/PNz
	EgqO7cT99OTuD3GAbFnBJrBp8k/K+HUWjIU+sycQdsk+sKPa0I613j56b6wzYvFxvhipJcGotxcWW
	MCkstSnFBZut5tf8H+p548K79dU+JbPDYfNMcOUXvrwziTs7I2NN/iFj170Xe5Vj6I7XEbrAI0eTj
	Q42cnUDzV/Tkm1vTBTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPyo-0000000EoCs-1MlP;
	Tue, 20 Feb 2024 13:16:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPyd-0000000Eo7K-2kLk;
	Tue, 20 Feb 2024 13:16:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708434957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqdxGzZUmGMxRdh7uo3p0E+R2tLPgd1LjL8qg1QFmTU=;
	b=Q7XhL5QDJ14d2Y1Tx+7ezonbH4enMNnpcEYhrfiPydArxIBo49TcUIcHSnAqwQH0sc3viq
	vI4ZF4vECHUbrxZVuOnmFIBNvglMyLHiSKVmx1HahvscowYVY8to9tud+fwuLYG6MsRCD1
	rl5EvxPZkc/jxKNFUDlEaeI3M4FI5hfKZP3aQTkVtwNs/U0+DjRGLyF8Hb9OR0tZjr5Lje
	6w6xbSFEKpw3gHNWx8N5FpD1BrGtOa4njSJeDreLezGwgs8SANkuEJ3sYCo9hHs3dx+hB/
	as/wC10aA2PqMtS4e9OMGRHGS0bTyVPveL7oQtvleJz+Cyfxe2F+L7S7zX1XAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708434957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MqdxGzZUmGMxRdh7uo3p0E+R2tLPgd1LjL8qg1QFmTU=;
	b=U4X6RGBC2a7V1eZO17Yk5mTUBWqEd4/8tuep93ec5raS5FrOPkm2Dt1tot761fnsWiBnS+
	ERGoPnAR15RUFMBA==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 06/13] irqchip: Add RISC-V incoming MSI controller
 early driver
In-Reply-To: <20240220060718.823229-7-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-7-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 14:15:56 +0100
Message-ID: <87a5nvi8dv.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_051604_001418_4D182F1B 
X-CRM114-Status: GOOD (  20.32  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 20 2024 at 11:37, Anup Patel wrote:
> The RISC-V advanced interrupt architecture (AIA) specification
> defines a new MSI controller called incoming message signalled
> interrupt controller (IMSIC) which manages MSI on per-HART (or
> per-CPU) basis. It also supports IPIs as software injected MSIs.
> (For more details refer https://github.com/riscv/riscv-aia)
>
> Let us add an early irqchip driver for RISC-V IMSIC which sets
> up the IMSIC state and provide IPIs.

s/Let us add/Add/

> +#else
> +static void imsic_ipi_starting_cpu(void)
> +{
> +}
> +
> +static void imsic_ipi_dying_cpu(void)
> +{
> +}
> +
> +static int __init imsic_ipi_domain_init(void)
> +{
> +	return 0;
> +}

Please condense this into

static void imsic_ipi_starting_cpu(void) { }
static void imsic_ipi_dying_cpu(void) { }
static int __init imsic_ipi_domain_init(void) { return 0; }

No point in wasting space for these stubs.

> + * To handle an interrupt, we read the TOPEI CSR and write zero in one
> + * instruction. If TOPEI CSR is non-zero then we translate TOPEI.ID to
> + * Linux interrupt number and let Linux IRQ subsystem handle it.
> + */
> +static void imsic_handle_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	int err, cpu = smp_processor_id();
> +	struct imsic_vector *vec;
> +	unsigned long local_id;
> +
> +	chained_irq_enter(chip, desc);
> +
> +	while ((local_id = csr_swap(CSR_TOPEI, 0))) {
> +		local_id = local_id >> TOPEI_ID_SHIFT;
> +
> +		if (local_id == IMSIC_IPI_ID) {
> +#ifdef CONFIG_SMP

	if (IS_ENABLED(CONFIG_SMP))

> +			ipi_mux_process();
> +#endif
> +			continue;
> +		}

> +
> +/* MUST be called with lpriv->lock held */

Instead of a comment which cannot be enforced just have

        lockdep_assert_held(&lpriv->lock);

right at the top of the function. That documents the requirement and
lets lockdep yell if not followed.

> +#ifdef CONFIG_SMP
> +static void imsic_local_timer_callback(struct timer_list *timer)
> +{
> +	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&lpriv->lock, flags);
> +	__imsic_local_sync(lpriv);
> +	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
> +}
> +
> +/* MUST be called with lpriv->lock held */

Ditto

> +static void __imsic_remote_sync(struct imsic_local_priv *lpriv, unsigned int cpu)

> +void imsic_vector_mask(struct imsic_vector *vec)
> +{
> +	struct imsic_local_priv *lpriv;
> +
> +	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
> +	if (WARN_ON(&lpriv->vectors[vec->local_id] != vec))
> +		return;

WARN_ON_ONCE(), no?

> +bool imsic_vector_isenabled(struct imsic_vector *vec)
> +{
> +	struct imsic_local_priv *lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
> +	unsigned long flags;
> +	bool ret;
> +
> +	raw_spin_lock_irqsave(&lpriv->lock, flags);
> +	ret = vec->enable;
> +	raw_spin_unlock_irqrestore(&lpriv->lock, flags);

I'm not sure what you are trying to protect here. vec->enable can
obviously change right after the lock is dropped. So that's just a
snapshot, which is not any better than using

          READ_ONCE(vec->enable);

and a corresponding WRITE_ONCE() at the update site, which obviously
needs serialization.

> +static void __init imsic_local_cleanup(void)
> +{
> +	int cpu;
> +	struct imsic_local_priv *lpriv;

        struct imsic_local_priv *lpriv;
	int cpu;

Please.

> +void imsic_state_offline(void)
> +{
> +#ifdef CONFIG_SMP
> +	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
> +#endif

You can move that into the #ifdef below.

> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
> +	irq_matrix_offline(imsic->matrix);
> +	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);
> +
> +#ifdef CONFIG_SMP
> +	raw_spin_lock_irqsave(&lpriv->lock, flags);
> +	WARN_ON_ONCE(try_to_del_timer_sync(&lpriv->timer) < 0);
> +	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
> +#endif
> +}


Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
