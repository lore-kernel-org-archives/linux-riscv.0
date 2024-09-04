Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F56CD37BB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 01:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcPFIMdhLo/8dcXsfEqOuu8oR/b9/WzqKXhTYLdsR5Q=; b=ZHmjJgrzjCwCBbLR9lD5Mydfta
	cyWuZHff//jqZXeI5WjV83knh0vt/2kYcTjvnrPEv0t59olIvAEoEwgnr/ilXQX4A6PCT1ZuFDt5E
	I7B66Zdvou2X4vSf+wE3euHqObbpeq2RFtIKYPV+n4PAQnCrZGVrbqe11EXCojNCxZmpI7qhCYBH3
	ul29Z0uWObGcMD2cjh76+aeMS9F2DWW9z37jFYcRku5os3HHY5hQYXp3BA3q9GbpWku9AwNCTfEsv
	nFdYcv/gjM/eKTKt3yuc+HuYNIcuqD+VsjwLFbmN2RJnJBW4XeSxF6ZbO4mz5gjvFSG/lCeJ4egit
	8WmG0zGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sleeg-00000002STp-0W2i;
	Wed, 04 Sep 2024 01:17:54 +0000
Received: from [2a01:111:f403:281b::815] (helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sleec-00000002STP-3aky
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 01:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOyWG9oevoPHoMn9icQtIoo9HpfurvkN0uHzgHFg8cBD8gFVugU4WhGWvl9rBU6aYElfGm9mWtEAUY0USiFkA0Y8Rtf0hPIskungA7R5R1Am0j8dZsmE0UpNz6ERnqBMme5KgSIGYgQ6M7UVKSpnsqPV6FwJQpQ1WRU5pjY9cNHAagMC0IRo6WP+qQQ9UmUGH6m76BxmUrH3o0yeGIBbgELQq1lKaPGSdv8HQjtdBkt92wfRLjXW+w3FlN7901Vr7WbtJNvPn5BXywFJuweZrWk+HWMQEPcYbessdAUfmfJWzysgJFtYq/ewLx+oJH7c7m+SjR3kbg5kPm5id6OGjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulyFoPlsz+kwca/IhFxy8rvWwS2uPU8PbNeVxDZIKfg=;
 b=L2/oMTJYQH6CitgsO3JPprD9yuyRk+TDd9A8kDMI7Ngdd9/jHCQAvcfynNPNMCbVIRaenDs3FOup8G8+Bj0dB/3Vp92y8gPA//4/o8C9OTf6QTa0kmI+W1S/wz+pLWDnBOcPmET4dwntWKUyoUdmoD4fvnDW+D/gmZOCqb7ECtFD21yB4B9MjClcLQCP5tTa4HOqmiknx8b34jL2Of2IFuiEXLoE0qyZEBeSVEFxMLEMlDa2VcrAUGlSO8WozAdysDh3urQkanT0PBABmkxNx1JjEqJ6fqIwEHqLDRFG3aQ/jL35c9hYqHNcjo6EL+CKTUfQutqviFjThQFw5bLJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulyFoPlsz+kwca/IhFxy8rvWwS2uPU8PbNeVxDZIKfg=;
 b=twDkCD5DX8sYopXxpEdICI+X0NeTrMyE6LDr3FZSUSWiw+VYc1LApQPM1Jngyo6H9yQBXijNcnViF5BSex8d9PkcxnSAu7qQAxy90HMKRQHSq6eEkf5MJ0vXNaWQV4+o/YUERO5dOGLEYLENlnJNG3J95OlDzDzVl49unFwzzEX4Vkqr3Mqn1jXy1jMKJ05CoAKusbeTxuOfdX1ll8GL2Sf3cpVqKuRnVPEsAh3/s28wyEkTSZAiCrAl5NrmaTtyo+hxxodoD7BK+SMNmzdIjvHu7EZdWC5QgvsJ7xg3go8+ARZnrsQdrSTcKr69ml572oty2VIv3JWabL/hU9tS0Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0946.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:146::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 4 Sep
 2024 01:02:40 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 01:02:40 +0000
Message-ID: <MA0P287MB282248B29F8F2028B29BB02DFE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Sep 2024 09:02:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] riscv: dts: sophgo: Add LicheeRV Nano board device
 tree
