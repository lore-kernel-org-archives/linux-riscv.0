Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F66C54EAA
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4cGd6NmkdHDEQgTplxP67m2cXiP7vPTgwPWMvOQgZo=; b=h3p9bX3/XzzN7W
	gXaMY4SWkXSaD63mf9dYUj4GgkeY/tJSxxzk0m9teEY7ynWbDcDZesX+bMy6aBQeMu6+ny03RlUrI
	ApkH/XQmIhkObcbxZavcUUb453RXJDmFi5RrFQRL24dUKsHXVuv1lCDckhPrcmVtNsIh8DhshaaFv
	x1D8nNDsMyB8etlkBsMl2RPYaoE4KckkT9rscGId5DH0/3caQwU/BGtFC7scMJn1ZQUvTVlPvb0Ih
	oEt9v5bscJhegsUW5FVyx2YN5Zr3zICG4RrPRECi1+I9usIFrUZ23kynXBxQgBrizwTjNaTbNwDak
	SCl7RYj7Qx1iUuLRH6/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEOz-002hcu-J0; Tue, 24 Jan 2023 08:11:33 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEOv-002hVh-3D
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 08:11:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id o17-20020a05600c511100b003db021ef437so10274560wms.4
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=;
        b=eDb2eUaNmqc6RJ4X2WI2l7rWHFeOluRyE/kcnDtOWp+0DqwtA38WsnV48j3ePYzbFP
         EQYQxNv9ZXhvWuZbMtoLxRjrcC6np4eQaLKmXzt1SB1j2qi6KqWvzw97Qqw8q9Tcj/kJ
         jRkpTATMw5OIV0lre30D8pKGEEkyeXkw4ljIHPMQNEyAhtrIzYwPkv7vOSeHKGF5iD40
         wci0xsCQgObSm9c0bqJUw7B42/Mi/epy4pqCgUifQQemyne16Fh2aeGwJHrQWfBPLLGF
         eXMXqllG6GWAuOS6znc7YpeyMd2iydmUqqH51FyZvDoPgN/LAPAB5nC35L/n6/NSluM4
         ynWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfjek5I1oI6I+fvZ0/B32LKubURkbISmBCkZ0YpdN10=;
        b=hsF45iqvAn21UopQXVVpMCZgrJgiGiIMzfVcV0taR96294E5UyySFKCg2zvXmGjrsX
         9JNNJfX4iY9iX8kSnbvVQY9gVHbRgsgwWYHVM8b0LsQt5fhikVZsI2OuIG9IpDENZ1zj
         J1k/gW4dyI4YLVebRdNmaMPm+oe8UwUc1LzcLjcVkJkCtTp/bNisbUSFQpVdbWkaG7ze
         yTLeAur9Qm110P6tIhtga7MVvoZt/vfwjM//KtPTVM7kMXsGfDJVKM5Bu7k3umqGS6tz
         EGfjhZwswklGgZcwWYsVUN8VZZB0Y7xs8Qn3/BTpU3PRZTvumTAYZBK12ArIbD1RhxU7
         n1NA==
X-Gm-Message-State: AFqh2kqxcbRr1cJQPteCqboVY3q8v7+Tk/MRQ9aDLBXz0QxYGkdR++ee
	WI4+dOiLJCI83PAGxeQ69Q9i5Q==
X-Google-Smtp-Source: AMrXdXsAy5Fj0pQUlmUK2moB+gPQM3akwPZ40HQiL5qb7z319tG/FrGiJd4D178rigOr93uyKBy5+Q==
X-Received: by 2002:a05:600c:4928:b0:3d2:2043:9cb7 with SMTP id f40-20020a05600c492800b003d220439cb7mr26935434wmp.5.1674547888579;
        Tue, 24 Jan 2023 00:11:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o17-20020a05600c511100b003dc0d5b4fa6sm1387338wms.3.2023.01.24.00.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:11:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Green Wan <green.wan@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?=A1er?= <povik+lin@cutebit.org>,
	Peng Fan <peng.fan@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	- <chuanhua.lei@intel.com>,
	Long Cheng <long.cheng@mediatek.com>,
	Rajesh Gumasta <rgumasta@nvidia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Palmer Debbelt <palmer@sifive.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: dma: cleanup examples - indentation, lowercase hex
Date: Tue, 24 Jan 2023 09:11:17 +0100
Message-Id: <20230124081117.31186-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
References: <20230124081117.31186-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_001129_165409_02957A70 
X-CRM114-Status: GOOD (  12.02  )
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

Cleanup examples:
 - use 4-space indentation (for cases when it is neither 4 not 2 space),
 - use lowercase hex,
 - drop unused node's label.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Drop unused label, correct indentation.
---
 .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
 .../bindings/dma/stericsson,dma40.yaml        | 16 ++++-----
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index 2bedab1f74e0..5c81194e2300 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -113,21 +113,21 @@ additionalProperties: false
 
 examples:
   - |
-     #include <dt-bindings/interrupt-controller/arm-gic.h>
-     #include <dt-bindings/interrupt-controller/irq.h>
-     /* example with snps,dw-axi-dmac */
-     dmac: dma-controller@80000 {
-         compatible = "snps,axi-dma-1.01a";
-         reg = <0x80000 0x400>;
-         clocks = <&core_clk>, <&cfgr_clk>;
-         clock-names = "core-clk", "cfgr-clk";
-         interrupt-parent = <&intc>;
-         interrupts = <27>;
-         #dma-cells = <1>;
-         dma-channels = <4>;
-         snps,dma-masters = <2>;
-         snps,data-width = <3>;
-         snps,block-size = <4096 4096 4096 4096>;
-         snps,priority = <0 1 2 3>;
-         snps,axi-max-burst-len = <16>;
-     };
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    /* example with snps,dw-axi-dmac */
+    dma-controller@80000 {
+        compatible = "snps,axi-dma-1.01a";
+        reg = <0x80000 0x400>;
+        clocks = <&core_clk>, <&cfgr_clk>;
+        clock-names = "core-clk", "cfgr-clk";
+        interrupt-parent = <&intc>;
+        interrupts = <27>;
+        #dma-cells = <1>;
+        dma-channels = <4>;
+        snps,dma-masters = <2>;
+        snps,data-width = <3>;
+        snps,block-size = <4096 4096 4096 4096>;
+        snps,priority = <0 1 2 3>;
+        snps,axi-max-burst-len = <16>;
+    };
diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
index 664ee61a00d8..64845347f44d 100644
--- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
+++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
@@ -147,13 +147,13 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mfd/dbx500-prcmu.h>
-    dma-controller@801C0000 {
-      compatible = "stericsson,db8500-dma40", "stericsson,dma40";
-      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
-      reg-names = "base", "lcpa";
-      interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-      #dma-cells = <3>;
-      memcpy-channels = <56 57 58 59 60>;
-      clocks = <&prcmu_clk PRCMU_DMACLK>;
+    dma-controller@801c0000 {
+        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
+        reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
+        reg-names = "base", "lcpa";
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        #dma-cells = <3>;
+        memcpy-channels = <56 57 58 59 60>;
+        clocks = <&prcmu_clk PRCMU_DMACLK>;
     };
 ...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
