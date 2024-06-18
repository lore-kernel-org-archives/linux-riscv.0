Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5365FC27C79
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 00:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgvP1go9EvFXItyPaS7aZXxUaW8Z3+aI1OhZjf//uKw=; b=HgucFQbmwbus/6PvSwmiUii3dj
	mRupxD0Vh+pkwsuzbw4C9AJFVBd2inVHMJVdFFwpXmOUqKoWtf4ToBuKAACJFsGGYtUtTpvaIdM7F
	MrK3f9DxY3DjqOYPSJzfzNC1BRqNQV8/ns2HappSzI9ZETvkPsy8eeCVA/5o+F/nvjIyf9GyBKhE+
	FKhTle8SmK8U6jAfcEPQRckJptEbC8vfcNc+ISdcs2un5tqMxUiI4R7HZckUBXSDsC1Ahc6Gkb9mg
	WBXLByUN2LJUxa8z7ynEXFMysK2KyPHCEPVjJ96iw+iaEpefg6geab+kGlZZIHbM4YN6v/3zOAatJ
	NdvPLJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJMU6-0000000D1ud-1IoM;
	Tue, 18 Jun 2024 00:14:02 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJMU3-0000000D1rp-1J68
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 00:14:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMRb+GuzWnupIE55kzX6dmbqv3kFRhfBzkQV5H/qEqcWaOwwdth5tmMqv7LtI4hieO6dCjGF0aGw/B1H5xczY1FyL7ZbdZXO3aLBnQC79azSamtaCg/rDc+dgxRm0ls3QU+T7PWbIA19c7yWAxmeIfgmnWr8/guIODozbnhoPFMCY7Vj9XYULH1GLTDahm+nCjjSEa8Ty7tgh5X26zCVvdH4rWq5PcKKhLGp5IHUb5UyTF9DDpU+oUI2+7q9XE25BhLZy5yg6vAoh5Kzlx5v28OjnY7ThRdu8TDPrR4DskuHCLUOwm6CbEOcTTvzLY3E0PQ/2oIk58i2qDTLH7vj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXY0EiiByqqNQW+6jzWa14wKBtovxXGGC81pCbYyQHc=;
 b=ii142efa/z7uLLcwuKF/0uTMNk0BS+ct+sKyTeTZa/ElaQ8MMydoe74NP08AEvooWeex+yDQ+0+9I6bEgwXBKGfx0NXlwVxoreIGHwE79g5n3/r4DowlDps/rrgVCQK4+XJtSeZ6eFGuGzRBzfN+kuomvNBTCpkktjlcLZZNWogomwys9JYIqYTvnkNCMo7O1kDnbCtseMifnva5LpUaXsEUHznBZTj6fgA+uU8kETsMDoAhFbZCLjXL5OE+SwbzANgbC7uLjOjvijR92e/2sWXTYbl2Xq2X1vvOS7aEzSCg4O4YtuFOz6qkFPClowcNIgFNKAlkOwy9YPKeCRTXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXY0EiiByqqNQW+6jzWa14wKBtovxXGGC81pCbYyQHc=;
 b=Ck2B2DE4NXjn7hzqLnVkBgGpdbnisqEP4JVaNANuQv7OYscMvQ+Tj4e4hIjwhiOWQ/6JVdq/+rQztLMsJQ4USULByxNEeiGsSH898RXpatOIK1FvxFENgBeDOULlLrhQtFEM/5woTZtqRYlUulHOyoAp3rbpwnAIg0Bsrg3wTRQ+MLnRahFDn1J7Ixa6xFYDn+jNSmuZT9G4+VFk7/oCFbkpHOFKxAvElMmuYb/H2qi0xGjjWTd/wTwJmz5MzxzQh19NE/Qn3aDpOMf75iqeGipILQwLbyl3hGDtwjo0lxFASCjfZprwMj/21r6KSlPVqF2SgXzzqNVn2sqPU2FRPQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0152.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 00:13:49 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:13:49 +0000
Message-ID: <MA0P287MB28222A1F4865530F5F2E56C4FECE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 18 Jun 2024 08:13:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] mmc: sdhci-of-dwcmshc: adjust positions of helper
 routines
