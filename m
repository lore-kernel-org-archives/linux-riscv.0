Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CDDFB5173
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 00:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7E5LA5GTgA3l8WRXbk5jgR80NVSRDEcXNa0x3zNJvBA=; b=jizTrN9YHJaSpjDt9v3W5XyKNw
	1g3gmQhevHAoXLUEyr0q/YXca1U5Gj61Djpt7QLWoe4karAG+TsioGaucnfwBW7UVvl+lIolUNao8
	pmF59pCTHBmpQKErC/vYDaLs0bohNWGJkeDMcrp16wljxQBi4RqfEahyCo7R7CSB+s9j0Xi5g9n0k
	84XCu3nBkAtqkuJNJq51KpfP/Zib+ueyObArgQZ+aPEcNnpdlbrs8aWqhDkFSmsLlkuSVjGYg5eBs
	aFPDNM8avwkcOztOxeFTNa88UNcYcMKRFWWqnFMJhetB6d33tCXM+iBwg+O+wa965s/IRC7dGKL3L
	1DGKhfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9u9u-00000005ekU-2m6A;
	Tue, 07 Apr 2026 00:19:10 +0000
Received: from mail-southindiaazolkn19010009.outbound.protection.outlook.com ([52.103.67.9] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9u9s-00000005ek5-118l
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 00:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHUmb7lgMaKnHvxL4H4tD/n/WSTEEuBBs/qPrVwZ6F2ZnJSaXitqUj6S+QRqMabaR09hPBUs4LA4SbsmcoOlp6j61ZH67I9m4kNwMPMUjFbgYbiv4H6cJeLtVFgBMT+hC+04TCP4yDNysHrPUP6UCvdbZ7WCq76mk4JUymlTS2Hivd0MdSEmAiuIcBNbJcq8GTYM/inEqBn59IK/XbgekFAlZsbVlHCJH1pBBgnIgRRnrLwaLj+8B+g9rH/0W0clWPDNM0gvoz1ieUeeCmEG1GDEWPnA5ZEDbj59/F5aCkHdQxb/TAyMUCt0hV+rRTbitCz6lymd+BoKZWPZOz/rqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/N2Eomt0vbmQ1jneRWKV1BTYqPHHkykDsLczmMHp5w=;
 b=Ddcmi1Vc1boxyXuI7UQJJuS7QIcabxDM+l2LHlFEBXc+F66svfpMkvj3kl5SE+XkZ9EQLWizMakEvvpVPRFYei2z9kKZYa0JwmKDk3l+KQJSBtSAutH5CRodRRmZAJjgxB36CfpwqHr7LjgqXc6h5xjnmrCBT//7dofQ6Utd1QkZRmiWvLFEd2XNBOvjNi4f9I8gYLnNeAOqLDM8pYLvSqnv/Y3LQq+sLmUKKX1W0riSd3K8KnFVC9quJWrezqKrj9dYQ40XlqIkR+8GYlXmkgQEiJa4vY2TAyQZh3FrKzcntSYZAKFHgxTSwVATXjpLnJucXnhKR4WaKpdMW3kGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/N2Eomt0vbmQ1jneRWKV1BTYqPHHkykDsLczmMHp5w=;
 b=b6lWay2e/2YeXGyQXFo58RXaJ1CO3aY1NZfWbnP6sFu1T6VXWo8hXeP7SBESY1h2Gh8ODucEK/9xLJMwTsvTZYyX4ImTrekkiuXM5zFN+f9pNNUv4kOnClq+HgpZGiNfAJc/C/Zw2cJK9qexqa1bYeVxtcdZNZ9amiY25L70RlJjG6DK+UC1wWH88EUgNGk7NfmeBez0SalVaJDD3MuuGcqohftkQv8rtBkg06MoQYez1/saOzMm5IUpKxO6pVdm2XUawo3d5MdVJW2rKdkjyyoHCuGrZ9fhT0B9rk2673Wao1nwgcRm8RLAGTC8rmFPULvVaPC3/nYOq8D9p6UFqQ==
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18) by MA5PR01MB12608.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 00:18:53 +0000
Received: from MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4]) by MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8a6b:3853:1bc:67e4%6]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 00:18:53 +0000
Message-ID: <MA5PR01MB12500000EAB10E45069C847C1FE5AA@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 7 Apr 2026 08:18:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
To: Inochi Amaoto <inochiama@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
 <f99471c2-4b7e-4475-af71-5c0ac4c92809@app.fastmail.com>
 <ac7rV0xGGVmxT-V4@inochi.infowork>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <ac7rV0xGGVmxT-V4@inochi.infowork>
