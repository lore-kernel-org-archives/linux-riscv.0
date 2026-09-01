Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF0C61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwlrXA7ETDO4/9jWJPF7xs73Ey4Jrh5PnhzvqyoUcGg=; b=g9rqWgSKhg6yuF
	9FyDvwUR/wnlDXFEUdE7j77LfsMzG49l8If/pZHC+nW4EArzbfjR/FZXJHjRoa5Am/qP0BZ8d6f6v
	I47i7tD5+RUBxT4Em+4KlhZEDz5wpv0zr3cvYCaBMBmq7cIw1Tha3Q0tnRJAP59XsYp6RK6XGdLLn
	ikmGZWcsGsSHTvUTXuXjey/9FqVX3/sWs7vtDgVF42HTuA7ITDB9G322d3wXhyVWxE5AV77GW8z3Q
	YzoUdZ7uVeIbGxEHTECoQ23DexsCs0nW87Ir1KhAtqjk5WyZzm9XrHNOCgdv5kFJKKe9zOyh5LknX
	uCBxKvB69UlMX8SodQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oi6-0000000CEWi-0zVD;
	Tue, 01 Sep 2026 13:39:34 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oi3-0000000CEUo-2zBH
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788269970; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=XIEfra7Gk5GpAPhNqAO8Wx/0NjuLdwOdToBsoQSy4QA=;
	b=Qo4vsBwupYtn5L2kXcej+Wk2ptvHE/mdXOEtJsUrxinjdydqvRyGCv21ErBtnqMHVg8C6bGPnuJ12Af+ZfYc6OguhF6tbAbacUthBmZaaUW3lYeL65Ghqg6gCDo9ppmyjv4qKOJCuqjMYky5kv7ZTUQuhcHA0qQjP2pROyAzvtk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XA9NaZW_1788269967;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XA9NaZW_1788269967 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 21:39:28 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/3] iommu/riscv: Avoid waiting on failed command enqueue
Date: Tue,  1 Sep 2026 21:39:20 +0800
Message-Id: <20260901133920.14550-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
References: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_063931_923927_91BA81F1 
X-CRM114-Status: GOOD (  11.07  )
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

Do not wait for IOFENCE.C completion when the command failed to enter the
queue. The command was not published to hardware, so waiting for its
producer index can only report a misleading execution timeout.

Fixes: 856c0cfe5c5f ("iommu/riscv: Command and fault queue support")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index e335beb70e42..fe8e6d0f8a23 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -419,8 +419,9 @@ static int riscv_iommu_queue_wait_for_space(struct riscv_iommu_queue *queue,
 }
 
 /* Enqueue an entry and publish it to the hardware queue. */
-static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
-					   void *entry, size_t entry_size)
+static int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
+					  void *entry, size_t entry_size,
+					  unsigned int *out_prod)
 {
 	unsigned int prod;
 	unsigned int head;
@@ -462,14 +463,16 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
 	atomic_set(&queue->tail, prod + 1);
 	atomic_set(&queue->prod, prod + 1);
 
-	raw_spin_unlock_irqrestore(&queue->lock, flags);
+	if (out_prod)
+		*out_prod = prod;
 
-	return prod;
+	raw_spin_unlock_irqrestore(&queue->lock, flags);
+	return 0;
 
 err_busy:
 	/* Report the failure and continue; full RAS recovery is not implemented. */
 	dev_err_once(queue->iommu->dev, "Hardware error: command enqueue failed\n");
-	return prod;
+	return ret;
 }
 
 /*
@@ -508,7 +511,7 @@ static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
 				 struct riscv_iommu_command *cmd)
 {
-	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd));
+	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd), NULL);
 }
 
 /* Send IOFENCE.C command and wait for all scheduled commands to complete. */
@@ -517,9 +520,12 @@ static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 {
 	struct riscv_iommu_command cmd;
 	unsigned int prod;
+	int ret;
 
 	riscv_iommu_cmd_iofence(&cmd);
-	prod = riscv_iommu_queue_send(&iommu->cmdq, &cmd, sizeof(cmd));
+	ret = riscv_iommu_queue_send(&iommu->cmdq, &cmd, sizeof(cmd), &prod);
+	if (ret)
+		return;
 
 	if (!timeout_us)
 		return;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
