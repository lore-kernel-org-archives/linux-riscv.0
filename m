Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4451AC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQx2lguBOYDfK+b123XYytzo16Hz7cssuFy3iKExHGg=; b=2F31h1VidOzk+/
	mYRuho/Uq22USbdCnw3nKVn1sLuHuARPB6IJKmfuGoMo6GbYJl7Eltx8cu8UnkgEJ7FgQTuqK2dXE
	GyUlQ/ywEWqOe8kUXvEQ55qDLns5nSiGoFdCDZ+s30iGJll2pTg5pH2pAaFpu1DRMH66lG7UtoNQr
	kBOxIvi+gp9+iysg4WRX4T0UFuj1FHzQmErrshFmU4VwPNkRAmvlc5pyn5GfF7EpS2afhMeA2J5ki
	dxLT1y0a5ocMNF9iAdvf/rQMIopXkE1FAMZeJiIImRea8hnDBTjvBED6PaBad+M6gZgZsKCC/rnCg
	r57Wgy0BViUATpj54Awg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qqG-0058Yr-0C;
	Thu, 01 Jun 2023 22:32:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4qqC-0058V6-10;
	Thu, 01 Jun 2023 22:32:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so1402116f8f.0;
        Thu, 01 Jun 2023 15:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685658731; x=1688250731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDQovBoms3FLau58BysfqmyJWkZDGP+mDWm5zuqZL/Y=;
        b=nJ5nrB/K65xBQKeS4GK49exb8oASXvkB07wZO02wNCVCzxUG+fXPDtEcDX1berfUJd
         +Dnim0ocLAx6/xp4BqZHLDSdO5QS9me/pYMaRIrhky0TGnpJbxDqO7aDu8BcOELRIMIV
         T1FMGnigqZwePfryfBXqE8S6Um91z4H7ji7M6+YlBlSeaJxylPSlgpsSFbnmXAeNQ/H+
         WzpMtM1IbWpS4PUsNYMkWRN6+G7FtIdvkbA4F1Fd2UWBP8woALbMjNjERKg2hovSBsH3
         0y0YkI4wO8qI2MI3pKH5oA+nA+L6qGqsRXDsSiH58FHQshYUIdHAxwdUS2TU9nh2dsMa
         exYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685658731; x=1688250731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RDQovBoms3FLau58BysfqmyJWkZDGP+mDWm5zuqZL/Y=;
        b=Ela7uBV//k6gjciqqGUbaTCjBmM+XchxcPxSQCrA1vWl9cnzdmzyspgBPHzcoIyCCt
         AaCyzn465TcXH3YkqyDp6PRK0MTp8wMtz2A7jmufvjWNsCDMzxlH1eJsO9rmJFDC/iW9
         wXDYbeMsj0h47d+jDtNsbVjDmWEzd03/x4pzSX6lRjQGh5hXJn+mKLBdQsAZ8D5M1i2/
         4CvjzWMmVBNt4Ix9SXvljzhX9I3a2RyfuRpXWTmQDUFg7FQCVnU5nyy0xzVRxJ4KF68c
         WoCa7CEsGYykAqdNQeukmNDfLe5UMCPwk7L7vXEJ0kqBguv5S60wLLmstUZ3QXtgXxC2
         /IvA==
X-Gm-Message-State: AC+VfDyE+Wy4Do+1XjXuqNkwdcJEMb0p6+bCNMtefwucOZS67jQq/G7W
	6yMI3/ZkewS6+jYiF/0J9ts=
X-Google-Smtp-Source: ACHHUZ4UrAst4qPVDvoXKTVPsJrseXBlcZmYfr9vB25sGSdLTIpkgvX8Re139ignQ4DE5Du+R0qDmw==
X-Received: by 2002:a05:6000:1191:b0:300:cb8c:fd8f with SMTP id g17-20020a056000119100b00300cb8cfd8fmr2588538wrx.54.1685658731484;
        Thu, 01 Jun 2023 15:32:11 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id b7-20020a5d4d87000000b0030af8da022dsm8619149wru.44.2023.06.01.15.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 15:32:11 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	William Breathitt Gray <william.gray@linaro.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
Date: Fri,  2 Jun 2023 01:30:40 +0300
Message-Id: <20230601223104.1243871-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601223104.1243871-1-bigunclemax@gmail.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_153220_347539_C3D374FE 
X-CRM114-Status: GOOD (  14.08  )
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

From: Maxim Kiselev <bigunclemax@gmail.com>

Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
This ADC is the same for all of this SoCs. The only difference is
the number of available channels.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
new file mode 100644
index 000000000000..94f15bb48231
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/allwinner,sun20i-d1-gpadc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 General Purpose ADC
+
+properties:
+  "#io-channel-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  compatible:
+    enum:
+      - allwinner,sun20i-d1-gpadc
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
+patternProperties:
+  "^channel@([0-15])$":
+    $ref: adc.yaml
+    type: object
+    description: |
+      Represents the internal channels of the ADC.
+
+    properties:
+      reg:
+        description: |
+          The channel number.
+          Up to 16 channels, numbered from 0 to 15.
+        items:
+          minimum: 0
+          maximum: 15
+
+    required:
+      - reg
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    gpadc: adc@2009000 {
+        compatible = "allwinner,sun20i-d1-gpadc";
+        reg = <0x2009000 0x1000>;
+        clocks = <&ccu 80>;
+        resets = <&ccu 32>;
+        interrupts = <0 57 4>;
+        #io-channel-cells = <1>;
+
+        channel@0 {
+          reg = <0>;
+        };
+
+        channel@1 {
+          reg = <1>;
+        };
+    };
+
+...
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