X-ClientProxiedBy: SEWP216CA0021.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::8) To MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1e9::18)
X-Microsoft-Original-Message-ID: <18b518c7-77b9-462c-b7c2-3c21a5a56ae7@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5PR01MB12500:EE_|MA5PR01MB12608:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db10496-9089-4877-b8f2-08de943b4001
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/hbp7ET8AkIzB6ZLCCZZxQtPCdRRwHdpPwwTygVhrTFJIwMaJfMPvkh6sZ3qWuZRUinsQ0l7AoKQJjsXSLOfR94cLWlsodkaGz89s2AS1YOemqplTct23b1XOGXIvgo9jNKVGCY5BaQAfhgbazY/46k3qHP/ZGy7/dWOplS0QVMlIC4OKdk4lI4slpuailuj2PjBO0Rm5XlMWsM81aM+9wBJLlQSGIodIXHqd6aXVt2oV4ZDBA9hIIGVaOj6KBzibyTPcwOA3Fg9eew79Ll2GDAx9GKUfhAtKn4h0DILfX5p4gDhDzlCofjDeZ0autW2oFQcIcNJkSyAB/l290IHS5JrjCqY/0WDZkzm8ZXeg09AWNUzgrdoHVicR1ewWE7zisq2YB2fvwdxbLNEmf9iwCmcYLI4ZS8pWeFfiSNCnSOrPlaZdYzdOIxuGWtanJhuJK8q+wZ6dMTDm45o+Z1vKotZ0t9KziKk6e49K+uC7Sv86Jgp8oOAZXJgAH5kudCqz8ZS4ntVT5teMIyCWN5OXFfo8Bc3LtR9qK37xrZ7RDQ86U5jMKOuC6Rhh2EloNMHz00+Btwm+IqvAHUHTlwMBqGW796O9lXydqZ7pTNd/W+28zFI5/AvkTJBQ6s/oxpAc18I89gHCgZHCp24LMCJMz8mnM5ZLal1cGuJhVg5EGkjRwBYvWsjFT5KLM0ZA68pZLnpDVqDKb8aUMbkQOJRg3bayKP4qx6BekQCu9pzSVhNnC6BUn0ZabSrjotC/tVJSYuI986eVCVU=
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799015|23021999003|19110799012|25031999004|24121999003|22091999003|6090799003|5072599009|15080799012|52005399003|40105399003|3412199025|440099028|26121999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUNKVS9TMGdXYmdTdFJwdGxCcUtyc3krYVRPUWgvQi9PajJhdDNNRDFuc2h4?=
 =?utf-8?B?YUdsclB6UFlCZmJ6ZVgvVGdVVVpZbStvWU40bVRMVEtZTmVnQkZYbkYxQThP?=
 =?utf-8?B?MHhWR1E0MGN1L3p4eHE2cG4wdXB0Q1RoYWUwemZHWG9QUlJQbkVNWTFuUmZx?=
 =?utf-8?B?TGFnekgrRjVXV0p1QUExYzI5RVNIclozSG8zQmh1UWN1Sk5qaHNLTnMxdDRs?=
 =?utf-8?B?NDNEVGZjamRSNkVJaHkzdlpqcWprdDFSMGdzOGpORHZLN3RIdnFDL2dRa1VV?=
 =?utf-8?B?VXBTZHk5Z0ZNbjd3cExVSWRJSUUyaTkyajk0M013ZTNMckVtN1oyak5OS2Ja?=
 =?utf-8?B?eTJ1MzVKTk8xQXY4S1gyb3h2bjEvN0theDh5cDhTa1Zlb2k0UWUwTHpwSVFt?=
 =?utf-8?B?TnZWYjdZcFhZMnQyMnlGanp0Z2w1eXdkdnRpZ0NJbkZTTnhMWEJ0L05UUjBX?=
 =?utf-8?B?MTRHQ0JtVGhjZVBkSlI5bGcvSmMwb012YXhSQXFZbXZiMlpFRmxodkNlQWts?=
 =?utf-8?B?YWVWTTVodmpjZms1MGN2OXNuVXpnZjN1TTB6ZUg1REk4VFRtYUhycGsrbHhC?=
 =?utf-8?B?Z2ZPbjB6cDliZjhSeEl4T1VLN0VkTDQ1cmRmVTc2L0FPaXNNaFYvS1ZpLzRL?=
 =?utf-8?B?S01NZ0M3RkE0czNOQ050a2xHK25OVEFHcmxidnlRK296Vm8relIrVjd2KzdH?=
 =?utf-8?B?RWtCelRDbElKSmZCUmVta2EvT0xXcGNTcytUbFI2MzZpM1Y0Mlp0TzlvR0hq?=
 =?utf-8?B?Y3VUbktvUzJFOHdFUmljeHdEU0IxVjRENm1TekhkQTdrNEpHR1FqL3hQOVlQ?=
 =?utf-8?B?S1JJMWUwSUQ2d2NGd3VDQzcxRmFiZjdOSU0zRUlFYWVzZVFQaWNIVFUxdUNN?=
 =?utf-8?B?WEZCOU1vMjIzTGFjdUEwWXlMN3NhR29FTjNnbmVtOFl2QnlTMXk3MGd0dG1M?=
 =?utf-8?B?SHNFYU1NQ0g3RHFFaXpsbW1TV2ZmblpOUEdPdXFKWFRVdGRlSjluaXphbDhU?=
 =?utf-8?B?Z2V3Y0xIYTJ5azBYZURqcWhiNDcwWXBaOFpiblpLYUU5bzZBZGtMclEvb1ps?=
 =?utf-8?B?WXNUM0FtMjZzWXFwTW9sRTR5aXJ0N0tRSnRMQlQ3bVUxT25KWll5WVYyR2FB?=
 =?utf-8?B?dGNlNFY0UmhvZjBMQ0s4NkUvUFlGamtPQU5INGhLRDV0NzZha2VTRGUyWFRi?=
 =?utf-8?B?NFRScGtGSVhxOEp0QStOdWMzeGxEeGROcnBKa1cvQ1ZKUGM1bSswQisvZDRn?=
 =?utf-8?B?aEpPTXFYZ1RHdzF0RWtMYlgrTmZCU3ltRkRGc25ub1lvTUd2VGZEa1g2Z09S?=
 =?utf-8?B?d01MdVovZWZHaFNjd09oMVNETUNjU0lLT1J3UkdpQzBXSWNBUW5idmV6S0J6?=
 =?utf-8?B?ZHdaU281RzFyNWc2SWpaV21BeGN6aCtQbnFLQVhGS1p3c0FlYzQwdUJubytW?=
 =?utf-8?Q?yVkWAbsM?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxTNm5PdEwxdm9rL1RwWDBtcjFzYTkvRUczOGNuamovZkRXb21aVHJpRFlF?=
 =?utf-8?B?MXdUM1F4QkpWazJPQk9KQmV3cVhmZEpRTTFHNjRZbWgzUmVaWjlUbC96YUpQ?=
 =?utf-8?B?YmNkcUx4czNobkZpK0lkTi9mUmM1NXE4dUFJVFFzMGwxWkZIQUgxNTEwUkxa?=
 =?utf-8?B?b3BEWFlzcGY1ZFREUnNGREpaTEs5ZmpsV3o2N3hQbjR2c1NxbGRvZ1lSc2Mv?=
 =?utf-8?B?RkMzNXljQnl1MDh1VnRXUVVPUXI5NFcwZ3BtbFZXeEcxekV4WW1iRGVSVS9W?=
 =?utf-8?B?amZFd3Z3dCtiQWU2THZnK3Q0dFBBUi9QRGIyLzBRQlZCUXFyc3B3UWZwYkVj?=
 =?utf-8?B?VGRYVk8yZFF3Y2JnUzdvS0RJNGIrREF5dGRYM3NyN01mb01UVTdvZDE4cFNP?=
 =?utf-8?B?elhHNlYyd0E1TUZ0VHlwSVRtbTUvbjR4RENRU0JZVDJ4alI5NnlpN3Ayd1hp?=
 =?utf-8?B?ZmxFeGR4dnc1bWNWVDJaeGkwcUk1OHJmVEFKOVFQaS9wUVFXTkV4eU1tcStp?=
 =?utf-8?B?aDZxUE9FandlUUE3T2QrMC9SN09kMEg5dDhDbjhXNFpxdkNtNkNtRlhyUVV5?=
 =?utf-8?B?Um5HWCtiWWNVQVVOZE1jOVZNTE0rdGlTbzhLaisxNjQ1clFUak1jTGFSTkF6?=
 =?utf-8?B?TzNZM2R1ZUpPYmZEZHYra0VHTHcwTlRadVF2WjgvWWUxNGlFU0U5cFdwUVBZ?=
 =?utf-8?B?YU1Rb0l1Q3dsYVB0MGpEc0FBaEVmWHJmZXV4N0lxbnM2TmpPM1Q5UGk4NzFL?=
 =?utf-8?B?eEJQWDd6WW5rZEREdmRoZ25aM1pGaVM5bDJFdnorKzFQb04yaU5sTWhsVzFV?=
 =?utf-8?B?MmhtcDRNUFBiK1B6dDd4bDJTSHV3S1dyWnpTbHdycDdYdWhVbzRoaUVUTVZr?=
 =?utf-8?B?VWxaT3YrWHUzZzBTQmJwRXBoaGM0TkNEMUE3WHBQcThORkxYR1FORThnTDZI?=
 =?utf-8?B?OXRyb0VnWUFqaG5nSlo3UHExNzlUSyt3QW5ETk9HQlNULy9aemJua3NVRndE?=
 =?utf-8?B?MHdEM21ld1VERFlMb29WZE9VcnhUdUs4QWxiZHRwcmVKYWFWTzlUems3emwr?=
 =?utf-8?B?WjlBZ3YzSXN6cmNpeWJKbVprSjFKb1lJbmZZMk16NUZBNmMrSUlJRkxIbnRy?=
 =?utf-8?B?OVZ0a01EaHFrTXVjTUhSMXBlRFc0Z2VDTmo2aUpXUHJDemNub2lxUjdudHhy?=
 =?utf-8?B?YmpPbEhiRVJTNjdEQnVQQnVGY29uNFNrNjN5Um95dTBmNnkwdHQzM3QzY3NG?=
 =?utf-8?B?S1RIejUzR241UkUxSmI4WlB3MHZ1YjB3MjVGa0srRW9EYzE3Qml0MW1jWmxv?=
 =?utf-8?B?TFE1YkZvZ21RYm16Rk05aVlxQndRM21ZczdYWjlFdjBhblZYQjdRa0xMVWhB?=
 =?utf-8?B?aHIxUWI3VVpEclRXeGI2VFREV3FPWE9MOXo0bkxGdHBmdkQzYjJlY09mZ09G?=
 =?utf-8?B?ZlpOVlRNVDJMb0FseWZuNGVQTEFUaXNHcWd6MkdRM2pPaTc0d3BjZmtxN05t?=
 =?utf-8?B?Ri95dnNWTFZVVi9ndGNKSXdEWDJLVGdueXhzY2UwY1JJa1psNCtoTmpzWTVn?=
 =?utf-8?B?QytPVlV0a3pzaE9pSnhsNVlGOFpCbjJRYURZMHF2RFJ3L3RJeXE3bFVMWGdY?=
 =?utf-8?B?NWdxcWNHemJsWSt6SWRScWpYbzhJUWQ2K2NkcFBuYzZySVNPV3NqVDc4ZjhF?=
 =?utf-8?B?enQzZk9yMjVIZDErOXIxQkRTbEw0bDg2dDJOTStFZDZHRkxFWVI1UXQ3MXFW?=
 =?utf-8?B?SCs5WHZWNmFISzBXblZ5RXpWYnExZmhSZUNvWmFjejdXdTVQWTY4UDdzS2Nx?=
 =?utf-8?B?Smx4b1ZzVVhwaUIzRmVRUDYrOEEvdFBtOTg3TkFJUWdwTExVYkxrN2s0Y3Vx?=
 =?utf-8?B?MTVZZTlXTWdjRnhYZXJPT2JEaEwzM0xSYStoQ0JhZkZDVm9GNTNlRklRd0tH?=
 =?utf-8?Q?8r2rviQTjW6kdRJ6P3nm7mGuiHlXdPOO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db10496-9089-4877-b8f2-08de943b4001
