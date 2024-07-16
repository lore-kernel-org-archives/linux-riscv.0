Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A808C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 12:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrvG4TwZEWEvRIZglFIIzLuLxpyOd0o0Ou8OL44uCb0=; b=WBDfi54KwXtNPzeVP9fL4ZdqAA
	1BHUDhSVUpfXn5FvIW5ZMY4LvD/YjQ+OPjc6Dpp9EmhbMUrabP+35AJITcr5vgI8dveTtu9g6pPYT
	biC/4OaDjqSKIY2VzpeEJ6+wO90mttndj0DfntpYj8DmswTU6oy6F/InP/Ru5KfZJTTmm9omssyo7
	FovB71LGfinsRv4INbBws+Ror1DQlSg0zkb0oXgKccYy7XcnWnEAGGCFN5oV9XD88NMTI5sxvZijw
	ACNJ4E6GPXsfa1PWJd/VLv1pMglP1X94WUBlIG6jEYEAWHr/wGPe+6DgLcSqoj8KZNjWxEOWB8vG4
	QuhDBcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sThiO-0000000ATcN-2Jpi;
	Tue, 16 Jul 2024 12:55:32 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sThiL-0000000ATay-43fN
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 12:55:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie9Cvco5or4O14kHh+Oy7Hdpw+bkat92Te4HvMi/VEF+TrVZi4D1HaEm/PdVMgvAAixRzaR16GC65edDTghBoZHP7r7pWlcjSSp4tNWGwARR6jtkTHCuafcQSTJjzZjvr0sCZAgrasLSZN4mCFCoTTZUpKI5RJoE5GmZNFvEZ1zLW+kGmVrY0RMJvSxAiUWXNvptcZguN6Jx4VbxDGJSkMG0aYYb9uvdPYpC1QhaGOf9fY36yz8ECs3evf76tkpttavR1KnCtcgG6FObXVOwYDkKSuwSQQy2hZy8Gj2j18RqMaf7k2QmwfO+NaZGD+UoPIToPDtngSCSpKZ/6tpJTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DVOLpM/vbA8nhnxDTM/75huXf/5lkVcHtyP2/DSgiw=;
 b=BJJzg6iAr92TvJ2SCIS06CUjMGoTP+wfq4NzL6j+69/KoeAcAaLo5XVYD6l1Roz6Sn7lTd48jN1v6Py6UYwSJ2yOrkAgeGxn34e7/RvkQAkwQ+6QQivI2tEUD7okuihKlPqtsNzTKwdEGWkzqdPv2B7SGalKx6IoIUkrMzEEY4w/njIZ+jl9VIJ75u4vdTQvva1HlPxUA5TMUkNQ6bIb+70y++Xw804FJpUwi9lWA2hCRzS6LQ0A4rRgiqtQaG+gg1tL965cmBustY1LLI3EF4oCcJGoTolhbMdRYbgewxrbIb11pLWBV3MN0wATbM+LsH9MMndD0b5NaLsSTnj52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DVOLpM/vbA8nhnxDTM/75huXf/5lkVcHtyP2/DSgiw=;
 b=qKDpcoUiQc98+tF3PE1tlbQRPxrWB5lr/Ztv5CulP500qCo/oyKQuUKQLblMWrj19nxdLQnWg8nyge0H27f6vjc2VmMDBjYPhGbxdHhG6W8PxLA1aRZl15wVwxiuYsTzSDaf4r/RcfNxX4s4lvN7yxtYf8Sa+XbuH1B+F3OijHzbHsgECX4QrZv6t6SiDy1BDP1a3TIm3mhv0fUGrAGolH6J0ic6ZAFcuLw5RPgXDDXtlcIiJTUoOxi66XiXZymf9DUCfMDyZHFvkKBW7QaN/vsFslrtL/JcwPS1gb14ogIC+M6WDvEOZPu36/+CPQjmioMfeDG9NBy97ZsYjkYJDg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1429.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:187::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 12:55:11 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 12:55:11 +0000
