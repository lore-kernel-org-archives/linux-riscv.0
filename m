Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3F6CD68ED
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 07:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf77SlgmXA7zbXVuyFK9o+vc3GeoGbs9VCxAM/K9cW0=; b=DaALRH6Ipd+qarFvOfnVWWHWXV
	EWBSaNwaLaOtUlIXcDu5VnwuoVktWXb3pDtVLfYLdI476SgD+eibEUG3Mr316NcbR/Upi7entR0am
	ej6o5QKdOGcCSiyvvee4ZIb/xS4CkVuEXirsmjPzksQXoQEIBYqTuaeZKwvdbX2so8t98vvwKu6X4
	TfW9q+uhh6lhFH+739kl6TlnJ+6qcF56C/zfIUvHoA9IGboa57yYmcL6JEA4Bw1KmpWNPlxTITqXa
	7+dHluYbSUSaJdmNpqLRZfTTn5+LSm3NqxTuqRistwJXctVwsxZ9sWZBvblkezM8C92kxYSR9PwcQ
	hlEu5qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7Il-00CikB-2o;
	Tue, 10 Oct 2023 07:37:11 +0000
Received: from mail-bmxind01olkn2080f.outbound.protection.outlook.com ([2a01:111:f403:7011::80f] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7Ii-00CijY-0w
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 07:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOSnPYZrHUHkGDNKEiP5B8h87n0D1LFlEOqFIcG4p6/qRi/TAUv7hi3gPHQ4O6Q8A+twwxsnjY6+50n/iYxVEPiQQIguAhTx6AFz+v3FSbdm3tkf9O7pl6kSQOYO+JbE51BDg/4YJ6kPG53iXBbSOWjqXqMptn5usqidDR0UQyWm1qRHpUt22ZnTvUsTVHBblAkCqFdDUtXv7wxYiFXtex2DGMeZW87Qwq8vowOXSXaLWlm/S98xxfj9lVPGNlOqxAK5JkALPVe2OPLwGWJnM/MfoRV2T56B2IVBhzeXSN1Gf1NzxoGpBEJeiP13dNMq+gHnGvair5yw3Eo3TbFDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz7MOAMa+7vNi82tMaS6VkjbsM8RU/9cig/6gZcDcsg=;
 b=DV1Atvb02Eqo7xKrDT+Q56YfuKM34qLpsNyOKRMlbdWlAVjm3IlWpxiflR3gn2lUVYsVfwaxT9vu/DTCW/a/S4sfEWTXXDGQp11aXQd62IcLNCnY6uvyiyvQlH2wnHs8aZoVBcDJ7tXGnrIwUuXwTG20puP0O+T1FyEm0ES3BkdpSpbUXMtZezFffO2eTdBSOdW7UINIxXtzKWuK7KPyNf72Krd0cMhL79JsGF5Lj1ifJ1EPnT7k6TLqtLjOmMLnk5XnObj82rTUIl02U4Z9pFh5rnMGdAvT0nbRgd5kPlZrCFp/e+WAOgXyxuShOGzc614Nr0BoVwSY8xw8eU3GNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz7MOAMa+7vNi82tMaS6VkjbsM8RU/9cig/6gZcDcsg=;
 b=b1vJLq6UEDksw+ExaELzVQ6Y6M9Xgplf5HoBoUavPzPUJaLJP57f9HuqVZ8GUXIXocrZNHjBq2THdsh4B4T+9yj0PoVfSORCcX4UbOwsnOvuhdlCiYMfxHe9hfy4un0jEcibSqgFlKDnRpoeTL1P85gM+hxomBZSuKjDe8Rt2jiVPRes/mmPN5ShzT0wq1+EXWrbTbIib48NCMEG8Q0bsdhOSwJSerkU4EBsnIzoAZ+0stTV2MnLAy0evBH2py7F1wC1TTtliTT4EYorHtsBeuHCgv7xxjOPPxvIrxYALvSTXc4s+Ynt2J4aPHdTvWaDU00K/r1irOr9NiRrnea54w==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1537.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:191::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Tue, 10 Oct 2023 07:21:21 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 07:21:21 +0000
Message-ID: <MA0P287MB03321A9E3F3D8415DB9552B5FECDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 10 Oct 2023 15:21:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] riscv: dts: sophgo: add initial CV1812H SoC device
 tree
