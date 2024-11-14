Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9937D68B33
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmCiIXIfYwNbKG3QxZltF195sD/SlA0tHhGzL/3eWzA=; b=Z748JnDUK2CJaM
	wdbrS6S3KVB629TzYHIyWU/O7CuLjXYp8616DhzRF+9HkNe0D4CKxaL5fN9fk2iiGA+f4r92uVHqg
	TXbvcyqRiz7ckJEPxBR4/SnKgIBkZaLhib6SlAgss4orykpVgLDE5J591XraFwtqkPRQhwVnWEH3j
	qrH/lcSWWdGTUUcLOMnCLwAT2iQxLNuwiONHAZ35muoQuMc+hl7yp/agxQ1nf6W7iNCzpq8ESe19v
	hWP9jz7djWJ0gRsjjDTYxK2Nkrc52R3s8tIjQQAg1ONGeFzZDsBlfV8zqvF3gRm9sUerzaVz3+C+1
	2P46civG2nzWTfskwLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYt-000000005SV-43sf;
	Thu, 14 Nov 2024 16:19:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYn-000000005E8-387Q
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:19:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so499810f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601147; x=1732205947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uTuyHOKGUnE3VHWBJ7LYW/wszuVbaF5PQNKaXjnEr8=;
        b=EfIrSNV3hLkjtjLS/HB5+Krl6LlKnQYhRqILNODVPWw3oomWoEySn/qlvdBHIKKXwZ
         iCnHABT4le1BpGUuinvS51CN/gBSpd+Xo9HZ/BbsmQumZjNyJIKG81ciHV7qAOxf8Rhn
         cq2Bel6XZnUTMjkhalNAZVtla64ZqADhcDrvmdua0uNA1qUo1PLmsV5j9ksZEJF24D9s
         zuJzQlRwd1ATGqmzsSI+AkgOxB39QngCEDij2PFzRr9Qkc9w9UHLNP5yU9u/WPc1gUvK
         gMQUPLwSNyitwbBz+tvajbkavgX3MrdEb8dbDDlHov/2ipqF30LLzx4r8VGQd6sR+Ox1
         Ov8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601147; x=1732205947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uTuyHOKGUnE3VHWBJ7LYW/wszuVbaF5PQNKaXjnEr8=;
        b=vL7S6ue93mTwUo814ihKfbANaWFuBSYmT8t34LOUYJCYkQ/HWvT9A9PR94cuK3bQqC
         PWjOIqWr9TJ5hBaAz0u1fNmIOBraXpuoW2GjMwmGM/jTtM9ZlLQ2qAL4yP5GtwURgz/d
         RZEvZ2I0ZyIR+Ik5sK0TQnIUrx3gWClIAZHh2t+M/wg0iInhQSvS2TV3v0H2i++Q7ASQ
         kQbKUWe8kNsMaqCJ1AhkRsV/NtqbMFcQ9Z78vMoZ8SCIMCNV276CzWo+ZS00NoRdxcuX
         GWgfvEoXAIgFT976hFv3wLC1HiOhelKO99+KxKYKmgpFybi0l7JaiFO4+/B39QphjLqH
         bgiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAgcM+5scqiLyyLs40s3VRK3TkZNHZryt4LYmAJQ693MRve+I0sYHPXieDmzv9ZADUpiM4opzzqSaWLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcOQwTSnvYIJv3PeEV6ir0WGtOpASZKZgC7GT0+3ndUuvCSs/V
	Cb0leJxAHBhdapJADRoTgbnfKjwnta/aL6qPTuyffKFI11ct9YngJ3gD0QCjld4=
