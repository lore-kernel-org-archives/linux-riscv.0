Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED70C5ACD1
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jUoepQeLK/q25yaelQmBX6L+Y7mPFGzZMvlGwtEJUr8=; b=b7pi06PzdmzImC
	hvWK8j71h9NYZ4p9gxmEWwN9IkS5GYibA2nMYQkrPK6nfxcQEadyCla0uVm0Da+fTCWsECLbL9xVd
	kqjNMY/oEiece60G5wYSZuff9PTYM7u7tc1u4RGmxosjZiq5Iwev3Sy/TzBz4Nor+mO5PO+dMYZod
	Oo115yC4jWyhCEzlSl+AYeodDE+mUQ3vUNBottzPLQod0SzT6lJa8+NriT8o9qeicxrLlHAQJJFHh
	hbvzv790WHlfdczWJiqRX1Ov7Obr3X0Mu7nQ3BvnWyjzirX8wqRIMhgYLUuNnO2BrZd7V+GVZ3EPv
	qWB5m+ugmJhhl1OEyaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8V-00000008ZLz-44i2;
	Fri, 07 Aug 2026 18:17:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8T-00000008ZJr-460p
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOAY71190366
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CF89onSK303
	YBEmO0lv7kpxdFdjR7obOW+RzB6t3qF0=; b=JVl9ZjMxfHHXG5s5cn1wj+001ZR
	HGMCj89gaiB95QWCZ6D+yGbQZmCBxYTg8z02AMAzHj7yRNt2MFF9w15L7s5hYXkR
	++Pq7zPpuFuLf0lpHdfTzjg5WnsZvxhs8eSU3yV2yCudXL4IQn8qMbTV4et+RcGO
	lC1kr+MP5uvFCXOsue9FbDUSU0z0Ep9P/dssgQB/mSySoDqxfDZcxDnYc27H1lXa
	8HGrKCy++nlr75I7xgiqkN6D9nOo/rFIlnwG3sxZZ6X9SVagShst3zsCOeBd05IZ
	b6jLDu9ZpCPr37ut5n4FqJogu10tVob73W41TogG4uQmTBGWnkqxY8FWyqw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcujj674-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1eb52e1fso60677271cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126656; x=1786731456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CF89onSK303YBEmO0lv7kpxdFdjR7obOW+RzB6t3qF0=;
        b=d8E65NpIKCRgtcMl6eWeflkDW+xDutlR0VpGnUJWVCdTrLDvXRk+Ysb6aT6Mgql6Di
         2DqUUIKKJ/V7GKGsEroL8zmj5DKBSy7THDX5XgkChzDGp3sIp7/70ngFMgFtAEdIl+cc
         9k7/q38Ol09Gt4xm2+m4LzgGBVDxISidC6jo2fs3t7JTNrKtppkUbMePH2NlHd6MpVsW
         G9GAzAJNf8TsLZyjXJfD49N1pVFeZbwyxFlzYC8iOWBcciQF1F6op+GuvjNlxctLIjYR
         JFMkCYDt48eeraNjXT2ZAk2GbZ7QWur3UIV52+TQslEz2q8R8V42zXniUjrgaJnGIHA4
         wlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126656; x=1786731456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CF89onSK303YBEmO0lv7kpxdFdjR7obOW+RzB6t3qF0=;
        b=g6H7qM2KaO3MY2wbfURCBpkcrirx25o3BeLmZaNYMh9SmL/PMaYD1YpokBqCB0PMq+
         rJ5IdL0QonjLBXaHMDBBwux50Fcv1xUV0qFBJ1npR3u5M/cdaee6xJE5yISc70HJzs9r
         iY6MV3sQz/f0ST2lD07/Q1e79xUPcQJIxK51gIJJkCJSCaULFHEF3YBpNBZ8uMNdFiEH
         cmC2/gVhK551MG4EJiZelJimpwQVshzg8sa0lFLa3550PP3rpSasFCCtFnGqSfekH67A
         H+GFvteRcbDRML2wEhpcw1ML2glkz27A45ml+BaKyMHLQWHUofE6ySHNx0iQE0A+Mkka
         1SSw==
