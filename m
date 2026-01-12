Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B20D2503B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1p3bGtlOKp1xPEgbKzowXBO4CYiu87Wak2IN47pPIo=; b=oEDcFZN+GIc3DD+OQIz2HN9jFe
	P5rzFitLks6jJvuJi8eEmYkAjzdNkFFJ33XgO3ubcUWKJktnSyp5HqFsrjaljyYjziv/AMiBXkcD+
	zXC8fRdH0MWlkfI6SlOVlXevWoz/nCWIS+kHv3CDXjyuIbqE7aiwVyZ8/cexRML837rWCVRqOr5Rp
	3MY9IOPbxO7nMt8Dsqle45H8yvRM7k4vOSJfarTjKRpo+geDqNQaMZLwtkIVOCLoeL1dBpxqDU7m0
	2ydEqqLG2i/hjy1fZby2OZ7qp1W+ydGH49uk2Nc+vEoKmkBIEz9etCcwzv668RAzY3z2jhm2i5CoL
	9aB8UsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBG8-00000004okS-0uIF;
	Mon, 12 Jan 2026 06:18:36 +0000
Received: from mail-centralindiaazolkn19011027.outbound.protection.outlook.com ([52.103.68.27] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfBG5-00000004ok2-2dMB
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 06:18:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvfYV/aClfrSxukq2wjRt55jYoRiO2mpOfvgU38lITUECKUIj+zx8oDF97WQInDHHYQCb6qfP66ZxA8kexa6XyA1WNU6Lj86kZl3YchABTnX455rF3TrS5O2MLBbG7Wkh/U884eyh0zo+GyxIXSwQOtWMpEB7pgLW5BrpsO30a1MjNAPFMDVxgjCSUeZKSQoiq+lyyQ0/wZZcsZvBGtUmvQcPDNVLpB4mUqIY9uJmAjRPueWI+xBpbf8Rf6RVGr8Ocio7FTZoIZ5HuwG79au9mukBqxjZed+cdplZUHwjfB5iuh2RHp6Dq46DWTwP+7Wrw7RAchcqebIma/QFFsBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKoJsEXQwB2cxMfeX5l6fLmP6hK29l7aK+AklFCZSss=;
 b=G5geOJ8Btx0pG8xGLMErWDm4rRlAFlt4PKVvfiZJNv20+FIJ3sNxmVlXm/O4zUfWRx+c7RnsVrwrwY5+b2e/sS8+bjpA1xRghHWfvCSTjRd9OjZGBNIOLv/sWsiN3xS1r6lL04fEOQHfV7BgGCfVMHul5QoeBlSopsoMBTNIMZw/NxiWHJakaxzpTpaJE80C7HDXuqPaacQzJY8hhhgMaaVwKgMeLcObnnq0i/GO2MfvDLcFPmX1FJCmQLOaRhmB9p9NaIyTL+g5Zhqvy2lkHzv/Kae4MQ+Y2pywdSkquhs0fVAP7NBfyj/U2H4pNBj/dkudV83hPWcCB3DXFU5AYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKoJsEXQwB2cxMfeX5l6fLmP6hK29l7aK+AklFCZSss=;
 b=savm+QyeGem6rzSRQp03GTrk+zadKTTHltQhBnK6Q6N3p7SPlwzF+/uofN9GKxRTfTf84SapfezH0V0sSF07BxF+eCfaY6O3Q/bgislGltJrvtSPFNMmgnGOq/L5iK6rBE10YPuCYq6TDUs2PDwiH42arczdlxpqMauaE3usKIOboMGnUoxqH0vaDGLeh3uuAY5PAeRyOJC0y/cjVkfpztQT9Ni5FA5CL9VLBhMg1YdCMxjzGDlhZqsEclc6BaIDZZIQlEDGWAYyT+d9uv8U1nCJ9mBryBd7qXiIX0WFwp73GJPuWsG1B5MnMz6r5zLkTUby33ojvocHixMyxEPzCQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN6PR01MB12287.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2fc::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 06:18:22 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 06:18:22 +0000
Message-ID: <MA5PR01MB12500A900256013C7ACC21FB0FE81A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 12 Jan 2026 14:18:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] riscv: dts: sophgo: enable hardware clock (RTC) on
 the Milk-V Pioneer
