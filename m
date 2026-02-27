Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49E8FD5307
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wx5EPPoJ8YA3+O5BKK96DqBZx7ZV8ZfOgdCUN8+VO8=; b=k/xloQ3kEsYn99
	f5B1Y/nanp48LFiJlCdOc6ItMqD0kzOd+7q9MTzzQNRmHoOokRxpPvz3Z2HoWPFpqVnjQhgVM6yMz
	lmhuYZGFG1k1owz0a7768zRgVyRGM0TUKndRdfatxl5/zVdblZAewege1HHzj3eutQUN3z85FAm7a
	btm1aeL5MtVRVcFUn++XPmr2O/Wj2T5I0+/HM2N5NqwtYNFZm2D9VQCqz8WeVEkO46lndZoJmVJKK
	23tdKIOLNmPG3yjsZoHikqww4rbpMqlUjgG6QxHy2K5ZsF6cgYLH5yC8qBmoiMdZz6vatZBKQsKHT
	IDXdD8hCJlJJa+yGz1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjR-00000007vRm-2x6w;
	Fri, 27 Feb 2026 07:57:53 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsjO-00000007vPB-163K
	for linux-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 07:57:51 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-82747396358so653812b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 23:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772179069; x=1772783869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=dbgVEhin6FyGxRxXLDMdelRhjeDTAi+sdJi5hAwf9jBhrNJYczrqV/f63RAbLAkMPD
         7K7zu0AVXscnun56xByfKOc3JpgzYY00aHa7VXrdUASfy4+vbGnt8Jeyt/L69bbxRgQ1
         dzHag8M1luI8uv33ulJI2xmxdt176/yUIbOt0oG6go5pDnkdB0KQ2bvPfeWvEc7B+AZG
         ktgtGZ2tTU5hBCff8iW7S41B6LmYd1+zCJ7PJVIk608GZh9lNhJimqQzx4Hlmng1GNzU
         iWybi2lTQwuPSeuxOqqzWmSTPqW9abvrabpsSlaQ+2GFgzRgwEwYvBGLZpwpAC475aNu
         cgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179069; x=1772783869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lg9NTb0IKxx8ei5NoCGpVXrMa9Lq0kjbSYaE4R3/gIE=;
        b=PA+0O91UO4lXkTmhhHgK/KR4FStGF3YeB2LD4L036M5lS47RaPj37ImVFulsySwJyQ
         O3bGfFozhpcbk4KnuBnjmg/isK1bqG8/NzDfhFMetKIkgO6jObUwaXuxOJ++qKCkAvu4
         5BThDa8wQjI8AsGv0I9eZ/LR8SESLsJHK41pwNkLFwPzAZuCRWsbK4W8gOOsaE0uqTB2
         GVR2VtYf9NYzWQ9WYvq1e/+lWGQMSODo8TKfdLhmKGJ0hOuFqtPfXL1H4WfXT/TfFia2
         nZQzvQxeuLVyfbHszAuksXcSGr7AELj5buUBcT6zg7d3GNWKKMjqHPaKbIkYl3q3TZZ7
         Hqtg==
X-Forwarded-Encrypted: i=1; AJvYcCXNJ1eJnHJ+Ct+X5PgYFW96UvVBPUzwaHZJ3oaUiD2CsZsN5IxawXxTBfUtm/z0lBtYzrg8k6dkk755BA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwPe8YQ3F2NSh+PuYtv5QP2onL55dzUFFUiy73G+dWOSy2SbAg
	6GyBpG15Jb6fvR5Xf4dgbN08PzxJVFQpuY+DKK3LgwVr4uH/ztTGiCRS
X-Gm-Gg: ATEYQzyea0MF5apmP9Q8vClZgDhu1nhsZv2gtOwBppn1kNQupUyv3jOrF6NccZb+D8k
	tGncErXNU7yIXkmaGEt+EkI+DVQ0m0WX5KzVlJjC/eQm3EB134EqW3CnHcyVzwtnXPE8cHOgdaz
	atHGE8uS50pumgfQkx4pbRTpwZQfdpGOUejYwgjD+Yz5NMUdVtNZvV5Wx/hLR2/Vc9c+QjAYL/G
	zoZh5ZMlMpPpqpWe0bm2y0A32h7x8SbdFdrBVoqBb0hUdOqF5fpo9dfF8H8wPwTbm1oLBPspS1a
	vzY5lp9oYlSdY0kgPhVhpAOtGBSkmHvmPRNdXB/VUiCZsYCVvjUWmHsoDwx1ermfSTGd2UOEfNy
	4iDWV9vrLi8qN5EdHmhK/y7Pg2PdQDXgrwtjGX1uq1DDuI67c0Pkr8vBZacrfXQpx87qumq/QfF
	B8ktUAYytGE+gma1dziDq6Gg==
X-Received: by 2002:a05:6a00:1a19:b0:7b9:ef46:ec61 with SMTP id d2e1a72fcca58-8274d97a3cdmr1844514b3a.26.1772179069377;
        Thu, 26 Feb 2026 23:57:49 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4c5e9sm4315422b3a.2.2026.02.26.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:57:49 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v5 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Fri, 27 Feb 2026 15:57:15 +0800
Message-ID: <20260227075718.2243818-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_235750_309552_F9EA6069 
X-CRM114-Status: GOOD (  14.37  )
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

The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
MAC (version 5.40a) with some extra clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 38bc34dc4f09..98ebb6276bc6 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -109,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -656,6 +657,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..274f446b5e5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/spacemit,k3-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Spacemit K3 DWMAC glue layer
+
+maintainers:
+  - Inochi Amaoto <inochiama@gmail.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: spacemit,k3-dwmac
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: spacemit,k3-dwmac
+      - const: snps,dwmac-5.40a
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: GMAC application clock
+      - description: PTP clock
+      - description: TX clock
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: MAC interrupt
+      - description: MAC wake interrupt
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: stmmaceth
+
+  spacemit,apmu:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to the syscon node which control the glue register
+          - description: offset of the control register
+          - description: offset of the dline register
+    description:
+      A phandle to syscon with offset to control registers for this MAC
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - resets
+  - reset-names
+  - spacemit,apmu
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    ethernet@cac80000 {
+      compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
+      reg = <0xcac80000 0x2000>;
+      clocks = <&syscon_apmu 66>, <&syscon_apmu 68>,
+               <&syscon_apmu 69>;
+      clock-names = "stmmaceth", "ptp_ref", "tx";
+      interrupts = <131 IRQ_TYPE_LEVEL_HIGH>, <276 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "macirq", "eth_wake_irq";
+      phy-mode = "rgmii-id";
+      phy-handle = <&phy0>;
+      resets = <&syscon_apmu 67>;
+      reset-names = "stmmaceth";
+      spacemit,apmu = <&syscon_apmu 0x384 0x38c>;
+    };
+
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
