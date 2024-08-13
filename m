Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0225C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 01:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uT8hp5RA87Idy3nUccWH4751KXHCOwwgqPZWgUBYsqo=; b=MEkhXH/x0wmRNcZ7fp+hwZXviU
	nwnn19KI2FkAyUVadoRy9Jf2KtsYYuyFkJmOZlVNS+fXGpy+g1uCfPZP58LagbiESwh11avIhDole
	4tbL/jq7H7y1Gd+saZfmGtKqicQhD8WQ70pIEWMfZ5gJppqGQmQT6xnFJnnaLBrJdj9ALZCrseowK
	I7qVz3RLsvdxZsqyewfNIlglp1rTdU/dKZs26wgPmhKX220JIRgTuk883HuSB86vbevO4UrKr+sWK
	Rx27RYcrUsaPyCrdklN7/8kLbpYZI+93Nqoy16n3Jj9PXj3js49UJbawEhRx3tLwm+/04M7dEv7aM
	JWnhXk1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgFc-00000001yPo-0GXi;
	Tue, 13 Aug 2024 01:23:04 +0000
Received: from mail-bmxind01olkn20811.outbound.protection.outlook.com ([2a01:111:f403:281c::811] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgFZ-00000001yNy-39gu
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 01:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoPTGSQoykr9pBMYUzLidXLmlG2Edp4Il7d1JW9fAksZWH28HaYNcrRFttALzjXtK087bIOAlyCVoqEQ6j0kKQdzjFkSW2TVXWSDV8zwcno8SySLEjG9XzxWgvJzOlnDuD/mR96XnYiv/B9QMAkiixguVoqC3LnMtF4t+7hon50tra8Q9KXlHYZOtkMkAl9i3aHFqeWLWLdIU2LsEO7nZc5cMgBeK1A/lvS8UcRo4G4raso5tT5TrKkuiDfNoAnpx5EAXn61aqq67RbZCN8Gswl5Da2SxDyr2xug+GzeB7CfST+uuFv3Zwy7leL4z54TDlgeGUD5iLaYSbioRxU98g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGnbdLqP8bk2cqKGU4VlwgjIwlKbgoL4CvX5JGhB6Yk=;
 b=FBJSn2dNXetkQq5xv1RykcOKYnHJprBNCJZGR5Wr5w2pJ+86ZVX4vq7Vjs0DVurWkgCYmEQ1tWOkBdaE8HBhSACdRF1iXK/FafjhRx1zLb51AkfbM1f4e7739NzdIZgviNt2ggKFDDjc3mKrByf25LeVZVa2uVF7JhsB4edMm2MKJjZhuk5BwteyiCfuCrdwvXACwYnBU58DJSk+W/5WUZm62XqvmS2wrj9GGepB/NnhY61fJhWgCaffuNEXHTeA0ZFrtlTOFhg1jAckhqvV//DRDm+qJRReMu8k2g4lCqgF12/B6Rtd99s0tO3lcHRWaqE7EaFPaV35FmGq6r+KNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGnbdLqP8bk2cqKGU4VlwgjIwlKbgoL4CvX5JGhB6Yk=;
 b=TZgCPM85FBPxEvuupL6lWZC4BCI3RVE49bRCOMLrVDoWSxSooOkxV8AjtPBRbE/dkwRCaGC/hGgd783a3e5f6qGRxdh0vY8Kt8Ye114fTB+ggxzytpOJqn1/LD5aQZsMdNIa087GiXnpIQMd7GvcdqqeJtLIqoRZ7EdJhXrb5Lzo6gDZu4xS3pQgDiXroY0Ifckpr71k7z/DVdvKWMZWkEG2Yj5zezOkTZM9Gdk57pXZb1hJ2h60Obexjm+0tyPKg3wuODDxh9lSq7z/U76nDX2ElViLniON1MqxPa7fUzW9WB08EvVTORjHylyFcT/MRYpSaC9x9cacfLjmxRCdjg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB2040.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 01:22:40 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 01:22:40 +0000
Message-ID: <MA0P287MB28225D1113B42EE5C80B27AAFE862@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 Aug 2024 09:22:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
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
 <IA1PR20MB4953936E4916334E1A234962BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953936E4916334E1A234962BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [6jq9R3Ao730EtpC99+kBCEJhs+7JrI+c]
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <76b9f6a2-e36f-48b2-a94f-2445abc0b901@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB2040:EE_
X-MS-Office365-Filtering-Correlation-Id: 372e9400-9756-451c-91f6-08dcbb366b66
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|15080799003|8060799006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: Q+NdYm1ymozKAh3XcRlAqDn27PzGwVxGH4Bbryy34nmeuPhUWxk9B2LaGKsrKuOWDffUythMQtuWca1LYbypiPTJRu/pv0ysmEznZEnjtr6BxnKr1jRmdb5USCTUSIt+XDDBZv18vENLymdQ8kvhRx2ppIaEoOwvJFUA1syp5KEbo8KFxehESv5jx7QKujE5dhkgir+CWABB5BPDDQzXzo4z6jVATdKad5UZbuoYIgwhHGKmtp8WSLPCXOKRxQrr0M37iwyI1Def6AeE/kksbcDpJoO6C3OWYsKbkEv+UMr2Xr/ag0AmZu9Jiu4k5GUWMBcn9XphLNGXdGFfHL0XvkqS+PRvZVzcDYqzhO4+T2N5AtXR5eh1Jhb7xjykP+BzxPoTm8nWMI7e4Ryg17gHfz05c062UpKtgv6mcrmQo+fnpVHF5c8sAhFEDhcnWjlODqspK/OmWIEoy9LOcq8Cev6zWfT+bHDJCBcNiTgas/dxOmlrJPp5kVZFH4Tly8S9PsK5Fu2XTuX8Msi8KERmj/yhm3tA/xBgwl79CtMA7LY1zzELZcgsv84cbCWD10vOhyRmtYNP3htYVyfI3Byj3R3ERGAz4sIeKvnVGLAfiq4twJXPz7mIJaUVJ/HK4YmkOi5QK8h4iDMyo2WOKHUUJp6v83guLeOnJpIPivk75Sxw6bmMxS8mnuWHbfGaT6cUJJpYSGLAw1Rw8AMSmOjsig==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUNlTTdqM2RkQTlCTFhQMnFyNGxHWFVMV3B0U05idGN5UTYxOTROc2pnTGY0?=
 =?utf-8?B?QVhrc3ZPNXYwMHQrUysrSUJncjVuRng4eTl2S1hSNGdZUHczV05UUTB5aG9K?=
 =?utf-8?B?MTdjTEptbzNId3JSWXdTOVpCQWNaZFV3RWpZY1BLOVNoSXNLc2h5ZTFOZVR5?=
 =?utf-8?B?bWNqclNXYzlXUVlaZFFPVmRNVUtMY1AvbFlJUHIwM0dhN1RTYjFZV3hvUWxm?=
 =?utf-8?B?Q1U3MkpyYlpyRUY0S3BxbHFVV2x4RStEelJqSXdiMmZYbEVHcWNpTkt4OFFS?=
 =?utf-8?B?SHR3eWpIT3h1UUJ3TU02UGtoY0lHYnR0d0I5bGZRQTRYZmNOT3FaVExCeHRj?=
 =?utf-8?B?RktQMllocjRBRmZNcUNURWJQL2xxZ3lleUNSd2RrTm05aTdwMlF2UW1RWGpr?=
 =?utf-8?B?aldqVGdwOGRra2pEbHZhVGJSVWhYVExMNmtYUXc4K1RWUjNZWTVZa3Q5WnRu?=
 =?utf-8?B?ZXBaaWZ2RWJEc3NxVXlER2MrNlhJYUQxdVBndG1LR2dVT2gzbHRzUzZtbi8z?=
 =?utf-8?B?OFlJNGwyYUViL1hkVnl4VDFRSkRzcEkvdFVpYm9wT0lsWmExeFcrYitpSVpy?=
 =?utf-8?B?Y1llZWRrNHp6MVl2dTdxN0U2UWh3ZmdQR0NlbDZINHdBSDVrQy9rVGEybXpY?=
 =?utf-8?B?S2d0d3pwZ0ZpRktQNk5TWHo3akRCN2ZjMnJsaU5qb1RiYXNkLzNWYW5wWDNU?=
 =?utf-8?B?V3Z5RjFvVkNGZlFvdEVHWXdRSHRjdnZWMHJBSnZJOGFRUUpKeEZnKzV5ZStY?=
 =?utf-8?B?UjlWcTV0UGhJYThzbEJsZzU4aDJkUkJpbnY1RiswMzdESk4wY21qZ1YxWjN3?=
 =?utf-8?B?alU1b0F0NmVEWHY4Vzk2dC9ybWUyNUxPN0hGWEpvdmxSa3JJcTBTR1crZmFG?=
 =?utf-8?B?cUpaOWJHZXc3NWYrRG9oMVloNHJrbHliczdmYmJScFVZcHpKYng5dG1UZjVY?=
 =?utf-8?B?ckhTQmVvMERWbjI4SmJnODl1TVZmbEtYSUNwYUFqSmVzMnRJZ1FGQ0xKRzds?=
 =?utf-8?B?V1BMNDd3NVg1cklzaUZRdkpzTkdFdVlOSlpMU3VFbDd2Q21nN0F5R1RrRWxM?=
 =?utf-8?B?cm9XWUIzeXJ5Mjl5STgxU3dwUnlRWlZiTFNHaG5zT1BsemJvY05XaU8rM1Mx?=
 =?utf-8?B?RDYxNjkxNHRGYTFML1dzR3hWcytjcFdOSXdoOEo1K0J2YXFNekVjQUFlQzBR?=
 =?utf-8?B?YjJ6NG1aU0thL0FlaGVqUG9SeS9SdVdYa2lENTVOSkIvTHRFbHE1UGtMekxC?=
 =?utf-8?B?MGJoaVQybUQyaGF1N1BMTllGN0xiMGZSVmdaQWpPT2dPclBpbFR6WWVIODZw?=
 =?utf-8?B?OFpoZmRSb2pKN2Z4V0lsS1J5N0JhNnhDZkw3dVBQYjFmYjMweFBndGV1SkxU?=
 =?utf-8?B?QXZkankvVEF4T1dTbDJJZlFtcytMbnN0RzZiTjdXc2xNSE9paUk4UXRFb3lO?=
 =?utf-8?B?LzY0b3NIeGVMb25nbDFMVHRMUXhieGVyTmNVak9MZGZyL0crWlNyQzlBaVc5?=
 =?utf-8?B?am1iRytsYjlSRXJxcDFvYnFJNTUwVEJhTzlMTE1JZ3R5UTlQZm9Vcjg2ejd0?=
 =?utf-8?B?cTNrMEt0WEs4aW5vWWNmYzgvU3Qyd3Rlc2JQNlo5ZmloU2YrWUZrSUd3SDlJ?=
 =?utf-8?B?THVETzNRb2N3UDJXd2FMMWNhUkdIdXVSNFNvTVJMTCtGQkRINzVOUHVKRXBY?=
 =?utf-8?Q?paD4ntbFakUSxs/rVPm2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372e9400-9756-451c-91f6-08dcbb366b66
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 01:22:40.1518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_182301_808870_9E0C4BC5 
X-CRM114-Status: UNSURE (   8.31  )
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


On 2024/8/10 16:03, Inochi Amaoto wrote:
> SG2042 use an external MCU to provide basic hardware information
> and thermal sensors.
>
> Add driver support for the onboard MCU of SG2042.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Tested-by: Chen Wang <unicorn_wang@outlook.com>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

> ---
>   Documentation/hwmon/index.rst      |   1 +
>   Documentation/hwmon/sg2042-mcu.rst |  77 ++++++
>   drivers/hwmon/Kconfig              |  11 +
>   drivers/hwmon/Makefile             |   1 +
>   drivers/hwmon/sg2042-mcu.c         | 388 +++++++++++++++++++++++++++++
>   5 files changed, 478 insertions(+)
>   create mode 100644 Documentation/hwmon/sg2042-mcu.rst
>   create mode 100644 drivers/hwmon/sg2042-mcu.c

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