X-Google-Smtp-Source: AGHT+IF+dux3jioiQujAjXbkRVUUE8HYuaL/Pb+N/XvgW2ONJ3mvlvI5/3yMLnI7JF+vXby3PurS7Q==
X-Received: by 2002:a05:6000:156b:b0:37d:498a:a233 with SMTP id ffacd0b85a97d-382185391demr2252298f8f.43.1731601147550;
        Thu, 14 Nov 2024 08:19:07 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada4076sm1858965f8f.16.2024.11.14.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:19:07 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: tjeznach@rivosinc.com,
	zong.li@sifive.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [RFC PATCH 12/15] iommu/riscv: Add guest file irqbypass support
Date: Thu, 14 Nov 2024 17:18:57 +0100
Message-ID: <20241114161845.502027-29-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081909_861291_6BFDAFF3 
X-CRM114-Status: GOOD (  22.06  )
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

Implement irq_set_vcpu_affinity() in the RISCV IOMMU driver.
irq_set_vcpu_affinity() is the channel from a hypervisor to the
IOMMU needed to ensure that assigned devices which direct MSIs to
guest IMSIC addresses will have those MSI writes redirected to
their corresponding guest interrupt files.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-ir.c | 151 +++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c    |   4 +-
 drivers/iommu/riscv/iommu.h    |   3 +
 3 files changed, 156 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index c177e064b205..958270450ec1 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -7,6 +7,8 @@
 #include <linux/irqdomain.h>
 #include <linux/msi.h>
 
+#include <asm/irq.h>
+
 #include "../iommu-pages.h"
 #include "iommu.h"
 
@@ -52,10 +54,159 @@ static size_t riscv_iommu_ir_nr_msiptes(struct riscv_iommu_domain *domain)
 	return max_idx + 1;
 }
 
