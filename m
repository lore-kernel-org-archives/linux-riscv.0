Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06320EF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8HD9OEZ/TpkqHUmkd6Rxi7ugC+Y1YHATtXJ75zvpLA=; b=nj9vhOBIJ67noF
	w9pMpVzsmkbbpj6sp6co88/UEpyTSQukVm3pG4OYbX5UHY1BrOGa+WCeSkJ82OvoKHKtqLDapoPHK
	cvQqd3DUhuRWWi9tFn6XZc9OUzj1oUw1lMygD+W9FAh0uDzBVffGWbasv///B0g0FGlzEndFw9SuF
	IarJmV9/RN5YUn3pGCfj99oVqzeWuEHK71IJsKr0WRRtOTEcujSpJUxILalb3FkmDEGulqXxPbNk6
	AsTzl7nTQH2AljQOoz5S7YDAoQQJgLvJgzFiTAoNT35kPOZ391g9pU613q5bvwJiah/1ZoftBnVdw
	AnzrrgHDr6Hjz3x0L02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5zq-0000000DOIV-2sA2;
	Sun, 08 Feb 2026 14:42:47 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp5zm-0000000DOGB-1eHN
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 14:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770561748; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=832YTHZrK3Pyq+HUnUx8cNLTvYiKXNSGu9dxfufivbw=;
	b=AVKY1bafhRLTjXq99Quw3ZPF+J12Qd1v+YcSvqzgrc8iP41+j+T3vS2TIJrVH7GGpvaXNjqEjn2ur/xBVDqfTX8pKZDWg2+H0EFiq0WVAsjd1UX5cY/10j4m7MRw6jCU/F6cXApxToapYce9iQG5Gm3QZGiDxxOVI7GTD3YkmDQ=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WylHpCX_1770561742 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 08 Feb 2026 22:42:25 +0800
From: fangyu.yu@linux.alibaba.com
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com
Cc: guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH 1/2] iommu/riscv: Add NAPOT range invalidation support for IOTINVAL
Date: Sun,  8 Feb 2026 22:42:12 +0800
Message-Id: <20260208144213.94856-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260208144213.94856-1-fangyu.yu@linux.alibaba.com>
References: <20260208144213.94856-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_064243_355678_F19B101F 
X-CRM114-Status: GOOD (  19.50  )
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

RISC-V IOMMU v1.0.1 defines an Address Range Invalidation extension
(capabilities.S) which allows encoding the invalidation size as a
NAPOT range in the ADDR operand when issuing IOTINVAL.VMA/GVMA with
the S bit set. This can significantly reduce the number of invalidation
commands, especially when superpages are used.

Add the missing capabilities.S definition, introduce the IOTINVAL.S bit
and a helper to program NAPOT-encoded ranges, and switch the IOTLB
invalidation path to use range invalidations when it is available. The
implementation splits the requested interval into the largest aligned
NAPOT ranges and falls back to whole address space invalidation for larger
ranges.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/riscv/iommu-bits.h | 10 ++++
 drivers/iommu/riscv/iommu.c      | 86 ++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 98daf0e1a306..0d1f8813ae31 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -62,6 +62,7 @@
 #define RISCV_IOMMU_CAPABILITIES_PD8		BIT_ULL(38)
 #define RISCV_IOMMU_CAPABILITIES_PD17		BIT_ULL(39)
 #define RISCV_IOMMU_CAPABILITIES_PD20		BIT_ULL(40)
+#define RISCV_IOMMU_CAPABILITIES_S		BIT_ULL(43)
 
 /**
  * enum riscv_iommu_igs_settings - Interrupt Generation Support Settings
@@ -472,6 +473,7 @@ struct riscv_iommu_command {
 #define RISCV_IOMMU_CMD_IOTINVAL_PSCV		BIT_ULL(32)
 #define RISCV_IOMMU_CMD_IOTINVAL_GV		BIT_ULL(33)
 #define RISCV_IOMMU_CMD_IOTINVAL_GSCID		GENMASK_ULL(59, 44)
+#define RISCV_IOMMU_CMD_IOTINVAL_S		BIT_ULL(9)
 /* dword1[61:10] is the 4K-aligned page address */
 #define RISCV_IOMMU_CMD_IOTINVAL_ADDR		GENMASK_ULL(61, 10)
 
@@ -715,6 +717,14 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
 	cmd->dword1 = 0;
 }
 
