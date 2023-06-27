Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951C4EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yF1+fojP6Gf83TAF1+lv8TUYjDjn4TSE5GHl8snhfCY=; b=zM/lKT64iLU7xJ
	f4qAiUV+Sxs6z1lv9ad7ItPWmW/zUVxed5lfUPQJUizcXXw+VVkR0UvCLEvdiTbrta7BWEwYURJSU
	YQ+8Th0l9awzW4z4faXpPH4byMSnkSi9lUvUa1DDT9k+NA3xdcmkDZWa7L1kKU0GY/Ue7V3U8Qx3f
	JClcy9FH2UbaeiKVKXJVZDRgWCQrEv7i5RfiyqqTAPliexsSgEkFsEd0aI2aFd7Z6TW6yzv/Fvdl1
	MGK6uk/JNf+rpTAOiO0dYPmz7plufXakFNvOktJDBd1+tmuMwbzCpxwA3i42WVReri6Q6Tsz37rnU
	96TkSQB+RU55MQDJ1GvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3zb-00CYfJ-2x;
	Tue, 27 Jun 2023 08:24:07 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3zY-00CYeB-0o;
	Tue, 27 Jun 2023 08:24:05 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb7769f15aso2543468e87.0;
        Tue, 27 Jun 2023 01:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854242; x=1690446242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UR637DGW7U+8J1v52/3DiqPM0xg6ESr2sC1jjmXcP0A=;
        b=BLDWoUFtt3Bo7ljQfBO5wWhIJ0UQ+3mJWwUnIuj1QstxE8M9wCvdk6Jwe7Jexayq6s
         NOaJj0eh7j+IfOFIGatQd7NG8+2z5bbNyq0V19seJ+Umk7Tt+PnycA+dYggdsH58q6gq
         xRhpDRXCfASOONUgw7UqeoY+fYWrQzPqUlBScflYOUPXb4KRr580QFiaWzwOiWFMH2Bh
         41iGVHf4sWkdAkkC3onjqB8hNJ9kaS8Bp8VQc4K24+1xN+4qC3fVxiX9GzQmaSuMI6hf
         FqYY1+S8qhrDbuBaabF+blZVJq48f21E8x536x7kQSe00BMrkvxHzZ0/eAtp0L2f7J+R
         Yrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854242; x=1690446242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UR637DGW7U+8J1v52/3DiqPM0xg6ESr2sC1jjmXcP0A=;
        b=GzdE/2tu7XViuxIVXVeD8JcSSNO7Uw9jQpfPFafSePGLeqFFhm+392fhSXKkAOUlcm
         JGieOvFiSl2DZowXuAxZj+spbQoAwlQHFDkBm2RZaJaT879YI3V6mc8MhVJLrrCe/Uuj
         /5sLDnoCHy4jTC8jQu+NM2+D75P8gYAP0TQo8fMLWxVt05F1oWsWpoEwOSyVD7Vp3rb1
         BtAB2qvBynr2/swuGvCfFTJ+Op5fdq9rcF1ABqiMOmTiFKAkCI29zy/bXh6ZhBt7yBAm
         sHAqYfdcP7iFlTc76TWPP7tGUvxtXszWrisvtqWfvcktxR6kXLtSIuaZ6HACTAW1dFC0
         84+A==
X-Gm-Message-State: AC+VfDzLhU7HHz9WMz4ENUJt5vgR11KjMvJejTSaWNslNP/Z0Chznt7K
	7AJAkcN/ETgtfeZ4m1B83A==
X-Google-Smtp-Source: ACHHUZ54diBm0xcGDbn6+u2ecv13BQULswvrHhNEltJ8WhUHoJS0f4ce4RpKx+kLppmCy2ddaOrRKQ==
X-Received: by 2002:a19:5057:0:b0:4f9:5396:ed1b with SMTP id z23-20020a195057000000b004f95396ed1bmr12121804lfj.28.1687854242296;
        Tue, 27 Jun 2023 01:24:02 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512006c00b004eb12329053sm1420673lfo.256.2023.06.27.01.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:24:01 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
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
	Andre Przywara <andre.przywara@arm.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Tue, 27 Jun 2023 11:23:24 +0300
Message-Id: <20230627082334.1253020-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230627082334.1253020-1-privatesub2@gmail.com>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_012404_293455_1137A5A7 
X-CRM114-Status: GOOD (  15.71  )
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
