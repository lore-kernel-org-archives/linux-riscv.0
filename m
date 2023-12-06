Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8689EC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 01:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hMggr6KYpVAuR38I7Ga7fXHjDHKi1qNNF2X+079Nm4=; b=3bA1EVg1zMkiIfXvmF2ILNTUIv
	yeZlT8+C2PeB7T2PqG3zS1flfUdNuBVroau9MD6tQ3+F6GIVNqVEPZRv+9d1Eo1F9YutV/R3IOZtB
	x/UPjoANFbOtheAGdd7iC+zlZeMUDvTzXEJYceF+MlAuJYdZwseLVKiaSCCr49XieeT/5rokwGPyq
	WfOP79ZsYlVCf9iOrQP1ar2G+7dOAGou7SgwQ7fosg6zXqaQhz6wwFXXj1YCa7TNU+K7kv4mzo7Ck
	RNbUSksEWFL0Rr/glcE7F4odT2tP0w0WplIdKocvAelgMdhCZW+vFTUZ6FXe3e1AiyETk7cusXp3r
	0xgt+5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgpT-008oKh-2s;
	Wed, 06 Dec 2023 01:35:59 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAgpR-008oJc-1j
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 01:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imWT/V0YPCkmL9GlN6ZzR7N+cpqOl0Is/O2ykFQgoGIg9BomPBRNRdcNQ9OqCopEG99hyvBmbz4PmGKM79KvslvyVD+wqaWiTDg5jiSZHdsluKOPdusKoxev+OFkTZ05RpzP8CWFM6RoCXcNPy5xb5G3c9F+Qw3jY5G/Iz4u+A1U2cHO42IyL/NNn/+l/6jHVcLQjuKlIy3YAO5bplX2fYigbztkisn/Gp5BNgZEbD37q4hUVkQhAnT0xtVrphi4QLCz3o0uyu+uAnyzbPQisgJ7olmjLo/8yTtij6A5yhd/mAgtwxoiFe+IHWgHCm97EJl6wZDY/cm7JL3yQuLk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3/y8o1Df7Q2G7oi+hWq8Fo29CZDT/BeEauVQLIObNw=;
 b=Vleuq35Anfz2D42KJvm/q5DKNPYjgIi25mmivM7Wa6zv0jLLdZqb9JJKMg/CAFPY9TmnAOpWHMKGVTIK9LTz6b+3CcIdG2RBDnBpbI1H8EvzvxrR6B0AmBBoWuK4DVQSnXiF73lqVi0X1mGSJ5u+68JWYoEBBp0LN6JOGPuDF7/isu7wMTABpfTEkIZc9NRICG+iZQioJIf3HbmCYGQdEPY2rJginMIhrbNBjIz5GRmDPi9SIWVfLpfqYlhUt6hjz32C6lNZHv2o2daiMkIfXJTVCrCLU/19BpMCWUj8jNNUDUcMbTA/lk9HyJp71ovRw6HTmlKYUU5MNiuQ7gKQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3/y8o1Df7Q2G7oi+hWq8Fo29CZDT/BeEauVQLIObNw=;
 b=EFbe7tfJA9TfB0SDfW4sx//Kt5qQ58BHu/abvWJSkyv6BbbbamvGpJr/S4j6jfWflBsM/Ngr+Vq+1BxrSOpEhqx+hvYGPIKz9MYYqYdKFUHWsbo+Vz1US4Qi2fxA+sXkeTsUOR09b+ukKIyviVQsojmA2oxMiPs0Pj2rp1DTYdyS4ktd7R++RKFDcJclHa1sTpXYdFP5fChLKCkEeLy0x64P/j9yVExEMjfi+m6AqObgKGmzbDnUcM1R2EbzUMuZ8Yac6lnGxdMqXLDKYqm54WUtOJCyMdcNYyxEQM0OnThqI1rljYpl/4HuwGyHRyh7KX07/Nx3fxjK/tKl/q3bmA==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB1582.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.25; Wed, 6 Dec 2023 01:35:34 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7068.025; Wed, 6 Dec 2023
 01:35:34 +0000
