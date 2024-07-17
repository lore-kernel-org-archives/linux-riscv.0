Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C8C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 08:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=84YFigKl1h4QZw3/M1iTcisFQx06WNZfqVzLcJBTlkw=; b=jprsOR5EFJ7Jq2YFZmFJy44aCD
	1+ptQZyA1pjfEWX1OF4P3/jJOpDys/F8BlknFSdk7DqC1Oi6X0mSEIsFLtlWg2LdYFvFlGhClzqTD
	aEOaMNwiBaP8XdEvJfcaENfdtJfH65obnJ1MvZcy5SCKXHt/AdUby8SJMTP5b7ie/3+RWDvbnc92v
	D1QeuoSjf0Ig+h+8UDdu3brixwDt/bqoEtbeVppOhPdTHulTbDmzziEBlNtBNUB6rOupZlc6Glh6L
	F73Um5EylPj5dze4wqvikvXEIK8RdA2J/8vT5JAG2swYs6crt6qltTCmpqgz59UKF9RjMQGhilE0w
	6bXP5/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzgE-0000000D4Um-2ROw;
	Wed, 17 Jul 2024 08:06:30 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzg2-0000000D4Rw-1XtB
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 08:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwxtSBbvoDAONYbLdMDNQtVzmsUO6zXuhEZhwgsq927akRzXK2f2T9OTMxIeNAfdQ2Jd2nRbesigQvQqTRJ30pt6gTmtHhlfSuWaAm8ux0AhI5f+euREF/IQA09XqEbK7zMsdtBFuBpRyxdgWcKopMBwwKGDI5YYxX8B41fvsKAineCYebRe54qxVy6+xRE7BGDzaxjK8aWFLut0xur9/KWc2MrTrOR+8tRw2SodANnkacI+J9hs4+A4CAB6U5HQNS8MdcRQgnON4fOWlauTcgP0A+C2ShWobDLmZO7/1X9hLBYcIe7bQatWz4vIaeciTLpYVl20uaqQoiK3GijV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj/ENntbYy4nal5paba94PHvH1uvloInkN8uFd3HLhA=;
 b=tCnMOOXCNAYBrjCqvvnvKSHRA30MaNVpGMKrBp7mykFjQ5cu3vbmsI8OCDo8cjIDeKYbR+J4s0IPR0Ma3SvbScyyurhRFrbqNlRwJqjUcdKZjWBxzIue9s3SW6FCB39abqjgDFX4bLejYeTPDptq3QxNGXUzMhqmp2YXUjmD5bK5BJ4Fm42jeLHK5jU8qbkMy67Z3Lp7+ka5A6xqgeVPT5GqprIjGyrClPbiSNk+tTbwks/TMY7Y7yOg4rJeLmtQhaXzw5SUft0yOHl7WK0xu6ZIA8TaUtHV1XkmAer45oMY7yHfhaeNcbfse66lSd+iNk2MVfapaIy8lPOvxSZHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj/ENntbYy4nal5paba94PHvH1uvloInkN8uFd3HLhA=;
 b=Hm957+c4orPRtLeB5ktjOsrSS9riBN3gTYOMfYllltdrGRTPy9y7+tRn2kBs5WvuYPUlGj58XTrd0lf5w9SbXUp2R1bDyHgVOQEXTpcL1A4s/kRghr983YAVQkcNLKX+p+IV9unU05qA0tLscOt+5lNb8eLjVwAka7hBMKbOB685u5heEtmS9cXJWhLNuIXsP9nSaXVwn5YmpVFzD94Ro3Mc1eUTBMtb4f4V5KO5XOsNwgKZLgfvft3Ckk1yOVxwQynzH1DhQbr3DFlR47q/1WdFIQkS0jkjfSrVz6E4asZvbveLtXKCL32AelG2VV6dFK5IWI5RAg09u95hrKf0bg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0151.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 08:06:04 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7784.016; Wed, 17 Jul 2024
 08:06:04 +0000
Message-ID: <MA0P287MB282258A1D5F475639A961CB6FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 17 Jul 2024 16:05:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mmc: sdhci-of-dwcmshc: add callback functions for
 dwcmshc
