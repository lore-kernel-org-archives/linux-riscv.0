Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22442C71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 00:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uetHJ78JThL1a+i//cTrVTrs0OO+JJO2anGvkNKxpDs=; b=FAn320dLdrsAhu0N5Tc4bcPm6t
	qCQjTpJ/YjpR/xbjUE5djBZ6jH9ClhpzTPIYXhABAf/5Cmi8+cLf2FE148yjTM+0URfCw6qrlu+3N
	6E4McKvdeb7Y6RaOsqCoi70qu1087WHCZ91KMUKwY2LgB5ziCssQF4JyfDv8jeW2FU9PS2PhBKV+0
	Ebsm46qUc4iUfFpKaWkNQA33dvz78dk6L7bu5I+9HJVS+LMDwsLqMBVP4oWbJt94687trJOAJdI2K
	8GPu974UU0BG56vznQUhbGe/oFpqhySxfc68mkjNbcWOK6kVY9fcnvjT09An4je6mxDUIZ/NtqfsM
	zlQ+euoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwS7-00000003tUM-3q3M;
	Tue, 08 Jul 2025 00:44:55 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwS5-00000003tTA-0hEl
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 00:44:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRg9uE+JK0Q867bLSQyrRVmN/XxOpQK2cS3QKQJ4Rcqh2BOs22uEEwILePRq6LtG4m8nFkwwpIhPR1thaTR9uEEAksyZ8wBbo95172QjrogVRX8d/1oOBrPh1zS3je9gzWa5gqA1HI3GZhbxncr/rrKLB8sTQrUgtJ4IXu7F4JlQOM+TVHFcc0p4JlH8GasKfNYg3fRWS+d1xUQt7hU7TCsLxI+aPI1DVipMPOj4JIUsYUdSBY83xPQT+Vpr1rw6z9dT34jXKETYgaY/aRavDJx3lJavLZQNx+Fs2rEo/OLLLRWj2jl1N541ZctIhLx37xKWspvIBaeJY6AFFP9FBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7qIkyR0Pyb1ioRi23VgdDHK07BLp5WdINfeZmV1NF8=;
 b=DFGDXHkW6F4igKnPDzzfZfhWnOzfKvH5WOJMtU6wpqYIXi/TP5sawzd4RSL4GtpQD2wQ4Rfdtivfkktc0FRuCPvcpGbA9Z5rSZxeBqzy5UnFbZ506+LNVSpUoUSq8NPztIlG/nDFAx05IlCpCdOrkxf05M9chYjkfnuLS38xAoj2KSS8obJfGOqHn5i+GkDQ0MZEvWvnY9oXBoh6IkL+V4OCA4+u2I6GaGbAV25z8zsKNoRVltvSBK4pgZqsOiVTHtsVRbTGejFGEgq4OrtxO8R2prGaFLQb1cPUiFpzxcLtPZwE0BV40EObnQXDcYg0M8FDyqRczdB0esCVoEZ6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7qIkyR0Pyb1ioRi23VgdDHK07BLp5WdINfeZmV1NF8=;
 b=BbIA+nTbA9GsZsPwPvVYz8O0gK9uUvqqzphOsAp90ELzuwHRaA1DVPD3OMOiaIDrHt1dzEgFBhA92BYELBuZnvrbaooCOOfGB/ky/AQKxnfi0hMIrq0TTOfQ+NDBw92a18cXl1rG3PSulrh5mZQmoyi0P3/QT9RK8phebn8YLhnXBJkIQUOURijIlngXSnbJKIbB7Xnu87TZy9JX1wYNdpyonOpPo2N66NyFO0CTQN7HYPcYF5Zid6mgpwMn9z7dwDOMuADr0ImJcQVO7qkc3VOV0zR1Pip1Dw0/RdGF/agf/R6BtbbnWBiEimc6YPdZT5sQeTAEpzrsy1AGa5vLlg==
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:2aa::8)
 by PN3PR01MB6376.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:87::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 00:44:37 +0000
