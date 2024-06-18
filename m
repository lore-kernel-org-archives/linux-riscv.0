Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6980BC2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 00:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6KZJoezKiHV8WeZlcIb+TkQ0dZjMupMwOcUpgAG36o=; b=C4qRfN4kwMVHsY3mVCZMZrrhQf
	HbVfjfH+gC8tDh01jd64jaF5b5WT8Jw9rBkrF157GRMOd/3jYn76lZI8mZLLtfNOGqJ6FnO1djJDw
	UM/b4Nl0frkkSFWJfHXZafsU8OkEBqjF1fUPpIdUAml5ejHp6yqRD611JYinsqli4HRiHzDzKY85Z
	NDsmaya1ValD2h9OQFF1oqFOzRdUzu+a62o79nRFB+6LqbVc3BVSEDbs6Bjhtw50e/oJTodFqHHBB
	Oz3/ApGlbXjOV/+a0D5pWqYFdO3KNhJ6GJx5VbUc0L3dvHB8XlIVDWtIle35VndtEksJ3nxGN2c01
	BHA3QvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJMPS-0000000D0NU-1LAH;
	Tue, 18 Jun 2024 00:09:14 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJMPP-0000000D0Mn-3abc
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 00:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UF3pLVFMzfl8ZgAgC6lHBvzxUhm2Cmkm/IlC1nMGNn7knd2GGQwSkzibV1fXLhkaCfLTzSS+TW13GIwb2P2poW0Pnd1Cu0wA8TxXO2T0K4yeikP2N1lsLgn+N2IRXKpQ1opWbZG227Cmlq7kpQ6OmWJcbFRjFEePUohvk7lH5NwNHu8zNAaIXkqLN+lhtQYTqlgHXD7Ha53Kl5iBiL6700XKsHKs5nsHeKH+E10RqjJKhLN/c1aBsRCzTtXD0FMUoF51wTuK7Md3TYX/ksrHDqB+ES75l1kX3cXWUOMV3ObntNbvxsiVEcxlMUmkVLTLnz8Hiy1C1CWf625kTB1yiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnA5P3qDAH+fqK/ueMY2TXU2K0iPm0phm3CIX3vY5HU=;
 b=AAMbIwJKpZDadcvbnzp9GwMQxkEh3/1BiE8ELSjVbq1oeIp+CDFA2j0Tmskgz7x6SAHyn7sGxJDw6wtw03UT09d2iJsV8CBDZReDgFUL+Zo32ZNZAG3eYAIl+Xc/jJeIvh1AHrve14kTTSet1RTfbRAgdG0SLZrWaxqZfX+4dyB25wusr6JBzqM6ju2uzos9jKJt5EIZ8tGHpyUnuYKRi4ymUpOnlxLQWbkz7UFEqZsCvZWNTf5dXuzz+nE3dUcEV3ALhb92seK+hPzQF4PAGQZe647T9aWpOJnnc5XKxCzsdSXhd5tkVW7TBN41nJLnp1Op8r3nKGJRYUoR1NYDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnA5P3qDAH+fqK/ueMY2TXU2K0iPm0phm3CIX3vY5HU=;
 b=NCcovWaKh5ixbT4qmE4l7tdd/SBJnYwhp4rkklO+aZbVLSh7A09k6Ux2/mEDJiNTytaFcjAGDVyBjfqKWJdF5+LqRY2UH8X47fRuy4+j4fh6OJI5Vo3DGyjSg3i/8FvGwhYuGr1anHCf8lERlwK83cfFHhI/ixyZLgso2M4IbXAZnE61eHasyvhtuhPeHdnL/8iFe/Sgama7IvFUjZZyU18flYOLVjmLe79YeXmYj9VQ0nygpPnjSuqYmHAiA8VTvuR4zPlz1CVNvRcEtfl3A6o7c/cnBySvok0tCqF2SPj9vzvPgDqT2QL42JWmfTYl7vAYB12JERY1IiCYB4r9uA==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB1497.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:09:01 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:09:01 +0000
Message-ID: <MA0P287MB2822FA0D5E803B0C91A0E19FFECE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 18 Jun 2024 08:08:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] mmc: sdhci-of-dwcmshc: enhance framework
To: Jisheng Zhang <jszhang@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
 guoren@kernel.org, inochiama@outlook.com, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org,
 ulf.hansson@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com
References: <cover.1718241495.git.unicorn_wang@outlook.com>
 <ZnBFsLFJdi5TMA2e@xhacker>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ZnBFsLFJdi5TMA2e@xhacker>
