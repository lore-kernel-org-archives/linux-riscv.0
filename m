Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF428C5321D
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 07:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=af9gVzcA8UbT9p/brABmwOGfjyrSjBycjAkfQkRk9bE=; b=yVLPTjizmM2qkI
	mNUhrakgvoZZoFwRmLvx0W7NFDyeIGeoJh2FXQ2ZuDRwx/TzxoZr0q9tCFsH9jUrizNeZ5tO8xz3n
	QsdXnJGjPvvAfhp4JP5ak5sZ5hI3ynlm6q58VnNgmeBLKDgkb1rmrY2H68evFhYqQ1s5OzxlgkwwU
	Qbwzo88dcmSYbbQyh4bMQIKI0tSZ8y14O9tKnrUHh2y0Fbopiqf/+298KXPHcHXCPA0s1LgYSJObd
	Kc+pDjjJKVd5PKUvFAePXy3SIFchFt046NDwqHZLTqqq6+6H//ZLoZB9Smsa2aAyP8Ort9x8fabmy
	cni7tEQ472mnDNK5T9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUaC-00000006Lo2-3I90;
	Mon, 26 Aug 2024 07:56:12 +0000
Received: from mail-bn7nam10olkn2082c.outbound.protection.outlook.com ([2a01:111:f403:2804::82c] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siUaA-00000006LmX-1hgZ
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 07:56:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMr85F3Wy3JFK0zVJQSsFRj2tb1wcefMJ4Z6ddO5xkJzBkXxTggbe0ld8MINix4tlKc+8/E2T6BnCIgFR3kPbSg1pPW+XvHqSAj8y9ElzHIjaDPsX+KMbww7uuKE5ubbtfQwxcE9YG3A8RW0KZam881ai05e8Tfg8HhJNZI1TKKO9t/bDsLKo/A94TeUtJH/EGOB7noDw7SQoOUWawJTSMDQYmdhZ/8DCWg5EtcOMHhAaYoE1IKZpRGnVWkks5/oN/8AMw3zjkwSUYxgS8isOFkSGUTGpIwPMwh6LuaPl6vhgr6lNtJKfUC0EKA/f3rpT2lNltMRVBouAeXw2NiWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRAlJpmrINe9uDfomtMcAAz9nLLmMrbtAAspUSjoNJU=;
 b=VkAbCRnwp/e1Vg7iUl6KOCT/XkU8WAaApVXnRI59MTO2wTt1HM3bWs4OtMwv7VL3lAByjEjaOArP3PmqN9SSG5N5ycpq5bzkQtjgT+y8Px/HWILD8E8k9X4QD8XJE8Fz7QqNAkfedCYe3EtIR9Xiz9dmYPCUWBKki8cXXB8L7ZZCEMwA7TcgExYYdSPPg8sxiSv23ojAMtMyyvdcouoUwoMO++6pvofivwuVGX2Es+fq7R+nInQISZn2pLlMHlwuxc2n/Oo7/cc/veZloyDhwoUBFayIf9G8BFK3CPVEfjVh0l2QCqrkpSjd3bBbSOeQcIOJDezc1aR5u3ZrSxxKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRAlJpmrINe9uDfomtMcAAz9nLLmMrbtAAspUSjoNJU=;
 b=ciC5sDyl89sIC8JpLX7gtWYigvHjMwCPRVfoRGMIgw8D6gk6UJRffTqpphDZ/38urDPbeJnHf/EqUoDIVPqfE7N9uKOYEWc1DS3YSUfB3ukeQfLErhtodLXAzdtB3V71EE7jGnla9J1nT0t4ngit88rtGeZ3eX50I2OQxL7GKmfRqh99gEAvs0od+eFa5gfDHYq/qEY4S8/FXQSKBkoXFk/CuooRnmiWGFW/MGXuUPDgGdXaNAxzizxOAwloKHY73DV2JWHSanbAVk1qtXCMupARDGlDABOvvSPtq7n0GBnpKdvINs1YLVosRRsW8xOsmyb6wFpkKu6bEXtSBNApQg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB7109.namprd20.prod.outlook.com (2603:10b6:806:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 07:56:02 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 07:56:01 +0000
Date: Mon, 26 Aug 2024 15:55:01 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: add pinctrl support for K1
 SoC
Message-ID: <IA1PR20MB495318D9825567E58D4FF5D4BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-3-ddd38a345d12@gentoo.org>
Content-Disposition: inline
In-Reply-To: <20240825-02-k1-pinctrl-v2-3-ddd38a345d12@gentoo.org>
X-TMN: [8HQQ15ybqpnu5MNUX9p9MknCV7rv5PRoEwD/7p7+CTs=]
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <5jzbux4xg52pzlobogl4jc5qu6bs5hdre66ypcmueibd7zems5@p5x4mbvrbvcr>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ade89b7-032f-42f9-a899-08dcc5a48717
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|5072599009|15080799006|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: K47awmbh0hT2vkB3ZhVLrRJySupCJgKkfaO+lBWliw9jYQIaBuJXLzRndh45tJLQGlV8C+CIbf09XuNkGw43JWkvN+1m6O1TBuCpe3bfL1f6FbxoMYaWeZOFN1WPuVuTaSE3p1E7eG86/QYJIK5XsEvLfv/5gzyexSKI1Ea1SHovkFmDVorlWUM5DMOitBP0ST9dj8DZQVflB848BHJ7Wuh5Ht2LeJB0Zh8tM3s4nZPpwNFJbZjUkbFehojaBHk8gNzfYiT+zAmX3rUg2ILhOMnFu57ycEEpLKXb/vEqZ7FdgGrAYXYdzUWOryZhH81jlJfUk0uxWL2zNXVH21ul0tC7zMan+kpunfj44Q6D9RvM2v+vlXR8HOGQ6ovjQwbck2jdOehT5Bl8nooR8ApPJUh+uAVo3HLUFdkyCgIKvVcBs+J24pu1iJKwAW42SAewStXfKfQ6DZ3t4B07PhsRmGFn4ihNZwec2pXWaiOwzbl16IDpOAi6JhI8suqWF0tzZvK9DHa3d/pMazn+Ox8d5DzdoVMoMrd+Vc1NKbOT5pBwf0MQE2pG7MhC1QT3X3zfydeDVp4Yp6c+6zHjqSSEs/lhkTTXqnDZPTmJ/F7LkJHBJH3qxQSLfiP6KpceFjH5jmX3/29EKGvstXEJZHL69Xa4ex8ckMYNGip6H8v770YrBebLa+XSLtl+WS+oWFqswTw5EjFH5B0mvArSjCIovtsy7PIFLwdxQV9EjnlC+RM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Uu+cAEFEUzdbf5XIexIligEGWYYc2mwyTgF6aYkNNZtiuj4XZkL5v2UM9FZ?=
 =?us-ascii?Q?XvTwFbBAecPF2M4ougtjnzoeCR+phOZgwhTwDmw1PYJNJG9DqpvhAcew/kYt?=
 =?us-ascii?Q?E2yMgf2i1IeGwAvpf3Js5vqW7dSA7EEf4BFNK6iyioozSEVzn43AIHE4ewpm?=
 =?us-ascii?Q?viZFShgd0o4v87v5ad2pnalZUgRyxX8atFioEvv/yIl1MhPbhadKVCOWNElr?=
 =?us-ascii?Q?poZqZqt3YxFzs2OHb4wMFQmK0UZ1M7lJDGFR+LdOL8sTe3LxsPFuayLwdNfC?=
 =?us-ascii?Q?VNgkZ7EC+VpRvZrZBrr71TDuq3nHSyPSdhGCf4ro3mTvSo9gmG6NansrUgRh?=
 =?us-ascii?Q?Mo9CIeyC9NYRZrXHvbHQhoW97pUaleVCic2LIEStHUikXrhEMwRnhTaX/L5K?=
 =?us-ascii?Q?FMsDLvsPUxzlzLOljABwCF0lNHpTzEzlfkKRh5yhsMLMn+UYj+H43ewJqtgg?=
 =?us-ascii?Q?D6Urz/5uagVoKbEvBTuqqZlnkd7v+JKaLy0P8xMmF5kJdPAc23qkdJwYwPG2?=
 =?us-ascii?Q?2sowxlJl5JDa8EymAfj2sQF4SGenLmR0Y8HpFQzlBa91YpK+qfHJGZI1lGx7?=
 =?us-ascii?Q?og5LXBabfKIMWB2xOB1ULXWXY8V383aiL0oEGi1v+ixmFeOJ6DFOeNYZdb1T?=
 =?us-ascii?Q?yR0abGOymoh34s8zmA8pZUIJi7mK7HQc/+n0xCzxEa/fPAZjwuwqg6iW/opO?=
 =?us-ascii?Q?LMVqb6oWgm1I5alrE7NWp/Gq5GP4X5B1gkTnWyKLCjJYz/sBE9RHbm7613KD?=
 =?us-ascii?Q?foOb9I08+MTlEgNUi5utgWf5y0HfDgu4IbApKaa1eB2uylAA95PW65BgRWvD?=
 =?us-ascii?Q?DXDMRksdth5hoMYA5QLiqNPS0h2XUatBldbDFj043BheBe5mfHzoeQ81Hvkk?=
 =?us-ascii?Q?WZ5FLUSBSEZt6yxOnzei/yDrJU2Nt9Onr/1WhZl/LnWIjL4kc944aZ7uDQCd?=
 =?us-ascii?Q?aUMEZuCYy9J4kRbG3tZ6elRgsbTlpoLGi9CwVZGQHfTktuwfkmRKkVG7jCwl?=
 =?us-ascii?Q?a2ATy+fLdCDa5rQ3VU03k9Nm8E9SllH4NatvvbY6JQEim+Ru9vVMyoP9Y2Hu?=
 =?us-ascii?Q?giR6lJUbWoK205ZdUJQUNeLnt0LN/dOtziCWYX7nTSvcs/dT0pzreQO9NiLO?=
 =?us-ascii?Q?6kdKbLj8L3TJEQyGz5gs+m6sXzGwQ0xXenmXL3TOdyG/spU3nH0/WvHt71tm?=
 =?us-ascii?Q?iN/VqujrUOxXLIcqdPpT7OPqOe1Not/efxbMHYcnRqkeTl+qQkKAmJVN7tHS?=
 =?us-ascii?Q?ILaPL33kl0hRLAh1imu8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ade89b7-032f-42f9-a899-08dcc5a48717
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 07:56:01.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB7109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_005610_486289_112B6EF3 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 25, 2024 at 01:10:04PM GMT, Yixun Lan wrote:
> Add pinctrl device tree data to SpacemiT's K1 SoC.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Note, only minimal device tree data added in this series,
> which just try to demonstrate this pinctrl driver, but
> more dt data can be added later, in separate patches.
> ---
>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 19 +++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi         |  5 +++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> new file mode 100644
> index 0000000000000..38ccaad1209f5
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> +


> +&pinctrl {
> +	uart0_2_cfg: uart0-2-cfg {
> +		uart0-2-pins {
> +			pinmux = <K1_PADCONF(GPIO_68, 2)>,
> +				 <K1_PADCONF(GPIO_69, 2)>;
> +
> +			bias-pull-up;
> +			drive-strength-microamp = <32>;
> +		};
> +	};
> +};

No common file is needed at least for now. You can put it
in the board dts. Also, squash this into the next patch as
it is more related to the uart.

> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 0777bf9e01183..a2d5f7d4a942a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -416,6 +416,11 @@ uart9: serial@d4017800 {
>  			status = "disabled";
>  		};
>  
> +		pinctrl: pinctrl@d401e000 {
> +			compatible = "spacemit,k1-pinctrl";
> +			reg = <0x0 0xd401e000 0x0 0x400>;
> +		};
> +
>  		plic: interrupt-controller@e0000000 {
>  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> 
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
