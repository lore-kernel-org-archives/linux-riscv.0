Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A70CA0EFC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 13:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EiEEiZFMWDEHMfoUrOOQaOVOGc8Bv1gE7hF0sqGIaG0=; b=hNH9v9PWWv9BsW
	O+wi3wcVUfS59uY2znWY9YDQJBU1S9o5dqYuJGOn+mZoQdJlBv0G4OUamrpSZtC0/PE03B+iOvERj
	tHvXZbWHB+a8cIg72lDi4+QDNuaWvYZZ4dMtLR1t1PXg1P1WW1A5VqPJYL/OjgDN+i6ZwXY3Qk4yN
	tVSAbxz0Yy46ig/2CI5lxt7DMKI/utNL7q0OzbemJNXjDi1aNnnL49OrbBt18BCfTU2wLbfayt1jw
	uvB78uop8xBFdJ0P3fCjtLURlM9ysulCAjAFP/DEYkSL2quk3J/VaHHXIHSeczK7ylN+KzKd0CenR
	SQe+iffdycCNVFtSZHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5QX-0000000H471-2QID;
	Thu, 21 Aug 2025 13:34:01 +0000
Received: from mail-sh0chn02on2070a.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::70a] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Fg-0000000GYAD-3BeJ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 10:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbAgX+PPMANAdM/gZd6CEWyCOLwo8qrIgPKJNU1s51xX/uytA5Yeyek9a4p+R+F71ag+eG5WJrTs3QpT2AUV7b4VQAhNHJqD5afwkt9NSEf1MigINSj9O4KZtkyf6W/hZg/mtXI6R54Dm2Fb6iypulGKFOXMPn+RGrFRlobitXN17tYdXLRJqAXo+O8nnxeVOmpVFNLvODOo4PRpqOTA5E/sugsg8rb+7vOgbMcGKxUDIvvyliL2XABklGJY4c5YJm77yi5nPINIWO930Wn4G5m2/16T1/yfECxhWkPhbD0R75FH+mWu+pyjniTYiThsk3AotpuTWaJOfk85cVmACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvXxXwdZA9r4SvKdyqenBtsYqx/xrQfaE5lhbki4t0Q=;
 b=SOPAqgImBVTXR2bppp9+hBGENoMlu0gxeZAsXmeDmP7ztNgQSNKpazcw+uTW2b94wMsk5C9hOF004+LG8EmkKYFXwYu+ttYEJP1fHbqRyqg9nGxoEX+ezHuLGzE0/S6LXz54HD1sRVfMmAyFAJHcKp696oxnQ3noduVBXucp6BliCoITLTwytiRxT/WI0lRyHrkED2NjB/noc4LkgMiPqTX0Svcr5NZ39ogemCJZbPWMLz/P6BBqp1K/yp/KgPc2MAoqkIMducfn2/0omkiXPyGtjtX6C4ahPzp5zy6klKUKXEBfKFci92yLSqrScR+PvdaVjYp18Cij3PjIneHS/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1259.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.27; Thu, 21 Aug
 2025 10:10:27 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9031.024; Thu, 21 Aug 2025
 10:10:27 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 0/3] Add support for StarFive VisionFive 2 Lite board
