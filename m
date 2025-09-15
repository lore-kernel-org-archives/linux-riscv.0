Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3F4CAC587
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcFJxOCxkIN27ZBjARSE9KQOaW3ncD/yJwCsNZjb2pM=; b=LccvvGTOU8hVTp
	uIgtL3JUfnAt41uMwBQUcRNl5Ra7UiYP7lI5F32eOAzM1j+8Pv5jCMF+sCeboCP45HhbkVr269sWz
	MrIgnHhIAdL7zyYBkpl6ItfopFn3xUH1UjKtiP+NvwkOflJRKVT2subMflBN+S6A1/o0seB8NHzty
	IlSiS6CoRPukyOqj+VlxQujZ8tHYkiDNKGqjVJ3tInp+TDrm8fVDVSVb864oqjpr0TPLgfHXXyrdL
	+Wf+m9xZsfe1acGAjyOatkw/qZxEy3XQRR9fqyMQE+QwEHS0vE5o1Ma6N+TML2gy9IyD300r51J9t
	e8qP+qsG5LeNCrVZXtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyfN-00000002XHr-3nTc;
	Mon, 15 Sep 2025 02:10:05 +0000
Received: from out28-53.mail.aliyun.com ([115.124.28.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyfJ-00000002XFg-18Jt
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 02:10:03 +0000
Received: from LAPTOP-2KT3QRS7.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ef9vIm0_1757902191 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 15 Sep 2025 10:09:53 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: linux-riscv@lists.infradead.org
Cc: iommu@lists.linux.dev,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	anxu@bosc.ac.cn,
	wangran@bosc.ac.cn,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: [PATCH v1 3/3] iommu/riscv: Register RISC-V IOMMU PMU at init time
Date: Mon, 15 Sep 2025 10:09:11 +0800
Message-Id: <20250915020911.1313-3-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_191001_474217_5FEE1370 
X-CRM114-Status: UNSURE (   7.72  )
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

Register the RISC-V IOMMU driver during IOMMU driver
initialization.

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 drivers/iommu/riscv/iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0eae2f4bdc5e..453d04b03c6c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -23,6 +23,7 @@
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
 #include "iommu.h"
+#include "iommu-perf.h"
 
 /* Timeouts in [us] */
 #define RISCV_IOMMU_QCSR_TIMEOUT	150000
@@ -1604,6 +1605,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+	riscv_iommu_pmu_unregister(iommu);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -1656,6 +1658,14 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	rc = riscv_iommu_pmu_alloc(iommu);
+	if (rc) {
+		dev_err(iommu->dev, "cannot alloc iommu pmu (%d)\n", rc);
+		iommu_device_sysfs_remove(&iommu->iommu);
+		goto err_remove_sysfs;
+	}
+	riscv_iommu_pmu_register(iommu);
+
 	return 0;
 
 err_remove_sysfs:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