Message-ID: <MA0P287MB282276F453744C2ACC2FF627FEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 16 Jul 2024 20:55:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] riscv: sophgo: add mailbox support for cv18x SoCs
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 inochiama@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-TMN: [HU9yrpqE41A0Q2X1eBz0jYWyFxfcNtnk]
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <8c04fa6c-aa46-47a0-a11d-d6684f44c6bc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1429:EE_
X-MS-Office365-Filtering-Correlation-Id: 71453b00-fd3a-4b58-fdf0-08dca5968733
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: tQIjGt4LUzNvxkZSSibhjpDGozXN0/iCznX9c7jNeCBTUk67QgEeDPAiEocYzaUoGkO4BwN6scw1eg+p8FLF5B8KUFIsbLHqL+UdK0oN3/XayBXNMoR2XDD4ZRxrHQ5FhW110LdzaRK4SyPysUV4sQ992U8PCiU9/htf/KUCRz0NJFJojJXBe8CumtJFeO0OktxUE4AGc2l3+GAeCYX8a/vL5bZeg2smRUFtBv8nW1WsfKBVhcQlXCXwMsI2EAWGCbGIRvm9SuVGDHWa5+itFQi+ayxuRrFAnTlxsPlp/Gt+o8pGI3gfkVUGjy8rkwCx7pOJ40btA0GrSj4WslsKHXif01V1WmgLxymZwxE8WY/9WOyNGSbxzOdrHmvxxMJ4WUTWLakKRfXs8TiucQ7GyfCv22+jqrbaqD31a0Fvw4W4FhZyEZ+PnAmCuGw0schgfMeTMTf5lU6WL79kwPqrUWf3sZIkJfb/r99zajFlf/3NSa6BGsakN2kSEDpui8hMELP71gQGkNmjwz97wdCRlMtBgcvH4hBAPqqHbxZmnwo7nO4d2cXLIaLQUt6InEP7gHXlrdBKRl1MsflgGkqrMazqk97y0wwJ1A0PvxBo5hT2ExxwZdbjILlSQ8FItLFuSEL5lb2rMQLZ1LA8uewFwg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdpTDJCazk1eVVFRlNWcGxxbTkxYnBKYnlhWUNXamRseEE0WENxci9iN2tk?=
 =?utf-8?B?Ri9obkNhVm16Z1FvdHhQYk1ORVNRVWhXM0hPd1Blc01pdGxxZmIvTzlJWkZ4?=
 =?utf-8?B?OW9vcWNLNFZXaGhxNWZncFdaODQwa24vT1V5N0ZMazYvMGsxdlBlL3BsUnVG?=
 =?utf-8?B?TG5kOXRvbDR5ZmdCQ3NkdU41TG1rUDgvZkVoU0RBZFo2WExKWEd4Z3FpTXN3?=
 =?utf-8?B?ZnRtRHhEOUlsVnlrbjgydE1uT1ZZeDJvcldZNlFncFc2RWJOKzFWVkRhMEth?=
 =?utf-8?B?c2hIMXlNMVpKVStWeTlFM0JKLzBORXJ3V2NDL0NESkIwaStieFZ0WEpFeFB3?=
 =?utf-8?B?dVhSMWl0OG5wblNXYW9QNno2Y0UrMWg2T1FGbW84cnd6ZFNrKzRkeExvZTBU?=
 =?utf-8?B?NEFraUowWTJtT25pV1FzRDVadHZ3M2RNM1JyNkFUN1lEeENOUFhNZWJKZ2k5?=
 =?utf-8?B?YklGR1J1V2d3QllQYUljRzI2QmZkK29VRHdqN3ZvVlRubE0za2Nld3RMNHlu?=
 =?utf-8?B?UmRtRWx2MVJlYjNUY0FnR0pMZzNqRGtOaXpYTmVOMTFuVnR5RktyY3B1a3N1?=
 =?utf-8?B?YzZLcHhYblUrL3JtVXRBa3VEUFMwUVhTU2tiUkdkUUpNNnNzM3dVUXM3alpw?=
 =?utf-8?B?ejRDZFFOdHBmK2REUXZuQlRDbmQzSzFXcVlZaUk3SGNOUEV5T081blJWdndE?=
 =?utf-8?B?WWs2ZFhxb3hRaCt3d21aVnJKUkVrT1hqNFo4Y3ZzUytVUFhnY2tWTGV4M0VY?=
 =?utf-8?B?a090NThTSzVBaG44L1QzS1JYb2pUajMxMjEzNEthZjkwNkUxNzg5dFA0RlVK?=
 =?utf-8?B?OCtORGJHNWN1c2pYL1ZSdGcvUDh5RlNHQ1czWGUwdHVWV2ZBajRIaFBGY05W?=
 =?utf-8?B?QmR3a1AvMXJ4TGFSODZnVDRNeG9nN2pLWmtiT2VxUEtPMW5VZUVTWTA5bEsy?=
 =?utf-8?B?MCtOdWlCVUxLOFVOTEc2MjcrY2VySFVhaHArN2xWc0hIQWlYMjhFQnIyR3Rx?=
 =?utf-8?B?NFcvckhyZktKSXRVTDV6TnQ5aktzbUQ0V3AvZXh2RW52dlk2TnNCK3lYU0tv?=
 =?utf-8?B?eHU5djQxUVRlZjV2WUYyWVc1TVk4M2ZoYkFIbDNZQWRvS3FoQWNOaUlxZURN?=
 =?utf-8?B?M1IzNTY1UE41QkpVb0VwWUw1bDZWMUpLT3ZFcDg4anJITGIzSUFKaW01b2dJ?=
 =?utf-8?B?N2hEZTd3N09Pdy92UUtEM05JQ0d0SU54cjZnVFZoVXgwU1FJZ095Y1EvYnNy?=
 =?utf-8?B?L1VUQ2hEWDloMHdsbWJ0U0ZuK1hJRTdxUXdWeVlIbHloTnFTSzB6eDBybzVC?=
 =?utf-8?B?VE02NXNUaGVIcy9DaHJNbmN2OWxwQ3BWWjF2U1A2NXBDWGZMYm81N1J5Y0w2?=
 =?utf-8?B?eFQremN3OEJ1S1dVbHBNODh1VjFaZWI4TnpKU05ZcWp3bk1nZEF0eVZnWGJ5?=
 =?utf-8?B?azVLdEZkeTErQ0hrdmVHd29DODdCRm1nbUpXaUVBL1RoZUVjMk1WdDcySy9x?=
 =?utf-8?B?clo5d08vUVNSL1BUMjBsUFdJR2NkcTRic2ZldnJTOXZwUFlLVllwaE9PNHlG?=
 =?utf-8?B?WExBTmdmOWtLRDJnaTZpVkJzZkxJM0dtb0MvazlUVUFDUEYybGpnUDdVNHk2?=
 =?utf-8?B?Q1RJb2F4L3NRK2RsejdzZmFFNDcrei8wa3dSeGdCN0RXT0I2QTRHNHZ3SUFH?=
 =?utf-8?Q?SPXRyF17N2v5ek1+FNa/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71453b00-fd3a-4b58-fdf0-08dca5968733
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 12:55:11.4515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1429
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_055530_054005_B86235FB 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

