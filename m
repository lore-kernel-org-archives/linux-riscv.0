Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3343C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP2EH/esH0RYYpZavkf3DmWFMJhS8QbRGkiiiAsKhM8=; b=K4/JWyF9sMKlCmPRm39nlDLY4D
	pRZ7t1BvxFvXdqMX4M3IKzgz2UQ9V85v8p+YVnl1VdwOryUX6K9zZQkutCdipX1Oaaq9BoszKOdZ/
	QoBV2WJUEnEUXkW7mAAJWnPkAJROxnNao+HFfud4a2RnmG19SPbOaMOh/L/BW/Fa0b2NLzwlwWzQr
	GIs8DNJvAgQn9oZjoOTdhEB4FfuQgtN9ugMYp2fhjiZJGoZKROCV6yLCJm4ww+eNdo/8qQ0jBYa3l
	6yCzsPUEOXj88R7fQIVUGcEQ2hIGROmLOVRvHmU3VSu6jCG3IyPq2kUAXi8OZOHGOkkphjtRqRHTR
	VJyms/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqo1-00000008CdK-3yAX;
	Sat, 22 Feb 2025 14:48:37 +0000
Received: from mail-am6eur05olkn20818.outbound.protection.outlook.com ([2a01:111:f403:2e12::818] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqXy-00000008Aoc-3NkW
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 14:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvvnA07zOsQV/ciJGQjL02XtgHk/2DyE55BbsX8LfURm+HmxxKiVevSonipupnlaD7GTNoTvP0lO4CEtaUJJpTu6OTP5LgrzC8FgxxFdn3lp4BKD/atydCJnEDZp9HSpXIpIVyCb3eYsFFtODraeEfP8w17xN0nMo10HwvJ3mqGD3qVFmdnJr0EUppjrFsoCUngi2TuxD0ABNF7zc/cU/nOdX8gUwqE9tYYvGPurqtC6mt6CVqTkQQ9YK7jknp2X7tdDTX9QC4A6YM6jLktLSoQw1wYWyNc1SeGGafNEmZBOFi6bHa4KwATkcQpM1JN04KFQkH3aQphhcCCzm8q3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wb0dHhOEMCMoSTnCCmT1HISpX8WATd83gVJf5yHGMtw=;
 b=oVdwiluf+jmHMPSFvRe2ovU51G1ndmMM/rnlXiqKnRMHzaAab8gFrmDqAf98lJNGrh9GOPLovSth/Lm1VfKVmmXDo64cZ9HfkkW7UOZZpjene693r3y+Sa+oUzGrQIdtC4zjdmbY7xxzDbtUWQV9YZMnfcTvKym+3YH5ZjwGEdruYSgb8oZ/KmOX91x1qBw7z01vCytXR8hX0xWmfEq/U6NSUa7Ifn23rFUA3iqs8bofUCGsfIZM0khnOpd/S24QtsE/Zj+2V4ghXeZP4Xy5HmQPHwEFhx8wHXiIQnuFoZtPL1ElWKCQunum3/eHdJ2Q90cp2pPoOJDwDO0qFOcWlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wb0dHhOEMCMoSTnCCmT1HISpX8WATd83gVJf5yHGMtw=;
 b=FD6d/5INgEyYh0Yv2tf8v3Jv1vazvVcZMBiPrE6KGI4/Vmzfl8MB6a3TVVgQa2WwgP8tUAqHelE6C4BlYczdretxaBSA4mR0eINC11cYpInTHUM6zNjnTDLh3BE1rMG/JSXX5sCNkboRiC8k+6blhnBQvfHsyc1A99SYnREqqfnuO4nyKQLj07h5CHFAPef65/NVGa+yT6X7qyB6Dmhs0rCLJ5TToCedhWL9HbAf/bnal8jsI9Mr70tDhm2SMuvKWcb7Dw+oBvnYp6j1M2/g/Vk/rM06RECSVsCK6Vcstz1MssGYb+REPtGedkhK+PvnD5NLMiTetsBky9M5lmXP9w==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by AS4P189MB2136.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:51b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 14:31:55 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%2]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 14:31:55 +0000
