Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4ABCD68F8
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xt3fpFkSJmhK513vWq11zFvqKjI55b1vDfUs4To+mo=; b=IbCuejL/bJzwav
	sG3HMr9iE6U5bOX0bF+hFI4S1/53CkTtD1wRWJWSHUkW5IfTukU1EcPEbTwoCMp0aSTJyUG2Cr+vq
	HZBxShRhi4ubk84Twp70+4ESaFHmlvXu2ieb0iLbRrsdUwYEPFl0ehJDlbsWJIw16BImnks/NVu1l
	Nhrzufz9J3WNauY7vE7jhRFySHwV8d20kdxiiRWPsnER3nlB/pKvkhD+WsL5eehsPYQcblRX+R15/
	DczHZdsTeXEPwdUIbHiG+iq9/zwnEfIbWDpkkmsKW5LHmSWD/AbxPY1H5g+fXj5YIqB95SjluOwM/
	GFwQjkJjEyYyem5zzuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7Yx-00ClYF-2Z;
	Tue, 10 Oct 2023 07:53:55 +0000
Received: from mail-bn1nam02olkn20818.outbound.protection.outlook.com ([2a01:111:f400:7eb2::818] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq7Yv-00ClWP-0e
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 07:53:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikllvxzOhbsn+Uf3atUeBUdIpLn3DGRkHcUSuDdsIFY07DEY+Bl5Q0G/nBrWdAyKAsJbG5vE74ttx/pMwDYd8J6hxSaDJcYO/nam1Ppp1J+QRRNIzMNTRn/R5dqic9l7RyN7bKWs9IJAbllkUi9ojYmOReSOLABsiWieaiTSFlO4IUuP4HMEkjjnqftsjOtkA5xp2lEajJWkC6RLReH72v2m9A78baOnLZjgFuAl2z0qsk2r9F32Vc9jCRc3DzPFBrs4R466Gx2Ivmnw/XPSBaOx0GfyL6cBVBWeiM4nZFqZT3ivjnRH0C2tBMSQdN/Q4JfUf3ARWOlO2oHODx9IeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeAPwh3HKPz2diBvOD30MniX/4aclcbEnvfzIcYTbr8=;
 b=QpFhQDgrGX/M4lE8gFCVmdhQhbta8WhUKYJvxtFJJq3UnJ+iKLA/mM4lWeBSpUud63r7DffoC1EzMR4rPpcTzUgH0dwKdUmHZRPYM/FZA1W/nvqIO4+XufpoTEAPZoSdjIuTbezuFKmhosek1hLTS5HHu6VCuAAfRm2yXTALtwMpudUgvVtdMpi0twELxsRJN+kXqxvHwxHT57celGtCBeDKZPN1RZ7xwjqdYbGdPNKFXo0HKhASYAEWR/HyibSVtIPLeD6Uhqa1p9oUEmPjXEK+KEH3Z3O7fUDgDxqtXhd/MIFX76ovtF1l/gUBXjLboCMYtdlZNk5e9BVwN1Un3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeAPwh3HKPz2diBvOD30MniX/4aclcbEnvfzIcYTbr8=;
 b=WtMB9mlpTC58UOl5HHXFc960M83jfkh1BfOwPmYpwk1wXDAN/PcUAWq6lDEJRpbJ8mGfzwaOn+rRAhYJtUDB7BQDtFSyDC2E5gmGpILtgeQK9Qh2xuVdeWRmCu9mjj7niQhwVU5EBO9oEu3/5//D2xf1UdaawpIvOJEawV9ZKqVBt5wu8Nl5r/Ov5nMYOS/4vKfLV7fdA/zeR36wRAumEz9nB2XIl34WzWCqC1NrM/yaX3Jmm4WZBaeeSyQtTE1QJRvq/fDuqShYz3W323Q/uwHaVGrYmkmQ58IyJiRlR4ytyjnceppxrxeXbeTKzjAYyiJL1YYiuzji18e5aeB1YQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB5966.namprd20.prod.outlook.com (2603:10b6:510:28d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Tue, 10 Oct
 2023 07:53:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Tue, 10 Oct 2023
 07:53:48 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] riscv: dts: sophgo: add initial CV1812H SoC device tree
