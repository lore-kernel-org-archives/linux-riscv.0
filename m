Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10B8C4452F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5pml1ROYRCC4O+05ILCM9ZX5gjdt2oI/+yGNwUGHEw=; b=P00Ub0Cp2AwmYm
	Mo2TJtO6PpXLc3K/Mfi/H2+pSz5IWosxWwOzhdQfVfzkF5BPZ3S3uueXgX1SfGfPCueD5EuIk7kwc
	v4YVQQCpjzitFCsuFIAWAYO6FPraFKrxzq/tlWnHv3FfLDQ13esanqAMtWvEdyAx08RnN4tOJO2bY
	tLrAHB9OoVa/1UAx14+eWar/DXhyFKnhLgTmPGCcoCAmSlqlim/h3i9aO3HvUk1X249viGxqky3Xx
	mndWyY4G7D+ALiRKe9DW6wrP0177S7W1tV6lmGkj2g7Y4z4o4icMcqSui3MpRCAs6m7+i6TsBYS98
	1ZoL+uaUn7ai3hiYo03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbN-000000075XR-3gm8;
	Mon, 20 Jul 2026 15:08:17 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbF-000000075Gu-0o51;
	Mon, 20 Jul 2026 15:08:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kb
	4jWdBr7fAMGhV7hOxhuVJo6c1gLcmiTbqibBA1sDU=; b=KVDwbKopKysaucMRs9
	vwQ9KpV2FqhFGITqoRCFnxIIT3GIlaUaBJzVA8i3oQFykeCl1NZvYQ1ThBbUJZH6
	LjTGBYx/tXd3O4YFTwKg3BKzcQxZM8p+JH/ucFPH0scL5NIuJtGrrCvbAaqIfmdw
	w6QcjRo88fO7gfeCHyFzYbVtI=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX+mO9OV5q8LEOKg--.8910S3;
	Mon, 20 Jul 2026 23:07:44 +0800 (CST)
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
Subject: [PATCH v3 01/16] PCI: dwc: Add pcie_cap field and helper in designware header
Date: Mon, 20 Jul 2026 23:06:04 +0800
Message-Id: <20260720150619.24733-2-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX+mO9OV5q8LEOKg--.8910S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFWxCF4kArWUWw4fGr1fXrb_yoW8Ww45pa
	y3JF1Skr48AFWavF43AanxZr15tF93ArW7Ga93Kw1SqFyaka4UGa10yryYyF17KrWIkrya
	kw45t34rCFn8JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEv388UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxACwVGpeOcAFAAAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080809_580652_03AEF7FA 
X-CRM114-Status: UNSURE (   9.37  )
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

Add a pcie_cap field to struct dw_pcie to store the offset of the
PCI Express Capability structure. Provide a helper dw_pcie_get_pcie_cap()
which performs the capability search on first call and caches the result.

This is a preparatory step for replacing repetitive capability searches
in both core and platform drivers.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-designware.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index de4b245b1758..8113efd33a24 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -591,6 +591,8 @@ struct dw_pcie {
 	 * use_parent_dt_ranges to true to avoid this warning.
 	 */
 	bool			use_parent_dt_ranges;
+
+	u8			pcie_cap;	/* PCIe capability offset */
 };
 
 #define to_dw_pcie_from_pp(port) container_of((port), struct dw_pcie, pp)
@@ -829,6 +831,21 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
 	dw_pcie_writel_dbi(pci, reg, val);
 }
 
+/**
+ * dw_pcie_get_pcie_cap() - Return cached PCIe Capability offset
+ * @pci: DWC instance
+ *
+ * Finds and caches the offset of PCI_CAP_ID_EXP on first call.
+ * Returns 0 if the capability is not present.
+ */
+static inline u8 dw_pcie_get_pcie_cap(struct dw_pcie *pci)
+{
+	if (!pci->pcie_cap)
+		pci->pcie_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	return pci->pcie_cap;
+}
+
 static inline int dw_pcie_start_link(struct dw_pcie *pci)
 {
 	if (pci->ops && pci->ops->start_link)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
