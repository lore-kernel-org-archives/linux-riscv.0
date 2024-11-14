Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8419FD68B35
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KA9hyZDf958L9EBH0pN+kQR3WFWcNTTcHmAPO0uQafI=; b=m8Nk/EWyPmCbSI
	63TuTKpGiosRTCO3hlf9252WUtsozD08YbDgKwvm4yC/7l9mJ/IlVC0IDuGwhVpZQwS52Wp+KP2js
	ZZ3IOccMCrPlFnQnZKCDTQS2sAfPm21X/v+4+oZ/5gVJzofSibW9HX3uO6dCDs9uTE9k4rorO363B
	ltj4awN6rgfYapaAXUmTFwvX3VhQ0TWBWYH9iAuJX0fvaxQgGc4cocijHwtxueGSzdBegVlcCnQsS
	bgEmsrkGbp2GmK2Km0D+oOvcZTNjqDHUP6xsPyaC+zWXzONxfMkJM6QwchnQklkA5poHLYR2xWvj0
	Embmfz5sbm3WY1V4gSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYe-0000000050s-3f5M;
	Thu, 14 Nov 2024 16:19:00 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcYb-000000004tW-1cA8
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 16:18:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-431688d5127so7063515e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Nov 2024 08:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1731601135; x=1732205935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp1usq1fK4gxtiGD08iHEFdZ4WeofRrQEoktS1P9VL0=;
        b=kJhGkDh63f/4V/GHS2n5Z2RE/oB8jZMqsDaQKP8vlGDPh18gKATPyCeWj0jPOMBKTg
         vFUzXgRbmenW05YtP4UP49AkzSOOQjE+fVLnM3hCT8KsG7Eyd8PQKB95dCTEQIBuOyaR
         Gp+oHk6iFc1iKHnx9GqSmrh0sV4yWey9WlLFKbXxEbR+ZkunMVLAHZE0EJ6f+xmqDXOK
         /kt1jXVnAd4nUsv2GQV75vOsBDvASW4GdRKDjnk8kQM0K78TzFbf1yI1p/CpwrgI3RHF
         pmjPZFZPisVBLhu2QstJLzsLaLr10QqLhPL6M9pDo7JPovv06JY9prfQ45QSJKB1Yn/M
         6MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731601135; x=1732205935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp1usq1fK4gxtiGD08iHEFdZ4WeofRrQEoktS1P9VL0=;
        b=HkjEGGHRqAAKHrMfPDzgqfMufhrTuytcduwILDpu6L+jWr/hgbE1b9u9UwRyM0MAiF
         O/uGHANWxb/vhTjrdw9HgQA1lYho7CeK6rxH1BxFgCBgcXtqCO2Maeq2GMEb493e+oc9
         Hp4J2SE060EQGenMqirxUpMWjzl+1grjLccMKF1Id4p93JIfVEPmIARBlZWUl40OVhYf
         DCynBl/TmkDewZsUNorX50YdrxsLqDF1jCWPsNXk/RSaJeW+GKn6FB06lmNYIM9fleUD
         L3X8ivvOwl+jM7uVeCBJBRd9BDJYbHrbQflwbf2zuYc9d2qSPZTmy3tag2qgDrGtbT8v
         FxUw==
X-Forwarded-Encrypted: i=1; AJvYcCVgp+4P0zr7dBostR67IzGDoeHHoGzt27kbxdLAx9hal2Wbk81I31B4h1gYSAZWmC/t4RFS/ywkgHQBqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLxWZVl3YO1xU/u2MzVeGWA21Dl1+3eucfOisk+RnNNZzZOwpD
	uYG9e2sE7I27+Ib0SGgQpdZWKpBFMGfZoGRPo+AY5575VQmGF8wS3IbDIOs32EbvZF+csokHbpQ
	+qR4=