Message-ID: <AM7P189MB100934B6F2EF4339243CB81AE3C62@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Sat, 22 Feb 2025 15:31:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: dts: starfive: jh7110-common: increase mmc0
 max-frequency
To: Shengyu Qu <wiagn233@outlook.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, william.qiu@starfivetech.com
References: <20250222-fml13v01_emmc_speed-v2-0-3ffc5b1f5663@hotmail.com>
 <20250222-fml13v01_emmc_speed-v2-1-3ffc5b1f5663@hotmail.com>
 <TYCPR01MB84379D3E0552FD990424173C98C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB8437AA5D22665A38D56B895698C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <TYCPR01MB8437AA5D22665A38D56B895698C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: AM0PR10CA0107.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::24) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <cddfe571-c861-459d-83cb-4efa2addbcb9@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|AS4P189MB2136:EE_
X-MS-Office365-Filtering-Correlation-Id: f63f037d-6fb9-4734-39a4-08dd534da7ed
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|19110799003|15080799006|5072599009|461199028|6090799003|440099028|3412199025|10035399004;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHNEVk4yNTVKOTczaEhUaVprMUFRekNhM2xWeHdvVkR0bzZGcHJFdlNrLzJr?=
 =?utf-8?B?bHAweFVINTFSTE1CV2FNQnZwSmdRblI2OHN2dEY0NmZOUHVtbm9iUHBEZ2Fx?=
 =?utf-8?B?OVpmeXQyMTY1VVNZUUpEemE3dFN0aDBDcUVTUVBJc1Y2aE4yUW9FZ0hIWG5C?=
 =?utf-8?B?em00bHg0SCtOMkwrOWFyWXd2L056Wlg1UXBaWDJyRXVSTmNzbzlTbW9SQlB3?=
 =?utf-8?B?Q2ZEMDVTTVNCenpEWTZJOU1oQTdTaFRWeFA4U3hkWGJmTmVtRGpHcnhKSXZy?=
 =?utf-8?B?cllOODFvTjVpS1F4NU02REMya2tiamlxaGtVRlpJV0dpc083Q1JMUE1sU2Zv?=
 =?utf-8?B?NU1VbnNBSzk4c2Z6dHBsdEdrRXVlb0s5Wk5iTi85VzhXL3BvYm1DSERMYzU1?=
 =?utf-8?B?eUhRS1QxRE1tUjRKQUloYmpnZXBiUzVnQU1mNHQ3c0ovMkpkeUFaVEMyMDZS?=
 =?utf-8?B?WmNRZGkvV0RTSTcycnBRdjZiRS80T3hFamFDMU05ZXZjUVFlWFFJeWtZZlVW?=
 =?utf-8?B?UjU0TEpJenE3ZE8vdGxiajI1UUZXTndOY0E3UW13TGMvUmd5ZVdaeDFyQWlk?=
 =?utf-8?B?RURjam5aT3RwNTArMEFJT3d5L1FOWHFhMUxUcXgwajhxOTFjZGk0UVNJOWdi?=
 =?utf-8?B?WlI3c054cnhtckNYWVAvN2svYm8zeWlRN3JrcUtkUjd3NFZkNkNyZlQ0MW9Q?=
 =?utf-8?B?eHJQOHJsR2FZUHp0aHlWVHpITzBIZkVzOHN6WEE1YUZrNEdNbGRmVDFMYWov?=
 =?utf-8?B?bFVRQWhLZ0pHNE9RR0s0aUNPbWtpbTJZZ1RPTmo0VGM2eWIzSjU0QldrUEhP?=
 =?utf-8?B?QStFRTF5N3dZMG1iTkdVOWtwc0xVbFlPZ3lLSWpRWDRVeGs3dFQxTFBQVzhs?=
 =?utf-8?B?UDZocG1zaFFFbXJnN09BbTJQODVFaHYzYldhWlg0Z1NNR1lwUjFTdWp0SkRF?=
 =?utf-8?B?eWJ6MjQ3bXQ1ZEUvRjdLM1VtTGx5UUE4Y2xtLzlDSWY5SXVjbU1LMEtsVHRL?=
 =?utf-8?B?VFIrWkR1Q3hSQjE3eENuU290MkJjbDFiSTYyNlRSYXQ2bmlPSHVTeE5sWEVZ?=
 =?utf-8?B?TS9vWGdBaElKQ2NxWTFvM0RLQThKWG5YQmdYK28rdmkrV3dVRG5kWGtmekZD?=
 =?utf-8?B?bU5XWmZySE5sY21RWGRQTDAzZFoxZlRLZTlNVlBMNERvdjBpc25JMEg0dkt5?=
 =?utf-8?B?N1JGMWJoSVVBTGRlWG9PM3hMOHlDY2s5RnBmenlRR29VS2J3ZmJrY0hZUXpQ?=
 =?utf-8?B?UldoeDAvMEw2S0pRWU9JRzJvZmp2MXg0UUJ0dXBJUEFwdFVIZ1dJRkE1TTg4?=
 =?utf-8?B?MW9TRGkrS3NqMm5YUk5sM0JHQmRicTI1aE54aEtVR3J2VC9iRFZUN1QreUpt?=
 =?utf-8?B?cytOdURhOFBIVnZlUC9JcEJUS29Mb1ErWUVwYVZ6blNSemtqOTMrQXNDZzV0?=
 =?utf-8?B?NlcvalYrRU9tM1VPWFo5WHg4ZERvZ0RkQjlwNGNPUWhwZS83ZjFKMTBTWkVr?=
 =?utf-8?Q?xfgXVc+UBdRC+bGPsGSCkZX+QYH?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wkx6aDdWbkJkYWJEMGlHZkJ1NW9FUUtPb21PRXhTMzMvUG5COGpRM0x1eXlY?=
 =?utf-8?B?ZGMyOVpBRHNleUk1cmh0NUM0RnJmTU03cFhRYXFQOUs4azRVTUIzd01zSHU1?=
 =?utf-8?B?aXVIREI5WkZKa1lZTEdWdmVPOUhrTi9rbHhNZlJtbHR5NmFIbGtveWtrYk1t?=
 =?utf-8?B?cC9QY3ZuZnM5VStKUERROW1GaDR3SGN6UDBXMk1BUXBPRXJYYnFVa1U0ZDBG?=
 =?utf-8?B?RlJtUVRpSHpzRGR1Z09YNEVVdzZwTU01TkdGZXo5NllaRUpzU3JqZzJnUXVj?=
 =?utf-8?B?MHFadDJiM2dWcGN1Umg3akI0bGcwY0psTm4rdjlxdlVSaGhrV1BWSXRGMWg1?=
 =?utf-8?B?MlBhNy9lMXMvSllsa3BOV1dSUlN3bkhQMUNtQ2pJS09sSlBBNU1BRmE1cG5U?=
 =?utf-8?B?YXFBU1drUVo2bHBZanpoNXIxbFhtRWNwSjQvTmxaOU9ha3hGcnlqOWJZak9s?=
 =?utf-8?B?V2s2VEZqc3dCeDYxQjNYbmtRZmZkb0Y1MlcwMmxlWUROTVJ0VlB0ODNpdmRJ?=
 =?utf-8?B?V2NSUTJCdnlrSklFVW5pVUlIaHh1NVFmNmtORWlITHdOSlFpSSt2eEFHM3FT?=
 =?utf-8?B?am0vSVIrWmRkOGl0TS9sUExzLzdtRlN4Y3NCMW9DNVREZGNiRi9Qa2l1QmFo?=
 =?utf-8?B?MU1xOEs0U0JyM3dya0QrVHpYbGU3WVJZUUE4QWhKbGFiN3pqc3NRMm1Gdyta?=
 =?utf-8?B?WnNYUWRUVU0rVnhUeW5kUzhhSjY0dmxBRjhlZ29OelIrTDh1ZEgyRFlVQXNV?=
 =?utf-8?B?dGdXVm01bndRWGFCZkE4SUNiL3EydFB3Q2VjUnlGdkFoWDlzN1l5RzN2VWZX?=
 =?utf-8?B?czEvODl3dWxGQmFaQlNnMzZ1STZmUVhVTHlxUCt4ZVFLYkZwQ0dOU2JGMEV1?=
 =?utf-8?B?SlJmaGxXekNmaW9MMzFZdEIxQkQ4YzE1MS8yQVlQNFhFcTRTVHc2SGRjMUk1?=
 =?utf-8?B?UnVLa09xMXRIVitJdWh3QUR2Tlh1ZG14SUNwWGRXTVVvc3pSSnVSV0JMYVVI?=
 =?utf-8?B?dFFtN1hpK0NJYWVsMUlWMWsxaVkybmpaRmxUQ0hqN01WSzBEVlQvNjRyUFMw?=
 =?utf-8?B?VGw4WVgzQ3NGbHFpUm9HVStIQjlpYTRSSkJnQmdxUHlIMThRZ1FVV3NtOHpi?=
 =?utf-8?B?RFdaSm5vczR3TEc1dmlBNEN5UkVtS3RvTkhkalZhcXdJSVVRYUhhcS9qR3Fn?=
 =?utf-8?B?Y2ZJOGE3SVRpVDVYTkE4UU50eklCR3BrR01NWFo1RUN6MmcwdVZWQjA5d3li?=
 =?utf-8?B?R3lWUlZtR01zMTFpRDQxR0RWaFNuVk56cC91WXR1VytFVk9CRzg4TnRRVVF0?=
 =?utf-8?B?THgzUVgxSDJ2V0c2YmhBMlZHRjlHdkJ6NjJUY2N4U2duL3VmczdQL212anVY?=
 =?utf-8?B?QlVuU3VkTEhxeEcwejJ3T2s0YStmNGJ4MElVUEZXQXd4azdPK0tpY0grZEJH?=
 =?utf-8?B?NzJiblRPTlNuZGtSSzRZd0pIeFhjR2J5SEg2TWtpOG1COXF4Wk1OTFlzWlA0?=
 =?utf-8?B?NVBrL090Z3J2bkQyT1JCWDdYSzV6ZGpiRnlqSUwwSHdEUktZLzBDTTZWalRs?=
 =?utf-8?B?RGRWRityQVlpV0dPeUUwdUJraTVXNGZQRllGeU1PTUVlZ2wrZm93VklwZnlm?=
 =?utf-8?B?ZXY1VWw3NHVqVWl2ZGNBc2x4VXJiTGllYXBKU25SOTFLbGY1VjQyaXVzNjBS?=
 =?utf-8?B?Ri9vMjdKbWZNbmxub3hSdnk4aWwrdDh6a3F1ZlVTSUhQNVJMTG9LT3BsZkpW?=
 =?utf-8?Q?4OTOy33JvLxiNw/+3aLHH6TwEjAkB+7PZ5ItkpG?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f63f037d-6fb9-4734-39a4-08dd534da7ed
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 14:31:55.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_063202_862190_95C730F2 
X-CRM114-Status: GOOD (  11.37  )
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