To: Inochi Amaoto <inochiama@outlook.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Chao Wei <chao.wei@sophgo.com>,
 Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
 <20240711-sg2002-v4-4-d97ec2367095@bootlin.com>
 <IA1PR20MB4953612773890B94FFD0C9EABB962@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822AC58BC43FDE03802E773FE972@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <1b202582-0487-483c-ba80-47125551eb5d@bootlin.com>
 <IA1PR20MB4953AB5F2E922EA4E1E74184BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953AB5F2E922EA4E1E74184BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [jcj90nHIJOPqYOdadg0DWD4T/BDjVvKH]
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <c99de627-5bc9-47d8-aa46-170d7d4b665e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0946:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6ea8e0-80f6-43e2-85c5-08dccc7d466f
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|461199028|8060799006|15080799006|6090799003|3412199025|440099028|4302099013|1602099012;
X-Microsoft-Antispam-Message-Info: di9R+SZqeN1w0tjt9TPQATchIYGpLQmZckjRgh/EP4248e0QYF8XoTB/fG5lHCcWRRBNKJ6ph8x230Nq9qJmg6Evd+gn8yVhtrw4KY0ZQuBzKVbi6GMr2OIP3FgKK0kTSOBxse7rohid2SDE8QFC2MM8/yaZ5NgEzihPR7Wl4smJGXEXw24Etex4KDSH3R0ajuh20MYKTXQBcVc/b6qHKs0l0gj0iWmRQQo6l53Iam1hNI2WjQEDN0q5OkTtQBxzqtQhUnXkmxQ2wK5xCsZksMoN/rBp+7EZ+WkoZGJRkr2j6EbNvfiU2b1RXZgoMA8HF5Igiw406pxw+AM0JsDDPzp759cy5Ap9Ip6McSLmhkxiN1hyZNUAElBocH2y/DzmkoiiEgsbR2qhFuoDuA7iflf5y2u27RlIs8AHnmqTUrzuQ45ok85dotNHQ6+2HRrN/4aAt/NhCbYwZUbwYMCUAkuAy14V23bR3JeFwK+GaTGKrYxMLzEMmVwmAyuH0WRrh81UuPnYbrqimOTeeYFPQY/3UWP/6MdTKIJwvl/sdUN/+ID9Sfw3PPOy8uSxbClfTLM7eNMT9NfVCDbg1NSJfpimT73NhNgVjKJZ7WNCY3VP0ChsQUM11GkjKSDkIC+WUejgsIHcy2kPJCfCdTvYTsyi2RyC2wpAkfwvgIKJj/ww7pyNF/UYiUqYzdqFQtMLa+mUJoEzuSETudou7CFEEIIeqXaapDmg1xh7NtnKjb1puU8k930dnYPwqlKjOizYSYmsFO3fZw4mH5RwKSwCFSVl8H7daR/xujUEdbn1GFOt5h8yv2z30oqobeIEjwiVkJIp9r8KVU4T7bGswUUl8UGt16ez9lvooDCDHpbh0eeDLMviJRMfcmZeeTc0gJbnwnHi0zw9WMi0BmYJ+LhV0w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUFNZVdrWU44MjZTekt2Nm1ZSUFpZjI3YlRpNnAzemJiREZsWXFSL0lxcHVL?=
 =?utf-8?B?WDE4Zll0ZWdHdzArUnZ3SlR0U0d2ZVNDNHZGQ0hVaDFGWXZTem5oQmNCUUJ6?=
 =?utf-8?B?REU2YXVIMnZKTGZ4YW4zVFJYMzhxbEJVWWFYd2RDTll4UFlRQWlXQThqZ2xv?=
 =?utf-8?B?WWFvUy9oVGl2RnRnT1hDUkI5VmpQTGdCYlRkQjc3Y0FoZUtOVVlicnQxK0xG?=
 =?utf-8?B?R1RRQmVCWjlJdkU3MU9ObWRtSFJLQnRnMlBBZWp0TzFZbmZ4WEd0ZjcxaCs5?=
 =?utf-8?B?dnA3L1hFUWhKM2hQNjd3c3ppbjlXVno5emRzRUtpbGxCcGM4SExvaHNOWFdN?=
 =?utf-8?B?eWoxMTE2YTZham5KVlNWOTFxMUVScDJuVGUrUkJhbkJQY3ZGd0g5am9yZXNv?=
 =?utf-8?B?UzBWYXhNSEV4ZGxVeDRTRHdzZk9LOVVleHNjS01rVVFBY3g4VnpHWjM4NkdW?=
 =?utf-8?B?TGQ5UzNpbkh3SElTWkgwaVhmZEozUVByM05DTmJYaWMvdU9KczB2dmwvalUv?=
 =?utf-8?B?dFBmeGJ4SEhkN0dtZDNNemgyaHc1TGF6aUVRZnZWNWtNc05oRUUyY2s3WGtE?=
 =?utf-8?B?bStMRjZ6VnBkWHVWMWl6Ui9lTy9HNkpwTkluMytXaFExU0hOUVlSZkN2S2Nl?=
 =?utf-8?B?cW1LQ1VleGdFSGU0SzAzV2E5K2xyQm40eXFqTTlUcU1DQzFEU3NPdVdaQ0wz?=
 =?utf-8?B?Wm1tK1F4MFNFbUpJckd3MG5VU3JXVlUzcVcxMXRPYWNoQ2tuQVBXRkdVckNQ?=
 =?utf-8?B?RytuQnBQdVM5bUY2cENsamNJcjFXN1ZvRTRFQU5TUDhHalduVGJNNWcxVm5B?=
 =?utf-8?B?cVd6Z0l2WlcrLzNYTHdKZ1d4TDJIYXV2ckM3WmNIVUFQK0FNblFwM0xMT25t?=
 =?utf-8?B?TGg5MER5ZmJVN2gyNENzUkNPOVp4OWhFR3pBUGdsZDdMTmxnSW9sVTBDRUpt?=
 =?utf-8?B?SmkyT0crcXVrRktVczZtWkhTNWdBdTlObEJlUC96NXJPSU5aUWFhK3JKdm5G?=
 =?utf-8?B?MVJuSThxM2lZSk04UU9TcVlDenlpR3BQSW1JbHJhaWdxTUpTWEdQTCtPR2Nn?=
 =?utf-8?B?TnE4cnFucUE4WGtzbUQ1YVlRZUdITTAvazhBZlBJOVFDUS8ybnVERHlKWmJQ?=
 =?utf-8?B?bUJjQTVOKzZiRmdDaW1iOXVnYWJlQ3NXRVR2ZlhaRWd2OFBnZDNGcTgzZXRs?=
 =?utf-8?B?Mk5nVkFXL1dETC9wREZoTWNUcllGZU5YUzJlYXdzdmkxWEFVU2xIbXRlWTlE?=
 =?utf-8?B?UlUyTDZJTkxDWVBGdER3NWU0bHNIeithS3loaWZUTU80NDdMUUNpelpTL0pO?=
 =?utf-8?B?QWFxRUtvWEZ6ZDJVWE5JMlN4TWZxYUtKQ05iR0dTNW92dnNTL1ZhTkJrZVFJ?=
 =?utf-8?B?aVFIbDV0ODk3Njl0YVY0ZmhmRWF6ZEd6UW1PV0xoYzNuSWNVM0NYVVBSdHdw?=
 =?utf-8?B?MDByQWx2WEFPRjVjN1FsaGJhR1dWV2FaeTB5ZzFTd2VQSlF3Rlo4Z093QXJ3?=
 =?utf-8?B?WWZ1MTJRREVCcFQ3Q1g1TFBENWo0ZzNvaUdGTjdQT09VU0p0SlR6cko4MjZH?=
 =?utf-8?B?ZEV2cWs1czBWdW4wM0kxOWtkK2RhVVhNQmNJRFZvUURaODdnSkFKZm12blV0?=
 =?utf-8?B?dlNFdjZxL1NCM0RBSGJHZlE4M21iSk03OXVZMyt4V2hJR3U5cDFPUC9uYUJi?=
 =?utf-8?Q?QSqVV4KjQs7HZxxhI/0I?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6ea8e0-80f6-43e2-85c5-08dccc7d466f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 01:02:40.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_181750_920342_716ABE18 
