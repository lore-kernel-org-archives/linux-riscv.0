Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9867EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lk5kG1/J2chSkLaVzE2R9isX8sZfH80KfV7x4QBt7c=; b=lZZlhAuw1AefNw
	AOznYWGyqJRdR8Tmy24oSfESB1g6jAF7FzNzHKDJ2SLQ8iwrPjrZfsFec1+cNYjWaZRc4Uf8ilQxQ
	95JiWzGXzX23gNgxjvI99X71uWjoYW53q1Qfi4KO2SQdZgjRRhNZwbc2Vbmor2RBaYhxmLkfkRA/T
	8x7Z5q7UEMa0jettHUk6N4UIamUTGPZJgt4g7Kyt7+munhUP3hmFmynAgkRNg330V6MKKEWQjTeU/
	hjyFbGgVIKYUBiTJpmXIa0hpjyesSDkXsBFJN0s3f8EOoNgnQhVMpJs+WhYk3LecTn2VrfrYg/6OZ
	ts7nMrraWQWUCTv2afhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmRX-000GI5-0Q;
	Thu, 29 Jun 2023 07:51:55 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEmRS-000Fya-03;
	Thu, 29 Jun 2023 07:51:52 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 244F3807D;
	Thu, 29 Jun 2023 15:51:19 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 29 Jun
 2023 15:51:19 +0800
Received: from ubuntu.localdomain (183.27.97.206) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 29 Jun
 2023 15:51:18 +0800
From: Minda Chen <minda.chen@starfivetech.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Roger Quadros <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-riscv@lists.infradead.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Minda Chen <minda.chen@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH v8 2/5] dt-bindings: phy: Add StarFive JH7110 PCIe PHY
Date: Thu, 29 Jun 2023 15:51:12 +0800
Message-ID: <20230629075115.11934-3-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230629075115.11934-1-minda.chen@starfivetech.com>
References: <20230629075115.11934-1-minda.chen@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_005150_396668_1681442F 
X-CRM114-Status: GOOD (  12.75  )
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

Add StarFive JH7110 SoC PCIe 2.0 PHY dt-binding.
PCIe PHY0 (phy@10210000) can be used as USB 3.0 PHY.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---
 .../phy/starfive,jh7110-pcie-phy.yaml         | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
new file mode 100644
index 000000000000..2e83a6164cd1
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/starfive,jh7110-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 PCIe 2.0 PHY
+
+maintainers:
+  - Minda Chen <minda.chen@starfivetech.com>
+
+properties:
+  compatible:
+    const: starfive,jh7110-pcie-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  starfive,sys-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller sys_syscon node.
+          - description: PHY connect offset of SYS_SYSCONSAIF__SYSCFG register for USB PHY.
+    description:
+      The phandle to System Register Controller syscon node and the PHY connect offset
+      of SYS_SYSCONSAIF__SYSCFG register. Connect PHY to USB3 controller.
+
+  starfive,stg-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller stg_syscon node.
+          - description: PHY mode offset of STG_SYSCONSAIF__SYSCFG register.
+          - description: PHY enable for USB offset of STG_SYSCONSAIF__SYSCFG register.
+    description:
+      The phandle to System Register Controller syscon node and the offset
+      of STG_SYSCONSAIF__SYSCFG register for PCIe PHY. Total 2 regsisters offset.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@10210000 {
+        compatible = "starfive,jh7110-pcie-phy";
+        reg = <0x10210000 0x10000>;
+        #phy-cells = <0>;
+        starfive,sys-syscon = <&sys_syscon 0x18>;
+        starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
