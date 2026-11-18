Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894C4606A325
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hIxIoUaF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2DJdFKRZr1Okvr2mNhXYJzE8kWqIOT6Wuhl+TO0TbOA=; b=hIxIoUaFzJPJAogpQmeaRraxiF
	D59c/Bi4cmKu/b2mz1bv6NEwgaWDiOJEXvelbDx9uN9Up23OsHJDimCenST9VgiGPOxz05CC7MsBN
	NexBPBMycKXNNNxLAWp3quJyoOsdPwvshO/zf3XeYwpWW/PtWEKW2e4GAhJLhMOMiJ5vm9QzFQVJe
	ei+4t4VpaEytByhsJHbmCefaVro3H1mCvI6Pf+ke4/FFCspBStlGl9C32YivRpCsYo1n7qo4f3H4m
	3qZzr5XAXBnZz1JXgbcarvvhxzgs3I3+j9RJYloMQer30TCsxs1O6ioALwtM6wb3w3pyxiz838JX4
	4S/PaucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcYA-00000008V7b-0H7i;
	Wed, 18 Nov 2026 10:05:58 +0000
Received: from mail-bjschn02on20720.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::720] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcY5-00000008V5j-0x5y
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odm/z7JkVuvIQtcwl/tnFUafvr5sfEmLLno8TCxpiX0QTdBCdPYTeECKUIF69bVjpWGy1xoLngdng49pPb8KpPB1qBILCItVpleYGiGTvdGT9ewZaa8T2PZYyHde9RQb1OL/QH4DkVBQKtIiLvQ93Wfp/LyOoVfGq4WjOtHV0dbp4UwTRgKcmqnm8o3fp0fn/vUj1sEhOjvPDWABGiv2n4IHobfF7KKxsV0fWh49/hGFpdl0qnaA3mOd6/7UCRlU+k0Al00dGG+/DFmUEz6BxQ5yhtX6Ky2fmKwzBApPk7zzef+6tll/7R6f5d4KkVUpVCSRXUCEBPsN30B7cDtxkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6Qaqa7SmXCAUJIUyI/Oi7AlBxTK6NHCjC4aW2RhpJ0=;
 b=Sz8sLzy7bCI9IRAuZopgbxT4WNzR9hJFX7+cgVA50/8lhZAQpIsYPpBLcY/CnuFHEUnArln74yJCtGhISWUQZvwM+PcmFDExNJnK89rocAIlEa20UWTA3addGxIdPsCny4945/KsW0W1KAqIS+j536r+Inptqv8lf8jOWWSOo6C+kdOacIqXCnln9EqBcc5/1LPJLkGYrDrePAUwwJlMo002NRzkpP9b4LceKUBL4IrJgKwksNIwy60T7t5eOuo5tQCXsv4iN5xpP3f2jLrO4jGfqtzD9wsevcOaDN3ChsGTSglmnpve2voc08JZMT3kBwSqiqtpJGzdHVZOIgX7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 0/6] Add System-0 CRG for JHB100 SoC
