Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AE7E77198
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:Cc:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH6j5I3tmLsRKgAgVijSn7mA4481dpPDT6AwcHEX3H4=; b=bh+EpBBXwhmgZHR1A/TRXpqTjL
	eDaEXq6QRKKBwhIam/QaHVpAnKgNzynCFoMlVIJu+ARBmgpMSvZIOospPOiK2GyxE3Q4CiPSBvFvA
	VoPKuVd3xaZ9JTWnR4yHsjqcO43RopMGD7qnTww1LtZSRdV4FdE17+pgAcLS/lkLYSUUxQ8hIMd0t
	huKbIAaBvZDFLxh4XxKOYLp1RIo1WV1L5S574jBsvUWDfzRZvIfjtYPPdkpK9YsJodvOyQzX6YJ+6
	kNgamwntW3/Pz7xhzZ3FRQ3/du47uzZYMkA6FSRuLT2+ciiTElySR93iqoq7Q3wcEfTe/xo8yuqZf
	qo8pefCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxG1-000000031BE-3HjN;
	Tue, 07 Jan 2025 00:15:41 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUxFy-000000031Am-1nNn
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 00:15:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsg1X5J46FVTjDpdI3f5reE/O6o+JHVAkm9INstiVn5Tez6VAIyupYNq2z+s+of5STVPidjnI1lpFQS+xAaXWSHIPjdnwrcUWd2pZEyRyCEblDJlRld1TZLlrixaCbVRkHv/35iPLZSmtNhrx5oJj04Rz5796GaaVwLY+CF9fDIK7zaKxjUvlsfb/164M21o4pB5oEivtQAkGfmcpSUR6WI30aiJxr00TR58BwGc1ltfRGreGFSyPxfZGmfZPsmop3NLCugH0asz6gZEE/wxu5a+5NG/2AVBKR2VIgWZoT9ikgu8nxSbQEsdiIIV49sv0SS1ZCU2yOBBaEKo33aLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyoiJ2Em53H5SdSwJPqvA39NqXRLTRXJcTSMGqHOQEA=;
 b=mOAakf6k+VHincDWXjmpPgGZyqFfxiYBvo1RjcNNXRKhHTscuh8PhPKjghVMXHlgtRrIhbUDByn10UO4rra+GHu3P8peN1sRwDa2rRLgkumgkP+BpnWi2PCJwEb5VBNPIFs7K++Xru3PUHM3Xrw0onOVBriplf9y3DPMsZ+ucmd9BmmGwwW9pPcEC34Iii1/REn8nWPtsBoTcUs0574sPImwWHLMBuurG2/sjN0v9GuNLTtc3ijsdMqwKoa58sVCNgR7uwHo0mauIZLNnD6id0MZPZxppCBbw5gMmjcgzwAEPLS1OcN8Ro9BC5y+kw3/7HzVZUTSuPsJOKQsRG4JOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyoiJ2Em53H5SdSwJPqvA39NqXRLTRXJcTSMGqHOQEA=;
 b=jW8NySykch6lyNdVld5vt5v+3zj9wfoURh5/S7MYf0HAqTpslpBc008ueTsh5dEc7fi0QRhhqVlRRWypMF5S2Uusram8DyyBnUGSYkeanhwpC+pDLlP8w/BkpwbIIftwW0IThfYaVqwxytYdJ970Oe8N20lCOBCq2GxnEfIIlZjnMdPnhuLCGYO9Kt3t85O7BErGVrxByHznzGL58tTMQCKnfiQmcl2V2lvufuZwQsYY/P5eGQHrXddj9hdJSyibfwwavVQBp0crooYbPN9jjpHdYZZvtdZIY1d/z9XJwioP2aPqPBtq5BrEUqx10RsKrasBhI5v5RFslPvePdJeaw==
Received: from PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:fb::11)
 by MA0PR01MB6108.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 00:15:26 +0000
