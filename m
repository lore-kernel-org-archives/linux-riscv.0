Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9161C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2QMHlEzg16p+FOrGPZeWluy8YkzoGq550OnjCR7bPE=; b=2sx96OvzQHL9lPh2PE60SsIQA5
	pvD2KvaH3cuhZhloK0qzzuKO76x0uIAEcoR9IXzZKjZV8xK9/oVn6CBZ5RNqVz7v3uHPliwsv5VZ/
	bn5xJWEmHNbfNPuIqZuDGCyQqxkRdgKVuDA4nYfAuES7uShk5sBHuPqUekptqAEn3W8wg/vnvFuTX
	l9IuVNf26N9gfqC+0o8gk0LxIvkMsIZAZezQVM65JGhHSbUfWmzcoIXIjmbpVvNaJBeSIQUp+EQXE
	7X0JFNHQMHSiDyVsbqPLmTE9nc8kd9sYbTm1PWgpkhKCa8ebtkoYFrKK4f1UoaUWcQSmVDBLyLdrh
	5pGS16og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZuP-00Fasg-0a;
	Fri, 08 Dec 2023 12:24:45 +0000
Received: from mail-os0jpn01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2815::800] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZuK-00Fars-22
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 12:24:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYRvGWUITYo8m3Od2cXzziKpcjQpDxbGr7iR5yIIEgOUsEG9h6xCKehizHi1BV+MCRsDNq8zkr9Wh0Ejnt9clbUltlXFNr3dkcdYp9nlFe93P74VPki1vS47Lg8/3/5css8WPb20bhpl794pWG9JPKR17n27cVkD2g58VFigk9vYzDk4WKyL/X7Q0GHn2gowuIhxoNXOFXMOHlzRVCqyD9RlczcJ1n+hP4CLs2j1r2BR5szwxRRnK6rsqwxjDfzgShymriLr1tAq0eAApLW7pX1+/y6uNNn3NETFGjkfEy0hMGx/BU/SlRBpeiOIPOaUKUrGf5ACChwOsg8jlzRl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpJmEg+77XNoZNVqU6ruu2hW3NgqZYEg/LY6WRscGOo=;
 b=JFMXvqJiS9HSG0kyHyBPkfxq7LKdx2SSbpLs9SNzkb2qw4u96VmOzs/UgRsqqj4OSPnj1NbaMCdFd++OomN5w1WyXdBdBqH6B9/Ftf8oehnf7o6PHjHRuPryMmg7sOMCjntnxhWvyXRVi5eJ9LM0qsZOclmSamyhssWdOsHhDDMbkGK5g9ZfmydJgP2Amk9pzr9L7tnjaxfSbed3PhfBrBKcQiX5r+5sLkgtjIneOPyDgDyydJnJ6pefPBaRuXdSbIFIKgqsAR1FLefgtUjMP8zCd87kNcyU3sPhxhPWBxacuS7urLvh+uPYyQProlKxWeXwtkfeo5B1HaRIS1wqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpJmEg+77XNoZNVqU6ruu2hW3NgqZYEg/LY6WRscGOo=;
 b=feVaHrCe4UEGuTnTXshYouHB0tNo9t0lzDgf8/0kWjG/pxwRU5HRxYFvtl9+PnBFK+pIOV3W72+66eVNTezuJkCRpucBacuumXW38yhSUAeA+28I8jCx4oOxKTGNZd5D0YhHCxpOcXA4/z6nRYBWuAjfPZjgGQhS8SCYj8pdW8DJ1y7pfdAqZC5chse+Fsy4RDdKbx3vsbBt287bUmx/LjTZlD5GomigU09j2uRZQUx5L05BGetLxv4x4ejBM2+kJB3AzkHnKVhvyoobkpsARndiBoClmjD0sO9JYtJv/QJ2udmC8wVIjNZglfEL+OMOM8Larc2/gUJu8fz6uJZgmg==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by TYCP286MB3522.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 12:09:06 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6801:95d7:c963:398a]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::6801:95d7:c963:398a%5]) with mapi id 15.20.7068.028; Fri, 8 Dec 2023
 12:09:06 +0000
