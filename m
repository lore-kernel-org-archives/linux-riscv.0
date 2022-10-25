Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1ADFA373E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 18:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iB0arlHFbARP3TsTSNN3MYCSygvHbNkdDVvdVTFhWGc=; b=YoLaQT5djVl6nC
	aYvef+eLccbzGD60PJ7UDbJDxwb/PW0zWKG6YtCKfUOCudNER315Ljp3hE7Xmq3YZvmOC+FaIcR/a
	lklhciMgZmbbeTRnUTBvyW4FwWFtBABt5yAP40e89jT96Ei0z9xWOnGHqGhB/xH9MPdBP9+AecE3z
	8uJx7FfmtXB19JKH+nZkf7CG3fR+wDWpYeH7kEFP4yRzOAWZMSrAreO3iXSHaNlQJCLjSJl6F5n1+
	fAsZQyqZUcaF1WZTgGHIeFFAqHYO2O0sRQVZ/AjN3tNywlufekCRfMBAFyX4E4JEznQXezBph9oMT
	laXCGWUfGZg3Wnd526GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onP2D-006iqG-RF; Tue, 25 Oct 2022 18:52:21 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onP1r-006ihd-Jg; Tue, 25 Oct 2022 18:52:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0268DB81E82;
	Tue, 25 Oct 2022 18:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBA9C433D6;
	Tue, 25 Oct 2022 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666723913;
	bh=sbHHHHik1ots3ugg9bWS1aJ74WP1MU5+FlwWTqdu/Ic=;
	h=From:To:Cc:Subject:Date:From;
	b=lXeX/X72neXmJl7dxIPdLhMBZaIRV+QjRLeYOxd3IpR9dHMztEdyHCFsbemC+gf0c
	 vLbToENare7yvqy/PTS6N/+zOqcxiTJyiuaOhhBFHZyPHWrfTOlyfxcYjam0opx+CW
	 0bdI8NX8dYCIibHoXynU8oMsSr/pDu3Jvz+V3waE6x+/tijZCg0do5RyR8HMGxc4rv
	 1baPQXAGZu0nU+uhDcrdYTrwLvlk82MpWyFD1ukLMrmGLCmhfJjiXML0rAky3rtpAI
	 RTFwGGJNP8D7U13bX6/0IwViYbwezcAFbjx0Uzc6c3YYRUIkx2amVjpQkw7a1h9i28
	 lf+zoKvu4kyfg==
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
Subject: [PATCH v2 0/4] PCI: Remove unnecessary <linux/of_irq.h> includes
Date: Tue, 25 Oct 2022 13:51:43 -0500
Message-Id: <20221025185147.665365-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_115159_950869_20A5669E 
X-CRM114-Status: UNSURE (   9.96  )
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

v1: https://lore.kernel.org/all/20221019195452.37606-1-helgaas@kernel.org/

Changes from v1 to v2:
  - Include <linux/irqdomain.h> explicitly in altera-msi and microchip,
    which don't need <linux/of_irq.h> itself, but relied on it to include
    <linux/irqdomain.h>
  - Include <linux/irqdomain.h> explicitly in mvebu, which needs both it
    and <linux/of_irq.h>

Bjorn Helgaas (4):
  PCI: altera-msi: Include <linux/irqdomain.h> explicitly
  PCI: microchip: Include <linux/irqdomain.h> explicitly
  PCI: mvebu: Include <linux/irqdomain.h> explicitly
  PCI: Remove unnecessary <linux/of_irq.h> includes

 drivers/pci/controller/cadence/pci-j721e.c   | 1 -
 drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
 drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
 drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
 drivers/pci/controller/pci-mvebu.c           | 1 +
 drivers/pci/controller/pci-v3-semi.c         | 1 -
 drivers/pci/controller/pci-xgene-msi.c       | 1 -
 drivers/pci/controller/pci-xgene.c           | 1 -
 drivers/pci/controller/pcie-altera-msi.c     | 2 +-
 drivers/pci/controller/pcie-iproc-platform.c | 1 -
 drivers/pci/controller/pcie-iproc.c          | 1 -
 drivers/pci/controller/pcie-microchip-host.c | 2 +-
 drivers/pci/controller/pcie-rockchip-host.c  | 1 -
 drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
 drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
 15 files changed, 3 insertions(+), 14 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
