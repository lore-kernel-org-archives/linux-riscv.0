Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66369CFD316
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDZyfO/Y1HF31mItGgv06/4vCRT82mvMp8vWySfXveg=; b=Eqw2hnPNOyyMfO
	5featbB0JWFOkLEeHZylsboTqTW749SKrCPmBnJkvFLX3YNPqGJsGXz0lK7CsMgQcAF8c+TOAH43F
	mjjexiYQ8KJbQdF6/Xa7GQT03ZrqlesxIOmYSVFIT+gbyw+9n8hAh4Ne84ooYfTR9xT9ygEKD34tK
	tF5U3ruVVtpZJfXlvttODqjeLN+Agxlc39XNfRVMGl62o93Ydppge8oJJzRqKvS5EID98k4D6wuZG
	2WuB5Tmjnad6smT9N9phgCFmkuKA0N6E5HA1F8CoY1sg6YxpTGCfaDONZGhuoh0qfL+hdvvJhrMm/
	R2b9Gx0N1bERXEEoCARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szD3g-0000000G0DR-1epV;
	Fri, 11 Oct 2024 10:39:44 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCt1-0000000FyNw-1G0V;
	Fri, 11 Oct 2024 10:28:44 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539908f238fso2290227e87.2;
        Fri, 11 Oct 2024 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642521; x=1729247321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=laVXvf0Fx+uZ29d1tVZJSI1ZuXzrtKvG8uz8mmRbumX6K59vwXbDyTk2dAdOCg1LpC
         XyGdtOE7wN7HpMF6QPfnUyTWa8xHxqHyp6MsiO7hcYABm1VrcxCbtMcy7Nl3Ob1HvaqH
         BzBOfS1MsaMo1g7RQH5xWgMSbsPm5ZyetdpItcVCqxWA1j0Abo3hD243vw4KnNzu+bA6
         KWhDIU4uBIYJkCbYiCUMahu+UjbZz2JqzGmNTRSxQ0oWCBPaB0d+WSVfNcaTv7XznU20
         7+jXzlMFrXRwVkqPcX16IXFTshT/CrsemFahnqB0Txb+3tzXqq9wd7wpRdbUcllxJCTl
         aWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642521; x=1729247321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DNNq24d7mxFNOs2ke3D1b/n+xhRg9qtLvnTihNfsp0=;
        b=NcHVTQFiyPplyMJadSWth5OpKL8rpJRtUpU8Vi+cHNYAzETN20wiuIN1XkjnDKX9oE
         nSwi+XGL0Sh0L1JR7boD3XZ3sm3slq23dyFtZxDKxSPy+6i/QYoapy9rCl3d9oB6Snl1
         8H6MVar2Tpx1ps2SI4YdYFJiaxGwfBS2WaoPdKbvp5QO8YHVC+f0fguqxtlzlYlOpnle
         pc3ARM51o9Um9DmqjoZlaQByj8zPvmoS4O1tQg8FMA0w1f0/cr1Ke2Trk44gKxEsrB4Q
         dEDELTX81SI2cUi8skyahoSsBgEeA3Q3sWPleK7k4IbASAqd1EOyiY29N5GoTPwafEOo
         y3xg==
X-Forwarded-Encrypted: i=1; AJvYcCWYh+fH24fUyhKmA29BvJW9PfzSIf9OW4a7zMD/s/mXazjUDAhx+JCWhSsVFyjnshqs/y7+NyanO0i4tiw=@lists.infradead.org, AJvYcCXqUDM+0M2/8UqNTaKG0oqky5lfvVJ4fkFLTQ5FFb5HDNjS26S+RPEyBp9nGH31ArwevL6rAYdyOYX4C1sbodzz@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcefB6Th1iC2ySUPv+RDWB5YLsLPKwS7dbQKbql9Hpl4XbMJK
	osixZ2maoEvmYtr+ES79VQLsqmuhcDJ3A7CYc3JvU+BAXjctk7GAmGiXO8wIa++D
X-Google-Smtp-Source: AGHT+IFMNNoCDYF8m8Ghh38lXDuoCreUYDVAlm+aLxYvwQYlU6YMgn3EwdgcqNDHaUz7gFkp3wfTew==
X-Received: by 2002:a05:6512:1109:b0:532:c197:393e with SMTP id 2adb3069b0e04-539da3b2351mr1172966e87.11.1728642520999;
        Fri, 11 Oct 2024 03:28:40 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:40 -0700 (PDT)
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
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Fri, 11 Oct 2024 13:27:32 +0300
Message-Id: <20241011102751.153248-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>
References: <20241011102751.153248-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_032843_366752_CBC1FA01 
X-CRM114-Status: GOOD (  15.20  )
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
