Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38441C5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GGndmsdj+2+n+w09i2tcEuBU02oBBpe8wfsUlewPkRc=; b=sj5Fvdb3byxID/
	cNPdog95Q65U5uF8IF+t63kl0g2tN2CNp1ci6N1O9rJWeDcu5JYxUdnl8kK80l0IJDhTtnMaBelJe
	I06rFZUiwXLm5KOu+a2f89B2wWQX5qjUwzUIA5uQGs1bitfpwo2SHALYfLvkDB480FhUTJap5DF1M
	TbmSPR6KKg8HGS2MrRVL+rdkoUZ76zWIiKnLvH/oqKRQL+SBkyDZwg317kIFIIQ9Fqyk71a22rviZ
	OZ3OghCE0wdvP2zn0cvrnnipSyYVqfJ32mMbPXXJIwJsnbXMU5BMd8DO3c5vLCvrIf8B8z0ezlNji
	1mx5ZENnwe9wwmXnPNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWp-0000000CDyx-1umd;
	Thu, 20 Aug 2026 21:42:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWh-0000000CDph-3QUc
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7g3l1298471
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aqBQ5NLxJjg
	wKgx5+nKXaga7O5VVsXHBqkNfr8KhktI=; b=bvDXAxT4yZsvFgbBh3B+pJABF05
	CEGciwskM2hsrESNkK75KdtcRh6eetPPXc1/W0wJXdqZ4CVZC2L29ZiO8/sWHJnE
	+oKx22EVz8XIymYfwDjLY+qaa/HaJ5j6pFNLo48wcwzkkplapBjCcKWVmJGUl8El
	oqeYGd50Fw2ZubXpGG47/OQ/20IHH8PgBrS60RkMJbtmUnyzMxPIy/PgYAO7U81b
	eX6PXKeXnN6rKfmaNnL3DtqGIHpXlqvZ6XU0PkoeRXG+g+a5SzqS4uE1DoFIf2ez
	N3uYqfiFE+HehPN7mJ3viczk1QWXCw5Lxy+1QuXoRR8sI11s3NBH7t7d/hQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8btc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so39071085a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262138; x=1787866938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aqBQ5NLxJjgwKgx5+nKXaga7O5VVsXHBqkNfr8KhktI=;
        b=Rmi90iF0atI8WLxowLGsJkfXUML+gFFFxsTmfXFyj1wL5MCC44/83/zqyHThcZVid1
         k7eKdWG+wHrvxw5RLq2l4hRtNm0HmPtwGLVlo+zhETashQ+2HrpzRvbQx5Iz7VB1WnMR
         4vOjQgT3BvIA0JtidsnxLhOkdhp9WEMjnmIc6Kw4pdbCMSuxinS4O2O/zwn2EeY6zJDU
         7p0GQ7hODKVw9XIyrYjHIL+Uuxxc5WAIWWC30nF30Miza6LVY4IoEWCMZpD3T90ycjoI
         /RyG9eVbJoRWZ4MASvGLYZfURCKLp/jm0YnjQjkXRx2rQxscgttqR7J5JxE3bzxit2On
         njRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262138; x=1787866938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqBQ5NLxJjgwKgx5+nKXaga7O5VVsXHBqkNfr8KhktI=;
        b=ORDr49qGmUKdXT78Kt5Xr3eM5xxrH1u+vvPD8zL7mYT7lTcbryNAbXhyS1CEfApmk/
         vWWrEHfjO8KuQW1gKnIeYEM6bQwrxLvgGhPTX+Q4BMaPBcgxcs/+7aYYDbYdESVeKnN9
         5zPnK3Udz05UJR35NnbQGSTJv6E/PDrida0cZFUNvtHgXYZNU9nSJUHtE+xBRfvixCSR
         Izs258/66dXn6szPPvi8Nf5+AJB8rmqJP6JN0pjiTHpsJCSarxCrpQfqXnDEEbys0eCJ
         RkGNa35xGKE7X3PjVfU9CwC3vN9VJuaGefeqmWD5m3aJ+3zLULLO6TG7bJsZHj+r+2MJ
         w0+g==
X-Gm-Message-State: AOJu0YyNflxmFJhxujz1lF1tZS4cCzK+anoJZDCXzcvW3RKMe7PlE5Zk
	sKPtkV/4O78UwcPV6YZZXu2IDdgdYaqqCpJedXTaufM5NByC5Q37xFN73LEdvBhMFBgoEZMF2eN
	BUHoi18s7IaC+JSsY+MuhLoT0GwfixEH0ayAdJKBqKMBHR+Kbqz2tmiPr1UK7/9haf9dNKX6O27
	eGgnk=
