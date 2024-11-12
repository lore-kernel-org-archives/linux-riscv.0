Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1BDD42B9C
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 15:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9NiASiauoiWYVGPxh6nNCdr3LgCeI+LTQUDK5CfkRaU=; b=fb/vzGyq7Dg9K1
	UBr/iyt2GtGoF88Nttg0G/E30spy1kvQectTiBZujwIAgNzX/NzV/8u2JjcpnuX2TiKvYkX/KwoJM
	NJKvINI5v9A300FYc9j4HrjshjBTteWGi5DwCqCvKHM4LQlp0hr3784cJtDTx9sLorVqrV8HyiZgX
	SMu51scXnyINgFVyacRhmorjQFlLoQgaRrH8fgppSwD7LaAXfEL6n/hA0KWBjGeTXs+CpSUd8EtqE
	amoimHzxizcXlw4zf3i+T3i57KoXlFrCR3LBt2TPspRUR9pQDbkGz0yohrtvuEEvOqOX6wMaI22RE
	KsaAQA6SX7kXdwTu2sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAss4-00000003xqB-05mz;
	Tue, 12 Nov 2024 15:32:00 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAss1-00000003xpZ-0BTg
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 15:31:58 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:78de:3cf6:79c5:d375])
	by michel.telenet-ops.be with cmsmtp
	id brXt2D0074mJWgD06rXtvh; Tue, 12 Nov 2024 16:31:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAsrb-006q6y-Tb;
	Tue, 12 Nov 2024 16:31:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAsrx-001fBf-BE;
	Tue, 12 Nov 2024 16:31:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Inochi Amaoto <inochiama@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] irqchip: THEAD_C901_ACLINT_SSWI should depend on ARCH_THEAD
Date: Tue, 12 Nov 2024 16:31:51 +0100
Message-Id: <1097d054ed4c67f714679de1253e45a034e647a0.1731425416.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_073157_238518_34D3FA39 
X-CRM114-Status: UNSURE (   8.76  )
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

The T-HEAD ACLINT S-mode IPI Interrupt Controller is only present on
T-HEAD SoCs.  Hence add a dependency on ARCH_THEAD, to prevent asking
the user about this driver when configuring a kernel without T-HEAD SoC
support.

Fixes: 25caea955cc95050 ("irqchip: Add T-HEAD C900 ACLINT SSWI driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 28c19bde55206847..3f4cfcbecc5a4041 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -617,6 +617,7 @@ config THEAD_C900_ACLINT_SSWI
 	bool "THEAD C9XX ACLINT S-mode IPI Interrupt Controller"
 	depends on RISCV
 	depends on SMP
+	depends on ARCH_THEAD || COMPILE_TEST
 	select IRQ_DOMAIN_HIERARCHY
 	select GENERIC_IRQ_IPI_MUX
 	help
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
