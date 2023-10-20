Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C7EC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLyFzCm/jIB5mRP91UYjaUWPqOMTOGUMYjaGfb757Ks=; b=MVHsf3scAtqOfd
	A99dxpOo2jJM0siK7dALv2QAXdqNYXGOeExkZrM/AKWBG9q2MEdSGrC0BDjnyI0Pv1UI/EtmXHHBE
	hdl7zLZy7rnhVLK+zLN4FTq3xRcW6K2CgP8XwcPOktFCQ+SKFcnvk1v/+r8n45FZfPgbPWsf65Gh9
	GmmNE3u2LiclHi6TJYmtbTyZiXeICdUbgxOwMxtGJQvfPdOSj3Qhi3STNSdEom8hmVwSu3fr2LVuL
	8Wb6uhBTQIl6vhhslmpyKg+OrjkaZOLAPR19IDbNhelutJjKw3Ff3j+Y27AV1qwJq9hq4NFUJzZyc
	1HbxbHTbPD9GQDHl82zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPi-002M2P-1X;
	Fri, 20 Oct 2023 13:19:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPf-002M0F-0c
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B999BCE2A66;
	Fri, 20 Oct 2023 13:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5FFC433C9;
	Fri, 20 Oct 2023 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807976;
	bh=wUfcAwVLdJLWQ59pK55y36rkG58zLUUKiGpO+djR8pw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UnLk/WUF84EUQpsMUd6yNJjo42cnb7280J89gX5Aj3jbS+UrSLYGWoS4HqAfTIbN1
	 tBRqyXAEns5KJMk0MrhFAMpo0Ob22UDy9eGtHKJyTyZ5AHYzOmFbRb1aniOt4E0/L6
	 1JN0r369Tqho4U6WftH0XMA+NMv59JcrsztYiU8K5FJofaqh3avWYYi0b4wGc9I7Gb
	 0OZgrjRcB2+J+CmWMr9cyKPd19k+h6/6ljM0CcwVXcSXvhez7kokuIDgcOcjXM0h8C
	 aYJ6u4GjawepamMaRPyaqnI+uw4MvtyvuUqxzGm+xL7Tp1Y+I6H5sfoaqvCq9Cw3fd
	 6gXDYnMmcGbbQ==
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v3 4/6] soc: microchip: mpfs: add auto-update subdev to system controller
Date: Fri, 20 Oct 2023 14:18:42 +0100
Message-Id: <20231020-greedless-raffle-ce74c897e505@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=BV6yRDmsm+YeyYo9mK3USWNMRZ0WU1kcSJPydVNBRrE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdbo9npwyhrsLahMe77zPm7XKgqPNU/dg20cBh0071 Gf0iF/pKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwETecjH8j5SyWfmq7qbUjKf9 qyy6jb1Oz1wQnPCt5OHTCy0v9yk1PWRk2O20eXP+rbCrmokLD2ap8PSmC81b1Hdkscbid4r+x+N 5WQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_061939_582491_5183E9AC 
X-CRM114-Status: GOOD (  15.52  )
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
index f363f13567f0..35c03ded8501 100644
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
