Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64027ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlFAMCOIdJjbsC57b5a539tCnE3yLKdbuHZ1s1AxRPI=; b=Aw+n6tchEMmw8Q
	pZus02Y4eMOwDq6qTAFI2MRMng7o3EgBnHfBu25KNPqMi+IpUI8CJD04EHBcudAOZpC+LXuWxEG/k
	GzVVIqUSsMQnGgW0QyNIWI5Ug4ccSTBkwAs/XoMlcYdYcIwwvpkiICEDrOhXhi9W4M/OMvxrHhdjL
	g/UxxzI809v1cyDlfCfCJC/k6858Gk4VEaq8EH+fzKUVT0zfQ4HPKsQDGlqOdmlrqbMriOEh3zSIz
	M0/NttmVNwzP/JKYE8pco9hi0Ky3wIJUy9aEvM3KKxlhit9j+YSTZqV69uBJcyO58UFNQ7HKeBME8
	tb5/V7+Vb1qjcaMN+Hpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWvA-00CgbG-RG; Mon, 31 Oct 2022 15:41:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opWtT-00Cfgp-Fw; Mon, 31 Oct 2022 15:40:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D7AF4612E4;
	Mon, 31 Oct 2022 15:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B1FC43141;
	Mon, 31 Oct 2022 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230805;
	bh=d2qwTVjIOLKmzm2jp8sYlOBb+EYG7A7QejDW//F0bVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xx6ewcqT8jUXOJmJKlk1a/DS5oUrpS9k0H8XxYkycnfRz8fZSVPkuLBscXAB6uZg8
	 COdRhuwSrkmb8zeVOEMlaypMNnmwUDmU6YRlvwNthETWisXBy7kX/ho+YYwTFDG6By
	 klqgObmuRyn0Whg0qtZEvlTetbtwEXLN2RjoSduTg1ztMtxgTac5FIytRQY8iaAyrO
	 sr44zA32UrGTNx52JUtpzrzYsm6g8Si2Tpn9MbVxC7DSvVwyY2VuC2/QGk0DQzSdVi
	 GbIMiHBI7VYixt1UzYD8L9MX7/zn4TXWByLI5sPpKRoVF7iGkuyAgY0pDH9ciKX+HG
	 npICMhPsu3P9w==
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
Subject: [PATCH v3 3/5] PCI: mvebu: Include <linux/irqdomain.h> explicitly
Date: Mon, 31 Oct 2022 10:39:52 -0500
Message-Id: <20221031153954.1163623-4-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
References: <20221031153954.1163623-1-helgaas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_084007_627875_3E189623 
X-CRM114-Status: GOOD (  10.42  )
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

pci-mvebu.c uses irq_domain_add_linear() and related interfaces but relies
on <linux/irqdomain.h> but doesn't include it directly; it relies on the
fact that <linux/of_irq.h> includes it.

Include <linux/irqdomain.h> directly to remove this implicit dependency.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 drivers/pci/controller/pci-mvebu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index 1ced73726a26..73db99035c2b 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/init.h>
+#include <linux/irqdomain.h>
 #include <linux/mbus.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