Message-ID: <TY3P286MB2611F70A3D61788E556C8A30988AA@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Fri, 8 Dec 2023 20:08:59 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 leyfoon.tan@starfivetech.com
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, krzk@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, daniel.lezcano@linaro.org, tglx@linutronix.de,
 conor@kernel.org, anup@brainfault.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, michal.simek@amd.com, michael.zhu@starfivetech.com,
 drew@beagleboard.org
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20231201121410.95298-7-jeeheng.sia@starfivetech.com>
X-TMN: [v0UyNsc5owoA+UoSze+rvHGHgZVp30zKTKsQDEflvrD+rtJ6N5/I8N82fB+bOFfc]
X-ClientProxiedBy: SG2PR01CA0185.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::19) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID: <85a2c038-ea89-4081-9cb5-1db4bd5f47a0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TYCP286MB3522:EE_
X-MS-Office365-Filtering-Correlation-Id: 714439ad-f605-480e-d9ae-08dbf7e6798e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YMk6fP8UwPy2PsaVNVMWI1+AYjo219GHHxx+THaFiJfRTcldjyJmDWr+34/zO6hBjufeQASyVD8Z1bT6gqLJeMuhRsKjzHD3TbAhi6zfSO9z1Lrolq9li1vwcWlISQ06EzX7XnOxd6m196lbfyheyTLJ13yNkU6okgbNSwBsZ0hYvt8pYsMYKl2px+8uCazwFhc5YUxTcTRnDmNIK3+3zThFIkT6gixwd/r/YkLhsCPA6/tsVkl6lmVNejC4pLoBlQS9P1/3KMg8oa2cW67hZpsPz5+RxsSy+iFuI+6KcXOUUismwRZ59aKESf3r4njac4Elv7ovRG5ePTs3EL+j++orXFKNpSTPB73KRavs/LRiX3j5N6DamvoS1q7kHJhxcmdDmmTPkV4ZVQ3FRTLfj6Vv4Pcl48+MWZ2QjyLe5CQd0EyLhoN+zrDvkV4MlIV4oaFD8q2M9cTV5ubFkicUreRgv1AldCHm2orfo3VGqtZBNK39Ura6+rSgNrO27mqUZ+R1InnQCpse6UnSx2LOimRx+xg+r62b9vx058hD7cCmqvE3p+lpSXI1zaAeVW7aR1t0A5/gwz1qqk0Ets2oaFjRIeXxRDNjg/J+oj75jw=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2srMEtqSlNyV0xvalhKQkRaNllkWEZpS3QrSkhFdytqOHE2aTk3VU1IOGti?=
 =?utf-8?B?V1BGOUJ3enJ4SnZKTXJQOEw2NEJGellPajJlL2pqQTdCdnZodUlraWJWOWUx?=
 =?utf-8?B?V0Y3VmxMQWRDQjNEQXlKOVJzMG5YSW5hS1oveXNwOXd3TEhscERReFV1MmMy?=
 =?utf-8?B?SzVia3ZXNU9JMzRwVy9EWUZ6czUrMmJPZE1UUWVoZ3dKMUNIZ241UGpEbmFP?=
 =?utf-8?B?QVJGMXRMWm00YUo2cG9nU0tJeUxnT3ZFK25ZTUFMcEFoNFpYQSt3YzNreCtO?=
 =?utf-8?B?cUhlYTJEVDRqQjl2T0RxRFpPSnErbWloZ1J5aStUbHdRTTB2cEljUGVqYUlK?=
 =?utf-8?B?dnVUaGp5Y05vME9IcnA1bzVsU1NaTVNOMmxpQ2s5eCszVHcxT0VTYkZ6Z2Js?=
 =?utf-8?B?Q2ZkWHRZblo2RTZqb2V2TkJpcG9sbnczOUZMckFqNDZWa28zR1VzdnlGRTlT?=
 =?utf-8?B?Vnl1SERORjdDL1JNZ3NUejJoUTFVNTc5MzRwbGg2S3hTRXFBcHRGRW1xaTNo?=
 =?utf-8?B?dnR2RzZRTUVHWlNWUHJxY2dmcEpkZlZMYzljckZXN0N2b3JDTG54Q0xpTmRU?=
 =?utf-8?B?VncxVlc0dVhhS0YvSWV1eTMvMFNUY0ZPN2swYjhnMXpoaGRvZmcwVUNpczhU?=
 =?utf-8?B?WUtYSm9Gbk05OVZmK0Y2MG5XcHJ2alIvVjlTQ251M2kzS2hQaWtwZnE4R1Bx?=
 =?utf-8?B?d0NyVm9FVVROb2MvMjNVM01CSkdoczdPVlZFajNsZ0ZONkFEVWZZejF2N2lL?=
 =?utf-8?B?ZEEra0hQOTQxemw5Nk43dzc1ZVJzVWdUbzFvRnpFVzk3emZ5cnA2eGd5UXZ5?=
 =?utf-8?B?eUlpMXh3VWNCOGVlV0tIV0lteXpkNm40aWJxNTFmMSs1VllmTEcrQzNnMXNN?=
 =?utf-8?B?YnZxUTFDblJFbXd4WnlsQ2tWUkVxQmFXWUdmVXU2dDc5M2lENlJTQnJzUEZw?=
 =?utf-8?B?NWlDMjZad3U5SzFVd1lPUTlETy83RE5BQnRDV2tRc0RWT3BrMjZ2N2NGZlhU?=
 =?utf-8?B?K3Z5a21PNTcxcGN5bitPekc2aDB6N3hQTVhkaWh1L0Y5cE92WG5wVGt3dERq?=
 =?utf-8?B?S3VrUGV6L2xzNGJ4U2RPWDcycTh0V1o2cGMvTmhXcGxabUZiVmM4NE55MmNG?=
 =?utf-8?B?K3hRNzBLZGlONTVkbEhoNWI1VitNRk90a1drdjhSMjlNeHRVdGxacTN0RStu?=
 =?utf-8?B?R2VZZEZrVGYzcVJBY2ZKMXhYeXI0T0ZpTWdYMGt1YkQ5eGRlSlZjRmVySWVm?=
 =?utf-8?B?V1V2bGRRc0xEWU1ZV2YvSW5VNHZpZFpYSHhZS1QzNVp4L3NzcFZPbmRiS2c0?=
 =?utf-8?B?a29KNG0vbks1THNFUWlnK2IrRkxFQVFka3Z4WCtzWHlzM0d1czkvbXE5UFJW?=
 =?utf-8?B?d3RrNG5vcUsxOGY5Ri9FSm5ka2tJVVJWc2ZkQWNzLzJuMHl2Ry9nMDVBVDlR?=
 =?utf-8?B?dEVpZkV1Y3h4K2N2TGZkdHpidks5UlhXM2Q0bXhyQ01wL0FXb1YrN2pFR3Vn?=
 =?utf-8?B?R25hM1o4MTN2WlpHQU5OWXNCRitNZytrY2FGdHRRYSszVldya0Jsb2JIcVk5?=
 =?utf-8?B?aWpQMFJjNWxyNElLY25sQng5a0lIOHlDUG1CWkQ1M2xscmdSSHF3THN1MXFG?=
 =?utf-8?B?Q0lOTisyUzF5dXg5L2dLK2JCS1RJc0h5cC8yVXJLTkhBaGxzdlF5Z1lKcHVP?=
 =?utf-8?B?eEQxUTRjTnNPQXk2cXAyUGUyUXE5RjBzYUkvZzVHOHZ2d3hVOHVPVHdLcTA4?=
 =?utf-8?Q?rerk2kNuEQJ40xNAmU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714439ad-f605-480e-d9ae-08dbf7e6798e
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 12:09:06.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_042440_852369_C4DB19C2 
X-CRM114-Status: GOOD (  12.01  )
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

