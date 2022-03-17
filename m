Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXJhbhq+WFovGx7jVyqQZ0mVASHga0lkR7zjejrLqA0=; b=LUG0/+GJA2FkOs
	ijlyemm3hZada/7/sMHlwdSpgljF2TUVyJ+osYR/2GOP5OSA863iz2Nx58It/jYVluJQ3780Nrt+R
	XgtO9bkwoWXn84EexXePagU2TXGY44szgoSfyoJ/q6AU7NIb5bW9A/XWbDXKASGwxMzMaQaSkUvFV
	LY/HtNSeBU7FlIhOknT1kbhnEbbk228nPhLO3F9+E+hXGsBSV35EfITBAH6o/UKapqGYcmCTstqWQ
	djZa1waQj4hQwhg/t4r6Hrp1Py2YNV+n+Y2KXPbvbEj88SZUvRcA0b8AxjPXP7ylrSglq2EQuQ2M0
	XL+39kBml2AKasZ39b0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUosx-00FwbP-Vm; Thu, 17 Mar 2022 12:05:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolL-00Fsq1-Qc
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:54 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 684E43F7DE
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518264;
 bh=HVRdo0a9Zp5ow/1mp1AbDSb5pnZ9OyDrT3JP+Xnx0c8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=kuuxaWt+AzzMpagDActU3HK1BxlhhrmDlIhekoAUnjoB+vudIl/MRrcGndJn07Oz7
 ejMqAr8tt6JAvFiSdsMNx09ac6lzxYQ6R5L5PQxUIfvHB0D6uruYb7Cv6V9BkapU8M
 HWNC3Gl6G456nz96ltemgtjJRFNUvBuraNaqSFYAybwFxVInbikz3VIoiiHpNHWplR
 cVjfiiJUKO9TXqJbgSVNG2YY41pKA/BnsorXiBoESMhhkga77IIxSNUVKIVJrRFcIE
 y9KRb1qq09jk/i1sDDVm+bU2as4+tLHuSuseAHbD5mq+hJwoxUH6spK11IY40EbAXs
 7ovmJMViUbVAA==
Received: by mail-wr1-f71.google.com with SMTP id
 t15-20020a5d534f000000b001f1e5759cebso1482175wrv.7
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HVRdo0a9Zp5ow/1mp1AbDSb5pnZ9OyDrT3JP+Xnx0c8=;
 b=uohgpAADTc4IJt7O+I7TsFlEed7aJcu9Ey86L1DZ3wlfGdKsNLNCOfg7sMoZza4oFI
 O0wTtdOFzDNjFTPQPORznA0WeFVgkParYbbiZPhcyFLY/eF5wQPzpcYiWmFfkKrw1BUh
 I042602VrbB0kZDY1i+dXKbzQAxk8IAYudQtVSSxOSsZwiAzNXxVEbw0q9Hc/rgn+LYh
 vRbim+/wp0PstJ3RbG9dvRszSK2eVgyWNnQtYW/MrddDU96yLFGu7IfZhW5p2fumQf/W
 RmVeX6Pdr3KSGfAEWi6ZOSXNHW0D+ljjgeJcvrUidqNqiNejoi1UI1imnRtca9Qib/iY
 6cog==
X-Gm-Message-State: AOAM532Xcr4/3FwL13iKgwZRXW97jwAartu0TlQWuqKLqzs+hyld3BlL
 UmEaYBkq1mulxdHC2uHz3fn6BQ/bo65llxTqzRU0hXNxNQFw8OxgNWei9VrmolFLVCBvgxqVdzT
 5EYN6/HHXCi6mIqUgPfMBD5Ve4JVzmpFLCXq4qpQU2pGWUw==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr3514941wms.75.1647518253409; 
 Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3/O+rMez/BwQ/7F1CSUo1QHlpo1ME2REeH/FIItXP6CKvP9B/nZFl1eiLRHNeDKPj7C+b9g==
X-Received: by 2002:a05:600c:3ac7:b0:38b:f9c6:27b8 with SMTP id
 d7-20020a05600c3ac700b0038bf9c627b8mr3514901wms.75.1647518253208; 
 Thu, 17 Mar 2022 04:57:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:32 -0700 (PDT)
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
Subject: [PATCH 09/18] dt-bindings: irqchip: loongson: include generic schema
Date: Thu, 17 Mar 2022 12:56:56 +0100
Message-Id: <20220317115705.450427-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045752_036296_F26BB3D7 
X-CRM114-Status: GOOD (  10.60  )
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

Include generic interrupt-controller.yaml and msi-controller.yaml
schema, which enforces node naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/loongson,htvec.yaml        | 5 ++++-
 .../bindings/interrupt-controller/loongson,pch-msi.yaml      | 5 ++++-
 .../bindings/interrupt-controller/loongson,pch-pic.yaml      | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
index 87a74558204f..d58cbc852b09 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
@@ -13,6 +13,9 @@ description:
   This interrupt controller is found in the Loongson-3 family of chips for
   receiving vectorized interrupts from PCH's interrupt controller.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: loongson,htvec-1.0
@@ -37,7 +40,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
index 1f6fd73d4624..9b6d69066e54 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
@@ -14,6 +14,9 @@ description:
   transforming interrupts from PCIe MSI into HyperTransport vectorized
   interrupts.
 
+allOf:
+  - $ref: msi-controller.yaml#
+
 properties:
   compatible:
     const: loongson,pch-msi-1.0
@@ -46,7 +49,7 @@ required:
   - loongson,msi-base-vec
   - loongson,msi-num-vecs
 
-additionalProperties: true #fixme
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
index fdd6a38a31db..0c7bee42946a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -14,6 +14,9 @@ description:
   transforming interrupts from on-chip devices into HyperTransport vectorized
   interrupts.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     const: loongson,pch-pic-1.0
@@ -41,7 +44,7 @@ required:
   - interrupt-controller
   - '#interrupt-cells'
 
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