Date: Tue, 10 Oct 2023 15:53:54 +0800
Message-ID: <IA1PR20MB4953AD81686694CEA4F5FC6ABBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <MA0P287MB03321A9E3F3D8415DB9552B5FECDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB03321A9E3F3D8415DB9552B5FECDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-TMN: [AMXQLD5A3OJi8PVT9OrML2Ggwf0meTeCDpe+Cv4XMWs=]
X-ClientProxiedBy: TYCP286CA0153.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231010075354.27306-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: adc38756-0165-4d2b-4dac-08dbc9660866
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g2XdR0grJdvv9MNGWFTni/lDcuPmJlZckn8nsZn27g5ZT1RY4+RjCaNxDSBoG1Q7VqzYedPPMUQ+ri72/3YwUqbwNrWIP+C22nK3JFvBJkOo+dRy81jazeLoLCzyicZU+1w1iZpBaqkSKKLoWGutmWldPUFOjpkJ29Yk715KZ3+35Cxdb9Mch15Kr/ZAvX+xRR6wQYTYQyINZ5YmC8YmHd42iBgPqLjWJlWd8w8MuHxcjvxLSe9S6UnV6jMprLSzxgLkYjP29vNkJBXbHm2a/+xNeqjy8CxbZbjzFqUEfydoFwJSMIiRSvemFsuV6WVmmjd1nGahkPjpvGmScvt3FpZQNB5vqlJOHwu87tsCkdoMxiQ4ZW0HJKApo0HzZoZVVjrgZ1oGgFaZMG50hlkCmocwOiYW382TPCKW+uq9l2Td4kLKDgMTQmoXScXI2ZgMnouWNwqWqqXJ8bh5dqJrBTenBrubwGdnFoYGvTO53h2DkJJ94rSiX7OilJTAjzeLT+6EOTMxJ7VGCPK1njfEOtxoNKbz4Y+QlLcyyEBmv5lmiSpNBf9EGOGWfsilZ/kXsuTNDEp0+NXLefYoEpwr4FFMz/fM9WANR3PTEAAgYJp8fd9nCIDdcufvUtmV+tKC
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z52hT7RtIT0HbLBt9XAlvu/FIhV54XhMFE+OPGaC8QQxjZL0OqieFiXBx7i6?=
 =?us-ascii?Q?yp5h1jnky/tBzeHAKJlqfbAjnd0TDQtaWUwX3HxqbhsvXDEltSZExRla5czO?=
 =?us-ascii?Q?J3Sh9cHxSml7kVjcEeH1AzwvQs/ivm73cd2RTD7dE3ECG8bB1krZKxaFueMy?=
 =?us-ascii?Q?ZhORisP7Rtc+xG9rS5ohTxVGd4ZSQNKs9zb8jOKPAHnpI9RhkhBNUJtxi/Cq?=
 =?us-ascii?Q?oAsXj7lY8CxapKD/EP96i8Al6WQ1iqlY3HkiXK+Di5gRe/mSGG3ubwm7wdGN?=
 =?us-ascii?Q?N9haZowz1oEzWVMT0eObjn+TZkwfFCak/I/Zi3SmtRDV5HPGdwLhkrqQI5dm?=
 =?us-ascii?Q?4jRS90E/qhuBKCohBQ1sQ+hTindXwKyF+EcST16HG8aOvsCtOWibk+rhng+c?=
 =?us-ascii?Q?B/WZBROHsxVtiYhKLCitiz71EhEAw9vLxGLyFEGVbnusV4W7X0cwqHhamhj0?=
 =?us-ascii?Q?QZX2TC9BS9HVrRx2HWnPjmd2tTpc+azyr/uzzD2bcyqkLfytou7Cjg5zCHqE?=
 =?us-ascii?Q?bcaLfOj4ZTlz8ps0MYGVrANldmuBgsuknN7vQb68EJAjs2gSDf2JwUzoHdTX?=
 =?us-ascii?Q?xslzAoo2m1DhuviEsm8le13DDnXhqs7DIRmV2r6CswU0RmqpVieRQpXe9mUj?=
 =?us-ascii?Q?NguHErTAaf9QKURSbEvK4ABhJKRrKFXieGl49EYzy+F7B04FFfHm+LCke/3X?=
 =?us-ascii?Q?EyZizdq7rto8nx3qYiY5dyw/MH1aE6Wj+66zR8e5LF0GCewjpxOVH/ybPGz8?=
 =?us-ascii?Q?mNxsW52Dj+FHPq5BbTSOlk4/Nr65TwyEpv/v930M+suhcM+xah44TvITb+yR?=
 =?us-ascii?Q?9949/ITKb290RTjKR1hd8zL8RcjeFYwaVFgqWkVIa5hfC3tivhskZKGZBMNp?=
 =?us-ascii?Q?BkiAgvhLH/JJZi4CtwFx0ZS+2DhHvfA0j3D7zBrcxbpSLb5P1IJCi2UQL672?=
 =?us-ascii?Q?Gr4ENh1g6FIh6Gq5bUcHC27wGM3KgCmCCdq0UqoLnMlmfRYsyYJvRuIhBM/t?=
 =?us-ascii?Q?vFK7KJwwYEfuhoSzG3PVjPdhtf6iKJD8hckCmfZzDGznRZQKOouIiJp1D9ti?=
 =?us-ascii?Q?5CXi+WGYqRYWoCJthOkaaE0R6eiqqofgJTbbdTf/+ASKet+kculsQkbs8Fjh?=
 =?us-ascii?Q?eqlRC6Q3hc0PxIy/e7FNvJoXLvprEJYl4BAN3XLoKcMf4qRB2+yhmYqPrM0c?=
 =?us-ascii?Q?Ch3IzBe//qTpBJPKH2nvItsl1mpAkl0upaoVbj7flBSGVY8P94d5rrhze2A?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc38756-0165-4d2b-4dac-08dbc9660866
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 07:53:47.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB5966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_005353_244670_0C3B38BB 
X-CRM114-Status: GOOD (  11.27  )
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

