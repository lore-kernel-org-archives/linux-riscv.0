Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D3DCA0FE2
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XFNlwbPDgell9BYizib4UCtU+huB9AsiSXadrM6Gvsc=; b=vuxvaeKsK0XwrI
	mRzXbH2RD75XgRgBXTDaszYgEfWjHHbFquzVtl28cBuxiossyFjagF1tQIoUE8n+GocjYUpvA9lJn
	BhtmA2Ja5Ztz4dYqG9ig9unAw2n/PoyWeNtOLi46nZwi0CPVwMx3rtSQss2as7cLOCBQDqdalOYD2
	YHqq22d5gt0/3H77tA0HtU4CHftMtHPbGp1JBTl9PQX1A/tM9ApglyMT8fAvG6558B5t2Ifr2dEXd
	YQ+2PcIfb7sw/yer9VbjiqgPFHbHysF3y15mSJxkZxMwkqJynik/sPPDjfa/nsKHrPqOLOfa5EFTu
	MPwRPpUL4eiIWD+oHWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Xe-0000000Gc4k-1uVt;
	Thu, 21 Aug 2025 10:29:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0ip-0000000GGJU-0iUp
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 08:32:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb731ca55so8526666b.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 01:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765154; x=1756369954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2tpMok2B6oSFp46bPm9JfIyRCEx8l+K6LCpsnmOC61A=;
        b=MI+gq/EGRn1iv3cyv/Gp7JLRxB9q+gcT3/pcFAtk1MYkA5bG9lRdx5EBI5nWprVFcm
         77bYmfbMTnfquw5OEZxqSAc2sHAPpZbXS10p6yOjujtO7fk4tRStY1PPSC/CqgdmnFOZ
         /xjF53Cp6+9Z1lYmRPhjiTLH3jTGRwGBSFhWqum7O7NpyrRuSFN0WARhpKBoSk8lW62i
         cxQ45aTHoUcRk5jBO75Zb7jpkVuKXiWAFtO4/C1yCNrP548UowFEPO6JP5X/XhMJbmi1
         cLgexgdhPAfHsYnhDQoIpzSTAhduNKXaZAQGVaLSKmlr8oYQBd1GMEpSe9L5du+H3d/U
         eU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765154; x=1756369954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tpMok2B6oSFp46bPm9JfIyRCEx8l+K6LCpsnmOC61A=;
        b=APyUYQKE5nWrQfDjfTV8PK1Z+Q21PrCbIDR2ORxLfyL9EHr3uekAexiFLK2FwRvkT6
         4q26dROJeulkOIOpLCnP/jLSa3o0kDVVXXL+Ivkt5M422bUuKtRVl5/03pVT/Ht2hHno
         7Ys+AFEBbCJX7a2PsutBBAeU+bUgu7xiz32W+49YGvYGcJOEkE/yUARNR/WZ33o28yGJ
         jwRYZHeGjB3d4FsuriZ0MhZCYb10vAwS9dXWpGiVXFbNGRW8fhy69sy8pUW/Jpwq1API
         Q9ozfyVfFWpIXXrPhFLSO7iXQ742eZREpK1I6p0/dAH8G7jNv/uSA/jCYtHVY/YIbyaG
         khpg==
X-Forwarded-Encrypted: i=1; AJvYcCXGD99OnVNZwC7yv/T7frutaOm24NONHK4BWRInfgAhYTh4xgJnGbzFiyHnEdipLHX4qqQYPvNQ5SOjNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG5iHfxY4Mi16zfxH09OcSpt2XL/ZqERQJV73nwzMmoO7UzsF1
	K40laFD8T9t38JN8W1Al2K3WHIgSjGq3crCLYBJk5P++XmWRs37erP44mKdsiuTJ0RU=
X-Gm-Gg: ASbGnctx7mYPeMe6YA2DBFz7ABOZw6jhX8VH7lRHLYszvRZcS7nat6nHB34UkGbk+Sx
	bORbKhEOdhL0etoB/PG5p6aelxJ4b7NhCnHx0ZUTbH993FpXtgkbTzHCfxmCCnUx9B8mQhAJAlW
	DTC93ovlhKGPdy7X/KiSWU4NVUWlwHIKkNtCeHC51E0F1JBfNA9PB1s8p87v9ztkyf/gWsL9/jj
	+rWEtuH6BqmNGx+/FPdnB0JUDpEq7NOBw4xiWre4YRx4fq0fRR0qnIrNQR4CftEr4/Bqx4Mt3Gn
	Ex16pZIIctv5HX9sjzLYf5uI9algDCSTgGaIzHNBkzY/8KBijBiSi6LMyJCW2Wsl60Ap0654VhS
	eujdYy7+CxJ38L976ONZl3UP0Wr9WITjZnA==
