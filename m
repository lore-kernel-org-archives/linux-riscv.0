Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A72E81E1F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 05:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR+D5Mj9nYbwLw6slvYlJxV6k4pPuKW1b/KgD5NMbrc=; b=YI1zINZhUNsEmqIfU6j8x6qlru
	Fi4Dq0rWfFM4LjsfJfAw+jqSOQpil1AA26hpLOGf2XVvdL8Y8GUCbSgOElDVYSkfCXLs6bvQPr7Uf
	xCwUrjBXrFODHoKa/qwIQV+zkXmAb0uP2GOTID2fVRnfRGabzyV4YBYPNnyNpLWrBMoQIyCn1ULLm
	eXSer+tZ0NoNpXS8H7dpLpoxklHJt+FWahSooXB/m2BlWgwZHWDoZfkk5nZBEDwIWALbxDzPh927N
	iDwMs8BiGx0iQuHM3N4T7r5sjH4lSinelcDfTMT++6/91aBd4PmwurocNgptqMGKd+iCPO9rkcw4x
	FJhAP05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp09B-0070vc-0F;
	Sat, 07 Oct 2023 05:46:41 +0000
Received: from mail-maxind01olkn20818.outbound.protection.outlook.com ([2a01:111:f403:700f::818] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp097-0070vA-1U
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 05:46:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKV/igwutnUHy2HHnBpCUEMFSwUokpxFmpVIRN8CX/IgiH0xgWb0BwBMiysJTw99AjI+9MRjdm9zeRhb3SWHSdUpHDpyHwCSR5auVR7eJvlkCe+SAFTLwaTG44ixmRxE42k/DzEgtP7OFwVOXTFo3h/hSPmYKAbrQPhn5zSJogECm7EfP/u4yPc8SF8oyMgnRJVOAE6R+I3ZN9sSmehgxj+6wAQIS3fFhOesf+gRlzYZEdd6rdxWXy2+Cnwf6zUuOUoEZamhTZNltXkoO+tVx5qFUbF+YLdy0PA8sS4azeil6jGbrnPlMjYj4FfCMsb0r8TLa81n9mQTPh5AmoIHgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8jHeA7IFqUter7dmuTKeWPJztxwn6Dwa29qzyfXKjs=;
 b=VDXpXzATh+vNlYQmoH7ZCWL+1qg3VOslj3QzaKVcxyZm9tZhfvQouu+Rap7mjB0adaQ++1IugoJNVMh11zgFFJvSdwjaelSjAQDjivkBBH3YYD7shO1P+1PCajORj7IYgBpyCstGg//IowZ9SpRDqr4XbFRo1dL4HrJP/H8/PGQlezXiNod4O49ksbMFdIA3kA0/ua4O+WGnqj0ah8l8M6Dk05tYOiu/k3ut7fQ89FTpHeepkbNWQNch74HzxHLA/HyyGFBk3kWfTGCe+a8qvIimYal/mn9HbMmc+2sngHuX8XwitONWcSpH6dOIBeraQfLrpy2XdX8qs7tOIWhVQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8jHeA7IFqUter7dmuTKeWPJztxwn6Dwa29qzyfXKjs=;
 b=m+4b2WBvOxJe7Oa+XKeHhJRKADq31KIo4CtA/9mhNrpTqfcAUXZzWnifD1tpc3ecbFgbwUMbTK073O3hAByHtMsmYm/8f5BEGvJtucSu0v0nZKnPVK4ppYjl7d5G6+BS8/+pfS8xui8w6zmNvRsuQsl1ExhWOtiOX1/jkyFdHkvl1CMXOoimb2y+IaEv3AiAmnXM7MyQmSHJdaay7dIFzpVwuYsAede+6g/CGzZaohjeoRmW0Z5kq+8g0xELG3Cx11XnID/EYQclhtEpF1jdbAy8c4QRMgqL5F0snvwokUzO4AkP8M8BTBjZK1aGIDtnFu19PBCruKx03MEUf3MAIA==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 MA0P287MB2421.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:122::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.41; Sat, 7 Oct 2023 05:30:06 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 05:30:06 +0000
Message-ID: <MA0P287MB0332E0A6BC14C883D795C018FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 7 Oct 2023 13:29:59 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/10] riscv: dts: add initial Sophgo SG2042 SoC device
 tree
To: Jisheng Zhang <jszhang@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 devicetree@vger.kernel.org, guoren@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh+dt@kernel.org, xiaoguang.xing@sophgo.com,
 apatel@ventanamicro.com, Inochi Amaoto <inochiama@outlook.com>
References: <cover.1696433229.git.unicorn_wang@outlook.com>
 <ce56aba64ccd237e5d9248b9b9ed937ffb8894c8.1696433229.git.unicorn_wang@outlook.com>
 <ZSAbgxZItMsEHfio@xhacker>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ZSAbgxZItMsEHfio@xhacker>
