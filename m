Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58FDC3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GE6abpYA/xTAWkzpDQLpiTDtxdCCoN7gGuk+cYRP5To=; b=4fGN/qdLoCTGhG
	DiLxDj4UuFVOAhmFY1uhWTxZ47XZ3FYU3W0A7WFQT3K1z+4Izz+7OTX8mLLHCjXpV7zttMpJdLgQR
	IwWqOufrqo4Ab1jW3LnHixtxYU1SdgL15smaPi2IfrsW72/mYo2CqnN7E+Pt4iAkhZEKAcwJmwd4b
	PcxXfo0IwsmBV8l+xQWxTi+VG9KhvO2J7exs8PjYjmSdmPHmPDRCcgQ377SBF3JA0Ugr+ITykcWl5
	a4EN3QQKo91Y4gOxDjRLCzTmKvW31fMMnMeT7V7S0eLvy6Gyq+/43YTB2Pn3vd1rJdMVkOVrBmTE2
	iFISiO8Vdve/J3h21LTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqK6m-00000004zBs-0Co4;
	Mon, 16 Sep 2024 22:22:12 +0000
Received: from mail-eastasiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d401::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqK6i-00000004zA2-37Le
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 22:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxJiQU4lJxRmuvsoFGhgb09ErcaC3zHxfqlVEkGUO6JRCugWGNspT7u6proHaHzePFOy4gQQAvyY8Gd8nhxow02D4zOX//p+kfQb5BsBMVl2KoFwu2B4poaMArq60Wsr69gOchLvhtNranFkCSui6IG9idbm0UX/9UCRiLvxxNxqDxWgKiO47qF9+0PNYkoCjGij2+/hjkkP0PBLUn6oIhLwOsbn6yHuRIpC4iBhqvFTnO8y5VzpK3LprQqS2fINlnOmcxX7BS+iHRbBjl0vomgZGcks+qwrWZzbeekilOQSP4Pgd0Cj0rbRSNlNMZUXhivj3m6uPuMt29WJHAVT6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EHZzDJqAb8jp+F8MfhiOkiBZmAlRClaBFpPKa+YdtY=;
 b=qjXAwCP+vGhG8fVrWt7audCC6eA5uS0RO5tqjMpO/D7J+tUSo58mdy42NHcWzBIaR7Q5vXaBOJpe031n4/TDLuCrXtAaIE5gOPaTncIMxe/p7o1oFnRZ6pZyg0pHiGKZSHcZP3WbvX+QXEEcY/bYWB51rDUoWDpXpUazwm4r8WA39Y6uGM1ay+ydKZGQ88yKYVhp9HytSg7KMGEIGMt9yUPFsizb76HQ9xhgab7TuXi8kKXJewaIjH368ftywDupWDww6UMr6dhcAnOfJDc+sjCuOev6T/wyKpw5q3GEuVFBEwZHRGOuUuq5l9+a9l28ekcZ74wm33JtQlyL8Rt7Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EHZzDJqAb8jp+F8MfhiOkiBZmAlRClaBFpPKa+YdtY=;
 b=F3Vkrx6cahed1UdOY6AKEX9mW8WBfj9TfqNwTPem0pA6uWXZgtVuP/PneM3xXLkXf28wu/AlQ2cIwHrqkAlj5SXkYOYJDs4jbt85JOJW+CtkyxGeEaN5ZvEg0dtKt6RsUsA7tMwik8iupn5CN4r/tQVdXZjzNZSl0o9ScvMQgtgna17tq1SlMDLVPg6q91VEn1fleLu9l2Vkq2kh5k/UGr6dNXszkef9ATE4XxTrEo8hom0eLZZlOB51lshhYEq0lcovpj3dheDIJuX50Dfx0khRLQ1m5ygHZ0GcBnLpBw2AYJQcFiIolbzCyToxooE9xzmeajhpKIy15xbaCEqT0Q==
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12) by TYZPR01MB4847.apcprd01.prod.exchangelabs.com
 (2603:1096:400:285::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 22:21:50 +0000
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756]) by SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756%2]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 22:21:50 +0000
From: Haylen Chu <heylenay@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Subject: [PATCH v2 0/3] Add clock controller support for Spacemit K1
Date: Mon, 16 Sep 2024 22:20:57 +0000
Message-ID: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.46.0
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12)
X-Microsoft-Original-Message-ID: <20240916222057.43218-2-heylenay@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB4221:EE_|TYZPR01MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f002e5-137e-4723-4d03-08dcd69df55b
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|5062599005|37102599003|19110799003|5072599009|461199028|8060799006|1602099012|440099028|4302099013|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: gRTpZI4GjzW5vgU8oF9Fg6Cmq4a9lHbF3oLfw0qyVDw7/4jBoiQyLvBLmN9DxTfvCvcCT0SZm1EHbXumMdPpypIxjbWeIaYXWYfoz3Ty2xzJ302GN24XiN7No78f5Rgne1HbUkVll15S3TJvv5xLotMdkS+dPv8up3E6ME7M87yYSWvZ89kmR5q+98bc5kOU2H5L6XS/cuV2tMVdz/cGJccKr1K+lXmJfG6PwQT0g4GybH0laN4Vv1fY6456Ml85V7DzCMOUmd11GXiqf+4TsTKAJaUS4tuXHDnq5KkqFFKa7JyPgStoZyt1VNgJiPYMZYXJkp/HhzAbcLJ0WPlCt6XkbNWSTFFCK3pLWFngaaAo1NjTR2zybiMI6hPeVlB5HjiwmOkGimV+t2MbPb1HmNJLA+p6SuTnGfPEMoYo+yYEvrjJ530J6+yw6OrrhDNmGxV7X0jEZ90O53klS1YG/tqZQDhcA/qKONoMPJbFYqbZdNMjG58I64FO89jfRtgPCiMje/j/huUZaGLyUN/AvF925iNQkKYiG55E5+qwSIOPpHlkvATgtY6gGXZSC2iePi/yuStu9m9MPuLeyUN5H9CNC0d8G+p2AEu/hEHkosEz9v9xx69uQYIvSy3aLdPTfl5yIPrI0WHH6JNYPzUD1P0FLH9QtUfm89qzs4rvTaAxgtS2qw/zdaniYxlTjQ+uYu48tHKxfu+ZZX0qvTuvY/DeMV9lKR4b630Ir2+qbfy+oABFzpVcfbqGXEKqF6Gz5h7Y7I1R+ThLbx0XRl/Av1oK9xHVGOM/ZK9kw+hId4uvMxx+6osv00O0ERVQIp8f2hNPcKoapnsUhYEfryc3wONtKwkMvkLUFtLlwEXcESnMSJmIYoQjXlfzbGVNgB7/2zOxdvq2ZeKZBSrgJK3wEgGsM2d6qJz3OG4JWmB1oYY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ATes8BrCD5ZS62lHzYLkovgTlfVvhPIe/AqQrTShqwAzu8dhErjCF6yghRLC?=
 =?us-ascii?Q?tTUnaClxKZ2INmtLloI2bj3WLnaRpwt4uREZ0OdahpUjZLvEtntcF2TVgbT9?=
 =?us-ascii?Q?EPOu/JsAk7q2ZT/7RPDAWL93zfU1wkmJvG9s5KeGBwNYreeoTPbTwSNlKLsa?=
 =?us-ascii?Q?/APRe3vBYpjlGfMU1YA5/fkgg4uKIlNiSc8rCE8H8ygKAdMvEALEYBmC8XBv?=
 =?us-ascii?Q?SxTbgI94hF5bwHSbnOxfBqa0douxYLp5oCRfqd//xWa9N/I3fc4uofhmB1YR?=
 =?us-ascii?Q?bgA9Ao5hPTJUXeKjJm8Fwu1Ik6A6GAX66YoQpjT7X8R2Y+a2wQQWzbdBlrAG?=
 =?us-ascii?Q?ePzF8bNCmEEhNddKoFzPRqRxQoSsrNkZV0h2RRxXZ1o+TvydQF81BN83/Vn1?=
 =?us-ascii?Q?ejwKqVlhq/Sq5//i7AmSQqtPhC3DSdizYoHTFJjpYIz/fwKXIRzCNd+BGBsA?=
 =?us-ascii?Q?W4c9wb4VJI/cosfgtY/V5pvwYpjM1bUGX/0ucZcJL4bpv88BrszsKPF0b1Gh?=
 =?us-ascii?Q?f9+dGEA14pCdunSWp7mAWrgcmSb6iDVofFapp04El7gyNsebkwJWpDPNfTxF?=
 =?us-ascii?Q?jU6tBU8rUod8jdWMFuzYeWaSa7kqo6muWJrlLaCAb0Nw+Sj0hoWbQ3DarF4+?=
 =?us-ascii?Q?2doEeGhztDnt4jpc2oFnlXTKlH4MFLj48dPDPSdlsh7BjO/z7tRpCCLUsQrI?=
 =?us-ascii?Q?uuJy+9YSCNHfszj9cnzMGmlj6cA/Wzm2KHZjSw3CIW+zVFGSbtC5RZJ2Vovy?=
 =?us-ascii?Q?7J7T4YoPYoKOp4f1Vvu2FyW4Ux2gdbmv1PbJ56YJZqxKZ4/VS9MSMFQk1MQ1?=
 =?us-ascii?Q?KV84zSrzoyPMtKlfkWvach0RX9KP1nkyQam9vvwAn6YPNEBbA4i3WMTk95GE?=
 =?us-ascii?Q?021fPmQ+cwtF/prlL6H+NmtiCbCYEgDqQ4ERm67/dGBcLZRnP2KaO4srA0Iz?=
 =?us-ascii?Q?h+0WvaubDKrw4BD2axhvKwu47zNQEJqor7FYHU4yRswPtT4D9zWsFINDD+h5?=
 =?us-ascii?Q?IHpoyy2sglfGbWQpKd0ynxXpwlqt/05cBLVuAvhufICAD17yigkKuj9k2Gyf?=
 =?us-ascii?Q?Ng/JjoWW69XiN4HeIm67z32VOEWP6TYxbNU4C574Uile6Isrju0xm4S8fdMD?=
 =?us-ascii?Q?gnCNvuIOgd8c+SqTZVYWX8NGBq099sYuj6KltAOp++H8H0q3olpukc9KIP4f?=
 =?us-ascii?Q?htq0P57JYn40eHZLmYvSA8/uKC9z1An5HFRM45CUmJ2jyvvNFqkdMmKQGDw?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f002e5-137e-4723-4d03-08dcd69df55b
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB4221.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 22:21:49.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_152208_797737_3767D84D 
X-CRM114-Status: GOOD (  10.66  )
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

