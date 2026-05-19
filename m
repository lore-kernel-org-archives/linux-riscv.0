Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C000CD5BA6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pfjhZcISHtNO98P2fR6FTy1IK/9Zbv+qBTi6RkFs24I=; b=nrjgbXvsafObOJ
	RP9a4Ab4oDSdXlAngA31FtbXq0IvcdoY3gkOTey3tbhplWjYLxFF532DJN6rnWfCdnFH56i++2tGk
	3c6q+BCJZfYUk2NtipU7cVeAhCnA+pLiCFFhOo5k94eQfWuSWwprtIfzkE6zbOAPyjs5gU+DShCIS
	BRBLOGavPeNze7+dTtQaKagOePZkY0fHb0q+zj5FKWcRrVinig8t8wIO9X/xguzdqHzE1Lwf/ztg+
	SIYLyQmlsDvVItGs6Dg8ko9NKVtu1lHePZERufra8SGFY4HRW19uuK/jZ+AagJVCGJDpyTiw1Dq85
	cT8ZO8XdP36pD5reg9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK16-00000001Z4V-2jnI;
	Tue, 19 May 2026 12:57:48 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPK13-00000001Z1x-1c9E
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 12:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779195457; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ORsC3jjziczAoDhmvkQwijx70HMiWpP5k92grPFcmws=;
	b=S5ntU5UrwJgfjg6O8GE0X8hgPBCkjjq0zA+9XJop3/JgVtQ6jSRBAho3/hbybYXKKVfOE4CtdlM1pPlr1S8Zzncuw4/WqfgWTFA47su6Wd8+oQD3aKqzpwj+L+6NEmDxxLgnx8vsFncu95/eOn6jDU54lrQnleOyBZ8Qzx6zH+k=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X3FViH8_1779195442;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X3FViH8_1779195442 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 19 May 2026 20:57:23 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	andrew.jones@oss.qualcomm.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] iommu/riscv: prefer WSI on IGS=BOTH when wired IRQs are described
Date: Tue, 19 May 2026 20:57:16 +0800
Message-Id: <20260519125716.81594-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_055746_497523_D9871164 
X-CRM114-Status: UNSURE (   9.46  )
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

The RISC-V IOMMU spec defines IGS=BOTH as supporting both MSI and
WSI, with software selecting the path. The DT path already behaves
as expected by selecting WSI when wired IRQ resources are described.
The ACPI path, however, currently falls back to MSI even when
firmware describes wired IRQ resources.

Use firmware-described wired IRQ resources as the trigger to select
WSI for IGS=BOTH:
  - DT: "interrupts" present, no "msi-parent"
  - ACPI: DSDT _CRS Interrupt() descriptors
    (mainline does not yet parse the RIMT Interrupt Wire Array)

When triggered, rewrite igs to IGS_WSI and reuse the existing WSI
handling. Keep the existing behaviour otherwise.

Fixes: d5f88acdd6ff ("iommu/riscv: Add support for platform msi")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-platform.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 399ba8fe1b3e..bd7712231140 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -71,6 +71,21 @@ static int riscv_iommu_platform_probe(struct platform_device *pdev)
 	iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
 
 	igs = FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps);
+
+	/*
+	 * IGS=BOTH means the IOMMU supports either MSI or WSI;
+	 * the spec leaves the choice to software. Use the firmware-described
+	 * wired interrupt resources as the trigger:
+	 *   - DT  : "interrupts" property present, no "msi-parent"  -> WSI
+	 *   - ACPI: DSDT _CRS Interrupt() present  -> WSI
+	 * Otherwise default to the MSI path.
+	 */
+	if (igs == RISCV_IOMMU_CAPABILITIES_IGS_BOTH &&
+	    platform_irq_count(pdev) > 0) {
+		dev_info(dev, "firmware describes wired IRQs; preferring WSI on IGS=BOTH\n");
+		igs = RISCV_IOMMU_CAPABILITIES_IGS_WSI;
+	}
+
 	switch (igs) {
 	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
 	case RISCV_IOMMU_CAPABILITIES_IGS_MSI:
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
