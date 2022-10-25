Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32800FA373E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 18:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4L71GNHikkK+uwjWktH4EpzrCBPUzSmW3mwCRudT5aU=; b=AWkjOo0rlBiQAk
	EEybK49c5y71PdgGXDeLxy1EUSAs5mV0YnUuW9jpAvtBpSPTi+btaVE4Ba9HDxEzPWdAholJjJhyM
	Ej6DJseTb2thLsOaDQkU/OvE0LDkw6TkTi4usJomACF16xTa+s2rI9yzO0l/SQSlu2W0T/DhYq9lj
	4lEmLq5HqovIUBoqpnNDY9zeFSLi6vVT/k3gHsyVjTAh6NcNMnOLSmRLTO780cndfQpmVndBMb0k2
	IKx04mtva3VhWkfE2CU9UHAEi3yrStfCJ3SS5JEVMf4Lz/lIgUvJhVk1jF2DalTU74slEO/j6Y9lb
	LFNqzZ1qv/1cwO1rEaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onP2l-006j6y-Dn; Tue, 25 Oct 2022 18:52:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onP1r-006ihs-Sd; Tue, 25 Oct 2022 18:52:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91E9DB80D56;
	Tue, 25 Oct 2022 18:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0986C433D6;
	Tue, 25 Oct 2022 18:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666723917;
	bh=F248mcLTvmzVsBq/X1m/ocM22o9h6YtGlwDEshOxlPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rw8vTMAJJn48s4bvfO6Bdgr2bmmMcPtUVeGHnWLqabdStTnd84O2cNJCdnah3qblM
	 WWpP5rdddCb3KLJ1CK0CWJ4PaKwIDvaQgNg1S+Azmg5MP9wmEha2ab7BpGjTiswfK8
	 F+H6+jHCPFq534N8LGUozPZtN0VoOnG6QKwu9ibleMESoVzSlKmEQOgCOLDTM2sgMO
	 emwtLiDmnnlDhNnhup24CEx2x/RqPl04Vwjx/3TBkx1VOAlMqlofAQF+/sCnKf7jFk
	 IShCcyXKF18kUnbyvkOmFVv+Zpofd3m/ZPKx7+Q4Z2A2dDvxY5oDryockcgW7lUc+B
	 UuXJ+QAYliQFQ==
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
Subject: [PATCH v2 2/4] PCI: microchip: Include <linux/irqdomain.h> explicitly
Date: Tue, 25 Oct 2022 13:51:45 -0500
Message-Id: <20221025185147.665365-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025185147.665365-1-helgaas@kernel.org>
References: <20221025185147.665365-1-helgaas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_115200_088703_E1DFAB07 
X-CRM114-Status: GOOD (  11.22  )
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

pcie-microchip-host.c uses irq_domain_add_linear() and related interfaces,
so it needs <linux/irqdomain.h> but doesn't include it directly; it relies
on the fact that <linux/of_irq.h> includes it.

But pcie-microchip-host.c *doesn't* need <linux/of_irq.h> itself.  Include
<linux/irqdomain.h> directly to remove this implicit dependency so a future
patch can drop <linux/of_irq.h>.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/pcie-microchip-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
index 7263d175b5ad..57b2a62f52c8 100644
--- a/drivers/pci/controller/pcie-microchip-host.c
+++ b/drivers/pci/controller/pcie-microchip-host.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_address.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
