Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA6FF55102
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+t4LkEmiJasPN+8d2AuCMtTke31HY4wLi2m0GIHWbc=; b=wjt2RjMPmmqvI/
	g2zKxpt0HlWu7dDxZU+oZvqOii1GAQ312BnWrNjqiE37hJPftSabR081jszVP20Q++xbgAWFrDvdj
	BIIqb9z1VWxeZfvmpPLwxnyKO0rgfiBrj+MRqzJzwQ2WH3IVe6YK6rxAI3T0p7d/pyJkojo4qncsb
	KSxpDBdMMN056siwW3Id5ZNFiMdG6qMeEIHTfSAZP9bi1+N2WfAJO1hfNj5fxvaun68JLTTu8Np/c
	Plv2D8nM2y5cQpfo/1CfksaNKzAZ46TtGYM0oKpyYd2yTRVI0p6pKxOMLNlDeISDWP6tKBSEAMYzU
	zQnZd4vZNpYjQl63sOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXP-00000005uFZ-1VZO;
	Sun, 08 Mar 2026 11:43:11 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzCXL-00000005uAU-2bnK;
	Sun, 08 Mar 2026 11:43:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHEXxeXJ4ACVCd5fCRUxtgDziAI4n0dsTXbk/si0N3zrZ9xb9pig0oLrB1QSvVBO579h8r5+kmUDPWElAh9Hvh63/S79yojaVS/oaPKkpZgmDBpBARW3B31Jlvq7O008DQakQp51RygvJDbfAaFjYOUPa5EzuKaz0RwJDSjIPMg/41OF7cFDrdtw421HR2c78KRCwngHMbFe7qPtLcHiWl/RQ+krD8DKsQ/n8Zp7LDfJ8+XCj2v8wTHs/OwQs0yYhXUYNElFNm11nQ+ztL0hmxJiphLLryDCrOnXsnj3LLUoCxYq80SdQFfo8hjJOlNObcGGIyAxPkbBehB1aPfpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ab3ARAUpx7fssS4qiZyZNKkg0dNFA1rk3Ias2WIwOk=;
 b=AfP8xnIB/6fvabmXH4QFSzkfqIPoBMpZXJJt3oNXIRWTw17Z4EwTT6a15TZXX+gctmoPhI7AGS4oN1Hu6765dw+HrNR82+ItNM3YgxLq79EuHllMXadEFJr/67KsxL3SgUhW83x8E9AOfb/97biqSH6aoymEQtZ4kgHx/RWGy+0Xt+U2MsKlCkoYisgpgflR+Tldm3QRKP7NqiR+p2VrMOINgYBuFbDdBpqHUfNWeT4n8xlL0KVufFQMa4tp3CEItY2Dt4+SvHlzzL8Fwr/e9MPHvpwxkNwhJk2eEv1RJBWRKNt15wwse+WQi/eLewiJkYe9ry1u7c9FsF4/3dIEaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ab3ARAUpx7fssS4qiZyZNKkg0dNFA1rk3Ias2WIwOk=;
 b=Qx8np9pEglrpF2sMtvCnA+QFtvhKC7PTPEYwwzTFSJ7exNyl/fvGav3ORa+n4iSpW1etyZrDz01JksZ8PsIazo1cpPyL39gZBqGydap5ZULUwaolvJTw9AwGRpzsJfwa80tG0tMISBAehVUB3eDg4txb3wge3wje/ijI6x/hTgshtLaF0ejDg2LxJnVTtExObuKZGS7AS5zdQ4KlrkS4DcAuRxVxHCaxzTZ1LBVxtOAlkJyfpKIeWIAS+oN2HwHCtIslNu5ExoY4Nbp8GEbJBSg1VEzZaD+cPTC9qE1M3kKDNkaKSyP11ExblkJfvnqLF1+Vs0cXEABfOfO8J++xgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by DB9PR04MB12426.eurprd04.prod.outlook.com (2603:10a6:10:614::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.23; Sun, 8 Mar
 2026 11:42:59 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.023; Sun, 8 Mar 2026
 11:42:59 +0000
From: vladimir.oltean@nxp.com
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: [PATCH v2 phy-next 02/24] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Sun,  8 Mar 2026 13:39:47 +0200
Message-ID: <20260308114009.2546587-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
References: <20260308114009.2546587-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|DB9PR04MB12426:EE_
X-MS-Office365-Filtering-Correlation-Id: a64f8eaa-0de0-42be-a53d-08de7d07d921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: rMTJBrfrgCL4EMeg/HBFsYmPZMqtvizJDD0PymEIBTtktRUQFLeW/1JwqFObrWyuHXshtWoQbv1949kRjtkhMZQI3gB/Xr2wykQ3uPY1hOs5rcF0wi1HEDBJ/sygc65/2MVU7VfHGD0qdbyvCuFErc6KvQCrHpBVT7h56l6GTC0nToFMTsYSeEcRsFG8B1tHiZ2KT2t05TYb4lhbTDGhUoFA8AaDWyeLF5RsWGzrSaWI70XyF+gDRufZOEnQo+cckzAMNVULshYgzLSdXSZtvkFxzsRjEP6LpDpcf5oRE2G/Uvl+eWUwM20KliqYyYIyojTi0a9CGpu+X3gxGgiQODA1lbgg14KfdOTLryWHhHfVTPjBFDpvvOwcnDS30zbAbOaUSg2EPlWZx2Jpq6hR4w/Ua+CB5+PCj/QBKPweGMoPtvLyKPzTlgoRv95CDF56fsVGjzVR8IHEQTaXp+Jhx5YcDXQWo/FUdTebgGPMzpvhpRemKcu6dXXFxpysr6qX8Yqb8p3Z4YutL+6DZfkVrwYgV9lQ5FllzVVg39g6G22O3c59PBQf0Vg9B3kmc900eXFIzY42nYdJgLWG3D21AhJIc0PiotBcvLOuQfB0MtZYHOtsQ9dHhowCVm0NXzwHiLzHXE3ntdYKisawcC0myY37RRHgNl/5nTRG0zQ0tzhSUC1oXCIWAX8zp6598Z6Je80gRF/sAZbsdWGifaO1Kq4SoMEDM49Oz5kzSyJgJ24=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxxdUdxVzJNRVN2ZzZDUVg5TVM3SlNPUDZ0MUptUysvMzZWaWtUblBRbkR4?=
 =?utf-8?B?SUNqU0cwem5zbGdwaGNkZ0graEd5bVk1NnZnampkOHgzcW0yaFJwUzdxTUpr?=
 =?utf-8?B?WlVGdkplZEF6Ym9SZGpnK2xUZU1Fczc5WFZ4NjdTTEtpNUkzaVdGQSs1UWJL?=
 =?utf-8?B?TUNZQ1NiZTFrZUZQQjNzVGsxUGQ3M2pFdkhjUEdPLzU1RXdFcHFLMUVVWUpW?=
 =?utf-8?B?Ym4zamFxeU1zVmNsbVpvc2NzZEl2L1BmOGM4NnJnOHg3M0NleGQvVmNmaUVh?=
 =?utf-8?B?L1NER0xRcFVMekM0c2c3Y3FDL2hDNllhMGlqTmxkUjU2RTJPSm5Cd2hISW5s?=
 =?utf-8?B?b1FFeE1xZ1JvZlZZbDNjNmFGUU9VVVFBRTF5U2w4U1NSR1F2c3NqTW9LcC9z?=
 =?utf-8?B?bHA2UW9Yek1NN3k1TmtRbWFMVm52T0hTczJ4c2tzdDQxcVpiazNhVFFBN3cv?=
 =?utf-8?B?eEQ1bXlxUDI4STJ1RmI1RHFFT1B0MTdkT29zTElOZlAzMTVaU1RTK3B6a0FT?=
 =?utf-8?B?SHlGcldqRDdnM3ZGUUpHMFovZUpCTEt1Z2s3MFNzTlF3TmtRSU94KytXekZp?=
 =?utf-8?B?YU1SMDh0YUIvdGJ3L0xFMUpBMUVKQ1dYRktHd3pOeU4xMWNPWXhtSko0NTRC?=
 =?utf-8?B?ODB4ZGl4M3dXNmtwOU0zbEc3UFhPOFU5MGZiOG5NTVFHU1g1ZzVvSHVnNUQr?=
 =?utf-8?B?eWVoL1pvN2xaaktlaHUrZVVrd2NIWFJOd2EwRmI4RXRWTGYrYWtDUm8ybTFV?=
 =?utf-8?B?N0dIZmNHWUZ6aXNSaEFjdjhZenFrSXplZndvS2RYUWdtaEFpdS9FNkNUZ0VX?=
 =?utf-8?B?MkJ2ZVBpS1gzMzVoNXh6VTVmTkF0WENCaVRjTkFJY1pOckNvVzJSZWE3eG5Y?=
 =?utf-8?B?cVBJQm0wZnFLVGVYTUxBUFVRQnV5dy85dDdBTDNJYWtVdGVUMDJ1ODNvME9R?=
 =?utf-8?B?QmZoQVg0VHpaM0lhaGNPamhBWEpGWWVEUEk5MTdSRTU0ZWJHNXB5UWhIalh6?=
 =?utf-8?B?d2lMbUF5a0lSK0JVUE9uOU12SU5jQ1JQcVFFQklQby9aV1Y4cDFHY1hLSDFR?=
 =?utf-8?B?M3BQbTh1dXdWNWRuRW1jUVcrQkdXN1lMUkRldDZBM2RTVWprbVRRVG9MY2V5?=
 =?utf-8?B?eTh5cnhWTm5iTTVpNEsxMzhHWUFmQlhlYWRRTzM5bVVOc21DTEpTWDBKaHR1?=
 =?utf-8?B?Q0FmQi9OWGtBb3ltR0duTjZpWWhqdy9SQlk2STV0MnJRczRCWGQyRmgzSVJk?=
 =?utf-8?B?aEgzS2Y0UnAwR0VNQUdNVDRMcGNZVTZka3FCT0hpVHJlRWplOC9yT3hzWlY3?=
 =?utf-8?B?aERLV2NsSWZGaHVrODVNVzlPalpmUFF6Rysrajl2K2JGcElvZEw1RUh5bVRY?=
 =?utf-8?B?Tk9kZVF4dUo0UE1mN1p1bmlHQ3F3Tk5MZzY0VVZReXMxeUlqZ0JCWDlJb3Jv?=
 =?utf-8?B?OXFqb0h1WkNzT3ludlhuZURDV25qbkd5NEdwdU9lZVpudzlQQU1CakJPb1pE?=
 =?utf-8?B?US9tZFFnbUZJZExrTElveGZKdVdadWhDMWZpNjVCaWdKTkpiczJrWmFxZVNF?=
 =?utf-8?B?eExtaVFMTytsWVF2NnZkRFlVYnRVZHY3alpNNEV6WEF5Y1F6UWdsdW14NFpF?=
 =?utf-8?B?NVFZVi8yRlRNTmZCR3BRdHQ0eEIvNW5zNlRwdlBPWm1DZ09MOHZwVm05Q216?=
 =?utf-8?B?eUxqMGRjbFFaQXZUbHUyYi80Qnd0MXZQN0RicGc5ME16czkyZDBmM2YwSGNL?=
 =?utf-8?B?T3BuZ2NCZ1dLRjRUWVM4MXRyRjhGMERPL2lzVmdyanJYTENXWjIzcG1hMUNa?=
 =?utf-8?B?aTNBRUxrRXo2aG9wTWdmT0QwckF4clNzQ0d3QlRPMm5nRDNvT1lDckFhcVRp?=
 =?utf-8?B?M1lScEQxdkNBcEp5aG1hMVlBaUM2VmIzMXo1aW9ldHZmb0dWVGl3aW5kTlAw?=
 =?utf-8?B?SEVtVDQ1UUx4QmhsZGJBT2REYUltbEljRzBoOElEaFMzUFFIdXpaOEgwRDlH?=
 =?utf-8?B?UklYTnJlRnNIb3ZCOGw3bVhmTEZyUGUwSUhmM0hYcnZ0bFdSNTYxQXNNTkRI?=
 =?utf-8?B?OE1zT3l2YmphNDE1SU83cU9wRUo4OFIyaHZnOFN4Z2xyOGFMbnQ2U2ZlQXpE?=
 =?utf-8?B?REJkZWRKcHdtRnkvL3ludG5jalZkWDdmR0ZiTVpTZE45L2FiVHBSbng0T01p?=
 =?utf-8?B?ZjRBbmRaWUhXV0U0Z1ZmYU9qZmxwMWswK25iVm56N2JQdTVYMHVRalBwUTh4?=
 =?utf-8?B?cXpTaVJVc3JHMnF2MXRTTG5COU1mTWduN1FNemYwaXJOYWUwVlNsNVF5VWU1?=
 =?utf-8?B?Wk1JSXJWVWxFYlVXUHE2ckNiSTRsckdMeWszQUFLMXhhTXBvTjRmcytTeUlv?=
 =?utf-8?Q?zl6xzG8kx0X0kT2sM/FzERGW6BNaFUzR0gL6d7tAiZYH9?=
X-MS-Exchange-AntiSpam-MessageData-1: 4iipieBFgp8rSE6KI24EHvdie9zmfgs+7IY=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64f8eaa-0de0-42be-a53d-08de7d07d921
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 11:42:59.5508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFUQVrqXOqVsbov+Zd2xTVbFJ1gpfuYtSo2bW6XPP0PsoxsfZTlsbrn8IDcujBnaAFGHtmXYrIq6tVPr5ED/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB12426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_044307_684853_A8304C50 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhlIHRlZ3JhIGFzIHdlbGwgYXMgYSBmZXcgZHdjIFBDSSBjb250cm9sbGVyIGRyaXZlcnMgdXNl
cyBQTSBydW50aW1lCm9wZXJhdGlvbnMgd2l0aG91dCBpbmNsdWRpbmcgdGhlIHJlcXVpcmVkIDxs
aW51eC9wbV9ydW50aW1lLmg+IGhlYWRlci4KClNpbWlsYXJseSwgcGNpZS1yb2NrY2hpcC1ob3N0
LCBwY2llLXN0YXJmaXZlIGFzIHdlbGwgYXMgYSBmZXcgZHdjIFBDSQpjb250cm9sbGVycyB1c2Ug
dGhlIHJlZ3VsYXRvciBjb25zdW1lciBBUEkgd2l0aG91dCBpbmNsdWRpbmcKPGxpbnV4L3JlZ3Vs
YXRvci9jb25zdW1lci5oPi4KCkl0IHNlZW1zIHRoZXNlIGZ1bmN0aW9uIHByb3RvdHlwZXMgd2Vy
ZSBpbmRpcmVjdGx5IHByb3ZpZGVkIGJ5CjxsaW51eC9waHkvcGh5Lmg+LCBtb3N0bHkgYnkgbWlz
dGFrZSAobm9uZSBvZiB0aGUgZnVuY3Rpb25zIGl0IGV4cG9ydHMKbmVlZCBpdCkuCgpCZWZvcmUg
dGhlIFBIWSBoZWFkZXIgY2FuIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGluY2x1ZGVzLCBtYWtlIHN1
cmUgdGhlClBDSSBjb250cm9sbGVyIGRyaXZlcnMgaW5jbHVkZSB3aGF0IHRoZXkgdXNlLgoKU2ln
bmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KQWNr
ZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Ci0tLQpDYzogTG9yZW56
byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ2M6ICJLcnp5c3p0b2YgV2lsY3p5
xYRza2kiIDxrd2lsY3p5bnNraUBrZXJuZWwub3JnPgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFt
IDxtYW5pQGtlcm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzog
Qmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxo
ZWlrb0BzbnRlY2guZGU+CkNjOiBTaGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPgpDYzog
WWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNv
bT4KQ2M6IFNoYXduIExpbiA8c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogS2V2aW4gWGll
IDxrZXZpbi54aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnYxLT52MjogY29sbGVjdCB0YWcsIGFkanVz
dCBjb21taXQgdGl0bGUKLS0tCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3Rv
bmUuYyAgICAgfCAxICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2No
aXAuYyB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1oaXN0Yi5jICAgICAg
IHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYyAgICAgfCAx
ICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3BhY2VtaXQtazEuYyB8IDIgKysK
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYyAgICB8IDEgKwogZHJp
dmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYyAgICAgICAgICAgIHwgMSArCiBkcml2ZXJz
L3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jICAgfCAxICsKIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMgICB8IDEgKwogOSBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWtleXN0b25lLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3Rv
bmUuYwppbmRleCAyMGZhNGRhZGI4MmEuLjY0MmU0YzQ1ZWVmYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMKKysrIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxs
aW51eC9vZl9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291cmNlLmg+CiAjaW5j
bHVkZSA8bGludXgvc2lnbmFsLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWR3LXJvY2tjaGlwLmMKaW5kZXggNWIxN2RhNjMxNTFkLi5lMDA3OWVjMTA4YWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYworKysgYi9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKQEAgLTIxLDYgKzIx
LDcgQEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZv
cm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgv
cmVndWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KIAogI2luY2x1
ZGUgIi4uLy4uL3BjaS5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1oaXN0Yi5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1oaXN0Yi5jCmlu
ZGV4IGE1MjA3MTU4OTM3Ny4uNDMyYTU0YzViZmNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1oaXN0Yi5jCkBAIC0xOCw2ICsxOCw3IEBACiAjaW5jbHVkZSA8bGludXgvcGNpLmg+
CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUg
PGxpbnV4L3Jlc291cmNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KIApkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMgYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLXFjb20tZXAuYwppbmRleCAxODQ2MGYwMWIyYzYuLmU0MTcx
MjJkYTUxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29t
LWVwLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1xY29tLWVwLmMKQEAg
LTE5LDYgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fZG9tYWluLmg+CisjaW5j
bHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0LWsxLmMKaW5kZXggYmUyMGE1MjAy
NTViLi5kYmVjMTU5ZmQ0NTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtc3BhY2VtaXQtazEuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LXNwYWNlbWl0LWsxLmMKQEAgLTE1LDcgKzE1LDkgQEAKICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2
aWNldGFibGUuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5o
PgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jCmluZGV4IDA2NTcxZDgw
NmFiMy4uMzM3OGE4OTU4MGFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLXRlZ3JhMTk0LmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS10
ZWdyYTE5NC5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jh
bmRvbS5oPgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUg
PGxpbnV4L3Jlc2V0Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVzb3VyY2UuaD4KICNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVn
cmEuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpLXRlZ3JhLmMKaW5kZXggNTEyMzA5NzYz
ZDFmLi5hMmMxNjYyYjZlODEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNp
LXRlZ3JhLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYwpAQCAtMzYs
NiArMzYsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9w
aW5jdHJsL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cisj
aW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAj
aW5jbHVkZSA8bGludXgvc2l6ZXMuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jIGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wY2llLXJvY2tjaGlwLWhvc3QuYwppbmRleCBlZTE4MjJjYTAxZGIu
LjQ2YWRiNDU4MmZjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLXJv
Y2tjaGlwLWhvc3QuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAt
aG9zdC5jCkBAIC0yNCw2ICsyNCw3IEBACiAjaW5jbHVkZSA8bGludXgvb2ZfcGNpLmg+CiAjaW5j
bHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
PgorI2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogCiAjaW5jbHVkZSAiLi4v
cGNpLmgiCiAjaW5jbHVkZSAicGNpZS1yb2NrY2hpcC5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMKaW5kZXggMjk4MDM2YzNlN2Y5Li4yMjM0NGNjYTE2N2Ig
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMK
KysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYwpAQCAtMjEs
NiArMjEsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogI2luY2x1ZGUg
PGxpbnV4L3BtX3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KKyNpbmNsdWRl
IDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNldC5oPgog
I2luY2x1ZGUgIi4uLy4uL3BjaS5oIgogCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