X-TMN: [SnAmz4zYLvP/EpSWIT7jXPI9dEsd6maz]
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <04243d53-765e-470e-80a8-62371886542f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB1497:EE_
X-MS-Office365-Filtering-Correlation-Id: de746c9e-1c92-4f00-d7f5-08dc8f2adb33
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|3412199022|4302099010|440099025|1602099009;
X-Microsoft-Antispam-Message-Info: XgJAc0yWCoWG0SdZXt1JsXOjVEUnIh6n3kuREiN3eTDcdZgeRNmNjys9Ia3w1nui3QnSM0djkdL0oo43tJ1k2MmWZiMZlvz+gF160UVedr/t/HObZp0ghVYsH3PmgTkXh8ylYEy+tMIjdUa1yJF+TDbtG6mTwBRkdnuJ13PzFj5llJ+qG5vj75Pbi713Kf0ZwzBQvfSgo7bofhQ5ObB6Kdb2LyLcifjhfu2oETOMbjTL9Vb2g1GVEcbXc/iMDD9pSp1D1iNv+wFSim2Zk9tkXJEeXvYW1FApLziKzIS594MnnHpmtYg9bNslv+pq1mZ+/u0dz8tGnlC6dztqVIR/+aXCrzrpQOtL2FSbULS4J65eMDd0qIEDgPOWT6x4vctUOqX64tV6YGmuiZ45Xtupwfq2OIzZZYdUNSKFGq6tPA6lSvd9Jp2fHJhodETAbkioJDUrJUwsd8ZF2BB+ap6vOduNl46e39CsF0IkKwdaeoQdEb6LoVvpjp63kL6AreLKBxLxLX7sBHsHZauCrwL+K9Zih3WEDnV6myS3fSSpFxIY++qCBp3Hb0mq5ZxXMg6+mv/cvaMTv3+k+5LyZIBPq1I+m4NqAjbz3Ar0S2Ztu8lD0SHykNHI8NHRXM2wWvqqKCtWlZxJ0sY8R18n5Ru1l+dI1InnQzfBq/sHwxY3DcEYYHYkfNG/n8keHWOcsOL0JLveK7u7lbMT7qTI3MSwAw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEY0MEZ2MDRaazZzVUFwK1dCNldSc2xLTEtrSVFjV0FLZTNuV1hnMkdDSUZi?=
 =?utf-8?B?eFNBVmtIaCtrZFBZNDZtb1NBNTBrSTg3UHFFam5vZ2hUdHpvVEFGUDQ5U0ww?=
 =?utf-8?B?MUxMQVZCQ1BudmoyZUZSNGYrclJtU1VRNzdRMDRzN2tvVzJDWDFaRzMwYmtx?=
 =?utf-8?B?U2lJdXBKOFg3YWNqYWRTbHl6RlFwTENBUHYxUXJpNHB6Z2NVVGtoQmoyaExK?=
 =?utf-8?B?amRyL091SHVscXNwWFZRbUg1N0t3c09JNU9FYkhub3dmMkF1bk0ydGEzbS94?=
 =?utf-8?B?di9icU92Ri9MY0tHa2JPK3FaN25aVUFKMUZVM2ZoVVRobXRWSWhJWE93Um82?=
 =?utf-8?B?TFBtWUZCSXBIdlYwMGZUd21ISFB3RERVQy9MR1pBeGlETU5ZRFFNVnBNcFI5?=
 =?utf-8?B?VkNTK200ajB1M2pYWWhBVzFldnV3N3BCVjR3dkI3RXJvMWRGdVBGQkZOTE8w?=
 =?utf-8?B?dXpiTWEzNktHNEhmYnlpQUZXUEtxaVdubUlaY1pkSEV5b0R3QUVIeU1sUkZO?=
 =?utf-8?B?YW5YWHUwY1VBYmpONDhOa3dXc0FaVGdXQlMyQ0J2dDFWWUlXcGtyKzRhVGVN?=
 =?utf-8?B?bXNsRktOYWFBUXNka3g1OE4wVGtRTTdyUUt4YVh4ZW1BeERkNXlBc2dBRkxn?=
 =?utf-8?B?b2F4TWtwY2lERERrT3ptL2hiZm92NXoxVEowLzBxY0pzUlVBdXJnZHJkTkZP?=
 =?utf-8?B?Z3NCUWV3VC9uUnhlSEY5cGNpdWhBbWtXa0FYRWk1TTdETW1WQ1BiTE9PbEF5?=
 =?utf-8?B?R0VEajZLbm1BczkrdnNWVDBZR2NiMXQ1blFtWlpBdnVEaXR1YzByOFc4ZGxt?=
 =?utf-8?B?enVEMWVQNjVySmJtK29INWVIc1k4anZuc09OSmVNdy81MTM0M3c4WGdjR1VO?=
 =?utf-8?B?eUswQWFoeURrYUUwaTRBWlVPdWc1RWUwRE9EODNhT0x2WVlWY2R5U3JPUlVq?=
 =?utf-8?B?NkxseWR3TUtPRU5jUG5tSHJhUjh5NnlJdGV6Q05MWEF6bHFkdXR3RnlqUEhC?=
 =?utf-8?B?NDVpL2grcXlkZW5pekltb0k2dXpnWUtwYjNXVG1xaUxlZWs2cmdsL3l4blpZ?=
 =?utf-8?B?QnlPVnlTNXBneUhyd01LZ1pMbE5DemI3ZTVOY09TSmxGQ1ByUm10WnhJTWVJ?=
 =?utf-8?B?ODhIR2dWaFhZRmxtYXVUaDVkalIxYTA0LzlVdDFZSDY2L21ySE5XRlFEbGtn?=
 =?utf-8?B?U1hRVWx6SStmVnNiTW9JQVpqb0gzTHJXRkkzUkJoQ0tJTStQdURRRFVWUVZO?=
 =?utf-8?B?RHJuS1Ewd2hybDFUdDVyVU4xNHorV2ljRHNNeFQyQktNSHRBMGhqOVRIWTJN?=
 =?utf-8?B?anJvZG5UcjJLb083M1M3M0xiZThjRWF3Wmt3R2NnYzdVS2hZN054Q0pFL1lK?=
 =?utf-8?B?TUVMYWIvNmx0Qml2SUFYamJUa0ZsaEwwV1I0eWZubitKYS9QNFNtVlFiREJQ?=
 =?utf-8?B?TjJaSk1zcUd0NmJNRURHazhNYkZYTjc4QjN6K2FUamZkbCsrRk5vMzJIT2JR?=
 =?utf-8?B?Ymkvd3NRZmI2bnZlQndFdFdlaTdpcDdMSWdLUVkwNmt6eExJOEF4cTJPNjEv?=
 =?utf-8?B?N1hzN0hqTXkyQW40NWlselh4eVphTnVzNmtZZlkrcG5YU1gwK0pSUy9lV2hp?=
 =?utf-8?B?djN1OTd3VEVYN0lWUWZvUFZSZFpEYnJRUE4xcEgxTytKKzlNYVZ0RmErZ2xv?=
 =?utf-8?Q?q0nVmQqhs0y6WSKNQiI+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de746c9e-1c92-4f00-d7f5-08dc8f2adb33
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:09:01.1066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_170911_941667_2150265D 
X-CRM114-Status: GOOD (  18.61  )
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


