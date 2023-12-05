Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C74C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aTdW7OVNUlDmdpg8p7yvocIJh71ARhRikWf5NMB/ZC0=; b=uULCNw6EdF/p5v
	yVF+NV4qPIEo6in6hqTjDnOSggltaO5RLe4a+Dl4LVdf0Ezj4DF0Z9rnJ7Hjg3jggnBHZn0y4pEf3
	HOUvEZjE6INz3HtFtXnPncdi4Om4yOALfQ0P00gmepZ5zRih90E74DwidL5OkWgp4L+6y2ZChbxam
	JMHH2Ylfw+3iQetH9JUK8g17mVB1z+qXZogdjB3Yf6ylkE87etsr4crM4oO/ED/fN22F+O6y6x3vN
	9hAQy+Kh7WfsEwLUjGrtgteZnAQB1bZ08v+EW5x/FH0ENZLS/3NNYkgILND6uHF3l4xylDSsGtRKs
	964VHwH1sOlW4F0Kf/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rARx4-006rQe-2y;
	Tue, 05 Dec 2023 09:42:50 +0000
Received: from mail-bn8nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f400:fe5b::800] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rARx2-006rPa-1O
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 09:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPBWltaPx3T60jZYLcO2c0vi/eohD2BjlW0wAjslBhubhTxoh29tg2OGOQj0xQoD6LHhpqoeU2W8aWnG4O+NPNN4svoR1FSnrLnvRpuyLf5e7jTe409WMCaYVgWmY7xXs/EhwibEhyRo/s9DHLgOU0W8jCDhOcMG8/mIHtJGZpDN4XHNHujxmik5IavMKlfGUBkMrODtpzC7oUst5au6XedCzEDGV2dJ1vYY6Qn8Wg2ogKqvAi5vPx11p1LJ3W63kS6pumr1pwxhkBEM16UPqvlMyeUaeLcXLakJeqWpr6X8rb0IeK7HDwyMoWgdMtp5rD6PxCRSkEcN3Y3HIylyAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyKTXoLRFa+pgkBFMuX0U/DX5U1Pvdkd0Moda5c8ve4=;
 b=YRiAWsRGHHYasz0ligew9nFeMpldsLO5DbomIk6f/Hv3t9+XuYZIyDS1vEqqAYK0feyYD9hqiR/TfOnBag98lAL+Q3HnrsaGybYKFqqCDNVLv7n3ZehdZ4j/nQuWhT2m9t+zfNqs5FSu3q3N4U0Z6c31RRy3fMeMaaKZregTuzo2ijxTZxchta3nJyNkGjXRhO0ptDhCyk9tY5dLxEhCmtdyWXybRl1Rp8kianTigr11yTmG8L4LAg3OS8ZNsoSxenwaCdqY21UUYkSLG51fEx2KBGCK09A82Mj6cvJrFwdXCKiLdOoB+drzkU/q1f0uQ+ca5qQk4x3FS1BW7cx8PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyKTXoLRFa+pgkBFMuX0U/DX5U1Pvdkd0Moda5c8ve4=;
 b=JusN/DczOgOEJ4nUjfzL/e0FupwseuYELus7SUzsOdQhfz/ppVlWJKgkN3UyIDoLVORJmFpMXz2LCw2VHfveGfKowoWmMs/OwhLxUM1QQbX8gz+1pt8OaEMd3Xp83pv5LLASpzHM4os0Npy1JUjpllLgtekWwkhP5h3UJIPMLwH6L9/Cxyz+yNLBQyjKgFOLlKBf65jc2PpctOlVQRTWth8L5F0dzR6YM0NnXw+6n0MNg5bvnb0sZ1b7Z1YtnQeOmf5FQsOzHXtTE06Dw2Bw58ctfrEF9YnhXaKSHr99Xlt5/YTYPYG9QVAJxGgYT5tpRkwMNDKUpyl0hYQ/rohadQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB5247.namprd20.prod.outlook.com (2603:10b6:806:25e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 09:42:41 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Tue, 5 Dec 2023
 09:42:41 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	qiujingbao.dlmu@gmail.com,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] riscv: sophgo: add clock support for Sophgo CV1800 SoCs
