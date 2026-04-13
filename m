Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570ABEBFD0F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjB5AICRuVEym7dvbg03DMrrLMdb9flNDHfQeJlKA04=; b=2DezRVuzcqq4Ct
	cAfxLfktbebiM03w4/wj721AkWa63kfv52s1fIIofPcs8n/EbXKI5gk4qROWZxlsuoWBm2qQnVyOL
	gm7ZWHvOpVWEVnIRtKG7M+IXL+DvHPuHWs7HRCHmk9kUFPgvddpPxvIXNVJDQ3HPl/dZPOUbzO8gF
	TKNwfXZ2vimx+XaPAdFj8WzPfPhJZMZd0WUUE6RjeGOyOEmlaBSL12RE8mXbvh3hd28TcBIGqfgao
	OpO7C1t6uJrdcbfKiJvEfRBjE7iNDlGs8xgTTPWSRgrRRU2CxP866TNXwcvOSbvKfdZT4LtbB5ejz
	FpO8LC9fVanv2zoB1Qlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFh-0000000FD6H-1bKg;
	Mon, 13 Apr 2026 08:02:37 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFf-0000000FD5F-199H
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:36 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so4357112e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067353; x=1776672153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=ivAa/t57LcEOl5zmnah8v0Ij8EQCu7gxuc1pqTIY/zEtQ15gbHKasvsYj/8sMO97YT
         xo43GVwFrVJ5t4POgxUbbIZ6th1FnbEtMCtvFu9GzrC8NsGEoK4LyHSi0/Gbf5aGdEuY
         z53yKoso+/ejJsGLHZZU8HsJhYV/A4WErmztn0Mh1b5+sslR03ZK9QnHKfqFX0KWRiai
         pJaFsnI0tb3r8ZiBafr+wdnZY0U4fqqknOww9rddQvhkgd7EMCIleYCGe3iaAK4h5n4f
         xLOyw5JMNEtV4JOYoBDYa6cN4tRUeid+iqMKvDWfzTnPEpwK6und8frv1LGoHo1vuGc/
         W+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067353; x=1776672153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=luHrHS8xuRmiKOe/fYmQbUMhMu1rL/RwOqTb1rEgANA=;
        b=l3L5pftDVzP0Y6bx/3I0lu/s+WQpGKcVan2kevNW7+zUHFw7ksfxjoI8Yc+CY1xpjC
         1hhnhLwMofxTPzRWes6kb8nuMcWS0pdIPUXz3rRfKMRedVzZ8N9+nZ1kGf4QYpjbwyjI
         9tCYlBBnwZaqu4ayss5SaR+izdsjt9YbV611Iajq+d/tQ7XgCOYaKTolMGcGt79mSA7r
         p/YBlMnClYHVZ4h+zZnKjjS4aX+LWu4cwbSzcljFF6KRpi2fQWDk4bYTzPGcJosSxLFb
         gXzuhLxbTnR1qSTT62eh8yt0qA5sqmEEm6HAFZkaqrnLenZLY3OWFxCy3oLEJWDacfgN
         RKQw==
X-Forwarded-Encrypted: i=1; AFNElJ9SgtsORCs+26WYNKD3YxHqbXzQVIRrYlt3XlP7faf6IiWhGujbSmUzEi+8o6rzvKq0lL2viMkO8McrgA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj7eYGmNQLmY30xD2/v3RiFohEoWy3IA27OLlxYn6++U1f7UJe
	i7by5JNunTK6ydkhB0ez3d918bXb5Qlbf624npqsEgsi/sxfDmNJjzx2
X-Gm-Gg: AeBDietyXgMYhjGNuRLXjitcimzu/ufN9xZgieyBRzpStUjFsTKRn+5E3GFa0Yi95MF
	56AdHOeWs6D/E1dPhr3BFNmh3dIR7mXPPlZabRnbsVQS3iCiUU0mQQPNRcfO7UJp7KUKLXGOSnU
	eavdWyMok/4bUfM5mnM33YauVtcT6QNeAg5y/X/ImybEWfj6S1pO1FjFFaJALKwYw5KS4m9Grfq
	GuNCr0KA3qIe17C+jSu1kHPZUhrdSFEFoudd7HQJ+1wrTEp0dsZpVvFg24dWpw/QEiRC12DilWL
	/YF/yJay7DelMvz8pZOnSNlwRLNQsKYz1rn+SX75BC+mCstiUJXh1PprOk3i9FFiSFPE5yKG36e
	OYAf+4hxcmLHgmHB8cTmMuegGcoYdfGI7PztQvyy/Bby0fU8SogX6PHZ1EWp6oSiQxdnpLKn7xf
	Nagr8i+ZBty565iSeftQAoaxSqdeemnBLRAtYZHpY35eTBbKnoX6Sxh7onN2MBeUkS
X-Received: by 2002:a05:6512:1395:b0:5a3:7528:528c with SMTP id 2adb3069b0e04-5a3efb5620amr4070325e87.40.1776067352455;
        Mon, 13 Apr 2026 01:02:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:10 +0200
Subject: [PATCH v8 1/9] dt-bindings: mmc: spacemit,sdhci: add pinctrl
 support for voltage switching
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-1-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010235_345632_3700FB1E 
X-CRM114-Status: UNSURE (   8.91  )
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
