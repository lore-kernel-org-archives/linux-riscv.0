Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAF1C25B77
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMHAZcki+QffYj1/75aCJZ9fxYjC2qABaV6eFl8tFyo=; b=lo0Z8gefYBqIBk
	okqIzUXyHBdxpth8h72GGBzPstowDevgFqAQYDF14coa+IoZVu3VXiW71SQLl4nLeJWYg1OiP0n2j
	cPqz2hu/5jpKIyaQEIgg6KomQxLo3NEDG45qIIkioi7vGEeZOlhtP8VpQ++g+KQGLmvy5sGr47cbx
	yGKOpQ/TaVF692DWsLFw/oErc8eEWjHxbe7LyFdEOOUvGrCAp64rrtSk7Aeg2yUyr1jfxmgipEW7r
	IM2sex1vrhG1uVN3/ilTOYGaeWnwdwVj/WT7BG1CN8Qxkl6FbWrtAgYIZDdq6ZFf1WovnieCxr4gs
	iQFA0yteN/5X6F+GhYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Llp-0000000BU0K-0ERd;
	Tue, 07 May 2024 14:26:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lll-0000000BTwf-2maW
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f4521ad6c0so2343613b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715091970; x=1715696770; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jz4ENNoetocqIssCS0B2oXUtzcTlnoT1WDoFLx5sIU=;
        b=RTlgseonOBKHjrDAcKqvw6jr6OXApKhwdf33zztUq55rTJPuJU0IYtUTY06Vlkqai7
         E+TM5B845zEGVrmCM82Fq7LcngCjJMYVJIpf04p40g1WaS24TtO2quN4JjAokMQBWRMm
         4TnK0UAx/dELOfdUjYoCy8K82Be8Ku7cPO021JvYqtdkmX/2Y5WTAtt1PdxCFJ6fY0vC
         W3XNk8sdcgAQzD7J/454UKw43XSh1FVzrSF3nmPdtx2oMGm/WEXEhcPpFpUgQyGQZ+yR
         FW3DrKEHD5txoODqz9nAtGXPiQuFu6jVA+J2xLhTpG0dcITiM/yvvuOPZ7mDI1emhn7L
         p3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091970; x=1715696770;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jz4ENNoetocqIssCS0B2oXUtzcTlnoT1WDoFLx5sIU=;
        b=bSDTEhZ7astXcllfkZTYtRfe/uUTV09EVf/ryCiC9Ln7yqOyCjdT81lVyCU6CtYBHj
         DE3yZA559dPRGUNVGp3JPygvoyzlxX5Rl05XcKQfr7izEE0Rdop5EeuNc3tPBHEtyZ8r
         d2z0xZUKh6UfFPPEc7f6euE3/sCDAwauRn6Ls+dUUnE1MasB2wNyJ4Xy3t+eDxbETzDt
         yxKGoLShX5UlXAel6PtMQ1wDNfTDaLbC8q6uiECOTm/UvamkgXejct3FELL4/7mB5AZS
         UjgfTfdYuP9pLWq+5lV9cn2ctoOgDObTIe3Wp4B+kisWviVEpQsF/+KRsNHLAJAMvB/+
         3UMw==
X-Forwarded-Encrypted: i=1; AJvYcCWHA6uxc642nXGkHOtnq9oa+lJuSGmRFRjubsxvBiTQFkpFNCqapO038VtYMjk+X67P91ljR92p8c43AlrZtZSIqgNUPvz/A9Av83f5iyhv
X-Gm-Message-State: AOJu0YzRlyoXrz5Ur7+Y+JeFyNS5pUOra5gm34IY1DTj39EXx+cG7EeC
	iChSnUC4WSC9GwHXFyLoeNWzVOwpWcPpbsvzpsBwdlT7ymZmofUFC6NYUJh+5DE=
X-Google-Smtp-Source: AGHT+IFFwJydlhv8Eo1uigoZzco+8G3QZGbkY7AV3d8a5KKB5Jnd/eMaJgfIknHgv405ntAxsJkBlA==
X-Received: by 2002:a05:6a20:9c97:b0:1af:9ee6:25c4 with SMTP id mj23-20020a056a209c9700b001af9ee625c4mr8750903pzb.42.1715091970500;
        Tue, 07 May 2024 07:26:10 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i22-20020aa79096000000b006f44bcbe7e3sm7687554pfa.201.2024.05.07.07.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:26:10 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH RFC RESEND 2/6] iommu/riscv: Support HPM and interrupt handling
Date: Tue,  7 May 2024 22:25:56 +0800
Message-Id: <20240507142600.23844-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507142600.23844-1-zong.li@sifive.com>
References: <20240507142600.23844-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072613_740631_5A6D5D97 
X-CRM114-Status: GOOD (  13.19  )
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

This patch initialize the pmu stuff and uninitialize it when driver
removing. The interrupt handling is also provided, this handler need to
be primary handler instead of thread function, because pt_regs is empty
when threading the IRQ, but pt_regs is necessary by perf_event_overflow.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu.c | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ec701fde520f..e0bf74a9c64d 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -526,6 +526,56 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
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
+	/* Process pmu irq */
+	riscv_iommu_pmu_handle_irq(&iommu->pmu);
+
+	/* Clear performance monitoring interrupt pending */
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IPSR, RISCV_IOMMU_IPSR_PMIP);
+
+	return IRQ_HANDLED;
+}
+
+/* HPM initialization */
+static int riscv_iommu_hpm_enable(struct riscv_iommu_device *iommu)
+{
+	int rc;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAP_HPM))
+		return 0;
+
+	/*
+	 * pt_regs is empty when threading the IRQ, but pt_regs is necessary
+	 * by perf_event_overflow. Use primary handler instead of thread
+	 * function for PM IRQ.
+	 */
+	rc = devm_request_irq(iommu->dev, iommu->irqs[RISCV_IOMMU_IPSR_PMIP],
+			      riscv_iommu_hpm_irq_handler, 0, NULL, iommu);
+	if (rc)
+		return rc;
+
+	return riscv_iommu_pmu_init(&iommu->pmu, iommu->reg, dev_name(iommu->dev));
+}
+
+/* HPM uninitialization */
+static void riscv_iommu_hpm_disable(struct riscv_iommu_device *iommu)
+{
+	if (!(iommu->caps & RISCV_IOMMU_CAP_HPM))
+		return;
+
+	devm_free_irq(iommu->dev, iommu->irqs[RISCV_IOMMU_IPSR_PMIP], iommu);
+
+	riscv_iommu_pmu_uninit(&iommu->pmu);
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1551,6 +1601,9 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+
+	if (iommu->caps & RISCV_IOMMU_CAP_HPM)
+		riscv_iommu_pmu_uninit(&iommu->pmu);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -1590,6 +1643,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		goto err_queue_disable;
 
+	rc = riscv_iommu_hpm_enable(iommu);
+	if (rc)
+		goto err_hpm_disable;
+
 	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
 				    dev_name(iommu->dev));
 	if (rc) {
@@ -1608,6 +1665,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 err_remove_sysfs:
 	iommu_device_sysfs_remove(&iommu->iommu);
 err_iodir_off:
+	riscv_iommu_hpm_disable(iommu);
+err_hpm_disable:
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_MODE_OFF);
 err_queue_disable:
 	riscv_iommu_queue_disable(&iommu->fltq);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