Date: Thu, 21 Aug 2025 18:09:27 +0800
Message-ID: <20250821100930.71404-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
X-ClientProxiedBy: BJXPR01CA0057.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::24) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1259:EE_
X-MS-Office365-Filtering-Correlation-Id: 75caa3f5-1c11-4cad-656c-08dde09af3b9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|41320700013|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: PAld+bx4qhYnbbCEggrhDq7EL/XeXmglUYQFEeJqGbHITl0jVaujbj9k1/WA9rpPyQgG5RoKGZPSxQztOZ8APEDRqWzrC/z+5wqjGHf4wOZwdsytsg3r+Y9mKx98i5pEUu2u+X5mhpztS63ZApfYwhsfkYztU7IOZzbTh8GUEUui/agRr4obW4oz7SmoILiWifPkMql4epw63/6Zf05F5tAe5d3GiBonBAGOBh9982SB0GxLL8w1+QXejJK+Fi4IUVzqAqg0KDgpk/pvjotw/LwYWRZkNL+L1Sd15TMNP8hB3KGyBzKnt1iLSaPZHd53hElvZ/40atIHa6Dj8l1581gkz03mFW1kYRjfjAX+Y/b0WSTcbvDSRZPlJT9wW4veHHlkKbGkaMM1C47hYd5hSGRzoVBbGL8xabP7SveXr2CrqEH5d2jWm+BsLR9Y8CkyyIYpWdOL/2tsLvS8ajJoFGhfL5F6+Gfkhx2NE+XSs7MchLBRaiKggmIEBfZXLhoSo8+tQxyVRH3H7opyojsz0nHbtUlG626qw3iMzvtYqN+byCIF1EWq2AnM/yrbj0059s2CiNsQPKmR+/CJRBrNAmj+l1TzV+6iSyx0dxNICPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(41320700013)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hf80pLYbg86kAxQ/EZ2PsWhqUC01z4rJZpp/nBZ8RYnX102a8patYeY/fDBj?=
 =?us-ascii?Q?w6P/0Jlkyoek+pbUwC8EpF4jOE0EOd70YSLqp2nRq3LK787qFkAZZWFcRyXv?=
 =?us-ascii?Q?/ED5iyGOoIJVvG21azwvX/A0SGNoWdOq1LiJEzKHO7/t4YfTKiYS6rHZrlFb?=
 =?us-ascii?Q?wwRCE5jG2y/VYShMUi52aoFWy1D5azHpHZGjtChMEIlIHfvyu7hG3L0i2Fxg?=
 =?us-ascii?Q?9bDhBrKO960rQiy8fDi3DgrGVXqzGMW1asgQWnb3Qbew3u8c8xIFjqQNlw5A?=
 =?us-ascii?Q?qfyKUF50DhIs3vhJNc36HQLpbiBERdbnyliaM/+tTkc8fbWiBjQAbI9gbFjv?=
 =?us-ascii?Q?Opz+JfEBwZqHugh0n4RMBXPix156itU6ztyOvl2QGyRcoQRuiDjf7iDM2s/z?=
 =?us-ascii?Q?GFONduqgkgkbKpSZ3XXt08BvNkA5bzG9m3cQW7Ej3jt0D3VMTI/hb6yifvld?=
 =?us-ascii?Q?KchXcIrPjvyCY5wTElXnoN+swhz78tC0Vj4bR0CskrnJsHwr/sfnl7r5O9MR?=
 =?us-ascii?Q?S6V+r7RucrYO/BDzWFbns1hb7UcWbNPhrJLKY8tmeVSpknepbIHMk/WrwOk0?=
 =?us-ascii?Q?YdOuboBz/vtWTtEzYvhRslJmucUsLj5egVpG84C9UinPEl1HCu9Lhrps2OD4?=
 =?us-ascii?Q?4gc5QM7mwoDPqNzeLradTfvfhzQOMCk3exSazQ8gCHHmvwc8FI/A6P5Rk+tc?=
 =?us-ascii?Q?fwZdBd0ib68JFlJBXYmuzTUH6/y5lqMMvEKuxV3i09Hfps9tKCUvVZ5NkxAz?=
 =?us-ascii?Q?mwbrNy3Xfv/s/095gf6UYA2dEaoNiUs20IddPSJKVw1dAc4Zk+uttGZRv+HQ?=
 =?us-ascii?Q?EECVXQ3Ywr4WRu+seuLhg8bmTxhZ5KqSPV/n1fU1kejrId2yZeILeOP1rjpb?=
 =?us-ascii?Q?qyw2F2xuZeGNP4mEuvWP3jy+Vb45uS8kcrNRnBsCQnWPg1L0tGzyO0LJjY/h?=
 =?us-ascii?Q?VntEG0LtEB+6kLTRs+jSeH84cVJHijbnXODVQknY4KzcGh6aNox8LMMVJLBo?=
 =?us-ascii?Q?9uZc9klLUZHwmzBR99Fy9k1OaMaTGIwsPK186nD2BI2gzF9/Z/6Y4yGQPdKn?=
 =?us-ascii?Q?x1dF3OAumhVz0HMdm/8GlXq/uLMMpSJ+kKwdqXoHzT2lYZIdxlTxVP//lCP+?=
 =?us-ascii?Q?bE6WflRRk3aj5VONl1JlFz2XVZvL/ZlBDTCHt+c8JAWedntpARJoP/Jsp4Kk?=
 =?us-ascii?Q?ox4FRzspr5T5DciYhse56fCdIC+UB9oG3w8Wz0D2Siiyp421ErIg3GhmF0zO?=
 =?us-ascii?Q?ba4MBRch5+B6Zjs8Glc6HCA28Iqo/FsZyY54uufyEoZweCdOV1ZYQA6eMIkU?=
 =?us-ascii?Q?sWH3ndajYrDDb9Y7OB3ZavucZMKWS24hx9INaBHPn5Cz6mEwDjojkDMXzR3c?=
 =?us-ascii?Q?qk152Csr56diZzMOcrmBqIwWdfZAhi0E6O3i3rxHxNhQ7HqBpMgwAf2U/Hkj?=
 =?us-ascii?Q?hYr3I4gsF5R349M7bvZmkBJ7EeS5u25CtU2bypjGVDNrycKJIiUoUfGgnzbC?=
 =?us-ascii?Q?9MMT/kcU9mTqDtN+TGiaA9VGgmLzVoCpV4kxgOinTnsAzdl3bRB66asw1lb9?=
 =?us-ascii?Q?y6kzpu3xnPsK8ZY7KczALO0RYVz6yjiIvNRuWgs/epUd3NmYenBMr2xzsuw4?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75caa3f5-1c11-4cad-656c-08dde09af3b9
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:10:27.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 668Qm0dqoxKt2lmisOALxb62+Q1zmBpIHj8NemiL/oNmB5IDKxLOs9bvDNSkqT/T7yakSq/ts6uVy5hBZ9yp0CvNdlDwz+ebbH2L7nljsp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_031036_799517_5DE8FA8A 
X-CRM114-Status: UNSURE (   8.79  )
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

