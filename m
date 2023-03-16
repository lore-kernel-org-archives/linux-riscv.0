Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D64C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBH2aCwyUK1ULYNcEhvJ0ftTwxG55m70CHBHbQZVUfA=; b=4928ntALurYnsx
	BL2uNqR/+CO3FjLOZEvMHrWpfA/Pq8nSXZgcTsDGNGvNPac5UsqoPzn1u4LBGclvoHX5W5WDgNssm
	N3+z+69nILUm6fyuD27cDL9KZ0PJ/AA1QlBmuwIbqXhe5DjT/hCcAsxgKiMZI8Z6/dWEMDXRpBBbY
	q5sxca62o4K9BtX2yr+susEdZz570FwOAyvgLaO6i5owfP6yvpREAkbK8yu0h7iFhpbkf+NDD3JVb
	UsXctfWo5DOiDw6AmmYCPBsfiPqDmo96Ls8fOVzIYN2jr57fjIPm6Rkx6fuikkYINSoQQAcOipF7I
	teAfkoz1vSu2jpES/5GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdvs-00F3CT-1n;
	Thu, 16 Mar 2023 03:05:36 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcdvo-00F3AU-2t
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 03:05:34 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4142324E207;
	Thu, 16 Mar 2023 11:05:19 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:19 +0800
Received: from localhost.localdomain (113.72.145.194) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 11:05:17 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v2 3/6] dt-bindings: soc: starfive: syscon: Add optional patternProperties
Date: Thu, 16 Mar 2023 11:05:11 +0800
Message-ID: <20230316030514.137427-4-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
References: <20230316030514.137427-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_200533_239133_3588549F 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

Add optional compatible and patternProperties.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../soc/starfive/starfive,jh7110-syscon.yaml  | 39 ++++++++++++++++---
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index ae7f1d6916af..b61d8921ef42 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -15,16 +15,31 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - starfive,jh7110-aon-syscon
-          - starfive,jh7110-stg-syscon
-          - starfive,jh7110-sys-syscon
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - starfive,jh7110-aon-syscon
+              - starfive,jh7110-stg-syscon
+              - starfive,jh7110-sys-syscon
+          - const: syscon
+      - items:
+          - enum:
+              - starfive,jh7110-aon-syscon
+              - starfive,jh7110-stg-syscon
+              - starfive,jh7110-sys-syscon
+          - const: syscon
+          - const: simple-mfd
 
   reg:
     maxItems: 1
 
+patternProperties:
+  # Optional children
+  "pll-clock-controller":
+    type: object
+    $ref: /schemas/clock/starfive,jh7110-pll.yaml#
+    description: Clock provider for PLL.
+
 required:
   - compatible
   - reg
@@ -38,4 +53,16 @@ examples:
         reg = <0x10240000 0x1000>;
     };
 
+  - |
+    syscon@13030000 {
+        compatible = "starfive,jh7110-sys-syscon", "syscon", "simple-mfd";
+        reg = <0x13030000 0x1000>;
+
+        pll-clock-controller {
+            compatible = "starfive,jh7110-pll";
+            clocks = <&osc>;
+            #clock-cells = <1>;
+        };
+    };
+
 ...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
