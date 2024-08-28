Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B52C5475C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IEi2zT+N8dxbyemcpain6EIkQrB6z3fW4aC+frLkj6U=; b=FsywbPVVjJ2R7J
	mIAOItl1sB/zBroeUV/C0iWYYBAthgTWhylVtECDq+wu11LIYHJx7iNS38wwmrV/YpMTM484+/XC+
	xC36Lq+m6qi4+hb2ptDnTZgppA5SLwXBaWQwVdkaHG0Lg80r9eSxmad0pgVs+yS9fDshQgH6vvu4/
	jtLo4fDmw4AGxL92B3lwy/NZR5miX1sR20Oipo6PxutHdmPfzUTw3hfWNKjd6dhwXkrXW6Y8OvbtY
	EjdtjjrbOC+aY6qGjcspBIzUANWgvBJ6YVhvIZeOQsJ3J3GihqQvOxiBTJRnhKZ8zRU4P9iUF7Krb
	vfvH5kTjWPisUMJ7ox2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF7A-0000000EkYG-41ad;
	Wed, 28 Aug 2024 09:37:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF5z-0000000EkBW-3mzj
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 09:36:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4280ef642fbso8151525e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837766; x=1725442566; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp8qzlM7kPhcJ9e1hKIRPohu0dawiY3efvrm0vcGAng=;
        b=coCPOD6xjKepodNxw1n6NRmvE4ezH9KNJYDD4dZZl+N4srkJiul+m3ha0LufDBOkDa
         C0dHRNEAuoGmW62DCh4InqsZ9mdGwb8gWCLkmgOH+lLVjK4DwCHlffZC9+6y+9ub7081
         TwOYMUw8spfAf/qUj/0hnSKGt9/2rnDNeqShxIAhSd4ASXO1+1xUHSGGZPTAMIL0jBAX
         rVjpQy4/pVNpdZBnGSCaYQHiOZjlJgvPHeeMqyqwrJZaekPb0/Hkw7kqrk3Tn2tzqLkI
         T8rKNUABU7qviv9gjg0QskC49c8niEvkLCWknNKY0/kHNEU055kZQezJaFkSvcSCQD+f
         N2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837766; x=1725442566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kp8qzlM7kPhcJ9e1hKIRPohu0dawiY3efvrm0vcGAng=;
        b=GoXhE99uJbRrZOpkneiNbIEYOYlpFI3wT5ejV/WOSN+VVdaSCzlKS9QF2l+CdXUepV
         aHiUgmP71GKmrzAO4pOPq/rQgkCeRXUN6ZcE7C5PJxcfCtp+W7Y6K3bAH2Mtv39QEVmp
         9jGrMt3Oa6buOIfGjSZVLtmacaLXbJDRt9b2J2f0ckFRwuZFxRelC2h4b9jg91Jow6mj
         LYRWGgvZhQEJLM6Vk1cPU/l5AXI11MqHa2uy3AXTVVQavl31H/W2YQz2GWOqnGetbdWo
         tKymKXDbG8jbIhYUgFt1N/C2Lu5BjI+7L1l7vfQrJh7EDCST4BjNAdImTdUvCgIuXkKQ
         W3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWv/ICukVvkKvkR1ch7weL6cN4vPZX+cCDXADYOfm+/tySK4VhkWyQcbSyVPS4RJJF/92rNtrUwhXTJlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU+TGQHJQU22A2xZlTz53AZj7tVHBmGbrMlbPVAtt2/bxdPzHB
	Ecrt09Jxs1JXX+34rO1O4+tu1iU0m6QKytr1MmwV7cuhyLshr2dOkqAVIk5duNau6v+U3qBwf8E
	q
X-Google-Smtp-Source: AGHT+IGoDsdqy8j9+OnIPj9MpjKsin3XMlSfq166GCfQGpaVuIaeJ6QaRw3LIgNycTwVYzwU8jICAg==
X-Received: by 2002:a05:600c:511a:b0:427:9f71:16bb with SMTP id 5b1f17b1804b1-42acca17489mr69343365e9.6.1724837765624;
        Wed, 28 Aug 2024 02:36:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] dt-bindings: gpio/pinctrl: add missing type to GPIO
 hogs
Date: Wed, 28 Aug 2024 11:35:56 +0200
Message-Id: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHzvzmYC/x3MQQqAIBBA0avIrBuowYV1lWihOdlsNDQiEO+et
 HyL/ysUzsIFFlUh8yNFUuyYBgX7aWNgFN8NNJIeDRn0NzqJXmIoGC5JeKaAmmZLht2sLUFPr8y
 HvP923Vr7ABWHv1tmAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=lLvVZWLA94nZ9XmjPRVxXb58c0i91Nnl65/obNUKLV8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu992mrrPM2WxuwVtWclMQbM8qZU+tTUPk25H
 UOxPSA2JVeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vfQAKCRDBN2bmhouD
 195eEACAS1+/AYVFAiRhEC9zw6dnuj7PARvegrA15YKhjMoXTc2ElDIgHxhb/2fTde4RIOlhzSt
 A+3xOss/CRdrGQWU5BY0nv/gMMnhIR2WZlPdcn9s0OP1yp4rtTT1RtIaMYWYWXJLhhwqdxe2i2X
 F2e78YGou0d/lcZNZVMtiJG7rIKC+FubeNfzcPM22wdUS638O4YLausVhdJlRkJA9nCUT238MV3
 m0BGeKbFBEQZq3X5gLkyAiaLXhnwiqicHcyFvhsKu/wlF3+xPyqKXvAaMcOejkA7B++kj4//3zI
 qE9IFSiNQG7DCqL50WXeiVGj/zvV3nPfJFRbth1PDhTZYZw6pbsyylg4M9bkRlqUjScZIa1VvVH
 eq8nGwJLnDMyQZzGGya1bo0wxSYFC4G4b3GmU6PYV0UrGpAGd+iCPBNexAx46Gyyh06cp69dQVT
 W0yk6aZ4L2OHdS2CNu8ZCG/VDFoDnbfe80NE9Y+ZdRyXswJxnlj+tF2R9bv6kMKspL8F+DKhj8u
 +pGMjsgDxXC4J9DDQabR+EUFbsq8uoOgFWeNxUeLsVVwb4n9ZyFeuk6rhRuGpGLrHbNCauUVEhH
 se7ShE8UXBteVw6sAwyDCMaJoHkojpB54wCM9MzAskg5rNpKVdRHKRWOiJhcGqYXwcrp3IQi0Vm
 Xz2eQPo8pq4HlnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_023607_987630_42758F0D 
X-CRM114-Status: UNSURE (   9.43  )
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

Merging
=======
Patches are independent and can go via different trees.

Description
===========
DTS like:

    device {
        compatible = "fcs,fxl6408";
        dummy-hog;
    };

should fail, but unfortunately it does not if "type: object" is missing.
Add missing type, so this will properly trigger warning:

    dummy-hog: True is not of type 'object'

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: gpio: fcs,fxl6408: add missing type to GPIO hogs
      dt-bindings: pinctrl: qcom: add missing type to GPIO hogs
      dt-bindings: gpio: simplify GPIO hog nodes schema

 .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 11 -----------
 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml      |  1 +
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 11 -----------
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml     | 11 -----------
 .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 12 ------------
 .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 11 -----------
 .../devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml    |  1 +
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml          |  1 +
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml     |  1 +
 9 files changed, 4 insertions(+), 56 deletions(-)
---
base-commit: c79c85875f1af04040fe4492ed94ce37ad729c4d
change-id: 20240828-dt-bindings-gpio-hog-429a28eb94a2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
