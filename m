Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDC8C47BD0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CiNIhze/WjC1PJMG8KrecWaI9fOiCQ+I50BXN9QWHxo=; b=eA0jsaLzMMKsPs
	f6LQ39stUvBHDAR68AqORM5DodiKQ4O4Cxw8CMnbv1V0KjTEZgn2tI+2pVLkCDqFlaH5VNk0OYDAX
	26FvWnLLOR6/3B1ue42vLU6xwOuEm9o8y0E0iyvtu+XovRtxkQ1ha3a2+K+2uiSitt4y74V0XzB0z
	I8RUCOfnv4sH3FZiHj5Lj4foM494zBL0QzqevEkWE/r6Ob3BP1Sulh7o1M+0aWzhgjg6Ggj17yCoh
	MH6K6lDD/s8CONSFiDZZxjq2FCeH90W/T0iGxjjIfaGwWHBmb5j3XDx/SSQovNNSbBCxZm8m0+ZSm
	KnwnXqHN89VWDAKfkHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3GZ-0000000ChLN-1Jmy;
	Tue, 06 Jan 2026 09:22:15 +0000
Received: from mail-sh0chn02on20710.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::710] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3GU-0000000ChKN-33VZ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 09:22:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9K4eOV2qQENw43ZebF+y0tueZqV/+htWTzqU1a7+Y37rmE783hfOfPKbuXSpim98w+RnaH5JMmTGzQAY9rE9KcPMcNilqR8qL39wr4tpydFGiaoxVYqjdKfU4vpfuSewpVSdl89HndVQ2ATeLT+Aj4XmEbrQ4vvmwslB6cjYJPTcK3xiWYD1XlyWFhotvoYVOpWL7ORAKOxRcknKmxkLBY53EvoJxDnp3ONGe3pkXoVRJCK8HyEvB+uvUs9fDoAaWEsb4uac54AljcnUhcJ0Y9RphI+x+mW+NhUFBekbqWrfltRsPh4IX7Q27zYNAqcYzMzqcoSuyvwB4+yuo+Qlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mx4a/gbKKYunwkMFr318mqjBBcv1wtBwfAheyunm9g=;
 b=STiVPsPUM/QtUCwjLJh2xw6a2dklCYQ91fZFSzPzBW1W1SUaMar6lPQlaj64s7db2HGyPt+UyEhsQJvnhQO7QF7glGakcnxGythbliO95NGQ0ZkF5Y5k+E9z8ATT8HTGn4wSrTUI6m2cZ2OVXAROp/YiRDOidI1ybDZasW8E03WPpJqzPNqskUqoUiQocjizOvOy74HvY3E8Gw1aenJ6xlwIl3lX2v0QAvi3yMahdPX5Kn1XpDImSmdEXaXO1aWXGeLfMhC2V2qcFezTtqe6zsDchO3Tq+v0yUrMD7cc4D/0VOj9hOXriTMCSgd1VjaXy/HZMy2cHXfo4W6YDRtUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0730.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 6 Jan
 2026 09:21:51 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%4]) with mapi id 15.20.9388.011; Tue, 6 Jan 2026
 09:21:51 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: rahul@summations.net,
	anup@brainfault.org,
	joshua.yeong@starfivetech.com,
	leyfoon.tan@starfivetech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	sboyd@kernel.org,
	jms@oss.tenstorrent.com,
	darshan.prajapati@einfochips.com,
	charlie@rivosinc.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	cyy@cyyself.name,
	jassisinghbrar@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/5] RISC-V: RPMI performance service bindings and cpufreq support
