Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144BAC47258
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 01:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e9tYAIsIYkkF6XEsT6G3zRybMUFw9+K2mSo98pp3CxI=; b=pL5O1gFIYgviKc
	GbtHOqtlb2bg2x17+nhv6Ml4cF09QcRcJUh1hKeeb6DJ7MB/Lv7Sus0HE5B8jWkDi0YqFJhcGwjuT
	WC80xYBPDAw0kZtrl7gPiI6XqaFL+wOaX+330IZrok+gVxGYrXvc9wW1j1sAAIhJtvccnG5ExAGf9
	LV8vA5VuVSmWQEb6DVGoJai+CkWGpQHbgnD4+nbFwGXYvcxA3XiWXTr2c0U90VSw+iMa3scq2FEV1
	JEyz8LaAwQgCZcp4lEYgKki4rflWK9BPPlntQzuhFzw7z7aztVoMsvGiI/Y4ui1/khnOkrSjnpg8/
	nhcWFNRrWYZxEU6hskEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUG2P-0000000Asmn-2kRr;
	Mon, 29 Jan 2024 01:02:13 +0000
Received: from mail-bjschn02on20606.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::606] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUG2G-0000000AsaH-1IRA
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 01:02:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzqJAzmk8vgXsQ502wiyfWoxYckhkM6LYYw7djcG37GlGMTbkS3xJ9ak7tRZKNY8RBae/gyYYE725fbVmyUpeaPB8XJuYtfnMxGTLSwaeF4S4MVyslKSJyqBn9mWCqR+9xtZum2GPRzgXQqlcIKgvLxkp5+zp+py7uOfJcQel/ucBZjPN0oDfjCMHrWLVMyFNtlwQaGp/KKU/ggfdAEgtet0UQiCQdapryKilzpLOOoombG3ngZ2wgdDBoxGBxwk/IrVbD169Sdrg4v1NnE/jfCFfZTJ8rI2f6EOX/6gOxEk0gFiaPqkIZPnrdL0ga2XQtj8ApoGwLl0xbS0AiTirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKh7nmkaSdzB3ghyDF6RJecUyhtYIfwA0UmbLzDOakc=;
 b=gE981KVI8esifrKHs9CkxdMNUDyvWLquLq8U5DCuJIxOhrZnHeHed0VLvmlPL2eZI+gyFmrWd81ZzzfgfYpUj/2J5HTp8m9FSFgg1kb7274d6gB8Rf6PSSX37e2LKxNpAfzbo4+rB2zWGv0bRvg21lUjmO8LBd2Wd+nh1gxovVYgUuRIOaZrUo/Ktof7ttaIFH2wJpZqQa74fIQo1UuW9swhot1J02MXKS1C6NMeAW8JrOKZqfjgbJiEe4J1rZiTN/CnuRmqfLCyh74Y12eb45tYd04taTl/FGWvr5+LE/AvUQRjOm91B9g7An5g/0SE/KJm61jOoWmdqf1e0KTBmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0552.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Mon, 29 Jan
 2024 01:01:55 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::1ea1:19d5:efef:6fc6]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::1ea1:19d5:efef:6fc6%4])
 with mapi id 15.20.7228.029; Mon, 29 Jan 2024 01:01:55 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v14,RESEND 19/22] dt-bindings: PCI: Add StarFive JH7110 PCIe controller