Ck9uIDIvMjIvMjUgMzoxOSBQTSwgU2hlbmd5dSBRdSB3cm90ZToKPiBTcnkgSSBmb3Jnb3QgdG8g
Y2MgYWN0dWFsbHkuCj4KPiDlnKggMjAyNS8yLzIyIDIyOjE3LCBTaGVuZ3l1IFF1IOWGmemBkzoK
Pj4gSGksCj4+Cj4+IExldCdzIGNvbnRpbnVlIG91ciBkaXNjdXNzaW9uIGhlcmUuCj4+Cj4+IFdp
bGwgRU1NQyBzcGVlZCBpbmNyZWFzZSBpZiB3ZSBvbmx5IGFwcGx5IHBhdGNoIDE/Cm5vIHRoZSBz
cGVlZCBpcyBmdXJ0aGVyIGxpbWl0ZWQgYnkgdGhlIGFzc2lnbmVkLWNsb2NrLXJhdGVzLgo+Pgo+
PiBBbHNvLCBhYm91dCB5b3VyIGNsb2NrLXJhdGVzIG1vZGlmaWNhdGlvbiBpbiBwYXRjaCAyLCBJ
IENDZWQgV2lsbGlhbSBRaXUKPj4gc28gdGhhdCB3ZSBtaWdodCBnZXQgc29tZSBtb3JlIGluZm9y
bWF0aW9uIGFib3V0IHRoaXMuCnRoYW5rcyEKPj4KPj4gQmVzaWRlcyBJJ3ZlIGRvbmUgYSBzcGVl
ZCB0ZXN0IHdpdGggdW5saW1pdGllZCBjbG9jay1yYXRlcyBhbmQgYW4gZWFybHkKPj4gc3RhdGUg
b2YgU09DIGNsb2NrIGRyaXZlciBvbiB2aXNpb25maXZlIDIgd2hlbiBJIHdhcyB3b3JraW5nIG9u
IEFYUDE1MDYwCj4+IGRyaXZlciBiZWZvcmU6IGh0dHA6Ly9mb3J1bS5ydnNwYWNlLm9yZy90L3F1
ZXN0aW9uLWFib3V0LXNkLWNhcmQtIAo+PiBzcGVlZC8xNzQxLzIxCkkgYmVsaWV2ZSB0aGF0IGxv
b2tzIGNsb3NlIHRvIHRoZSBzcGVlZHMgSSB3YXMgZ2V0dGluZyB3aGVuIHRlc3RpbmcsIApiZWVu
IHdoaWxlCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gU2hlbmd5dQo+Pgo+PiDlnKggMjAyNS8yLzIy
IDIxOjM0LCBNYXVkIFNwaWVyaW5ncyB2aWEgQjQgUmVsYXkg5YaZ6YGTOgo+Pj4gRnJvbTogTWF1
ZCBTcGllcmluZ3MgPG1hdWRfc3BpZXJpbmdzQGhvdG1haWwuY29tPgo+Pj4KPj4+IFRoaXMgc2Rp
byBpbnRlcmZhY2UgaXMgY2FwYWJsZSBvZiBtb3JlIHRoYW4gMTAwIE1IeiBhcyBhbHJlYWR5IAo+
Pj4gaW5kaWNhdGVkCj4+PiBieSB0aGUgY2FwX2hzMjAwLTFfOHYgYXR0cmlidXRlLiBJbmNyZWFz
ZSB0aGUgbWF4LWZyZXF1ZW5jeSB0byAyMDAgTUh6Cj4+PiBzbyB1c2VycyBvZiB0aGlzIGR0c2kg
Y2FuIGluY3JlYXNlIHRoZWlyIFNESU8gYnVzIHNwZWVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6
IE1hdWQgU3BpZXJpbmdzIDxtYXVkX3NwaWVyaW5nc0Bob3RtYWlsLmNvbT4KPj4+IC0tLQo+Pj4g
wqAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kgfCAyICst
Cj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+
Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29t
bW9uLmR0c2kgYi9hcmNoLyAKPj4+IHJpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21t
b24uZHRzaQo+Pj4gaW5kZXggCj4+PiBkZDJlZWZjMjk1ZTVjOGI1NjhhMDIxMDRlYzIxODllNjZi
Mzc4OTA0Li4xOWNhOGRjMjQ2MTdjMmFkNTY1YTRhOWIyZDlhZjliZDk0OTFmMjJlIAo+Pj4gMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1jb21tb24u
ZHRzaQo+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9u
LmR0c2kKPj4+IEBAIC0yNTgsNyArMjU4LDcgQEAgJmkyYzYgewo+Pj4gwqAgfTsKPj4+IMKgICZt
bWMwIHsKPj4+IC3CoMKgwqAgbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+Pj4gK8KgwqDC
oCBtYXgtZnJlcXVlbmN5ID0gPDIwMDAwMDAwMD47Cj4+PiDCoMKgwqDCoMKgIGFzc2lnbmVkLWNs
b2NrcyA9IDwmc3lzY3JnIEpINzExMF9TWVNDTEtfU0RJTzBfU0RDQVJEPjsKPj4+IMKgwqDCoMKg
wqAgYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NTAwMDAwMDA+Owo+Pj4gwqDCoMKgwqDCoCBidXMt
d2lkdGggPSA8OD47Cj4+Pgo+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
