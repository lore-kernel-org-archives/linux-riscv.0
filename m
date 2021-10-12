Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CCAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA28E60555
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 13:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA28E60555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUjhEp3U9KSzSpL35M7n3kwC/S5YqeUV7VoPg8B7dZI=; b=M5reEKTOcmM9bR
	3786HY4QOuGxM8BpjUSCskFiJqhZMXESfXP74ar9tGMihRkaPMZVVzExi1lXZe2QHlulA9mtJeZUe
	NTPACGMzPnsnJNa7saBaTFrGAZ+9Kl9nPHEKVZlA6wM7O8W1jmsz1hmdwB47ypKm3l/X0efGWh+IQ
	LLhF+vaWe2IOOUE7IV+H9PKIzG1znfBiFuVCpEY3EEGFj1XthcIFnbVdFQvJhf604VOHVaCfvtUDt
	4frcOCNUeI0w0aAitAfw516wYpooaF9Phxn5DQFzjCwRazr8HODYlz2brGCJnthNfYbZZV+6z/c7g
	jH8ohS6uPBBi2tYMqoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maI38-00D2rD-JI; Tue, 12 Oct 2021 13:42:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maI2b-00D2VQ-Cx
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:42:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id p16so17248048lfa.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RIgiER/HaY+i343qoTHyif5IevL/+8RE1axM/mMIfVI=;
 b=kl73gPtMjrRxZrmU5nx5DvAwaNKB3OVg7UYppnYQwjW9tDRTNiWlE3idQIz/0g65e3
 qnQLZi8xjiTbMYdt1WO6+iOt0c3ta20H3JARnqLP2k/ut3p450jOKIhYJZlsVeb+Ay+z
 WNmDtvC8xouUECw/WXFeIHsSW+bHYPS8010C9485TE+lpN3v+n7AuYnePdtZv8MRCQce
 JF/UAh0u1J6+rI3noaKGlOB9WeczlgL8mwH3RxP/QJExo6ZFg1CxsyTN+wdPb35r3nOj
 FIB7qMebUMXVwEi4EA7ya0UchhTuzx1jedOJcHIzc/fvN8qrdmmh6taqWJVl+X3/qsKO
 eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RIgiER/HaY+i343qoTHyif5IevL/+8RE1axM/mMIfVI=;
 b=KwV2NL20r+n/D0M1lZgrm79SKyLi4j/pUH7Ai38yPrNjbn0JBVKkGQWztcsLyoKwU9
 /cHlfoDFFLZdbWrGbG0qVXMArqODRXGFTAf9TFDV+4aAl0atpZyAex2KSfTuH1Kj7Ez2
 Xe3/eo5L6ZXVVIYX40p35DhvJYQUCzHzKDm2x/wlmcw1/91qcsgSj50O/P/lsqe4/mrQ
 RibkAyo53qy0mtrG1lUOm9TEvXBIaGjEuDBi2rD+M9hyg2oNMMlPg9GPgUsTjZKBrROj
 FBwATLkEd86VQshUc50f1knv8y5FdbYOEmUtbID6G4pmWiexFEFEcvAdsahB7ss24go7
 5Neg==
X-Gm-Message-State: AOAM530qWoJ3YGXzHWhku2Z7WKktHGwoeJuIPxAFCf8Z+cP2Rgt9QG8h
 9khbIqbr49q4x/Dlav1NDFkcbFftfh18JQ==
X-Google-Smtp-Source: ABdhPJwcVh359Bl2GMKsEW0Ajbn+mt9SJ+P+kMSa/CY1v2KezJxMsLSFiG4TKN9U95b2U9BTLhl6wg==
X-Received: by 2002:a05:651c:b28:: with SMTP id
 b40mr30098811ljr.334.1634046119263; 
 Tue, 12 Oct 2021 06:41:59 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id k16sm1033761lfo.219.2021.10.12.06.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:41:58 -0700 (PDT)
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
 Geert Uytterhoeven <geert@linux-m68k.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/16] dt-bindings: reset: Add Starfive JH7100 reset
 bindings
Date: Tue, 12 Oct 2021 15:40:19 +0200
Message-Id: <20211012134027.684712-9-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211012134027.684712-1-kernel@esmil.dk>
References: <20211012134027.684712-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_064201_472782_A23C4D87 
X-CRM114-Status: GOOD (  12.51  )
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

Add device tree bindings for the StarFive JH7100 reset controller.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 .../bindings/reset/starfive,jh7100-reset.yaml | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
new file mode 100644
index 000000000000..1985ccaf8605
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    rstgen: reset@11840000 {
+        compatible = "starfive,jh7100-reset";
+        reg = <0x11840000 0x10000>;
+        #reset-cells = <1>;
+    };
+
+...
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
