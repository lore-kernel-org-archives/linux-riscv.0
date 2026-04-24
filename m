Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D838AFE5209
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMzoeNFiFCI5I9iQmbes8/ZegwBiDM7oUQsLni1n1dk=; b=zKyjJ7i9BplE2/
	QVpgz+s5TGJqNB0GwJ/lmeXawvkvo0JQe2XFgiOLtusRsHINCgtm3M3E3zRUst7xntq5BspdRelmt
	qVo+47OPgIxFo8IluVBTJKgqXplWfJv9sp60ONMYFBeNERoW6Ms29+xy8IO6v24tFUnjLSEyMkCtf
	kumqNEzgRBqVjuBaHKEyhEGQWhzBIRy3Bwp/uph1cmT0gfdVz9Q+1YMFLYzp4fnhdLXL0WjV6uayc
	39nC+DOtYx0pH/PvWS6d22Y/ljWbkfYqSFRWaHpWC/tAMChtXXioLewMTOW2n+arAtiO2b/HGqVj2
	lAUhLNsKczU6dObPKDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEUC-0000000D5jh-1zQu;
	Fri, 24 Apr 2026 11:14:16 +0000
Received: from mail-bjschn02on20716.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::716] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEU9-0000000D5eJ-1gQi
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 11:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4mF0POV6rFv2cHPDVP7Fpb9j18VpA2Zq1r4xmq/4qpxFwmczNixPxICB21fQGpbeq1UfkCPo7xUEvK9EQ/3GXRen+MZlCocUJ0qbkUas6uSvThWrm7YekYiKiQYdOe6x3QcVZIZZ4yVkaxy64bhQ7pTrIMSBWPT1fzXfTYh/SXTwPZwbW2z0eDHpxJ/30Bf8XhH7ixlRe/Cv0bsvSAbLSnTYy5arTa25ZyVw6c6ELA0VtCpYtfU6SiP5KUfdxp+XnXAfDR75+LIFI3O/Pb225cIoQAEVZby4HM5WoM1zApgWtI6URJWZRZlOEnrly5L2w41/xOdF51ujP2Gf5lmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFEvhD11i9P4eF7DJpyGGaUhZrWOw/dfPeSaTEFjzLc=;
 b=LCkd+6yBq3OYDvpgSiUNBHNa48nwbQ0J1hkw8fMdsWHyzuEXKgijd/WFIejIGkWV2IWTNDAu15HExUazI5e/9XdAR4Ot3PjX97AmjJhDaQ2K6hZaDkmYETYNm8v88RAWby9S5KydP1YmRcSI7V8jsOJsYN23Axbzujl1VcVywvM4k6ku9N2HZlMSbh5LEKx/zuMOIs+AialbMimtlmyYI22GoFcD54v6gp2/S1LbW7ZQ7i2z+TvLWuPz56st3rPbJuGYisSgVvx3QRnxSXguMyD4BUp1hn9KYoTTDddWp0DMHjkxsbnUnnBXYje9Kq26Ia1iAhiNOGoPtQHyNPhJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 09/20] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Fri, 24 Apr 2026 04:13:19 -0700