Received: from PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c]) by PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::7f30:f566:cb62:9b0c%7]) with mapi id 15.20.8835.018; Tue, 8 Jul 2025
 00:44:37 +0000
Message-ID: <PNYPR01MB111715A966743E14E4E93565EFE4EA@PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 8 Jul 2025 08:44:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2044: add ziccrse extension
To: Han Gao <rabenda.cn@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <0889174f2e013e095b94940614f4a0a6e614b09c.1751858054.git.rabenda.cn@gmail.com>
X-ClientProxiedBy: SG2PR04CA0202.apcprd04.prod.outlook.com
 (2603:1096:4:187::20) To PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2aa::8)
X-Microsoft-Original-Message-ID: <29b81c47-ae0f-41fd-acc1-22c011209ad2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PNYPR01MB11171:EE_|PN3PR01MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c62310-b29b-4fd9-768f-08ddbdb89d5b
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799012|5072599009|461199028|6090799003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGdQcEovM1ZNYzhzY2ZmdkpoYjJOZGxRRG1BcU93aVVtYVV6SVNPUHVPdnFh?=
 =?utf-8?B?OTNHYXpEZ2hYVFZURkhITmtwM2IvbWozNHVHZ1lNTjBMV1NBQ1ZHdjZPVjNL?=
 =?utf-8?B?eW41TnhobFZEK3A5RXExOThtZFkyclJPbTJyN3V6Zk11eG9Ja25lU0dvOUFP?=
 =?utf-8?B?M2t3Mldla1g2THovTC90UVRMT3ZXRlpBR1gvQWJoN0NNbFJUcE5yVjhZcEJ2?=
 =?utf-8?B?QVB5TGVONm41WTBBa0dET3N6SC91L3BEbFltYlVPcWVSTi9MQ1U0RG42cUxv?=
 =?utf-8?B?c2FiUGZQKzJEV3lVMjRJck01aXluNkNqUUdodEpKU1pNdG1LSlRNZWl4eFVH?=
 =?utf-8?B?M3ZheXJRMWxaNmtBRUxmUHJid2VrUWRaM3BReGdZUjNSSXRMRXFqWVhValUr?=
 =?utf-8?B?TlJwRm5BdzFRM3VyeGVzL1lJZWtQcFgxUWFXMlp2VkJrckpZcnVIZ2Q2bUk2?=
 =?utf-8?B?MWpxaEhXOTlnUmFSeEtNRExZRG1Xd1lnbnVDMFI1b2kvcFVXejVwei9URnNX?=
 =?utf-8?B?VTFiZlQvTzIrZExNazhGcFpsVDA5aS9ncW03MjJLaytqVkNmSmE0V0JLbGVG?=
 =?utf-8?B?dDdQOGY1RVRHaCtFNnVNV3g1cG9lMm9qSzErYlkzV3RlenBxMEdTQlhJS0J6?=
 =?utf-8?B?RXpxVEZNWUp5MXQ4WEl6OXJ0aWdlaWdSb2V6MDVlanYxU01rUE4rMFdKeTV6?=
 =?utf-8?B?OHY2bmZSeWlqWEUvK3AwSFZ3N1BnSVp1a3M3ZEZFSlJDMm9SNERnNWZqRi9o?=
 =?utf-8?B?VXpTKzRFUHZhRFh5TmtRTEd5S2ZMMFAvdHhFd2ZRVVp3b0htTUtzVG5nTGhK?=
 =?utf-8?B?SDlJNldzZEhFUjFybTBWUXNVTFhNYTVYWm1PN08vRzFFMHJkQitqaDZVaDlz?=
 =?utf-8?B?UDNveEI2eFljaHc2c0t5aVBDeTJDbUUwQlc2bFlrNHJoRGJBanRpM2wzWkpM?=
 =?utf-8?B?Qmtaa2JoQjBxaGJjeGoybGp5MW8rUkI0bHFkb3Jod0hLT0N4bVVDNkc2cWtW?=
 =?utf-8?B?TzJtQlBkWTMzcnI1T0lVMUQ3d2xFL2d2RElvY3paQlJoTENFMFRxL1hsdDVN?=
 =?utf-8?B?Mk0xQUFEd3JXU1JIYVUybE1teTR4aHlvSTl5QmJmT1pMemE5UHZCRXBQMDkv?=
 =?utf-8?B?bDEreTZkQk1lcFo5d0NKS3ZILytTc0JTb3l4ZUNXbkFaMVBEUU1aWkg2Z2w2?=
 =?utf-8?B?RkxmTGpxZUR6TUNIYzd1RkN0d1NGT3M2UURGMmlWQTFhVXVJWVAxOWtaR1B3?=
 =?utf-8?B?cGJDWkh5Y0ZNTC81Njd0a052VWJLUGc2TmV1dlArRnBGYTVLVWEvQTVHb2c4?=
 =?utf-8?B?dFE3T2tFNWlYbXhqdzc4cFRPay84UlM5WFBBdCtVN1VMeGdFdjczUlA3a3RO?=
 =?utf-8?B?d0JhWU5WZndPSjgxOTdMYm5xTG5LQ0JTTk1LRzlFR204U3NlSEY1VlJRTWUv?=
 =?utf-8?B?R2RNNC96LzNSNEtsRGlQWWo1VnlsaU5OZmdLS29nPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJ0akNicTRqNWhCaDQrRjFVQ3l1OUdrbU9WcDF4OWRHdThkdEN2anhxRU5Y?=
 =?utf-8?B?KzNnWlNDeTVqQW02QnI2TmcrNmNYR2xwY3pRcjRsRzJXQ3ZYT3ZHSXI5MDN3?=
 =?utf-8?B?NHg5bFpySlpRWWRSaHN3QTFNRG00TktUa2ZOSjRRR2NmU1B1VnVCVVh0VzUz?=
 =?utf-8?B?REViVnIzK29ObTNaK09OSmgySjM5NXdvL1dGNVkvcjEweVMwbDFEdkkyQnJs?=
 =?utf-8?B?N0ZQNlhnWXJPbG5VdHY0a0V1R3o0R25ieHpBRjJwQUEvN2lOa0gway9SdWpS?=
 =?utf-8?B?M21mRGpzSUErd0JpVEI3MlZTMkttWnNYSFFHOFVzUmcxblBkNUtmNUdGMTJo?=
 =?utf-8?B?R2VoaGFkcFhCYkEwaUZyajV4b1FBem5jR1BiK0dUMGpWRVhnNCtDSThxL0E5?=
 =?utf-8?B?b3dUcldpM0xReGVBR0lQK1RCcXpQbndxREROaTNWV2dZTWx6UDFnTHorc2to?=
 =?utf-8?B?UDVzcHY4UUNqYTJVemhJcHRFa2RURnhjbmkraWpNMkZPVVRHZWdZZDRsMlBM?=
 =?utf-8?B?Zm5PV3BTcU44T1lIOCsxTlVSN0tjYnhldndDcTg1WXRNVmdqa1RjSWx0RVlX?=
 =?utf-8?B?a3Q4OTRQWGVUd040WHlkS3h2Y3RCZm5SRFl5VlQ0cTJiRkYwVlZjZ3UzeXJ6?=
 =?utf-8?B?cXJjdHMxUlhUSGFlc3Z3dkZBVFdFR0xyczhwbUFDUTM5QWMyRy9NZEw1aFMy?=
 =?utf-8?B?VnFseDZyQW9NZG9OcWlYZ3d3VW1IYWtoUU5KYjBydExTWEpCbFc4TVc0aXgv?=
 =?utf-8?B?Z2hrMW45aWxleWRDcG8veEYzS3duZUtOWkpRelA1Y0RtcVp6M1pXdEJPeitl?=
 =?utf-8?B?THk4MW5nTDBtWkhxVUJBMGxIUXZPUkZ3VXg5M1AyRjFYUU9LMkhMdTJvem9t?=
 =?utf-8?B?a2VLS0JBZktVUnl0eVE3Rk9DQ21wL2tWK1JrZ0F0M2ZjaHpabGxKN215OUFG?=
 =?utf-8?B?M0sxQ050SDRYL1c0VXNObUpiaTd2dkphckxhYmYyaW03Q0xQM0p6eVdOTElE?=
 =?utf-8?B?ZW5MK3ZTY05vdEl5cjJsa281eXQra09pdjZQZVY5bmhEd09pQ3FXUnJRUXRM?=
 =?utf-8?B?VStOMnl4ZHdlOTlnMktURkVVYnhZdEI5V0VoZ053eTM3QmVaU3lRa0x5blVq?=
 =?utf-8?B?ckM3Y0F2YWYvUlF1YnhZSVQ2d1Z0WW9EZHhQMmdBMWFKZEErWnFLVGpyb3VX?=
 =?utf-8?B?QzdJMTVtRTNWbXFFb2JMNjBrT0dYd0lEMklPTFd3WUdoY0dTNzNnb0lXSXBD?=
 =?utf-8?B?SmRGLy9nZE1abHhwV3dsajJtanJvQzJnQjllb0NFZmw0OVVCbHZKZXNEQ3E1?=
 =?utf-8?B?aTdqd3RnZ1ppczM3bWlTOThYZ3lySlcvZExybVVic3pESnVqc2RCTGVlYnRK?=
 =?utf-8?B?UlZGQ0wzT1ppN2FYNzBMc1dYY1FWZ2RqcWRadmJDZm9sRWRZY1lIY0krNndH?=
 =?utf-8?B?YjVyTHU3b081TmpacnFYeDBkeGg2N3N3ZERmUUdYWGhNbFpONDlWUHlTSzFo?=
 =?utf-8?B?bHhFS0xYYlV3VjFoK3VCTittcDR2cTRNVzVObXRudm4wbW93MXdwejdBUHcv?=
 =?utf-8?B?a3h6Y0s4cWZlenIySmFndUQ5WlRNRWhvQmcva0s2Y2pVTkZMMTdTc0JBV2JM?=
 =?utf-8?B?RTFRc3VZdUJIU3pWcEZXNWQyRjkwcXNOVU5KcnNFdE1ETlVSY0RyY0IwajFx?=
 =?utf-8?B?dUhnNndMRU5iemdMcDUvZW9TVE1RZ0VnWmVCRFhUQmxXL0dlSmwrWFdJSDJC?=
 =?utf-8?Q?fkDxCmN8dvDopoNNQsIaE6pDHWc/jJaPZkJlb9u?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c62310-b29b-4fd9-768f-08ddbdb89d5b
