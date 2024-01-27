Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C18C46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQSQU9Hs51KvLDHZGi0v+dl9RFJx6uR4Tgl0zmqmVeM=; b=Z9VXbkUGLL9qe5
	pqMWZ+Q34CZ8nDUi3bCEkM4Jvtwv0trdRjaF9TfKz4iV6SU0JTZ34bABvllUQKXLL2bv02Jhuae9S
	dmzg9DexS7eJK2vJwOSAAPwXjtxG8SsmYOOLeODADGLBliu07N68yX+jUO/qpoBXYSLX+RbWDJlcP
	nV0z/tWOucCHOdceOv1COWzFc8VRceHVhdPdtg7Qa4VH+q52rvxnXw1Ia9kJWdDH418pgvaPCO3Qc
	L1PzJF1KGlMQWtUBiERUjI8UVmWMjWZoG7W0C/7qOWE3GwBlimPzl7hlNZB8p4sU20ayAWRRiCj54
	W69BYAqL2HZ6YmDN/4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTmLl-00000007tY1-0p9s;
	Sat, 27 Jan 2024 17:20:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTlOQ-00000007kFd-2ZFN
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 16:19:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2945ce598bfso728481a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 27 Jan 2024 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706372333; x=1706977133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ekp7NR9JGHvKX5tDHRTOvHiQ7p6oqRI0Ent2tTntvI=;
        b=Iu8P6SqG8cOy2vI/SZxf7nRh/iBRnMT7hMp9lOEt/rWZlE8Y+xlrZdtHLBIMxGSoXc
         20Zd4ZJrTy3nj9ja3V60GDcm4ECwV3irG/qyBYMReSwUp6AGZILziegADhb69ASbaS68
         P6ZwZGSC60HWHEQeKPU6PJNMJZ0eUdcFxA3fmMQm8P09MDkW/ZD1fqVpb2UQTo/7VxWi
         PJXnnxokOVDuGqVLDZgXN59OlD8JLPDZ5WaxI7AnJVOu2kN2bBbVBy9EKKxPdKdx3j/+
         3BbbScjwbjvlZctTcyhXRanKi2oviIdPpi2NxAI9KYoXR+B03QPdf6JL0inAFLp7mc7j
         GA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706372333; x=1706977133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ekp7NR9JGHvKX5tDHRTOvHiQ7p6oqRI0Ent2tTntvI=;
        b=td742BjwHG1Zp0IssdCaZjvga2SdCBJMAcVVq1yUHYRnuxM4g/62MMh0SdA1hI/Z6s
         UuEeiNsmo/EVbamJ1rM9ms1gtEO3QSwSSRogJ+i9BBO+H9SIFUk+0819IgpuG5KYMfqP
         BzOerVJXb0JFv9oUz7CbKIzInTBFSNL2foolhjoXt7eRGOvub0MqfIY4VzOXBRz4aynD
         ef2asqLnFoCv7pZPa5MUmif3qa5tfHitbdwIWeRybiYzrmyQUX067GEMS1nvpCctrNfV
         z5TY1/8t1k/wN8kDO48ImmXMtdA0GCcyBU24Hytpe51ZXgg8wf7kegTosg1J7x1DA6HM
         P4Jg==
X-Gm-Message-State: AOJu0YzxEYYXiAFVBVIiwfoyiLhN/3Cub1qjq9x78qQ+hWspclKmxoWn
	JCToj6T03AL9cfzv9dvRGZANS2Rvwj2P3dERE6xBQKh0RY5f+oLiKIKNb6vQbig=
X-Google-Smtp-Source: AGHT+IG8bjgnQErzq4BE0Rgjwv3fngKcK42zpZJYDnCSRnuoHpUHefIS7rhIK2NUJYxnqucbED1hzw==
X-Received: by 2002:a17:90a:c585:b0:28e:829e:3f99 with SMTP id l5-20020a17090ac58500b0028e829e3f99mr812895pjt.69.1706372333301;
        Sat, 27 Jan 2024 08:18:53 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.17])
        by smtp.gmail.com with ESMTPSA id d11-20020a17090ac24b00b00290f8c708d0sm5091620pjx.57.2024.01.27.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jan 2024 08:18:52 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v12 06/25] irqchip: Convert all platform MSI users to the new API
