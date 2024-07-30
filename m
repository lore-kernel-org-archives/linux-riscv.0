Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F826C3DA61
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 08:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n3g9PInsrPQqPS/4/puVOA69mzPOHVmH9G7DF3sG+4=; b=4W/YTwBt3cUJ/iaS1qpJ+KGavp
	Jlu+G2RIK0oyEEeKiZmEOpDi36wW4sK28A2KqElTJFKB7hdnc75K62YBxUUpYL+LNtfuhw1/zRa2J
	t7bW/QXgD//oqZOfK0GZ4i2h5jgxSgvbsT7YOQFFG5fCnBFZZLjHr7LHLRGPgr4SgsQDbSwVoY4HH
	EbBjSs/hZDddj973TfAyQhZDnwCycw9tS1frvzpRVKVnJYJVB8PHobyeTuARIiXj91K9rBKDCEuqm
	mkKmF5/Xi6/E5sumT66YF7NAvXbCdDvhKUmqIPwbyPUWdkWnW+amlzLgvIZ0mW9mRClWTzUkr0+YC
	FP4h5Tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhly-0000000E8rR-2qLB;
	Tue, 30 Jul 2024 07:59:54 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYhlu-0000000E8qK-3KFC
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 07:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgmVdmJ5CmwoMQisvlt5Ov+FtRjiLQD+goEEaWchcBVdIHh/xkSLKzIkeWhNP+1rratBNxO3kYhbrldikmmn5rqzndmtDNGVAw/2M21rMb9LqDrcRTYnylADIAI8oscpNIdoEemK8XhnJ8sAldbDdIqSUgJvMip9rUk1FiEA+TXyVTCmMsZL9GinHUvZZJ0WTMafiE270fER13ddL6HILvJw7Up+ZAhhpP8t7PLIgrW88TMxaXVP2wBsEEYy7Mcn5olg4MGSOMcBuO6RzMnPLq3Lf/8EDbwslCGCKv+M57MZP+0OgKKbTeTupWF6yON5+DszIIU6G1CxlFUrnj9g0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7u0H8yIo40NEEVq8Xpd7F4zh3riYyMArrZ38uzgF34=;
 b=vA66nrewjGDN/cdmKHL2nb42c6ysy7BddZzf7cTc8eXI/75Jj3fFRnxVP4IzZBT9Cx0nFPNAvnC/+/Kd6JD16UkBnqnQQ6nGFMZyiD6iMUMaHSZVfQ4Wa8oAc3p57nsQjEnYoS4fiVKH9L8Qq308E8CJt5VKHNV7p/hDPmn3R9ce0d8LTH9gy9oMKEdisfcprDlCAXxd63jpN4HiYnm0Xk3WTBjMmf0xMzf5z5Aas8JuBv/v7ZM2m+CtBo1tYvCvNJQN+LlcqADWHpcd/84z94Kp9QncNNtHG8KRZq7CQFaXacvsC2b7UFOYVuFEI4edMDrrmgLSRKUThddAP82sNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7u0H8yIo40NEEVq8Xpd7F4zh3riYyMArrZ38uzgF34=;
 b=Y4m5hmZK0Bbw9z3T56NMAg6K6DBD+sRqq2aF3oyxov0eFITKGUSrZyjwcw5IYp94OFPzFWneLiGd41JkLvEP+ZdgMdRvYg0IFYhZ8wjpsAc8e6eAT1EAuRyM4YJZUQxoorWYrReScanEqcZHAMPHtT7uxJf8I6wTlrTnG1f3utENDaUJH+B9+p+aKDuA5NTmM8EDnk5t2kbPvKUoWpqP21k/y1B8eL5jycQm7AHf3O8KnkZRjcHDhz9aTyxGrGGXZLTZfPobRk3WfUh+V0/io1AdxmTLaq1UjV6FCIIkJ2r/r6z2A5rFcUeo9YAqyEoyBwkYzPwRoi6JT/1FIcyFPQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MAZP287MB0694.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 07:59:39 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 07:59:39 +0000
Message-ID: <MA0P287MB2822394D1E14A9EF41B190A2FEB02@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 30 Jul 2024 15:59:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: Add i2c device support for
 sg2042
