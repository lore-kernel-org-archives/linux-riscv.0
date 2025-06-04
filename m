Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746ACC5B552
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 09:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zv4OxkNCS+uOZN3UbX8xU7j3ZPGTkPzbbozCXtn+w/E=; b=C1Pe1XekZLPscf
	nGU7wvyhVXLFZqcFhlSIRKeoPEmFajSzETMB60nSZwXmh+xEnxo+fkWVCF7qPIHqLa3PpoOY+kWjz
	6fXHVDBZ03WoOr1D5xUJyUki3TK1VcqIp7iOJjem0BzvyE1pyCBwvZQt3qfoRq/ySu4MoaQ1XIgdy
	v5xlT+oyz4m5lIf/BbCfPfI+puNR/XmfiTdWTNpyiPeB9Es0rK8cwpizesd7kzXcxZ9UTx3HbBzoT
	FLq7a0GEGB6+WEHaTqTlp7HZ1WLm4LYizzjxX0npaS3WLh3aTtYDVp16Ow92KVRSU8yyxa3ha5ofG
	7TqSzvJsy5oFqVLbI4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMk7l-0000000Cz3s-3ZeZ;
	Wed, 04 Jun 2025 09:09:29 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMk7k-0000000Cz3L-0VOB
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 09:09:29 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5548fvfK016657;
	Wed, 4 Jun 2025 09:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=iouDQszMKCKsF3mcyvCI3Gzro7EtcCyn1yOJiO9kUUs=; b=
	NQBGTaBnA0wPni6PNq4aBqGuRCEwsE+pHYqRAe1auh/XxES86om9Ia03J2B/xuLY
	oEYgK0Qvvx0khUFgncC0GCTAiIBcwRGZIzsV1fQhnbqBD3zXn/rEf1QizhIO9SRQ
	ROTwnH5rHn2DpCobj4xT0QddIXcd2JUrHVPXznMETBWt54XA1IBxyyaou4APu2y2
	jniYTvBtRvhX0n7DvsvQSeeQM/DRerLZxYXCv1AsEXEq2Oa4a2JHfO3440sGipQD
	7oV43w1e3arWL1lvPVFS+NpL126tOzgVJso7YU5yqe6DoINmEnOrjYqOdtp9q0wa
	ED0vgIOejbQjttgwtjyZZQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8bkh5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:09:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5547cM7M035048;
	Wed, 4 Jun 2025 09:09:11 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010010.outbound.protection.outlook.com [52.101.193.10])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7arpkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 09:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/BmmN7GDQUboygTb1pc4VQSvFFeLzkh4er6KtjIebjYZfcDzFwPKxxp6B4/FEVUmvjIZZsTxF5QXQSS+sexNwzoQQ1nayqaUlD+Yzzi1ufXB8NdS+Yy0RC3QLYbZrpaBUi8QigKhYqp8meD5gk/0VpC85hXTC35mjV541b1impAgZAT/3/8kk782KZQgEm3cT63La6sNMfLOwcASvqV/KEax+NF4GvRsZUAEtOJ21cjYalzWXsY/w3BMa1CZ20IyxUv9aglVwt8E94+O2vrIlqgI34gChjC9+Yk1b4HxvJdxkC03B7CbLabFUEtz7Cj5JNlAuia+W8GJDiEsmJ0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iouDQszMKCKsF3mcyvCI3Gzro7EtcCyn1yOJiO9kUUs=;
 b=kgWXNVGMJx3sbr8Vug1cmKyORkTikv6/M891gV8pTI8ApXRpV2a/xPmJF7odsAPOYXDdkZ3Yyblbqb7EeQZBRT7ZvXuXxdBRxxUpE5n3nEcT+7FCddV7lW7DzA6MP5GP5z0J3IxwG5TyhhedWgI1xkKptk7Kb9vm+HcUGmfAj14QnW8etM+08cjjyo0ayxMrEtWKAhR0F4+J/J5qyEJdxi5l30gxS0U4T/jr5IhRRb6faP6TRd6hTSoJ/bN0EShirA5dCwZ2JB2EGZCabiOMtyI+hsYT3WbAKPL82MFjJs6LVMGjOofn4z5rM0yYJNQLm66pq5ssHwYSKgyRUeftyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iouDQszMKCKsF3mcyvCI3Gzro7EtcCyn1yOJiO9kUUs=;
 b=l7j5Wv3MtX9Vmed/K194BWSEz+OJNOEya6y8kZ4lvpSIQLCr8+w50Gu5FOQ6o5IyfhJ70jXlPeyqy+8uDNUyKBO7/TyYVyrSPKvfrXNANMgzPGUIJ/1tAgKd/LSWnFtlRSARodfer/gBebJ25d3ctNCXte6D3R/FdRSPWf6Z3kM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH4PR10MB8172.namprd10.prod.outlook.com (2603:10b6:610:239::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 4 Jun
 2025 09:09:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 09:09:07 +0000
Date: Wed, 4 Jun 2025 10:09:05 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <baohua@kernel.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Jann Horn <jannh@google.com>,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-mm@kvack.org
Subject: Re: [PATCH RESEND] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
Message-ID: <d0df9d25-f6c7-46ce-9808-cc92855d6e9d@lucifer.local>
References: <20250603192213.182931-1-lorenzo.stoakes@oracle.com>
 <51ec4269-b132-4163-9cb5-766042a3769d@redhat.com>
 <aD_-qdg2OvKQIyRg@kernel.org>
Content-Disposition: inline
In-Reply-To: <aD_-qdg2OvKQIyRg@kernel.org>
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH4PR10MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d76c73a-dd26-4258-58fc-08dda3477630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkdubVRnRVVwMVhZT2lxSUU4eUJKclhValRZemJFNkc5TldJd2RoemliVzFt?=
 =?utf-8?B?SGhXTnpWdXF3dG45TXVnUWlqWTJjV1FOMmdzdXdRVDBJUVIxbHVyQUpYSjdo?=
 =?utf-8?B?dlBWUTl4OTVvS0dBWGFoa0Q1TDY3R0NBNUR6ZVRjaUhrTWRTcnlDNkpqRXI3?=
 =?utf-8?B?c2JBUnFwTXdlUWR2Wk1NcldRVFdlMTd6c21jM3ozVUFlNC9RQjl5QVJab296?=
 =?utf-8?B?dE1zYzRnZS9xZ3BnZ1JlalZEZDhscEgrRzIyc3VHMmNvWGQ5d3hiSUZsU2ZT?=
 =?utf-8?B?cXVoTUxxbWFwU0Q5ZmFpTzdQeVVaQkZ4NE13ekNDYWxqRDZEdldiMUMyWFk5?=
 =?utf-8?B?cTM0OFV6U2U1cTZhemp6ZEFiVWRpMTI4VzVaZHdkVTl1NGNkdWJ3WHRUdzFp?=
 =?utf-8?B?am1UMW15dFZKSHhDYWhqS01uUjdmSWlORlJVSDJCb0Njam4zMjRiSDRsZDlu?=
 =?utf-8?B?UHJ5RHFlb09RTjBYNi9WZkc2OWp4NEhCLytXNHBCMzFsMlAwQ1pPTk9LcmhZ?=
 =?utf-8?B?U0M2NjVIMlVPSWx0b0h4M1IrOC9kWU9NM3JqaHRtOEswdk5VdEhwSzgzUUl6?=
 =?utf-8?B?Tysyb3BWNGRzcWRteEVDY1RCRGE5TkIzR0FSSk1ROXNMSFJZSWpzbTRFVnRl?=
 =?utf-8?B?bzRSditXNW1DZHhpMDc4RnhaSFdsV2Nxa2xiUFJTMS9sZko4OUJjc2VMQTlq?=
 =?utf-8?B?Z0t6SENVSE5hUW1uRzcwQklFTlVxS1FDa0g5L0dQRUhUVit3RWM0elJiOGN1?=
 =?utf-8?B?bGcxNEJsWTBSZWN6K25XbjRHaXlEb1hnSzlPZXUveXlsM09weVByWGVhaTRO?=
 =?utf-8?B?bnNFYi9yUmg4R3pURFc3VEk4aTJycmVrM3R5VVo2M3ZIZTFUZVlxUFRyajdm?=
 =?utf-8?B?NkN3Ukxobmg2eGYzemVkM2hlcVkxdjVFb1U3dnZjVlBhRVg5TGl1VWFXVXJ1?=
 =?utf-8?B?MG5DdlA5bTVXMm1STjFFVlp1alpGMDRHUHFwMzJ6T1NOUCtoWUc4d0FtYTd0?=
 =?utf-8?B?S1RvWVFMZmFTRWFmNHc4alppaElFV1l2bUJqbnNMQWNuMGpJc1lSd1NjNWFS?=
 =?utf-8?B?Z1pCQUk1eHRrejNWWGpPS3VTQ09hQUtmS2x2bDFOQ1U5ZmhhUzBoMTR4aXJP?=
 =?utf-8?B?bHNiWWFZSHJWZ2F5UEpzRDhwN0dIQ2ZhTmJSakllbElxWlVNUFBhcTdPVzVl?=
 =?utf-8?B?dUhhYU5KOE1DeHl6T3ZNeHA5RzI0Y3RNUVlZQnpldWVTNVBaRE5zMFlqS0pB?=
 =?utf-8?B?cWtHM2JnTWoybXRrd0lsa2VPTXQyQ3ZaOEkvTTZ6YjJMLzVZWC9JakVNenQ0?=
 =?utf-8?B?d2lkY1FMTXhyeFZRdVU4Tm9Id1RaaUNIaUIzV0o5L1cvU2NXSUJvcjI3akRY?=
 =?utf-8?B?QjB3RFFTUWovc1RxdVJWalUvem5ISDNDOUFNZ0RwODRkQkk5UlBYVFJlZnRG?=
 =?utf-8?B?em5XV0ZPeFpEMmZHd2t2bk0xQ2xhUW9kTmZ4ZVN6UXJLRW1McVJmbmtKOS9Q?=
 =?utf-8?B?VXh5Ym5hM2ZXK3Y4dlVQKzJRdkZmYklRUGtENVJQTUErcUNHWGwrbEJVc0RK?=
 =?utf-8?B?aVpFS0t4OHZNTldXcWNWdUVFaUg5MEJaOHZ0ZjdmcDlCczAwa01vNWRyTUNG?=
 =?utf-8?B?R1VXY1RZUEFuaVl6OUdYZ294Q0l6aHBZKzh3UWZ2S1E5ak5pNW11OStaMG9w?=
 =?utf-8?B?VjF3WjVac3NHdnBOc2dKcXR1eHpUeEx1bjJiU2xsak9oNGwyU3BZT1FpRWh5?=
 =?utf-8?B?Wmt1cmduaCswSTQwSFN5Ty9YRHdiZ3pIWWhRMlQwM0ZyeFpKSE1EbGJTbnp5?=
 =?utf-8?B?K0k1cXVOMHJSQ0RiUGlnbEVyUUhSenowQWdWYTkzdk9vUXJFeGM4NWZnWnpX?=
 =?utf-8?B?cUJpK0xrMVkwVjNDYWFUUkxSR3F5eHRleTJlOFZpZkFnY1dpeTQyQk9qNm1B?=
 =?utf-8?Q?E1/ZQieiCBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWdNQVJ6Z2tPR1h2bVdCTDdlMWJzajVMNXE0WjZ4alppbVhqTXY4bW92U2tv?=
 =?utf-8?B?U1ZDVFhtanlLdkZCZFdqMStwV2dQTjBBMit4VmVQSjdwQnFFdjhBR3FTN0Ry?=
 =?utf-8?B?YlR0eVo4dTNoSHdBWEdJaW4vNlorOVd5c1BkWGJPSzJoOWM5cUxsQmJBQkFX?=
 =?utf-8?B?YkREUTNkZjhScm5OVjVxRjJXVmFuU0pCTExpT0xubkIrbE5rZzBkRnBQMC9S?=
 =?utf-8?B?Wktoa0tlOUlxYlIzQ3FuU0FLVXExaTQzeHJLSm82d2hpRU1MMUpwZDR3SHZR?=
 =?utf-8?B?RU9rTGJpK0dvRGFqQ3JFazdFdkJVQVB1VlZyb0UwUWZSaEpQQ2NjZmpxbFpv?=
 =?utf-8?B?SEsyblhTdVk1aGEwUGMyU1dib1ZxU2ptNmNwekE4azQ1NUIxTzRiN0tMTkwr?=
 =?utf-8?B?b2w0eDNVRmcwY0FaVk14d2NTL3dBcXZWVXBLa0ZHQWFkTW9iVXl4ZTBFSGFU?=
 =?utf-8?B?VDQyUzg4RWFCekdWSElHSEUvVGxyMzdkMVFZblN6QlQ0R04wQVBLZXJzc3Zl?=
 =?utf-8?B?Vk9TWldRZUVUVUtNYUVaK1luS0pzZjNLWUNSNTZmZ25kMjIvT3MrNjV4dkVm?=
 =?utf-8?B?NDVURFFVR1pzTmhyS1NtVEJibG5xWkc1b3ZQdmo3L1UwWXBHejYwa3QrNHUy?=
 =?utf-8?B?Y3kxcG43T2xOK053UjhpN0I2czZ4OC9vbU5YTG83Z09CWmtYb01QOVNxcjVq?=
 =?utf-8?B?ZUF5ekRlaldXLzczbjhZWEJLd3ZDMVl2Qy9SenFiWnZIejd5UGlFd1BGNDR0?=
 =?utf-8?B?SGpsLzZwSUVBSWtyRmlmeGRHZE5YNGFBL3hTcjByWkRrc0tLM25JaTFveFc2?=
 =?utf-8?B?MmVnRHRVQklKTjBzK3lwbWxmcE9VZ2hOWW9HdG16VGlaR1VhcHFEVmJtbFRz?=
 =?utf-8?B?bTcwNWFmOE1HaTF1UG9qZzBVaFByQXNNb2V5WnRBeGtVUmVNOFY4TjlXcjVW?=
 =?utf-8?B?QWZJUDhWdXZ2V0c1YnBsUzhsQWIvWk1rNzdXNWVKRzd1N1F5TnlvQWtQdFdm?=
 =?utf-8?B?SHRUbVZIb2twWGlnYWJ6d1JrMWppdGZrOXUwcUZIMVhVeXJOMzlOMEFjaDRj?=
 =?utf-8?B?aDg3U21BYUdLS1RsejdJZE5LMHNnR2xUN2Q3TmRVU2l1VzBEMmkyTFBkU2Rl?=
 =?utf-8?B?L1pSNU9mL3paVlZ3anE1K2FuRDVnYVdlOHlrZk9MR0I5M3k5UUhzYlc0UUJv?=
 =?utf-8?B?cGY4TVhkOVJadnA5QTZMeXRyTC9uTVJGRjVmTmVqNTkzUEx0b0xGWGpUTTRq?=
 =?utf-8?B?a2xrMnBWVmlobnZHYW1MNGpnR2dldFJzUHZNS01Wb1VEcS85aWh2cCtiQjRx?=
 =?utf-8?B?MndYYzBBL1ZBUjNtV2hyWEx2TWJuS2xMM1VxWHFRQWc0V1dRSGF0bVgyeUJy?=
 =?utf-8?B?MDNobnFkSkRRT3RvSmd5cjNFRmZHOGhiSXp2dG8xaWsxT1BmdHQ3b1VtUHV1?=
 =?utf-8?B?OE83dm5kTjlPVkR3Wk9kTExwM3FmQWNLdS9ZZnB3Z3o5ZzVzRWMrMUVCa3NE?=
 =?utf-8?B?MGV4WEJQcHBZUXRjTllnVHZ3aVUzcFFzcENQVzU5WjJzMDF4N3R0UDFMU00z?=
 =?utf-8?B?OW05ZTVpMXV1WkNXbEhPcEQ2R2lKUGY3YTR4RGc5SkRTWGplSG5iSUdoemxF?=
 =?utf-8?B?R2VpOTZlZ3VzeHlKTjFWRzRkSU50T3cyQXh3Q054cFp1dHdSQXo4UkpTc2hI?=
 =?utf-8?B?M3hFNVRYZ09kbE1YL3VUVjdTUTBNNTlJcDBSelFOUklKbUsxR1hDaVFJN0xy?=
 =?utf-8?B?blJzVTcyemJaQ0h5VktNejNKampEOENJYVVGd2wwbFp3SnYrQSszeVFSVnJY?=
 =?utf-8?B?UkFRUS9XTTJaSGpZM1JSN2RYMWlnRDM4T0FkUkREUnhJZGwxUnArRzZ6RzVY?=
 =?utf-8?B?ZVA0aS9iaEswK3JsaGZhVnBJUndkWDFoSFgrSkZoMGgraUVYVjBJZEJqVElJ?=
 =?utf-8?B?RlRGSmFDa2NKWGgwRHV4S1ZXZlIxMXBZalRTSC9VSGRqOEFHblV5WGNVS2Jq?=
 =?utf-8?B?dEhaL2hST2llMmo4ZTJoTFR3Wkp4YUZRSzVWVjBMeGRzLzJsWEZlZkpqRG9p?=
 =?utf-8?B?RGpoM3RVZHdNTkh0UHhBVytQb3ViU1BxUTBOQTl0cUpoNy9VMFMyby9PSGo0?=
 =?utf-8?B?emJoOWpKZnZYZWw2TTFHVE9TYWZNMWFYZ3p3eFRFT1ZvdFpmUFRNU29rYnh6?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: sLy76Ylko96S3QTh6c6u/DJHZv7rXh4J9ka8PrKCYxyBGm1B1ZDVagLE0gHQYBOW9e76cdzo69QPXqw8CCTc4sqk4/xThCXUmMYFr1WBIEZnEkZfvo8i2Vb4N0sNv0jAKPlYQG9qq1a3ZouP1guiTfVZIJOmtV+aZ/VW5EgWyr6ZQZq7Bsux4uWDbIfYt/0Yq5Y2Kr7ar+nFxTn7xF/AwWqaGihr84SCv1PZ2NS7U9uAhs3XdCCAirnUR9RqibPPr7H8JW6mCMhKK5z4UJ14UCdDuUq0/Ij5p6zXGnY1Mv2HYA3JJDKjPgHWpjHrvymB+CnksdSh4oMZ63IRTf22VxrDcZRT+e9oGundes2B2zcAzO7m7w9r9vproNhW0wxoNQzngBzTlNze1f4/ewQvgX4vFDuwNfIXIeemE4EUyR+1sc7/Z5OgTqGVdj+WJcgWo4EA7MLPwZrzUnPWR4Z7qPQ5wwLzNqdpQV2LRd419HMdIRzR9+oLQ7eZM8usrHieJHx/vXAIezIUYw8fCR0dt9/7JFlrrWNnfhEWXqpc5Jx7l3UM8bYt0SUApjGC8wWcWJXU/m9E7IiE46378VUzF8mBzzonUwWFf5rfU4DI10E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d76c73a-dd26-4258-58fc-08dda3477630
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:09:07.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rxLTn1jZmmWZDqz9URH2mNyEUBS2wILwRBGKAg4Bc0t+65v7yKGWJV63E4cWdQ19pFoEzPiquKoa4gPHiAWpbay8Ico0rH9dqaDJzWhRFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8172
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OCBTYWx0ZWRfX1j4+LqZBi1Jz PumaTi/LhooNLsNSesDV0FLZ/7uxzdDLZ3KzsN1UnaWhJ/u61vIKqkEyzxmoN1sNb1DCnZvECGM UUo4Yij9wjYzw4nGx0id57Yh6XNRXy+zPJvOPn4ajQ0AFw6m76OsJHfR4lQw6NPTTvPJiHd11X5
 Z0wR8i80UwKYlphKwRv4MhHT3qn4TDB3yvuaaBDvjgW+vrdBk7uiCSNgTq9/JTO2ZM9sqsHiLsK AB0XaegOLMhwdCAE7nxGRicr+SXOeA5J2KtCPDSjSkon1VlmxbRFkXhSD/of8fpHgWMx469hHQZ 5bSJsEkc+Jh2y0CJvZVzWDHdTuWoqKpE9nGw5PNz/qR7ZoRZFujAq3AQ6PUnW/YQGvE1YFvpnwv
 RNxGJM6g7MY6TQPwLqH+qzsyezI31cY1/aTPixxpoXZec94BpNWOay3uVwGOkH8KTJF9BnPK
X-Proofpoint-GUID: _VDAj0O3FRYl4O0niFlizuPjsSVhawDD
X-Proofpoint-ORIG-GUID: _VDAj0O3FRYl4O0niFlizuPjsSVhawDD
X-Authority-Analysis: v=2.4 cv=H+Dbw/Yi c=1 sm=1 tr=0 ts=68400d37 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=csIp8JxmIs3qLi1_xkkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_020928_167586_FE79BF29 
X-CRM114-Status: GOOD (  25.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMDQsIDIwMjUgYXQgMTE6MDc6MDVBTSArMDMwMCwgTWlrZSBSYXBvcG9ydCB3
cm90ZToKPiBPbiBXZWQsIEp1biAwNCwgMjAyNSBhdCAwOTozOTozMEFNICswMjAwLCBEYXZpZCBI
aWxkZW5icmFuZCB3cm90ZToKPiA+IE9uIDAzLjA2LjI1IDIxOjIyLCBMb3JlbnpvIFN0b2FrZXMg
d3JvdGU6Cj4gPiA+IFRoZSB3YWxrX3BhZ2VfcmFuZ2Vfbm92bWEoKSBmdW5jdGlvbiBpcyByYXRo
ZXIgY29uZnVzaW5nIC0gaXQgc3VwcG9ydHMgdHdvCj4gPiA+IG1vZGVzLCBvbmUgdXNlZCBvZnRl
biwgdGhlIG90aGVyIHVzZWQgb25seSBmb3IgZGVidWdnaW5nLgo+ID4gPgo+ID4gPiBUaGUgZmly
c3QgbW9kZSBpcyB0aGUgY29tbW9uIGNhc2Ugb2YgdHJhdmVyc2FsIG9mIGtlcm5lbCBwYWdlIHRh
Ymxlcywgd2hpY2gKPiA+ID4gaXMgd2hhdCBuZWFybHkgYWxsIGNhbGxlcnMgdXNlIHRoaXMgZm9y
Lgo+ID4KPiA+IC4uLiBhbmQgd2hhdCBwZW9wbGUgc2hvdWxkIGJlIHVzaW5nIGl0IGZvciDwn5mC
Cj4gPgo+ID4gPgo+ID4gPiBTZWNvbmRseSBpdCBwcm92aWRlcyBhbiB1bnVzdWFsIGRlYnVnZ2lu
ZyBpbnRlcmZhY2UgdGhhdCBhbGxvd3MgZm9yIHRoZQo+ID4gPiB0cmF2ZXJzYWwgb2YgcGFnZSB0
YWJsZXMgaW4gYSB1c2VybGFuZCByYW5nZSBvZiBtZW1vcnkgZXZlbiBmb3IgdGhhdCBtZW1vcnkK
PiA+ID4gd2hpY2ggaXMgbm90IGRlc2NyaWJlZCBieSBhIFZNQS4KPiA+ID4KPiA+ID4gVGhpcyBp
cyBoaWdobHkgdW51c3VhbCBhbmQgaXQgaXMgZmFyIGZyb20gY2VydGFpbiB0aGF0IHN1Y2ggcGFn
ZSB0YWJsZXMKPiA+ID4gc2hvdWxkIGV2ZW4gZXhpc3QsIGJ1dCBwZXJoYXBzIHRoaXMgaXMgcHJl
Y2lzZWx5IHdoeSBpdCBpcyB1c2VmdWwgYXMgYQo+ID4gPiBkZWJ1Z2dpbmcgbWVjaGFuaXNtLgo+
ID4gPgo+ID4gPiBBcyBhIHJlc3VsdCwgdGhpcyBpcyB1dGlsaXNlZCBieSBwdGR1bXAgb25seS4g
SGlzdG9yaWNhbGx5LCB0aGluZ3Mgd2VyZQo+ID4gPiByZXZlcnNlZCAtIHB0ZHVtcCB3YXMgdGhl
IG9ubHkgdXNlciwgYW5kIG90aGVyIHBhcnRzIG9mIHRoZSBrZXJuZWwgZXZvbHZlZAo+ID4gPiB0
byB1c2UgdGhlIGtlcm5lbCBwYWdlIHRhYmxlIHdhbGtpbmcgaGVyZS4KPiA+ID4KPiA+ID4gU2lu
Y2Ugd2UgaGF2ZSBzb21lIGNvbXBsaWNhdGVkIGFuZCBjb25mdXNpbmcgbG9ja2luZyBydWxlcyBm
b3IgdGhlIG5vdm1hCj4gPiA+IGNhc2UsIGl0IG1ha2VzIHNlbnNlIHRvIHNlcGFyYXRlIHRoZSB0
d28gdXNhZ2VzIGludG8gdGhlaXIgb3duIGZ1bmN0aW9ucy4KPiA+ID4KPiA+ID4gRG9pbmcgdGhp
cyBhbHNvIHByb3ZpZGUgc2VsZi1kb2N1bWVudGF0aW9uIGFzIHRvIHRoZSBpbnRlbnQgb2YgdGhl
IGNhbGxlciAtCj4gPiA+IGFyZSB0aGV5IGRvaW5nIHNvbWV0aGluZyByYXRoZXIgdW51c3VhbCBv
ciBhcmUgdGhleSBzaW1wbHkgZG9pbmcgYSBzdGFuZGFyZAo+ID4gPiBrZXJuZWwgcGFnZSB0YWJs
ZSB3YWxrPwo+ID4gPgo+ID4gPiBXZSB0aGVyZWZvcmUgbWFpbnRhaW4gd2Fsa19wYWdlX3Jhbmdl
X25vdm1hKCkgZm9yIHRoaXMgc2luZ2xlIHVzYWdlLCBhbmQKPiA+ID4gZG9jdW1lbnQgdGhlIGZ1
bmN0aW9uIGFzIHN1Y2guCj4gPgo+ID4gSWYgd2UgaGF2ZSB0byBrZWVwIHRoaXMgZGFuZ2Vyb3Vz
IGludGVyZmFjZSwgaXQgc2hvdWxkIHByb2JhYmx5IGJlCj4gPgo+ID4gd2Fsa19wYWdlX3Jhbmdl
X2RlYnVnKCkgb3Igd2Fsa19wYWdlX3JhbmdlX2R1bXAoKQo+Cj4gV2UgY2FuIGFsc28gbW92ZSBp
dCBmcm9tIGluY2x1ZGUvbGludXgvcGFnZXdhbGsuaCB0byBtbS9pbnRlcm5hbC5oCgpZZWFoIEkg
d2FzIHdvbmRlcmluZyBhYm91dCBhIHJlbmFtZSBhY3R1YWxseSwgYnV0IHRoZW4gdGhvdWdodCAn
b2ggbm92bWEga2luZGEKZml0cyBibGFoIGJsYWgnIGJ1dCB5b3UncmUgcmlnaHQsIHRoaXMgaXMg
YmV0dGVyLgoKTmljZSBpZGVhIHRvIG1vdmUgdG8gbW0vaW50ZXJuYWwuaCBhbHNvIDopIEkgbGlr
ZSB0aGlzLi4uCgpXaWxsIGZpeHVwIG9uIHJlc3BpbgoKPgo+ID4gPgo+ID4gPiBOb3RlIHRoYXQg
cHRkdW1wIHVzZXMgdGhlIHByZWNpc2Ugc2FtZSBmdW5jdGlvbiBmb3Iga2VybmVsIHdhbGtpbmcg
YXMgYQo+ID4gPiBjb252ZW5pZW5jZSwgc28gd2UgcGVybWl0IHRoaXMgYnV0IG1ha2UgaXQgdmVy
eSBleHBsaWNpdCBieSBoYXZpbmcKPiA+ID4gd2Fsa19wYWdlX3JhbmdlX25vdm1hKCkgaW52b2tl
IHdhbGtfcGFnZV9yYW5nZV9rZXJuZWwoKSBpbiB0aGlzIGNhc2UuCj4gPiA+Cj4gPiA+IFdlIGlu
dHJvZHVjZSB3YWxrX3BhZ2VfcmFuZ2Vfa2VybmVsKCkgZm9yIHRoZSBmYXIgbW9yZSBjb21tb24g
Y2FzZSBvZgo+ID4gPiBrZXJuZWwgcGFnZSB0YWJsZSB0cmF2ZXJzYWwuCj4gPgo+ID4gSSB3b25k
ZXIgaWYgd2Ugc2hvdWxkIGdpdmUgaXQgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBuYW1lIHNjaGVt
ZSB0bwo+ID4gaGlnaGxpZ2h0IHRoYXQgdGhpcyBpcyBzb21ldGhpbmcgY29tcGxldGVseSBkaWZm
ZXJlbnQuCj4gPgo+ID4gd2Fsa19rZXJuZWxfcGFnZV90YWJsZV9yYW5nZSgpCj4gPgo+ID4gZXRj
Lgo+ID4KPiA+Cj4gPiAtLQo+ID4gQ2hlZXJzLAo+ID4KPiA+IERhdmlkIC8gZGhpbGRlbmIKPiA+
Cj4KPiAtLQo+IFNpbmNlcmVseSB5b3VycywKPiBNaWtlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
