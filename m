Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B3FC54E49
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2024 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXJtw6yx04msl65Sy6tv+NT0mnvAMGLOIJP9jj/IOIw=; b=X6hD4ujX77ok0m17akK3eqnZBe
	LxGo9p+G56myRyrPNqfITiRax1ry08Us7tvgAbSRZlN25ebjvx64DY/C+Yf8YQHBiuABqNL0YAoQs
	TEWdI+F2qDHMKzpM7ZJypl1qVGXHmVRLVCUytGWMncI7KmMMmF8nsFC69m07UMnZt4gc0yLjI9+jX
	NEFQUF60PclFc+qM3nsfZYduAIT3qPWeMiRT5TX1hcPZysgf92SBxsKXgsO5nU/uyiftyuUgtyUis
	F4DMiffkkp1VZd6kyx+YwyTLuivSYnvQfSbUWU2QUhYGCP9pWx0AT5wtqkZr7yvqSwGAA21bvLXXP
	dfv9RnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rj86F-0000000EfFV-35kJ;
	Sun, 10 Mar 2024 01:35:39 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rj86C-0000000EfEO-3T5t
	for linux-riscv@lists.infradead.org;
	Sun, 10 Mar 2024 01:35:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KN27zZE3xxWnr9SdKHdctDAGWq9u6N2kksihw/Qz9bcAdRGJ5TcNvfG6bk7RpRO2VC9k2lOZLM3EIwunR/CeZNQEepb5vkSqtpYXHAou9m2J5ioRB2elb6MZxYDSkAzDWkX9AbZ6XAsMn6UGAfJ/V9ZpvBsi1sLRkodQ/4vzGxI/p6nXvz37VKiUIloo27hsO9EMvAd44eQbWEIVcvjGgnqkilZJo54fT2c5kWekJssfHjDIf+cl7+1kScR+KCWxusOSAmRZYVBWBteufw7j2DQeluGTXkygvK9v/pYaXyIk1+oCSpJKFnnapMQtfqyc6DbFgoT4QMmtw9Ssfpyu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbkvK4NCxTEvujL/Ww3GSNBs32AA4y1GV+rVBa9rYKQ=;
 b=O4aeExp/+yNZ8+PgAmkbfHthfka9FkjdygWEyUF+8WSTK3HMz+HIxQq6J99mR/CK5PoZMfNCg1nOa2oRXRFsr1pFo3Ljesw4AgGhyCWr6Z2xJchDCAIJ+cLxsEuoKXOuRpCSEyktmJVT1l6ffLYY32lE/IGPqcp2JB78HX6CJaEgzkebD8EmPEN2n3ufoFXD8pOtbddAakXz8IrfFMS431xhMPUDi+rtDB/hSvMM0BSChwpbOfPtKWpKlQ16N/CZ/zNE9YpJ+69NuDNvJJACWLYX5sYtUgD/kf/H3kt9flvEMtp0GNk2E14sflLUOvqDNH2gKmzE3eOTvP/jCRqfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbkvK4NCxTEvujL/Ww3GSNBs32AA4y1GV+rVBa9rYKQ=;
 b=rkxZMowOt8SlKLFXkk+/rYnXK1EgXiuOKj52JUNvVSdzvtNXe7q7siyBdoxKsxz//4Y49DnimI9Hsa6rhqTqRCaBjwaQv1GAVIpDm2gYREnqBCOhKjrpHqN9Gaevm8ztC8eYW9a09Msh1FJehrZWVWpfofNupnRxRyTa4oJ9qzNZ6aI6ho2mjyjMBxuhTpYVh5GybktTx3oHvTnAd0DHq9ZWl2QsLJsNLZzP9BB/iv47Ybyly69U1n4kp+q38ctR3YA80CwJESPwpjkC9mmsuJve+Jh3/yqcEdYe+tXlCqnN1b1VYkUAaBWhd769xaRv/IsZJfsWSJKcPY9Fw8555A==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB0223.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sun, 10 Mar
 2024 01:35:21 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::7397:fc50:6da4:7328]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::7397:fc50:6da4:7328%7]) with mapi id 15.20.7362.031; Sun, 10 Mar 2024
 01:35:21 +0000
Message-ID: <MA0P287MB2822D5C65CA0F90BCC8D2095FE252@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Sun, 10 Mar 2024 09:35:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] dt-bindings: clock: sophgo: add pll clocks for
 SG2042
To: Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com,
 xiaoguang.xing@sophgo.com
Cc: Rob Herring <robh@kernel.org>
References: <cover.1708397315.git.unicorn_wang@outlook.com>
 <92448a1ca9ad8f713dbdbf3453f1a5db0ca47d9b.1708397315.git.unicorn_wang@outlook.com>
 <d22eb9d0bfbaf12689a2d14d3c50e263.sboyd@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <d22eb9d0bfbaf12689a2d14d3c50e263.sboyd@kernel.org>
