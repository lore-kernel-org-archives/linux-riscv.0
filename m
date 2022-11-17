Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEC1C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5DwBjp1OFwGkgb10A2isT/EhIsU/SGuriywLffFLwEc=; b=YagzTy5cggBw7J
	DqGJfQy84IoAxYr92PFo2PRIC0HRLtM7N5yqsH1X7R/NPI+GQp9fZWSboQyPmEDZ1RzWxhkz3AUBp
	lDE3DKS89+viWbC9AAXSQ4zOtkbsaTA2e/Hmo4bGgUYilzcjbctxQgrZmb9jXxMHAobkIOp3zAP3O
	+eJZJewC8UtwA/7fc/d/WNcdC8AeJ3GpUpkmj0dYuG1XQbotI3M1ZIYcenVg5mB2noeTK/1+vH5je
	kS1RfZb7t3e9yAEPCKpdHNGuehfgNnh7VPYTEI4iRF4qjfHPGQZGPVEnLhT6Bj+DX17rUrhipyOqw
	TRV1zosStwTLnzEuYOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovk8Z-00GwET-Ie; Thu, 17 Nov 2022 19:01:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovk8X-00GwE9-D3
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 19:01:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AD18621F1;
	Thu, 17 Nov 2022 19:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F29C433D6;
	Thu, 17 Nov 2022 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668711679;
	bh=J5e/2e2A0QN5e/QvG58jvwr/TirjLnTq6GC/R3sYRoU=;
	h=From:To:Cc:Subject:Date:From;
	b=iZTnGy1VC1myIEDI3AGe/Md20ChfqPmH9cCimtVx08ODlpvHuaKXSoM5K8oH+6rNM
	 zU+P9sA0nuir3N14Ip4crIHh5hwgTMKGtRArIMl9mEn73adrtY5y4CR9e2/lBrAqPu
	 V04yljRQtVtb/87LdUNXBnRGCB11TQnzsDG2zWA7VPn4dPWQpNQmW1MFh4hYCy7geV
	 D94M+gMfdGmq7F/uK5zyZAVXbCELx6tf+PQ3UZwz2GZox9WNkikUXD0eKbX/uyiGfj
	 DHwP+oNUo9fHoPIoZvvSiPPgSOG1SH27OGfmZgkIRUVqov/25wUVdO7ZW8nfsBcQb4
	 Z6/SCRQBTnAdQ==
From: Conor Dooley <conor@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] irqchip/sifive-plic: default to enabled
Date: Thu, 17 Nov 2022 18:59:43 +0000
Message-Id: <20221117185942.3896559-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_110121_524483_9BB72AF4 
X-CRM114-Status: GOOD (  17.02  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The SiFive PLIC driver is used by all current implementations, including
those that do not have a SiFive PLIC. Default the driver to enabled,
with the intention of later removing the current "every SOC selects
this" situation in Kconfig.socs at the moment.

The speculative "potential others" in the description no longer makes
any sense, as the driver is always used. Update the Kconfig symbol's
description to reflect the driver's ubiquitous state.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Hey Marc,

I recall some discussion when this driver was extended to other PLICs a
few months ago:
https://lore.kernel.org/linux-riscv/20511a05f39408c8ffbcc98923c4abd2@kernel.org/

Perhaps I got the wrong impression, but it seemed to me that you intend
for future implementations to reuse this driver where possible?

I'd like to think, and surely will be proven wrong, that ~all future
plic implementations should be similar enough to fit that bill.
It's kinda on this basis that I figure switching this thing to default y
should be okay. It's already only buildable on RISC-V & every
implementation uses it, so no difference there.

Thanks,
Conor.
---
 drivers/irqchip/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7ef9f5e696d3..6f99919ba66c 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -553,14 +553,15 @@ config RISCV_INTC
 config SIFIVE_PLIC
 	bool "SiFive Platform-Level Interrupt Controller"
 	depends on RISCV
+	default y
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
 	help
-	   This enables support for the PLIC chip found in SiFive (and
-	   potentially other) RISC-V systems.  The PLIC controls devices
-	   interrupts and connects them to each core's local interrupt
-	   controller.  Aside from timer and software interrupts, all other
-	   interrupt sources are subordinate to the PLIC.
+	   This enables support for the PLIC chip found in SiFive & other
+	   RISC-V systems.  The PLIC controls devices interrupts and connects
+	   them to each core's local interrupt controller.  Aside from timer
+	   and software interrupts, all other interrupt sources are
+	   subordinate to the PLIC.
 
 	   If you don't know what to do here, say Y.
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
