Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3401C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C13H891MZzYxEIHkbBnqH4YWYebozcZvJYFB5euFf0g=; b=E0Irg++kPihJ8Q
	RZCAuQXMIDT9ulhla+5EDp52AHCs3HbE8DsczCVDPrQaWU43XTIvQYL5sFq4PqjksQmx9ZWO12jxF
	YBZJqiJyIJvw2z85ALBFVbNCOwAogkM2q1K9oRHZ565uthGrI2y64F/F6fqgPZg9o27SkE3WKHrNR
	bUGuxGN1Nh6jLfRj+BwqXCBCAygXdImNyCdvWW0+KXrLOmjlPsVytACzqW+MZoUfE52btdR9RNte9
	/+IMiOS50nX4LXc9Hk0opQPDsrD6UfCi8NFW1y2k5uD52xsxpuhKJdE5ZHH0ln8O4Kn8hEwcT9x0B
	C9vdm/vQk1mUfJrl+eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURU7-000000091rN-1rNT;
	Wed, 25 Jun 2025 14:52:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO8r-00000008Rm4-3Plj;
	Wed, 25 Jun 2025 11:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 747DA49D45;
	Wed, 25 Jun 2025 11:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0192BC4CEEE;
	Wed, 25 Jun 2025 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850293;
	bh=WsJdVrVj4ofp0/SbGBVzpnHuyNRsJKf/ry9C4XCbF/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAC/31ewbo3QRxuZFSw8EzTDwqv0ipowojGvEixFYHuMktkG6s2giUtNp0SuPPF0a
	 DrXI3ppULXIh3Q2V9TLEvSvxuf/ib4r7cQuxas3i2YkzYNoB2XWQd3J9Cnq6dURVtK
	 cqntZn7fgXL0HBGHU606I8Bm07dTzggoSFNrOg3/LAozktKiE68S9AC4DSS3D99C77
	 kSMn8Br/yMqbOr5JRsFgklnN3JldxafPjV4rvyahmGY98oALjhs+7mfi+PFNGGUhj0
	 M+w8s5qXide6KXAUU7grkP7XmQVBExYXUJ82YwxBehgTi+5rrAyTgTT4uSEm1L4wLy
	 Iaq7eMRlKAguQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uUO8o-009qM2-Us;
	Wed, 25 Jun 2025 12:18:11 +0100
From: Marc Zyngier <maz@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] PCI: host-generic: Set driver_data before calling gen_pci_init()
Date: Wed, 25 Jun 2025 12:18:04 +0100
Message-Id: <20250625111806.4153773-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250625111806.4153773-1-maz@kernel.org>
References: <20250625111806.4153773-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: bhelgaas@google.com, alyssa@rosenzweig.io, robh@kernel.org, mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org, j@jannau.net, geert+renesas@glider.be, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_041813_901892_867DA878 
X-CRM114-Status: GOOD (  13.13  )
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

On MicroChip MPFS Icicle:

    microchip-pcie 2000000000.pcie: host bridge /soc/pcie@2000000000 ranges:
    microchip-pcie 2000000000.pcie: Parsing ranges property...
    microchip-pcie 2000000000.pcie:      MEM 0x2008000000..0x2087ffffff -> 0x0008000000
    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000368
    Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x00000000814f1000
    [0000000000000368] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
    Oops [#1]
    Modules linked in:
    CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-rc1-icicle-00003-gafc0a570bb61 #232 NONE
    Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
    [...]
    [<ffffffff803fb8a4>] plda_pcie_setup_iomems+0xe/0x78
    [<ffffffff803fc246>] mc_platform_init+0x80/0x1d2
    [<ffffffff803f9c88>] pci_ecam_create+0x104/0x1e2
    [<ffffffff8000adbe>] pci_host_common_init+0x120/0x228
    [<ffffffff8000af42>] pci_host_common_probe+0x7c/0x8a

The initialization of driver_data was moved after the call to
gen_pci_init(), while the pci_ecam_ops.init() callback
mc_platform_init() expects it has already been initialized.

Fix this by moving the initialization of driver_data up.

Fixes: afc0a570bb613871 ("PCI: host-generic: Extract an ECAM bridge creation helper from pci_host_common_probe()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/r/774290708a6f0f683711914fda110742c18a7fb2.1750787223.git.geert+renesas@glider.be
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-host-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index b0992325dd65f..b370528638471 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -64,13 +64,13 @@ int pci_host_common_init(struct platform_device *pdev,
 
 	of_pci_check_probe_only();
 
+	platform_set_drvdata(pdev, bridge);
+
 	/* Parse and map our Configuration Space windows */
 	cfg = gen_pci_init(dev, bridge, ops);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
-	platform_set_drvdata(pdev, bridge);
-
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->enable_device = ops->enable_device;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
