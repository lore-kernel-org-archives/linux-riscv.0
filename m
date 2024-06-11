Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69B8C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2024 01:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XE1Yy8IBNJa2bzJlRxMRKpL5QnoxBp8DkQTk46lHlZs=; b=KgBcPDNmrA/AW2
	QG+eIS83G/Lk+vs0YpVP0gFhkKW/zXr40yG2BvSnO64W0mRJGW3lnALPyY6vx0bjsT2oVXA+a4uqv
	GlkrWMRCFq9jEHQCRtNWOdypV1suQluzyq+5Y1H+8ZI9CJjhXx7bJblwK7aUQNNCKV3zliyE3L0JY
	24ikRMvbQ15JEa0Nkw9fmZrhu0tY/yWe977d8dld0KctgMOA96pDgzE0Zu58Pq225REPW9bp8jwXP
	pk+shG8F8i5izD2ApU88p4P/RSe+Od0fl+v6hBJL9MHOnyc3GQ+dVCWIF3A2X0+GqTUf+jruDVf1t
	4Az6tEOlKSWdbeLV7qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGqgk-000000076AM-3UV5;
	Tue, 11 Jun 2024 01:52:42 +0000
Received: from mail-sh0chn02on20718.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::718] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGqgg-0000000769x-3L3p
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jun 2024 01:52:40 +0000
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0861.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.39; Tue, 11 Jun
 2024 01:52:09 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7611.039; Tue, 11 Jun 2024 01:52:08 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v1] riscv: dts: starfive: add PCIe dts configuration for JH7110
