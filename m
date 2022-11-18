Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6DCC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 10:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toW+oE5QTUbhLJ+KQoeIsPYKdl+/INyACABUhWY4IWc=; b=lr4Jg33bny6WkK
	wKH6cHSk1cHPtWxbSdSJl+i/bCzJ/wB1f961Tf2Mwjz9aYnIXa6NcH7nQj+he/xA4R/gCWYY8pRgI
	357bk1vFbPJFplpAY/fBFii2cptOdI1ufARO55QXDRiSx9oiJCmQNAkTHDm8mlZQd1+NCZuWuf429
	JeGuM9nNEjzSz0+V+XX2nbHQN4YOK9YIoSFfFJZANZNTZM62IGluv4oGLRq+D9IypofKfGnA+3aks
	kp8In0TR9Cs1IHv4XQuiBGZCKT4Hald7WKLnM6orbl1rz9zerIK9EsuFX2PiC+rGwvaCoH2E3cntK
	Ae/zZZYuMK+dSiCefIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyrc-003RyE-3V; Fri, 18 Nov 2022 10:44:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyrV-003Ru2-DG
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 10:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0CC06242B;
	Fri, 18 Nov 2022 10:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B96C433D6;
	Fri, 18 Nov 2022 10:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668768284;
	bh=t5nmuhVmPEECjMyF20fPQ/HD3rLK842K2g6ySIOFp9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmMSKttGMZ3AG9ET4Jzmho3+5+Vd45Hc+eDHFJZLb8pz6PJUbKHtiwGo9TSQzCPSJ
	 2T+jej+c3ShC9rBnI2R/p7myQvrMxTnjGsKrcNxk75RVM833DjMTKyEugeqxe6x6Tg
	 oFYgGCLNqRKJhKqBqJ3r+UkhJrnvRVQwjtwIKOiiGm3514UFRylbM6vTwwZ0CoYiLg
	 tqzSZexildsZfn03p0P6U5XGtVCnkKvzfMfg0ElKfJZvuwIzhB43Vrd713V5Ustmdj
	 yP6lXdwTI6mFT96q6xvDGlKD2Eukh4Ct/Ae90MgBbbmgvuE81t7FjeUM6Xm2+f5yJX
	 ea8l/4SqF4ebw==
From: Conor Dooley <conor@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] irqchip/sifive-plic: remove user selectability of SIFIVE_PLIC
Date: Fri, 18 Nov 2022 10:42:59 +0000
Message-Id: <20221118104300.85016-2-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118104300.85016-1-conor@kernel.org>
References: <20221118104300.85016-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_024445_509173_F7243E32 
X-CRM114-Status: GOOD (  14.79  )
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
those that do not have a SiFive PLIC. The current driver supports more
than just SiFive PLICs at present and, where possible, future PLIC
implementations will also use this driver. As every supported RISC-V SoC
selects the driver directly in Kconfig.socs there's no point in exposing
this kconfig option to users.

The Kconfig help text, in its current form, is misleading. There's no
point doing anything about that though, as it will no longer be user
selectable. Remove it.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/irqchip/Kconfig | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 7ef9f5e696d3..ecb3e3119d2e 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -551,18 +551,10 @@ config RISCV_INTC
 	   If you don't know what to do here, say Y.
 
 config SIFIVE_PLIC
-	bool "SiFive Platform-Level Interrupt Controller"
+	bool
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP
-	help
-	   This enables support for the PLIC chip found in SiFive (and
-	   potentially other) RISC-V systems.  The PLIC controls devices
-	   interrupts and connects them to each core's local interrupt
-	   controller.  Aside from timer and software interrupts, all other
-	   interrupt sources are subordinate to the PLIC.
-
-	   If you don't know what to do here, say Y.
 
 config EXYNOS_IRQ_COMBINER
 	bool "Samsung Exynos IRQ combiner support" if COMPILE_TEST
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
