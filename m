Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B766FCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 10:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SuL53mtG5jkGwn9V1L8UbTBv3U2kkIFyPddk3dpQCpw=; b=KysxCYdso6pQUk
	4L9VVz0EBjuTJO1l1KOaIEovQUrV+YI2Uc5mSQvbgOqllRVgS5bg6k7ptJnEhWepaNHGXOLmx41Ao
	XIdWsaGTt64k1ojxrW0oGN76/098YE/BkshWiZajiwiF//9+w/QPuIWTOa3P5CC37DYW8Ic6UezIx
	gCHoXyFqNRG7K4/4rmtn3JoMWXhV2bHNBq9XEpaHGiHXZM8qAGNiq4Gdk34qOZLF1lFGuQvO7p46o
	t7rFmG2pTsxyxyb7Jbqnt1ZUyV4D/G4Oh3NZ2vSfSeGfaJycQM7s96+vIyMgeP332lLu3T3xMzww/
	3iaKDmAUo2CKX3i0jY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHng-0000000DRhQ-0mIQ;
	Wed, 10 Sep 2025 10:11:40 +0000
Received: from out28-131.mail.aliyun.com ([115.124.28.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHnc-0000000DRfb-1uEO
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 10:11:38 +0000
Received: from LAPTOP-2KT3QRS7.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.ebyLtlZ_1757499087 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 10 Sep 2025 18:11:30 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: linux-riscv@lists.infradead.org
Cc: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Yaxing Guo <guoyaxing@bosc.ac.cn>
Subject: [PATCH v1] riscv: iommu: Kconfig: Add RISC-V to IOMMU_DMA def_bool
Date: Wed, 10 Sep 2025 18:11:25 +0800
Message-Id: <20250910101125.94345-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_031136_659113_976DB680 
X-CRM114-Status: UNSURE (   8.24  )
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

The IOMMU_DMA configuration option is used to enable DMA mapping
support via IOMMU for platforms that require it. Currently, it is
enabled for ARM64, X86, and S390 architectures.

This patch adds RISC-V (RISCV) to the def_bool condition, enabling
IOMMU_DMA support for RISC-V platforms that have an IOMMU and require
DMA remapping.

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 70d29b14d851..9d8c90690275 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -150,7 +150,7 @@ config OF_IOMMU
 
 # IOMMU-agnostic DMA-mapping layer
 config IOMMU_DMA
-	def_bool ARM64 || X86 || S390
+	def_bool ARM64 || X86 || S390 || RISCV
 	select DMA_OPS_HELPERS
 	select IOMMU_API
 	select IOMMU_IOVA
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