Date: Tue,  5 Dec 2023 17:42:30 +0800
Message-ID: <IA1PR20MB495382B725AFF6FC2C336BA6BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
X-TMN: [g7mMLR4qKkk/op8//Y8z28e1pmKbnJxMfJoI9g8aZ1k=]
X-ClientProxiedBy: TYAPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:404:28::30) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231205094231.943544-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB5247:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a254ba0-b03f-4d6c-91d3-08dbf576862d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a78+eworjdu5xTkdasuOljIqp1BnPOpBbxF9LYxPMB+ZmvgANdW5cnV56h1hPle/PAXaQwcV0Q40oXvQ/wBZ2qZTSoVZsZsWehoTMFGv8Nnj68xcEqfHNYsynRdd0XDbQB2yvy6exX5hnrIk6AQwEmDXie47aQSW+RPbVCKejapR4OWAMys1EI4YGaUKX9NU1z+8NyaNllP82svdJAfr26VEZU7eq/EtVP0OtD8+nMPGVfY+LICsO9PW3Eos3iElwHcFVIphWe2QKsY6GfkWx0yZRywTrtn+YjYCX97mVviLCm384POsogV0w0XOXMXJpXYZR8Fxb7i6XyBsQgpuqX4jXf6HAAEzEs0HJd1dSY+I1SJciIp32ddJYfG3U0zC6EHq8sO3yelupq89nrQLxBz+pzOMPcybjBge5KNCtTronG+raNugN5ftF5+nGsJCkzQm5yPuHzoR0mc7piyUZHeFG0xCDcVe42sIKs11cp2+qFFxp/poYMiTNiLTXK8IuEFX7rjCIAVsphqOc0HWPqTKDplZ1dkXkWspXstwnbTI7UpqASdPAS6LDyt4e7Vv9bvKEc8Z7BZX+WoTYTw0SBvrtgWIOU+2UH/u+DgOd9IMPJ9tNf7EHv57AQpyhfqP
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYSUAgliUxHamQhudkwWGjlaD2qB3WoXS7DZZ6xnDlfUqoXZ7nEtKI0lMRkX?=
 =?us-ascii?Q?LglhB6pVxIfGd2JkXsbrJdOMcxjS5UcPKk7NRZ1TVoTYtXs2vrB88WoN55ss?=
 =?us-ascii?Q?zjrpAL8mlVoc5+o81+JkHzAw9Gp0WEqrGBaIEXw3bqUKuBKguxmcr8bsD7yM?=
 =?us-ascii?Q?GzJdsn6heZnGDG8S1F4JksnMCOhbhxsiBGCbfc7DAa2+G2j12M/ozjTRqIoG?=
 =?us-ascii?Q?2+g3lvhSwrYBP0jqQYweVwG4SzOoXziW7DwC6Q3o8joCasfvKzOxprv/WTpo?=
 =?us-ascii?Q?Inen286JqIhwE61hE2V3ANUQEK7mPhoErx44CATgG+2CauLLIwZ6WxKVuGwK?=
 =?us-ascii?Q?FLXtHH8Cd7dDUnAfSDPk0bPTM3EXfWksRMBGjXeIGLoRg6/ElVpfrKNhWRmp?=
 =?us-ascii?Q?4WkzLjGbvFmZLEyZNF0quY0Wqrrj2jDCogESL2uT9R3pO3ddRpIGaxgKeqzI?=
 =?us-ascii?Q?OtG+Qv1A2vlZBHwAgBhNITZ19I/9pQtmEhBbEl2QY8gwin4vzTQIDbVji79C?=
 =?us-ascii?Q?5rzSTI3JnNcuCQav0VM8135A87L4A34Nelk+EsrMGDiOOzpqnXPCjSszjdvL?=
 =?us-ascii?Q?IU4XMeYSmZvLyCcmw178DokLRXcVfCjoaROCWIhwfzlZSFph+A8DuXy0MH95?=
 =?us-ascii?Q?yU37NmamdlLiLmUHVIzT/q9pkrZdZxy/NK+Y5QJQU8KThtu/qsKo1Gn7Yep/?=
 =?us-ascii?Q?43IciCwVz6Tj/SFGFY/KHW2/8nwnshJ++FrA6j21Oao5PVmat+f51/ayKsIc?=
 =?us-ascii?Q?xChKo5Va3CcnQijV7r7Xjcy3bN+pC6ztBNF6pz4S2HGeDVOe6Mho5xt0RNzw?=
 =?us-ascii?Q?SGgblqC7viuvaQt6aDtfCKzwrsqQCl1jTg6liHY6FDSAazDo266VoSFpmMrb?=
 =?us-ascii?Q?EYy68Bu2LhtSEo1SeTOFhrjItnIee1n7FQsIrWbFxnUkdxwTdCLTCcRyDPM7?=
 =?us-ascii?Q?OpeM0f39yUOv8TJI6bF8VXs8exjbjeBgRp9fpnGsH+zgzsVnywBo8Hj6eoDo?=
 =?us-ascii?Q?bFEcTWelwT/Ebo44ChiWZdSbKWfHzk0iSPAv22Fk/Q3ryDi+4sgy4ZgJIapy?=
 =?us-ascii?Q?/j/QdmPzDguSijXct6CrYOfwc+xw/6Gp3V3ig9WbJdclrc0bX+AjkYD0R1eV?=
 =?us-ascii?Q?TdPGFfdaOXx4atBJSWusNX10/oYOZojUaBOyIhG++ivGpaegwYXzdQzU5IP3?=
 =?us-ascii?Q?jEA6pEGseAFsEWOcabdwJbrNSBc/lsmo4vtpgPsZGULFyai2nTsEFMPuoko?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a254ba0-b03f-4d6c-91d3-08dbf576862d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 09:42:41.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB5247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_014248_472112_CCB5E7BB 