X-Google-Smtp-Source: AGHT+IGrKLDvcNhMPRRUz5yZ/0B+UqV3cuCDD78GAK5IX9VMQFlpjMOiQBg7/gspXEwR8WFrVNM3Ow==
X-Received: by 2002:a17:907:94ce:b0:ae4:1093:d41d with SMTP id a640c23a62f3a-afe07618e48mr78991366b.0.1755765153518;
        Thu, 21 Aug 2025 01:32:33 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded478bfesm341676166b.60.2025.08.21.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:32:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Lukas Wunner <lukas@wunner.de>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: gpio: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:32:14 +0200
Message-ID: <20250821083213.46642-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=aiOPgCva8kudkEPl+V/XfNEIoC3r9JUXD0el5mRjFUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptmNfZQGc9s1xwN7F1mVlmTvdanxSxY0HauHI
 HP4rAniXDCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZjQAKCRDBN2bmhouD
 13frD/9kUAvsG4k8pJHW7pM/M1lFmN1E9aryLzVWQdCoRNM+oMCJXweuixV9wDUQtiguoG73Da0
 HrY+SLZZ35XqDk/J10NgDL8vSKBSl/QH6wD4qhZpDxcRB+gNfBk+XtwDnwULbdNhsxf6Jo4PXrx
 HJribt3Qh+TFuMQJP85Q8wEVZNRdE1iki2kV6LWQVLDW5Y7akzcYz4gdMKjYfWNdQxlrimLk9Ob
 VFKndIUkSaEHo1izt8KnxGxdoCKhxRMDtSEi2BJ7ixlugZ2z29M3ykbYCCsidPnEs9hJt+J3+QM
 i+V5+WO4l5x2LEpUZ1+Qyq7+XUq7JkBBCTFq04DZ9l/S1QMLyBRo4XXShVB7MmvVrumAhy74KSo
 PB6aI4D7fk+4WexLlIOwKHk0GXVDiXSnmSqBfKX6RQqv9V1TG+FliEIex4cmGMilpT5oBPURibT
 19arh2P8kq4samhnaK6kFAHQ+iVo/MuT8UiFAjtWw97nSfRkrWVeEwl04yGd8YMludhYjju1V3R
 uamX9C1mdkuzSJFM0C4YBAV3a7irZZMDfED+dejWUfzPZQPvzJfLz/ZWaIhC1Z9OWIVrhv1xLL4
 NTO8viJCzgJ7dFii5xPMpRjF4ecUEoz8FVpiDWuebjdIRRf3rHRlE+KiFc9nl7cTXLERfDHgNcg ZfzyrRVol9a3U9g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_013235_207944_6926FA6F 
X-CRM114-Status: UNSURE (   9.50  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpio/maxim,max31910.yaml  | 6 +++---
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
index 82a190a715f9..4d200f9dffd5 100644
--- a/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
+++ b/Documentation/devicetree/bindings/gpio/maxim,max31910.yaml
@@ -95,9 +95,9 @@ examples:
             #gpio-cells = <2>;
 
             maxim,modesel-gpios = <&gpio2 23>;
-            maxim,fault-gpios   = <&gpio2 24 GPIO_ACTIVE_LOW>;
-            maxim,db0-gpios     = <&gpio2 25>;
-            maxim,db1-gpios     = <&gpio2 26>;
+            maxim,fault-gpios = <&gpio2 24 GPIO_ACTIVE_LOW>;
+            maxim,db0-gpios = <&gpio2 25>;
+            maxim,db1-gpios = <&gpio2 26>;
 
             spi-max-frequency = <25000000>;
         };
diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index ec0232e72c71..83e0b2d14c9f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -80,7 +80,7 @@ examples:
     gpio@d4019000 {
       compatible = "spacemit,k1-gpio";
       reg = <0xd4019000 0x800>;
-      clocks =<&ccu 9>, <&ccu 61>;
+      clocks = <&ccu 9>, <&ccu 61>;
       clock-names = "core", "bus";
       gpio-controller;
       #gpio-cells = <3>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
