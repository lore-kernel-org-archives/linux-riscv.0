Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE069CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 06:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DcUI8t8Vx6ct2+a50J92/NTiqvZXyO2fmUzzUNpIkWE=; b=y+lzHfWc19unxvgtc0T7TkVpS3
	rgmGQM/BFnzKBbXwMCOznt4EyNt7e1E/NNHrCR1N4MMMF65O3ebWViURIvLDG4iWElJTUCPXoYJ4k
	BaWssAOgc8Zi90FT64/pfz3glRoHJzSEl6wOXgBrXbf6QYxwTvs0YxNBn6fudhxNmglUu6brw1st3
	G85f16MoA5hCDiSOLz0PPDGV+ghoPGsqGC3gWRbFQqyUQVUHeRvUrZCPLRFyV++gbTBNKnkpgG1J3
	T2sVFxbSAI8RPTiNlRJXY7Lzl6t6JiuNt6kC/luXW48zf079SLHmsSFuri955gsg+gOEvHT9Y0sVh
	sf6/E58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUevT-0000000EN5K-045v;
	Wed, 03 Jun 2026 06:18:03 +0000
Received: from mail-centralindiaazolkn19010001.outbound.protection.outlook.com ([52.103.68.1] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUevP-0000000EN4P-3a3m
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 06:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqd/8xZgfTdMMijzAR7miocvoG/2LRTRqtTjkTYKIhSqgw4RGD+GDI2TBjUPSvpvtjPfaips+HxTULnNIexIuvSuOHKAOYMDmYvdrCA66zzWJxdMVeP/QlP0HOtkmEm18Ndj9LKIEwL325v2NsCgS9OCc2JPPUSsYnkqYJkvEqwL1FCQzbio7TdjVW0JMKBvxpIqesr6hPPNJxe1DMnHX+BDSNTVo7ueMb8VOe93sePEZSZl2BRNUF/GlT7Jp9fMB77kTgTWuhJr/khLnyxKiJK5IUjd7Ww7es3EtunwGTSTx9I6qw7yJft1f9klbNs6l3eux24HV6vcTV5GcuVJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG2FsrK1mTXw3lxfDoaOeiWWa+iK541Z80lf93+rIF4=;
 b=JtiTnMFwsC23hu3avry5Ps6D7T8dZtfiaSuJ02NKTpABhQHQc995OtB6xMcthDvNKsNiU2ZcxT9FwrxePOn30FDmSbs4fRxUwdNzYYvcJxg+swwoYavfNElgn51vS/38kboku903GPPSb7+pb31PVThfPuR3ydc+qu+KtnUEwdslq/tWoDdMrraagnk/XXSUczoayoPe1lvM9zOPpfelrILruwJxEF0lpZwxliu6klSKEBot/K2FmzajvTMrhm0YmzRDqoZr3ojOhW21swwql0bWaXHdji1+fViU4uCrqWxM9a5Fm1m7xzLG82ZNECpTCCn1RhDgFL4k0S75XdLj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG2FsrK1mTXw3lxfDoaOeiWWa+iK541Z80lf93+rIF4=;
 b=hSXiuoEE4ncIJ1h4L+ttPY1vjXUW56M8il2/G76Pls9NlZz5CwilCh6I6yipBmAhcxSfrPyru9QwuYgpcp40kZAX3cbV16xiM6lliu536ijv6+OOqhrFEBkrAeiRVUyEv9BB776GCyojmAyCy3vRcrwXXw0P95uTMwpPRDct09AwWBxrFUUv336g0qZ2d+9n7tJbfNVtfu0+Z0WCyg8O6AyZPl/+lvrIqy4saDfIV964HT9Jculiudu+xh4JqPVItZTrENw3keFo7aRkQpV7oOMQBGhPfKQuzmHk3dF53SRpHPMQgKRRBdOyRee2DHtZlTdXszegqCysd7x5nPrD+A==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by PN3PR01MB9872.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:171::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:17:48 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:17:48 +0000
Message-ID: <MA5PR01MB1250024541E71412DDA04B4AAFE132@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 3 Jun 2026 14:17:42 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>, Han Gao <gaohan@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Chen Wang <chen.wang@linux.dev>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, Joshua Milas <josh.milas@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v7.2
X-ClientProxiedBy: TP0P295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::15) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID: <f753d849-646a-46a4-81ac-9bec1d0875ed@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|PN3PR01MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3117fb-aa40-48b3-d171-08dec137d52a
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6cUe9t9Fs5HiWpFB4Son1rThDsT5s0bDrrcDFrizuIyvdxXV71tVgUc7w3iiYwPePtsxyHfZvnuusx6b+cqj12USBjSkEPPHemeO1QpbqIwk7vl2YFfBXTwx7omQlCRUs/LWugcf4TIWrhsob+nTze3WqWuel7CMMddQ6H7/uqMD6Mm8HUPHnjUUMST7bnm4/0i759J44cyXKWYq99zNoIT2U1I3E20QPgsKupWfmGJb75PtV6Cp+Jm5hmOM9PViEhL0PqTfVSPlkVcgoukqMftR+KSnR1b7jklar0g+mUp3+zObDcc600vin1deNDZY8j2Vq7HOP1UWIunz1z7rZbpopoAhs2l9yQuvWjq2KFW07OlhIDglQKKmBC4WlRCLnm8kG4OzAIp1Dm72KEZ4Ju4KZhZY/sDqpJg+gb5C0qq4s8JwedUQiKKlCHkGqug4oa8HEu6jfJdnsOcwzdJ3lB4EJaZmS9muyZ3VSx0SU6BURpNt01A6gmcglRjzTWGzKlUwc3bIoZ/A0lZOSI0cYsZznowQOPIaPrqK69qP3bxTEgcTm1TbhuVwmxmikcu+RKB/nVQTmWSP8K1tiw1i8/EJv5FrOp6pxO/1JPhFz+cv6aE2Ws+3C/xWVXWnKy2/czHFomEj9q/CJvOWAHdeUdvmrFMCEF4mspQ9lw9By60sbUs8hq2oxizdS5CLMe+7kK8eJqMkw4JFXNxRjy+Ng09NxJFpHQqA8FLJulPc38Cz+MJ6OCEf7q5Tt96tu7tAS8=
X-Microsoft-Antispam: BCL:0;ARA:14566002|24021099003|5062599005|51005399006|6090799003|24121999003|25031999004|22091999003|8060799015|19110799012|23021999003|41001999006|5072599009|15080799012|40105399003|10035399007|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzFiZ3Jkanp1RmdOVXpKM1paR3M2VlpTLzVvMWdvd0dnaEpIQjNuRkVwL3px?=
 =?utf-8?B?Z0d2emZIU3QvMjJjUUVCWGFiY0cwS3JsczVsYUVXRUhSd3Y2cHhNdldyUmtZ?=
 =?utf-8?B?dHJEYzRsR1NDSGt6OHJSTVJXaVZHdTNTMGZNaHFpYVMxWEY5U0diVlplOEJo?=
 =?utf-8?B?ckRoUkZLVThzelpkOE5aWm4rTDF3T3RrQkptbzlXU0E0TkpxM3dOZ3ZLTXdv?=
 =?utf-8?B?dC91WElMSjJmTE9rMnhOdmptcFJQN1NjZ1pSdzZnS1p3WVcvbUhvWnlzZ3BG?=
 =?utf-8?B?TnZzUForL0V4RllodVlGa3F1Q2t5RlJwUUJiTGJZWlZidStldWQxZ1lCOGV5?=
 =?utf-8?B?aFBONEo4Q21SWVUyS092VjVTMklEM01BSEsxWGYxV2JrUHNIOERCT0VaRnEw?=
 =?utf-8?B?YVFHSGxMR1lRcWRhbWNxREx6Nk82V0dKWDk5U01iTFpLSklTYUtIMkdWbjIv?=
 =?utf-8?B?aDM0Sld3MXAyTUlBNFYvdFQ0SDBOM2VCamlocXFua0IrU2Via2dyNU5pWGpY?=
 =?utf-8?B?THFWZnhqZnIxVUlHQTVZM2VtTkRObmI3RUw1TU5Mcll1K1BHaEUrU3pZZlgv?=
 =?utf-8?B?YjV1azBtVDVoZExGSlZoRDYwTnpWVTJoVkdqRHJSbHpaUFY0cG1MZ29lUEVH?=
 =?utf-8?B?SkZTS0xlZVdoUXB0UThBMXpWQm51S3BIcTFST1RFclVUSlpSekZ3bXFXZGx1?=
 =?utf-8?B?aTloMHAvN08wL3R2T1lvQkxBQmNXODdnYkdVa0VHQ3gwTko3OEhqVmlBREdM?=
 =?utf-8?B?bmhFN3lHSzFBdGFHQkFGQ3lmS0Y4OUdKNzlOZ2ZTVmtlNDV5bllFR3kzcUtx?=
 =?utf-8?B?RDlJbURCM3VhQW9qVUhUU3JXazBlTGdKYkVkTkZ4L1dHTUZMS2tzUEp6Z3U5?=
 =?utf-8?B?RnFBWHJSUEpPaXNEZHZrK01OZ1dnWCt3czA5ZE5PdEVCWjFVVXJKZzQ0Qm5n?=
 =?utf-8?B?S1AxQ05XbXVOR3h2OC9HUUxLNnJPVzlLY0JuL290UTU1eCtCbGJCRThTaFhm?=
 =?utf-8?B?SlJnUlV4ZFg3cDE3djJOOUU5c1pZb3F6ZXFsMDZiT01NSXYyM2JnOGlOblJo?=
 =?utf-8?B?WmcrTTdNb3k1T2RDQ203ckljL0tkNjRBdkRRL203a3gzcWZidFN2anJpVGhL?=
 =?utf-8?B?bzd0Z1ZJSUF1ejlBWURDa0M4aEJiUXFsaXJYVjB4eFErMllka2s3dEF6OEor?=
 =?utf-8?B?a1NUc29RVnl2c1VkemxpRFRJT09WSzMwWEYrZ1FwZGo3NStiZGQ5YlV3eHJx?=
 =?utf-8?B?NURSMXRLcWtBb0pQNG9VWVh5OHUrWFQxVWR6czdHbUdkbnpFZllKTFE2eUhK?=
 =?utf-8?B?VXY1OEtXYThlQVc1K3YzU2pHVnkrWXdWcjZEbllmaVBKMFp1YXQxWHBCNG41?=
 =?utf-8?B?WnpFc1BQdW8xSGZpR0JMM0FLYk5ndWZyZU9KdkpMMy94NlNQbkJrZWVXL3VK?=
 =?utf-8?B?Z2kxVmsxYTFHMTJOM0JONVhkcUhheUNLaEswYVVFSEx2OG0yM3U2M3RyaXAw?=
 =?utf-8?B?Ry82d3htWnJFSUQyT0NvaFc2WUxBeEhLVXJ0Z043M2xmN0l1cHNBOGN0ZnAy?=
 =?utf-8?Q?TpqD8OiWiqk9Op05VyqUUl8Gj7XtKnNKfrsEBwjkgFob5i?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2IyR05teE5mNHduOGNDMFY4aXJkd1VtREl1Tno1Q3h0am55R3cyaGRBYm1B?=
 =?utf-8?B?WmVlbkFsazlLWExnZG01dHUwRmxwa3dLNDJtUXVHQzJKcEY3QzUrQnhHcm9U?=
 =?utf-8?B?VTgwdUZxb2VlblNqVHJGKzdteWp2NG5paHNwMm1GT2tXZEFaTzY0NXBmVHMy?=
 =?utf-8?B?cXpoZ1dKNnpLZ1hyYjU0a2lwTUtGWXhGVW9nTHUwOGt2ekxMNHhHS1V3Znhk?=
 =?utf-8?B?N2ZHL0V1Wk0xWVM5T0ZoMWVHTlFEdGlzbUN0N1RGWGhlK1BBSEJ1WTJBVVdW?=
 =?utf-8?B?OXB5d2VJc0l5c2FjQmg5MjM1cXBTWjNNd0prUnlLaElpa1ZIOXNOTWo2Njdr?=
 =?utf-8?B?R0RES0Q1Vm1tdnNtVTRHdE03THh4djdWU1JvbzhEMDc2RStZbWJ4cjNNcGlT?=
 =?utf-8?B?cW10bjNwMDZnWlBWVTJCZ2FhbFJlM0ppWjUzUXd3V20reVo0a0tDNnZMdENR?=
 =?utf-8?B?dVJneXZUWXczTVkwd3BCK0pWZm5zdVVYUEtwOFJEMkZNMFFzdDByOXNTakNB?=
 =?utf-8?B?TlhOTzBuZFU2eElhK3R2dlpnbUp0c1dGQU5zcWlVWGpWckQxRmNiU3BaSFZy?=
 =?utf-8?B?S2wyd0RaNTljL3c3SkF6MlpwRlE5NGdQRjBGK2ptQW5yU3pVVnQ4dWx5UE1B?=
 =?utf-8?B?VllzY0tDMFVNZmN5cW9TR2Y2K1B4b3BtdVZUYU1tSE43cFBmOHN2UlBSWU5r?=
 =?utf-8?B?RThRY1lYOGgyQlZQckk1bGFPTmkxTC9JT0VSSUdJUVcxbG9YVmpOY3FzUEZp?=
 =?utf-8?B?YTBiaTlPRnhSM1hDNnkyWXZHL3BOeVoyaHFKeFB2UG90NHBCanFoSEw1ZGFR?=
 =?utf-8?B?NVd6QSs4VDZNelZiSEcxV3pzVm1tL2JDQWpGNTg3ZTFWT0UzRDBNSkdySWVL?=
 =?utf-8?B?cElSOVJobHdQeVFhdWhHdTFKZTllNDBVeWcwaDZDUGxtbWtJRHFlYm5SOGJH?=
 =?utf-8?B?NmxESXpPTEZxcUFMM3M4dEpzdFhNWGlONVhJTXJhUEZkRUFQVS9vNHJtQ3BT?=
 =?utf-8?B?blQ1R01pZWJMTkViallNdHNySndGQ01Td0R6eHNWOEVrQnNyQS9aeDNVN1Nu?=
 =?utf-8?B?T0dLTDJ1Mlpudm9la2FVanlqZXp1QmRkV3lwMHpWUkNkQXNpdVRjQkZ5K2tK?=
 =?utf-8?B?Q2IrOVNjaXFZaGJuOW4rQWQwd3g3bTR5dVVmbUFTUm1VZFd1T0FBemJGTTBu?=
 =?utf-8?B?Y3l1Vm9xV1h5L0tNNDN0VFkvZnd6TTlKa3Q5aVNrMUk5K0dpcDFFNm41RjBB?=
 =?utf-8?B?anliZEhXR2QxR0JudE5LajFxc0VvZWpzcXpvNldBbWhJRTc5U2tnYkVRNGZF?=
 =?utf-8?B?NURPNW83Qk5FeW8zRXNCMWhYU1c0cnBLWlEwVHAyb1BpWG9RWUlZKzQxMUx0?=
 =?utf-8?B?bDQxNGRuTFNmdXI3dGMyQ3VaM0cyVTNYUU9oZkY4bnBxL2JwVmR2ZnlIQ2Np?=
 =?utf-8?B?SGQ5OWVZSnpKTGcxYTE4L0JoL1pIZHBIZkQrTWdJN3VwblUzM29JOENMdXlG?=
 =?utf-8?B?Q3ZpanhHQURDV2pYK3pGbUxxNVAwVVBwemhkcUtuRzRZQm9leEN1RmdHUzFq?=
 =?utf-8?B?UExyV3ZaSGlpUGh0WG11WkR3bVhOenp1K0c5dFdkZ2FlR3NmVkwrWmk4SW9x?=
 =?utf-8?B?Q0xWTE54WWxESm1xbVFjYkZQc0V0TFRVWFE3QlhWMkxjR01vc1c5QXUrS3pn?=
 =?utf-8?B?ckdzSEhKdVo0R0ZUamEzNFIxSWxONUJTYVM4NzFYdTRYaVJsWUd5ektrUHln?=
 =?utf-8?B?elNTeWNaTVpqL2VnVGlsSWRVTmFLTml4dWRvSndZdS9hcDkyQXl1MVNPTjVV?=
 =?utf-8?B?TU84TDRwcjFoSHN2azFTWEFFTlFwdnFQL1VYY25jeXBjSGRFQnZ4QXQ5d0di?=
 =?utf-8?B?V1RYNjJEMzJXT0FDVFdaMHphY0xOZWJhQTdaWGpINlpESmxiU0lSOHVFcGIy?=
 =?utf-8?Q?E73pZ+xXlE1xlmpVLpwJn7y9KdCyOiVJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3117fb-aa40-48b3-d171-08dec137d52a
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:17:48.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB9872
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_231759_905248_C9A9F48E 
X-CRM114-Status: UNSURE (   6.84  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCB0aGlzIGR0IGNoYW5nZXMgZm9yIFJJU0MtVi9Tb3BoZ28u
CgpCVFc6IE5leHQgUFIsIEkgd2lsbCBzdGFydCB1c2luZyBteSBuZXcgd29yayBlbWFpbCBhZGRy
ZXNzOiAKY2hlbi53YW5nQGxpbnV4LmRldi4KClRoYW5rcywKCkNoZW4KClRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgMjU0ZjQ5NjM0ZWUxNmE3MzExNzRkMmFlMzRiYzUwYmQ1ZjQ1
ZTczMToKCiDCoCBMaW51eCA3LjEtcmMxICgyMDI2LTA0LTI2IDE0OjE5OjAwIC0wNzAwKQoKYXJl
IGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIu
Y29tL3NvcGhnby9saW51eC5naXQgdGFncy9yaXNjdi1zb3BoZ28tZHQtZm9yLXY3LjIKCmZvciB5
b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5MDNhOTM2NGU0MDU2M2ZhZjQ3MzBkYzYzYWQ3NDQ2
MjQ2ZjQ5NGZmOgoKIMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogcmVkdWNlIFNHMjA0MiBNU0kgY291
bnQgdG8gMTYgKDIwMjYtMDYtMDMgCjEwOjA5OjM4ICswODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSSVNDLVYgRGV2
aWNldHJlZXMgZm9yIHY3LjIKClNvcGhnbzoKCkZvciBDVjE4eHggc2VyaWFsczoKLSBBZGQgYmlu
ZGluZ3MgZm9yIE1pbGstViAiRHVvIFMiIGJvYXJkLgoKRm9yIFNHMjA0MjoKLSBUaGUgQ1BVIHVu
aXQgYWRkcmVzcyBpbmNvcnJlY3RseSB1c2VkIGRlY2ltYWwgbnVtYmVycywKIMKgIGVzcGVjaWFs
bHkgZm9yIHRob3NlIG5vZGVzIHdoaWNoIHZhbHVlID49IDEwLiBOb3cKIMKgIGNvcnJlY3RlZCB0
byB1c2UgaGV4YWRlY2ltYWwuCi0gVGhlIE1TSSBjb250cm9sbGVyIGFjdHVhbGx5IG9ubHkgc3Vw
cG9ydHMgMTYgaW50ZXJydXB0czsKIMKgIGNvcnJlY3RlZCB0byBtYXRjaCB0aGUgYWN0dWFsIHNp
dHVhdGlvbi4KLSBQQ0llIFJDcyBhcmUgY2FjaGUtY29oZXJlbnQgd2l0aCB0aGUgQ1BVLiBNYXJr
ZWQgaXQgb3V0CiDCoCBmb3IgUkMgbm9kZXMuCgpGb3IgU0cyMDQ0OgotIFRoZSBzYW1lIGFzIFNH
MjA0MiwgdXNlIGhleCBmb3IgQ1BVIHVuaXQgYWRkcmVzcy4KCkluIGFkZGl0aW9uYWwsIHVwZGF0
ZSBDaGVuIFdhbmcncyBlbWFpbCBhZGRyZXNzIGZvciBTb3BnaG8KU29DIG1haW50YWluZXIuCgpT
aWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KQ2hlbiBXYW5nICgxKToKIMKgIMKgIMKgIE1BSU5UQUlORVJTOiB1cGRhdGUgQ2hlbiBXYW5n
J3MgZW1haWwgYWRkcmVzcwoKSGFuIEdhbyAoMSk6CiDCoCDCoCDCoCByaXNjdjogZHRzOiBzb3Bo
Z286IEFkZCBkbWEtY29oZXJlbnQgdG8gU0cyMDQyIFBDSWUgY29udHJvbGxlcnMKCkljZW5vd3kg
WmhlbmcgKDEpOgogwqAgwqAgwqAgcmlzY3Y6IGR0czogc29waGdvOiByZWR1Y2UgU0cyMDQyIE1T
SSBjb3VudCB0byAxNgoKSW5vY2hpIEFtYW90byAoMik6CiDCoCDCoCDCoCByaXNjdjogZHRzOiBz
b3BoZ286IHNnMjA0NDogdXNlIGhleCBmb3IgQ1BVIHVuaXQgYWRkcmVzcwogwqAgwqAgwqAgcmlz
Y3Y6IGR0czogc29waGdvOiBzZzIwNDI6IHVzZSBoZXggZm9yIENQVSB1bml0IGFkZHJlc3MKCkpv
c2h1YSBNaWxhcyAoMik6CiDCoCDCoCDCoCBkdC1iaW5kaW5nczogc29jOiBzb3BoZ286IGFkZCBN
aWxrLVYgRHVvIFMgYm9hcmQgY29tcGF0aWJsZXMKIMKgIMKgIMKgIGR0LWJpbmRpbmdzOiBzb2M6
IHNvcGhnbzogYWRkIHNnMjAwMCBwbGljIGFuZCBjbGludCBkb2N1bWVudGF0aW9uCgogwqAuLi4v
aW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbMKgIMKgIHzCoCDCoDEg
KwogwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc29waGdvL3NvcGhnby55YW1swqAgwqAg
wqB8wqAgwqA0ICsKIMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50
LnlhbWzCoCDCoCB8wqAgwqAxICsKIMKgTUFJTlRBSU5FUlPCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB8wqAgwqAyICstCiDCoGFyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jcHVzLmR0c2nCoCDCoCDCoCDCoCB8IDIzNiAK
KysrKysrKysrKy0tLS0tLS0tLS0tCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0
Mi5kdHNpwqAgwqAgwqAgwqAgwqAgwqAgwqB8wqAgwqA2ICstCiDCoGFyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjA0NC1jcHVzLmR0c2nCoCDCoCDCoCDCoCB8IDIzNiAKKysrKysrKysrKy0t
LS0tLS0tLS0tCiDCoDcgZmlsZXMgY2hhbmdlZCwgMjQ4IGluc2VydGlvbnMoKyksIDIzOCBkZWxl
dGlvbnMoLSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
