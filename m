Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8168EC5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVv2Fn0upXBamsZDM8+6lLL1bNK6qcu/ARuMcf9DKKA=; b=B3ZNsERtUO3hCI
	LwBhidPzBGeAMxjJGblyxN/quueWC5vxzrMNMnt9cg3MmZcGD9hw1pYkuY6iQvFVpAcqiCmsSxqaf
	/OsJjP7eDZHBpvh5n5DDVlaZM0gCtU0pUFuGW3g3SbRxpCrsueBNHZcdifl9ghsgBAdKpVylk+JW2
	D+ligS/pK5ClA5L2pNG42J+hboGjjSzCjB7wt4mYZudIWt7fpGhg8tRFGccy6CVYz9iYlfG0UZN5v
	4x/b4Aq8SwqUiVb06J1ETZKySro/OBxgjxeW2qX65I6n8NUPezE1mazKBs2z0ZWuPCr1ZvCTwpBcR
	7TZD67SXghGCaryGhuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8R-00000008ZGn-2JwN;
	Fri, 07 Aug 2026 18:17:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8P-00000008ZEg-0t26
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOdgG1224879
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3W2bK0I72PE
	FqF/IzybkyckridGQhLhq7hDYw4GK5W8=; b=M6TO2jHYuo8yrhR5QJjZPBWlzuP
	YrdYfwnxXoR+a9RAIGPGUJ+9zRAaPzk64Hd5wP1BDodLkAehoYTZEzIBwz6y4x/k
	iozy6qfmLd+0et1ofNiO1FCDlUSMx4DSmpRBBLGrk7brT4EG17fuw8Y3ECFlqPw6
	KK6YGLZiD30zRTwTB068+QgkmwtA+guXsf2o81ANjPcEVOCtKRkk0S9FYxsjeYY4
	J41ZkxhxsnodwhWbLIiEvcFt0J8MnSGJrBT2bsn8KZzCof2Ev+SouAwzktvpwmDC
	g6fbH8qJa+gtx6jV3GiOCwXCKZWUw5m7BzNimWNdDWXgpMJcr5GDVW5jdUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgem97s7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e934385db1so39153166d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126651; x=1786731451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3W2bK0I72PEFqF/IzybkyckridGQhLhq7hDYw4GK5W8=;
        b=aqrt8Yf0yQ/ULjz6nbxNZDT5LGT7/3YUGWpKQITBt8FtutWS9ah3lCiHJXLBpfX9TX
         7+1kU5tpLE8jnHEgC/u4XA4Uj/Jm9HzJX07n685kGhrrGfIa/yN/mw5eCbjBJBkQVzla
         HyllGpTjHySssGqruLVcWjRuU5c/GylslOW1xoNOCq4qctAskXQDoen4InTP29NdM5R6
         TP4soSSwNvr7UUbxbJks4zoZbFws2AePTqByw0ftI2mGiPhgLCcCM5O5wSYNg2hwWmOw
         qjVo8X0MQqu4E1jym74QZ1j3sHZda2C87R+P6wvkgIKYk7f11D5stvixIBIYQd036QbJ
         O+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126651; x=1786731451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3W2bK0I72PEFqF/IzybkyckridGQhLhq7hDYw4GK5W8=;
        b=Nj7Q7olJuIVaxyPsq4JhiKwaSBscpyrpJt8YQ1+bqCuyc+dGcDfb1pRzqRcWwP9sNj
         UN4Igisn/7GK4bWTwVb/zW2L9bux0eEky29Uq1dHA05VIz5ZFJRAnTSam+5OW7OQ6DEg
         3u7kTL54uFOvxY0eV/oKEMc4yUKktXcyxUVFFDCqtbEcZLyPCIXpX8ZLegQNg7sjPGHG
         arfFb9MvY6x9lCQhcsilHen+7tpwHCxnzhfyxgsvUk7SDHSeA/yxjNzeyPtqeF3XAb7+
         rN+bOrCJ5VX1B3FHS5EsBi5fCG5Cm6pRihU6Ed1P874Hf1pOCynWoUDSq+sKj+dUkxqz
         DbXg==
X-Gm-Message-State: AOJu0Yx52leE2PPO+APBtMVIA9DELiOOKvjXetWKkpMsq0e9qgu9Ik7x
	ZviLL8moeMq2f/Pv0e0Rq/Sm3bZvTSpeD+dMAcMzpZ6VAO8Jt9/GUoV7hwfb6WZykYe558ALDBx
	ZidAOvZuqOUEhLikj+aVANgXBu2j+uF42N/WH+xIzT5OkqDEeGo7YNtpwv7J7Z6MqxW3uHhe3vk
	adeWQ=
