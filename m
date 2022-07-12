Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0199ACCA47C
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMPNqA27Hl1XWT58n9FAg5y+wwj5sOZz6e0hwtzyKp8=; b=Ktp+Z9JSXcTnXR
	wyqZyfX+kU8ZiWAA1C+eEs4+Y/2pCXxY5aqpVF0W0TSwGV/7dTu3xk09OEH1jYDmbjj2h3cWQnA6/
	B3/x2ADZTbD72LHgOhNIrCFuVAz0447tMYA90wIiYGnokISBTUDS4+BFyg5iKN4oL2I90oA4SiduE
	wyCnXQ8YLaZcJsh+ueRApR8ZeNAUBLhBAHx4Zs0QsOVxAVLdO5kdDgyICXn3N0krQgnad4HqyfOoI
	klMIbrNZFteT5DaqTIX9pH/XIJwWIjXM1OMjS3Iz/rJYQ6Kd/26HAVvgyHoOIxvpgRkk5QBKq6Lrb
	A9d8GxCqMd22hrjri4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGqE-00BhNz-Jz; Tue, 12 Jul 2022 14:26:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGq8-00BhJh-UI
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 14:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657635977; x=1689171977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0L9J2eXxRU3T3ZDdzxJjwk06pdsoufFKChVyEazSj6I=;
  b=d2rQ4zJleQcsUcQ8UMpcJzKM1TIvYzlkZw1SJ3H0Q3Mglk6UsSgpXvBE
   6BhjC9RY2BEJqXY8ANSwc4T4fAnfkzex5PSS03xudtmmYHeGxZCF4tdeT
   dCkoFSnaobbf5suHQpXleDiKJOj7Pdwc1kBMx4+4lPz+fgVB7CWHF3jLR
   bF2WV1OSKg9KLi4jkF47nKo5ujJQJ2DVnRpoC+vnFau4ZkZwvHJe7wClc
   sZ3Ux7Kwmuipmv2RfrWEFoRhY2xMW0hUxOocmE/ZccxyJFIMy1ya0+CaQ
   2+UXpKLdLZ2ttmzvKJTaiwAn3+KKLRz80InlnlchNbPOelzi1MvPWv+Xx
   g==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="171772480"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 07:26:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 07:26:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 07:26:13 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v6 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Tue, 12 Jul 2022 15:25:57 +0100
Message-ID: <20220712142557.1773075-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712142557.1773075-1-conor.dooley@microchip.com>
References: <20220712142557.1773075-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_072617_000163_F2D2691D 
X-CRM114-Status: UNSURE (   7.63  )
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

Add the newly introduced pwm driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b5aeaddc9539..99f490a19850 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17468,6 +17468,7 @@ F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	drivers/spi/spi-microchip-core.c
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
