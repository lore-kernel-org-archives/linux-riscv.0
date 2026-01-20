Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A47D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 06:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKvYgJcEQO2H5Y/vlx4BXWrqdJhSos0PdZQuWgYEuNA=; b=ONrwuEe8O1ayrd
	SWYODuVbiipjaqbPVCamIK1ea8OpNV4+OnIdHMKSuZP3U9bBMY0zFIPDE26TTcNqfm+vGfSpsIAe6
	xgu/E3Ri8scLR1RaysWbQ3B//vB9id/Rs3m6Ho+2Te6ElNo1zfNYdqvQaxHenLoqcdTRJEpmaxbr1
	hWmOdbGNBw+RxSdj2fqz10d9TrvwAyZoEefOQsBrWl6T7ItWQEHwbkqfwGuypb8HEQfuzPrI/Iipa
	Oa1HgSbQiiw97C0j+YAa2BVBPdTTo/QUZIgg5oHFduqwN4rWlXp8my/eyLCRvtH7qBaby9J8YDh3e
	oAXvqmgQFrpN+QPNfj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi56E-00000003GGV-0GAY;
	Tue, 20 Jan 2026 06:20:22 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi56B-00000003GGA-3zHR
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 06:20:21 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5ec87b1f525so2179447137.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890018; x=1769494818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
        b=FkaaPnnAKAai7Z6lbqPz5LuOquGroLgn3gey9L/kWHJdEAh9i6uUm91Q5suZEg1ycJ
         0wMVA1hGDpPUJ0ZzuqiZ2JzydjlkPVzmAhiyV6swVUW8HptKdGyTOt1pGxcekX63ax9a
         iIcpA72ORKazP01U8KiTV4Tvum84/vHcBCiFRhVe/OrxmlSlZXHuDOsLKkUTy2xVkMO+
         LMAhiLzZVVwyVrlsZYFIqUdpVb42a0+8YRfHojOpZQHSldJcvNNn979j43sOr2THjrK5
         hbA4Fdf0eTNVgajzHjrxnp8SFx+yNOQNej8PHSxEll7iGm7lFQuA0+Ujvfll3JiWtXr3
         QapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890018; x=1769494818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/P4vB6ZrTUYfKL01JZTaSnR0v+y3e+rmtwAP48/qa4=;
        b=lEPrT6Fs9vqoQ2qagxTYqehqBWRIhb2o5Iu14o6udHdIUIvkg374CllVhsmWjeFYLV
         IJpX/GaU0AXx+vnUjTNfLq8VCK7/NZnotar4NvlSx2HVTRvZ+Oy8fRTFz+zgj32bx8V6
         Qn/qKrZ7YQD2ewsgJ/w6BcMd4gO/+MVmE6PQIDAaXJIW+6oiQ56sEuAFoZFSqfoa5AN2
         AbQ+jbowfrsvR51KoI7fQeY4r2dGGWBQKh7qGHGAykQZlNq7D/9AEdYsff9GvCaHHgvI
         I2adYOqoeJfi2cneEGn3K1smy6qOz+y7felkec22VZ6rLhdi16CqUad8BhXp9In79guq
         9Fng==
X-Forwarded-Encrypted: i=1; AJvYcCXSd7VGpqcwk4PCEEeH32NyB10A7RBPVAv8lxSpSfVgAsw8xE3qK0XOh67u2IaINpop28bOFM0gxfG/jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTCaiQ8G7OedZeX4D4ho99ekMYoj/mR4LCb+w8DBhsoAyoxhnK
	r6RivMtGXAeUp5/2ul2TeNWCdO8KuOQO9nmstxiES9qHls51kE+gEo8K82VIFDuh
X-Gm-Gg: AZuq6aL47vWX/qQm+cxwQ7Vy2HRB3UpJdWbGSH+fFIa1Y5ne3idoUAcRACYrNNX/JNU
	wb3MsQU8I+sew0U008TmoSrDKz05VFecUZ32DQQgBMli8RjWMwWO6vCmiGnCdAgNnxNRflq4Ect
	NlLmIw8yZ/Ids+9+to3OKlzHlQaUiz2djoV98KWicTiisOG//eVPsnK+kvkUiJa6umsf4Zbfqkx
	o7plJago0PdgC/rDMcX4Rgsqayph4DdFGbn+0y2FfNXY3Eb4Y4ehKwo6BfCNDTbThXjkREqveMA
	kG5cq+ONVADlmDo/BMAU3PMDvZy6sM+EvUqctGCBWXZO0JcX6gSjhLlahoch+AvIsDKnizVDDxY
	qzmvXIKS0TSd3yJWCmNpVm8LarevId3K70OtZ62lfUH6nAqif24bcQ8oNeUZht5XqZ0HevqvtSv
	mr0KpDYlP4bw==
X-Received: by 2002:a05:7300:6d1f:b0:2b0:4e86:8157 with SMTP id 5a478bee46e88-2b6b46eb100mr10720484eec.17.1768883786512;
        Mon, 19 Jan 2026 20:36:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm15459859eec.9.2026.01.19.20.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:26 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 1/3] dt-bindings: net: Add support for Spacemit K3 dwmac
Date: Tue, 20 Jan 2026 12:36:06 +0800
Message-ID: <20260120043609.910302-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_222020_006387_3BDFEA4B 
X-CRM114-Status: GOOD (  14.96  )
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
---
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..3c2c6cb6b10b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -34,6 +34,7 @@ select:
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
+          - snps,dwmac-5.40a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -108,6 +109,7 @@ properties:
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
+        - snps,dwmac-5.40a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - sophgo,sg2042-dwmac
@@ -653,6 +655,7 @@ allOf:
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
+                - snps,dwmac-5.40a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
diff --git a/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
new file mode 100644
index 000000000000..58dd98f79e8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
@@ -0,0 +1,107 @@
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
+    minItems: 3
+    items:
+      - description: GMAC main clock
+      - description: PTP clock
+      - description: TX clock
+      - description: PHY clock
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: stmmaceth
+      - const: ptp_ref
+      - const: tx
+      - const: phy
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
+
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
+    eth0: ethernet@cac80000 {
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
