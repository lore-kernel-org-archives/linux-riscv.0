Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089F8D73E81
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 17:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBLpbgMtmI6M+YVb0oa4J9MKshOwAAqQBsUoIjPbw38=; b=LtpE5sVXAbnhli
	hdjvsG3Negr7N/EUVx03uUUY9bRmqshaowsGb/50WtBqRIPas7hp4YT496/pA/t6j0j30dLq02ePL
	tiqGMz876au96CLDXugB036X7DOiHWCuCa2Ydk/aA3d7saE/bT9pI/i3SVu4sWU5QmgM+wtEBAFDd
	uH/9EUSwhGoGteJD4zoMAjIAIFkDNeeGBbPUv6sTbP1fpNPOmMxo/7Y2sXUq4HHkmD1fJ0C5J04WI
	RKb//8FK5v6xx7dyJ7ndZTnJIihJnwqQQNb7rSo62AlbzhULXsuV23OA4xBOfxGAj+KfGabiY7BGE
	SeiwCVd80XGl7yodY/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVuM-00000000RQX-1kBi;
	Thu, 29 Jan 2026 17:34:18 +0000
Received: from mail-centralusazon11011071.outbound.protection.outlook.com ([52.101.62.71] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVuK-00000000RPs-1psx
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 17:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PybcIhY44GT57FPKBoSZbvwzJd7YI9AwN5iiY1+6qyoOGcxjbq63I8nzuPXjGgRs5PnUQR1ao6YDiQ71jDtLzQUQyg4K6FUgDDfxLa8mkbGCSFsCCpFBi2/THZTONtRPw2WgKskfPCYSXUkbkncq7UZg9alJOF6KPGgK2LXKCriPAVKIaiOrOQw0HPDeU7zOm820pqSovCd0/I5xXHjEV/J7ErGRUoY8NsM8qVO10zK8iH2U8ypVy6kumDKFxQyM8YzTBRju4U0ltb8/InxTQneQcixV5Ch+GZTl11rIddiBEJxGB4TdBQl5IrGpUGEIlEtJ9PsV43oQnWub1v3bpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33mFldFH6tQKQ85YA5+paGbbDtgN7O9wPgOC0TcXfmc=;
 b=fes4ZPmHW1frtF4vF+C2EvYb/pOSnWpJaygmD++DM3hRUtNjMJhiD+Og3ra/XGLGN5AncKqzdiGWfFzVdqcGbps4R7hTc4f+hJHHNScRUTjuExt1nQqpAa6Hlayw4POntzLevjiF5dxtbsF46MXbtWKvxNP/brHTo+n5CvwOWL98k/4BdBKYH6ZUI7rnjvNVaeeNt6AdLQeT5HYf2aoE0eQAR6cP58w75+q6j0JqeS0roE24ZKVzh6apjYcEKEo46fyjJQByq5TlwYf/si7hf3A5qZ+mvLvCJz6V7Uzhx7RwQRU5HQfBvetvUDkDLL6ZejAbsTLRDcen1qhp77z+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33mFldFH6tQKQ85YA5+paGbbDtgN7O9wPgOC0TcXfmc=;
 b=GIpto3lHvXnlX4ughmMAJHPNu2FF0RBQyoIII+KdNNAy9m6YoC17f/T5Iv7BNbHAqLc9kmq0cl9tn78at6M0kl81WDRYL6ouZiwHOW26B5q4rDEh3KWIhaYZpwG6PLYVzRPlY8YJ5JLPwkYaIwON6GCYvBONwveiQnxp/J/zbCkFA5Faq5s+5vb9X/JlsIe24SYaOvNAf8fKnGkwvO5YCSWjxbzhCK8JbymzaXDUJii+2orfSXnWDqZLNzDaveBu+MdkeMPO9Sp1hThCscKyptQKKf2trLI2e4EsYFJgvS45nAOkc0qYONBTtTGYeCHqOn4esWxuZQVDIgAAuMH2cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 17:34:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 17:34:04 +0000
From: Zi Yan <ziy@nvidia.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv5 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Date: Thu, 29 Jan 2026 12:33:57 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <E529EDD1-0FA0-490B-B2D0-57541FDC2879@nvidia.com>
In-Reply-To: <8CDE3AB8-EF51-4D53-A1D2-6084A7613E9A@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
 <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
 <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
 <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
 <8CDE3AB8-EF51-4D53-A1D2-6084A7613E9A@linux.dev>
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 803e18af-2968-42a8-4dcc-08de5f5c98fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0k4Z1VMQXpMNGtDbFN4WGNJS1AyTEpkZGVwTDZMOXY2dEE0TndSaWxBaUJC?=
 =?utf-8?B?VzBtSGM1VHBNZTFkbW5TaGZaTzZabkI3L29GaGNvNnBCNG9mU3VKekE2ZnpE?=
 =?utf-8?B?RFJFRDdGUDZGVCtQRCswZ1plZlFpYm4yd28wSkFyOTJlbldwa0FFaTdRMm5z?=
 =?utf-8?B?dVAwNWRWMkptcjZLc3R1NExZbUk1N2tCdVFmSWtSV24wRFgwZUJDcHVBZjcw?=
 =?utf-8?B?ZUg4dGtRMndhYzFYb3ZzU0ZmQ0JPUE5zNThtd2ZrR0RadzJaNGdLVlRnbHQr?=
 =?utf-8?B?eVhLREpzWnZFMDFrWG85LzJKYThUbDNmZlNKRitMQzg3SjJUYlJsYmdiR2hs?=
 =?utf-8?B?dERiS2FjS2s4WWdwTFl2N1hnZU5URy9HdVN2eWVCeVlUVUJSN1ZpeG1FZUZ0?=
 =?utf-8?B?aW5NcCs0bzhVa29zUWtjcXlTRmxmRmYrb21nTDNZM3JXdU9UMFBKdE5hckhR?=
 =?utf-8?B?bFZpQVdyek4yZnJoaVdIUk92TjJuUjJDUzUvYjlEZ3RGcmdSOWwyUWI4SHdM?=
 =?utf-8?B?UUhYN1RneHhWZDFrMXJveVY0bXA1Qi9PVmhPbEZzQThLZm9EU1hCMURPaWUz?=
 =?utf-8?B?dmNkME9jbVNXQkpvZFNtMEZ4a0psblR4TVNBOW5PSldkeTFrSWUvc1AxT2s1?=
 =?utf-8?B?NGVNN1h4NTc5VXlYcFloeStVcklvZk1mbXB1SnlvenpPTC9aTmR6UlBIQ0N4?=
 =?utf-8?B?TXBkZVZJK0dFN21QUC9wQm01cnhab3RXQTlLLzVEYVFVaTAyVzdaMm4wWXdw?=
 =?utf-8?B?WXZvdjNsTFJZWjNpRWJmTkEvdWZEaUl1VG9KcEZBYzhJYjhZUzZ5UVdvaSsr?=
 =?utf-8?B?cEgrT1NpaXBkUmp4Sk1oK3RLcnA5TzM3bm9PZnJWVzRJalNId0N6MFgydW9p?=
 =?utf-8?B?Z29ucy9sN25GdTBIRVZTV3JPd2xZbDU3eDdSR2pXREg5Zy9jc2FJUzBoZGZs?=
 =?utf-8?B?eUQ4WDlsSEY1aXd6ZmdvWUVuUG5rWlczL3FLck1ZUCtqSDNDZHV0cHR6YVhC?=
 =?utf-8?B?V3l2WmU4VGdOa1FQcVg2amFSSmY4a295QithV0wxbWFtOS9jck85Vy95R1Jj?=
 =?utf-8?B?UTNuem4ySURZZzNpT0pINnBLZXN0dUdPcGJET3pwb3RHYk5FOTgraXVWVVI5?=
 =?utf-8?B?UkFGZFRFT3p0Q1ZmWUFoZE9aZlBITTllWnVWM25HelJVbGIzTXJPeXZWbmh2?=
 =?utf-8?B?WXJtdzM4UjM4M1J2QTNPcldyV29PVWNYcUpVdlpNZDA5K29xQlBlZFVmVGt2?=
 =?utf-8?B?UUVCSWJIOTh3R0l0RFlHMmNtVkpGTmh4Z2FVQTdIZTBRbmpCVmZSSWtSY2NO?=
 =?utf-8?B?ejh6bEdyc3hGMVRlTzgwaUl1bmV3L204TlFVbmFpb1JGZUlQMllCeG13NE1t?=
 =?utf-8?B?L1diMUpKU2EvUFBWc1VaUkU0cEd3N3NTaTBrOEtOcUd4VlhMRFFBU1Z4dC9t?=
 =?utf-8?B?dm9jQ3VVVUg5MCtpeEhiSXEvOVVTRGkwZVBzSkd5WUtRV3VsTEs2MVZLN0Vv?=
 =?utf-8?B?S2g1VmszRGhoZmFCWnVwL0FLbUpTeDJDMDdJNHdJWk1nOUVDVnQrelBrT3dx?=
 =?utf-8?B?eXVBZFVRd2pLMWpxK1JqdnpSUThwcklBTnhyc0k0MHR3SEhhek5PY09LcnVB?=
 =?utf-8?B?Yk4velBTV0Q4OFp5WCtFb2FZTlhGOGV0NGRpT0ZjUklSWGRZOVR0NTdRZW9s?=
 =?utf-8?B?eUNENVdkbmhBbU5uT05iTUxJK3RuNFFqamt2QUd4bjB0NmU0a09JV0NSdlZ4?=
 =?utf-8?B?VVRtanRGUTFMRlBVT1pyS3VqL2JiN1k4dXBMbEpSSmRxcjE2OTlaT0pMT2hk?=
 =?utf-8?B?QTF1T3orR0lwblFNNHgwdjJPdVRRUTBIS0pmWFJEWEFlcEEzN2h6RzZNMUJ6?=
 =?utf-8?B?OUhiUEZDZ0pxTkpxY00wUnF1cWJMRDB3eVZodmYyMDVYUGtNeWdSdTMxQm9P?=
 =?utf-8?B?TUQ1ajBlZHNJbDQrWkhFaHR1Njh6K3NlbklqNStiTm1DU2w3djNyK1VLWHNG?=
 =?utf-8?B?VHdPRXFEMklQTlNOUG1wd2pGSmYvZDQrSytTdnRyQ2hUSU4zZVlCMVRtUWJG?=
 =?utf-8?B?NmtiblBveTBycGpVVnJqcDlwYytubWU0WlVqcC9Nck5vOHl6cEtvK1lSWWJz?=
 =?utf-8?Q?R1Bk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGs3V3VUMUtnOVhVbTZtUER6eno0ZWVPNFNnSS9ONk03U1RnamgzZk1XNE1R?=
 =?utf-8?B?US9OOWhMaC9jSzAxMzlyOVR5bFJjTEExQ1k4S2ROUEZyM1FDeE9SS3BjaER3?=
 =?utf-8?B?YTB2R3VaNWE0UWNnRGNhWnREL2tDS1BaTkxHV1Q1NkxGQ0x4clJkbWpsMkJP?=
 =?utf-8?B?empmTFFKSnJrMCt1YW02bVVYQjRJd0FOcDdReUUzOXM5ZnRNQjdMVHI3Q2Rz?=
 =?utf-8?B?RWJoSTUyR0Y5WnU3NXNEMjBYVXI1Q0VhK1ZQNHRrOTVRQnVaTEcvbUtxVnJw?=
 =?utf-8?B?YmtuRlZmN3pGTDJxRWp6WEIza2tnTGZFenc1YTdhM0tYTTh3Wkg5ZDNZVEtZ?=
 =?utf-8?B?aEJSNWQ2S1FyU1Q0V1ExcmM5ZWlLRnZ6K3NFQW4rMmxHdjRvRkdrU25TNlo5?=
 =?utf-8?B?VTZGRXYyWFNNU2dPZ0ZhV2VvV0dKNDJGSGFBcDNVVGt5bHlBQ0ZnR1kwYU1S?=
 =?utf-8?B?bTI4NUNPWDVMNVVxcit6RnA3bjdsT01rcmpLaHd2dlQrVXV1UWdad1dyMGYy?=
 =?utf-8?B?K3JEWmFIUVBSVC96VGJKRHFpUkgxZW5pUEh3Tkp6andvZE9jNzJZTDU2OXBU?=
 =?utf-8?B?aG45K0RyMW1oOE0rNHJRZCsxNDZFc1RQL1RkZkV4ekczeTNFVk9rY2c1Yita?=
 =?utf-8?B?ZXlGdkYzV1JpVHJ6YzVOdmdlKy9JWkwrV3lDb0NiUTR2cDRGT2p2bXN0Y2tN?=
 =?utf-8?B?WmtJMWprdzk5amdJenpjU0pJSjlPUlpkakdsRVlORVhxalRodG5iYWNJWXRt?=
 =?utf-8?B?SE9FT1NhM0FubmR3eVltV3FKcG5lblNORnh1N0JDcFhpdlhib3V2Q3dOT01F?=
 =?utf-8?B?Z3JHYnRrUzB2UHVuaFZFTkhOUm5QNWVzdWoySVpHcWlhWklFZGIzVzI0bVRm?=
 =?utf-8?B?di94d1BMMXZQdWVLSFhudlBOZzRuT2pnekozTHJxN2pYQTYyUEVOK2gwakFV?=
 =?utf-8?B?Nm5ScU9HSkR3UUpQSjVUMVlpR0twTElLVWNteS9TbzhQTiszRFQwUXVEaWhV?=
 =?utf-8?B?SXNyK28xWmp1c0U2TnY1aFRtaUt6SlZGSllVQnJ5KytXZk96a2tEZEhNcVRv?=
 =?utf-8?B?QzZZc0xuclFwK3NoRzRuUnphQmlHN085bEhZbS9lR3NaQnJXQy93RCtxNjZt?=
 =?utf-8?B?dzRKb3dqai9vZmRNeWZkOGlqd3ZDbm54S1I1ajNDTkVZVjdLVTJ5Vnp5TWRL?=
 =?utf-8?B?TmVHOVNROFBZTFV6V3Voa09OZ1ltV2NFNlhWdVZHWXNITmE2WWJyRnhXYXly?=
 =?utf-8?B?Mm11TCtjcU5kV0tOcDhKa1ZCaXNzbE53VGM2VndZOVU3WWJMdktIQ3hNdzlT?=
 =?utf-8?B?b3NRSnFtUG1JNDY0akFHNFdLU1lnMHpXRWhJaGN3WGN3NE1tUnVISkI5MHJI?=
 =?utf-8?B?UE5sSEdzTHhiYlRZdVlVNy8vcDJXOUpIRWdXcG1XTGQxQlBxZG43bGx0enlp?=
 =?utf-8?B?Uko5V0xTdndkUTBBamZuZ01CcXpyQmExOTkzcjd5TkJOZWlobUhqRk1veVQ2?=
 =?utf-8?B?KzJRenhIeXQ0NmE0T0ZkOCtRNHhJR0ZLM0lwcW1LZ3hVcTF1NVNJNDk3NHF3?=
 =?utf-8?B?ZlFQQ05OVmFwNm5RbGVpV285QVFSR3VuNHVIRzdtZlMybzdvVmpEQUhQS0t2?=
 =?utf-8?B?dW9KbEM1b0Ivc01SaWsvUVROZ01ZaTF4cTVjemFWNytIdjRrUTl0M09aZEF0?=
 =?utf-8?B?Zjhkc0Z1ZWw5OFltbzZHelYrT0dBRlVGSCtlTEVOcWxrNzBvZ3RTRTFoelJR?=
 =?utf-8?B?RGdYSWVGSXlILzIwTnk1VGZwdWFVQ3ZkdTNVQktwMThrbkFXQXcxejJkUWc0?=
 =?utf-8?B?OTZqUjhMWnhSeS8yMDJPclg0b0xwN0NqOVU3Sml4TkFMbWFSMXVLUll5dlFi?=
 =?utf-8?B?c1BDNjN4V29aZmZxMGtUSEo1aGlOdTkwWjhtRXFLZ0NFejF5N3p6Z1RubnFP?=
 =?utf-8?B?V1ZTYzN0Qk9YaTFZd2tIVktIV0Y2K3FyMnA0N010LzV1d1JYZG1Gb2lOb1JO?=
 =?utf-8?B?bWkrM2s4RllzVUoxZnlVV1ljVTFPWmxkUmNUS2pFcGVhOURSWk9qcGsvVGdQ?=
 =?utf-8?B?Q0JpNHRsOHJVdk5qaW1YSTFBeUdYeE90NERFQVBMdmwxNE1pRXAySnB5Ykpk?=
 =?utf-8?B?bWtadDFBdkp2azkrMFFlZEIzeWlGdC82Z0lPR0htVFFhaEhRTjhnN2dSWFBk?=
 =?utf-8?B?bi83dDUzZFQ2R2dIbEx0VHVlVHFNRkRLcCtPRmxPbWdhMGJiNHgvZkttUmpr?=
 =?utf-8?B?MDFSZHlndWlYZGY2NWdSUjlOL2dYSTdLdHl4TjdiZ0tVa0FMMG9JVkNTQkRa?=
 =?utf-8?B?ZHhKUUNBVUVWZFlodEQyNHFJUVRPSW1rKzUvdytacWUwdUFZSnlHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803e18af-2968-42a8-4dcc-08de5f5c98fb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:34:04.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xaSvhCVLjOV9i7+K9qYAqGsf9qYeyFugr674Xwvlu69Hy6SHPqQnDKJQIp5t9ukS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_093416_480964_FA7C8DC1 
X-CRM114-Status: GOOD (  17.80  )
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

T24gMjkgSmFuIDIwMjYsIGF0IDI6MDMsIE11Y2h1biBTb25nIHdyb3RlOgoKPj4gT24gSmFuIDI5
LCAyMDI2LCBhdCAxMToyOSwgWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4gd3JvdGU6Cj4+Cj4+IE9u
IDI4IEphbiAyMDI2LCBhdCAyMjoyMywgTXVjaHVuIFNvbmcgd3JvdGU6Cj4+Cj4+Pj4gT24gSmFu
IDI5LCAyMDI2LCBhdCAxMToxMCwgWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4gd3JvdGU6Cj4+Pj4K
Pj4+PiBPbiAyOCBKYW4gMjAyNiwgYXQgMjI6MDAsIE11Y2h1biBTb25nIHdyb3RlOgo+Pj4+Cj4+
Pj4+PiBPbiBKYW4gMjgsIDIwMjYsIGF0IDIxOjU0LCBLaXJ5bCBTaHV0c2VtYXUgPGthc0BrZXJu
ZWwub3JnPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBJZiBwYWdlLT5jb21wb3VuZF9pbmZvIGVuY29k
ZXMgYSBtYXNrLCBpdCBpcyBleHBlY3RlZCB0aGF0IHZtZW1tYXAgdG8gYmUKPj4+Pj4+IG5hdHVy
YWxseSBhbGlnbmVkIHRvIHRoZSBtYXhpbXVtIGZvbGlvIHNpemUuCj4+Pj4+Pgo+Pj4+Pj4gVHJp
Z2dlciBhIEJVRygpIGZvciBDT05GSUdfREVCVUdfVk09eSBvciBXQVJOKCkgb3RoZXJ3aXNlLgo+
Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtpcnlsIFNodXRzZW1hdSA8a2FzQGtlcm5lbC5v
cmc+Cj4+Pj4+PiBBY2tlZC1ieTogWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4KPj4+Pj4+IC0tLQo+
Pj4+Pj4gbW0vc3BhcnNlLmMgfCAxMyArKysrKysrKysrKysrCj4+Pj4+PiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9zcGFyc2Uu
YyBiL21tL3NwYXJzZS5jCj4+Pj4+PiBpbmRleCBiNWIyYjZmNzA0MWIuLjljMGY0MDE1Nzc4YyAx
MDA2NDQKPj4+Pj4+IC0tLSBhL21tL3NwYXJzZS5jCj4+Pj4+PiArKysgYi9tbS9zcGFyc2UuYwo+
Pj4+Pj4gQEAgLTYwMCw2ICs2MDAsMTkgQEAgdm9pZCBfX2luaXQgc3BhcnNlX2luaXQodm9pZCkK
Pj4+Pj4+IEJVSUxEX0JVR19PTighaXNfcG93ZXJfb2ZfMihzaXplb2Yoc3RydWN0IG1lbV9zZWN0
aW9uKSkpOwo+Pj4+Pj4gbWVtYmxvY2tzX3ByZXNlbnQoKTsKPj4+Pj4+Cj4+Pj4+PiArICBpZiAo
Y29tcG91bmRfaW5mb19oYXNfbWFzaygpKSB7Cj4+Pj4+PiArICAgdW5zaWduZWQgbG9uZyBhbGln
bm1lbnQ7Cj4+Pj4+PiArICAgYm9vbCBhbGlnbmVkOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgIGFsaWdu
bWVudCA9IE1BWF9GT0xJT19OUl9QQUdFUyAqIHNpemVvZihzdHJ1Y3QgcGFnZSk7Cj4+Pj4+PiAr
ICAgYWxpZ25lZCA9IElTX0FMSUdORUQoKHVuc2lnbmVkIGxvbmcpIHBmbl90b19wYWdlKDApLCBh
bGlnbm1lbnQpOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgIGlmIChJU19FTkFCTEVEKENPTkZJR19ERUJV
R19WTSkpCj4+Pj4+PiArICAgQlVHX09OKCFhbGlnbmVkKTsKPj4+Pj4+ICsgICBlbHNlCj4+Pj4+
PiArICAgV0FSTl9PTighYWxpZ25lZCk7Cj4+Pj4+Cj4+Pj4+IFNpbmNlIHlvdeKAmXZlIGZpeGVk
IGFsbCB0aGUgcHJvYmxlbWF0aWMgYXJjaGl0ZWN0dXJlcywgSSBkb27igJl0IGJlbGlldmUKPj4+
Pj4gd2XigJlsbCBldmVyIGhpdCB0aGUgV0FSTiBvciBCVUcgaGVyZSBhbnltb3JlLgo+Pj4+Pgo+
Pj4+PiBJIHRoaW5rIHdlIGNhbiBub3cgc2ltcGxpZnkgdGhlIGNvZGUgZnVydGhlciBhbmQganVz
dCB1c2UgVk1fQlVHX09OOgo+Pj4+PiBpZiBhbnkgYXJjaGl0ZWN0dXJlIGNoYW5nZXMgaW4gdGhl
IGZ1dHVyZSwgdGhlIG1pc2FsaWdubWVudCB3aWxsIGJlCj4+Pj4+IGNhdWdodCBkdXJpbmcgdGVz
dGluZywgc28gd2Ugd29u4oCZdCBuZWVkIHRvIHdvcnJ5IGFib3V0IGl0IGF0IHJ1bi10aW1lLgo+
Pj4+Pgo+Pj4+Cj4+Pj4gVk1fV0FSTl9PTiBzaG91bGQgYmUgc3VmZmljaWVudCwgc2luY2UgYm90
cyBzaG91bGQgcmVwb3J0IHdhcm5pbmdzCj4+Pj4gZnJvbSBhbnkgcGF0Y2gvY2hhbmdlLgo+Pj4K
Pj4+IEnigJltIG5vdCBzdXJlIGEgV0FSTiB3aWxsIGdldCBkZXZlbG9wZXJz4oCZIGF0dGVudGlv
biwgc2luY2UgdGhlIG1lc3NhZ2UKPj4+IGlzIHVubGlrZWx5IHRvIGhhdmUgYW55IHZpc2libGUg
Y29uc2VxdWVuY2VzIGFuZCBvbmx5IGZpcmVzIG9uCj4+PiBhbGxvY2F0aW9ucyB3aXRoIGEgc3Bl
Y2lhbCBvcmRlci4KPj4KPj4gSWYgYSBkZXZlbG9wZXIgbWlzc2VzIHRoZSBXQVJOIGFuZCB0aGUg
cGF0Y2ggZ2V0cyBpbnRvIGxpbnV4LW1tIG9yIGxpbnV4LW5leHQsCj4+IGtlcm5lbCB0ZXN0IHJv
Ym90IHJ1bnMgc2VsZnRlc3RzIG9uIHRoZSBrZXJuZWwgYW5kIHJlcG9ydHMgYW55IHdhcm5pbmdz
Cj4+IHRvIHRoZSBtYWlsaW5nIGxpc3QuIERvIHdlIGhhdmUgYW55IHJlbGF0ZWQgdGVzdCBpbiBz
ZWxmdGVzdHMvbW0/IFRoYXQgc2hvdWxkCj4+IGhlbHAgdXMgY2F0Y2ggYW55dGhpbmcgaWYgYSBk
ZXZlbG9wZXIgZG9lcyBub3QgY2F0Y2ggaXQuCj4KPiBJIGxvb2tlZCBhdCB0aGUgc2VsZnRlc3Qg
YW5kIGl0IGRvZXNu4oCZdCBzZWVtIHRvIGhhdmUgYSB0ZXN0IHRoYXQKPiBhbGxvY2F0ZXMgYXQg
TUFYX0ZPTElPX09SREVSIGFuZCBjaGVja3MgdGhhdCBpdCB3b3JrcyBjb3JyZWN0bHkuCgpPSywg
d2UgcHJvYmFibHkgbmVlZCBhIHNlbGZ0ZXN0IGZvciBpdC4gSW4gdGVybXMgb2YgdXNpbmcgVk1f
QlVHX09OIG9yClZNX1dBUk5fT04sIEkgbGVhdmUgdGhhdCBkZWNpc2lvbiB0byB5b3UgYW5kIEtp
cnlsLgoKVGhhbmsgeW91IGZvciB0aGUgY2xhcmlmaWNhdGlvbi4KCkJlc3QgUmVnYXJkcywKWWFu
LCBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
