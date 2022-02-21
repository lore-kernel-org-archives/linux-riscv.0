Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D87C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=91SfMYcy0eVKjp4tTmJW18vLPPSruYHls4K/+OcSvko=; b=XVO6hJLiKZm+wr
	rj9I58MRVAJj5S4d3pWgIBrvmkZHfbGY9ooj/cv4zi3U2UGnfG19z34Z401CZxmyEfn/iRnSBV6IE
	6uFPFfNJHhn3faqd+BIS6rE59+XSdbz5MEMF+MF3IW2Z85UpBVmZD9iSh3fPEBxEc36eHktXtjIg5
	3zTD8yaffKv018QE2JoETBuxraPFs/WoOlCakFIsgnjB/mCN6zIvg6XJiY3hRPKJRnSE/90sYKTvs
	OOCmSB9lb3ePilnqY2lPjtpA95Gbr8Mte2oie/Ydp7LY+3wsSF0kAITs2umSjMrP4KKIIPxYTyX+N
	QTXgGXbG0VC4WXyxeb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMFqm-007GPx-C6; Mon, 21 Feb 2022 21:04:04 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMFqh-007GMd-1A
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 21:04:00 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nMFqW-0000u1-RF; Mon, 21 Feb 2022 21:03:48 +0000
Received: from ben by rainbowdash with local (Exim 4.95)
 (envelope-from <ben@rainbowdash>) id 1nMFqW-005bIY-9j;
 Mon, 21 Feb 2022 21:03:48 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: paul.walmsley@sifive.com,
	greentime.hu@sifive.com
Cc: lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCHv4 1/2] PCI: fu740: fix finding GPIOs
Date: Mon, 21 Feb 2022 21:03:46 +0000
Message-Id: <20220221210347.1335004-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_130359_092972_A738787C 
X-CRM114-Status: GOOD (  13.29  )
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

The calls to devm_gpiod_get_optional() have the -gpios at the end of
the name but the GPIO core code is already adding the suffix during
the lookup. This means the PCIe driver is not finding the necessary
reset or power lines to allow initialisation of the PCIe.

This bug has not been noticed as if U-Boot has setup the GPIO lines
for the hardware when it does the PCIe initialisation (either by
booting from PCIe or user command to access PCIe) then the PCIe
will work in Linux. The U-Boot as supplied by SiFive does not by
default initialise any PCIe component.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/pci/controller/dwc/pcie-fu740.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
index 00cde9a248b5..842b7202b96e 100644
--- a/drivers/pci/controller/dwc/pcie-fu740.c
+++ b/drivers/pci/controller/dwc/pcie-fu740.c
@@ -259,11 +259,11 @@ static int fu740_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(afp->mgmt_base);
 
 	/* Fetch GPIOs */
-	afp->reset = devm_gpiod_get_optional(dev, "reset-gpios", GPIOD_OUT_LOW);
+	afp->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(afp->reset))
 		return dev_err_probe(dev, PTR_ERR(afp->reset), "unable to get reset-gpios\n");
 
-	afp->pwren = devm_gpiod_get_optional(dev, "pwren-gpios", GPIOD_OUT_LOW);
+	afp->pwren = devm_gpiod_get_optional(dev, "pwren", GPIOD_OUT_LOW);
 	if (IS_ERR(afp->pwren))
 		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