X-Gm-Gg: AR+sD10Y/yRwbc3PgapabQNNfE4Qyv40BVEtvoncv3JGmYmNhk3KLL+ZSg9AcKnFfTm
	wVSIT7Jq8R2YlpSMdwpx3Cu8mJOtn1vxSFNjTnX465LeaPW5CxaP/G29q2WZ59EnKYmkd0nbCXI
	QagGnleDtP5lqZcA6rA8ASy9mAFkiKH26HcEZk8OSvt6YZ0lRjEeWir0B+j1fxnuq9xwBmUVbJg
	oe6VRe8qlw2PtcSNVnzV4wXd9Apczgbgfo/AwqRipVZittvJNXWDwsvVwxblwgDnNBYs836ZGS2
	PMowp/KApkalJJuVj22bD8oEBlzHnr0o2FT9aLfylofU8CSXVRzQp3Go9Vx3gU83StTmhUOMXiP
	DYR9sLIF3
X-Received: by 2002:a05:620a:2b8a:b0:936:883f:e994 with SMTP id af79cd13be357-93739479385mr122859085a.20.1787262138172;
        Thu, 20 Aug 2026 14:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8a:b0:936:883f:e994 with SMTP id af79cd13be357-93739479385mr122854885a.20.1787262137716;
        Thu, 20 Aug 2026 14:42:17 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e7e20sm5654075e9.5.2026.08.20.14.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 12/21] iommu/riscv: Pre-map IMSIC MSI targets
Date: Thu, 20 Aug 2026 23:41:41 +0200
Message-ID: <20260820214150.545737-13-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX7RaBmyCJcJkE
 XcladkQhUWawMtUT/f7LcSeP4SialdJkWYyppqVR1rhVbJNNQPtUnfT0MStYAyrZlQLGoI9h6Sz
 Jr9NWJ9Kit+fzaHFUYlMqF7pnZ0xh26psAIZnCV1HBDA/kc8BLJaKoeDgnnQAw33vsgNFv2we5v
 tlRrhMSxYF5CkmWQnH20+eoAhSggQitQ1IWmhrJum1im/IEAMP4IdKf77+/t+WbDMkoo3rdI1Vy
 Q3kx90JjgknCff+SQOoy98lAc+DRm9LJnNFkEFze3Pap6HW1/muaJkS+S814kJKE/y1+rKUBtSR
 y+HX8GPxSRc62gbc1tDMdy1yWKjyyXzWqrmUYyVFkzTvTjS/LdKa2CI/7ipugsjsW506+tQauui
 lWsCTuMxUHG8TyaxyJkTWWCMAyiEeyGD9odKa9x776oKivQk7y4M1kX0bZpE5BGCidMIUboq2yg
 pGntapxRvnRaLxouVLw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a8774bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QoJ68i72MHRSmWybBfEA:9 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfXxy4l6pIz3skT
 XH+3iF3Jv/txZxQjVTkuWO8ymAJnFDaFC2ri/ybnN+gKCo1pkqtP3p30QM+JWW/pA5wK0ySKexm
 6wvjMe7ltwSFVuBYyNcPCJdgtp5T3ks=
X-Proofpoint-ORIG-GUID: AeoltV7sokqLgEd8i0Wzk5hsk-iYyppu
X-Proofpoint-GUID: AeoltV7sokqLgEd8i0Wzk5hsk-iYyppu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144219_885275_CAA32F49 
X-CRM114-Status: GOOD (  29.86  )
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

IMSIC target addresses change with interrupt affinity, which may be
updated in atomic context. Therefore, an interrupt-remapping domain
cannot create mappings on demand while composing an MSI message.

Pre-map the supervisor IMSIC page for each possible CPU when a paging
domain first allocates remapped interrupts. Also prepare the mappings
when attaching a paging domain to a device with allocated interrupts, so
an incoming domain is ready before the hardware switches to it. Reject
passthrough mapping results because interrupt remapping requires the
IMSIC page IOVA and its fixed page shift.

Store the resulting IOVAs in a domain-local table so message composition
only requires a lookup. Use the IMSIC group and hart fields as the table
index, matching the RISC-V IOMMU MSI address extraction scheme. These
topology fields do not necessarily produce dense CPU indices, so size
the table for their full encoded range and leave unused entries empty.

Create the per-device interrupt-remapping domain during IOMMU probe, but
publish it from probe_finalize() after the IOMMU core has assigned the
device to its group. This ensures the allocation callback can safely
lock the group.

Select IRQ_MSI_IOMMU for the generic MSI mapping API.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/Kconfig    |   1 +
 drivers/iommu/riscv/iommu-ir.c | 133 ++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.c    |  12 ++-
 drivers/iommu/riscv/iommu.h    |   7 ++
 4 files changed, 147 insertions(+), 6 deletions(-)

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
index de5e22ecbd63..4dc104c6d4b1 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -6,13 +6,108 @@
  */
 #include <linux/acpi.h>
 #include <linux/cleanup.h>