Date: Tue, 11 Jun 2024 09:52:00 +0800
Message-Id: <20240611015200.40996-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BJXPR01CA0057.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0861:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2ddf48-8132-4d83-5fbb-08dc89b91a99
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230031|52116005|366007|7416005|1800799015|41320700004|38350700005;
X-Microsoft-Antispam-Message-Info: +3utUktzHM014MfBSU4gdBxZnQ6xCLt3JYVjv2KT3gWQPiKWqaGUDdW7rdc4+zsOeB9RVcHQYwFJT3aNHva0/0VqKOnfvYo/JZ6ttfwLffWRRZ4H7oHLzvyh0rrlhrmxKixRgYEBFRHyW/1Q9A12nYSozWJlckNuDaFFzKn8/IFx7DUpEP8FtgPK29YDr43/e3gQKeKK1YTg4BV5TENy75GqU/L5rcxT03JvdxDQU//xDcFe5soMnCssHwmE40LNXdJhUasYjfX6+hWK5FHCdIbKNp8+dA7iGBJ0VKo2SquYGs0jaffzJcJPvAwwLVfUURCkSfhBCCGLH0aBHRspGH/QUaeKqP66UWwXzcLqevfkmNoLo+f8wMtesUeht9tyJMg0okCP6bS8ZpMcbrJuIqfVMnYpMQRkH2M9EQGZ3QUyy0zb6jmGCvD1WAh1uzJp+YssjVqfE87nJAVl0vMm3VYmD4PsDSKgkC5Zoz8zNRYjwfVIFiu5j/tNO48sG+vxgxu0E/Jz0b1395P3oR5UtlR6Q/zbnW6wnn3IgFpADbNgNdmgY9NE1lmLm2MK77opTrz90EqlG2ojSLax/3Ne3289Izk9ZQfFc02wAe1oNj7CjtPLIrJNN4ommTGML8B/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(52116005)(366007)(7416005)(1800799015)(41320700004)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BKkxR6eqOWpwmUs+z74VoRMvP65jZ1X7nBYvJxZiOZXSeP0Iao2SQvs5y/HE?=
 =?us-ascii?Q?ntClBOhlE9FTc6C9yg84wEelXxbrGZ6tBNmA018TaEEs7djVjHI7GJ1u+vzX?=
 =?us-ascii?Q?hY3/9ikIEN14vwHhH0Gm7OBCQqHnizQfNPMQ3MEtF9FFTMPuEu3ClXlymqRd?=
 =?us-ascii?Q?mrBlG2eYkganO9vlvNkEm7c+Vfh8tCiK+S2K9KzZdNaNjqOJy206DCxVExVG?=
 =?us-ascii?Q?fN1+uPLLHZ5Oyl3CYlghDVmPzhoNUzzP6M/KfIJpxMxwqwtzXUDmt6i7E/WB?=
 =?us-ascii?Q?FdkliHzNkEq4veTLlnQeyr91c+yvlnluelf0TKYlLovFax23Lhr2wWZRhshg?=
 =?us-ascii?Q?ZV8j4cLB4eaEtI7SNJa5E8I7FEyDNSErZrC1qGVslhbTvPQ6xvCXj5eF9A5P?=
 =?us-ascii?Q?2SYbEQgO1LNhWs8JYs5mgo2gWGrjoVoEBEB8ZpZZQBWFnHPb/iS4xm8cz1PG?=
 =?us-ascii?Q?QpAqp5uyHx0/2S5DQManTArfs1t9aAZ7s5CWQVhtaWz3mJptkBwNACvyuieJ?=
 =?us-ascii?Q?DVeQdolog4DK/NO38a/wpRiaNQapuM67u3iXv6edQs/HDqPRyYQc/5GKWscB?=
 =?us-ascii?Q?ZYjBcnz5var9arY2+v980OSdgzIN6gwt36Rsx7uFs9UVepFYH+NfzktTRp90?=
 =?us-ascii?Q?RiDq4YtctiPwGhCOmtgVgDsrK417k0oOXgkafW7G8KhBmRXGmwv1bHiZKITp?=
 =?us-ascii?Q?xbgPfprmV5vtLgvAKi5C0qU32Ho/4pctTw8P+qKemPR4lEQaK6DJgeEPxL3y?=
 =?us-ascii?Q?VEI/zXzq8/5K8sMcSK3nOD55YQD0So3QX6V6FdMYZUeYGi7ZUNaZh8KDki4Q?=
 =?us-ascii?Q?yzRjyx2cZFZ5XTVq5GueJqgYjQjGc8IDwg446xbef8NhqtFd8X4ggL903ThF?=
 =?us-ascii?Q?PEBTmBp7LQOvYB9poEX7qwwAxgaLIR1VigD0GVQ8B4bgPtDje20f+Wib+rpZ?=
 =?us-ascii?Q?XTI9l5EjGy94X0TZyWkOcB7iz3JnQ1BQGkFNazfqzN/02tLP08ygyqNUmCF7?=
 =?us-ascii?Q?1c7iTLv9kVgT2Ov1iRmZlOOLcmzZJZ08mp2HAYENDOKbTApoHfA6kbPcNfSQ?=
 =?us-ascii?Q?m7y35nsZI3FxNoGqErJtM2eGWliH5Ll7//YP7cL1PfQORyhoZ+IX2iltmk/c?=
 =?us-ascii?Q?A/YJIxuRu0oT6TZmItkZAGls9Jij1phqsimK5YZrNbEKK5XHhQcZ+PfbWQU6?=
 =?us-ascii?Q?2vCVVXolroIjA1UyBKa/1qZAH7OWRXVxD6NssvtEwqObE3534L3+KYf8KfUC?=
 =?us-ascii?Q?StYPYue2PQI7dOt3S6+z08nhMpc1gNAsnMxsOY8jPzoGr6wDGWi/e35FHhWR?=
 =?us-ascii?Q?muL6B6rcQNG9dRC7Z/qxx/G4YLoqWkGw8gL3Oj1E7rzeZXJWpChfC9eNDu9T?=
 =?us-ascii?Q?sLHA33DaY9arc8xVQWtaCMe/2MZ/AYiBJq7ucowS6E7Ez9QFlvdX5KYqVGhg?=
 =?us-ascii?Q?ZVHJMb8p3Io+KGO8F4MxcITWn62EAnh0IViSWR/NtQskHdHwVLvVChF5ewE0?=
 =?us-ascii?Q?W7CDRR9H/pEkORUZAbDoYVyk8fSysrMbhKHs9XvtLJFnaerSnRou7jwENJB1?=
 =?us-ascii?Q?ImKpZUAmimZFjJxNlEe4RHLTmezbLQyEXryk/Nc/+RvYkxkiiDSqFcN8bZ3T?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2ddf48-8132-4d83-5fbb-08dc89b91a99
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 01:52:08.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7zRagDnojUb6vxejiHQIX4blRLeLRVC1yjWsYiMK/bi7jSKY5RUvEbbqJS4XDaFQyrWjbsZ03em9wOhHLqHuuk1Av8eoBllV+SDspz5Izc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0861
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_185238_873057_D56095DE 
X-CRM114-Status: UNSURE (   7.12  )
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

Add PCIe dts configuraion for JH7110 SoC platform.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../boot/dts/starfive/jh7110-common.dtsi      | 64 ++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 86 +++++++++++++++++++
 2 files changed, 150 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 8ff6ea64f048..1da7379f4e08 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -294,6 +294,22 @@
 	status = "okay";
 };
 
+&pcie0 {
+	perst-gpios = <&sysgpio 26 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_pins>;
+	status = "okay";
+};
+
+&pcie1 {
+	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_pins>;
+	status = "okay";
+};
+
 &pwmdac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwmdac_pins>;
@@ -476,6 +492,54 @@
 		};
 	};
 
