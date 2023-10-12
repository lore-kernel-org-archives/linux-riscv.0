Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A805FCDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEEa6/+mVw8xuPlMtMnpJOOrXRArwlUKIncafsFCyh8=; b=ikkqI9mzJS5NvhN81Udl9fxScN
	bqsEgDAFKKSLugPOXV5Cwm0DYpJDDVArpHAsexZXYWxqqX8ObCddi04XVFIkCt06BKUbvigwdhcgK
	E7VYnE4Mj9zcbYJ4I9htMABPNX3pCPGnBBn6Qs4EZFCnevf6HpzxgNAjAbmx+5dLm/iTF1wekLP7J
	S8gbKNEcybJvrDAyEaWY4iqcGXLLLx42GQQN1zT++lxlxDpumFjZssK3b9cR7dLRnetiA2lHNY3Du
	343MrHxT3CBVE02paLSulEf4DcqFDCLicxn4OApFan+Wz/J1N9yvh2+OCAxjn6jfqFpiQdQPpgw1M
	da/miLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvL5-001224-1K;
	Thu, 12 Oct 2023 13:02:55 +0000
Received: from mail-bmxind01olkn20816.outbound.protection.outlook.com ([2a01:111:f403:7011::816] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvL3-00120H-0D
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:02:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtBaE8I7qvr522PNvjX4TN9bkdMb6ZoNaT8Ty76Mv2aB4FIens0rM9ycAh28Xm6gradgfS0Y6LuIIIuN4L3ctc0/kWIjrZgEkoau6ThKUpdlYV/9KHGGD0BeWj1oFcKi5hh+LBQ8tJ9VzuoMQEKXcGiw0/TRIGzzR7uOiyg+ckt7VrZxGcyGdlVasqyu8J12lUYAJa5eb1avBBSvD4yMPEXTPqsQvrNUBBTgWMdiJmb+py3f1w5XJtXfY1f+x6jspWdo93dMnbf59Z4FpZz89SQqwKrzs8dEwVxXDj1cyCSVrApLrrs6VjIJanZyzeji/rkbp5BpyH9DatdMMQD0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdR8OOgjfSrWKnNOIwiUyBSk+hRoDflMAKMTAG6db2U=;
 b=P9E9gMnUC3Y7ydHeBcIPkLUAEYUVbje3ujpo7PWKZB88Ewd7MwpBlXE8l7vqX91FQI5I5O+YBhIqQ5fO/7qY5xO6B0Ze5tkXPtYEV59hdI1qrlrE+xJ0jM0tds7a9OSsHfNmpl911XEBbXE4eZ89hXIWSDbqUWk8ffY7AvTMzoUqgfrc0E1VmdbOCUw/9Xpo3pSd52P0Qq8HiHV6820jbHB6tEMeZ+JGucvSBcFcOymQHy/bRsj97NN6cXUlCd/BWG73Wjun+OUv5QUzTAHLyAaj4Ti42Vd2CaxKqqI0c3YlOJkiDquY9QQdm90chw/Ax2SefvEZanG9MZ00bohKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdR8OOgjfSrWKnNOIwiUyBSk+hRoDflMAKMTAG6db2U=;
 b=lEWWWucabvySnpZwMZYJeVgirxDPZogDr+PUVZEibJOy4CmyoVD/bJf8DuDgA4vlReIrX7x+5CV0+h+jhls0kIPkpwvFJesu42Ou1AmkHQDlPbwpZx4En4T2C+cywCzxL7nhIU0UlmCNZmcfNedxAWI48/2okq2gS3GQDPo4NmwaALTFxvouYg6bMyCy5jY5i7CeIfBb0u6vnRgc74ScaM1CCz7p9km/3wqq3m/XP7Kql1PtBLv6xkigkmIEEDGLFojxs6/qQpAlxk1FUVcLkqlxrTyTmROVBR5lg69Rn6vu1vwyzmA1UQKcQWF7kj3SjmGlGeWdEZefh+JZMQq7xg==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN0P287MB2118.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Thu, 12 Oct 2023 13:02:43 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 13:02:43 +0000
Message-ID: <MA0P287MB03320299025354EDE2DCCA1BFED3A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 12 Oct 2023 21:02:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] riscv: dts: sophgo: add initial CV1812H SoC device
 tree
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Chao Wei <chao.wei@sophgo.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <MA0P287MB03321A9E3F3D8415DB9552B5FECDA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <IA1PR20MB4953AD81686694CEA4F5FC6ABBCDA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231012-gratuity-siesta-b9e06b11be43@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231012-gratuity-siesta-b9e06b11be43@spud>
X-TMN: [VN4WXanCWM6w4iNn6ed5vhpYZPfqbDXn]
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <53d93677-85ce-4bcd-b543-3447ecb77681@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN0P287MB2118:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b62fadf-feea-45fd-7f56-08dbcb23859c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TpyuIRQcFlXplqDrYJsdASfsLgv3DirPEmIJUwsImsP8jHWjiYzDIFqfo3VEhtup5Mx/OilmgGt2O6K9VGi6gDbeyRvg+0kolp4pbn2rWpxTBV3PcPqHHsiuRtx+7nrLKgaDDlUs3NqGxlmy8pJ6762k+V/RdIMtWDhWQ82cSHtnfJouDH+ErO8YhogwVPEuOvNXsmw7Va7IJaXKq63/XHuykVTvKZDHeimPC/yKY+I4Fm3cHuvokx2dbtfJAiAkqqIwsJtQaY9DfZydipidBUvrm9ZkcMjNbcLrkHbukGMbVBuZbtSFdzHCnJS60/0L7juzMP+CW9cYhnMIjSxjnlIDEbEYVu87KYWusKZUMn0A6FmuHyl2imva+Mt8SaLRPkDiUBH9ltdUWh0QxrHu/jgcRzGpHjNEueeGXGDb9cl081/hxWGpiZDxFYpuvvxfMb4ZfBeMpHyT09V5sh2geKO++qb+lri/rg2Uc7gYOB1/dsyQRlMbBNsSohEcbEPceR6OjixubKYil4TjL3PLql31dPumKby7gg6LcJjjv1D7WeC3bowyjz7pDfnD/lFf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czNwSGJYbnNvSXB0NWJwTC9nREVGcW0rVHh0MkhROUtNdk8xQ2R1RzBkeEtL?=
 =?utf-8?B?WFRKNGZaOHZVRWdtc242ekxKR082cE44dnZxUGpZdWh6bWlpblc5c1N5bUZH?=
 =?utf-8?B?S3J3QVV4QzByUS9TcldQVHhiQkkzbzB3UmdWYzFFTUwrZWJEZWt4L3hMSWhJ?=
 =?utf-8?B?b0FSZnVveWlHemtsVXVPelU0VDM3bVVRWCtBRmNMaVBxUWx3Q1Iwa0tEcHNT?=
 =?utf-8?B?UEN0Q2F5MC85ckZqY3FtcTZuWCt1N3h4V1l4ellobHRHL2R2QWNsaGxPcGx6?=
 =?utf-8?B?UGowRjkzcTllWTQvc1VMNkdad25mK0FtOHZpbk1vTi83N1hKSGZiVUxlME5U?=
 =?utf-8?B?by8zaWZJZXhDZXR0SG1xSitmR2tBYVZTUEFKT0MwaWxkd3ZDcUNGN0N2RHZV?=
 =?utf-8?B?UVBqNnJJd2o0ZG1GM3NMei92cjk1aUFCZTZtTzROdFpZeTBYQy8zWklCZlpi?=
 =?utf-8?B?R3BlYU9oOWNMeStmWGs5OTBjUlU2eGJmYjlPYkxVVzhaK210R3hsT2NoQ2dJ?=
 =?utf-8?B?UW5uU281Ulg4a21TUzBjVzNlTnNwaEpZUytFSVR4TENxSStLcEVyajZQMmN1?=
 =?utf-8?B?QTdrSndJTUVoV0NtcllwK21oOTVKcVdJSWFtU1Y2NnRPc3RGbFk4dHJCRDQ1?=
 =?utf-8?B?czBSeG5xekFmdU51eU4zd2hLTmFuQzg3ZVpzY01rTTVJeWdJcW1JcFphWXlx?=
 =?utf-8?B?Z2xpY3VxWkhONnR5MDdtNkk3RkFWVCtmOW9kVzk4NXNUM0FUaDFOK3dlSGhY?=
 =?utf-8?B?VTZFRlQySWw1bVN3ektWa2dtRmwzd2NtTGthL0RVUGhSZUt4RWYxNkdtU05h?=
 =?utf-8?B?RlNmK0RJMk40QXBnR3RGclNqUlNwSnlVN3N0MGlkajNLTUhCV2xQN2lZckI1?=
 =?utf-8?B?OTl6MThpVFBFUFY5Y2xVOEYwNVJWR2pFQkN6NWFWcHIyQ0RZdWpUNzZ2WnpR?=
 =?utf-8?B?RVVnakV6TVc2UUFLT1FoYnVaUXJnYW0rSTAvZ2FMcmVDZlVoRVRsWlRhNERM?=
 =?utf-8?B?YUhpY0w0cG0xZzlkcFlHbWRGR1N5UEdrK1pjaDNVT2d4am04NDFkZXVaWm00?=
 =?utf-8?B?ZmE1Vzc3aG1rYlRoRXF1dk5UVXFxWUZEOE4yTUdFMXd0WjdBeWo0M2tyM0xi?=
 =?utf-8?B?T054Zkl6ZExCTnMvNnJGQ2NESWorbGJvRFlzbE1rbzE2NkF2cEl0UVhCbENw?=
 =?utf-8?B?bHRocW1QVGVKWERGM3V3ejhBN05kbVZaSmQvaFdvTVdOMDNGdDFIMkFIWmI2?=
 =?utf-8?B?K0ZGcUYvNVpzcmNyeHh4aFQ1azdma2w4RlZCMm9CSElKckloVDRpZk1HSjg2?=
 =?utf-8?B?enZ6TWkzQ3FFOFdmUmZDa09QSE5vVDNFQThzQnRGaVcybkR6azVpOUNpaDNQ?=
 =?utf-8?B?QnJFUkg4ZlFmajlMcHFtNXZBQUNydyt0b0lSMGRsSm9DTUpmdXNZenZFSy80?=
 =?utf-8?B?Z2YwY2kzamtYU0ZGTWZTVldyZ2RGZW9zWVBKcmtpbUNUc0ZIVUFYcXYyaVc5?=
 =?utf-8?B?Rkg5QVpoTElqQXBRRDlXZk9yMVBvVDl5V2VWS2lPaHYzdDJ5TXh3Wk93clNK?=
 =?utf-8?B?ZEdEQWVqU0VuVjNHSWlvaWFUbzh5N3FXNXcrZzIyc1c3Uk9jMGlLUFhZWkFX?=
 =?utf-8?Q?pIWVVxzJbPGlYlz0dx5sGXi++9isriIieps5wmLSRybY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b62fadf-feea-45fd-7f56-08dbcb23859c
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 13:02:43.8887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_060253_133090_BA698FB0 
X-CRM114-Status: GOOD (  12.71  )
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


On 2023/10/12 17:41, Conor Dooley wrote:
> On Tue, Oct 10, 2023 at 03:53:54PM +0800, Inochi Amaoto wrote:
>>> On 2023/10/9 19:26, Inochi Amaoto wrote:
>>>> Add initial device tree for the CV1812H RISC-V SoC by SOPHGO.
>>>>
>>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>>> ---
>>>>    arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 36 +++++++++++++++++++++++++
>>>>    1 file changed, 36 insertions(+)
>>>>    create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>>>>
>>>> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>>>> new file mode 100644
>>>> index 000000000000..3864d34b0100
>>>> --- /dev/null
>>>> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
>>>> @@ -0,0 +1,36 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>>>> +/*
>>>> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/irq.h>
>>> This include is not required.
>> Thx.
> I can drop this include on application. Is the rest of the series okay
> with you Chen Wang?
>
> Thanks,
> Conor.

Yes, just remove this include and the others are all

Acked-by: Chen Wang <unicorn_wang@outlook.com>

I also ran dtbs check with W=1 and no warning found.

BTW, due to this patchset changes some code submitted by Jisheng, I have 
sent email to him and hope he to have a look too.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
