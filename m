Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D70C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 18:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDZyfO/Y1HF31mItGgv06/4vCRT82mvMp8vWySfXveg=; b=Ia0xGHsKxd7yoc
	YGKVzYPZNoOL79AIF2bJaLTs9ttFIq6FMnCdAhIuK5mmeBFgOcqmdpe96n6jSv8uimm5VjG6gKlcE
	hIiVZ7iGwWNLG1+EMoIMAnP358iBCuhPY/Pn3pitk0zSvvEBVbce9aD6B6Mj66U0kRi+bMtO6VeT2
	LMuTPxY1+w1Sag8YMhTlD9kB501eHNJTgYIUZq5PI6WRw4aYjPf1UMKQWpf45ipMUOvbXsunnuzYR
	yWn1lmeXknNiqBPJywMo3xMt1XDr2w5dVEorJ0EVJCCGlO+E6BYRq+gi1Vex5cPNfc1N3blabfZv5
	crPaJtQRUnx2bth+YSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s97yW-0000000FHfx-3pvr;
	Mon, 20 May 2024 18:43:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s97yT-0000000FHb8-0aFw;
	Mon, 20 May 2024 18:43:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso4240492e87.0;
        Mon, 20 May 2024 11:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230578; x=1716835378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=QjMbKN8ut1+BcOsQilkPEOoX2M0yTnd/aMVi/+mjLzLXu96d9Jwt0j+jNsi+yJir8r
         c1cdVGYU+bFjwGJ1+1Ls6UZAQcH6MxrUd3L6cdUJt5DodIJvVQG07NPl/uPjDAko8ywU
         XZNHdzxmN22pOtcpOCmnk61AT78SXNf3nQPDO+ydERo1SUEWldnNw7Vw1GV9yFlNf/6W
         sNgFObURW1I4oaEQqaXqyUwDJ8LyxIPA7TVlTU/aVdntV/srDGfKDCmOQxyr300sQIf9
         XwHUBzWfLfM9HkIELzN2hcbApuRVXyuWLt7Izv81PkyDObBGxwnxThoNdh7rhvwHLS6f
         bnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230578; x=1716835378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=I9ktp+5/BJf7O2hErRtcLskS7bzd4xJiiYZjQGECfXBm9+ucPKIrgis61S6+yOFveL
         TGiEmqSgLxhXyXOMiCyCNIo/9U8LTyuwfyTNnvy+uCyR+TP9aW6UHsExzRLTajXDTR3e
         b/LoHnvdV6epkqCl+rjQOp9PTYWliALXx4jcagQUTOkvHBz78/mWazggORI7MNCSlRf3
         DuKKyfYZ2ABzCb+dy/qWbs9Z/Ui+MVNHaQgUeW1nWwWLYxAc8i9koJ8zw+H5Qj9fXiF8
         Z5Mgp41QQs/bKRhLhQrOeXo+ew6l6/Hpxrgzj3kXOVoQXdtFRh1BTtnQt7nekYKah1F3
         8lXg==
X-Forwarded-Encrypted: i=1; AJvYcCXl7DsZK8mI4Q+Tm0ZS9G3Hs8M6rQYna8ZDXq0A/MJJKE0K0/tzJoJad0ftTxB/5oeZ+2nijxNYOXp1Q71xyPcsNHobOnx5/D2kWTuNroeBLtyEiWEEgQ0X7j89QRmnJOPACcR/HVaYEbuXBjaN9Z/mBl20btU=
X-Gm-Message-State: AOJu0YwMVu9GfBXpUlXK0zwk8/IHOUa75WfvQp7Y4+6omky1bo3d31UB
	99qH0tEPyL4WmSGqYA9Z1dTCR0V2f7WfBdeJwGrfeYCRUaYaExU=
X-Google-Smtp-Source: AGHT+IEO4aSromU9C6oSddIXHc8xFrGRwBPnUP7EaMD4z8Yk2DobxFv1itZdDUx/ckVORlYAZQXfMg==
X-Received: by 2002:ac2:5046:0:b0:522:80d:5dc6 with SMTP id 2adb3069b0e04-5220fd79fd6mr18401299e87.41.1716230578359;
        Mon, 20 May 2024 11:42:58 -0700 (PDT)
Received: from localhost.localdomain ([188.162.49.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d335csm4368967e87.125.2024.05.20.11.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 11:42:58 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Mon, 20 May 2024 21:42:19 +0300
Message-Id: <20240520184227.120956-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520184227.120956-1-privatesub2@gmail.com>
References: <20240520184227.120956-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_114305_287988_E94AFDB6 
X-CRM114-Status: GOOD (  15.55  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..89cebf7841a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,84 @@
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
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
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
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
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
+            const: allwinner,sun50i-r329-pwm
+
+    then:
+      required:
+        - allwinner,pwm-channels
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
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
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
