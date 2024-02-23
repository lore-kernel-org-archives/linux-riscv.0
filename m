Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333C4C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 03:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODczkVHePWxHFSQiCg1Z1nloLXn7+1UsOcmchxF1pvM=; b=BlGuxZvzq1xqRxfXrAm1ADL+Gp
	7IlXdzb0Y37jOPINKisCllsMVAvg5fjkLnb3KmsoARsLG+ombCMFoucYWa9GB5bp2whGA6zgUrsw3
	xUQEqb/XCXaQ//94lw6ofn27iCi93nvZ2UBJnOgqLI7Fy1edaS+smQNyvLLfUkpKOB2HeZ+ZualuZ
	GZ0N47epsoN7qJHPD1txDnBEzSzu0unLm1EENI722QCFe8dqSlAwkiy6BoFKnswMpRYb4OJVJ97O1
	pglQtE9ilyxXajD4dCbBSvNVIT0PBEqwCOtQgKvDcHUelOTN/m1pQ4oTYp9BORih4E1oHa4DLjYot
	c6PxvJ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdLpl-00000007cbb-22KP;
	Fri, 23 Feb 2024 03:02:45 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdLpH-00000007cW5-1S5n
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 03:02:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fThSgekDFIgeyg0cqPEtf8p/0BcyqtXgi/Elpak+rBSaHyHVkjmkEDCE1mR5auASH1qOSGEmfxa87rI0xd6uQPE866AuKE4zuJltadCMNVxZuszNhG7ZciuDnJUKJjI1iXHTGwakPGskbq3Ia/VF7uHqcD1Su9hPuUnoA0E+VpsEwDFnEU1840faw+LIx2ONc5VK1VgeAKM0Nxx7mPFLNKH4l8zCIp52NRH+eT4W7UiEdXw/5SkbO1/rTdO3mYCfTBu/i9DqDMvFP6l5uwQV2+FRfeSo0sZ7jTXL4oNn1F3BJE3Ky5Rx+fEs+IgK1Zmsyhr34upjkx9OTUI2KUZHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3RNGggLG5+9DIxffPOErC4zH3AQEdnOSzzKFdlKQ7c=;
 b=VscKTHUutAay6g24IjuCjHZ+9UGB3Dj22f8+vWAlcveMuYgcfWhudq8yOedYgoipUA4N9XxJzldhAnpNXCUkWHc4/wk6PgfHXY5EoN50pAwnPi40W6aFuo1TmPBTxO9CMTQQ4zlatINOBCq47FGR2RoNkALAbz9NImWoCe6vx6euYlUsKFpeUnQ1tiMEUVDBsa+DovWvMhiWt53Ie2D4IjsHSmyS74ooSQxJ4nPekwxci2kUklBGb5TmJmDb8pBgNnaqhS5ll/P0WKKhRyT6qtye3F0l2TNH46+wQuM1hxRM+zbulycLZr9RomrlwbabKDmIaDQdAO8jy+3ubq6UrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3RNGggLG5+9DIxffPOErC4zH3AQEdnOSzzKFdlKQ7c=;
 b=gdO6tHiG6QRTYXUHEAZUqtuf0wB9YW6kexze9QQCLAjJ8kQUl8U/0NzXrTaAD6Hqmp4T9lqklHfxlxJuuD8hjR/drV8qLqiNZRmZZK0Ounyied+C6w899+/UDrjqwYSbJ0OrTuhJPxDEoAuYo6jaPBAU268eX7Mn9K+kwsdOU2ug7214DcsftHffKuzQh/aBFi+NuwvnmysrnyYMId8BDUJJtwa2HBAwBhDITNLDamSAdK5sz+Q0vs5lS+wHUeGik9oGGUHaNH5KkF9iwb4bGJYrT5WPJuZGqf4KZl7giivGZoQdaA7fX8dvvAjrMvF+6zLaKnxqSgrChAS0zjVuCQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1972.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 03:01:34 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::8473:67b4:9a2a:3a69%7]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 03:01:33 +0000
