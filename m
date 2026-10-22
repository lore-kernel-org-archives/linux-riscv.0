Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EF2606A31B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 15:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Av8RVqKT;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dfiC4SjV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ai0X7ji7KRvhwfCRdknFVzdxdKvFeMqeLdxGeUY+vYg=; b=Av8RVqKT4qsszeu6KNSWWa1rZW
	nDn0eiAnFKKUrAg14lpjObRDgV5PqyhBknujpsfaQ42HylweNqHypTS2nkCy6FKRNsACFTFG+oSds
	tDVYghZssPiOByGyD0w1YCjK1I5xnj44JEB+ps2ID1BUVlT3hsOm8jMInm74/OUD3HBOSR1pqDtUv
	iZRVBt+jS4H6txE3yQR/sMfjKcjj8oln9WGeZq4W4tT4zscMQwdIovity0QTJ+33GBYM2/FdxSJo5
	lrjIyT6BJB+/n6O9Fr/BFt3vFyUR9JxhR0uS8l7Gdw7MG+LyV+eOoaXSibM+RlrjXx3bjIUWJw/HD
	RxJgdxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzs-0000000EQq6-2YDc;
	Thu, 22 Oct 2026 15:46:28 +0000
Received: from out-196.mta0.migadu.com ([2001:41d0:1004:224b::c4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJuzp-0000000EQms-3Z1M
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 15:46:27 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IgnvtTm5S8xUMQvtkLK6nhnCRAcGmQUfy+GHyDb3GiI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792683983; v=1; x=1793288783;
 b=dfiC4SjVXaOPaXZGvRWmSNmfPSrnEWZQWj0PCP95FV5KqrHi3Z8tHHDwMwyBB2b7Pb2BVHiW
 s7qSn1/ky0KnGCSHhNYIko4YpiSZfLU4a2W0Y24CQoeC/MoB+Epi+/QplecOvYzKbhBJlIrvHfj
 c+ngY6lN1nf+VOo4GZkmkWZU=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6021e6b73b548721;
	Thu, 22 Oct 2026 15:46:23 +0000
X-Mizu-Trace-ID: 6021e6b73b548721
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	tomasz.jeznach@linux.dev,
	jgg@ziepe.ca,
	jgg@nvidia.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	tglx@kernel.org,
	kevin.tian@intel.com,
	fangyu.yu@linux.alibaba.com,
	nutty.liu@hotmail.com
Subject: [PATCH v7 4/5] irqchip/riscv-imsic: Support IOMMU MSI address lists
Date: Thu, 22 Oct 2026 17:46:02 +0200
Message-ID: <20261022154603.1374754-5-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022154603.1374754-1-andrew.jones@linux.dev>
References: <20261022154603.1374754-1-andrew.jones@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_084626_027468_735536F4 
X-CRM114-Status: GOOD (  15.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

RISC-V IOMMU host interrupt remapping maps every possible host IMSIC
target into one contiguous IOVA range. MSI message composition therefore
needs each target's position within that range.

Prepare the complete IMSIC address list while allocating an IRQ. The
list is guaranteed to exist after IMSIC state initialization. The IOMMU
backend maps the pages and caches the contiguous base IOVA in the MSI
descriptor when translation is needed.

When the descriptor has an IOMMU MSI mapping, use the selected logical
CPU directly as the page index within the IOVA range. Use the same path
for initial composition and affinity updates. A zero iommu_msi_shift
means no MSI address translation is required, so keep physical messages.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Acked-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/Kconfig                    |  1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 24 +++++++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a038e1121be3 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -651,6 +651,7 @@ config RISCV_IMSIC
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_MATRIX_ALLOCATOR
 	select GENERIC_MSI_IRQ
+	select IRQ_MSI_IOMMU
 	select IRQ_MSI_LIB
 
 config RISCV_RPMI_SYSMSI
diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..ddb2bb570cdc 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -10,6 +10,7 @@
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iommu.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -69,8 +70,10 @@ static void imsic_irq_ack(struct irq_data *d)
 	irq_move_irq(d);
 }
 
-static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_msg *msg)
+static void imsic_irq_compose_vector_msg(struct irq_data *d, struct imsic_vector *vec,
+					 struct msi_msg *msg)
 {
+	struct msi_desc *desc = irq_data_get_msi_desc(d);
 	phys_addr_t msi_addr;
 
 	if (WARN_ON(!vec))
@@ -79,6 +82,12 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 	if (WARN_ON(!imsic_cpu_page_phys(vec->cpu, 0, &msi_addr)))
 		return;
 
+	/* A zero shift means no IOMMU MSI mapping is needed. */
+	if (desc->iommu_msi_shift) {
+		msi_addr = (desc->iommu_msi_iova << desc->iommu_msi_shift) +
+			   vec->cpu * IMSIC_MMIO_PAGE_SZ;
+	}
+
 	msg->address_hi = upper_32_bits(msi_addr);
 	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = vec->local_id;
@@ -86,7 +95,7 @@ static void imsic_irq_compose_vector_msg(struct imsic_vector *vec, struct msi_ms
 
 static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 {
-	imsic_irq_compose_vector_msg(irq_data_get_irq_chip_data(d), msg);
+	imsic_irq_compose_vector_msg(d, irq_data_get_irq_chip_data(d), msg);
 }
 
 #ifdef CONFIG_SMP
@@ -94,7 +103,7 @@ static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
 
-	imsic_irq_compose_vector_msg(vec, &msg);
+	imsic_irq_compose_vector_msg(d, vec, &msg);
 	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
 }
 
@@ -225,7 +234,9 @@ static struct irq_chip imsic_irq_base_chip = {
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct imsic_vector *vec;
+	int ret;
 
 	/* Multi-MSI is not supported yet. */
 	if (nr_irqs > 1)
@@ -235,6 +246,13 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (!vec)
 		return -ENOSPC;
 
+	ret = iommu_dma_prepare_msi_list(info->desc, imsic->msi_pa_list,
+					 num_possible_cpus(), IMSIC_MMIO_PAGE_SZ);
+	if (ret) {
+		imsic_vector_free(vec);
+		return ret;
+	}
+
 	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
 			    handle_edge_irq, NULL, NULL);
 	irq_set_noprobe(virq);
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
