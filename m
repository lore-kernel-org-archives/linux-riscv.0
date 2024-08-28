Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370D7C54795
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 09:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B24IQLiW1gbe6UQrJsjiI/3PaxhN/T8GYZgVgiahFc=; b=ZJFb7/qWj+HyQj
	rQGx1Qvqjz+hgS/Mcg2XLd5rBRq8URAeWTNE0PRDp7+5w8aKQxhyyyEcptvw/VzhRpOrx5ysEoeBO
	TjmPSMo0bwvJ3fIM7g2vePm8WGbl54mzgm+JIGF9hsq14aP/t92I+m9RU1ag9yWYVWcDXMUMsBhIR
	b4iDT7Prbz41tnn0uTrZ7cnLpEIPfE+SYdlPgjCglbm743BitkF7z56kE04jmclC+gZeiMKL8uP4q
	V0kebRUik7MfRbM/945afgk+Ja9TOITYBU81vjW54n9CWrggCUjSY3wVhZuo8zZgeInDDgvdi54Ri
	+Y3Kj6YXuADM5T0d4MEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF8t-0000000ElIo-256t;
	Wed, 28 Aug 2024 09:39:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF63-0000000EkDg-41OE
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 09:36:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4281e715904so7284215e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837770; x=1725442570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZNNRrHbOALIGghuHu53Hlhnl0hetnh0rIsXkn0hdN0=;
        b=Ov03B9AuwvuARitao/+3pKKhSwzuEwbBJR5RhkaKWUYyIWQkeyn5WrvgJCAiiO1DiM
         1JaA/XQmaGgi37gZ8rD1ayp9roSrDAK5WzkJBQG11a6YbDapVXooVrXgn6xgpqSQVrit
         KSdgHDA90Z02aTowmKueWNK612w5vccTKKtFWg60vrTDRzjHSXFhsD654jooetHMTaOC
         UV70wVIYG7W8A5GTgdg/yyicay8k0qgAESA0xtm2a32eETU58b8Z+V0XAODRRxhNNzoc
         jpMkZg+MA/+4YI0q5kH4vWZcp8h9tI/CS85aUUwt9kWt+KU1sv+SyThQBNjtg1TOvb1x
         cJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837770; x=1725442570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wZNNRrHbOALIGghuHu53Hlhnl0hetnh0rIsXkn0hdN0=;
        b=useQnFS2drOAElcG0ybH6VZfwXDW1rY2fqzwkJ0+OU8yudOVvyaPqnlw9BvMEkxSMT
         RVdvhzI+MIJ4OaRYphm0CyqhJr5SMr/F/C26wqW0ltTDx9dA7cMa6Yj19l+aSmWHZenM
         P9wPLufrCyKh2puGN7Tkc2G2T2Kk4/5lnFI2rquPJUVO78RT8ffBtNRKCiC+Yn5Eixcy
         X29W709Dk33TNFZ25v0q0qiXCC5wIUqPxvtA4trQ3xu4Esp92dWe6/wTQU1SJyJLlvYa
         aPAYKmoURDz649srATE+hLjqLLVhhAUjaXFrHmluLBRJVHqXNnIxel1k09gMItrKaZJ6
         7izw==
X-Forwarded-Encrypted: i=1; AJvYcCXnh0YFjXQpro4riIIg3yha0bxuu0s1Dop6LkPlsWa+9hQ2bOY3dwEgihDTtzlJPcv4FNRAnC0/p+lxuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZyrLFad4Py/scUg7pbisj2fTPnO5WN1+Z/cybaWM90YjybdEA
	buK6ElRi6/Caq/N3DyXSIyfNn8YLSJuUVsZFC36KzRr3HoT66xxkhm2awsO11JaGpPr6QOQHviN
	7
X-Google-Smtp-Source: AGHT+IG9/vDsNXLZCy2PLta7RRyHss2Tb1u9MzhedawWhzPd5nwASvDx/bFEslbEbjrUTV0SqLsSJg==
X-Received: by 2002:a05:600c:5105:b0:428:18d9:4654 with SMTP id 5b1f17b1804b1-42acca311f8mr70381685e9.6.1724837769651;
        Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:58 +0200
Subject: [PATCH 2/3] dt-bindings: pinctrl: qcom: add missing type to GPIO
 hogs
MIME-Version: 1.0
Message-Id: <20240828-dt-bindings-gpio-hog-v1-2-63b83e47d804@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zQ/EAttBpW9Q8AXfVWlgDx0v3eHjsl+TU739HvihRfs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+C4RJJ1RBPM7LK8KIDj+kQS2rURjG6cPz4n
 Yv6DIWe9IiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vggAKCRDBN2bmhouD
 10KyD/9tsd39XLXpxYG0Lh6I05zljRsfz0oC9ri81+o5RR3kYd9IjLAbtMSNauoFquWI80pWYNi
 LEZAngibtD7JGqFe1ScTwmsECnMjAPN5XRteP9tc4603vRhDHj2SxRFFi2Zi9nq7+GdatJBlJfD
 IsekUWVWvctDrFHH0rg9HVteN1DYUrLEgc+EheM2qYgI2U7QQElkKI1/l2HpWeYdLJN4CL6fioJ
 sWlIFFZf9jTaIlqe+TO8ebW5Lh7ATlXy+rO5K+ZMC2KS7zRUrQJfg2WrWTXZ8T3LdKDaCqkl1gj
 wPXclOFxIW+tA6gd2tI/SQh6smy9p7vpzmXp4pWxVwM3zBPwRf2k1HB/nKvXGehJISf/H2QAVNo
 2nrMN6i3P6PAUi4tvKaR1CMeLhs/8KDfFhNmuhGOJLByoo5HAfqUW7C/hHLBcp14Jk5yqxuiLvB
 K76O4HnJTdFnRvyRpjqjHlTV4p0D/mYhGP5JG7Vgsk3j5HDKbu4wtTj4PudviDb5sspANnDP6qI
 d4L1uj86Q8weETPK8GwTG7RZERJSQPa6OiV6XX3fx7PV86IYZ9fLHUjK4CNU7vJVyt+07DbbAW1
 o7HOH/UVl4OQdq/L31kY12RnfU8hwZnRd74ocoy002eM61JwmFXA5Lt9d4B0cfPhuGCElomKrOc
 tqjIFpovb0Tqe+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_023612_030916_854C38E1 
X-CRM114-Status: UNSURE (   9.66  )
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

GPIO hog nodes should define type, otherwise "dummy-hog" boolean
properties would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml | 1 +
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml       | 1 +
 Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
index ebf74e48ec5b..cc5de9f77680 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
@@ -37,6 +37,7 @@ patternProperties:
         additionalProperties: false
 
   "-hog(-[0-9]+)?$":
+    type: object
     required:
       - gpio-hog
 
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 2784d32fdde2..c1b799167d81 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -425,6 +425,7 @@ patternProperties:
         additionalProperties: false
 
   "-hog(-[0-9]+)?$":
+    type: object
     required:
       - gpio-hog
 
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index dfe5616b9b85..0f331844608c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -43,6 +43,7 @@ patternProperties:
         additionalProperties: false
 
   "-hog(-[0-9]+)?$":
+    type: object
     required:
       - gpio-hog
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
