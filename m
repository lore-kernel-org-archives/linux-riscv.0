Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13F3105A592
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8XRSX4kyhDp2cTlem/I/w9tkn0gL1HCk2vMaHimHKd0=; b=qD+HsOmO0zdN5sezOq2X0YUOBM
	/0jk3dfXm7rSqQlT66zIFq7WAmV+By5WR4Fw+L9lbLLP7NALFoYZg8GrkXXp1/IxRs/csMYZyZRZE
	74jt6n4VeUTi4IPs8x5p9W1/sNeKpAJLmfpDSmhMKbbxstdNlRq4fJ9k9/DDHK2IK4S1kOZmVw9bo
	ojkxLPw1sG1XHQN7Hvj3oV24FANs48InKAmw3n5kni8wIHqf7W0DqIrswHib0EgvCrBPNJYgnMWLu
	pyemFabw8DhoJ/kQLq6BHFK1nXDqFaMseQTfi/UF0fgRwxnSyekTNxZo+zStH2b3u/QLGYOldRjzk
	fIe6xKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0epI-0000000E06t-0cTi;
	Thu, 12 Mar 2026 12:07:40 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0epE-0000000E04L-2Gb6
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 12:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcIMxBHtF5SD6Jb83XaSulMaJJsvAf0mJLX8w8kY+MI59UCmMkw33A33P+Fn34kLOCRo0+5KaXd6weKFs39hx/RebbW5QSf4BFvDKlMgn0gDpQUapCSeuo2TGBDZ/YByXea7+cXPZFVsG4iEDLgH3YpprqUqEHvrh5CS86UJr/cVeToz8iuRb2Iv0hcvXcBf5dombJT4jg7CqJlLhdHxMjMU393Cr7TmezZ5wFK7Wumzv+IloWbiFZhyoN6DT2GBasp4ULHKBg7qisSru0pHbDvJiuewOFIiKqYUXKrkyaVZoqcRies0/CS1b72q8ZWAIMUZMUX0v/UZIKsEQ1hG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiGpaKx6/iPwqIT64tlwBYNYvd4iZrInmAgYXisBREg=;
 b=nbgoHV8VzxYRSN9mPH80kenWdi9nBVK9U4rR25Ip9GPsg5LxzdcFwAdYy5aRrN4bywdoMR9sAxOjZmYPrKSwxxEp+Av+fhAYfrzNaIz3191LhuUdX6Cl9e3K9Aq2v/zyMW3ntqzLWsmbguv4KvDb4KIjKc4DO1Re+iNYGymH5+xg9axpmJCkYGYzwf8sBgR7VrMLMOUjJapR3n0A3o9hocDZ6AQbZZrQFZfRg2hkMu1YD0r5NyJi13SLF8nqrGB4YGIuR93TbiHaO9nRtA1SSWaDLp5Na4z9TQ5nJAuWjgCBmHgyzqYXChtCN3RiPAkYlDIx+yiKRl8KSL8aWG4A7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiGpaKx6/iPwqIT64tlwBYNYvd4iZrInmAgYXisBREg=;
 b=l7zWw4o159uKa2MRTOiqFPMXhdyJuhJL52tg/HAmIrejNgEoiNrisSh6qj9bBqnoEdYUgxlqsvsA3xCEKGfyf523HbQ7Vq/dOUuKGamfaBLLFu/RtiuILKfusfqIAIkcRaqmfqfFKliHbkiXSfwhV4jrYNYBts97jNwu3mudMPs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by AS1PR09MB5520.eurprd09.prod.outlook.com (2603:10a6:20b:4aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 12:07:27 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::ef0b:e667:faa1:bae0%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 12:07:27 +0000
Message-ID: <2f7e6430-5a17-40a0-8d29-9dbee75c3be8@mobileye.com>
Date: Thu, 12 Mar 2026 14:07:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/riscv-aplic: fix PM for multi-aplic system
To: Thomas Gleixner <tglx@kernel.org>, Nick Hu <nick.hu@sifive.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311143749.4058818-1-vladimir.kondratiev@mobileye.com>
 <875x72qlav.ffs@tglx>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <875x72qlav.ffs@tglx>
X-ClientProxiedBy: TL0P290CA0015.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:5::7)
 To AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR09MB6296:EE_|AS1PR09MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ea17e2-e930-4383-fdec-08de802fed84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: S9WeUFWbaUC1uxpJIidLJvf+1Wvcwa4pAITWpp1EKBMiO4Sm/9DKHnE45uRLATOjYAwYuMYGYN9X00NARY2lHT1+w5OAgVYx2aRuN58AgFhZexfUep16WNqioNhu+EVJ0pemHzZcLVWzKmiuidR5jvrHh2HAUbKVIdkC2bqeEAvnqtcvebdKT+qWSd5A2A3E4TUdsMG73z8GEgAR8D5P8+U2AmfClGTGJkAchF3CJ8891/6mpCrfUnEdC/cVVLZh8b5Pq2+YzOrSIx4yh1NId8Ec1fpxGXU/Ggp9FzVi7r68fo4bkRNTsoTLlKoQkr/02z3FUBPrINUuy6KnRm5juOgIIwEeV7z5zjvMqG0YSe2wNqPUZloEtuyFbS3Sc6UD1MO+YqfbQYPbr6SMst8smKOpj4OWXA2XPEZrWc6pwm+d7JRpGYDesx3Hq2cTzt4pRPuumrF+CrFd3KgblgclsEx51fbNtUMv4T4XOH1uQluZukq5T7V9TlLWLLTzkGbx2bj6hIGsyBHi1IQ/J2AB0xfOyJvO5NbBCAAcHds9W+iVxzB32epcwUlqXxX1tbQIaAd71skjD7anvz3rNO8GoAKhmQEU/SbbFmjGc8yUe9uqYl7BZ9sywzaFWszXGkXXS0ol/+Xvs57tDjibJ+BzkV6lKILyWV2wXG9SASwJiEk/tOyUaJOYIDSZzPNAxW2A0TYfvDfpGQeVbErccKeaze0zQi8QApNs1hY0OAhRd9MyXiBkueZu3G8SSq/3fqyR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTV4RzNoc1dwR3NZM2RheU8zU0F1QnV4NmFtc0paWUlybkNiZnFZdXdVbXpu?=
 =?utf-8?B?dzJQRUVMQnlrL29DY0NxRmVRQWRRNS96V0ZIT0pmeEl2VGtSZU0xMHlnWThR?=
 =?utf-8?B?SUJaSlhQbVgvNTJCWmcrSlNYQ2lQaWVVUm5iUjlnZ0JIRDhScHhXUW1pcTJS?=
 =?utf-8?B?TUR4bXNnQUkvTnpEVFAvYitEYXJvRHYxNjlCZVhtTHFrZG9aRkdOMUNNK0lO?=
 =?utf-8?B?RlRIS2kxNHRTWGd0ZVlHZmdnajRUcTgrNDJ2djhVTmk2N1VCVEIzWnFWeENa?=
 =?utf-8?B?dVlvQlNxQnBzMEM0Q1Z1aDRLQVNIRCtTUjNiQ0VHbll2dDNkMjU5VXo1SVo3?=
 =?utf-8?B?VXR2QkI3cmxrMGVxelR4YUJxT3ozck8wbG90cVV1U21kcTlDaTVrUzFtQ2JF?=
 =?utf-8?B?NFhkS3Z3S3o4UTJxdS9FSDFuS3dKVk96akd2WDMvQ2RXcXo1RDg1MmxsVVVL?=
 =?utf-8?B?RXBmUXdWUnlPQ1JvY1ZpQVpvRjI0a0tKTzBLMFMwS1hKOE94WmJlSUVwR2pM?=
 =?utf-8?B?Kzh5eTVyYmNNV1hBTnB4RlFkcWcrSEpJQmJkT1Q4TUVYaXF5S1YrUHRxalp6?=
 =?utf-8?B?MTZaUkljM0MxVEVLVGViOWNuTE1DSnlJK1BxcjVSdmNDUzQvMElJSFdzZ1Vr?=
 =?utf-8?B?WS82dlZSZzEzVzQway8zRDhjZlZCaVBITm9qNHY0Tkp5aUFZRU9WcGJ6L0s5?=
 =?utf-8?B?WHlkKy9ieFZIWnRxVzJkUlErVytsT0NCUzdXWlJ2SXo2ZUluQmVUbUpCcXdE?=
 =?utf-8?B?enJqL3FmTTB2a3VRUXcrd3F2YTlSOFpvWmlEOW9pSDAzOGdFRWIwTWk1dWli?=
 =?utf-8?B?RGRDcjMzUjJubCs1U0svSGt6dWVGcVdZYnExVGQ0TEl4bXNDdlhRcHpjWU05?=
 =?utf-8?B?eU1sN2s4cjFwcTB5S1dNZ05tZEdENGYzUlRpbFJjRUM5dlFRdkJWZTZCL2NN?=
 =?utf-8?B?K1UzY3pzYS9qUktBcVRrTUdrRUlRRmVidGwwNitjOTMyOU16K202d25pSWNM?=
 =?utf-8?B?ZjNjcVBMZXFMUkl1QkVNWHhyWk9UQ2VHbStFQy90OWh3dnZXdUh2T3VpMXNo?=
 =?utf-8?B?OWlZZkJUUThJa3RJamljdFovczlPMHRqcVJRWmVtYy91MVhQR3JTKzBOeTZw?=
 =?utf-8?B?TktyVzI3TlB4SExwWXBMK3pUcVRQL3NpQ09mNldpWWVEQ28yQ1hHVmo4Vnh5?=
 =?utf-8?B?a3dPbWZpWlBITlBrYm9peFhDek1wc1prRzlSejFwUzczMWFHb1NINXJGRHpW?=
 =?utf-8?B?cXJYYk1hZ2VMUzVQZ2lEci82NytmUWNjbzRmak5VZUptejQ1a3ljNnRSdjRR?=
 =?utf-8?B?SVR1WjdmeFg1ZnNkL2FrNzdYOWRUdEFxWlYraExDWWxiaWlCS1BwZEJtTG1E?=
 =?utf-8?B?MGRnczdCQmhmRVFBQnZZQkpKNDFEdFd6T3pualpsMmJwRzRMd05ONHgwamhu?=
 =?utf-8?B?dmhsM1djVmY4Y2IzeXFmcSt6QWNXUUZaMGllZW5JRU0zb1hNRTJTaDRwT29Y?=
 =?utf-8?B?TC9xay9GREN0a1pUNlF5Z2Z6eVViYTdTVW5KNEUvMFJEVmNaSXUyY3BWUnRI?=
 =?utf-8?B?VlZpRTlLcDZxSkRmeDY5OHNnZGJIM203Wi92SUNJZ29UcnUwb0wvaWRmMzdZ?=
 =?utf-8?B?a0gvWG11bEs4QUF3VEl5cnl4T3NFQ1ZqRmJRanZVZHFxNW5Fa0JYQVRId2tv?=
 =?utf-8?B?bmZ6WUtYSkI1cGI2S0VLRFpjUWRiNFhWUndPNXFVZWx2TWlRWVpCSUoxS2p5?=
 =?utf-8?B?WUdndGdIdTMwNW1IWEhSYk11M1UyUFAyRlRtWW1rVUVPUlRGK1NrRjRMeFkv?=
 =?utf-8?B?UlpIQ1lkeW0rbTZzREZHbExCNDJ2d29mVmE4SklGVmtOZHpmNTdxamNYOGcx?=
 =?utf-8?B?QTE0Zlg3RjByRGFPSjBOdmZnSlh6ckdzeEpFM2tBTDRVOXdvc2p4REw2VVl3?=
 =?utf-8?B?NDZJR0VtSmZYYysyZUI4SElGVHRsblgxY05tbkgxNnREOU5LZnQ3anNmbEI2?=
 =?utf-8?B?TVYrT0t0OGpEZ1FsZTBDYk1DMGlyMDVCRVFndDZOemtCZ3RFV0g3bWZYK1FL?=
 =?utf-8?B?bmRoYXFUNG1BdGxrVDcvSTVqL2FES2RVeG5nN0pVRy9Cc25tMW9nd1VmV1c2?=
 =?utf-8?B?ZVlPNnRFWjQzYi94UURkb0pJQ0RkNlYvektlcHpKUmJBUUo2U2JDOTJiWnpO?=
 =?utf-8?B?a1JQSlJ3cTJYc25TYUZhSGJGL2svT2dhSW1ZQkV1QmJ6V1ZNVUZhUENNbjVT?=
 =?utf-8?B?djI3eXlLUytSOXdyNG84aDJPck0vc0l5bnZaQ3hNeWFlRG51dmNpV1FJQzUy?=
 =?utf-8?B?YUQ0QW9pdTBZR0FxSTF6SHUvVDk0NDVod1FmY0ZBdHBzSnh1cWlUZz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ea17e2-e930-4383-fdec-08de802fed84
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:07:27.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH4JD3b830pMDIITybJcCUrFWvhhl9dt6IjPNLdcHlZTOCJYtDcEuTtTDlb0N0QijkE3NrRvlS9ZMfggNCVTdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR09MB5520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_050736_780196_433FC034 
X-CRM114-Status: UNSURE (   5.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/11/26 20:21, Thomas Gleixner wrote:
> But nothing to do here anymore. This got already fixed correctly:
> 
>   https://lore.kernel.org/all/20260310141349432DBRJJclgnBHYWu8it0geX@zte.com.cn/
>

My bad, didn't saw this thread.

Thanks, Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
