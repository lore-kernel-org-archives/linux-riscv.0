Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207E9C5DF93
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PlxaSKowF/9u6brgyrnWLEyakI+D2IJ29cJFsLqmjs=; b=yeuc6MLNxDa0BD
	jipalqZ/rDWnQmFK6OGBQC9jpkL06rmy8nWImbdxm0C7+ZYmYwkSwxAK+FQIbXMqyx7Y409v6533M
	Wg825IjOTkmBJGUBIQHHjSaLiawpsUmTNjC8xnwM6usMUxEfBx2mLpwmsbpOXWS2635KBD0JeB5Ko
	Aw1jh2G7KpO99XYnXUyn4YjUPnEpVHT6fFIPNhfD/ZsFz+1W5/byEFKUHGGZyJaBob3oDvfIC0uuG
	5zS3HU51bOJenxisc5TC5/yOr0wMLRKPNabvCz6UXcoCd/I53CAeVx8an7uZgMkS8I3WVo2sx6qRu
	Gin5f2Fm+zl+icPDMH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPHy-0000000DP79-0IUW;
	Fri, 21 Aug 2026 13:28:06 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPHu-0000000DP5j-1ZA5
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787318880; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Yr8akKpSeIjOQrqO624NpfviZD0ZD7ZvB1Sdrsbkrz0=;
	b=PEuy0qn2xmMtECbxQoHr+gzEwdAUsKwI1+jjcVWm0JJj42aoQzuXcu75StK0JnlAxq/G5e8fpaLgWmHczVsw4nPkbTe0kZ5KjV361zTIVFZ/Oe2opFgLLt/GbFM9YPByBUAf2ZsaBq/ajW8LnGGjWf3+zD4Cl58Ul176fyEwpCI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X9MSFFw_1787318876;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X9MSFFw_1787318876 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Aug 2026 21:27:58 +0800
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
Subject: [RFC PATCH v3 02/10] iommupt: Add RISC-V dirty tracking PTE ops
Date: Fri, 21 Aug 2026 21:27:42 +0800
Message-Id: <20260821132749.82070-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
References: <20260821132749.82070-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_062802_801609_54CAFF56 
X-CRM114-Status: UNSURE (   7.49  )
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

Implement the three dirty-tracking hooks required by the generic page
table framework for the RISC-V format:

  pt_entry_is_write_dirty():
    Check the D bit (bit 7) in the PTE.

  pt_entry_make_write_clean():
    Clear the D bit across the full contiguous range.

  pt_entry_make_write_dirty():
    Atomically set D via try_cmpxchg64() on a single PTE.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 43 ++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index 5692c033dbde..09581798e753 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -226,6 +226,49 @@ static inline void riscvpt_attr_from_entry(const struct pt_state *pts,
 }
 #define pt_attr_from_entry riscvpt_attr_from_entry
 
+/*
+ * Dirty tracking: RISC-V PTEs use D (bit 7) as the hardware dirty bit.
+ * When Svnapot 64K is active a leaf entry spans 16 consecutive PTEs; we
+ * must check / clear all of them so that no dirty indication is lost.
+ */
+static inline bool riscvpt_entry_is_write_dirty(const struct pt_state *pts)
+{
+	unsigned int num_contig_lg2 = riscvpt_entry_num_contig_lg2(pts);
+	const pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) +
+		log2_set_mod(pts->index, 0, num_contig_lg2);
+	const pt_riscv_entry_t *end = tablep + log2_to_int(num_contig_lg2);
+
+	for (; tablep != end; tablep++)
+		if (READ_ONCE(*tablep) & RISCVPT_D)
+			return true;
+	return false;
+}
+#define pt_entry_is_write_dirty riscvpt_entry_is_write_dirty
+
+static inline void riscvpt_entry_make_write_clean(struct pt_state *pts)
+{
+	unsigned int num_contig_lg2 = riscvpt_entry_num_contig_lg2(pts);
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) +
+		log2_set_mod(pts->index, 0, num_contig_lg2);
+	pt_riscv_entry_t *end = tablep + log2_to_int(num_contig_lg2);
+
+	for (; tablep != end; tablep++)
+		WRITE_ONCE(*tablep, READ_ONCE(*tablep) & ~(pt_riscv_entry_t)RISCVPT_D);
+}
+#define pt_entry_make_write_clean riscvpt_entry_make_write_clean
+
+static inline bool riscvpt_entry_make_write_dirty(struct pt_state *pts)
+{
+	pt_riscv_entry_t *tablep =
+		pt_cur_table(pts, pt_riscv_entry_t) + pts->index;
+	pt_riscv_entry_t new = pts->entry | RISCVPT_D;
+
+	return try_cmpxchg64(tablep, &pts->entry, new);
+}
+#define pt_entry_make_write_dirty riscvpt_entry_make_write_dirty
+
 /* --- iommu */
 #include <linux/generic_pt/iommu.h>
 #include <linux/iommu.h>
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
