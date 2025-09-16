Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899BACAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSrm9wVSCkVQnR+zMpSlFgQF2a6pBY7srw4EAUGv0Sg=; b=zg3kz9Y5nt+5kx
	b02G9ML1JVGeQPmrZ7ep/2ysoR9Ds8nqBBUIoZS9AAKPKnxAPIvF9FzUB7XeCHrM1Op1ehU0jezAp
	7QiwWsUs178d26qaF0hOCx4xsMn0BAKVAWaGYkJBecADAKrpYxvgHskyTpw5kCsGewyfAqY/CnGO9
	6sl3gMZoBaffSK7gPDU1u4XOL4lB23Bm5eD5t7VOt3n5WUZTi0wa2HNFC/q8YzvLqH1ZZX4rBQSqX
	7a6aW5+PDqW1Dt8BZYsbLc60+MnX8WHTOEdxbHTeu4neAVwPxV9Xpw23dMlDF74B0DfxZfIwIWhPM
	WqYQslgtUEY+eInglpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyT3J-00000007YV3-33hQ;
	Tue, 16 Sep 2025 10:36:49 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyT3G-00000007YSE-3KY6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 10:36:48 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 58GA7Wgf069516
	for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 18:07:32 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 58GA4PEC067798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Sep 2025 18:04:25 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Tue, 16 Sep 2025
 18:04:25 +0800
From: Randolph Lin <randolph@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <jingoohan1@gmail.com>,
        <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <ben717@andestech.com>, <inochiama@gmail.com>,
        <thippeswamy.havalige@amd.com>, <namcao@linutronix.de>,
        <shradha.t@samsung.com>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v2 1/5] PCI: dwc: Add outbound ATU address range validation callback
Date: Tue, 16 Sep 2025 18:04:13 +0800
Message-ID: <20250916100417.3036847-2-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916100417.3036847-1-randolph@andestech.com>
References: <20250916100417.3036847-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 58GA7Wgf069516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_033647_157454_6C417458 
X-CRM114-Status: GOOD (  11.67  )
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

Introduce an optional callback for outbound ATU address range
validation to handle cases that deviate from the generic check.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 29 ++++++++++++++++----
 drivers/pci/controller/dwc/pcie-designware.h |  3 ++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 89aad5a08928..087f9077cf21 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -528,6 +528,28 @@ static inline u32 dw_pcie_enable_ecrc(u32 val)
 	return val | PCIE_ATU_TD;
 }
 
+static
+bool dw_pcie_outbound_atu_addr_valid(struct dw_pcie *pci,
+				     const struct dw_pcie_ob_atu_cfg *atu,
+				     u64 *limit_addr)
+{
+	u64 parent_bus_addr = atu->parent_bus_addr;
+
+	if (pci->ops && pci->ops->outbound_atu_addr_valid)
+		return pci->ops->outbound_atu_addr_valid(pci, atu, limit_addr);
+
+	*limit_addr = parent_bus_addr + atu->size - 1;
+
+	if ((*limit_addr & ~pci->region_limit) !=
+	    (parent_bus_addr & ~pci->region_limit) ||
+	    !IS_ALIGNED(parent_bus_addr, pci->region_align) ||
+	    !IS_ALIGNED(atu->pci_addr, pci->region_align) ||
+	    !atu->size)
+		return false;
+
+	return true;
+}
+
 int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 			      const struct dw_pcie_ob_atu_cfg *atu)
 {
@@ -535,13 +557,8 @@ int dw_pcie_prog_outbound_atu(struct dw_pcie *pci,
 	u32 retries, val;
 	u64 limit_addr;
 
-	limit_addr = parent_bus_addr + atu->size - 1;
-
-	if ((limit_addr & ~pci->region_limit) != (parent_bus_addr & ~pci->region_limit) ||
-	    !IS_ALIGNED(parent_bus_addr, pci->region_align) ||
-	    !IS_ALIGNED(atu->pci_addr, pci->region_align) || !atu->size) {
+	if (!dw_pcie_outbound_atu_addr_valid(pci, atu, &limit_addr))
 		return -EINVAL;
-	}
 
 	dw_pcie_writel_atu_ob(pci, atu->index, PCIE_ATU_LOWER_BASE,
 			      lower_32_bits(parent_bus_addr));
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 00f52d472dcd..6d4805048048 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -469,6 +469,9 @@ struct dw_pcie_ep {
 
 struct dw_pcie_ops {
 	u64	(*cpu_addr_fixup)(struct dw_pcie *pcie, u64 cpu_addr);
+	bool	(*outbound_atu_addr_valid)(struct dw_pcie *pcie,
+					   const struct dw_pcie_ob_atu_cfg *atu,
+					   u64 *limit_addr);
 	u32	(*read_dbi)(struct dw_pcie *pcie, void __iomem *base, u32 reg,
 			    size_t size);
 	void	(*write_dbi)(struct dw_pcie *pcie, void __iomem *base, u32 reg,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