Message-ID: <MA0P287MB03320AD9F4B62A791C67FFEDFE84A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 6 Dec 2023 09:35:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] clk: sophgo: Add SG2042 clock generator driver
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, samuel.holland@sifive.com
References: <MA0P287MB033276574107F5031C153DDDFE85A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953B7BBA12262E0ECAC2B04BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953B7BBA12262E0ECAC2B04BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [Mba8P2W9UoEeJ/ApMAV/S32OFfA1spiy]
X-ClientProxiedBy: SG2PR02CA0080.apcprd02.prod.outlook.com
 (2603:1096:4:90::20) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <27066a03-0c15-44eb-888b-ac5cf37508c3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB1582:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d75e31-e93e-4ef8-e3e3-08dbf5fba404
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wwp8dpqifOsIoEfjbc7+B6FOPEaJ2/g0pJXrg02G2mGS81IiBOgeHt54peAHoZpinnxra/p0TWal4UIlg9tcA/9vkMials4gqbaxC7/l2d7LqA1JSlNxlB3WyRmmD6dQTeKkDf3Um0pFAtQyEJl07rVM1ScqXEGpZGcEziWtACnAw2YiEaZe80LphUt+nPgrfxNSfy+4H5cRHf4N9H4km23nI5o6q7UquejmkN9qGu+2FpbFQmvkPHeynxw88+8LKRuMfT32r3y89EPMHGNREKocPdcXKTBs9EvpnAk70YViUpWkYnM8qd5Fe38d3+JrJjuYFHadfMIFQBHUf+NhvTEN46+WJMrYjjpVmVAg2x27Er8hWkm0xtu0RwdI9jgrGI+F9TsujTfDJh1HRp3McbB6IWKSHSiMKfmdImdZRN+TVO8LVRvxJpeyMJFOxB1yLTm6P3jUPajKiQG04olOuue7QDrb0gC8KagVtdraj/UI07QnAfD8y3vfFB05VUGkSQDp0PSpF1H11mTgB+5curLjUiPya47dQRldK+VXSerHSyp3Zt3uEluSq7ORfsOV
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkFKZm9uQ0d1NVh1YUtnNXU0aGJsV2RkSlBIbmxpYVRMZUlQNjhxSGVoUnhW?=
 =?utf-8?B?aWFwUHRHYXYrTmtNd2h1eC9laVkwOVVabFZFZlBWR2VtMFhpNlVmSC9kRnZM?=
 =?utf-8?B?WFpkeXkzWXpkVzVTLzRoejFqSFNpK1drUGE0eUNWVHBZWlJYQVdibUdaVERH?=
 =?utf-8?B?TktpUURtUnAyZ1JVNTJCU2twN1lOZmxCdlBVVzg2UUxyZnBZSU5TQkxRMmdZ?=
 =?utf-8?B?MWVKd0FDazBvK2JMSktkUlRKZUlWOExCY1pFZ2hZVVpWTXo4bk9nRUxYclhO?=
 =?utf-8?B?TzYzUnZYZWFJLytLU1Yyd2I5aXdDcUdyUUNaMC9ZVGtQWnVhK1NHb2k5emY0?=
 =?utf-8?B?UnMzS1E4aDQrcEdISnZJUXN0aHVJcW52cGJVSEVvTVFTeVdJdXZJT2s3Qnd6?=
 =?utf-8?B?ajRqNVZ3aWFqZVY3bjNsb1lSQkVIWit0QnZhNDJJZm5Fei9rQXk3RXpaQisw?=
 =?utf-8?B?WUY5c2tyMUdtL1ZFVFRVcWtneE1DM2RuU3NQRkx2bnEzMmliZlY2dGxsOElJ?=
 =?utf-8?B?algrY0ZsSTh4dzRpMTF2eGFBMVo5dmVKdHNUK2ZwN0JRNnRCWTBhcDZrRlVl?=
 =?utf-8?B?SDB5aU1LUmdLWk96aGZKdWpIdHlXUS9IQlVlUlE4d1dhT0lsOEpWMzliN1Mw?=
 =?utf-8?B?a1M2dVFkeE1aRngwejdmb2R4R2Vyb1RGQ01kdXcybnpHQmt5UHM4L1pXV2sr?=
 =?utf-8?B?THUrWWsvTWhOc1lYQW5makM3c2N2dkJ4MUd5b09pSWM3VzMwODZBMGx1Qm9h?=
 =?utf-8?B?c0pYZFpMQ0FrYjVwZDc1N28rQUpkWGxqOUV3c20wZWhmd3BUSUlTQldKZC92?=
 =?utf-8?B?ODNieGREU25yRUdWL1d5UVBuZFhoVkkvL0h0bXhqbjhOS0FjYkpIemkzeURN?=
 =?utf-8?B?Z1FsazVUM3FuUnlUMTBoWDlIUWhJZ21FdktXNHNsb1lsczVza2M5REpTYTQ5?=
 =?utf-8?B?ajNyam9lV01IWlZ0MnZ4Z0xLOHZ2VWRKNmNxaDlRSXV0Z0FVS2pKckVWTVVj?=
 =?utf-8?B?NXNRbXlob2MrWUx2NHJkUThzR0hKd1B4dmJNcVpHNE53dy9GSE1WdzhNVEU5?=
 =?utf-8?B?dld3ckdwb2Rwc2V2TVpJQ0MyU2s2dHZuOVFrOHMvRWFxaDhzaCt5c3FjZmYz?=
 =?utf-8?B?UG93YlpFc2NEV0ZCNUY0eHc0RWtlU1FrbEpOSGZmSmRuLy9HNDdFejJkYjNk?=
 =?utf-8?B?QVNOU2d2eG9waVVnaldmQzhZaS93bTlwT3VRY3VFNEFmVG1JYUV2Z3A0dEVH?=
 =?utf-8?B?dDIvdC91WkFUdFlzS3RKdlBBU0poR2JpKzJiVXdZWkhhWEdGSThocnpMY1Zn?=
 =?utf-8?B?b0JPS0x0VnIzMVMxRkd4YUlZajJ2S1B0dUNyVWsyODd4N2RoQmVGSW0yU0lP?=
 =?utf-8?B?SVV6VlZPSDIxT052RGJkM0E2ZWhZcm1QMlMxSlZFUU5NSW8xY05TSjBvdkJu?=
 =?utf-8?B?aDF5YmJaRm8xbTVYMDdBTlJHQXJHZHNmRVhlRFowc0Y3andSa2JsSXB5VkxK?=
 =?utf-8?B?U1lCQlBsbDVyQ0lCemg2SU1UVit3b2ROWit0RjNTbnQ0eXFyaDlsNjc2SlZn?=
 =?utf-8?B?RitwSklQcTVjZ0pxbmtFUEk3MGdPR0xWQ3kzZDlCR0lBdFZxYW9HVHM0Mzlq?=
 =?utf-8?Q?vdkgGTZj/sa2FEaBDvARQNHJDFN9+XWe8BmyUPQRWL2M=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d75e31-e93e-4ef8-e3e3-08dbf5fba404
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 01:35:34.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_173557_577598_5318AC5B 
X-CRM114-Status: GOOD (  17.04  )
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