Date: Wed, 18 Nov 2026 02:05:17 -0800
Message-Id: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 696c4631-1473-4e64-06e0-08df455b7db4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|10067099003|261021121427099003|56012099006|261009223327099003|261022105027099003|261102123227099003|261022075727099003|261009221227099003|261009220027099003|261009221727099003|261021123027099003|261028144727099003|261026121527099003|18002099003;
X-Microsoft-Antispam-Message-Info: Jd82Mtd0NmT5QXCVYkiJvwqDBcSYvlWvMbJZNN8YT96hsl34OfVl+rzswHs6SWuUxIZyVWuLEaPpEGQewZH+OQl/y89ftoCm4wdw6Y0hunNA8fgN3AhfRuBj9GIOT3gC9MBkr7av/YgbcUweeMupU4JGSdVCPiwHwxGfpbN7Jh1Arzuxae2fjSRqj9MF+WsrEXggSf9p0IcQMGIBJ/ppxwmn/PSsAyz16No7417cpzwMPabtBGLNWXH6jRmRGzoJKLrB9dbLuzc+LZAi5KcXAWD3QwH95cO+qDE9uIeUhPbsa7irwLpxHv5j/62BLQe2Hz/VnK/Zs0rVJWafibYrtPYop0fUR/FoicD/JRyslUEIKx3S3D5UV7qCwPH4q/FdDwX03RyDxKtT5a7VB896/y9tbZdY/rRipV7ILSiuRquviKaHgN9Rw9kyEJakfMokNzAOwCaau55nTHpv3nK9YSB4cOrZuVNTDzJVjmP2bhDRSjqSQ5m2E8fsUcnl0JpnCs8y0lIX6N7Vk9ost+PLQu0riD1HP71qsn429n9rL+vA1qDw5xqEEeO5wYCKZG8j
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(10067099003)(261021121427099003)(56012099006)(261009223327099003)(261022105027099003)(261102123227099003)(261022075727099003)(261009221227099003)(261009220027099003)(261009221727099003)(261021123027099003)(261028144727099003)(261026121527099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kDpEWiBcCdk804HN88zr65gXhBm/kBqqXB0Ce0024fyTDKCfBJXVsLYCx1qc?=
 =?us-ascii?Q?EXoRkPF2/roJV2U4KfPhexFPeuTRGxUrmV7C5dPB4+T2hc7s4A33TQBhdCx2?=
 =?us-ascii?Q?9VFCtTaP3TXX2ylCawa5nT2pM2d3mc5U2zvGxvJ8TH9034fORB0iN/NYp6Cw?=
 =?us-ascii?Q?MweLatFAGmEVSF4jU4CVrUGqPSxtlvcaD0dfX2go+8zU+D6q7XfJ1vQxHyb1?=
 =?us-ascii?Q?cqDz4hyoVVztCUuVohZvDoWgpvNJnCR7UgDOH7qqfgr6bJsw3M4fHq8R6Ugo?=
 =?us-ascii?Q?hFO6tZ2UPAzMlIpMbnHL2j3KQqFiWvqXTi76ir3z8+3lD/J0EMB70du7LqFz?=
 =?us-ascii?Q?abPA1ucNjjZpcH/MtchzxYJYqMvcyPW7m5cbjPcSZXjRSYhqoxlp1b4vBLNn?=
 =?us-ascii?Q?IZjy8gNL/Zs1vX4OYxyDVQV0s0Ao+GaNFALajB9I6/RK04nvHuuOu87TS695?=
 =?us-ascii?Q?M8Hz/lcfn8qwE00oAbH6akKYOaUEMM1dYbOrE6bmMtNUv68BenpSukk/ubcG?=
 =?us-ascii?Q?WFrN9WQQtr/otQSDh6hBSpIuaF2OrMlJBpzg8C/1H0y1TpOPHcdPognPtebE?=
 =?us-ascii?Q?DK98B9OsGUdqHaJLecL1mwt/2v9uz/PlYnYBdQvaY4zXxMDM9W145PDkg+80?=
 =?us-ascii?Q?WImN2WkH9olkGxIWx1I5us6994q0kZ8PjdWr8LGcs1i0sAvVF/VZrh1r7GtL?=
 =?us-ascii?Q?TbguT/SeiD7K9YQIiLM8wszDqWxftLpzMxrYPbtAuNExWY8ZhkP43ZVWVdyg?=
 =?us-ascii?Q?umCXgdVshAWRrfNNcW3bDbhdMTZ9uQ/cSLjAyT5+ZZmeoBZuAo0AFbr7WYe3?=
 =?us-ascii?Q?GCcvA/SkzdPu1pmiKT41xy8N7zabhEVDK0UKpsqrq6X6zo5uG9mvX/SWOW8T?=
 =?us-ascii?Q?dSSHD6z9s//FSPR9PgH8QYmFljdo3oIiwk4a1zcYBlIi/Yl/y4lMfGSo2dOw?=
 =?us-ascii?Q?UAuXRxuXzJTqZse6WbZEBTox+mbVFGIf4TJdcWSvtRp8m5/D6DEu7E1M/Mpw?=
 =?us-ascii?Q?sK0G77wp7t8QVt2393E3mH7iy9w+yXPgfZebQj4ZAUMvdsAbr+Q4ShaAqHvJ?=
 =?us-ascii?Q?2Z8yiFnjGY9fzGqv5THmfr4X8/542s9OTL28lA2e56Uth90gWMzJK+Kt2c0H?=
 =?us-ascii?Q?jlKI2Bx/UF5oRg0Ih5rEQwi09BE2WBrL5D4NoZpZ3TO5NGbygyK3UmJYMtvE?=
 =?us-ascii?Q?BO+eH4Y/n0r1FkugM9xMIBnkBNEmY2mVBr8z+4wQuF4xpb4JM+2DdcOdbENp?=
 =?us-ascii?Q?frL0zEwW/hYSz9Toah8zWiIlHZdVBOEV0GEzs6yX36uqSyZ11K77rJDc6u1Q?=
 =?us-ascii?Q?2peWr+8zdQd0k4CQvHZqSZNpW07zVN3kQmCCooyiIWArHlM95kHzHH5Ydzer?=
 =?us-ascii?Q?dlgkLubkeC58meb5UuQFwwu5tXpsDfPJ/5qguzaKudNZQZX5xq57PSPCde0r?=
 =?us-ascii?Q?e9kjRJwlzghOzWqYxWjkfeXeT5wkZ3JeATh+IrQXP2NgL3YUV543RDsu5rZX?=
 =?us-ascii?Q?bjT0myNmImrCtkq2296M2LZvfW/Y6VUPeqdtOo0EBuNd8q+WiLJcuoOJN3DW?=
 =?us-ascii?Q?MtpFDeUzbfMAP0GOwH5nL+FPDYk2/uEZBzctM2OJ+vctQOuRM7txb4fjoZM8?=
 =?us-ascii?Q?q8DGc07vhfImLa1ITWhTugH8KBm4vwe2dN2WojJzs9M7iIp++rWaHG9Iixlo?=
 =?us-ascii?Q?Q5ZUPUiFr+SF8r5BLsch4YZtvsByPE51J6hhwRGxL0bkg+/b3lYwZNmWc7XQ?=
 =?us-ascii?Q?ZBOEkBA7pwAeXKxdxf85gFxD+upSluGgqibHCsW3tuPo8s9q9O2e?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696c4631-1473-4e64-06e0-08df455b7db4
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:36.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBuThkkKEa4RqFm5dA9/7ZYsX5TYpwHmB7A7WhA4duV5/lreX7ViJ7W770PiyQe16ExvrQVpaZprCTsouLA5L/kUHZFmTT46kfTff1uEKVnIlsnn/8v2vgGQDF2y4SV3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_020553_270211_629E9333 
X-CRM114-Status: GOOD (  15.84  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
subsystems:

The JHB100 SoC is divided into multiple subsystems, and basically
each subsystem includes a CRG(Clock and Reset Generator):
 - sys0crg/sys1crg/sys2crg/
 - per0crg/per1crg/per2crg/per3crg/
 - voutcrg
 - vcecrg
 - gpu0crg/gpu1crg
 - cpucrg
 - usbcrg
 - host0crg/host1crg
 - pcierpcrg
 - husb0crg/husb1crg
 - husbcmncrg
 - husbd0crg/husbd1crg
 - npucrg

[1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

This is a split of the previously sent large series [1].
The original series had too many patches, and there was a lot of
similar logic among the patches. To reduce the burden of repeating
similar comments and reviews, the original series of patches was
split up and a new series was established.

This series is based on the clk-next branch.

changes since v1:

patch 2:
- Rename struct jh71x0_reset_adev to struct jh71x0_reset_platform_data
- Use devm_kzalloc_obj() to allocate the platform data.
- Add Acked-by from Philipp Zabel.

patch 3:
- Describe each clock parent with a struct jh71x0_parent_data. The clock
  table is now made of struct jh71x0_crg_clk_data entries, filled with
  JH71X0_EXT_PARENT() and JH71X0_INT_PARENT().
- Drop JH71X0_EXT_CLK_FLAG, JH71X0_EXT_CLK() and the ext_clk/num_ext_clk
  members of struct jh71x0_crg_domain_info.
- Use devm_kzalloc_flex() to allocate the private data.

patch 4:
- Describe the parents with JH71X0_EXT_PARENT() and JH71X0_INT_PARENT().
- Drop the external clock name table and the static_assert() on the
  size of the clock table.

patch 5:
- Translate the reset ID to the hardware reset line once, in a custom
  fwnode_xlate callback.
- Index the map by reset ID and make it a plain array of hardware reset
  lines. Drop struct jh71x0_reset_map.
- Drop jh71x0_reset_info::discontiguous, JH71X0_RESET_ID_INVALID and
  jh71x0_reset::info. A non-NULL map already tells that the controller
  needs the translation.
- Use devm_kzalloc_obj() to allocate the reset data.

patch 6 (in v2):
- Index the reset map by reset ID and drop .discontiguous.
- Depend on ARCH_STARFIVE || COMPILE_TEST instead of CLK_STARFIVE_JH71X0
  and drop "default ARCH_STARFIVE", the clock driver implies this driver.
- Use struct jh71x0_reset_platform_data.

v1: https://lore.kernel.org/all/20261013102707.9207-1-changhuang.liang@starfivetech.com/

Changhuang Liang (6):
  clk: starfive: jh7110-sys: Fix memory leak in reset controller
    register
  clk: starfive: jh71x0: Move reset controller registration to jh71x0
    common code
  clk: starfive: jh71x0: Add generic CRG probe helper
  clk: starfive: Add JHB100 System-0 clock generator driver
  reset: starfive: jh71x0: Support discontiguous reset IDs
  reset: starfive: Add StarFive JHB100 System-0 reset driver

 MAINTAINERS                                   |  13 ++
 drivers/clk/starfive/Kconfig                  |  12 +-
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jh7110-aon.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-isp.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-stg.c    |   2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  57 +-------
 .../clk/starfive/clk-starfive-jh7110-vout.c   |   2 +-
 drivers/clk/starfive/clk-starfive-jh7110.h    |   4 -
 drivers/clk/starfive/clk-starfive-jh71x0.c    | 116 ++++++++++++++-
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  36 +++++
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 137 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   8 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jh7110.c    |  19 ++-
 .../reset/starfive/reset-starfive-jh71x0.c    |  60 ++++++++
 .../reset/starfive/reset-starfive-jh71x0.h    |  24 +++
 .../reset/starfive/reset-starfive-jhb100.c    |  74 ++++++++++
 include/soc/starfive/reset-starfive-jh71x0.h  |  12 +-
 19 files changed, 498 insertions(+), 85 deletions(-)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c


base-commit: 59841a2d8757b951e8d93f92ffdfaa8c9503435f
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
