Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCF1C7EE31
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 08:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk6O5+zTBNYtPaLiYYN0Dh9GwkUaOPbfTjBxvwd0I/k=; b=YMcOCvGUxy8Rt6
	ohXxlkEMEWq4rzvCiLQ2Mrq1tnlUIhI+TkJ+4T2IttafmtMTiGPGkxzNLhm0/+LwQehmzjjM9yhMS
	HREDMKYXiRYiv0zQFdRUGAAk/jnylb39XOA8/g46X8Ow4FtPVLRb+V/0ZmL2VtwEj61qHN4zWOt2u
	4p/fuRB5pjD0kafAVr/1gsS6KFriGQk+AiPwjguPD7pw4qw5X0jVcXj2CldQTuYBtgC/ewwg8J0vH
	yqHL0HROjQ2i/9l7EGPwYCyUFY8SRW3+dSDEFjkf3Fvj9+riQyUenB5lOPqSEe6jzspBCJoFS2Yvu
	MLx2d1UrcA2FJ0/tDg8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jrB-00Clmc-00;
	Wed, 24 May 2023 08:28:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jr8-00Clji-0Z;
	Wed, 24 May 2023 08:28:27 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so556270e87.0;
        Wed, 24 May 2023 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684916902; x=1687508902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrS6J4pV0coQ+gQom7MH+SioGRxETEVrxo2OAGKB9UE=;
        b=Wp45ILdc8S9OXc+cImPVKO27PSEBOIBByFPbuQB7O2vpLLXzhnD9uRNuBXLRTxwGpU
         cNT4FJ+s53khsy2HEeuSuEDFVYXN5wsdg4bWxBQjrkJhK8olA725Ka1ugjODmTtI99D5
         YlGn/dBPtbTwzaXM6gGBRr8W3k5vg6R1fTz3K36/IMf37xY/x2yyZXt7aCHIqyGEa1X7
         fN24oiLlCoD3MuID/phya/rxexQ+buuEhUUXW8F5NBrm4m5V3yYB0sx8blcbnBMuaHMU
         QvKNEhoQs3clyU0/DxjEPVxWSZfGuAPiE35aZDWLb4jIBRALN9+cND3rdi/ljl1xKxQD
         TPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684916902; x=1687508902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrS6J4pV0coQ+gQom7MH+SioGRxETEVrxo2OAGKB9UE=;
        b=Y5Axjb6bNJki2QZ3pE2qcg3wbRQyXRdhEAv9OPTWrCdEKaV4xr2cqgwezoigS3OODF
         UyCZ69z3Sd5+v0qvdEzh0g+/UA5em3aTkXIxiEJhHIY72R3NCKo2AyCAX78sSDZIwX2d
         mWYGVaXu/fsTkEFndecHF+Y/V2NZPcf6UGxyeChpxJkzO8+zSx9wt0ieO14da+7CKsXY
         A6EFW/xZVHpO2DMVsdWcLr5UW48PqyxBsg1cCUt2r6WWC42vrSzPT1qrOTLAjcIemF2v
         meYPYdMJRzk3SAJ7KY47+auqUN+3sKc5vUm1eHV7eN0kkE+QXYHU3zYCHo/96EcqRkVj
         bEdg==
X-Gm-Message-State: AC+VfDx80nVluLkrqDwMnxwnrMHQmHnPzVe9tYidnKiPG+eb4lTTY2jd
	XeldpdXZl0opH1fP3DdKdiE=
X-Google-Smtp-Source: ACHHUZ7axExQO5CjwKA+zfRpIGZMvtRy9svKqMaQMYLrRELvYOecD6DCbAVtj4XXyKwrnSyPU4uzBg==
X-Received: by 2002:ac2:5298:0:b0:4f3:b1dc:b46b with SMTP id q24-20020ac25298000000b004f3b1dcb46bmr4567055lfm.1.1684916902079;
        Wed, 24 May 2023 01:28:22 -0700 (PDT)
Received: from pc.. (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.googlemail.com with ESMTPSA id c18-20020a197612000000b004f378fbb358sm1614049lff.112.2023.05.24.01.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:28:21 -0700 (PDT)
From: Maxim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v1 2/4] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329 SoCs GPADC
Date: Wed, 24 May 2023 11:27:31 +0300
Message-Id: <20230524082744.3215427-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524082744.3215427-1-bigunclemax@gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_012826_212963_7C2C22C9 
X-CRM114-Status: GOOD (  13.54  )
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

Allwinner's D1, T113s and R329 SoCs have a new general purpose ADC.
This ADC is the same for all of this SoCs. The only difference is
the number of available channels.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..a79b874750dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 General Purpose ADC
+
+properties:
+  "#io-channel-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  compatible:
+    enum:
+      - allwinner,sun20i-d1-gpadc
+      - allwinner,sun8i-t113-gpadc
+      - allwinner,sun50i-r329-gpadc
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - "#io-channel-cells"
+  - clocks
+  - compatible
+  - interrupts
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    gpadc: adc@2009000 {
+        compatible = "allwinner,sun20i-d1-gpadc";
+        reg = <0x2009000 0x1000>;
+        clocks = <&ccu CLK_BUS_GPADC>;
+        resets = <&ccu RST_BUS_GPADC>;
+        interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+        #io-channel-cells = <0>;
+    };
+
+...
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
