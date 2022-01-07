Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A6EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jan 2022 03:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jJYIGMY4C5fneh93W7G4/ekMddSpwCKcuR5/4xdd8QY=; b=MolxUdFT5kcLv4
	ezUAzSjMkpi1jmnDPXLinsKfHdiuvb0VBfg9siWRs+D47/JZuB2xkv/yC4SlyPutzKL5WLoFGdRpz
	3DeI/a2oLQ69SgXukwU3wh7NkLA6fYZsirvlAX84/ajlKAGFXF++32dJZqU2wGUf2mYDMlvaeeUHw
	edPavFt15/uRi0RmAmyc4HN8xEeCfRBmWZ/UZ66jY5PagmiJrKydqzZD5RJSUhH6YqbCC4yUy6lWN
	0V+HcMJ+EPg91Q5A9hRX1mqaPqCOktexB1yr0n6hVIti3Gd0VQb/HjIXeeOYOKXUcM6z+xoifYTAu
	UyguSBwZowxYpjWvP1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fnM-0028ZR-JN; Fri, 07 Jan 2022 03:20:00 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fn9-0028X3-Rw; Fri, 07 Jan 2022 03:19:49 +0000
Received: by mail-oi1-f174.google.com with SMTP id u21so6492037oie.10;
 Thu, 06 Jan 2022 19:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N/+02Uu7Xsp1Sp9baEddjo+2GjQCq8pPfkwGXAATyL4=;
 b=r6bMnYYY8VCZe0D1c8a/pjj9qhzoJlNsBOI6VRl+y2wpLKXuP00iKPLG30KrLmrW2/
 7zIdLYKGmXDTJqkyOWv+aX9Co1nXl9LSmcFCC9FPzkqFS7OELN4cw6BIZehbS00Z6wC3
 UtrB2GH7ZnabGm25MeZCbHWyruMPnMn7sWi6A6l0Dj38H14ft0WeaveCN7iCHfWHSFA/
 /YrbaF8/I2o5Uauywk5SC6AEu6kulLFdKgKkJKmGoJXroaBGmnSN6CkVm8HowxHonLnF
 Mm1wBEeMZbn6rXybPdGQ6X1f1rZatTFfw0NiRd4E6I8Y+OLZubLgkjnVZhL2xJ4Fcozd
 /ffw==
X-Gm-Message-State: AOAM5334EIALkRUcyJglAz4VBr4lFpIRUF8JHvKWEjBA5sv1uFMKQIZU
 y/juw5O32E02fjZMvpCUuw==
X-Google-Smtp-Source: ABdhPJxFwsoov8BM23F84ePRF4MesulXZT7/QFwJgwS4jJCHX9pjJTcfT92RcdErUYh2DLqb705wyg==
X-Received: by 2002:a05:6808:f11:: with SMTP id
 m17mr4241451oiw.36.1641525585657; 
 Thu, 06 Jan 2022 19:19:45 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id q13sm555020otf.76.2022.01.06.19.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 19:19:45 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lee Jones <lee.jones@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <michal.simek@xilinx.com>, Suman Anna <s-anna@ti.com>,
 - <patches@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] dt-bindings: Drop required 'interrupt-parent'
Date: Thu,  6 Jan 2022 21:19:04 -0600
Message-Id: <20220107031905.2406176-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_191947_959077_DF043895 
X-CRM114-Status: UNSURE (   9.70  )
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

'interrupt-parent' is never required as it can be in a parent node or a
parent node itself can be an interrupt provider. Where exactly it lives is
outside the scope of a binding schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
 .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
 Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
 .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
 .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
 .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
 .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
 7 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
index 9ad470e01953..b085450b527f 100644
--- a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
+++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
@@ -43,7 +43,6 @@ required:
   - gpio-controller
   - interrupt-controller
   - "#interrupt-cells"
-  - interrupt-parent
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index e864d798168d..d433e496ec6e 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -175,15 +175,6 @@ required:
   - ti,mbox-num-fifos
 
 allOf:
-  - if:
-      properties:
-        compatible:
-          enum:
-            - ti,am654-mailbox
-    then:
-      required:
-        - interrupt-parent
-
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
index 499c62c04daa..5dce62a7eff2 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,madera.yaml
@@ -221,7 +221,6 @@ required:
   - '#gpio-cells'
   - interrupt-controller
   - '#interrupt-cells'
-  - interrupt-parent
   - interrupts
   - AVDD-supply
   - DBVDD1-supply
diff --git a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
index 437502c5ca96..3ce9f9a16baf 100644
--- a/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
+++ b/Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml
@@ -46,7 +46,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-parent
   - interrupts
   - interrupt-names
   - lantiq,tx-burst-length
diff --git a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
index 7bc074a42369..5bc1a21ca579 100644
--- a/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
+++ b/Documentation/devicetree/bindings/net/lantiq,xrx200-net.yaml
@@ -38,7 +38,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupt-parent
   - interrupts
   - interrupt-names
   - "#address-cells"
diff --git a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
index 2b9d1d6fc661..72c78f4ec269 100644
--- a/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
@@ -61,7 +61,6 @@ required:
   - num-lanes
   - interrupts
   - interrupt-names
-  - interrupt-parent
   - interrupt-map-mask
   - interrupt-map
   - clock-names
diff --git a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
index a2bbc0eb7220..32f4641085bc 100644
--- a/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
+++ b/Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
@@ -55,7 +55,6 @@ required:
   - reg-names
   - "#interrupt-cells"
   - interrupts
-  - interrupt-parent
   - interrupt-map
   - interrupt-map-mask
   - bus-range
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
