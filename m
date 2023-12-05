Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7188C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 11:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pl00a9gb14+yZAXzB62MPfsl/CdJPAx1hpptOilxWzQ=; b=ydE75baPdrnC02
	ivNTPqv3vEpkwJPDez+Gpzgx8EdhOkqX9m4v2cEMgce04V0kfyGOXNSsTcSKLtpf8qeqtPd5ubvVq
	enp3YYI7CMg5u6F3V3FXeDQOCixCKR162pnruA+sOhBeiDK2vAIfxPERlVJp7OVyQxwrLIz04ZtbU
	9FjCfrM/Tn/iVB2n+Wh11i/d8TwUBPZDpqozbxVdO4YfcpVppnlELEhIjHcFWW7l2AK1FeXnsSUv+
	rA5p4GYWh8MSYqxWIA7Den76JjtFU9K2ts3alLy8JdWy3K7QXIp64AKQ+l38DKR5KtGF/z7zXEGVN
	ZM2vlfzZus7F2l+GF+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAU1N-007Jqo-0V;
	Tue, 05 Dec 2023 11:55:25 +0000
Received: from mail-mw2nam04acsn20806.outbound.protection.outlook.com ([2a01:111:f400:7e8c::806] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAU1J-007Jjs-2l
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 11:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emU6CPN7SGLAvnIJY7+opT0dgLx3i66845I5qPI3aMsZlHtY8/7UNF/uba+wIaz+dauaBaHO+D3g4fPHxV7x2jzfPlle/wRCP13r6B0RgN2gakm5mJZxQNaosKcMvdHB+JNm+BsBLpR/XGukiMRDjG1hRTlIWzYoK+pRjYWncH/1IjFpVG+Q9QdsTgFxoJopEdi2AUhQ6rvYJZPkbUlUWDWDS6Api5gH8+zoERCoYC8F5++79Z5EhdjxCSSKLLs6y03V6FgVeczLGUSOGGgHUetUNNbiiYE2lw81iwVE36oyvq6hoTUoRNzh6enDSL5rg3appxbA2YYBfEBjf8eGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC/QrhbBMcoEvLnbnKD4UeqJbZk0U3USV2Yefi6xk7A=;
 b=j4KYgh2a1be4JV+kKJ4253tzq3uzkGur37T8rZjhVKG95GfZx9gjmr0HdHVy6/mpjX6x1/66bsXceABI5f4kKCttXsxDhetJy6IwBGSorUOS4r0LVWr+fw29hH4VpKiZeNbPfokdNwcEC96KB8ziORBCAxtniH3y/hgj9BDhUmUnboH/PUeF3kSgJEfEMYNfICjgYRa73zUrxL8HpG9ZNbCrFAXy15JDzp2Mg4Q+jLMPkmkgVjWMu5e46qgREDPzkt0bM6Aor7UZNnh5bJLByOwTCubXWc6Lgfj73diVlL2m1umRZ3KGQ+oqUTxyhMnOt7CR3DYsFLLGiLBOJoAz8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC/QrhbBMcoEvLnbnKD4UeqJbZk0U3USV2Yefi6xk7A=;
 b=XuI7GkRBHrvbcVb2or+l/5EAJpcukE9zt+f8xwyoi5kUCLZ3+4En4SexwYOrCE3B6qvzJmJm8dqDuJIqRiyDTKeyEOMjzvodGjp965po1Wjxkss7HJWaA4tgriOnF7PO1XvVXpZqc3V/7lni93vBDgOYbG7PduqEDrWswKNc4wG6TlUyT54sPRl2vnse+wE3jvMJCbCW35yrnONRph6xoEiU4MCjE7Ea1Jst5DS5Ux0ei47pEJfIK4y3GajUnD3Pn4o/0u+ePLO5YLJgu3ioleptHHO/KZY44BxYLsf1F6cQczD7if7B5TOsjtz8Eg1HemKravexY+BI8aAc023LFQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7005.namprd20.prod.outlook.com (2603:10b6:408:1e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 11:55:09 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7046.024; Tue, 5 Dec 2023
 11:55:09 +0000
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
Subject: [PATCH v2 0/4] riscv: sophgo: add clock support for Sophgo CV1800 SoCs
Date: Tue,  5 Dec 2023 19:55:01 +0800
Message-ID: <IA1PR20MB49532E1A3D8BA71FDBB444BCBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
X-TMN: [QZ0Le7tpsbUO5lorP6Hsi4Erkz8FEmc2CE85TtP/RTM=]
X-ClientProxiedBy: SJ0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::34) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231205115503.1040233-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: ac058f9e-0e2a-4bf9-cf1d-08dbf589076d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2/EI4JvYQ1970VHiPihVnYgtf3UZU8ETTlRdVAVl9MauZOg9Tx4bqQ+IQ/hArL6PFsNSKo63B2zm6sBngD9lRHGU5klf1MmPyV7dz8MW5NWa4OBMHvLoHdWML5cDYBoYSaXLbtR8aCfjb4PZI6nJQC3WQT2j82tRigsYJ81Y0cx2J8Bq/kq1v2u2cfB1L6BTElMfQeJrXUPVSibD8+xnhNQ/mfSMmQ7UfZpdDCIHFfdgxKyHYF/YraKVccROEh+FQfXl42N6MKx2FTcFku4F60hyFrE9a/SAdomPMQXww2ZvTa47y6gHaGdNy7PbcvZdG9dE1eDg7CcuSLc9nie9Gy9KNKnN71Qe6To/48AgNimf49/MPtip7o56/P/F2J6CgUS5OETGFrBQPnC2sK73r7FrvGN11a11UScli0FMNqLEe2ZsCNYlcSH72V2uWgLrVXi9gla2sky8WQjzUBYyvbdi5yQCImva8gZe5JDY7fT2hmBznkc1dIKESMxa4tPHwclnbvwMfKtPfNULgEbQlU/mQ0KWrQPzJnw/n7ElcDFaOIZHIIy6DMAZ+s/9TlMN2MMuGyuCO1a2XBpTnO3euIzXMFF4oxzfryi16QXn0gxxiiFP+vvwMWEJtRQRCfw9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PlnUWuCp5mO7xc2OqcNXE/4bwzXdSuB5RYOv2+hLlMoN7+klgm0AZJVj+3a1?=
 =?us-ascii?Q?nxqUZ1rs+BItAMY8YNTwPcAROCXjPpAHgnGfsAgzZZwu5PXBmAlmRWoO7pkh?=
 =?us-ascii?Q?OCgtmKtT8UzvOXAXzd4TH/ESLhB0wxvnZPvYN8bpQQj8vUwaE003EGVHTv+Y?=
 =?us-ascii?Q?b3q1H7S9ifYGqflG5X2NjjuX2plgP6gtcUWPICXtXtcXNn6b3rfH8SFZbSEp?=
 =?us-ascii?Q?c2b6Asq6b9nLScNneGh2baV1Wpim6X1xf9z5iiuCXUM5W7CMDKIHLym3BQVp?=
 =?us-ascii?Q?e2gI3VtLHqYhKVbeB/TnL15TnzwzGIgc4zXgD+Gof3lD0ZydDhH6mxe9qDwj?=
 =?us-ascii?Q?5umdc9A1Ob0kSzgcglN5r3/mz1CguSFN4D7wc0jw6v7Zyj/Zzq25/qWxbSBs?=
 =?us-ascii?Q?J7PTI4YMlWk+fyC9IhFD1m4BJTBeyhpBruF5nAlnAM+STjbIxUz7YtH0LoyW?=
 =?us-ascii?Q?AwZUws1C4PjNklTYsPPc8m6nF2RJxeLvmE67FLIjeAVEWbQ0CG9AXIk6VB5T?=
 =?us-ascii?Q?/jGiYms4dSE9BsmIdDHLIr1cklWg/8zhE13C7FGny88TPnCeK4gpYnmAbI+H?=
 =?us-ascii?Q?h71lmv1QKWW9usLf11FU2vg2HyKyvjBadDlDcNoCEFwsILKBramUps8leSx7?=
 =?us-ascii?Q?P4HC0tLR4heUIuycdb9ljSY8iXjLeTW6dcwA5ma0uLr6CueX77lAAMYDx6Ju?=
 =?us-ascii?Q?X0X9i5jgsgqkdlK9HkiTBYU4Ae5m9q3IfI0VUper64yzvDPxhyPkmDU9a3Ow?=
 =?us-ascii?Q?7IaGxkBqHHBVhaOt+unsr6E88jR9npuvUufL6oeiH9YH6fxdey2BNzXYrXSi?=
 =?us-ascii?Q?XfSqNP9exHrqCmC7ngKS1l8YrschK0Vaj4Wpl/tiwLdltl7R3zU/jXUmWhRC?=
 =?us-ascii?Q?U2op4ZGTsi/Ybt9IU9Jlt1sdXrJu+K6x4DZ7+zEocsZIScLrGm/mffH4bnoH?=
 =?us-ascii?Q?EiZbzmYx0PDhbXOHAV3IbLFrhsU6QROh0M06P/8huDr6StIn5k0rgril15Wp?=
 =?us-ascii?Q?22SrBus+XEVTigy9WJy0/ZH2Z3s1A+WTBAuc0toJTX9yk13bZJD4IEb8wiOI?=
 =?us-ascii?Q?T49+iNcED7NeJ3oqlaj5/lIN/fkDOPu1AqVXTS36gOHaEeaCTChHYcjbVr5t?=
 =?us-ascii?Q?O9goEXHEJLMvHqx/agf2y5ALBcqZqvekAq1C83M48pq60K1RScOIQPtslzy1?=
 =?us-ascii?Q?3SJP/7/CSvUVu3PLi1T+7nJPqsJmhAGLZRI1KEs68RUbJNjgEJL9xMfKDEs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac058f9e-0e2a-4bf9-cf1d-08dbf589076d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 11:55:09.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_035521_920052_EB003D2A 
X-CRM114-Status: UNSURE (   8.27  )
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

This patch follow this patch series:
https://lore.kernel.org/all/IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed from v1:
1. fix license issues.

Inochi Amaoto (4):
  dt-bindings: clock: sophgo: Add clock controller of CV1800 series SoC
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