Date: Mon, 29 Jan 2024 09:01:39 +0800
Message-Id: <20240129010142.3732-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240129010142.3732-1-minda.chen@starfivetech.com>
References: <20240129010142.3732-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::15) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0552:EE_
X-MS-Office365-Filtering-Correlation-Id: 865770c0-1e48-4d7c-9ec3-08dc2065e31b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sLhsQLLflWbB8i/ovcbxgvc6m03VH0Y6/HcX34QPoDNO3XEEhxgzOB+k1VQHOiGO7PlxROw9FIaQgFRfCM1YEYXW3FXa0UMVSPvEysKaUBMyYvv7kVTxrk3jSQLzxpNhFpZi0kzNnBCRxi8MvtJITdlFVS9/jV2h4LDXnjm2Qhs+fAWOwBycQrsx0XqMy8SOw442KS9Bo3pvNBgKS4rDB3RI2ip5C6lvEIDGu/S1LgVoZfaMU4blaL1jz9Dnq1inhHV5+MHfFK758ytTgENRSPA2AAchpmgkTuBkK4aUp5WgHx8A7sz+Y5Vn1Gkkzr2kE9tE9kPh6V7k+qTMxM0PZhVQSF+/Wqvl2mNBWWl2eghWkE7wFFDhCPwU6iVNWoMtYfMXUQSN/u7+6CxflEwYualD9Ni1iQNL2mIz7to9V4buamuzLnmdZR79zTNZj+GYtgPe7iptdL69OqiulXlwO2Blkolk43Ci5JoXX9hGMaq/yeWQmIEuutItCBtaHFhz2ErRQzXfgd9TUBU9dHUcg6/pA1jpAL22eSaEXNtoslSPHV9LtAwMmIopPQtAci1j6SM+JJrU+GbcuACf2zweSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39830400003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(107886003)(2616005)(1076003)(41300700001)(26005)(41320700001)(966005)(40180700001)(40160700002)(38350700005)(508600001)(6666004)(83380400001)(54906003)(52116002)(36756003)(38100700002)(2906002)(66476007)(5660300002)(8936002)(86362001)(66946007)(110136005)(44832011)(4326008)(7416002)(8676002)(66556008)(449214003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rm8awwv9YKBRDHEHDxDhLDTdh5SUUmwwSs1CBjDK/J+/DAkJ4bs0hMUM3/Mp?=
 =?us-ascii?Q?aFirIRg3r4TiHafCwwDhq+m5m5/puhr/aXUcGhVUI8Y5kquEDIcqPpA1BRbP?=
 =?us-ascii?Q?J9/S8OxsuswirLz+x/zFnzLl4kBNvivJxJAjoRja3H1TUqG/gnfP3cS1z+wq?=
 =?us-ascii?Q?w5ckX5AU4/9cInOayqSsrJiu3vVjTA88Y1bt73cTIiP9sSBxfiHiCAjAiQ39?=
 =?us-ascii?Q?88tUMIt51hzNR/YNpuH3XW3Il9v40b4i4ODdTlayulgF31Slutua6WvUIpxt?=
 =?us-ascii?Q?zPf4MS6rExHJhNy5EisrhTr7HAJx5/ye9q8Mqgt5bdq10wFYthyTut9bk6cC?=
 =?us-ascii?Q?qqJpoA0Kt6e+sYKfu6qTbSzo7asf1QWmqljpyaDjhOQ0gfmzOaka6U7Ocuw5?=
 =?us-ascii?Q?lvfXTvEwtmMU0IsM0iDo+Yp1X1fNIFNAQcipBIVQ4+a/peRJDTDjdZXtHCaS?=
 =?us-ascii?Q?DdGoBatIBaVxZMJ4isQ49fz/5gZw6NYeNIigJwiWsPYEnQ80yPvvQtq7dXlV?=
 =?us-ascii?Q?+MSdUnrqZvr8+PNYg6fAemssyNQBMZJ5Gb2t5rFLTpeYFKd8GqMSJFgP3k54?=
 =?us-ascii?Q?Zx2W22dnt5+b4Miyj9lngID1mlnB8x5uDumHixg5rU10XecNdsH4PcEaFeKF?=
 =?us-ascii?Q?Ab/7wGOxTdjNVSfD87NIaGS0SnLzYH1Mtv6y/kLgxFFx3Xxi9AWEG+S2ypP9?=
 =?us-ascii?Q?bZiGsc1oSmeSlTQFJNjke5tMMIgKEODjwjWFldhhmIr+PDoEGltWPeHOm0Ps?=
 =?us-ascii?Q?fEeZkOAvj+wJpWwiL34VzMTiWfmq7bVlC4rD4hVBWfHqL+xW3SKYNb8ywUbi?=
 =?us-ascii?Q?npd/4F/pEMCRiS+0cU9hKaFHhOs5xgn3MLxNKq8etGGOwq0gbofnMJ7At87d?=
 =?us-ascii?Q?KCJ2j/P8nxWrEqn8YXtBGDLoWTs5SX/ds+nYjPvbDcrD/1OEPDwh7PAf8AFd?=
 =?us-ascii?Q?n8yWessm62PKF53wM31wqIZ98bwRpEjYELMGGvJ1D8ifSL6IUnqI9oktrfcJ?=
 =?us-ascii?Q?zqwVJwcZKjaUloHspcmqXNXwWOkXAwA+KVtUMjvitWbgpwYvHjXT0YlJMX1k?=
 =?us-ascii?Q?kiLQn1zTXh71ZmQa9Yb37wiqQcJeNpwRPEWyPhTWbVCeBMine2k3tdl4pYrE?=
 =?us-ascii?Q?mxCSwv0Pqp7vZCgvqED3CInOHOJ1ZSeNHBxKLzHK465uH1sIqqqPVQOkIhDc?=
 =?us-ascii?Q?pPFSX4LiOKAQjDpAZq+eQCJIQOHFTmMJDQJaqs+qaw+kF1oCufgsJiXI2p96?=
 =?us-ascii?Q?RBFYR0dsdAktB8qbdmn8aon2yM3uxbrtM5KPd7Hse+BcegsGl0mP/qWHd6IU?=
 =?us-ascii?Q?hbIBraV+dXRmHNRC5WE+oldLvmAz/sNaAgVWy3ih3C67ci25ldBdquh+ShM7?=
 =?us-ascii?Q?FrQ0nhhocPNRMV2UeOvjsKoHHK0lhMe1g2TB5PkutMYlyhQUPdws3VidMbyD?=
 =?us-ascii?Q?AMM6YH4/O7rVk6pG0Zc3HH9jH3kGTXhbiKztBBMN/mps/BPG4vMGIKaijNal?=
 =?us-ascii?Q?isEZyUjM7AWfUg3A6Bwp/YYvUcUb0t7lkHTdD7TlXiMxuAIzCTVncyKSJsoN?=
 =?us-ascii?Q?E/sEHWswkeQLqDalFaT7Dt8zgOtn4sMHLlWB5Y73hakXD+X4DIHb5gvBVgI8?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 865770c0-1e48-4d7c-9ec3-08dc2065e31b
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 01:01:55.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHOsxRetB6Ft5nNgGOGG0p561gphIVNLI9MHygRGeraqCCnjVjtRh0/KUeGeV27i/li8XkTGmAloYo+7zHsRbmOs7PjFhirQGfCGmM/ONAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_170204_428263_A2625E90 
X-CRM114-Status: GOOD (  10.43  )
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

Add StarFive JH7110 SoC PCIe controller dt-bindings. JH7110 using PLDA
XpressRICH PCIe host controller IP.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
new file mode 100644
index 000000000000..67151aaa3948
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/starfive,jh7110-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 PCIe host controller
+
+maintainers:
+  - Kevin Xie <kevin.xie@starfivetech.com>
+
+allOf:
+  - $ref: plda,xpressrich3-axi-common.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-pcie
+
+  clocks:
+    items:
+      - description: NOC bus clock
+      - description: Transport layer clock
+      - description: AXI MST0 clock
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: noc
+      - const: tl
+      - const: axi_mst0
+      - const: apb
+
+  resets:
+    items:
+      - description: AXI MST0 reset
+      - description: AXI SLAVE0 reset
+      - description: AXI SLAVE reset
+      - description: PCIE BRIDGE reset
+      - description: PCIE CORE reset
+      - description: PCIE APB reset
+
+  reset-names:
+    items:
+      - const: mst0
+      - const: slv0
+      - const: slv
+      - const: brg
+      - const: core
+      - const: apb
+
+  starfive,stg-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The phandle to System Register Controller syscon node.
+
+  perst-gpios:
+    description: GPIO controlled connection to PERST# signal
+    maxItems: 1
+
+  phys:
+    description:
+      Specified PHY is attached to PCIe controller.
+    maxItems: 1
+
+required:
+  - clocks
+  - resets
+  - starfive,stg-syscon
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@940000000 {
+            compatible = "starfive,jh7110-pcie";
+            reg = <0x9 0x40000000 0x0 0x10000000>,
+                  <0x0 0x2b000000 0x0 0x1000000>;
+            reg-names = "cfg", "apb";
+            #address-cells = <3>;
+            #size-cells = <2>;
+            #interrupt-cells = <1>;
+            device_type = "pci";
+            ranges = <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0 0x08000000>,
+                     <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0 0x40000000>;
+            starfive,stg-syscon = <&stg_syscon>;
+            bus-range = <0x0 0xff>;
+            interrupt-parent = <&plic>;
+            interrupts = <56>;
+            interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+            interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc0 0x1>,
+                            <0x0 0x0 0x0 0x2 &pcie_intc0 0x2>,
+                            <0x0 0x0 0x0 0x3 &pcie_intc0 0x3>,
+                            <0x0 0x0 0x0 0x4 &pcie_intc0 0x4>;
+            msi-controller;
+            clocks = <&syscrg 86>,
+                     <&stgcrg 10>,
+                     <&stgcrg 8>,
+                     <&stgcrg 9>;
+            clock-names = "noc", "tl", "axi_mst0", "apb";
+            resets = <&stgcrg 11>,
+                     <&stgcrg 12>,
+                     <&stgcrg 13>,
+                     <&stgcrg 14>,
+                     <&stgcrg 15>,
+                     <&stgcrg 16>;
+            perst-gpios = <&gpios 26 GPIO_ACTIVE_LOW>;
+            phys = <&pciephy0>;
+
+            pcie_intc0: interrupt-controller {
+                #address-cells = <0>;
+                #interrupt-cells = <1>;
+                interrupt-controller;
+            };
+        };
+    };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
