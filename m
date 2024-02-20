Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D29C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 06:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r9r1R5CpI6QZgpa7DGxBTTruquKXBmvdHA55rH3i0S8=; b=osdjwJ9uWN9LMu
	RCXZWOhy+npdnM1T0h2pfQFQQMGwr6jlhG17/PQ4m5JvThYlFgL/aUEeTHfoeaC/Ove6Ytk/zrhIg
	l3mFxXbO6fVdoSvBgkSrYEqzTsh7vOcHKdAbMrVTKU/ffOMUs7qqgwxA4p0jmY/Ft92QuEJOWaEhi
	2ANTNYvQTacOzItJaU5K00s3uwB/7R9ylsADWqOk0G6u4QVjXnLFNkaGJFSnahA8SzgkaJmT1O4yB
	PEpe6IF1lnJ5NeQhY4MtvDC2VTjku7Xnczm8KBoWMKCvLSzOgPZFzqwekDIZfMFVghME1xtVXYtrr
	ZaL08o8lIT464SENZ3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJqU-0000000DOjO-476u;
	Tue, 20 Feb 2024 06:43:14 +0000
Received: from mail-bjschn02on2071e.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71e] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcJqR-0000000DOib-1mW1
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 06:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X9ZrIZJZgSkDR8kNzLMDCQE813kmWHHkgvysqKvap2FzMAdUubxQyVudk0lRTpG7gSakCdvsvtQVc+AZSGzmnHfBILkmAFMQBqjPH3ctjTyVRaRqtHn2ADODlHjT6YTWleYQVPsPwMTo7JFx0kF0LU58dVF61vmn1u7bZnRp5eyC7tmV6vw93dGnnQspTHlDbMXU2liNUHkBGJvRXcmu44K6HTOQM+XryYzHre+pB9OCgUO5WM4DwiH8bqS+p9WASYjFTVUiOhOhMOP9Cn6s+OomueGgAu2bBHzef6huXMsj0CCw/csDXJj1pLGHfWRLdRJ3NQGDsqlNjFjd5/Ip1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNay858DEqOto1OV6uEx+DFqa4hargxwgIGRAUUBh7M=;
 b=YwJm9im6sLnvQ38+jAlpI6hp0IpFFyfHyAmqAslSwBcyj1xM7pLXG8VHpccVTSQivH5faTtwjPBK52Au+NxxhuA7ECgOTdZpKSOU8fHemuPZe6qO8ausZONM0r5ZYIi3eYRbhXOsIBQaANVKMaZvDuz/vo5NLMbUJzhzuIDCOmcdFfvALMhfIWgf4x4YCx0pHwFswp9Addy59JYou44H1k+aYsZF7/+XKWmfs84iEijMmVXvfFJdFI6AvFzQEyuZ7+eA2cEqQGBgL0+iG1kg8ZvAgFmIDuUnuszELzBIjwp5PlDpLjA6PZix7jxHzlflcj1ReKwcxKG/0VvCH+weHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1239.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.47; Tue, 20 Feb
 2024 06:42:58 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::9d68:58f1:62cc:f1d3]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::9d68:58f1:62cc:f1d3%4])
 with mapi id 15.20.7270.047; Tue, 20 Feb 2024 06:42:58 +0000
