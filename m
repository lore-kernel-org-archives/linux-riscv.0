Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B33C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldChkMrPEs85Xo0FH9QY5ENRR8CIJXo48fvmsC6iVEY=; b=DsfSB043dgftuH
	YwmGb7gEmqEs6w/2mGlM4GDch9U9moGnymtgQSfXE//J1FaYJEp0SjvSZf/P1VEv2RMKuxULz9/Qj
	ou58IUYkmpJEFQ+DYMAhOSK32Ec0wcdazUnS2QvCsENqyEaxS8qWKKniF5628+ceOP8PAm96+czKp
	xRSkX1dwDRQJSTCGLUu5W5ttBeYtmC70J4b8azWyc4/+80TWN7xr5YpOKKU6Iskk87l/51ezMpyUB
	c96Qp5yaj2opl00MH2mh/xGMzhtiMOlJQMPczY/ylfK73wLiv8b1p/KBqL36SkiAEtFXwZqPSpLi6
	Gt3DABRqkujjH8RJpCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwo8t-000kDS-1G;
	Sat, 28 Oct 2023 18:34:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwo8q-000kD6-0O
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 18:34:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698518073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9szwvGpZuywL6dp6erj+VxB4LJczIuYNLzmOgYi7ek=;
	b=NeHTGIxh0eQnS0Cd32fVx2YA/vomR+9OypHHPX0kzSm75ZcgiHjdT5M6xPvB/yfVxhmvyi
	1sM5E2+wFxlruQYWALPsgD5eb/JjaspdrBL2wRezSKna9SGWO9MOBb4Igi4dWuiSdL7J8W
	KBK1peI9NTizGLIMF5CiThWAkBB8gcbjwYrcIVHmjs85prEEHC63m34Xome6BvD29jUayP
	jUxqBLsNBYhe7Ty81wFnmQRAuyXYYK3amh13W8CJo/MoFyPj6O1R4hgm6oLFo7gtTUpJDl
	w52kC90+HjKSJ6aGvYaMkznAsGmn5sVMF5JWP4E66uS7ulNRlytptMRFUqWX+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698518073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L9szwvGpZuywL6dp6erj+VxB4LJczIuYNLzmOgYi7ek=;
	b=ts0KS2ygqcHxtCjXf8TRE5hulx94A+1MZ6UoC0wgNmiBI2U98b5YU4CJ9uHVW40d0kBHVr
	H19FWn/6gWPjwADA==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v11 07/14] irqchip: Add RISC-V incoming MSI controller
 early driver
