Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E219AE7718F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 09:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8IKBVrOOZYQmQfyKaY0qQIvC9U/3/Dy8Y+hqEgq8oA=; b=tjDVTCkMCTyzrm
	RyggxaQ0LxO6oQPQeVRRfc/2Ycu6ozOjw4U60mJaERXS3aE8XcWPwgKlV6K41Af5dp84u94NxHRMI
	kxC9LuTBwPlGXI6Idlpc7d7c12d5HTDVAtcIn/wdG0OBBo6lSiOXdN8TmnZLwsW0PuT7BvXxsSRZ0
	EMHZnButnQSVUtcEh13bJc87nD8MLTqbCny8bldS7rtTbR29nxYp7GkG8DmGKnCGHcJFHTNZbUsZY
	34Bzicw9qWDHpwylpt9wYD3zLLfBDywr8kje9XMbjbGTzHwCark5bP61ZWEtzQF4UXc//4FGspmr6
	+eQ4pFHqignl5Kih/o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2n-0000000CckL-3SzK;
	Fri, 03 Jan 2025 09:32:37 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTe2l-0000000Ccj9-1LjM
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 09:32:36 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2166651f752so194283645ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735896754; x=1736501554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yc21+WdKHK3grlhMkYoFV2YGOVlkOtA7hk0YotJEPa8=;
        b=VESwixuZYR9pEj2VKZYItu/sKrpTakcLvXknB69bkfeHHl3p+1JTibKGdreZIN4SUf
         NpFj7ARl5wSkf2CFmCcomZBFjdBKcDJKngcYH+1Habzk2lRUcO5kcv33b2adyFY9U1ld
         zhY+irRGl+nIKfz3rKsNEeartviEaAx+fMrgsRuK7XiyN5A0Fo/iBsJ9qGf6tHFFIaWC
         L52R4quJDXGrPyqoYIOWkVhChJmlEl07em0wxuTAQuBYHPbGwTghitToq4pXG9E+uDJW
         gO7Sdo48onnwsvYtyWaI1QnCjdFymRWGnbefmsnUZR4nOWG+2sTvzZrKflcFMv/oyF4Z
         AJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896754; x=1736501554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yc21+WdKHK3grlhMkYoFV2YGOVlkOtA7hk0YotJEPa8=;
        b=AgItO5BtLztzydtPUCsMa45WpSbkKPMgN9gn0OLP0YlmaqWrgEy0cRNcIczY+jouz6
         DzoxysC5bKLa+hBay8mbH/iEn4KqO3GlOK4YOYfak4hgJKewyxNGb3RpbbBLLcOggete
         6HjtB7hDiE4JMofVnyAMREFElS+f9B1c9cg4k2gxI6A/gzbqNXYvWVfnDEfo+ytZayU9
         9MU2TuIPvkuMdtSHz+I+HhOrBm+KUSbqvigRqxioQadP9j/sgcfwhKcbLkR0GDntE0VK
         OxtoZah2J7ct+x2/B7UyOd9BpCP8w6gK0smp8TCb61ZIKiS/7JimcUrWyu58bCp6qEnO
         VUYw==
X-Forwarded-Encrypted: i=1; AJvYcCX8URUgAdxl1/GDflAWOnVzBVw1J8B2qJtxl1CSB4DpEApZ4rLr4kk6ZxVUPDHjGVVZdfbgiVCiOQzbcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziY0oNrtG8zTq2Sa687whWHgFbCnk+L5zPIrVWLmhzJO84VRmp
	4zFmBelkmNAEsjnzdbcPcdw9S9/ukNHU5Yx0NH+U6TyL+Q3uj/fRCzmpzylMKs4=
X-Gm-Gg: ASbGncsGoBEHVL41tDJhVCDNr4KZrarqbdhbPRcGdj2mIa9j4UZpYMgHmvX9IazhRez
	8MVw6B44UwlhHf+lbw/ksuCbVR/VYwmCyuZM7P7fyWiQp5282tWtQw3buyLicu+ev89xz5oKANz
	P6/KfD1BWU5u4KEGD9zHZLVsWlM8GAQ4uVYhFO3snOgU8JSJP+7n32UfyS9Ta5YDNIkdXWWZep5
	f3QgVEjZKgKAf9MYFJ9ZZB1FgrVScI2Vld3RzlZI1gt3hk1fm91o/KbP27vQYr5mThy5fgKoYw5
	ynpsyC9ZXmG8s4oHumxIdOxistZhn0lRSAZDS7Y=
X-Google-Smtp-Source: AGHT+IHU+UwYIa1+lGh0eizBZY5fnuQHt83z1liw3I1NBL2QnUe92EbAa77SFkBIPk0s+08dLn1S/A==
X-Received: by 2002:a17:902:cec5:b0:219:d28a:ca23 with SMTP id d9443c01a7336-219e6f1484emr625056355ad.36.1735896754656;
        Fri, 03 Jan 2025 01:32:34 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4a2csm242227395ad.175.2025.01.03.01.32.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 01:32:34 -0800 (PST)
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
Subject: [PATCH RESEND 2/2] iommu/riscv: Add shutdown function for iommu driver
Date: Fri,  3 Jan 2025 17:32:20 +0800
Message-Id: <20250103093220.38106-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250103093220.38106-1-luxu.kernel@bytedance.com>
References: <20250103093220.38106-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_013235_359171_1FAAE51C 
X-CRM114-Status: GOOD (  12.92  )
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

This commit supplies shutdown callback for iommu driver. The shutdown
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
