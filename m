Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87378C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5012063214
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5012063214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlRY3Nl0xe0AGGmjDbUxXWjxQc0XdDftmrY6wBcXkQo=; b=m7ixug3uQwByl8
	wbzA5npfpfoMBLztqsKx75slQTcntDYF6e8jBZVrMfbsdPYfnUGwZESweh70J2isaHtKAZoOWQD6W
	Z+s9kjnNcmJL1EV9TVVkoEfs45/wR4CSiOI0hAva/NeIaVfNqo30FPx1po8SrLqVaDDy+ClYgEgvb
	3f2XipE4jvDA6wJtBDtUMSGu0C5t1nKDuByS4qJm3Ewx5y/qalndUzYZ3wrUMxajy2jhzKBNxEuxe
	KYSB4D777QAMnckvCQ0zjTsQdKvaPG1FFsCtJJHqzyWLoi2Dt61OtLpuHJhH+INkwUh49ohmw5aE3
	h/ro2HGnTfE0R1cWNvyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzyA-0023du-2m; Tue, 16 Nov 2021 15:01:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzy7-0023bQ-0v
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:01:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id w1so89352545edd.10
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2spzz5iUsCei46qM+L/MJDySI5miFtOjpI0Cf6AGYao=;
 b=H8X/ijFN1LXeYJMJwFEeg+LbwUyJ1Ey/5k0M+qQBX2ECxMxJ7bMOc7ponkcnI3tN+m
 8CLf22Bi7d/BTAiNNKfVukb/ulcoQPA6OFUZv/LfJfwzx8lbOf7q7C62RjiNwqn2S5ZB
 GP1YOqexSAhDUhUnTlQvx/pD7xLhYx+q1oGoJ6AbOfBnokPuVAaQ/qEYGyt/Pjl1I8TP
 EvNqlT/RWhaxX7pRZpKKlYvlPNuUK9SarQCi5wmq0rw6mqeXewb9wS7T/XqeduC4eD5h
 KIDj8qvIwSiuAFvPEgnL7hstBSs2S+VTVzZns6ofY3ypTS/CjhFZ2lmcpo6+f3EOdbhQ
 BQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2spzz5iUsCei46qM+L/MJDySI5miFtOjpI0Cf6AGYao=;
 b=3TjhT2mA9QW+5UHUFdDbPUaBH6SCaFVjCIKx/zfPnMhXEzaibixlzpk2KzQaHQRcgZ
 fBzcoVoVWobydbOz36gfoqV3FjioTQR7z7dAKC5oJKkP8NdxEYCQkK/gIz/t+rySYwcu
 fAA1c/l9iSIUhs4//KmG4BJ3pJpJfPSnlSOlKXZx6xt7a57S1w+1FBYc+eHjbXaoiFAf
 2C4m4qL1ZXmjvWFt36V3kDs2fSFrFnE/+ha01ZIA17cjoE7txtsKKlZcDKQkCEDdAhLl
 3ExpG07tvAlTkr/iknom7wYbu262eezvMsLuJhxkW3Klj/6zZXrti/9aKufhF1T03qED
 9hRw==
X-Gm-Message-State: AOAM531oVts7TlCzL1HxNAlyv7U/ASDknnA4sL8305MCEm2kO92atpB/
 MBWz5Gs0Myyl3Eoa5Zb0Jn4cslRaanNc9g==
X-Google-Smtp-Source: ABdhPJw5kQuA3UdIh8QBaUmCRqiyg2uJG9y6WI9IsY/3oWCQja1smobBnDXrwkpP2Oe+uThRjXfV3g==
X-Received: by 2002:a17:906:a1c1:: with SMTP id
 bx1mr10445843ejb.447.1637074912542; 
 Tue, 16 Nov 2021 07:01:52 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:01:51 -0800 (PST)
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date: Tue, 16 Nov 2021 16:01:08 +0100
Message-Id: <20211116150119.2171-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070155_101772_D69634D1 
X-CRM114-Status: GOOD (  14.13  )
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
