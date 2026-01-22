Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24EFD3EE6B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LaISwt3oY9X9R1u8UeEC97t0Chg2aaBNIrU1qx5rLTo=; b=1k25XmKn++v6Dt
	5F5JNBCDrZce6kf0QNoeiIqAnlwMUf+M4bvI6MMvWsb9llEd2y7iSJEJmwtDjCagQUc+gDzsOpBbK
	fiTeKfJBTdcj4d9y6b16BCxOZOYJklJ/qMX2BeZMvgDHcGaEFazIUiAjJocuZvGtmwTCvWtkpWXR5
	ip5CDwMB2dVpJt3ob2PfBq9oWfki/Jcn+g0ABwjQ45CIz4n7Ji09q61pbcthD7//qyC0z/u/piP/n
	gz6wDn48QOberA6X4XK50vN1p9aJ+3UhYKm/3dkN6yazjObD0CfK7TXDqh5BhSm3Z9V4WGkA037UP
	p51l2smpMm8bBAc/cOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivjv-00000007F63-1Ofs;
	Thu, 22 Jan 2026 14:32:51 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivjo-00000007F53-1FJZ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 14:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769092352; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Z0T0NHnnLOBXCB1Q9RaOjVenK8UxFN8ICt7x482Hlzk=;
	b=bSaW7WNKKGPW9wt6OyuuShqFHNBVTdc0ReDV3QaBUkuoA/joYnDTRJvEYfIGWNSBcPu+eLULNhwU6HVJXQkRG8Z2KLr0RI/c73rx4ldeGflYh+i3bD5HpYccac1wwwQmLFoKz2v5u5JEs9IyPs1/S9a/r5rlQ0fdAOZs9WKz1h8=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wxcfz.h_1769092350 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 22:32:32 +0800
From: fangyu.yu@linux.alibaba.com
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
Date: Thu, 22 Jan 2026 22:32:24 +0800
Message-Id: <20260122143224.25146-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_063247_942096_24B0E411 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Add riscv_iommu_iodir_iotinval() to perform required TLB and context cache
invalidations after updating DDT or PDT entries, as mandated by the RISC-V
IOMMU specification (Section 6.3.1 and 6.3.2).

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

---
    Changes in v2:
    - Reworked the patch formatting (per Drew).
    - Fixed the call site of riscv_iommu_iodir_iotinval() (per Drew).
    - Moved riscv_iommu_cmd_inval_vma() out of the conditional blocks to avoid
      duplication (per Guoren).
    - Dropped the #if 0-guarded code (per Guoren).
    - Updated the Fixes: tag (per Drew).
    - Link to v1:
      https://lore.kernel.org/linux-riscv/20260108134855.91341-1-fangyu.yu@linux.alibaba.com/
---
 drivers/iommu/riscv/iommu.c | 70 +++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d9429097a2b5..c762b4f335d1 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -996,7 +996,67 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 }
 
 #define RISCV_IOMMU_FSC_BARE 0
+/*
+ * This function sends IOTINVAL commands as required by the RISC-V
+ * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
+ * after modifying DDT or PDT entries
+ */
+static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
+				       bool inval_pdt, unsigned long iohgatp,
+				       struct riscv_iommu_dc *dc,
+				       struct riscv_iommu_pc *pc)
+{
+	struct riscv_iommu_command cmd;
+
+	riscv_iommu_cmd_inval_vma(&cmd);
 
+	if (FIELD_GET(RISCV_IOMMU_DC_IOHGATP_MODE, iohgatp) ==
+	    RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
+		if (inval_pdt) {
+			/*
+			 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
+			 * PSCID=PC.PSCID
+			 */
+			riscv_iommu_cmd_inval_set_pscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
+		} else {
+			if (!FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) &&
+			    FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) !=
+			    RISCV_IOMMU_DC_FSC_MODE_BARE) {
+				/*
+				 * DC.tc.PDTV == 0 && DC.fsc.MODE != Bare
+				 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
+				 * PSCID=DC.ta.PSCID
+				 */
+				riscv_iommu_cmd_inval_set_pscid(&cmd,
+					FIELD_GET(RISCV_IOMMU_DC_TA_PSCID, dc->ta));
+			}
+			/* else: IOTINVAL.VMA with GV=AV=PSCV=0 */
+		}
+	} else {
+		riscv_iommu_cmd_inval_set_gscid(&cmd,
+			FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
+
+		if (inval_pdt) {
+			/*
+			 * IOTINVAL.VMA with GV=1, AV=0, and PSCV=1, and
+			 * GSCID=DC.iohgatp.GSCID, PSCID=PC.PSCID
+			 */
+			riscv_iommu_cmd_inval_set_pscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
+		}
+		/*
+		 * else: IOTINVAL.VMA with GV=1,AV=PSCV=0,and
+		 * GSCID=DC.iohgatp.GSCID
+		 *
+		 * IOTINVAL.GVMA with GV=1,AV=0,and
+		 * GSCID=DC.iohgatp.GSCID
+		 * TODO: For now, the Second-Stage feature have not yet been merged,
+		 * also issue IOTINVAL.GVMA once second-stage support is merged.
+		 */
+	}
+	riscv_iommu_cmd_send(iommu, &cmd);
+}
 /*
  * Update IODIR for the device.
  *
@@ -1031,6 +1091,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
 		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
 		riscv_iommu_cmd_send(iommu, &cmd);
+		/*
+		 * For now, the SVA and PASID features have not yet been merged, the
+		 * default configuration is inval_pdt=false and pc=NULL.
+		 */
+		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
 		sync_required = true;
 	}
 
@@ -1056,6 +1121,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
 		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
 		riscv_iommu_cmd_send(iommu, &cmd);
+		/*
+		 * For now, the SVA and PASID features have not yet been merged, the
+		 * default configuration is inval_pdt=false and pc=NULL.
+		 */
+		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
 	}
 
 	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
