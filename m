Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E05EC5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxYQn/nv3KWBmR6qZo3EBoRfTyuAP8bwO5cs/7s643Q=; b=Tg7cUGwaOeuQDN
	WgoJRgVmXUW1vEXJCECZGLCtGxh2Q4UnhjY7AOcOMvqCrzYJsLyhH3TnrYcSxCgTOUjZuFiH7halk
	VEZni/pyxDV1+ySm80B6Qor5uiUdSmc05bkPqGzqiZYWCB2hgWZ5Jun79SJr19EtfbykaDbxs4kju
	jC33ha8YJUGVd8aQqujLJpXkQy/e5xX2hvtU30PRLUjtVob33ayq8R0UUXFrhnY+V2gakatkJpRPV
	1Z9WHKEx5mh/kmhydB1lRz8YDfwJUAxig+HKTs0AWb1KL+/O4+YNyt2UUuAvO1JPH/CqkoLcbs6o7
	rU/rJzxbUi+H8YqbLXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWc-0000000CDj3-1jO2;
	Thu, 20 Aug 2026 21:42:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWY-0000000CDeX-3eyF
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7Wbk3491340
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OMcGDZhxVuc
	cNCru+kcpslo0rISnU/nhvZSrVpv+JVQ=; b=Anv/o896b7RDhMhhxl/Ae1A6gLz
	GGyA/zfRW+SYMHZE3kBG3o0CYq7YNe1rT0eIqfUNMGOwB0i4XeSX7bhHMqSNvN5q
	9A2hEA9OMMeaYMuOnndAzvUtW55WTbBnujrmnbwuCSj9kfeYlr13uhelIi2awbkV
	LMw4ELiJskPvIqJbqySVzbg+xek82w2H82eKYuWVVE8Fm2x4LHD8+E0LJM56K7HU
	id+OlcGXzLbxWOr/NvBCAcwhmLgqhJN7ESimcW17fkKH5U98OsJfDNn8lp2E9f/n
	fd24qoOBfLDIZVwUMUZ21+ZZAg54ZK0/6B0qqnhvuSJ6z4bZiSCK3gLp5eQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcb072-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so2807031cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262129; x=1787866929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMcGDZhxVuccNCru+kcpslo0rISnU/nhvZSrVpv+JVQ=;
        b=GELjC3n+HOsL96Bde98EKEb1brqP82QDFKRhbFOynrGDAtFtuZ3UAz0ijCQ/F6Yd+H
         RhaHA8G8CZDP1cMNogImrQylSVpsFKkLyh6fsoSacKSDVJ9ijqgJNpfZ9zTNEltbUmNc
         F5QgV6M+G6/dRepdOLpwYVCiwJ4c5NTZ80JnLnqNETJm0CDKthgPwGZe5CnurlPkvObK
         VYaMitqPXqTJJBG7lRhd7DbnnZnQkYCXjXdH+HGxgHLWM7rORIP3juamsmmyHjimt1Bl
         S4UAcpChy0kya3hjOvQ5S1QYejYpFGXk4h2iL1HNv0P1L7gTByWEUAHCQPHKJO7dXQpI
         MLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262129; x=1787866929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMcGDZhxVuccNCru+kcpslo0rISnU/nhvZSrVpv+JVQ=;
        b=ri0aIooBIhSo9ww2kwKQ4ClAhcgYHDUVDnKVBAj3Hr67m9l5hWr/948jFlyIyz9BUW
         pOm0+NGxvtnPrl0WNcYSN9qMw7U9GHx1ADiEDyWkxk0Oo4DdZAh1LCA/XuL1/Y0hUIOH
         PLn9LaahczcBMYJZARWof8cW6w4hdyjSeAvxmg49YtX0lT7G1ufBkiwPnjvfHBBc3EyU
         OMyF8NJ5j9z9O18vuWOm10JxQdsl3YoYHnMOeZcVA8mYqp8HAwj879a7oFohAgKYef6V
         /OsmZsnk/zaUQU3JgolEf7Ta3YJZ0ws0s3iY/aKYYIPxpAsB9nPKGvt7Nmwl3zZdkyDZ
         94Iw==
X-Gm-Message-State: AOJu0Yx4h9O0xVhw7Kj1UZa/JnCXQj4y8Y0S7+ENhJhX3hB306gTRirT
	UmLt2EVZTro8VJkbTRFAP420MWNDughAK6JneIdwv2gDtEnXK5p7QpIK2IR9T1zteyx0HX2dAeR
	YArpt6e7DCnmxY5RBxqNifVlTlbW8fVI057J3VTM/4MUiIFGpOPcAovPZJL6HLHskLneJNu6751
	Ivg40=