The clock tree of Spacemit K1 is managed by several independent
controllers in different SoC parts. In this series, all clock hardwares
in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
driver, CPU cores and UARTs could be brought up (see below). More clocks
will be implemented later soon.

No device tree changes are included since Spacemit K1 UART needs two
clocks to operate, but for now the driver gets only one. I would like to
defer the changes until this is resolved.

Tested on BananaPi-F3 board, a clock tree dump could be obtained here[1].

This series depends on
https://lore.kernel.org/all/20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org/

[1]: https://gist.github.com/heylenayy/425f4efff93b135f8b17584fa1d0f135

Link: https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb

Changed from v1
- add SoC prefix (k1)
- relicense dt-binding header
- misc fixes and style improvements for dt-binding
- document spacemit,k1-syscon
- implement all APBS, MPMU, APBC and APMU clocks
- code cleanup
- Link to v1: https://lore.kernel.org/all/SEYPR01MB4221B3178F5233EAB5149E41D7902@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Haylen Chu (3):
  dt-bindings: soc: spacemit: Add spacemit,k1-syscon
  dt-bindings: clock: spacemit: Add clock controllers of Spacemit K1 SoC
  clk: spacemit: Add clock support for Spacemit K1 SoC

 .../bindings/clock/spacemit,k1-ccu.yaml       |   71 +
 .../soc/spacemit/spacemit,k1-syscon.yaml      |   51 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/spacemit/Kconfig                  |   20 +
 drivers/clk/spacemit/Makefile                 |    5 +
 drivers/clk/spacemit/ccu-k1.c                 | 1341 +++++++++++++++++
 drivers/clk/spacemit/ccu_common.h             |   55 +
 drivers/clk/spacemit/ccu_ddn.c                |  166 ++
 drivers/clk/spacemit/ccu_ddn.h                |   82 +
 drivers/clk/spacemit/ccu_mix.c                |  336 +++++
 drivers/clk/spacemit/ccu_mix.h                |  348 +++++
 drivers/clk/spacemit/ccu_pll.c                |  226 +++
 drivers/clk/spacemit/ccu_pll.h                |   82 +
 include/dt-bindings/clock/spacemit,k1-ccu.h   |  198 +++
 15 files changed, 2983 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h


base-commit: 3d5f968a177d468cd13568ef901c5be84d83d32b
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
