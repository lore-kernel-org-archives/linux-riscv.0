Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB46CDB482
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PM03P9f4XE/iioT0MF6jIc2Ax2Sd19C8iprZSZp5yc=; b=1lnJfFi1j0Ypwl
	OKcpyj6cr1Gg96KwRxbD+LF/6E2fO4AUwriEgzs5WXTkm0IRlaAjStOQyVU1VPBkSCFi1vb/OaLpv
	BWXfFow1w4Ae1kCxIFDZaTsZLDZhB2YKC03B7PRCwkJ0ZY7QjstPha8/FHj8FmfMiEyeF4ARtXuhK
	cAmo+46OFnArI7QCydy+evKSUHply1jx5YaYOSBW0FPoeyRKGkY8EUs2Lb+pKMJwFvYgb/2c8GY6F
	QI1K/kobFKc1061vVEDMtMScK9ogMAQcKf6ZL/GQM1Xn9s++W8fXml6nx80dha6D5RetNQdJy7s03
	d+fRNN11hwZ0hAPBRzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSR-008Qge-27;
	Mon, 16 Oct 2023 05:48:03 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSP-008QfY-1h;
	Mon, 16 Oct 2023 05:48:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
Date: Mon, 16 Oct 2023 07:47:43 +0200
Message-Id: <20231016054755.915155-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016054755.915155-1-hch@lst.de>
References: <20231016054755.915155-1-hch@lst.de>
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

RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
helpers, which are built into the kernel unconditionally.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig          | 1 -
 drivers/cache/Kconfig       | 2 +-
 drivers/soc/renesas/Kconfig | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d607ab0f7c6daf..0ac0b538379718 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -277,7 +277,6 @@ config RISCV_DMA_NONCOHERENT
 
 config RISCV_NONSTANDARD_CACHE_OPS
 	bool
-	depends on RISCV_DMA_NONCOHERENT
 	help
 	  This enables function pointer support for non-standard noncoherent
 	  systems to handle cache management.
diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
index a57677f908f3ba..d6e5e3abaad8af 100644
--- a/drivers/cache/Kconfig
+++ b/drivers/cache/Kconfig
@@ -3,7 +3,7 @@ menu "Cache Drivers"
 
 config AX45MP_L2_CACHE
 	bool "Andes Technology AX45MP L2 Cache controller"
-	depends on RISCV_DMA_NONCOHERENT
+	depends on RISCV
 	select RISCV_NONSTANDARD_CACHE_OPS
 	help
 	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 12040ce116a551..880c544bb2dfda 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -335,7 +335,7 @@ config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
 	select ARCH_RZG2L
-	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
+	select AX45MP_L2_CACHE
 	select DMA_GLOBAL_POOL
 	select ERRATA_ANDES if RISCV_SBI
 	select ERRATA_ANDES_CMO if ERRATA_ANDES
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