Received: from PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::fc57:de35:cc59:cc4f]) by PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::fc57:de35:cc59:cc4f%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 00:15:26 +0000
Message-ID: <PN2PR01MB95232C384994345CBAA68913FE112@PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 7 Jan 2025 08:15:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] pwm: Add pwm driver for Sophgo SG2042
To: ukleinek@kernel.org
References: <cover.1733281657.git.unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cover.1733281657.git.unicorn_wang@outlook.com>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:fb::11)
X-Microsoft-Original-Message-ID: <b3615bb3-2f42-471c-aa37-c888fb959d1a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PR01MB9523:EE_|MA0PR01MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: a8058952-a6c2-4dfd-ebb2-08dd2eb0627b
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|7092599003|15080799006|8060799006|5072599009|6090799003|10035399004|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXYwTUNpK2JlTnAvYUViVEdXSlkvU0RlY2FQbjgydGRYN0NicmlRNlBsdHZI?=
 =?utf-8?B?OGR1T0o1TWJzRzViNlpoSFViYVJaS0dtMHpmcENwakNkL2p2TnAxV090cUxE?=
 =?utf-8?B?b09Nb1kzVHZKbTVtaGNXeHg0MnpyOGN1WkhFOHBFekxXWU1tRDEvbkt2WU9r?=
 =?utf-8?B?V1BNS3cyRXlFT2VUd0pnOFBiQ283d0I1UlJIYTdzWkdWVTJjZGdNbzU5MzZ0?=
 =?utf-8?B?aG5Ec21QL2dqNlJaWXUzcHBndU1YQVNYUHZQWWdFbzRqd0ZqZ0J1YlNWUmJs?=
 =?utf-8?B?aXZNWjB5ZmY3Sk1nZmpYbnJSNXZuVUxsd2w2ekRaVHVuTVZxOStGWFMxVk00?=
 =?utf-8?B?TlF3Q293NUx3cU9qYkxyUmxqRnlvUG42Q0xZZU8rbnVISEJOejB1aE5GVUta?=
 =?utf-8?B?ajRMNnJtQTV6a2JBYjVtdmdqMFcwcFllT2FMeTBMTWx2Y3NIMEFHdCtWZUVj?=
 =?utf-8?B?K1ltSjMxWXVFZ01udEVCUlZGZ2tKZEswOC9KUGRNM1Bac0FrejYvMmJPYmk5?=
 =?utf-8?B?ZlcwU2JDMU5TbTc4cDNTb1ZCd3V5d2E2N011ZFU2MCtpK3FXSnBKMVRnQ0Ez?=
 =?utf-8?B?WFBPclFXWFFDQ3dyM0NvU3dnRXpIcVdtYkpMYkwwdHdNK3JNeG00NTYvS01F?=
 =?utf-8?B?SVpOVGcrNHlUYlhZeTdPNnd1dkpjTjV0cVdCNmRqeGFFTEEwazVSS0FtQU53?=
 =?utf-8?B?UUVYUDhLeVpOOURPMzhaMEF5N2RnQWZvSGZmMGdubFpnYXVIbEVva3VHam55?=
 =?utf-8?B?THBmWjZCU1V5UVlxdS9jK3VOOWZyYjdMa3ZBQms1OHVoVjQyNXc2bGljZk1V?=
 =?utf-8?B?Zk42dEY1ZzJmUWQxRzhLOCtaZWNESnlxNmdwTUdaMlpFdjNWaTI4UEpURS9y?=
 =?utf-8?B?VkdyZlBrMU03UzJBcWlxN0dwSlNQelIrL3hGaEN4VDlTZklIWHVWb0hmU2Rr?=
 =?utf-8?B?eDY2RXBOd29nRjhldUVjejVtcVkyMWM0WFpySFZ5OHZaWUMzRHFtZSsrWTRv?=
 =?utf-8?B?ODhjR0o3aGkwM2UyQk9sR1FCa090STlLYTFyYlh5UXYvR1FVdW15a043Z2Nm?=
 =?utf-8?B?WjJCOW00ZkQrcExweU1ibHlRSjNWUHNTYXduM2VQSEtsazJHYlBCZTkzMC8v?=
 =?utf-8?B?c1U0NzFndVl4T3pxc2plbDVSc3RPa3BhSGV2amxyMGlIUkduU1A1SitxLzVO?=
 =?utf-8?B?UXV4T29PQ0RPNDB6Um4wdVNkTHpwakN2UnVBRTNyZS9zTVBOMFU1dnpSaVN0?=
 =?utf-8?B?bUVUaFdtOHZUQ2pTM01Ubzh1clVSaVdqUzZIWlBDK2U0dEl2eEo0a2M5S0pY?=
 =?utf-8?B?N3BkTytSaEhQMVVqbXZ4UTVML0Fqd3AvalZBQTUvYXhQU3BTSWs3Q1crbkZF?=
 =?utf-8?B?OUdLaXpBejRaWUU3QVMycER5bnZ2QVh5bHRqRjZJUnk1OWJvS3NvNTNJdDUx?=
 =?utf-8?B?cGR3eVJTZWtSTzNaakpBWThHa3VTNzlEREVvSHFwMXVkeGdleVNhVFRSL2Yv?=
 =?utf-8?B?eFdEZTV6Q1UvWmIrVlB6dzAvVVlpM2VzNUl4Yi9TRlczd0U1R25QUkNabmg3?=
 =?utf-8?B?bkhVQXFld0gyVHhmWTc5ckZ2WXFGTi9jMGVHRGVvYzFiRzFKdFRBb014MXVM?=
 =?utf-8?B?NzYyZkRyczNCbi9kTVhxYmVLbUVGU0ZiRkhMMzhqdnlmVWptS0FHaFBvVkhi?=
 =?utf-8?B?KzJIWjVySGxEajlHMTcrRUhQWGMzZ2VlYmVCOXB5WC9kYmF2V3daVnBBPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T29ESkNoanl6MTJpbThhcDRFTjZpVXI2NExweWtBcGZNMXFIL1FyOHVoQVcr?=
 =?utf-8?B?bVdlV0E1NWt5QzROcWpSRzZGa2ZZNjFoZDEzdmZEbUhWaEdOQXg2ME5hc3FH?=
 =?utf-8?B?QStJalpTMnFTZmo0dUpBNkJFclJIbFFDeUwxZVBUNkRIWDVjbVM2S2RiMFND?=
 =?utf-8?B?ajE1SmxwcjRaVTFqejNPZXI4NktKVlJPSUEvWjJaQTZ4UWhmcFpER1hTK05M?=
 =?utf-8?B?eHVZSG5Fby94RUwwcENWSWhNOVdzNmt6RHpVWGNtOXFORU9vaUI1K0ZkZ0RW?=
 =?utf-8?B?UG5QZWhnT3B4N1k1M2RBMld5YXU0NmlzTHcrWGY5MHluVk82V28xL2xoK0pW?=
 =?utf-8?B?RDhPRXVWczk1N0NrTFQyQnowTEU0YXdZR2svY1FTYmNkREpNdkFmeVhpOU5w?=
 =?utf-8?B?Ym9nYS9XSmNxU0hHRDJqNWdhOVNDT0lrREVSK3dDZG5XZ01XRE9wUGJKYXYx?=
 =?utf-8?B?QjRqZks5TEEycUxLSWdmTExpUzMyWDcxSnpKL1hDOW5WU0FoMVpobGxDSmJT?=
 =?utf-8?B?eDZmZWpoVm5VaVhoc3duQlB1SWtubkc2c05KaWpqYUZLbVBVMmRndTZGQ3Rq?=
 =?utf-8?B?WmErR2xKUDU0MXhwazlocHhmZkhCc3UyVFlsS3gwTVFrczNiWEhyd21pWWxJ?=
 =?utf-8?B?ajZiR1pnQ1FyTnFmcHYxTjF5Q3h3VVdrMmFyOUx2RmMvN3ZQTkQ4N1V5S2V4?=
 =?utf-8?B?QlJobXB6RHhXUUxOWGp2V1pUbnZrVWdXY2FCK3hGTWZ2WFlIT1hqcUdYbHU1?=
 =?utf-8?B?aWEzckxUT0lBejFGVTExYThQaFZac3NYd1Uxc3g1RDFXY2dMaHZmQ1VHc2ZJ?=
 =?utf-8?B?Qzc3OW9kTEs5dnJ6Z2w4SDAySUNhTGFqeEhWODVqYzVuQkR5NitVNXNScVBM?=
 =?utf-8?B?S2VsTjJYeVltNndqSTRmemhyNDlVV3NZa3Bwc2orM0JPVTFkMXVnZ0U0ZWl6?=
 =?utf-8?B?aHdKc0RmWVcwbXNKZTgwS2VOcThYUFp6bTF1UkxqR1Q4WDlQNWdPUDRmN0pI?=
 =?utf-8?B?K01pMU1PbmVWZ0tUaFBsSTZTSkJ5UlczMVBEdk9BQU5nQjdnYzFVWnorSDlN?=
 =?utf-8?B?QmRsVFNMbmJoUXpFVTNvcWlwZzh1UDFFc2xDbUhkSnVnOFRvcWM5cjBYaFVZ?=
 =?utf-8?B?c2NoSjd5dWVsdC9scmRwVnVqWnlvSDhVbThpMHFYb3dWSFNWTnBQdk9iR1Zx?=
 =?utf-8?B?QWhLeXh5Yk9DcjkyZzlwaU40MFovQ3JOR1Z2YU1lQWxIclVjU3F0dHpIdEJm?=
 =?utf-8?B?TWhuWGpkcFljWlVqdENSNituQkFaSVIvaG5mb3BwWFcwbmdiQTU1OFBRaG1m?=
 =?utf-8?B?OGg2NDFaVG1KSFRjYjNwTW13VS9SQ0Zmcm9UZDBsQnZJNTI3VU8yMW1UTkxF?=
 =?utf-8?B?QWJWOU5vNkFIV0NnTFNIVUR4YWFhTjJXa0FxN0VTcCt0eVVqWG5tYlJxd2FR?=
 =?utf-8?B?NllTbUo2dC9BUGVObVBPTG1BVlVRaTNsMFZyeGw0MHFuaDMrTGp0MmpoaXZS?=
 =?utf-8?B?dVlMMUo2WVIyUTgyNlBZNnN6dWNuMituNFdrTzlNTVY4VFcyMmZUMGtsUkZB?=
 =?utf-8?B?ZHErMVdvLzk5ZVNOK3lDZ0NsU0x1QkoycStJT0Z2QjZFYlBNRC8zTUFMUG96?=
 =?utf-8?B?ZHRxenBsak9Cd3BWb3Zrb0YvM25LN1NSZTIyZHBrcGhlVUp5L2JZbXlKQWtx?=
 =?utf-8?B?NklQOTFoYThVTmpqMHFkcEVvdmZscnBKMkxFZkRsa09rY0ZkNEZPc2FFU09J?=
 =?utf-8?Q?msO9n0m2FjFRUhi0dumMwzhWpnxHVL7AvwI8zMq?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8058952-a6c2-4dfd-ebb2-08dd2eb0627b
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB9523.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 00:15:25.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB6108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_161538_481788_43127E39 
X-CRM114-Status: GOOD (  14.95  )
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