+static inline void riscv_iommu_cmd_inval_set_range(struct riscv_iommu_command *cmd,
+						   u64 addr)
+{
+	cmd->dword1 = FIELD_PREP(RISCV_IOMMU_CMD_IOTINVAL_ADDR, addr) |
+		      RISCV_IOMMU_CMD_IOTINVAL_S;
+	cmd->dword0 |= RISCV_IOMMU_CMD_IOTINVAL_AV;
+}
+
 static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
 						  u64 addr)
 {
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d9429097a2b5..ae48409a052a 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -913,7 +913,88 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 		riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
 	}
 }
+/*
+ * Encode a NAPOT range for IOTINVAL.{VMA,GVMA} when the S bit is set.
+ *
+ * Per RISC-V IOMMU Address Range Invalidation Extension:
+ *   - The ADDR operand is NAPOT encoded in 4KiB units.
+ *   - Scanning ADDR from bit 0 upwards, if the first 0 bit is at position X,
+ *     the invalidation range size is 2^(X+1) * 4KiB (X=0 => 8KiB).
+ *   - Thus, for a range of size = 4KiB * 2^k (k >= 1), the encoded ADDR has
+ *     its low (k-1) bits set to 1, and bit (k-1) cleared (by alignment).
+ *
+ */
+static unsigned long range_encode(unsigned long start, unsigned long size)
+{
+	unsigned long blocks = size >> PAGE_SHIFT;
+	unsigned long x = ilog2(blocks) - 1;
+
+	return (start >> PAGE_SHIFT) | ((1ULL << x) - 1);
+}
+static void riscv_iommu_iotlb_inval_range(struct riscv_iommu_domain *domain,
+					  struct riscv_iommu_device *iommu,
+					  unsigned long start, unsigned long end)
+{
+	struct riscv_iommu_command cmd;
+	unsigned long len = end - start + 1;
+	unsigned long page_start, limit, cur, max_range, size, range_addr;
+	int order;
+
+	riscv_iommu_cmd_inval_vma(&cmd);
+	riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
+
+	/*
+	 * Using NAPOT range invalidations may still require multiple commands
+	 * to cover a large interval (e.g. when the range is poorly aligned and
+	 * needs to be split into many smaller NAPOT blocks).
+	 *
+	 * To keep the number of queued IOTINVAL commands bounded and avoid
+	 * excessive invalidation overhead, treat very large invalidation
+	 * requests as a global flush for the address space (AV=0, PSCV=1).
+	 *
+	 */
+	if (len > SZ_1G) {
+		riscv_iommu_cmd_send(iommu, &cmd);
+		return;
+	}
 
+	page_start = start & PAGE_MASK;
+	limit = PAGE_ALIGN(end + 1);
+	cur = page_start;
+
+	while (cur < limit) {
+		max_range = 0;
+
+		/*
+		 * We cap the maximum NAPOT range to 1GiB (order=18, i.e. 2^18 * 4KiB) and
+		 * fall back to a whole-address-space invalidation for larger ranges. This
+		 * keeps the command generation bounded and aligns with the existing policy
+		 * of treating very large invalidations as global flushes.
+		 */
+		for (order = 18; order >= 1; order--) {
+			/* 1GB, ... , 16KB, 8KB */
+			size = (1ULL << order) * SZ_4K;
+			if (cur + size <= limit && IS_ALIGNED(cur, size)) {
+				max_range = size;
+				break;
+			}
+		}
+
+		if (max_range) {
+			range_addr = range_encode(cur, max_range);
+
+			riscv_iommu_cmd_inval_set_range(&cmd, range_addr);
+			riscv_iommu_cmd_send(iommu, &cmd);
+			cur += max_range;
+			continue;
+		}
+
+		/* Fall back to single-page invalidation */
+		riscv_iommu_cmd_inval_set_addr(&cmd, cur);
+		riscv_iommu_cmd_send(iommu, &cmd);
+		cur += PAGE_SIZE;
+	}
+}
 /*
  * Send IOTLB.INVAL for whole address space for ranges larger than 2MB.
  * This limit will be replaced with range invalidations, if supported by
@@ -970,6 +1051,11 @@ static void riscv_iommu_iotlb_inval(struct riscv_iommu_domain *domain,
 		if (iommu == prev)
 			continue;
 
+		if (!!(iommu->caps & RISCV_IOMMU_CAPABILITIES_S)) {
+			riscv_iommu_iotlb_inval_range(domain, iommu, start, end);
+			continue;
+		}
+
 		riscv_iommu_cmd_inval_vma(&cmd);
 		riscv_iommu_cmd_inval_set_pscid(&cmd, domain->pscid);
 		if (len && len < RISCV_IOMMU_IOTLB_INVAL_LIMIT) {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
