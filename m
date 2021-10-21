Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B12C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355D260F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 17:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 355D260F9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Ob0H5WXAYvepLwnjkRsTL8nBqlY8T6Z1rf32lDr+80=; b=yFExvNHUJX7+40
	Exsea6esT1ZE99EPijCCrDIiD5jS+gdBUX0i4oJOrS6kZEO2pztvm1YoFdPXozPJcWidEy0Jnvodh
	z1yQbTEiRM1VlS6JnLxJJASo4xqF/Kbd6AncQMQVOi26EKFYRQzxTd5TG0vFGd3Ko0KRPNF8dyvnQ
	R9oYJ92AQTx/BvwpBYNzAHqrwB8ooSbzbad4a56ylPfNmMdqXPZFJ4ClUOcfi0Z0XZYM0bK/pkge9
	akDjt44E5wMyTe6OvfQnmYC6FA32JHz7uBy2r2vvRbA/Ua3iym+VMHAujTyljcxQDa5z4Yj+h7Pr3
	zfhqU4MysjZyOPUEme/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdc5d-008WL5-4b; Thu, 21 Oct 2021 17:42:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdc5R-008WC6-Db
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 17:42:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id d3so2082923edp.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Oct 2021 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8qbfKAJ2dJiFCQVxyKPZl47EINqXvD0LgrDBKR+z57I=;
 b=MMKdvpmdbUzEcdId3TldfQmB5i6ackBeZUU2pM8DfxqOmkDEh7hkX4mGrM5IJ9vFT8
 68vx9zOtPz0+nkEU++z6eVDJ5xmlMe7qjYX/OEWOMwMk8DU5ObyOV/OM9iWj1gIn4eQM
 lYsrn5r9YUwkNsNLadmQmKL6MjDEtvjNBfZILUJU2qxgxcSek4gSAfPWlkt5+d6cldXx
 J9i7tSITZGWCRNI0ZSjLQ3uQ4uWZNAZX+2KxUAwX2knuc8a7Ep53EDf1o/YHvgnk7FJ9
 PUP1UQZfPLEBmw1PubH5+xmPXaf1jSAje2pWDpJoMrxKuijRqXR4/chF4WSYKqhp2XiM
 y0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8qbfKAJ2dJiFCQVxyKPZl47EINqXvD0LgrDBKR+z57I=;
 b=fo0udQmRaHldt5GuyxfEiR/hUwfrph/Xhfsbw0Ug68eYOdhYIqRczwfkTZXjEW5gba
 7k+Ocjx+Ku/GXzapUnPioXkqHcyGinHq7W+KKFdOgugmUrgV3woY6TcQzv1c99APbNJU
 NSxdgjd+6R9b/7WXoHg57yGim8UU+NXkV+MM9mF0hvZg+yiJzYhAAkwYArO5XdlTK5Lm
 yaL8GNtlU5HhnMvJx/Enwlx4rvE67Qz6tFNjMratmvJDsOY5ZYKWaMT0fsccfjSMDTPo
 lsaCVaFjh1Il1pZ36nowq8BhwQHm4qBkDw29+pp6p2pyAZieKovCxmcv/cuPIFiE4bYq
 5dRw==
X-Gm-Message-State: AOAM530onR8L4McX7yuwNAVRwEz7nQ0LqLSDMTBzMSkwuYN+7+dhd62i
 4Fu4lRoMUR9eBeexHnBbKozDpVSnWe8Q7A==
X-Google-Smtp-Source: ABdhPJy6u37PhRWJFilRxlpWrdwnqteMlxv5etKOOWq7spmYGOekeF4GsFagzXrGF8yjyiYfACHabw==
X-Received: by 2002:a17:907:961e:: with SMTP id
 gb30mr9045337ejc.484.1634838158597; 
 Thu, 21 Oct 2021 10:42:38 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id h7sm3144847edt.37.2021.10.21.10.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 10:42:38 -0700 (PDT)
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
 linux-kernel@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v2 05/16] dt-bindings: clock: starfive: Add JH7100 bindings
Date: Thu, 21 Oct 2021 19:42:12 +0200
Message-Id: <20211021174223.43310-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211021174223.43310-1-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_104241_508856_2A96E09C 
X-CRM114-Status: GOOD (  13.54  )
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
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
