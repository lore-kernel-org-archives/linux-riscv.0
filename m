Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D58C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 17:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7tFyMySlsz7IkGTjjCyTzmC3np4PkRIEx2qiqbj6y9k=; b=OildOUtFg/DQKW
	XuoaG4RlE6FHTDKprLNPgpg+JRmCJpIz7jRtJZcMvGMCRm77FksWB2P0OriF1FzKeJWLS1vvRVBRR
	0jipSZjUYys6bIh2hj2IGKQ1TsVWlEd/EdKpPeFKu05RLgt4DTE80vxNECPpkadX+ES/kMDW1QDBm
	6G0XBQtQ/Kbf0vB4OX5u/VrkMLKyxM9x7//XBtE7YadZr1S4HiUHEyoBWytmp6ansh/KLUGBGhBgd
	vNH+iMYK8uvKBQMTuQy7l6/5hsjyre/r7YPT98KdD5wlOZXg/5peCMfhsaT464GxrIOfsKoacuuDO
	GFoerw7YwsLqIaf0dirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG2Xs-0052Cu-73; Fri, 04 Feb 2022 17:38:52 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG2Xo-0052AN-WE
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 17:38:50 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nG2Xa-0006Bi-R8; Fri, 04 Feb 2022 17:38:34 +0000
Received: from ben by rainbowdash with local (Exim 4.95)
 (envelope-from <ben@rainbowdash>) id 1nG2Xa-001BJQ-FL;
 Fri, 04 Feb 2022 17:38:34 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: paul.walmsley@sifive.com,
	greentime.hu@sifive.com
Cc: lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] PCI: fu740: fix finding gpios
Date: Fri,  4 Feb 2022 17:38:21 +0000
Message-Id: <20220204173821.281784-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_093849_041398_AF880664 
X-CRM114-Status: GOOD (  11.67  )
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

The calls to devm_gpiod_get_optional() have the -gpios on
the name. This means the pcie driver is not finding the
necessary reset or power gpios to allow the pcie devices
on the SiFive Unmatched boards.

Note, this was workng around 5.16 and may not have been
broken? There is still an issue if uboot has not probed
the pcie bus then there are no pcie devices shown when
Linux is started.

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
