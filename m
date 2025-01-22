Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC24C02181
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KiHL3AqtasHqTwxuMowf+0aMMDU+6IenPBYTcVQZvU=; b=rxODv1iGUzr1m5yakluRfX5ERZ
	LIG/YJ28+3p65eZLmUj1FXqZUncpBgo0ETei03ugBquRAuu4NdGQq5DfG6eAgV/nmrH64EIXO4MS8
	F9ECwEuUIIMakpXGw3FFMhnAa/htj6KFSdtt55KoxjkVe74dyR/I+67mnTUBaHLNMQ0HhpE7GFbIF
	7qTBxKvJ+QK7ApSvWdXeN3kilWzwmh8DxGQn2XNJTUbBCJ9oVqJCkagD9sO0mP9zbVvxNmjRQqpER
	WCn6GQOgBbPatoy5629JSXBg2HIG9ZgNuZp23B2vKx2Xlb+wiw5yMl9F0l4RI2MZ4QIxIwzVFdvu8
	ar7D7SzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taW04-00000009h7U-1Qem;
	Wed, 22 Jan 2025 08:22:12 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taW01-00000009h6l-2evQ
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 08:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcQZOTeNM6Gr6SbptRne1C45kjt/4YDqOOBx1ggAPt45d8a0OmWG4aS4brdEw0oVZ3Q6Wx4sdV7Hcg3XnmDMsbgGgiWAWg8Goe5Y1jnZun1iLM073OWQDwpKvG/VJnEMGW8rgYGSLTjjf/2n9C+F/vn1HsEQBC+HTOuRvhA3AmNkWEfceIX3SVzhydxoZdFb0xRTWDXvXeW2kPNMPlui1xL1CxBX14TCI7CPcVJ+1LlZ3s/8zwLm+oiZb+UK+xWCMudsnQeB18HxMMI54FhuDwS+Xndwxq5+HTElL04nRMDfopUvwqwzqpvmt2sUCwDm61AE03sArXx2TraB5rR0mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nDaV+qoBzLsl94CfXfWt3KAXS1PbJ4fC9kMSV17+d4=;
 b=mue0sWrVnZhdyuqPh0njEUI/QaUS/ODVZooe/ZbT/mTId0dK79vHoZTXVYzSDJEDmu5OuKJzFLrTywB02Qs/t7spHHBShprYBZhckERwDWrw0nVd5jDk3MGH9j6/X6DCHa+/UlToqSYhAVp37yHAmAgBX9DlyT715HRlsfAn9jSODL7gbqRtTKnVp96aHNHZJEycr1kMz2ILzyz7//pIF4CAXoz2cyi86pkzjgbemDdTVYZbBKahT9RhKE/d1TTD/sTtlyVuz2wr3mLg5OjtNrWb55v3b+V2WkHydFZBHr6URvka7VWWE+Y9uTB9QrEKX7Maj3CyuN7fDTDwXbiq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nDaV+qoBzLsl94CfXfWt3KAXS1PbJ4fC9kMSV17+d4=;
 b=possaiYRJ7/YvNK+mbopGtxLLtzvXq05EoK/E497bh1NGSON88pRyPnJ2l1Vp8CbD0LHydRvrK2MQ6Pj/8zgk1wfNkYSvMOtlgQLvkPwzXm5+9Pv/9QCaIVf42QegMW0R5Gaw4A+C1HZLTZcXZJOwI9hk8qve3ukc/ydPxvffjzCpIytyJYNOqP+zCKf7XlAIQa4D1dPhqC+mUncRcyOF7Mr+UI/jVctRI9LhDz9WnI7ocMlKVS/WtKby8yv4I109icDtmcKtPZ3tXHT8Nb1PWdAKLAIdQh96DmQLTXYaHZhQmcgLw5opDnF3ek7vlSqB1dUvVeJmesLTCK4eDZGyQ==
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:44::15)
 by MAZPR01MB7054.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:5a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 08:21:54 +0000
