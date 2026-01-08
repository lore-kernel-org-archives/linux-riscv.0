Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D41AD185F9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y06aB06yBWwWZekVpn73zGbIZ+4ani1LogBIgQbl1ns=; b=ecwWcElRyvGAS0
	jBPqJiQfwxIKJx7DDB536T4WS17SCnVYelXCn0XETagRIUjdZmDZUsJj0/MEe0K4z87IWFXjXHcoV
	ImAK8bxAf5f03hRlVRmMMUIUABnsd7LDDtDUB7qtTGAs/BEEQeb/bieqq7LIcgnZ/ILL3L0RlxK+2
	eMFPv6gLhrSCpa8BjK+5PhbBjwBrxrV+iUsm1E56yXUbhWGr4DXd1CgluCcS5pHJY41IRIRepOKjP
	i0LaYLnTeGHVQfPT6qzh7A9SI5ut3vC0VHclatGYUtiE1HrBH5MAtCFyq0Z5XzYcwFCwZ9XWAx3xj
	PO7g4xHIh3uN+rlCMkDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqO7-0000000HEDw-3R2d;
	Thu, 08 Jan 2026 13:49:19 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqO5-0000000HED6-09aC
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767880148; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=/DggpkpQ+sZ9M+sA9W097wq5BtxSRcjoGTAICDIz5D0=;
	b=jYI/9It0Spiw1oR24j7GK7DQd6sZZjWgo7vcUlIz2RhXOOmEIzBgO1Pg90agdsmijzAdJAccUwOpMTZ0Xj83SJj/TSugJkaT7BjQgCHCYK+NKdBi3yXzSzBpdMhYKWlhzN3atit6hegIkjwqipTBcpO6mprW/q3C/WA0XvtvbfU=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WwcviKM_1767880138 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 08 Jan 2026 21:49:00 +0800
From: fangyu.yu@linux.alibaba.com
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] iommu/riscv: Add IOTINVAL after updating DDT/PDT entries
Date: Thu,  8 Jan 2026 21:48:55 +0800
Message-Id: <20260108134855.91341-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054917_334425_4D965AD0 
X-CRM114-Status: UNSURE (   9.84  )
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

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu.c | 85 +++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d9429097a2b5..2900170133fc 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -996,7 +996,82 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 }
 
 #define RISCV_IOMMU_FSC_BARE 0
+/*
+ * This function sends IOTINVAL commands as required by the RISC-V
+ * IOMMU specification (Section 6.3.1 and 6.3.2 in 1.0 spec version)
+ * after modifying DDT or PDT entries
+ */
+static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
+				    bool inval_pdt, unsigned long iohgatp,
+				    struct riscv_iommu_dc *dc, struct riscv_iommu_pc *pc)
+{
+	struct riscv_iommu_command cmd;
 
+	if (FIELD_GET(RISCV_IOMMU_DC_IOHGATP_MODE, iohgatp) ==
+		RISCV_IOMMU_DC_IOHGATP_MODE_BARE) {
+		if (inval_pdt) {
+			/*
+			 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
+			 * PSCID=PC.PSCID
+			 */
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_pscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
+		} else {
+			if (FIELD_GET(RISCV_IOMMU_DC_TC_PDTV, dc->tc) || (
+				    FIELD_GET(RISCV_IOMMU_DC_FSC_MODE, dc->fsc) ==
+				    RISCV_IOMMU_DC_FSC_MODE_BARE)) {
+				/* IOTINVAL.VMA with GV=AV=PSCV=0 */
+				riscv_iommu_cmd_inval_vma(&cmd);
+			} else {
+				/*
+				 * IOTINVAL.VMA with GV=AV=0, and PSCV=1, and
+				 * PSCID=DC.ta.PSCID
+				 */
+				riscv_iommu_cmd_inval_vma(&cmd);
+				riscv_iommu_cmd_inval_set_pscid(&cmd,
+					FIELD_GET(RISCV_IOMMU_DC_TA_PSCID, dc->ta));
+			}
+		}
+	} else {
+		if (inval_pdt) {
+			/*
+			 * IOTINVAL.VMA with GV=1, AV=0, and PSCV=1, and
+			 * GSCID=DC.iohgatp.GSCID, PSCID=PC.PSCID
+			 */
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_gscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
+			riscv_iommu_cmd_inval_set_pscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_PC_TA_PSCID, pc->ta));
+		} else {
+			/*
+			 * IOTINVAL.VMA with GV=1,AV=PSCV=0,and
+			 * GSCID=DC.iohgatp.GSCID
+			 */
+			riscv_iommu_cmd_inval_vma(&cmd);
+			riscv_iommu_cmd_inval_set_gscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
+
+			/*
+			 * IOTINVAL.GVMA with GV=1,AV=0,and
+			 * GSCID=DC.iohgatp.GSCID
+			 */
+			/*
+			 * For now, the Second-Stage feature have not yet been merged, so
+			 * let's comment out the code first.
+			 */
+#if 0
+			riscv_iommu_cmd_send(iommu, &cmd);
+			memset(&cmd, 0, sizeof(cmd));
+			riscv_iommu_cmd_inval_gvma(&cmd);
+			riscv_iommu_cmd_inval_set_gscid(&cmd,
+				FIELD_GET(RISCV_IOMMU_DC_IOHGATP_GSCID, iohgatp));
+#endif
+		}
+	}
+	riscv_iommu_cmd_send(iommu, &cmd);
+}
 /*
  * Update IODIR for the device.
  *
@@ -1031,6 +1106,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
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
 
@@ -1055,6 +1135,11 @@ static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
 		/* Invalidate device context after update */
 		riscv_iommu_cmd_iodir_inval_ddt(&cmd);
 		riscv_iommu_cmd_iodir_set_did(&cmd, fwspec->ids[i]);
+		/*
+		 * For now, the SVA and PASID features have not yet been merged, the
+		 * default configuration is inval_pdt=false and pc=NULL.
+		 */
+		riscv_iommu_iodir_iotinval(iommu, false, dc->iohgatp, dc, NULL);
 		riscv_iommu_cmd_send(iommu, &cmd);
 	}
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