+#include <linux/irqchip/riscv-imsic.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/vmalloc.h>
 
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
+	msi_iova = vcalloc(riscv_iommu_ir_msi_iova_count(), sizeof(*msi_iova));
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
+			goto err_free;
+		if (shift != IMSIC_MMIO_PAGE_SHIFT) {
+			ret = -EBUSY;
+			goto err_free;
+		}
+	}
+
+	domain->msi_iova = msi_iova;
+
+	return 0;
+
+err_free:
+	vfree(msi_iova);
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_ir_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_ack		= irq_chip_ack_parent,
@@ -25,8 +120,24 @@ static int riscv_iommu_ir_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
 						unsigned int irq_base, unsigned int nr_irqs,
 						void *arg)
 {
+	struct riscv_iommu_info *info = irqdomain->host_data;
 	int ret;
 
+	/*
+	 * MSI IOVAs are domain-local, just like DMA IOVAs. The device must be
+	 * quiesced, including MSI teardown, before switching away from or freeing
+	 * the domain. iommu_dma_map_msi() requires the group mutex to be held;
+	 * take it around the domain lookup too so info->domain can't change
+	 * out from under the build.
+	 */
+	scoped_guard(iommu_group, info->dev) {
+		struct riscv_iommu_domain *domain = rcu_dereference_protected(info->domain, true);
+
+		ret = domain ? riscv_iommu_ir_build_msi_iova(domain, info->dev) : 0;
+	}
+	if (ret)
+		return ret;
+
 	ret = irq_domain_alloc_irqs_parent(irqdomain, irq_base, nr_irqs, arg);
 	if (ret)
 		return ret;
@@ -112,11 +223,22 @@ struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
 	irqdomain->msi_parent_ops = &riscv_iommu_ir_msi_parent_ops;
 	irq_domain_update_bus_token(irqdomain, DOMAIN_BUS_MSI_REMAP);
 
-	dev_set_msi_domain(dev, irqdomain);
-
+	/*
+	 * Publication is deferred to riscv_iommu_ir_irq_domain_publish(),
+	 * called from probe_finalize() after the IOMMU core assigns
+	 * dev->iommu_group, because the allocation callback locks the group.
+	 */
 	return irqdomain;
 }
 
+void riscv_iommu_ir_irq_domain_publish(struct device *dev)
+{
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+
+	if (info->irqdomain)
+		dev_set_msi_domain(dev, info->irqdomain);
+}
+
 void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_info *info)
 {
 	struct fwnode_handle *fn;
@@ -124,7 +246,8 @@ void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_inf
 	if (!info->irqdomain)
 		return;
 
-	dev_set_msi_domain(dev, info->irqdomain->parent);
+	if (dev_get_msi_domain(dev) == info->irqdomain)
+		dev_set_msi_domain(dev, info->irqdomain->parent);
 	fn = info->irqdomain->fwnode;
 	irq_domain_remove(info->irqdomain);
 	info->irqdomain = NULL;
@@ -139,6 +262,10 @@ int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struc
 
 void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain)
 {
+	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
+
+	vfree(domain->msi_iova);
+	domain->msi_iova = NULL;
 }
 
 void riscv_iommu_ir_get_resv_regions(struct device *dev, struct list_head *head)
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 049ca1852d7b..1a30bac88101 100644
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
@@ -1341,6 +1338,8 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
 	if (!domain)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&domain->mutex);
+
 	INIT_LIST_HEAD_RCU(&domain->bonds);
 	spin_lock_init(&domain->lock);
 	/*
@@ -1467,6 +1466,7 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	 * any IMSICs or no MSI domain has been set up for the device.
 	 */
 	info->irqdomain = irqdomain;
+	info->dev = dev;
 
 	/*
 	 * Allocate and pre-configure device context entries in
@@ -1490,6 +1490,11 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	return &iommu->iommu;
 }
 
+static void riscv_iommu_probe_finalize(struct device *dev)
+{
+	riscv_iommu_ir_irq_domain_publish(dev);
+}
+
 static void riscv_iommu_release_device(struct device *dev)
 {
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
@@ -1512,6 +1517,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.domain_alloc_paging = riscv_iommu_alloc_paging_domain,
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
+	.probe_finalize = riscv_iommu_probe_finalize,
 	.release_device	= riscv_iommu_release_device,
 	.get_resv_regions = riscv_iommu_get_resv_regions,
 };
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 16b3c9c4cf8c..59779aa9d380 100644
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
@@ -93,6 +99,7 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
 struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
 						    struct riscv_iommu_info *info);
+void riscv_iommu_ir_irq_domain_publish(struct device *dev);
 void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_info *info);
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
