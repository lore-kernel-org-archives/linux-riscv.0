Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2E8C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 20:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UWc8EP4whOj2mkwt/trTm3b0/UVh88L0ICVonECMqzU=; b=AIwnTVtBVqGEQE
	WmzjSZ9XG2YYGQomxnLbOC0DIvpvFpOsDult+Fh/n7JK3JaTOR+lgF95DH4Hd842GPrDZZNmVey2M
	7Z1vNsRkJI3TzHhAfQgL/0Rmg3mV1HxwFcdBnEntb1mLDOXLRnFMfcrsj/fW5ah6SU8udde+uThdG
	6c6uNa+ZKB77CiEg38j5fxwniticymAt3W7PLttulgOg4+Z7gRvYhKgtx2BG/9wUhM5+JpMshs6yY
	vy1NYP8IST48tjI+XF9/yhvdkLR3+z71esY0JllE40ATJQQW10bDfqPO+0X9XVkY4Lt3X0jedIjJb
	2ex7y1tB9Y5u/8kKtC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMFRt-007EAv-Ee; Mon, 21 Feb 2022 20:38:21 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMFRq-007E9J-Is
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 20:38:20 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nMFRc-0001sl-R8; Mon, 21 Feb 2022 20:38:04 +0000
Received: from ben by rainbowdash with local (Exim 4.95)
 (envelope-from <ben@rainbowdash>) id 1nMFRc-005amP-8f;
 Mon, 21 Feb 2022 20:38:04 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: paul.walmsley@sifive.com,
	greentime.hu@sifive.com
Cc: lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [[PATCHv3]] PCI: fu740: Force gen1 for initial device probe
Date: Mon, 21 Feb 2022 20:38:03 +0000
Message-Id: <20220221203803.1333012-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_123818_629454_6EF314A8 
X-CRM114-Status: GOOD (  12.32  )
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

The fu740 PCIe core does not probe any devices on the SiFive Unmatched
board without this fix from U-Boot (or having U-Boot explicitly start
the PCIe via either boot-script or user command).

The fix claims to set the link-speed to gen1 to get the probe
to work. As this is a copy from U-Boot, the code is assumed to be
correct and does fix the issue on the Unmatched. The code is at:
https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c#L271

The code has been this way since the driver was commited in:
https://source.denx.de/u-boot/u-boot/-/commit/416395c772018c6bf52aad36aca163115001793f

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 842b7202b96e..19501ec8c487 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -177,11 +177,30 @@ static void fu740_pcie_init_phy(struct fu740_pcie *afp)
 	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
 }
 
+/* This is copied from u-boot. Force system to gen1 otherwise nothing probes
+ * as found on the SiFive Unmatched board.
+ */
+static void fu740_pcie_force_gen1(struct dw_pcie *dw, struct fu740_pcie *afp )
+{
+	unsigned val;
+
+	dw_pcie_dbi_ro_wr_en(dw);
+
+	val = dw_pcie_readl_dbi(dw, 0x70 + PCI_EXP_LNKCAP);
+	pr_info("%s: link-cap was %08x\n", __func__, val);
+	dw_pcie_writel_dbi(dw, 0x70 + PCI_EXP_LNKCAP, val | 0xf);
+
+	dw_pcie_dbi_ro_wr_dis(dw);
+}
+
 static int fu740_pcie_start_link(struct dw_pcie *pci)
 {
 	struct device *dev = pci->dev;
 	struct fu740_pcie *afp = dev_get_drvdata(dev);
 
+	/* Force PCIe gen1 otherwise Unmatched board does not probe */
+	fu740_pcie_force_gen1(pci, afp);
+
 	/* Enable LTSSM */
 	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
