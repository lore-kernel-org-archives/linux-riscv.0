Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8891FC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 539606115A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 539606115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxN4p9na4QIF0KDrfE7ihCD2IqQhK3DOy7mIKmf85Nw=; b=bgVA48XmqkIsXb
	nLI5gZuJQTJBqVSJG15LGCOU6PWFDBNz46Wg5ukx9hF4cF9NIaEleCwP+mX57+XAKCnKJrhKvnH1J
	Xc0tBThPZjDapb9PP/omSKtVnLjqyvKtIkGcUY6fW2sgG1yKJRCeYubfPQVcZJpBsd/wUIwYwklcD
	OwmcWPGWgcg6+tjb0CwbyM/SA5rDxdYmwJmQd73884Ukcr23DxgwnDNKa9a2yBqiS5kMod412vnR6
	qsQTAt99aO+zKiuxh/D9Orqnru+zjz7HYcGrPkOyWEvg2Phx9b1/+n5STPyA+UPddU04kU2afJDOi
	H863qE/uf/PUBR9FRQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6EZ-00GmF0-5q; Mon, 08 Nov 2021 15:06:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6EW-00GmDn-2q
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384011; x=1667920011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hDzbk5UeWi75vpLTsgGDucT5R3FXBFXBWzcilIahZ0M=;
 b=iZl38O7RJzci3T+Sm1tnmaV4v5HfhbaKf7pfYeBmles/rzXo2686O6mI
 rUH6KHC7DfYL0ckr5Rj3Ez4Mrab7fUZxA8TZLJqEosz5Mm8bNB3MnjFOy
 Kxp1IPaBH3eEtJGNBN63ue8BFNIu45ljfgXKFkaRkh0zY2g99Y/kNCizD
 bqcZRjgWgYmPcV9rPxuLV00qX3BrvMvU6K74QLBZMVfm0OM1rOskMQW9M
 DiDKZhpuxca5k08ScxdF+9VVhEdhwIqosZWVYYzQfRV+FJfkqoB5qr2qR
 7dOQJkFxvVLE3mgB+TSF/rPrggvpvO5GIoElVfwMfPZRazav0r9pU6YU5 A==;
IronPort-SDR: 43iBNWnpZL9C8OdV7+SUTsmGhfztBhN8vH43OennFO3C+mKCxQsXG13xMzGW4gLGgqqJuh89j7
 PvaB2hf7ZRmBY8/9ES5I5xfpi4qYPo/H0mIqtTVs8dqbsVXRPgIeIYF1x3YTkE9+eyh2uxELPf
 PmNwo1MEmwNZvvXFhCj3nWrX2CiGNJgE8iJtr0RUCVVpPNfSppfOxyAO+J8NPNC+qEmA7L3Hl7
 HWSIUWglgQ1IAGnxOqCEsAJzTu3DcVJfUaoJS+Mk6EmdjWi1DI/Ab6b8YUfQCawAtJp9obSotV
 GBW1UrMukPL4rjbE2vitDs2+
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727168"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:06:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:06:44 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 03/13] dt-bindings: soc/microchip: update sys ctrlr compat
 string
Date: Mon, 8 Nov 2021 15:05:44 +0000
Message-ID: <20211108150554.4457-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070652_229904_2E1967CE 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Update 'compatible' strings for system controller drivers to the
approved Microchip name.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/mailbox/microchip,polarfire-soc-mailbox.yaml     | 4 +++-
 .../soc/microchip/microchip,polarfire-soc-sys-controller.yaml | 4 +++-
 drivers/mailbox/mailbox-mpfs.c                                | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
index bbb173ea483c..b08c8a158eea 100644
--- a/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/microchip,polarfire-soc-mailbox.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: microchip,polarfire-soc-mailbox
+    enum:
+      - microchip,polarfire-soc-mailbox
+      - microchip,mpfs-mailbox
 
   reg:
     items:
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
index 2cd3bc6bd8d6..d6c953cd154b 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
@@ -19,7 +19,9 @@ properties:
     maxItems: 1
 
   compatible:
-    const: microchip,polarfire-soc-sys-controller
+    enum:
+      - microchip,polarfire-soc-sys-controller
+      - microchip,mpfs-sys-controller
 
 required:
   - compatible
diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 0d6e2231a2c7..9d5e558a6ee6 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -233,6 +233,7 @@ static int mpfs_mbox_probe(struct platform_device *pdev)
 
 static const struct of_device_id mpfs_mbox_of_match[] = {
 	{.compatible = "microchip,polarfire-soc-mailbox", },
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
