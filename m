Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D25FCD3436
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 10:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQbzsy4lVsQV/Pml0tmWmMiJPRcaRKZI5412qlf/bKc=; b=jsEgMi+4UD92Ez
	HCDcBahNhi2NYIcrIlQwjnRgWQF35p6TweAWzaMEgTB0n4sxMhW9dGTwH4SDVqcQVfBEk207JchSE
	/mGQw1w2YNvX7qiBfy2xaoXdViDBnm9m+6m2zj/+S/D66cD9KfPqtFNBEuGszmotw63HiTTyQbiM2
	X9dzQu4PhwMOnRqglCZyWjS7rHTigBEq3NIBSRG78MRMF7FbI6ooJa/rIr42y3J69ytzhoEmsGmwS
	9yU+agk1ygDO7Zt7HRKrvo+pPu4Ft5uZgMAHOw459LC/VL2TQKWCKOjKQDnTBJE22JEsfMuEbMJ5D
	LZO/SzyiVkaz0k5i1Ccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCf1-0000000Fkax-3agZ;
	Tue, 05 May 2026 10:05:51 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCev-0000000FkQC-1JC3;
	Tue, 05 May 2026 10:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfLV3/hZd/wUxqA51R0IM4i3dBC/3nVSA3oSL2zKzZil9cmwJbtyMOb+8QdJA8JEqVc0ad9TuEGVNXHrCORp4KUZN+7NaNhs9bsHT1ice8DYP9bE6UUSzxqgB23o4bME7VtHPlxhwx/Na3vPRj9o6y2OAoHCBbCoA8cJH/v2VGPtKkc+Ccc4ux186WZfmHKTvdllyEi5I69xwJ0WVQl/r0rjFuRUNmJJJesscHx+2moz7lwk523w/sW+y3q0yLHl6HnwARNoFxogF+IOJamHg7T0IorSkkSXN1W2TfSB5vZx8Jp7g4K3UDoLo+MokLRji05E6NYF3PujBqjwE6qo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h88n+XTwigi2Yy2QhJ661l0nuu7DDirR9Z8PxEAYqaw=;
 b=Xos7kY0wrNnRMQ2mlGEYxEx1/FwtvqQ0NcJ1hZLJeEyw2Z9duVqRtJCWnE6RitlKL1EF8RqEv4gFxm/aBYsjHeLqQ1SnCHV/3l2IUUiYGVHZ832XfmIHPgvuVq/1rahJuwNdDzrE6nS59Iu11n4xNCF7fVVvRDpW6b/WiHP6KXoUIoB8ecmPaH9fghqnqm7grcCz48Wxn2UFkN/Xcm5i3Ge/dML/ABIJiglebTSUcRWaR8auu97/R5vjgsaDrCAMX7zJReG6VsDb3Djh5bL+1RuogffcJLCOz7IUB2pO6oUiHVDMW8VMSj3rkQaOe9uSlKx4M1Oxqw9G+JrUCIKNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h88n+XTwigi2Yy2QhJ661l0nuu7DDirR9Z8PxEAYqaw=;
 b=I7bn2aIdvDjwjE1xl5T+QAfFQu3zDNpahgQfmo27PH7R3mAs3siN3nrcdRJn/eh5ldKGjR7sA2bc2atx9r++zG9tS+CMqTGOZpFOkdZZs+XYU5HKV/fQUK+1OSoU07BEipJB+j+0GxbOvykPAGXvzs94ji1SzhQLZFlRKqsF+U0PTrgVancpMaeYJDaHfSUwXRYImXWr4sqFpRsBqNtx+Ix2D3AczJReEnuieuAGDyFFi7+/92DJ2UzZQ55/t3jkyWDa6qM90GeXj0h+xfewwcctPLfT5XghA74lfEHnQdBghtzZseVk3pI3hCJ2+bJhMChelGDP0Q7+RVjIeJ3DAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by PA1PR04MB11083.eurprd04.prod.outlook.com (2603:10a6:102:484::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 10:05:38 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 10:05:38 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	linux-scsi@vger.kernel.org,
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
Subject: [PATCH v8 phy-next 03/31] PCI: Add missing headers transitively included by <linux/phy/phy.h>
Date: Tue,  5 May 2026 13:04:55 +0300
Message-Id: <20260505100523.1922388-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
References: <20260505100523.1922388-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: FR4P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::10) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|PA1PR04MB11083:EE_
X-MS-Office365-Filtering-Correlation-Id: 696a714f-fc8e-49cb-832d-08deaa8ddb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: hAfJk+FNsYX+BdPmjOEB0AOYpLVqRX3xOQ18FXAxhEuRO0yl5R0lSH31DQl2wyPBuTwqPS425FsmzdhGBFwqsyk/Tp+4PvX9MPgLfFAL+yFVClD3Wkk9sDkw6MkZ2Yy02np8idRWAba62m1pBk2rFmW9eeZFOTjLf6NeIQoY44o+x7EPTOkLFwe1D0wemeKpGbf8k46GpPZ912F1imYW7FhgFaeAPGKHOEC9GyfBh9kxvn1QClWjbFvIpKgEO9qZfSnqYdywM6cdyGjXBB2L0Y7HfSvfM1eEOEpGi5AqQUTVa8U7mPuz5ct4kSN5q9s7q6eT0a3N9A9N55c2nTnMmkQK/hhSYzRz7bZcPusiMyqbAKPhn6fF0P7/rJb+kLpchXt5mQkIVk6zZKLsS6FZxPy8Ge3zzazraQ7+2IIJnndqGZG1FGVFzyaH0s+ObsFcEtaYsnxpBeufOShw41vrgf1vNlPorJUsQacID0mcErjaYl+6qvvTippk6ClVg2aLyJZFabG0J0cyNvjFxENhjvW/Z/vE2wmoUp/mwm8CwXZIRgZUnjjqVHSzLgMFsKw7+xb2XQHIn0/aoV5ucsvnLj1wekDV4wK4+JD3WkBEbLZonCZfZk7NIbFAGmcPTX79tlPmJwFMvcwgBDZuONmaGDwsNrJD0tbFAxaax10B/OxRcWA2Vobs4YvgpJwdiPWS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjVJQTdENXE3eTA2WVM5WjBOUDVKSXJ1Uk5pb3BxMy9GZXhIZUdJWVpRTlJS?=
 =?utf-8?B?WmlhVXVWZi9sWlY4S1l1bjBjcEhLcFdKWkpmV0RwVzJ5Y2lLTitLUU9sTUJV?=
 =?utf-8?B?M1N0eTVmWnphS1MraElqaHFiK2hZdk84YjFlQjN5a1RYZTIzL1NOOGFhVndH?=
 =?utf-8?B?RTk4YklWalFLMzVhVDNhRi9hdE5Ha09lTThNNmh6VUNsNVF4emNmVVhmS2lI?=
 =?utf-8?B?QXNuMjBSMFRRSUxjMHBUUGJjS2NYQi9JWXRhUFczTktmWC9GUTNUa1h5STRU?=
 =?utf-8?B?ZVo1V3dPNTNUbTR5NHJ0Qk9id08yZFN4VkZDZ0xtYVJsMklQa05NRlN3S3M3?=
 =?utf-8?B?amM4eEt3QTR2Vm5DMTVpU0tQL0ovU2x0TFVkZWl2MElnZ0U1QkFYeDFMYUR0?=
 =?utf-8?B?a3VFUkpzNkpkMmUzVmNOTEN3ZGFNdUlXYmxMMUpwdjh5WUpSd3FtNFdDQUhl?=
 =?utf-8?B?ZjVTTGljSGxIZzBKODdiYWdYZnlFbkNHN0Y2a0d5MFpaaFhlTGtPVjBxeGdB?=
 =?utf-8?B?THR3NDMyT3FyRTZmZG1PVXhkWnZXN3prUXhuRkxPd0VCOUhqaDQ4QXVGaHNB?=
 =?utf-8?B?Zk0raGIyYUIyRFgyRkRoenplYWFPdDY2emp0Snk1R2swQnNrMmw1YllVSnZK?=
 =?utf-8?B?emNQWnQxWUJ3QkJVZCtIS3EwNnpRUm03UTdTMEV5K0dnRWFzREtXa1RRcU5H?=
 =?utf-8?B?d294bGJNNHA5dkJVc1ZSaDBWUzRadUk4eFhxNFVnUGg3MXhkTW9ubzF5azhz?=
 =?utf-8?B?SjJNUUJFOS93MFRVQm5MVXJmQTBFcjZhSUFnemE5TzFYRTFlUDB1Z0c3dlpo?=
 =?utf-8?B?YnE1R0xiZHVRcDFOaU1LTGM2ZWNMTklnaWhGYWNvYWNNR25icHBhQmFXY0Fs?=
 =?utf-8?B?VWZOZ2FvMkw2R0FVaDR1Z0FEbmtTT1pQL2RJZVE0NVhZK0dHRGUwMWZEeEtw?=
 =?utf-8?B?cSsyc0lFYmJDS0VEdDNmeWs2RGJNcjMzcC95Ymx5dzV0M0lleVNCRFI2TGtz?=
 =?utf-8?B?ZU5nVlVxVTl6S1BOQ0RxNGFNcmY0dVk1SktRMU95MS9yZ1gyWXcyMVlpN2xL?=
 =?utf-8?B?RWZaOVZYZkY4Z3ZxSTBmMGxsRjVBOG9aWTNVQm1wRUNWRHQrakRCMlhmYUpH?=
 =?utf-8?B?U0xuMWFCYWxITTluTVAxL0NvdlZlWDYvR2pLbVZDbFdoZkNzRGhvb0VwVVhk?=
 =?utf-8?B?WTJ6ZzdubmZyVENCWGVwZmxnWXpwWHRKT1VvUzllV3A2Yk5WSkRuNXQwNEk4?=
 =?utf-8?B?UW50WDVGSkx0WXpGQW1HYmZPclZ0dGx1NzNoSVBOUGlRQ3BMUFRrZTQ1MGx5?=
 =?utf-8?B?a3FiTzNwYXNPaXcxemE3YXpEM3g0NkN6WFArUHMvNklXTUxiMFo3cHduREYv?=
 =?utf-8?B?ekdhSDhKeFhjSjRtOW5sRE1aTlJ0Tlg4Zk9mOCtNN3lvVmxOR3NDdkFYQW1u?=
 =?utf-8?B?VGllSUlRU0tWdmJvWWRsMVFhWllkZXdTelNWM0JKOWtKcDRPenFLZDVrZHFp?=
 =?utf-8?B?YnJQUEZkNHRqazJNRjg0RlljMnkzYXBRMkVrWDZGOUlqeW9MUFYwRjQ3MkF2?=
 =?utf-8?B?TVpjT253OTJvc1E1cEZOQzhjK0JLNjR1MXBMMU9DQmgydDliSnBhd1lCeHpQ?=
 =?utf-8?B?WUhYdG9BRmVBb3N5dzVGeWNkS1F6dVBsTzI1dHZCZXJ4WE1zWk9NaGR3YUhN?=
 =?utf-8?B?UHFlbGpROE5LQUpFdmpVWHVVTHdvTTA1Ujg1TjZkdkpRMTNBblpXS3VDZGNS?=
 =?utf-8?B?WHdTUzhaOXhTcllzQ1V4WGkxbC8wT3Jlc1ZURS9pZ3p5VEZ3SWptN3VoMTZS?=
 =?utf-8?B?cWxPc0UyMSszVlExMERLR3c0d1NwWGtLSThMd2srVUZrcGVxRWphNEd1Yllm?=
 =?utf-8?B?MXhoWisyblV0azkxZmhWS1hTQ1I4NnlyYWlycU9FczYyWVBZWENselN0eWtH?=
 =?utf-8?B?ZkZkRk83QkhQSjBmaHBkaG1LKzNkVDgzcjBKUHF0aEl5dzZ5QXZpYTc0Zlk0?=
 =?utf-8?B?WXRWNS9nRk9KV09aSWc2YlVwcW10cUR0VzZQek9kUFAwZXRIb20zT0ZuSENr?=
 =?utf-8?B?aFBmZjdXWm9rK0xhSnFzWUNzUkg3cjYzcHRTK0w4RWNKMFZaMTVvK1MzUnhY?=
 =?utf-8?B?Y1NZd2cvVFFtVmU0RjVwR2kycTRrNWZlbE9LcC9qS0k1ODNUUVcyTldLTDl1?=
 =?utf-8?B?NVB6SitsVWdQWlFHaTkwai9wMUczcGRHOWFTWjM5QS9zdjFDNTZSdmRtZldv?=
 =?utf-8?B?V28raGFySDFSanI3ZVRuT1gzeTRRSTBNZlZnU1RCaHhSdFhPQTVuYVd1Unpq?=
 =?utf-8?B?VkxlQzd4c2tMNVl5WlUwS1U1VVNxTkMvYmkzMVZRN1BGcE9hak9oZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696a714f-fc8e-49cb-832d-08deaa8ddb2f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 10:05:37.9669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkzW8mWjG14A57lYKYUMBn7fQaxI8pw/HaEhMZqFhz8zVJ/P9RY+cvfUwWRNLB5AcuJsX2LiEiGf1VsvAvwtEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_030545_464257_16B9754A 
