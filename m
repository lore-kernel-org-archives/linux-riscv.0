Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFC7E77180
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXENyGnx4Babcl/B/1VljMba1RZHrffUhUzK6r2yhCU=; b=iqaxiGTrHy77Ym
	MXAF2rdnA7kyKgsqD5Mhv385DAc68nyzEN4JPXFsMNiOinmieUUG4SsSzYy5t4UkX8asOBzu/s5bR
	7sDOlRHyWf5cj0bbiccdji/jhaYuuOCGHJap7noXMaVeJON6gmkS61MJZkqEP9o1Zav55imP1+MMW
	sfwupcoam7g/RWcgLfh/3N1c/RLdb+n+EDH5R9pnCZiKFTLVVz70/Wf/QrHa/Al2l2j3eT+hpE29N
	5LLafPa6+i2Iop2VYrEbjIMTuhWR7kBXTHV7/9jcuC8uWTKOggiCXSthMg6kAja+tKR6fZXJuvWcW
	cv7mh3TTw8Mz87+E0+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM44J-00000003boL-2ntM;
	Fri, 13 Dec 2024 11:42:51 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM44G-00000003bmV-3ome
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:42:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728eedfca37so1772205b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734090168; x=1734694968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nzXBeY/zx1suskgdf8fbpsAzoYK9okK//XYDozr9/c=;
        b=OK6LbN1oSttZle5Yq4TVnEQXdmnBZ1rAK3fVZZJWhSs9jbRRa7gEQT//yjkoYOLRMQ
         S6thRG3/JeVja6kIoyV3bXFij+o895KKZWprs8ydFxFVNUEUeJcoSCVjEyFrEw7L11yG
         5+lvNpHIJchLvi4Z3DBEEzIl/mHF3IXakOdm/iorX+GlFF/YxUwNlxPmYwWGEn4dFFG5
         FdxsiCcLxN5nQxaLg8K/i8c7rfnNeeNM9IWTGaLq/e5AfxWt4eaLdl0sh/4W2KdbrOag
         FfD1lYyu/1bKjSwcaB3dQHvtGaWXTq4dDjz9Hjxhjm8jWIZVL4OcYQ2aCC90Sj/nUAS2
         QRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734090168; x=1734694968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nzXBeY/zx1suskgdf8fbpsAzoYK9okK//XYDozr9/c=;
        b=qgVW1eQ3dZEVpedjdOc9FAOiLdbAUhJqk3pizCSMvnZxUvvB+nsQE54Xu3lRJD3GRp
         l7UONNUisVC3rWdIi2QcGlZKoJziWC4jl0N3XgW8Zn6PXSLkCEkTzbYVrIf3U0hxvi8m
         bZSLMDD778yW2C5vhG9c3y4ETinDmCnSeSjZEFJEUUnBv0ygtisCJ7CfJOpDgOglVV0R
         LrwVSyKAfjItV5A1m2+YRquyuDNL14cCLuxpmnTufxeqSCW0kiuxXrae0qhZhtREb91H
         hFztjj4WiZPRKAE4h5Gt576qfBtwZtFIZz5tVb76mfclKJmLzIPND0o3mvKwp/WtKrz5
         aiNA==
X-Forwarded-Encrypted: i=1; AJvYcCUr2SqojoXOOuhXart7lkCFNTWvRMNNEKL2YqQKp2mWQ3XaHHCTeft3hnEKWfbVuCVFrrWVMmpRghC00w==@lists.infradead.org
X-Gm-Message-State: AOJu0YziEPdnMjbx1bk9/zs6JaelLqjC7SiuDC5vKomSDXtH9eSBi4f/
	qcU5YAxt1qXOzKrxfANXnBWS/b1mytSnBmSHo3zE3+vJPam1U4v/FK54QNA6yak=
X-Gm-Gg: ASbGncvPDo5HRuHcyRgjIqFO1MdVT0cCne/4lx8HEiB480xJFxHT9jIte2x3lET5HTw
	4Uhmal2RwRKo0z2OwtcpSRNPXV1t6AGErL2oInrqg/NusFQeXbfv3jeeP/Xqo3aiItAsyzOKDwt
	jVrv99g2cT19inB3o2wvt0NxjJh8//LhIIosLGRlSHq0lIluzHohG4CWQBab/sA5OWCiffLkR33
	2PLc4oOUTp9gjL2z/uZfDrti+JJr04ub1yjnifXtlvp3F7CfOJlBLA70cgytyV/WcnZ8+ANx02x
	tBnWoaxo0BrCbU4hTreZ9phm2E8HKDmvH4VM7Yg=
