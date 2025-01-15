Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C53E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 03:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKU/TJJusKduJ2/qmaHH8gwcZxMVhyevyHd6Gi1tKws=; b=PhutqnbPjoKhj4
	FAq7/DKL0KkpgRoiSz429CKLKq7Y6oRabFrIOCH3nQDI8l6tllHBqsn58qdsQJJB/jx9v/8BjhcT9
	6UmNojyi9D7d812SctgdAme71SyBDGX3KD5IitwGHeQcahERWis6EGPUqfGAxdZrP4PNq/AGpzAs0
	aN08CrnOsTcL7K+9eBCNkMBKECUtGqSQibGT6OsmTGUKmmfzGPrKGqBiD4WtAKnKoUgsVpxd2eduF
	UiQYTyeKDlbHFxOKR8SY0StNgG4LbYZHS8xp8fb8LMFF2KcuE6SyDC65GjWYlNI83n0UluFVE93SR
	eqKAbo8B4alkPTJ29PYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtgt-0000000ATZr-3w1z;
	Wed, 15 Jan 2025 03:03:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXtgr-0000000ATYj-37X5
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 03:03:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2166f1e589cso133388775ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 19:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736910213; x=1737515013; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C2l3cW3A35MwF8MmccDu9nYzUOGU3WhdqnIlz5R1nkM=;
        b=N3nFLzl/8IPygkOF4b7QcBNtapuEfwvTXeU8aj8nGGf4YdtI7Rz/IgdUjAqs2Dj9MC
         wYOGMiKt7jwFv5UImmhxUiEfQXZoimpgjse47bqb6WMMv8u2PKaidH04uyp5JXxWk4HL
         zghWB2Thq99Zb3hXkCOfrzFSqHSPUCjmrcWIwuXVZg9zP0nBd1ywt2HHmPbxLPXQygG8
         earyw5QFBN2EZYdznS3NFBH4MsFZup64/msyYavHAnHMnyDIubu+B1yEQSpizl9v2d3x
         F2tjnG6WDPQ9FWXaLcq7vG9N4sD2ErgoysabJDhnOk5kUVBKrNQ6qjo43zcm5Nwmhc4G
         +ttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736910213; x=1737515013;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C2l3cW3A35MwF8MmccDu9nYzUOGU3WhdqnIlz5R1nkM=;
        b=jf+KaopOSIM3RcYftVlXLl07x9CRh7kD0JJ4s3OZrCHXEdObzDTD3mYXwGaEi+1lTy
         XHTvMhrWi3pE9zBKwhDkU61/Za5kkVO4Orhr9FzDn2SjohYxFnkzf44MLj7wPla2KvrY
         AKU70nMRvpfDs8FPaZNTKPvc6pDdld7Q3B1XCzqOA7UsE2NgCHhgRP1c+Kin3F2hc650
         mXMWhxlLeybn5pqiJEYzTIU+8ub4/3IrXB/AoCQqVvocKNVuRKgZdrXuYEj+ZbEpXIKT
         6LsKyhu076acZvZZ+aT0GOukBnkY4eTMSNBUoB5cTw2UuP8W+GozSiy+esqZi4IOACnC
         ACFg==
X-Forwarded-Encrypted: i=1; AJvYcCVdreMUZ1FBiBXZLa5zvVzOtspo/LgaWeQztX/gI/EmQBq3HDxCjogrI89R4KWv+F4gr+Mk2qf1tkkADg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+D4RiX/p9Q6NrwLf/6StZIsItuPJFV9a2zmmZeQ5aUFOxGiJF
	vhdhaJciXMfB1bk+vQw9btfJkKgIGe/VzIWpCEEnyxZB5dHvHwXuHpSf7KVSRGQ=
X-Gm-Gg: ASbGnct4fmNB5HvhR3tCZRjnApZwp9fUmdOqA/XzJ7SGzWyK7DzOC4ksm7rWEedyjtL
	V6DwI5wGMt6Uz4AYVr9bYETTbNd9dQXd4IstNQGiR/9R+UrUisBYjrOpELxQJmF4xwx5QJ93omO
	MSi4LEnpK/897rsIpF8xiaUfxj220UnSoIILV13M7FNFa5oZoSgz2y+DWTjc4Um9R2hL4vqCZ3M
	QHCZvH3ViMGjBhPCnOK4W5005GeQicyPYSB3/lEgoPb8Bd9bh3Ze71/3qaTi+VqeKojV+I07d5o
	A8k=