Date: Tue,  6 Jan 2026 17:21:11 +0800
Message-ID: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0730:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf1db45-bfd3-4be3-140e-08de4d050613
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: gGjudrLWYay1vRm790w3APJqxwUbzV2NZfc6iGerBD1oQICdiidYjn6mpr6amcCa1j8JYij+aibpKfGVByGZn10rQ6zBiJ+EE9x2Arxv8M1uCxNWLNEwBDyQX7P6+BRsqtjOsWWFAU+mm3DC6z8hIQEScBh8/5p0U0HX9uXbYdEJosbqxmRp93e033kL9PRwS+H9l6FAHp686Iw/u+5hI30ZHbo7+jI3Zw2108oQmGqVH9lWvCKZZ48TIYlfs/l5vTMJ7wgSWyJfMh8DcUkSl4xAtlygdPzY3Xw7GG1/NKdyvgxequRP8qkackFF1xUGmWPNCB+Jmj+ctNzxdF7Kvxr5YwLRSioqovNHK3pbT/4doSP6HLSVTn6TkvPfGh6RNAWgCLSSIKkKowGpKGfWrxSZITXf+SOYfJHkEx6WYYZoVVd+3NU7BgKWSGYF3b6dnLdDoXp4Q6RlLtTiyDHGJ7toVXTUg6Uuv/sJ6tJN5FKvA2JRxtqud7iulDasFlDiMO1VtzhgtOEdZ30dfdkYKmiJYVUbl8AcqrlDkQlJ3pTMWJ9dmHx7YPM8s87/BP84C5wstF4d8WGFNq5RwioVCE94IXjsd2hfngPEgXhsjZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zW2xF39+7depYnoajeJwgafYMDBWvbL93J50NLVmQ6UDyq9wth26y05hvuOb?=
 =?us-ascii?Q?adWzP8Q9r6LLPv0CuO4z/yj0ON/AcxnmUlVWJ65qe6fPsvDGfZsY7ib4RUyR?=
 =?us-ascii?Q?QK8hUCiS9hmZ3l/HLk0M+NXLs6M0CI/X06BPV5FQmSLgd7L8hfdShz0Hu3J/?=
 =?us-ascii?Q?VRP2j63dJVvgaAZNMgvnLwjRZw2fJQ+4L11i5fztcfD0T5ZzXr3kyYkd0hZi?=
 =?us-ascii?Q?8L0etEULpqaj5CWs/xXbwOlQN+iFetogUlk9hLXZbW9cGcz78bS42JhM4k/e?=
 =?us-ascii?Q?gQPPg8ZY7SeAN3UxDQk8+VxRphPe9RuxjhKFSZ98W/MQnV5SF2cacPRaSxmv?=
 =?us-ascii?Q?F/oY9RJaYfpKBfVVifM0EYG5gOKkoKCECBI/UIYbbuIGBgLTki95JKDWKcQ2?=
 =?us-ascii?Q?z15fW5x+4SIad8M6ihCImwWGNT73UzRLd6DoXlGEn4X6GK2a9GFq43lb/pU5?=
 =?us-ascii?Q?kqD+6wFzKmZk+QSSGFzFsP8VLfqhYAqayZEbTsVttfw8MKpjK5nFvIWOKy9T?=
 =?us-ascii?Q?Ce7u/MhkZGL6/Li70J0fzTL5c5lgswqJQM+Yk73//D8qK8F9Tj0fEQR5P/4y?=
 =?us-ascii?Q?2ow83Qq5sAgyxO0jxHM8gouoT62DI5srYRtuWeR+ggs9vWKJpAfhmo+omzfN?=
 =?us-ascii?Q?sqfyeudOdNa3U9olr7EHrxohIIlAy8jaCz2Xet9EmK4jjJVIai9Y3Gv1X6I1?=
 =?us-ascii?Q?EILg4oi9eSHlp5EIxpmYYkoovS2pkupc0xHWqD8Cc7/4gBrgcgWRLA9oQVR3?=
 =?us-ascii?Q?jF+4Cgn28Xn/a7tubx+gDbb4hormI6PxoSVnG63zEOI3s+7e08T1D++RDwf+?=
 =?us-ascii?Q?txYfU/RQDexfgcLNXpYx/Ce/LaaZCGRIRAEy9FD+G6VT7FJ7UxFvZJBdZiG+?=
 =?us-ascii?Q?3CdwAnrzSd58UCvQ8pH85yXQioAV2vqrS2Npg1IPtlzwAMOO5v6gLXbX36nS?=
 =?us-ascii?Q?397jQEylBTovvQB03Qfcb9R+izbR+ZX0/t737yCZtVLOMcAlvz+1Az+8GmrV?=
 =?us-ascii?Q?+yzER+rvu0sYbd1Cnvh1v3s5G2S6EYDQJNRuxF05pMYZDtzClM8sGVpvPP/+?=
 =?us-ascii?Q?UzRpE8hqxbtQFZ3MLlt9P0aYLWvpzowFFff/pUlB5aXcW9hqR/cejT03Hpkk?=
 =?us-ascii?Q?ONy7IxTYnxyIYHUmh2sVkY98MbMDZ2InY1QlZKvbq9QFY9JaZsOOq5OyO+Ll?=
 =?us-ascii?Q?D6u/B5tTnRSDFOIPDm9l1sekiykhG69eOElcG2SBh/uag9RbuO9B49vwgYVm?=
 =?us-ascii?Q?mdAxGGeSO6kDlu7RETYM8ZsVIxW/EFvxVTky7aZVl0/icuSlS1suKgFu7QbE?=
 =?us-ascii?Q?TpWJYDTVCwLwLpClckOar0xgrFe1DsHvK2SeE6jl9G+K12RSSb5M637Mtef+?=
 =?us-ascii?Q?Ka1ZHDgmB3d/Bd5/nQsscfwMTGquGK3Cdnxk7K6s56qDfBaCUCj7DuumZlDm?=
 =?us-ascii?Q?AM4SYLG/yPqTFziW1DlxE1qcY3MOkXE0b1PbbWclYfdrwUdn3AbFQWPPs8oH?=
 =?us-ascii?Q?xy3G4bijhijOurjA8HNiDKeg8yxO2goXWkscsBSoHyf/xN2ViuqO/Kr2QyLe?=
 =?us-ascii?Q?uQdNr4lgRT/zI6PWnfRyi4/jQi2LJleM1Ubw8eSiol8MAlEQJSaaq+OvQXJr?=
 =?us-ascii?Q?NbeQVbfL3B5I8+K8QUH7724=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf1db45-bfd3-4be3-140e-08de4d050613
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:21:50.9143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMHAvGxbbXefbhPxtSMl4Y9wiUh9pIoBItxVxNcXTb26giuRc+NR9WY7w8E0nAJKfndeOGQhY+LHqsjrOWgdYhETIYrGO3x8tJ0sz+xDkto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012211_815513_67FFD767 
X-CRM114-Status: GOOD (  11.95  )
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

