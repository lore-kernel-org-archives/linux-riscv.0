Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07263C44532
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fukt5dxtnA5RwNmm1PGLfWe8aSV7sUeyrm6gp3iimvU=; b=dYf8r4hBpTSrHN
	2c78DqNiLnIMKO+ToLrfLsNluNyQk1jspAplDLWq6JPmncd4HFz90VXPOXazA3ARxApevY+OM/IRt
	k8u1gG94GMYRtvuFuJ1mBKDUHD62zUd0dMVvkTYJp+l6xuexN+UuTxfznWZ5tOJryqLXzPMvervFP
	QvcJ5Ued6o7uXmelNBC1tYXLNvpJGS/cHJWxGXkBRgW+FxqjDJ4Snb00YrV4Vo6xRl5b8Gc0B4Pe+
	gpEs2ImrE0j+uHuIIo6UrPc7dQqjsWY7qr0amwLCPysqmZwYhDwulIm+iELVj6A4FbgiKPAYoONUV
	KhtEIGhhAvWTIeg0KNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbH-000000075Kl-0mYG;
	Mon, 20 Jul 2026 15:08:11 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpbD-000000075HN-46ol;
	Mon, 20 Jul 2026 15:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ff
	B7GrmVp8WAki9+UnmVSGGvKtwSZ9GLa+Vb7MYQ6is=; b=T05UjlkaldoQa5YO1i
	pYWOXA+5sHjoD1Znr8vTiWAk3LqecPXJQt2ysiuoKU09Ur5AmUhmWEXNBJxkoq2y
	oKSNHkoYPQvONVjblDNCVPpvZJO0k52szKh6MijJ7Ps8HK9TcOOGPx0R8mcmAhCU
	XRJCZO3IGNeWr/eQtCx1y2HFM=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3b1rIOV5qyHOjKQ--.35310S2;
	Mon, 20 Jul 2026 23:07:54 +0800 (CST)
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
Subject: [PATCH v3 08/16] PCI: dwc: fu740: Use cached PCIe capability offset
Date: Mon, 20 Jul 2026 23:06:11 +0800
Message-Id: <20260720150619.24733-9-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720150619.24733-1-18255117159@163.com>
References: <20260720150619.24733-1-18255117159@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3b1rIOV5qyHOjKQ--.35310S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1UXr4rWw1rCr47Xr13urg_yoWDArbE9a
	4UGFs7ArWUKryFy3W2k3yfJF97Za47WF1UKa1rtFW3ZF97Xw18Wr9FqFyDJF48W34DXF1x
	JF4qvF40ka9rAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRt7KIPUUUUU==
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wuyVmpeOctvPAAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_080808_404109_A719861C 
X-CRM114-Status: UNSURE (   9.85  )
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

This callback is invoked after dw_pcie_host_init() has cached the offset,
so we can use pci->pcie_cap directly.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
In pcie-fu740, the call chain is:

  static const struct dw_pcie_ops dw_pcie_ops = {
    .start_link = fu740_pcie_start_link,
  };
  fu740_pcie_start_link()
    -> dw_pcie_find_capability()
---
 drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index d0a34f680397..72c0a6316fff 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -178,7 +178,7 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
 {
 	struct device *dev = pci->dev;
 	struct fu740_pcie *afp = dev_get_drvdata(dev);
-	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u8 cap_exp = pci->pcie_cap;
 	int ret;
 	u32 orig, tmp;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
