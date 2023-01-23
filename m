Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9169DC38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8HVPuSBp4/CroKK1R/BMh/5Ou+i+iV9M6Ip6rDXZqQ=; b=k8uLxC4GoGCLvK
	09LphYHIvjrsBvdaBAB2umM5yIUvLzHJANo3FbgTqj9fVoHzh8csDA9QaxjJYub1UqgefeMFFZpCV
	JqL0qN6/gX1+M6DyIMsVU0VZqQ+pAvaLxXrDJVE5uYA1OS8mZhBS/uArrNQzGGKVd6XZTiVwIKQb5
	9pqBf0cebSEQSW6Ia4dTfUzFSE0yPkGPiFG+ZwJjnn5d4nko3r/MVH8DCOVIXnRIjxcW1oaEKz12c
	WP7AJmGTDBRP7ok6mSAykpvEJcqwpX9EwB0s/4S03iebGNuSYX9JbcFSKU+45ySBUEemj9HSmZVpH
	Rn+onaHRG+OGYOiF1NtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyau-00082H-V4; Mon, 23 Jan 2023 15:18:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVu-0005Ms-Ey
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:13:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id h12so7121807wrv.10
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3ne6RtXQyQ2xZokD/urqvcvyti0fGO7udq2uYUhjl4=;
        b=ydh2zyAbOx3hE1kJAVrZrsefQuSR8jHADM5MS6sVbbZct0miuoC7KZrzryx7Yvz3pM
         K16L74uX6totfds7MApM5Y7/ETAzTOUeQyjnsu7YJWhRb1e6Y6zZ5iKrI9fd9Z+ik4Dw
         Mx6ADqiiYoLJz/GmClacx1yB+vBuevPj1fAynGEWxi0kk2i6wujebP0QRpxiZEZK43xC
         exATrdrAix3IOyt9hk6dBblyy/TJ1Q6w/MLeQTrnrViuZQwlPgnDv/gOlQKlIFR9iUIl
         KNdDPqCjuLM3V15JfBwvd9jXRLoQtiDIUuoq/41Qp7KCUva41ZYJA99YGXWMG2c0Gh4L
         +S6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3ne6RtXQyQ2xZokD/urqvcvyti0fGO7udq2uYUhjl4=;
        b=ng1maV6fyH0iOBSpYsmbsDz40W1lo26X41RUQ7Yfn477fJ9w611xFhBSQmKKaPDmF9
         0l6ddfKyEkaIGMlbqkXP2RU0TPzsCIhc8YKqTaCqbPxatJxHd9xKueYBpGgE++3qx4Kf
         xkp4oFx/6ECnPmG78G3S01h5B00t7EgzMryt76IBi1bDutiT0hxK9H2mwzmC6Dk77TDd
         i6u5G8bh6sg4iRudiVKfswrLevChBCZbQd1Snp3AhZKjamQHllAHZI3ntz71Ubchrye8
         JMa99iyB/5olBft3Rkc0oKa/R+iyM0YyEGUQ/MGK9SrHuKfJZ+9gAnrjZ6WODFYRb/Bq
         q2RQ==
X-Gm-Message-State: AFqh2kpMgMdp+l/8iUAufJfy2IEBhgRzWYXG/G6CRbnnTP9lbBLcJSv/
	N3punfEpG8S9iDOYSz220gPerg==
X-Google-Smtp-Source: AMrXdXsviEDUzv3yh0GoS6/F0WtPaxs3pJyKMS9EUX0zyAfxGzLvqcSCV0/YUD0sMeKUCYfXL73u0w==
X-Received: by 2002:a5d:6404:0:b0:2bc:5115:f072 with SMTP id z4-20020a5d6404000000b002bc5115f072mr23077077wru.50.1674486817972;
        Mon, 23 Jan 2023 07:13:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:37 -0800 (PST)
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
Subject: [PATCH 12/13] dt-bindings: serial: drop unneeded quotes
Date: Mon, 23 Jan 2023 16:13:01 +0100
Message-Id: <20230123151302.368277-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071338_980301_995376FF 
X-CRM114-Status: GOOD (  10.78  )
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

Cleanup by removing unneeded quotes from refs.  No functional impact
except adjusting to preferred coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml            | 4 ++--
 .../devicetree/bindings/serial/fsl,s32-linflexuart.yaml       | 2 +-
 Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml    | 4 ++--
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml      | 2 +-
 Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index badaf6d5b6fe..2d0cac642427 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -203,12 +203,12 @@ properties:
     deprecated: true
 
   aspeed,lpc-io-reg:
-    $ref: '/schemas/types.yaml#/definitions/uint32'
+    $ref: /schemas/types.yaml#/definitions/uint32
     description: |
       The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
 
   aspeed,lpc-interrupts:
-    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
     maxItems: 2
     description: |
diff --git a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
index 8b643bae3c7b..920539926d7e 100644
--- a/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
@@ -16,7 +16,7 @@ maintainers:
   - Chester Lin <clin@suse.com>
 
 allOf:
-  - $ref: "serial.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
index b431a0d1cd6b..4cbe76e1715b 100644
--- a/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-imx-uart.yaml
@@ -10,8 +10,8 @@ maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
 allOf:
-  - $ref: "serial.yaml"
-  - $ref: "rs485.yaml"
+  - $ref: serial.yaml#
+  - $ref: rs485.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 26c3593fa98b..ab81722293d3 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Fugang Duan <fugang.duan@nxp.com>
 
 allOf:
-  - $ref: "rs485.yaml"
+  - $ref: rs485.yaml#
   - $ref: serial.yaml#
 
 properties:
diff --git a/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml b/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
index 14c7594c88c6..6a400a5e6fc7 100644
--- a/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-mxs-auart.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Fabio Estevam <festevam@gmail.com>
 
 allOf:
-  - $ref: "serial.yaml"
+  - $ref: serial.yaml#
 
 properties:
   compatible:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
