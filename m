Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E11BC27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 01:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+BPocu4pFJGQAeQUFRbhGylxOkGETnXIhz3zDrVXj8=; b=1UWTRQfkLWF/Lx
	Ty/lMH12GqsuZY7yXiR13QwItCd3nlKQyH36AcwMYfNMG5gF+SbV+YwTJNuFj0z2B7WCP/2wJRj+C
	/TNUZ3Ekyyj5JOOXmSnXwzBRWtUgGj02fL/jtMWw8xvley3WxwcdJZWFMzyT0y6jc+LLEyGjaxSFK
	4+ruzWo7c8/zPx3shrXbcZF8lVSA+nLM/Dm3/tKFEYo6jmVF/x2iCsJl2v+NW5wznRhBgg2lZeO2u
	iUKgjynruwc+VF5y9QVlcPJSuS1hcB4rDk7SAinKGjz+3SxPQEU0jV/zR9GaOkH4996dUGGorsxFx
	2+TOQlilauG52DBDXUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6AN-00000003CdP-42Oq;
	Thu, 20 Jun 2024 01:00:43 +0000
Received: from mail-bn8nam11olkn20819.outbound.protection.outlook.com ([2a01:111:f403:2c14::819] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK6AK-00000003Cbu-2zo2
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 01:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zy6+e+s+2uwf5JTloP61nsiqOaMoZzKWznwJUCYCVmXkbG2sDf6jnrfb57fxrZ9kIDlYmCtuPFMjG7CIQuR3EPZZc6XKmengI21LI8LVxc/41lQTO9uHX1weRxC47shp+JtgfsB+rPrl2bryhT3QbuH8ZVA3xW/kcaVZ7Nu+x0T3TSZxnxEVswySdx4m+4pw/GxBz6AbD9X5g84YlgePYqJ2rS2nU8K7AuOgC+N6L+UETRIDzNQOpmt3dkvIncXjgjEERmYxYpSppZMLmS+B3VuQiSBvCMW2dw18Z2JVg9oin2EeuVXQHJP2qjDkga4m6gXaI+DKteoyjm4I8bHsvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6ELvcuvu/w4UtFvDMOkXapy8B41Ar9VJFc1hr+ciks=;
 b=WX6fMGCvJ2kRGlx5MMseq88sTSfMttSIQsJ2m8F2UoPekYFN1GWA+5pdOnZIHf+ZUG6WK97tB72N8m7KL3Ggl4wtHR0QeRkK0x3LfMsZ05jsWHjEVCQlq6SYta7zFVP3142pOZSKKtb9r2WcreO5hWRV8JIBNK1PFfj7cOFMWZCfJZ9zOThVIT7dVRnuV00vYYWT4mGDW8LpvNaJIufEvDZS64b8IzVpaKuQjHhvdFmR5S/OB6hSbtFlvPfdrQC5+nZSDqcgxR4N6a+wF04dV2d9L9viaihFE6+urR/rN6ajoiziDfh3G8x/ibLr0qtFZuua33VOwQKxpe/PI1SkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6ELvcuvu/w4UtFvDMOkXapy8B41Ar9VJFc1hr+ciks=;
 b=W/YXIoVwBFO6h335HdV3OAn9q2pf5VPtmy2brDBG2VVLOS3xgoGtEeDUgSvi7B9G/F5SWlVK6WyShjyFGMWEhBg7OyWaGpJZgOqVFKe8hRyJ8n5+TbU7oUqSm9JgUio4mgve3OFY/Cm0mtl77kY7TFF6ZTdctw8giCCdbFf0FNxsX9ml9FMGAKSq2hr4nRJ1BtqktkRyuGUj7lvka9QrXO8gllgKUBo9FP+vhcXIrLnLFKxa7dckIrJllARmB7SwzlWZhL5MX7Jq+59pS74xU7keV98XPhMYsu+L+Zlu96nOHCTGpjhHn3gPYvcEKA18aYcf8GFxE/KWSOkRJCEWIQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5510.namprd20.prod.outlook.com (2603:10b6:510:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 01:00:22 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 01:00:22 +0000
Date: Thu, 20 Jun 2024 09:00:04 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 6/6] riscv: dts: sophgo: Add LicheeRV Nano board
 device tree
Message-ID: <IA1PR20MB49531ABF339729728958FFEBBBC82@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
 <20240612-sg2002-v2-6-19a585af6846@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20240612-sg2002-v2-6-19a585af6846@bootlin.com>
X-TMN: [HbU3fxqQ3HbuoXM+GMsFjRj9LNzzZje95tGHVikTIsQ=]
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <skrgd7saw4p6szkd5u54glpzqcdwt3sw243xps4jwk6qylwrjb@co5pe53zgp5j>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5510:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a98ab9-869c-4671-72cd-08dc90c45c80
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|3412199022|440099025|4302099010|1602099009|1710799023;
X-Microsoft-Antispam-Message-Info: IiOHvMVkpStgDr/iWrqCPvnTZas8/i9PNY9iux1gex65dEgF5ZXK0GRo5YzeVJzXmoNVmTTz3m42H+bSE/2aqIwShUXOJ+LNEanVqWLeyvChUZp/Jw5/ge2JyTelJDwJ8PNmies0/aI351dfi2yra4kLoXTPNbPr3D3sn3H3Xzm1e3QGiWSt54xm0l+Gcpho3DQuE8zitMSbz9xYH7LCBOwbWVzTzFHTf69Y+nhMM6cIzs3V7yzdjsD14CMgWseu7cFsRS+IvNVmAsQO4iHgbY/xSEXPHueIZkG6YLmBKnbn6KA7YFjEcoFzj+xleqB9LzIpJhq679xR12IPRMuM7ISQ6A+XMfc/KlVL+bDBBsyMjKvpC8EEK5OsdS/2njzVt0n6/FPTN295cTSxIg9aV8XifLh9FZXc6e2ZHLAgIxtx+or6BTKqD5zU+TtK+eCGs3yiioIegQx4fR4iidBnSAYIrxZRatzABHXq40oxrwORHBeiXpuGpl86/cY8XPj6q8lGXQFEhtFd8dwlhuBZwoZPW7MDv0gnPyirrKJv/9rB5YQNVZbCX3jZjK2HJzb9Z0TIV1nejqV54kCjQ4wkyhFn2i781COT/uE1lhA5LCYPy8gPu3COVs+FYYbaz5H85zY2lhDOao3KPTPv5tygDqmyJEavIbuIw3fBgh6Cea2hEtmEo0P2LctdWaiHy+AJA4nPmeSFIA3wjwdVmW4/EkyfQdlYYeL8Ils0TEjGtOk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ycGPgxaqI+EDcz8YTFlsv76GAyB7jpWy+8b031xrEAXgmaEmq/YZ7i391qu2?=
 =?us-ascii?Q?haA6WCfblqr2jW6TJwlPsqdM3+nfqgnQUnD+db0WDMwNN8NWmc2YqDxXffoC?=
 =?us-ascii?Q?7A1XxELs2KDxD6f/c94PKCK3TRHDHDA+McnEFc+aCDrBhMfBrp9MSVNCPLiw?=
 =?us-ascii?Q?z/NZyYECj61ZGZgdPzTtTNevyx15/DeVAXESIFO879YqjW2ixJVLIX1L1mqZ?=
 =?us-ascii?Q?BR/gZi5cWZkpMX9PvBrIq+zU8BPRlQ4Ts/4FYaBbYklVS/7c9GlmHMY8421n?=
 =?us-ascii?Q?Zemm/c+iSOjLH/rDVGrB4M5YxLk8H3ZHQ9SlQ7epj6rptTWR5vfrJ3wVPCI9?=
 =?us-ascii?Q?8MuFpxgLI+9o/ySAAy6iMa6ST1Pa9sQRN9P3q2aN7VYE5JDyoAQfIMymGd8q?=
 =?us-ascii?Q?iqBpLCMdfYVtO926ZrM/TMh53TSFN/YWn2m6ab9dlCsKDPuPCwp9nQN8KvZj?=
 =?us-ascii?Q?XrssSw90zbps3d1wGvkaw86Atb0UbTWL7wpkQ/lLTOwX2Z9NfnZiYaueFlQg?=
 =?us-ascii?Q?1TgU3sRq/DopjMcR5rId2HULE8er6ogToWgCiFdhE5yHOuRJIO3vMUgJk9Fl?=
 =?us-ascii?Q?DNINofFr030Cj46zBDpWv6dhInADisXuYF3l2ebuinmolD6R6K00eHLQuPcF?=
 =?us-ascii?Q?FyRRdEOW8QldggrbK2PGiyV4atw0GoJAIGUDM8V7hM4NSV/t5xPAMDNGrScx?=
 =?us-ascii?Q?fyF7yAyXf2wFo32VcA4QqM3KoMMTe8+jgS03OYeve00XxXhposyj8WxU5mzw?=
 =?us-ascii?Q?uQjctCUGRVOykH3hODJ8hbbNHcwX74yGSxzwNE/u9lF+p0dZwuWyOFdi4JXf?=
 =?us-ascii?Q?fLeSZ6uRSk2BQlDwGBMTPU5ZLDDkH70KD1LzQkQEY3neuJLQSbiXdjXlBYmD?=
 =?us-ascii?Q?T5IW+8ArpQyHG6/t0pXeMU56ULEa21Cnx1uUeeOTNBq8fATHBUOfo036DfgX?=
 =?us-ascii?Q?iN/uxjwsyqwmFDvm6aabkjCCuxSugfsqzvxiKj4c5UDt+qGhvJK7eVQWEzTZ?=
 =?us-ascii?Q?M/NYiLwLf13PRhUozKakWnolqv3ra0GizymfUDm+4t9+Ww7Nr0SCQjeH2Fbg?=
 =?us-ascii?Q?kl8JBSkAAFdcpY9O0KhqtiaGBzjEVcHxojGpjdA/lOJJj04S2VKnpFBPtMtz?=
 =?us-ascii?Q?ii0wfdtyq7YmChe4PSYjYN2RBx/6IKqIbvFBym7Yc73D6Fr+7lFzFkOzfFSJ?=
 =?us-ascii?Q?14TIK2mD3xCRO/wkTAiQ8Z4mo4jlbika9CVizaFZ8B1doBecOD3/klDZxiJT?=
 =?us-ascii?Q?jkvAjQ5UFuPwK89RgqZQ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a98ab9-869c-4671-72cd-08dc90c45c80
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 01:00:22.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_180040_780583_D2E7F2AD 
X-CRM114-Status: GOOD (  16.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 12, 2024 at 10:02:36AM GMT, Thomas Bonnefille wrote:
> LicheeRV Nano B [1] is an embedded development platform based on the SOPHGO
> SG2002 chip, the B(ase) version is deprived of Wifi/Bluetooth and Ethernet.
> 
> Add only support for UART and SDHCI.
> 
> Link: https://wiki.sipeed.com/hardware/en/lichee/RV_Nano/1_intro.html [1]
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  arch/riscv/boot/dts/sophgo/Makefile                |  1 +
>  .../boot/dts/sophgo/sg2002-licheerv-nano-b.dts     | 53 ++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 57ad82a61ea6..47d4243a8f35 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
> new file mode 100644
> index 000000000000..d011fb15b097
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "sg2002.dtsi"
> +
> +/ {
> +	model = "LicheeRV Nano B";
> +	compatible = "sipeed,licheerv-nano-b", "sipeed,licheerv-nano", "sophgo,sg2002";
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&sdhci0 {
> +	status = "okay";
> +	bus-width = <4>;
> +	no-1-8-v;
> +	no-mmc;
> +	no-sdio;
> +};

Please add "disable-wp" property. Otherwise the card will be
probed as read-only.

> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> 
> -- 
> 2.45.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
