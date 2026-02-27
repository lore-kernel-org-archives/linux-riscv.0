Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C18FD7F95
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3d9FC/doRBtaut81h4ntszsNqRIYKP/OF9MFSgethOU=; b=BHahIBPU+LglsW
	tgKswTiqwqajnPM+JsEQLagKKBI4OU8hBG/dUyJWMj/f0OQMzWWaCXkj6a55SfkA1JK4khksU3n0G
	ZjgGHB1RxMPa+kBwDkJeILmpF/z8dTblbgfFgRcnV0UJkvn7VDJ2m1pB0/3KUlA+LvP8iffCDUJMW
	eBUl8i7uueZhCPAdzq/W2D7QuIOErcbhTXusLRJc6WO/eSr3LNb8fvpmhB/irILDp3PvJFeYEhMzW
	XvzPGJd46Jr+8eST4urqev/aMpO1W4DSgkYAYQ9ZYzwVj5L88RzDS802bE2fYg1tgXw7To4nVy27J
	n3Xr1J8fstvm7VGjyg2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw0R-00000008Hwt-1CDe;
	Fri, 27 Feb 2026 11:27:39 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvw0L-00000008Hv1-3VUW
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 11:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1772191612; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=IDOIyRmT6KuqPEPamC/FBdwtm7Gf75eSBm41m3iY6UA=;
	b=rZT54d9s0As/u5YJsUmAu9fqvho+0sKL9ROHcFx4wv7moTsiuLvROBhnn69gtm3wFlUv6yeOy3DgA1Sif0eNM4ADrhGtNwJctKDM6+9BiX6vbUDtfb0Y7J9CZr41lRNnlSPGcGaphBv8Xka6T2zXbplIn4ncYkc7H2BPRgxAPk4=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WzuBAQN_1772191610 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 27 Feb 2026 19:26:51 +0800
From: fangyu.yu@linux.alibaba.com
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	baolu.lu@linux.intel.com,
	zong.li@sifive.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] iommu/riscv: Stop polling when CQCSR reports an error
Date: Fri, 27 Feb 2026 19:26:40 +0800
Message-Id: <20260227112640.20197-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_032734_861429_A36EF055 
X-CRM114-Status: UNSURE (   8.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

The cmdq wait loop busy-polls the consumer index until it advances
or the software timeout expires. If the IOMMU has already signaled
a command queue failure in CQCSR, continuing to poll for progress is
pointless.

Make riscv_iommu_queue_wait() also terminate the poll when any of these
CQCSR error bits are observed.

This helps the caller return earlier in failure cases and avoids
spinning until the full timeout interval when the hardware has already
reported an error. On single-core systems in particular, the current
busy-wait can delay servicing the command-timeout interrupt until the
software timeout expires (90s by default).

Fixes: 856c0cfe5c5f ("iommu/riscv: Command and fault queue support")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index fa2ebfd2f912..5d7e49ef7ebb 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -368,6 +368,8 @@ static int riscv_iommu_queue_wait(struct riscv_iommu_queue *queue,
 				  unsigned int timeout_us)
 {
 	unsigned int cons = atomic_read(&queue->head);
+	unsigned int flags = RISCV_IOMMU_CQCSR_CQMF | RISCV_IOMMU_CQCSR_CMD_TO |
+			     RISCV_IOMMU_CQCSR_CMD_ILL;
 
 	/* Already processed by the consumer */
 	if ((int)(cons - index) > 0)
@@ -375,6 +377,7 @@ static int riscv_iommu_queue_wait(struct riscv_iommu_queue *queue,
 
 	/* Monitor consumer index */
 	return readx_poll_timeout(riscv_iommu_queue_cons, queue, cons,
+				 (riscv_iommu_readl(queue->iommu, queue->qcr) & flags) ||
 				 (int)(cons - index) > 0, 0, timeout_us);
 }
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
