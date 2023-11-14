Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A03C074FE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 01:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SWhCAdZThz19KY4U6cneBAdGYc/UZeAka0IFbFbwvS8=; b=xTu9g0Oy15knrSyReH15Qdbwwf
	6kvbpXWr5GffiWu0I/nwIPdSqYEAPbdyi0nB3D821gTFHQUFCU6Ua4US/vK+Y19bJetpE2S42FNFm
	kEQwDQiSDWO8MhMuvgwZBj4LbKrgrb4L0qyi2vSxTsiu438mCCxiIAhNv3J5hBu8izhl9F4dw8QyI
	7HU6WDgyByOrMX3bACYbrx6EQiEOnH57d6n/IP4cMl4ceHnKAAlXS+qnL16ecamvh7FPnH1tx9N9z
	+rzWsqzRMPkgJjTcKTPaNhErCNjBMXzhDW0n1pYwU0DEYd8ch7YvYKGmCyPsvHHLUQKW4veINgRGI
	W7Cdja5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ici-00F1q6-0j;
	Tue, 14 Nov 2023 01:53:52 +0000
Received: from mail-maxind01acsn20808.outbound.protection.outlook.com ([2a01:111:f403:700f::808] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ice-00F1of-1y
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 01:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISvgisN7O64msiXWsxJl+wNssu1oWz3KzuFuPqREQNkVlDqZ6qVy+FmVi46fHz0Knzm1s+IPGsAcTGVdTDQ+xPvFLCOe3lLmK3YrXdV1YkDlhA/dcVxR6wAdZSOj9tfBDsVkOBix9F9kqDsf2bvhMbTb7Wgdx1ODxzd8c9YMGpfmxwI999rABaJjYAHDWukI0xxaEYwBcoqws+9RO1ZDb9CwLOTbmSDKJO9HCq8qGul9Zqg3rMcUVG5hh0A8L7j4rdjB0Z+3MJEu2u5lSgQJ8+2tjde+Dc4mjjmZKP47P0q7R3ukN93H2PuAFSJAPgsIE8SByTwxBzC4ZAi8BeJVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9haC56Kmp/BJ8W1MaJtORpKeLFwZhhS7SFxHsrLmJCE=;
 b=E8F4UbR3lATAOx6nHPfQckwSg+6bPl2zftqAlfwn/ucEJoVXly3aAKZ2NH9/GYeJNrdgIEKhh/GbfxjwZZJZHU1j85KEg2iWyx9SgPRGUR327vH5Te9n4Guc8XfYf9ceMAay6jgmPuujeSWpO0ZKGJyQZqzgkZd9LK0GJ0uS5JvX1b/0WfYOFZolQ+61wCjuWfL/FskQoi1N1bZtqhw4fzmZL19D8cNO8gDuyeyxVNjzQ7M+YMd3PkOQMehix/Uy34X195kIsJpg+3QTX65OGcwkSQEaUVpwmFKw61hgu53xirshC01WE3rHd3v+L66PszybCod1eRa13O0xxF96bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9haC56Kmp/BJ8W1MaJtORpKeLFwZhhS7SFxHsrLmJCE=;
 b=JhNcD0jD1XDaxW2njdKGk4FVlKJVAkdslFDmPT2fAtlAkKnDECReG80DoW68gYP27CFLFsSlKklaSCupke3QaBV1jfqhVAFKmgMuUYxkXVUJkIEKRuHJMc5Z1E9YxY8qCPZ5ikmysMdoWghOEjBJ8vlAXQH2QC5D6dqAmfR4eVEgkpe3ruKAjP/4VMKvpbYNt0D2xlBPzLhixoOiLdCWGYhW5YeBk2pvHhCMrwTCuZis3uLnnBTbccxbxZ+sAqYd7r9qMrv5hz/1KYVeHjBp7xGVznNF9wZPyYq8GJ3zf1VGw/YZiDYfmNk5FLIpvNylfdDnoo60P2/2galEUk/MLg==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB2027.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1cd::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 01:38:50 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 01:38:50 +0000
Message-ID: <MA0P287MB033298A1F0F1B59CDF110E52FEB2A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 14 Nov 2023 09:38:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: cv1800b: add pinctrl node for cv1800b
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20231113005702.2467-1-jszhang@kernel.org>
 <20231113005702.2467-2-jszhang@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231113005702.2467-2-jszhang@kernel.org>
X-TMN: [afc3IvA1y6NMvwZR57xOIjn45l38FSxtnxp+x+PP3rc=]
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <daecf0b5-dbca-4156-bf38-c4a8555a1908@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB2027:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e38c53-14bf-45f0-24e9-08dbe4b273ba
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OiRp+SU5AzBOifgHwv7iNk/K/8XEjV7nNqwgQM24EQFV9gYuZxVnJlThkeE0K6SiAx6NmbUuuvKrCRd4vHP0D2I3gldDyR0x/7F+BocoW5jpqL27sdTWqCBisH+9rn9O6IZJgS0Io9V+19BkRQkAiWdd0oCI0PS531bX/Oa4tMwCHQ0vI3PKeVnp3jGWtagQGL/uQDP+Wa9A+KbgiXTmuMpnuTacGE9k/YhMDWe7PgmQr5nQMtqL3aeH3XM3FX5aYVgxkiFkCniq8QAlm6WGk5Hq9IlJsj2vlVWNqy2i0vmZfSfCDfSccDXBdLk394+9M2k7joV9IUAaHNlSev7YiD2M99Js78Me7N8oOPGhR/EOXPmTBS6glVNCza0Hll3CrtynBFriU+aGtmY9GOjE3Mu9yTRmw77gcdO2cp396+LW63pptrLAA4EndekHHontlIPavMVwaJ+QR6XT0mZQe7e0ijWUfiiswx1ybZ3CkRhQfaqPP/gmIs1MAqCXqeGqSP4/dA8kR1dbFvH/ZJ/mT3IMt018LOB0WKrH22teIdCZKmddGP3oLl2IIytMLm5G
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG9ic3JOK3hHODh4VFdmbFdkYzR0b3JQblZQUE5ZUEdiOU9NLzVsRnhqaDE2?=
 =?utf-8?B?cnhtZ1dBcVZzUWVhaGhhNk9xTlFtamQrQkgvTDUwNzRqQ1ZMRGdjN3lmbTZn?=
 =?utf-8?B?UHlFNmtYK29URkV3eUhXRXU3eFA0b0dDR3BNdzdUQVJGVXg2ZlRvbmwzL1Uz?=
 =?utf-8?B?R1Y2dUpmR3QyelRVRVBZMk83K0VCdHI1MXU4a1N1YWxmSlVSVWhGd2FwdTVH?=
 =?utf-8?B?bTRXUmpTOHpYVmxYeDNYTHNzTmdkdkhaMFhSazl0NFg5bE9pdEx2TkV2bHNr?=
 =?utf-8?B?aWt0dXBDeElkK2Z5WHFkd3llaTI2U2dzN2dwb0dnNHBSZTRITXpsZmhPUmxL?=
 =?utf-8?B?R0xoa0puL2ZRb3Q3MDNWSDg2ZW5oaklLYU84UTVmeXp1cDZuckE3a0FlSytX?=
 =?utf-8?B?V3MrVU1RRERlYzhkdnF3a25ZT0UvU0xMc1lndXQ2TUNQOHhFR3VsaHM2QmJO?=
 =?utf-8?B?WWdvU1pHNTA3bG9IcmovY2lDMDV1OWtVNUcyUWRvVzBYc2VXczE1OXFoclJH?=
 =?utf-8?B?ODltODlEK3piVEdnNzlpSzJvN3loZ0RVNEhPTUVJK1d3TDlzdktWUThzdVEw?=
 =?utf-8?B?aUZreFRGUHg4T3UyK1BzMUVjL0FxM3VnODFSZU13bWVkVVNVcWt5dTJTRHly?=
 =?utf-8?B?UUxvbFF0TzFCQnVXc1NtZEw2OFN1ejdNOUh5bUJLNW9yekZYUWMrZURRVTRh?=
 =?utf-8?B?ZGJlV20vZlUzaVVSRXdhYU5zMko1RmhNMGE5dWFQMUJpZytOMnFqcjJzRXRv?=
 =?utf-8?B?TGJPNVY0WmUvQk5aR2VrcTNjMGRFN3JCSzRIWFdmTE9DZUZJd1Y3UkVLSUU3?=
 =?utf-8?B?eHNqdFlLanVWdUZqVnNBWTJ0ZDlTRG5hOEVtRnExZEthSk4xd0tiWE1FMXNH?=
 =?utf-8?B?clYrYTZsNHVrYjFDNGloazhXV1Bob21GZWgvUDEwVGRPU2FvR3N6Z1dsaENr?=
 =?utf-8?B?bkVyTXF5QXgwcGp5b0FLc1BJdEhXOG4xQ2x1amRtNEpiQUlweHI3MStLUUJE?=
 =?utf-8?B?MDBrczd2NTc3QTFvaFVSMHQ4TzNCK0tnc2pGNUpDQUw4ZjdaSHR1eXdZQXpG?=
 =?utf-8?B?RTEwR1QxbkxiSTErYmJIYmdnRlZoM24zeWNXNW5KbjlPb2FVNEdoOUt4YWpV?=
 =?utf-8?B?cHhhVFFBYlZFZ2d5WHpkVlpKNzBTd1p1aklkL0RNWktIeXRwU3RDMXd6TzFm?=
 =?utf-8?B?L2lsWElXMXEwT3c3QjZEZW1ZclhSV0h3WHFEelNGMzdYWHhOeisvaTh6R0dI?=
 =?utf-8?B?S1BnUWdXWHJQVHNtUlNrT0szZlp0VUw0bDk4OUZubUVGSVh5MUJsSkRHeGJq?=
 =?utf-8?B?Q3ErR0txSVhHVE04SmR1K1BCcWlLdVZuVHBMMVFyTlFkMGd6elRCa0o4N2Nx?=
 =?utf-8?B?RnhVeHBKMW1vR3A4eWJ5WGNFbEMvL09xeG90Y1VUUnptcFRPWmVhUDlZbklm?=
 =?utf-8?B?TTA2R2Zoek84d25FanNJSU8zc0RxSloxd1JQK1dyTWhTNVhHUWJ2aTBUc1Vk?=
 =?utf-8?B?WUpDeGRkQlVCRTk1Z0dpN1Z5N25DTjg0Qk1VT29ZMnBhVzNXRkJUYXRqT2JP?=
 =?utf-8?B?U09tVUQwa2NDd1JnUmV5dE9rZ25FNFNkUWVnaWtpTHM2blBPQTlIMjhMZVZi?=
 =?utf-8?Q?8A16MguMkTI9TuICH+HpmfiK2X6bUp3NQnWDzORkR0JI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e38c53-14bf-45f0-24e9-08dbe4b273ba
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 01:38:50.3248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_175348_714657_14D32F95 
X-CRM114-Status: GOOD (  17.87  )
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


On 2023/11/13 8:57, Jisheng Zhang wrote:
> Add the reset device tree node to cv1800b SoC reusing the
> pinctrl-single driver.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/riscv/boot/dts/sophgo/cv-pinctrl.h | 19 +++++++++++++++++++
>   arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 10 ++++++++++
>   2 files changed, 29 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h


I'm afraid there will not be more cv* chip in coming days. So I would 
suggest you use "cv1800b-pinctrl.h" first here. If we see more cv* 
coming, and if they will reuse the definition here, we can consider 
optimize the filename, what do you think?

BTW, how about defining the file name as "cv1800b.h" and I'm not sure if 
you will have more macro const definition for other modules?

> diff --git a/arch/riscv/boot/dts/sophgo/cv-pinctrl.h b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> new file mode 100644
> index 000000000000..ed78b6fb3142
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This header provides constants for pinctrl bindings for Sophgo CV* SoC.
> + *
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + */
> +#ifndef _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> +#define _DTS_RISCV_SOPHGO_CV_PINCTRL_H
> +
> +#define MUX_M0		0
> +#define MUX_M1		1
> +#define MUX_M2		2
> +#define MUX_M3		3
> +#define MUX_M4		4
> +#define MUX_M5		5
> +#define MUX_M6		6
> +#define MUX_M7		7
> +
> +#endif
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index e04df04a91c0..7a44d8e8672b 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -6,6 +6,8 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/reset/sophgo,cv1800b-reset.h>
>   
> +#include "cv-pinctrl.h"
> +
>   / {
>   	compatible = "sophgo,cv1800b";
>   	#address-cells = <1>;
> @@ -55,6 +57,14 @@ soc {
>   		dma-noncoherent;
>   		ranges;
>   
> +		pinctrl0: pinctrl@3001000 {
> +			compatible = "pinctrl-single";
> +			reg = <0x3001000 0x130>;
> +			#pinctrl-cells = <1>;
> +			pinctrl-single,register-width = <32>;
> +			pinctrl-single,function-mask = <0x00000007>;
> +		};
> +
>   		rst: reset-controller@3003000 {
>   			compatible = "sophgo,cv1800b-reset";
>   			reg = <0x03003000 0x1000>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