X-Gm-Gg: AR+sD11OpReke6EEXSs1o+qxDE55arImT8fZ0M1UMVJqb+b+8VZ7rXib7I+uiNJ8kLh
	8/xEwRsG0lem432Ef8r29wYH5WYm4oY2ZRObzLPZGHbwMfrWqgqaMT+EitNSEzrBRFn4uAkQHkr
	qhYhMzsaLsrzOD68JLpZ6WAWyNJvifZPo7sQ660+23brsw/JY3DDvfRJQuMA1II8yKdbwTsBJVg
	ZPNoYu8Rs9hQx9rbeYn4r3frtc2p+PTtju9wL6ODFzjtZ/9HCT1u3CBwvHlxZ33PZEA8apVa14D
	M9vP5UUlsImUJVLLQ+s3s9WhdoUpPjyzVKlVusBGH128XPFtTdRZUHEgGfFWFqwaO44wE0XydYW
	r+SXZeMpm
X-Received: by 2002:ac8:5a95:0:b0:52d:2e0a:8ca1 with SMTP id d75a77b69052e-52df5a75f81mr11674591cf.39.1787262129182;
        Thu, 20 Aug 2026 14:42:09 -0700 (PDT)
X-Received: by 2002:ac8:5a95:0:b0:52d:2e0a:8ca1 with SMTP id d75a77b69052e-52df5a75f81mr11673921cf.39.1787262128585;
        Thu, 20 Aug 2026 14:42:08 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9bb47b3sm294585e9.3.2026.08.20.14.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:07 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 08/21] iommu/riscv: Add IRQ domain for interrupt remapping
Date: Thu, 20 Aug 2026 23:41:37 +0200
Message-ID: <20260820214150.545737-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a8774b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VB2jXpgF0Y-UNvywB1sA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxNmetnBX6utc
 dyEeJPle99kbCd8xD8fJkapLmW9yRjRofBD36ujz6tDLPSYam22vhEFKVzP/mNwfTgflByjQjuU
 NOkJuRGdp/O/FHJuhs5c2gs6dHzZ7c3wYCGsfRu9u4QkxRBFZBTjzH65F+q777Os0eqhhf0BI6F
 3n2j7Of3O1oxkfBZIM6qlox83MG/EZHzpkoA9xnQSulQxkDj+K6GdOfpEn3eJq/YFniwtF6RK7r
 Yk0misFLxiS0c2Nhn1DlaonPXEjW/Rckgv/TNk5kq2RIMacidABnHoOQ0jmNLOi4iTav4orH2Ju
 3etP/bNWGJbG8vd8AO4HkeA3kAzMptF9nTs0hy47lWTWqgOOHGGBtcoehNjJHB5lLX+kPC3gjcP
 cQvK/XhW8SP1K06jELruvz1YpBuJiNH1ZKtkhVQTdvAFdQAdevlTErZ0D0vfr03zmFqEZRqe0Zb
 QXtHsBXwK5i/oT9S62A==
X-Proofpoint-ORIG-GUID: bKwKRNxqJ8j2FSLlI0ECSwtZ2F7gn8dn
X-Proofpoint-GUID: bKwKRNxqJ8j2FSLlI0ECSwtZ2F7gn8dn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXzc6l2NHApw/l
 GPxVmPs2jgvk49Rujpt7mmwmm6IFZftdRm4UDS8owBRdbzL0Tp5wDQK+UvAgzIcNiAvseB2IS2w
 9J0dDMLFftmrEe+MZ13681AMaw+Sjtw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144210_920733_C6F0BD58 
X-CRM114-Status: GOOD (  27.82  )
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

Create a per-device MSI parent domain as a hook for interrupt remapping.
Keep the remapping tables with the attached paging domain because MSI
IOVA mappings are part of its page tables.

Initially, the new domain only forwards operations to its parent. Later
commits add MSI target mappings for paging domains, while non-paging
domains continue to use physical IMSIC addresses.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/Makefile        |   2 +-
 drivers/iommu/riscv/iommu-ir.c      | 118 ++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c         |  46 ++++++-----
 drivers/iommu/riscv/iommu.h         |  27 +++++++
 include/linux/irqchip/riscv-imsic.h |   7 ++
 5 files changed, 181 insertions(+), 19 deletions(-)
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
index 000000000000..0aab0efeb70e
--- /dev/null
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -0,0 +1,118 @@
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
+	int ret;
+
+	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < nr_irqs; i++) {
+		struct irq_data *data = irq_domain_get_irq_data(irqdomain, irq_base + i);
+
+		data->chip = &riscv_iommu_ir_irq_chip;
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops riscv_iommu_ir_irq_domain_ops = {
+	.alloc			= riscv_iommu_ir_irq_domain_alloc_irqs,
+	.free			= irq_domain_free_irqs_parent,
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
+	char *fwname __free(kfree) = NULL;
+	struct irq_domain *irqdomain;
+	struct fwnode_handle *fn;
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
+						&riscv_iommu_ir_irq_domain_ops, info);
+	if (!irqdomain) {
+		irq_domain_free_fwnode(fn);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/*
+	 * The RISC-V IOMMU doesn't validate MSI data, so we can't set
+	 * IRQ_DOMAIN_FLAG_ISOLATED_MSI. This means VFIO requires its
+	 * allow_unsafe_interrupts module parameter.
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