X-TMN: [kBF0qzm8I7LF6rbDRtugZPcbnXRtBr7U]
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <3fb6af03-9adf-4eda-a953-35f7082e3c0c@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB0223:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d61b079-1bb6-416e-b14c-08dc40a25991
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQCMYMcbXXZJyxopNTE8DiX3ITZEkkon+BmixtgB80HzB0uSoqyyofFmjPVZFbgV2zIH17W0/XrEyW4e5aaiu4ebrxfkHFI3L1wYl/zKr2zVdLKartJNUKbUxD2ikyCXGhxxLJVKc2Qnah/oKHdlGc5KMO8M7fyxJXb2FOcwlVvdLPBkYUXQrm/4Nwa9lzoEHAY5mtWtwAdIJWPdkItoN4F6PAQZnI7vEsEVpnVebuWV3Ay+veBJAAbnLm0eYsoZM0DF05WljIGppEev2U++N5WC+uxpQFEo2Rlsjp4z6x9bWCXMCkrz7WJMJSSqsp9uxTXbqzrTpY/B16NtGjf3TVMDj5YJu4LRq2JsrTYDqrhIELSSLnRO6Dr0luc4hFLnRYg5VTJSKTXWU3t2QPLH6XK2p3DMci3/9PdDVdQLkNrWtRigMR1aELcX91f/Mf9JAxl2UfoehY/cWjXVkgPkU800I/3crCluyBkP3a2dq5vw1d+k390EYHWz/zBKKwGt+dncQVNPSm0gOmhn9urpLRemgf1iZLuVDki3raqgk/AVj9iVVRlAsolGwumIW5HcKhX/VaIucE920zIw5t6KJlK1mgPEoEhMiWmpAjLHxra6s51sY6h7c0sCAgZF4kyuAQDC7VGMwMCYvltj34+d9GQK2IdK0/EujyH/fHrPVFDitiegpgwqHfZwNzU+y3WIUY/IMnINfdnfqTZlpiDovhsIqgwL2NR6mM8lo5mBpqu4Xs8a5yU58RiZsPYAHQUlMEcx1aNw/GpZb/TZBai2jRD51QG6HpHezP0kSepRaeOkQFR31qu+LloF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pd0FXcmuT+2TBzMktB3B9iu3ofmIyQm4uPI1hRudxp2kpYl99r265tVax+v6fHeDh5ZkmPPBYei6buOpNNjS78rMjoikV2JstnPMidTe+LkIcqyi/dyadtqFwBIhUyWCvBx3U4NDKZgAQV/RV6S7E3v7TA93vyoITAKFBaUKI6Vn7n27lYrebLG3ShHUH8kbIE7pjwhJhPGkPKlJf0Fj+xfoWmeSisaWEX/JiRjdloIqhJOKIvQkWLDavvTYywfCBCRtUciXn9Ve9ogSHSM65QXrX2iDs/+gvmnTTRCAOMEGqnKK6sels6SJp4aJoIDxLSRi8UbOa8BPmn/WZ4K8t03CoSAqL4be2BaXEY+UfRmjWK5ke6/59zRBtL2lslyECRZrsOlnsoPItiPyuUHdBIfg1LZfLWt5YcFp/v3bix9SrWnnrVnyioTIngXdHZNEZ21qieBjNS+YvI4HeyIzjgi8AlkDSZWHZzdnhAIDCAjjEGNSj7cKVTuyiAaikV0bOk2FpKTWuTyv7wcnwwAGupCsCZh2MIMcEd2y2HKyYpWBP06Fw6cITp0+gZQRcZjWEu3O7epebmzr5qdy04/37ov7hjv6Cy/9QhSaHOSKo/mc2GESe+QiVkESMZxWQyVt52FmlMNv9Ki5+IeKF0xURW5ilCFrGgEZTpOfCQYZhSo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlVSNUdNWlVnR1NMVVRyUjlHa2JSSEVScGFhNG1tbXRYWnFncUM1VXBvaVlo?=
 =?utf-8?B?YkpnY3hJU0UyVG0ySHNpTkJ4dExKT1B3VEdQbGE0bXQweHJQWEcyR1NHdzdC?=
 =?utf-8?B?Z3lvWjJFeTZ4MmtESXFIeTVMR3M5TnlMdE1zWGs2MVFlZmpMcXpuUmQ5UTE3?=
 =?utf-8?B?ekVacm4welExZnpGUnUzbmxTSDFqSDB3VDJsNmJYa1JFcGYwYmcwTS84NTUr?=
 =?utf-8?B?bUcyVHpjNjkzMytia3pxY09HU3dOWHM1VllHb1hjNUEraGxWSEZtbVY4OWpD?=
 =?utf-8?B?L3k5b3BVWlJXQVBJNENObVZxdGJsMXBvS0EvWmFhTXhqS3RnUkJTWkEyZVZh?=
 =?utf-8?B?ZDdnY1JjL3ZuNUdKeW5CT3VOMnNCSFhxMDhhQ1czNWx5M0loeTZUU01hMkFp?=
 =?utf-8?B?dW02V1B1TEJyZFY2K1NHZjJobEVvZXFhbEVEOGNUZFhjZGVqUjZnS1lVdnlt?=
 =?utf-8?B?RHovcnZMYnBwM2pmTCtCM2FjYTYrZGNtNnhZK3RiNitDUGwxMmEwcmFrVmhj?=
 =?utf-8?B?ZmtRLzF1THNraTlsanp4dSszVFEzWjZ0bTNNYkpLd0hQaG1kM3RGc01DR0tj?=
 =?utf-8?B?RFgvN2RJME1PRC9Nem01N0NYcTZPVmt4UUJSbkZYQVlnZmI4SEhJclREdTZS?=
 =?utf-8?B?ZmFXZW13NC9aazR3UWNsZmtDWGhtSUtlVFEwYnZIWGtMd2RmbksxSXlZSEJx?=
 =?utf-8?B?S0NiVERuNWhONUUvNFhhdkpzRTFURW9WNmxOZnpFWDhIekordWhnZW8xOTEw?=
 =?utf-8?B?b1o1Mk8zNFBxU2dVc1IrK3Z4YTZqdmFTUGhrdENWTEx5d2lyWk53Tm1BaHRD?=
 =?utf-8?B?VWE3S24xK3BvNVd1S3p5NVdBd0t3YTQyRnZza0ZMMzZ2dTYza0x0WUZ6ampQ?=
 =?utf-8?B?Rm9ld1FGWXBqc2ExZlRuSWFjS1hLdU5KWE4zcGFmbUROOG1JcjR4NzE2VGY1?=
 =?utf-8?B?Qzc1TEJWQ005TGcxNzNzTmhpUkEyQytnVk1mM0puMmdOSjl2T0dxT2cydXIz?=
 =?utf-8?B?cHVQMjVBTVRWNVpTNXlKcXo2NWh3bkQ3cXIxSy83RXBZLzc3OG00SVY2WTNt?=
 =?utf-8?B?STgvNkorUk9hbVNjdFFsV0ZjZ0cwSFJxd1lQTVlwVnJTR1ZXNVMxTjdzcW1X?=
 =?utf-8?B?ZC94cTc0Q0hOMEx0YmlIUWtxeDNZRTBHOXQ5eEdmU1hMUEloMCtabFVZbFZy?=
 =?utf-8?B?K09VQjJIMFR6YUQ0V3hKYnN3WkM4Zm0rV2g3c3pJanFEeEszL3lINjBEWnkr?=
 =?utf-8?B?YzZ6VXc2YWhpV0xCckRmL1g5RnhNZEVGLzQ2b2RHc3BsanVnanprbGxDUzl1?=
 =?utf-8?B?ODNZdHVYKzlxRHczenljalVUUVVQNjdHV2Jjay9DOXd2RTF1QVFrVlUxcGRU?=
 =?utf-8?B?TG1uMmJtQWdqclVPdEQvczgrOTdCdjZGMXpXRW9tUDYxZ25ZTXp0cUZZMjFG?=
 =?utf-8?B?WWV1YVFWWnNVdXYremRkYkRSdi9aTkc3Tk5Od1hqR1pPWTJzczRSNTMrSHNP?=
 =?utf-8?B?ODFTbWVDcjZZUk81a2h2M1VyRHcvU0l1R3BrZHF6ajJKR3NQZm9EOEtoVWFY?=
 =?utf-8?B?dTdWL3NsNzNNQWI2aTNPVTlUNDZUQ3IxNm8wYkx6bDhIZFA5VmtYbE56SXlT?=
 =?utf-8?B?S2Rnb3hhb2FPT2p1WGEwK3RabXBoYWRPbDY1Mm54OWVOWEFkS3pMbkRralFi?=
 =?utf-8?Q?y1nJW8CNUMEHTV6sPPga?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d61b079-1bb6-416e-b14c-08dc40a25991
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2024 01:35:21.3841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_173536_918933_8F7630BC 
X-CRM114-Status: UNSURE (   4.85  )
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

hi, Stephen,

Just a kindly reminder, have you applied this one together with other 
two bindings patches for sg2042? I checked the 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=clk-next, 
but can't see them.

Thanks,

Chen

On 2024/3/9 10:12, Stephen Boyd wrote:
> Quoting Chen Wang (2024-02-19 19:08:39)
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Add bindings for the pll clocks for Sophgo SG2042.
>>
>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Guo Ren <guoren@kernel.org>
>> ---
> Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
