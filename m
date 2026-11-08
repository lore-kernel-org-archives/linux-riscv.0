Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70D606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HzgeH+2Y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.a=rsa-sha256 header.s=default header.b=JI2SHRd+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tplyrIb7vOivKNUE20JVigD6ludAS6qUge1X/jNc/v0=; b=HzgeH+2Yoc+SEbSFKYrQ8bXaQT
	QiJHaZhPR+hZeAXOQB6Dq7BtU4ydtdqovfIfwhlHCPEFdDBwL/XKgUT5dIlFj1/e/oNkF7rh6Lw93
	Kbta9uyb0ALae9dUGV2p+l2LsjkeHzkfoYtDIf2OciJ/i+uCuGD0WMDQVDqIb0g+nHSzwBVIZdRvG
	bERMAfAfnr2GAHXQCeDmx5+Jz00IuvCdOu+3mEtoItY6ndIqqGfYz/rgYvLbB1vbT0CWCiUZ9uaBG
	UTgDGMvZTSLu9WX93J/9rgGo10AZcZ1GcMeN0HF0S/6bdErb6W0U4unefO3IovwqH3d2DLHyJGkTB
	MWxnbUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0a3-0000000G0Ql-3fOo;
	Sun, 08 Nov 2026 10:56:59 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0Zy-0000000G0Mr-1qmh;
	Sun, 08 Nov 2026 10:56:56 +0000
Received: from LAPTOP-99KJFSET (unknown [223.75.64.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53e3dfddd;
	Sun, 8 Nov 2026 18:56:48 +0800 (GMT+08:00)
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
Subject: [PATCH 3/3] PCI: thunder-pem, hisi, thunder-ecam: Fix ECAM config window use-after-free
Date: Sun,  8 Nov 2026 18:56:39 +0800
Message-ID: <20261108105640.875-4-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <20261108105640.875-1-getshell@seu.edu.cn>
References: <20261108105640.875-1-getshell@seu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-HM-Tid: 0aa1bacdc09e03a1kunm546e4281ce6a2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTh5CVk1IT0pPGE5KTk5KTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVTE5VTU9VQ0lZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=JI2SHRd+d4qXYwm/HlVVAO5CXJVIq7ZExY8nssZU4EsKtWnijZyxuQeT3JMyDaaawUk5HhslsUmnuI1fvbGCuFfURSB68wFgSs8PE152dW45g5Ocy1+xLM5ut+eMZHZkf+nCGTUjiYDkHZjEHcrbz+9eDuV4J/m07ExRzJYtfu4=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=I+5UhrKHWPFimXJb6iMkG7rTcVnU0t1KgM7myG4qjl4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_025654_678113_9F029CE2 
X-CRM114-Status: GOOD (  11.15  )
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

thunder-pem, hisi and thunder-ecam set .probe = pci_host_common_probe but
have no ->remove, so unbinding only runs devres_release_all():
gen_pci_unmap_cfg() -> pci_ecam_free() frees the ECAM config window while
the bus tree stays registered - only pci_remove_bus() unlinks a bus, and
only pci_host_common_remove() reaches it for a root bus.  The next config
access in pci_ecam_map_bus() reads cfg->ops->bus_shift.
Trigger: DT overlay removal of the node that supplied or enabled it.

Fix: give each driver the same .remove = pci_host_common_remove that
pci-host-generic.c got in commit 01fcb7f777a9 ("PCI: Add support for
unbinding the generic PCI host controller"), so the unlink comes first.

Fixes: f12b76e56ada ("PCI: thunder: Add PCIe host driver for ThunderX processors")
Fixes: a2ec1996098c ("PCI: hisi: Add DT almost-ECAM support for Hip06/Hip07 host controllers")
Fixes: 7b6e7ba8e81a ("PCI: thunder: Add driver for ThunderX-pass{1,2} on-chip devices")
Cc: stable@vger.kernel.org
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/pci/controller/dwc/pcie-hisi.c    | 1 +
 drivers/pci/controller/pci-thunder-ecam.c | 1 +
 drivers/pci/controller/pci-thunder-pem.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-hisi.c b/drivers/pci/controller/dwc/pcie-hisi.c
index 3c17897e56fc..5ed58e5db797 100644
--- a/drivers/pci/controller/dwc/pcie-hisi.c
+++ b/drivers/pci/controller/dwc/pcie-hisi.c
@@ -169,6 +169,7 @@ static const struct of_device_id hisi_pcie_almost_ecam_of_match[] = {
 
 static struct platform_driver hisi_pcie_almost_ecam_driver = {
 	.probe  = pci_host_common_probe,
+	.remove = pci_host_common_remove,
 	.driver = {
 		   .name = "hisi-pcie-almost-ecam",
 		   .of_match_table = hisi_pcie_almost_ecam_of_match,
diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index b5b4a958e6a2..4745f5d00b5a 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -358,6 +358,7 @@ static struct platform_driver thunder_ecam_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = pci_host_common_probe,
+	.remove = pci_host_common_remove,
 };
 builtin_platform_driver(thunder_ecam_driver);
 
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index 5fa037fb61dc..80cabbf263be 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -474,6 +474,7 @@ static struct platform_driver thunder_pem_driver = {
 		.suppress_bind_attrs = true,
 	},
 	.probe = pci_host_common_probe,
+	.remove = pci_host_common_remove,
 };
 builtin_platform_driver(thunder_pem_driver);
 
-- 
2.50.1.windows.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
