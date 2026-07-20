Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257F0C4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffS+VyF5pnMv4RnWt2zRmnghoAApcCkj3nseKJdCg9A=; b=UrQG1643/QX5YC
	bHzSpTR48s4aH7J/dIck4iwtGDDQdceS7eSJr/+3MeTv9NkdLga9/Xw9Tw1+n58KbPv2L0EDmVMkB
	p/+OoEUPEOw1mNX1pIslhFeHw8+AqSakZdVnU5AvPQzdzqUtZ7kMNIOy4LkaSDhZtJ99touApi3kY
	6ewGZ/E5kqfupELy2SoYhnvgrXYXY6+RQZnWnNBl7rDgn0u8nCdAuiPumhGiJu1KiYftzY6rkUZWA
	8KHC9PwUc/raRQFIWN8Ks7VYhvik7mr88tXt/NVeic6QJRhWZnqLU8BYO48YmdVLCmn8Obxz4l4qS
	PEulhFOOSh6jCWCIrrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbM-000000075V1-3JXv;
	Mon, 20 Jul 2026 15:08:16 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbD-000000075HK-29JU;
	Mon, 20 Jul 2026 15:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=sC
	5IK7rcAYFVlcW/qRjCYlhzV8RYd8qBA49KkuguIVM=; b=U1xIB7cYYmtHDba2Gg
	Aiy0ph56gAshFRwCfzdpxVDWPwdWnSX4lYYp2WwdOnuINDqBSSa5mMHpJgc97vM2
	Gr5ydSMhFv7KNMtNYF3saeMz/EFrze2OhzMB6X8PDhdsaYJXwqaH63YV74W9Yd/t
	aXWMFCUldUyUPgObP/gCPc78s=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX+mO9OV5q8LEOKg--.8910S6;
	Mon, 20 Jul 2026 23:07:47 +0800 (CST)
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
Subject: [PATCH v3 04/16] PCI: dwc: layerscape-ep: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:07 +0800
Message-Id: <20260720150619.24733-5-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX+mO9OV5q8LEOKg--.8910S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF15KF4kXF1ktr18Gry8Xwb_yoW5GF1kpF
	WUXF4YkF18Jr4SgFsrZan8Wr13GF9akFy7J397Kr1aqry2vryUGa90yry5tFn7GFWqkFyj
	934rtFy7u345JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pigAw7UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAOwVGpeOcMFQQAA3p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080808_850959_C50806BC 
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

Replace these with dw_pcie_get_pcie_cap(). The hardware is already enabled
by the driver before ls_pcie_ep_probe() and before the interrupt handler
runs. dw_pcie_get_pcie_cap() will cache the offset on first call, and
subsequent calls (including inside dw_pcie_ep_init) will use the cached
value without re-searching.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pci-layerscape-ep, dw_pcie_find_capability() is called in:

  ls_pcie_ep_probe()
    -> offset = dw_pcie_find_capability()
    -> pcie->lnkcap = dw_pcie_readl_dbi(offset + PCI_EXP_LNKCAP)
    -> dw_pcie_ep_init()
    -> ls_pcie_ep_interrupt_init()
        -> devm_request_irq(..., ls_pcie_ep_event_handler)
          -> ls_pcie_ep_event_handler()
            -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 8936975ff104..b2d0b51df3c5 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -74,7 +74,6 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 	struct ls_pcie_ep *pcie = dev_id;
 	struct dw_pcie *pci = pcie->pci;
 	u32 val, cfg;
-	u8 offset;
 
 	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_DR);
 	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
@@ -83,9 +82,6 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (val & PEX_PF0_PME_MES_DR_LUD) {
-
-		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-
 		/*
 		 * The values of the Maximum Link Width and Supported Link
 		 * Speed from the Link Capabilities Register will be lost
@@ -93,7 +89,8 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		 * that configured by the Reset Configuration Word (RCW).
 		 */
 		dw_pcie_dbi_ro_wr_en(pci);
-		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
+		dw_pcie_writel_dbi(pci, pci->pcie_cap + PCI_EXP_LNKCAP,
+				   pcie->lnkcap);
 		dw_pcie_dbi_ro_wr_dis(pci);
 
 		cfg = ls_pcie_pf_lut_readl(pcie, PEX_PF0_CONFIG);
@@ -266,7 +263,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
