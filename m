Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00464C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nZL+w7BxiabzV2ja1CJYbBOA+f/CyOHfH69y+l8UJk=; b=RmdzIcVerFUKfn
	NCZUOIlm+cQw7dPSSA3cY24P0sPXzlk5gxkW/qI/wjSS6EW8NqAM2XK/2vXLSapOXWC+1K3NEKZo+
	aPheWsacGvMpUWLARZJ7LiouYHwTAzxHWoC92hbPwazn6rxe09Xma3TUsWqUXsN5BePHzKtgn+e3C
	e3P36IbYMfT/Hc2ljW+zsDAMVB2lB1JI0yZmbFnemNrEaWX/dRfc9QSXtrmRH/bt5oB0Xyj9EC2eM
	uAJHGIrXX/G+fddxuM/5okIoZX2RWkKdqZsxN1hZfm6NG0YjpuHVR4vTxXVHdfVWejeGgZDRpr9v+
	FkHpsCaUhDhxcXYpsEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO0U-00D0pT-0Y;
	Wed, 15 Mar 2023 10:05:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO0Q-00D0iK-27;
	Wed, 15 Mar 2023 10:05:16 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4F49524E1EC;
	Wed, 15 Mar 2023 18:04:26 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 18:04:26 +0800
Received: from ubuntu.localdomain (113.72.145.194) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 18:04:25 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Date: Wed, 15 Mar 2023 03:04:19 -0700
Message-ID: <20230315100421.133428-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
References: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_030515_000501_2B577AFC 
X-CRM114-Status: GOOD (  13.19  )
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

StarFive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
a M31 IP. Add a binding for it.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
new file mode 100644
index 000000000000..b72ac44bc29d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-dphy-rx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive SoC MIPI D-PHY Rx Controller
+
+maintainers:
+  - Jack Zhu <jack.zhu@starfivetech.com>
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description:
+  The StarFive SoC uses the MIPI CSI D-PHY based on M31 IP to transfer
+  CSI camera data.
+
+properties:
+  compatible:
+    const: starfive,jh7110-dphy-rx
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: config clock
+      - description: reference clock
+      - description: escape mode transmit clock
+
+  clock-names:
+    items:
+      - const: cfg
+      - const: ref
+      - const: tx
+
+  resets:
+    items:
+      - description: DPHY_HW reset
+      - description: DPHY_B09_ALWAYS_ON reset
+
+  starfive,aon-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of AON SYSCON
+          - description: register offset
+    description: The power of dphy rx is configured by AON SYSCON
+      in this property.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - starfive,aon-syscon
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@19820000 {
+      compatible = "starfive,jh7110-dphy-rx";
+      reg = <0x19820000 0x10000>;
+      clocks = <&ispcrg 3>,
+               <&ispcrg 4>,
+               <&ispcrg 5>;
+      clock-names = "cfg", "ref", "tx";
+      resets = <&ispcrg 2>,
+               <&ispcrg 3>;
+      starfive,aon-syscon = <&aon_syscon 0x00>;
+      #phy-cells = <0>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