To: Adrian Hunter <adrian.hunter@intel.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
References: <cover.1718697954.git.unicorn_wang@outlook.com>
 <8d13fcec6059b640dc126def05515ca582542c11.1718697954.git.unicorn_wang@outlook.com>
 <6f4acb70-b4a1-4583-b1fe-20f979ef16c6@intel.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <6f4acb70-b4a1-4583-b1fe-20f979ef16c6@intel.com>
X-TMN: [xkwhl46exvSt28EH3w3krBiT6os/LrO9]
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <7f2dacd2-7036-4764-a82a-67066ddec3f5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0151:EE_
X-MS-Office365-Filtering-Correlation-Id: 8688f263-33a1-4162-3de5-08dca6374dcc
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 4Q06OqR7u5n5fGUDsEEdpd5YqJaaosxsUvBBMoW0qdS4yaBXEoRuybL3JQFipUJnHAGnNxml1a9rVe73KIBctl37lmk/W+6DnHML/azb8pRNPgy773qvLHLeLZhS7D7zfxGlxmI+uQrxughuOvWfQDa9LY6sXP9GiC9EoWDRQzvR4XSq4oKdAU01BbV5wy5tDLYYErRSHRc9z79VnFzXifXGNHQB3NSz7rIXcoknB99sbDud5SeuJ38PC5KNJWumZY+bO7huKprIYOoENCUvLpC82VQVcj7Dpx+qI9MDshLl/WDL6SOY3GYwea2jy6KaaP6IWdRS45p6TLkyw6HlOClx6tQGi7puPuJzpbmSsq03Q4reTGGvZhZHPQxjR2XFqOekgTatahTxim1iQZH2Qj2SpXCXzHleN78A3OWKmcu3AF0X3uDWhJxUhNF8M002+Czj/hdwHomkuAh4q2Caxsc6ZRqNWbdNFHYzyVirYZ/hYRl/2+YeiVN3bMoUWg60KZVYwXa3HI+zForr+K9gt/qVFz83lFnZGnSh/xc7K3uYN4eD+u6fVoLdedda/uNfGxHfZoS4BEgKEAatigalRpHXm9w8I9/LG5yQ5LObidlApakKsegTmpMoXWKx3479H6QEdS31cPyVWeTsPVb62g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVFESmtpRldmbFUvcFZwQjUvLzd2SkpCZkRmemJ0c1drcEE4N3hSODhFdkhV?=
 =?utf-8?B?YlpQQ2xodTlYZWlhZTQ3WUp2KzZDY1E4SG1iK3hkWGdPakNWSG5IRWxzTFZr?=
 =?utf-8?B?TWdRYzkxd1ZrK3BsQ1JyM3psM01xRWROZ3YxejlJd3dtTVJnQUczdWNsb0lJ?=
 =?utf-8?B?bTFSSzNWajRCeXE0K09DaWV3d3I3L1dZalJJZDArL0l5SnZBRDVxOFNHSHhs?=
 =?utf-8?B?ckdQZzU0eGQ0MWNSRlJ5eGJTa2JsdWJaVUdOQWRBL3E3NDJJUklxdGdPNkRE?=
 =?utf-8?B?alVmY1BMMlB1YkdUV1dDcGxMbWI3YUduUG5TblA0OEN6VEZNc01qMEdTSnB1?=
 =?utf-8?B?RFNYVDhJcDMrUE81SWpaUXhocnRCTzRWZTBzb1Mwb1pacGR2QnRQN3F2dERX?=
 =?utf-8?B?ZnNSN1lPdFlXeCtWdXRNWm1nRU85eklGYUVyOFRRODRmVzhoRlZMSDVBUXpm?=
 =?utf-8?B?aG4wNnJPdC9WYUFFSXZpWE1uL2grT0NxVFJ0eThlT1M1a2VJMDU4QkZOS0hk?=
 =?utf-8?B?RXd2WlFXNnNxcXBTNTdHcG9uRVJPbnlBZUU4L1NNNjZYTERFRDJIMVVWVEhn?=
 =?utf-8?B?ckpnc3ZsdE82SW41dWhuMW4xcU9SWVJMak5YTG1tMjdWaUJiMjRsdTRBU3Fv?=
 =?utf-8?B?Q3lYZWkxS1Z0RittZHZ4Z0tkWVlWd3VLMk92c1JQdDB4TU42bmFqSGpJQXg3?=
 =?utf-8?B?Vzl6SG13dWN3YnV5WlA4OWhmbW5Tb1IwNndHNXBlS2J2cGhTVWh1SW13SEIz?=
 =?utf-8?B?N3FoOWtQanVXUHo0Um9jSjFwRUEwU1BFNkYzRXp4bk1BVUVMeEpPdlNuSUZh?=
 =?utf-8?B?NEFDazRVSTJTUHREcnQ0NEJKNldLcWJJWHZxNmdkOC9XSEprZDBseDRBNDBP?=
 =?utf-8?B?VnNXcFF4Q1RwY1E5OXYybW44WDN2c0FodTNBTXN5T3Z0T05nVVpEMXRzVU1s?=
 =?utf-8?B?clErVUlCQ2xMVUFSamtKZjZValZEWUJIcGNWUzhLVTdOSDhTMUFRTFRyZFc4?=
 =?utf-8?B?Z1hWUTJxSkdYbFFTRld4Z0U1cnBpeU04MU9weEZZMTJPd1g1MEpQSEl6blFJ?=
 =?utf-8?B?RGEwZ2JVRjI4M0ZsUWxHb0c3YzhKV1RacXA4ZlQ4Z25SVVFJUlZxUkVhUWlQ?=
 =?utf-8?B?VWhTQkpTY1U4U1VmMk9XZnNpNHQwZWwyRlNaV0k2S3J4R1Fvb3NOYXhqMm1W?=
 =?utf-8?B?aFJkbFlHaUtoOXZhbVNkbjhpM1JyaXhXTnpUUExPdXRCTVh5U1ZydEpSLzFZ?=
 =?utf-8?B?QlFnb0xuZG1RTVFGYlh6SnJJc1NGOHlyYVhvRUFyQXJ1UWFCc3FqaUw1UlAv?=
 =?utf-8?B?MVJoUnVBdXZ5bDkrOCtJbk1jZ3VPdi8wMk90OEl5K1RQWXlibjVtb2hRdFNF?=
 =?utf-8?B?SVYwR2dTRzNMVG5lVE9QWHhTcERkYUx2QlR3eHVEUHRkZ0p3VFNqWWUyN2RZ?=
 =?utf-8?B?cGpoSXhTS2hsNWhVSGZPNGRzeUM0VjlXRmJyVkNxNDE5M2FnU29SSTBtcENj?=
 =?utf-8?B?UmJ3TzJ2TDloeVBubUVNUlV1NllINnlia2hOcE9COFJjcHBxMDhMZzZvVFUv?=
 =?utf-8?B?WUp1cXZuaVd5N1pyNTEyaForYmtPYVB2bmNqYWJ5YXI0R2trWHJxanM3K3pL?=
 =?utf-8?B?QUNEY084aS8zRVpyTUdUdjEyWFRaajlBOXFEUG9yV3dSNUtlVGdkemxVcE5N?=
 =?utf-8?Q?lokICwkA2tyVKIxQY5N/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8688f263-33a1-4162-3de5-08dca6374dcc
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 08:06:04.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_010618_449875_EA2266F9 
X-CRM114-Status: UNSURE (   8.93  )
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


On 2024/6/27 3:13, Adrian Hunter wrote:
> On 18/06/24 11:38, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> The current framework is not easily extended to support new SOCs.
>> For example, in the current code we see that the SOC-level
>> structure `rk35xx_priv` and related logic are distributed in
>> functions such as dwcmshc_probe/dwcmshc_remove/dwcmshc_suspend/......,
>> which is inappropriate.
>>
>> The solution is to abstract some possible common operations of soc
>> as dwcmshc platform data. Each soc implements the corresponding callback
>> function according to its own needs.
>> dwcmshc framework is responsible for calling these callback functions
>> in those dwcmshc_xxx functions at proper positions.
> This could be 5 patches:
> 	1. Common bulk optional clocks support (as suggested below)
> 	2. Move functions dwcmshc_rk35xx_init() and dwcmshc_rk35xx_postinit()
> 	3. Factor out code for th1520_init()
> 	4. Factor out code into dwcmshc_rk35xx_init
> 	5. Add dwcmshc_pltfm_data etc

Hi, I'm back, and I finally found the time to continue this work.

Thank you Adrian for your execllent input, I will investigate and rework 
the code as per your suggestion.

Regards,

Chen

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
