Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05862C52D7D
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 02:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nd1BS1++yEx+F2SlkweLyhCtmg4bHIs22BlJWXfuE8g=; b=ESjKEcjIpmzOk3tUDqymkw4O4L
	N8OtJdWWcT8Gdkrl9nz0p4QYV4Dp7n4RStakr2s7FD+eV7i5QhaQGVYtfShNjunOO5PXdKi3ngqcv
	dsKPomHTUqDrYQvuM71lPBAZ/8Ore10iOUCXOnhNpXx4qyd/oljC8yRwJWA4S1j5XP3ekO7wdvZGa
	JqLc1TJoeHo7aioZXu3TRZ6eKXjbwYEbaDzp3bm0Iur8DsZb3TM0bIR9oUy5WUsAdDsm5bHuAdtc0
	rmhpNSKYDywbYb4H1L5S1+Cpk5oI3aeVbL00D4nzf75H4HFnGoK8/wgyIpt+dRP20ykeWtJiltM0B
	lzdMvudg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgvy-0000000246o-2zl4;
	Tue, 13 Aug 2024 02:06:50 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgvv-0000000245Z-1sSx
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 02:06:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lalqCXccyZa//5qmRophO4Oh0/ym5XDp1mv7EoJQKdwfk1Mi/1msY4mQMi/BlqVQEeZP0lvhlYmBMWHkNMrJ479aWMRuAOsqgcIwPFBDCc3zYH9qsnCEN7W4T9qIaY6tnsMxSgC8nSkdeq7XFTl4WHstMGwWcb2t46tVKjWxVqCdLwO8M0mx+S7ZrdMg5RgAiCXgJCuP9zvNstwlMmMO3aDNDd8GpU4dKwqenjl87B8ZErZ27X4WXqD+Hjmm9iFETpwK8NYyQQEqKoTz1Knno6F+N8ixmIrQWREZ+Cm18xR/+RaW3ScMxEDxy6oom1MedN5XF9GqVH33ASTpqJYvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7s7c/pebQ8ocSGeKGlPs3x459ETMexD+GZeDjB+l08=;
 b=F43l2VUSH0HXQRHrhwctqzwl8QEH5dJz4lDTurVDZ4/0GWCFUKbruL3yAY4Y28MsI61yMDiFBieV5waoBH7BeqV3viXMk9WF/rsT8imX4dvnayiJlPcpc1nTELiv8iVzuJ3n9Q0uGcrFXtRy5NKJQrHWSkcm1dM1ommX3fxAcmzchXKNzkz5LEnsrYF2rBsXwkr/WA2xNi/l8bWUxqlcsDHi918bidJSb5d2NYs1hsir5B8FHQBjCREkNSP9CPp+NfLyY2dXuDokPKiaJD2X52BrUIFVRq1R0uqQ3/RT5+yyvRQerFtU2eA3eSh2rBCCJ59oNmWDghWvlus8pqg6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7s7c/pebQ8ocSGeKGlPs3x459ETMexD+GZeDjB+l08=;
 b=h9j5UHd9g8sDNDL35w2Il+2STQLM++SFVSbxeki9BoHg9b15xp7bWf8GHg7orYv6suN0Xj/QtinDhFZ90RCtB1lufO6BXGdLZhKSgEWhSkJtb4/Ajry7ClMMskeN4gBFUQqs3JFzzSQv6WFlZBfxpDl/U9nDvjPwhY8DNQ5pBZET4yNupY+cVEp8lQunN1Nyn9LRGDMqLoJwGamDLyyrng3mtgpKBfZHNf8OO4+OJngj/gloDaDxZp+hZtvpin7bDMyPQaoE40/6HtWx2BErk5MSzi/xuZIxNK2wNaXLylVjxb0WpHvFCrEpQe/PCFd3/SB7T7btLVfVPdYHEOl7NA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0285.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 02:05:59 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 02:05:58 +0000
