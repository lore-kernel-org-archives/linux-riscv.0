Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F24C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 19:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOYJB7aEM/QJl26jiwNSAYBj+KuVa7w6qqTgueqLEm8=; b=e9dzWCePuDh/Bk
	7DwsM//7frZCloyd47iL+CUwb/Qa+jGeaQCVrUXkJfik2UiHTN+ANd6sobc9Y8givoX+qZssUKtRb
	GVxoEpl58a7OFTgdFI2AeylTgaKMpfNsIzVCU5ew4NN6B0OkrMIbzEaM6xWHEv5UMf4c8I7T71AJG
	X4dyjRfeyxms2CQQn89OrqAsLJpCXgVZt1o+chOdu2GzEr93khtfdC5gkJolmoIOCYNQJfz89dam6
	eAU+goOFz6Kc4sH2MKhpEQ4BycydjakDaRzCs9gN1ls9py2I3r/TzHl2PoDndGceXTgAhLGPjF/C5
	rFH9oClyJjPehMXfK0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwg-008hGQ-0h;
	Wed, 19 Jul 2023 19:34:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwX-008h9O-1t
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 19:34:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-263121cd04eso4016127a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 12:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689795276; x=1690400076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUXvXbLuP8wDy1OSCml3bGjGEs0jCX+1NqTNk6KKpl8=;
        b=yJG+r2hMaEM+aliN8AVg0otRKaB4Z8eB26rded4dmVlMEf7QPzs7oXMfpQmJMKL++k
         pDvxPqx/ZqxGapQ8WSH3D2kxHKnBm3x9Q5Nio4OahuUSf/B/GgPdLMDrg7z5Sq1B3ikz
         UeH/z3vVIqFc2rMrJ9TpbVfnlAuwcYXAo6tCGKDkTZV8bY/H0jQvKdPnhjLxXacZpTy/
         iW900N9T4LgH9r16t39SqEYpRVL8dfRWtJHsro1fR6D0IcienUrOo4o6hxfggu3gqr6G
         4XvpBJFV2BHbmMGsUPaauELDeBsOihKwyQFkYQ1vNuTpXydFhJ5707WI9dxod6GTdPZl
         oKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795276; x=1690400076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUXvXbLuP8wDy1OSCml3bGjGEs0jCX+1NqTNk6KKpl8=;
        b=DdN1OxMVQ8tKocCxNw0Ud/hGwp4q4gVREY2wcy7z4Qw6Zqc3ujkJxBW6Ih6C/LHlc4
         TgOLIjVskhCsX9+/o35tjKQkTKAeOjK//skGsYzpQX+mnHEP/+t/PMS0hTuUtqjKK1/o
         qLqn9JbaKx6gAcKi78BqeU5/sYdp9nDQXQNnZEyG6yTG/KDujQyTNMnH6L4gtlsJ93as
         TSGFHJOfSVo8w1xQ0tg9YmxKJHAlEnvBJhkF+jvegDHX8Da2IFbOI+Msgbzefo5xlmi0
         ydgceueMgxsAduAwXwsAwxq3Z+jRGuaillj1DCtpTxRWlTF5Fl4bGQxF+LB2cMWfG/lf
         Jfyw==
X-Gm-Message-State: ABy/qLZbUI7qtGHAK/9U8ud/v+rEWXRSK0ecKLv7ePaRAmLj/mTl7CLX
	3QKr1C4C8hXOhKP6ZCFIlg1FXw==
X-Google-Smtp-Source: APBJJlGbDD5aTGEi40JcY4RNgasjfgy48ieoko/t1uTH9H4BvKdLkbsHdSPwZCOuiw6bztkQOdloJA==
X-Received: by 2002:a17:90a:aa04:b0:263:f776:8ba3 with SMTP id k4-20020a17090aaa0400b00263f7768ba3mr197600pjq.9.1689795276298;
        Wed, 19 Jul 2023 12:34:36 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b00264040322desm1591053pje.40.2023.07.19.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:34:35 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 10/11] RISC-V: drivers/iommu/riscv: Add MSI identity remapping