On 2023/12/5 14:34, Inochi Amaoto wrote:
>> On 2023/12/5 9:13, Inochi Amaoto wrote:
>>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>>
>>>> Add a driver for the SOPHGO SG2042 clock generator.
>>>>
>>>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>>> ---
>>>> MAINTAINERS                            |    7 +
>>>> drivers/clk/Kconfig                    |    1 +
>>>> drivers/clk/Makefile                   |    1 +
>>>> drivers/clk/sophgo/Kconfig             |    8 +
>>>> drivers/clk/sophgo/Makefile            |    2 +
>>>> drivers/clk/sophgo/clk-sophgo-sg2042.c | 1371 ++++++++++++++++++++++++
>>>> drivers/clk/sophgo/clk-sophgo-sg2042.h |  226 ++++
>>>> 7 files changed, 1616 insertions(+)
>>>> create mode 100644 drivers/clk/sophgo/Kconfig
>>>> create mode 100644 drivers/clk/sophgo/Makefile
>>>> create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
>>>> create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 97f51d5ec1cf..c9c75468f2cb 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -20269,6 +20269,13 @@ S:    Maintained
>>>> F:    arch/riscv/boot/dts/sophgo/
>>>> F:    Documentation/devicetree/bindings/riscv/sophgo.yaml
>>>>
>>>> +SOPHGO CLOCK DRIVER
>>>> +M:    Chen Wang <unicorn_wang@outlook.com>
>>>> +S:    Maintained
>>>> +F:    Documentation/devicetree/bindings/clock/sophgo/
>>>> +F:    drivers/clk/sophgo/
>>>> +F:    include/dt-bindings/clock/sophgo,sg2042-clkgen.h
>>>> +
>>>> SOUND
>>>> M:    Jaroslav Kysela <perex@perex.cz>
>>>> M:    Takashi Iwai <tiwai@suse.com>
>>>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>>>> index c30d0d396f7a..514343934fda 100644
>>>> --- a/drivers/clk/Kconfig
>>>> +++ b/drivers/clk/Kconfig
>>>> @@ -499,6 +499,7 @@ source "drivers/clk/rockchip/Kconfig"
>>>> source "drivers/clk/samsung/Kconfig"
>>>> source "drivers/clk/sifive/Kconfig"
>>>> source "drivers/clk/socfpga/Kconfig"
>>>> +source "drivers/clk/sophgo/Kconfig"
>>>> source "drivers/clk/sprd/Kconfig"
>>>> source "drivers/clk/starfive/Kconfig"
>>>> source "drivers/clk/sunxi/Kconfig"
>>>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>>>> index ed71f2e0ee36..aa5d2cf0b6a6 100644
>>>> --- a/drivers/clk/Makefile
>>>> +++ b/drivers/clk/Makefile
>>>> @@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ROCKCHIP)        += rockchip/
>>>> obj-$(CONFIG_COMMON_CLK_SAMSUNG)    += samsung/
>>>> obj-$(CONFIG_CLK_SIFIVE)        += sifive/
>>>> obj-y                    += socfpga/
>>>> +obj-$(CONFIG_ARCH_SOPHGO)        += sophgo/
>>>> obj-$(CONFIG_PLAT_SPEAR)        += spear/
>>>> obj-y                    += sprd/
>>>> obj-$(CONFIG_ARCH_STI)            += st/
>>>> diff --git a/drivers/clk/sophgo/Kconfig b/drivers/clk/sophgo/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..b0fbe4499870
>>>> --- /dev/null
>>>> +++ b/drivers/clk/sophgo/Kconfig
>>>> @@ -0,0 +1,8 @@
>>>> +# SPDX-License-Identifier: GPL-2.0
>>>> +
>>>> +config CLK_SOPHGO_SG2042
>>>> +    bool "Sophgo SG2042 clock support"
>>>> +    depends on ARCH_SOPHGO || COMPILE_TEST
>>>> +    default ARCH_SOPHGO
>>>> +    help
>>>> +      Say yes here to support the clock controller on the Sophgo SG2042 SoC.
>>> Please add RISCV to its depends. Not all the sophgo SoCs are in the RISC-V
>>> platform, Some are arm chips. It is not good to build this driver
>>> in that arch.
>> ARCH_SOPHGO is only defined in RISC-V arch, so I think RISCV should not be needed as depends.
> It needs for the SG200X. which has a arm core. Maybe we should left it now
> and add this in the future.
It sounds like a new product, let's consider it when we get the real 
hardware.
>>> Also, the condition ARCH_SOPHGO is duplicate in the Makefile. Please
>>> remove one of them.
>> Don't undestand your question "the condition ARCH_SOPHGO is duplicate in the Makefile ",  I think you are talking about Kconifg, what Makefile are you talking about?
>>
> I mean your change in drivers/clk/Makefile.

Yes. I see it now. It's really a problem and redundant, I will fix it, 
thanks for your carefully check.

......


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