+	pcie0_pins: pcie0-0 {
+		clkreq-pins {
+			pinmux = <GPIOMUX(27, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-down;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		wake-pins {
+			pinmux = <GPIOMUX(32, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	pcie1_pins: pcie1-0 {
+		clkreq-pins {
+			pinmux = <GPIOMUX(29, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-down;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		wake-pins {
+			pinmux = <GPIOMUX(21, GPOUT_LOW,
+				      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
 	pwmdac_pins: pwmdac-0 {
 		pwmdac-pins {
 			pinmux = <GPIOMUX(33, GPOUT_SYS_PWMDAC_LEFT,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 18047195c600..5ac70759e0ab 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1214,5 +1214,91 @@
 			#reset-cells = <1>;
 			power-domains = <&pwrc JH7110_PD_VOUT>;
 		};
+
+		pcie0: pcie@940000000 {
+			compatible = "starfive,jh7110-pcie";
+			reg = <0x9 0x40000000 0x0 0x1000000>,
+			      <0x0 0x2b000000 0x0 0x100000>;
+			reg-names = "cfg", "apb";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			ranges = <0x82000000  0x0 0x30000000  0x0 0x30000000 0x0 0x08000000>,
+				 <0xc3000000  0x9 0x00000000  0x9 0x00000000 0x0 0x40000000>;
+			interrupts = <56>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc0 0x1>,
+					<0x0 0x0 0x0 0x2 &pcie_intc0 0x2>,
+					<0x0 0x0 0x0 0x3 &pcie_intc0 0x3>,
+					<0x0 0x0 0x0 0x4 &pcie_intc0 0x4>;
+			msi-controller;
+			device_type = "pci";
+			starfive,stg-syscon = <&stg_syscon>;
+			bus-range = <0x0 0xff>;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
+				 <&stgcrg JH7110_STGCLK_PCIE0_TL>,
+				 <&stgcrg JH7110_STGCLK_PCIE0_AXI_MST0>,
+				 <&stgcrg JH7110_STGCLK_PCIE0_APB>;
+			clock-names = "noc", "tl", "axi_mst0", "apb";
+			resets = <&stgcrg JH7110_STGRST_PCIE0_AXI_MST0>,
+				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV0>,
+				 <&stgcrg JH7110_STGRST_PCIE0_AXI_SLV>,
+				 <&stgcrg JH7110_STGRST_PCIE0_BRG>,
+				 <&stgcrg JH7110_STGRST_PCIE0_CORE>,
+				 <&stgcrg JH7110_STGRST_PCIE0_APB>;
+			reset-names = "mst0", "slv0", "slv", "brg",
+				      "core", "apb";
+			status = "disabled";
+
+			pcie_intc0: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		pcie1: pcie@9c0000000 {
+			compatible = "starfive,jh7110-pcie";
+			reg = <0x9 0xc0000000 0x0 0x1000000>,
+			      <0x0 0x2c000000 0x0 0x100000>;
+			reg-names = "cfg", "apb";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			ranges = <0x82000000  0x0 0x38000000  0x0 0x38000000 0x0 0x08000000>,
+				 <0xc3000000  0x9 0x80000000  0x9 0x80000000 0x0 0x40000000>;
+			interrupts = <57>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc1 0x1>,
+					<0x0 0x0 0x0 0x2 &pcie_intc1 0x2>,
+					<0x0 0x0 0x0 0x3 &pcie_intc1 0x3>,
+					<0x0 0x0 0x0 0x4 &pcie_intc1 0x4>;
+			msi-controller;
+			device_type = "pci";
+			starfive,stg-syscon = <&stg_syscon>;
+			bus-range = <0x0 0xff>;
+			clocks = <&syscrg JH7110_SYSCLK_NOC_BUS_STG_AXI>,
+				 <&stgcrg JH7110_STGCLK_PCIE1_TL>,
+				 <&stgcrg JH7110_STGCLK_PCIE1_AXI_MST0>,
+				 <&stgcrg JH7110_STGCLK_PCIE1_APB>;
+			clock-names = "noc", "tl", "axi_mst0", "apb";
+			resets = <&stgcrg JH7110_STGRST_PCIE1_AXI_MST0>,
+				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV0>,
+				 <&stgcrg JH7110_STGRST_PCIE1_AXI_SLV>,
+				 <&stgcrg JH7110_STGRST_PCIE1_BRG>,
+				 <&stgcrg JH7110_STGRST_PCIE1_CORE>,
+				 <&stgcrg JH7110_STGRST_PCIE1_APB>;
+			reset-names = "mst0", "slv0", "slv", "brg",
+				      "core", "apb";
+			status = "disabled";
+
+			pcie_intc1: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
 	};
 };
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
