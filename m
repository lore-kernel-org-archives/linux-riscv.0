Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F0AC3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 07:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWMywJvgDOFJYprxhdf2NImuj0ZvMAolihLfZvxNN08=; b=lN0ASzds6rDJBeVNk2eJ188Tkv
	BTE2FyADbM/b7i9Y/zHIrWLgYrzQTtf9MrSvzcCFEbl7WYgpvu0+nCXL7sFp/RAdXmBTNMR3YUh3E
	4+hNO8xVUlHdaAo9v9ZAe8baCuqptLhIUH0vrXukjniSNcNvFGc5zrG0RuDT8tD23gGzlYorLPWbn
	YCYSY6oj76ga+Uw+OTk2wS9UppfoprwJhZM7fq/GZCDpxi9sxvELj/btC/xuOGYalTpR/CCn/zi4P
	lIYyOaLqMlnp1OJvt4fDwFjmngShu9Ek04lxp2z25R12MVMDpgpxDkH8DsrPbse/rmmj2wO1J4peV
	onkfnIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiXa-00000002zdZ-3XIj;
	Mon, 08 Jul 2024 07:12:02 +0000
Received: from mail-bmxind01olkn20808.outbound.protection.outlook.com ([2a01:111:f403:281c::808] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQiXY-00000002zcg-1TAO
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jul 2024 07:12:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFebkLIS13gOOEEyPtKanTX//EmJngEs7FYtKBRxZJgXJWzzBMyM+ybHslRMtNsir4nYrR8a6bADkpeNEkui1Zs8viebK+/UwVi3BkPDaQTEVZGE3oSZTzFB5AJ+bE2xUWwPO6Kmg/3ABzZDgqsTPf5iJmjwUep+7WQfpBpCbC6RwNOMcd01X2vHkP4R26Gl/wNLKbZQtDgPbhrv1e0LPDDoxhUFm+Wvf0UnZSsIBg+Fx+SMg2KH53Qrvc3dE+VEBP+Sd66stEyaeVVacmw/iTkdHqziwPONSGlrdM/z6eYSrHjHGweAmVu0dOSb8eX7J2yBuXveV+X6oQyn9Vpsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPpEuvVXl2NNqEItLR5sL9PS/9JtEz5hrMRoCpU9MY4=;
 b=je87wFh8QBUSNB9ebiqfULVVPDWL/Dwkc4hEYr0tgvBwKHgxdvcNgim3K7TjXn7LA+5doe6Rgu5DNDYJ2VJYwISSKq8Wk33sD/CRZHiuEKH+gK6nQN2CQkHa5RCbCWmvpjJQd5ciERZmhcvXvAa17ZFG8y34wZTmJypD81PaeR5j0n6H2yGV0GTU1k8ukf48YKQgc01Gp3ncdiyr4FI+wdPOYGrV20Wwh+cC3pACCeh7yhCSN6MVYVWjyGSsP0xVkyRrb+zTpkrG95y4qI1/wW1xdKuOQ/8U1f1m9qG/4gpAfD/SEZFO13O2mtuWQeQSU/b2wq3mYgDXxlC6X842EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPpEuvVXl2NNqEItLR5sL9PS/9JtEz5hrMRoCpU9MY4=;
 b=EG6CfMm3L/H50eEDqdxI/fqLE0SCHKNATh9G9sGh2OmQD49i+nhpcvx05jegsw8Zp4Zbb32MuL1AP+7D6ucLWkDJbctBjzVgsbqSu6+A0eFbfVbq7c8+Z6iBdBv7U8wgL3gy+ZfQnAPZxBMMAjztvg+NV7HpXtQvvVxnnz/iDYNT8a6eVglOrCVyIn1aClxJHV3EUiiV6gRgRYWsj6viPACmKkxpWYBMsltKsqbT6rtDgjrvsXqhxX8yVvdNRI6i6qeAQOC3xnolndoo9T5nLdVhwSe0ssC1GkeK5xjoIaBNYTbSyuLgOXgCQewXjDF2bQDVNbxmdWGG8nd74Xh4mQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0082.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 07:11:43 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 07:11:43 +0000
Message-ID: <MA0P287MB2822676C9CF9443B9A3CB657FEDA2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 8 Jul 2024 15:11:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB4953967EA6AF3A6EFAE6AB10BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953EC4C486B8D4B186BB848BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <MA0P287MB2822935DEA9EE418F3411CFAFEDA2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953230DCEDD7DF01134A8A9BBDA2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953230DCEDD7DF01134A8A9BBDA2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [oc1yEjBa3zVZtTUQ5G6VQQSsnP4wgOvR]
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <f8829b4c-5ba3-45ff-a2cd-234e3c3c7e44@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0082:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e69aa7-2018-425a-b368-08dc9f1d3868
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: DLBETb3AD5yfkpn3sxeSaVc6JYZrjaP59CL5yTW9oTB3kWGK4bEEt9vHz5oezFdbjVQOsdn3YOZT9R0/PUVUi4eTGquaYkvieljK/pZkHT8IIbvJSqrjZ9zxtD+hUzdECBrmKByVv9p+O0G2lXsgSynS8BFzsbhEKnl50pRDQhqgtPisxO/X1e2OjggEusPduq2qDcjxhZMx5zea3djR4x3Z8COfgIBZ4VLY3Yj4D70nKhOgexXcOm5E/eKRVXrD9pzCpnRxH3A7/1d/AZ1RikoQhcBYawK0K1Yi9lmjYkwWmuanHdJ2Y5EC/zxb5NP736vleFKrTfqvINeGJ1LlFiCV2FKv9eN3V+DTLdPDOSb9Y8OR+61ao1jF+UQpL27DCI16+5dZ/xK6JBl6pP8Mil0hIxNre4BJFYIivyOyRSDQ10FAIQHbWoNFR5EvyRAs80FenZoXRbuuDE5klRC8kEDsYmABNIffq/gGreJYc6hZ5dVn17XS6WhZsgk8YeqBdlsjZb7PS0wCyeObq9vs27WaQjwioD8tzgXDU8ltrssm4Y7EKdLbvSbXKKDeuUlg+8BjgVwvak1kj6HDulCsC6DnPyvcBVvXi4+qKNgwH6O01RQP8bYCV/ilp0gqpNJK3t86EX+pv6rXVegwnAF/Ag==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3Z2dnk2bXNzdHcxUEYxdEN6eGlXWWhFTW81VUkzSWFpenpFMTY3Y0U4Z29R?=
 =?utf-8?B?RTNmK0tKbU9HQU92SXJVaFUxTkEzQ1BaK2kvREJkZzUvL0N5YW9OM2NrUzJO?=
 =?utf-8?B?RjB4WkJ5cU0xREQ5NFFZQWpPTkh3Si9qcFBBTWdUNWNQNmFtekRtYU5XdVh0?=
 =?utf-8?B?L1gvSzdsQ1N6K21MckhyY2Jtc0ZNU1kwVE5uNndiditLZytSY09DYmt6MFJt?=
 =?utf-8?B?Z2hPQXlleUpZV3d6RVNJWWUyZVhmL09LMUZZQ0Jqbk8yZnRQc01xYWk4d1hG?=
 =?utf-8?B?TURlSTc3UVlFaGNrMHlFaDB3aDhJTElORjdVa1BtWW1neWhsYjgreHlhUkgy?=
 =?utf-8?B?SFdETmlEZXQyOCtreTRnK3JTYm9Ca2t2RDhzWkF0RnZER3VHdlUyenIvTFVP?=
 =?utf-8?B?cVhXZm5EQVoyTGtmNlFJUHNjam1sQ2hFekM5SXdsTHE2aTQrazBDOWdwMEc0?=
 =?utf-8?B?V0JoN0RieHozVU50blNTZ1dnTmFWcDdYUHc0cENMQW15RnJXRjNiWWpwM092?=
 =?utf-8?B?QVNVUTg1RGhWeTdPK2Vocmd3b0dVVHluTEtPanE2TVpGYXJLSlZ6NmlvekhW?=
 =?utf-8?B?VTRXeFhnNGhtdnVUelk2ek1YQlRXaXNVTHV0dTRTZEhaMjBaNVpOdTJUM2hU?=
 =?utf-8?B?T3JsbkRBK2orZ2hpWmN1dEhRV25vbFFlUk1GMGJ2OTBFaWpCV1FrditOQ1lt?=
 =?utf-8?B?SEJUSDJqTjBlWWJvcldVZ3VjblRpckZEZEx3aWg0aHhLQnJjdW9aSWN2MXFO?=
 =?utf-8?B?Wnh1czNweUFBWnVxNlh1NHRJM3JPa2FHVGg0eHlMWFo0Nko1S3dzTG54SkFp?=
 =?utf-8?B?ditMM1ptdCswMU5YZFMrYWFzeGh5cG1lcktzYldFVCs1SWY0c0lEMkVTZ1o1?=
 =?utf-8?B?NkRWS3VqS3lwK3c0bDZlQVNEYjJvdHcxc0pmUUV5UzI4NExyOVZ3djVlcmVD?=
 =?utf-8?B?KzJNalBxUXI2VlBJU1I1YlcvNFZFRFcwdnFxNkFDVy9jMGIwQWhjcVRsSjRN?=
 =?utf-8?B?VC9vRjYzV2FtZ0FVSGNNQlhpTDBGY2x4Ky8yN1IxRW05eDZLUHdQTHhLN2hD?=
 =?utf-8?B?RVoxYXNPdUJ5Ynd2c1NNTG01ckU5YU83TE5VSG5HUlU5dWR2SWJQaXA5S0pS?=
 =?utf-8?B?Nm9PTHJDUUpiVVpMTjVxWVUzdkVXd3VNVTlxaXRzNVBmaWNERlVpMHlpL1lu?=
 =?utf-8?B?WmpCRmI5MUdrbFIyWHZHY25Jc0duWk5rMnNDSjNuWGFQMVJOMHQ3Sk1DK0J3?=
 =?utf-8?B?L3F2ZzFMR29pU1ZRVE1JbXJicmRBTDF6NTNqY1BrNitmd2JORUtKaW9wa1R6?=
 =?utf-8?B?ZWZkODg4Z3Fkb1BYdUJCTU1qWlhuRnVDdjVlVFh5SDh2U2pZMDljOERONlVa?=
 =?utf-8?B?RjVGTnJOMEg3bThmWU1haFBNS0dTaW14L2lWQ21aUHorT0pkay9lN0gxQ01T?=
 =?utf-8?B?QUZBTm9vWks5VVpnV2grQzg5WGY4V2NCU1BXSmFaZHRVWlNxelN1QmFCN1Jn?=
 =?utf-8?B?T0hkNUJnTldQNktzSms0dVJ3Tm1qVXdQUmROZEdwdHc1OVBCMU52K0w3NzhG?=
 =?utf-8?B?elpLdzh5V2dnbjRPSXBvdkZGTkx0MEEveE9WL1RJallyY3E2dlBsQnZDN2d1?=
 =?utf-8?B?NG0zdFQrOVdmb0dJYlVSNE9JRnJrNTNmRHFyemI2cDRoV21hRnAvV1FGS2Fy?=
 =?utf-8?Q?/m1oMrv3xQVQieiRysmj?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e69aa7-2018-425a-b368-08dc9f1d3868
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 07:11:43.0601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_001200_438508_0320394A 
X-CRM114-Status: UNSURE (   9.40  )
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


On 2024/7/8 8:53, Inochi Amaoto wrote:
> On Mon, Jul 08, 2024 at 08:25:55AM GMT, Chen Wang wrote:
>> On 2024/7/3 10:30, Inochi Amaoto wrote:
>>> SG2042 use an external MCU to provide basic hardware information
>>> and thermal sensors.
>>>
>>> Add driver support for the onboard MCU of SG2042.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> ---
>>>    Documentation/hwmon/index.rst |   1 +
>>>    Documentation/hwmon/sgmcu.rst |  44 +++
>>>    drivers/hwmon/Kconfig         |  11 +
>>>    drivers/hwmon/Makefile        |   1 +
>>>    drivers/hwmon/sgmcu.c         | 585 ++++++++++++++++++++++++++++++++++
>>>    5 files changed, 642 insertions(+)
>>>    create mode 100644 Documentation/hwmon/sgmcu.rst
>>>    create mode 100644 drivers/hwmon/sgmcu.c
>>>
>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>>> index 03d313af469a..189626b3a055 100644
>>> --- a/Documentation/hwmon/index.rst
>>> +++ b/Documentation/hwmon/index.rst
>>> @@ -203,6 +203,7 @@ Hardware Monitoring Kernel Drivers
>>>       sch5636
>>>       scpi-hwmon
>>>       sfctemp
>>> +   sgmcu
>> This driver is for sg2042 only, right? "sgmcu" looks be general for all
>> sophgo products.
> Yes, according to sophgo, it use this mechanism for multiple products,
> so I switch to a general name.

But multiple != ALL.

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