X-CRM114-Status: GOOD (  14.47  )
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


On 2024/8/30 19:20, Inochi Amaoto wrote:
> On Fri, Aug 30, 2024 at 10:06:45AM GMT, Thomas Bonnefille wrote:
[......]
>>>> Have you test you patch with a real board? Especially
>>>> for device "uart1" and "i2c0", I suspect your
>>>> configuartion does not work by default.
>>> Hi, Thomas Bonnefille,
>>>
>>> Can you please double check and feedback, I want to confirm this before
>>> acking this change.
>>>
>>> As you know, rc6 will come next week and I'm planning a pr next week.
>>>
>>> Regards,
>>>
>>> Chen
>>>
>> Hello Chen and Inochi,
>>
>> I'm really sorry, indeed, those nodes certainly don't work, it was a mistake
>> on my side introduced between v1 and v2.
>> However, I can ensure that "uart0" and "sdhci0" are working fine.
>> May I suggest to remove those two nodes? I can send a new iteration if it's
>> easier for you to handle?
> As you need a new version, please add pinctrl node and necessary pin
> configuration. And I will take the first two binding patch. So there
> is no need to add them anymore.
>
> The pinctrl patch (note it also needs a dependency):
> https://lore.kernel.org/all/IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com/
>
> Regard,
> Inochi

FYI, 
https://lore.kernel.org/linux-riscv/MA0P287MB28228F4FC59B057DF57D9A11FE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM/, 
I have raised a PR and included the two bindings related patches.

Thomas Bonnefille, for other DTS part, please go ahead and post new 
version with your changes, I will raise PR after your update.

Regards,

Chen



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
