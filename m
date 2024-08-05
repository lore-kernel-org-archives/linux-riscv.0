Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5145CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 01:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dgIRZvX/4nmcKScglpsDL4sBqDV7LAGPKrRLjdqHEc=; b=Uj4Jtw/uZJyPnsVIwdbkEJXRMQ
	LFXpvJdZ2p47f+Lx2MPjYh49jwyWEdUVNK+XLkhR+YVZnyvFusDf/jkwo4diqjlHHyf2p0M3scwoQ
	NMXltZmRAoZnyWuz2jRxd51A7gWDWAGC+t/ATm5haOl8wYKhYC6sAyV65EBbsaszws3CdW0xlJZjO
	2TA8nNtzfPBESCep3ss5tE2JVkDBUlkZmChhnaVwT9Z3bhmnw/ZCJ8xirWi9hWwnm5LG9EX514p/A
	dJMY1jHj50Ug/ICcU/kZ/+XLiimt7SrSA6UGE801t1t6OcyO3ocVkkHn75rUZXChzSMu3OKLRtdqX
	MEzHkcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1samZv-0000000EIht-0RCm;
	Mon, 05 Aug 2024 01:32:03 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1samZr-0000000EIfi-34KV
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 01:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWJWiG31I36PFQSCCVc6W4rYI8m8GWH5aNEA3dX/kEE98w3UDATgIw7+PAPrqhL/RCmsbqOQXnnChXS6kWA3iTtxyYmX5FScLAVr4gevAONhpgdSnb4ASF7hDEAgFFnOEGD7ftnyi0P870GGJERlG67S9sa0ed/HDYfzpQ7iWNP9jkiFXqzM+uhaSBZBclGj2dQzw6pzxWksI2P1y9z/cmjuSHutDCvEFKy5+/UVIh/YUal55//VZNbUE2XAUyAi/HTNXPZ6iC4M5hQERZRKW+SFpDji3Q+T7MABdEYY1bsNNLGC26BZTZXSAe0InZ5cwD1RO10/FZHU4T9o6LY74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyjFHsYIt8gMibD+yMn4dHE3jI4nHIYAYeYf3KCbPoc=;
 b=wEs7q6Iy3Q/moSOYBMoIadNTUiwxxdIvs1VxrdqwA0RObUy0krhPEdFmR7Ab5Yea6+upxeiEPiGU06g73k0/0m/T4QJdf4vU6n7Cowfn0oSH1KbecMAMNqgPxrqtfTe6/Y6K67DtVyIsJdO74NxKi9vhFoOicHEn7/YYDRcNVve//BfcEBAiyLJ0JhdiqV0FcMXs+1EkR5ZxO/TfJRpLD7JziNYx+gpD6ayKjUs9DmUpp8V70g+d5oBZ559r+54IPYtxPqydSngeoPQAwpjnjApKrk5wkLZgtrD+D1A520ZAWlU1L3kYctWdHC6rBflS1f1d/4LY8XywngWE52w84w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyjFHsYIt8gMibD+yMn4dHE3jI4nHIYAYeYf3KCbPoc=;
 b=aZ60pDsbgoqXE19UpFbf6cE6g8KaA/0WZDFNR5jgrJyUtUrcAze+mHu1Luwvx/e5F4GOCwRCT8j7ywPqVqOtxnwF3kF6ykDh3AVC89D002fQqAuHhfSNXyr1ANaCAx0+IJfdi386+Td+ywxZZiPaoe5ecGPrC8tlTjJ7hu6I+3QYeZABf7SVnda+ZOXvQHn6gtX2DUOLLOHTSMmtnn7uFzCXTuvJVNWyMsptxuip3bdgOub/AoJJvEroFnWFPPAEgEAQWl72qYfJ6Nbhb+5x6+2PeJGtYj3ldnOLh6KwCCMPinmF31REDUAj1OoZ6E5DqMVrfTTYj+xvuvIG83PL/g==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1137.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 01:31:39 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 01:31:39 +0000