X-Gm-Gg: AR+sD136l8AMs7inMselyXlg8h/yPc8w7G2nTVdHDnNxS5xDB2KH3ij0/EVkuYEqTbb
	QHlaMnupOS5zOYD6d8qKCYg9dV85oeNZr43F29YXBgf+rWERlzTRpdW+fWOsErLdr076I1AopF2
	/G19drckIdz9pZVxljCZx6mBVIiGM+tYhr5yGuCY7RvRu8rzNV/6pQPFhadbm8U7hAHr07Dk7A2
	CaXdd1cZs1SHCHQffrVsZCxmESh8jxdDYpFpT0tOGtLUMMJXQr1BMF4MMhbz+woCvJSXk2iSjAF
	5bAGC0hFFSJ/mvQJdWX1wAsmiExL89O/AZ7RpqKJGbsVWF156eWxrPRnW0ZN3W9NOdUUleYeKzv
	AasZNbos/fDlNdeDH0HhN0TQrWjA45x3ZbJowVeI=
X-Received: by 2002:ac8:5c8f:0:b0:519:8b76:2ce0 with SMTP id d75a77b69052e-52ce61b4eecmr277226441cf.37.1786126651363;
        Fri, 07 Aug 2026 11:17:31 -0700 (PDT)
X-Received: by 2002:ac8:5c8f:0:b0:519:8b76:2ce0 with SMTP id d75a77b69052e-52ce61b4eecmr277225761cf.37.1786126650858;
        Fri, 07 Aug 2026 11:17:30 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cf749fsm82183166b.58.2026.08.07.11.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:30 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 07/19] iommu/riscv: Add IRQ domain for interrupt remapping
Date: Fri,  7 Aug 2026 20:17:01 +0200
Message-ID: <20260807181713.228535-8-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Io89IadW38EY7WVmNTgo0s8KZEk9AdZx
X-Proofpoint-GUID: Io89IadW38EY7WVmNTgo0s8KZEk9AdZx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXwr7qmh1lPxUK
 CTdqilU2CXWynEMo5bjoxVdKumIKJN0C5l/jNksAAotf5u4d+jK/SB3jPGFzjz9Y0g8PbUwAK0I
 PIF7mHIXYwrRe8OIzS7QCj7YZt1tAEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXxC8M2x3Dh2wi
 jaVZcfejibn/5dmtnSSfERYg4IVC+EJVxJM16r60NE6IvJabrsXdD3O0ljnU1N8vmEKLzQER0Te
 jNhakKBk0fbLs85aYDpSb/P7WKPnSaSMSqHoAOyPdWmIBXSte/mzKKgWNe3UzoRVSuvlxKvwroO
 kaucJiDsQ536Ek3UVdMgaTmbyCWseLlTXho2Y7EHKH+QdY3SA47pCPJMG4jTte4D7dOXhRs0nQV
 ZQAXfj8GXxxOjV/itfd7JkiYk/5tbYR1B+K9Lzuxd62q+2l1MQyuYC4pXSp5GJixtX1FGqoADhl
 NckPJLBsHzc37EFHsSbQR55G9cl1DUHzkkIsW78P483HZUOucnsF+b+sp7wadQdW/bsihJ3WcAE
 qYIxjXkeaSlQEavS0uuaXSO9ZPudhV9aevQZGVcvxRORu5xXybSPU6fFkUl/jMcgyYuQ5pGRnnw
 dVX35Y7spIuQSCUTncw==
X-Authority-Analysis: v=2.4 cv=X9Ni7mTe c=1 sm=1 tr=0 ts=6a76213c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=qlKvAlJJmACmlsHknIYA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111733_368373_AAE92D48 
X-CRM114-Status: GOOD (  27.07  )
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

Create a per-device MSI parent irqdomain as the hierarchy hook for
future interrupt remapping. The remapping tables will be owned by the
attached paging domain since the MSI IOVA mappings live in its page
tables.

