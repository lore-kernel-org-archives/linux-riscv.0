Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788C5C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86ty5uL7KFIshYIGaEIAbc3oVGqM4m2kyx/u4wRW1A8=; b=1kF6YUh5QkaY0K
	dPAN+6v2it5SewDWce7gACpjNORz6D1DnzinEqL31LgZdZUp2XKTmBe7iDTALR4rZ7y19RDtyoMvk
	f8FueB18nuFg/MsUP22OcaDI0QJAWmlC5UZKBKWZmX5qSqOGUa8qe+FhWcBCju/C/oUulr9YOCXq0
	iq3pR+9+PiMsMPtn4CHHfskwxboNpft3f4C0RR5rhxB8EgObkFYOW1qkhm4Mc+NKmmOk/YiocCH2i
	f5pN9HkHcKkuhY3skB0iSdBYK8xefFf7BIra6vVaTKiT54OcUUHOFrkJIh+JMPOO+1ZWCfDM/cWrT
	sw3+zD04nth7W1usL8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92Q-00685d-0D;
	Fri, 31 Mar 2023 07:19:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92K-0067z3-0a
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680247140; x=1711783140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W8qT8cE/6L055WutV/rSWFJbSx6kVbMIQW0V4V6NhD4=;
  b=hup6jLTzbGj2v2qx1oxbdLTQnjkhTVsPbLd51f0sInVqo1juSDLPWNLT
   PyR1fFq/+/wV0YQvRhBQmecQl+yIY6sFaePoeNLoXbjPYhdtfu6t+vs2P
   mp3mOwlaT12r4mwqvQ9P13seYig710L3fkBSHH8snZEQCpp1J54CLWQI1
   ePlNWoF9oekjvb8c1YgEOnYTEGIm3itUSXsfcjAR0atMsg3KYYboobbzD
   qRwGwxTdygMVwcc/8AJk12v4lASEHFF+D7dHVFQ0bFBbenmFzV7qAL7h1
   0jVJbhO9vWqx4PDKXoCHb3emANFD6SskT8bqPmQmCdSKDbbBnjYeUPTsB
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="204349782"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:18:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:18:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:18:54 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-fpga@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 5/7] soc: microchip: mpfs: add auto-update subdev to system controller
Date: Fri, 31 Mar 2023 08:18:21 +0100
Message-ID: <20230331071823.956087-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331071823.956087-1-conor.dooley@microchip.com>
References: <20230331071823.956087-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=conor.dooley@microchip.com; h=from:subject; bh=W8qT8cE/6L055WutV/rSWFJbSx6kVbMIQW0V4V6NhD4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClqnZZH/R4WB/2UWhIavnH5q7U/DdIlurKm7mpwa2SJXql0 ndW+o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNpiGNk6PMKyhS5dKvU4WSz9eZJWk o+s3+xHuzVeXC3gjG/Tj3PgOF/bWDzZJ8vhvyb+YQnva3XCTz7qX1VktCntX9rXbZpPNPkBgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_001900_301025_FBB1D707 
X-CRM114-Status: GOOD (  14.10  )
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
index 1b7680e05cc0..0b94fdcc805d 100644
--- a/drivers/soc/microchip/mpfs-sys-controller.c
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -118,7 +118,11 @@ static struct platform_device subdevs[] = {
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
@@ -160,7 +164,6 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, sys_controller);
 
-	dev_info(&pdev->dev, "Registered MPFS system controller\n");
 
 	for (i = 0; i < ARRAY_SIZE(subdevs); i++) {
 		subdevs[i].dev.parent = dev;
@@ -168,6 +171,8 @@ static int mpfs_sys_controller_probe(struct platform_device *pdev)
 			dev_warn(dev, "Error registering sub device %s\n", subdevs[i].name);
 	}
 
+	dev_info(&pdev->dev, "Registered MPFS system controller\n");
+
 	return 0;
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