Date: Sat, 27 Jan 2024 21:47:34 +0530
Message-Id: <20240127161753.114685-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240127161753.114685-1-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_081854_780927_51314C9A 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Vinod Koul <vkoul@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Mark Rutland <mark.rutland@arm.com>, Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Andy Gross <agross@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

Switch all the users of the platform MSI domain over to invoke the new
interfaces which branch to the original platform MSI functions when the
irqdomain associated to the caller device does not yet provide MSI parent
functionality.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Sinan Kaya <okaya@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/dma/mv_xor_v2.c                     | 8 ++++----
 drivers/dma/qcom/hidma.c                    | 6 +++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 5 +++--
 drivers/mailbox/bcm-flexrm-mailbox.c        | 8 ++++----
 drivers/perf/arm_smmuv3_pmu.c               | 4 ++--
 drivers/ufs/host/ufs-qcom.c                 | 8 ++++----
 6 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index 1ebfbe88e733..732663ad6d71 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -747,8 +747,8 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 	if (IS_ERR(xor_dev->clk))
 		return PTR_ERR(xor_dev->clk);
 
-	ret = platform_msi_domain_alloc_irqs(&pdev->dev, 1,
-					     mv_xor_v2_set_msi_msg);
+	ret = platform_device_ims_init_and_alloc_irqs(&pdev->dev, 1,
+						      mv_xor_v2_set_msi_msg);
 	if (ret)
 		return ret;
 
@@ -851,7 +851,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 			  xor_dev->desc_size * MV_XOR_V2_DESC_NUM,
 			  xor_dev->hw_desq_virt, xor_dev->hw_desq);
 free_msi_irqs:
-	platform_msi_domain_free_irqs(&pdev->dev);
+	platform_device_ims_free_irqs_all(&pdev->dev);
 	return ret;
 }
 
@@ -867,7 +867,7 @@ static void mv_xor_v2_remove(struct platform_device *pdev)
 
 	devm_free_irq(&pdev->dev, xor_dev->irq, xor_dev);
 
-	platform_msi_domain_free_irqs(&pdev->dev);
+	platform_device_ims_free_irqs_all(&pdev->dev);
 
 	tasklet_kill(&xor_dev->irq_tasklet);
 }
diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index d63b93dc7047..4065d6eab49e 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -696,7 +696,7 @@ static void hidma_free_msis(struct hidma_dev *dmadev)
 			devm_free_irq(dev, virq, &dmadev->lldev);
 	}
 
-	platform_msi_domain_free_irqs(dev);
+	platform_device_ims_free_irqs_all(dev);
 #endif
 }
 
@@ -706,8 +706,8 @@ static int hidma_request_msi(struct hidma_dev *dmadev,
 #ifdef CONFIG_GENERIC_MSI_IRQ
 	int rc, i, virq;
 
-	rc = platform_msi_domain_alloc_irqs(&pdev->dev, HIDMA_MSI_INTS,
-					    hidma_write_msi_msg);
+	rc = platform_device_ims_init_and_alloc_irqs(&pdev->dev, HIDMA_MSI_INTS,
+						     hidma_write_msi_msg);
 	if (rc)
 		return rc;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0ffb1cf17e0b..84a765b1f64e 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3125,7 +3125,8 @@ static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 static void arm_smmu_free_msis(void *data)
 {
 	struct device *dev = data;
-	platform_msi_domain_free_irqs(dev);
+
+	platform_device_ims_free_irqs_all(dev);
 }
 
 static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
@@ -3166,7 +3167,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 	}
 
 	/* Allocate MSIs for evtq, gerror and priq. Ignore cmdq */
