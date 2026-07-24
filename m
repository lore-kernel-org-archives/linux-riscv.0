Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E5C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9EEuRM4KERmfHt3cdjTXEmDh03yPK5HG84recHPeAM=; b=r9wPu9aX8HH+/n
	e/FhudVAUq+ZKIuj7U6l0iGH9ewxVnEm9bGS6fs6jBly5xcGlS7aGu9hoPjig+bf227ECnQLvTXog
	+qvLrR2wgMkpG3dNZvuwFCz+tFhtRpjjp42tuUfEi4WQ7tLUX/nFnzvwHmqnzipADBCOuEATp1lm1
	ZFI/JUIUP4Kz2TGMRhL8rYUOP/2zZMYQOhsIoRuSOLY4evqm8AZqhPdtxkFQ4M8htMGWtQLkO/CIr
	ai5AwABDDCaE5Te0Lm1nlQpWE+bZAnozQKu0afQhHVjVoZx3ucBKfmye8sVoNBNUNFtzV94RVPIp0
	UxF60wNe91o4HhBBsFzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZx-0000000GfJk-2ZRF;
	Fri, 24 Jul 2026 15:12:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZs-0000000GfBE-3Lah
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbG1E3178246
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yDa0cSUYvzd
	lObAUgtdKmyhrtsbnB8uhf7mj+sQjD7w=; b=audgQk8C8HqbDLgb13UDsgXvSmN
	8HQoXuMBIHWwPvZiruZE7Y05TtCY/V14u4/Gm5sARevsyRIB1Q40ldmGkVvNYWX6
	WANDGUFBWbKumA4SiB60akU+bCfsBqaNqEgfaM1mxEP+A4ipoIQ8uU2IvAwg+dO2
	8atxxOobTU9SYJsdojOcK9SZ59DQ44s2X3tYlMrLOBVe5wpHxnZOHj1VOiIHYWZg
	XEu7NDo82Ic5/wNQSom1WgLRCH7HdrFj5fFEgkavzKbO4yruNXb1Y5LFDW8oxZWb
	ASUK/XFVjCtI7WgUOuZBfiMVa3fISc8L+qeEN2Q07iwSEflUmaYChzPYATg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah4mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso5913231cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905963; x=1785510763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDa0cSUYvzdlObAUgtdKmyhrtsbnB8uhf7mj+sQjD7w=;
        b=gmTVRyq5JsMc5XfG0OH5KvzvqEckokN/+hdcVG+Y568BMPuSomsHu4+Ot5j8BcR7VB
         L2Tl8bcOMsaDEJnysp3miIKkieeJ72nZ6PQDBQhJANQnZBj6OY5mayBbQBOU5DQlprMx
         FeOUVai9DarT5hWuVk33hgKmNh+R5vUfzJZ+Kw93djmzkJlyo0VqSu+lokaY5XXFuIkN
         9JmJaQQyQ4UhVUo66tH0TPhSTPMOamNRlQpUuAZYqc8LgH1FfNj9siQ0EAUPM2s0DCLn
         A/89XGRAuPzbQmBBeyK/GmqNuxBopvJRnH9oFq11hjXeTjbMxnOeBQpaLODTZ7Bg4SyP
         GI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905963; x=1785510763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDa0cSUYvzdlObAUgtdKmyhrtsbnB8uhf7mj+sQjD7w=;
        b=puPYNZ0emSBiqqA2Jgo4aYc0Yr4FNSJI/OPqZA7pFDmbBqR9WwuI/7NLtnz4fPFsB0
         n8pUs6fHl7f/OOBz2okMC/sO3xMApGfn6YNcgRieMXSM3jNKNym85SxvaqAzXBgRpxZ6
         4aA2OOuBC1t7265VeI1kfdJf4KRmUPVul/PwNaH+KXT+Qg+TnaRCd8VomzKZn0kiKYVE
         IcTOh5N/vhuznz7Tb0XpJaGHNEG2+gEyRqfdcrWJ9G5wFEUvC6WP4ZQdzSTHaJxUreTO
         GQ0knvntuzF0UxM8BEeWZTVgus3ylAGtrvo4AKctkYyjmaYnnAUXjwAX2t8M/xby4BWm
         Mkfw==
X-Gm-Message-State: AOJu0Yz3U6BL9WXeubV5Jpp/lL3Ul5PG0ibQLpKbIAOPBheeW7uCUJTk
	4Edk8HyWD3oj8pXkbFB+PtF2tFUbaBUrYDsJXajFsyI7WtvJ11m9d5uF7OdlJ4rnhg10qqW3pdl
	ZbHuNIFC1zG3RnOBEPuXDX9utexx9XvS4CyT+BYkWxTQJJEkHotyaerNPvKK7ZTKGJbAqe/mad+
	dzYg4=
