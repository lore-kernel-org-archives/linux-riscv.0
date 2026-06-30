Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B00CC43327
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 02:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxyq8FweGZ9Jkd7jd0xYQa4MLF+gNwQviwI4Osr/Wjk=; b=eBeLejcQAaOx7/
	RSyjsv2gUQGXQ9W5oxFAg04nSa4qgcPjoZT0DVb5GzhIyOxQQuTRppZY1ewSlqgT12Zt7ym5+YKjP
	JuWMt2gWgz8c3OBwxgJ2XMZZbmh3warPWlfqSzRgJQ11OWrNLPSKDCpfpZ9CU01oziRZbuS56sFkV
	qVSWLXxtahyS7kt7VKMJll2CIMk8jUrfYo5s8SAG0MR/Gymf472tST6eIqcQp9LWYf/F0QUtanhOt
	YWcPwuS2zOR0fE6GZD8lQlZhgIeSHqtUApLYNxzL8wJ43UM2ZCf3ncovv5OlrQf2BxAYgKa/py2Ul
	D5jxuOVgDDrK6hmUCo4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weOFN-0000000Fi4r-0mbt;
	Tue, 30 Jun 2026 02:30:49 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weOFL-0000000Fi4E-11Oe
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 02:30:48 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-139b914bab6so5451433c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 19:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782786646; x=1783391446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii6UHtihwzsZnK7EsOywu4rokZlizEKakSYZSPed4Ds=;
        b=LtYr2mg9OESvt8+RpPH0ZJmFTgeyv1lfUkf58jdjL0DiTH8sCJfj7sQUXUB8sWJ/qN
         qjmWJYegGFb7Mi77kj9G2YtYWpTQoN79cj2kL/QpRu1r+KH+t+DdlQxakqhkmrhOiEWC
         M5EO2Akpz5h3Uj68+/uu1eHxw6p8GLamzhMxHRbnzEQxb8l/keM7W3Xh3KDt62A5mbc2
         zBqO8AsVC57Levv5Rm8fl9l3hLYGb1bAoUj46MbXNqrbYeLzfHMWngIc3DmFuFmnT5N4
         em9FjU9wDRytjRroUMGY07I0FmxGaQQbj3UzVrIRegVdkPRSGlILPNH60EHldJ2Z+Rb0
         wYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782786646; x=1783391446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii6UHtihwzsZnK7EsOywu4rokZlizEKakSYZSPed4Ds=;
        b=PG9lvgS+rQIRZMTcwzX9AqWmoNycwUV/+ZKoqXSIiXyBfBoHpMnOqe8YRvsSaMYnjo
         XgYMnehFQuXUtpbcCdCeVZg1xWoCVaJ0jvsIZEifE0AP/pBDdTbnMFnni2PREJsYZT0o
         q4srcXsz+MqCiOkAXcygKKPSujg7//nn7OrCxoJjG50VzZimJGa1Aof9iB9X4kV7hjpZ
         zjhZ5akKLfOa6KHTPvNj8wRBkoaGnp3zehUC1n8FNkY/9WRH56WgssV+s9Cf0SgDTvaq
         QAvO/+nKHclBrud0GxAvBwsgJ+5z3x+ucsK6jJ7f/bdU0BHFyi0lQy0N6Djd+F+K8e8F
         trZA==
X-Forwarded-Encrypted: i=1; AFNElJ81kPZGnx+Ip3XPm7kUZ+3wTOV1w0YYkSQLYpDK2VBvGIMP5SzFqO26pB8sZN17pr7FNR7oOav2jUjFKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfEu7DC7H1rRqLQXUpRDbtpZzPg74eSaoExelapqg885S+qGDH
	QYZisCs2ELJ16m4RyIlgQ5A5LZ5fo3xXTx61DtGiaXjo61+uKSIgbakJWTz08YDHV/s=
X-Gm-Gg: AfdE7cn3cfA4qLFuAn5K0pFxY4iJG2jVg9VUf/4F0aDBww+TxEbmMVg6nYlpiRFySx2
	CqXzDrDicto82tWp41/d/WSF3URMdPldPOgvCV0FbPJlkqx3keXzdGTj9k7LpwUqwl7ljTkY/Gz
	OGo8F9v5bjSxSZIZ1QJlMvoLHGSq+GUMfbI0tcIDeARH4AZynATClWkMWoJzh4xAhAq0Alha2V5
	UISzRtijrVjQDdTkYqdmZ2P5lYOuttKWyE2MFkIwz720gOE1Q1DRdHNdvXK086k0AFoq7CEREfb
	bEAxgrXXQ5F6+mKChGr4aGoYqc/W9Aat/77p2Sf8Kd3r08A/Ivl3Py7z5yNAkcN1rVV+j6i1Y+l
	JO3G6oBTGziLI1gDSIgfj2scO9vFRgR6vZb0+yVDwxfKh60l/Jm/pmY2P0Bich014zSTxt22/QA
	vDcyRxyyGZMMeiBPG0NhCQkzsU
X-Received: by 2002:a05:7022:3d18:b0:139:ed5a:eef0 with SMTP id a92af1059eb24-13b2a1cc067mr1088234c88.47.1782786645430;
        Mon, 29 Jun 2026 19:30:45 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba794csm2168488c88.10.2026.06.29.19.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 19:30:44 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v2] iommu/riscv: Replace illegal command with dummy IOFENCE to prevent hardware lockup