X-Gm-Message-State: AOJu0YyPOWqdCSNtx2sknYSN6RFDU94FaSGikcnaSIV3mweP6gfBTWAY
	uMZj+8v97ICUlkkaW6zdafUo+grj48Xd/5Dsf1iVlHF7hVARugMsadMWGxM1LX3G3bmE5CEHOoc
	bjHbSw01NRb99xdvxp/OYCyAuqfGXnF/95l0SL8nf4iRHNI9lmNbB79X1o/Rp5VBjnVh8/VHJhN
	ZixQE=
X-Gm-Gg: AR+sD13/lUdxMgAcVrQ1MnbigdaODcpdcZ9uwZNfS8onIJEaO3YBu3LYYckgfs4LKWm
	qN4cL1sPPgtfqtrK1vdJMbCC+dmyBofLL4nTDnfxvAIAbyxJeBcvPHuFO2yIigQ6UUqeD6ngZic
	bUFoRMZUX+YqVv9bbwnDNKSkRms/+tUDrKRPmt2ZSGOimwyyOildJiHHpVHqehfxQDJU3m4XAvo
	GRTtJe9FplEV3sBSuwPbz+I7IQN/37w1WEtuRP/zLjRb29MpAznLm/eBN3JBgViLIooXPWctprM
	IB8OfbTt5aGp0UV5EaZSW1NLvFEXFA47cuD1gG+H2r9TcE8lFSB1IrRW3sX/trMt1uVF5e4nV9B
	1B31ukxZmpffkIRe5jJUfBLcr57b2+XIvybbee1k=
X-Received: by 2002:ac8:5f89:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52ce61fe07dmr261971191cf.42.1786126656356;
        Fri, 07 Aug 2026 11:17:36 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52ce61fe07dmr261970551cf.42.1786126655930;
        Fri, 07 Aug 2026 11:17:35 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cf5da5sm80900866b.53.2026.08.07.11.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:35 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 10/19] iommu/riscv: Pre-map IMSIC MSI targets
Date: Fri,  7 Aug 2026 20:17:04 +0200
Message-ID: <20260807181713.228535-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX9T2jcbEypUGa
 Lus7kFSdJiiYN3NCfXAdowCji0fX4OL6oSon97TO7eO/qD86GMCI16Z8bxlP9y+Hn+glsPKTVHu
 3jc5zQQtP63mn1JW49mw5g+gj0jiCSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX2dkGmTWasVIs
 blO1Srk8vOUpJ6r5P2nKwvhO30hw8/2dFOrVs1x/jctAtQkl9XXN6YHhSMCjboAMvAiKvoRiNIc
 RBqATTaNctcJAblPGZFx7mKB57xwG7BqD5K4LR7oAQzmnL6iseMVGsoGgnpx4r8ssQjvc/J7+bp
 pcRBLRkYayd3y9V5rtWf8vW6z7oG7FS99cM9eSBq5Ob6zKDS8str5c9T85OS/ewij/eIAunNT2G
 Yq9PNIl4wWfEvuMzZBPKShSqEGBgUQMkKV1u1H5hvpQy7kTIslHM+pCBNCQbgI0j+RSX3GGdWp/
 u5a4lkzvr45HHIB67jk8DYOnJPigrqrmZp4BGOSFYgU486EAbr0X73CRh7ICBS452s0g6aVq4r9
 cRusPKAPWK1Vmn6HGkcuk14DYMm8Of+a8tHW6SI8+0ixIC6hmluAuSKCX88JywBJaEsPMMnz9Tj
 RLNI63/ec+FYRvwzLhw==
X-Proofpoint-ORIG-GUID: Sf_qmfLw4M1cvOi_QUOMX3emFCDWLDva
X-Proofpoint-GUID: Sf_qmfLw4M1cvOi_QUOMX3emFCDWLDva
X-Authority-Analysis: v=2.4 cv=Wssb99fv c=1 sm=1 tr=0 ts=6a762141 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=JmVyJN48mWrVe0T4eXUA:9 a=O8hF6Hzn-FEA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111738_021154_71565607 
X-CRM114-Status: GOOD (  27.60  )
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

