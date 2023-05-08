Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2722AC7EE25
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2w80UA9ifnQz7/mOxrfT0QE2k2eC03JoBuH1DeMfGTw=; b=yyEKIg4o3HNz5/
	CHv86OpL0952BKiprfFcLyxRmx0CvIrPbK5ctoVHjPT2fYJD3KG9j3z/f9k7Ht3Iqfp8YkFhlwPnL
	XnqMc9y6nVEPNh3d6ayZXjUwbigbIWZEy34OLyYVg9YglVRtDyLO2ueixxRnm9z5Cw26jTCcxgCBk
	vOeBVCjn7xIKAg3JFcR2tohlDMTJGJ5K9jvrJsdeXzJSDcnD83tpeQZeo7q0xoM0j56y+jNHxwLb9
	C5+JmqG1AX37Z1bqj4CyOPOq1FSDrrEZuj00gqRJZB9Hgdka9CrixRwpiEZFVDyLBDX0/3NTF1D7M
	YneYx2DQBZ3f1WFxIchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1ry-000kgc-12;
	Mon, 08 May 2023 14:29:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw1rv-000kdQ-0V
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 14:29:40 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-643a6f993a7so2198160b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683556174; x=1686148174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2E+vPnkV/6+u4KNq32vBTTiL8TGRt65LegkILCc8n2k=;
        b=KT3ZEhjc9ES8ZVsBr2ikNMw73wtSWzh4Z47d8zPtu1lgyPuFMqA7VwwV9vGZ5SW37y
         MBSQZQzUOXlqyAH/WPlhJEruUeA6vRH09JsKCeJloRHHdGN+44VRCKznMVlqb6dAACEX
         rY4QqvEig87kN7V+kDf9uNihu9VwP08GNpbHcAv0sxuZ3WEs8RWfd34N6igOBg/yTMoe
         7GNzMzfOxpE93Y/1poLdOn9sU0wwciXW+YTUPjnu+jExlWcVkXq8tQ5iwF61Ewdy1p/y
         7+yJleoMtrVZAc9UDgmKmrkwOMZww8DaLoH7t7SGqTiSON85DurBae5XHh9Q+JFPQp27
         qWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556174; x=1686148174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2E+vPnkV/6+u4KNq32vBTTiL8TGRt65LegkILCc8n2k=;
        b=O+ab2WDFW40l3spWI0mKLVkI09BDeApC9IyMLOdWuzbCKIqSqMEpCwBnPgGHW4gmCC
         GIpXTh3sY5GfZuZSjsB/Uq1w8rNNWLni7Xf6X9HclQhf4NbYFdGlsojsHMghtOZZp282
         JIZ4Kx5d7L0r36yUhKgTMFjRREV+vmZE8BcWhCRAgNhyc0qjQl9pQB8T1C17gNWHjKOd
         EhbwgHG1fVAwTETgqME8Tt+j11uwHDa9RSL4yQ6e3qUxeLt49D6P+wFC+X1PR3XypBWH
         3MBGmTrWIltUltA/DhOQ6zgblyeCBnilNeZKgLNx5Qe7KE3PFAFRxBl6wvwN5UOZ14PL
         rS4g==
X-Gm-Message-State: AC+VfDzxIK/7t70kAzEYdfPj6DQ9bprQ2MLaaD7hGZlw2ApQr0j1BYKc
	cCaGUtqfFZM/kQTkQJ2nI9D8Eg==
X-Google-Smtp-Source: ACHHUZ79hH5wFhuoEuXBKu2QARKi88tLOJJxJ8szDy+oplzBOr9aNkt51Kezumakz3nwNJJ1uxt6YA==
X-Received: by 2002:a05:6a00:b8a:b0:646:663a:9d60 with SMTP id g10-20020a056a000b8a00b00646663a9d60mr2974528pfj.10.1683556174393;
        Mon, 08 May 2023 07:29:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.206])
        by smtp.gmail.com with ESMTPSA id k3-20020aa790c3000000b0063d46ec5777sm6082pfk.158.2023.05.08.07.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:29:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 07/11] irqchip/riscv-imsic: Improve IOMMU DMA support
Date: Mon,  8 May 2023 19:58:38 +0530
Message-Id: <20230508142842.854564-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508142842.854564-1-apatel@ventanamicro.com>
References: <20230508142842.854564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_072939_194406_82EFD5E3 
X-CRM114-Status: GOOD (  22.76  )
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

We have a separate RISC-V IMSIC MSI address for each CPU so changing
MSI (or IRQ) affinity results in re-programming of MSI address in
the PCIe (or platform) device.