SGVsbG8gJiBIYXBweSBuZXcgeWVhciwgVXdlLAoKSnVzdCBwaW5nIGFuZCB3YW50IHRvIGtub3cg
aWYgdGhpcyB3aWxsIGJlIHBpY2tlZCBieSBwd20vZm9yLW5leHQgZm9yIAp0YXJnZXRpbmcgNi4x
ND8KClRoYW5rcywKCkNoZW4KCk9uIDIwMjQvMTIvNCAxMToxNSwgQ2hlbiBXYW5nIHdyb3RlOgo+
IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Cj4gQWRkIGRyaXZl
ciBmb3IgcHdtIGNvbnRyb2xsZXIgb2YgU29waGdvIFNHMjA0MiBTb0MuCj4KPiBUaGFua3MsCj4g
Q2hlbgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY2Ogo+ICAgIE5vdGhpbmcgbWFqb3IgY2hhbmdl
cyBqdXN0IHJlYmFzZWQgb250byB2Ni4xMy1yYzEgYW5kIHJldGVzdGVkLgo+Cj4gQ2hhbmdlcyBp
biB2NToKPiAgICBUaGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjEyLXJjMS4gWW91IGNh
biBzaW1wbHkgcmV2aWV3IG9yIHRlc3QKPiAgICB0aGUgcGF0Y2hlcyBhdCB0aGUgbGluayBbNV0u
Cj4KPiAgICBVcGRhdGVkIGRyaXZlciB0byBhZGQgcmVzZXRzIHByb3BlcnR5IGZvciBwd20gY29u
dHJvbGxlciBub2RlIGFzIHBlcgo+ICAgIHN1Z2dlc3Rpb24gZnJvbSBJbm9jaGkuCj4KPiBDaGFu
Z2VzIGluIHY0Ogo+ICAgIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMxLiBZ
b3UgY2FuIHNpbXBseSByZXZpZXcgb3IgdGVzdAo+ICAgIHRoZSBwYXRjaGVzIGF0IHRoZSBsaW5r
IFs0XS4KPgo+ICAgIFVwZGF0ZWQgZHJpdmVyIHRvIHNldCBwcm9wZXJ0eSBhdG9taWMgb2YgcHdt
X2NoaXAgdG8gdHJ1ZSBhcyBwZXIgc3VnZ2VzdGlvbgo+ICAgIGZyb20gU2Vhbi4KPgo+IENoYW5n
ZXMgaW4gdjM6Cj4gICAgVGhlIHBhdGNoIHNlcmllcyBpcyBjYXRjaGVkIHVwIHdpdGggdjYuMTIt
cmMxLiBZb3UgY2FuIHNpbXBseSByZXZpZXcgb3IgdGVzdAo+ICAgIHRoZSBwYXRjaGVzIGF0IHRo
ZSBsaW5rIFszXS4KPgo+ICAgIEFkZCBwYXRjaCAjMyBmb3IgZHRzIHBhcnQgY2hhbmdlLgo+Cj4g
Q2hhbmdlcyBpbiB2MjoKPiAgICBUaGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjExLXJj
Ni4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0aGUg
bGluayBbMl0uCj4KPiAgICBGaXhlZCBmb2xsb3dpbmcgaXNzdWVzIGFzIHBlciBjb21tZW50cyBm
cm9tIFlpeHVuIExhbiwgS3J6eXN6dG9mIEtvemxvd3NraQo+ICAgIGFuZCBVd2UgS2xlaW5lLUvD
tm5pZywgdGhhbmtzLgo+Cj4gICAgLSBTb21lIG1pbm9yIGlzc3VlcyBpbiBkdC1iaW5kaW5ncy4K
PiAgICAtIGRyaXZlciBpc3N1ZXMsIHVzZSBtYWNyb3Mgd2l0aCBuYW1lIHByZWZpeCBmb3IgcmVn
aXN0ZXJzIGFjY2VzczsgYWRkCj4gICAgICBsaW1pdGF0aW9ucyBjb21tZW50czsgZml4ZWQgcG90
ZW50aWFsIGNhbGN1bGF0aW9uIG92ZXJmbG93IHByb2JsZW07Cj4gICAgICBhZGQgLmdldF9zdGF0
ZSgpIGNhbGxiYWNrIGFuZCBvdGhlciBtaXNjZWxsYW5lb3VzIGNvZGUgaW1wcm92ZW1lbnRzLgo+
Cj4gQ2hhbmdlcyBpbiB2MToKPiAgICBUaGUgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjEx
LXJjNi4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3QgdGhlCj4gICAgcGF0Y2hlcyBhdCB0
aGUgbGluayBbMV0uCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di9jb3Zlci4xNzI1NTM2ODcwLmdpdC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIFsxXQo+IExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3MjU5MzE3OTYu
Z2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbS8gWzJdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcyODM1NTk3NC5naXQudW5pY29ybl93YW5nQG91
dGxvb2suY29tLyBbM10KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di9jb3Zlci4xNzI5MDM3MzAyLmdpdC51bmljb3JuX3dhbmdAb3V0bG9vay5jb20vIFs0XQo+IExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3Mjk4NDMwODcu
Z2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbS8gWzVdCj4gLS0tCj4KPiBDaGVuIFdhbmcgKDMp
Ogo+ICAgIGR0LWJpbmRpbmdzOiBwd206IHNvcGhnbzogYWRkIFBXTSBjb250cm9sbGVyIGZvciBT
RzIwNDIKPiAgICBwd206IHNvcGhnbzogYWRkIGRyaXZlciBmb3IgU29waGdvIFNHMjA0MiBQV00K
PiAgICByaXNjdjogc29waGdvOiBkdHM6IGFkZCBwd20gY29udHJvbGxlciBmb3IgU0cyMDQyIFNv
Qwo+Cj4gICAuLi4vYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwgICAgICAgfCAg
NTggKysrKysrCj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSAgICAg
ICAgfCAgIDkgKwo+ICAgZHJpdmVycy9wd20vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEwICsKPiAgIGRyaXZlcnMvcHdtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCj4gICBkcml2ZXJzL3B3bS9wd20tc29waGdvLXNnMjA0Mi5jICAgICAgICAg
ICAgICAgfCAxOTQgKysrKysrKysrKysrKysrKysrCj4gICA1IGZpbGVzIGNoYW5nZWQsIDI3MiBp
bnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3B3bS9zb3BoZ28sc2cyMDQyLXB3bS55YW1sCj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9wd20vcHdtLXNvcGhnby1zZzIwNDIuYwo+Cj4KPiBiYXNlLWNvbW1pdDog
NDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