Date: Wed, 19 Jul 2023 12:33:54 -0700
Message-Id: <660b7a8707e494a6bb2706e10569a7414c3640a7.1689792825.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689792825.git.tjeznach@rivosinc.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123437_649505_B1606EC5 
X-CRM114-Status: GOOD (  18.76  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This change provides basic identity mapping support to
excercise MSI_FLAT hardware capability.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 81 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.h |  3 ++
 2 files changed, 84 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 6042c35be3ca..7b3e3e135cf6 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -61,6 +61,9 @@ MODULE_PARM_DESC(priq_length, "Page request interface queue length.");
 #define RISCV_IOMMU_MAX_PSCID	(1U << 20)
 static DEFINE_IDA(riscv_iommu_pscids);
 
+/* TODO: Enable MSI remapping */
+#define RISCV_IMSIC_BASE	0x28000000
+
 /* 1 second */
 #define RISCV_IOMMU_TIMEOUT	riscv_timebase
 
@@ -932,6 +935,72 @@ static irqreturn_t riscv_iommu_priq_process(int irq, void *data)
  * Endpoint management
  */
 
+static int riscv_iommu_enable_ir(struct riscv_iommu_endpoint *ep)
+{
+	struct riscv_iommu_device *iommu = ep->iommu;
+	struct iommu_resv_region *entry;
+	struct irq_domain *msi_domain;
+	u64 val;
+	int i;
+
+	/* Initialize MSI remapping */
+	if (!ep->dc || !(iommu->cap & RISCV_IOMMU_CAP_MSI_FLAT))
+		return 0;
+
+	ep->msi_root = (struct riscv_iommu_msi_pte *)get_zeroed_page(GFP_KERNEL);
+	if (!ep->msi_root)
+		return -ENOMEM;
+
+	for (i = 0; i < 256; i++) {
+		ep->msi_root[i].pte = RISCV_IOMMU_MSI_PTE_V |
+		    FIELD_PREP(RISCV_IOMMU_MSI_PTE_M, 3) |
+		    phys_to_ppn(RISCV_IMSIC_BASE + i * PAGE_SIZE);
+	}
+
+	entry = iommu_alloc_resv_region(RISCV_IMSIC_BASE, PAGE_SIZE * 256, 0,
+					IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	if (entry)
+		list_add_tail(&entry->list, &ep->regions);
+
+	val = virt_to_pfn(ep->msi_root) |
+	    FIELD_PREP(RISCV_IOMMU_DC_MSIPTP_MODE, RISCV_IOMMU_DC_MSIPTP_MODE_FLAT);
+	ep->dc->msiptp = cpu_to_le64(val);
+
+	/* Single page of MSIPTP, 256 IMSIC files */
+	ep->dc->msi_addr_mask = cpu_to_le64(255);
+	ep->dc->msi_addr_pattern = cpu_to_le64(RISCV_IMSIC_BASE >> 12);
+	wmb();
+
+	/* set msi domain for the device as isolated. hack. */
+	msi_domain = dev_get_msi_domain(ep->dev);
+	if (msi_domain) {
+		msi_domain->flags |= IRQ_DOMAIN_FLAG_ISOLATED_MSI;
+	}
+
+	dev_dbg(ep->dev, "RV-IR enabled\n");
+
+	ep->ir_enabled = true;
+
+	return 0;
+}
+
+static void riscv_iommu_disable_ir(struct riscv_iommu_endpoint *ep)
+{
+	if (!ep->ir_enabled)
+		return;
+
+	ep->dc->msi_addr_pattern = 0ULL;
+	ep->dc->msi_addr_mask = 0ULL;
+	ep->dc->msiptp = 0ULL;
+	wmb();
+
+	dev_dbg(ep->dev, "RV-IR disabled\n");
+
+	free_pages((unsigned long)ep->msi_root, 0);
+	ep->msi_root = NULL;
+	ep->ir_enabled = false;
+}
+
 /* Endpoint features/capabilities */
 static void riscv_iommu_disable_ep(struct riscv_iommu_endpoint *ep)
 {
@@ -1226,6 +1295,7 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 
 	mutex_init(&ep->lock);
 	INIT_LIST_HEAD(&ep->domain);
+	INIT_LIST_HEAD(&ep->regions);
 
 	if (dev_is_pci(dev)) {
 		ep->devid = pci_dev_id(to_pci_dev(dev));
@@ -1248,6 +1318,7 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	dev_iommu_priv_set(dev, ep);
 	riscv_iommu_add_device(iommu, dev);
 	riscv_iommu_enable_ep(ep);
+	riscv_iommu_enable_ir(ep);
 
 	return &iommu->iommu;
 }
@@ -1279,6 +1350,7 @@ static void riscv_iommu_release_device(struct device *dev)
 		riscv_iommu_iodir_inv_devid(iommu, ep->devid);
 	}
 
+	riscv_iommu_disable_ir(ep);
 	riscv_iommu_disable_ep(ep);
 
 	/* Remove endpoint from IOMMU tracking structures */
@@ -1301,6 +1373,15 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 
 static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
 {
+	struct iommu_resv_region *entry, *new_entry;
+	struct riscv_iommu_endpoint *ep = dev_iommu_priv_get(dev);
+
+	list_for_each_entry(entry, &ep->regions, list) {
+		new_entry = kmemdup(entry, sizeof(*entry), GFP_KERNEL);
+		if (new_entry)
+			list_add_tail(&new_entry->list, head);
+	}
+
 	iommu_dma_get_resv_regions(dev, head);
 }
 
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 83e8d00fd0f8..55418a1144fb 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -117,14 +117,17 @@ struct riscv_iommu_endpoint {
 	struct riscv_iommu_dc *dc;		/* device context pointer */
 	struct riscv_iommu_pc *pc;		/* process context root, valid if pasid_enabled is true */
 	struct riscv_iommu_device *iommu;	/* parent iommu device */
+	struct riscv_iommu_msi_pte *msi_root;	/* interrupt re-mapping */
 
 	struct mutex lock;
 	struct list_head domain;		/* endpoint attached managed domain */
+	struct list_head regions;		/* reserved regions, interrupt remapping window */
 
 	/* end point info bits */
 	unsigned pasid_bits;
 	unsigned pasid_feat;
 	bool pasid_enabled;
+	bool ir_enabled;
 };
 
 /* Helper functions and macros */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
