Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86076CDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xohQo0uHsfrf1AHP0GyI+pXHj/Rmz5qU6RsH/FSu1zs=; b=IzfbgdhDlft8Np8KAH+EzEPy+a
	vpIW+3B8F+TygNupmU3X4DHEV3WDzD5KhhauUSbDPaEgrUg3vZ8KqEzlcSe36Gy77sMHdLhRLB2q0
	gOOg9vdgSYZYDhZtY/Wj0J9feHZSTY+4FSbi6oIs6iaVcNbtTMHmrAJtCGvmAs66qIeHIdPwuahFI
	p0zHAn1domQ+YYPEpBFwQ2vWXiwaqX1qTyNOXqxbH9AtjC1eZMWxjkj7vDWkwcY+hX4wCdpznQR0L
	a+5UoeVgaxp0mkfVW65WMB1y9KAKQP6avm4xy1OZs2zOzXOjejK9c65b4vhm3BU+L6GKxh7jEB9de
	4ZqA6BMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRiy-00HF8y-1m;
	Thu, 19 Oct 2023 12:02:00 +0000
Received: from mail-bmxind01olkn20822.outbound.protection.outlook.com ([2a01:111:f403:7011::822] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtRiv-00HF4K-2t
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 12:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izCtOXRD5QJlPRUmdayL3zIRU8vBb9oxoBCfZfQT9cVjk9aaNmqr3+8G14WU+2fUoL8mdDDS1SKij4gYzpiOMiIeOpdZ687pmuQtuxIuqWNlLQuyZ1HQaas+IdfOW/g3+5GAniRBZ8SqDBviM4W76VzGa1HB6wh/miYne7AXy+Imw7n8buX4jICO5SipWS74luzQ4kbS9CSULbdOyHzCdehl3Rnr/5nPNcLXu3Ons22S0DBsgaKJoKaNlfMlfGmWBSxwne1UMgFLhylcE2Us0p6SEDByngudk0vAHUZV1o1VSxaQk5A5/H9C+pgiKfe2LN+jr7wlFAopVnGECn7OfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO1rjDYRUXrU0VtrZQe8G5ivZOyVkSv/hBq/HCLcPIs=;
 b=bB04iEg5N9qTriJL29kalOQ1Da46fzeqy4pKz0JdqXhdvaZUUzjj7EX75QS6Mul26foY5y06oyPAzqAOeCOy3NTK7uO7S9tFONAkpeXUBpe8G6Xlsb/TGc15B6jqmKUN3RblNpeDLEqobmNUTYSW2x96Z8It76xnoQZaNUHucPNldqhDrGq07Yvc+wToQR0WIVlScv9kRxLhGerAhv2CPzAX0OogSsZ3ZPRGu5yXPtDeD8Q8GKs/pcr6MNeZ68j/27ZfAh2jsQd7FLdmRP33fc1f22dObghPGX3oKIUHiWrsZsv9LRuLL2s9z/JMsh8WyGe1FHCM7/74vvtFCXOSKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO1rjDYRUXrU0VtrZQe8G5ivZOyVkSv/hBq/HCLcPIs=;
 b=GnPRyEmJ81mODbOirtkX88fCeA5qrPudIJ8t0Vfs/PJleERJ6GuKrxdY6CoFDgUAuxE1Ue0BPpmxLMYoNPARUMkL9Og7MOK3nf8Eb3LB9PvSzqVwb3oBg76aAxygEXIywgRkAJnw18wACbZhDfl+n6iSI9L/SXOd+P3SbunQogmtTPxr0Jgxji2p0nnVerzsVoBa7ysRO37uQxjn/RtMo7lJLjIHf0UNxSlh8hgesipaoVzciN3kwaCWwTD+xVSlZjvc8VOFPifCvA0B7c8ZK4K47Wapo82OG+Gtv68gXazd/M24TOQY6hDP2zMhtLMKj5zhH3MpAPhK2sNCId34Ug==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB0739.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:fa::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24; Thu, 19 Oct 2023 12:01:44 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b66:61a1:8ed:cc6a]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b66:61a1:8ed:cc6a%6]) with mapi id 15.20.6907.025; Thu, 19 Oct 2023
 12:01:44 +0000
