Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E088FC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 02:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUBi/IJb0eogyp4A71UiJ//PJUeKIAMm+s0DpL5N18c=; b=WtjsQ4JqumL19oN+D/JSQjHyDC
	dUP6hRy7UejbFF5DkodEECIwr37xq/OP7nmwYmuG0CV0PKAXeYTZJv9kHPZNFf7vihyX7WySqM9u2
	+C34rkfyjHT1KKDzjMZ8giErbPnGGsPWioTAV3LnsdKywaNIxcKpBJnnXEBfiNIqpLdQGabOw5mO6
	e29kSg24Jj9tGFRTfhOqGnc1Gu08J0PpC0l0E3iOwRlyUboYDskqDjYkhJhC+/G2vw2Am6s3coPfu
	oQW9LxOP107+2YnYP/3AQghip7181Uvg9cGwnHBhKCFzdvXG643cjKXEm30xhHecYeo1MaUy/X24h
	hxJBfaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6mv-00000007zwU-2R91;
	Mon, 13 Jul 2026 02:52:57 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6mt-00000007zw5-0asy
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 02:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783911175; x=1815447175;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=elnOmjtKhc7ZkUcjMxaedGgEBkAQlLWA/eMr2agyeMg=;
  b=GKSikQRK9tDOdPQlhJmC08yssnqZTaNUWugYmTnPP8mJvY1F6OVvYASV
   HARa2cZvopGv+2NsP6WTea/dFPMwYmIsgjQLSNC4WDNsqQvO5Y0YADuVc
   Fu31xFcb9Zd17JiaozUDODXDOiHAWMSxcTU+sEpMMVK6oyhFHVpRFDun4
   KluGolnbGCBCUiNk+b8BfIRY+b1bJH/t9Xe7KK2wQJN3jg6U0/5M1/cWX
   veHDJK8MDKhRlf4KAj283uwx80CyAwzsVFcGfnpPjXoFOJhuAfoprvjvB
   NaXjDMmygMS76TIOtZTnZhk8678/OE5g3zBshbf39zyZ9FOwLWglosj85
   g==;
X-CSE-ConnectionGUID: /LHNbe+0ThGGEa5ycbcReQ==
X-CSE-MsgGUID: 8zNKTNKrRg6l0nGzCeTa7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84709291"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84709291"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:52:50 -0700
X-CSE-ConnectionGUID: 0xBnQF12SVyIsp67boBrGA==
X-CSE-MsgGUID: +r3WTgUeTh6smqnFWa6EqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251012556"
Received: from allen-sbox.sh.intel.com (HELO [10.239.159.30]) ([10.239.159.30])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:52:47 -0700
Message-ID: <791a320f-ca6e-430d-b71c-82e95ca5a488@linux.intel.com>
Date: Mon, 13 Jul 2026 10:51:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/riscv: Replace illegal command with dummy
 IOFENCE to prevent hardware lockup
