Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CD3CD37B9
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mM9h5gk5UBAjb/+NYML9PWFwOdCtAbslYAYtnjmILw4=; b=tOTuo4G0JyZ4Dp
	vyrPZkl53knyoSm5zBv4zrjenaUqTkPyrOZAFfP+l81eMc8TDE9ikebZnJhKr9R/pDF9O5XSYVapB
	jGt0HJObXbJmr4ZhntCrg4PgwL9x2MC/ZfThxJMwW37901SJyC0BruoALvhIzZ1rgfHCCGBARGKvR
	NX/v8Ktc8sU1coywxdlsf2NIghxs2QARoiGDaezfCLyc/PtZR4iz1BjaFQVI9s/otp8zCvoVzzD3F
	wJwZG4gzKXrkHD86gggaSaRwVHOITTTDHHqeAc+FnGhBUkngp0/SC5muhtrIKi9NG9BYJJu8vRVY4
	/8+FK4WxtmgaSR3ZQkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLi6a-0000000946t-3Jmi;
	Sat, 09 May 2026 13:52:32 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLi6V-0000000943o-4C0G;
	Sat, 09 May 2026 13:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=mI
	OPut41WSK0wYvb6vxdmeoEPL8RRyCrJZJUvtEZxAE=; b=XC8ZlNs3NhGX18IY9t
	j6I6UhqXs73kv2pIp/r9Gt5lUsDCkK0iccAYOOx8W7o1m7VhAxFqoode05hmjDj/
	cpYcpOSUU/AFOqZfeipmG2LaOlBLEi/vLumvaHFGT7P+0sPXLINCJd5ShbVRSCEG
	M2yZDdph28Cc/jCHv0gpHkUyM=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXLzL8O_9p486jAQ--.37610S2;
	Sat, 09 May 2026 21:51:57 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: mx@lists.linux.dev,
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
Subject: [PATCH 0/3] PCI: dwc: Cache PCIe capability offset and simplify drivers
Date: Sat,  9 May 2026 21:51:49 +0800
Message-Id: <20260509135152.2241235-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDXLzL8O_9p486jAQ--.37610S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1kuFy3ZryfAw4ruFWxWFg_yoW8CF1rpa
	y5tFWIyF1rtF4avF4Yy3WDuF13t3Z7AFWDK39xW3WSvFyaka1UXr1rtryrtr9rtrWIqr13
	Kr1Uta47GF4fJFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziO6pDUUUUU=
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwx1oDGn-O-395gAA3x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_065228_434681_79FE4FB8 
X-CRM114-Status: UNSURE (   7.46  )
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

The DWC PCIe core and its many platform drivers repeatedly call
dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
PCI Express Capability structure. This is wasteful and makes the code
verbose. And some even search for the PCI_CAP_ID_EXP offset value within
the suspend/resume functions.

Add a cached pcie_cap field in struct dw_pcie and a helper
dw_pcie_get_pcie_cap() to initialize it once at probe time. Then replace
all explicit capability searches with the cached value across the
entire dwc subtree.

Hans Zhang (3):
  PCI: dwc: Add pcie_cap field and helper in designware header
  PCI: dwc: Use cached PCIe capability offset in core
  PCI: dwc: Simplify platform drivers using cached capability offset

 drivers/pci/controller/dwc/pci-imx6.c         |  6 +--
 .../pci/controller/dwc/pci-layerscape-ep.c    |  4 +-
 drivers/pci/controller/dwc/pci-meson.c        |  4 +-
 .../pci/controller/dwc/pcie-designware-ep.c   |  4 +-
 .../pci/controller/dwc/pcie-designware-host.c |  4 +-
 drivers/pci/controller/dwc/pcie-designware.c  | 16 +++---
 drivers/pci/controller/dwc/pcie-designware.h  | 17 +++++++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++---
 drivers/pci/controller/dwc/pcie-eswin.c       |  3 +-
 drivers/pci/controller/dwc/pcie-fu740.c       |  2 +-
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  2 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c     | 11 ++--
 drivers/pci/controller/dwc/pcie-qcom.c        | 24 ++++-----
 drivers/pci/controller/dwc/pcie-sophgo.c      |  8 ++-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c |  5 +-
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  6 +--
 drivers/pci/controller/dwc/pcie-tegra194.c    | 51 +++++++------------
 17 files changed, 85 insertions(+), 97 deletions(-)


base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
