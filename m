Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF4BCD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 14:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CLpTNJ+nOwdnPGx3BruTCyFuI3jldceCe1iU7SlQOtw=; b=gmXtXAl1G2eQPm
	vLyUjJzpXp5PHTebQElTK5OPEw1GCEl5epSQsxDq2wuR5RK1bd0kMfT6T41vJnyLGp3z5tjn/hz6F
	TqVDMSIslyJlPPe7a9AKb0o0VSwLttB3nCp1/zd4DVOUg7tmwvYXYiSBMvJcMnimZumBzRL00Vqj2
	WjdZZpnYw5OwRc3IJULUEa9IAucPn8ZPjEvPzgSVzFSliASm19hzAe9LU3YivxV1C/G61JodIN/3W
	hz43PE7E9o6+e5+vxQaMs8ou3a8vtpMkpEmRIAdMtTgZZjwGjXAF6IRWSQNr5Vtd4q3nJn7ACpKKo
	gxoe3ZiiQXNwXOQdYzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoKs-0000000H587-1P1d;
	Tue, 12 May 2026 14:43:50 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoKn-0000000H561-3ZKn
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 14:43:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778597022; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=rGf7I8/6d+oaxOH3iQMKwENVJqvQ7e/ZZfEuXFJcHxM=;
	b=j6n1474rhY5m4gLEtiEVMlFFaK9iP1WwbT5PbDvjDOcfaMCPJoOfLpEV6kXt+NtVh9LPL0gmwA/JSdTczoYhRz0NOxlX6cDLT6yEC4j0d95czWTP+w8VSOLlSat3Ej+f12MAAE56Mcn0MxRdH851tdnv1dE8q6GGDuLWNl0NXcw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R921e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X2qqOSF_1778597016;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X2qqOSF_1778597016 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 22:43:37 +0800
From: fangyu.yu@linux.alibaba.com
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	jgg@nvidia.com,
	nutty.liu@hotmail.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] iommupt: Fixup build warning by using BIT_ULL() for RISCVPT_NC/IO
Date: Tue, 12 May 2026 22:43:30 +0800
Message-Id: <20260512144330.91113-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_074346_430752_F2BAEF5A 
X-CRM114-Status: UNSURE (   7.10  )
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

Fix build warning on 32-bit configurations by using BIT_ULL() for
RISCVPT_NC and RISCVPT_IO.

Fixes: 6c21eb174c6c ("iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V Svpbmt bits")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605121350.wZxB51k0-lkp@intel.com/
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/generic_pt/fmt/riscv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/generic_pt/fmt/riscv.h b/drivers/iommu/generic_pt/fmt/riscv.h
index 2648bb57953e..ae9a76514416 100644
--- a/drivers/iommu/generic_pt/fmt/riscv.h
+++ b/drivers/iommu/generic_pt/fmt/riscv.h
@@ -64,8 +64,8 @@ enum {
 	RISCVPT_PPN64 = GENMASK_ULL(53, 10),
 	RISCVPT_PPN64_64K = GENMASK_ULL(53, 14),
 	RISCVPT_PBMT = GENMASK_ULL(62, 61),
-	RISCVPT_NC = BIT(61),
-	RISCVPT_IO = BIT(62),
+	RISCVPT_NC = BIT_ULL(61),
+	RISCVPT_IO = BIT_ULL(62),
 	RISCVPT_N = BIT_ULL(63),
 
 	/* Svnapot encodings for ppn[0] */
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
