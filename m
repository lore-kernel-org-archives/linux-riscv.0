Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8B7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVHzl/IUXIwU7H9m83zwOj/T6We8mHhrb2jEV5bOJnY=; b=u2QcC0fV7qqhiZ
	ATORG5FfoEGB1tRJUvhwbGqHEG1WmRPPJ+UsCy0wFkFs5roXNXu/ToM3EO/WjZK14pJVqvDf+NMLA
	cx1xIQs7qEkNfzUmJS4fDG8/nCWZw5f2m+pd+Jm8tsdDV5PxZ45Ddjtl/vcIbZujgYNYapBiuO0Gh
	eUPl79oyb78ON+40KCfzippvhcMutUYMxhWuFHEVc+5leeeOCZus/nmgHRB+8vliEQeAyH5bEwn3p
	3P8zIEJeHZQGlto7fJWLkOH2+9nG97AXcgskKzum+qSWrtvjgEHiOicV8BO6EQPXgXxjL5s/zIT2Z
	+4WM1HbrlPKWKgH+X9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9bJ-009Ark-GP; Fri, 17 Dec 2021 09:32:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9bG-009Aq8-JL
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733546; x=1671269546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+DGboTmD/BHBbd77YYjxDdqurN/h3bROxrQV18YmPqc=;
 b=mhko1fY0Ts0JYqCT1funEk38z5xbkUp1VNB4ku02nsDgorvPkCPuFdkM
 luqUhZ0FyhVs7x6yfLpVU9po1RJwbLa9AzY5rDKioLQ6/9tMKnclIWz25
 GtMNM4KKater/6WoUClNdXlD+9rLvX9jskTbDAe3Axa0PPMyDqGZlcGKZ
 jS7MuzQAPk8Aw7rk9ESsdix8jIC79P+woB+jNY7NtSX3JFAzAU5QW1FW8
 qpEfiAwbazdK67/OJSnQL/+QWmwdqNWsLnxUh3LVfmzVtJeIAqw85ni/L
 sWfdb/YxbGvKoh+1X2L1PIi/ayU0SgUh4dDsuVZriARW/rtD+5Yx0Q2HY w==;
IronPort-SDR: qG6ew+CdqBkxok7fk/Kr//smGeP1WZUnP6rv9n4Y5jw42Y+F4pSHgscnGnnZ0hRqymcl2isCCB
 3tV2Xk4MQcwJxUBV8LUrKlce05Un47t3riNzlMVOVTle8J1P4IAvkHyBT8xKpe6vgMwgAOyl7v
 UPXED8XNyNOPl7Jei7CeUcMMP2m2ELiAcDh40TowS8H3JkuMLdtD6tDctSHzMbgB5TCGtAKK+A
 LqzffjlfIfQ+37nm/O2WNmEpnLhacVXjM1fnPe8ikFwqjriQZJWbNrIx7dy9o5BRb9fDFLSA4J
 JyT0HevO0UE5snL6+wpL8ieJ
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="142745568"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:32:25 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:32:19 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atish.patra@wdc.com>
Subject: [PATCH v2 04/17] mailbox: change mailbox-mpfs compatible string
Date: Fri, 17 Dec 2021 09:33:12 +0000
Message-ID: <20211217093325.30612-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013226_740149_0A4721DA 
X-CRM114-Status: GOOD (  10.65  )
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

The Polarfire SoC is currently using two different compatible string
prefixes. Fix this by changing "polarfire-soc-*" strings to "mpfs-*" in
its system controller in order to match the compatible string used in
the soc binding and device tree.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/mailbox-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 0d6e2231a2c7..4e34854d1238 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -232,7 +232,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id mpfs_mbox_of_match[] = {
-	{.compatible = "microchip,polarfire-soc-mailbox", },
+	{.compatible = "microchip,mpfs-mailbox", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
