Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF26CEA854B
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 00:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGm8FC9bvRwQC14XvIExAlhllOHV70lJHTIGRgSPSQQ=; b=LK4nRv77JhPbtr
	bI294MJO30suQ8NTWIiDielMz8PJvm8O6jz8olKiw2X4w+CSBpOMh+klj6NbTgwnmB4gvjrxB3dRt
	l77wXN65eaYAFv77Czc3l+0yCSUCK2guwdQJVe7rJj/jpGHixZ4RzApmkNlxyz9ZuL3Sg5MwwWuXH
	4dQsYtbfvGqSs7W6353OX5gm9DKIHYR7b1AQR5imgIQEkLTuv42t/2mpbfXtpw/Mfo0zibgr/f6ix
	+C+dIyEVgT9uxU7bB0tlYpH33U+PUbquHgiIf+msIa5UZhFlN+o49D6UOu1w4GWjKkU27VXDrsGCh
	sXHxsKlmIUrHDVjDCYag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOiq-00000006Tqf-0Fyf;
	Mon, 09 Mar 2026 00:43:48 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOim-00000006Tp1-3nTo
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 00:43:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8296d553142so2294677b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Mar 2026 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017024; x=1773621824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=aTPqaDZVHQs0FvusCHv4sd/gEvcR0k8kIXVlWoqGtZ4X7tD0oQN1P0k58tma05MoRg
         QnMyIiEoiONv/WLM2W3S3HVOUVocH/SJPpR/mkIfT+Tfkr/T+fljXAnke5AIPRTH1k/r
         V+7Hoku8x2YPp5Q9WVxhEohItJrGpwOx2GCbY8CQneSQNG7FHZyDP7P6CPwiO5H9C5my
         7SkZMiC6mi+v23GrSFZlDJ9bUU5R8a7QvWstUdNVm8HjpZZTJ1SP11wE+R4KuZs+soo6
         Y+El4b0LY/aII+4efLMdWp1E4qTpWjBHVfHvSlLK+LXKbqm3RG5DxL1uO0ETffQakvIp
         prcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017024; x=1773621824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjA77pToB3Hfq307snqYtTPSiBkdeTdC0aw7kzmt+xc=;
        b=lXHi54XDmhIEL4/f3luk+xgQyfBBXtv4cKW6Dypqla7+e6JtmGN9LcJlJObPRnCX4z
         GC/X9WtoLgUmJfsXI3W+fU0j0NqzJQNVm+aNENCqy6BxmV+Avc0jdFV4dLSi+qoYIFC1
         Kqa6tDvlPYF0w9bXnmZkukJedV3aiUHmMSQfXD87n3LarJkhSbIbAVcsUu8p+k8BAk/+
         Cdq8GK8ffK0Fcc5k4Bb5Y0oQ1VdHqs/ZI40rkkHQPe7LK2b/ZwhoIioWZmspC+BCEB5P
         beU5sysx/W/6beTHzGfEwrQRnCcNGFI/qfUubk7xp9gNfb/xpCuZwcloo+2owZp325fZ
         J2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXlqm/2LAi1IoBiw8Srm4ATdm7uB3GtwVblPaC2kjI+WzQ2Kl+k+bwW5Jw2UgGavjwjGgaTjwh87QID/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBVsCpneqI2o5LRNRFMqBontWAMHqvOKEAoxiIYySBS+iXg3Ev
	WsRjmdxuYfVhfc/TZLLVvs7CCwjccihQrF7J2uGGva7wxTyHKWEtT+AZ
X-Gm-Gg: ATEYQzzaQIhV4tocNS9pa4L1MDWc33lsYPAdSTbjBiN4BMID31EipMVORzTKzWOaR50
	U3ym0IarB2whIEnVv2c/ffttT6DcEiAUFi8hd7eRDH8F7nmT9Owpro2q60cMhEfmcz4gN1kEPe7
	QwYKnPk8/qHI7fXRQqYPX4QG/nRSrQqrc3dVIXrgEJYs5s/LLjM+lS3SDecoSWGvgo9EIE4L2Ff
	djTWxsZ55W+3Xjk5HWaHFY+Gaqw0jF9k0uUiQ302b20ssUw8so5JpsCW6I3lQCyByHVnc2R1Zdv
	uhjxNUhRCxga8GA7G3HA86DSpPktmGLLqAjQX03n72kNLs/a73rocWhl3HxBKVhzXxBXWBpScCL
	Yq3cRt4xKbMjpaGeK4BeQBSj2vWdflgEZcF/p3PgE96fylyOwKCztNRlgWwE0z0irXEr9079M9+
	jN9jdwA/omtRFK5Dr9x0XjdPA=
X-Received: by 2002:a05:6a00:1581:b0:829:a131:8318 with SMTP id d2e1a72fcca58-829a2f813f7mr6833727b3a.44.1773017023904;
        Sun, 08 Mar 2026 17:43:43 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4635d62sm8441226b3a.5.2026.03.08.17.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:43 -0700 (PDT)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
Subject: [PATCH net-next v8 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Mon,  9 Mar 2026 08:42:42 +0800
Message-ID: <20260309004305.315018-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309004305.315018-1-inochiama@gmail.com>
References: <20260309004305.315018-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_174344_944588_2A2559EC 
X-CRM114-Status: GOOD (  14.52  )
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++++++++++++
 2 files changed, 104 insertions(+)
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
index 000000000000..678eccf044f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,102 @@
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
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
