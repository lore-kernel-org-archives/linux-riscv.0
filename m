Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCB9C3DA49
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 00:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFbNlpJaoMVtK3Qv+iMPaG9y74O+AVYarnFll1eX/NE=; b=YiwC1eZbv+LP7u0+3lEekv+z4m
	nX9snBEu0z1vtcCbJ2jwBr+nCJAbqjBCl8CeWIu1Ozwd2zV8p6yOTTK8tKIhWZh9z/ulOA0mAPIbu
	NMc/O7HUPa1DdlUagZ29LauzlHH3ar13qB9r7axaX4yI/z7Q4cKKkPAQQyIM/xiz1Ht2wyjna9VEz
	VclzVzzZJ1i0eD4F5nFxlq3QWg+25QTpJVbsuTu5adKsmGDJ834mwALMLkMLu+BKUyxP1RSnqhsKm
	lQKc6QVstT2nVt9+z1m2iZ7WQI+f5Pw/rlmwYL43MWuML7AIPRF012Ecaoz82ExK3du0gIfZevmkC
	c60bWiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTsB2-0000000C7rS-3FSw;
	Wed, 17 Jul 2024 00:05:49 +0000
Received: from mail-bmxind01olkn2080c.outbound.protection.outlook.com ([2a01:111:f403:281c::80c] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTsAz-0000000C7po-2bAl
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 00:05:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpRbmPCTFQNWz31F1sHKL2631773JZtfwpQDlCO1Do863aINN2J0uUA1a7NARhEjDS96oW2iYIRXbCpZ3W2sVTzvinDi7V/Gbj8qBLBJ+7laMEe5tgnsMu4/wk62co2xvqAT4f+ua5aMd7mZ9jYj/NkMU8QGiNMgumXWybp+lXjY/EOTKX8zk0L+rEyjr88qBypYmfDxgPZzH+gjkKbQipxO59vwZcD4hLJN0lG4pX+zSbIkVXkCL5LA0jG4Mhrv2pEtlyg8pPUoc42wR/A44CcDs0oiUXE84xMVsK6EZ8JIKMkBUacJn3rcD8DhdLvxcRy0raj9eGXrZUcX2dLYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrAFoceKbzCmnB43qcb4eqFSbqhe6i9j124s71Gk6ME=;
 b=COpgTSI6bosNb5etA/5Z4lLVCOeUtyp3S7kjWWzv/E9nVOEss5TvUfI+d4lZf948Kdt3wvXWIv93rwB2GwMXfYKv+g9/FeDXYYJMzXpQ5lULsJsv6MNvjFzy21cs7t3ltUni5kS5pGpHl3qyq4Wf7nVWdadLGCCPNC766SHCxjIT2OEwCFM40Hp227RcbEp5IJHdnuiWjME7HrjHIkIAAjmROM6LLrKJ2rkfn+Ro2v8/N+bMiRsMuGPaYBDqtfNxf3V4IOMKclShnvVZWl5+6/gZzlGQ71fiXem6M6EQkem5G7ghQFFb6I5FX/lbQKBssCNGSiCZIeWTatP7OEGYlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrAFoceKbzCmnB43qcb4eqFSbqhe6i9j124s71Gk6ME=;
 b=YJFA0oA03u1t+gJRrSORrUXKIWq/L/sT7fJ4XBiMmJh37LWX61IHacUV9gurx3udzHcPjij5NnB2ElLASGMlzCcB86o1OfeDLb6EGK4+1g3NTP77pP/AWIs7ISPdYbL/lTgrafU6aaNb572/HoJIl8u7jHbsBY452CdGhp3AWqd3gqEsW+f/JBnm8dmJ1G6hbMjl3hWIX/tRGuZjFqF2ZOJAHukOUNO056+v1Udmmn2/gLzRkqfgYZxx1ZUINHU/aZ4jy5soqpKIi0eE4eQV1e8LRa71wpBdXKp4XTNjVmZcSvvdb5FuUFncGbimjM81oR//hBLdKbYFKbRb+GVH0A==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0127.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 17 Jul
 2024 00:05:17 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%5]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 00:05:17 +0000