The domain is installed from probe_device() and removed from
release_device(). This is only the initial skeleton: it does not
remap interrupts yet, and non-paging IOMMU domains will fall back to
the raw IMSIC physical address when remapping is added.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/Makefile        |   2 +-
 drivers/iommu/riscv/iommu-ir.c      | 119 ++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c         |  46 ++++++-----
 drivers/iommu/riscv/iommu.h         |  27 +++++++
 include/linux/irqchip/riscv-imsic.h |   7 ++
 5 files changed, 182 insertions(+), 19 deletions(-)
 create mode 100644 drivers/iommu/riscv/iommu-ir.c

diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
index b5929f9f23e6..9c83f877d50f 100644
--- a/drivers/iommu/riscv/Makefile
+++ b/drivers/iommu/riscv/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += iommu.o iommu-platform.o
+obj-y += iommu.o iommu-ir.o iommu-platform.o
 obj-$(CONFIG_RISCV_IOMMU_PCI) += iommu-pci.o
diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
new file mode 100644
index 000000000000..5873addf2a1b
--- /dev/null
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * IOMMU Interrupt Remapping
+ *
+ * Copyright (c) 2026 Qualcomm Technologies, Inc.
+ */
+#include <linux/cleanup.h>
+#include <linux/msi.h>
+#include <linux/slab.h>
+
+#include "iommu.h"
+
+static struct irq_chip riscv_iommu_ir_irq_chip = {
+	.name			= "IOMMU-IR",
+	.irq_ack		= irq_chip_ack_parent,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_set_affinity	= irq_chip_set_affinity_parent,
+};
+
+static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
+						unsigned int irq_base, unsigned int nr_irqs,
+						void *arg)
+{
+	struct irq_data *data;
+	int i, ret;
+
+	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		data = irq_domain_get_irq_data(irqdomain, irq_base + i);
+		data->chip = &riscv_iommu_ir_irq_chip;
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
+	.alloc = riscv_iommu_ir_irq_domain_alloc_irqs,
+	.free = irq_domain_free_irqs_parent,
+};
+
+static const struct msi_parent_ops riscv_iommu_ir_msi_parent_ops = {
+	.prefix			= "IR-",
+	.supported_flags	= MSI_GENERIC_FLAGS_MASK |
+				  MSI_FLAG_PCI_MSIX,
+	.required_flags		= MSI_FLAG_USE_DEF_DOM_OPS |
+				  MSI_FLAG_USE_DEF_CHIP_OPS |
+				  MSI_FLAG_PCI_MSI_MASK_PARENT,
+	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
+	.init_dev_msi_info	= msi_parent_init_dev_msi_info,
+};
+
+struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
+						    struct riscv_iommu_info *info)
+{
+	struct irq_domain *irqparent = dev_get_msi_domain(dev);
+	struct irq_domain *irqdomain;
+	struct fwnode_handle *fn;
+	char *fwname __free(kfree) = NULL;
+
+	if (!irqparent)
+		return NULL;
+
+	fwname = kasprintf(GFP_KERNEL, "IOMMU-IR-%s", dev_name(dev));
+	if (!fwname)
+		return ERR_PTR(-ENOMEM);
+
+	fn = irq_domain_alloc_named_fwnode(fwname);
+	if (!fn)
+		return ERR_PTR(-ENOMEM);
+
+	irqdomain = irq_domain_create_hierarchy(irqparent, 0, 0, fn,
+						&riscv_iommu_ir_irq_domain_ops,
+						info);
+	if (!irqdomain) {
+		irq_domain_free_fwnode(fn);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * The RISC-V IOMMU doesn't validate MSI data, so we can't set
+	 * IRQ_DOMAIN_FLAG_ISOLATED_MSI. This means VFIO requires
+	 * allow_unsafe_interrupts.
+	 */
+	irqdomain->flags |= IRQ_DOMAIN_FLAG_MSI_PARENT;
+	irqdomain->msi_parent_ops = &riscv_iommu_ir_msi_parent_ops;
+	irq_domain_update_bus_token(irqdomain, DOMAIN_BUS_MSI_REMAP);
+
+	dev_set_msi_domain(dev, irqdomain);
+
+	return irqdomain;
+}
+
+void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_info *info)
+{
+	struct fwnode_handle *fn;
+
+	if (!info->irqdomain)
+		return;
+
+	dev_set_msi_domain(dev, info->irqdomain->parent);
+	fn = info->irqdomain->fwnode;
+	irq_domain_remove(info->irqdomain);
+	info->irqdomain = NULL;
+	irq_domain_free_fwnode(fn);
+}
+
+int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
+					struct iommu_domain *old)
+{
+	return 0;
+}
+
+void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain)
+{
+}
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..bfe606a0cb9a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -19,9 +19,9 @@
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
-#include <linux/generic_pt/iommu.h>
 
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
@@ -810,26 +810,9 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	return 0;
 }
 