X-Google-Smtp-Source: AGHT+IFyYvgOotPy1xBLjJZdRQpK5gbKBNQ63i5f7cylok3AbHGEDqsRn2z3h347XR748S8k1vlXxg==
X-Received: by 2002:a05:600c:3ca4:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-432b751839dmr220940445e9.25.1731601135291;
        Thu, 14 Nov 2024 08:18:55 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fc8esm29713515e9.21.2024.11.14.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:18:54 -0800 (PST)
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
Subject: [RFC PATCH 06/15] iommu/riscv: support GSCID and GVMA invalidation command
Date: Thu, 14 Nov 2024 17:18:51 +0100
Message-ID: <20241114161845.502027-23-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081857_442191_3E0442EB 
X-CRM114-Status: GOOD (  16.00  )
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

From: Zong Li <zong.li@sifive.com>

This patch adds a ID Allocator for GSCID and a wrap for setting up
GSCID in IOTLB invalidation command.

Set up iohgatp to enable second stage table and flush stage-2 table if
the GSCID is set.

The GSCID of domain should be freed when release domain. GSCID will be
allocated for parent domain in nested IOMMU process.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-bits.h |  7 +++++++
 drivers/iommu/riscv/iommu.c      | 32 ++++++++++++++++++++++++++------
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 98daf0e1a306..d72b982cf9bf 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -715,6 +715,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
 	cmd->dword1 = 0;
 }
 
+static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
+{
+	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
+		      FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
+	cmd->dword1 = 0;
+}
+
 static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
 						  u64 addr)
 {
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 9d7945dc3c24..ef38a1bb3eca 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -45,6 +45,10 @@
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
 
+/* IOMMU GSCID allocation namespace. */
+static DEFINE_IDA(riscv_iommu_gscids);
+#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
+
 /* Device resource-managed allocations */
 struct riscv_iommu_devres {
 	void *addr;
@@ -801,6 +805,7 @@ struct riscv_iommu_domain {
 	struct list_head bonds;
 	spinlock_t lock;		/* protect bonds list updates. */
 	int pscid;
+	int gscid;
 	bool amo_enabled;
 	int numa_node;
 	unsigned int pgd_mode;
@@ -954,15 +959,20 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 
 		/*
 		 * IOTLB invalidation request can be safely omitted if already sent
-		 * to the IOMMU for the same PSCID, and with domain->bonds list
+		 * to the IOMMU for the same PSCID/GSCID, and with domain->bonds list
 		 * arranged based on the device's IOMMU, it's sufficient to check
 		 * last device the invalidation was sent to.
 		 */
 		if (iommu == prev)
 			continue;
 
-		riscv_iommu_cmd_inval_vma(&cmd);
-		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+		if (domain->gscid) {
+			riscv_iommu_cmd_inval_gvma(&cmd);
+			riscv_iommu_cmd_inval_set_gscid(&cmd, domain->gscid);
+		} else {
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+		}
 		if (len && len < RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
 			for (iova = start; iova < end; iova += PAGE_SIZE) {
 				riscv_iommu_cmd_inval_set_addr(&cmd, iova);
@@ -1039,6 +1049,7 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 
 		WRITE_ONCE(dc->fsc, new_dc->fsc);
 		WRITE_ONCE(dc->ta, new_dc->ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->iohgatp, new_dc->iohgatp);
 		/* Update device context, write TC.V as the last step. */
 		dma_wmb();
 		WRITE_ONCE(dc->tc, tc);
@@ -1287,8 +1298,10 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
-	if ((int)domain->pscid > 0)
+	if (domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
+	if (domain->gscid > 0)
+		ida_free(&riscv_iommu_gscids, domain->gscid);
 
 	riscv_iommu_pte_free(domain, _io_pte_entry(pfn, _PAGE_TABLE), NULL);
 	kfree(domain);
@@ -1320,8 +1333,15 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
 		return -ENODEV;
 
-	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
-		 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
+	if (domain->gscid) {
+		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, domain->pgd_mode) |
+			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
+			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, virt_to_pfn(domain->pgd_root));
+	} else {
+		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
+			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
+	}
+
 	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 			   RISCV_IOMMU_PC_TA_V;
 
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
