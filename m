Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18956C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tVGRdD4iCWU2IYpqHUHSZJsvuyMVKyZCGNGnRImQR8g=; b=o0gmpC5e7tyJIt
	+BQB8TSzkffMUdEcouj97KUOsAlg2A8AWqtLp8siiDwYaME+kPm6RzZChJCS3UfP8Wf9zvBdD8PQP
	lYaxr866+Zpohq0e1f5stLHFQd75r7n+1RFOewuxw9Bdjmt2k/A9ceo9OJpRqgAASvE622VH2K66Z
	MfX3SFYIPGjct28LLnGtIgM+KRJliXjZY+jAFXwOJOJJOh0peJXNR4t+V+wsGl5+m4uhT3umMfgyz
	HHw6zzO4M4CggrgevabNFb5SmMTfQ+GxHl6KJdefk4P17VPRDP0U+LOSyzt5mTtvxZDORspyQNP+Y
	/N8IgTGHirBfmClCaqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG3Oj-005B97-Kk; Fri, 04 Feb 2022 18:33:29 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG3Oh-005B7p-7P
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 18:33:28 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nG3OY-0001k0-I1; Fri, 04 Feb 2022 18:33:18 +0000
Received: from ben by rainbowdash with local (Exim 4.95)
 (envelope-from <ben@rainbowdash>) id 1nG3OY-001NZg-7R;
 Fri, 04 Feb 2022 18:33:18 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: paul.walmsley@sifive.com,
	greentime.hu@sifive.com
Cc: lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] PCI: fu740: RFC: force gen1 and get devices probing
Date: Fri,  4 Feb 2022 18:33:16 +0000
Message-Id: <20220204183316.328937-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_103327_273563_3E449CD0 
X-CRM114-Status: GOOD (  11.74  )
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

The dw pcie core does not probe devices unless this fix
from u-boot is applied. The link must be changed to gen1
and then the system will see all the other pcie devices
behind the unmatched board's bridge.

This is a quick PoC to try and get our test farm working
when a system does not have the pcie initialised by a
u-boot script.

I will look at a proper patch when I am back in the office
---
 drivers/pci/controller/dwc/pcie-fu740.c | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 960e58ead5f2..44f792764e45 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -181,11 +181,48 @@ static void fu740_pcie_init_phy(struct fu740_pcie *afp)
 	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
 }
 
+/* u-boot forces system to gen1 otherwise nothing probes... */
+static void pcie_sifive_force_gen1(struct dw_pcie *dw, struct fu740_pcie *afp )
+{
+	unsigned val;
+
+#if 0
+	/* u-boot code */
+        /* ctrl_ro_wr_enable */
+        val = readl(sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
+        val |= DBI_RO_WR_EN;
+        writel(val, sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
+
+        /* configure link cap */
+        linkcap = readl(sv->dw.dbi_base + PF0_PCIE_CAP_LINK_CAP);
+        linkcap |= PCIE_LINK_CAP_MAX_SPEED_MASK;
+        writel(linkcap, sv->dw.dbi_base + PF0_PCIE_CAP_LINK_CAP);
+
+        /* ctrl_ro_wr_disable */
+        val &= ~DBI_RO_WR_EN;
+        writel(val, sv->dw.dbi_base + PCIE_MISC_CONTROL_1);
+#endif
+
+	val = readl_relaxed(dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
+	val |= PCIE_DBI_RO_WR_EN;
+	writel_relaxed(val, dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
+
+	val = readl(dw->dbi_base + 0x70 + 0x0c);
+	val |= 0xf;
+	writel(val, dw->dbi_base + 0x70 + 0x0c);
+
+	val = readl_relaxed(dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
+	val &= ~PCIE_DBI_RO_WR_EN;
+	writel_relaxed(val, dw->dbi_base +  PCIE_MISC_CONTROL_1_OFF);
+}
+
 static int fu740_pcie_start_link(struct dw_pcie *pci)
 {
 	struct device *dev = pci->dev;
 	struct fu740_pcie *afp = dev_get_drvdata(dev);
 
+	pcie_sifive_force_gen1(pci, afp);
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