-/* This struct contains protection domain specific IOMMU driver data. */
-struct riscv_iommu_domain {
-	union {
-		struct iommu_domain domain;
-		struct pt_iommu_riscv_64 riscvpt;
-	};
-	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
-	int pscid;
-};
-PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
-
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
-/* Private IOMMU data for managed devices, dev_iommu_priv_* */
-struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
-};
-
 /*
  * Linkage between an iommu_domain and attached devices.
  *
@@ -1258,6 +1241,8 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
+	riscv_iommu_ir_free_paging_domain(iommu_domain);
+
 	if ((int)domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
 
@@ -1289,6 +1274,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct pt_iommu_riscv_64_hw_info pt_info;
 	u64 fsc, ta;
+	int ret;
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
@@ -1303,6 +1289,12 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	if (riscv_iommu_bond_link(domain, dev))
 		return -ENOMEM;
 
+	ret = riscv_iommu_ir_attach_paging_domain(iommu_domain, dev, old);
+	if (ret) {
+		riscv_iommu_bond_unlink(domain, dev);
+		return ret;
+	}
+
 	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
@@ -1430,6 +1422,7 @@ static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args
 static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct irq_domain *irqdomain = NULL;
 	struct riscv_iommu_device *iommu;
 	struct riscv_iommu_info *info;
 	struct riscv_iommu_dc *dc;
@@ -1453,6 +1446,21 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	info = kzalloc_obj(*info);
 	if (!info)
 		return ERR_PTR(-ENOMEM);
+
+	if (imsic_enabled()) {
+		irqdomain = riscv_iommu_ir_irq_domain_create(dev, info);
+		if (IS_ERR(irqdomain)) {
+			kfree(info);
+			return ERR_CAST(irqdomain);
+		}
+	}
+
+	/*
+	 * irqdomain is NULL when it's not necessary; either there aren't
+	 * any IMSICs or no MSI domain has been set up for the device.
+	 */
+	info->irqdomain = irqdomain;
+
 	/*
 	 * Allocate and pre-configure device context entries in
 	 * the device directory. Do not mark the context valid yet.
@@ -1461,6 +1469,7 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	for (i = 0; i < fwspec->num_ids; i++) {
 		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
 		if (!dc) {
+			riscv_iommu_ir_irq_domain_remove(dev, info);
 			kfree(info);
 			return ERR_PTR(-ENODEV);
 		}
@@ -1478,6 +1487,7 @@ static void riscv_iommu_release_device(struct device *dev)
 {
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
+	riscv_iommu_ir_irq_domain_remove(dev, info);
 	kfree_rcu_mightsleep(info);
 }
 
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..5d83537911b6 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,9 +14,29 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/irqdomain.h>
+#include <linux/generic_pt/iommu.h>
 
 #include "iommu-bits.h"
 
+/* This struct contains protection domain specific IOMMU driver data. */
+struct riscv_iommu_domain {
+	union {
+		struct iommu_domain domain;
+		struct pt_iommu_riscv_64 riscvpt;
+	};
+	struct list_head bonds;
+	spinlock_t lock;		/* protect bonds list updates. */
+	int pscid;
+};
+PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
+
+/* Private IOMMU data for managed devices, dev_iommu_priv_* */
+struct riscv_iommu_info {
+	struct riscv_iommu_domain *domain;
+	struct irq_domain *irqdomain;
+};
+
 struct riscv_iommu_device;
 
 struct riscv_iommu_queue {
@@ -66,6 +86,13 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
+						    struct riscv_iommu_info *info);
+void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_info *info);
+int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
+					struct iommu_domain *old);
+void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain);
+
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 61af3a5bea09..ce8fe1ead7a0 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -91,6 +91,13 @@ static inline const struct imsic_global_config *imsic_get_global_config(void)
 
 #endif
 
+static inline bool imsic_enabled(void)
+{
+	const struct imsic_global_config *imsic_global = imsic_get_global_config();
+
+	return imsic_global && imsic_global->nr_ids;
+}
+
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_RISCV_IMSIC)
 int imsic_platform_acpi_probe(struct fwnode_handle *fwnode);
 struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