Currently, the iommu_dma_prepare_msi() is called only once at the
time of IRQ allocation so IOMMU DMA domain will only have mapping
for one MSI page. This means iommu_dma_compose_msi_msg() called
by imsic_irq_compose_msi_msg() will always use the same MSI page
irrespective to target CPU MSI address. In other words, changing
MSI (or IRQ) affinity for device using IOMMU DMA domain will not
work.

To address above issue, we do the following:
1) Map MSI pages for all CPUs in imsic_irq_domain_alloc()
   using iommu_dma_prepare_msi().
2) Add a new iommu_dma_select_msi() API to select a specific
   MSI page from a set of already mapped MSI pages.
3) Use iommu_dma_select_msi() to select a specific MSI page
   before calling iommu_dma_compose_msi_msg() in
   imsic_irq_compose_msi_msg().

Reported-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/iommu/dma-iommu.c         | 38 +++++++++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic.c | 27 ++++++++++++----------
 include/linux/iommu.h             |  6 +++++
 3 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7a9f0b0bddbd..07782c77a6eb 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1677,6 +1677,44 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 	return 0;
 }
 
+/**
+ * iommu_dma_select_msi() - Select a MSI page from a set of
+ * already mapped MSI pages in the IOMMU domain.
+ *
+ * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
+ * @msi_addr: physical address of the MSI page to be selected
+ *
+ * Return: 0 on success or negative error code if the select failed.
+ */
+int iommu_dma_select_msi(struct msi_desc *desc, phys_addr_t msi_addr)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	const struct iommu_dma_msi_page *msi_page;
+	struct iommu_dma_cookie *cookie;
+
+	if (!domain || !domain->iova_cookie) {
+		desc->iommu_cookie = NULL;
+		return 0;
+	}
+
+	cookie = domain->iova_cookie;
+	msi_addr &= ~(phys_addr_t)(cookie_msi_granule(cookie) - 1);
+
+	msi_page = msi_desc_get_iommu_cookie(desc);
+	if (msi_page && msi_page->phys == msi_addr)
+		return 0;
+
+	list_for_each_entry(msi_page, &cookie->msi_page_list, list) {
+		if (msi_page->phys == msi_addr) {
+			msi_desc_set_iommu_cookie(desc, msi_page);
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
 /**
  * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
  * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
diff --git a/drivers/irqchip/irq-riscv-imsic.c b/drivers/irqchip/irq-riscv-imsic.c
index 30247c84a6b0..ec61c599e0c5 100644
--- a/drivers/irqchip/irq-riscv-imsic.c
+++ b/drivers/irqchip/irq-riscv-imsic.c
@@ -446,6 +446,10 @@ static void imsic_irq_compose_msi_msg(struct irq_data *d,
 	if (WARN_ON(err))
 		return;
 
+	err = iommu_dma_select_msi(desc, msi_addr);
+	if (WARN_ON(err))
+		return;
+
 	msg->address_hi = upper_32_bits(msi_addr);
 	msg->address_lo = lower_32_bits(msi_addr);
 	msg->data = d->hwirq;
@@ -493,11 +497,18 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
 	int i, hwirq, err = 0;
 	unsigned int cpu;
 
-	err = imsic_get_cpu(&imsic->lmask, false, &cpu);
-	if (err)
-		return err;
+	/* Map MSI address of all CPUs */
+	for_each_cpu(cpu, &imsic->lmask) {
+		err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
+		if (err)
+			return err;
 
-	err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
+		err = iommu_dma_prepare_msi(info->desc, msi_addr);
+		if (err)
+			return err;
+	}
+
+	err = imsic_get_cpu(&imsic->lmask, false, &cpu);
 	if (err)
 		return err;
 
@@ -505,10 +516,6 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
 	if (hwirq < 0)
 		return hwirq;
 
-	err = iommu_dma_prepare_msi(info->desc, msi_addr);
-	if (err)
-		goto fail;
-
 	for (i = 0; i < nr_irqs; i++) {
 		imsic_id_set_target(hwirq + i, cpu);
 		irq_domain_set_info(domain, virq + i, hwirq + i,
@@ -528,10 +535,6 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
 	}
 
 	return 0;
-
-fail:
-	imsic_ids_free(hwirq, get_count_order(nr_irqs));
-	return err;
 }
 
 static void imsic_irq_domain_free(struct irq_domain *domain,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e8c9a7da1060..41e8613832ab 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1117,6 +1117,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit);
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 
 int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
+int iommu_dma_select_msi(struct msi_desc *desc, phys_addr_t msi_addr);
 void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg);
 
 #else /* CONFIG_IOMMU_DMA */
@@ -1138,6 +1139,11 @@ static inline int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_a
 	return 0;
 }
 
+static inline int iommu_dma_select_msi(struct msi_desc *desc, phys_addr_t msi_addr)
+{
+	return 0;
+}
+
 static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 {
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
