Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4DEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65BE60C51
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D65BE60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlRY3Nl0xe0AGGmjDbUxXWjxQc0XdDftmrY6wBcXkQo=; b=lRKhP+pnam2+tl
	nCNwGu/QgJljRRDoq4xv6M473FhROfYfPYx3g3qDmfiHO0hkcKPNW1enbmIN6HrAGPwZGEUcVlEdq
	ILbkyyyAUzrluzyy92Y3sG1OxK4j03pnuhtwk61hFm71XlhbsEvGorC0OUbSIi18J9fURjmfDEP78
	tEki6r8x4945JnatnxVZDWZFEEdQn28x+gOr6bPEU+GXKw8K8CHDMD2B1zBVJ/8gwu/lsj8Yv7h2j
	YiaQ2OKhrE5n6BJ8DEOQAE0Qf5N79t/kORKGxZq7yPLqNYY17mfo0/M9JddQWNzxiwFf9quh598c3
	Pe4rn8WmpZzi6sOiArow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwOH-002FUZ-PK; Tue, 02 Nov 2021 16:12:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwOB-002FQK-64
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:11:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id o8so5955051edc.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2spzz5iUsCei46qM+L/MJDySI5miFtOjpI0Cf6AGYao=;
 b=WxRd8qrhezsDBV76zdNgFbGvonceSYVUFuWl/XoAD+YOv8AJ7Tr0+LFhQ6L28FwMz1
 Un/mTpcZuZWChF/15IneWQPInwxFH+4mr+N1untVmSNCJm+lDkpigJfAN093NmzLoHly
 Y9R1bmxkLP9nbiiGNAtDSMlZjluHwWTG1nvZ2OSSbZHNqZiaWaxnE68X2G344WSlrWmt
 aqysBH6c8bmms8fOFEEReWYBPkrQIQiemyAWuKYnNIKQtSNV9ampaCetaHJ0Bhc4OvDd
 73TA1izwxLNgH42ZBkEbG1iQWtYZ0a34b+ZDDxc0hIuIhZkxEYzBx6xeJPr25oFLIPwL
 Wgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2spzz5iUsCei46qM+L/MJDySI5miFtOjpI0Cf6AGYao=;
 b=jSdKWSQXrOjy99GvGtiKHS108QWCM05bDl7XRvjCIZGG69DebOM5LMvlce4PZqElMl
 2xNW0zEm/j5EPeHxCf0qK28SI3f1B5+rzUk+1oPQs1glkpebgjyisz4STTYqnnjOvffK
 0pHGh9UW1+i0/gWyOrCgVXG61ELVXD3BJfzF322OLKOjpdA/IKPsmiULQLjeCjByOI9X
 hZexmT1ka61EK+X0NaSfDrvL+wybzwVt8Qqaq/MDPq/ZavW7q0YqAS6DQbfLgH/fhpix
 jDbXQ8rG0H11VwkGc0Gx6W6S95D0s2ovWpKx9ghiSQx6kHlswWZiOlYFBRxHyDDBk3ae
 Gvkg==
X-Gm-Message-State: AOAM531Dz0aYUQgsMnxYKmOXSX3rEXyEcxt5tldv+Jq1ZwDygW4X3FJb
 aFmU+Jn9yRohR/koyORsZXL3dhZmxS+nBw==
X-Google-Smtp-Source: ABdhPJwLELEyFD1tbUxnAZfTVpplJpLOULjki97voHP5VnV3zAwR8+cfEFFIw97ZcQcuieeEtdOI1g==
X-Received: by 2002:a05:6402:430a:: with SMTP id
 m10mr20774685edc.273.1635869513942; 
 Tue, 02 Nov 2021 09:11:53 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:11:53 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date: Tue,  2 Nov 2021 17:11:14 +0100
Message-Id: <20211102161125.1144023-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091155_257535_7F3C47DC 
X-CRM114-Status: GOOD (  14.59  )
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

From: Geert Uytterhoeven <geert@linux-m68k.org>

Add bindings for the clock generator on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
new file mode 100644
index 000000000000..12f17b60ecbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/starfive,jh7100-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 Clock Generator
+
+maintainers:
+  - Geert Uytterhoeven <geert@linux-m68k.org>
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    const: starfive,jh7100-clkgen
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main clock source (25 MHz)
+      - description: Application-specific clock source (12-27 MHz)
+      - description: RMII reference clock (50 MHz)
+      - description: RGMII RX clock (125 MHz)
+
+  clock-names:
+    items:
+      - const: osc_sys
+      - const: osc_aud
+      - const: gmac_rmii_ref
+      - const: gmac_gr_mii_rxclk
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/starfive-jh7100.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@11800000 {
+            compatible = "starfive,jh7100-clkgen";
+            reg = <0x11800000 0x10000>;
+            clocks = <&osc_sys>, <&osc_aud>, <&gmac_rmii_ref>, <&gmac_gr_mii_rxclk>;
+            clock-names = "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk";
+            #clock-cells = <1>;
+    };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