Date: Mon, 29 Jun 2026 19:30:42 -0700
Message-ID: <20260630023042.837926-1-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_193047_310160_02761774 
X-CRM114-Status: GOOD (  29.50  )
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

When the RISC-V IOMMU encounters an illegal command, the hardware
stops processing and the HEAD register remains pointing at the
illegal command. If software does not handle this properly, the
hardware will be stuck at this index indefinitely, preventing any
further command queue operations.

This patch implements a recovery mechanism by replacing the illegal
command with a dummy IOFENCE instruction (all operands are zero):

1. Prevents hardware lockup: By overwriting the illegal command with
   a valid instruction, the hardware can continue processing from the
   current position instead of being stuck.

2. Enables user recovery: After replacing the illegal command, the
   user/driver has an opportunity to retry the original failed
   operation rather than losing all queued work.

3. Minimal hardware impact: A dummy IOFENCE behaves as a NOP, it
   it performs no cache invalidation operations and has no side
   effects on the system state. This is the safest replacement
   instruction.

Signed-off-by: Zong Li <zong.li@sifive.com>
---

The main goal is to at least prevent the hardware from getting stuck
and crashing the entire system.

Here are the main issues we would need to solve if we fully follow the spec:

1. IOFENCE index shift: After an illegal command, if another thread is
waiting for subsequent IOFENCE to finish, resubmitting commands will
change that IOFENCE's index in the queue. This means the waiting
thread in 'riscv_iommu_cmd_sync' might finish too early because the
'prod' value should be changed as well. We could fix this by making
IOFENCE write a sequence number to a specific address, and having the
thread wait for that data instead.

2. Timeout errors: If an illegal command happens while another thread
is trying to write a command, that thread might be waiting for the
tail to move (in 'riscv_iommu_queue_send'), and exit the wait due to a
timeout. This leads to errors in the caller subsystem (like DMA). So
it seems even if the resubmit finishes later, it might not help much.

3. Queue tail mismatch: Similar to point 2 situation, a thread waiting
in 'riscv_iommu_queue_send' expects prod == queue->tail. If we
resubmit commands quickly, queue->tail is updated asynchronously to a
farther value. The waiting thread might never see the condition met
and time out.

4. Shadow queue overhead: Inside the threading IRQ handler, we cannot
easily know what the illegal command was just by checking the current
command queue. We would need to create a "shadow command queue" to
keep a history. This would break the current driver design. We would
also need to add locks to prevent race conditions on shadow command
queue, which would reduce the driver's performance.

Considering these trade-offs, I prefer not to make the driver much
more complex and slower just to handle rare hardware errors.
Treating this hardware fault as a fatal error without trying to
recover it in software might be too extreme and would require a
hardware reset. Therefore, this patch might be a good middle ground.
It prevents the hardware lockup. Even though we might lose some commands
and cause incorrect results for the user, it at least keeps the system
alive and gives the user a chance to retry their operation again.

Changed in v1:
- Added more comments
- Rebased on v7.2-rc1

 drivers/iommu/riscv/iommu.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..c009c1906e23 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -464,13 +464,43 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
 static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 {
 	const struct riscv_iommu_queue *queue = (struct riscv_iommu_queue *)data;
-	unsigned int ctrl;
+	struct riscv_iommu_command cmd;
+	unsigned int ctrl, head;
 
 	/* Clear MF/CQ errors, complete error recovery to be implemented. */
 	ctrl = riscv_iommu_readl(queue->iommu, queue->qcr);
 	if (ctrl & (RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
 		    RISCV_IOMMU_CQCSR_CMD_ILL | RISCV_IOMMU_CQCSR_FENCE_W_IP)) {
+
+		/*
+		 * Resubmitting all commands submitted since the last IOFENCE that
+		 * successfully completed will introduce various race conditions.
+		 * Use a dummy IOFENCE instead of the illegal command to prevent
+		 * hardware lockup.
+		 * Please note that some commands might be lost, including:
+		 *  - The task from the illegal command itself
+		 *  - The commands submitted between the last IOFENCE and illegal one
+		 * However, this gives the user or driver a chance to retry the
+		 * failed operation without resetting the enitre system
+		 */
+		if (ctrl & RISCV_IOMMU_CQCSR_CMD_ILL) {
+			/*
+			 * The head pointer is not updated by the hardware, it
+			 * still points to the index of illegal command
+			 */
+			riscv_iommu_readl_timeout(queue->iommu, Q_HEAD(queue), head,
+						  !(head & ~queue->mask), 0,
+						  RISCV_IOMMU_QUEUE_TIMEOUT);
+
+			memset(&cmd, 0, sizeof(cmd));
+			cmd.dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE,
+						RISCV_IOMMU_CMD_IOFENCE_OPCODE);
+			memcpy(queue->base + head * sizeof(cmd), &cmd, sizeof(cmd));
+			dma_wmb();
+		}
+
 		riscv_iommu_writel(queue->iommu, queue->qcr, ctrl);
+
 		dev_warn(queue->iommu->dev,
 			 "Queue #%u error; fault:%d timeout:%d illegal:%d fence_w_ip:%d\n",
 			 queue->qid,
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