+static void riscv_iommu_ir_msitbl_inval(struct riscv_iommu_domain *domain,
+					struct riscv_iommu_msipte *pte)
+{
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_command cmd;
+	u64 addr;
+
+	addr = pfn_to_phys(FIELD_GET(RISCV_IOMMU_MSIPTE_PPN, pte->pte));
+	riscv_iommu_cmd_inval_gvma(&cmd);
+	riscv_iommu_cmd_inval_set_addr(&cmd, addr);
+
+	/* Like riscv_iommu_iotlb_inval(), synchronize with riscv_iommu_bond_link() */
+	smp_mb();
+
+	rcu_read_lock();
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_cmd_send(iommu, &cmd);
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+}
+
+static void riscv_iommu_ir_msitbl_update(struct riscv_iommu_domain *domain,
+					 struct riscv_iommu_msiptp_state *msiptp)
+{
+	struct riscv_iommu_bond *bond;
+	struct riscv_iommu_device *iommu, *prev;
+	struct riscv_iommu_command cmd;
+	struct iommu_fwspec *fwspec;
+	struct riscv_iommu_dc *dc;
+	int i;
+
+	/* Like riscv_iommu_ir_msitbl_inval(), synchronize with riscv_iommu_bond_link() */
+	smp_mb();
+	rcu_read_lock();
+
+	prev = NULL;
+	list_for_each_entry_rcu(bond, &domain->bonds, list) {
+		iommu = dev_to_iommu(bond->dev);
+		fwspec = dev_iommu_fwspec_get(bond->dev);
+
+		for (i = 0; i < fwspec->num_ids; i++) {
+			dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+			WRITE_ONCE(dc->msiptp, msiptp->msiptp);
+			WRITE_ONCE(dc->msi_addr_mask, msiptp->msi_addr_mask);
+			WRITE_ONCE(dc->msi_addr_pattern, msiptp->msi_addr_pattern);
+		}
+
+		dma_wmb();
+
+		if (iommu == prev)
+			continue;
+
+		riscv_iommu_cmd_inval_gvma(&cmd);
+		riscv_iommu_cmd_send(iommu, &cmd);
+		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+		prev = iommu;
+	}
+
+	rcu_read_unlock();
+}
+
+static int riscv_iommu_ir_msitbl_init(struct riscv_iommu_domain *domain,
+				      struct riscv_iommu_vcpu_info *vcpu_info)
+{
+	domain->msiptp.msi_addr_pattern = vcpu_info->msi_addr_pattern;
+	domain->msiptp.msi_addr_mask = vcpu_info->msi_addr_mask;
+	domain->group_index_bits = vcpu_info->group_index_bits;
+	domain->group_index_shift = vcpu_info->group_index_shift;
+
+	if (riscv_iommu_ir_nr_msiptes(domain) * sizeof(*domain->msi_root) > PAGE_SIZE * 2)
+		return -ENOMEM;
+
+	domain->msiptp.msiptp = virt_to_pfn(domain->msi_root) |
+				FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE,
+					   RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
+
+	riscv_iommu_ir_msitbl_update(domain, &domain->msiptp);
+
+	return 0;
+}
+
+static int riscv_iommu_irq_set_vcpu_affinity(struct irq_data *data, void *info)
+{
+	struct riscv_iommu_vcpu_info *vcpu_info = info;
+	struct riscv_iommu_domain *domain = data->domain->host_data;
+	struct riscv_iommu_msipte *pte;
+	int ret = -EINVAL;
+	u64 pteval;
+
+	if (WARN_ON(domain->domain.type != IOMMU_DOMAIN_UNMANAGED))
+		return ret;
+
+	spin_lock(&domain->msi_lock);
+
+	if (!domain->msiptp.msiptp) {
+		if (WARN_ON(!vcpu_info))
+			goto out_unlock;
+
+		ret = riscv_iommu_ir_msitbl_init(domain, vcpu_info);
+		if (ret)
+			goto out_unlock;
+	} else if (!vcpu_info) {
+		/*
+		 * Nothing to do here since we don't track host_irq <=> msipte mappings
+		 * nor reference count the ptes. If we did do that tracking then we would
+		 * decrement the reference count of the pte for the host_irq and possibly
+		 * clear its valid bit if it was the last one mapped.
+		 */
+		ret = 0;
+		goto out_unlock;
+	} else if (WARN_ON(vcpu_info->msi_addr_pattern != domain->msiptp.msi_addr_pattern ||
+			   vcpu_info->msi_addr_mask != domain->msiptp.msi_addr_mask ||
+			   vcpu_info->group_index_bits != domain->group_index_bits ||
+			   vcpu_info->group_index_shift != domain->group_index_shift)) {
+		goto out_unlock;
+	}
+
+	pte = riscv_iommu_ir_get_msipte(domain, vcpu_info->gpa);
+	if (!pte)
+		goto out_unlock;
+
+	pteval = FIELD_PREP(RISCV_IOMMU_MSIPTE_M, 3) |
+		 riscv_iommu_phys_to_ppn(vcpu_info->hpa) |
+		 FIELD_PREP(RISCV_IOMMU_MSIPTE_V, 1);
+
+	if (pte->pte != pteval) {
+		pte->pte = pteval;
+		riscv_iommu_ir_msitbl_inval(domain, pte);
+	}
+
+	ret = 0;
+
+out_unlock:
+	spin_unlock(&domain->msi_lock);
+	return ret;
+}
+
 static struct irq_chip riscv_iommu_irq_chip = {
 	.name			= "IOMMU-IR",
 	.irq_mask		= irq_chip_mask_parent,
 	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_set_vcpu_affinity	= riscv_iommu_irq_set_vcpu_affinity,
 };
 
 static int riscv_iommu_irq_domain_alloc_irqs(struct irq_domain *irqdomain,
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c4a47b21c58f..46ac228ba7ac 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -544,8 +544,8 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 }
 
 /* Lookup and initialize device context info structure. */
-static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
-						 unsigned int devid)
+struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
+					  unsigned int devid)
 {
 	const bool base_format = !(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT);
 	unsigned int depth;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 6ce71095781c..2ca76edf48f5 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -127,6 +127,9 @@ struct riscv_iommu_bond {
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 
+struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
+					  unsigned int devid);
+
 void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
 			  struct riscv_iommu_command *cmd);
 void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
