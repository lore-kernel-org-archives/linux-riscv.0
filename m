Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A34DFA3746
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 15:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQrQdaNwyZxTQFg/o86g3bCP9DgFONRjdJGNK8hxdbQ=; b=kAF/O9/hMtBayN
	tX58iOZqC+TqlblSjbu5CqLVojZ8mhHPe/M3787bPKYqiWpzzW/E8xYfO6CRteUKXVh/02AzVw0+l
	Q8NB+9tUuRV0LXB1fOnCQDOOEh8FZ43nYVYwm5cgLNn1gcl7DbL7RFXrQsrtdRIP0k5qN2bmsgaKz
	CmqJjXznRl/bN8SMHzTE5TEgApXt5ybQWmi/VzacQsRJhy2aHsl37bLd4TfcbwK3OLEjCZIlpQ8HU
	xj6OneIJGlMRLk0TixLtRo2HYKHj5f9vB3E0bc0tHwWN/mSunvN0KIl6VcDt7jLnPKXDrWqRi+8b7
	ZP324fN3oo/uGKlvgo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWvk-00Cgx7-13; Mon, 31 Oct 2022 15:42:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWtU-00Cfhp-B3; Mon, 31 Oct 2022 15:40:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB326612C9;
	Mon, 31 Oct 2022 15:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEEBC433D7;
	Mon, 31 Oct 2022 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230807;
	bh=0SqFZq2njvdbqZR7rFzEo9jkDi7VGLsZf4Ke0wd1u64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bhqjCwN1dGIbrvH2aEOraZjGrXqM7rhv9WtHWi9J1rx/oTlHuT0e2S2SQifUFfXkE
	 3Aev5Au4kIdcjOwRTdjn1AFqh6A1jzpceG768cet4zXNdtsKPSrc4zFwj1hffJzXVx
	 YDbataty5ubaIVgRrEjytidAFlB+XRr97fRHNh1V5rdVy0/cB6FSlCK0mPL+h5bdM8
	 decERoEBOydqmIRoArCItaWW82QoVb3EWfqDxipRy5O+94ydDCHd4dksZlpVguy5f7
	 mo6ZRp2OsOAwOC2iR5gTtMrB3qxlvRedeTCIAxJ4NGDGUv6jpxaRC57M97KrnxRkRk
	 ZXb9b48fVWUwA==
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
Subject: [PATCH v3 4/5] PCI: xgene-msi: Include <linux/irqdomain.h> explicitly
Date: Mon, 31 Oct 2022 10:39:53 -0500
Message-Id: <20221031153954.1163623-5-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
References: <20221031153954.1163623-1-helgaas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_084008_456803_BC107BDE 
X-CRM114-Status: GOOD (  10.71  )
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

pci-xgene-msi.c uses irq_domain_add_linear() and related interfaces, so it
needs <linux/irqdomain.h> but doesn't include it directly; it relies on the
fact that <linux/of_irq.h> includes it.

But pci-xgene-msi.c *doesn't* need <linux/of_irq.h> itself.  Include
<linux/irqdomain.h> directly to remove this implicit dependency so a future
patch can drop <linux/of_irq.h>.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/pci-xgene-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index bfa259781b69..bacb14e558ee 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -8,6 +8,7 @@
  */
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/msi.h>
 #include <linux/of_irq.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
