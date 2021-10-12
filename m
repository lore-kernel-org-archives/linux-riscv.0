Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A78C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA6B6052B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DA6B6052B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GB/3cjOsKaFgSFk4F8WODQp1Q64rCOZbztLtEM7KJVg=; b=yA9SJgyrqplOEU
	Kwe+ssxLP4bLCl23OfriqN7BaQuOLRw5pdH8MRPw2V4vpg4vDIoSxxmZrZiIMp2d8H9kKXoFP35tT
	f8EqI7dYYyxgQPca5lcLL7lv890z0lDklOEpRO8PFQC+w9rSnMBGdgqADVhaR2pwBqfXO5WNg5Ce5
	KdAHO5c8o0R+wlS5aK6kwmEtbmmE3+7DX4ESFUuuiWuF664QxK5Wk8uhTonZit6WIN0OR9cr9Rk3k
	un4Clk7WU3j3EleNQ5BCGs6B0YByn+TgZBsa1Rgra3X1GUJmX6k8fBEnZzo9KoQcg1fUHay3QX7gQ
	fUDmdbmnbwaJyoLAopJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI2c-00D2WZ-PU; Tue, 12 Oct 2021 13:42:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2V-00D2Qf-Us
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:41:57 +0000
Received: by mail-lf1-x12f.google.com with SMTP id x27so88111518lfu.5
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qcU68ibM1CGZmIx2gjYL9VUnjOg3l24qR7+bPaoLYA=;
 b=jsEb4gl5mBTiHFZfMy5RQmojSRuhVZ0oZEHInvOB0oo1oYCKFBea4SieWSW6ibdS3h
 8pYUFkgTePJoWhFJMesaTkANlEu5CoSMCsHw3FknnFcr2sjsrGtubmsNyp6NkWhRA6b3
 f4mMAlegCvFAvpa3T6p6mj20UReuRbbp99S7N8nzewStATz07PHTlRot6MebjDon+325
 uHb0YnNI4u2QRkgm7i6hdih50OzLVwoXU0PRCLFAahdvdOWtBWd0ofiuUdAnJA1nfQYc
 3IQeDkX4EVPv6cM4cMIoeBc0Ae0etCHRJNnVBaRm41y0IdLN7mNr1k43rcOoVFos4WmZ
 NSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1qcU68ibM1CGZmIx2gjYL9VUnjOg3l24qR7+bPaoLYA=;
 b=OBhBy5vQ0JgCwvtoZ9LS9gPh2QlFbLal3lw3zQRmbJOE0YOWBiZgMX2/5NpJ/4XnSD
 Bba98aZ15equtBAEJAu+w3+Wr5yF5DwgMA+2UQzRbe/71nH6TDhyL6lDBoJig89Te7en
 WBn/enxiu+zFq6J6F0o6Ti4iDBeib1hA2Jbhmn9dV/j9ytuSoo+8mJA3WNnQnBPHY/Ju
 OeZ8qGI4dU3SkGJnveLAYJ5dmHdBqPNrdhm1/XCc34ZKSWVvGvnWkjmgI+8D2dQFwxzc
 IlodyhBjtYIprv8HfFk5LbDLollvdjDRydv2LIg9J5owyJy3lhDAwnY8lm9KMDZX7iNo
 Yvgw==
X-Gm-Message-State: AOAM531siHst+F4j5KwMV4nDz+WM7K1o6UtXgL62eWOYwgmtEbhO7Y/b
 kipL2Ae7EPPncWMxaiIqxy+rCZ8hzlipAA==
X-Google-Smtp-Source: ABdhPJywzrqzc6BL5W86ukJVstB+WvIaDv9CMsJp8o23tor68e6mlpzBFybmpRC+v0YVIY6PMxZWPA==
X-Received: by 2002:a19:6544:: with SMTP id c4mr33937633lfj.130.1634046110722; 
 Tue, 12 Oct 2021 06:41:50 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:50 -0700 (PDT)
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
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Matteo Croce <mcroce@microsoft.com>, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date: Tue, 12 Oct 2021 15:40:16 +0200
Message-Id: <20211012134027.684712-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064156_041803_936A3939 
X-CRM114-Status: GOOD (  13.60  )
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

Add device tree bindings for the StarFive JH7100 clock generator.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../clock/starfive,jh7100-clkgen.yaml         | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml

diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
new file mode 100644
index 000000000000..d19f94984eab
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
+    clkgen: clock-controller@11800000 {
+            compatible = "starfive,jh7100-clkgen";
+            reg = <0x11800000 0x10000>;
+            clocks = <&osc_sys>, <&osc_aud>, <&gmac_rmii_ref>, <&gmac_gr_mii_rxclk>;
+            clock-names = "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk";
+            #clock-cells = <1>;
+    };
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
