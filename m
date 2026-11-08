Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17056606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hwRIF30e;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=TkyLtaea
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D/O8nA2MPtuUKBrPPqMxFEDbAE740BEHQbeuGwC+ltM=; b=hwRIF30e1Af5sifyqmKRVNLaLv
	KwpSDmG97HRzfcTo1YtsASllmHBJyncx/CiC8Op8wagMu6MFmTSvPy2rZfrk1dcKnzrcPjJhHjxVS
	nf/F9QMIAzyEmnixi3dBBx9EDgDUh0Ptp3wLIv4eXqmRfId80eqJfosyxqWjvvCFGBST74JTBG7NB
	DuSicnH+cjufqdo1gR2i8CSZx8BIjQKQjJfoRd3YUJxAA91kGFy2Pb+TNbO1CGz8WrO8RE2+7bBby
	Od1teNgQDDplM9EypIP2whLf/D6wZ9Zxj069A3muD4qUNnsdsjeEibB8AzMtJ6/V45+JYBWwnAfl+
	hA/cQRtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0a3-0000000G0Q3-1yNZ;
	Sun, 08 Nov 2026 10:56:59 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0Zy-0000000G0Ml-1M4F;
	Sun, 08 Nov 2026 10:56:56 +0000
Received: from LAPTOP-99KJFSET (unknown [223.75.64.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e3dfdda;
	Sun, 8 Nov 2026 18:56:43 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Robert Richter <rric@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH 1/3] PCI: apple: Fix ECAM config window use-after-free
Date: Sun,  8 Nov 2026 18:56:37 +0800
Message-ID: <20261108105640.875-2-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261108105640.875-1-getshell@seu.edu.cn>
References: <20261108105640.875-1-getshell@seu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1bacdac5103a1kunm546e4281ce699
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU1CVhpMGUJPSxhMThhCS1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTE5VTU9VQ0lZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQk
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=TkyLtaeaGRYaWaR08vym002xhqiPJty9Igz67U9WHKDH1KRi5m4YECuVnF87xHBMvmRijKYmt1SsdDcbQcsSO6ezhfRTl0Vbn8aOZ1F9/KLgLpLf1IjsgD9T52MrZN8E15wtVobzquPYDHYYwUPuqBb11d3SESEw7482kYZ8Q4k=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=LQfWZFMR9WFMzlyRF7ueDqFRTYrzGXVUt1ZgeBbyRAQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_025654_595254_39B42C41 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pcie-apple.c has no ->remove for pci_host_common_init(), so unbinding only
runs devres_release_all(): gen_pci_unmap_cfg() -> pci_ecam_free() frees the
ECAM config window while the bus tree stays registered - only
pci_remove_bus() unlinks a bus, and only pci_host_common_remove() reaches
it for a root bus.  The next config access is a use-after-free in
pci_ecam_map_bus(), which reads cfg->ops->bus_shift.
Trigger: CONFIG_PCIE_APPLE=m; as root, one command: # rmmod apple_pcie

Fix: add .remove = pci_host_common_remove, as pci-host-generic.c does since
commit 01fcb7f777a9 ("PCI: Add support for unbinding the generic PCI host
controller"), so pci_remove_root_bus() unlinks the bus before devres frees
cfg.  Scope: cfg lifetime only; its IRQ handlers stay unreleased, so the
module is still unsafe to unload.

Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
Cc: stable@vger.kernel.org
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/pci/controller/pcie-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 2d92fc79f6dd..805171551e01 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -884,6 +884,7 @@ MODULE_DEVICE_TABLE(of, apple_pcie_of_match);
 
 static struct platform_driver apple_pcie_driver = {
 	.probe	= apple_pcie_probe,
+	.remove	= pci_host_common_remove,
 	.driver	= {
 		.name			= "pcie-apple",
 		.of_match_table		= apple_pcie_of_match,
-- 
2.50.1.windows.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
