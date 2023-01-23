Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95473C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMXPFMHBogOuqaYT30lhChbW8UOyFY56N4LoXalhTRk=; b=fdbVe0Af2uaPZJ
	TasiRIWuTHNmMN0HsJxi4bodWKbmpspXrT5GvOXNoiEoMB6CMVTS2yKqz1OA62OJZXCAV8+L3/avi
	KhC1bKK5+arVj1S6qh7HmvJIJZgL02GN2r/QaXzypgvw7dKg22ae1jmiS8MzIgd6utKHhFzQRfpu5
	p7a5NpL/kG9yq6XDpWKHaYKRF+/wLbBZhHEuzNCQd2woii2FGXFWVGib393wj8hhZb6wvbS6wJLWE
	JbtACPctaIc3FpkZoRgXjGsbsofEajXqn5KDzl+1sytrnBvDZhZXYk2z9G8ep6cQ46GzCiRetsFsy
	REcNyjJmEpdVQlRN4YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzTE-000TCQ-0d; Mon, 23 Jan 2023 16:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzHA-000Ohp-EW
	for linux-riscv@bombadil.infradead.org; Mon, 23 Jan 2023 16:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=; b=gkCJW1GiykKC7JyfI/RKrWvPly
	763CKA2UHk1CDj8kfV3kOCVdNUslVqpOphvCEG9s/lvNWor6+bG+77iTsa47xzwZWt2OVjf1VDJJ2
	dwBQWj0qBOh+yQ3XuO2ymant9+gXo3t47n9y4n/T0ZTfq36f8zeJdxww0aLGp10SLPYxu2FU4eb0q
	IxwZrDyJ0Gb1dgmT16ykLQkPa0+eWBsUGTAFxVmFxPmJk2l/DvVosbTyBYqdJOJzDdICHm44+RD2e
	P2wDBfeYy0589wjMg0XaRPYJA5bmwy3uffOm7xNMvOKidVHMxjWtucB8vWbVQx4AzpAuYZKvNZ7KZ
	9LBtVp0g==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyVA-001ZDu-02
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jan 2023 15:12:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id r9so11123162wrw.4
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=;
        b=jcfa4hARo1HJwIehRkPDvzT0+j43uVWrJYFNzZFKJFnKpJiYnKY2DxtS+F/JYF6uV4
         KknhnLaVrHDF1aK+YU+We/6hYH28642w2VsAR2GhuxMYrMGdHZ4yvQdKZpcnOwkKtjNs
         9YeAeCXyUlV+RLV/5E6LYVH0K+wemk8/uI/1dcbZpOzNblLuvGNxrTnammNGXidPuI0r
         ESQrQEpLx/TKFTbBmG38BRF//5BuQ7VLC+rC4pjygLZu77HP7SzuoAViTIttym9i2g6+
         dyPK25KiunlTmQVEYImYPt0PSo2l+BBax4BFQZTf5+cfTrrzSHX9Ua9rb0bUiuClnAvS
         sn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=;
        b=5GJNvLgZ93U48A9zHyh3GBA6AkhUx0zB/AjM8RQypwyAD1GDWzZMCQMeKsy15VlWFZ
         RlXdK2gWhif61UQ8lT/DzV7xtAy+uoWKFQ+PR4oHIcDibort8T1w1S4rX8jfbKN63bCg
         9W0K6GzYJ6CfIQo8gutTP9S09gCXvIpLhFqUCNX1zpb3ZDdQ14ndZkoc9aTrUzTeEsMG
         PkXZzRu5xf8+wQOsvfA1WuDiIE+LBGcnjemg4YG4E13Bat9eYHe7lcfiRmEW1tuZ0f9Z
         aekLUikkJiYMUZdtRGsXF+kVW32RUmbuxBRQvNUeMGr2bn6X5NXtLr6qt707bBLk0eDP
         imxA==
X-Gm-Message-State: AFqh2ko7DEck94VJ2gqQ+biaPTkSZxMBKs+pUJ/Ul0Zr5Ixd+abLIUYg
	pJuGCeWnW23gizTd3BJ/RZNDQA==
X-Google-Smtp-Source: AMrXdXunaNSmvF24sA3mpkTnzyAxSSQqlgKz33L99W7wuvo753haLL+xzVFn6hjB2Li7pbF1fFW5Cg==
X-Received: by 2002:a5d:5954:0:b0:2bd:bdb5:baf1 with SMTP id e20-20020a5d5954000000b002bdbdb5baf1mr19905320wri.10.1674486800444;
        Mon, 23 Jan 2023 07:13:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	- <devicetree@vger.kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/13] dt-bindings: serial: cdsn,uart: add power-domains
Date: Mon, 23 Jan 2023 16:12:54 +0100
Message-Id: <20230123151302.368277-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151252_178906_E04EA360 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Few Xilinx DTS have power domains in serial node:

  zynqmp-zc1232-revA.dtb: serial@ff000000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/cdns,uart.yaml   | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 0c118d5336cc..38925b79cb38 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -9,9 +9,6 @@ title: Cadence UART Controller
 maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -46,6 +43,9 @@ properties:
       port does not use this pin.
     type: boolean
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -53,6 +53,17 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: serial.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cdns,uart-r1p8
+    then:
+      properties:
+        power-domains: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