Received: from BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::954a:952d:8108:b869]) by BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::954a:952d:8108:b869%3]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 08:21:54 +0000
Message-ID: <BM1PR01MB2545DDDC4BC3042D403971C6FEE12@BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 22 Jan 2025 16:21:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: pwm: sophgo: add PWM controller for
 SG2042
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Chen Wang <unicornxw@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <cover.1733281657.git.unicorn_wang@outlook.com>
 <673f314d78ab467399afc02b96ac730149f19587.1733281657.git.unicorn_wang@outlook.com>
 <dvjnhptep4fa3iqxzsau5fdp7qrno4nhnpdecvvyb55h6sxjpl@ohnvvbldwtpj>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <dvjnhptep4fa3iqxzsau5fdp7qrno4nhnpdecvvyb55h6sxjpl@ohnvvbldwtpj>
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:44::15)
X-Microsoft-Original-Message-ID: <a300a5f9-9f28-4b7b-9704-c060677aeedf@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BM1PR01MB2545:EE_|MAZPR01MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: b507c4fb-0dbc-492e-7ab8-08dd3abdd3eb
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT+Low/KBlUSJz3r0Ahd/UBoFlO6HVy9nwkYVXKBJa7Lpg73DhQpkm0kBKUp9uklNJh3STnwh3zbqgQ7buQfacsrA4dgvFpIdxgRhzfUIIBnyXCj0Hv0+YiUyLM7dtH7xbvdRO10vkDUTDliqN2OCtSOfHBfZoGpYg66d9ZYak1Y2hnqa8aONF9shSEwg/yqmqEm+YW+HWw2a2UY5fV+4s99CmvYu5n/iz3X7gtyENd8eTZxBaWnntT1/bmY95G4HyFnswlV3XKH1kstaJlHtJ7fqjU5ArAAXVxbhpBpq2q3Ef5ZdtfHdqSuBYdO2WRRo+ab5FIGUsuW8G96Rgc/qEEi1ETqGvm899MWLTZDoNKAwXpk5AcoxOkeSor6mBrzZ/9gGz5GCSgsyzAEsJKv9/Z6pIEfkSDdoNHPElctUYOrsaENwIg55Imzmil9fTC6kq8rl3ZvBcodP0pAcn78tjuR9BvbmJcfeWEXpy7FS36BQYAcBFmcV4bw5eIhy2Wcu94y/opIFfgxu6vkuW0AU5gChq77AhTWR1KLQ188OyqtITxE1htaKIe9tVDTJc7qft6B1qOOhbSN0RHkevAeFN4/DHFwb3K3mdf5I9q/kxGMTxn5j1wdOU8ee7mHxZiv45DlC4qQ8TmCgufV0zLbWo6w06iYPk0JnciHbUzhbBQpIiUdFkSIx/GbGLseoxX6sSE/tsrMCpcA0n8c3LUFrRjpJxQjQWPJrTlmsY7nh4vLfuoZgrjrkPf6DVHlpN7/dY2jATE2iR067wcLHQdWyOACbFlsguZm2ZFJp5Bg0nfnBCktk8PtNZ0o
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|19110799003|5072599009|7092599003|8060799006|461199028|6090799003|10035399004|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmRSL0dsK0lzUFU2ZUJFd1MzZEhycGcvbHFxOEZaWmRrekRFWERDd1B2S1Jv?=
 =?utf-8?B?WlVEcDJKVFZ6ZGlIMHlING4zVko1bE4raEkrZ0xFc0tNWENhN25lMlpjRm13?=
 =?utf-8?B?a0VpZVdEclY4K0NIcVkvM01ZRlhmNE1QUzd6MHUwL2ZzVWJGWHZuaitxbTVJ?=
 =?utf-8?B?UlhWemRTa2YxUmM5aklvbGxpOXc1RGRwejh6MWs5RTBNamlJTEI0bEh0UXgr?=
 =?utf-8?B?M2ozb0FzT0EvWW1CaHhVQUpFdlVMNGhJeGZBQkUyRXRmOFN6K3kvRGhvUnZY?=
 =?utf-8?B?Q1Bvc05KWllyaHFoZUZGcS9QYlM1RkhIaGtCL3IrRHVleUI3VDlMU0RYVWJE?=
 =?utf-8?B?MnFZSzNiSGtCYi83a0dpU3RDQUNDNUkxNkNmdXp6azVnM3Zua1dYT05NRThU?=
 =?utf-8?B?WEVacXkwcmlKRXZxSlBlc1MxM0dBMlRVcURvRzZ6dFZQUHFXWXVnOWVwKy9v?=
 =?utf-8?B?UXRrR0NJZStyUmFsK01DWFJKOG5lSTIxU1lobXhRZGpmd3NyRU5xUkt4d2l0?=
 =?utf-8?B?SGEvUDRKSm5meEw5U3Y0ZGIvZFBSNjRSd0swQllnc2pudi9ydU1hSUFqaTNo?=
 =?utf-8?B?Mld4eHRoUnJnZlVnUlZ6RUkvbDlQUzdBenRGTEk2a0h1ZTRKUDh3SnZpOUNR?=
 =?utf-8?B?UTVQYkc0U2ZCRU1qbGs0QThGRlVRNWVSajZ5ZlFqQ1FwL3B2TExVSkg4dkxJ?=
 =?utf-8?B?R2dzSzUzcXZsa2JyL1BadkNMQ0wxcjRWa2M3UGtHZm53ZnJrZ3grWmhsZkJW?=
 =?utf-8?B?WlJkdWswbEozRnF5YlM2c2VpZkd3WWFoYXE2VWdjUUlubHc4cXhyblBCVlky?=
 =?utf-8?B?K3NjWG1jRFk5UVdyVitnQWNxUjV3ajV5bFNieEFNRDNhTE95RnpLYng3SEJj?=
 =?utf-8?B?NU85QzBVSTEvRUtkUTh0R24yaWtPV1JGQTY0ZTdPUG9iL1hnV3RlNHJMbUpK?=
 =?utf-8?B?b3FKYVFPdjA3NmZ2SjZvZlhIUFRNL3ZxVVdQSWN2emtlUEdSblBKZ1FidDFo?=
 =?utf-8?B?NXUzRWNjTDlla2E4L1RiNTdxb0tMcC9NVkd1NzV5MFVSb05sRUFKQVdXQWJo?=
 =?utf-8?B?RU9rck9tOXhsc1ZTVnRRcGJLclFPV3lwUndUQkUrcDBJMnJIaE9lbWMxVFlH?=
 =?utf-8?B?Z1pGbXo1SkZOUm0xclhROW80RlJqSGd1aHB3cU02VjJnaFlsdm9PdGJ3ZlYr?=
 =?utf-8?B?N3p4M2gwZmdqd054M2YrdFprLzBqMy9hNkl4YVZVSk1WNjRRTzZuUHRWd2ww?=
 =?utf-8?B?NWJ0L3JaZU5iU1NoZVZxRjVJYXJubCtrbjF1WUpvUzlTWkl1N1dOUWVTRTVs?=
 =?utf-8?B?ZEVYcklTYmJuZkZ0Zml3U0VEWlh5NmtWU3BnOHhJNDFqakZvVEhNOG5SWVJB?=
 =?utf-8?B?VzB1Wnd6TGRiaGZpbnYzbkFsTWlaOWhKaFRUMnFZaGtnUXU3RVZPdmNCdndQ?=
 =?utf-8?B?VW9VZndsS2VDbTJIQzIzTkNjQmh3ck5zZzREbDE0ZGtseEJJRnI0WVRsQUtT?=
 =?utf-8?B?SkJyOXdHZWVhR1BwYTZsY3ViNWNGTXNQelYwQ1ZZMWlaeWcyUjdBNXlwV0Q4?=
 =?utf-8?B?aXZ1UT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGFneEJFOE5lL3REdlNtSDk1a0xENGVQemxjSElvSkoyalJTa2RhZ0Q4eHIz?=
 =?utf-8?B?YisxMEZVeHM1ZmQzUG1wOUpNcUQvSzVndEJQRFNCeW5jNFJXekNBVCtWRFFz?=
 =?utf-8?B?ZTRENTI1a1A0Y3FveEdBYW5TOGZXS1ZDVkhiKytaclY1aS9PQmNiM0R6MStj?=
 =?utf-8?B?QU0ybTkvTlUrWWtxRUVTWG1aL3ltSWZqVUR1Z0JnTkZHMy9NdzNPRGVxdXNP?=
 =?utf-8?B?OFZnUXM2Uyswd2ZuOXczZGpsc0xzUWxobFdzTEtOeHduZko3dW9vNCtaSmhj?=
 =?utf-8?B?T3hQUkl2KzFQUmNmTStnT2J1WDMvUFduS2RlR0lSRkZ0a2txcGNsTDcxbEdK?=
 =?utf-8?B?a25lY1V5bmRKdWloRVd1MjQ5NVhRT1QwYlp6WjdtMEgzOVJseEFqV3BWdzhO?=
 =?utf-8?B?RUYxVlJkRytpNmJPMmtqTGsxcmNianUvYkkrbG5VTWlOek9sT1J1dHpQcDFa?=
 =?utf-8?B?MmlLTU9ub0NQY2IzZjIzWnRvV05xSXN1TUlyeDFRdnB2Y0dYeExnY0RsUVRC?=
 =?utf-8?B?Q1c0OUp5clpwSjhEeEUrOGpkVkppTjgycSt2OE1DazJBSThsTmhnSm41WHA1?=
 =?utf-8?B?Vm9jUmpZQ3JTNnBQZk95ejRSbE5BbnppaWVsem9JMmRMcnh3TFUxd0tpS0Vq?=
 =?utf-8?B?bWZuWHZkdnFiVVhMY2FPSzhFNzRRMTBHVUhWTUIrUVhSUFJaclprcFZjaytQ?=
 =?utf-8?B?blZnMkNNVjRvZkJLTFFreVE0QmNkVnFMK3U4Q1BFTldIV3MrdWE2ZHRkUjJP?=
 =?utf-8?B?TnY0L003UURiSUw4dWdMcnVLVTBLV0M4bmR0YURjMU9EcEZtSjlUSStOUDJE?=
 =?utf-8?B?QmNORThVRTI2eEtyTnFKdWVSVnRWV0M2QmZ6N1Jod3oyWm9MbUs3VkVQUXpR?=
 =?utf-8?B?Ynpad1VHWnN4VWtjeUFBeFNyRkpBczM3Qi82T1UvL29jRTNJcTN4VGZKamZo?=
 =?utf-8?B?ODNDQXBZTGxrdGVrRFYvQ3N0WDVKQmxaY0dvSEhjU3ZUUUFOVUZiQzNGQXAy?=
 =?utf-8?B?QytyZ3lFckFwYU9wcmJlMWtaSHoyTWhMcTdqV1d5dTdQMHNIT2pGNG9ma25V?=
 =?utf-8?B?ZUVFOU9ZcGdEdFpucThqMlNQdWhZWWNMNXFMWmcxVVR3cU52RGpOeFVoNkIw?=
 =?utf-8?B?Sk5UMGl5NDlUZ29UWDNsOGh4c3BUK1pEQkQ0VCtHbUczODIyOEpOZm1WckZH?=
 =?utf-8?B?d3NsdXc3YXlPYmlpdGlNWE9idk45ZXVXN2FZRXd6NHFaaElsVWI0MlRoVnY3?=
 =?utf-8?B?M2pOb1VMUkwwU28yUWQxNnpEVEozVmJQVkVJVnA4WnZBWHkwcGltdzNiOHB0?=
 =?utf-8?B?U0E0NE43ZmYxV0ZMc1oxSmU1ckdpSGNSN25kVTlhUXpvVTlpUHRsMG05UTcr?=
 =?utf-8?B?aG5qeWYvelR3QWtmbUdTZWwvUzdoSTBKKzFXT2hjWFNndnQyMnF5ZzFvWStm?=
 =?utf-8?B?dG91anIrQ2xsWjZQeFl5VjdDWmpJQXhNUkpXZWFISnJPZDAzbkcrSjBGZFlP?=
 =?utf-8?B?dVlLYkMyWnFuL0NMdytTeFVVdTRnM3NxWjBRMGJzQk9xNWdXSWdOOHNqUE53?=
 =?utf-8?B?R2dOVk0xZU5qaExtMklieG4rWVdtSXh2RHpjNm9aV3VTb2xHUWJTWldOS0Rl?=
 =?utf-8?B?NUU1NGNsNzBxbUFRSjc1RGJpMXlJWHMrN1pEbVJvNVBjclNCWjhpcC80d1JS?=
 =?utf-8?B?N093czhsSVZhaEtSdytFc1ZKU21VYThlby9nRUxHQmJUN0o3MFNTdHRpNXJP?=
 =?utf-8?Q?4kFdI9EyX1qkF0i/Ep7MLQ1qK5LcGl6xY49Nhvh?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b507c4fb-0dbc-492e-7ab8-08dd3abdd3eb
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB2545.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 08:21:53.8916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_002209_686277_CA9AD73F 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjUvMS8yMSAxOToxNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4K
PiBPbiBXZWQsIERlYyAwNCwgMjAyNCBhdCAxMToxNjoyMkFNICswODAwLCBDaGVuIFdhbmcgd3Jv
dGU6Cj4+IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pgo+PiBT
b3BoZ28gU0cyMDQyIGNvbnRhaW5zIGEgUFdNIGNvbnRyb2xsZXIsIHdoaWNoIGhhcyA0IGNoYW5u
ZWxzIGFuZAo+PiBjYW4gZ2VuZXJhdGUgUFdNIHdhdmVmb3JtcyBvdXRwdXQuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+PiBSZXZpZXdl
ZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
Pgo+IE5pdHBpY2s6IFB1dCB5b3VyIFMtby1iIGxhc3QuCm9rLgo+PiAtLS0KPj4gICAuLi4vYmlu
ZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwgICAgICAgfCA1OCArKysrKysrKysrKysr
KysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9zb3BoZ28s
c2cyMDQyLXB3bS55YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi41ZGVhNDFmYTRjNDQKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3Nv
cGhnbyxzZzIwNDItcHdtLnlhbWwKPj4gQEAgLTAsMCArMSw1OCBAQAo+PiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+
ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcHdtL3NvcGhnbyxz
ZzIwNDItcHdtLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IFNvcGhnbyBTRzIwNDIgUFdNIGNvbnRy
b2xsZXIKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gQ2hlbiBXYW5nIDx1bmljb3JuX3dh
bmdAb3V0bG9vay5jb20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9uOgo+PiArICBUaGlzIGNvbnRyb2xs
ZXIgY29udGFpbnMgNCBjaGFubmVscyB3aGljaCBjYW4gZ2VuZXJhdGUgUFdNIHdhdmVmb3Jtcy4K
Pj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0gJHJlZjogcHdtLnlhbWwjCj4+ICsKPj4gK3Byb3BlcnRp
ZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHNvcGhnbyxzZzIwNDItcHdtCj4+
ICsKPj4gKyAgcmVnOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2tzOgo+PiAr
ICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2stbmFtZXM6Cj4+ICsgICAgaXRlbXM6Cj4+
ICsgICAgICAtIGNvbnN0OiBhcGIKPj4gKwo+PiArICByZXNldHM6Cj4+ICsgICAgbWF4SXRlbXM6
IDEKPj4gKwo+PiArICAiI3B3bS1jZWxscyI6Cj4+ICsgICAgY29uc3Q6IDIKPiBQbGVhc2UgdXNl
IDMgaGVyZS4KCkFjY2VwdGVkLgoKVGhhbmtzLgoKQ2hlbgoKWy4uLi4uLl0KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