X-MS-Exchange-CrossTenant-AuthSource: PNYPR01MB11171.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 00:44:37.0561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_174453_438924_0DE893D1 
X-CRM114-Status: UNSURE (   8.48  )
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


On 2025/7/7 11:15, Han Gao wrote:
> sg2044 support ziccrse extension.
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi | 128 ++++++++++----------
>   1 file changed, 64 insertions(+), 64 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> index 2a4267078ce6..1f31bec58a93 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi
> @@ -32,7 +32,7 @@ cpu0: cpu@0 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -67,7 +67,7 @@ cpu1: cpu@1 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -102,7 +102,7 @@ cpu2: cpu@2 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -137,7 +137,7 @@ cpu3: cpu@3 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -172,7 +172,7 @@ cpu4: cpu@4 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -207,7 +207,7 @@ cpu5: cpu@5 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -242,7 +242,7 @@ cpu6: cpu@6 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -277,7 +277,7 @@ cpu7: cpu@7 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -312,7 +312,7 @@ cpu8: cpu@8 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -347,7 +347,7 @@ cpu9: cpu@9 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -382,7 +382,7 @@ cpu10: cpu@10 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -417,7 +417,7 @@ cpu11: cpu@11 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -452,7 +452,7 @@ cpu12: cpu@12 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -487,7 +487,7 @@ cpu13: cpu@13 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -522,7 +522,7 @@ cpu14: cpu@14 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -557,7 +557,7 @@ cpu15: cpu@15 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -592,7 +592,7 @@ cpu16: cpu@16 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -627,7 +627,7 @@ cpu17: cpu@17 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -662,7 +662,7 @@ cpu18: cpu@18 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -697,7 +697,7 @@ cpu19: cpu@19 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -732,7 +732,7 @@ cpu20: cpu@20 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -767,7 +767,7 @@ cpu21: cpu@21 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -802,7 +802,7 @@ cpu22: cpu@22 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -837,7 +837,7 @@ cpu23: cpu@23 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -872,7 +872,7 @@ cpu24: cpu@24 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -907,7 +907,7 @@ cpu25: cpu@25 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -942,7 +942,7 @@ cpu26: cpu@26 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -977,7 +977,7 @@ cpu27: cpu@27 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1012,7 +1012,7 @@ cpu28: cpu@28 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1047,7 +1047,7 @@ cpu29: cpu@29 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1082,7 +1082,7 @@ cpu30: cpu@30 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1117,7 +1117,7 @@ cpu31: cpu@31 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1152,7 +1152,7 @@ cpu32: cpu@32 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1187,7 +1187,7 @@ cpu33: cpu@33 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1222,7 +1222,7 @@ cpu34: cpu@34 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1257,7 +1257,7 @@ cpu35: cpu@35 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1292,7 +1292,7 @@ cpu36: cpu@36 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1327,7 +1327,7 @@ cpu37: cpu@37 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1362,7 +1362,7 @@ cpu38: cpu@38 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1397,7 +1397,7 @@ cpu39: cpu@39 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1432,7 +1432,7 @@ cpu40: cpu@40 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1467,7 +1467,7 @@ cpu41: cpu@41 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1502,7 +1502,7 @@ cpu42: cpu@42 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1537,7 +1537,7 @@ cpu43: cpu@43 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1572,7 +1572,7 @@ cpu44: cpu@44 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1607,7 +1607,7 @@ cpu45: cpu@45 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1642,7 +1642,7 @@ cpu46: cpu@46 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1677,7 +1677,7 @@ cpu47: cpu@47 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1712,7 +1712,7 @@ cpu48: cpu@48 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1747,7 +1747,7 @@ cpu49: cpu@49 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1782,7 +1782,7 @@ cpu50: cpu@50 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1817,7 +1817,7 @@ cpu51: cpu@51 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1852,7 +1852,7 @@ cpu52: cpu@52 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1887,7 +1887,7 @@ cpu53: cpu@53 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1922,7 +1922,7 @@ cpu54: cpu@54 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1957,7 +1957,7 @@ cpu55: cpu@55 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -1992,7 +1992,7 @@ cpu56: cpu@56 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2027,7 +2027,7 @@ cpu57: cpu@57 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2062,7 +2062,7 @@ cpu58: cpu@58 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2097,7 +2097,7 @@ cpu59: cpu@59 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2132,7 +2132,7 @@ cpu60: cpu@60 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2167,7 +2167,7 @@ cpu61: cpu@61 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2202,7 +2202,7 @@ cpu62: cpu@62 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",
> @@ -2237,7 +2237,7 @@ cpu63: cpu@63 {
>   					       "zawrs", "zba", "zbb", "zbc",
>   					       "zbs", "zca", "zcb", "zcd",
>   					       "zfa", "zfbfmin", "zfh", "zfhmin",
> -					       "zicbom", "zicbop", "zicboz",
> +					       "zicbom", "zicbop", "zicboz", "ziccrse",
>   					       "zicntr", "zicond","zicsr", "zifencei",
>   					       "zihintntl", "zihintpause", "zihpm",
>   					       "zvfbfmin", "zvfbfwma", "zvfh",

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
