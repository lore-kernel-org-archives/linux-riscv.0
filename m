Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1564CC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o220pr97+LLbjrMUZRQ+zWLV+muHECcqMfGNSdV3k/w=; b=e70+QnDjd/0CZz
	WzjQMyd/Q2777VoOm20L92MbGTUwyKKjXMAGoDP9K70YQcxiL95VE2gZUUIoV/lsditMzpvCvEiS4
	vTPj7lFu+adYJYuNsnPrClIS680jH416gM3ZCO/ok5UfVv17NZGizKKAiv0kjtMFDsWuKUWeltY4U
	mcJq/fWybFrzewRQHWOazZanNRtFW8AD+NysVDH2Zc6x4QOn5TLu0c//FCeb8gpIQdIvLAKYu1Ngx
	UAEfirldU02kh/ee1QmMZ959oQZkZimLAqAFtt8BVG0pnTL03VV+S0mFB+L0Of3glqlzbdUj+VVnC
	IJCK9pxVS8BrROXtRGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ijG-007Faz-Ud; Thu, 15 Dec 2022 07:32:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ijF-007FXj-0I
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 07:32:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A246961CE5;
	Thu, 15 Dec 2022 07:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD64C43396;
	Thu, 15 Dec 2022 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671089541;
	bh=IuVFclXBC2xjRNMPRTtq1KAZ9dbUziFQCUjGxBXpNv0=;
	h=From:To:Cc:Subject:Date:From;
	b=up1c8ix9evWyaIMVotw+FBoA3JiiMPOQLHfXEwVt3x77Nriis+Zm6svfODeRCKBN9
	 7c2P5ndXAZ1jbzSJIo/s3/e6KywByC4vonLI08eGglyWEY3umhcUUsBBLXqZnyoGk5
	 wGd+B+au8iNgkco3LADOjNSIkEqFGs5z0QF9M6NfQ4mokYfA4KvrSqfJz/ZipEx2WU
	 ku7C83aDCGn0GmT/OQPVVNFUYC9wem9jHynrYBGH9JQ94ULEoLvWxC+svkB8+kY/Nj
	 KqSkQahr89gkKfeLUq/L2qFN2LA/Kijh+jlGJ4ErSLDlgzVGYsHUMTrESTNpmsM+Dt
	 t0qQZAzNpYGtQ==
From: guoren@kernel.org
To: palmer@dabbelt.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	iommu@lists.linux.dev,
	Guo Ren <guoren@linux.alibaba.com>,
	kernel test robot <lkp@intel.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] iommu/renesas: Support riscv compile
Date: Thu, 15 Dec 2022 02:32:12 -0500
Message-Id: <20221215073212.1966823-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_233229_135379_C2DBD5B1 
X-CRM114-Status: UNSURE (   8.05  )
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

After riscv selects ARCH_RENESAS, we need to add ARM64 || ARM
dependency here.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index dc5f7a156ff5..746b95b9f345 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -283,6 +283,7 @@ config EXYNOS_IOMMU_DEBUG
 
 config IPMMU_VMSA
 	bool "Renesas VMSA-compatible IPMMU"
+	depends on ARM64 || ARM
 	depends on ARCH_RENESAS || (COMPILE_TEST && !GENERIC_ATOMIC64)
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
