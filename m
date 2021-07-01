Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A0AC11F66
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 00:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB8F61451
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 00:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB8F61451
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRTyP82AAUDRrfDQeDiHlhmaj8Z8qgiJLNh9TBpMpL8=; b=J6xMe1NPoB7VQC
	rHG3TwB/ujR6Bj9+Tqu4ll/IZzJqBlPsRLahHUoOuwsTjPFW3iQBQB92F6jQb7yloDBiYwY44tRHb
	Ff1QPYEjPhdrk1+1ieok8mmwowvtxWlzt4gJDweagvcYwm5g0AdSQSZxH9lfjb6blHhy5owlZzBid
	V3+USKHRY4LMZ65d6oXfjIpDQVtlNQLYaDtjdNzyQ+SCqA3oRJndLKXxDZm9XGPsFBmJ/6oxNJCeU
	TzAgHms7WHj5RElI+tHNcoGaajQ/U3FXiPadb7y1w3Tc6WaEr5rHguuEywjuftOGmHxxm0nNOr2FM
	kcXjubKS59Gz6FXMhiYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lykTL-00FfHp-N4; Thu, 01 Jul 2021 00:22:27 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lykTH-00FfGY-QG
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 00:22:25 +0000
Received: by mail-pg1-x535.google.com with SMTP id a2so4388577pgi.6
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 17:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSdm070R4SM/eRkEfUHVyZ+M0Thpoj9fAA1Eqy/QCP4=;
 b=iDwJzjkg/Cb6xXcKJDcqkbedHRnU0N//h3MMRTg1+KnfRnJ9qoHHXuILtF5nlFNPto
 iGbKzvpVlyvCYQIRO74L9lyd8SjvhqGEx/t74r5T+zwGx1ahklXn/88A2YoeJpqyyQF3
 S++9jMJ/COOuShtlkkwQ3eJWPXVj8O4lYr53RtUIMFUBgPNHJnxHtQ3piI/m5Y6pp0Hj
 MrXHcnFcFRQbIUeX9jP8zLrY3jx3xXSVvqn8Jwudz/vVTOWDJ3ss3woHtWwfUDpyEi9v
 h0/SlzMlAMIfHY0xOxhvwFfFknUwaRARZ4jZQL2bFiHWmpyNvPw5YdkOuoivOpgvC/oA
 8tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSdm070R4SM/eRkEfUHVyZ+M0Thpoj9fAA1Eqy/QCP4=;
 b=kZxAXnZxNRZ3mG4YaFOK5ycoWCmncC0scJfRPKNnGIzuSVVOv1cbuU5i7pbvYjvCjr
 sQ+wHuIrhzF5yfRfBqfCNO43hZq82pEFYfL+DoZwnuhLaXMMHL4of3DzIK0YE2/dGlnF
 I7mdL1pCYeFxoaOGo2/CdR0s/cWmJqZIydTGesgUALNfF/VFJC4xmh2a+St65uzwUgsI
 BKB5xv/P93P9XPu91rxJ0lMN8AsnUCnj2ynMLd3WZiKgBRSqBOyp9Rv/W3He/3MYzUgS
 LOlEB6r+V/YZ5YPb1P7pznuS7SuszRHbC/wterfTT4IEVF+mflxL+2LVSxOSydopSpdw
 aKqw==
X-Gm-Message-State: AOAM531Cju4UI6VUz8YSi5XZZisNswJpEErsrl+1HV55ANHX6coaWBDx
 2C6SxmKk7eYQvoiMVS8bw1nyRg==
X-Google-Smtp-Source: ABdhPJwSc0jIQ5LQ/MzvbgRgWdx1LngPkR32e6yXQdiDE/tHcpJn4TAdr2Bfkm/OdpsyZEgOtzaDJg==
X-Received: by 2002:a62:380c:0:b029:2f7:4057:c3ed with SMTP id
 f12-20020a62380c0000b02902f74057c3edmr38802381pfa.21.1625098943069; 
 Wed, 30 Jun 2021 17:22:23 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c0:4701:ae70:8687:fcbc:6b3d:c844])
 by smtp.gmail.com with ESMTPSA id v6sm25117495pgk.33.2021.06.30.17.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 17:22:22 -0700 (PDT)
From: Drew Fustini <drew@beagleboard.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Drew Fustini <drew@beagleboard.org>, Huan Feng <huan.feng@starfivetech.com>
Subject: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio bindings
Date: Wed, 30 Jun 2021 17:20:38 -0700
Message-Id: <20210701002037.912625-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210701002037.912625-1-drew@beagleboard.org>
References: <20210701002037.912625-1-drew@beagleboard.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_172223_891977_309E0B76 
X-CRM114-Status: GOOD (  12.49  )
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

Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].

[1] https://github.com/starfive-tech/beaglev_doc

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
---
 .../bindings/gpio/starfive,jh7100-gpio.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
new file mode 100644
index 000000000000..8c9d14d9ac3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 GPIO controller
+
+maintainers:
+  - Huan Feng <huan.feng@starfivetech.com>
+  - Drew Fustini <drew@beagleboard.org>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh7100-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
+    minItems: 1
+    maxItems: 32
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+      gpio@11910000 {
+        compatible = "starfive,jh7100-gpio";
+        reg = <0x11910000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <32>;
+      };
+
+...
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