>On 2023/10/9 19:26, Inochi Amaoto wrote:
>> Add initial device tree for the CV1812H RISC-V SoC by SOPHGO.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>   arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 36 +++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>>
>> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>> new file mode 100644
>> index 000000000000..3864d34b0100
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>> @@ -0,0 +1,36 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/irq.h>
>This include is not required.

Thx.

>> +#include "cv180x.dtsi"
>> +
>> +/ {
>> +    compatible = "sophgo,cv1812h";
>> +
>> +    memory@80000000 {
>> +        device_type = "memory";
>> +        reg = <0x80000000 0x10000000>;
>> +    };
>What's this defined for , I see this is different against cv1800b.

CV1812h have a embedded 256MB RAM. The cv1800b is 64MB, This is why the
size is different. I write this node here because the RAM is embedded
and fixed size, and leave it in the board DT is unnecessary.

>> +
>> +    soc {
>> +        interrupt-parent = <&plic>;
>> +
>> +        plic: interrupt-controller@70000000 {
>> +            compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
>> +            reg = <0x70000000 0x4000000>;
>> +            interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
>> +            interrupt-controller;
>> +            #address-cells = <0>;
>> +            #interrupt-cells = <2>;
>> +            riscv,ndev = <101>;
>> +        };
>> +
>> +        clint: timer@74000000 {
>> +            compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
>> +            reg = <0x74000000 0x10000>;
>> +            interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
>> +        };
>> +    };
>> +};
>> --
>> 2.42.0
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
