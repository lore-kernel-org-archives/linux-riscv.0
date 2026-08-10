Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC988C5B56B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yDFNnB9K6nYAqJp4B9PbUzev3UwVIj9kpQ2eZE8TQYo=; b=ctc/JZ5dqXNWBY
	yZeL8TlkBsDJQl6INqVg5jqq4NmSuWQCm8377ezhmIyK9+puwFLDK5PsnKejF0an+nLlK3e6hLRd/
	Vl72uZw4FxITPYYVgl4wOv8j2SgHQ5712qt7HmMlyB0Azv2g+uPVmY2vjSzq0iJ3cQdsRiO7vlrrk
	oYj0Lt7O+W9MrGSzp46K7SAuXpFzZrYK8A6ZwONHLZFbZDukuXkXrLdk/ayV1+B3lLybi7zY4AWZZ
	uQ9IAJecZqIJWzGewwieHXrfLlRKVL3fhk7bQy7m4M/jqOmvdcppC9qYcFnv4EUBs6IcRWYTob+Z6
	hcPzwEvw0YBDJ8FqyqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJdf-0000000B6ey-1tL4;
	Mon, 10 Aug 2026 06:37:35 +0000
Received: from mail-bjschn02on2098.outbound.protection.partner.outlook.cn ([139.219.17.98] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJdb-0000000B6dM-3GSi
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 06:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxoIPzppk1nOZElrTln5WF0bQQZ3Bubt8sAWue9e9c+AiCCSZdDtLmQwtWjHm5OQNaGh2XnSh9aGM+k6rKT7XOFDVCZ3cfR1VQW5x4op5jwBxJ3Ja1BPs59CZd5ZCYj45BkJYazADW36Mwy48xgkLvPnYqv/D50IAieaaQb8YwCyG36Ju8SdyAZ9ZnHpmH3h2DrWFSOjyEg19yp1amsUIFzVZjpl7QAwxRaEPv6IFUC+naHhsFbU+LGnHnbVjvBLy9K6tBS2I6h0khX39n5/ErxCSTIBDYT6fUd3se7iexPr0vClFLSkFcjgHtGuVr8dJ2IDC5+Yex4V+rpF6vLmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmkksOCU5p2DRJ8E717+t0YZbWz29/B1/hSk6oadDo0=;
 b=KRVpsc+7TBNIQBRj1wykOs16YYIHltw3WZruMtRPyDR5Nc3JVNrQa2SfGbzXvOdZV5/L+t68g0TMpKjwYd3BcH3XwhneOR9Q2j84EiH6yPFzDFTvsie/FjIAnvwcoohhrSeNlCpfAXa9DVhmEEl3t5onTii83KXAwf1CnLTFrEptezVJxAtDMP16hpqmb9zfjC+6OCQRwSfXPMVEODAdMqO1RaMNKc00ltuQPkC7XWS1kSzqGXmR0sJrPcPkpwv0Ia1sbv4F9H6tpxbb6TpXf1ygS74iBqGiYqqKw2vP27qwnqzsnvMs+GpMrJSoPnae7UUM4iucLlFaRZ2sxntFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1284.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 06:36:58 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Mon, 10 Aug 2026 06:36:58 +0000
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
Subject: [PATCH v5 00/21] Add basic pinctrl drivers for JHB100 SoC
Date: Sun,  9 Aug 2026 23:36:29 -0700
Message-Id: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BJSPR01CA0019.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::31) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1284:EE_
X-MS-Office365-Filtering-Correlation-Id: b137b6e3-f4d6-4ac5-accf-08def6a9c6dc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|52116014|10067099003|56012099006|18002099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: L7L4D6stPu4XWhvhxBCPYN8QGZ3i1m4WeudqCQ4+TalPbErUo5XgXsviFKkuzhQxFkxCtSUzBIgfNC7pwILdktq45Qv89l1swJWnCrIr3C48R5kpWPefHKtfMuHcuIUlzswLpSpdVpPAV0FZCg7kcvOeLuG2FhntgwruqtZbg2zbZGkbH41UsWXj3keJobV5Zpjg/G/gHFalCtU+0ZDXx5bjJeuJZtDj4o8LT6fnn9mrLwlfWr10Qvc7KyrHiaWWEedyzODQFy49XnN7EJ4i/O3El/4FXA2Vzex8OoVC0V1npWnvzjFLyslHhQGM5qZdLXVAsfPqvLATGwieMjbP7IjuYxjZoNGP0X3D/EzKeMRXvGwkReQ56TGq+4hQn+X8l7e/HlzIE9FT5ndYAQuVw6dJdN0HEDe/AZzwOBLfmqgc1LyPuCpt5jpPoaQwu0S1J6WLxfg67Ece8e75w9SifyXt1qGVLrtU/CFu+tzj/m9IGeHBMsLtFTueZgPSn6/2xkSiEth1XypZN5QzOCeo/3UJzMfPFyRlZFW2lhu1kXHFDOLftDouafzXdYIFnO43206IqQMwVI01eQy7hdkT3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(52116014)(10067099003)(56012099006)(18002099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FcuMUGWoqUDp0nGkVFuv3yN1laL6dR96UcHda7IrrD3mYZAIc93UcxT0LPuJ?=
 =?us-ascii?Q?gOTKzEq8jMsXLqV2KfFlyoULH0p5ciHCxSBr8ND0yWpjnFeORusYTHSRwCZ3?=
 =?us-ascii?Q?aLKN9JLtK1azUab6vAQ4swU2m/siIT1pG0wBrOWw+1Ylxvuc3mPLGfAQMgoN?=
 =?us-ascii?Q?a9ELM8XuXRcfNLlxZpQ9GtSdxsMQEsanG0LoaW8wJ9s36F71Rs9rB8TYyMao?=
 =?us-ascii?Q?JzyYFiCj6kcAKJwRko5X7F8z0uNwCr1wEX6l9jVTh/KeTCxi1dRifWUFjpVf?=
 =?us-ascii?Q?BvE7yWdF2R8BEzjLemiesPNUOrJrT/dbODyVTpIxPs0AR/GCAEJOGRXJYq0a?=
 =?us-ascii?Q?YlaFQz9ktb/6LPexDFYmTGrx38S+2m0xpBlbfqvhsFXMCmf8YfDpvYmXNzuK?=
 =?us-ascii?Q?6kfelZLStJc6kgUGT6+JQdrrwlm2i07gniEv4AwK7bavUhDxR1SjSGrY2VY4?=
 =?us-ascii?Q?KKLu3NktpR3UorP1pOZ/brnrMOnV+HL6BXpQbLpEpa875krcGvxBiYgYrtha?=
 =?us-ascii?Q?jNg6RwsxIdsVErycchwqwX/aK4k1zNAilqsATii0nEpWQg6vwPrp0EIqBmGS?=
 =?us-ascii?Q?Z2ECPHtN73KWHqmvUYeQ9VnlAFwBShuWDlHPnGG2NBSZ+moHePFBFu0Yg8fo?=
 =?us-ascii?Q?+NWUF8CX7AOg/32FTlc+ZbWHW+SJPH2gtR298FvRpzT9QKIvO6LjhNaHh5xB?=
 =?us-ascii?Q?mgNq7pFePxjjdf9Yu4Dl4nFwtgQMZlBknS59vf+nmYypRFxxG0u0tmQukCFb?=
 =?us-ascii?Q?2v8agK12cp22rDNVzIy/N4PeSRrXCbeMjP9Ei2G4MbKlnxlePaii1bZg5JF2?=
 =?us-ascii?Q?9dol8ZR1UuAo70gdlQOiHMj7m/mn6NwT0w/dAp91/kWIIzaviZ6qi7iPhov6?=
 =?us-ascii?Q?97TIlPh8UXreltlemAv181+DTDd8etp02RU62gcLCvxo5ou8EmVM8KFXiSa0?=
 =?us-ascii?Q?cAXDZgNmJwkjE6StVXFZ3XD9CjZhAkA8/2JFahwjAQYJXl/BMNme8kOTPIWT?=
 =?us-ascii?Q?qZM0QIGYzQYz8e9gy4Q23jIwNC4R+KP1lfzmbdQ4QrqnPN1f84vmpmPFnibo?=
 =?us-ascii?Q?zAZCeSX1LEQD42HRg6tlmFEeiL07aplbOAmF0/+JdrMVVxTMAHywkLcb1yeg?=
 =?us-ascii?Q?v0Wea38hnlmqC65VM3lVOqDdWUt+U20hgITz2Yv7oCotujX6iXZX+UEb26nm?=
 =?us-ascii?Q?rLOr1MjWGoyCKXzfBCqt4b+EZDMW/2SFS7w0RmhOvLvCQE08koI/BiGDhw3X?=
 =?us-ascii?Q?x1ouS1JcRI6WaA/POkyl7wXKSEjDsKvAmPZUobS9ak8LqtHrAZs7QlgQvE7Y?=
 =?us-ascii?Q?Kkqw8ToLNPZmXkVDd1Yz+zTGyV4FxX/H2vF7M4zhnpboqNaJU08QuflSQXbU?=
 =?us-ascii?Q?SVS7k+B4qPesHs/vS2Vi1+ScB4BTjsQONm2fmu82gd8K1n3TpGYouphqsCEA?=
 =?us-ascii?Q?YPUpDU1LSk50JK/av+fyn64K14U/3PmN34/UwLf/lCqIRyYGic2Iu1hYPori?=
 =?us-ascii?Q?ldwG+WYIsVIoazOcUT08pmJbHH82AhAz7YSuSWTa5I6OkkDHHCoy89Vfaiid?=
 =?us-ascii?Q?WidGQBNPClwkdBiS5cHpKIj+WA1YlVJ5WM5hDs4Xl9MNBOH+E3D94PTLU6x4?=
 =?us-ascii?Q?VOcrabJvo/gDUS7pGGUWDiCpkpy+wW/RHI+7UV1A3SWMhUUl4gILc7wF6NuA?=
 =?us-ascii?Q?DjAUrlUkYUn3uNNvG/Mj475ZPkQsABie7kL7919nZGlw2UjJdjOkdWzGRwMP?=
 =?us-ascii?Q?htIeVhTMCrPsX8y4d58lUEyQZIdM8LQNLUD3ZkURsrqN22K83tua?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b137b6e3-f4d6-4ac5-accf-08def6a9c6dc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 06:36:58.1411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9URJQ48RnL8Er4T158kobANEs20eGq/uFVjhVQlz+EgNIBti5z7lrZUKTdGg2D7L9w//jt+eVc73iPbyIwm6HzgnT6QUf9BLxpJmSjdN6NgAV3SeEfFnkAoWI9d4pjNb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_233731_994633_8C853FC8 
X-CRM114-Status: GOOD (  12.31  )
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

The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
per2, per2pok, per3, adc0, adc1, emmc, and vga.

In the current series, we will only add the following pinctrl:
 - sys0, sys0h, sys1, sys2
 - per0, per1, per2, per2pok, per3

The remaining pinctrl will be implemented in future series.

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

I kept devm_reset_control_array_get_optional_shared() because the
pinctrl_adc to be added later will have two reset lines, and one
will be shared with the ADC.

Change since v4:
PATCH 1:
- Explain why this property needs to be added.

PATCH 3/5/7/9/11/13/15/17/19:
- Remove the description of (half frequency) from slew-rate.
  This should have been removed in v4, but I forgot.

PATCH 9:
- Remove the drive-open-drain and drive-push-pull properties.

PATCH 4/6/8/10/12/14/16/18/20:
- Remove the <linux/mod_devicetable.h> header file.

v4: https://lore.kernel.org/all/20260801072711.153217-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260603055347.66845-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260514111218.94519-1-changhuang.liang@starfivetech.com/
v1: https://lore.kernel.org/all/20260424111330.702272-1-changhuang.liang@starfivetech.com/

Changhuang Liang (21):
  dt-bindings: pincfg-node: Add property 'input-debounce-ns'
  pinctrl: pinconf-generic: Add property 'input-debounce-ns'
  dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per0 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per1 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2 controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
  dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
  pinctrl: starfive: Add StarFive JHB100 per3 controller driver
  riscv: dts: starfive: jhb100: Add pinctrl nodes

 .../bindings/pinctrl/pincfg-node.yaml         |   11 +
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  180 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  179 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  168 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  162 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  166 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  164 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  162 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  164 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  166 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |    3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |   23 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  110 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/starfive/Kconfig              |  108 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  152 ++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  162 ++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  123 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   95 ++
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  117 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  118 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   95 ++
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   91 ++
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  131 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1456 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  159 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  247 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 30 files changed, 4739 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
