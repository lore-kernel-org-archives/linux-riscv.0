Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A1C5DF87
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQfBdVM+S1xHNPSbzZa1YTGYg0Q/QgwiMd2UreAtAhQ=; b=l+lAnnOtn7451N
	vbX+t6a+oCGx1bEJr3BhtfoKZQ3fhpx7TT9kmGc0MSBocLwBtkNMNMofhQB/8PSSERHeFfQzx28L7
	7YJ6hvxmrufO2Fa1R7Br/yiYpQZvp0w7SFhHtx+3ciQjQ+2ebisDYfZZGuGTAQuJu9JX8maiUHbE3
	p58FE5g0bPrQcrpIEjfi7pwzLjPwCyXeEvXEe+oRUkac6gkg/QwMJhT0tvc9lcnpN+PhDjMcEV+na
	yhBI5n9y4hWrOKX57WF0d4MWhqKXIZ/ZV5jKnixFkRp4Z9089lskvG59qufV5up7MPWxNNEYr5TKY
	xfm02VuwfTcCQix4tGng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPI5-0000000DPCN-2MGD;
	Fri, 21 Aug 2026 13:28:13 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPHy-0000000DP5B-3y0j
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787318878; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=t/Isbm0dxTe2xO/qbNDLssm8i0nZnyxuZBSaKRQR90M=;
	b=VW0RSu1PQIHFJ3NIIlxep7MWJRra2CRwHaQGhLE6wGXSviUedhYo6Uek+5q2qtJRrIUJRgNDOd1zK2yVJRetiTbB+Tv/2IJQrMmWmu6z45ahMpsbzjCGehJ2WcG96V4mWZ9aFOXADh7pJiLvNshXWVkJquU09Ky4W5SbcYUA+CI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X9MSFFf_1787318875;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9MSFFf_1787318875 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 21:27:56 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 01/10] iommupt: Add RISC-V Second-stage (iohgatp) page table support
Date: Fri, 21 Aug 2026 21:27:41 +0800
Message-Id: <20260821132749.82070-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
References: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062807_362392_070B008F 
X-CRM114-Status: GOOD (  16.42  )
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

Add support for Sv39x4/Sv48x4/Sv57x4 Second-stage page tables used by
the RISC-V IOMMU iohgatp register. The x4 root page table is 16 KiB
instead of the usual 4 KiB, covering 2 extra GPA bits (hw_max_vasz_lg2
= 41/50/59).

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/iommu_riscv64.c |  2 +-
 drivers/iommu/generic_pt/fmt/riscv.h         | 77 +++++++++++++++++---
 include/linux/generic_pt/common.h            |  4 +
 include/linux/generic_pt/iommu.h             | 17 ++++-
 4 files changed, 89 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
index 1bb74114fb02..fa61839e5599 100644
--- a/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
+++ b/drivers/iommu/generic_pt/fmt/iommu_riscv64.c
@@ -8,7 +8,7 @@
 	(BIT(PT_FEAT_SIGN_EXTEND) | BIT(PT_FEAT_FLUSH_RANGE) | \
 	 BIT(PT_FEAT_RISCV_SVNAPOT_64K) |                      \
 	 BIT(PT_FEAT_DETAILED_GATHER) |                        \
-	 BIT(PT_FEAT_RISCV_SVPBMT))
+	 BIT(PT_FEAT_RISCV_SVPBMT) | BIT(PT_FEAT_RISCV_S2))
 #define PT_FORCE_ENABLED_FEATURES BIT(PT_FEAT_DETAILED_GATHER)
 
 #include "iommu_template.h"
diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index ae9a76514416..5692c033dbde 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -37,7 +37,16 @@ enum {
 	PT_MAX_OUTPUT_ADDRESS_LG2 = 34,
 	PT_MAX_TOP_LEVEL = 1,
 #else
-	PT_MAX_VA_ADDRESS_LG2 = 57,
+	/*
+	 * PT_MAX_VA_ADDRESS_LG2 is the upper bound accepted by the generic
+	 * pt_iommu_init() range check.  It must cover both first-stage and
+	 * second-stage (G-stage) modes:
+	 *
+	 *   First-stage  (fsc/iosatp): Sv39=39, Sv48=48, Sv57=57
+	 *   Second-stage (iohgatp):    Sv39x4=41, Sv48x4=50, Sv57x4=59
+	 *
+	 */
+	PT_MAX_VA_ADDRESS_LG2 = 59,
 	PT_MAX_OUTPUT_ADDRESS_LG2 = 56,
 	PT_MAX_TOP_LEVEL = 4,
 #endif
@@ -126,6 +135,15 @@ riscvpt_entry_num_contig_lg2(const struct pt_state *pts)
 
 static inline unsigned int riscvpt_num_items_lg2(const struct pt_state *pts)
 {
+	/*
+	 * Second-stage (iohgatp) root page tables have 4x the usual number of
+	 * entries (2048 = 2^11 instead of 512 = 2^9) to cover the 2 extra GPA
+	 * bits in Sv39x4/Sv48x4/Sv57x4.  Only the root (top) level is
+	 * enlarged; all other levels remain at the standard 9-bit index width.
+	 */
+	if (pts_feature(pts, PT_FEAT_RISCV_S2) &&
+	    pts->level == pts->range->top_level)
+		return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64)) + 2;
 	return PT_TABLEMEM_LG2SZ - ilog2(sizeof(u64));
 }
 #define pt_num_items_lg2 riscvpt_num_items_lg2
