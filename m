Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3756AC61DD3
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7K2TeCSPRq6Jb3BoPAi4BjVTCmbk0zqrR4OvFYXPy4=; b=FvvVIyRLv2G08V
	lVuDQ74csu3vGU1GRZ6hEFRNT0TVPzVlLTewwjZDsXLpZViVnpRT5+1PCBBa9g/z6LNdKgT5yeNXA
	puvfFDCpPN/sZHGl1Qax4yKxE/rxHDqkEonx8Cf/6CVU8BjVdnrVSNacvT+BEDJqEt5MDmRKE6X3N
	ZYJdlNQ0vOMDr94iUI/AWVoeDMUvOILJw2Ilu6qhE1Vd0L42TXROllj5S1b73H52KUDIGuyIsY4Xt
	oRwlRZcMnx/apVw2y7gKzXxuwVcFLNT8vNIGR7Rn1QDTtXGkVxWNrQFE+PN/1TBvyCfVdUdpMSA9e
	6v6qAvTYJdeZhCTVysUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oi4-0000000CEVu-3bE4;
	Tue, 01 Sep 2026 13:39:32 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oi2-0000000CEUk-2YFX
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788269967; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Zhv3H2+2w0gZKGeUibRr/8VGF24nes4VuRka42uR/+4=;
	b=jqdzBQnAW5zLQ/f07uzqoJ7+3MytExawkSvMuK5bn3tZASmMH3lB0RUh4x1EUyNhKr5ieGSKysdSjBh6W3L0Zk6R5KsP+4lu3fj/j/8vUT7ikf76NZtn7KGMPY/kuHWUsm64gKYVRIovtEd6Rem8O282EAKlLvzTleW04c7IQo0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XA9NaYb_1788269964;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XA9NaYb_1788269964 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 21:39:25 +0800
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
Subject: [PATCH v2 1/3] iommu/riscv: Add command queue lock
Date: Tue,  1 Sep 2026 21:39:18 +0800
Message-Id: <20260901133920.14550-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
References: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_063930_818916_118CA29B 
X-CRM114-Status: UNSURE (   8.69  )
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

Add a raw spinlock to the RISC-V IOMMU queue state so command queue
publishing can be serialized by a later change.

Fixes: 856c0cfe5c5f ("iommu/riscv: Command and fault queue support")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 1 +
 drivers/iommu/riscv/iommu.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..2c0dcc90cf85 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1560,6 +1560,7 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	int rc;
 
 	RISCV_IOMMU_QUEUE_INIT(&iommu->cmdq, CQ);
+	raw_spin_lock_init(&iommu->cmdq.lock);
 	RISCV_IOMMU_QUEUE_INIT(&iommu->fltq, FQ);
 
 	rc = riscv_iommu_init_check(iommu);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..5676001548cc 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -12,6 +12,7 @@
 #define _RISCV_IOMMU_H_
 
 #include <linux/iommu.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
 
@@ -23,6 +24,7 @@ struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
 	atomic_t head;				/* unbounded shadow ring buffer consumer index */
 	atomic_t tail;				/* unbounded shadow ring buffer producer index */
+	raw_spinlock_t lock;			/* serialize queue publishing */
 	unsigned int mask;			/* index mask, queue length - 1 */
 	unsigned int irq;			/* allocated interrupt number */
 	struct riscv_iommu_device *iommu;	/* iommu device handling the queue when active */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