To: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530E59974AF0FCA4FAB6DBBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB49530E59974AF0FCA4FAB6DBBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [FZ2mo/NB8oh3QdD6tqwM8aSKa9M/tVVB]
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <5fc39cca-4561-49f1-960e-ae845281d850@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MAZP287MB0694:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc4f089-731a-436e-f5d3-08dcb06d8fd2
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|461199028|19110799003|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: qGXtUZEIE3zqHbXY41wxhDpiLQ7E+TZNXckJIBaqBVm6iwn7Rt+gTyZug3SFlF1R1JHWeVz7hzsu7aRifFFmO/CrjBlmVmtwNk5nCeeqr2muTn4QCHLX/5CMziVO6gXQcv1DZEhQmLuOIRbbnqit4ofru/rZkqRMqGx2MOXfkIky9uEy6XtffC1lC+2PR39lIGuTtKxyNduG8XA1av/puXYjbbbHwyWKz9g5tO1sf+LIBLKcu6Nc9/2G2GAhs577lFuWctj6hGb9/8c9pvdsGIET+MkzS/KQgRYUktZF+qUdQSOTvKEWusG+sNOPUMiIGl1auXAOZNlBphHQ+jckUGbJfxwo4DFr8GHTKsqQBT0iCm3SFQCLQFYKZDr7J5kH7Dq/h/vIzENQkWbO0AKPwQ1AAi1s/XjAYjZCes27DFxzHyO/F4DAoujm4f6VI+D/gBop+e5XQ2yv2L+WTTUNjwdO6+OpnRdSsdR0CKq3rR9aFxs/tAqQwxITL1PdEuu+AtudN1IUTKSh+4MCUKSyPbzdP9ECUIaAMNtGDON7G0Vy5MoxPZXYixNKw/OMUs43+sPeOculgMg19cksVWfNNWJRiXMd1Lre9tKOHHex8J1S1oYc1FjIdnEDNgiL2p6PjagEKDgPt2FdtLe1MXkqRoJKlP2KBh3PNueC5/95zvhW170DUh8MSpGPgQ7n8ZLc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snl0SnJmSUlTUFJuaGp3blVNaGdHNlRpZ3ZuZE1vZHF2UlR4MW5WdC82a2Vy?=
 =?utf-8?B?amJRUnhjZ3hDWWJ6a2c5R01XSzE3L29PcjZScDcwSVRaMVZKRlJjZjdxdDJD?=
 =?utf-8?B?b2hjYTJFeXRSTlowa2ZkWkpIdXR2Ynd2SGVadk5MaElGT2FSVUtOZUpLZHlq?=
 =?utf-8?B?QU00R1VmbFNBamVPd3l4TGlMckpCd092dXlIb3VmN1JPOGdaaitaamVBNzkw?=
 =?utf-8?B?ZzJlbVlTNzZ5U0RhS1Q5OCtnMkUxdGwxVWd4N3haSUNDMVFYWDNMLzJSYXdT?=
 =?utf-8?B?bTVyWEhDY2J1bE1rOWwvVUhDdEJqaGFLWStvZis4cGp2Uyt3RTd1L3dyM3NB?=
 =?utf-8?B?LzNQb1NpaFpJaWthVDlubWNyditoWGgyaFQyTHN5Nmc0V0c5eTRxaTZTUU5T?=
 =?utf-8?B?clh2SDloRlJieHEzQzk3aDdpcloyNnEzeWxjUUxuYTFpTWhEcFhuUDJnWlJq?=
 =?utf-8?B?QzI3UWdYdURKVHUxQ1c3cTVJMVZRMlFra1VHS2JPTThoZ0FIdVI3OWRLandi?=
 =?utf-8?B?ZUNJOG43Q2c1ZlBXKzZ1TjZWc0N6Tm9QZkNMMWMyVEMycVFiZXVHeUV4TjVQ?=
 =?utf-8?B?TnAvcTZ1R1YydDE5Tkw5ZFZKN1ZHUnBjTnhXK3lXcEZScVRSdEE1QmNBa0pG?=
 =?utf-8?B?Yjluc01pWUw4M0NTYy9Eemp4Z21sM1NQQjYvNjBEM0Ixc1ZnWStBK000UEJr?=
 =?utf-8?B?c2pvZEVsU1dqTGE4a015UHZiZDRpenRuZDNXMWIvQXBsbGRtOVNMWTBwcEFQ?=
 =?utf-8?B?bFd6TG1nLzBGNTg2NXRHaGV4blFGVnpIMDBtNjZtNm5XcXR5SGk3dElITllp?=
 =?utf-8?B?MzZvNGg0M1ZMTWk0OTVhWkd4bW1mRzBXU2tHT0ovVHRIQTg5bVhrQmNWNCtx?=
 =?utf-8?B?eDN0R0IxaUZnZ2w3UjREQk9ZSS8vcmNUUHBKTlVvQXBaa0hOZGpyb051Zzlo?=
 =?utf-8?B?SVBiU1lBSzJFditYUEMxd2ZrbWdVTS8yTjFDbWlpemJZbThwMnE4MlhxZUtr?=
 =?utf-8?B?bWgzRnpYSE1RRFl6NHJVVlg3WkdFVUNlRy8vQTRWU0w0ZkdHWUk1Q1ZwYlFJ?=
 =?utf-8?B?WjNzeWxaazlyRnFxazQwaGxXTUsvNHM3d0dSNUsxdm1QRG5xVkptaUZjd0Rm?=
 =?utf-8?B?dDdEenNENmRnQndLRHI3a1YxbGJJWjA5WlRjRGJtZU1YbU9tUkVhVXhJN3Mr?=
 =?utf-8?B?MnJzSTd4dDZZL3FQektYRUhZajkwaERuSWwvOFZldHZKMkhpL3lEYUY2UG9Y?=
 =?utf-8?B?QkFxbWtxZDl3bmhmTEpLMlNNclJmZ0tybWM5YnU0QWlPaHNNdlArU0xmbUlL?=
 =?utf-8?B?N094VTNGSFlDeWZCcHY3eFMrSjFFY09objUvd0lVclIwTFB0YUhyN2hzUnpY?=
 =?utf-8?B?TmtmTWJrSk9KZGFjcWNqcGlHYVFLaEd6enNRdEVzTnBlY0hyckI4YWF2Y2hk?=
 =?utf-8?B?MC84TVpGS0dWRUVnOHZuVDFiZnRjRkVEWncvYTRtRDllQ2lzTENkTGY5eXJD?=
 =?utf-8?B?RXFBQ1VCak5CKzREbWJjZlFaenZNNU1YMjNlNHJtNk1DTEh0NktGa3Q3SG5r?=
 =?utf-8?B?cENWUkNUVThMc2h0REhENzYreFJyWnVWV3dzZE1uL3pTRkhjclUzemZmUWFS?=
 =?utf-8?B?enp5RHpyeFYyb1dSMjhGeWpsN1lENmVFZW9ub01SRFBibUFrMjBqUE5RMldW?=
 =?utf-8?Q?9M6YY9C9SzF2OY/dfdqM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc4f089-731a-436e-f5d3-08dcb06d8fd2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 07:59:39.3535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0694
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_005950_872822_60227F1D 
X-CRM114-Status: GOOD (  13.31  )
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


