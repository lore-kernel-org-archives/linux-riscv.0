Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165ACC47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 12:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mRcNXc9vVT3ktc2WThkGfcxPmCEAhz2eNFgLl6q8Kk=; b=QblkpiZZP1/kyf
	VGS7y8qJ8k1opbDwK/dD1T8JgfFwR1MsX5pCjwlHZWqiZ1mL6rt0I3U1XlsRFA7wZ2tjMpVVe2YSP
	Qc0GSDB0r/tuH0kcgAfx6ii4o8mGoQwMzxaAPd/Jr7u5JtYGLdB+3SPTVad4/EACu1kNes6o/iLaa
	kLtE7Wkgs44xqgs+aZsQIu/BzxiYtJAM2CgROm+bV9ht2yb2S1CdsaAcHZUPNkAAbKEcJtQYuFhun
	Xbxohpem+c7iGzLFSFpV78NQ+epXKmBDY8Q3dAChXJpQ+6/SXJNv7D5C9HLQzDvQ0VVh+VeZwgtV4
	r1vPbZPeavzDHH+wl28g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAC3-00000003TPG-3J79;
	Wed, 31 Jan 2024 12:59:55 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVABy-00000003TJP-1XnP;
	Wed, 31 Jan 2024 12:59:51 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-511207d62b6so2041513e87.1;
        Wed, 31 Jan 2024 04:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706705987; x=1707310787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=CVhEpK0EuUx9RJ9FqqEJVNWrQvaFplEK6S+34FR9Dd/e3HumsXMlt+cdMdLD5dVTwL
         Bv4cA3+I11kmI8UOsEyZyFwYScwmYE59DXsOFt/QGdDwo82VfAXV20cw/s2bf5F8Sh7e
         J7hdugbWtX8VZoi0RYMCu/nkhkxqOPHaUQ6tOlqIeX7gMaOyphyQs/1dz8yJB2Olq/vE
         donWx67qVjpTCOvoNPUbXxUXqCVIKc0tGI4DztRgZ82KOwJby50oos2XgLagZ/cmA2wY
         aAPq/ZVBOytX4VJlv85a8/s9gyOS/ZUzNljl0Fd3VoOnOOxSFahMq/WsyGY2DtVpvIOQ
         uYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706705987; x=1707310787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAfvNX5JYKiOP5F5+HHWWQpkc2VYumz0VDstxq+2dC0=;
        b=LzLnyq20+YKN1ZefzSuKqNoEU+9QTxnjnUw7PzG2NxJ3Qa44bRvy3N/o+EJ/pMjWuA
         vdZjmrhZ6ZloyxF027pOTEJXI9FrvJJcAGsJm7LoF1drBKdO5UQfUJqlIMGIqms+UaSb
         yYzmwW6HgmTjjC2Zp0Lsrlzw1WGt7bHA7oLfH32bX07I2cdJbqP/9kSZBOWAiyM8Rwj/
         4JFxuQ1v2YQTl0r0jh/2S1s+OJpZm1SSY4nm5Tb0sMoHmwXrKEbh4DKrRQVXu/V1VU3x
         E5levz55NwMzh560trRUOQ8UX1J9mj8YKp/XzRd7cFQUPysme5UCIH9p2+ksSLVziXbN
         +dsQ==
X-Gm-Message-State: AOJu0YxPUJbxjg/91sbZzmMZcVyA6CP+2kbxoaSCMg8Rg8MMN0s5IvSf
	lKyMT4ZAAp1/l0miyYmByMqBEZyAYI3fcXo5gajcwJ/kK+6J940=
X-Google-Smtp-Source: AGHT+IHozbh85wcnYCXZXYDLJCLM9XGLrWwtHro3SkQvoxBuxVb086cAn/J1lYCBdkXRqYub3zJ7qw==
X-Received: by 2002:ac2:4950:0:b0:50e:9355:a24b with SMTP id o16-20020ac24950000000b0050e9355a24bmr1003200lfi.22.1706705986343;
        Wed, 31 Jan 2024 04:59:46 -0800 (PST)
Received: from localhost.localdomain ([188.162.49.60])
        by smtp.gmail.com with ESMTPSA id h25-20020a19ca59000000b00510faaa62cfsm1361135lfj.222.2024.01.31.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 04:59:45 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Wed, 31 Jan 2024 15:59:14 +0300
Message-Id: <20240131125920.2879433-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131125920.2879433-1-privatesub2@gmail.com>
References: <20240131125920.2879433-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_045950_454851_364D21BE 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
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
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..716f75776006
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,88 @@
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
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB0 clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb0
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
+      properties:
+        allwinner,pwm-channels: false
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
+      clock-names = "bus", "hosc", "apb0";
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
