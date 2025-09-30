Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54262CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nNXOzU2VyOpHb6U/yQuThypegQ9+XzHaKvhkXNIJ4zw=; b=1jXfgLHWcw4qFd
	9uG+iTcmY9DqQewd7hRhOFl7bFpBs5ceA94bk1h9TM8QC3L4y+WIrK6iU7YyuKOKq0YhFr4nPGLpb
	1kA/oIjDsjEYrzShQIAIPZ61ctX4CgMfjQqlOiFILKS29PCfH0izjeYXwwKHmfQzPxnnB+Lyc6Ujd
	OVVuQVBQUZ3wSr3Zw1avbrmNhfwsR2lj6Enal+6ddm203ibZNx8ody9WBP5F4aAX+9avYzCiwqF+E
	oFhuNpyZlbU9u4xLDldDWknJDxYdhkC4fM6cvi9M4lqdjMVuv1ge2AL8hLjGgqxVKrTTimbuhQn97
	8aP9RRDw14PSO3rgmn/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bgU-00000005YZ0-1XXJ;
	Tue, 30 Sep 2025 14:50:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3bgT-00000005YYo-0jNv
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 14:50:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B325605EE;
	Tue, 30 Sep 2025 14:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EB4C113D0;
	Tue, 30 Sep 2025 14:50:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: COMMON_CLK_RPMI should depend on RISCV
Date: Tue, 30 Sep 2025 16:50:23 +0200
Message-ID: <ed37635b59b0765ed3dbed6ea33c562a40b9e287.1759243789.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

The RISC-V platform management interface (RPMI) is only available on
RISC-V platforms.  Hence add a dependency on RISCV, to prevent asking
the user about this driver when configuring a kernel for a different
architecture.

Fixes: 5ba9f520f41a33c9 ("clk: Add clock driver for the RISC-V RPMI clock service group")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
And perhaps the "default RISCV" should be dropped, too?
---
 drivers/clk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b03fafb402b19153..5c17a22d59920f5e 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -510,6 +510,7 @@ config COMMON_CLK_LITEX
 
 config COMMON_CLK_RPMI
 	tristate "Clock driver based on RISC-V RPMI"
+	depends on RISCV || COMPILE_TEST
 	depends on MAILBOX
 	default RISCV
 	help
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