Message-ID: <MA0P287MB282298A609327CDA62F5D43AFE862@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 Aug 2024 10:05:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] riscv: sophgo: Add SG2042 external hardware
 monitor support
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Drew Fustini <dfustini@baylibre.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB4953C5DB4AC5DF01236CE785BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <PN0P287MB283050511BECD88076E8252EFE862@PN0P287MB2830.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953751ABC2CBB8747A3ABDCBB862@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953751ABC2CBB8747A3ABDCBB862@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [GHzQ/5e72Kyrf9YPAfJii2R8NfgkGl4D]
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <607cca3a-f345-4cce-a928-ea84ffb92515@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f11c24b-0436-472f-f700-08dcbb3c78bc
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|15080799003|19110799003|461199028|8060799006|1602099012|3412199025|4302099013|440099028;
X-Microsoft-Antispam-Message-Info: aOX4SgaqpkGJOYuekxZejLU/pgwJ89LR86kjJoDBQt4X0yLEfgB4qgdB2cQLfEeD/CVMAKrSeqfLZ0C40xeV0LdYB9NGLlDXCHKhwJo1B8UCvnr1peybCi57vDZioYW0Pt4cOy2sJhlMgz/aXoHqwt4jBTyoiONW3Y7rn6Bc5dVvjE6q4AbrEW+/ta80WyDPscEz7s/hO27nLpm2dflXFtgHclwl3BcdjTRZDPiBEx3JuwC4GW3d0gGwD1CyRZo3SzB45vNoQ9gjVGbRsL0FSCEP2+A5zPGzvm3H5gdrHqPrqAr8AWeK00XpHM2ug/gr0HYh33uNyqRBjfi6FX+jBRu8ba5Q7QYEsWUMAnhLmwUek5AZjmiff+o5T28dkY7+UHnMTeqHQC6dDeoRV7zPf4o8kU/ARmQRsWJVxIlVh2j9DYSd4WRDz+dMqNKZ2voIcVzt2XtqYHuYZVutGEmznYO4BGxaanZER8M7HDvPsWchQlqD2jy+m0Fa67rSQGhaXi+Y0f7uVtX3FWTYYLQvnT16DKXNHUAVlSiAYbZ3Gp5VO0hR+nqzqZH4T5/57ln1noQOCIgQL1s+ovkxOhPoGF09Fwlre38Q1RrS/ntH1Wmq6mCCA9ruxSDnS6xD2VqFdI4S3QhfA08kNr6B7XshFsn5tF7323IAu/1JFZtdorZE4oneJ8vsXzC1NatWfsr5XI5Fljd3Yn/VP7VRG/vsaYKEBoQqlfqvYCkbP+LR92ZByerMMNsQeNWu8FZ70YpVQhuckF2BiDekJEzGpKWll2iX0+IEwMUtooSSpfalXR0B7mohOVAPMFgOlD68H97+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3hkQVloNU1HOG4rVGd0eGh6QTVReXRZUVF2STR6OEpKRzhHTHlodml1M251?=
 =?utf-8?B?cUx4d0M1MVNTSW1waWkyYjdrT0h6UlJwaEZKNUUrNVM4OXhIZUNQMzZDZy82?=
 =?utf-8?B?NkhkT3lYQi9nNjJkQUNPd3QxVXJnL2MzSFNnYStrb0UxZ01NTjBtY0xGMG9r?=
 =?utf-8?B?TVRMaWhURDlSNmZEOU9VVnJhTjVrZGpZckduNVRUMFN1TVFRSmN2eklESis5?=
 =?utf-8?B?RERNVWtwcEF6eGFoL09QMGJZUThNNW54SUNuOTU5akxHbnJicDY5djczWDVK?=
 =?utf-8?B?NVVaL2hnbll6eG9DYUlIbVhkUVFmTEhtQzdrdEdqekVxSlh1czEwa2hvbVRS?=
 =?utf-8?B?cG1BZzR0VW0yOWx0SDVBTC9rUHFmMjduLzJEbktpak16enhjVXRKR0Y4akdD?=
 =?utf-8?B?SzBqZlM5dkhUMTY5a0VZZ0VSQXhpb2Y4b2VuMWE5SUpNWUY5TmFSemsxaXdL?=
 =?utf-8?B?MlhGZGhKMm5Ya3JwNXY1eEhaYU5vdUhBdzFRZXJuL1o0TnduOFhtZ1FGcHpO?=
 =?utf-8?B?OHJIby8xS3FGV0plOE51b2pSTXJ4bHRnOTFvYzZ0dU51K0pwc3g3RVdWUG5l?=
 =?utf-8?B?YmVlM2VNblZBTHFKenZ1T05TbG92WlNUbUQwUHMvOHM0a2FFQm8vVFoxcWsx?=
 =?utf-8?B?R0dJanFVVlpieVIvOXp1NWVXNEpiVTVkMkMwd21QU2g5ck9HVnVyUVJIWGZR?=
 =?utf-8?B?NlRhd0JrZzBLbHBBTmcvekFQTHN5UUJoUHFKaFgyRDVIelpINVVmM2hILzhv?=
 =?utf-8?B?MEJmeVFTUzhscXZIak9iZGpwRFFVWDFJQkZjOWd5Q2x2MHZBdTFMU1ZkT0RE?=
 =?utf-8?B?UGFWTWlzVXMwaTFSQzJHR1BFY1hhZi9JazdBWnQ1Z0NRdzZ3UTlYT3I4UG5M?=
 =?utf-8?B?cXVQV1JMcnVlZFJHWTRmQ1czSjRKWXVSMTNLR0JBemFEWXM3TFl4R0Yybjdx?=
 =?utf-8?B?TWh6QzJ5enJOU0dnamo1TmtJbThBM0ozdy9XTGViNWp2dWtsMUNFdUhPRWFX?=
 =?utf-8?B?ekxHV0l4R2JDeDJ6QmE3L1lUUmYxZEErdDdKRkx4MU1KZ01zRlN2UTVLWVhs?=
 =?utf-8?B?dUV2NFVPNG5wK0xrbVFURzlWdzdZaEg5ZFZPR29iQk51R2RScGF6cG5aUFQ3?=
 =?utf-8?B?NzRmalNPdHZ0RlpDMml3QzRvYnFNWjJ1YmtRbzZHeTJRWWN0dU9GNGw1QUNq?=
 =?utf-8?B?Uk5WVTZFN1FiL211Z3RnbU9vWFBSUlZwU2t5cEtualAzTjNuRk9qSEozaFhJ?=
 =?utf-8?B?bk9IYllKVGhDSUNQWlVwbkNJajJ1NUtRKytMaUZhZGorMFBaR1JFQ1F4anJa?=
 =?utf-8?B?NWVCNVNSTTB4TGJrMDJqRGFPa2FlL2VVSGNpZldGRzdnWTl0MjN2dFl4Rngz?=
 =?utf-8?B?N3VtczBpRlQvc1ZaVzRER3pibjJjUnhqUy9KSVUrV1d0OVIwM1JPRTdRSmtS?=
 =?utf-8?B?VUdiMmh6RVNOSUFoby9aWjc5WlFaUEYzZ2xDWEpmVlV6ODdoYU9FVFdWUC9r?=
 =?utf-8?B?QmlNTUJCeC9kSGV1c3I0a0ZhYUQ5NU9YS1FxaDJvQnE4NWdmUkUxa1cvK2JX?=
 =?utf-8?B?emNJdUJmU1NJSHg2ZjVpMG9OcTdmNndhZENTeHhFV1c2dEVqYzVITWoyTXMw?=
 =?utf-8?B?S2YwNit4clNwcnJlS3hkN3lJWVVFNG1mdDhDTjNaQjRrRUVzR2tMT1N2ZEhl?=
 =?utf-8?Q?pwXShB/cioH/rZ8xPsZj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f11c24b-0436-472f-f700-08dcbb3c78bc
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 02:05:57.9616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0285
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_190647_540886_3C9902C4 
X-CRM114-Status: GOOD (  18.87  )
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