To: Adrian Hunter <adrian.hunter@intel.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
References: <cover.1718241495.git.unicorn_wang@outlook.com>
 <dec4798dc2728428e7468515cbf0bc87c6eff4a9.1718241495.git.unicorn_wang@outlook.com>
 <6122ec89-1984-4dd7-8af6-50e2861f04d8@intel.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <6122ec89-1984-4dd7-8af6-50e2861f04d8@intel.com>
X-TMN: [yUpnkcvhMew22Bx4jWr6+aPpD7D2Ouy6]
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <7b8ba102-86b7-4e87-b81c-7037ad6305f8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0152:EE_
X-MS-Office365-Filtering-Correlation-Id: ded33381-c323-4eb0-1771-08dc8f2b86f6
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|440099025|3412199022;
X-Microsoft-Antispam-Message-Info: C5aVusCsDE7OsW7WcLxZiuK0hk45sFFVb3NHukviK48whKqoS9quHRs6kuYX251w8pIIw+AK4t0Y6oRzfvsv8PWAkPbJm07myWsk2kY4JVhzyRQ2D7pc0CLYCVT/NnsXs8RQaGYp3bSsD8XNfcvedVwl9OxhXyzxC9zwiMJXg7cGHRzFiN7sy1oRRvfSDoaccmLeYIjLGkPWlJpvyM/tV46g+AiJ57e8ExDgYhW85Ao/cVSoF54krvIvr+vHqns1FaMLwDYGPfIp2UmDrTF2OvCK2JpM3CGSvReaBUzC4B2c6PZiSfUqCove7GLigpu0nc5WiK8LjwwfzS8uHjfEmpMKG2Cq3Hd8oPs9cyS0D0vIX3mGAvNNCAoM8ijCYLlirYzWUCGnTMWZFnzMdZFhYPP9om3ZRoG2i2zXFsdf4USl+mZ3Zsmh2GgNRkAmdVjUPqGJF7bjpzG8CuvD/TdDxXl8VRFly0GjyK6I7xtw4F2IzjkOBaUjIgnydqe+HaTY9jO3MN5+78B2KFWUPqvLxSTrg3Z34UWypr9AFFAzUv3c2VNkYUl7uMDgsQf+nXDe
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NE0vTkhGWG1qWEthSE1zVGhwRkZSekdYN1lIU1FaSjAwY21xbTZoaDlqMDlh?=
 =?utf-8?B?a1NzVnRYWGNvc0p4Mk5PbU1MSys4czg0MzQ5Y3FGbHhXbUZyR3V4N1lwd0Va?=
 =?utf-8?B?cDNKcFlWdldHY24zZzJuVnRNcWpIeWE5T1RJNlJScTR6Tld2S3FJNHFEWGM1?=
 =?utf-8?B?cnpHK1kyc3g1RCt2SDE4bXZzSWtwTUpSNVpscVUySlU5OHRUc0FhRFZTZUo5?=
 =?utf-8?B?UzliRERBMmFUWk5HWG02Z0lZUldvdkEwcjRGZmFVMEZONDRKY0NnUHByK1R6?=
 =?utf-8?B?aVphdlBoUXRYdnZaRHBkeUh2d0pLNUxFelQ2QmQyN1JPb3BxejlpVTAxYWU5?=
 =?utf-8?B?VGNKVFVDSVVmdWJ3Yy9ZaHdDVXFmQk9qdnNzZVp5bEJYbnU4M1JRYkdEQW9m?=
 =?utf-8?B?UjUrYmo3NTNOakdPQUNtUUxKSDAxeUllM1NXVGpwa29ydENIN21pbW5XMjVm?=
 =?utf-8?B?Mk5LcHNFd2xvM3ZLVE85ekc0SHpGS2wyNWwvTXd1UmZ1ODJJZk93TkJKbTlC?=
 =?utf-8?B?WnkwR1FGVjNQRjJNTkVoTXlVSmZnbm45b3AwVGlBQ2VBQkxZcHZPSjQwZTVr?=
 =?utf-8?B?NnpXUEFVMCtkSlFQZy9GVHFKMHN3bW5ua1pzU1BKbk9lRHh0SjRsbEpLUzl5?=
 =?utf-8?B?b0VNWllKL2pmYTBIRVZDN1JHOTNwWWNnNExRY3N6R2Z6dmlOaDdtdUR1MGZQ?=
 =?utf-8?B?SmtzTE02TzhpMTRiYjVwOFdiejkvTlJ2azdjdTNpdjBsdDk3RStKc0c3Vm90?=
 =?utf-8?B?V3l4VTdxV2c1cDJnL2FXZUR4b2VhRm9rU2d0bHphaVJ3L3ZxTUZSbXBrUHov?=
 =?utf-8?B?RVJUTlZVTjRuVWlCczQzaE1OWVQ3ZFRab1pueWY5d1dSUGk2ZFc2eTBtMERQ?=
 =?utf-8?B?VVdscWE0WVZXQWd0djE3dE9Ybjk5SWtTV0lIMUx5eCtTK1g5SHMxaTNXT1VT?=
 =?utf-8?B?WnBWNy9SdWdvRVRCZmVNdDRleGNIRVE5ZFN1M2JSUzBmUE9qTk9obStlZlRU?=
 =?utf-8?B?V1dFQVdIamVidEszcExGVHhlWFlUZ2FzODZFM3ErWk4rSmViaUZpQzlURGZq?=
 =?utf-8?B?YjZ2TzNWYjJ1L0Q4MUlUamtKQ2M4ckt0Y1RXTUxkemJtZXpmdlQ4OGowQ2xz?=
 =?utf-8?B?cUNWaEp4NHI3VUtldlR3V3cvL1RFT0J2YTFsekxvQXpoVzhPNmFGdG1jcFNh?=
 =?utf-8?B?WUJ5bFlpYk1VT2tleFIxL0U5ZnVGNnBoR09HMlBCR1REY0ZDTTY2NlJGZnJX?=
 =?utf-8?B?cjNWT1hsVGNtamJ3OFpZNjlIYmFRY1lvK1ZNYytiYWtxVHV5aUk2a2drS2lK?=
 =?utf-8?B?S0M2c0o0TFNrekN0WjN3UFh4VDNPTDF2VnorTk1pSFgrelJGS3dabmR2ZVpy?=
 =?utf-8?B?dmUyTk1xYi9vSVpYSHY0azRVajMxbHE5aTkrUFJHakNIeEJFY05WUGpCRDdn?=
 =?utf-8?B?NUxpQ2pOVlM0RVNDMkNrdFl5ajg4dUZSM2p4L0VNeFhpR0xjZ2dpd09la2Ux?=
 =?utf-8?B?UVo2NGhuZ3lNRnFLMDRJQzl2QlMwbW9xSUdxaU5Rdm1iQzVOR2ZrelRPWVpl?=
 =?utf-8?B?aEtyUTFQcThpV1pneitZMkdKSHRBMFJ3cldmQmxwdENaVlJYTG5JOGhtYWtJ?=
 =?utf-8?B?VXkwOUV3QnlLcGhuTk9mVnNNYUtMeE4wbXk4Mlp1RDJMY0pVY2N1SEFuenI3?=
 =?utf-8?Q?d1Zv9ZflfAxWgERYo45M?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded33381-c323-4eb0-1771-08dc8f2b86f6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:13:49.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_171359_423875_204E5F2D 
X-CRM114-Status: UNSURE (   9.35  )
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


On 2024/6/14 18:16, Adrian Hunter wrote:
> On 13/06/24 04:42, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> This patch does not change the logic of the code, but only adjusts
>> the positions of some helper functions in the file according to
>> categories to facilitate future function search and maintenance.
>>
>> Category: helper functions (except for driver callback functions
>> such as probe/remove/suspend/resume) are divided into two categories:
>>
>> - dwcmshc level helpers
>> - soc level helpers
>>
>> After the adjustment, these functions will be put together according
>> to category.
> Please do not move any functions unless it is needed to avoid forward
> declaration.
>
> Unnecessarily churning the code makes backports more difficult and
> complicates the code history, so it should be avoided in general.

Accepted.

[......]



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
