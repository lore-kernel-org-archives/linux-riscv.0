Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B715EEE3685
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 13:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EFUsfJCXwcE0qkfftjAKYYiRt9GayEJjt6zxz1DHUR4=; b=zVck0Rfh6Tub7A
	AaCxpdaWUw/PJe2rKoaap3q8lR9ASdMgVj4TyqZMQHVvzx7Qf81fASPq0rhbU72k6RoVBLWl2wpbS
	a7oAVgKKN73lDOj+CgFAWivyCK2ZvbDWISeu8YFRgsyOPhbafwRYyg/tCQCNdzBhqgVTnbibPSrKg
	p6CaML6uGfNsFxajs75S4n4azukDZwmCP3PM8jHsz8e6gm+91LCZ69KfsCSGhzMyxyApe5EjqcVbt
	uhT/+1LBU7uD0xnuq4v7YOhwJTbdvSPpznb8fg3LXmjXgT27IXIsfVEAV/Nm4f+H0qbhkAw2p7xKA
	/R8oRfSahCWp4+6yaXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX99-00000002AXJ-28sS;
	Thu, 12 Feb 2026 13:54:19 +0000
Received: from out28-52.mail.aliyun.com ([115.124.28.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqX96-00000002AWh-0hDk
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 13:54:18 +0000
Received: from guoyaxing.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gVs67R6_1770904420 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 12 Feb 2026 21:53:58 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: tglx@linutronix.de,
	anup@brainfault.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	guoyaxing@bosc.ac.cn
Subject: [PATCH v1] riscv/imsic: add support for IRQ_MSI_IOMMU and map MSI pages through IOMMU
Date: Thu, 12 Feb 2026 21:53:37 +0800
Message-Id: <20260212135337.18308-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_055416_441921_AEF4067A 
X-CRM114-Status: GOOD (  16.26  )
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

This patch adds support for CONFIG_IRQ_MSI_IOMMU in the RISC-V IMSIC
driver by calling iommu_dma_prepare_msi(), which allocates an IOVA
and maps the physical IMSIC MSI address into the device domain. The
MSI message address is then written to use the IOVA, ensuring IOMMU
translation succeeds on MSI writes.

With this change, PCIe or platform devices using IMSIC-based MSI can
operate correctly under IOMMU isolation.

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 32 ++++++++++++++++------
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 936d27c318e8..b778621ad252 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -633,6 +633,7 @@ config RISCV_IMSIC
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
 	select IRQ_MSI_LIB
+	select IRQ_MSI_IOMMU
 
 config RISCV_RPMI_SYSMSI
 	bool
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..7eeb2dc59d82 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/smp.h>
+#include <linux/iommu.h>
 
 #include <linux/irqchip/irq-msi-lib.h>
 #include "irq-riscv-imsic-state.h"
@@ -69,7 +70,8 @@ static void imsic_irq_ack(struct irq_data *d)
 	irq_move_irq(d);
 }
 
-static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
+static void imsic_irq_compose_vector_msg(struct irq_data *d, struct imsic_vector *vec,
+					 struct msi_msg *msg)
 {
 	phys_addr_t msi_addr;
 
@@ -79,14 +81,13 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 	if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
 		return;
 
-	msg->address_hi = upper_32_bits(msi_addr);
-	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = vec->local_id;
+	msi_msg_set_addr(irq_data_get_msi_desc(d), msg, msi_addr);
 }
 
 static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
+	imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), msg);
 }
 
 #ifdef CONFIG_SMP
@@ -94,13 +95,15 @@ static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
 
-	imsic_irq_compose_vector_msg(vec, &msg);
+	imsic_irq_compose_vector_msg(d, vec, &msg);
 	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
 }
 
 static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
 				  bool force)
 {
+	int err;
+	phys_addr_t msi_pa;
 	struct imsic_vector *old_vec, *new_vec;
 	struct imsic_vector tmp_vec;
 
@@ -135,6 +138,11 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	if (!new_vec)
 		return -ENOSPC;
 
+	imsic_cpu_page_phys(new_vec->cpu, 0, &msi_pa);
+	err = iommu_dma_prepare_msi(irq_data_get_msi_desc(d), msi_pa);
+	if (err)
+		return err;
+
 	/*
 	 * Device having non-atomic MSI update might see an intermediate
 	 * state when changing target IMSIC vector from one CPU to another.
@@ -161,12 +169,12 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
 	}
 
-	/* Point device to the new vector */
-	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
-
 	/* Update irq descriptors with the new vector */
 	d->chip_data = new_vec;
 
+	/* Point device to the new vector */
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);
+
 	/* Update effective affinity */
 	irq_data_update_effective_affinity(d, cpumask_of(new_vec->cpu));
 
@@ -225,6 +233,9 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	int err;
+	msi_alloc_info_t *info = args;
+	phys_addr_t msi_pa;
 	struct imsic_vector *vec;
 
 	/* Multi-MSI is not supported yet. */
@@ -235,6 +246,11 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (!vec)
 		return -ENOSPC;
 
+	imsic_cpu_page_phys(vec->cpu, 0, &msi_pa);
+	err = iommu_dma_prepare_msi(info->desc, msi_pa);
+	if (err)
+		return err;
+
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
 			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