X-CRM114-Status: GOOD (  11.38  )
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
YXRvci9jb25zdW1lci5oPi4KCnBjaWUtc3BhY2VtaXQtazEuYyB1c2VzIG9mX2dldF9uZXh0X2F2
YWlsYWJsZV9jaGlsZCgpIGFuZCBvZl9ub2RlX3B1dCgpCndpdGhvdXQgaW5jbHVkaW5nIDxsaW51
eC9vZi5oPi4KCkl0IHNlZW1zIHRoZXNlIGZ1bmN0aW9uIHByb3RvdHlwZXMgd2VyZSBpbmRpcmVj
dGx5IHByb3ZpZGVkIGJ5CjxsaW51eC9waHkvcGh5Lmg+LCBtb3N0bHkgYnkgbWlzdGFrZSAobm9u
ZSBvZiB0aGUgZnVuY3Rpb25zIGl0IGV4cG9ydHMKbmVlZCBpdCkuCgpCZWZvcmUgdGhlIFBIWSBo
ZWFkZXIgY2FuIGRyb3AgdGhlIHVubmVjZXNzYXJ5IGluY2x1ZGVzLCBtYWtlIHN1cmUgdGhlClBD
SSBjb250cm9sbGVyIGRyaXZlcnMgaW5jbHVkZSB3aGF0IHRoZXkgdXNlLgoKU2lnbmVkLW9mZi1i
eTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KQWNrZWQtYnk6IEJq
b3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Ci0tLQpDYzogTG9yZW56byBQaWVyYWxp
c2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KQ2M6ICJLcnp5c3p0b2YgV2lsY3p5xYRza2kiIDxr
d2lsY3p5bnNraUBrZXJuZWwub3JnPgpDYzogTWFuaXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtl
cm5lbC5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogQmpvcm4gSGVs
Z2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KQ2M6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRl
Y2guZGU+CkNjOiBTaGF3biBHdW8gPHNoYXduLmd1b0BsaW5hcm8ub3JnPgpDYzogWWl4dW4gTGFu
IDxkbGFuQGtlcm5lbC5vcmc+CkNjOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21h
aWwuY29tPgpDYzogSm9uYXRoYW4gSHVudGVyIDxqb25hdGhhbmhAbnZpZGlhLmNvbT4KQ2M6IFNo
YXduIExpbiA8c2hhd24ubGluQHJvY2stY2hpcHMuY29tPgpDYzogS2V2aW4gWGllIDxrZXZpbi54
aWVAc3RhcmZpdmV0ZWNoLmNvbT4KCnY1LT52ODogbm9uZQp2NC0+djU6IGZpeCBwY2llLXNwYWNl
bWl0LWsxIGRyaXZlciwgcHJldmlvdXNseSBtaXNzZWQgZHVlIHRvIGxpbWl0ZWQKICAgICAgICBi
dWlsZCBjb3ZlcmFnZQp2Mi0+djQ6IG5vbmUKdjEtPnYyOiBjb2xsZWN0IHRhZywgYWRqdXN0IGNv
bW1pdCB0aXRsZQotLS0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1rZXlzdG9uZS5j
ICAgICB8IDEgKwogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kdy1yb2NrY2hpcC5j
IHwgMSArCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWhpc3RiLmMgICAgICAgfCAx
ICsKIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jICAgICB8IDEgKwog
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIHwgMyArKysKIGRy
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYyAgICB8IDEgKwogZHJpdmVy
cy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYyAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jICAgfCAxICsKIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGxkYS9wY2llLXN0YXJmaXZlLmMgICB8IDEgKwogOSBmaWxlcyBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpLWtleXN0b25lLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5c3RvbmUu
YwppbmRleCAyNzhkMmRiYTFkYjAuLmZlNDgzNjkyNWM0ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLWtleXN0b25lLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLWtleXN0b25lLmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxsaW51
eC9vZl9wY2kuaD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1
ZGUgPGxpbnV4L3JlZ21hcC5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc291cmNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvc2lnbmFsLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWR3LXJvY2tjaGlwLmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3
LXJvY2tjaGlwLmMKaW5kZXggNzMxZDkzNjYzY2NhLi5hZTI3Y2UwNTI0N2MgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZHctcm9ja2NoaXAuYworKysgYi9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWR3LXJvY2tjaGlwLmMKQEAgLTIxLDYgKzIxLDcg
QEAKICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvcmVn
dWxhdG9yL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxs
aW51eC93b3JrcXVldWUuaD4KICNpbmNsdWRlIDx0cmFjZS9ldmVudHMvcGNpX2NvbnRyb2xsZXIu
aD4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYwppbmRleCBhNTIwNzE1ODkz
NzcuLjQzMmE1NGM1YmZjZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpZS1oaXN0Yi5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIu
YwpAQCAtMTgsNiArMTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgogI2luY2x1ZGUgPGxp
bnV4L3BoeS9waHkuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNs
dWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNvdXJj
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Jlc2V0Lmg+CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1xY29tLWVwLmMKaW5kZXggMjU3YzJiY2I1Zjc2Li4zNWEyOTc5MjNlN2YgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jCisrKyBiL2Ry
aXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtcWNvbS1lcC5jCkBAIC0xOSw2ICsxOSw3IEBA
CiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2Rl
dmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BtX2RvbWFpbi5oPgorI2luY2x1ZGUgPGxpbnV4L3Bt
X3J1bnRpbWUuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZXNldC5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jCmluZGV4IGJlMjBhNTIwMjU1Yi4uNDEzMTZhYTU0
MTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXNwYWNlbWl0
LWsxLmMKKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5j
CkBAIC0xMyw5ICsxMywxMiBAQAogI2luY2x1ZGUgPGxpbnV4L2dmcC5oPgogI2luY2x1ZGUgPGxp
bnV4L21mZC9zeXNjb24uaD4KICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KKyNp
bmNsdWRlIDxsaW51eC9vZi5oPgogI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KICNpbmNsdWRl
IDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+
CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2Nv
bnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxsaW51eC90eXBl
cy5oPgogCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3Jh
MTk0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXRlZ3JhMTk0LmMKaW5kZXgg
OWRjZmExOTQwNTBlLi5mMWQwODgxNGE3M2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtdGVncmExOTQuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLXRlZ3JhMTk0LmMKQEAgLTI3LDYgKzI3LDcgQEAKICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8
bGludXgvcmFuZG9tLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAj
aW5jbHVkZSA8bGludXgvcmVzZXQuaD4KICNpbmNsdWRlIDxsaW51eC9yZXNvdXJjZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+CmRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaS10ZWdyYS5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2ktdGVncmEuYwppbmRleCA1
MTIzMDk3NjNkMWYuLmEyYzE2NjJiNmU4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9wY2ktdGVncmEuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaS10ZWdyYS5j
CkBAIC0zNiw2ICszNiw3IEBACiAjaW5jbHVkZSA8bGludXgvcGh5L3BoeS5oPgogI2luY2x1ZGUg
PGxpbnV4L3BpbmN0cmwvY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+CiAjaW5jbHVkZSA8bGludXgvcmVz
ZXQuaD4KICNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1yb2NrY2hpcC1ob3N0LmMg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtcm9ja2NoaXAtaG9zdC5jCmluZGV4IGVlMTgy
MmNhMDFkYi4uNDZhZGI0NTgyZmNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L3BjaWUtcm9ja2NoaXAtaG9zdC5jCisrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1y
b2NrY2hpcC1ob3N0LmMKQEAgLTI0LDYgKzI0LDcgQEAKICNpbmNsdWRlIDxsaW51eC9vZl9wY2ku
aD4KICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+CiAKICNpbmNs
dWRlICIuLi9wY2kuaCIKICNpbmNsdWRlICJwY2llLXJvY2tjaGlwLmgiCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5jIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9wbGRhL3BjaWUtc3RhcmZpdmUuYwppbmRleCAyOTgwMzZjM2U3ZjkuLjIyMzQ0
Y2NhMTY3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9wbGRhL3BjaWUtc3Rh
cmZpdmUuYworKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL3BsZGEvcGNpZS1zdGFyZml2ZS5j
CkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAj
aW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgogI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgor
I2luY2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3Jl
c2V0Lmg+CiAjaW5jbHVkZSAiLi4vLi4vcGNpLmgiCiAKLS0gCjIuMzQuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