To: Zong Li <zong.li@sifive.com>, tomasz.jeznach@linux.dev, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260630023042.837926-1-zong.li@sifive.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20260630023042.837926-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_195255_279383_6A58E4F0 
X-CRM114-Status: GOOD (  45.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/30/26 10:30, Zong Li wrote:
> When the RISC-V IOMMU encounters an illegal command, the hardware
> stops processing and the HEAD register remains pointing at the
> illegal command. If software does not handle this properly, the
> hardware will be stuck at this index indefinitely, preventing any
> further command queue operations.
> 
> This patch implements a recovery mechanism by replacing the illegal
> command with a dummy IOFENCE instruction (all operands are zero):
> 
> 1. Prevents hardware lockup: By overwriting the illegal command with
>     a valid instruction, the hardware can continue processing from the
>     current position instead of being stuck.
> 
> 2. Enables user recovery: After replacing the illegal command, the
>     user/driver has an opportunity to retry the original failed
>     operation rather than losing all queued work.
> 
> 3. Minimal hardware impact: A dummy IOFENCE behaves as a NOP, it
>     it performs no cache invalidation operations and has no side
>     effects on the system state. This is the safest replacement
>     instruction.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
> 
> The main goal is to at least prevent the hardware from getting stuck
> and crashing the entire system.
> 
> Here are the main issues we would need to solve if we fully follow the spec:
> 
> 1. IOFENCE index shift: After an illegal command, if another thread is
> waiting for subsequent IOFENCE to finish, resubmitting commands will
> change that IOFENCE's index in the queue. This means the waiting
> thread in 'riscv_iommu_cmd_sync' might finish too early because the
> 'prod' value should be changed as well. We could fix this by making
> IOFENCE write a sequence number to a specific address, and having the
> thread wait for that data instead.
> 
> 2. Timeout errors: If an illegal command happens while another thread
> is trying to write a command, that thread might be waiting for the
> tail to move (in 'riscv_iommu_queue_send'), and exit the wait due to a
> timeout. This leads to errors in the caller subsystem (like DMA). So
> it seems even if the resubmit finishes later, it might not help much.
> 
> 3. Queue tail mismatch: Similar to point 2 situation, a thread waiting
> in 'riscv_iommu_queue_send' expects prod == queue->tail. If we
> resubmit commands quickly, queue->tail is updated asynchronously to a
> farther value. The waiting thread might never see the condition met
> and time out.
> 
> 4. Shadow queue overhead: Inside the threading IRQ handler, we cannot
> easily know what the illegal command was just by checking the current
> command queue. We would need to create a "shadow command queue" to
> keep a history. This would break the current driver design. We would
> also need to add locks to prevent race conditions on shadow command
> queue, which would reduce the driver's performance.
> 
> Considering these trade-offs, I prefer not to make the driver much
> more complex and slower just to handle rare hardware errors.
> Treating this hardware fault as a fatal error without trying to
> recover it in software might be too extreme and would require a
> hardware reset. Therefore, this patch might be a good middle ground.
> It prevents the hardware lockup. Even though we might lose some commands
> and cause incorrect results for the user, it at least keeps the system
> alive and gives the user a chance to retry their operation again.
> 
> Changed in v1:
> - Added more comments
> - Rebased on v7.2-rc1
> 
>   drivers/iommu/riscv/iommu.c | 32 +++++++++++++++++++++++++++++++-
>   1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index cec3ddd7ab10..c009c1906e23 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -464,13 +464,43 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
>   static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
>   {
>   	const struct riscv_iommu_queue *queue = (struct riscv_iommu_queue *)data;
> -	unsigned int ctrl;
> +	struct riscv_iommu_command cmd;
> +	unsigned int ctrl, head;
>   
>   	/* Clear MF/CQ errors, complete error recovery to be implemented. */
>   	ctrl = riscv_iommu_readl(queue->iommu, queue->qcr);
>   	if (ctrl & (RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
>   		    RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_FENCE_W_IP)) {
> +
> +		/*
> +		 * Resubmitting all commands submitted since the last IOFENCE that
> +		 * successfully completed will introduce various race conditions.
> +		 * Use a dummy IOFENCE instead of the illegal command to prevent
> +		 * hardware lockup.
> +		 * Please note that some commands might be lost, including:
> +		 *  - The task from the illegal command itself
> +		 *  - The commands submitted between the last IOFENCE and illegal one
> +		 * However, this gives the user or driver a chance to retry the
> +		 * failed operation without resetting the enitre system
> +		 */
> +		if (ctrl & RISCV_IOMMU_CQCSR_CMD_ILL) {
> +			/*
> +			 * The head pointer is not updated by the hardware, it
> +			 * still points to the index of illegal command
> +			 */
> +			riscv_iommu_readl_timeout(queue->iommu, Q_HEAD(queue), head,
> +						  !(head & ~queue->mask), 0,
> +						  RISCV_IOMMU_QUEUE_TIMEOUT);
> +
> +			memset(&cmd, 0, sizeof(cmd));
> +			cmd.dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE,
> +						RISCV_IOMMU_CMD_IOFENCE_OPCODE);
> +			memcpy(queue->base + head * sizeof(cmd), &cmd, sizeof(cmd));
> +			dma_wmb();

So the command that the hardware complained about as illegal (which
might simply be a compatibility issue) is being ignored here, right?

Doesn't this introduce a severe bug? For example, if the overwritten
command was a cache invalidation request following a page table unmap,
the IOMMU hardware will continue using the stale cache entries. This
could result in silent data corruption or severe security
vulnerabilities.

> +		}
> +
>   		riscv_iommu_writel(queue->iommu, queue->qcr, ctrl);
> +
>   		dev_warn(queue->iommu->dev,
>   			 "Queue #%u error; fault:%d timeout:%d illegal:%d fence_w_ip:%d\n",
>   			 queue->qid,

Thanks,
baolu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
