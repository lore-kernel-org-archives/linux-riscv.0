Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8350FCD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 11:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XRsXCP9swR4uwdKX9DS+eAWzzeSUnuXlJV2FNzEmNfs=; b=XpcbkSs5GQCVZB
	9Sgkr4oRTAg0bHchtgMhT2ODtuQyauF+E58bw1C6MrsuQpP0fcRfUyUGdJ4OZHTflcs1KwMlr455t
	Jfy4KVsOj3/NEWVCAM05UD5iG76FqkVCQ1gqsCJ63Ue6rVnbsZOK/pqwL0wZjkLfr9KSgqeG6AHTQ
	PZxxTw/tive03fOsCHeCrL83EUCAMnY7vEFF+99zUviwjvl4rPh4wjIgZNS+CWr1zyvHcpl0EvC1+
	2Qn3mzIRTqzYODnp3WBDd14753fUjbk3hml16APd9uJ0c7h5mO0NumOl9tNrYDgPyhnw0WlKgk5CF
	XsMKwFNEDepIBQA2LcYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTzr-00000005I5c-40xk;
	Thu, 14 May 2026 11:12:55 +0000
Received: from mail-bjschn02on2070f.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::70f] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTzn-00000005I43-1ZhV
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 11:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAzadbUyZeuUlubTOXsw+AQqbLEXcVbqUT3nm+3jAViLgGWLrvp5m9EuldpzH5ckF5mh8ar6F6jjitZibvhsyx6Tfjdgcw7d+PjAoIwQoTXs2axTk3O+i/54yG/1tFeJ7WaFo/eKYBiahSyuMmL8Ovxx/845wO78v+Vh/TGhzo5AP6qctQ/b8Q4XTPJ1yBUxW6Vv7Iy78U6wptD4G4N0Uvsc/1lrpBSI+RPQSVO5czYl6WWXsY11qrpoHgNiUtkIVH8ZmF+UtbQGXgUNbGhZyneraurtE4sHz97pFjUmWpCGWsRA9szbNgvQExt/Ky7JNvyVaytSAuY5nXD8VTpROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45FD97BgVkZj0h9C81gHiANu4LcR4thrjK+9QA6ksrM=;
 b=oA9WgMrs8NnG0jXmW77ze2XEsS3x3VZv1x/51fPiuk1vlETeBKhupB/jtroLXJ89S0b+K0mPY+Fa1r+xgb1yz3Vu3KRkh2oZORArqfFJbb8ZIOn8CEpfYCA7vynOG2fNYeAKE3qpkPJJONFx9q6kEPt96QsjDR2Hf0vJnC3h2325g7jphbyMrOpeRwRSft86fx1fXkzQqYp6Xi6vpAiW4UvUvBT9E/C4aDsIg9dG8osMfxsDK4BZ0/TwrbP5ck1w/APS5Asxg6eHour5/pUE0J7mBby4vyEDt0TVg9ol2RBY99Q/fqFeIvwpx94BAeWy8cYZJ3EME/OM2g0yQTe6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:32 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:32 +0000
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
Subject: [PATCH v2 00/22] Add basic pinctrl drivers for JHB100 SoC
Date: Thu, 14 May 2026 04:11:56 -0700
Message-Id: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f123ce4-66a6-4b2b-6bc9-08deb1a9b171
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: HLMGabNr/oLMBtxvFv+gReQ4mVffbxo5/akPWwv+xPjvLJcp8l83mI7lUYpdjrvSkMRp1C5JqPjSfZnrruRgzz0m1RuzcbASCwHbhYlUdm2uJo0SrzPbEgMrE5kcO2l26k63D9+6F0P23wE0mpzhIhOWuBGEARudYqqCEz7v7gXc8KhU7sYNbAgeuHEF8bBTM4mQhGZ7U//zk01XB2lR4xy3KHPikIDyKAmkrZzTI1JnMIqdFuk7FShW3lMp88GmBwIzHTCwv+Gi7BeJVLOmfcMFXe/c6B+B3Am9bqrkVFNdNSYeks8hiMskN4/bYGMjwuYMqVu3x7+VO0VzDZP9zrS2BOPEwOHv59YXvgS6LUS5A/RnAyhyORWzwF9KIa9FpilqE7J71+XYgRiPIt1sGoJtm7R8VabnrhXioCPlYQetkN7awM0p47cchL3h1AS3+VZRYj4e9oL97UU4FJv7+g/NrQOAhpDS6Xk1z9+Nq9Ius/vC7nPYj72Wo9USW38ti/k5OfJyQhKf/ifilLTUIJwT56APMAV0c/hOI1GLEryTuiUmhrwcot1wYlP/uXWH3QS8/z0wQvUEt+XKA4+u/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2+8MKE3eYY9CY2nHHsMkTXAPhHkpp4Cca3mOTOqAq+3PvoQ5PpFFRzZU+LI?=
 =?us-ascii?Q?OQjCZ04bYk8kLtDzX1Qc7vweiKCNm1rkekLSDouuWu/LiFYSYkMFWyKnsjLK?=
 =?us-ascii?Q?WMrZG/OLa1mtCwKFU/aU92bS/ezJUm6BaMwpofDb9JRWHczccgFZbqGW+2MM?=
 =?us-ascii?Q?TOVVgVKOqI4p2p9nzo8j9QQIWAo9+vMZq4AJy5gCRDcgteOufR98xeyD5TLb?=
 =?us-ascii?Q?B8CHETjgI4Mt7K/pSwjOH1CjC9qbxv/in+Z4KHx9cUPv86pMdZwOair0a/FN?=
 =?us-ascii?Q?QHtrks+9OM0u8ZVYoi+PeLyj6gGXJhIvBsGSTuB50lv5185qB24+33dhJ8nN?=
 =?us-ascii?Q?dQ/kLLOFRqHW4u/VPpQInnCmHZiP78RXJoaGorPA/84ZCmPOVbmheFfyiwac?=
 =?us-ascii?Q?QcZnYWpNl5S76xUA+R9hN7ctF5DLkalm1zl9HlLn5bJexDMKTiwYrifL16z/?=
 =?us-ascii?Q?WKD3SyB6w9EGQFloIFU/+bfw6tgwTYcyNwK84vj/9MeZmj7ReiKPZPoaPLfi?=
 =?us-ascii?Q?TnnDcmxiAclmnvTwp3Q/NUNUYCyQZBS/rKPuimOPiRZL93ioZqDSqcf7ivN+?=
 =?us-ascii?Q?VqX/fBduP+XU7RIB7D1EmLQrxqxCsCRifXlUGxKj7DOu+Xl3YneXraj94Roq?=
 =?us-ascii?Q?F9579Mb6hyKz5R4UOTxciSN3hcUWqESbEp8ckKAy0NAuJjQ0zxX7etc+K4KT?=
 =?us-ascii?Q?lx5wrkE88/V2aq8ZA6zESb3tQQ0rN77XJRHAI5u2Cg+lQ9GaJF9vhvnU/x/P?=
 =?us-ascii?Q?8BzzWOeeaayQ6rvhsausGzVEwHh69a6xqO7jPJd7Krg/P7faaBOVVgumJbao?=
 =?us-ascii?Q?qFmZiByql/TFuUtHbmE2HG1RyMQyxiWhK7gKi5dOGzJ4mV80pGH5X62xbE+2?=
 =?us-ascii?Q?ele80UIeNE1Yp18AUjF4HCz/Zp7ezL6HTBSa2JYjyVunAK8Ftxp6acn1hiEL?=
 =?us-ascii?Q?OWygAU+ClCvfa32ouRsaHCKAIG2VTzhvNSHeB/kTD2/8EXIZks8nHKtBXqDQ?=
 =?us-ascii?Q?AS5Ys/HqPB66H/nQ9MDgwzafowFv1vCmSKJbeH5pkZSPp390KbvpPXDf0MBC?=
 =?us-ascii?Q?t0y6jLQuqHyHSVu8iiWr1FTANEnrNkV2cnYX+v3Z/uPtQ94pNUBaEHpnL7FP?=
 =?us-ascii?Q?fiBx+CmiKkba76CGPuiYqSjEetYYcGDEuFxkwEaeI57GqTZR0QRf2Ccsbn0q?=
 =?us-ascii?Q?0Z3e3Jvjc8cWuk5T4yquCfdmPsDcmzNiOYbJja9j3LNp/3mJDqp8cXRAWoC5?=
 =?us-ascii?Q?Ydx5Gtg468kra5zJBC6ZFpEmxotIiIvEIIRwP+cAQyZka5Q4XqfZ6VPFZWk5?=
 =?us-ascii?Q?7u+SRbMe7XAhQ4Hk3X5WUqZyUF3GPpgwe+PkZ6DLc/T20n6QafyVGNZIMgCL?=
 =?us-ascii?Q?JAJFj55AYv1jc2eVq59vsNV+gA/gMlXmxjq1w5G+mEzGrKWnDE3DykC+LdCc?=
 =?us-ascii?Q?fGdX8jwQm5HPQz1ElSUcCQRwhPUTZWQ0NGWAqU4B7apo+eoX7p1Vvzf0aa5T?=
 =?us-ascii?Q?dodzUDdDSztIU7pK2hwDxAuJdzccYaFTVqLFckPsG14NCN5lg/t3Nud4V4ww?=
 =?us-ascii?Q?e8TCy/VdA6tf5qoRl4OL6lmnvNAhEKCQLKOjKc743hO5cV8BKBQw4fowYJPw?=
 =?us-ascii?Q?tOk3BPTFHA594OnEPAWjBYbCzRWefCjZnEY1Ei1cbXu2kyN7/X27NrGVAMAE?=
 =?us-ascii?Q?dGbD9Fytt5zcJXH3dkTZx7YcsVJUpHNWWBwTJPzglrd3X2IpXDoIrlX+QSnu?=
 =?us-ascii?Q?2RKWTmshXBoXlHU17RmNZDNY97WisD1EZQxf9AP6MXMHWTqDTLGC?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f123ce4-66a6-4b2b-6bc9-08deb1a9b171
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:31.9299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DLrwsih2Gr2aBQRKGb7S9s3rws1rxiG/pviyvnKD6WFydjXZWEqg1ycRH9YH9S70/egBw8N6S3VDdTEsTwyZ2BE9yNqoTI0QzNLLnqguL0nE/4wWIupixc5GKi+l4kE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_041251_417210_72217FA9 
X-CRM114-Status: GOOD (  10.95  )
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