Message-ID: <MA0P287MB282275AB71CC3A7E2F3792B2FE552@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 23 Feb 2024 11:01:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/5] clk: sophgo: Add SG2042 clock driver
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1708397315.git.unicorn_wang@outlook.com>
 <d7c74c2cfa410850c044ff2879720db06c2f8272.1708397315.git.unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <d7c74c2cfa410850c044ff2879720db06c2f8272.1708397315.git.unicorn_wang@outlook.com>
X-TMN: [mSU/X3AMFjHIF06XY7GnPBKs3FGHo1B5]
X-ClientProxiedBy: TY2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:404:e2::17) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <facc1753-c907-4de9-b7c5-ba16be9b4fff@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1972:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4c801b-ee3a-4c6e-0a7a-08dc341bbc61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4a4jAQVdjy09LWF3TwaxuJ7RN9DmGSQ/9GOSiPu2QhXCOKopimoRa1u99uNjV2Zzt319Y0JlupGyRrUqC85nTMDsakHRkwkqgyvNUUEGHRJJwk7cPPgXrs8QQrp9ssbuWZjJWfJaD1LH6HeGuGYJNDZac2b794oaP88vMOu2QyjqPLzoJ/s7kHlgueVstYc/HL9fvQcNEbAlAIxwYmnKS4cyCpyfrvqetpm++69UFBKkmwFGSV1CLoLQWGPP4Cq2b6kfnF4UMr1xaU0TazrHlx6IQ9693b60ewmaD9N7DIPOaEpCVMaDixQGERvTovOPCgkEy7w8A/EI3VsnSSiYWxbh7ggIy21tF9M1MB5ZbdXnZV5YTcL5mWELrxOQK72/eC79QjEWKX6Aet0OgfldM5GPytgUHp/V7KO7C9Ddu7ktlKJZP44K2UfXj6yT+52NPWzRZ6E9Cw0rrvdDKdCTnKYzape0OLVqAsvAqLXI+McrXMuIl+7yhsmWSkMuQHcV7+9nmyhlvAdMb+MOtWGMXSMKlYckUXMM+3NhPrVctcEufyMhb42tA8ITAct38Oe4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWg0VS9pU1hNRktFUVRLRHA5MHpMcFBwOGpXemo3dWFLT3R2K2N5a0ZJeEVo?=
 =?utf-8?B?dmxOdzBicGhMUUhpZVduWndvNkFqSUdPUE14RXBQWkFZbHlMUkNYT2JzRlVR?=
 =?utf-8?B?RWJxN0w2ZVc0RG9BQ3IxUVdJNDd3RW9LWHhXbHRsa0xiS1hGVWY4N1ZrY0JW?=
 =?utf-8?B?TFVXUEg2bUVVNjkvbGhCV1lZUzFSK0VxM2lrREgvaGs5L3I4V2lHOE9Dcm1P?=
 =?utf-8?B?ZnkvZTZ6SE9ZbEdYZkJ4YnJzVEU3MWdUdHowbVhEbXpGZmRkV3ZuVWN6WFlK?=
 =?utf-8?B?TDZHUm1qVmIwSnEwQ2Fsd3VNTnYyT1JwVzdSUS9CZDNySGUwUnRQQWJZL2Rk?=
 =?utf-8?B?TU9KVVNvaWZ4cmY0NFQ3cHhUZUZCRHBIbTZUbjBSS0RQanlvSUx5ZllLWGUv?=
 =?utf-8?B?ZkdSemxmVjlaQVRnZFlMNUduVnZUWlg0MURlK2NLRUhzMVd2WEYyTXRLNTlk?=
 =?utf-8?B?Mjl4ejM5aHdXSFc0NVVLNGxlYm1UbWd3bit0dG9oTDh4MUl3QmZRcW8yZktS?=
 =?utf-8?B?VUY4SENzRnd6cGJrY2JFYW1FampRSzVkbW1CK1ZuWlBlVDJtbHhqOElmV0FD?=
 =?utf-8?B?UmxUbVNFNEJodzdVTVVYZzFvUlcvbDFQVTFDa1prb3R1L0F5Z2ZOMDUxUGtL?=
 =?utf-8?B?bnVBNkVCalNOQ2NkNFFFOVJlN1MxdDZUWjArVWJtTFZRaUpyK0lnc0QvSFkz?=
 =?utf-8?B?K2puWjdVK0ptaVFqdGhrcTk0OWFDNWplb2NmM0RSTTVaSFczKzZmb3g4WXAr?=
 =?utf-8?B?Vkxyb1lLNDQ1dlBBTFoyQlhMcE5QaUJHVGtYcEs4RFlWMVd6V1NhSGlwWUgv?=
 =?utf-8?B?R1ZpV2JPang3ZDk0bGJ0RDQ5RUFCZGRLSzI2WEJVQ25waVo2OU0vTGZqUEFX?=
 =?utf-8?B?aURDYnpJbGROWXA5NjU0M3MwM0RwV0V0eGxhc0lyOGtaSDNwYk9BZVJhNEh5?=
 =?utf-8?B?VUxrRW1FaW8yN1pXdUdCV2NLL25lbzRSZGV4aElCL0FJUHZ4OUFzanBiYVU5?=
 =?utf-8?B?YnRPcGdCSExXV0pLM05YNnNkejJhTGQ3bTN5Z3Q3V3Jmd2xzSjArZmszUFI1?=
 =?utf-8?B?Uldjc0hZMytKTUZ5ZURZZ3JkNXJYeEFwN2V3VWdOS3NTUGx2RTVmb2JIbHJZ?=
 =?utf-8?B?Y2M1WjhJcC92SjNtUFRJRkZtY21XV1QwYmJlbGZqZjk2VEIrckNQVFE5VTc3?=
 =?utf-8?B?K210VlpoSWJFaUlXTWQzS1pKLzhpOUtjQmVJRWZNcThIY3FhQ1NlSCtvL0JO?=
 =?utf-8?B?MWFOY09CWkFPQldwTjNuMlhNSkZCUUxGZm9DY2psenNzK2tRVU5zalljS0U1?=
 =?utf-8?B?NW9FRGZESkpGRzFJcU5Ma1MxQ2NTVEQweHQ1S1B0QjNjTGc3Y3ZTNURpMmdp?=
 =?utf-8?B?Z0dlQ3ZJVlFnWXBCSm9FZGs3dmhhMWo4T3VpWUljQ3ZiYVJrOVRnS0FuYzIw?=
 =?utf-8?B?aXdJc3htSUxVK3Q2L0xQSUJWN3dKQlBDZ3RScGtqd0Z5RjFqRDJMRkI4and3?=
 =?utf-8?B?U2FUQWhIb2l1bGxMTjlSVVhKT0JyRGMwS1hwSFJ5d2IvRlpxTzBtN2pMN1hD?=
 =?utf-8?B?TytFV3ZLRExTTWYzOEJwL0JYbXRoejlac05sT2F3cFpkTnk0d0k5NGs2NnQx?=
 =?utf-8?B?Z3dRZ2RpTEFSUGg4RE9jV1p4cUhOWmlyQU52VkZ4OVJIZ0dWckRXU0J6WjRk?=
 =?utf-8?Q?7iJE1m7QLEvgCdSJcM4p?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4c801b-ee3a-4c6e-0a7a-08dc341bbc61
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 03:01:32.8312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1972
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_190218_272332_0E14876E 
X-CRM114-Status: UNSURE (   8.64  )
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

Ping ~~~

On 2024/2/20 11:09, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> Add a driver for the SOPHGO SG2042 clocks.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   drivers/clk/Kconfig                    |    1 +
>   drivers/clk/Makefile                   |    1 +
>   drivers/clk/sophgo/Kconfig             |    8 +
>   drivers/clk/sophgo/Makefile            |    2 +
>   drivers/clk/sophgo/clk-sophgo-sg2042.c | 1401 ++++++++++++++++++++++++
>   drivers/clk/sophgo/clk-sophgo-sg2042.h |  233 ++++
>   6 files changed, 1646 insertions(+)
>   create mode 100644 drivers/clk/sophgo/Kconfig
>   create mode 100644 drivers/clk/sophgo/Makefile
>   create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.c
>   create mode 100644 drivers/clk/sophgo/clk-sophgo-sg2042.h
[......]

Hi, Stephen,

Can you please have a review of this, any question please feel free let 
me know.

BTW, if it is ok for you, will you pick this driver patch together with 
the bindings for v6.9? Bindings related patches have been reviewed by 
Rob, and I can handle the other stuff such as dts.

Thanks,

Chen



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