Message-ID: <MA0P287MB2822C3C5AC61D2A91542C33EFEBE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 5 Aug 2024 09:31:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] riscv: defconfig: Enable MCU support for SG2042
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Jinyu Tang <tangjinyu@tinylab.org>, Hal Feng <hal.feng@starfivetech.com>,
 Yangyu Chen <cyy@cyyself.name>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530E505BAEC8F92B19F37FBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB49530E505BAEC8F92B19F37FBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [kaUUtZue337fUwQvBFZOHyEpFLSZbalU]
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <8fc25005-f9fb-4d03-a516-da590047f105@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1137:EE_
X-MS-Office365-Filtering-Correlation-Id: e93f3df2-f9c0-423c-5145-08dcb4ee593d
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|5072599009|19110799003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: wCyIAOE3Kc2lf3MHiBxveRdEAODZixKh+2XDgAUf0sswXnlCYywMuxSpVuTAZcJqmQ8NuA0uUio9ztrnoU9inuksIHTQtet4p8JwZQ3ESGCurmkobp/fx5FsJdBiAnyuf1GAHDGbY3p2E/+q2dQ95GzI8FV1iK4PeZ6qLM5bPtHwc8ZLOstgvHRX+iI3nEzpXsQK1fV201E66NuVQuWkdbTg11nf7KzhjLALdaw760PiM8TFp0xwFnTixhnd4R03NA3qSL/hkbtze6sEtW9Z4hesdcfbJHSUw/dMBMjQnDXvLpCE/Si9QU17CzzFqzjL8d+Q3HRFGvVonyLcudD17lDsVFwRNLm1xFNFVIA/O7yNMgHmdR+y/0VAaY1Odc7cPpLB0oZPwUwITyV0AxJ3bCOHn5kghvMxVXKQA+aZEoCAjFmseFZ2vXhTydom1CNDGVwOJNO6CeNG147KcEtpqX4Xh4H5W1E1J5f6YWh6AiXa8Lcv9L3WALoZpL9HOq/Pe+kBK52vPcdBpug585gJunVl4EmiP12Hef4pTSn355tZQF5dUgcyAMdMFFBZUrpXsBG3G0W2BAv4nNld7uGHFyrcEMFikUbV8wHgM8Y7f96BwnYJZ5GsAjcLvmU1CKb44Wh9cmspYh+taM28oQGvetkqrroLivTlFjiv4vH4ujNC+Y8VDydwdN9J9od3nywK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFZWMm9FSGZKOGo1Z05TRGsyYVlSalp5UVRrbS9FTVdQTU52RUlKUGUyK3p0?=
 =?utf-8?B?Ujc3VHRDdDZqU0xTQ25HNWdmSitDUGxJRlo2a3d2M1ZySENxWlRFNzhqSTFU?=
 =?utf-8?B?emxGU3U4Wkt0RXdBTUkyNTZTOVFEaDBka2Z4NXdLWk5tSWVvYm1NazhwaTlp?=
 =?utf-8?B?U3hGSnJWc2xoRmVZWDBydmRMa1JPN2dUWjJpOXZURTFvT1BVWEdNeDh2NmJL?=
 =?utf-8?B?ZEF4K2x0STEwV2xtM3o0NS85QXpFL0ZiUUV0SndMSmZCQkg4RnREc01Ja2I2?=
 =?utf-8?B?SDRLU1FZcnV1YzIvY2I4MXl1dW52NWN5REVoSlBtbHhHYlhtK2VBKzdIVGtx?=
 =?utf-8?B?Z09TQnNYcVhlSm5WS0lSKzliQ2tSaXRJdFI1ZnRVTCtiR05OekdiUHVldnBY?=
 =?utf-8?B?R3YxQWkzOHpyYkNGUkFOSkVqaHlGVmZuSlhMVWRia0o4d3F4OUY0MzlWRnpz?=
 =?utf-8?B?NnhNMTBaZXovb1JHazFUU2twU01sV0pVYkl2eFVuSlNEc2J1STNzYlQ2SXV1?=
 =?utf-8?B?T1NocVcwaGltcWh0L1VTcUpiQlZWSE83KzQyZ2VnUVJyczhGNXVNblJqSGYv?=
 =?utf-8?B?WkhiTWY2T0RSaE1WRWhoRGg0M2k3L0l4L0ZtTmhzSGR5OXU1OGtNeXNFODZE?=
 =?utf-8?B?dlgzWUQ4V3RHRzlXV28wTFBEMjZBc1BtMS9rQzl1Rm85dDIyaExUQVFENUtu?=
 =?utf-8?B?TTVHenhaYzhPc1p2ZlR1bVh3a0JzN1VsbHUwMU0wNWRBWGhjSWhlNGp4TU44?=
 =?utf-8?B?TzljNkRxUlI0TU5BdEV4L3VPM1FUQVpPaTNxQVlGaGgyOUR0NlhXYUI0QkpP?=
 =?utf-8?B?a1l0eHBUb1FrS0J4ZWpKSGVBU1hLcWQra1V2ZEZUWU0wdkJxT1RURGMxVjNx?=
 =?utf-8?B?d0VDVE9qNkhDVnB2dUI3SGw5N0hEaloraUVrVTg4Q3Zhd2F0dDlsUXJRQitx?=
 =?utf-8?B?TzMxVHN5TVkrb1pxY014UEhkYUNETmlkVFR5b0Y2NjVOc3lhRmtlZG1WZndr?=
 =?utf-8?B?dmVvRUl1aWNOTTc0dGxpN2h3WVF3YWNEUy9iZFgrYm1nT1hwdnNJaVBGS1hS?=
 =?utf-8?B?M2VtY25xcEdxVkpERlMvRGdrMjBPaVIydjZoZjVhZ29BZUhUTkhHRUw4UGU2?=
 =?utf-8?B?RmlHZE9aNkhyNHg1T1d0emlMTGdmbE14b25SSTEzeXJTdkVlbm80T2dIZFNN?=
 =?utf-8?B?Wmdybk14Z3NWb0pWZ3JMWFNEaWlONXplUnI5WXFERFBFaXNHZzh6Z0tRcXlD?=
 =?utf-8?B?cFNPUTZBMzE0UldlYTZUWmI0VndXb3hQMEphM2ZwM2ZyWVlqNm9kbm5FYnFk?=
 =?utf-8?B?TDR5aVBob2M1TFU1MG9HbytLL3MydVY2WWxYRThjczN6NVpiQUNDTzZNWDJJ?=
 =?utf-8?B?RnJEdDVTZzAzTzE1MlBtSnIyZFlYNVU1STRlcGliOGY5OHpQK1FySU93akpE?=
 =?utf-8?B?VTJ5NTNDN0FxVFY5UGJmeXlCME4rRWp5TzZuK0lpVkZuMWVGTmVvaXhLSVAw?=
 =?utf-8?B?MVFMOTN5K2xwY2dzZm9ZSDhxSTBwTWZqSllNS05nOFlRWUJ0cFVxeEdqNnNO?=
 =?utf-8?B?ZWRheXlicDJhaUVpTDlnNFN3NFZIaGtybnVrRW95dGpuQU0ybDhzME85STNS?=
 =?utf-8?B?ZklPZE1wQ0thL2hRRThPQVFxNjE5eDY5cTdwbC9PUEpaMktNUXhaZ0JiVmJI?=
 =?utf-8?Q?cJAQIRUTgc6WfjixxCFN?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e93f3df2-f9c0-423c-5145-08dcb4ee593d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 01:31:39.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_183159_816602_CA1E6B56 
X-CRM114-Status: GOOD (  13.39  )
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

Why this patch change the dts?

On 2024/8/2 20:38, Inochi Amaoto wrote:
> Enable MCU driver for SG2042 to provide thermal and reboot support.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Tested-by: Chen Wang <unicorn_wang@outlook.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 2 +-
>   arch/riscv/configs/defconfig                        | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> index 8b8fdf6243d4..76375e25a495 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
> @@ -67,7 +67,7 @@ soc_active3: soc-active3 {
>   				};
>   
>   				soc_hot: soc-hot {
> -					temperature = <85000>;
> +					temperature = <80000>;
>   					hysteresis = <5000>;
>   					type = "hot";
>   				};
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0d678325444f..a0f346301df6 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -170,6 +170,7 @@ CONFIG_SPI_SUN6I=y
>   CONFIG_GPIO_SIFIVE=y
>   CONFIG_POWER_RESET_GPIO_RESTART=y
>   CONFIG_SENSORS_SFCTEMP=m
> +CONFIG_SENSORS_SG2042_MCU=y
>   CONFIG_CPU_THERMAL=y
>   CONFIG_DEVFREQ_THERMAL=y
>   CONFIG_RZG2L_THERMAL=y

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
