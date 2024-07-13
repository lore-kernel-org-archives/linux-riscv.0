Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED72C3DA42
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jul 2024 22:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nMGcL59++vvCgu0B9I1oMBWo1BUpruU1Gi6xEd/H8Rk=; b=fe1VW56L4URcAF
	2dQtKuvYXjrhuVCiGZV+E6T4/9cDyw9i2hSti3YeuF8BtGogTngyRZ1Tc5B1Ji7sn0e1DliMeT/zD
	lqR4xVS4EbDkWj8WQ3D9ofr3qGdodE+fnCmJNqci20Trbv/1vFE3sKX+uJ7h14a0bmMrTuel4qaFK
	MmAqAnjsak0chRHmkldV9SAiLO+ANoGY6Ehh3mUsrikiBWIKqIxYpcj8a5hmBE5zTGsV7kIeGaqNO
	g99NVPwoEs7zqVDE1hzjrEN9gARyOHsEAyLIKQ+tZEeRdFKsD5VBEUrQVOov/GAHIMEb1qSYk5B06
	JaR4XzwQNUNnmIHfl0tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlLn-00000003IsP-4AiN;
	Sat, 13 Jul 2024 22:36:20 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSlKv-00000003IRE-0NFk
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jul 2024 22:35:26 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3d9c487b2b5so1899202b6e.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Jul 2024 15:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1720910124; x=1721514924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alTBG+u/YLjKyTy47XAD1gqzMa09sOqVoRaB/kIbg6M=;
        b=p5Tx2VSNpMeJo4nGp3CNHawxOtbTokkYZxLrDchNOAReJpaD+l+IFWMfmrCsBZTbgM
         NkHRVBS6w2zw5XtWou5YxX7XzqpVRoBdBErKxCTq8SyN5mIHGbvX/+UcjVnM6ZtqXb4/
         tAXxJ73smpbCka4F63WcrBxU+u809zDM0Dhd6ugqFV/hd4qasT8uS6bxGe425GtDJ9bR
         9FN7/Y15jJrT3vBUj23m3tzkgDjmAG43LT33xCJYnFKrFa+GxxA/6BZciwoeP4CT73dn
         0uIXhijGQ6DeUo9MlNM4km5B9ecn65aNHKI2grpP06y/WUHlotvhaYFBLoaBfG3DewYg
         oz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720910124; x=1721514924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alTBG+u/YLjKyTy47XAD1gqzMa09sOqVoRaB/kIbg6M=;
        b=cAdC0mBbJtYilUXBRu0FQG5Z2nqSDnSnCXO3In38CXOTo+ElqPU05buCcjy2J6pUax
         j9rA4Ghri6VIJrLsUD0suOsSXFmLTQBorEu16gldEADeiMIfUBl5j33+1Joffwe1KhXp
         Oi1zkJtSJs5hithNu2I37TJ4oFVMmBym5DGdifX/NOOXq06u7IAadKAlJI6tyZIw7lUB
         XV7H4QlpN8Rf9XGNHTCzr2bCV2HcPzUWuXbxoXuBUdQO1Z7206F27RLZvisuKxOnKAD5
         APOMO6eaBElUds8mJNhmAG3lx+/2aTzYLSauMmkltvnU7wEilqhSDgye+w0DJ7x7xURK
         6ZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ir/o7unshgyw9UudVKKm3tmLf47CxqQqNYRk3fG8NVc6yFeRG2+8ltBVO13cEbAdYxmzrFht5q/8m/2Wqt8jP+ARdHR1adlSSwaGqxQe
X-Gm-Message-State: AOJu0YwcvVOTvdLo5ym6UUyHszvlsC5i8qKDJBb8tf25WIadjQ9pA3vM
	ZDIWV7yluk7unSOabusTi6xrVgrh5S+db5iNR78XlLoH24nUstztSde1CTYVeKw=
X-Google-Smtp-Source: AGHT+IEYT0gC2VTZYS2sf8gfKkEAnenEHDXxurHyzMbwt0lUKt7Uw0JJq9+GvaJQa3SRamrYdVWDxQ==
X-Received: by 2002:a54:4887:0:b0:3da:a6ce:f02c with SMTP id 5614622812f47-3daa6cef4c8mr8226788b6e.20.1720910123980;
        Sat, 13 Jul 2024 15:35:23 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:d7fc:57d0:ada6:13b7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc4d9d8sm14640025ad.264.2024.07.13.15.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 15:35:23 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Sat, 13 Jul 2024 15:35:11 -0700
Subject: [PATCH RFC net-next 2/4] dt-bindings: net: add T-HEAD dwmac
 support
MIME-Version: 1.0
Message-Id: <20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
In-Reply-To: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720910119; l=3679;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=Y0E8nHMS0ChuTKJIO/9LY9pitgmvEOTz6OdEh2EGJdM=;
 b=CnXpDka3RYSnvNevDmDeEY3cdh4Cuclhx83gpRYciYZPaW7Lncl7HiKfGGZ+vf+vL/6bKiiAg
 NqzeNosEJGHCjNVVRAFPPUyhZ9vKonMP2wKOgI5NMbo4mgJUTSUKo60
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_153525_174301_5D1D594B 
X-CRM114-Status: GOOD (  12.67  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Add documentation to describe T-HEAD dwmac.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://lore.kernel.org/r/20230827091710.1483-3-jszhang@kernel.org
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: change apb registers from syscon to second reg of gmac node]
Signed-off-by: Drew Fustini <drew@pdp7.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 .../devicetree/bindings/net/thead,dwmac.yaml       | 81 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ad3bf5dafa7..d417f0e2d9c6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -97,6 +97,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-dwmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
new file mode 100644
index 000000000000..5618ede47925
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD DWMAC Ethernet controller
+
+maintainers:
+  - Jisheng Zhang <jszhang@kernel.org>
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-dwmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    minItems: 2
+    maxItems: 2
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
+    minItems: 2
+    maxItems: 2
+    items:
+      - const: dwmac
+      - const: apb
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - phy-mode
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
+        reg = <0xe7070000 0x2000>, <0xec003000 0x1000>;
+        reg-names = "dwmac", "apb";
+        clocks = <&clk 1>, <&clk 2>;
+        clock-names = "stmmaceth", "pclk";
+        interrupts = <66>;
+        interrupt-names = "macirq";
+        phy-mode = "rgmii-id";
+        snps,fixed-burst;
+        snps,axi-config = <&stmmac_axi_setup>;
+        snps,pbl = <32>;
+        phy-handle = <&phy0>;
+
+        mdio {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "snps,dwmac-mdio";
+
+            phy0: ethernet-phy@0 {
+                reg = <0>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e1736969189b..c724c2c4e06c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19319,6 +19319,7 @@ M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,dwmac.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c
 F:	include/dt-bindings/clock/thead,th1520-clk-ap.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