X-Gm-Gg: AR+sD13C9Nl0igqTBQdTGY3egxS0yOmg7ATIbr851owbjH5uijl5Kwpr0pXNr7HewyC
	18YBEtMd46NoIGasIV1hDAkPQprvpJe45520fuNJvhW8vtfb836sbD12X/FDgOUixDW02G+8Ckt
	134m05rnLdqbmtpHiHb08TJZwfesSCxi78vwOX7E8Y1jNGCEYf+xM0QuVSvPqJtF1rWhzq/Oevu
	BQG163vOCcGdZYHgXcJIPmpPq6XIy8MaAZF8/me8A0WCDHU/ObLGRXzO2uxXrkCKKIyYu8dNS9v
	QZG5I4jucZ34OvLZeEN8REitfVQO5tKwXBKSfz8R5f2OJXuStNhkQKsB8xii13RwW//lpY1I+W7
	DVmQHM8Wo23qOgeJ2k5W1UHvytCRsbfzEYqLd
X-Received: by 2002:ac8:7f0a:0:b0:51e:4f6a:b9b8 with SMTP id d75a77b69052e-5283dd94d1cmr75413991cf.1.1784905963179;
        Fri, 24 Jul 2026 08:12:43 -0700 (PDT)
X-Received: by 2002:ac8:7f0a:0:b0:51e:4f6a:b9b8 with SMTP id d75a77b69052e-5283dd94d1cmr75413451cf.1.1784905962655;
        Fri, 24 Jul 2026 08:12:42 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5746e98sm92883a12.22.2026.07.24.08.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:41 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 10/14] iommu/riscv: Pre-map IMSIC MSI targets
Date: Fri, 24 Jul 2026 17:12:14 +0200
Message-ID: <20260724151218.965929-11-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX5teuqdwtaCMN
 wbPBOOGVIRuEuAMwA0TMR9omYXGvN+un64hSGJXuUaD0mfdKNVCyRvKWU5+yvkdTkb/m0ueh4GH
 UtQHE7Fpqa3u7mfDPtdckvTHc+tFNeQ=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a6380eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xZf72DcWP4T9vyFnQ2MA:9 a=O8hF6Hzn-FEA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: zZ49Zx19H7wql5T-FR6Vm6B3YiHH4T9g
X-Proofpoint-ORIG-GUID: zZ49Zx19H7wql5T-FR6Vm6B3YiHH4T9g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfXyJiSBzBdQUbN
 PGlemvwJcl8z9nJNE/oeVtJwOleYoaHlRoOUB+M773CZOAGhl4WjewHMw7nbDqxu5mSUksvNXzW
 y/TiIqlj9AVjDZKoa+XH+dwJ4920g3SMpIYwh6sMeSX7hwsqHW0lrwWuwBt672+3EkUbtj8gxcS
 q3rBmpjyleqUEDXvMW9MBQrdt/IpgqO+hdYgsVWaec0M49bRliQYQpJb/Ur9j5iQ+8QEfqflGw/
 /3gXonW2HAk+qX8x1ovHTfPZ7sqXd6RxtEBTltJZArXkbk6SppvRQnDetCaqIRMHQoSkZFdHTv9
 +v2yZ8LTnXGC84cgNlvlmYQdRiQ0dLtnU0+GnfhZK1orxTGclvfEHTaH1GihjHb1fDDhC6FAP+l
 HtewK7QINXfGSb8v+992XcOJEFW9Urt2zihfgNkT+s/HyK5axLtAfbx6bU2dALhpejbvv5041tV
 2Dxf5r0EHX6/Rl38JnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081245_002313_680AD155 
X-CRM114-Status: GOOD (  28.20  )
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
 drivers/iommu/riscv/iommu-ir.c | 108 +++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c    |  12 +++-
 drivers/iommu/riscv/iommu.h    |   6 ++
 4 files changed, 124 insertions(+), 3 deletions(-)

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
index 5873addf2a1b..39ca4c89a2a3 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -5,11 +5,100 @@
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
+	dma_addr_t *msi_iova;
+	unsigned int cpu;
+	size_t idx;
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
+
+		if (!pa)
+			continue;
+
+		idx = riscv_iommu_ir_msi_iova_idx(pa);
+		ret = iommu_dma_map_msi(d, dev, pa, IMSIC_MMIO_PAGE_SZ, &msi_iova[idx], &shift);
+		if (ret)
+			goto err_free;
+	}
+
+	domain->msi_iova = msi_iova;
+	return 0;
+
+err_free:
+	kfree(msi_iova);
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
@@ -22,9 +111,25 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
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
+	iommu_group_mutex_lock(info->dev);
+	domain = rcu_access_pointer(info->domain);
+	ret = domain ? riscv_iommu_ir_build_msi_iova(domain, info->dev) : 0;
+	iommu_group_mutex_unlock(info->dev);
+	if (ret)
+		return ret;
+
 	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
 	if (ret)
 		return ret;
@@ -116,4 +221,7 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
 
 void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain)
 {
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+
+	kfree(domain->msi_iova);
 }
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 98ce9ec50e65..5631af2c9ab1 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -810,9 +810,6 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	return 0;
 }
 
-#define iommu_domain_to_riscv(iommu_domain) \
-	container_of(iommu_domain, struct riscv_iommu_domain, domain)
-
 /*
  * Linkage between an iommu_domain and attached devices.
  *
@@ -1336,6 +1333,8 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	if (!domain)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&domain->mutex);
+
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
 	/*
@@ -1449,6 +1448,13 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
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
index 9a8fd5300675..5f79e4cba375 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -31,14 +31,20 @@ struct riscv_iommu_domain {
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
