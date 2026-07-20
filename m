Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2B4C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbL6PZn/Hvh3VHtpIzl8zfE9wn/6OlDtabWSTsrQCww=; b=cp+c6LyeNSCEGp
	HnGXuWxf/5qlRQJn4mIKPAC3nuH34NIDKv9qB6JwetAHDG4Zbb2t8KUio5Z1o6TePdHUVY9uEBrW2
	CYe0yjAQMJzEgylzxYULK+ICZH7sG17OPmzKnZGvjfjOfFiFxdgqd/fFliR6iGZd4BjciBkE9OOvD
	QG+mX2Y0QmfJqiQ1nRf9Bsgxnu4/GY7aIUcut48M1+VEpHG/eDu/0EOax/S0OflaCpGBA4+GRqG44
	JTcudtcKlbJt1IbOM6jUlRjkCX9NxfqRcRJagFCIlSIfg8m7J7elDcJiuQNI97yUK91uFseJNIfJT
	nqvfLwmDJeQH+QDENhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbg-000000076QS-3gs7;
	Mon, 20 Jul 2026 15:08:36 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbM-000000075Om-03HV;
	Mon, 20 Jul 2026 15:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Om
	uI2Spp3n9kV5Al6PVnZ7ZuVvU00LmjtW0tSnMTkU8=; b=X+REq//wOe+JPBVZRf
	iKQ/Wg1l8eNIl04rCuJGnuOUVa50cGEdGMeJCu2Yh+d9tcScIZQEApLrC9W3a70f
	gFUMjuZVKj/ff/b7qjLQIxhMNH/WvppMBSfysyFsyVfa/P89hnK1ajV01wTpR5+r
	8+94fpUyPI8nU9fmA6j71Lkxw=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S9;
	Mon, 20 Jul 2026 23:08:01 +0800 (CST)
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
Subject: [PATCH v3 15/16] PCI: dwc: tegra194: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:18 +0800
Message-Id: <20260720150619.24733-16-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWfJrW7KFWkXFWkKFy3urg_yoW8KF18pa
	yfXrWFkr1UJr4SqFsrAan8ZF1F93sIyrW7GanagwsIvr17C347WwsYk3y5tF17CFZFyryU
	Cr18tFy7Gr15J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi9a9hUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxG0WGpeOdEBugAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080816_516207_1BCC50A0 
X-CRM114-Status: GOOD (  10.89  )
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

In host mode: tegra_pcie_dw_host_init() runs inside .start_link, which is
called after dw_pcie_host_init() has cached the offset. However, the
driver's own initialization already enables hardware, so calling
dw_pcie_get_pcie_cap() is safe and will return the cached value.

In endpoint mode: pex_ep_event_pex_rst_deassert() runs after hardware is
enabled (PERST# deassert). Because the core no longer caches automatically,
we call dw_pcie_get_pcie_cap() here to cache the offset for subsequent
accesses. The helper performs the DBI read only when hardware is ready.

Thus, the private pcie_cap_base is always valid and can still be used for
register accesses.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-tegra194, dw_pcie_find_capability() appears in:

  static const struct dw_pcie_ops tegra_dw_pcie_ops = {
    .start_link = tegra_pcie_dw_start_link,
  };
  tegra_pcie_dw_start_link()
    -> tegra_pcie_dw_host_init()
      -> dw_pcie_find_capability()

  tegra_pcie_dw_probe()
    case DW_PCIE_EP_TYPE:
      tegra_pcie_config_ep()
        -> pex_ep_event_pex_rst_deassert()
	  -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 795cef5a915d..bf482bc66a92 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -905,8 +905,7 @@ static int tegra_pcie_dw_host_init(struct dw_pcie_rp *pp)
 	pp->bridge->ops = &tegra_pci_ops;
 
 	if (!pcie->pcie_cap_base)
-		pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-							      PCI_CAP_ID_EXP);
+		pcie->pcie_cap_base = dw_pcie_get_pcie_cap(pci);
 
 	val = dw_pcie_readl_dbi(pci, PCI_IO_BASE);
 	val &= ~(IO_BASE_IO_DECODE | IO_BASE_IO_DECODE_BIT8);
@@ -1889,8 +1888,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 		dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, val);
 	}
 
-	pcie->pcie_cap_base = dw_pcie_find_capability(&pcie->pci,
-						      PCI_CAP_ID_EXP);
+	pcie->pcie_cap_base = dw_pcie_get_pcie_cap(pci);
 
 	/* Clear Slot Clock Configuration bit if SRNS configuration */
 	if (pcie->enable_srns) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