In-Reply-To: <20231023172800.315343-8-apatel@ventanamicro.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-8-apatel@ventanamicro.com>
Date: Sat, 28 Oct 2023 20:34:33 +0200
Message-ID: <871qde1tqe.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_113436_445929_11C7D0BA 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23 2023 at 22:57, Anup Patel wrote:
> +#ifdef CONFIG_GENERIC_IRQ_DEBUGFS
> +void imsic_vector_debug_show(struct seq_file *m,
> +			     struct imsic_vector *vec, int ind)
> +{
> +	unsigned int mcpu = 0, mlocal_id = 0;
> +	struct imsic_local_priv *lpriv;
> +	bool move_in_progress = false;
> +	struct imsic_vector *mvec;
> +	bool is_enabled = false;
> +	unsigned long flags;
> +
> +	lpriv = per_cpu_ptr(imsic->lpriv, vec->cpu);
> +	if (WARN_ON(&lpriv->vectors[vec->local_id] != vec))
> +		return;
> +
> +	raw_spin_lock_irqsave(&lpriv->ids_lock, flags);
> +	if (test_bit(vec->local_id, lpriv->ids_enabled_bitmap))
> +		is_enabled = true;
> +	mvec = lpriv->ids_move[vec->local_id];
> +	if (mvec) {
> +		move_in_progress = true;
> +		mcpu = mvec->cpu;
> +		mlocal_id = mvec->local_id;
> +	}
> +	raw_spin_unlock_irqrestore(&lpriv->ids_lock, flags);
> +
> +	seq_printf(m, "%*starget_cpu      : %5u\n", ind, "", vec->cpu);
> +	seq_printf(m, "%*starget_local_id : %5u\n", ind, "", vec->local_id);
> +	seq_printf(m, "%*sis_reserved     : %5u\n", ind, "",
> +		   (vec->local_id <= IMSIC_IPI_ID) ? 1 : 0);
> +	seq_printf(m, "%*sis_enabled      : %5u\n", ind, "",
> +		   (move_in_progress) ? 1 : 0);
> +	seq_printf(m, "%*sis_move_pending : %5u\n", ind, "",
> +		   (move_in_progress) ? 1 : 0);
> +	if (move_in_progress) {
> +		seq_printf(m, "%*smove_cpu        : %5u\n", ind, "", mcpu);
> +		seq_printf(m, "%*smove_local_id   : %5u\n", ind, "", mlocal_id);
> +	}
> +}
> +
> +void imsic_vector_debug_show_summary(struct seq_file *m, int ind)
> +{
> +	unsigned int cpu, total_avail = 0, total_used = 0;
> +	struct imsic_global_config *global = &imsic->global;
> +	struct imsic_local_priv *lpriv;
> +	unsigned long flags;
> +
> +	for_each_possible_cpu(cpu) {
> +		lpriv = per_cpu_ptr(imsic->lpriv, cpu);
> +
> +		total_avail += global->nr_ids;
> +
> +		raw_spin_lock_irqsave(&lpriv->ids_lock, flags);
> +		total_used += bitmap_weight(lpriv->ids_used_bitmap,
> +					    global->nr_ids + 1) - 1;
> +		raw_spin_unlock_irqrestore(&lpriv->ids_lock, flags);
> +	}
> +
> +	seq_printf(m, "%*stotal : %5u\n", ind, "", total_avail);
> +	seq_printf(m, "%*sused  : %5u\n", ind, "", total_used);
> +	seq_printf(m, "%*s| CPU | tot | usd | vectors\n", ind, " ");
> +
> +	cpus_read_lock();
> +	for_each_online_cpu(cpu) {
> +		lpriv = per_cpu_ptr(imsic->lpriv, cpu);
> +
> +		raw_spin_lock_irqsave(&lpriv->ids_lock, flags);
> +		total_used = bitmap_weight(lpriv->ids_used_bitmap,
> +					   global->nr_ids + 1) - 1;
> +		seq_printf(m, "%*s %4d  %4u  %4u  %*pbl\n", ind, " ",
> +			   cpu, global->nr_ids, total_used,
> +			   global->nr_ids + 1, lpriv->ids_used_bitmap);
> +		raw_spin_unlock_irqrestore(&lpriv->ids_lock, flags);
> +	}
> +	cpus_read_unlock();

This looks very close to the matrix alocator information, just done differently.

> +static unsigned int imsic_vector_best_cpu(const struct cpumask *mask,
> +					  unsigned int order)
> +{
> +	struct imsic_global_config *global = &imsic->global;
> +	unsigned int cpu, best_cpu, free, maxfree = 0;
> +	struct imsic_local_priv *lpriv;
> +	unsigned long flags;
> +
> +	best_cpu = UINT_MAX;
> +	for_each_cpu(cpu, mask) {
> +		if (!cpu_online(cpu))
> +			continue;
> +
> +		lpriv = per_cpu_ptr(imsic->lpriv, cpu);
> +		raw_spin_lock_irqsave(&lpriv->ids_lock, flags);
> +		free = bitmap_weight(lpriv->ids_used_bitmap,
> +				     global->nr_ids + 1);
> +		free = (global->nr_ids + 1) - free;
> +		raw_spin_unlock_irqrestore(&lpriv->ids_lock, flags);
> +		if (free < BIT(order) || free <= maxfree)
> +			continue;
> +
> +		best_cpu = cpu;
> +		maxfree = free;
> +	}
> +
> +	return best_cpu;

Looks very much like what the matrix allocator provides, right?

What's the actual reason that you can't use it?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
