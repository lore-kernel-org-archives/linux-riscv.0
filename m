Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DB7C3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 01:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPk6M6JfzAZ+7Q0ZiB8NL7b3ffIzjq80A0M4tInApps=; b=iF9D9ZE73f0VoX9Aq6crUnixVn
	FhigtlUVPiVJvFPJ4xa6fiFe5TzV8fD/LV2oVrDLu9RC25XPb2kaA5VNzvxU0/sD5yPnnwAQmOCN2
	gbPt4k4I+NFsLo++xtSjhwytR6Fv467q8DrK8cT8HW51Nn/h5kU6yrLPTiI+Dmf+soWu5hAmkpt4h
	lQt2Q9FXVvMMM07zBgP3NjXDcqJ2FwHrwt8N9zE9UuA9L8BEKkMrlDXYMt8XQkn6ZRx7K2ryrMDKm
	pNzEbWuq1W3NOKXrMQ+cQEOGsrvN9aOWomrkeCLEG0AKhXNX22+1zAQnnOUbfJgrlfiALFfnNcP6v
	v9R0qjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgHL-00000001ybt-1aOX;
	Tue, 13 Aug 2024 01:24:51 +0000
Received: from mail-bmxind01olkn20808.outbound.protection.outlook.com ([2a01:111:f403:281c::808] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdgHI-00000001yb8-3mgy
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 01:24:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yde0QwGR37lEgiX8p2go4X8FsvZ2gouyUvZdwT2tv8jj05feSVHGqWWZKu4oX8uJ05/Hu3UPQzPzZX55EdrNHCopndS+8qcVY7lcunKOJ6yUpO0KFvlN3wXm9NzT/YAZZ0ZKsoUhJ7tQoQSIksCH1SfI2+kb5a59fAf2AN7m5QbC/HS9aUjSGOUyxC/HC1xAlvN7xX3jqi1FJNyws510kFW0qjcKDxXKDYshtlEhf9p6gtju8NFU3G+06ouZHUUishVEPag/KMUF3Jn9TqIpK4XoH+m0p9XtugSiJvZfEKMVgqg2fhMXlSYAB49R9UAlA9uiWYuIoalsGY736SoPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=723lOPQPJySS7SCFD8ENEMMvaoVySP3svWsooKdiYwk=;
 b=WRZ16OaFl/3ppJEYoL8ZhudPukwzDJy1oJTkNLfo9GPr7WT7q54Sl5tHYMHY+WjLZY4sS5QurnxHV0ISxjv9HBW6tkIaICE07+8uiePpEEDBheEbicaaTvKrA0DfTLegMlGs9aTGQ+b2+xNTppk29PzwV4Ekcd8FgVHirTRJKEcBsf55yV4y7IbeDM5V9r8NrVAEe82QDPexORsJ2cUWkgOGAg9TeNVXGdzgI41ScMJjj0G2zouffOtqKiG43T5qXzReoi3IAmdEFf35ck6AcnN/SRhCEmYuebOUpW6TquE1J755AqpmLB6vQzrmAv4m1mQZlT3fG0ihhQtnbvaRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=723lOPQPJySS7SCFD8ENEMMvaoVySP3svWsooKdiYwk=;
 b=j7aPn1Xy1ibisVIRKVj1+rn1oc03AGhyNBRnQ6WZ2+VCUHj+aYzeoWiYobF4xw1CkN8KS9MuS3QgXT5cywYdWu2QxtPyq1tgMVqdvjTk3sCMYAmoOTV3WMSxJwtSyErN/nKocngJ5sdtWEc1vqPhBG7phHliZP9/3UEn2dKifjAu+rbxnJftZveLZdrebYbl0necwG5Ma/gT3Gokwyx/JqqnGgtxmRVadXZj/VYlyeJ2nNcBRHX7+y/iQZIKIPldGTkYqPhRVUra/HMrDR5yzC+jupEUtSUjkX5rhCbnyAvBBel5qy5Zx3kFC38QZt+nX97EAY9cFIVGY8z3IIcjNw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB2040.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 01:24:37 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 01:24:37 +0000
Message-ID: <PN0P287MB283050511BECD88076E8252EFE862@PN0P287MB2830.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 Aug 2024 09:24:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/4] riscv: sophgo: Add SG2042 external hardware
 monitor support
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
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953C5DB4AC5DF01236CE785BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [MEnZ3+vf+SZDw9zo5DZ2oMUawvjMNna3]
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To PN0P287MB2830.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:204::14)
X-Microsoft-Original-Message-ID: <6f2d1f30-010d-44fb-9a41-65265d1d66f2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB2040:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c82138-1812-4153-b0a2-08dcbb36afaa
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|15080799003|8060799006|461199028|1602099012|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: 2KAaJzKdiXOin98S9IpaOa3TRQefHzqDkwEpVuvtFOs2OKbL+vgHYQtu6v0SCSH1jRnSR5L1to5ikse+zTobHCboIMMeJYfj7CJGhCrC3mpFo7okpyV4YnG2gaG94p8OOo5/pYqYD3o510GMFDXpzKYeFOaOQ7wu2WqPmgwGzJFwFLRA3XVxmmkiU3d8doLqXk0GLR+9EUgWKliMEJw/PTDj3+ERcvnjVS2dSCUMIdaZfkLyVECFg2aH8i1JjIbX6o/BHAkaCQQJqCW4YolMi+p/jLRXZwzQSqA4VLDsocjWu8U3L6ks8t+fvsrFmyLt+kzqau1LLV5ACq//nXWDBaujv9qCZr+Wk3UpuEdwt5a5El80r9LaYdwcQyO2lzmkFcStPz2qFwI+SUB+ABF2/wqMtWrjWi6JtZjg/h8i99WlUGk/snL9NqZ1M68+sNtDj5xdGM1E5SRrfwqL38R0c/HRcVUizTge5hB9ua2c+OuGDswdA72TiT3lw7LLQQo5BD3erCufmXVbq2jIaKlXYG8cBKcw+1QHhkTFM4W/qDPD5+21IZpGGyQegp9a3auAWv9gF+f8pJOQ1MUgK27yG1ofe8esqfqCG7HvLfkuIe6StFvi+T4UMLOlW1T6zdJbRiPE7gfN0Djm/7SSn2UPpuBgg1SuqEoxhO9ajGOOe4+xwZtKhpT8avWnpTP5erQULFpPFJ4Pq/ZqUQ6j59MBMPkVOA/QaGC9cBpFerd9uCnFrLLB/fMVTiw5YoZF3436kHXzjRNS6Jp2dFiTNskG1n6fx7rcwMzSnPMGfktqa9gYBveL5ZWQ9ivRoz2TxP/H
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVVxb2lXcUtDYjM4Rk5lUjUxa21Vczk3T1BIbXZZWUFvNm5pVUl3Y2l4UjJi?=
 =?utf-8?B?WFpVeWtZRnhoN0k3WHNGbmZxb3ZOQmFJWXFLMzByaEhRK1VCb0xUSFVOR1BF?=
 =?utf-8?B?aTJtckF4ZUtIMHBYZVplNGtCWWE5Mk5WemIxcXpNN3BnbTQvRUFZL2dvMGhk?=
 =?utf-8?B?YTFFcWVjTFlJUEFad2YzNTYzZUZyUjFNTCs4WWp4Slg5a2twVmgybmNFOWJk?=
 =?utf-8?B?Mmt5SENiT0VTZXRsajQ2T3Z5NWo4N3lYcEtKcXhvbVFBaFRRNStrZUxwbHM3?=
 =?utf-8?B?Qm1OVy9KMkRRc29KMHZnQjhudHFvaEtWUXBEZFJEOWk0Q3cyZGtyandnTm1G?=
 =?utf-8?B?STc1NEhXZDdsZXVvdVlJdXl4NURiWDUwRy9oSXlMbXk5SUsxZ3lRTU1YUW9t?=
 =?utf-8?B?VlhPaDZBeTk2aUp6ckpCYktmbWd5dVlGTGNobHM3ekpxQXhSOGsweU05TDlw?=
 =?utf-8?B?cGhHZUV6d0pYSnFOYS93WEFzV0VvVDdmdTNZOXRNZWtlR0U1RldnVElVUHNC?=
 =?utf-8?B?QXgxWWh4eU9zcDhmUVJ3WEdyTWpZQXJveEJkbjNkbjJMb1FjN2EyTFo5KzdX?=
 =?utf-8?B?K3NaVENrcGxldzJ0cU55VXdHQlgzZkdRakdLeGdvUk45Zm5vZ3JpSjRhTmNu?=
 =?utf-8?B?d3lmY0ZFaGFNSDRkeG9MM254cXBmc0hYdlBWcll3VWhsMjFCVmVGVmZoOEtG?=
 =?utf-8?B?eUpDTUFvck4zMEFWTk5aQjZZVUNqQXA5YWxLb0JXeU5UKzIwVWhqOGQzT29R?=
 =?utf-8?B?TnRkVXo1elJtd090V1hqeTBqSDk5QVdzaGJSRlA2QnBPekZHdXRSZG1GVUMy?=
 =?utf-8?B?RTRiM2FRb2VzUSt3MWkydzBaRW5hUjBvcVlybFhWblhrc1VNNTRreXAveHBV?=
 =?utf-8?B?UStZMk5tNnlINnZ1T2RpRE9aUnNNYnZ2MzA4MDluT0U0SVIrSC91eElRbDg4?=
 =?utf-8?B?NFNoRUZ0Q2ZSVkJWY3VOSmIwL3FnVy9OU3NxdzVXa2VzNmJWQnZHRmtXZ2xC?=
 =?utf-8?B?eWZmUzdTY0huNTd3VllGdERZOHJuWEVTLzA1Ky80TWZpN1I3bXh3ZG8rTFI0?=
 =?utf-8?B?YTZPUmNMNVhVUXpBR0hFemRvTnVKSi9MMzBYVmE4Uy9GN1RPOVlEd1VPTGtw?=
 =?utf-8?B?MVR2eW5xMWhHUzczNm9sZmxFYzBVU0RrWjhQNjBxOFFDb0RVUkMvSEVKTjlr?=
 =?utf-8?B?VTEycEw5ZHRiV3RzbEhtRXlvTmd3YXdXc1grT200VXVIZEtQWDRBRzVxcEVq?=
 =?utf-8?B?TXZOMHVhOXhOeFhvcDZOMHJHSE1zVUcwUWluazFPSE9OK0VPTzUwNlhRMEli?=
 =?utf-8?B?TzEvT2Z4eUo0QnVrSWd6K1J3R0owU21CTG9JUTZNWmpUYUV3ZTRxOXlmNGF3?=
 =?utf-8?B?YUF1emcrOFhPd0RPWTBOTU53NXNjVmFicW54b2NOdWVKRU5SQnloaEwxSlVk?=
 =?utf-8?B?c3pjQVRKNURpby9PcjVGQ2prV2RSdVhPTXRtRzhOWkkxUWZZVXRSTUVCUStH?=
 =?utf-8?B?SGxsMzcxQmFUUTBRZVE3UytRbjJQTWF6ai93c05FYVh2VWdHdkt2bW5DU242?=
 =?utf-8?B?bWFaejdXRzdhSVpvQTJWNjdxRHNPcU9Bdk9xMXVSNkdwTjc1QmhlcjhoQWdP?=
 =?utf-8?B?VWNLbzRHNnQ1cm9reWZYdFEyUjRIKzBwWnd3Nk1tUkxRWHRRTUZBNU9obTBk?=
 =?utf-8?Q?cRzHmdJJOVUL3M5ui58f?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c82138-1812-4153-b0a2-08dcbb36afaa
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2830.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 01:24:36.9703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_182448_983621_D1AF8F9F 
X-CRM114-Status: GOOD (  21.09  )
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
> Add support for the onboard hardware monitor for SG2042.
> Can be tested with OpenSBI v1.5.
>
> The patch require the following i2c patch:
> https://lore.kernel.org/all/IA1PR20MB4953DB82FB7D75BF8409FFF4BBB72@IA1PR20MB4953.namprd20.prod.outlook.com/
>
> Changed from v9:
> 1. remove missed wrong return value.
> 2. add documentation for the other interface of the driver.
> 3. rename repower_action to repower_policy.
> 4. use break to unify "return 0" in is_visible function.
>
> Changed from v8:
> 1. rename critical_action to repower_action, and add some comment
> 2. remove unnecessary wrap function
> 3. use guard macro to simplify mutex process.
>
> Changed from v7:
> 1. add mutex protected and fix the return value when writing
> "critical_action"
>
> Changed from v6:
> 1. restore the driver name to sg2042-mcu
> 2. remove unnecessary wrap function and check in the driver.
> 3. add dts and config entry.
>
> Changed from v5:
> 1. rename driver name to sgmcu as it will support more sophgo chip.
> 2. move some attr to debugfs.
> 3. add standard crit_hyst support
> 4. add documentation
>
> Changed from v4:
> 1. use fix patch for binding ref.
> 2. use unevaluatedProperties instead of additionalProperties for binding
>
> Changed from v3:
> 1. add thermal-sensor check.
> 2. change node type from syscon to hwmon
>
> Changed from v2:
> 1. fix bindings id path.
>
> Changed from v1:
> 1. Move patch from soc to hwmon.
> 2. Fix typo.
>
> Inochi Amaoto (4):
>    dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor
>      support
>    drivers: hwmon: sophgo: Add SG2042 external hardware monitor support
>    riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
>    riscv: defconfig: Enable MCU support for SG2042
>
>   .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        |  43 ++
>   Documentation/hwmon/index.rst                 |   1 +
>   Documentation/hwmon/sg2042-mcu.rst            |  77 ++++
>   .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  60 +++
>   arch/riscv/configs/defconfig                  |   1 +
>   drivers/hwmon/Kconfig                         |  11 +
>   drivers/hwmon/Makefile                        |   1 +
>   drivers/hwmon/sg2042-mcu.c                    | 388 ++++++++++++++++++
>   8 files changed, 582 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
>   create mode 100644 Documentation/hwmon/sg2042-mcu.rst
>   create mode 100644 drivers/hwmon/sg2042-mcu.c
>
>
> base-commit: d2d190621b60d77496d36659e1621b20c897b25d
> prerequisite-patch-id: 5e7221ed1c63bb4d68e4a2a0141440e32d29e397
In fact, I did not find these two commit ids on master or sophgo/for-next.
When testing, I applied this patchset based on the latest sophgo/for-next.
> --
> 2.46.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