To: Michael Orlitzky <michael@orlitzky.com>, inochiama@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <20260107112922.20013-1-michael@orlitzky.com>
 <20260107112922.20013-2-michael@orlitzky.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20260107112922.20013-2-michael@orlitzky.com>
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID: <a8c750e3-8f71-4241-9c8d-e4be712d299e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN6PR01MB12287:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d67643-d58f-4174-af93-08de51a262ee
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|5072599009|23021999003|19110799012|6090799003|15080799012|461199028|440099028|3412199025|53005399003|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVR6NFpCSC9UUHlsaFFKSGtaamhLVVRCWWl6OTc3OTVCNVhMNCtlMHZEV1li?=
 =?utf-8?B?dWhnNFpjQkF4VU0yQ2s5Vy9jeUUvcmxTVE5YNU4xK0MvMzFhcnhzc1I0cU1l?=
 =?utf-8?B?NFd2NktzV3lRTE8weTduYTE3ckFjdnpSdnhBdjN5RWhNbTBSbDlGRnp0MU9B?=
 =?utf-8?B?N0lmK0xPYTNDMUM4RUJVVzUrRE9mTUFsTko3dGtBSWc2SnRpTCtQTzFRTDZw?=
 =?utf-8?B?Z1drcFo0djBYZ0htbnFBbkU2RXpHNVFpenkzRVcySmpkQTUveXVBSlJwOEJD?=
 =?utf-8?B?dFRLQlU5TVlMM21PVzRZWDQrdHZ2dDVoVi9jT0h5Y2RXai82VVg0aFhiR3RR?=
 =?utf-8?B?U0luUFhoY2pSU0tLZnNLcHM0Z2pFZStOaHVpSHN3YTdlMm9QdnRlMEl3NGU5?=
 =?utf-8?B?UnVsUlMvdHFWMnd5KzYrdUlBQ2k0bWtJd0ZnYTMwSjA1U3hMaStxQ3JndEZT?=
 =?utf-8?B?TWRTb3ZleHN1U29uWnpFUHJQRjRhOHpicHR2YWMvd3dMcTJPZkdkR3FXNmZi?=
 =?utf-8?B?SlJ3Ym02MG1VRld0ZlAxbXdRUXdqRDJRZDRrMDhEUEVtMmVOMHV0aUZFc0F5?=
 =?utf-8?B?S0NVK0kyemNCdEpuZkhrWVdld3ZkRWdKbmJpRmFWZk5FS1lCNENaOTZSQXYz?=
 =?utf-8?B?VEJ3dFJCOHFhNGR2RGNyd3l1Z09rWDhQZ2RIQ21iemxFVkhXQVRISktVcU4w?=
 =?utf-8?B?N0tmQWNuZFRycVF4dkxsb3YrOTJZdXdReHNxQ1dnaVZ3OC92UWwyNHpHY1hY?=
 =?utf-8?B?cDVvOVRPL3RnalNJRkJ3Sjc2SXFVQk1LYmdBUWc5Yk4wRGs5MmNOdmVuRHBs?=
 =?utf-8?B?U2F1SUVlMXhiUTRWZHdnb21HVjdDemZoUmNSS1NlTU5QbytRekxQd241WmF2?=
 =?utf-8?B?VXJ3NFJtdmtvR3h3V3krVmM1TUt5TFMyQzBtNElNQ0h1b1ZRd2RPSlgzSzBX?=
 =?utf-8?B?eGJGaUxHVUFZc1E4WFU0c3ROZDlxdS9IMXQ1Wk9Hc0lMbFYvVGFOa0dvSlZV?=
 =?utf-8?B?NHI1V2QxOGV6ZHRIY21zTzFvV2l3WVFXSWhrMCs2andHcW10M2FseEVUV1Nm?=
 =?utf-8?B?cEp2dHF4Z0F3emtSM3Q2eU92N1V2bURsRjRhdjBFZE01YzhtRk1XWlRZSjBl?=
 =?utf-8?B?YUE3ZVozWVExeEhFMWZWVDRLc0NkcTZ2NjhIalA5NzRuelo1L1hOZ05CNEJh?=
 =?utf-8?B?S1ZVR0ZHRExITnVDVjdUZEFRejlUaFB5YjNjZWd4RzU2Z01uNEduNGNFMThL?=
 =?utf-8?B?ckYyMldxSUhzN01obzNUbk5Ibmx0eDBQQ3dUTDNXVmFPa0NKckc3RVhRd3hQ?=
 =?utf-8?B?RWV1NW9PUWFDbTh2R2hYK0U1WXhGSHlRU1JFZTRIb3ZuVy9ySUlwTCs4TWxh?=
 =?utf-8?B?aXNDYlpNYm4xS0FoZEVHMk5VRlFyVVduZ21jQzlnUW84ZkxsZ0NKUTNzVDBS?=
 =?utf-8?B?a2VYcEhtTUZwdXFIM2hOMkQ5b0tKQWdJRVVWRDM5Wnd0dVJYRXBSU3pTT1A2?=
 =?utf-8?B?MjVUaVdvUTNZc1lUdzFicmpYcEtjK2tHU0JINGtPdnpxYkI3U1RoSEJqMnMx?=
 =?utf-8?B?S0pPS3dZQWJUUlZqaWR3emhhMHYwTHFKMDdLTE1Db0Z5UVZLWjJPTVZFOXpm?=
 =?utf-8?B?ZXJJU01jUGhqOG5aSUpGUzBOSkFYK1E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktzeDFVTHlEUmtNeW9qN3NWMy9YSVFDeVZYU0dhOGxaaFBEeDlQUWNIU0hS?=
 =?utf-8?B?MHkreDR6M3lmbXU1aW1qMHhKLzd1MGIrbVVEbWcycFBFb2tKeVRYK1k3dFJN?=
 =?utf-8?B?YXdMSDRQUEhMNDNzN01iSWl6bVpZUkF0SjRWNDRlaW1rTjBjS2RuTzBiUWsw?=
 =?utf-8?B?TUcwcHpsYzFMTGFQc1J0SWl3KzB3a2lwM1ZTdWR4WVR6b3pqUTFWSGhLcmh2?=
 =?utf-8?B?TmNYaEtYRW9hOGZpMUM5bitPbS9nUE1iMVl2YWMwN25mTEFTaStOYmxHdmU5?=
 =?utf-8?B?dUI0aFZUZENIcEJ6Z0dsbEVDWDJlYkFEa0NvalhBSkdzRUR6SUI1UmhGaWli?=
 =?utf-8?B?WENXV0lGUlhXTmp0MEFFYUdHWjdUR2JYRUlwSCtsOFNIdDMxWURkdWhtOTV3?=
 =?utf-8?B?NzRmY1BYZXVEMHVHV2VIUWQ1Q2g3bVdQb1lyZTkzbWJhTmFhYmZyWkZPYURE?=
 =?utf-8?B?WmM3eHRhTWx6QjFaSFlrV09sa3haUm5WdVQzZ01tNGQyUXY1ellCTEs1RzNU?=
 =?utf-8?B?WlozUkJ1MXNNYS9uOHdkMDlraXFHNDJ5eGVBK1lETHoyUkZ3RWdnbkNTUldO?=
 =?utf-8?B?RVB1d2Q2N3YvSVdZWjkwTGRGWDdtVTdKL1FzVXJsUkN1Qk0wRmxFVTdGcnU3?=
 =?utf-8?B?NFZlTnU4R0RqYktydnZETmNRSDdmbHdKbUtYcTdzQW14YTNhYnpMbEcyQzZW?=
 =?utf-8?B?UWFoOXdydWpiM2kyU1RWSlozUGpyWUZyS1Bqc29lcjFKb1NQb2EvQ2gyVzRQ?=
 =?utf-8?B?OGlTbXkwaWlDcGlQbWJSY0RZOS9LZUFSajAxNnpzc01sRUZucnJNakdIMWdZ?=
 =?utf-8?B?SVYvcVJGSVF2Sll4eDlaTjJwY2R5VDJBZkxuSHByc3lweDRzSEJxRGMyZ1Ax?=
 =?utf-8?B?R052OXlLR2Z1UVJWQVp2Q2xTRCt0S3E5clZFa3Ivem13NitGWGU1ZXpORDFO?=
 =?utf-8?B?RlU4V3A3SVNUWWxGYkFIODVZOXdZZC9OVGVUL0U1V2MwNS9YbTQ4L3h4elpy?=
 =?utf-8?B?eDVFNVVMcUEyZmdxd1dwR1FXcVlxOVV0QTQvOWRXL2hqSmo5UzhLNUltVVVk?=
 =?utf-8?B?UTBXOWRJNldQTUU2SW5JWGE3S2pZQU04U1o0WFNvbW1jSVFmbnVyNFhlUktv?=
 =?utf-8?B?VzVyU1p5K2VKL1BQV1hHMCtNR0x2WmFnTU9JQUJDWDFiTmorSWVCYzlqZzMy?=
 =?utf-8?B?eFBBYStiT1NlcEJHS1RrZ1NFQU1RSjNORWFqVTVvemRSZ0xaNElZVlduYjMz?=
 =?utf-8?B?U3RtblNHcFJ6empFTXd3Y3pzRFhiNzArMXFpZkNPenRtQ2tlQ0hKUGl2aHhD?=
 =?utf-8?B?WE0xVkQ4Z3NKeE9heCtwenc5OWFrbXlqVy85VTNyckxtZk8rYUtMVWJQa0N1?=
 =?utf-8?B?T2o0TW9YditrdDRFYTYxb3RZTHZLNXNOdmNyajJ1UXhtWStsVmtWYWR6dmo1?=
 =?utf-8?B?VkJPMnQxKzVuOFJzK3BQSWNvWkNYRCtEbEZqOTQ0Y05JSWQzZVVERWhFdy93?=
 =?utf-8?B?TWZoQTU2UjJkckY5Y0F1SkZOMG01Z3lLenFlaUxKOWhramJiSStuTmJEbGVu?=
 =?utf-8?B?elpwcXIxRHU1Tkk2UzVkdWlEUG1lTjdOT0lHTWkzd3pRc1MzanppbllLMkxp?=
 =?utf-8?B?OXVGY2FOaWFKbXRrbEVrTGVWNVBiTDhrcHE3L0NoalN4c2tEZHhLdlBIZDV5?=
 =?utf-8?B?VnNFbWRZWEhxbElNd3E4bzlCeEhLOFE3dElhNUtxRnFoN282K3FmMmtjcVpJ?=
 =?utf-8?B?c1dESnZWaDBhVjFobkZ4bHk4dEplVjYyd1VqU3hiZW9RdU9abjVpTnBLNTBo?=
 =?utf-8?B?a1dOaXRRYXpDOHNZOWFMMmFXYldnMWRNNW9ndlFRL0ovOTByODFhUFJ5UVVF?=
 =?utf-8?B?UWVLc0FmbFBvZ0dwTGs5T3dJNTNzTFdkbWhXM0ZsNXdIdVBDbTVLOGFWT0RJ?=
 =?utf-8?Q?K7GcNteBOKv6Y1n2U48WhtN7bJbufb+T?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90d67643-d58f-4174-af93-08de51a262ee
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 06:18:22.4126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6PR01MB12287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_221833_683689_7BB8BCBA 
X-CRM114-Status: GOOD (  11.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 1/7/2026 7:29 PM, Michael Orlitzky wrote:
> These boards have a working hardware clock if you put a CR-1220
> battery in them. We enable it using information from a 6.1.x vendor
> kernel.
>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
> ---
>   .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index 54d8386bf9c0..ecf8c1e29079 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -52,6 +52,17 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc: rtc@68 {
> +		compatible = "dallas,ds1307";
> +		reg = <0x68>;
> +	};
> +};
> +
>   &i2c1 {
>   	pinctrl-0 = <&i2c1_cfg>;
>   	pinctrl-names = "default";
> @@ -89,6 +100,16 @@ sdhci-emmc-rst-pwr-pins {
>   		};
>   	};
>   
> +	i2c0_cfg: i2c0-cfg {
> +		i2c0-pins {
> +			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
> +				 <PINMUX(PIN_IIC0_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
>   	i2c1_cfg: i2c1-cfg {
>   		i2c1-pins {
>   			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,

Tested based off 6.19-rc1 and passed.

Thanks,

Chen




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