Change since v1:
- Add new patch 1/2/3
- Remove v1 PATCH 19

PATCH 5:
- Use the generic interface pinctrl_generic_pins_function_dt_node_to_map()
- Use the 3-cell GPIO framework
- Replace custom pinconf with generic pinconf
- Share a single interrupt number across multiple GPIO banks within the
  same domain

PATCH 4/6/8/10/12/14/16/18/20:
- Move pin definitions into the include directory

PATCH 5/7/9/11/13/15/17/19/21:
- Add a "function" mapping table

PATCH 22:
- Use the 3-cell GPIO framework
- Use pinctrl hog to initialize the pin group voltage.

v1: https://lore.kernel.org/all/20260424111330.702272-1-changhuang.liang@starfivetech.com/

Changhuang Liang (22):
  dt-bindings: pincfg-node: Add property 'input-debounce-nanoseconds'
  pinctrl: pinconf-generic: Add property 'input-debounce-nanoseconds'
  pinctrl: pinctrl-generic: Make the "function" property optional
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

 .../bindings/pinctrl/pincfg-node.yaml         |   12 +
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml |  176 ++
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml |  175 ++
 .../pinctrl/starfive,jhb100-per2-pinctrl.yaml |  175 ++
 .../starfive,jhb100-per2pok-pinctrl.yaml      |  173 ++
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml |  173 ++
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml |  175 ++
 .../starfive,jhb100-sys0h-pinctrl.yaml        |  174 ++
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml |  175 ++
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml |  173 ++
 MAINTAINERS                                   |    9 +
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |   35 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  188 ++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      |  110 ++
 drivers/pinctrl/pinconf-generic.c             |    2 +
 drivers/pinctrl/pinctrl-generic.c             |   37 +-
 drivers/pinctrl/starfive/Kconfig              |  115 ++
 drivers/pinctrl/starfive/Makefile             |   11 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   |  154 ++
 .../starfive/pinctrl-starfive-jhb100-per1.c   |  165 ++
 .../starfive/pinctrl-starfive-jhb100-per2.c   |  126 ++
 .../pinctrl-starfive-jhb100-per2pok.c         |   97 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   |  121 ++
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  123 ++
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  |   97 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   |   93 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   |  134 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1579 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  152 ++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  252 +++
 include/linux/pinctrl/pinconf-generic.h       |    5 +
 31 files changed, 5176 insertions(+), 10 deletions(-)
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
