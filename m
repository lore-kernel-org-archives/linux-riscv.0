Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7EAC27C77
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNJuOSKdOWFnyvctfkACtU3Dyn8IyIXkrkOLy0tQFbM=; b=2A1ToEZWoOpq7G
	ZnW6Q19/2yjBkS2dOgFlNPttEsQI7Or28PwNlxYIPsGoA/o9bVJi0EQn0GGGHMNSu8vu7cq3xsRZF
	E9hKI+ru1Pp4rOERu9n1s796TBaOK6JJnGXq5VR1GYxv1yqgAwNPOX8yFt90MriNaqgOMPyG4E8FH
	c3AzSeKCQ80jL1NknAeoGlo6q7upNvnODmoZWTYNyvNuAiEy9wN21UghBXNatqltDiwWqtOanwU2m
	9zgd/dGjTeFdGyx9hOy/3FWQSzVyIaPZywfQi2chbZEpECGylJRtVPBNjXsBOpAMje7KUyOiHOP57
	Hyh41U285157o2mSjSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7oo-00000002zuT-1AtV;
	Fri, 14 Jun 2024 14:22:18 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI7ok-00000002zt2-3kMH
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 14:22:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f6b0a40721so15911695ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718374933; x=1718979733; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tlFDKoGPkyb3nGW5qL4azlR55hFLQbYBhLCB+CenNg8=;
        b=Sm4oIIs3WkuXEcLUZ3lJLa/AJ9zaVpIfZcCUlgjVoQBip0D/UuRKCKpD+pi8Xv1pLG
         3db1AVqry+pMKFaX1CzMU7wWgyTdHsVLKagiIHGFywBZ845p5qwLC5XGoIKuCx4PZLND
         G6QrhEneKkCfABZGJfG8M2uG/0MWNMjXifcYzDvesoSNo8efTTeuArpo2V/eQ4yNXcfz
         MBeBZ8tS3vEV4S3+X4/SPVSQGGm4sCE45t/4H9StpZqO4NrK9h9O4hsgwE8iLUQUXikP
         kiGuI9kir65uM51jw/DrU4AJa99QHv+1jTwBnwkBv4mdDNzrsDBD5JZdxoTUiIksCl+h
         cxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718374933; x=1718979733;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlFDKoGPkyb3nGW5qL4azlR55hFLQbYBhLCB+CenNg8=;
        b=qO2csrIq0CD8WEnnD+EmQXvZ8CvrLadhMjKuVfThifzapXBt8+qcmexa3e1Ku1L5Bp
         2muM4QnWElIJMzoVr9XffpNem9hxRfJLMNClKOoBfYRYIvgkmv1LMJpAdK/v8ImEsUur
         elTce01pgmQ5x6mh1WCuALtlp0J2WZfTpEHPcY5esIo4XwiMIwzbfKGqhYlH1zX57X7W
         ZpbEAWAzv69YjtSaw09VCoEkKeNzriee3YxYwAQloRqQF1OwvS2iSOEimuQHg6QX6LDq
         47sVeSIYagl59wlQOzRBv7vS/vUVAG+j4zz1ctHHQOrwU+9sTZFzJcsEIUQmFn1Bh57f
         73AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfZy73aQHU8cHH+CSfkrqHTXeOp7F772t4LnmZ9tDHjnimz9Wl04kv6Z0zdJ4YxpEvnFo8/aJNFgS3Zng7p8sbA3Sjkp6+Y3Kv4o5oCTcd
X-Gm-Message-State: AOJu0YxKCvN4hcQYrq49RB0h9SYg6evqfEi1HCTs65VqjJecAkOT22a7
	ojqKHyVaPWlUz3s3RgWNgh66PxxfEu0i20tQ88LCkg06LFT2rknmMeJ7OXblk5o=
X-Google-Smtp-Source: AGHT+IE4q8GqM7rVw79GCJsFYmYJxenhwqq3dMfDvs+NWax7S8ItEx42VF35t3MI4KJSDGoZTtuT2g==
X-Received: by 2002:a17:902:7883:b0:1f7:35e0:5af4 with SMTP id d9443c01a7336-1f8627e18bcmr22056005ad.30.1718374933563;
        Fri, 14 Jun 2024 07:22:13 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e559d9sm32522005ad.35.2024.06.14.07.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:22:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 02/10] iommu/riscv: support HPM and interrupt handling
Date: Fri, 14 Jun 2024 22:21:48 +0800
Message-Id: <20240614142156.29420-3-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240614142156.29420-1-zong.li@sifive.com>
References: <20240614142156.29420-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_072214_962464_9C14902F 
X-CRM114-Status: GOOD (  13.41  )
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
 drivers/iommu/riscv/iommu.c | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8b6a64c1ad8d..1716b2251f38 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -540,6 +540,62 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
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
@@ -1612,6 +1668,9 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_HPM)
+		riscv_iommu_pmu_uninit(&iommu->pmu);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -1651,6 +1710,10 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		goto err_queue_disable;
 
+	rc = riscv_iommu_hpm_enable(iommu);
+	if (rc)
+		goto err_hpm_disable;
+
 	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
 				    dev_name(iommu->dev));
 	if (rc) {
@@ -1669,6 +1732,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
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