Message-ID: <MA0P287MB28228BA5CC8B6F61A4C237E9FEA32@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 17 Jul 2024 08:05:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
To: Conor Dooley <conor@kernel.org>, Haylen Chu <heylenay@outlook.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <SEYPR01MB422158B2766DA03728AD90CBD7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221281561CCE511A5094D28D7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <MA0P287MB2822445DD34485B94D22E7FFFEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240716-cloning-canopy-a6799dc7f3b9@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240716-cloning-canopy-a6799dc7f3b9@spud>
X-TMN: [5z3UkJHxCw2SmGiwl/TIWg1R18hcSlqj]
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <5328125e-f851-49f1-b3ab-b72b5f4b106c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0127:EE_
X-MS-Office365-Filtering-Correlation-Id: c764be03-4ebf-419a-4e90-08dca5f423aa
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|19110799003|440099028|3412199025|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info: eQydvmU+8rmx1m/GQU/7gA5Te4zJYk0zkMpcK2jN/LKhd5mADz0p4GY/cuawv+Md3ZrorxnQEED4H0PQVyiIAfuq7POCgJp8U286SDPIohiKsoCsDrD1nZYQIs7I5t9HroLVpR9wY5uEPmYHcxpHtSAXHMDvWNim/nJ970WvEuEQOWY9/+A/ovGxM2IUD1SU2v5GnBj4202ZYDT2m8xRldMsrvB3FLA3atNsWEIETxv3ZBEteAxDTbTucHMzl/ZlCxm7+MHi7gMzois7re1amH47AxpNHRbJY/lOVMECxfJeheln5Lc/05E8BZWLbvQ93spUOk1snyZk+rGh7A5LQs7+QMEINLlIDcJAl/yMaMDdv5mK6Mj1z9mfB5ZiE+ixOzTktsq0JcDkuN9F7oELMW+erya4c/onr0bY1n6ZXZpO3DanvXW6xs6qesGSgmG2qpbjURmt5xTKnke7buQVY3ybljsmV+HOgCuw2DIyH67sQoHZCUapWxHBZ7wUnNkHogOFdP6GumPYIEIQOY0TKSfGOpIs+se3bU9mLXo3RoSYwGytqOZQJRabA9yWgkpARug9GKTMXa+u/l20Z2YxNbDlgmwHEGgY12ae3D0XXA4BvVDB4uo9QXNQ5Yqgf5Ze1m9zvaB2a5r6FkrN5s7BYLEEZ9BxCL7pE0H5HC6ZgxKVX15o18LTZbBLrHpNoLHQwtGlxgBEko8TCGOwcqhDOiN+oerMs/scmklM7Hzybbkq7QYgqbvOv9W7sCuuN8PxCRSLUy+iED29H9AdNpmpAg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWl4eUV1QXp1c2dUY3lla0JvcmlWU0NQVUxhVHc5L0UxWDFtTm4vT2c4SDdj?=
 =?utf-8?B?ZXpBakFFYXYzNlJoVnlKanpSN3pOVnJNRmJ2VnhMVFNWNVFqSGQ1Vm1kWVM1?=
 =?utf-8?B?aDZwZE82N00wMWt0cmYrNUZnSFhpbFJ6d3RJSlloT2lEUkEwTnR3OHZjM0sv?=
 =?utf-8?B?YnFBUVN1WGVQU05iVDhWV0tCVU16S3JSaE0vNzkwME0vZnRzYVJIeTRJQTVz?=
 =?utf-8?B?OVpGc0o4azlvMU1UQzB2eFI1ek9kNEhRT2pFL2tvNkNpMU41ZEpSaUYzSnBv?=
 =?utf-8?B?WVNVRnBKMi9CNlhVZk5pOFlQLzZHV2d3VStTWjZYU1hjL1JEbUFIdFo1VWRp?=
 =?utf-8?B?cDJkSVM1aTArSmI3NlgyZG1UU2RRMS9yOVR3c05kdDd3V1Z0VGJ0Wm9ITk01?=
 =?utf-8?B?OUhNb2VKLzVjcUtXa29rVXdVOVhhY2pqOUpDRnkzd3ZBSC8vc2tNUVhHK3U5?=
 =?utf-8?B?L2xKMHZmSWRoaG02VUNJN0tsWGR2TGt0RDZtb1BwNEhYTGs1QktncFA0R2N3?=
 =?utf-8?B?TGxYVTVaTG5uYzR4ZXFhL3pSd0NPUHdQRDVUVGpLZDhuNHRYcTBWKzlER0hw?=
 =?utf-8?B?a2VHelQ4c28xZ0hvTHBscEFkYk5UZUpWNjJQSVZOTVRPV3pScldWVW84bXM5?=
 =?utf-8?B?eEFwUHRZYi9kaEpDa0YwTVUvREJMZEJtTnBUR0pOZzlTQXFSUzRvL09zKzR4?=
 =?utf-8?B?bFRHdnVMTUI2STgvUHFhVUZIWGZJSFdVMjlqc2hralM0SHdUeGFTNDNrSnFR?=
 =?utf-8?B?TzBueXlwV0ZaVUJhV1ozcmZvL3krMXNLQnpJNXBsKzlTYlNIOG9nbXhIb3lB?=
 =?utf-8?B?dnJrWUNzMDg2Y2R6c2N2UjZQekdsdHJMc0hXckpkUjVsU3FTZjNEY2RCVk1a?=
 =?utf-8?B?QW9XL0tCMVRIOUFlYldTNlZXVmZNUnlXVWxQTW9CWkI3OUhrUi9yK3pqWW1q?=
 =?utf-8?B?TnpjN2lDeFlaQnV4a1ZPYUNYTU83RnlJWnhpTkU4UW4wQWpoQWN1N3dzSWd2?=
 =?utf-8?B?eUxaQTRSYjVqVFo5WDY1OFlVWS9tM2pOdVFyVndZZTNOVk9Nck9yTEJCeXE1?=
 =?utf-8?B?WXhIUjdJMUZmVXQrK20vcHpVS0loMzVyaEM3MHk2aVpiWnl1bkROOEljVGho?=
 =?utf-8?B?bWFMMGZsMExUdkdhZDhEWWZxSk5NakZXNXFCY2N4eHFqWDNMN28zVXI1Tm1y?=
 =?utf-8?B?cW5LYituVUk3bmx3eWd2Tmw1MjhlUkUwM3NTMHpST1lmRjMwcjdsUWQxV3Jw?=
 =?utf-8?B?Yms0b3NVUWFmRUg0cnhRRnp0QjVuTkM0VlpVYVhkM2RBQlN2MUF2dldBUkVl?=
 =?utf-8?B?c1dSYTQ0MWVFQUg5V00xbW5DZG9RcU1OWEgwdWxYU1MwY2t5Uk1OR1pKLzZ0?=
 =?utf-8?B?MXRGZHJReDBON1M3ZmtPZXkvZE11Qk5oR0pjYXZNUVhla0x0K3hJZWovZ0Y3?=
 =?utf-8?B?YnZJMFA0UjYwYmVPQWlHRm9ITE9IKzhnVnF5N09mWjM0N28wU3hHRXFrUVlK?=
 =?utf-8?B?RE9sMW9UMmVLeHlTUkROcVlFK1pKUVZHZ3grOFYxVnA2ZWVoR29wdDluREd3?=
 =?utf-8?B?NHAzcVlwRyt1R0cwVDl4Y2NFMHdQdU81VnArdUQvNHk0aHY5ZEMwTXV6S2VM?=
 =?utf-8?B?K2F0djB3VDduSk9LUDdid2lZdnUyMlRoR3IvUlNUaEs3NWpNK1E0QVVSSWov?=
 =?utf-8?Q?EOb70G0rTm9vkeGFkhTT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c764be03-4ebf-419a-4e90-08dca5f423aa
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 00:05:17.0857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_170545_673813_7908A02E 
X-CRM114-Status: GOOD (  10.72  )
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


