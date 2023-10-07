Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2831FE95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X2i6CWqszKsceDdnYEm6HDyxTZXAzXwRGrckW9YFdE=; b=SkjOgYuqKcNjTOg7rpYaJGHoCk
	nO4+6WR/sxh4iQYN+9erOlg8RdefpADu3iuCxToDAFvK8Ot3Kyu5K/DoqLInyCMSBXFcdUa9qzwZc
	z0fjatThtNP2y0F8kr/zbzaotp0i3bYKcWLebGwjdVXFwI4MWI8Yf1AFQAMIrQRQtkkBs1AbrYBOH
	a6Q6NoX15p/SMgkHgCKAEcvWdPhzMaIi2kblf/GCUV+sGynEmo49Mlpey3ClxYpY6O1XEUupmt9GK
	rZ+UsQH/t64iTgm2QaOAqm8gna0dwjV7EUP0RWmFboNZxEI60v1Jc8M9NlgdnH3CjtPexQCTi140L
	GyHRH2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6O0-007XkG-2W;
	Sat, 07 Oct 2023 12:26:24 +0000
Received: from mail-maxind01olkn20820.outbound.protection.outlook.com ([2a01:111:f403:700f::820] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6Nx-007XjP-12
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 12:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=buG4SKw1ckSfwXosY8jONBlbt2B4I5jVw3ypX9caHp3KgKtrTi9KNzBQYO/v3jZz8rie3Ab4362NLMq+gcWaJfAf6LJ+OElv8wkl611s4uHpL6yEWkb3mynh+YP48vpTx5X/QODcbuEUBWIWuINR2EXFOPC2eG/WZwpLWsyTZCi09hNbZlEOwpuRFIFd0FpRfnYUVcPzCQsqlx4G6lc7SeboaCJiPbCmJUAWhgfzEj7M9s6XSde1XJ2hEUMGGe7UshGcTFLHlzzutvLMtfdzQfx9L7fcaQlVg46Pj8f+IYPHOGJDYo2hJkDXeUWxg6SFIRUWagmtlCTO1n9L4bb+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7Qq/K8WDJfv22UBjEtfIsKqtkFE+NNPzMZwhbqRwDc=;
 b=oFmTKmVqTTs6yvoiAHYuufFlDoFx2nGqr/bamIokPAvH3+5BzPd1JjoUVPZIRPqwyymre8wWNCUn6fR+3i6bIamqG4UNouVbUMZV1PcTYAyiJkFVZCoVk6vaCqqK8HPw0oZiCXm/+MN1NJh0bPrJqx7jRinzXOEsYzDzbi+aaxaI6Z5AXup0LAs7LsgJ7FMuit5EdSBIFV/iRS8pz4it2D7m6G2WPpsfaYYoDSaYUlkbUtkusdJi4FggcnWXMF/zNkPyMAIBC3MRDAOiP/0dK3eeuW/m38gFncXMXwB9mxlQVN2/fWhSc+YJrzwi97fGZPtF0bNPVKj3GbugFxIx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7Qq/K8WDJfv22UBjEtfIsKqtkFE+NNPzMZwhbqRwDc=;
 b=AaBf+vp5yEoLb5BcHhh8j6HvRavoT2SQRw76+v8C2Davld3Rlckp2ADa2EsbLo1dXlXdVIpijxMbDmERiQOgBtBMpzqvQAQgcKhrKo1BXAk/3jJ/AGS3YI4XdMVxFkKWoCXXHqq1Oar1dM05a897vbGaMS1mHSZ9RtwvH4Nk0NWGWUWeeTEQtv0Nqx9/KYqd8ZsMj5/g+E3l42Q098cSROg4t+qsokaUhnPGmPQnXcNNzJhB4juK11PLLKkslxzoHVcWkmbVzhh7SCtXEtj/27JmAbCWvDm8gi5ToLAHDs4lZIhLJD2yocjffcTixCXbj7NPBHewChUq2DdwSgM+lQ==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1978.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1cf::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.41; Sat, 7 Oct 2023 12:26:02 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 12:26:01 +0000
Message-ID: <MA0P287MB03329460B9F3B79B1148A6FDFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 7 Oct 2023 20:25:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
To: Conor Dooley <conor@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, devicetree@vger.kernel.org, guoren@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
References: <cover.1696663037.git.unicorn_wang@outlook.com>
 <20231007-grasp-retake-0463858c13df@spud>
 <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231007-kennel-lustily-59b0a9867aaa@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231007-kennel-lustily-59b0a9867aaa@spud>
X-TMN: [mYef3Mz2ZHNtBgJJXJe7tFy+ItH7wngV]
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <8ee1cfcb-6ef0-45ec-9ac1-31f17a1ee920@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1978:EE_
X-MS-Office365-Filtering-Correlation-Id: 2385e4d3-2926-4954-5cd3-08dbc73090f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 30RS6KtiZm/mtWi4m4bjT7oDG3K0wBbm8vvcTzpf9ngYTR/MCn2JgIRnME4wzocCPml3Wvm9wsQaBkhFErKn7NsKgP1NfIuBXaKsiXKVgx8Rufb9RfoOk+8Ju1bAKbPz4JnZSDFPmJk+kHcW8gI79c0uXTB0iPRg0GPHqifW/6njCgs4/rao2bTX/XMPghdapdISwIzfowk8wROWHmPJsD10URrMdhKynqIV7B/p8sbRA8OACxyRfLTGAATpAoRmOCCCTnjbsFR/L/7vJF4AHrxMbbtloI4IapWmkKwpPcEwOVpMNzxrYQmS+b/fhRSgApT9nVUyQQxijVlOIs1Rp5vdta5CB+ekVOO7ljkvC0Uounjh6GeoIb5ix9AvQMFIXwQ7+Aoh7R2GhXE29X0G/r2csLRF7ChL0u23bLz1LhJ2llZ8cYlj/Df536EN6lsW67xa4zpfn4rRdiBSwza+YWkofZaPY81YYgJBVKzVJQYyQE3yVi4xuFrHuuXuvyqf2j3O5C/woUDb19p4oCzdWbmbZ3oqhVZQ1+9iTriN+5QsM+FEFG/hiF/ScDfAfx/8VOH9n5820RctQI9Hb0QINZVcWMufGwQRhhi6QxglnZk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnNqenpxQjVnYlczdlNYS3pmL3BYTE1Pam9yK2V4VVh4cytkcjliY0JzdWFw?=
 =?utf-8?B?ZzhLQWZZcGVGNzhtNkhoSmZ3a25uUDhId0J1K1BXV1Q2eElaNmhSeW5haFJw?=
 =?utf-8?B?K0tCTTZGMkhXaUk3QzRrWFBtV3BLc1MwUUxHK2ZMZUFyRERZOHgxVzB1bU9w?=
 =?utf-8?B?WG9HTTJvd3pVWllNYmlQbFJYamlETzlsd05jSUFPRk14ZGlnUmNyRlhTY3dL?=
 =?utf-8?B?WUlHaFF3dGpvM3E5c1M4cUNyemRESS9tQWMzUEZ3TkhhdVpaL3Y5MU4zeFg1?=
 =?utf-8?B?Y2pBVERyR0hMcnFGbkdOSkhOdGN5WUh6ZmFQMXAvUTh2SFlDS09QZVQvSGRx?=
 =?utf-8?B?a1NvdGxpMm1mOGFSS1FsWHMxdzZJSjloS3dEcDREMjdMV05wWlNObjlQR2tJ?=
 =?utf-8?B?NS96UEFLTnBZV1p5cnBBZHVGT3N0SlgzU0Z4QWdvL0ZsdWJuTHVDNWhtZzl0?=
 =?utf-8?B?VzlvVEl5U2kydjcwUExwU2RLMEdZVU1HWmd3cWZVR21NNE9zOUp4bTNjSE9P?=
 =?utf-8?B?UnB4VUdxU0FiUllkTjhRWi9xMnl1RXBDMWpScW9EQXdRTlorbk04Q3JLYnFR?=
 =?utf-8?B?Z01lcllaMGl0cGd0dXpsZTVweTJKcTJ5RHE5bWU0Zmh3VEQ2NjhqR3FndXlm?=
 =?utf-8?B?ZG1rNTM3UVJuVnFRUlZVRENianA3bmhhdHBDZHRKbzVSWWhvb3llU0NBWUFE?=
 =?utf-8?B?dWplSFl2OTR3S0tUWWtudEtYTUpMTzJPV213TTE2SnJRbllZMU5jV2F3RWN4?=
 =?utf-8?B?Q3hVbVJYK0FpTnhmdnczSjJaalFlNVd3SmhuK1FjaXZ0QjRLQ1YyTTdFN3o3?=
 =?utf-8?B?aXU3b0QvMXlqc2MxMjNtT2FtUy84NkNFakNOMmFybjRMaE9mZFNOSXRoRm9W?=
 =?utf-8?B?bGdzb05iOUs5S3FHZzRBMkI2azRISzFWZ3FvUWZKY2JuN0dqSU85czVMYXgr?=
 =?utf-8?B?ZFlWdXdRamRxWTlXYWtrUG5yTzFXc2xjSW1qenF2a2xiNGhYeTJhcDhRK2RX?=
 =?utf-8?B?WmtrNEN1VjFlcHpLUjI5RkMwU05oT1pkK1laU3g4YnpySUpIcFFtMlY1R1JR?=
 =?utf-8?B?c3c5YjV1dDNJb2U2K3FiTmVJeXkvRXdxVXZMcXBGQWxkblIwOTN3T0NtSGg1?=
 =?utf-8?B?WGIvNUVJS2Y5WjhTN0FvY0pwVlRObERnb2NSMDNXamRrS3pFRXR2Yjg0a0Nu?=
 =?utf-8?B?eTVRY0RZNzNVZHFUN0s0cFloSjNxQUEzeWdNLzMxSXRTWmpDdEtBbDJzNGV1?=
 =?utf-8?B?U1hrWDMvWTI1V1hLdmF2elc0bTVvbUhGZFd2eU5OUUs0UFIxUUE0WCtLSjlM?=
 =?utf-8?B?NnBnMkpOYlppN25PemhudERLM3RNREt3Nk9CQXZicW1vTnBtdEYxZmNpcXBV?=
 =?utf-8?B?OENIVmVURWlkbHZTV0FYR0FIWU0rbFl2TjRUMXpHSGE1QVc5K0NuYVp4b3hC?=
 =?utf-8?B?Q2JlZFUxejFhVjhURlk5TFkyRzRXNC92akRPS1JBK2xoVHRiMUM4dXVkZ1ps?=
 =?utf-8?B?eldjUjRtTWRkNkVDb0FBRVVFR0JqYkxxcitEOFdSR1NZcm05clRvYVYvbWt4?=
 =?utf-8?B?MktMajRiV0tLSmVBNkRqVXlMNkY4Ky9OZ24yS2R5Q3JueWV5bEtVYUtFOFJh?=
 =?utf-8?Q?gBBcPAk/bbtK/jODQuwCNlrPWP3CRncF+6oriyFB4XHY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2385e4d3-2926-4954-5cd3-08dbc73090f6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 12:26:01.9078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_052621_363942_D821D01F 
X-CRM114-Status: GOOD (  19.35  )
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


On 2023/10/7 19:04, Conor Dooley wrote:
> On Sat, Oct 07, 2023 at 06:58:51PM +0800, Chen Wang wrote:
>> On 2023/10/7 18:17, Conor Dooley wrote:
>>> On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
>>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>>
>>>> Milk-V Pioneer [1] is a developer motherboard based on SOPHON SG2042 [2]
>>>> in a standard mATX form factor. Add minimal device
>>>> tree files for the SG2042 SOC and the Milk-V Pioneer board.
>>>>
>>>> Now only support basic uart drivers to boot up into a basic console.
>>>>
>>>> Thanks,
>>>> Chen
>>>>
>>>> ---
>>>>
>>>> Changes in v5:
>>>>     The patch series is based on v6.6-rc1. You can simply review or test
>>>>     the patches at the link [7].
>>>>     - dts: changed plic to support external interrupt
>>>>     - pickup improvements from Conor, details refer to [8].
>>> Did you? I only see them partially picked up. I'll just replace patch 8
>>> with the patch 8 from this series I think.
>> Yes, only the patch 8 of this series(v5) is updated for plic node. For other
>> patches, I just cherry-picked them from previous "sophon" branch.
> But added my signoff? I ended up seeing my signoff on the patch where I
> disagreed with the commit message, which was confusing to me.

Oh, I used to think I can keep the exising signoff and I didn't mean to 
add it. Anyway, I agree your suggestion to create a new patch with only 
one change should be better, I will follow this in later work.

Regarding your changes on sg2042 series, I have acked in another email : 
https://lore.kernel.org/linux-riscv/MA0P287MB0332BA73D0135CC73CAEA16DFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/. 
If anything else required, please feel free let me know.

Thanks,

Chen

>
>> BTW, what I did this time may be a bit redundant. I would like to ask, if I
>> encounter a similar situation in the future (that is, only one patch needs
>> to be modified, and the others remain unchanged), is there a better way to
>> submit the patchset?
> You could have sent the plic change as a incremental change on top. So a
> new patch with just that one change in it.
>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