Message-Id: <20260424111330.702272-10-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a34350-c842-4c35-241c-08dea1f2900f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hOSmGojDPJijmBWQUA+5FfKXVO9RjfTIsknhiLxSlTfuH4XqqkiDWQy5KEvcK7NfXR5L2ib8I0tvVjLZ8mErfKx/GAY2j8z1IEevhx58ti3s7bDZfLpQmxn8aW+gLo/LkCWUZfgiVEZy1j9zqU4Lev1eC6fLI5BH2RQwvfgiQA8UpKzc42roOATMUpZXzlu81CfsL0CvUHMhUoATOT5ycc2vV4DDXRnLWbd/y/ADNRiMmZqrgAcZj7Yk7x6thg5Dbn+WD27ZLQcyIPXtlhSZqELOFmLLIh432VVrm0GuLJmkBhjAVPHf9R68KmiD06movvltE33PCiascXpegSd2f1cOoYi7uO9J/Doq7ZatIk37tGpwWo4HlSHRWbDv5mABtaaKZiWhGi6Hx967cvwShME4noYSnHYZl4Xba6P+1z7zb0aJPrm6GKsg0IeBj1+1N5e/CRL6z/I5sMAiagIHSIA5Dr1fPhF2kDCTEA+9XHhF35ALMI8xmpQGbj2NFH/1T3AcBA0542B5qI/idQIv6hqXLWzy2ECL34IFdCpHs0ryO6ZDMk5ixCujnnmusJ/XgSnLiPViMHup0K9/K1i9XTPZVHpKa9k0wQES2hSwklM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zIuziiIfEopELVuUr4319ijtljReTePQ4TZjEIy4/GACf/JweizbnzbIHAOL?=
 =?us-ascii?Q?5d6dWSH+Jow6KeAvrQbZMV4XlplKZJDtOFgK+B5VY+iSRtF1LHM9Y1jw4pos?=
 =?us-ascii?Q?cndaTtTxZbQnkRb7hB4+65yHpAs9s/0IAeDJlcJ+dai8UhVkHmO15z6gLPO/?=
 =?us-ascii?Q?ImGTI0YnZ4ASCR8PFt1VdIj7lMZkI91KHAYZ9wW3CD1LA/i35PPg2Jwuqohz?=
 =?us-ascii?Q?GivitNyzhSY/tJ3F2BEuGrqF7WX29PWuH7wNAghv0ocgfrrrFGm3ITO3aijl?=
 =?us-ascii?Q?5IupQG+DE5tM9lkquBdw4c4wwoNZ1S7X9g3on+Un/FKH1Ly7JtIvvQJsaJLD?=
 =?us-ascii?Q?obyEytR/5IHV86Ap18g08L9Q1GvHq2WOZeiqAlsE0hSAyQzMwAPJPVm6Iz0J?=
 =?us-ascii?Q?EiD2aFBDkzFEBSvKRTSSuzoKDewvTU9h7dfqJVyEIzhhlr9lxci45Dqvu4yd?=
 =?us-ascii?Q?Rt+LXeEX3kni1m0lRFMYeBfloxkwakUphuyHFXWl121vHm+yRYks9ENMyGah?=
 =?us-ascii?Q?4jNp/SCx16/goMy7/Dm0arUJNyQq9HEo9oZ0BO5b+XLoKzH5R/vGCeIJ76Yz?=
 =?us-ascii?Q?y+ZjG3uTa+bIVQGkhdeOCBO73Gd0on3OwuCTJpTk0M6ibVhY/8yp0AVouTd3?=
 =?us-ascii?Q?voMVjggdxsv3Tl8OziG8E6vRl2mXeiUkH0Znvq8GnKmgE//Mflgn1EOPed85?=
 =?us-ascii?Q?fx1XUqHkRC2Ujq/iPgm/78xYyxb37kPx29S3GGK1z92vlUYhUMZrf4QX1mcH?=
 =?us-ascii?Q?0xG/vC8YasvSNZsQKp3hoXrgAm5j4sV1G7jvkbQHLZ9VURv2AYW5KDDleb14?=
 =?us-ascii?Q?ojWIat8ehmUSrou4hVieSN2aamjxLUUnSizBqIYh+fIFyh7yO+Ec8QOxAHKp?=
 =?us-ascii?Q?H0KERUxmyyR5dCC6LzO6I9DegAHOvIgMVzOnjXRlU18bSdLI+3Kl9BZuNIme?=
 =?us-ascii?Q?7ZEbp7bU3BCX0U4a/CHFDCfo6a8jCPso4cHwTUclvqxpGBCv+3cpOQ9ZsVUg?=
 =?us-ascii?Q?FCz7MLBgd++/jaQCQeysg/N37VBZ3ftY054J1ximjuH8oxOp6WpYVKguGD/e?=
 =?us-ascii?Q?isdT+Q8FfoKIWpT+05zX8MMz3NLxWei8A1spKT1gjECWoC7kFzUN8c65X0uc?=
 =?us-ascii?Q?AiPVTEpEF+2JMzPAXnxcr4SPHP772sQyjA98k1ZBLJquA4ECnr3RGt9cjrf3?=
 =?us-ascii?Q?HI70BpIMGgBo3YKebJqyJuaw0Whgke6UQx+71ixu9gFUWRbFOLW/H3sp5b8A?=
 =?us-ascii?Q?U/NN53p3Wzcw6VYNKMas9YInKfz9f7rCRbyp/q2axrhYKNOOl2ByicSuPwUP?=
 =?us-ascii?Q?qWnl0UrIiV4Z6kxSYTh1aIobSZq8/v2qq1cAfV8wDjUUOtqdr1bbpdU9HByS?=
 =?us-ascii?Q?NRnANmp28H8Hp9S8joRGX4nQnf/QN/6tl44b91s6upCFeY3btb46zVtX8MAu?=
 =?us-ascii?Q?tekkL5QSq3HU7ZFRNGZ0LF+t7YJlwJZYojlHnItTup8HbSEiDIsNQtitY11H?=
 =?us-ascii?Q?6npuRWAZw/UfCMc+ouCr7ztNKrm5oVd56Uh9sqTMJEozbibPAs14+VoB5QJj?=
 =?us-ascii?Q?wrTV+Euljmf7Qn1yOI0SBdrZPYjU9cNHw3ti0oML+rJHtYVsYaNcJH7bKHmb?=
 =?us-ascii?Q?k3Vd/vx970I9L0vz3tOZWRkzB6vdENhmGVbwqzvU9/zQRFjEo3Ou2JNlE05Q?=
 =?us-ascii?Q?MCR8D3ll0eU3V1Nm0ZKOJxi8tG3N7Vfbn+8EDnSmKtnkhG7Fit50bh0GS1BV?=
 =?us-ascii?Q?z2byqH4wgR+qosd6AnDNZpkOo+unTfJ0PJeLJyEJv+KghP/1a+qK?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a34350-c842-4c35-241c-08dea1f2900f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:50.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8+qTJ2ZwI6h7dK6wY8RwzE7Dmm9rSKiS4o3yvxp49ntO+SGMQddNa/e76o+l4BLADLeeuB7Z/U35oahP1LM6KKXfVhcxFr6Mz/W/Y6PAEb45/zwC2KoDdmsrdpsHblY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_041413_447330_C20C27EB 
