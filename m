Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22055ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3aMIxV5QwwXZ623TDQRWUChxergMZDC2SKc22YEBVc=; b=f7VHaeJS/YhShK
	KQw2nXSwRAHeC5dNh299wYll40Fh45Bb5QH/JQbeTI8P31PY2PSw7y/fd4sKRZTPq1uggv6UNhVbN
	r3G5jpPh6QA+5IOIgzgDb9TXc0To/tBTetYEywifxyeqXmaJjpS1RbIKUrqZBuGKQKIzMtEJn2m5A
	s3qXO7PJpVJSV7VluIORCSbsCsYA/om5s8b0e0rIOUPDcwNp/4FDzZ4qsllnXrLzQUgaFUFYCQA/v
	R1/rf1QpzkQESjpCmfMn996rn13UpbdOifQvQvCTD6RLOrpVTDafrWd4SI/XmZ4//HbPvgStYQm/m
	BssnBB6zZvXon3FEgoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWuc-00CgF5-S7; Mon, 31 Oct 2022 15:41:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWtR-00Cffa-Go; Mon, 31 Oct 2022 15:40:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9CAFA612E7;
	Mon, 31 Oct 2022 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD48C433D6;
	Mon, 31 Oct 2022 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230804;
	bh=Ry1yPEx/VrNVXc5mpZkvv9i5ZTht3Zoh5muiCVNjxzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oy/IOnLMkbQ7kxnquoU/2edARkafOXHPiIJq2OqrpQkGiZgvJexhCdpjG37prwLLg
	 NDs1zg8tIRJwDr4H2monx6M6P8WUjH2T7eQqaJdK09Xcd2VfnZuWzcImqEgbPl1epE
	 wtcqpp0KKL8gbtORGYeoBMBfhHw3ZZyLXzvEEPVY8v8P1GgOvMBS+UX3sP9ySSwaLm
	 NsOrv2PW/Mhv9f+24QK03QLBoS7u+WNhKL9A5ps0SHLGjArc22j4hUnA4LCWzgwVhf
	 yKkEneeNNyULguuHRvrB6p0UvlVwEimpyZJT6DK5dETWRXrdNtSTaeacaQ/l6qRItH
	 2vzfLen3Rxu9g==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Toan Le <toan@os.amperecomputing.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v3 2/5] PCI: microchip: Include <linux/irqdomain.h> explicitly
Date: Mon, 31 Oct 2022 10:39:51 -0500
Message-Id: <20221031153954.1163623-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
References: <20221031153954.1163623-1-helgaas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_084005_628503_22953B9E 
X-CRM114-Status: GOOD (  10.62  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

pcie-microchip-host.c uses irq_domain_add_linear() and related interfaces,
so it needs <linux/irqdomain.h> but doesn't include it directly; it relies
on the fact that <linux/of_irq.h> includes it.

But pcie-microchip-host.c *doesn't* need <linux/of_irq.h> itself.  Include
<linux/irqdomain.h> directly to remove this implicit dependency so a future
patch can drop <linux/of_irq.h>.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 7263d175b5ad..57b2a62f52c8 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
