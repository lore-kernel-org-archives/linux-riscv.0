Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A97C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yseiJF1kNYz0H9LMU08DA+p65HfYrj5nWQjJF+Qh4U=; b=24HtD5xgmV0xxO
	XnyU9vOggXNVL2A+65rZQUzKfpLkAEl4+fvuzyZh+mcU0rEgxRjYygt5k2w0ZqHwujwTqHENWrHq9
	juB1WauEEQ6rG6vs1VhQroQggJIi88hXLJgcDjkAqp1x/D9ubumLBQG77lmC+QGMa0o/FoR9hMkyq
	2Q0BDY5fRlni9yZgPPIPizyQSBB2F30a3McZlQ4ZIyarbxdEjWE+N9awgoAtAVGxv39b7YKVFGLjC
	RQhDsDS+eNlXLLnwkzUi+KbG1bMC1afht+tieoynnd4tuLuTqg0RT4+SpCP0QZtYitEJ3Y24EPomK
	aIUTyB6P2kfB5zcBhHFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUotT-00Fwn4-GX; Thu, 17 Mar 2022 12:06:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolP-00FsxK-9m
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:57 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6E9AF3F62C
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518273;
 bh=LNamuvhrzviKyHuQ4L0rCxs+G11+opr3Fg5u/5wPXa8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=olEP/6Gm/JBG/+GSivmTYckQEmW7KS9x1pdGKCGCFQMqYA9c9uKlqPSaaocHhddJl
 Ql9LemGCC2pzvT2rAlh3VfU3j30l0fAqXUQ9nXbaRhnlWiIOqHBkMjruMqbkFCcGup
 HixTYPLLSWge4d9E3JL3ai6xk8BCGNoJFSIe9lE+yvsaO78ZUVBMY01rlkalmtcsEj
 GZGKzAVAp4aaX0y4mxIUoRcn+KeEBRV/n1ktwmnt3rWnM04MNO0TdHCKDuA5ClQOF9
 BwluZwGqMoOf6sLTuSe5dBsq/H87GfSPb2ynoDkWqbfjyzML2Pir3esfwIr3DuTUww
 OzetY7JXvsXfg==
Received: by mail-wm1-f69.google.com with SMTP id
 o21-20020a05600c511500b003818c4b98b5so1551370wms.0
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNamuvhrzviKyHuQ4L0rCxs+G11+opr3Fg5u/5wPXa8=;
 b=D4o+CssGLttgWd0vBl2DCRAO1uPQClzE/ksVvTnpvVWef8ao+cAUBrmz7j1lW6Xt67
 xQGEjQ7DVmlo0zvwRrMZ6rZr/Mvdwh3La43HdNS+T0N9EH0NcuyIx8+LmWm8u0zBsnvZ
 5YTvxJbF/Dpc96V07hj3F679w1vEdQ5la555olTZSw39/TsShywNZQEFllORuYRaYWW4
 b/59vZUGdsaGrzMWb3QskRLsvD/ivOV+xCZTuqpEMOtG02xR97GzaJcMH+OB/UKjgQ2K
 WlwShlkzxhVx7v56l69iJxSKzH9CQxx/ZE0AoW5PBu/1Ucy716sAi/cE9uibGhogyUWb
 XvHQ==
X-Gm-Message-State: AOAM532pIoqyYrCymNyFjdfg+dTRV6ETC0wYuQ4n9HFFaJv+UX6uZz/L
 6ipCJRm9YYy0syLRfZbAxRiLsBPi2sbdoc9mL+8e+VG1jkLYMmYIBtZuUma7pXGBCOCog2bP/H1
 5UkCHwvy6x+HD8J6xXmoI79D7uQ1M5G8l49bEwNnjKHT8gA==
X-Received: by 2002:adf:ee06:0:b0:203:d69f:ee6a with SMTP id
 y6-20020adfee06000000b00203d69fee6amr3573317wrn.376.1647518272278; 
 Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmlGAG4WbY9Y9ECnGHhG7nICuH9qeB/Pd7q3rLG8W4tmsHHiqlovZiXlafy2xr1sXRMtPxDw==
X-Received: by 2002:adf:ee06:0:b0:203:d69f:ee6a with SMTP id
 y6-20020adfee06000000b00203d69fee6amr3573270wrn.376.1647518272033; 
 Thu, 17 Mar 2022 04:57:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 16/18] dt-bindings: irqchip: renesas: include generic schema
Date: Thu, 17 Mar 2022 12:57:03 +0100
Message-Id: <20220317115705.450427-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045755_576573_3BF1F4F4 
X-CRM114-Status: GOOD (  10.56  )
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

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../renesas,intc-irqpin.yaml                  | 28 ++++++++++---------
 .../interrupt-controller/renesas,irqc.yaml    |  5 +++-
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
index f4aae56c6469..2a55581e0f4f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
@@ -65,19 +65,21 @@ required:
   - '#interrupt-cells'
   - interrupts
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,intc-irqpin-r8a7740
-          - renesas,intc-irqpin-sh73a0
-then:
-  required:
-    - clocks
-    - power-domains
-
-additionalProperties: false
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,intc-irqpin-r8a7740
+              - renesas,intc-irqpin-sh73a0
+    then:
+      required:
+        - clocks
+        - power-domains
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
index 620f01775e42..ab827bd8590f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -9,6 +9,9 @@ title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     items:
@@ -70,7 +73,7 @@ required:
   - interrupts
   - clocks
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
