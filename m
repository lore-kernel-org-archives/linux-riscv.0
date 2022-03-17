Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209E1C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 11:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfI3oGM5+U4Rt9HD9eH4CPWfS497CLi9Wur6lEbmZLM=; b=JLoo+TqGNXdUZA
	HbvbYwv178mgubluu4wgcXkpvDWmvkompc/N4RmflHvUN8MeMx7SEFbC+rxT80u2PF3RK20MEKil/
	MwuzB/nE1DgO6soUFVMJZw+/QQ0BxDsEukNqGuW9VZpcu2mXCtHNPUz1bnVDGUsYskiTyXRAfnGpe
	hJ/AmKKixSvDdMsExjM1qK1wIrBKPurWTchTOcZBDZ603UTbG+c/QlUbTOLCxUQcvkh9qoog8DJkT
	LJEXQUoOSz6V88Fu1+Js4Vw7mSBH1KTv3JWIDvESZINYmNvDrqhExMDzbhN0nGv364a4a+AmypLG7
	dJA6Tp4J58YF3TBjPTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUon4-00Ftso-3J; Thu, 17 Mar 2022 11:59:38 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUol3-00Fsg8-Kw
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:35 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6D3EE3F619
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518252;
 bh=BPmH+sTMtK9KvdlWBUTtE4tsLSFnUjRMwkwF+kfhktM=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nJ7VQH0veyn8T4Hi3l4Fqjh3qVH/K4BmHG4AwiJQTBC27QPlhkbMYoQrMYIzxslrD
 upQgbC9qGOprYO2u6lcAYZSkD6FNJP4pU0YyFOynUVnauSZ2FO0R85i3lcLAYxTRRJ
 Geoy4xgOh831N8vcnWvCx6mxYKLHGaCRfsxnaP5wZLKsOIb3wpmFYzo8Q87HGmKvIC
 WHM2PicacX7AUW5AeU/sV0UhKyudQ0Ud40kvV0GUToRJSRCcNJGiZRGwv7452xQOrt
 H99pz7Eu0o6kSJ5zP7zNcCpiSpu1qoUca36gRY1UF0MexMbH+4fBjh0kAnFUA/T6W+
 QxRefIiBJ1qYg==
Received: by mail-ej1-f71.google.com with SMTP id
 my14-20020a1709065a4e00b006df7cbf896cso2642608ejc.5
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPmH+sTMtK9KvdlWBUTtE4tsLSFnUjRMwkwF+kfhktM=;
 b=PGxpuV7G7+wqkZcuVy8iJPh5PY0x5i01VAgBEg4HeDz+zWaDYrDpS7f19/AX+y1STB
 G95oVVZBJ5TTtr7EOb4OkGkah1da6jq9963tylljKSE/l8g63/7ygTYsaSNOt4C2i+hn
 9FC16g5Mu9b/OpiLfaBo3bP+YkJS1ejSFhYlwT/2s6MviAFNL919ndRG4oTdA9y4XNBn
 BDELYhb6JYu0youzlV23mITVcg3Bi4uZMEy6NSdGsgB4ELWVNh1OrCrkp7NSSdIPsy/6
 aokAb8VNCEmmpJonOd7TwdCHJj4WtT4OD1CgsMS94GiX1TFlytVdhdyWFCjjYnL1tBtc
 Zqpg==
X-Gm-Message-State: AOAM531yLCS/UZSOfnE9+cwAvPGLALcW6RKi9cbE0zuyGZQabyCmd0ce
 RktNY6mHUzuPpLUaiPLbYNxKBBULw0glIUgYWze76uE1h2HjHAkHefeT0tvDu1j0LN6WhTiBn3D
 lGbRT8qH0qxr1SwK1o/mB/lJPDJuHX7RvH6imoDm/RUcO7A==
X-Received: by 2002:adf:e746:0:b0:1ef:8476:dab3 with SMTP id
 c6-20020adfe746000000b001ef8476dab3mr3772435wrn.449.1647518240643; 
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQHNNPp+cT6LCWfeTjsbKn2oDv2UQ8R2ucYLdbIGsLwf9N7IdLuy6eC+hFFDvk8H5WgkaZvQ==
X-Received: by 2002:adf:e746:0:b0:1ef:8476:dab3 with SMTP id
 c6-20020adfe746000000b001ef8476dab3mr3772388wrn.449.1647518240413; 
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 05/18] dt-bindings: irqchip: fsl: include generic schema
Date: Thu, 17 Mar 2022 12:56:52 +0100
Message-Id: <20220317115705.450427-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045733_857339_EE5065DB 
X-CRM114-Status: GOOD (  11.47  )
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

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/interrupt-controller/fsl,intmux.yaml | 5 ++++-
 .../bindings/interrupt-controller/fsl,irqsteer.yaml          | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
index 1d6e0f64a807..5ead6b7dcb42 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,intmux.yaml
@@ -9,6 +9,9 @@ title: Freescale INTMUX interrupt multiplexer
 maintainers:
   - Joakim Zhang <qiangqing.zhang@nxp.com>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: fsl,imx-intmux
@@ -45,7 +48,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index bcb5e20fa9ca..4b5080f754ea 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -9,6 +9,9 @@ title: Freescale IRQSTEER Interrupt Multiplexer
 maintainers:
   - Lucas Stach <l.stach@pengutronix.de>
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -70,7 +73,7 @@ required:
   - fsl,channel
   - fsl,num-irqs
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