X-MS-Exchange-CrossTenant-AuthSource: MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:18:53.3524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5PR01MB12608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_171908_291598_AF21E175 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGnvvIwgQXJuZCwKCk9uIDQvMy8yMDI2IDY6MjUgQU0sIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMDIsIDIwMjYgYXQgMTE6NDM6NDNQTSArMDIwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPj4gT24gVGh1LCBBcHIgMiwgMjAyNiwgYXQgMDQ6MzksIENoZW4gV2FuZyB3cm90ZToK
Pj4+IEZvciBDVjE4eHggc2VyaWFsczoKPj4+IEp1c3QgYSBtaW5vciBwYXRjaCB0byByZXBsYWNl
IHRoZSBjb21wYXRpYmxlIGZvcgo+Pj4gZG1hLWNvbnRyb2xsZXIgdG8gYWxsb3cgc2V0dGluZyBE
TUEgY2hhbm5lbCBudW1iZXIuCj4+PiBOZXcgYmluZGluZ3MgYW5kIGRyaXZlciBwYXJ0IGNoYW5n
ZSBhcmUgcGlja2VkIGJ5Cj4+PiBETUEgc3Vic3l0ZW0gYW5kIHRoaXMgcGF0Y2ggaGFuZGxlcyB0
aGUgbGVmdCBkdHMKPj4+IHBhcnQgY2hhbmdlLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENoZW4g
V2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+Pj4KPj4+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+IElub2No
aSBBbWFvdG8gKDEpOgo+Pj4gICAgICAgICByaXNjdjogZHRzOiBzb3BoZ286IGN2MTgweDogQWxs
b3cgdGhlIERNQSBtdWx0aXBsZXhlciB0byBzZXQKPj4+IGNoYW5uZWwgbnVtYmVyIGZvciBETUEg
Y29udHJvbGxlcgo+PiBEb2Vzbid0IHRoaXMgY2hhbmdlIGJyZWFrIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5IHdpdGgKPj4gYWxsIGV4aXN0aW5nIGtlcm5lbHM/Cj4+Cj4gSXQgd2lsbCBicmVhayBp
ZiBhIG9sZCBrZXJuZWwgd2l0aCB0aGUgbmV3IGR0Yi4gQnV0IEkKPiB0aGluayB0aGlzIHdpbGwg
YnJlYWsgbm90aGluZyBzaW5jZSB0aGUgRE1BIGRldmljZSBpcyBub3QKPiB1c2VkIGJ5IGFueSBk
ZXZpY2VzIGluIHRoZSBvbGQgRFRCLiBBbmQgaWYgYSB1c2VyIGZvcmNlCj4gdGhlIHNvbWUgZGV2
aWNlIHdpdGggRE1BIGluIHRoZSBvbGQgdmVyc2lvbiwgaXQgaXMganVzdAo+IG5vdCBmdW5jdGlv
bmFsIGFuZCBsZWFkIHRvIGEgYnJva2VuIHN5c3RlbS4KPgo+PiBJIGRpZCBub3QgdGFrZSB0aGlz
IG9uZSBmb3Igbm93LCBuZWVkIGNsYXJpZmljYXRpb24sIG9yCj4+IGEgbmV3IHBhdGNoIHRoYXQg
a2VlcHMgdGhlIG9sZCBjb21wYXRpYmxlIHN0cmluZyBhbG9uZwo+PiB3aXRoIHRoZSBuZXcgb25l
LCBpZiB0aGF0IGlzIHBvc3NpYmxlLgo+Pgo+PiAgICAgICAgIEFybmQKPiBSZWdhcmRzLAo+IElu
b2NoaQoKUGxlYXNlIGlnbm9yZSB0aGlzIFBSLiBXZSB3aWxsIGhhdmUgc29tZSBtb3JlIGNoYW5n
ZSBvbiB0aGlzIHBhdGNoIGFuZCAKc3VibWl0IGl0IGluIG5leHQgY3ljbGUuCgpSZWdhcmRzLAoK
Q2hlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