On 2024/7/29 10:13, Inochi Amaoto wrote:
> The i2c ip of sg2042 is a standard Synopsys i2c ip, which is already
> supported by the mainline kernel.
>
> Add i2c device node for sg2042.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Tested-by: Chen Wang <unicorn_wang@outlook.com>


> ---
>   arch/riscv/boot/dts/sophgo/sg2042.dtsi | 52 ++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> index c61d8061119d..eebd6817520e 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
> @@ -47,6 +47,58 @@ soc: soc {
>   		interrupt-parent = <&intc>;
>   		ranges;
>
> +		i2c0: i2c@7030005000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x70 0x30005000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_I2C0>;
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@7030006000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x70 0x30006000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_I2C1>;
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@7030007000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x70 0x30007000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			interrupts = <103 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_I2C2>;
> +			status = "disabled";
> +		};
> +
> +		i2c3: i2c@7030008000 {
> +			compatible = "snps,designware-i2c";
> +			reg = <0x70 0x30008000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&clkgen GATE_CLK_APB_I2C>;
> +			clock-names = "ref";
> +			clock-frequency = <100000>;
> +			interrupts = <104 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rstgen RST_I2C3>;
> +			status = "disabled";
> +		};
> +
>   		pllclk: clock-controller@70300100c0 {
>   			compatible = "sophgo,sg2042-pll";
>   			reg = <0x70 0x300100c0 0x0 0x40>;
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