X-TMN: [mDDTRdEUcHVy5ggqf0mV1QK7Ls8X+smv]
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <8a2d2602-47b9-48f4-939f-ac4898aa78c1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|MA0P287MB2421:EE_
X-MS-Office365-Filtering-Correlation-Id: 95454e07-34a0-49ab-5f6b-08dbc6f6765c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QtHtCN/kJJk8pnhYokPbSLmhJ63HfRv35sEDOHh4WKmjxZ+cTpA+Vv7Eb98IV1KUZrLacpTNDyTWEOB8/5gXVjnwNNeBWJPqMO+pICopQ/QORl43MhAUDJ9/K1Zzkn7p7F85AERu909u8M/iJF2CD+7jaCdY0y4pTZNbZ4CwX3UxrRWYeH6U+phl/vBlFRHkDZT6P/UTQe1TMw9aH4jpfYto7l4XCacB6IIjLZ9+24kwvhsUUvTw7TFCSc0zIrJgxMRXVHnvhtGS40Ks5xmqYg6Nikmd8+m+mvK3t+9SUa/fLT4jx+3N1Kn3NT9cBU+XctyNG3z5dgvp+HzfSbRjnfWMEpD/ARITQ6cMHcZ+fPlk+pIvf8Zy0gGsuCdAk2zGJEcg6Q7QDS+PMqUZRgVWBUi5BObYPAeMlTvVvsYl07hbESPeT75zb5Wm1zPLmDWnW1N+KO7Ym4MpKelZ5hE4FrZDxWrvtCmfMXeMZoDjIiJQ+3+/LYW9UHebFlJudcEOj2iYQuv5xbTp1oOaereAxAaWEEJ0wkYvW4hxDdMq4TBAmw+QW1/2oeAD+i5t9O+vutjZAvLKDwsBFNA/OFhDzWA3B15gQ/50krE6BNfuOL8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blBJYmd5Mkg5eWdrbXZSN05YeGt1czcyT09GNkFXdVdDeFMrNjVQT281WmpL?=
 =?utf-8?B?MG02TEMvaFYyQWZQZTZPaEpoMGcyNXZYckVrWXVYN0M4d1VmU1d1OEREVEUv?=
 =?utf-8?B?bURIVUdHMzBFTzBreStkS2FKSXl3bnNCUmdnMHJiSWFVd2MwaHY2TExvWS9S?=
 =?utf-8?B?ZUJtUWNLdUs3SEI5K01vL2loQStOdW1VbVRoczRtWktLQ24xRXhjcUdsazdY?=
 =?utf-8?B?V2ZCQkw4TVNma0Vmd0dPVlBXRGxUS3VISC9pUWkxRE5ETlVFdlB6ZWs2dlZW?=
 =?utf-8?B?N1RnTmowWUlaYXJGcUp4M3VrSjZvdUs5b3NHWmVxNnVjeUxPdlBNS1BLaHpj?=
 =?utf-8?B?U1J6S3JyMUJCOXNrR1ZIU3FrMVZZM1FrNnU3VkV6YWJaNHFOOWNqTmhXelVO?=
 =?utf-8?B?SzVGQWVGS242SjVzODgrL3hyblJlMC9DcjNIYjNKK0hjWEJmTTFCS2llazYv?=
 =?utf-8?B?aElJajZGYUZNazJqN1BuZUNBRmJha1NuODZ4V2R2SEpFOTVYbTJjeVlLZGNO?=
 =?utf-8?B?N3Q3RjA3Sk9VRzhHWGhVY3ArUHZZMUNldjdscXFyUlZVSXNYK2tFU3h2ZmU1?=
 =?utf-8?B?bmMzQ1pabnB1d0I3Y3NyZTBIMzExUE51aS9Tc0VDMWFUVE5hVVFMalFvMk96?=
 =?utf-8?B?ZWs3TFVFZ0VFdkZwdmx6VTk3bnZHaE43OGpMYXdJdTU0YUNQWWtQN0RBaE83?=
 =?utf-8?B?QWhOeWhEVXZQU1JSNzBKLzBPdnhhZEFRZDB5cXVnUDBYR2lWQWoxM2V0M0th?=
 =?utf-8?B?cmdOcFBob2xHNTJhM3JrVVRpR2NiMUtpRzBTbm95TTZ3ZnlXTWp1bmx1RXJW?=
 =?utf-8?B?NlMxNVBRZXZ1ckJsTHR4alN3Sjl1aEkwc1YyMGkvU2VlY3RQcjl5VTgvalJy?=
 =?utf-8?B?ZXAwWmljbVBBSGJGbVh0NWZEd1FqYjhsUEhxMHhVaTcvakZXYncyd0tZaUdI?=
 =?utf-8?B?Tm92bFBQd3dkTzhtaWxkb1paQTVaSmp6RXF2T3AwNjVFL2QwRU4vdC9MQ3di?=
 =?utf-8?B?N2VENkw3dWVNNkJNTnh0OXlrbG5qcGhiRmZ5S2EwRERac25OSUFqNGsyanNI?=
 =?utf-8?B?N29mOG5HamVMcXR4YjVHVDAxVkFoNU9lRnpjV0YvREFFQlZDVkhYUU1KK3hE?=
 =?utf-8?B?KzZmNHFqYnkvbW5NMHRmWEw3UGFQUE53MmIwcXV1eGZKWWNvUGdzaDRuZkMz?=
 =?utf-8?B?K3dzRmwzRStERVBEQUdqakNoZkN0TmRqeHpuVnAzTHZKUW1kNE82RXIvR2I4?=
 =?utf-8?B?eE1vWC8ydmN5MjZTVG8wekZqRkxDRnprUzU1WUhiQlRnYnA5TzYxVUV1YTZt?=
 =?utf-8?B?ZEpod09LWFYzQy9wMURxUjBwMkM3THVCZ0xXbTFZWFl5Wnh2SE14WWdFYU1t?=
 =?utf-8?B?WlpVSGxieDlqZThuMlZLNUQxbWM0OHN5bFU3bDJmVEVuMFk4L1VRWkxVbTVa?=
 =?utf-8?B?dGoyWGMzZ01pZC94b1Q5a1Fvc3JmU2J3ZjNEZG1mR1dSMlduQmFhdWpEYld1?=
 =?utf-8?B?cy9BZkd3SW1uTW82bGdSR0tjWGFPVUgraCtUU1hmckhYem5vYXU0OEVWY0lY?=
 =?utf-8?B?bXZPaWtKbUZnb08xL1B2VldMbG5PUWlDRld1MTFRanVNK3kzUm9lL2t1b1lw?=
 =?utf-8?Q?Z0IRfp9xGj/rlDp+DBIDcrjvGGxNbo933jynZ2kR7I2s=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95454e07-34a0-49ab-5f6b-08dbc6f6765c
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:30:06.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_224637_506196_29CE4F10 
X-CRM114-Status: GOOD (  14.61  )
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