On 2024/8/13 9:53, Inochi Amaoto wrote:
> On Tue, Aug 13, 2024 at 09:24:19AM GMT, Chen Wang wrote:
>> On 2024/8/10 16:03, Inochi Amaoto wrote:
>>> Add support for the onboard hardware monitor for SG2042.
>>> Can be tested with OpenSBI v1.5.
>>>
>>> The patch require the following i2c patch:
>>> https://lore.kernel.org/all/IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com/
>>>
>>> Changed from v9:
>>> 1. remove missed wrong return value.
>>> 2. add documentation for the other interface of the driver.
>>> 3. rename repower_action to repower_policy.
>>> 4. use break to unify "return 0" in is_visible function.
>>>
>>> Changed from v8:
>>> 1. rename critical_action to repower_action, and add some comment
>>> 2. remove unnecessary wrap function
>>> 3. use guard macro to simplify mutex process.
>>>
>>> Changed from v7:
>>> 1. add mutex protected and fix the return value when writing
>>> "critical_action"
>>>
>>> Changed from v6:
>>> 1. restore the driver name to sg2042-mcu
>>> 2. remove unnecessary wrap function and check in the driver.
>>> 3. add dts and config entry.
>>>
>>> Changed from v5:
>>> 1. rename driver name to sgmcu as it will support more sophgo chip.
>>> 2. move some attr to debugfs.
>>> 3. add standard crit_hyst support
>>> 4. add documentation
>>>
>>> Changed from v4:
>>> 1. use fix patch for binding ref.
>>> 2. use unevaluatedProperties instead of additionalProperties for binding
>>>
>>> Changed from v3:
>>> 1. add thermal-sensor check.
>>> 2. change node type from syscon to hwmon
>>>
>>> Changed from v2:
>>> 1. fix bindings id path.
>>>
>>> Changed from v1:
>>> 1. Move patch from soc to hwmon.
>>> 2. Fix typo.
>>>
>>> Inochi Amaoto (4):
>>>     dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor
>>>       support
>>>     drivers: hwmon: sophgo: Add SG2042 external hardware monitor support
>>>     riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
>>>     riscv: defconfig: Enable MCU support for SG2042
>>>
>>>    .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |  43 ++
>>>    Documentation/hwmon/index.rst                 |   1 +
>>>    Documentation/hwmon/sg2042-mcu.rst            |  77 ++++
>>>    .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  60 +++
>>>    arch/riscv/configs/defconfig                  |   1 +
>>>    drivers/hwmon/Kconfig                         |  11 +
>>>    drivers/hwmon/Makefile                        |   1 +
>>>    drivers/hwmon/sg2042-mcu.c                    | 388 ++++++++++++++++++
>>>    8 files changed, 582 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
>>>    create mode 100644 Documentation/hwmon/sg2042-mcu.rst
>>>    create mode 100644 drivers/hwmon/sg2042-mcu.c
>>>
>>>
>>> base-commit: d2d190621b60d77496d36659e1621b20c897b25d
>>> prerequisite-patch-id: 5e7221ed1c63bb4d68e4a2a0141440e32d29e397
>> In fact, I did not find these two commit ids on master or sophgo/for-next.
>> When testing, I applied this patchset based on the latest sophgo/for-next.
> This two id comes from my tree, not the sophgo one. But I
> think it should be recognized by the git. For testing, you
> can just pick the sophgo/for-next tree and test it.
Don't use commit id from your local git, use public git so other people 
can find your base. Generally we use official label, such as 6.11-rc1.
>
> Regards,
> Inochi.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
