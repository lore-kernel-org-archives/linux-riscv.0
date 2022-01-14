Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BE5C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jan 2022 15:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kewLgZYZm66sPbaaypq36ezHfDsQWx/XBCdEY9vEfTQ=; b=oaRFt6bMGv5puq
	T+OA4gYFwKzG3JX4Ai95mL/8FOoCc2qlHNL4xtQojZDYSWcJicTKbbm4d81bQzTGyFunYqVHF7Ohu
	Xx90ESUw6TA0SKGu2RzySngj9JfwA5fMzWg4SAyg2Lv6ATpgPQqtCTCpEa3IPS0H2hLV7iRJseUOU
	exNHTZ031McBRXGpUm9UGWNujkfQqhdDLHU2YtNNB7VjcpgTq/0abYG9JfRODzCub2o6kVfhoP6Cx
	7aEPEfTtFaLXs5kGRChtvL1k2tPbUfDhI7roi8YODyYGtKOUKwx1LjpzOjzPN3E2RvI2LpTZuso5B
	LXrEbHUdWGyjLIflIhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8OJh-009Xly-Gy; Fri, 14 Jan 2022 15:16:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8OJe-009XkH-SK
 for linux-riscv@lists.infradead.org; Fri, 14 Jan 2022 15:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642173394; x=1673709394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WIRab6h1hcL8MT7Wt72ljqAGomYq1u7lJ21fWjCYfGU=;
 b=XHiQ5kQwMhZG28gNpS2bewo3M2MscZsVQhi0IJuxFQM5G+Qh1dEqsGhw
 y1kNOe3IppxR1Q6IRPou7Jjbn/ejfVQgqIZ5/C7+EM+HhTYd0G7QESXzr
 5OsmVmx+k9ItpIyKCll5JQ3g2mU086Jlhkarjb60vAXkyz9mFXworEPOt
 SXGD6+tnkWwbkmHDSKsKaQ9ckhzgV0TzyEaV7h770stPCC+kEhEamoW6p
 6CaBLencxLAmAHyqkWTK80ibBMAkLxopu+KJSr0nqCcvwNnApWpmDGS62
 Ese5lRY9K2AjwhuVGdqSWXudOxfTQAwGNWNH5JzLx5Cl8ZRtkzN5dMQVR Q==;
IronPort-SDR: HbKIBJDyXoXla2Re69L7lEFZqn/vZmN5/+QF+7y6aR8BCvGbcwan8zI6aBYo7C9ViM2zwLelqd
 8RYjH0rUej5VOatEeglxnNq18OIahyzjuCmv3F9cb4Lbj3FEBb2GR50kSur/gHfcNdcKztf8Qr
 p+7m1p67jxhqBvS9BQ/SlDUPnKOwQRnm5Ptc7H7X9rmuPtaDe6j6akQsnJiIVCXWthn9uCVEf6
 xhjxh3hDGjSMtMrNcs+ABl5QWSlhZcqM+Ijljk1DFPAE0DdsNLYtHV18dXedAEGgioyFxhB3vA
 GAYpiISfc9ga40ZpfVwix6Pu
X-IronPort-AV: E=Sophos;i="5.88,289,1635231600"; d="scan'208";a="142730841"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Jan 2022 08:16:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 14 Jan 2022 08:16:33 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 14 Jan 2022 08:16:27 -0700
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
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v3 03/15] mailbox: change mailbox-mpfs compatible string
Date: Fri, 14 Jan 2022 15:17:15 +0000
Message-ID: <20220114151727.2319915-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114151727.2319915-1-conor.dooley@microchip.com>
References: <20220114151727.2319915-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_071635_003837_785FA1AD 
X-CRM114-Status: GOOD (  11.13  )
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

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
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
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
