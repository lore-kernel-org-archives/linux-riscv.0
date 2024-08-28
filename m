Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DFBC5475C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEcXSL1EL6RMFxOuLqbpGLuJa7QK3vX0JlicnPv1Pag=; b=2rZeuWdO3MV1BA
	AMSjfos0eVhxNvCTuEoI4dAqYkNmN4JvZMuVfSAIZBkaej7dzsGPzbpS5ebalVlbnMI98VWQF1WRD
	kDfAA3rs4/UP+zbeJoxS05too6TLM+znPoxprijsf12fzY4dS9ckaGspJWKQn0o2H+tXemgh3ow4h
	0vmpYQ+PIIT67JqQcEJ0kiTQcVWsO+n66+iwZV1MczR+I19MOqPdrima20WBXjot7QWhLMknjDGCO
	vB4juY+0/413AJ/JET0QYP948Z33hMICw1NO5W4Qw4+qP4yPef6WDdZP+aTVT5radixZSTz9YBMuZ
	BS7URRUIzuzTeqshahlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF9h-0000000EldW-2ZIR;
	Wed, 28 Aug 2024 09:39:57 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF65-0000000EkFU-2f8x
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 09:36:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4280772333eso9255535e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 02:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837772; x=1725442572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqpgi+Ioc4Hh1q2eVNsUH6IqcMRcphlNfWp1+WCdT64=;
        b=Z8rbCXXxqsVD5PeuxGLW6qbXBmP1yg4zRs/AdVe2dU7rGN9vQCn7NxBxTi8rrnn1cq
         y9RNHCQTLCHPvejOJ1PwJZ0xuOmfAWxOUAu7/p2rpIL/XZonK0y2mY0LtneSF8Q14vEj
         uYNl84jKX7EnQSBo2yhHxniiyEUYUfOjZthHDRcvnSqFsXZm+H2bQlqkYS7MLACBToao
         5XUXpNwEyNax6HZrvJ2i3auE4LV+6BSy+tIIm5TucNV8twmKj/hg7iBThFKzk6CDV6cU
         fXuC/9JXbp7AchnbcK/0wgcSnEMg3FgQcEvLBBPzYGMwxGOil0nZM+GEKO5Sf7nSM1A3
         ldZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837772; x=1725442572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqpgi+Ioc4Hh1q2eVNsUH6IqcMRcphlNfWp1+WCdT64=;
        b=BGqNZX5I/lJhrC/758bPfaBfD1iYYg3CZuBsHEE2fJ5ztoCCfoRoDb83GTbPodi/hl
         PoqpkfPDqN3gdFSkfvCmnsJ8kM2idow5Xy/g4NR1W2d/4gTaYbZ6ZDJGfNLFINqc3j9P
         22b8jaDo1xEqroDYfDxHBJsfAi3Vu7s+nQhwS155l6Wopf55/0m8bB+LTriP2cOWHx21
         BfHLieeJuWH9pubADnlu326oSU033+GiNowfifPX7toRU0+H8xg+R2rRW73EUG+T97XT
         FySagumqFQldFLfD8QJY4ImBRNH9BuinHrPECRnkTvSPzbAfPRr2ZHBid2JrBNQdzmr+
         heqw==
X-Forwarded-Encrypted: i=1; AJvYcCU+qglxNfVQjaSfO87AtFrCpqyvssUdGzHLRcnSOLGGA3n7EwSZ5/F987HCTDfOIUWSlIJYfaZ/MZVd/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX05I1Yqed5PsZ6/7mnRV8YwS971xWpRQvYMsDXaiNHzJKCHFy
	zNLZMw9FH9HNmRKRfF350h3AZCpP6KqtzAEXiPbxgr2yMqwYggfW4KXUqtkaKbLoatuVTMJtk3D
	5
X-Google-Smtp-Source: AGHT+IETpe3b9BGv0n0aM0dnAJ8cS5Q7YY6k14fOQPDFxFj2whk1YkEA+f5mnYL+L6tMMK9TqVfI6w==
X-Received: by 2002:a5d:5889:0:b0:35f:1edb:4695 with SMTP id ffacd0b85a97d-373118b65acmr5912438f8f.6.1724837771829;
        Wed, 28 Aug 2024 02:36:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:59 +0200
Subject: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
MIME-Version: 1.0
Message-Id: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4308;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bfnqlyzaJpLrEgkQnghSy/QuUGq8pRc27uQrIneNjNU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+CXWk9x7tyzNeDQFogtsG8zjaPPskp0BUXE
 4KwHhVpHwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vggAKCRDBN2bmhouD
 11QrEACVIpIu/QhFsBa1s0ikl/l3NZcISpoVtaGfa7CO039p5WWJDGiQvU2XGHmZRqeZrfdigxy
 hORUEVKrYlwVYTYH41liiu5wW9SsB2Ezbh3mkN/zMeb4/Grug6Jv9K2V3JPGfK1+lXI7Q0INRo2
 X5Vnl5ze9n2TtBSd1RFrBBdIMiCUaNvtRGzBDVpNJPazhXLfV1yH4t/wZefomqpGP53ErB5WQBU
 OuFczEFjRPTYG9+9ZKxT5olkt9sLD1qybpcl7hujY4zObNsH3d+BdWZFF3lOyg5V8L3d17wRrqQ
 gNNMqd+BMeDirtt9VAHL/DKwG7BQOASFkKAmb8m7c6GWCNVqMzQQUoB3HVjUmJLTHBZqXqHn/+t
 iuv0CFwwMLUryCG22Bf6q3jhJ0pyoPhxhuvDcHuELlFc+B/To1bJS1vkLwQtgyxw1ijQrrANd1Z
 Hu0BNtzAGLh3VQIt1dehi98Jvi17K7XWJ4dP/bpbX0OQB0b6KyyVJta6jRZXjucgf9m3S0en5ZD
 Qj4V+q+fnifnY779vEX4TDaz4LHU1gNY7fszLKPq/9NNmlGyAVLLWITalO01t3fzxwjoeiI6PRj
 yqteXxBVHnDUnmQGqodOcQ1Hp2SLEWkTQwhKHgi5ppgZo37EwX+VVc1gDJ9bTIwWuSFv1h0runq
 zyPoznFYDtvUFmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_023613_702509_227036AC 
X-CRM114-Status: UNSURE (   7.99  )
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

The core schema in dtschema already strictly defines contents of nodes
with "gpio-hog" property (with additionalProperties: false), thus the
only thing device schema should do is: define "type: object" and
required "gpio-hog".  Make the code a bit simpler by removing redundant
parts.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 11 -----------
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 11 -----------
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml     | 11 -----------
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 12 ------------
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 11 -----------
 5 files changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index c0ad70e66f76..e8bc9f018edb 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -36,19 +36,8 @@ properties:
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
-
-    properties:
-      gpio-hog: true
-      gpios: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index e1fc8bb6d379..6b06609c649e 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -85,19 +85,8 @@ properties:
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 51e8390d6b32..7b1eb08fa055 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -107,19 +107,8 @@ properties:
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
     type: object
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b..d78da7dd2a56 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -49,20 +49,8 @@ properties:
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-
-    additionalProperties: false
-
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
 
 allOf:
   - if:
diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
index 228fa27ffdc3..36f5a0610471 100644
--- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
@@ -55,19 +55,8 @@ properties:
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
     type: object
-    properties:
-      gpio-hog: true
-      gpios: true
-      input: true
-      output-high: true
-      output-low: true
-      line-name: true
-
     required:
       - gpio-hog
-      - gpios
-
-    additionalProperties: false
 
 required:
   - compatible

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