X-Google-Smtp-Source: AGHT+IHchEZVi5a6A4EscQE7riigGZANnu99XJHe62AE6HVH8l0CdHEKKzwg+sAunEM97R10zLGscQ==
X-Received: by 2002:a05:6a20:2446:b0:1db:ec3e:c959 with SMTP id adf61e73a8af0-1e1dfd3d5c8mr4085521637.10.1734090168101;
        Fri, 13 Dec 2024 03:42:48 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd4b961f1asm8666340a12.30.2024.12.13.03.42.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Dec 2024 03:42:47 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH 2/2] iommu/riscv: Add shutdown function for iommu driver
Date: Fri, 13 Dec 2024 19:42:33 +0800
Message-Id: <20241213114233.12388-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213114233.12388-1-luxu.kernel@bytedance.com>
References: <20241213114233.12388-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_034248_945957_7538011D 
X-CRM114-Status: GOOD (  12.91  )
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

This commit supplies shutdown callback for iommu pmu driver. The shutdown
callback resets necessary registers so that newly booted kernel can pass
riscv_iommu_init_check() after kexec. Also, the shutdown callback resets
iommu mode to bare instead of off so that new kernel can still use PCIE
devices even when CONFIG_RISCV_IOMMU is not enabled.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/iommu/riscv/iommu-pci.c      | 8 ++++++++
 drivers/iommu/riscv/iommu-platform.c | 6 ++++++
 drivers/iommu/riscv/iommu.c          | 6 ++++--
 drivers/iommu/riscv/iommu.h          | 1 +
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-pci.c b/drivers/iommu/riscv/iommu-pci.c
index c7a89143014c..d82d2b00904c 100644
--- a/drivers/iommu/riscv/iommu-pci.c
+++ b/drivers/iommu/riscv/iommu-pci.c
@@ -101,6 +101,13 @@ static void riscv_iommu_pci_remove(struct pci_dev *pdev)
 	riscv_iommu_remove(iommu);
 }
 
+static void riscv_iommu_pci_shutdown(struct pci_dev *pdev)
+{
+	struct riscv_iommu_device *iommu = dev_get_drvdata(&pdev->dev);
+
+	riscv_iommu_disable(iommu);
+}
+
 static const struct pci_device_id riscv_iommu_pci_tbl[] = {
 	{PCI_VDEVICE(REDHAT, PCI_DEVICE_ID_REDHAT_RISCV_IOMMU), 0},
 	{PCI_VDEVICE(RIVOS, PCI_DEVICE_ID_RIVOS_RISCV_IOMMU_GA), 0},
@@ -112,6 +119,7 @@ static struct pci_driver riscv_iommu_pci_driver = {
 	.id_table = riscv_iommu_pci_tbl,
 	.probe = riscv_iommu_pci_probe,
 	.remove = riscv_iommu_pci_remove,
+	.shutdown = riscv_iommu_pci_shutdown,
 	.driver = {
 		.suppress_bind_attrs = true,
 	},
diff --git a/drivers/iommu/riscv/iommu-platform.c b/drivers/iommu/riscv/iommu-platform.c
index 382ba2841849..62c40b99cf62 100644
--- a/drivers/iommu/riscv/iommu-platform.c
+++ b/drivers/iommu/riscv/iommu-platform.c
@@ -74,6 +74,11 @@ static void riscv_iommu_platform_remove(struct platform_device *pdev)
 	riscv_iommu_remove(dev_get_drvdata(&pdev->dev));
 };
 
+static void riscv_iommu_platform_shutdown(struct platform_device *pdev)
+{
+	riscv_iommu_disable(dev_get_drvdata(&pdev->dev));
+};
+
 static const struct of_device_id riscv_iommu_of_match[] = {
 	{.compatible = "riscv,iommu",},
 	{},
@@ -82,6 +87,7 @@ static const struct of_device_id riscv_iommu_of_match[] = {
 static struct platform_driver riscv_iommu_platform_driver = {
 	.probe = riscv_iommu_platform_probe,
 	.remove = riscv_iommu_platform_remove,
+	.shutdown = riscv_iommu_platform_shutdown,
 	.driver = {
 		.name = "riscv,iommu",
 		.of_match_table = riscv_iommu_of_match,
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 84806724f568..670b4302aca8 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -651,9 +651,11 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
  * This is best effort IOMMU translation shutdown flow.
  * Disable IOMMU without waiting for hardware response.
  */
-static void riscv_iommu_disable(struct riscv_iommu_device *iommu)
+void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 {
-	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP, 0);
+	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP,
+			   FIELD_PREP(RISCV_IOMMU_DDTP_IOMMU_MODE,
+				      RISCV_IOMMU_DDTP_IOMMU_MODE_BARE));
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_CQCSR, 0);
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FQCSR, 0);
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_PQCSR, 0);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index b1c4664542b4..46df79dd5495 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -64,6 +64,7 @@ struct riscv_iommu_device {
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
+void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