@@ -263,6 +281,7 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
 	struct pt_riscv *table = &iommu_table->riscv_64pt;
 
 	switch (cfg->common.hw_max_vasz_lg2) {
+	/* First-stage (fsc/iosatp): Sv39 / Sv48 / Sv57 */
 	case 39:
 		pt_top_set_level(&table->common, 2);
 		break;
@@ -272,6 +291,19 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
 	case 57:
 		pt_top_set_level(&table->common, 4);
 		break;
+	/*
+	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
+	 * The top level is the same as for the first-stage counterpart.
+	 */
+	case 41:
+		pt_top_set_level(&table->common, 2);
+		break;
+	case 50:
+		pt_top_set_level(&table->common, 3);
+		break;
+	case 59:
+		pt_top_set_level(&table->common, 4);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -292,10 +324,17 @@ riscvpt_iommu_fmt_hw_info(struct pt_iommu_riscv_64 *table,
 	PT_WARN_ON(top_phys & ~PT_TOP_PHYS_MASK);
 
 	/*
-	 * See Table 3. Encodings of iosatp.MODE field" for DC.tx.SXL = 0:
-	 *  8 = Sv39 = top level 2
-	 *  9 = Sv38 = top level 3
-	 *  10 = Sv57 = top level 4
+	 * Both first-stage (fsc/iosatp) and second-stage (iohgatp) share the
+	 * same MODE numeric values for a given top level:
+	 *   top_level 2 -> MODE 8  (Sv39 / Sv39x4)
+	 *   top_level 3 -> MODE 9  (Sv48 / Sv48x4)
+	 *   top_level 4 -> MODE 10 (Sv57 / Sv57x4)
+	 *
+	 * The union members fsc_iosatp_mode and iohgatp_mode occupy the same
+	 * byte; the caller selects the appropriate name based on domain type.
+	 *
+	 * See "Table 3. Encodings of iosatp.MODE field" (DC.tc.SXL = 0) and
+	 * "Table 2. Encoding of iohgatp.MODE field" in the RISC-V IOMMU spec.
 	 */
 	info->fsc_iosatp_mode = top_range->top_level + 6;
 }
@@ -303,19 +342,39 @@ riscvpt_iommu_fmt_hw_info(struct pt_iommu_riscv_64 *table,
 
 #if defined(GENERIC_PT_KUNIT)
 static const struct pt_iommu_riscv_64_cfg riscv_64_kunit_fmt_cfgs[] = {
-	[0] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+	/* First-stage (fsc/iosatp): Sv39 / Sv48 / Sv57 */
+	[0] = { .common.features = BIT(PT_FEAT_SIGN_EXTEND) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 39 },
-	[1] = { .common.features = 0,
+	[1] = { .common.features = BIT(PT_FEAT_SIGN_EXTEND),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 48 },
-	[2] = { .common.features = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+	[2] = { .common.features = BIT(PT_FEAT_SIGN_EXTEND) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
 		.common.hw_max_oasz_lg2 = 56,
 		.common.hw_max_vasz_lg2 = 57 },
+	/*
+	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
+	 */
+	[3] = { .common.features = BIT(PT_FEAT_RISCV_S2) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 41 },
+	[4] = { .common.features = BIT(PT_FEAT_RISCV_S2),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 50 },
+	[5] = { .common.features = BIT(PT_FEAT_RISCV_S2) |
+				      BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+		.common.hw_max_oasz_lg2 = 56,
+		.common.hw_max_vasz_lg2 = 59 },
 };
 #define kunit_fmt_cfgs riscv_64_kunit_fmt_cfgs
+/* Sign extension is only valid for first-stage configs, not S2. */
 enum {
-	KUNIT_FMT_FEATURES = BIT(PT_FEAT_RISCV_SVNAPOT_64K),
+	KUNIT_FMT_FEATURES = BIT(PT_FEAT_SIGN_EXTEND) |
+			     BIT(PT_FEAT_RISCV_SVNAPOT_64K) |
+			     BIT(PT_FEAT_RISCV_S2),
 };
 #endif
 
diff --git a/include/linux/generic_pt/common.h b/include/linux/generic_pt/common.h
index 07ef1c8341a4..f2e130c2b804 100644
--- a/include/linux/generic_pt/common.h
+++ b/include/linux/generic_pt/common.h
@@ -197,6 +197,10 @@ enum {
 	 * Support Svpbmt extension: encode page-based memory type (PBMT) in PTEs.
 	 */
 	PT_FEAT_RISCV_SVPBMT,
+	/*
+	 * Using second-stage / iohgatp address translation.
+	 */
+	PT_FEAT_RISCV_S2,
 
 };
 
diff --git a/include/linux/generic_pt/iommu.h b/include/linux/generic_pt/iommu.h
index dd0edd02a48a..f27d229ff318 100644
--- a/include/linux/generic_pt/iommu.h
+++ b/include/linux/generic_pt/iommu.h
@@ -328,7 +328,22 @@ struct pt_iommu_riscv_64_cfg {
 
 struct pt_iommu_riscv_64_hw_info {
 	u64 ppn;
-	u8 fsc_iosatp_mode;
+	union {
+		/*
+		 * First-stage (fsc/iosatp) MODE encoding:
+		 *   8 = Sv39, 9 = Sv48, 10 = Sv57
+		 * Used to program DC.fsc.iosatp.MODE.
+		 */
+		u8 fsc_iosatp_mode;
+		/*
+		 * Second-stage (iohgatp) MODE encoding:
+		 *   8 = Sv39x4, 9 = Sv48x4, 10 = Sv57x4
+		 * Used to program DC.iohgatp.MODE.
+		 * The numeric values are identical to fsc_iosatp_mode;
+		 * the caller selects the interpretation based on domain type.
+		 */
+		u8 iohgatp_mode;
+	};
 };
 
 IOMMU_FORMAT(riscv_64, riscv_64pt);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
