Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33644CAC587
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 02:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15tf78hKTS72DVmaHjawHJ0ZltUocYxgmcy7ofnas0Y=; b=K6I06oFOeZBu+I
	Yhi5fuCn6OGT0IAe61Zj8Oltaoo1MInTHJ8zVs1Fs6rFiPMAIxF0mAMdClzXXueLUFB0+tcTMhcsX
	lqmesfZmyc09nClypmSzlmp4zY/cMB54Gd/d/HWPJjq7WgoA8gyZ0GtH6eWai4bnPDAnn+59A/7oj
	+yebuieEnW8I3uw7f/LXVdUYWh/ux+1uQEDLNcutqq/6dLLOsjq0rJpmNK6EFPcWS7TMLVkgGH9ph
	L1Wb0MUQFFyFY3XpeZE8kL9sQETD6CtpHVp0ESe5hpTBVpi88fSKrC/L8HhYdHtUvCSdQGB+EDXdX
	AibTBsd2IYyyhGRlEJrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyfM-00000002XHO-2Yu2;
	Mon, 15 Sep 2025 02:10:04 +0000
Received: from out28-73.mail.aliyun.com ([115.124.28.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyfI-00000002XFS-2rvN
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 02:10:03 +0000
Received: from LAPTOP-2KT3QRS7.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ef9vIh9_1757902187 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 15 Sep 2025 10:09:50 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: linux-riscv@lists.infradead.org
Cc: iommu@lists.linux.dev,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	anxu@bosc.ac.cn,
	wangran@bosc.ac.cn,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: [PATCH v1 2/3] iommu/riscv: Add Makefile support for RISC-V IOMMU perf driver
Date: Mon, 15 Sep 2025 10:09:10 +0800
Message-Id: <20250915020911.1313-2-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_191000_896136_26A671CC 
X-CRM114-Status: UNSURE (   7.64  )
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

Add compilation rules for iommu-perf.o to support
the new RISC-V IOMMU perf driver.

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 drivers/iommu/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/Makefile b/drivers/iommu/riscv/Makefile
index b5929f9f23e6..5e9c7c1ed928 100644
--- a/drivers/iommu/riscv/Makefile
+++ b/drivers/iommu/riscv/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y += iommu.o iommu-platform.o
+obj-y += iommu.o iommu-platform.o iommu-perf.o
 obj-$(CONFIG_RISCV_IOMMU_PCI) += iommu-pci.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
