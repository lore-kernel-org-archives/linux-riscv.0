Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABC7CD4F26
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQetn3lQ2p5k0X2vjdBytKFRaLUv5KD9RJYVa4dtHgU=; b=oBkmB95EWhuyYD
	bxHRnLXCm8nlLv/TfPWYfaCgdQhLidbbNqikhKxkNwb21GW02Z5ek/CRxw5un10BLTg3nZWDamh5P
	pwAQihCsScYT1/KFzaZyuvyLrjjH3b4jl3injKFb2n9uQUzYZIhSG7RLCxp9Lx4UnmJLn1X5N2PmL
	l9qz385u4DW0UEAEwWiNgr2S7FSl6MYeblFYNkwu9D6vCKImD+Cr7ZfgsocHShy90Cf7/M2iYcrK8
	DB1KQCHwecsYk81Ziw+tKd36Aprl0iWUiwBaFbkD6g5gNWyHxTBbk9ax6eOWddVt59eQ23yBYHktY
	g3kmCqCRmM1rsP7iQ+wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMibI-0000000G6JO-20RU;
	Tue, 12 May 2026 08:36:24 +0000
Received: from mail-bjschn02on20702.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::702] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMibG-0000000G6En-1IOh
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 08:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fcOsMlZG52SWtz+kWZv67/SB+UKOLp2il+wURxKlumZnkfymHGAhS1iUsoPty4Y/uIHhm6peUEHXYZSH6HNRq0+BllWEhEWPT5UM8L79rmL0caJ/wRZyB9PQOY6Jt6YCJT0Zw64fEwTLW+K21OXZO4gDAzOfc0cTmq3kRyY0Qa7V4b87kS8t71DwigdTCGcLryoEEJyaCq2SG8D5xHoZRyTv5UR4WlyxfeaOuVRnWJXDYgTd1PbENGWkqazthCp1GJgn/IpwKgA9UlEdZjGWZzk3fh+TrR9w+OSeZ9T9vvDNxxBkGqe2hb02sMuUkDbvvrSz3hkjYRPOeGec3pkGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7O8MW4NylAVD7t9laK8ehPhZnphXjR8PaXtwx0b478=;
 b=Ls9drRPPNEAZGJlWoWxr5/GgbDzgaVyP8kGN0TepCBdVyTqLiurMO3puPgAAKTj7mWHOgajZ9WzEvMNttDJ3ry2QuY+/zZjqmKMy2gwzjDXFzBDHH3AuPe8Rw9dtrf9Lk0MfMXddndrC5DXVmtuf/SGqS7SbC4Lq1YU8otW7Wr0ryIgXKHks/895Pn4OfUo1YoJo2+KwP/ZhHsL3hltMQfPrLZgDI5pxaCMxKF4uNQJbdCqOVD4lTbjhuEjFCQx8WSU43U8iooEeMb5EmZ+vuHzPvRq1zaN5mIOiIA8ybtP18OyR33fUUErkqOp23X0IPwmuWSE/ww+iJjFJUcJZ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1284.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:33 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 01/12] dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
