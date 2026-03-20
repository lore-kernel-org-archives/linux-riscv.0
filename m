Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B01109316E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 03:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNKS/qQr5/9bUYtfLlCjrIyMNHupkc5MvbcNz6MLyrE=; b=Vr0qSIDtp/Y/2uOf/J6Xlq5Mne
	tRDrFh/KDcOTn64REYnUXjA9zpRDjx/uptV4QIN64VomrLSrwjPRmnOwg03TWKxcavAWHqIvRUU2u
	vj9/pPTasQ+kpLzBXApjXeCDlQlsRuRuFh9SfzONtaYP52pnzybIjKL1nf5U5b2koHx1azemTnyAg
	cQW6hJcAt4z8d6SxL7suxxibdWtOBt25iEBAp0Iz9ZAfC1gKwGYcOl9qr/FA4P7YTzWDNhqLwqrs9
	fKuMDeovNSMSOMJtixS3MGdbKEkeDEVSBTyZsvT8EUnD0mtC04+NT1Sm28FWT3eYYto8TUbmF8Z46
	+3KYj8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QZL-0000000C1Gn-2jLx;
	Fri, 20 Mar 2026 03:30:40 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QZE-0000000C1Ff-20zi
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 03:30:38 +0000
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2rPcf1758979;
	Fri, 20 Mar 2026 03:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yJ5Dv6Immu34SJYMb7uz3qmp4qV9fUP2uIODBCeAWLs=; b=
	kDAI/wZq9G1rbQA8Tc/dj7yv0qAuy8nOB2CuQYv7mbsvhjtmrNkD+IEVWGD4ylfz
	4NGIXj1DJVgvSwDDOyiPTCX/1gL99zaR3iBE/zIdhV7kg0IRxF8gxApfdtq4X9sL
	1usbgV4VSp2S/+cHLqgRUqKo+EpueaxiKLFDPLq5+BERKACreK6g4QdWradBSSFs
	XShKrLkjp3qloGxZtwzREdLRtUdGrdSEJEeU0N0SuFid4mNgf7Zbu5SBlVP4gFQA
	Df3/yIovgR2MRjE0ROHa7fSIlQdsI9ebIw3gioIsbAvBcW0YDLQU0V7i6xo9ERPT
	Zm4hRnrR0GtiB3+u9vRr3g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010021.outbound.protection.outlook.com [52.101.61.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66dc5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 03:29:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FY1DdGwCK+LwbgdrSJc6drii9rpBEQQyyfDhp6QLNWY4OX8fqlXY7zc9FKGiZHj5G4+xont54OOohKYN3JRuVmoqxPCvYA+BBHPBSBsAcCuWpAAOywKJw0k8i3ATDlGkejW5Nm0NtTXtm+/GuXwyizxw4ZohqQHS2s509xgEoB7cn+2Q8Llxi5xQk9UCCz1wpCNoqu8TGVsfZ2O8mnQqPwJ/9kp98bphLXMvpUHpZeF1O1AZ909qLNkLGPRIWnXY/IxCxFhUan9SSGfZEm2rjBRfNAne1LlEfXaHK7waT3ATY8Jw3VLwMtn2QAdElxc6EBMw+v9dKvvcTNGUNnIT/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJ5Dv6Immu34SJYMb7uz3qmp4qV9fUP2uIODBCeAWLs=;
 b=G0C9BFuUsBWdUntwhpG9284rwcA0xk7icc4PRlw+YuV1aolfrfzW/kqsItBbX1AujhffD0PomqSNngctP8d7zpPe1o9Rp2Gt0AiGznSvDOAGj99GZCgmn91jGoPlRfRDLchySp5QYeJ5PXZ3pJZUQJa+63/1ubKm0wAzLQ+z41YDKt5jzSPGfFm0t/+3/2K4MDnoDNEnTzX1LAbBA483ifMmSoFboyIZCejY5MwuTkhBcOkLjWQQv6n2bZGKxwy9IUL7zR5hHWHhj8YxX1RhnzaCGaf8Z+r1c0pC+uvxt3CHKBJi/zTNuGVI0c5yfs7fd6Y/AYtRj8XCzS+FX5/OOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by LV1PR11MB8820.namprd11.prod.outlook.com (2603:10b6:408:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 03:29:02 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 03:29:02 +0000
Message-ID: <06ffdbe0-1743-470e-b83a-d2c9a4702461@windriver.com>
Date: Fri, 20 Mar 2026 11:28:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] perf build failed after 5cf6e76e4f4f ("libperf:
 Don't remove -g when EXTRA_CFLAGS are used") on riscv64 with gcc 13
To: Ian Rogers <irogers@google.com>, Chingbin Li <liqb365@163.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
        namhyung@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        adrian.hunter@intel.com, james.clark@linaro.org,
        linux-perf-users@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <813bc5fd-0c35-46af-aea2-90798154daaa@windriver.com>
 <CAP-5=fW_O_sm9JzfCf=qDXyaffoLLRH3mob1zckESUHsG2rp-g@mail.gmail.com>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <CAP-5=fW_O_sm9JzfCf=qDXyaffoLLRH3mob1zckESUHsG2rp-g@mail.gmail.com>
X-ClientProxiedBy: SEWP216CA0115.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::7) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|LV1PR11MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7ff46b-9ff1-4a15-24db-08de8630d4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NZf1mjaLJh9GpHEWiZ9B+0rStSNQi8pe2ZcZ+FDMYBYG3tcOJ/gl/G0N3UIr0YIW2xVcuhPN8kNPQuKMKfbF3sdjhCDYkhS76+uJrkCUETGI0mZfkKLPh+c1iV3648NzNONi3KM/kZ0I2WauEZKUlI7WfgrnkRGX6kbR8+9bIlp+miNIeJk10+Y3ORwH9srqh/4Gw56srhMLuuTsQ/wE9l0kFqUeXpMDgYu3oH+rHGFC3SDuPXHx3AJ9fZhEOaMk1XNycugWtRwx2n+jLLT3x6+Rua6lmAGbTmSYHuiCq5qZJu9mpQjlu3blLYndj3z+DEBnYlPnsv6haM0itTdKXJfcAygAE+zG9puaPPIemT5ldTGZQpB8D3fjOJule5lyL386WnGNMFdxUMsyz3QZDevv8Fe2C6hYHoeuI7LiGMsLk9M8/5CrJge81Ou0V2+pAyvnhur4jo4F3Qv4h5rVzwMZVxtTaTxvSOZSK38s/LpLpf55l5x8ncnaOPwDZ/aofbMn6aHYBMegzXmZzptQZDxYs8Ng4yBFBj3HTwRYEjS9ILPaTNINTA3/VtVlFMrgHJCtPyYGElUB4ZUXbr8LIqbe1M5lxsCMQr4iej3aaj2qnxahE7DdqYCOMj/5hks8SzH5t4BBUE2lqhkXxt/4m/DaTOXFnLRt/fBRNrYL7+3+yqLnKMtNxs3KBK2i8qk0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azdVdXBCd1IwVjgwUExtTlljK2ljWmdFMjQ3cmF6S1Y2Vm5jaEh0cm5lbjlt?=
 =?utf-8?B?QlU5V00xVmVrOStPQ0ZONUJVNnBYWWMxZHRZVkZ6UnRBVDI0WkxCMnJsaGlJ?=
 =?utf-8?B?ZU9PQ3BmcWdhYmo1bWhSeEVPVFgzYzl6anJIaEp4SWdaeGJjbzhqZWs1WjlQ?=
 =?utf-8?B?VnA2V2F3M2d0Tkp2QTh3bk01bmIzdVlpSUdNSVBPSEtZM0hDSzFROTFIYVZG?=
 =?utf-8?B?V0dSUHp5ZFJPVk14YlcrVGg1Nk9kMHFjZ3p3ZVlsVEZtTkIxcVdhNUxmajM0?=
 =?utf-8?B?ZUtGWHU1bzJxcUxmVmQzMlFTMk8vTHJwNkFNdTRlVkNVVjNqRWFvNzR5TUhV?=
 =?utf-8?B?WFJYMVRUbkI1V3NYN2pGa0dkS0dmL3d0RG5zdXNGNmh2V3hTeGNWZmhiaURE?=
 =?utf-8?B?dERTeVVuNUhLTUQ4OE0yMFIvd3p6M2dHd2RaRGtKRWh2NHRHaTFGYlZyQmgy?=
 =?utf-8?B?ZFBGNm8rRktiTDZXMkJZZXJsRllURC85b2J1TGV6djlLQzZOZHNlMnIvWGhO?=
 =?utf-8?B?UXkrQXU0b3ltTGREd0pncnViTjJUTy80d0ZWN1FmNlRvY3c0bDZid1NicDEr?=
 =?utf-8?B?dnRaVDVWV1J5U01uQzFMM0pmbkluMVZZc2t4VTlhWHh5MThGSWJnQzJseFIv?=
 =?utf-8?B?WFVsbWFpY1lGaVVOSEJFL2E0SGs2NWZSbUQ5Y1VReGJEaXpsSHhCN0ZEdllt?=
 =?utf-8?B?RzA5WTU5bzlhbk9UUmZPVjBVS0RwZHhyUC9STWJvUkVhejFyTEtncHdPcGZh?=
 =?utf-8?B?Q0xiV1pWc0lhanc0di9jaWhwQkg4ZG8wK0lkTkxzOWZFY1VMa29yMW5IZ0Jq?=
 =?utf-8?B?Tjlpa25xTVVSZUFGTjcxeFVrTEVMdUN5aUdQeVV1bGUvWTVVczhFU3FGVDlu?=
 =?utf-8?B?TEdSQjZSOFQ2OTRPdS9NNExTb1B6TnRMZHI0TWVEQ2NLNW04bzB6eEp3SFIx?=
 =?utf-8?B?OUp0a0xXOEJyOFF5dFdnVmtWcDRrSUFVcERXL1I2MmhaTVZqUmxQL0hFcCs5?=
 =?utf-8?B?dVFnckhQRG4xZHBqNmdrU29vZVlCZWV1SkszT090V2tPS1VWMUMzVWd0U1ds?=
 =?utf-8?B?eGN4THJhREplV3pEc0JlOEU0OGxncjA3MmZBTzh6M01EVHJYYlMzckNDR1hv?=
 =?utf-8?B?SkxCVTBGemNsV3NoTGxKOXdueGZRUEg1ekhCSzJReWt5ZkhrUkltSGZ4USsr?=
 =?utf-8?B?RUJnUTQ3VGxiUHJweGxBaU91WnNiTVllcVVGTnFPZjRnR1d5ZlJNMGVGRUhW?=
 =?utf-8?B?UEtiLzlzQWlEaDZaSlhzT1BIY1JIOVlVdXR3VGgveTBQNEU3aFl6ZFZZWTJR?=
 =?utf-8?B?WTNIWCs3QW9HbUxLUUVpdkxhUlZZMjloNW40QVIzcFBwWmdnNjcwclZNbnVa?=
 =?utf-8?B?TTZNVWZzV2JEdHM2NHdIekRrUWg3d0xtNGNHZkpjL2F5K3FibnlFT0lGbG1v?=
 =?utf-8?B?N3hiMjhJNndPWXRrWVdOaGtNb2VnVk1UZERIZGRyanVmemNQR2h6NlFOUjcw?=
 =?utf-8?B?c2JLOHZHT3hobFhXUkdKMVI2em5KWGV1TW4yR3AxT2JqZ2R0OTVoS0J0OHQy?=
 =?utf-8?B?VGhuQlE1S1BteUkvMnpkV3pHalJxVzJIL29OeTIzUHZ0TFljdEVSWlFia2RW?=
 =?utf-8?B?SEpCcXJseVJUSWtBRnkzNHFDRnBtYnRpb0Izc0lCaU9uMzdObS93MGJCajJW?=
 =?utf-8?B?d1d1MVcwdUI0ZGhLUytIaVV4Z0FIMTlpN1RDTGNvR24rS1dLeko2V2w1VVR2?=
 =?utf-8?B?L3ovVDRodjg4dVRBSS9jOUVwQTdMWGk5MXRWbE5acWtpNGlxU1FWUFdEK2l2?=
 =?utf-8?B?TWY4T0RmZExtWEZlVUVvbVNua0FVUTBwV0Y4dWpWUnBXZUt5QmJsQ09nc1RB?=
 =?utf-8?B?Zzg1clZJTGJ6SFV5VzhLbHhLcmlGbGVlRkd2d1IxR2xOTHptUE95dThKMHl0?=
 =?utf-8?B?cllOV0tvdGJ6enNqejd3RnErMWgzYUpvWjZRQUZTUnRYaklIWE1WdTAvL3VK?=
 =?utf-8?B?b01zL1piaWRMVllGVitoL0pnWWFBTmxSRzBhdHJITG1nZ1FreWJoMkI3Wi9H?=
 =?utf-8?B?WXdOc1dVSGw2MEErSCtPdzNjK2d0WnFDSnZhZnU0NnUzUG95Y29kenhwMS9E?=
 =?utf-8?B?RUZDTzRNR05GS3J4UHM1aWlGQXoza0YxL0F2enR2eGxydXpOVEhHVUZnc05m?=
 =?utf-8?B?ZmN5dDVFT1NWajkwZVpVN3Fad0xCYVQ4RXlGcG5XanVpblVMTEk5VDV2dm9E?=
 =?utf-8?B?Y1RETGJJNG04S1ZoL2tFMlpscXdMU0VFa2c1L1FPRS9TMHNiVDl3UTdQZDI1?=
 =?utf-8?B?RENtSGhtREM1Wkw4dDFXTUE4QjF3OU5RTUpzVUREcXhGMXJCUGdUV1htSDkr?=
 =?utf-8?Q?jw8N9kfdJcwdMRT8=3D?=
X-Exchange-RoutingPolicyChecked: g6b1Xx6hvAA8lRsE3UTvyeYPGCDwXLG7DmisMwIuTk4/hgCW8pR2DEPdNE9HyzVuOeoIBnNKz6yJGPKlYovXlxghsRj8IIQYCnqLecyzSVCM/R8Khi+sAfZnBhuSNv9cMIyNN7dbpobplo82sgGPxsLsQBeDQHIMiuy2YOJSWmPbU/9rGIaUBVe4bbURnumx1Yje9almxrIt69J7yPrLMzVHCoA3xJaJabzHphGMG8XOdJ/Zo8TCl5lZv/d74i99zX4WwIfZJ36Amvorsc8aO6LWesaIS6AjzytgOgSDCZLI2UKCVlFpOFYO1Wz8Uo9BqqE++zh/CqFBUUyha9UfaQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7ff46b-9ff1-4a15-24db-08de8630d4c7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 03:29:02.3104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIDL45LpYyU/zY83IeamWDqDuZKuL0yFxkGIf8dUqfG1Gm1+n4JLZ9bHpo9gntUsucYEPKUD7+FdZK7WXkc3MKrVjf7yau3vQMUsGhx44qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8820
X-Proofpoint-ORIG-GUID: G6gqpH1Mg9e7_p_n10PsukcYTv2zYSEL
X-Proofpoint-GUID: G6gqpH1Mg9e7_p_n10PsukcYTv2zYSEL
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69bcbf01 cx=c_pps
 a=RSwuJLpHzOwHBpypAu37kQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=1XWaLZrsAAAA:8 a=iGHA9ds3AAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=IJxojsRzdbPxS6_aMgQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDAyMiBTYWx0ZWRfX/k8kia08zAsS
 snzL+51mTiYFfLMAx5rqOI0KUIRot5fNFjVk2XDICLorgZGgn6A33pVkdXFpSQP+5M+XDMUE8Tr
 v4NUsYLhnO3lUFT3HZvQwjuOgXOuJn2vFYfDoM2m+ZrYQEukQFfBZ0bGirxFuHl0e5mChlL33/C
 +UA/pT29gCK/g/ZwH1DqqNW05b9CN17PTL2W/7vcxXl9aRnczQ0dugoRBxukkXlaGYU2sc+OM4m
 WH4tist5ItWBLCRFxZUSyWufu5Pp7CcsILPqpKhDlQd5nop6TyKq/puZmWLvUYnuj7/NA5b6gIP
 cmMj47JmnpOH/QIz14HEVqbUgGc2bliX07g+Jn5zxewG/xQCL1xwytUbnY6yG9M6Tf9VeKJtooQ
 FU8Y5XtpYhkuiZpQPsOx5Cyv1OeS3HRu82rB3rWv+GP0rrf3GbbrU9TmOjKRlh23iKlOG+zzbO3
 rvy2u+Tan9FkE9gmViQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_203034_305632_6BC2B1E3 
X-CRM114-Status: GOOD (  19.46  )
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

Ck9uIDMvMTkvMjAyNiA0OjIxIFBNLCBJYW4gUm9nZXJzIHdyb3RlOgo+IENBVVRJT046IFRoaXMg
ZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhCj4gRG8gbm90
IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhl
IHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+Cj4gT24gV2VkLCBNYXIgMTgs
IDIwMjYgYXQgNjo1N+KAr1BNIEhhaXhpYW8gWWFuCj4gPGhhaXhpYW8ueWFuLmNuQHdpbmRyaXZl
ci5jb20+IHdyb3RlOgo+PiBIaSwKPj4KPj4gQ29tbWl0WzVjZjZlNzZlNGY0Zl0oaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9j
b21taXQvdG9vbHMvbGliL3BlcmYvTWFrZWZpbGU/aD1saW51eC02LjYueSZpZD01Y2Y2ZTc2ZTRm
NGZlZTU0YzAwNTY3NThiNjM5Y2Y0OTE5Y2ZmYmE5KQo+PiBjaGFuZ2VkIHRoZSBsaWJwZXJmIE1h
a2VmaWxlIHRvIHByZXNlcnZlIGV4dGVybmFsIENGTEFHUyBpbnN0ZWFkIG9mIG92ZXJyaWRpbmcg
dGhlbS4gQXMgYSByZXN1bHQsIHRoZSAtTzYgb3B0aW1pemF0aW9uIGZsYWdzIGZyb20gcGVyZidz
Cj4+IGJ1aWxkIHN5c3RlbSBhcmUgbm93IGluaGVyaXRlZCBieSBsaWJwZXJmIGR1cmluZyBjb21w
aWxhdGlvbi4gVGhpcyB0cmlnZ2VycyBhIGZhbHNlIHBvc2l0aXZlIC1XYWxsb2Mtc2l6ZS1sYXJn
ZXItdGhhbj0gd2FybmluZyBpbiBHQ0MgMTMgb24KPj4gcmlzY3Y2NCwgY2F1c2luZyB0aGUgYnVp
bGQgdG8gZmFpbCB3aXRoIC1XZXJyb3IuCj4+Cj4+IHwgY3B1bWFwLmM6IEluIGZ1bmN0aW9uICdw
ZXJmX2NwdV9tYXBfX21lcmdlJzoKPj4gfCBjcHVtYXAuYzo0MjI6MjA6IGVycm9yOiBhcmd1bWVu
dCAxIHJhbmdlIFsxODQ0Njc0NDA2NTExOTYxNzAyNCwgMTg0NDY3NDQwNzM3MDk1NTE2MTJdIGV4
Y2VlZHMgbWF4aW11bSBvYmplYwo+PiB0IHNpemUgOTIyMzM3MjAzNjg1NDc3NTgwNyBbLVdlcnJv
cj1hbGxvYy1zaXplLWxhcmdlci10aGFuPV0KPj4gfCAgIDQyMiB8ICAgICAgICAgdG1wX2NwdXMg
PSBtYWxsb2ModG1wX2xlbiAqIHNpemVvZihzdHJ1Y3QgcGVyZl9jcHUpKTsKPj4gfCAgICAgICB8
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+PiB8IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBjcHVtYXAuYzozOgo+PiB8IC9idWlsZGFy
ZWE1L2h5YW4tY24vcHJvamVjdF95b2N0by9wb2t5L2J1aWxkLXJpc2N2NjQvdG1wL3dvcmsvcWVt
dXJpc2N2NjQtcG9reS1saW51eC9wZXJmLzEuMC9yZWNpcGUtc3lzcm9vCj4+IHQvdXNyL2luY2x1
ZGUvc3RkbGliLmg6NjcyOjE0OiBub3RlOiBpbiBhIGNhbGwgdG8gYWxsb2NhdGlvbiBmdW5jdGlv
biAnbWFsbG9jJyBkZWNsYXJlZCBoZXJlCj4+IHwgICA2NzIgfCBleHRlcm4gdm9pZCAqbWFsbG9j
IChzaXplX3QgX19zaXplKSBfX1RIUk9XIF9fYXR0cmlidXRlX21hbGxvY19fCj4+IHwgICAgICAg
fCAgICAgICAgICAgICAgXn5+fn5+Cj4+IHwgcm0gLWYgL2J1aWxkYXJlYTUvaHlhbi1jbi9wcm9q
ZWN0X3lvY3RvL3Bva3kvYnVpbGQtcmlzY3Y2NC90bXAvd29yay9xZW11cmlzY3Y2NC1wb2t5LWxp
bnV4L3BlcmYvMS4wL3BlcmYtMS4KPj4gMC9saWJhcGkvbGliYXBpLmEgJiYgcmlzY3Y2NC1wb2t5
LWxpbnV4LWdjYy1hciByY3MgL2J1aWxkYXJlYTUvaHlhbi1jbi9wcm9qZWN0X3lvY3RvL3Bva3kv
YnVpbGQtcmlzY3Y2NC90bXAvdwo+PiBvcmsvcWVtdXJpc2N2NjQtcG9reS1saW51eC9wZXJmLzEu
MC9wZXJmLTEuMC9saWJhcGkvbGliYXBpLmEgL2J1aWxkYXJlYTUvaHlhbi1jbi9wcm9qZWN0X3lv
Y3RvL3Bva3kvYnVpbGQtcmlzCj4+IGN2NjQvdG1wL3dvcmsvcWVtdXJpc2N2NjQtcG9reS1saW51
eC9wZXJmLzEuMC9wZXJmLTEuMC9saWJhcGkvbGliYXBpLWluLm8KPj4gfCBjYzE6IGFsbCB3YXJu
aW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IEhpIEhhaXhpYW8sCj4KPiB0aGlzIHdhcyBy
YWlzZWQgYmVmb3JlIGJ5IENoaW5nYmluIGluOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xr
bWwvMjAyNjAyMTIwMjUxMjcuODQxMDkwLTEtbGlxYjM2NUAxNjMuY29tLwo+IEkgd2FzIGNvbmNl
cm5lZCBhYm91dCB0aGUgaW50cm9kdWN0aW9uIG9mIHZvbGF0aWxlIHRvIGF2b2lkIHRoaXMKPiB3
YXJuaW5nLiBJJ3ZlIG1haWxlZCBvdXQgd2hhdCBpcyBob3BlZnVsbHkgYSBmaXggd2l0aG91dCB2
b2xhdGlsZSBpbgo+IGl0Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjAzMTkw
ODE4NDMuMTY1MDY0MC0xLWlyb2dlcnNAZ29vZ2xlLmNvbS8KPiBJZiB5b3UgY291bGQgdGFrZSBh
IGxvb2suCgpIaSBJYW4sCgpJIGhhdmUgdmVyaWZpZWQgdGhpcyBwYXRjaCBvbiB0aGUgbWFzdGVy
IGJyYW5jaCB1c2luZyBnY2MgMTMuNC4wIGZvciAKYm90aCByaXNjdjY0IGFuZCBwcGM2NCB0YXJn
ZXRzLCBhbmQKY2FuIGNvbmZpcm0gdGhlIGlzc3VlIGlzIHJlc29sdmVkLgoKSXQgd291bGQgYmUg
Z3JlYXRseSBhcHByZWNpYXRlZCBpZiB0aGlzIGNvdWxkIGJlIGJhY2twb3J0ZWQgdG8gdGhlIAps
aW51eC02LjYueSBzdGFibGUgYnJhbmNoLgoKVGhhbmtzLAoKSGFpeGlhbwoKPgo+IFRoYW5rcywK
PiBJYW4KPgo+PiBTdGVwcyB0byByZXByb2R1Y2U6Cj4+Cj4+IGdpdCBjbG9uZSAtYiBzY2FydGhn
YXAgaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5Cj4+IGNkIHBva3kKPj4gc2VkIC1p
ICdzL2FmMjQwZDdkNTdlYmY2NmU4N2JjMmRmZjM0ODU1ZTYzMGE5N2VhZDEvNWNmNmU3NmU0ZjRm
ZWU1NGMwMDU2NzU4YjYzOWNmNDkxOWNmZmJhOS8nIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgv
bGludXgteW9jdG9fNi42LmJiCj4+Cj4+IHNvdXJjZSBvZS1pbml0LWJ1aWxkLWVudiBidWlsZC1y
aXNjdjY0Cj4+Cj4+IGNhdCA+PiBjb25mL2xvY2FsLmNvbmYgPDwgJ0VPRicKPj4gTUFDSElORSA9
ICJxZW11cmlzY3Y2NCIKPj4gJ0tFUk5FTF9WRVJTSU9OX1NBTklUWV9TS0lQID0gIjEiJwo+PiBF
T0YKPj4KPj4gYml0YmFrZSBwZXJmCj4+Cj4+IEkgaGF2ZSBjb25maXJtZWQgdGhhdDoKPj4gS25v
d24gdG8gZmFpbDogZ2NjIDEzLjMuMCwgMTMuNC4wCj4+IEtub3duIHRvIHdvcms6IGdjYyAxMS41
LjAsIDEyLjUuMCwgMTQuMy4wLCAxNS4yLjAKPj4KPj4gTm90IHN1cmUgd2hldGhlciB0aGlzIGlz
IGEgZ2NjIGJ1Zy4KPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/
aWQ9MTI0NTQ5IGZpbGVkIHRvIGdjYy4KPj4KPj4gVGhhbmtzLAo+PiBIYWl4aWFvCj4+Cj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
