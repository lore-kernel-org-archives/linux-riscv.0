Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF822FA3743
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 15:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ibOVJU5G3+RopxjnN1fIXa7ROZX8jmZFVHkWssJNYc=; b=EZ36kha7PcZlkg
	AfPGFuyOAeiky+/vPFJyfCvnL3yCnJJJSWP6Dx3GwYnZay2cRCED6GUJDQ6yLS6iYyIEXQIKMHTfI
	OU1Ko8DCwcc3jHq66IODytBZ/udA8fLMwm+LL/7rqqgLqtJdw+uxxDvN6IYFKYbZdVZCTQFpjZv+B
	QiCpzNoOKySakK6tcQ40tLBuu0F+6RoVw59da4UREHSRQFJxBhTx+RPKM4V0sebAZ/8SUPHP8e9ib
	xDD1/3BqwDdsLL+QnZrCNM4txqycgVZZq6k0bydD4ib0Kg7n0TQCkg0JryAh7Qg7+awYC1+MRTgaE
	wTBh1jphILrlbVLARb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWtk-00CfoW-CN; Mon, 31 Oct 2022 15:40:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWtP-00Cfeg-IU; Mon, 31 Oct 2022 15:40:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80FDBB818D6;
	Mon, 31 Oct 2022 15:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E88C433D6;
	Mon, 31 Oct 2022 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230800;
	bh=TRH6TIzTeBtUUYfj015oHC/R+NopKv1SaiciTdGHOko=;
	h=From:To:Cc:Subject:Date:From;
	b=gBpe/EbWifFcqhZ5BfRCBjri8ndaXtmIESwYRZe0ZJ/9QH9yy43OtvvIPJ84QuRsJ
	 qVblgIXNCeupWoDgfDRLD4sck8pombdDoeizoKGqhqlscyYPs1rJkUfCQG4MdNPZIQ
	 yAf5JPUuETdzsUBeVKU79ABam7BGmVbLXj20/7GmPUPjZ/M2IfEUXZFATexoA4Smaq
	 CQ6K94+0hZWszeCNqHZU7WW8Qj4zVQNZz5DTKAD5rA4KIiJuVJyWaBIznzyfE86ljD
	 FuiFCdMTQRTBI7IxLbavbOxp3k0//rn3wkSegSXlN51xFdxjfPPHNjAIQ6Aj0KX1EF
	 k/xrwa/o+K15A==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Toan Le <toan@os.amperecomputing.com>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v3 0/5] PCI: Remove unnecessary <linux/of_irq.h> includes
Date: Mon, 31 Oct 2022 10:39:49 -0500
Message-Id: <20221031153954.1163623-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_084003_970765_775ECBAC 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

Many host controller drivers #include <linux/of_irq.h> even though they
don't need it.  Remove the unnecessary #includes.

v2: https://lore.kernel.org/r/20221025185147.665365-1-helgaas@kernel.org/
v1: https://lore.kernel.org/r/20221019195452.37606-1-helgaas@kernel.org/

Changes from v2 to v3:
  - Include <linux/irqdomain.h> explicitly in xgene-msi, which doesn't need
    <linux/of_irq.h> itself, but relied on it to include
    <linux/irqdomain.h>.  On x86, this was covered up by the fact that
    <linux/msi.h> includes <asm/msi.h>, which includes <asm/irqdomain.h>,
    which includes <linux/irqdomain.h>.  But on parisc, <asm/msi.h> is
    actually asm-generic/msi.h, which does *not* include
    <linux/irqdomain.h>
  - Pick up tags from Conor Dooley and Thomas Petazzoni

Changes from v1 to v2:
  - Include <linux/irqdomain.h> explicitly in altera-msi and microchip,
    which don't need <linux/of_irq.h> itself, but relied on it to include
    <linux/irqdomain.h>
  - Include <linux/irqdomain.h> explicitly in mvebu, which needs both it
    and <linux/of_irq.h>

Bjorn Helgaas (5):
  PCI: altera-msi: Include <linux/irqdomain.h> explicitly
  PCI: microchip: Include <linux/irqdomain.h> explicitly
  PCI: mvebu: Include <linux/irqdomain.h> explicitly
  PCI: xgene-msi: Include <linux/irqdomain.h> explicitly
  PCI: Remove unnecessary <linux/of_irq.h> includes

 drivers/pci/controller/cadence/pci-j721e.c   | 1 -
 drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
 drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
 drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
 drivers/pci/controller/pci-mvebu.c           | 1 +
 drivers/pci/controller/pci-v3-semi.c         | 1 -
 drivers/pci/controller/pci-xgene-msi.c       | 2 +-
 drivers/pci/controller/pci-xgene.c           | 1 -
 drivers/pci/controller/pcie-altera-msi.c     | 2 +-
 drivers/pci/controller/pcie-iproc-platform.c | 1 -
 drivers/pci/controller/pcie-iproc.c          | 1 -
 drivers/pci/controller/pcie-microchip-host.c | 2 +-
 drivers/pci/controller/pcie-rockchip-host.c  | 1 -
 drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
 drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
 15 files changed, 4 insertions(+), 14 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