From: Alex Soo <yuklin.soo@starfivetech.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alex Soo <yuklin.soo@starfivetech.com>
Subject: [RFC PATCH v2 0/6] Add Pinctrl driver for Starfive JH8100 SoC 
Date: Tue, 20 Feb 2024 14:42:40 +0800
Message-ID: <20240220064246.467216-1-yuklin.soo@starfivetech.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: BJXPR01CA0055.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::22) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1239:EE_
X-MS-Office365-Filtering-Correlation-Id: 99166286-12d1-4211-5891-08dc31df2cba
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bkdC+0U+SPSjCr9fq4BH2VANAODssPv5ELSrgTWF/tqj1D5bhHAF6Kos/tTI8JffaL6Htkr7NyqOIpgY+bL4kCbUw1QIkpsq6XEbtpKPx+T3I6cYHpxZF1T6EMeBBqkHfle1++GGb0Wtols0Ur00U3UTjM+30Mk8YdYxGOa+/lLECsuINBRL6KkV3+Xv5ks9O9O8lo6SwIX/i4dn6b/fcihxWoQ2ooW4Dkf1D4rzfaOR2iGDS0zdIvOhqFBlQNET1jUxH/KPa3GR+3tPRadPGu3XeFe0PxWSSaWYpbAcFytjn7weCdKQQHtFR18TgtAfOdiKaYvecNODNHrXURDldWhcfeHFcKtLiucnULVwzqoRokCVDchLyM23Km8txaye081DZS+AePSOP/cxWOtv0ojWm0V9CVQmeTibwdo7/zFWnLq94OUJwDBGHzKEV4s26IA8YyNW8G9Kmjb1qCPQ0fpZQDKaRP1TlM/pPDa4JZ9pv9tTCE3RCoYkCFKFX0RtGELDbrTO7hknB+8HeG3+8BxNsEZjW5X+R+abOAOPsULTbjd+hpHTwCD/ETZt+NHM0rCnZyaArtSEblG72bk4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ca6zGGuZIlXy3TW1P8qgDvPm7sgMrMFzaqffgaZlOjwLc0Ky4CAsyImBHmod?=
 =?us-ascii?Q?WTp5pBmBXm/vgxJUfb7huPR1fMAd2npJTIJ/Uir2hQ7fDOYAF5fNU3rJObcF?=
 =?us-ascii?Q?D49JwJ2xVOW9rf4rAf7AS1FIDjtt/TLxqDwYoVRfJqGRo82PYOLd1xck4OUC?=
 =?us-ascii?Q?tNLWxopw52Hqk7/1Lsfdv9ThC2YOjA1o2a4tB9FJSwRSoKEXr1aUoVeiAvNR?=
 =?us-ascii?Q?hbS2y4meTTKbIyuXY33CzCTiYjz5L9wer3WnUwwfgVBTqpAt9jJ6U+rLO5M5?=
 =?us-ascii?Q?1zdLHI9AnjE+0cleCT37yx1GAi2uMA0wDPKg7oJHLRoHgn6Ei+1ZND5NsSG4?=
 =?us-ascii?Q?GT5+G1hxV5a192W4+uKLXW3HFxAsrqg/NLegYkIZi9ARQLC1K4KJ9bUsJxpV?=
 =?us-ascii?Q?S3B4YarsUY9/3ciNdgQtdixnf7dKteXvgHXxLwfEEQZWr0sxhLU1aHdLjrSo?=
 =?us-ascii?Q?J5CqOmpA06UTD1FnMLOjne7PVjvzkfVrfOV2jg6ycdgHWRRioHQwN4r6/Qk9?=
 =?us-ascii?Q?RP3EYDZVfDCEiiPqZ/FLwp3a3y3xqEH/2wuCNS3rfFTZzaAYFF1sKG7PiNkI?=
 =?us-ascii?Q?MkKhesaOA6flL9Wx+xEJAqBSUa/KmP2i4ZuussbINbXyoMO/sKDMg6hzNq0a?=
 =?us-ascii?Q?FIi1Uz7TdoE8VoBL3TDjU3clrkFVn1u2SwK4XHTq9iltMsTbfeY9YNFRg+n5?=
 =?us-ascii?Q?5bG3IwETQTx4yAMDlXu+wzXfGaFtfzdhNyoXeMkUi+J+H4P5uVFxZj0UCdwJ?=
 =?us-ascii?Q?5IlYML2S4L6om/fhJIkyQZYa81CFEdWGQALnDCu4VVSEoSVmsCAMofDttkqn?=
 =?us-ascii?Q?eYCCTdOQnm4bQxTAZyHpcKt3wagYmO6navLePsPOBUINwxUPi+8j5zGQPa0E?=
 =?us-ascii?Q?9cY0gmcqjfLmGOQ/jaoSwXY/ZxbANSDYKo8Onw//cfcxL5/4kElM2tK+Oj/P?=
 =?us-ascii?Q?+X5kH+J8Mp4/B3qEmUqdHwUpRcqEhAHQmWEw72Mfj+C9FW4owwApn6k0oXu7?=
 =?us-ascii?Q?SsYOb/sItL8xZK5l6bT03VT3xqIjt5BilhdKlIjsc2/Fo8xExOmJnkOvS4wj?=
 =?us-ascii?Q?rIEPBXlsxPcSlRoojhutQTSrWHWoreFroKMgtzF0GO5kFjfsiPjL2bWn95jB?=
 =?us-ascii?Q?Pu/9+GpIWzG3y9H/uhdbq7mFzl28jWzGl1ZBQyT3kd722o+38RafRVqimzbw?=
 =?us-ascii?Q?Kc06yLAbIx7ZXk1wisfuJpojuyrZWm5ZqMn0QkJyky2gEvvUHuJQAn1p4FTs?=
 =?us-ascii?Q?qOqZQc8a3aqIlxLf5jftpL9Tx8b8ygSKkTb4mkPUiOGPks0aJFg6J6RbneEU?=
 =?us-ascii?Q?cv2DC3YfetH7GIE9XZ8NIGSZ/ijyN4FhGMc3WJchH1pz3jhg5+wxAgU6UHTc?=
 =?us-ascii?Q?cql43lkppYGivm/kRj+Q7n/pixyfcfnode7v5Tqt+MWE+WM3+6ChBExnJJvj?=
 =?us-ascii?Q?3l79/2C6Ca4Fg1q4bCYf9/WBjHbkyjnIYrcCgIERrJJ0pEmdi2NU/Eq14dQS?=
 =?us-ascii?Q?q2QVSF7jQo+24aND01V41krLtr+KnCbk7jm4XLtMsIhw+POsIg4sYKZHEXME?=
 =?us-ascii?Q?9gO8xHFzTdu7x0nVMxc4EfGXNzalvwiTSWbDwFKACAiWq+aoK6Ddf6fBtKvc?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99166286-12d1-4211-5891-08dc31df2cba
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 06:42:57.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dHUIpVLF8ZDtuBjTARuNuNo72vb4+yQp1K3DMQfCXOY9iVs+SNQu3/LeOvyxlFlYSxqu93eqkV4qA3V1LEEP4eRpWHTZWo0K6yjDVxudqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_224311_495272_AE90F669 
X-CRM114-Status: GOOD (  16.65  )
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

