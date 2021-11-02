Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619FBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 290D46023D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 290D46023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lIWihVGrOUI5EPx+nnDlGkjn7UMtHUWSs510NJYs748=; b=IrC531T8DRf6eL
	gLxX34nwuIR1+5i86GfoupJKFsX15yrCIDR7vLxN05RW+uCbKSaFnbXInF6eBgc13qgKNAT0W5Y7Y
	WZ1R+9DuYB1zkPDFIqLZAkP72zRx43Krv2G7CHpt13+1D+EBcS0wsqad0ev/LZjKVNe7+3hecLGqy
	/pmMjhjxC1HfL1rf/fkw32Id6tVkhCKxk2Cj64gVZU9CqmK3ygFykPee4duSeA0UsIC+98rZX3T7c
	azsJUNnKTQHHXCRS/MwQJcgAnHTCQO4NMIBndS7Infkinqzq7mersSc4stbSdW+PyLM7up1a+A5h8
	OWPkJ6S2iW2Cy28wNmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwOX-002FgY-BN; Tue, 02 Nov 2021 16:12:17 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwOF-002FST-GG
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:12:01 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ee33so6920556edb.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S07ZlNyPM9aXYOfmi3L50ieiCZ4bZ/2J0IfM/InNuyU=;
 b=JJTA+SybBinzM+vGWoCK8Zj+OROkF68vq6cvWOXoq3PB7eP5OQDD/BBh9UoBnl4H7+
 mzldCTY/3gwMbwy2/neOvNSdYxixLqIvU0Qdrw21IdYCHaGjktwVmmVG5oN8LWhnCc5z
 OwKKgEzutOC0DfsrPTgNS7jL7rgRhB81TEKv6IfV1pZJfSNbHfOqbZUg7F+u4NiirNO2
 AOxBZVBxhUaLD49kV8yqGK7HFx+7iFzgjwYDSoRVLOeYKdUixaP/O4zAbee3fH5TY4DB
 59QiMCog5d6CZpBgOAbMhmXaL+FaMY85smJF7SEJZlSEHTKam63H1zZ2SK+DJzw8UaPg
 kw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S07ZlNyPM9aXYOfmi3L50ieiCZ4bZ/2J0IfM/InNuyU=;
 b=AsShj36UAI8X8pG4z4Q5MCbnoVB0IjjVZeBtY6CdireRDdyFCS17JCAMZlmCuNFrkx
 eGKwghZNMW0mXcLuAEyShlhgPKIoCf4C5OE6UlsZCxtMA4HlQOeYGprkWHg88k+yySXn
 9yvM3wnqAfMsWA61EGt7JKmfz4k/9j373iHAeR+7xvdbdq9xJwPzKYyyoiHqGce2nSx9
 UvWjCQSAdBU8hD6TA/rUMGQbTtgHL5czWOKii4m1vr4O2jOioT1Ij1VPVdar7Cb10/58
 AUf3OZJ4BekdPnlCbrz3Pm97s9WMjnI2jqOOBNyz3srMiU6XucMlizQHQDaQY2SJXebo
 yZpg==
X-Gm-Message-State: AOAM533tvkIY0Awdxgxt2+C924UnWsoy5pPWMItHmH9hqfMoRYK4a+ru
 VJMqvf6Vg2JAbKzrI9cjZbbq3GHFpKcvTA==
X-Google-Smtp-Source: ABdhPJxvPFom9mlEjjVUIlLhKJOwt4kgVVrbP9xtfptymruWIARqgA1j1tb6QG0G6R4K61k3zlKa1A==
X-Received: by 2002:a17:906:4f95:: with SMTP id
 o21mr47162618eju.61.1635869517753; 
 Tue, 02 Nov 2021 09:11:57 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:11:57 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Date: Tue,  2 Nov 2021 17:11:17 +0100
Message-Id: <20211102161125.1144023-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091159_582189_061555D7 
X-CRM114-Status: GOOD (  13.57  )
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

Add bindings for the reset controller on the JH7100 RISC-V SoC by
StarFive Ltd. This is a test chip for their upcoming JH7110 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
new file mode 100644
index 000000000000..300359a5e14b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/starfive,jh7100-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 SoC Reset Controller Device Tree Bindings
+
+maintainers:
+  - Emil Renner Berthing <kernel@esmil.dk>
+
+properties:
+  compatible:
+    enum:
+      - starfive,jh7100-reset
+
+  reg:
+    maxItems: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@11840000 {
+        compatible = "starfive,jh7100-reset";
+        reg = <0x11840000 0x10000>;
+        #reset-cells = <1>;
+    };
+
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