VisionFive 2 Lite is a mini SBC based on the StarFive JH7110S industrial
SoC which can run at -40~85 degrees centigrade and up to 1.25GHz.

Board features:
- JH7110S SoC
- 2/4/8 GiB LPDDR4 DRAM
- AXP15060 PMIC
- 40 pin GPIO header
- 1x USB 3.0 host port
- 3x USB 2.0 host port
- 1x M.2 M-Key (size: 2242)
- 1x MicroSD slot (optional non-removable eMMC)
- 1x QSPI Flash
- 1x I2C EEPROM
- 1x 1Gbps Ethernet port
- SDIO-based Wi-Fi & UART-based Bluetooth
- 1x HDMI port
- 1x 2-lane DSI
- 1x 2-lane CSI

For more details, please see
https://www.kickstarter.com/projects/starfive/visionfive-2-lite-unlock-risc-v-sbc-at-199

Hal Feng (3):
  dt-bindings: riscv: Add StarFive JH7110S SoC and VisionFive 2 Lite
    board
  riscv: dts: starfive: jh7110-common: Move out some nodes to the board
    dts
  riscv: dts: starfive: Add VisionFive 2 Lite board device tree

 .../devicetree/bindings/riscv/starfive.yaml   |   5 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 .../boot/dts/starfive/jh7110-common.dtsi      |  22 ---
 .../jh7110-deepcomputing-fml13v01.dts         |  49 ++++++
 .../boot/dts/starfive/jh7110-milkv-mars.dts   |  49 ++++++
 .../dts/starfive/jh7110-pine64-star64.dts     |  49 ++++++
 .../jh7110-starfive-visionfive-2.dtsi         |  46 ++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  16 --
 .../jh7110s-starfive-visionfive-2-lite.dts    | 152 ++++++++++++++++++
 9 files changed, 352 insertions(+), 38 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dts


base-commit: 068a56e56fa81e42fc5f08dff34fab149bb60a09
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
