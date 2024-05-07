Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA625C25B74
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdYN0Tv4eiHTZPcJBuwT6H+zEbdy/CJKLza8PVrzmok=; b=Bbm9v5p9X8BqKO
	o4jrcQsG57HMurgMUd7EA5FwudoxrTz5FtmK3bZK/Fdq+eFBO21aI3pu6kLpoyKK1AzZzi9xlR9z5
	y2cavmv1/Q69Zy5MVyp6gbzq+vlic2YSBgGBJdwjcdzfKLVbQdpSSdShwstdMyNwqVZSdgWDK/iKg
	QVmPmXurW3PusVYcBdE0uTNtkdvBeOrIrsEEHMAUqIqnLH7VMW5NKZgevdTj3iFVBepH3qkHGrtmr
	oCvHJqw+4Lp1hv+ZeA9Do4R0WoXZ2mMWJw5vBWZlCZGMwXP69ahMEW1rQnki6WeBAGzJ2ul1mUy3d
	uGKCrYedEWqA/Qig+Kmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lls-0000000BU2f-0xcq;
	Tue, 07 May 2024 14:26:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lln-0000000BTya-2KT3
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 14:26:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f4178aec15so2738232b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 May 2024 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715091974; x=1715696774; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5Yiv5A35fqkZLewYyNasBxNRcaYrtDBJ52Nob0v8A4=;
        b=I6lnfKvW+IAwaZEkZHN08rW+/Go71BDSe0fjP4AzD54pMkGC/iT1TRgTAv6nfKwrHt
         DiWmw4Bwm0jYGjJ6wUybp9asla2OsBuRfF1udSwvZI6KIiWcI8PoMhbYIYBR0cpG+CmV
         t7/3izadW+ntoyiLJw2z6pmWaFJjQ+uqrp/GW/rlpXkIOp/eS6N7VGYDtg0DCjFM7I4R
         IuQB3atKmh8b/YGA4O2tOvf4fkq6ENQ+N36Tnj54ljuAWZUb5SdSrVZRJ9NmZvbfhYSF
         MLVcSd/h8r8LbrrLbiIrJLAEcen2ckba723rcNOEE9ZvGJFjcd9DQT3PgypZuMJm5xDW
         Cfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715091974; x=1715696774;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5Yiv5A35fqkZLewYyNasBxNRcaYrtDBJ52Nob0v8A4=;
        b=sGxwTxZWAP97j6FfcOYl4hlBVWiYA+bIWuXsx0z15dz0v/ikmylgVBfLovYGYpSJtj
         4KlphZR+6I2vJ/Cz9pY0yB2CrumM2cx8kr8ebvjTPkxD/f4p3d88fKvlPn8FI968+Bk8
         QvZZxjUipQOvMmTm4emjxVVg0l69Q+oZE4uiukLInUPpO5x1dur/NyZdyivdCDYnUPh8
         aCbUheyrTh3Pd6tz3kyw/wtaldLOWdK/dlKWYxLuUufzkZAXsWm6sSTRj/831/7/wvFO
         rlqQBFg2drLwerLog/4u0MC+ZctR0r2BcVV6WoJ//ZU6YB6JpkhdyOCBdoUsiKU392df
         YHQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKMf5xktlDm1XF6D5oaOqjyS2ZwdK89CHZEQ24QXzYSPYaDrq0dpUkAyCC7KvM9ECq7Vje1JNL5XaiXHYn9/zcjrpvh5JYZLXm04NQ8JFn
X-Gm-Message-State: AOJu0Yzr6OdUs7dqGBG87YQeRF2Phq/2Wv2aQoZyYdulHb2I9FpcT8aO
	gDsk+jqGW6n0eyoH0qgt/xobIRzRMfcmyflZ2b6p61+/QIQ5r1fKUblrv8Qa4B4=
X-Google-Smtp-Source: AGHT+IHdg7+7I4bSI4CruHY7MHG+tPkBhVw4YY0PCUXdy/YjCBHjgssv5B+jlzNMBIZ1jyV/U90aVQ==
X-Received: by 2002:a05:6a00:4f82:b0:6ed:21b2:cb17 with SMTP id ld2-20020a056a004f8200b006ed21b2cb17mr14575610pfb.4.1715091972855;
        Tue, 07 May 2024 07:26:12 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i22-20020aa79096000000b006f44bcbe7e3sm7687554pfa.201.2024.05.07.07.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 07:26:12 -0700 (PDT)
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
Subject: [PATCH RFC RESEND 3/6] iommu/riscv: support GSCID
Date: Tue,  7 May 2024 22:25:57 +0800
Message-Id: <20240507142600.23844-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507142600.23844-1-zong.li@sifive.com>
References: <20240507142600.23844-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072615_700739_5CDC2D61 
X-CRM114-Status: GOOD (  19.70  )
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

This patch adds a global ID Allocator for GSCID and a wrap for setting
up GSCID in IOTLB invalidation command.

Set up iohgatp to enable second stage table and flus stage-2 table if
the GSCID is allocated.