Hello Sia,

Does the dubhe-80 cores actually support vector? Or vector support

doesn't exist on actual silicon?

Best regards,

Shengyu

> Add initial device tree for the StarFive JH8100 RISC-V SoC.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>   arch/riscv/boot/dts/starfive/Makefile       |   2 +
>   arch/riscv/boot/dts/starfive/jh8100-evb.dts |  28 ++
>   arch/riscv/boot/dts/starfive/jh8100.dtsi    | 378 ++++++++++++++++++++
>   3 files changed, 408 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
>   create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi
>
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index 0141504c0f5c..ef5c7331c7ec 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -10,3 +10,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>   
>   dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>   dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> +
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh8100-evb.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh8100-evb.dts b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> new file mode 100644
> index 000000000000..c16bc25d8988
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include "jh8100.dtsi"
> +
> +/ {
> +	model = "StarFive JH8100 EVB";
> +	compatible = "starfive,jh8100-evb", "starfive,jh8100";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0x2 0x00000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> new file mode 100644
> index 000000000000..f26aff5c1ddf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> @@ -0,0 +1,378 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2021-2023 StarFive Technology Co., Ltd.
> + */
> +
> +/dts-v1/;
> +
> +/ {
> +	compatible = "starfive,jh8100";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <4000000>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "starfive,dubhe-80", "riscv";
> +			capacity-dmips-mhz = <768>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <512>;
> +			d-cache-size = <32768>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <48>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <512>;
> +			i-cache-size = <32768>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <48>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2c0>;
> +			reg = <0x0>;
> +			riscv,isa = "rv64imafdch";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> +					       "zba", "zbb", "zbs", "sscofpmf";
> +			tlb-split;
> +
> +			cpu0_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible = "starfive,dubhe-80", "riscv";
> +			capacity-dmips-mhz = <768>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <512>;
> +			d-cache-size = <32768>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <48>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <512>;
> +			i-cache-size = <32768>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <48>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2c1>;
> +			reg = <0x1>;
> +			riscv,isa = "rv64imafdch";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> +					       "zba", "zbb", "zbs", "sscofpmf";
> +			tlb-split;
> +
> +			cpu1_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu2: cpu@2 {
> +			compatible = "starfive,dubhe-90", "riscv";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <1024>;
> +			d-cache-size = <65536>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <48>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <1024>;
> +			i-cache-size = <65536>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <48>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2c2>;
> +			reg = <0x2>;
> +			riscv,isa = "rv64imafdch";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> +					       "zba", "zbb", "zbs", "sscofpmf";
> +			tlb-split;
> +
> +			cpu2_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu3: cpu@3 {
> +			compatible = "starfive,dubhe-90", "riscv";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <1024>;
> +			d-cache-size = <65536>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <48>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <1024>;
> +			i-cache-size = <65536>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <48>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2c2>;
> +			reg = <0x3>;
> +			riscv,isa = "rv64imafdch";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> +					       "zba", "zbb", "zbs", "sscofpmf";
> +			tlb-split;
> +
> +			cpu3_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu4: cpu@4 {
> +			compatible = "starfive,dubhe-90", "riscv";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <1024>;
> +			d-cache-size = <65536>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <48>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <1024>;
> +			i-cache-size = <65536>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <48>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2c2>;
> +			reg = <0x4>;
> +			riscv,isa = "rv64imafdch";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> +					       "zba", "zbb", "zbs", "sscofpmf";
> +			tlb-split;
> +
> +			cpu4_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu5: cpu@5 {
> +			compatible = "starfive,dubhe-90", "riscv";
> +			capacity-dmips-mhz = <1024>;
> +			d-cache-block-size = <64>;
> +			d-cache-sets = <1024>;
> +			d-cache-size = <65536>;
> +			d-tlb-sets = <1>;
> +			d-tlb-size = <48>;
> +			device_type = "cpu";
> +			i-cache-block-size = <64>;
> +			i-cache-sets = <1024>;
> +			i-cache-size = <65536>;
> +			i-tlb-sets = <1>;
> +			i-tlb-size = <48>;
> +			mmu-type = "riscv,sv48";
> +			next-level-cache = <&l2c2>;
> +			reg = <0x5>;
> +			riscv,isa = "rv64imafdch";
> +			riscv,isa-base = "rv64i";
> +			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "h", "zicntr",
> +					       "zicsr", "zifencei", "zihintpause", "zihpm",
> +					       "zba", "zbb", "zbs", "sscofpmf";
> +			tlb-split;
> +
> +			cpu5_intc: interrupt-controller {
> +				compatible = "riscv,cpu-intc";
> +				interrupt-controller;
> +				#interrupt-cells = <1>;
> +			};
> +		};
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu1>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu2>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu3>;
> +				};
> +
> +				core2 {
> +					cpu = <&cpu4>;
> +				};
> +
> +				core3 {
> +					cpu = <&cpu5>;
> +				};
> +			};
> +		};
> +
> +		l2c0: cache-controller-0 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <512>;
> +			cache-size = <0x40000>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2c1: cache-controller-1 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <512>;
> +			cache-size = <0x40000>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l2c2: cache-controller-2{
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <2>;
> +			cache-sets = <4096>;
> +			cache-size = <0x200000>;
> +			cache-unified;
> +			next-level-cache = <&l3_cache>;
> +		};
> +
> +		l3_cache: cache-controller-3 {
> +			compatible = "cache";
> +			cache-block-size = <64>;
> +			cache-level = <3>;
> +			cache-sets = <8192>;
> +			cache-size = <0x400000>;
> +			cache-unified;
> +		};
> +	};
> +
> +	clk_uart: clk-uart {
> +		compatible = "fixed-clock"; /* Initial clock handler for UART */
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		interrupt-parent = <&plic>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		clint: clint@2000000 {
> +			compatible = "starfive,jh8100-clint", "sifive,clint0";
> +			reg = <0x0 0x2000000 0x0 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
> +					      <&cpu1_intc 3>, <&cpu1_intc 7>,
> +					      <&cpu2_intc 3>, <&cpu2_intc 7>,
> +					      <&cpu3_intc 3>, <&cpu3_intc 7>,
> +					      <&cpu4_intc 3>, <&cpu4_intc 7>,
> +					      <&cpu5_intc 3>, <&cpu5_intc 7>;
> +		};
> +
> +		plic: interrupt-controller@c000000 {
> +			#interrupt-cells = <1>;
> +			#address-cells = <0>;
> +			compatible = "starfive,jh8100-plic", "sifive,plic-1.0.0";
> +			reg = <0x0 0x0c000000 0x0 0x4000000>;
> +			riscv,ndev = <200>;
> +			interrupt-controller;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu1_intc 11>,
> +					      <&cpu0_intc 9>, <&cpu1_intc 9>,
> +					      <&cpu2_intc 11>, <&cpu3_intc 11>,
> +					      <&cpu4_intc 11>, <&cpu5_intc 11>,
> +					      <&cpu2_intc 9>, <&cpu3_intc 9>,
> +					      <&cpu4_intc 9>, <&cpu5_intc 9>;
> +		};
> +
> +		uart0: serial@12160000 {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x12160000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <67>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@12170000  {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x12170000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <68>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@12180000  {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x12180000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <69>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@12190000  {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x12190000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <70>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@121a0000  {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x121a0000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <71>;
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@127d0000  {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x127d0000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <72>;
> +			status = "disabled";
> +		};
> +
> +		uart6: serial@127e0000  {
> +			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
> +			reg = <0x0 0x127e0000 0x0 0x10000>;
> +			clock-names = "uart_clk", "pclk";
> +			clocks = <&clk_uart>, <&clk_uart>;
> +			interrupts = <73>;
> +			status = "disabled";
> +		};
> +	};
> +};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
