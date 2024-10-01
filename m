Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C9CCEB2D1
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 06:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH5OUMQqT6DkDzDZ+EoZmngGX6iVTRg5rdEVinyC0NU=; b=S7603qKcCp5whV
	EHaAZ2/YudWlpq70qiNkBlnTFdgQXCbc7iBkKEqQ9l5mo/k7IhnhDRWh4KCiWNGFrwVuwT+xYXoAc
	d0X2oaF8y4aaRmoORhJyEHC35ibV7/wz8/Z6a37oOhUFGZvwKTt5042rXDAYofdkZCv6x5jYBouNP
	pzINrkJMRsSAZrRoJDSl22Xcl1fLEDoUTy/4qmNL2VPvON2dcSgaf9JYvmLicgIbpXZ0NKvM0rJxd
	PgvtjuimF3z15WIdAYpgcbNfiaJ4lpCMMJYH2uQ+uDg58KncW5zTkjhuPGoxX/89EZyuyUIVP1MUn
	3QU4y0Bf5WL7HSqCFpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWKw-00000001kAh-1PRO;
	Tue, 01 Oct 2024 06:26:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWIU-00000001jey-2t5u
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 06:23:49 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71afb729f24so3904950b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 23:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727763826; x=1728368626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41dV4WalGlMrH9OJptzATrYawUoziHMOxXvyKGnl9z4=;
        b=VdVOdiAQIBi+8N2YtNrAIyRbzIIzUPbJ+JUNXtdniyZGx7biTsGtEbdqkm/VSivtl/
         WYmD/d8Xdt5CfXVP0747zAulni0hGisOmQvyO8+rF1cOam5bbL8fzxl7hzTPrUGou0lb
         wnVoNQK2Ns49cwx9djyAsuLK8t1WMgFu2WfaHOcTfZZrO5GrHSY1AIeoreaiKHBhJRlk
         N6WEeGMOdkNioPUAVUVS4bkfCkJPxbiTRQr11jJxOq0rAPKOYVCEMcoAQsQBcjk81O7d
         Sve1rh2bI6p3LViwxAwLt7QjaaH1e43r7Qp477PL4GAjjkcO1YKX6S5VWnbltdtxF4xu
         WCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727763826; x=1728368626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41dV4WalGlMrH9OJptzATrYawUoziHMOxXvyKGnl9z4=;
        b=EjhsGkPu7uhYhFQ7ro+15PXPvFDIhE4pyb3ZxULLrtpMo4/RAfWOgjvTV+1ZUZYf4p
         ht6uMWXWhvA96lazCYGNPFiRD07enNWrqXaugZCEWsoxnRb5qqYiw1el8zMp+BKnn9Hw
         pIZvHSwdt//3D/vkdQiMmzm0dwdSSsM5leCxMmhCv7ZdJBqxYOa63qYC8QpbGuoZwfJc
         8nlbzAKuA7gzNw1US8pn/s7XTgqCfInXZXTGEfhqC/+W5d6gW6MQCETrJB4VamxP2Cfo
         3d6hOzKk+yAjVwgKTTTFHjfY6h+VDjNiMMY0quny7pGDPP2A82a1wZ7omYJKJglP0soy
         tXXg==
X-Forwarded-Encrypted: i=1; AJvYcCWzlPVxlUlH4y+OPqU1DjQZD/A/3odNbB5xwB1s9OTCgUGyMIawoiu9SiVZ7nTjnebiTRBbYYjkMu/+Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCsDD3m2HehslMe5KccAPO6PP8YyOPuM+lE7vdlpB39pGEwYg7
	DZeio49VFDf05itT64I7GTNxj579V4aAFq0gP2Q13OTUamNwru+lyPqhuvm26kY=
X-Google-Smtp-Source: AGHT+IEAXYeopiAHVxnMZKpthZn5FMOwy5YZbD50HnTwzsWunyEhtWyVMfmLnOJUjoSOItfJDzc8Fw==
X-Received: by 2002:a05:6a21:e96:b0:1d2:bc8f:5e73 with SMTP id adf61e73a8af0-1d4fa7a6fc0mr20967670637.38.1727763825695;
        Mon, 30 Sep 2024 23:23:45 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264ba68dsm7267804b3a.57.2024.09.30.23.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 23:23:45 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 23:23:24 -0700
Subject: [PATCH v3 1/3] dt-bindings: net: Add T-HEAD dwmac support
MIME-Version: 1.0
Message-Id: <20240930-th1520-dwmac-v3-1-ae3e03c225ab@tenstorrent.com>
References: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
In-Reply-To: <20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com>
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
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Drew Fustini <dfustini@tenstorrent.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_232346_782005_91BEF077 
X-CRM114-Status: GOOD (  16.21  )
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

Add documentation to describe the DesginWare-based GMAC controllers in
the T-HEAD TH1520 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
[drew: rename compatible, add apb registers as second reg of gmac node]
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml | 97 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 99 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..474ade185033 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -99,6 +99,7 @@ properties:
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
+        - thead,th1520-gmac
 
   reg:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
new file mode 100644
index 000000000000..fef1810b10c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/thead,th1520-gmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: T-HEAD TH1520 GMAC Ethernet controller
+
+maintainers:
+  - Drew Fustini <dfustini@tenstorrent.com>
+
+description: |
+  The TH1520 GMAC is described in the TH1520 Peripheral Interface User Manual
+  https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
+
+  Features include
+    - Compliant with IEEE802.3 Specification
+    - IEEE 1588-2008 standard for precision networked clock synchronization
+    - Supports 10/100/1000Mbps data transfer rate
+    - Supports RGMII/MII interface
+    - Preamble and start of frame data (SFD) insertion in Transmit path
+    - Preamble and SFD deletion in the Receive path
+    - Automatic CRC and pad generation options for receive frames
+    - MDIO master interface for PHY device configuration and management
+
+  The GMAC Registers consists of two parts
+    - APB registers are used to configure clock frequency/clock enable/clock
+      direction/PHY interface type.
+    - AHB registers are use to configure GMAC core (DesignWare Core part).
+      GMAC core register consists of DMA registers and GMAC registers.
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - thead,th1520-gmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - thead,th1520-gmac
+      - const: snps,dwmac-3.70a
+
+  reg:
+    items:
+      - description: DesignWare GMAC IP core registers
+      - description: GMAC APB registers
+
+  reg-names:
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
+unevaluatedProperties: false
+
+examples:
+  - |
+    gmac0: ethernet@e7070000 {
+        compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
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
index 67634f0ea30e..9e50107efb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19942,6 +19942,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
+F:	Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
 F:	Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 F:	arch/riscv/boot/dts/thead/
 F:	drivers/clk/thead/clk-th1520-ap.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