Message-ID: <MA0P287MB03328EA5D4579341ED0AF0A5FED4A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 19 Oct 2023 20:01:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] riscv: dts: sophgo: add initial CV1812H SoC device
 tree
To: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49537B6A093A491116442709BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB49537B6A093A491116442709BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [WeZlCATfSE44mrQ+nqHL65pB8sLZAhWN]
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <e2fc2fab-edee-4252-88c4-acad264b0904@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB0739:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d83c64-99a9-473a-cb43-08dbd09b2974
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmIZHKaonqo2HxgPvyzExGjgbkmxlz5R+uQqj0NAuVMghv0INdA8eq0/qImIia6C5mp+66cQFujh2xZfu6BKeS6MqgzywCgOAD9FWD+iAvM0eWITKULEfTaDc2TOAfDgb3FnCE1hQcYYRs80qDJnog9yZ7xq0bWY2xhetFAqmug/8iGTdbc8+hPXLfwO9o2CNR6xtmMMNFKaS4bxzaJObuBcsuZhRylYgQ1kcSU9a4+Ly0hBO1Xe+ru6yaNflrdnDCDbKbkxp/OFbkqVDtI3t0/TL8mtZzpkjcww98s69H7o3hYkjEwM3E370tG7/7v6tSbjscf2Z6vUqsNiIRx5hiuRzwZkSnFY5wNVhPjGFtqCpH+PZXV9poW5RsGGSzkrHZFyROBmFsAeeFJ30kamsaq9IHCu6LHIlpt2Gro+lZiLsRQPRBZisUeVt+JgtqHn+hSrlYGM3o9o3jkN93Z8YfGNn8nDF+tgdWIMG15NTPxd/v2F7J9E2Rz2bs0F/Y729+ayH4nPELAmBzzPhGVh1xxN8i5CQtinq1jX34hqZXJUlLNB3ITcXvy5OkGM3USV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3RiOCs4ZDdKdnBuSjZBK0RObUlSV2pLRG9HejA4UXhUVU5wWUU5dVVNandT?=
 =?utf-8?B?Rm0vU0NCTE12SnRsMDNOTVRTSUZqYTh2K1RySGpTcDkva2Z6SW0yM0xwVFhn?=
 =?utf-8?B?eWJnaml5MW42SmZZR0p4R01UNFdOTGpYMkNYSjJJMU5qUE9IYVNmR2UrWjZo?=
 =?utf-8?B?aDBENGJjeSs1amZ5elFETU9EN0U4RXkxZkdKekZ4R05OSmhVT3g0NkJkTnho?=
 =?utf-8?B?MU0wdjNsSWRXVm0xVUNjTFhvQllyNkcyUGxiTzRjaFA5cmxVZUJNaXBmYVF4?=
 =?utf-8?B?WVBqcFZ4MEpJdXhzM2U0Tlc3S2kyRG8raGpNNjZpOWNKSlJhTWdsRDIxN2ds?=
 =?utf-8?B?RC8rc3JhVVpDeWlaYmpNdzh0Vkhtc3oxVXFMTXJUaWJiRytDdnNISisvSFFt?=
 =?utf-8?B?MXVHaWVoMkhqS2ZOcW1Fdnd6d2JNUG9zYmRtS0EzYnhHRU1ZMHFzZ3hrcGE3?=
 =?utf-8?B?MEdEZDVnNmhHWVdzU3JqMnFWQzZzMklXS1NXa0lrZXZaS0dJTGlOSXVyallo?=
 =?utf-8?B?WHBBR290TmorOFZFaXFHTDlYb3ZOU2toeVY2djBEQXJrUzcvNUdTOWRNVXJ2?=
 =?utf-8?B?ZHh2eEE3MFlIZW5ZenpnQnMwOTRnaGVuNnJhWDBLWHo3cDIwOUFKNVdsT1RF?=
 =?utf-8?B?eXRxR21mL3F4dSt5M1RmRjJrbWlzOS9rQXR5Q2l6TGMzYXlmN0d4d0Y4OEhx?=
 =?utf-8?B?YnJoSGcwUzFHT3hTUFYyYXY0cWtwUmFyWjFGMDhJc3JkbXFsWWZ0ODVtMVN3?=
 =?utf-8?B?MHRsTUEvenJGNG01dWE0MFNDN0UvZUVkNFRsTGRlWHZNZ1hvMVUyNUVNOGls?=
 =?utf-8?B?aVI1TXNZWDV3U0d3UEw2bVlCTmlRTE0wZWtqTnNoa3NqcXhmWlFhTHNRelpP?=
 =?utf-8?B?cXcvN3IzRTIwa2htZlkrdGgvZDdTVC9TVC9WamZ2SGg1amgrQlUzWDFDODl1?=
 =?utf-8?B?VmRMUTU0TFFhMUdNYkJ3aTc1NUVJZXROU0ZOWFdMSnA2WHJqWnFqM1F4TTYw?=
 =?utf-8?B?eGYxZ3hLVWxFb2E2ekh4WU1xaVhDeGYxazFmcmJwenNtZE9VMXJVdExlZmV0?=
 =?utf-8?B?N1JkNGFLTHdMNCthd3VUaGUrZTVHR0Q2MjBWOHVKZEtYRWFmQ3ZhK0laaU14?=
 =?utf-8?B?WmxQUTYzMC9DV1ZQbktYcTBkSSs0cExBd0R5TWt5ZHYwOVVYVzBhTkpVRGNh?=
 =?utf-8?B?YjcyZWNWNUdhakZxYWFoOUc3dEVDT0pNRHJMczBrb0NSTkd4SEwvaWUva2Ez?=
 =?utf-8?B?M05Sakx1NjVRd0U4ZlZZVmpoaTFueXNzZGpVdnhqYklvNWpVaWc0SlMyK0lU?=
 =?utf-8?B?TFM4UzNtOWxQcVNkcW13dEd4NTA1TjRBc1B1eWp6aHo3d25KV2JoU3FVN0w1?=
 =?utf-8?B?QzZodk1BZXV1c3ZzTDk4M2puOVlhTDI2NlFmNWgvZEdvUGYwaUx6ZUwrdno3?=
 =?utf-8?B?djhsVHFQeHZwVHF4WENVSkFNMVp6bE1VbWc4Y2VCL0Z6YzRTajB1T3NVVHIv?=
 =?utf-8?B?U2s1ZnA0aHRnRjBBZXhmSmorT1JrNXVadEVRekFPaysyemEreFVOOUpHdjY5?=
 =?utf-8?B?VE1oQ1IvdzI1NUcyU1dKZFpYSzNaZWpZbUdhL1ZiMk5hR2VIUDlXdW9JRCtk?=
 =?utf-8?Q?C4XoNO3tHRnwdLrhPC0KXB7s/0mAghzL63qpEgrdphCc=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d83c64-99a9-473a-cb43-08dbd09b2974
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 12:01:44.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_050157_941795_992000A3 
X-CRM114-Status: GOOD (  12.79  )
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


On 2023/10/19 7:18, Inochi Amaoto wrote:
> Add initial device tree for the CV1812H RISC-V SoC by SOPHGO.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Acked-by: Chen Wang <unicorn_wang@outlook.com>

> ---
>   arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> new file mode 100644
> index 000000000000..3e7a942f5c1a
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "cv18xx.dtsi"
> +
> +/ {
> +	compatible = "sophgo,cv1812h";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x10000000>;
> +	};
> +};
> +
> +&plic {
> +	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> +};
> +
> +&clint {
> +	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> +};
> --
> 2.42.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
