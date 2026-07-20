Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D5DC4452B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sJJ3fMbnJUl7hyE2hAAmzVU2xUExxKWoFtwB34PcgQ=; b=xEqWj3Zdn/m0uz
	Mbw5svxev/dmeHOK99uoqdvNF6B3PR7dGGrUFG5p0lfpMBhR0s6BZBiB62bGoP+0Sxp6M/mDSQakU
	+HVWEZ3l078n2+IPu6WtvjJDISpu/b2aUyKSt7B8ZunpY2Hdwghp6uyFfsJuvYNWFjCuaikQ6qAq1
	hMvi8qfewZEDWPpSB2KYCzSZd8tiPcP6OdsyLH1mL7jqVBLK3Go7dXNb+ee/WUhcYOx8Z/TURIIO7
	PVqrb+LGxvWzReMKm4vNLGsxeJ0JMyNleopMXAJi2MHEIKIGQMT1Eiw1VofkcQ6GOpVy01awgw5Yq
	n63Ppg8dKGXb4petFEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbc-000000076Ck-1USC;
	Mon, 20 Jul 2026 15:08:32 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbJ-000000075Jl-3uFM;
	Mon, 20 Jul 2026 15:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=P5
	dtUmSCJE7DzqsEwcI8FKsNsEzR7pCOmSoVvece9QE=; b=WHD25rbD+O3j/PT/bT
	hZqCaT6y3aNagSE1KNUgmZzKqZzOjklu7qJiEGkfnex+zdNyzT4/sZb7/ExrlHfy
	I4u2eHHcW3SLMybgrWivdvpxISrVGWvUVfkR7jTgf03CFB4Dr4OPWN8z/k2quiWE
	mw5891+p7BDY6f5GDoCuVDVew=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S4;
	Mon, 20 Jul 2026 23:07:57 +0800 (CST)
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
Subject: [PATCH v3 10/16] PCI: dwc: qcom-ep: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:13 +0800
Message-Id: <20260720150619.24733-11-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4kWFW3Cw4fAFy7JFy3CFg_yoW5GFy8pa
	s0qrsIyr18Jr48XrsFka98XFnxWrn8Ary7Aa97Kw1fZa42v347Ja1jyryftFn7GFW7KryU
	Cr4rt3yxu3WYyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEzB-NUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCww2zV2peOc0BRQAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080815_080954_A25B3C58 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

dw_pcie_ep_init() no longer caches the offset automatically. For qcom-ep,
hardware (clocks, PHY) is enabled only after PERST# deassert. Therefore,
we must call dw_pcie_get_pcie_cap() in qcom_pcie_perst_deassert() after
the resources are enabled, before any DBI access. This ensures the cached
offset is valid for subsequent uses in interrupt handlers and ICC updates.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-qcom-ep, dw_pcie_find_capability() appears in:

  qcom_pcie_ep_probe()
    -> dw_pcie_ep_init()
    -> qcom_pcie_ep_enable_irq_resources()
      -> qcom_pcie_ep_global_irq_thread()
	-> qcom_pcie_ep_icc_update()
	  -> dw_pcie_find_capability()
	-> qcom_pcie_ep_perst_irq_thread()
	  -> qcom_pcie_perst_deassert()
	    -> offset = dw_pcie_find_capability()  (called twice)
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 56184e6ca6e6..16b0891f9571 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -307,15 +307,13 @@ static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 static void qcom_pcie_ep_icc_update(struct qcom_pcie_ep *pcie_ep)
 {
 	struct dw_pcie *pci = &pcie_ep->pci;
-	u32 offset, status;
-	int speed, width;
-	int ret;
+	int speed, width, ret;
+	u32 status;
 
 	if (!pcie_ep->icc_mem)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
-	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
+	status = readw(pci->dbi_base + pci->pcie_cap + PCI_EXP_LNKSTA);
 
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
 	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, status);
@@ -491,14 +489,15 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 
 	dw_pcie_dbi_ro_wr_en(pci);
 
+	dw_pcie_get_pcie_cap(pci);
+
 	/* Set the L0s Exit Latency to 2us-4us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = pci->pcie_cap;
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_L0SEL, &val, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
 
 	/* Set the L1 Exit Latency to be 32us-64 us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_L1EL, &val, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