Prepare for irq_compose_msi_msg() to redirect IMSIC-targeted MSIs
through the IOMMU with an O(1) lookup. Unlike fixed-target MSI
controllers, IMSIC target PAs change on irq_set_affinity(), which
may run in atomic context, so compose cannot map the selected
target on demand.

Pre-map each populated IMSIC MSI target page into a domain-local
IOVA table when the device's paging domain first allocates
IMSIC-remapped IRQs, so every possible target IOVA is available at
lookup time. The table is indexed by a transformed IMSIC physical
address using the same transformation defined in the IOMMU
specification for the MSI table (and the function will be used for
the MSI table when that support is added later).

The table is sized by riscv_iommu_ir_msi_iova_count(), i.e.
BIT(group_index_bits + hart_index_bits), rather than
num_possible_cpus(). This is because riscv_iommu_ir_msi_iova_idx()
derives its index from hart_index_bits and group_index_bits, which
are sized for the group with the most harts, i.e. there may be a
sparse mapping.

Select IRQ_MSI_IOMMU so iommu_dma_map_msi() and iommufd_sw_map_msi()
are available to the driver.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/Kconfig    |   1 +
 drivers/iommu/riscv/iommu-ir.c | 105 +++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c    |  12 +++-
 drivers/iommu/riscv/iommu.h    |   6 ++
 4 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..f557b55c2c14 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -10,6 +10,7 @@ config RISCV_IOMMU
 	select GENERIC_PT
 	select IOMMU_PT
 	select IOMMU_PT_RISCV64
+	select IRQ_MSI_IOMMU
 	help
 	  Support for implementations of the RISC-V IOMMU architecture that
 	  complements the RISC-V MMU capabilities, providing similar address
diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 1e157faf7bbe..0dff74aa9b18 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -5,11 +5,97 @@
  * Copyright (c) 2026 Qualcomm Technologies, Inc.
  */
 #include <linux/cleanup.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/msi.h>
 #include <linux/slab.h>
 
 #include "iommu.h"
 
