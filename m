Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89ABCD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dqSaFwEMW1EprhtV6//o56vn6alr3jxciG+5tTl220=; b=iYAN3UcCj97gnu
	1UTMmmNZgT6qyZKtGMxEluKdmw0L+9zffUK737hlNFF0WzJPucv1hANjoV5vvgyunbZ86k5/3/Y7W
	+q6PN0UPDza8R7DxQAUix1eqtrwyyRWo7ekFGqacdNKB1LbOzmxbdAGewgAVuwpucf1FNeOX+Gyaa
	WG+Xj+U2+NELaRUu08toZUYjP7DDo2FFY/LcLyjTpTbMH/Ld36ofN2VhGrHt0NMDX2x7G3E9PGp36
	b+7JBTVQNRnh7BPfkIHTF+c2GDpjyW5f5pw3oPUTkoo0OIfWSRYF7XMcQ7v9usrzavHZYl+tUDOo7
	kt9C82ZIlB4DH0LLcvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPJ-0000000Co14-0N8c;
	Mon, 11 May 2026 08:54:33 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPG-0000000Co0M-2npP
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:31 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d734223e4so2490814f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489669; x=1779094469; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNCRp7u8GA5aDjDB3Y0lI0oGuBZ5cilcPaEkSfJ5vdc=;
        b=J/JPrqcfOWtbMceZ7mIuaGpanY5deSGqjPo+AP213DB2pz+H9ACt4gYSxXyRDorx8X
         NmG45WPXxuAEXxtJdmVkxK4tsYJrZ7GN++4MJhyfOEAgYs1LzgCBa8nweT0LGpJL22WZ
         sfQutLcS0SA3guLmd7NvUJPvrmz4l1iQ9VBckPBkPp5peepP6rSFvv4XAk58nzlzv7aN
         aRIbuMws6Jymqljr69AF9wV/ZY1dzSFUm0F4o9cwbcmpoCi6skgA8S1VzYdp7eGsFYdI
         Y8FwpjccR2uCMzu/8Ki2alhv4IeePVyTftRu5Uf8mvoChXPQODQJ6eY8fsl5BhuP9tDu
         Lsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489669; x=1779094469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNCRp7u8GA5aDjDB3Y0lI0oGuBZ5cilcPaEkSfJ5vdc=;
        b=cjnJihiaYhQxn8tmNeCBd4nZlEsHHAAd8amC7dDtEjFhe76AH96Kz0oVJqOJVn7URw
         syyRJp+35yxkDAfKSmzzsTL2aK2D4rI79lzaUahD5HIX6lIBdBS+cwx+xFCA9CXX4tH8
         bIWjlnSZoxfII4gDXB3R+bYbgYrGCiqIR1gnfhCo56m6vomC+/rGdJdEUXF7PtQAypHa
         tq2xU4Oi0cBvbXREc1FQUgqAQJQ9rRb2kFhP20Xa3KjTYOeNmmHYYVMyrDWHG+SUQr9c
         Ek3nkbSFHPyi0NX0A8qoMEIIkZpiVu6QvqLj6ep1jU+FSzo9I/axcRf4xXPea39LrStu
         V3kQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DwJ+L4E/ZXD31rPbQtL68t/reUL5Jp+21FMbpvE8WVgoi23dJAibEqmQifusi6/wOOsi/cTvoa2z09g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwM9JR34O/Br/K+ymJajKlDk7+vHX3T9jp9/X8ZyLdl736BIDW8
	8c1p+P8pvE92ToVCovHnyIpXouGaA3Sw2SlvAUXr0fzJm1RQNjfbA85v
X-Gm-Gg: Acq92OFS0s+ThJmxrlQEoBwNoWt3BvShSW1tBv8rZ6SFsJ7S+sLZxSWUrdb4xc9ZARq
	IDS+GYbWyswmPDJKliPZY57u8CdKOR1+cY0x6T3xvkiHzjKg8dtWW9J0603vYJoBGK+DeKYymz/
	ho92JxMPcwMK5adQ4m+jLFxRkeoPy7W5AgIvmsklaigNhwTy6RRV3NJUJCs893FxUsPB2xLEVW8
	ZWNLvk28a9GtnS0Bh+cdVOC/NJApYcjJyxRv5P/q63sNV9FUdRdL+LSSIA97gTZZ4xg1io8dwE+
	ME/TCH8exFYBM4YT9p6f/7ipEDXdaH5sKY5RrWTrKugeiI5MbcMHlekYslToljP+6Xq/aQl6AKR
	AQxrTQelw0SPX0mqIHfGzxy2J31z8VYIIwv7dlbEind6kXg35ww9eBQKAaTamoLNNGncX8usjep
	Hl52Gl+MBOUf6599R0g2y2YzQoDj1XPIe1VPru5l8Eoc5n0fFBwOaiJ3jnZmfsOYTPYg==
X-Received: by 2002:a05:6000:2181:b0:44f:b82f:2d18 with SMTP id ffacd0b85a97d-452e81764a0mr19569331f8f.11.1778489668568;
        Mon, 11 May 2026 01:54:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:28 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:56 +0200
Subject: [PATCH v9 1/8] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-1-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015430_726035_9A368227 
X-CRM114-Status: UNSURE (   8.42  )
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

Document pinctrl properties to support voltage-dependent pin
configuration switching for UHS-I SD card modes.

Add optional pinctrl-names property with two states:
- "default": For 3.3V operation with standard drive strength
- "state_uhs": For 1.8V operation with optimized drive strength

These pinctrl states allow the SDHCI driver to coordinate voltage
switching with pin configuration changes, ensuring proper signal
integrity during UHS-I mode transitions.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 9a055d963a7f..34d202af909f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -44,6 +44,18 @@ properties:
       - const: axi
       - const: sdh
 
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: uhs
+
+  pinctrl-0:
+    description: Default pinctrl state for 3.3V operation
+
+  pinctrl-1:
+    description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
+
 required:
   - compatible
   - reg
@@ -62,4 +74,7 @@ examples:
       interrupt-parent = <&plic>;
       clocks = <&clk_apmu 10>, <&clk_apmu 13>;
       clock-names = "core", "io";
+      pinctrl-names = "default", "uhs";
+      pinctrl-0 = <&sdhci_default_cfg>;
+      pinctrl-1 = <&sdhci_uhs_cfg>;
     };

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
