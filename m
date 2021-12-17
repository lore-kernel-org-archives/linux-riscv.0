Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87414C43219
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 09:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9Wm40CQMpvNf/pjzgvgXqxTUpnIhO7CEzgByFwfjvM=; b=erxnR0WLI0pUUw
	0tMSKhTnfhIafPKLnyFxsGdt0J3kdornWNKI8d8bFQ9zmXiFgJFDhe5CcsiH5TDUKXxgXzIbpXChx
	MP/bBhP2bVtLYHibSgZS2SUuCiMGstI3/QM/ba+3WW/BGquweq/KT6gR7Gt7PS1mpc0fRkL/1HSEK
	UDsa+Xml1Rx+teROqGUcdjLath4TLKL7qxcijos3+Pi3z1G/u81rWgcMPl1udVPSjVKjb+FWhHkE/
	SNrdtR9Bcy2nakkxD040RiytZdNYgIYqytk23wfrrEE07KFXgJ8cFypQDIaqoagnuW+sCq+Di/Ik0
	1IYtq4hKL/C3g1TIgM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9c6-009BIl-6C; Fri, 17 Dec 2021 09:33:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9c2-009BFa-CO
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 09:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1639733594; x=1671269594;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AZ9n/RyDSa/dhqvl7nTlTNh+a3wwb7PMc//RGFolf8w=;
 b=mM0x/glgcq7Do/QyCRX16aw/R+HMD1JIQmzQ+4hMKS0XpTRUCQ4SnjkW
 AxMgdx6hdz3hza84w9CizGKVkHDjB/eyAC/pafzT7SuKCjSRgnCg+/ELp
 ezvRFpotVDvbuuWxVrDtTWzUhI5WUSilmQ2fHmVHSjQvowodj+KnUB+T+
 QmOIXqB8qg050SgwAcHcMJRfkEWieq8dPPTW+WU5VkHaNFB0hZ7ppHwQ+
 i3TITGVcOgqkRYd/rM6/w4dXv6sISd+ZwTuuLx8Hj/arHnurOBqr2rqHf
 cXg+SLfV2iUpqTDNCwxYRdy8EzhrHC+wzuueJqmzDHXdtgPzBkr670Z1w g==;
IronPort-SDR: URrvqfHRIKuhsX04dHO5TwmpgWvtDIMhF78YdofCTrkXAmRTVPOmQ1RmHEd5wpIimtFRad8/Me
 uQoAlyKxdynFMA47OHC1uo3LoJpFqPy2tcj0+afKERlsVjGnbMgXYGCexsdH3BtFKvx/DzXegY
 VFOuScWBc3AeJXLHNVNjmtbHfWCK0cvx/QO0twyAVRXyzGBk/datukPaSSkACKcoZNRiumuQcB
 /1MbgOBrWhC+NAZxuRcCP65M9mpYxhCEn3iZBI1dPSPaJyGJ5ZVOmh4wr+cb3WTa/yaxkQQQ29
 58jmm0K0BLbxX/ZWbgCgcIPe
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="147571047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Dec 2021 02:33:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 02:33:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 17 Dec 2021 02:32:55 -0700
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
Subject: [PATCH v2 08/17] dt-bindings: soc/microchip: add bindings for mpfs
 system services
Date: Fri, 17 Dec 2021 09:33:16 +0000
Message-ID: <20211217093325.30612-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217093325.30612-1-conor.dooley@microchip.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_013314_495759_DE752938 
X-CRM114-Status: GOOD (  11.44  )
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

Add device tree bindings for the services provided by the system
controller directly on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip,mpfs-generic-service.yaml       | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
new file mode 100644
index 000000000000..d044525b3487
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-generic-service.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/microchip/microchip,mpfs-generic-service.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS system services
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+description: |
+  The PolarFire SoC system controller is communicated with via a mailbox.
+  This binding represents several of the functions provided by the system
+  controller which do not belong in a specific subsystem, such as reading
+  the fpga device certificate, all of which follow the same format:
+    - a command + optional payload sent to the sys controller
+    - a status + a payload returned to Linux.
+
+properties:
+  compatible:
+    const: microchip,mpfs-generic-service
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    sysserv: sysserv {
+        compatible = "microchip,mpfs-generic-service";
+    };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
