Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85553C44530
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsGJpIouGSAb54c0b5rqN56Ud6f+JQltdhXuiLD8JGY=; b=u84lTa4DJ6RFqk
	qQg5MfO+yLpzina9uruavvlMKN0zfa2cvd0H8666kukamC4V83yj1gjPM+Af7yOCuo9cuQ64/lxD+
	dWlDtH/pqYFtZ+d4kWZXdEEfnHmtBBxf/xO6OcWosdnNDdvNRA23mP54vEcegFS9VC8uRPRfXZ8+J
	+i51TZIEIxVJnFQyYUCavTPUGHMClzkR3smmVlqjEo7t/bJbKq6nt0ca9O2j/C7A7SAb0Mgm1q9lO
	IL8zMT6trOst0P4We2q5w5JycKyxrGabO6ABjMia7R5IVvpPfSyNB50JmDWg02qHq3qafZORZBxp9
	wASYUuAIbTeLNKRjuuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbR-000000075jT-3QLc;
	Mon, 20 Jul 2026 15:08:21 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbJ-000000075JT-05ci;
	Mon, 20 Jul 2026 15:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3T
	nk0wVtGn53M6dJL6AEJiPqhbC3YBLarkGOhYIYIBw=; b=CYQ2209abseG3G4v3z
	nirGxluq0GIYB/vwRbKW4Yo4Z7lkVSJA8AKPvPxv30EEtuDHkVfL/s12ywjRRntf
	5CNqSiOasNI8LfMTXjp9xtGNN4Z/uT+7n8+63leY7twtvGSwH2XSH4Z8bjBo7oKO
	jRqjYbVuhrcdg0wgzX56UNwkk=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDX+mO9OV5q8LEOKg--.8910S8;
	Mon, 20 Jul 2026 23:07:48 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 06/16] PCI: dwc: rockchip: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:09 +0800
Message-Id: <20260720150619.24733-7-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDX+mO9OV5q8LEOKg--.8910S8
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy3CF1kCFy3GFyxtr1DZFb_yoW8Gr4kpa
	yYyry0yryrGr4S93Z2vas8urySqFnxArW7Ja97G3WSvFy2k34Ut3yYkr98tFnrGF4jyFya
	kw1Ut348GrsxAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piyxR-UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wWxVWpeOcVuuAAA3U
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080813_537813_EBC155FE 
X-CRM114-Status: UNSURE (   9.99  )
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

dw_pcie_host_init() calls .init before caching the offset. So inside
.init we call dw_pcie_get_pcie_cap() to trigger caching. The helper will
perform the DBI read (hardware is already enabled) and cache the result.

Signed-off-by: Hans Zhang <18255117159@163.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
In pcie-dw-rockchip, the call chain is:

  static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
    .init = rockchip_pcie_host_init,
  };
  rockchip_pcie_host_init()
    -> rockchip_pcie_enable_l0s()
      -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 731d93663cca..be8b6187913d 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -369,7 +369,7 @@ static void rockchip_pcie_enable_l0s(struct dw_pcie *pci)
 	u32 cap, lnkcap;
 
 	/* Enable L0S capability for all SoCs */
-	cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	cap = dw_pcie_get_pcie_cap(pci);
 	if (cap) {
 		lnkcap = dw_pcie_readl_dbi(pci, cap + PCI_EXP_LNKCAP);
 		lnkcap |= PCI_EXP_LNKCAP_ASPM_L0S;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
