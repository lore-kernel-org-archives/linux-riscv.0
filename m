Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DC9CA0EC8
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlVYvRhMbJ/CxKXgumY6WrWh+x+czIndZkhQ6qj0ZIQ=; b=MG+4PHarJ5DOE6J9ANfC2usQot
	59qOOg/wsr6GzSWTLuT854YZmq5aXOtGbklem7L4w6a9amFBFyyWna1kKolfLxqRMTWaWJctctNxz
	0OgdJZtYmuW/mlMhAn1T9mA4K5w2H+09psfowbZgvyvlP/gdLLscTW4wsCYTCIAPvK3VfLu3vBHVB
	QlG5XtmPDVQ7Ql+3qy4Uqe1kS8iSkweWazrZuUTM1RG+KtP5Xqkwtk2HMZ4uFFuAe54zOEmd1YUKm
	jf2Be5NqP9jfU3Vpo+JaIIawIDwj9PS4171Ti4iB8kpXKjqouigbq8XWDLqWUiUo+8XakpkgfAEQx
	jwUww4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjosi-0000000456t-1RuY;
	Thu, 29 Aug 2024 23:48:48 +0000
Received: from mail-bmxind01olkn20809.outbound.protection.outlook.com ([2a01:111:f403:281c::809] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjose-0000000455S-2MqP
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 23:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+HYIntWOyXK2wMHw8k5q8aJA6JVvV01xSqi1KV7Ss+/faYweY8g2SG9Xi7zo2Ty+FxvEAK+UVD+A3GPCGLZl1YxlGBiaP4XXrCY2hJz1M4WrC2ne1Cf7rtCEa7szEew0GDuVABWL5otuYLV4IANEHHrQ+2sSPnAnvoZ+C2OzLdyY7i1mff+CYRbE2ArBDC36nNS+mPucIG2Fxi3MeN7VKZ+Y+dxHp4/c51EAQigHFR5kTmwFlY5Aqv4wRIL4C+o/g6j9Nu7qzCLKZNftefivmf9Hk97ObDs2uYJoqf28L7k2F8YlphM9u1cFHM7H3BtgnRRL2Ls53nMv3WGufttJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVg/SJ7ww+nb63WyeEivuPG1bvzoFMNtVMwRRN6usis=;
 b=qjt/GRWTIz75IXWlhhTrhL4s4rinW/mznc5nnFcENvmMKG7VIrEqLiuFHiYEQuCllrAF6tHyczRdUAw4FQHY1jyntZZ8JeW3vTPrd3sQk4Nf7nifJFoDCv5H/5t3aQ4CUVVGmXSYPWiScWWrldvXRNlc9UAMk5szkcHhUrnKcQYHfvrC3PMJTCGIKNOWA8s9nMa8pgdhHQYbFElrI7e5m0vATPN22UgrsRLo+KVqT3/GPo9RGHdzFCwSEAZavSur5YHZjHjnsidLVxGLBFg3oUm+4AgtkWoaU1URpLCdMtSKRg8oaDSkw2R89jAplyaIWMxsIS56SdJhF7qkF3Yx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVg/SJ7ww+nb63WyeEivuPG1bvzoFMNtVMwRRN6usis=;
 b=OW2nStDUD3ciyEnACOrfBdvHhFjgHgsnqMcBkIC9XfgCUon4s3KmEjXp5OsWrRzdMHEg8Gev0dDX8mkVuclvGYt6FhOl3IVJZ1FFx6a0eYiOMW8Txghk1d77tZNlB98+y+YD27EiD6Phz6k2oi15W11FQ9xak1yydOg90lUmd6tsiMtvSFsoxNFbZewMrjIZ90Z+1jq4h4YfBRfJyDh/WIeS53aj7ADd50Uv1Isqn11LhD8SL9/254IdFy+enOYZOXvzC2Ge4KQs1r9bYSCEK42xMtcuNCmtp3QDXGDn/baMIZ/5/VQ9/e4B9Wxl8ufxksqV17nyB0FN1TAozlBWTw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:176::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Thu, 29 Aug
 2024 23:48:26 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 23:48:26 +0000
Message-ID: <MA0P287MB28226AF473BF6A261E4C5D84FE962@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 30 Aug 2024 07:48:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: spacemit: add support for K1
 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@spacemit.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>,
 Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
References: <20240828-02-k1-pinctrl-v3-0-1fed6a22be98@gentoo.org>
 <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240828-02-k1-pinctrl-v3-1-1fed6a22be98@gentoo.org>
X-TMN: [gTbN/P1eOmMviCnWvSQPgTBBHD/kl/xN]
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <6c37bfa7-b42a-409d-b453-69413f2e1c9a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0970:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef9adf1-a980-40cf-80dd-08dcc8851307
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|5072599009|19110799003|15080799006|8060799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: MlvCQyrkfogy2bOH7yImuGSmAGSc9GKv8Tu3+LRboESFfst5Fl0pWPDhjdHeKdkadb0CXb2PnZmdyBUJmDnJ/h4MUJKaSMwijJFe/11H4KLDbGHlZU7dTZulAS9JF35J49BGwQmojWBBNDG4Nyt32Q6IWSCC0uJs6evKuaA4bGfaXfTFkUnmnpbzfnonDm6GToGebTLNkiavHG3Y6fmHZmZ/vXpNPGETYNB0ohgOh4onj9887SaCiu8mUH5wDCsXXTGqLslpmxk84CUOqvJu5SIAyhsWbFzsv5vRw37jT9zHz7V6tsx+JyU7mnu6W/Agzu7VgJDd6UjbAEKfsRgnUVbdY5ZSXYovAfmuOQ5/9YiDeE/pPhl9tAXlX2dsmsd3RQc2L0y5XovOASrfMWy1xxSxCi2UgQ8jfCIlIwKQjJ5hWixSzOjZPv5JG8S34xXxSqchpidZ/lAIxc3rDVB7uHwXuvFNLzJNY3Bn8LZkB3SRAsXsZz+rols3yGFx2cyIwtEO13HX8mx6IvynSisqw9H1QC/rfZ6Z8XAgZjU3egH4fX63Ky84DOfTtjcPQhUeQ+ZYLYf1nibyhZVJPOPUdWgUAkY4TIjmQ7AyCxLyQTcGouWsaIvkv/ZobdADsLpOxTUIhWa2sozdnxuUlMA167acHx4fw2ECmyauNMh0mDuGYbStcUhnu2+JDdsMR7UlK9Gj3ufJ5iE5LLodZVQ+DelT2ZD3Ph8qBT2f+WZGAeM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1hzUm8xbmVKeE1HNnYzNlJHRU5wMXIzY1Z6b1podEwxU0ppSkZ3SzJoK3Qw?=
 =?utf-8?B?MTdIVHJuejdibWZMTlF0ZXEzM2syZEJZenA4MkZwSWMvSGNXVGpheVlyNWpY?=
 =?utf-8?B?cmNHN29GNnVvbEdyVGZqUzJxVTdGUXJFNy9TeXVuY0FMU2lob0UwdWFMZm9S?=
 =?utf-8?B?Nis5Kzc3OTlSZk1TL2hQK0pic2hsbkZhWWc2MGl3RkF6dVJIMkNXNWZ3VjlP?=
 =?utf-8?B?YlJacXkwY1R6QmZGT0t4R093aE9kaTNPc3UwMXp4ZEdZdWVKK2xITzRCcjdn?=
 =?utf-8?B?Y2tWNFI0UUhiOWxBanZyQTZyNEZ0SXQya2thZWJuWVRXMHBBOXBwZ281NWt4?=
 =?utf-8?B?S3ZIdEwwRnkwOWo4eFdFUVo2SzBWeXRpUzBzbldvdGRIQ1VGWkVmMFRTS0NB?=
 =?utf-8?B?bXFUNHdWV1JrVlNJNWJxTjVJbE4xaEhEd09ZbTc1dEJ4ZW0rTm5OU3RyeGlU?=
 =?utf-8?B?ME5PNUZDUlFRYWpDUWtjc3FnV1FDZlphcGdjU1JQeEpLK2JFeHRSeW5rSE8y?=
 =?utf-8?B?NWxRN2paclhSdWJjUTNSVys2NGs3K3BSRitENDB4Rkt2b29IWmNBTktab3gv?=
 =?utf-8?B?VzhqQWl2cUNtdVYvWTZGdjc4cjhDekFVcEJQV0lSSG44enNvZTJIL2xuWWtz?=
 =?utf-8?B?ZSt2UHYxb1RibXplamFaVWN4SWlvYUNZcU42OHJRY3Bvb2JBOWl6emFENTAv?=
 =?utf-8?B?VHF3b05xMDlaTVB0ZFBMb0N1UjAwcGs4dFVjRUxFTTFoQUkvdVhpYzFsbUNj?=
 =?utf-8?B?aDFCWmpEc0NEeDhwc2xYZGZhaXhpcTRJTGlwbXdCaFRHcEZlZVVwNG9idFJj?=
 =?utf-8?B?NFZ0bC9xTHYrTUtBUXNBMlRjcXE0eFFZdi9pdWErUEpKVHVWNHJFZitCSjlV?=
 =?utf-8?B?VGg4eFE3OGNMbUF3MEdWNjdHNHpnQmhiYklGVEk2Q1FoWnphV1NOU2RVMmt4?=
 =?utf-8?B?OXlyRWFCcnNPVXUwWWR3MjV0ZVNwN3dUK01kaEZkNUR6bXlRZkxlZTZlbms0?=
 =?utf-8?B?enlUeERHbXBjMWxVNlRPWm1NYkl3dm5IWWo4Qm5PRUxxd1RiL2t3ekVNWmJP?=
 =?utf-8?B?anU4dTl5anNuOFZ5K0VmdFBMZ1ZjTkpJUVRRbHZHeUpHYy8vT0hDK1I1MFBF?=
 =?utf-8?B?cW4yVjBlcHpGQVBhT0ZEbGNaUWlORVBKWGMvaWFtZUd3Q29VZzBkWXpyamls?=
 =?utf-8?B?elQxYUFTR1lOaEpLeC9VeDUrSm9GS05lbk9oOWVBWkY4S1hsTEhUK1pNMzRl?=
 =?utf-8?B?WjFtL3IrNXlxa0puYUF1WjB6LzBrekh0WjU0dmZrQWZhK1NQeGxmOE5abHZV?=
 =?utf-8?B?YzB5QjRwL1dHaTE5c1lhcjNtclR3Z0ltRlpXdzVtVnJDc2pDeEpVRzhlMklV?=
 =?utf-8?B?YTVYK25PTHdDanBxS3k5eTBGK2xnL0Frb2F6N2pRNVVodW1PUXhtbG5ITWJ5?=
 =?utf-8?B?OUZ2UzhBay9HVFZCcGU0Sk5QUWZiS241V0wraXhacGJKckFkQzR2QTNBVEJl?=
 =?utf-8?B?MnpLVDBSNkd1UHk4aFc4MWFYY1ZGeUxRMjA5V1JyVG5tSFNheVBNMk04eGRq?=
 =?utf-8?B?bGlJa25QVVNtelVaNFVWR2VjWnFrcXRJcDZCdEM0dlFBTFhMa0lKd2Q3QkJx?=
 =?utf-8?B?SzZDSEFzWlZkL1h1bkt2bEF5SWx6cXhKdlI2aG4rSWxkMW42ZnkrUWNXZ3Zu?=
 =?utf-8?Q?G9PmhRFLhtYeUUCiB+PJ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef9adf1-a980-40cf-80dd-08dcc8851307
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 23:48:25.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_164845_220543_3730D910 
X-CRM114-Status: UNSURE (   8.25  )
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


On 2024/8/28 19:30, Yixun Lan wrote:
> Add dt-bindings for the pinctrl driver of SpacemiT's K1 SoC.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v3:
> - drop spacemit,slew-rate-{enable,disable} property
> - use drive-strength instead of drive-strength-microamp
> - fold strong-pull-up into bias-pull-up
> - format fixed
> - title fixed

Drop this change history here, you can add this in the cover letter.

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
