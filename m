Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03091CDB482
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 05:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93lY04qsvPLMlU+nak62rla+0sCRA5MguT+iGGzG3yg=; b=xNbMAKYbHynfcP
	YZtK/yqgoysk5RiZ8yMl/mwJpMmu/Y1mU0xwVtzqFAA2fEQMA5M5zY+BUIAWAUObXQCUSXkn6AMr8
	7GYgMIuXxW8C4Ts3Y/S9W7GOMNXnQXPDMNCD/+aj9lnIM0SbRF58DetDghuCO6T0vq/KHmZqW9dds
	O5gKYo/p7Bmvp1q+FPHXtM1ymP7ovD1gdxFkP17w+ehcSRxE2K9NZpz0rhf7A3BNw2wOulSDD4ocj
	CmdZWUceJc5Y3hlNc0DtXnwjsQEY4HC/C50oz0xO2kCA5Qb2xYdOOtLaNBe+l3XWPa7Ti3+bIA2f2
	lKbF/U77vGt6dTJzSTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSV-008Qj1-30;
	Mon, 16 Oct 2023 05:48:07 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qsGSU-008QhF-0t;
	Mon, 16 Oct 2023 05:48:06 +0000
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
Subject: [PATCH 03/12] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM
Date: Mon, 16 Oct 2023 07:47:45 +0200
Message-Id: <20231016054755.915155-4-hch@lst.de>
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

ARCH_R9A07G043 has it's own non-standard global pool based DMA coherent
allocator, which conflicts with the remap based RISCV_ISA_ZICBOM version.
Add a proper dependency.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 880c544bb2dfda..f1696d3b5018d0 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,7 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
+	depends on !RISCV_ISA_ZICBOM
 	select ARCH_RZG2L
 	select AX45MP_L2_CACHE
 	select DMA_GLOBAL_POOL
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
