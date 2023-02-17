Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB79C6379F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SpsW4imejlyWOtzm9SuuiTUWLmWswtdNdvbTWKMBwg=; b=vJA4Gl3K9nIEpQ
	9LILPspNwzZM7CXTLtbs4GO8/Ci/UKz0iyyqakYrfCQjTb6z40FrRa64j/ixjZkvLMB59nCVPn3ts
	xN5nyASF+2z3jeOLyNflOG/gHfO8W87ro99Fg7yDYRmviSK2P3lP8FrOEAIse8/L6RMAeng2yPCaB
	08wacauPFlwsDI5qsm6RGLV+042rMURxfuPjVasDjGDcNHU+x0f4EaIfx0BL0X7cLm2iRLPXk0wQ7
	gDaG0dAhqBRQnv5uxIDJ3NWKUV7Qmes2b5jpO+STKg5oSAzhq1E4zcadKVcZHB8ZqXTbW21iAYueG
	8oyGGIxImx5AEcdWF4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3nE-00F7ML-FR; Fri, 17 Feb 2023 16:41:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3n5-00F7IB-NC
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:40:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D06461EEF;
	Fri, 17 Feb 2023 16:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895C0C433D2;
	Fri, 17 Feb 2023 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676652053;
	bh=uGoJRv9LAzu1WKQhfnsYWd6U9roPlOaRoVRun8gS2As=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYbtCpn1bJdYLzPGDJ4B6qBN8l0H9KP2b7UqP6Z44fszrR8RRn0UH05vq3cWrG3sP
	 WPbEwvwakZnPsuVK1ayv7oHbL7qtVXiD3d7jaR89ROlOeNMLibIEjQSh3Fz+0k8SME
	 84+tvbPleFuvFOUDCpXUYYnVyXOnwrg3tviCg+BygsWwIeumobi8TH9HPOcB+8Hszo
	 y3BdHPxo9E4mAxTFXhEu3+s6UE+2nB4PFxEGX5vwZcuXICevF83QI2kZ0bLBm0Aowl
	 MX0UTYmz1RSnn9G6WGlZaV7SX7LdvMjJ5arIGdNsJYbqkX7hvjy7rxqT11lV/ePOva
	 3JxrWwMjN3JFA==
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v1 4/6] soc: microchip: mpfs: add auto-update subdev to system controller
Date: Fri, 17 Feb 2023 16:40:21 +0000
Message-Id: <20230217164023.14255-5-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217164023.14255-1-conor@kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=conor.dooley@microchip.com; h=from:subject; bh=ADNLFIuLz+bv6oLLm4KQdjoPfC5CtvF+uTlkACIcj0E=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnv175tEGV0j9HZ2vLvTNU+nerJm7euyfWawrkrQO497+9U nfl/OkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR3vuMDHO5uJRuXvrQt1lxU9rXDX MdvlqEP77yrY95l3putZHK74eMDLsOLvw57errlJiDTJcn3OCdv+CW4oaVtvPF73xk2PVnjzsTAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_084055_870774_E3DB89F6 
X-CRM114-Status: GOOD (  16.67  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The PolarFire SoC's system controller offers the ability to re-program
the FPGA from a user application via two, related, mechanisms.
In-Application Programming (IAP) is not ideal for use in Linux, as it
will immediately take down the system when requested. Auto Update is
preferred, as it will only take affect at device power up*, allowing the
OS (and potential applications in AMP) to be shut down gracefully.

* Auto Update occurs at device initialisation, which can also be
  triggered by device reset - possible with the v2023.02 version of the
  Hart Software Services (HSS) and reference design.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/microchip/mpfs-sys-controller.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
index bcbb4bab09e5..223eec66edf9 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -114,7 +114,11 @@ static struct platform_device subdevs[] = {
 	{
 		.name		= "mpfs-generic-service",
 		.id		= -1,
-	}
+	},
+	{
+		.name		= "mpfs-auto-update",
+		.id		= -1,
+	},
 };
 
 static int mpfs_sys_controller_probe(struct platform_device *pdev)
@@ -156,7 +160,6 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sys_controller);
 
-	dev_info(&pdev->dev, "Registered MPFS system controller\n");
 
 	for (i = 0; i < ARRAY_SIZE(subdevs); i++) {
 		subdevs[i].dev.parent = dev;
@@ -164,6 +167,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 			dev_warn(dev, "Error registering sub device %s\n", subdevs[i].name);
 	}
 
+	dev_info(&pdev->dev, "Registered MPFS system controller\n");
+
 	return 0;
 }
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
