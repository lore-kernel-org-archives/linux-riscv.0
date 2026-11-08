Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327D4606A331
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sAUjOTxe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=Fx2EmbYc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1gemmc6tLAXI/IodzgSMc9ZvOmDtgMIvP93/ZfQMWB8=; b=sAUjOTxeA+X91eNfr1cfotRU53
	QOAWNXJ2cO19fJPWep/sF7VVIEEuhCiKd8ZKXQbkiutjTS8i9GFwh+8e20qtyNnRZD1dgZ1kREqY6
	zL0xuGsF5BaLlsf80ejSGoFO0ZMxI7kwlkrcVbxIncvP0A4Ye1mlITmu55hnVewix54xDCEUa1u5C
	jvULlNPrqTzHvfYuldJWnwOHL/cTMmj+Xfv+QQOy8QFVguhUXjZL0rZTEjaIU1LBPKWQUHPIz09nP
	dk/cyFVgqGxKXbjUv5+4ll8GFmKBwERCU9HyCYs8Eg5EpTw8DGf8DmocMJj/2nN/JTDDxMqeFnf5u
	1u2p6cFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0a1-0000000G0OM-0Eyt;
	Sun, 08 Nov 2026 10:56:57 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0Zw-0000000G0Mn-27D0;
	Sun, 08 Nov 2026 10:56:55 +0000
Received: from LAPTOP-99KJFSET (unknown [223.75.64.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e3dfddc;
	Sun, 8 Nov 2026 18:56:45 +0800 (GMT+08:00)
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
Subject: [PATCH 2/3] PCI: microchip: Fix ECAM config window use-after-free
Date: Sun,  8 Nov 2026 18:56:38 +0800
Message-ID: <20261108105640.875-3-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261108105640.875-1-getshell@seu.edu.cn>
References: <20261108105640.875-1-getshell@seu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1bacdb3b703a1kunm546e4281ce69c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUlMVklLQk0eHUhIQhpNQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTE5VTU9VQ0lZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Fx2EmbYcTelZqH92CqZdzGbSV16vLlYNdGGMORlC5U++gI3ZH1AUWAHr2Cz3rvlORmhI6JeCg5H/hOXkui3QDezjd5OC8NLDl1dMiXTwb6Zhg8YBy4EHCc6hPH7BO9Ltktkobbd2FU/XbjVPVL9t8dWEPqlMFRlZg2X9nb22qPM=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=cdRs1y/AAehQi9CrjP0m/d+HyxgJqc5pCMHkj04zq68=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_025653_159809_543EC7B6 
X-CRM114-Status: UNSURE (   8.57  )
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

mc_host_probe() calls pci_host_common_probe() but has no ->remove, so an
unbind only runs devres_release_all(): gen_pci_unmap_cfg() ->
pci_ecam_free() frees the ECAM config window while the bus tree stays
registered - only pci_remove_bus() unlinks a bus, and only
pci_host_common_remove() reaches it for a root bus.  The next config access
is a use-after-free in pci_ecam_map_bus(), which reads cfg->ops->bus_shift.
Trigger: overlay rmdir in configfs, not rmmod (builtin_platform_driver()).

Fix: add .remove = pci_host_common_remove, as pci-host-generic.c does since
commit 01fcb7f777a9 ("PCI: Add support for unbinding the generic PCI host
controller"), so pci_remove_root_bus() unlinks the bus before devres frees
cfg.  Scope: the PLDA IRQ domains it creates are not devres managed and
stay unreleased - a separate, pre-existing issue.

Fixes: 6f15a9c9f941 ("PCI: microchip: Add Microchip PolarFire PCIe controller driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/pci/controller/plda/pcie-microchip-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index 24bbf93b8051..f7b75013d9fc 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -821,6 +821,7 @@ MODULE_DEVICE_TABLE(of, mc_pcie_of_match);
 
 static struct platform_driver mc_pcie_driver = {
 	.probe = mc_host_probe,
+	.remove = pci_host_common_remove,
 	.driver = {
 		.name = "microchip-pcie",
 		.of_match_table = mc_pcie_of_match,
-- 
2.50.1.windows.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