+/*
+ * Compute the MSI index for an MSI physical address using the
+ * IOMMU "extract" function (RISC-V IOMMU spec section 2.3.3).
+ */
+static size_t riscv_iommu_ir_extract_msi_idx(phys_addr_t pa)
+{
+	const struct imsic_global_config *global = imsic_get_global_config();
+	phys_addr_t mask, addr = pa >> 12;
+	size_t idx;
+
+	mask = BIT(global->hart_index_bits + global->guest_index_bits) - 1;
+	idx = addr & mask;
+
+	if (global->group_index_bits) {
+		phys_addr_t group_mask = BIT(global->group_index_bits) - 1;
+		phys_addr_t group_shift = global->group_index_shift - 12;
+		phys_addr_t group = (addr >> group_shift) & group_mask;
+
+		idx |= group << fls64(mask);
+	}
+
+	return idx;
+}
+
+static size_t riscv_iommu_ir_msi_iova_idx(phys_addr_t pa)
+{
+	const struct imsic_global_config *global = imsic_get_global_config();
+
+	/* msi_iova[] is only used for the host imsics */
+	return riscv_iommu_ir_extract_msi_idx(pa) >> global->guest_index_bits;
+}
+
+static size_t riscv_iommu_ir_msi_iova_count(void)
+{
+	const struct imsic_global_config *global = imsic_get_global_config();
+
+	return BIT(global->group_index_bits + global->hart_index_bits);
+}
+
+static int riscv_iommu_ir_build_msi_iova(struct riscv_iommu_domain *domain, struct device *dev)
+{
+	const struct imsic_global_config *global = imsic_get_global_config();
+	struct iommu_domain *d = &domain->domain;
+	dma_addr_t *msi_iova __free(kfree) = NULL;
+	unsigned int cpu;
+	int ret;
+
+	guard(mutex)(&domain->mutex);
+
+	if (domain->msi_iova)
+		return 0;
+
+	switch (d->cookie_type) {
+	case IOMMU_COOKIE_DMA_IOVA:
+	case IOMMU_COOKIE_DMA_MSI:
+	case IOMMU_COOKIE_IOMMUFD:
+		break;
+	default:
+		return 0;
+	}
+
+	msi_iova = kcalloc(riscv_iommu_ir_msi_iova_count(), sizeof(*msi_iova), GFP_KERNEL);
+	if (!msi_iova)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		const struct imsic_local_config *local = per_cpu_ptr(global->local, cpu);
+		phys_addr_t pa = local->msi_pa;
+		unsigned int shift;
+		size_t idx;
+
+		if (!pa)
+			continue;
+
+		idx = riscv_iommu_ir_msi_iova_idx(pa);
+		ret = iommu_dma_map_msi(d, dev, pa, IMSIC_MMIO_PAGE_SZ, &msi_iova[idx], &shift);
+		if (ret)
+			return ret;
+	}
+
+	domain->msi_iova = no_free_ptr(msi_iova);
+
+	return 0;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
@@ -22,9 +108,25 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 						unsigned int irq_base, unsigned int nr_irqs,
 						void *arg)
 {
+	struct riscv_iommu_info *info = irqdomain->host_data;
+	struct riscv_iommu_domain *domain;
 	struct irq_data *data;
 	int i, ret;
 
+	/*
+	 * MSI IOVAs are domain-local, just like DMA IOVAs. The device must be
+	 * quiesced, including MSI teardown, before switching away from or freeing
+	 * the domain. iommu_dma_map_msi() requires the group mutex to be held;
+	 * take it around the domain lookup too so info->domain can't change
+	 * out from under the build.
+	 */
+	scoped_guard(iommu_group, info->dev) {
+		domain = rcu_dereference_protected(info->domain, true);
+		ret = domain ? riscv_iommu_ir_build_msi_iova(domain, info->dev) : 0;
+	}
+	if (ret)
+		return ret;
+
 	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
 	if (ret)
 		return ret;
@@ -116,6 +218,9 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
 
 void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain)
 {
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+
+	kfree(domain->msi_iova);
 }
 
 void riscv_iommu_ir_get_resv_regions(struct device *dev, struct list_head *head)
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 106cc8216942..07287c0e72e7 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -811,9 +811,6 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	return 0;
 }
 
-#define iommu_domain_to_riscv(iommu_domain) \
-	container_of(iommu_domain, struct riscv_iommu_domain, domain)
-
 /*
  * Linkage between an iommu_domain and attached devices.
  *
@@ -1337,6 +1334,8 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	if (!domain)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&domain->mutex);
+
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
 	/*
@@ -1450,6 +1449,13 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	if (!info)
 		return ERR_PTR(-ENOMEM);
 
+	/*
+	 * Set info->dev before creating the irqdomain: riscv_iommu_ir_irq_domain_create()
+	 * publishes the irqdomain via dev_set_msi_domain(), making the .alloc callback
+	 * (which dereferences info->dev) reachable.
+	 */
+	info->dev = dev;
+
 	if (imsic_enabled()) {
 		irqdomain = riscv_iommu_ir_irq_domain_create(dev, info);
 		if (IS_ERR(irqdomain)) {
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 16b3c9c4cf8c..8bd41dd63f0e 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -32,14 +32,20 @@ struct riscv_iommu_domain {
 	};
 	struct list_head bonds;
 	spinlock_t lock;		/* protect bonds list updates. */
+	struct mutex mutex;		/* serializes sleepable, domain-wide setups */
 	int pscid;
+	dma_addr_t *msi_iova;
 };
 PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 
+#define iommu_domain_to_riscv(iommu_domain) \
+	container_of(iommu_domain, struct riscv_iommu_domain, domain)
+
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
 	struct riscv_iommu_domain __rcu *domain;
 	struct irq_domain *irqdomain;
+	struct device *dev;
 };
 
 struct riscv_iommu_device;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