On 2024/6/17 22:18, Jisheng Zhang wrote:
> On Thu, Jun 13, 2024 at 09:42:03AM +0800, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> When I tried to add a new soc to sdhci-of-dwcmshc, I found that the
>> existing driver code could be optimized to facilitate expansion for
>> the new soc. You can see another patch [sg2042-dwcmshc], which I am
>> working on to add SG2042 to sdhci-of-dwcmshc.
> Hi Chen,
>
> IMHO, you'd better put the sg2042 support as the last patch of this
> series, we want to see why the enhancement is necessary and how does
> it help sg2042 upstreaming.
>
> thanks

OK, I will consider this in next revision.

Thanks,

Chen

>> By the way, although I believe this patch only optimizes the framework
>> of the code and does not change the specific logic, simple verification
>> is certainly better. Since I don't have rk35xx/th1520 related hardware,
>> it would be greatly appreciated if someone could help verify it.
>>
>> ---
>>
>> Changes in v3:
>>    
>>    The patch series is based on latest 'next' branch of [mmc-git].
>>
>>    Improved the dirvier code as per comments from Adrian Hunter.
>>    Define new structure for dwcmshc platform data/ops. In addition, I organized
>>    the code and classified the helper functions.
>>
>>    Since the file changes were relatively large (though the functional logic did
>>    not change much), I split the original patch into four for the convenience of
>>    review.
>>
>> Changes in v2:
>>
>>    Rebased on latest 'next' branch of [mmc-git]. You can simply review or test the
>>    patches at the link [2].
>>
>> Changes in v1:
>>
>>    The patch series is based on v6.9-rc1. You can simply review or test the
>>    patches at the link [1].
>>
>> Link: https://lore.kernel.org/linux-mmc/cover.1713258948.git.unicorn_wang@outlook.com/ [sg2042-dwcmshc]
>> Link: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git [mmc-git]
>> Link: https://lore.kernel.org/linux-mmc/cover.1713257181.git.unicorn_wang@outlook.com/ [1]
>> Link: https://lore.kernel.org/linux-mmc/cover.1714270290.git.unicorn_wang@outlook.com/ [2]
>>
>> ---
>>
>> Chen Wang (4):
>>    mmc: sdhci-of-dwcmshc: adjust positions of helper routines
>>    mmc: sdhci-of-dwcmshc: unify the naming of soc helper functions
>>    mmc: sdhci-of-dwcmshc: extract init function for rk35xx/th1520
>>    mmc: sdhci-of-dwcmshc: add callback functions for dwcmshc
>>
>>   drivers/mmc/host/sdhci-of-dwcmshc.c | 598 ++++++++++++++++------------
>>   1 file changed, 339 insertions(+), 259 deletions(-)
>>
>>
>> base-commit: d6cd1206ffaaa890e81f5d1134856d9edd406ec6
>> -- 
>> 2.25.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