X-CRM114-Status: GOOD (  17.58  )
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

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 219 ++++++++++++++++++
 1 file changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..b69b9b21cac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,219 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per0" pinctrl domain.
+
+  The "per0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-0  Pin Controller, there are 60 multi-function GPIO_PADs. Each of them
+  can be multiplexed to several hardware blocks through function selection. Each iopad
+  has a maximum of up to 3 functions - 0, 1, and 2. Function 0 is the default function
+  which is generally the GPIO function. Function 1 and 2 are the alternate function or
+  signal of an iopad. The function 1 and function 2 are other optional functions or
+  peripheral signals that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, push-pull/Open-drain mode select, schmitt trigger, open-drain pull-up select,
+  and debounce width.
+
+  This domain contains 4 IO groups which support voltage levels 1.8V and 3.3V
+  gpioe-i3c0 - comprises PAD_GPIO_B8 through PAD_GPIO_B11, PAD_GPIO_B32, and PAD_GPIO_B33.
+  gpioe-i3c1 - comprises PAD_GPIO_B12 through PAD_GPIO_B15, PAD_GPIO_B34, and PAD_GPIO_B35.
+  gpioe-i3c2 - comprises PAD_GPIO_B16 through PAD_GPIO_B23.
+  gpioe-i3c4 - comprises PAD_GPIO_B36 through PAD_GPIO_B43.
+
+  Each of the above IO groups must be configured with a voltage setting that matches the external
+  voltage level provided to the IO group.
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per0-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names: true
+
+  gpioe-i3c0-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-i3c0"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+  gpioe-i3c1-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-i3c1"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+  gpioe-i3c2-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-i3c2"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+  gpioe-i3c4-vref:
+    description: |
+        Voltage reference value for the IO group "gpioe-i3c4"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+    default: 0
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate and drive strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        unevaluatedProperties: false
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their function select.
+              The PINMUX macros are used to configure the
+              function selection.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+
+          starfive,debounce-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              Debounce width 0 = Disabled, Others = 80ns*N stages
+
+          starfive,drive-i2c-fast-mode:
+            type: boolean
+            description:
+              Enable I2C fast mode drive
+
+          starfive,drive-i2c-fast-mode-plus:
+            type: boolean
+            description:
+              Enable I2C fast mode plus drive
+
+          starfive,i2c-open-drain-pull-up-ohm:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              open drain pull-up select
+            enum: [600, 900, 1200, 2000]
+            default: 600
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_per0: pinctrl@11a0a000 {
+            compatible = "starfive,jhb100-per0-pinctrl";
+            reg = <0x0 0x11a0a000 0x0 0x1000>;
+            resets = <&per0crg 0>;
+            interrupts = <60>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per0 0 0 60>;
+        };
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