The GSCID of domain should be freed when release domain. GSCID will be
allocated for parent domain in nested IOMMU process.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 drivers/iommu/riscv/iommu-bits.h |  7 +++
 drivers/iommu/riscv/iommu.c      | 81 ++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 11351cf6c710..62b1ee387357 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -728,6 +728,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
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
index e0bf74a9c64d..d38e09b138b6 100644
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
@@ -826,6 +830,7 @@ struct riscv_iommu_domain {
 	struct list_head bonds;
 	spinlock_t lock;		/* protect bonds list updates. */
 	int pscid;
+	int gscid;
 	int numa_node;
 	int amo_enabled:1;
 	unsigned int pgd_mode;
@@ -919,29 +924,43 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 	rcu_read_lock();
 
 	prev = NULL;
-	list_for_each_entry_rcu(bond, &domain->bonds, list) {
-		iommu = dev_to_iommu(bond->dev);
 
-		/*
-		 * IOTLB invalidation request can be safely omitted if already sent
-		 * to the IOMMU for the same PSCID, and with domain->bonds list
-		 * arranged based on the device's IOMMU, it's sufficient to check
-		 * last device the invalidation was sent to.
-		 */
-		if (iommu == prev)
-			continue;
-
-		riscv_iommu_cmd_inval_vma(&cmd);
-		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
-		if (len && len >= RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
-			for (iova = start; iova < end; iova += PAGE_SIZE) {
-				riscv_iommu_cmd_inval_set_addr(&cmd, iova);
+	/*
+	 * Host domain needs to flush entries in stage-2 for MSI mapping.
+	 * However, device is bound to s1 domain instead of s2 domain.
+	 * We need to flush mapping without looping devices of s2 domain
+	 */
+	if (domain->gscid) {
+		riscv_iommu_cmd_inval_gvma(&cmd);
+		riscv_iommu_cmd_inval_set_gscid(&cmd, domain->gscid);
+		riscv_iommu_cmd_send(iommu, &cmd, 0);
+		riscv_iommu_cmd_iofence(&cmd);
+		riscv_iommu_cmd_send(iommu, &cmd, RISCV_IOMMU_QUEUE_TIMEOUT);
+	} else {
+		list_for_each_entry_rcu(bond, &domain->bonds, list) {
+			iommu = dev_to_iommu(bond->dev);
+
+			/*
+			 * IOTLB invalidation request can be safely omitted if already sent
+			 * to the IOMMU for the same PSCID, and with domain->bonds list
+			 * arranged based on the device's IOMMU, it's sufficient to check
+			 * last device the invalidation was sent to.
+			 */
+			if (iommu == prev)
+				continue;
+
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+			if (len && len >= RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
+				for (iova = start; iova < end; iova += PAGE_SIZE) {
+					riscv_iommu_cmd_inval_set_addr(&cmd, iova);
+					riscv_iommu_cmd_send(iommu, &cmd, 0);
+				}
+			} else {
 				riscv_iommu_cmd_send(iommu, &cmd, 0);
 			}
-		} else {
-			riscv_iommu_cmd_send(iommu, &cmd, 0);
+			prev = iommu;
 		}
-		prev = iommu;
 	}
 
 	prev = NULL;
@@ -972,7 +991,7 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
  * interim translation faults.
  */
 static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, u64 fsc, u64 ta)
+				     struct device *dev, u64 fsc, u64 ta, u64 iohgatp)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_dc *dc;
@@ -1012,6 +1031,7 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 		/* Update device context, write TC.V as the last step. */
 		WRITE_ONCE(dc->fsc, fsc);
 		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
+		WRITE_ONCE(dc->iohgatp, iohgatp);
 		WRITE_ONCE(dc->tc, tc);
 	}
 }
@@ -1271,6 +1291,9 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 	if ((int)domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
 
+	if ((int)domain->gscid > 0)
+		ida_free(&riscv_iommu_gscids, domain->gscid);
+
 	riscv_iommu_pte_free(domain, _io_pte_entry(pfn, _PAGE_TABLE), NULL);
 	kfree(domain);
 }
@@ -1296,7 +1319,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
-	u64 fsc, ta;
+	u64 fsc = 0, iohgatp = 0, ta;
 
 	if (!riscv_iommu_pt_supported(iommu, domain->pgd_mode))
 		return -ENODEV;
@@ -1314,12 +1337,18 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	 */
 	riscv_iommu_iotlb_inval(domain, 0, ULONG_MAX);
 
-	fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
-	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
+	if (domain->gscid)
+		iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, domain->pgd_mode) |
+			  FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
+			  FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, virt_to_pfn(domain->pgd_root));
+	else
+		fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, domain->pgd_mode) |
+		      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, virt_to_pfn(domain->pgd_root));
+
 	ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
 	     RISCV_IOMMU_PC_TA_V;
 
-	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
+	riscv_iommu_iodir_update(iommu, dev, fsc, ta, iohgatp);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 
@@ -1422,7 +1451,7 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
+	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0, 0);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
@@ -1442,7 +1471,7 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
-	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
+	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V, 0);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
