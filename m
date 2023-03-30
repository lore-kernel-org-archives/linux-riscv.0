Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEBDC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 06:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fQw86p5LtqUvvVntEcdvmPvgcX6UTD8j/aJuRb7hY4I=; b=zfxcsWCSQXCVPS
	8pZe5RsdK0IWtGB3+ZLt9wt6HWSGF19xYvjGpvKjDeCPLQ2IwMNCDEs+keCpY7vAhBOg778TvzL25
	U861ZS6LLE58w5/hcU+sDvADqtBHJD+N/ffES/00KeyoQnXQeHm0MnEcx31GgreJWKBGeNoMLwwHR
	xRiuWlv1StyYlThYlS892OWU1UtG0FsbDZycOFxefgD3Mp7sY60LhiPqC+KQqJ3HwNhZm/Wt9B8Mh
	zMyIf3Z1fx5wkVSk3oCkqzbTDgA1vCcBhBYQ4nfSA9u+3ieOy4jWM4MNNJHMQuFyeuCG1YoTU0f7o
	G3ZH4Dz/EMerKIoskkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phlLS-002hoc-1V;
	Thu, 30 Mar 2023 06:01:10 +0000
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1phlLQ-002hoJ-0x;
	Thu, 30 Mar 2023 06:01:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Date: Wed, 29 Mar 2023 23:01:05 -0700
Message-Id: <20230330060105.29460-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
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

On riscv64, linux-next-20233030 (and for several days earlier),
there is a kconfig warning:

WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
  Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
  Selected by [y]:
  - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]

and build errors:

riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L140':
io-pgtable-arm.c:(.init.text+0x1e8): undefined reference to `alloc_io_pgtable_ops'
riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `.L168':
io-pgtable-arm.c:(.init.text+0xab0): undefined reference to `free_io_pgtable_ops'
riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L140':
ipmmu-vmsa.c:(.text+0xbc4): undefined reference to `free_io_pgtable_ops'
riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `.L0 ':
ipmmu-vmsa.c:(.text+0x145e): undefined reference to `alloc_io_pgtable_ops'

Add RISCV as an allowed ARCH dependency to fix these problems.

Fixes: d286a58bc8f4 ("iommu: Tidy up io-pgtable dependencies")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev
Cc: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org
---
 drivers/iommu/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -32,7 +32,7 @@ config IOMMU_IO_PGTABLE
 config IOMMU_IO_PGTABLE_LPAE
 	bool "ARMv7/v8 Long Descriptor Format"
 	select IOMMU_IO_PGTABLE
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || RISCV || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64	# for cmpxchg64()
 	help
 	  Enable support for the ARM long descriptor pagetable format.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
