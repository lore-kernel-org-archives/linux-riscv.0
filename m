Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34110C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7P6dgHLaHfLkZpyUagSyw71YATBYxv8WF/ULv/BcMoU=; b=3+SyqqE0f80BbM
	djkOoLQVC5TNuuim4PfAft/2b6SnW7jGckAQ+JgZkbzq506rqmVvPDKoRgXv6lsXBDluDAgSL52Le
	DlciqWHhOZFvw3tcVhMQ5QUSvu2hpOjM9zdiRSmkObwmM/8D12Moy2ledZcRlNjzW1yfq6BS7T1ji
	aoC1u1z0+0Ie+IrVzHgDtGK0iscGo8K4RRYV5mJJ+T4vcHElTnOiGufZS3lEz0AU+b/tCHiK+9r6h
	QQG3Ego3F+gYkjQ0WBtUS7c8uj5jyFRsDxj+MIIPWopoFV/UH5g/IDmSfaCLz2YX75b7v4PvvUq5L
	V6OAdMOFee/of5FuMlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYm3D-0085eZ-De; Mon, 28 Mar 2022 09:52:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYm3B-0085dT-G5
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 09:52:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id w8so14329781pll.10
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 02:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vPzKfL7z/ioVzkWZmdGnUOpm+jBpSszjouCZkOgerBU=;
 b=PYeDYo1HZ+7zO+AjGFbIt9N+/gsEwVMegWIS1I/bcFoGw2PEndjfGBaRvllTEbs38N
 bXCJNvmvP6ZAfHeZpXIU4iyuyb9MptbvUFETlcAZE46xCGPDdPvBYAQ9zSkk8R5DDTgb
 5S60isfPn4L159WOuC8jbTlz9F+uOPIOXLZ3E2c7Aq1lVQ0XEKMWPuWa+YcdvPUL2O35
 TY/cFDmCgsRX4OoFTJs3BMODa300OOCIj/TSt3G2gzC+bAXHZ78QMcfs4eEkQ6fJ6XHr
 alMg+XAF/PD2Yo6eM4tpg2eMEB53C0KBsrNeMRUSDUm7xmN8zuQjbskLfdazAxBn3DBG
 S1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPzKfL7z/ioVzkWZmdGnUOpm+jBpSszjouCZkOgerBU=;
 b=OsqXtgBIiaJ3dRRylm13FN61uhJE7gz4670T+HeP8ETpsS63OmMcirDd4QkvY3rCAI
 O6bI7FkgCJ0hfClND1jsmIXdXPF0fRNlYBouY7cLV8sz7z/NJzJxZKbwFXhEPnU2qTco
 zKjcBnB13J/F6b2K6tVt1DDCxcHYLQPTmw9I4JktGO79dDZorlz0/R4Vh+NKRhhIAjqF
 XSQ1Bh5z4bT///TpzVR1JOREAI6jH1a2DGhavxb7oHgoeRCrvcpo5WYMXs1+tmQ6kSHd
 qzeo3rdyFdDfiRqUYc2QFsT8sh4UxW0+rA8iNDPTl1EP7crXhq8t09dOZT60d6ecUOD9
 DmEw==
X-Gm-Message-State: AOAM533jMSuXvgZGwWLED+0WzBhWcvO02PFC0y7IAJ0HNX0eW4GtxsJW
 9800FuSmxSomPk/PXKgaOBgO2w==
X-Google-Smtp-Source: ABdhPJyTbXAWOqRoBuc+FpnhaK605V2eNVJRooRDgQ+I4q3Ph/Hxo0TJOY0YQ0dhaz7sKJr7ECLF+Q==
X-Received: by 2002:a17:902:ea52:b0:153:fd04:c158 with SMTP id
 r18-20020a170902ea5200b00153fd04c158mr25087355plg.83.1648461156722; 
 Mon, 28 Mar 2022 02:52:36 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a633744000000b00381efba48b0sm12255117pgn.44.2022.03.28.02.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 02:52:36 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v8 1/4] dt-bindings: dma-engine: sifive,
 fu540: Add dma-channels property and modify compatible
Date: Mon, 28 Mar 2022 17:52:22 +0800
Message-Id: <7cc9a7b5f7e6c28fc9eb172c441b5aed2159b8a0.1648461096.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
References: <cover.1648461096.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_025237_561800_52D4BE36 
X-CRM114-Status: GOOD (  10.04  )
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

Add dma-channels property, then we can determine how many channels there
by device tree, rather than statically defining it in PDMA driver.
In addition, we also modify the compatible for PDMA versioning scheme.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
index 47c46af25536..3271755787b4 100644
--- a/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
@@ -28,7 +28,15 @@ allOf:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-pdma
+      - enum:
+          - sifive,fu540-c000-pdma
+      - const: sifive,pdma0
+    description:
+      Should be "sifive,<chip>-pdma" and "sifive,pdma<version>".
+      Supported compatible strings are -
+      "sifive,fu540-c000-pdma" for the SiFive PDMA v0 as integrated onto the
+      SiFive FU540 chip resp and "sifive,pdma0" for the SiFive PDMA v0 IP block
+      with no chip integration tweaks.
 
   reg:
     maxItems: 1
@@ -37,6 +45,12 @@ properties:
     minItems: 1
     maxItems: 8
 
+  dma-channels:
+    description: For backwards-compatibility, the default value is 4
+    minimum: 1
+    maximum: 4
+    default: 4
+
   '#dma-cells':
     const: 1
 
@@ -50,8 +64,9 @@ unevaluatedProperties: false
 examples:
   - |
     dma-controller@3000000 {
-      compatible = "sifive,fu540-c000-pdma";
+      compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
       reg = <0x3000000 0x8000>;
+      dma-channels = <4>;
       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>, <30>;
       #dma-cells = <1>;
     };
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
