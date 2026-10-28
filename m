Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F2660A2614
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=siNqt+bb;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cxmqqI8v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lCL4hZdHCNyio56hPPhStR13DXyWTRTiITbQzhyYAmk=; b=siNqt+bb5QUUhgaMC2seZ1nOq8
	u0aa50nOTn5BrAbP3KwykFW85FaSeF7MEb4YXL6yRJt7qMIinov9l4/cOuvkC80BJs/tWOzHcOTw3
	aNZKGq5cMm2+wSYViH3ehj9RGhtBP9Rx+/sUiQ5GOYYYu3tH915een/6iGgGXnkdWhpYIk6WdPRaZ
	YuUC5WtR+z5EOTETI/zgrj3brACRjKnUcU1yQSGNHgeGWyvEsoU543xrhXkwBqmpFW/2zQqv+jwz2
	mOkKjLfsN7VmYqCurmP7e/B6shT10dkZKlhVXoMBawZvdczIc68/b8Z89LCz2gODyI+OaF/OGlP3N
	rWdxud/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0i-00000006929-1iRm;
	Wed, 28 Oct 2026 03:07:32 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0X-000000068ZZ-37RS;
	Wed, 28 Oct 2026 03:07:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=U8
	0Wmdsj12fusZWg64ofRVwUMzzXEmzCkUfqbRVT4lc=; b=cxmqqI8vb7VAeGamUa
	L+ah58/1rzK2nAEkKUGB+Mcsu+KQajbzlvlpHTX34yrE1p0j0+U/pJf32Z7uOjjM
	bhWAO149qlw6WVR6EolQhQ8UFN6HSAd5+REfz1VLjykS9Z/pqmgwhKtYq1+hX95h
	ZH63h1HSKzSzjIPWEuvb4Q62Q=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnD07QZuFqZiY4DA--.60713S4;
	Wed, 28 Oct 2026 11:07:00 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v5 02/16] PCI: dwc: Use cached PCIe capability offset in core
Date: Wed, 28 Oct 2026 11:06:38 +0800
Message-ID: <20261028030652.2917756-3-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnD07QZuFqZiY4DA--.60713S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxXry3AF4UurW3tw45Ary8Grg_yoWrJr1rpa
	y5JFyYyFy8AF45ZFs2vas3ZF15tF9xArW7Ga9agrnI9Fy2yFZFga10yry3tFn2yFsFkrya
	9r1Utr15Cwn3JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziDDG8UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BThhWrhZtTO4QAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200722_181830_955CCEDA 
X-CRM114-Status: GOOD (  11.62  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Convert the DWC core users of
dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to dw_pcie_get_pcie_cap():

  dw_pcie_wait_for_link()
  dw_pcie_link_set_max_speed()
  dw_pcie_link_get_max_link_width()
  dw_pcie_link_set_max_link_width()
  dw_pcie_ep_init_non_sticky_registers()

These functions are reached in exactly the same situations in which the
replaced dw_pcie_find_capability() call used to be executed, so DBI is
accessible whenever the helper performs its first lookup. Because the
lookup happens at the point of use, there is no window in which
pci->pcie_cap could be used uninitialized, neither in Root Complex nor
in Endpoint mode.

While at it, remove the now redundant capability lookup in
dw_pcie_link_get_max_link_width(): the offset variable it filled is the
one used for the register access.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 2 +-
 drivers/pci/controller/dwc/pcie-designware.c    | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 630ba172280c2..b410f6ebed4ba 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -1268,7 +1268,7 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
 	 * to all other functions as well.
 	 */
 	if (funcs > 1) {
-		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+		offset = dw_pcie_get_pcie_cap(pci);
 		func0_lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 		func0_lnkcap = FIELD_GET(PCI_EXP_LNKCAP_MLW |
 					 PCI_EXP_LNKCAP_SLS, func0_lnkcap);
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 074b007dc2963..c5a6c6cba4da0 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -808,7 +808,7 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci)
 
 	pci_host_common_link_train_delay(pci->max_link_speed);
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
 
 	dev_info(pci->dev, "PCIe Gen.%u x%u link up\n",
@@ -846,7 +846,7 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 {
 	u32 cap, ctrl2;
 	enum pci_bus_speed link_speed;
-	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 offset = dw_pcie_get_pcie_cap(pci);
 	u16 ctrl2_speed;
 
 	cap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
@@ -881,7 +881,7 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci)
 
 int dw_pcie_link_get_max_link_width(struct dw_pcie *pci)
 {
-	u8 cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 cap = dw_pcie_get_pcie_cap(pci);
 	u32 lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
 
 	return FIELD_GET(PCI_EXP_LNKCAP_MLW, lnkcap);
@@ -927,7 +927,7 @@ static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
 	dw_pcie_writel_dbi(pci, PORT_LINK_CTRL, plc);
 	dw_pcie_writel_dbi(pci, LINK_WIDTH_SPEED_CTRL, lwsc);
 
-	cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap = dw_pcie_get_pcie_cap(pci);
 	lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_MLW, &lnkcap, num_lanes);
 	dw_pcie_writel_dbi(pci, cap + PCI_EXP_LNKCAP, lnkcap);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
