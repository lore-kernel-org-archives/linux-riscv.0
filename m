Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CE6E77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 02:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dk5Hsu0TMPD4NYJtKzSeutV3ju8FyEaIh4EimMm4tFU=; b=2Cj50fWKL5QYce
	MEXexBC3mnbl9zd/KSZ6SzgWUNFIj/5zijw69auEw+3AP+Zvqyp+ENPcTq1++G34/YDxauEp4G3en
	Qggd5yqt0vqSmNLV48UTFcVhZQS/g7226ldrZ+9pv2U81dTk1F0V/RSEUrplMJgLOqE52KmjAl4mr
	kJ4QrQt/h7Uymi8ffNiSAvYbDRqDQVPlbDIG6vUR4QRPew3cpwnY/3eUGfA6DYGoTxaV5Eb+OuiqU
	CHRkFVVsR9bdjWXrwErOdY1kBpp41R1NUhC3e6I8gbYbQPWx+VVwb3yeuN2dEWNkIyVwsMugCi39H
	reOlud/w+lYhAALU0mCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXiB-0000000BxH2-03qZ;
	Fri, 03 Jan 2025 02:46:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXi8-0000000BxGX-1IXw
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 02:46:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A9FDDA40144;
	Fri,  3 Jan 2025 02:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4F2C4CED0;
	Fri,  3 Jan 2025 02:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735872410;
	bh=HNbF+5O8p3vFxk/5XDByidOa1qlDFCI6xUWBJXVcxzA=;
	h=From:To:Cc:Subject:Date:From;
	b=SI6LGoTllTrTeMyXS4bpCG7Yb/HzxshsEz1Q7zVq+FumuTTblw7P057FAOYrSkl+E
	 7VbikWGwD+HsVCeH1Q5WkcrGl714QCQUnGf6UifahF/fRWsPuGYvL5ux7m4O/ptday
	 MlVmmbWjvyDaRH1eX4CebugmLKQ6dEtvs5wl9w+xhlS8qaJ+dILw97ld+SGWeHtIOz
	 nYn24iK8ap0+rr+SblbjHlcuB1e94HVoaVHpBsvBzvWEXH2DwOGZ0mt8JyAUZ0oJ8/
	 MLNI5bk51as4C1r5Cug/AG6go1z9lRRChaMA3V5sHmOP9Nq6VqcyoWNVUk57CWlII1
	 QR+bFI3I0Pkag==
From: guoren@kernel.org
To: tjeznach@rivosinc.com
Cc: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	baolu.lu@linux.intel.com,
	zong.li@sifive.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] iommu/riscv: Fixup compile warning
Date: Thu,  2 Jan 2025 21:46:16 -0500
Message-Id: <20250103024616.3359159-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_184652_421910_E7D1C686 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When __BITS_PER_LONG == 32, size_t is defined as unsigned int rather
than unsigned long. Therefore, we should use size_t to avoid
type-checking errors.

Fixes: 488ffbf18171 ("iommu/riscv: Paging domain support")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 8a05def774bd..38d381164385 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1270,7 +1270,7 @@ static phys_addr_t riscv_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 					    dma_addr_t iova)
 {
 	struct riscv_iommu_domain *domain = iommu_domain_to_riscv(iommu_domain);
-	unsigned long pte_size;
+	size_t pte_size;
 	unsigned long *ptr;
 
 	ptr = riscv_iommu_pte_fetch(domain, iova, &pte_size);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
