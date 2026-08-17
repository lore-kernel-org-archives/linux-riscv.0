Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368F0C5DF74
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXvUbUhoEtnPNXLipbK+ruAwswP8GqV7IoMfHIUfuR4=; b=tkoNyHUUIsogWU
	ENu7wM8sVCgjFpcWJec2XumGxg+4Dr3acw8go25jOTE2t/D2PIl90v9x5yNZDANzo2hsvOFSMqtpO
	j8Zhx8ll4NJSv0DrMhW+GVQ8nH6xGVZcFzcIYj5fjte9748VG3JLoImV5+E0zyimon9bAkzNgBtV8
	/QDoE6vLOKtl979OV4ZIqwA9AkRK69QFfDXBiVRKNKZzqlMMvhIBtuNOvV3prZzCb8N5Hl8i/oExX
	rVzRVrUFIrtJ8RE/oje7+QWkt+COnLLqTa3O5vfHW0jazHW4vhpzzVpXfzj3c/fx0eYinGPSaB3Nl
	UxzeMzBmenKYjY0oG9hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyKH-00000006IZV-1qUC;
	Mon, 17 Aug 2026 14:28:33 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyKC-00000006IXg-2fN2
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786976906; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=elSQcfZeblurM3/OL+mlSXqqGCSbGGx49NKsTqTo6v4=;
	b=YUGfW0gaeR9jNBmPBMhKdY54q2InvECzKV420UN3UrfSJrr217dezxoshOK9qxFQDDlAyG6+cG+QRnmLqyzNtpblnc83aNZAjreAMVcMF40vENnDbkn+Psz/G3M+WVyxk7alhLG1dLfDisqKUBkHXnNpqOdtcM9SIa/S6GmwLys=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X9A9H.G_1786976904;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9A9H.G_1786976904 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Aug 2026 22:28:25 +0800
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
	zong.li@sifive.com
Cc: fangyu.yu@linux.alibaba.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] iommu/riscv: Avoid waiting on failed command enqueue
Date: Mon, 17 Aug 2026 22:27:28 +0800
Message-Id: <20260817142728.61783-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260817142728.61783-1-fangyu.yu@linux.alibaba.com>
References: <20260817142728.61783-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_072829_309688_E3D2C07A 
X-CRM114-Status: GOOD (  10.26  )
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
index 86cec408be5b..2b3dc63536d5 100644
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
@@ -465,15 +466,17 @@ static unsigned int riscv_iommu_queue_send(struct riscv_iommu_queue *queue,
 	atomic_set(&queue->tail, prod + 1);
 	atomic_set(&queue->prod, prod + 1);
 
-	raw_spin_unlock_irqrestore(&queue->lock, flags);
+	if (out_prod)
+		*out_prod = prod;
 
-	return prod;
+	raw_spin_unlock_irqrestore(&queue->lock, flags);
+	return 0;
 
 err_busy:
 	raw_spin_unlock_irqrestore(&queue->lock, flags);
 	/* Report the failure and continue; full RAS recovery is not implemented. */
 	dev_err_once(queue->iommu->dev, "Hardware error: command enqueue failed\n");
-	return prod;
+	return ret;
 }
 
 /*
@@ -512,7 +515,7 @@ static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
 				 struct riscv_iommu_command *cmd)
 {
-	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd));
+	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd), NULL);
 }
 
 /* Send IOFENCE.C command and wait for all scheduled commands to complete. */
@@ -521,9 +524,12 @@ static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
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