This patch series introduces support for the RISC-V RPMI (RISC-V Platform
Management Interface) performance service, covering both Device Tree bindings
and a corresponding cpufreq driver.

The first part of the series adds YAML bindings to describe the RPMI performance
service as provided by platform firmware, as well as the supervisor-level
controller interface exposed to the operating system. The bindings also document
how CPU nodes reference performance domains managed by RPMI.

The final patch builds on these definitions by introducing a cpufreq driver that
leverages the RPMI performance service to manage CPU frequency scaling on RISC-V
systems. The driver supports RPMI access through SBI-based transport mechanisms
as well as dedicated supervisor-mode transports.

RPMI specification reference [1] and [2]

Test Environment is as follows:
https://github.com/yeongjoshua/linux/tree/v6.19-rc4/rpmi-performance
https://github.com/riscv-software-src/opensbi
https://github.com/yeongjoshua/qemu/tree/rpmi-dev-upstream

Use '-M virt -M rpmi=true' when running qemu

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[2] https://github.com/riscv-non-isa/riscv-rpmi/releases

Joshua Yeong (5):
  dt-bindings: firmware: Add RPMI performance service message proxy
    bindings
  dt-bindings: firmware: Add RPMI performance service bindings
  dt-bindings: riscv: cpus: document performance-domains property
  cpufreq: Add cpufreq driver for the RISC-V RPMI performance service
    group
  MAINTAINERS: Add RISC-V RPMI performance service group

 .../firmware/riscv,rpmi-mpxy-performance.yaml |  65 ++
 .../firmware/riscv,rpmi-performance.yaml      |  62 ++
 .../devicetree/bindings/riscv/cpus.yaml       |   7 +
 MAINTAINERS                                   |   4 +
 drivers/cpufreq/Kconfig                       |  26 +-
 drivers/cpufreq/Makefile                      |   6 +-
 drivers/cpufreq/riscv-rpmi-cpufreq.c          | 976 ++++++++++++++++++
 include/linux/mailbox/riscv-rpmi-message.h    |  16 +
 8 files changed, 1155 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/riscv,rpmi-mpxy-performance.yaml
 create mode 100644 Documentation/devicetree/bindings/firmware/riscv,rpmi-performance.yaml
 create mode 100644 drivers/cpufreq/riscv-rpmi-cpufreq.c

--
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
