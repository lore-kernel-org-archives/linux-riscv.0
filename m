Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6458BC49EA1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1S+kp5GWJEtqgoNHkGHabwuBF6HOTgf3+Y6OwLQe4o=; b=hJEBjvppLXZdyipTLQAzNhT18j
	VuJBRDResyEHf37+Rzgi7MMqG/YLMnEapsQSuy6bFMY1YvUtE3sf8RJqryYNE5+f7iOxXzV+ocyAu
	zdwsTo4cUoA0T0wX5r1z7KCRuB62qpyBZBbUG8ryz8NsgaCKx0gxZ5d+mKZaTdl4kqnxhdpT8VsZJ
	ptMFots4RFEFpScfKgPkLG0iowpRhFB/JT6yKcPAG0kHCi7WASUvDdeThD993DkN3uLon9Qs3igCL
	0sD1g7PGPENDSlbc1e+9Tv7VnLc1Ih5zqT7XAMeCFlJ6hDY/rK2fmRFs2ex5rywSWIq8IqtYixz/Y
	UffPvw3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUo8-00000003TRc-14Py;
	Wed, 07 Aug 2024 00:45:40 +0000
Received: from mail-bmxind01olkn2082c.outbound.protection.outlook.com ([2a01:111:f403:281c::82c] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUo5-00000003TPU-1gb5
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:45:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQDHakEqk6ZJEQHTaJfkEGKQMIg6Sc87m7+cfb1lwEqbGTURzRE0wytq7GP8qyk0C2lID0cFgI8/RZXm6bGJoblWcukKGzyDEru7qNjZ2zI3xoIqE0EwzbcJqlKK20CpwRTM573Jko5GPVb2+QYk2YjPo96cWuhvD2vwUCiFt2iw2QT11HKB84oXE9+BUIr1mVrczIitog2fpUZ2jVSA5879ufEugP+uMk7GvWf+lJFTDY6PdR0XyCgyurlegWo1P70GfMTTLOgXVI9RAzMiUSAa4YKuKKM4EkCIv7ePmxv/nj3aNEFTWKtSSY1w/bxnV+ovXy3SHlMA/UcArtIYXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiF21TtNb86REmVZZwB5Vak5VKFYFPcRNcTcbHECtFs=;
 b=rl4JoGEPg3J/ntYy/E3UikVHUS/AolI4IBLcvRXJMRNZkVvewpjzfNCpo8sOEeihoO7nKw6Bc03Ahj3/R7HcxFQ8hKAjZMp3/qX8g01zAiFItaDTiG8Jr7bvtjhid6dMiDdo71cult6pmyUN199T8YXcCvXIaDgXchfuTNdsRWSk51Q0sOWhtAsV+wS3Jd6bE2yjtpeP9pTBf5Yf90XhbyiGAfwnu+BmI7kQUhv1CfPUbHxtoXc2veo/d6ZCvlMKeegHXbbSGr8yv2YySAXqhWPSghWAjrPkh0zcDJqrK7BOUofKbcj9AMHPAnmm0WSS13dcxoCa571B0aAsCUXOwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiF21TtNb86REmVZZwB5Vak5VKFYFPcRNcTcbHECtFs=;
 b=lQsCVtmlL1S+FJq1Xs3QeTojWxkHp7b+c0StqpoyGXwWSiL31T2U6IQzpYUsneH+Q1ZdFTxCPXmHDn7CBLZz/b4iDvUYcrbDX71HoROVUnQWlkFgKQjDemUFJJI26fC0ZPwGNOpOHQFLAa0eERf2MVOVagKphcxgjWPoF1lpNdQAXp+l09PcYr1XI6qHO1NP/S2kDBL/ZVupflgvoPeQ85Cusrb9E7qdx5rPJLvTrJE2HHjZBhbn7Lj0Sszy5cmyeDAQ9yI7LxwoF4+miRbe16P9BxcArjLT1ea4FYfoKRl9UG8JGRu0HXIBL9gee1hY/y9O0fYYVOlHJabKMQkPwg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB1009.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:108::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.11; Wed, 7 Aug
 2024 00:45:16 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7849.008; Wed, 7 Aug 2024
 00:45:16 +0000
Message-ID: <MA0P287MB2822764331021A4A67266115FEB82@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 7 Aug 2024 08:45:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: defconfig: sophgo: enable clks for sg2042
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 inochiama@outlook.com, conor.dooley@microchip.com, guoren@kernel.org,
 apatel@ventanamicro.com, hal.feng@starfivetech.com, dfustini@baylibre.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <20240805023320.1287061-1-unicornxw@gmail.com>
 <CAJM55Z9_sDT2wUy-GMT=mi4FcWth-O_LUbmVtbdZRipQrUzh4A@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAJM55Z9_sDT2wUy-GMT=mi4FcWth-O_LUbmVtbdZRipQrUzh4A@mail.gmail.com>
X-TMN: [6A4W7iPgy7+LZAqHk5oUA0K+HppLmHEz]
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <0a96616c-4114-4435-9c22-679031b464d1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB1009:EE_
X-MS-Office365-Filtering-Correlation-Id: 93fa3511-0628-40d0-8418-08dcb67a339f
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|5072599009|3412199025|4302099013|440099028|1602099012;
X-Microsoft-Antispam-Message-Info: dKfx3cp5k92Ocsi7o3cik6WdAzOA3vk8jlHQdWri8j5fQz93Ad1YGVUFrJqnWf1qHh8QseaDPA0O6cwoeGyULP6Ktc0dcya6u3XEAE5R2rjzm7FT/lBZj8eG47jbWCtwkSmj4i715sQN7CwoGVZjSZAXQf9by7efNsQveENb6M+RG1o3oQNVR1JSnMRIWVYwPq749yvN3ChHkToOXSSHD0yrMFtNEAEMVMHHNqip3SYuvVmEVxAP1nlTjffGU/55V7VOyQYrG06eh3a78RwurAVpxJ6fd8EK+VYXEA4Icn81hFuDBJm4NbGBK4w7Q8RvF4eZM0SF91yu/V7kg65yzZPA3c4Eb5YFO4TAjUW0Oupgnj/DGACLXhiSYcsEkH8oL9j1zb/nhGKIh1iPfXja6rZ8n7iWzEVL0uyg6PojHMWdWN5qL2pMKpqXZT2+SBZo4+WJfkbmR7Y6qJ3qzsi0nQ+SUOX8BrDBH7u1cGCCkZo4TYECmlavIzot2WvSENHDUCUk2l7kPEnqutHfswdWtIvbsTWJfCJJge42/B71q7z6zkq+zB2D4ZQXxNW9B5w8O68zQHhxnJBvQQEscRCWbcLvbwQtewK4iH8ExZjiCa18cnzgVwwNAqInZIlBzDaA7KSqIZ8LEJYnZgCSnMSp34GdQhehlwNkRX8GrYRGWpR13NJ5hHQYAjWfx7fAc7mE1wmuzEvSMrkgCzSPAh+IF5T7fzLBX2WAjPaKFlMj8k7J6pTsirpG7gFbMlVOGiiw5pkNKahsFNavSHBKmPr/uc59CPLZGxk4HDgSjbx5UVo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NwNml6elZGQThxTTJWUmJsV3RHNnoyUVgrbDdRSCttZWRXKzEwaVFSY3k0?=
 =?utf-8?B?OW9IMEdBZUoyb3EwaXFuY1JuWkNGRTJnaXhjTVl6YWpvcVQ4UUZaczd3WkFq?=
 =?utf-8?B?dkRCZW1jNm9SRFhIZFAzV25wRU8vSXRFZi9KUytwRWgvYXlpK1FYTUFRcHZG?=
 =?utf-8?B?OU0yQ2txZ2xvTXdFQUZTSDI5UmlYVERaRnd4bnpwWm53dndzRXozZi9mNjNJ?=
 =?utf-8?B?UGFkSFBiV3VEVlNIQWJFQUkreWRuTmoxRzJTL2hpeGV1WU54R2xER2locWFH?=
 =?utf-8?B?RnphTGtHamtSVUtoK1BjRGpZOTUzTjZxVlNjN09zdzR3aGZJZ1VVeEtRNGxv?=
 =?utf-8?B?ZHltb2EvOGxjTmYyaW5td2gxSVIvcmtlc1RwWXVVK0NqVlBySDRkR0M1eFVs?=
 =?utf-8?B?bHpxUXlzV2VFQVhIZ1RyVDUyQlhBSXBPVnhmTk5ISGJpWW5tYjRVTEN2dW45?=
 =?utf-8?B?N2V1dVljQ2U3dXJBc3UwRm50TDA5QjF0ZXZaZzFnMWFqODRJQ2djZmh4WFNW?=
 =?utf-8?B?b1F6ZDNZN3d4eFJPM2hrTHVjTlhOL1RHYXVTRXB3MUUvZER3NE1jenZ6aVdm?=
 =?utf-8?B?SDhTaFlneVNYMDZQS1dKTjJ2OWtFdjNaeERVZndHby9MODduZG9lQXg5Vjk0?=
 =?utf-8?B?OHJNV0tlMEN4RUcwU1RIbVNOSExCMXlsZDd2M0UxTHp0bUt0UkVXY09MVlgr?=
 =?utf-8?B?Z2wybFdmbi9MaEtacW5kSnF4bmFmRENUTFA1cENyTWtTZTh0WXFMTXBUeGx6?=
 =?utf-8?B?NlZzcWVwcmNzUjJwaWdBUHlHWm5RYmRocWpkV2lDTGlSMktNUXArMXZ3dFdN?=
 =?utf-8?B?ekJwM2gwaVRKZUt6R3VxaVV1cndTWGJIbElyRm1pb0xBMTVzY2FEMmpma1gx?=
 =?utf-8?B?TUpObzg4K29XTDBwb2ZlQUIwK0hOV2FMRmhrQzMvMVl5bThRNUNTMmdkWHIy?=
 =?utf-8?B?VjhlMmRwRlJNV3h6M3VHZSs0MzJPaWZpdkdNcElzSGpRU0RtN0g1eENiL3Nz?=
 =?utf-8?B?RFRKMWg3THpHMmhUU2F1eFlVazVhZHcySTB5YmlaQ3N3aW1QVGhBYXN2VlNH?=
 =?utf-8?B?bFhuWk5WWEpYZlQ2VkFBaU0yU1Exc1p5Y0VNQmQzZUpwOXhYN2xsS1lqNExw?=
 =?utf-8?B?OFhhVlBhL2JMYzVFL05uMUFwZVJ4YjNmZGx2VndZR0tLM0xGeitsRG9NMldX?=
 =?utf-8?B?RmhJbCs5NUJYRWFMWEhEOG0rbkp3eUlsWENvVlpJNUhIY1Znc2plOEl1OTlq?=
 =?utf-8?B?Q0YrY2M5L1hyaTZmWjNnRy8ybnoyay9QWUErMVJILzNvWkVXSGp4UnYvYzRz?=
 =?utf-8?B?WkxFbkozS3RERSsxZkwyWnJGVEs0UGRmT0k0TFB4bHhDUHdYczQ3TWRTeFFv?=
 =?utf-8?B?bUJ2b0p5V1h6QitsUHpPa3hwSjlwY1EySC8yWTJ0YVVkZXBUL251WWRxRnRt?=
 =?utf-8?B?bmJ2Q21zbGFvUS94VjdtZ3NHVGtITU1CRTBwUkdJUk5nank3UDk2dUVhbVJO?=
 =?utf-8?B?WjB4d0xCWVE1OEFtZVhCeEtieEtYVnZUR0NUMkg3VkxDcTRwNU94elltYlBJ?=
 =?utf-8?B?VUYwWE14elZGcXhpMU0wcVVhL2x0cjVOVHF6VnJkcWZNbzdvMzgzd3hQd0ZO?=
 =?utf-8?B?am1SUWczS2hwRTBVc2ZJTFg5bGRXUzQrRHVFbStOVVZ0Z1E4cnRBa09FS1JQ?=
 =?utf-8?Q?qU1uHYwY3TwrV+dqHcVk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fa3511-0628-40d0-8418-08dcb67a339f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 00:45:16.6944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_174537_467181_1080B32E 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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


On 2024/8/6 17:30, Emil Renner Berthing wrote:
> Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Enable clk generators for sg2042 due to many peripherals rely on
>> these clocks.
>>
>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>> ---
>>   arch/riscv/configs/defconfig | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 0d678325444f..d43a028909e5 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -249,6 +249,9 @@ CONFIG_VIRTIO_BALLOON=y
>>   CONFIG_VIRTIO_INPUT=y
>>   CONFIG_VIRTIO_MMIO=y
>>   CONFIG_CLK_SOPHGO_CV1800=y
>> +CONFIG_CLK_SOPHGO_SG2042_PLL=y
>> +CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>> +CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
>>   CONFIG_SUN8I_DE2_CCU=m
>>   CONFIG_RENESAS_OSTM=y
>>   CONFIG_SUN50I_IOMMU=y
> Are these all critical to boot or could they be modules?
>
> /Emil

Since 6.11, sg2042.dtsi has been changed and uart now has dependency on 
clocks and boot into minimal console will fail without this.

The sg2042 clock is configured as builtin to facilitate bootup in 
initramfs with defconfig build.

Regards.

Chen

>> base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
>> --
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
