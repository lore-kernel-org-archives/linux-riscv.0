Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542ADC001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF1+fojP6Gf83TAF1+lv8TUYjDjn4TSE5GHl8snhfCY=; b=xCEtdU0zlR6rwc
	sQ74cpj+XXFYEQjY045IpqDGT0V4NnNkJk3rb8w2apr7MsrAnBww/IGlXGhSPn7FZARGrXcFcDzgN
	rRK1sETkjDG9HxWOTWKJdvQggi1Zflag6gYMmIkKWGKaFPh8MsoroG/6GSXYE0rg2PYGiFAWGMe9z
	96Me5FXE1Y5mNCS8bR/9wS0xbAESdEISX2H07R3QwQ6tOkGmrY9q9CG0EOh8GbAB5+vwMEm+oDKJ0
	CDQ5zSH+Wj5nLtH8DMEBpUNtAx3qahXPPg02sTPDPvTWV1fLDsus2sbBPFDP5QoozWpG9CxnKXq4j
	9v7A433zGDAWwpAnqwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU753-007w9t-2W;
	Thu, 10 Aug 2023 14:56:05 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU750-007w8r-0y;
	Thu, 10 Aug 2023 14:56:04 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe7e1ef45dso1561101e87.1;
        Thu, 10 Aug 2023 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691679360; x=1692284160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR637DGW7U+8J1v52/3DiqPM0xg6ESr2sC1jjmXcP0A=;
        b=bJofwah3+UqeRBZ9i34YD/7ICPZZ900eAwWquy0VJ8yGlbYTyopNXyS0N3UlVmG9fd
         EiHnBo8cOIbA8rvKu/FKLPIc7NbZG7DeeWrkvTP+zB6orKF/EOva1e3RjcQmuFSznGWG
         sODNX2bhMk0UWgQMtsKY9tXIQy++D3jnLYMU1BZxwEJcc53vV5V/puib2OU+GR0hlED+
         4ZWXWh6nx/RE4Vp7QcCba9fPNPA3K1Z7z0gxjYFKTq+JEkG1grZbgM2mPlbY9OPCZK9k
         aJl7N6iHnT0AIyCBnC5ah10/9WVT59lpVEFL7HQHaKco8BK1Fbw6y6TzN2t8OR4hFIkU
         5iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691679360; x=1692284160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR637DGW7U+8J1v52/3DiqPM0xg6ESr2sC1jjmXcP0A=;
        b=DsdVwMcAPD1unep9tGGXWofN8+2r72+n7UPebRi46kQqL9+YbJ4aC2GZU3sgJNiq81
         1rHEoJRTHY/25lrD7JXGAjqJpHzR0PovQ/4gxPXdN/URbBGnMgCLacqMX7I/27yIyU6p
         +5hAkAV6RnGr8d+yDy9CThiyuTfsSfS/IdHQ2u1HvxyfgQyZ1zvudyIXWvUiz1MwWAe8
         zBiTtFH3C1XymxMrYW3MBNJ45nw31qOQFUBIdgV4+aXPbk4ZUys6HYOl7Aici94Hr4Vk
         MAjGqrK+RjjJpRy4tBe66FX0hmDr4IWO7FZmnFptOxXzCsYa2d1x2edRfcbJAcGPLYiy
         3tlA==
X-Gm-Message-State: AOJu0Yz1ctf4BfWQ6nOs9gJEXX0ZDFvXEq0L7vcStChk/UxIR2N8anVX
	F25HTaUelv6hYMgI8uM7Cg==
X-Google-Smtp-Source: AGHT+IH/wj5XR+Gmf4TgMXFV5TkdmJ5jpH/+f4PgMsiSgABnUdyxGRizgDCqcTQvRueji6XH3KRSZA==
X-Received: by 2002:a05:6512:110a:b0:4fe:55ba:d541 with SMTP id l10-20020a056512110a00b004fe55bad541mr2121757lfg.50.1691679359661;
        Thu, 10 Aug 2023 07:55:59 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id p12-20020ac246cc000000b004fe0de39fddsm308496lfo.290.2023.08.10.07.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 07:55:59 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Thu, 10 Aug 2023 17:54:26 +0300
Message-Id: <20230810145443.1053387-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230810145443.1053387-1-privatesub2@gmail.com>
References: <20230810145443.1053387-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_075602_339730_F90B7826 
X-CRM114-Status: GOOD (  15.69  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..4e6eaa18f342
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun20i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: 24 MHz oscillator
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  allwinner,pwm-channels:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    enum: [6, 9]
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun20i-r329-pwm
+
+    then:
+      required:
+        - allwinner,pwm-channels
+
+    else:
+      not:
+        required:
+          - allwinner,pwm-channels
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&dcxo>, <&ccu CLK_BUS_PWM>;
+      clock-names = "hosc", "bus";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
