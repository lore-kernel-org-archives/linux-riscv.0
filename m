Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57222CDB479
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSNochpuyECkVk4cbX4+0KXlO3YxTJ21Rv3rIBTmVVo=; b=2uUtTurjButQ5K
	LsVZ4sVgja4ym3W73rPY0KA4QamYPymUtbu5sfyK7Wo301guub/3b3TdtRRpq8JA227gpJlrcIYqb
	8fppwOAoOuv7VB+DDnow1icKcR3XPnWNqWeCptSCaXvmR1vCYkmkdwPsQgAwy0TWJ27yAkEjDob+L
	OBeHcyoaBaWJMZN7Nql6L7LxYIdtkK/+7/H5Ga9Lpv2k/DIQhxBTErlZDK/772FhQ7Y++fPq44une
	AJVOY3/lqgOfMjIshKIF3b6iYAVXpa3D1Pa69LED4kcCV/ZaTHl77p9ZW9RKJLT0O1ezlqnZAWAKe
	qgbWupCNbWD2GiNDFV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOGz-00000007szY-1DRp;
	Wed, 24 Jun 2026 14:08:13 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcOGw-00000007syG-1sjS
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 14:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782310083; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=t2xQXxgCnfhWmSGFXL1x7sR0Wlz3vICx5yrBNlLkLO8=;
	b=asTkd2N+ZGoeV6dDCdWFbY/4TjnMgjatGMRZWEhTXlwBUmemQgV7LqlxK8Zytm6zB96M3kgXvf3C0qUgwzbVmYZZlRqmFpsAmS5bZ5qXV5jxrFSMbgrfzAklrfASSUVTtVlbXwgPUHnSrROp/yG9TYAoVXH5Q6xb/kTZntP6wms=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0X5YSeF8_1782310075;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X5YSeF8_1782310075 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 24 Jun 2026 22:07:57 +0800
From: fangyu.yu@linux.alibaba.com
To: zong.li@sifive.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tomasz.jeznach@linux.dev,
	will@kernel.org
Subject: Re: [PATCH] iommu/riscv: Replace illegal command with dummy IOFENCE to prevent hardware lockup 
Date: Wed, 24 Jun 2026 22:07:52 +0800
Message-Id: <20260624140752.31155-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260623081902.589810-1-zong.li@sifive.com>
References: <20260623081902.589810-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_070811_024329_B7E0DB61 
X-CRM114-Status: GOOD (  13.11  )
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

>When the RISC-V IOMMU encounters an illegal command, the hardware
>stops processing and the HEAD register remains pointing at the
>illegal command. If software does not handle this properly, the
>hardware will be stuck at this index indefinitely, preventing any
>further command queue operations.
>
>This patch implements a recovery mechanism by replacing the illegal
>command with a dummy IOFENCE instruction (all operands are zero):
>
>1. Prevents hardware lockup: By overwriting the illegal command with
>   a valid instruction, the hardware can continue processing from the
>   current position instead of being stuck.
>
>2. Enables user recovery: After replacing the illegal command, the
>   user/driver has an opportunity to retry the original failed
>   operation rather than losing all queued work.
>
>3. Minimal hardware impact: A dummy IOFENCE behaves as a NOP, it
>   it performs no cache invalidation operations and has no side
>   effects on the system state. This is the safest replacement
>   instruction.
>
>Signed-off-by: Zong Li <zong.li@sifive.com>
>---
> drivers/iommu/riscv/iommu.c | 24 +++++++++++++++++++++++-
> 1 file changed, 23 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>index cec3ddd7ab10..6305ec5f467b 100644
>--- a/drivers/iommu/riscv/iommu.c
>+++ b/drivers/iommu/riscv/iommu.c
>@@ -464,13 +464,35 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
> static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
> {
> 	const struct riscv_iommu_queue *queue = (struct riscv_iommu_queue *)data;
>-	unsigned int ctrl;
>+	struct riscv_iommu_command cmd;
>+	unsigned int ctrl, head;
> 
> 	/* Clear MF/CQ errors, complete error recovery to be implemented. */
> 	ctrl = riscv_iommu_readl(queue->iommu, queue->qcr);
> 	if (ctrl & (RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
> 		    RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_FENCE_W_IP)) {
>+		/*
>+		 * The head pointer is not updated by the hardware, it
>+		 * still points to the index of illegal command
>+		 */
>+		riscv_iommu_readl_timeout(queue->iommu, Q_HEAD(queue), head,
>+					  !(head & ~queue->mask), 0,
>+					  RISCV_IOMMU_QUEUE_TIMEOUT);
>+
>+		if (ctrl & RISCV_IOMMU_CQCSR_CMD_ILL) {
>+			/*
>+			 * Use a dummy IOFENCE instead of the illegal command
>+			 * to prevent hardware lockup
>+			 */

The RISC-V IOMMU spec 1.0 (Section 5.15, cqcsr) states:

  "If software makes the CQ operational again after a cmd_ill or
   cqmf error, then software should resubmit the commands submitted
   since the last IOFENCE.C that successfully completed."

So it seems that simply replacing the illegal command and letting the
queue continue is not sufficient.

Thanks,
Fangyu

>+			memset(&cmd, 0, sizeof(cmd));
>+			cmd.dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE,
>+						RISCV_IOMMU_CMD_IOFENCE_OPCODE);
>+			memcpy(queue->base + head * sizeof(cmd), &cmd, sizeof(cmd));
>+			dma_wmb();
>+		}
>+
> 		riscv_iommu_writel(queue->iommu, queue->qcr, ctrl);
>+
> 		dev_warn(queue->iommu->dev,
> 			 "Queue #%u error; fault:%d timeout:%d illegal:%d fence_w_ip:%d\n",
> 			 queue->qid,
>-- 
>2.43.7

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