X-Google-Smtp-Source: AGHT+IGutP9CT/bKHGG/K5YQHtyEvJxs9HfNEL1yUqUDRQQkupgNCYnCJpWiQyiLvCI4Vu/2v7GT3g==
X-Received: by 2002:a05:6a20:7350:b0:1e0:cc4a:caab with SMTP id adf61e73a8af0-1e88d12c1e2mr42368431637.19.1736910212772;
        Tue, 14 Jan 2025 19:03:32 -0800 (PST)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40568dccsm8123668b3a.47.2025.01.14.19.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 19:03:32 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 2/2] iommu/riscv: support HPM and interrupt handling
Date: Wed, 15 Jan 2025 11:03:06 +0800
Message-Id: <20250115030306.29735-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250115030306.29735-1-zong.li@sifive.com>
References: <20250115030306.29735-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_190333_783724_0296D2B5 
X-CRM114-Status: GOOD (  13.63  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the PMU and uninitialize it when driver is removed.
Interrupt handling is also implemented, and the handler needs
to be a primary handler instead of a threaded function because
pt_regs is empty when threading the IRQ. However, pt_regs is
required by perf_event_overflow.

Signed-off-by: Zong Li <zong.li@sifive.com>
Tested-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8a05def774bd..20ae90471484 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -552,6 +552,62 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+/*
+ * IOMMU Hardware performance monitor
+ */
+
+/* HPM interrupt primary handler */
+static irqreturn_t riscv_iommu_hpm_irq_handler(int irq, void *dev_id)
+{
+	struct riscv_iommu_device *iommu = (struct riscv_iommu_device *)dev_id;
+
+	/* Clear performance monitoring interrupt pending */
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IPSR, RISCV_IOMMU_IPSR_PMIP);
+
+	/* Process pmu irq */
+	riscv_iommu_pmu_handle_irq(&iommu->pmu);
+
+	return IRQ_HANDLED;
+}
+
+/* HPM initialization */
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	int rc;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM))
+		return 0;
+
+	/*
+	 * pt_regs is empty when threading the IRQ, but pt_regs is necessary
+	 * by perf_event_overflow. Use primary handler instead of thread
+	 * function for PM IRQ.
+	 *
+	 * Set the IRQF_ONESHOT flag because this IRQ might be shared with
+	 * other threaded IRQs by other queues.
+	 */
+	rc = devm_request_irq(iommu->dev,
+			      iommu->irqs[riscv_iommu_queue_vec(iommu, RISCV_IOMMU_IPSR_PMIP)],
+			      riscv_iommu_hpm_irq_handler, IRQF_ONESHOT | IRQF_SHARED, NULL, iommu);
+	if (rc)
+		return rc;
+
+	return riscv_iommu_pmu_init(&iommu->pmu, iommu->reg, dev_name(iommu->dev));
+}
+
+/* HPM uninitialization */
+static void riscv_iommu_hpm_disable(struct riscv_iommu_device *iommu)
+{
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM))
+		return;
+
+	devm_free_irq(iommu->dev,
+		      iommu->irqs[riscv_iommu_queue_vec(iommu, RISCV_IOMMU_IPSR_PMIP)],
+		      iommu);
+
+	riscv_iommu_pmu_uninit(&iommu->pmu);
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1596,6 +1652,9 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_pmu_uninit(&iommu->pmu);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -1635,6 +1694,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		goto err_queue_disable;
 
+	rc = riscv_iommu_hpm_enable(iommu);
+	if (rc)
+		goto err_hpm_disable;
+
 	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
 				    dev_name(iommu->dev));
 	if (rc) {
@@ -1653,6 +1716,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 err_remove_sysfs:
 	iommu_device_sysfs_remove(&iommu->iommu);
 err_iodir_off:
+	riscv_iommu_hpm_disable(iommu);
+err_hpm_disable:
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 err_queue_disable:
 	riscv_iommu_queue_disable(&iommu->fltq);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
