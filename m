Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214BDCFC279
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j46BPtNs1QdAWga32ALerKQ06gwR0jE0xiFczOQTL0=; b=fcjlAdFy+mzzbc
	JkXBThlgFdAbsE1aKIZ/sd7jaPWbruWLGD2ZcG4gShR2iaHPxnvepS3UAQ4f3vt6ssJtyH6NpRmXR
	tAe/EK2ghzoasiuVrnk+od/nzC4ZxulvNnwKyIt/nmhXdfXMNwwn/z0ivYwkEyN2pOiMWrPIGF5B5
	+1gdgvwrryswllSqq5lptAl4TaP7ModKUgByHoEH7WWk7DueD6ECkd1dznUz5Jkt/l/bL4+8T7xO7
	WFwTYdgz/PvRXNZFK2LkAyn6gZWVfYdMEA+KSbeFGdiFgcxtU8qfNUEszoi8/q0eZn5B10W3HcNtF
	iEl0fKpViU68+up4QAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0daz-00000007eO2-1SNK;
	Tue, 15 Oct 2024 09:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0dNn-00000007aqu-0c1L
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 08:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DAD135C4C20;
	Tue, 15 Oct 2024 08:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637D4C4CEC6;
	Tue, 15 Oct 2024 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728982702;
	bh=JeHs09n/fgnm8DLFzXGTaECcHXz114f/ynuKFiM5gYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ey99cQkOIUsPYERXg+Q4eS8nc4wDGlv9ioNHnrjCSwao5Ap/L2ogxIFqEesuZcqcL
	 EZqqFkOiY2Wzf9e9/pE/oalVnXTUuBOjQTuLtKXbofdqz0IntyzmXj9hfBWv+Ou/TZ
	 6BindokGGdA3W3tAPKzUTsKHuPUwMjC6DVyUq24o+S1eLaNjfGF9UnYhuUTXeGoBha
	 fRVjGQXhVYkT0LhzQZiHbJx1PNhspbP9sYwCpC28CWsz1AHN/IjVUZ0sDAYWB7zJoy
	 Yr7hyXLqUsU4TT94X4ziXutxZBPP2OyypQrNE9Zur+AF32dpA3sxEcWX/Rvly+ivG5
	 uQEMfntoWgF6Q==
Date: Tue, 15 Oct 2024 09:58:14 +0100
From: Will Deacon <will@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v9 6/7] iommu/riscv: Command and fault queue support
Message-ID: <20241015085814.GB19110@willie-the-truck>
References: <cover.1728579958.git.tjeznach@rivosinc.com>
 <6916f5308478013c7b4cda77403c1e9aa9982384.1728579958.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6916f5308478013c7b4cda77403c1e9aa9982384.1728579958.git.tjeznach@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_015823_290803_6AF1217F 
X-CRM114-Status: GOOD (  24.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 10, 2024 at 12:48:09PM -0700, Tomasz Jeznach wrote:
> Introduce device command submission and fault reporting queues,
> as described in Chapter 3.1 and 3.2 of the RISC-V IOMMU Architecture
> Specification.
> 
> Command and fault queues are instantiated in contiguous system memory
> local to IOMMU device domain, or mapped from fixed I/O space provided
> by the hardware implementation. Detection of the location and maximum
> allowed size of the queue utilize WARL properties of queue base control
> register. Driver implementation will try to allocate up to 128KB of
> system memory, while respecting hardware supported maximum queue size.
> 
> Interrupts allocation is based on interrupt vectors availability and
> distributed to all queues in simple round-robin fashion. For hardware
> Implementation with fixed event type to interrupt vector assignment
> IVEC WARL property is used to discover such mappings.
> 
> Address translation, command and queue fault handling in this change
> is limited to simple fault reporting without taking any action.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
> ---
>  drivers/iommu/riscv/iommu-bits.h |  75 +++++
>  drivers/iommu/riscv/iommu.c      | 507 ++++++++++++++++++++++++++++++-
>  drivers/iommu/riscv/iommu.h      |  21 ++
>  3 files changed, 601 insertions(+), 2 deletions(-)

[...]

> +/* Enqueue an entry and wait to be processed if timeout_us > 0
> + *
> + * Error handling for IOMMU hardware not responding in reasonable time
> + * will be added as separate patch series along with other RAS features.
> + * For now, only report hardware failure and continue.
> + */
> +static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
> +					   void *entry, size_t entry_size)
> +{
> +	unsigned int prod;
> +	unsigned int head;
> +	unsigned int tail;
> +	unsigned long flags;
> +
> +	/* Do not preempt submission flow. */
> +	local_irq_save(flags);
> +
> +	/* 1. Allocate some space in the queue */
> +	prod = atomic_inc_return(&queue->prod) - 1;
> +	head = atomic_read(&queue->head);
> +
> +	/* 2. Wait for space availability. */
> +	if ((prod - head) > queue->mask) {
> +		if (readx_poll_timeout(atomic_read, &queue->head,
> +				       head, (prod - head) < queue->mask,
> +				       0, RISCV_IOMMU_QUEUE_TIMEOUT))
> +			goto err_busy;
> +	} else if ((prod - head) == queue->mask) {
> +		const unsigned int last = Q_ITEM(queue, head);
> +
> +		if (riscv_iommu_readl_timeout(queue->iommu, Q_HEAD(queue), head,
> +					      !(head & ~queue->mask) && head != last,
> +					      0, RISCV_IOMMU_QUEUE_TIMEOUT))
> +			goto err_busy;
> +		atomic_add((head - last) & queue->mask, &queue->head);
> +	}
> +
> +	/* 3. Store entry in the ring buffer. */
> +	memcpy(queue->base + Q_ITEM(queue, prod) * entry_size, entry, entry_size);
> +
> +	/* 4. Wait for all previous entries to be ready */
> +	if (readx_poll_timeout(atomic_read, &queue->tail, tail, prod == tail,
> +			       0, RISCV_IOMMU_QUEUE_TIMEOUT))
> +		goto err_busy;
> +
> +	/* 5. Complete submission and restore local interrupts */
> +	dma_wmb();
> +	riscv_iommu_writel(queue->iommu, Q_TAIL(queue), Q_ITEM(queue, prod + 1));

Please explain why a dma_wmb() is sufficient to order the memcpy() stores
before the tail update.

> +	atomic_inc(&queue->tail);

I think this can be reordered before the relaxed MMIO write to tail,
causing other CPUs to exit their polling early.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