cv18x -> cv18xx, please check this for all patches, both title and 
message text.

On 2024/7/15 0:28, Yuntao Dai wrote:
> Add mailbox support for Sophgo cv18x SoCs, and test on both cv1800b SoC for
> milkv-duo and cv1812h SoC for milkv-duo256m
>
> Changes in v2:
> - drop 'recvid' 'sender' in dt-bindings
> - fix compatible to 'cv1800-mailbox', and change filenames too
> - change #mbox-cell to 2, for <channel tagert_cpu>
> - add struct cv1800_mbox_chan_priv and function cv1800_mbox_xlate to extract
>    informations in mbox devicetree node of mailbox client
>
> Yuntao Dai (3):
>    dt-bindings: mailbox: add Sophgo cv18x SoCs mailbox
>    riscv: dts: add mailbox for Sophgo cv18x SoCs
>    mailbox: sophgo: add mailbox driver for cv18x SoCs
>
>   .../mailbox/sophgo,cv1800-mailbox.yaml        |  61 ++++++
>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |   9 +
>   drivers/mailbox/Kconfig                       |  11 +
>   drivers/mailbox/Makefile                      |   2 +
>   drivers/mailbox/cv1800-mailbox.c              | 203 ++++++++++++++++++
>   5 files changed, 286 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/sophgo,cv1800-mailbox.yaml
>   create mode 100644 drivers/mailbox/cv1800-mailbox.c
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