Date: Tue, 12 May 2026 01:35:10 -0700
Message-Id: <20260512083521.3448-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b49a45a-e85c-419a-7f0d-08deb0016ec4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|22082099003|18002099003|38350700014|921020|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 9Gx3KoLqdB/o6oRE8+VhguF1ihVwY6o9HwxXIIn/futlZFeo4H9XJQM1DlDuMdEZ2yZSFy8xrExqSR02rsaAXloq62wYfmEZDFvclhiyRsDEQZxWRfbzYL5rOa59ld0rSMVuKybnd3VMdjL/zW9AvoaI9ffyRfPsYCzGaULfn04FLWu4mV45giDtMyg7heDLmqf3VMVUTv+7tMcZXUK1Nr3wUkeNF+EG+9e9BwupWQ8/KZ3cum+g9MgUcP/uBbs5VZYYLl5DT1eIvgfJi4T67LCVY39fYBxHxPn8RldW36G1k9Ly6427FWZfZTC4WFmttJeyGsZ/kl4lLql0ubwGNbyW++FRdX1THGo6QfjfsTS0TY9RuOVeJDsDkXQBRLBhHKnr+PO4lsJygDaGSwyPng7c/aA1AFrCVg+KnVscs8V6mW/AaMT1GatDTWljn7TiIxeo9hqmtGe6sMirzPwCsxqNwfXGZD8EZUzNxbwrv4lrBY3n16pjqzZS6YnLRd8hu5Y84XGTZ6w6mMtC1NGEd8wOvOo3jv05ciVRsTeIIWa9y1toaqtSV+/k2P/+o0KmS1cQduvgViIYt8NqO4ZMBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(921020)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ib+RiphATBQfBy6/4CfZL1MzsF0AnZdhtpe/jZ+Q+MkHeOeR4epDySwlvcmn?=
 =?us-ascii?Q?wLEK7tN1Aj6l/Ir1x0SB2asmJbF5gPEHNbsfpvK4OxZfkfTwjA47yFUU4LTS?=
 =?us-ascii?Q?/E8mB5XD0HIE/TLlP1O6eCkfN08LjNc7xzfePh2p7CS2f7BcRVzGeyg7/e1i?=
 =?us-ascii?Q?EicT6ZB6zp9T9G8Hubll9WfCO3OR44Jzl1RaNgINebTCJwpEozxqtSx3zZE8?=
 =?us-ascii?Q?Uu7ycSwtQoEERsNonbEwy7BiKTT9IACH3LBhhUikcTqukXLCMe4hMCkjL+wp?=
 =?us-ascii?Q?J5e26W5SgVgK4t1+yxOnO4BEhsE2yvq/B8nLpFQITJ2qmJbczOozSG+WV1bc?=
 =?us-ascii?Q?lV5U+sp00o/xmU6OMPJ+Hffg2UXgcwleeyxpkhBwkU9jYE9CEoR85qHL9OMi?=
 =?us-ascii?Q?4Y+h9nCGQdcYGSODQSqDp8h6gZDrRaKd3ZQITQG+nxamuR6jZVZxbgFAPKLJ?=
 =?us-ascii?Q?w07sPO0g+dI5mPEEyFx2wmbL3Uxzn8Mrxyg1yRN5Kqm4UZXCgpTFXPdhE5tK?=
 =?us-ascii?Q?RUIP35CbjsY92DlDi9NgrJZIXMJMVJFFT8PHTUOpdCQl06LaA4v/GHx4DfRg?=
 =?us-ascii?Q?BH7bg460NjlU9Xj+w5tWNYgU6GUR/sbm3lZmPNH428fcykhDS6TozXst+wP1?=
 =?us-ascii?Q?Po70WSFb4mEKVE9gqSpR+B4nHTnmCfSgQZ45kcWnVE1OSGZ87ZKOxpx8MUKb?=
 =?us-ascii?Q?1GlnTLKr3xEf5M3eLqdK6JbvGTPBPSvACDBCgX4cS9yd4UT4qCG9C2bby00+?=
 =?us-ascii?Q?YkH01Kmj12R0abWATZsLfJSN6iYWVciHGo9KH/aw78oh2AxemkDLbJVWGNwF?=
 =?us-ascii?Q?JyGShTW6vUghQ/krMNGxqCm+Ej2IVlYDn3fYriPkrnofea4XoivU8v5sLc/K?=
 =?us-ascii?Q?j1WuD0j6mvGjlpK4KFxht0k1KN7dqkSjyXJzmsC+6mBo01j3q29qyJ63Qi+4?=
 =?us-ascii?Q?AeYTTCgplT547tq5t9vlh8QnHeWvha7l/0EjltvtOXLfpNdhxh0qc0OBuFgI?=
 =?us-ascii?Q?tg0sUh//PS9deptVSuNLsQ4ZdBG2W2XcZnXnau1nqb8fAnwVRX1tjwoMSamW?=
 =?us-ascii?Q?j0sD0qegQkAS0uuf6zgGIQPTyj/pzTlBzDA+s8Jf57CntL3cQ0AyZ7J0VRkf?=
 =?us-ascii?Q?4fSFmqXv7ehSJmJgrNLIDeguYtXYmY5nLAHypXkLtmad9vgCvr5kA8RwuNJb?=
 =?us-ascii?Q?wXWmKaSqFsRmbFSrTDyomLmI/9oz67EqMLyZEqeeW6J3c9eJ3tKVec4EcHq5?=
 =?us-ascii?Q?HIaLolxRczeOmww8t1zWofAaP2Ke5tm3ThUysfHPKCBQfpF3GEIzwxnyMD1O?=
 =?us-ascii?Q?7QPGN2dqt24dEjVip5csgy37zSKMhRpIkEE/LEJl9zGiUe9L5Tawgtwi6ifJ?=
 =?us-ascii?Q?41YhVgMqUKzsGSKa/kUYGl6mhnRkz1a+thBP4oFts494Y0sRX5TCItP7v2FV?=
 =?us-ascii?Q?iy/le2H4lgYKMOQSRUuejKB5//pLPk6jTNz92lyWgLmhzibTFKufxIt0+5Cd?=
 =?us-ascii?Q?Qs1ZWyA3VX1VnUWnfjk77bG8kCU74lJCTsWsQLT/3FTHtoslzb55KrEZPHcO?=
 =?us-ascii?Q?VasFG4hfNGDiSXd0IRORHkIvxbr97CA7rgpIwqGvibbPqgt+1Z9TTeieOiJw?=
 =?us-ascii?Q?dleBf2DqUGNJBmWExcMIHKsZODh68ufB13DiLPAM2RMOZtMPy1aBpVXVFoKl?=
 =?us-ascii?Q?dJ248sa9fZQ3PX4S7nutlbjYjxzxmw0uO0KzbhnTyDh26XACEypo4UrDf0t3?=
 =?us-ascii?Q?iGPJe4+6egHx1LWYBBTygZ7IoEi3lYidaw1G3AJXiuq8ZxtRqGnq?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b49a45a-e85c-419a-7f0d-08deb0016ec4
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:33.4183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fC43128fEEqvZqlQzngKeX9USfe8liM+x97W6yD9x2unRiFowQipIdDqJ9qd7/okTUIzebvhJy2IfWDosFYsrchPm1W89LYkAUNGuIorg5T1d1mX/mG/8EyGwmNl15ZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_013622_841553_D341480A 
X-CRM114-Status: GOOD (  13.66  )
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