X-CRM114-Status: UNSURE (   7.89  )
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

Add clock controller support for the Sophgo CV1800B and CV1812H.

Inochi Amaoto (4):
  dt-bindings: clock: sophgo: Add CV1800 bindings
  clk: sophgo: Add CV1800 series clock controller driver
  riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC

 .../bindings/clock/sophgo,cv1800-clk.yaml     |   53 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |    4 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |    4 +
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |   28 +-
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/sophgo/Kconfig                    |    7 +
 drivers/clk/sophgo/Makefile                   |    7 +
 drivers/clk/sophgo/clk-cv1800.c               | 1548 +++++++++++++++++
 drivers/clk/sophgo/clk-cv1800.h               |  123 ++
 drivers/clk/sophgo/clk-cv18xx-common.c        |   76 +
 drivers/clk/sophgo/clk-cv18xx-common.h        |   85 +
 drivers/clk/sophgo/clk-cv18xx-ip.c            |  898 ++++++++++
 drivers/clk/sophgo/clk-cv18xx-ip.h            |  266 +++
 drivers/clk/sophgo/clk-cv18xx-pll.c           |  465 +++++
 drivers/clk/sophgo/clk-cv18xx-pll.h           |   79 +
 include/dt-bindings/clock/sophgo,cv1800.h     |  174 ++
 17 files changed, 3814 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,cv1800-clk.yaml
 create mode 100644 drivers/clk/sophgo/Kconfig
 create mode 100644 drivers/clk/sophgo/Makefile
 create mode 100644 drivers/clk/sophgo/clk-cv1800.c
 create mode 100644 drivers/clk/sophgo/clk-cv1800.h
 create mode 100644 drivers/clk/sophgo/clk-cv18xx-common.c
 create mode 100644 drivers/clk/sophgo/clk-cv18xx-common.h
 create mode 100644 drivers/clk/sophgo/clk-cv18xx-ip.c
 create mode 100644 drivers/clk/sophgo/clk-cv18xx-ip.h
 create mode 100644 drivers/clk/sophgo/clk-cv18xx-pll.c
 create mode 100644 drivers/clk/sophgo/clk-cv18xx-pll.h
 create mode 100644 include/dt-bindings/clock/sophgo,cv1800.h

--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