Starfive JH8100 SoC consists of 4 pinctrl domains - sys_east,
sys_west, sys_gmac, and aon. This patch series adds pinctrl
drivers for these 4 pinctrl domains and this patch series is
depending on the JH8100 base patch series in [1] and [2].
The relevant dt-binding documentation for each pinctrl domain has
been updated accordingly.

[1] https://lore.kernel.org/lkml/20231201121410.95298-1-jeeheng.sia@starfivetech.com/
[2] https://lore.kernel.org/lkml/20231206115000.295825-1-jeeheng.sia@starfivetech.com/

---

Changes in v2:
- Add "(always-on)" to document title to clarify acronym AON.
- Replace "drive-strength" by "drive-strength-microamp".
- Update "slew-rate" property in sys-east, sys-west, and aon document.
- remove redundant "bindings" from commit subject and message.
- Change regular expression "-[0-9]+$"  to "-grp$" to standardize client
  node names to end with suffix "-grp" instead of "-<numerical _number>".
- Use 4 spaces indentation for DTS examples.
- Update DTS examples in sys-east, sys-west, and aon document with client
  driver pinmuxing.
- Remove redundant syscon and gmac macros from dt-binding header file.
- Remove redundant register macros from dt-binding header file.
- Add "wakeup-gpios" and "wakeup-source" to aon document.
- Add "gpio-line-names" to sys-east and sys-west document.
- Update the description of syscon register usage in each document.
- Update sys-gmac and aon document with information of GMAC voltage.
  reference syscon and GMAC pad syscon.
- Fix the pinctrl device nodes compatible string too long issue.
- Move all common codes from subdrivers to the main driver.
- Change the commit log to "add main and sys_east driver" to indicate
  the commit of both main and sys-east driver.
- Turn pin_to_hwirq macro to a static inline function to hide gpio
  internal detail, and also, for easier code readability.
- Change "JH8100_PADCFG_BIAS" to "JH8100_PADCFG_BIAS_MASK".
- Change "#define JH8100_PADCFG_DS_4MA   BIT(1)" to
  #define JH8100_PADCFG_DS_4MA   (1U << 1)".
- Replace "jh8100_gpio_request" by "pinctrl_gpio_request".
- Replace "jh8100_gpio_free" by "pinctrl_gpio_free".
- Replace "jh8100_gpio_set_config" by "gpiochip_generic_config".
- Use irq_print_chip function to display irqchip name to user space.
- Use girq to represent GPIO interrupt controller.
- Update code to ensure wakeup-gpios is always an input line.
- Remove the jh8100_gpio_add_pin_ranges function and use gpio-ranges
  in device tree to provide information for GPIO core to add pin range
  for each pinctrl.
- Change "StarFive GPIO chip registered" to "StarFive JH8100 GPIO chip
  registered".

---
Alex Soo (6):
  dt-bindings: pinctrl: starfive: Add JH8100 pinctrl
  pinctrl: starfive: jh8100: add main and sys_east driver
  pinctrl: starfive: jh8100: add pinctrl driver for sys_west domain
  pinctrl: starfive: jh8100: add pinctrl driver for sys_gmac domain
  pinctrl: starfive: jh8100: add pinctrl driver for AON domain
  riscv: dts: starfive: jh8100: add pinctrl device tree nodes

 .../pinctrl/starfive,jh8100-aon-pinctrl.yaml  |  261 ++++
 .../starfive,jh8100-sys-east-pinctrl.yaml     |  223 ++++
 .../starfive,jh8100-sys-gmac-pinctrl.yaml     |  163 +++
 .../starfive,jh8100-sys-west-pinctrl.yaml     |  220 +++
 MAINTAINERS                                   |    7 +
 arch/riscv/boot/dts/starfive/jh8100-evb.dts   |    5 +
 arch/riscv/boot/dts/starfive/jh8100-pinfunc.h |  418 ++++++
 arch/riscv/boot/dts/starfive/jh8100.dtsi      |   47 +
 drivers/pinctrl/starfive/Kconfig              |   59 +
 drivers/pinctrl/starfive/Makefile             |    6 +
 .../starfive/pinctrl-starfive-jh8100-aon.c    |  154 +++
 .../pinctrl-starfive-jh8100-sys-east.c        |  224 ++++
 .../pinctrl-starfive-jh8100-sys-gmac.c        |   93 ++
 .../pinctrl-starfive-jh8100-sys-west.c        |  168 +++
 .../starfive/pinctrl-starfive-jh8100.c        | 1181 +++++++++++++++++
 .../starfive/pinctrl-starfive-jh8100.h        |  105 ++
 .../pinctrl/starfive,jh8100-pinctrl.h         |  103 ++
 17 files changed, 3437 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100-pinfunc.h
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-aon.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-sys-east.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-sys-gmac.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100-sys-west.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jh8100.h
 create mode 100644 include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