Add documentation to describe StarFive JHB100 SoC System Controller
Registers.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../soc/starfive/starfive,jhb100-syscon.yaml  | 107 ++++++++++++++++++
 MAINTAINERS                                   |   5 +
 2 files changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
new file mode 100644
index 000000000000..0add3d9727ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jhb100-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 SoC system controller
+
+maintainers:
+  - Kevin Xie <kevin.xie@starfivetech.com>
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description:
+  The StarFive JHB100 SoC system controller contains MMIO registers used by
+  other hardware modules (e.g., PLL, eMMC, PCIe). These modules access
+  specific register offsets, bit masks, and shifts within the system
+  controller region for configuration and status.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - starfive,jhb100-b2h-syscon
+          - starfive,jhb100-gpu-syscon
+          - starfive,jhb100-h2b-syscon
+          - starfive,jhb100-host-syscon
+          - starfive,jhb100-husb-syscon
+          - starfive,jhb100-husbcmn-syscon
+          - starfive,jhb100-husbd-syscon
+          - starfive,jhb100-npu-syscon
+          - starfive,jhb100-pcieep-ecsr-syscon
+          - starfive,jhb100-pcierp-ecsr-syscon
+          - starfive,jhb100-pcierp-syscon
+          - starfive,jhb100-per0-syscon
+          - starfive,jhb100-per1-syscon
+          - starfive,jhb100-per2-syscon
+          - starfive,jhb100-per3-syscon
+          - starfive,jhb100-strap-syscon
+          - starfive,jhb100-sys0-syscon
+          - starfive,jhb100-sys1-syscon
+          - starfive,jhb100-sys2-syscon
+          - starfive,jhb100-usb-syscon
+          - starfive,jhb100-vout-syscon
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - starfive,jhb100-per0-syscon
+              - starfive,jhb100-per1-syscon
+              - starfive,jhb100-sys0-syscon
+    then:
+      required:
+        - clocks
+        - '#clock-cells'
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: starfive,jhb100-pcierp-syscon
+    then:
+      required:
+        - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon@13010000 {
+        compatible = "starfive,jhb100-sys0-syscon", "syscon";
+        reg = <0x13010000 0x2000>;
+        clocks = <&osc>;
+        #clock-cells = <1>;
+    };
+
+    syscon@13014000 {
+        compatible = "starfive,jhb100-sys1-syscon", "syscon";
+        reg = <0x13014000 0x4000>;
+    };
+
+    syscon@11719000 {
+        compatible = "starfive,jhb100-pcierp-syscon", "syscon";
+        reg = <0x11719000 0x1000>;
+        #reset-cells = <1>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 47e4b368347f..6f6aac7cea95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25613,6 +25613,11 @@ S:	Maintained
 F:	drivers/reset/starfive/reset-starfive-jhb1*
 F:	include/dt-bindings/reset/starfive,jhb1*.h
 
+STARFIVE JHB100 SYSCON
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