On 2023/10/6 22:36, Jisheng Zhang wrote:
> On Wed, Oct 04, 2023 at 11:44:06PM +0800, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Milk-V Pioneer motherboard is powered by SG2042.
>>
>> SG2042 is server grade chip with high performance, low power
>> consumption and high data throughput.
>> Key features:
>> - 64 RISC-V cpu cores
>> - 4 cores per cluster, 16 clusters on chip
>> - More info is available at [1].
>>
>> Currently only support booting into console with only uart,
>> other features will be added soon later.
>>
>> Reviewed-by: Guo Ren <guoren@kernel.org>
>> Acked-by: Chao Wei <chao.wei@sophgo.com>
>> Co-developed-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
>> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
>> Co-developed-by: Inochi Amaoto <inochiama@outlook.com>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>
>> Link: https://en.sophgo.com/product/introduce/sg2042.html [1]
>> ---
>>   MAINTAINERS                                 |    1 +
>>   arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 2000 +++++++++++++++++++
>>   arch/riscv/boot/dts/sophgo/sg2042.dtsi      |  325 +++
>>   3 files changed, 2326 insertions(+)
>>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042.dtsi
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 97cb8abcfeee..fedf042e5fb4 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20067,6 +20067,7 @@ SOPHGO DEVICETREES
>>   M:	Chao Wei <chao.wei@sophgo.com>
>>   M:	Chen Wang <unicorn_wang@outlook.com>
>>   S:	Maintained
>> +F:	arch/riscv/boot/dts/sophgo/
>>   F:	Documentation/devicetree/bindings/riscv/sophgo.yaml
>>   
>>   SOUND
>> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>> new file mode 100644
>> index 000000000000..b136b6c4128c
>> --- /dev/null
>> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>> @@ -0,0 +1,2000 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2022 Sophgo Technology Inc. All rights reserved.
>> + */
> ...
>
>> +		intc: interrupt-controller@7090000000 {
>> +			compatible = "sophgo,sg2042-plic", "thead,c900-plic";
>> +			#address-cells = <0>;
>> +			#interrupt-cells = <2>;
>> +			reg = <0x00000070 0x90000000 0x00000000 0x04000000>;
>> +			interrupt-controller;
>> +			interrupts-extended =
>> +				<&cpu0_intc 0xffffffff>,  <&cpu0_intc 9>,
> -1 may not be correct, is machine external interrupt(id: 11) supported?

Just double-checked with sophgo IC engineers, sg2042 plic supports 
external interrupt, so 11 should be better, I will try to fix this in v5.

Thanks for your kindly reminder, Jisheng.


>
> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