-	ret = platform_msi_domain_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
+	ret = platform_device_ims_init_and_alloc_irqs(dev, nvec, arm_smmu_write_msi_msg);
 	if (ret) {
 		dev_warn(dev, "failed to allocate MSIs - falling back to wired irqs\n");
 		return;
diff --git a/drivers/mailbox/bcm-flexrm-mailbox.c b/drivers/mailbox/bcm-flexrm-mailbox.c
index e3e28a4f7d01..333ca6c519cb 100644
--- a/drivers/mailbox/bcm-flexrm-mailbox.c
+++ b/drivers/mailbox/bcm-flexrm-mailbox.c
@@ -1587,8 +1587,8 @@ static int flexrm_mbox_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate platform MSIs for each ring */
-	ret = platform_msi_domain_alloc_irqs(dev, mbox->num_rings,
-						flexrm_mbox_msi_write);
+	ret = platform_device_ims_init_and_alloc_irqs(dev, mbox->num_rings,
+						      flexrm_mbox_msi_write);
 	if (ret)
 		goto fail_destroy_cmpl_pool;
 
@@ -1641,7 +1641,7 @@ static int flexrm_mbox_probe(struct platform_device *pdev)
 
 fail_free_debugfs_root:
 	debugfs_remove_recursive(mbox->root);
-	platform_msi_domain_free_irqs(dev);
+	platform_device_ims_free_irqs_all(dev);
 fail_destroy_cmpl_pool:
 	dma_pool_destroy(mbox->cmpl_pool);
 fail_destroy_bd_pool:
@@ -1657,7 +1657,7 @@ static void flexrm_mbox_remove(struct platform_device *pdev)
 
 	debugfs_remove_recursive(mbox->root);
 
-	platform_msi_domain_free_irqs(dev);
+	platform_device_ims_free_irqs_all(dev);
 
 	dma_pool_destroy(mbox->cmpl_pool);
 	dma_pool_destroy(mbox->bd_pool);
diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 6303b82566f9..32b604e8bdf3 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -716,7 +716,7 @@ static void smmu_pmu_free_msis(void *data)
 {
 	struct device *dev = data;
 
-	platform_msi_domain_free_irqs(dev);
+	platform_device_ims_free_irqs_all(dev);
 }
 
 static void smmu_pmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
@@ -746,7 +746,7 @@ static void smmu_pmu_setup_msi(struct smmu_pmu *pmu)
 	if (!(readl(pmu->reg_base + SMMU_PMCG_CFGR) & SMMU_PMCG_CFGR_MSI))
 		return;
 
-	ret = platform_msi_domain_alloc_irqs(dev, 1, smmu_pmu_write_msi_msg);
+	ret = platform_device_ims_init_and_alloc_irqs(dev, 1, smmu_pmu_write_msi_msg);
 	if (ret) {
 		dev_warn(dev, "failed to allocate MSIs\n");
 		return;
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 39eef470f8fa..f4c4becdef0b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1712,8 +1712,8 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 	 * 2. Poll queues do not need ESI.
 	 */
 	nr_irqs = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
-	ret = platform_msi_domain_alloc_irqs(hba->dev, nr_irqs,
-					     ufs_qcom_write_msi_msg);
+	ret = platform_device_ims_init_and_alloc_irqs(hba->dev, nr_irqs,
+						      ufs_qcom_write_msi_msg);
 	if (ret) {
 		dev_err(hba->dev, "Failed to request Platform MSI %d\n", ret);
 		return ret;
@@ -1742,7 +1742,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 			devm_free_irq(hba->dev, desc->irq, hba);
 		}
 		msi_unlock_descs(hba->dev);
-		platform_msi_domain_free_irqs(hba->dev);
+		platform_device_ims_free_irqs_all(hba->dev);
 	} else {
 		if (host->hw_ver.major == 6 && host->hw_ver.minor == 0 &&
 		    host->hw_ver.step == 0)
@@ -1818,7 +1818,7 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_remove(hba);
-	platform_msi_domain_free_irqs(hba->dev);
+	platform_device_ims_free_irqs_all(hba->dev);
 }
 
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