To: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
 <IA1PR20MB4953262ABB6EFFBC4B4F932BBBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953262ABB6EFFBC4B4F932BBBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [3kEYBiWBpnwu0riTAOQDKZ4g9QLOpHHp]
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <095cd885-e2ff-4f3b-8d39-4958214efeec@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1537:EE_
X-MS-Office365-Filtering-Correlation-Id: afbc8ecc-e1ec-4f10-b5c9-08dbc9617fed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RqDVRrp7ua2RJhy8/51AEeRbo9mO898xFe/C7wNo6RU2fEklnvuNRvDpdS7TMMg1E/S2gKEQInAvp3evl9FUDSsz/fwwQRNf8hfM4oCbwuxZTj1IRbkEbzoKHA4/Ulx4i6/OYw2hDZ+WQQ1U3eGtkjQPKM6+9QMYV5JeOCq+I/W/3jE38NHhAJRbwRhBXFvqnH6dJwBSboO8o01zko9kuj9mFEpyUEzDzJrfmjs+dDaWhFxPwea//Tr+OypTtA2JY3ompjwyq1Ey9XaNsDU9hUbL+kdD1aehflo+ZsXgFUVf9x0UDK+8cFLmBEd/mRmwSF8QtqVbRSrJvbyzHX2LmLV7iN3L/SfElp7/mUyuJ+zPo39MGp5R4AqWugechRZNP2MvsMKGE/BWugNg5MBb06il6GT6G38skXNoTqHpnNWKv8Bze9izYUsAqDbG0ulCbUcfxikmcBbCGDV6Gbsz5SqJR5Q9QDkingqH071et8gozv2nD44By9VOX9dPhpX5f9yIZvsYwL0UybM0i2CSPhJHcsXM2hWyl8Nbx+K/9HrGw/Ti+MNTMXA5jJOej7pX
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U05nNFFYblZoTDRZNGhEMTNINjB5ajZXdzgxL1RhVWZXcCtEaUtuclBEaUlK?=
 =?utf-8?B?SHN3UGVabU8xSXBGLytJdXhIcEc1aElxN01xZ1dITTZhSmJjOTJnU3F4OXln?=
 =?utf-8?B?ZzdPSHNxNHU3R0dKS0FWaXkrL085bmh6bldZWDVGYlhneHl5N3IxekNMc1lS?=
 =?utf-8?B?WmlwTG0vVDRtSHpuQnl0WFNGRFNuelcrNWhvS0JGMCtIL2V2ejV4ZmRncWgw?=
 =?utf-8?B?ZUFuRXVDaTBwME5ZMUcwdGpCcDFFaURiaGh4eWJkMWE1dE5MS0F2OHBiajJE?=
 =?utf-8?B?aTFhQlVUZDg2dzR0UnFKV1JSYklmdDU5a0FCQk5JMmdwT25oWHNVUzN0ZC9l?=
 =?utf-8?B?UndTQkRiT2hYcXVlZThsYUp3d1Bkby85ZFBuSTUrRW8wZ3NKR0VwREpYc1hG?=
 =?utf-8?B?U0lZR20rdkRYNXNxZjdpUXNmcXcrL1llOHI2bHYvbEZ3RllNVzJ4M0JWdCsx?=
 =?utf-8?B?RFBRUmc4bDQwajlPVXBzN2NqZ3hPSmdHdjBpYldiSjYxOUFMRThOQnkvV09Q?=
 =?utf-8?B?S1ZqVjZZVStEd3VpY3hqT2VacGdkMnFDUm8wUFZGUmFKamMvYzJLNEd6b3J4?=
 =?utf-8?B?MlFWWnRtTlBMZ3VRQ0JySnl5RDNBRE01bUdYYWF6dDJoVlI1L2xuR2xzZTJO?=
 =?utf-8?B?Q3BkR0Z1WkZwMlFucWx6Sk5yNHNNWm5NZ3JLYjRBVnE3UXJPVGtkVWVTYnhz?=
 =?utf-8?B?SWdYMjQrMDVERmQ2endCbW52bGFWaEptM3VSWUNibkhNZFVxMGRGSnZlejhQ?=
 =?utf-8?B?bURNK0RrRmVKdkx2Ui9yMGlhcHhvN2hrVHA3dDE5ZVNGaFdXSWlhVEtIcFpP?=
 =?utf-8?B?T0lCMmJSbGJCcWpaMVJqdDJzUlIrUVlvaC9oTXVzbkoyK2ttSWZLVzErS1Nu?=
 =?utf-8?B?bU5rcVBGTTdxQlpDMmcxamZ5UnJKOXB3TFBQQUxPdFZiYWsvMUxhajQyR0VP?=
 =?utf-8?B?MGhwalJxT1NWRXNIZ0VpZ0xPVFh5dFhHbVhWQlJIcXBQb00zUk5IcjlrenNx?=
 =?utf-8?B?aVFiZnp4bGZienlYUG1PVWI2OEpONXlDUjZuZFlwTldCZkVZbEcwMTdVb3RX?=
 =?utf-8?B?TkhCWG1GRHllOHA1ZlY4VWtERitFcFdGbHY5ZTc5c05kWldBS1JxS25ZcE00?=
 =?utf-8?B?RTVTNUdRY21zMytBdGNmNCt5WVFpYXloUlIvRW50cVZ2cEZ2czhiMWJqUFRF?=
 =?utf-8?B?c2k4SVJzOEFrUnRicXdlVEFrcU5FeW13UHFZZElLMmE4VlJoYlYzRHJJUjlC?=
 =?utf-8?B?L3R0RVJlYlYzbXdua1N1cGFZMWMyWC9FMmR2M2pOdmgvcWJ2LytZeE5zNERT?=
 =?utf-8?B?M0YxMG5ISzh6TkwvVlZ4b1B4Q0hKRnl4QkZJd2dWekcwVHlwN1F6Tk9pcjVy?=
 =?utf-8?B?QUErVjhlRHhpZSs4TkhEOG1KbEp5SnpLZXZzRDdKeTRQTDVMTTZ6c2s5VjFj?=
 =?utf-8?B?U1NhZTdVQ2dYWXZHUnBlZUpoRE5pZmlUeWlRalFIUG1aL0VNeEh5SGpHcjdX?=
 =?utf-8?B?V1NNYUZ5b2NxY2dOWndzb0hyS0NIRWxiQXEwWWZiMWNYZVFkWU5QZVIyb3dP?=
 =?utf-8?B?SWkyOGkrc1IvSGVmYXhhSkVxbDRJVTJtdkw1TFdkblArSXkwY1lGd2RwTjRt?=
 =?utf-8?Q?4od8gGK5rsa2ucIBUUffOjZbuKM4GPir4LoLkDvKDv0g=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afbc8ecc-e1ec-4f10-b5c9-08dbc9617fed
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 07:21:21.5690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_003708_338641_3440D527 
X-CRM114-Status: GOOD (  13.34  )
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


On 2023/10/9 19:26, Inochi Amaoto wrote:
> Add initial device tree for the CV1812H RISC-V SoC by SOPHGO.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 36 +++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> new file mode 100644
> index 000000000000..3864d34b0100
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
This include is not required.
> +#include "cv180x.dtsi"
> +
> +/ {
> +	compatible = "sophgo,cv1812h";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>;
> +	};
What's this defined for , I see this is different against cv1800b.
> +
> +	soc {
> +		interrupt-parent = <&plic>;
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
> +	};
> +};
> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
