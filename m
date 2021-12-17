Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ABC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2QY4pbL+taN34Xu41Ty8pGlx8YS5yGU0ef/eXrVuuQ=; b=sQ91P8imueFAPG
	J39f5sGV6HKBQ/CcQiJUoFp377iB7E2Ucf2YTZakkdyoWa2Ku4tKaeoPV8V5DnfQS5fhCYZ8gj2qi
	N5EhvWJiH+KIvFVBEWxsanwR6xHmCJXWwjbqegnYE8zqXVsTiBsZw45MAmIy/3X9pqbj6SFZnYfO7
	JO19j4QFAnTMuaFsooraQ/KEFMWS050rqqADvLQJyHRYkE5e3NrDCQl4Zeo1kLvjSHJ/U0gJ3Xp8V
	/BB5xxikwXVkmykDjU4rpiFyjuR4k9NZuHVZvgOR7qKFDvxPSgZFsrLY6RugJRBn34eHM0nV76ujF
	5MuaWEij5/oRqqcett3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9b7-009AlL-B4; Fri, 17 Dec 2021 09:32:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9b4-009AiW-Rv
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733535; x=1671269535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Ys5Zp18b6DPFQFZkjB5/UX5vB+X8TCYLaOUPyG10Ao=;
 b=a8oEqmYfAVkueGRT+d8NA+yiYhUg1s6jSZyUFWiMOAzbvLhXsrMvE2Zr
 3HNLDwbqChZgpvvpXCDBzikj0hUjxrqsTfAMK8YIYBv9P/9aLMyyuDVj2
 4p3HKYj5vjbXqShs2VXdG7KSoDb5zaFMj4Fr+I64cusf/xkW4OynMeggp
 KW6Htt2AkhDLdYAR49vWt/GZ5Kc+7cTV/DTl8Qt5e5Ksc5rHGMM7JLNeb
 uaK3Iw2lnZRQJkDR5ATZw9twxoy2l0GGDq4SUB/x9Sl3G3MobMuCjZnW7
 cTIEX4gzT4VBoluUdDUUpNveCpHBpKflIf6dqx6dm13dGXs8vylOfaf3O Q==;
IronPort-SDR: GEWBkyiFq90yQY7D5HbEF2vqImlqERWVo7V0Gd8xo9xPlDOUMW/2GidNIcgvgnWGsCuVNwNVxN
 6A8JM0+SctVBgRrt1Z8XoZUi/bO2/Rudf9fU+4Nkj9nOELLsjyxZshaYMxI3/b/NDSvXNwMtbD
 gDTGJjVtGfCXtt1oh35g2SsF9+XlPxk0WhWSp1FFAj0P9j0pGP7CjjhavWB6ECbAuoM7aj3a5J
 +nsuanKQ77X5VIv9Fn96iflMQBeJh/btQSxzMBK0TGlY+Taa3mlH+QXJxysrBYdpYypQ01Sbxd
 rnEPWXYViPcA8yvU6UzAM/kl
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147002623"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:32:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:32:09 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:32:04 -0700
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
Subject: [PATCH v2 03/17] dt-bindings: soc/microchip: make systemcontroller a
 mfd
Date: Fri, 17 Dec 2021 09:33:11 +0000
Message-ID: <20211217093325.30612-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013214_950993_3C76EA5E 
X-CRM114-Status: UNSURE (   6.38  )
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

Make the system controller on the Polarfire SoC
a "simple,mfd" so that the services can be child
nodes of the system controller node.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-sys-controller.yaml        | 33 +++++++++++++++++--
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index f699772fedf3..014cb44b8f31 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -13,13 +13,34 @@ description: |
   The PolarFire SoC system controller is communicated with via a mailbox.
   This document describes the bindings for the client portion of that mailbox.
 
-
 properties:
   mboxes:
     maxItems: 1
 
   compatible:
-    const: microchip,mpfs-sys-controller
+    items:
+      - const: microchip,mpfs-sys-controller
+      - const: simple-mfd
+
+  hwrandom:
+    type: object
+
+    properties:
+      compatible:
+        const: microchip,mpfs-rng
+
+    required:
+      - compatible
+
+  sysserv:
+    type: object
+
+    properties:
+      compatible:
+        const: microchip,mpfs-generic-service
+
+    required:
+      - compatible
 
 required:
   - compatible
@@ -30,6 +51,12 @@ additionalProperties: false
 examples:
   - |
     syscontroller: syscontroller {
-      compatible = "microchip,mpfs-sys-controller";
+      compatible = "microchip,mpfs-sys-controller", "simple-mfd";
       mboxes = <&mbox 0>;
+      hwrandom: hwrandom {
+        compatible = "microchip,mpfs-rng";
+      };
+      sysserv: sysserv {
+        compatible = "microchip,mpfs-generic-service";
+      };
     };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
