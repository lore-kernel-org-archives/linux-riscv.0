Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41765CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlDIuEZQ0pKfjUXsu0yvIqsQmoguyTFE/FB8n0jRoOE=; b=oR9hWz8bjthzi4
	eVVvxjbyYW4H8fOw3ru4QVL39GR+VcziB4vDxlIpGK8pCRyyDm0rxc1xG5NM76Yf1h0S1MqAbS0+u
	DbxlavueDO/naDDoJd6FnTdA6LHc198xQK0AyXEgJpG6eiFpgTkgWfMubjy71RB+kpPE+/oyX9fDR
	tb2qNFuB/ujwr1YY+VxQ8eTWuDjSZbzCZTlEokWd2357l0HwNpqOA15zra94wwhFrRqyBweOVQV9E
	exIVvyEG0N38/KdlZS7CnBoaI+/RJs/6JjoV0EW44Y37rk72u/t2HL506cvMw8SDhJ8Z6OMWm1cMX
	JLnVCjrdyYCCa8uE6sbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ko4-00000004JQN-0xd1;
	Thu, 16 Oct 2025 10:02:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ko1-00000004JPy-299a
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 10:01:58 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760608914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PDeWvfL0Yyl8v4f6ecg6l9WJt9/NhYirIKkwErXjMzM=;
	b=C9hzE/CnqBaasqAFCYuDPVH3pbX8GmLjumEf+rwtEW10/GGgJcGb64IDCdnSXahjzJ1Bcv
	Ldzyqc1RtjWrd6TXX+7K6nlfIePUOB2W7YHIvWRWh6uBYrg+XtnOr6pqI364XFRBq9MHAi
	2sTCsZg1ryKXqQSUbLFycP/dR6ceMSMZSpcT8sgnIVfnIwwf+EPj7uqwwTdmrUGYK8Nazl
	S2SXCRUJqq4mefTGqUedWBLDdYeSQ5WCAp16z1dDsr9xdzCVCKQnuPpb3a1HywV6A2Pmzn
	CR5Wa8eLp241JNeW+jd+dUYrOfRlGHjpMJFGWQsvHZbypBFw5R8Xar60G77EaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760608914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PDeWvfL0Yyl8v4f6ecg6l9WJt9/NhYirIKkwErXjMzM=;
	b=Te3nuhzPs7a2+HiG1/4JZ8YshOJPg+QJXZMmqkNWfOIRteiGE88LShyNMdHuM9ZfOtgrE7
	9rSduVKyiixm0qDg==
To: Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, Paul
 Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 4/4] irqchip/riscv-imsic: Remove irq_desc lookup from
 hot path
In-Reply-To: <20251015195712.3813004-5-samuel.holland@sifive.com>
References: <20251015195712.3813004-1-samuel.holland@sifive.com>
 <20251015195712.3813004-5-samuel.holland@sifive.com>
Date: Thu, 16 Oct 2025 12:01:53 +0200
Message-ID: <87v7kf17xq.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_030157_709522_216B902B 
X-CRM114-Status: GOOD (  15.90  )
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

On Wed, Oct 15 2025 at 12:55, Samuel Holland wrote:
> The IMSIC driver uses the IRQ matrix allocator, so there is an arbitrary
> mapping from the per-CPU interrupt identity to the global irq number. As
> a result, the driver maintains a table of vectors so it can look up the
> virq number during interrupt handling. The driver uses the virq for one
> main purpose: it gets passed to generic_handle_irq(), which then uses it
> to look up the irq_desc in the sparse_irqs tree.
>
> Taking inspiration from the loongarch AVEC irqchip driver, skip the tree

which got the idea from x86 :)

> -struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *mask)
> +struct imsic_vector *imsic_vector_alloc(struct irq_desc *desc, const struct cpumask *mask)
>  {
>  	struct imsic_vector *vec = NULL;
>  	struct imsic_local_priv *lpriv;
> @@ -450,7 +451,7 @@ struct imsic_vector *imsic_vector_alloc(unsigned int irq, const struct cpumask *
>  
>  	lpriv = per_cpu_ptr(imsic->lpriv, cpu);
>  	vec = &lpriv->vectors[local_id];
> -	vec->irq = irq;
> +	vec->desc = desc;
>  	vec->enable = false;
>  	vec->move_next = NULL;
>  	vec->move_prev = NULL;
> @@ -463,7 +464,7 @@ void imsic_vector_free(struct imsic_vector *vec)
>  	unsigned long flags;
>  
>  	raw_spin_lock_irqsave(&imsic->matrix_lock, flags);
> -	vec->irq = 0;
> +	vec->desc = NULL;
>  	irq_matrix_free(imsic->matrix, vec->cpu, vec->local_id, false);
>  	raw_spin_unlock_irqrestore(&imsic->matrix_lock, flags);

This is only correct when it is guaranteed that the interrupt can't be
raised in the CPU _before_ a interrupt allocation completed throughout
the hierarchy and _after_ the freeing hierarchy walk started. Otherwise
this might end up accessing a half initialized or half torn down
descriptor.

If it is, then please add a comment describing it. If not then you need
to implement the activate/deactivate callbacks for your interrupt domain
and do the store/clear of vec->desc there.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