On 2024/7/16 23:48, Conor Dooley wrote:
> On Tue, Jul 16, 2024 at 08:43:19PM +0800, Chen Wang wrote:
>> On 2024/7/16 17:42, Haylen Chu wrote:
>>> Add devicetree binding documentation for thermal sensors integrated in
>>> Sophgo CV180X SoCs.
>>>
>>> Signed-off-by: Haylen Chu <heylenay@outlook.com>
>>> ---
>>>    .../thermal/sophgo,cv1800-thermal.yaml        | 55 +++++++++++++++++++
>> I see sometimes you call it cv1800, and in patch 3, the file name is
>> cv180x_thermal.c, and for dts changes, you changed cv18xx.dtsi. Please unify
>> it.
>>
>> I think sg200x is new name for cv181x serias, so if you want to cover
>> cv180x/sg200x, is cv18xx better?
>>
>>>    1 file changed, 55 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
>>> new file mode 100644
>>> index 000000000000..58bd4432cd10
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
>>> @@ -0,0 +1,55 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Sophgo CV1800 on-SoC Thermal Sensor
>>> +
>>> +maintainers:
>>> +  - Haylen Chu <heylenay@outlook.com>
>>> +
>>> +description: Sophgo CV1800 on-SoC thermal sensor
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - sophgo,cv1800-thermal
>> cv18xx-thermal ?
> Please, no wildcards in compatibles :/

Sorry for my confusion.

Haylen, so you want a compatible that matches an actual SoC and use it 
everywhere?

Or we can add ones for each SoC and have a fallback to cv1800.


[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
