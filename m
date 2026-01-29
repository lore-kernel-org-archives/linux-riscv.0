Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74541D46C01
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 03:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7YawLn7aEETeXmUwxoWu/JAVspBnIxAwcMlJpEfcL4=; b=LEdRYM1hLxmmUQ
	vM5pOupZnLTbc88UpHP81hl6Ig3QyClbR2RkrOA8bisUhOlZH4H57DJtfpOsNsVyRphq6G4J1ubAD
	ZdsjMwX5hvAwV2ES2fGG+jQNjaeyJPgZQCJI0+WEtY2ThtFNFRiZO570LDp1xbPH9SSiX46cXwq5N
	5NmrEYb0VIWpzDfoCn8TVN5FeBkllec1cUKa0y6KaTc/bZ3uibfgc3E1mS5EUjTccjNosgNebaGG6
	jdkIP+bbkZcONoWLfHKmhRwg69d/w+j47aoxwONFwHLf+Hj8SK4Go0qgcm8o4aeQoKzfvNY0m0Dq8
	Qmf+NcYMOzACgZZjjlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIQZ-0000000HAb1-2IOc;
	Thu, 29 Jan 2026 03:10:39 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIQX-0000000HAae-1dUF
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 03:10:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xP+hc7CsnB3BwQ6KfeEMcOQQA12NiMhKpZBjWnpbNhGRvAERfsmTDzdsIVgtF4bo1iUUd5HnTinT8SPthOfXGf1H9ANQOu3Y9s8/B7NdESFKiT4KkapWvQp6WG/Jg9BQDqbPDI3/TlzHKZHeQQrtfwgduMuX9Bvibz4Ox09ZqC39NFuCEa18E/1MyrfgwB3F+LAkeAf6R9BbigFF12Jx+S/cUOrJ8OX0++cseRBGhvZcCKtFpKfU/r2rGfbbkbVM7T2jx5mSx6ybXEGtqptKzWVqTIam/U+Hxd/Dn2kVhVlQl1+H0Efl2XpAgSrW7iPaxUVxGDfqMvl9rzxvIdIP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+/nOUQcfNqFScdsvDYU+fjmtaWRMbf2QIFxSlyOf6w=;
 b=JiIa9z4w8a9Ge3PahFV4N/ByeTdnSuW+qYjdWqw3HH+7hpGpNDIWGqAqpm5jt5d+rpsm3pe0rcZMWGlQ5cbX1pUndXRFnw525pO3lkqDR4439zkOVI84ulE6xlcTgo9v2GrbMNZt82uLQVrCWHgjck1oQsNTFPGzpJpRsqBtBGNqGqXja7l3pApcfvB8je/yRa84SnwW3qmqdnCFkUTLpEs2NFTneGRWtWWtB8602gS5M5ql710vkmYhg+8pyt7sznUsbwkok4Jxsk1Gbez4UkkwyNsiWpQ8oM4dZ2BNBDXw7qP5lCMslMoEPJ4COc/Y8Qcx4wOSbY94Ws70a4e5nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+/nOUQcfNqFScdsvDYU+fjmtaWRMbf2QIFxSlyOf6w=;
 b=i6oWYMxRTY7r3179TQio6qLzD5V1yYFXl/D1EAm1SvQelX6FYJCZjMJFGgEF+BBTl4TUZQgqsNHic0N/WxyheQbRH4SM17tlGS9Q9tNtO9muAv+Gc1w5YWaQmJ8Ph622l1mk0zlgn7F54LNnu2HQOiwnz+c324kudq7RJ0fBBqAKk9xYOAdAwcVQKR5vw/7PcG4Yv1Nh2eQQLfQqzB/B6VqmBSqQMC5HYKExpOmIV6LxRFrql/s+NlYO4Aqjl124WknkqSFX9mk24O5S9PDNgBJGRL/05tUGwPdpW2+puZy5/V25NMvCjySv4mcaLsIa4vVjyZLqfmdzPAWw2o6j1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 03:10:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 03:10:29 +0000
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
Date: Wed, 28 Jan 2026 22:10:23 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
In-Reply-To: <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
X-ClientProxiedBy: SJ0PR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:a03:338::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: b51ca396-e7fa-4e09-db8e-08de5ee3f4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REJ5Qk9UK1FCUkw1VGlEUlIzQ3FtRzIzeUgxT1ZLSk5FQjhCQVpXeElzcVpt?=
 =?utf-8?B?V0tnK0x4b0RsdWo3ejZyUlNpNmtyRFJ5ZGdBU1dqL3RkYTRRYzdlbkhwU1A3?=
 =?utf-8?B?SXpKcmw4MHlLWXpLOEJzd1N1UmswVXFhc1EyMHhhdGJGSVlhVnhIaG1NSi9r?=
 =?utf-8?B?aCtVdFQ0VXVnV3FFUmF0R0psdHN2V21KNVJTOE4wc01MRDRaaW5jNnloS0hV?=
 =?utf-8?B?WlhzUE5KRU5RTmUrSGIwL3FYQmJwMVdWYkxYVXUzaW1pSEhlK2hZUDJDOEIx?=
 =?utf-8?B?Znozd2tMWlZKem12NWdRVVRQS2hjTEt0WnNtd2NHMU8wc0hHOXBJdHRTaVpS?=
 =?utf-8?B?YjZmZ2k1NDh0RUZha3poYmgyMUYzODdFVGc4Zlc5NWczREh2WmZGaFBNTEtJ?=
 =?utf-8?B?aVZVMGd3eVFMRlMvVDdZbFpXVHVkZjg2STRYRlpBcE5ORFdxazhhWVJHVHhH?=
 =?utf-8?B?RjczeFpSZUQ4bENjZUxaMFZBN0hybVpqMHFaQkI3VVU1UUpKV25sSVZ3VnRn?=
 =?utf-8?B?bU1mM3Z0aFpVc2IyL3NWWkUzaCtoV2NBazdreFVsb2VxbEFxUjdPWmphVUhR?=
 =?utf-8?B?WkRTRGRGbEU0dTdyM3hmSzV2MENjc0t5UG03NlEzdjQ4Vks4dVJsMTBwYVZO?=
 =?utf-8?B?Smc2dmwxOVpHN2x1OEowalMxL1FLRUlPYVk3a2JUNlRqWGczaHFsWTJhcGlF?=
 =?utf-8?B?MDRCaG56Z0xSblBJSEpENVUrM0g2bmpWSFRndlFhaUNBK3loSnhQR3hZYnMv?=
 =?utf-8?B?Y3pBODlPUkYzNWpKeHY5Rk9GdDNJY1hSWXpIMitYWlZzRWkyeDdaV2RyQThy?=
 =?utf-8?B?MW5OM2NKZ0o5TG1SR1FId2toWi9QalBjZTAzaVNodVVPOUdUbm4vRWVpdkIw?=
 =?utf-8?B?V3ZZcFB1dWxKaFZTZnRwM2s1d0xSQ05wNUN4Tk1SQnBDdFJCbVo1MkYwSVRa?=
 =?utf-8?B?TW0vaWsvekgxYW9iS2xZWDgxMEgzdlBGVlZER1V2eDMyaVNtcUp5bmtXSytp?=
 =?utf-8?B?WW9lOFdUTTN5R2lRNnllNHhiVHJTdkFmU0tHdlZpc2MrQm9xVjg1d1NndG9M?=
 =?utf-8?B?RkFoTU5RMWQ1Q3E3djd4YXhIWnlPRTBuZUFiWk4wNzJzZjZzbzdseUZxN05Z?=
 =?utf-8?B?bGJBaHZ2Qjd0dlRqMks1czNLN0FSdkFkalBzekd1QzNFL3Q1Z0cwSWlOMTVp?=
 =?utf-8?B?TG1TdWY4NHBOb3V4RWY4L2VsZTNZZFQ4K1duTTFHc0ZHQWtxUkV0OXp2ZGdY?=
 =?utf-8?B?YzJmdGJsWUpEVnpNK0ZRMHN2alpJYjExaS9vVDU1S210UjVHSDZWWnZkTjlY?=
 =?utf-8?B?alFOQzNmVTBkQ3NXdEMyVHlXV0h5cmZJSEI4R20xZXZMNk15M29TeGYwd21k?=
 =?utf-8?B?L3RTWVhkcHFHUDdRQnRXSlU2OThsL2VNTklVQTk2WUEwRmE1U1ZhV2Y0YU52?=
 =?utf-8?B?czNXRHU2ZTBRazZVRldwaXJIdC9iWE5KNVJyVG5MVFd6b3dSdDBCdVZROVRz?=
 =?utf-8?B?cVVoVkNERHdaUy84cENDZXZnSGlZUkJMSWZpLzNPMnZSMHR2eGxmcHgyZlgx?=
 =?utf-8?B?U3dsTXdxSXQ2Zzk2VHVRZjFHMkxob1YwRWZtMU1jTGpHVE96ZkNCMEg3SEhH?=
 =?utf-8?B?eEkvM2swNzU2aU1ac3hnNFZHQ2c4NmxsSkViU0hSTllsb3J1SGlYc2RQTENU?=
 =?utf-8?B?cXpsSmEzeEsyN2dTVjdlN1Q3bmVxdXpoKzljM0pVQUxvQnUrcW1WUmtEaXEw?=
 =?utf-8?B?UUxKSjg0ZU4zR1BoNVV4azVYTkVIWllXS3ZWekppZi9LOUtuOElTK0ZRT2tZ?=
 =?utf-8?B?Q3RzRkh2OGVjZFJHQlZoaE93QURRLzRZTEk0UU5yU2wweS83dWtVd1lPU0lE?=
 =?utf-8?B?ZmpSRVY2TUNVUlpMTXJpM3A3MUNTai9xWjk2VmpzZG9JL3l6NUJnOWRqTElI?=
 =?utf-8?B?QmkwQmRNb01BNkh6dmYwbTVFYnRFSEZ5TmFDSTE5WFg1WEJUOE9lbFI4VkEw?=
 =?utf-8?B?alVaWEhxWUxFcWUyeSsvTUZ6K21STittWm9PcHlaeFRpSUQ1aElXY1k3Ym5R?=
 =?utf-8?B?djJpbDdJQW1iV2VpMi8vdisxeEkyUlVuelhqc0hCU3cyVWx0S3ltM1ppaXU4?=
 =?utf-8?Q?hbKE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmVrMzZ0MEdHWTNNZG9Pb1FaQ3EvQzdsOTdBQUI5VjZ1M2pzWU1jcVBJeUYr?=
 =?utf-8?B?MHRpR1VPUzZKa2l6MG56ZmlPY2pYN3VQdXIzZnF6WVJCTHhFd1NaY0lRbzRQ?=
 =?utf-8?B?d2JlTXNsTUZWb1pDL3JveGdpTTRiR0hweFpsMjBYMVVmMlozVXJqOXg3OVpV?=
 =?utf-8?B?Y1lQTWVhTGlCQVJ5ZFVMc0F2dFZPNmVsR1NkZGJDbDVXdTdJd1kyeHlUOGtI?=
 =?utf-8?B?Zkl2a2MrQlRZZ1pGVXZ6ekhObUpkRXJGUnBwTW5FbXcvSHF4cGdKUHgzcmJw?=
 =?utf-8?B?My9lL3pjenl2QXNNdmtFOEVrclVrY043aVRPRjQ4WEJpWlJiQkN3Rkc0c1lK?=
 =?utf-8?B?NmdMaW1XMzE4RlREWmRZSTBPZFRLSTdFbXI5c3RmQU1pYmM5QnU1aExQL0d2?=
 =?utf-8?B?UDdBUWhZbit0U3A1c2RHMys2VWZtaXp5OXRSaUJVOFpJZXc0bnR5cUJrVkQx?=
 =?utf-8?B?dWlhM3BGWTRaT1Z5WFhmODVDeUN3SldqZVpBbzk3T0hPbEFVK2RpTFJ3dXgr?=
 =?utf-8?B?NThhMWdRV1F4YzYxcFd4VFFwNEw5Y3NwS0kwdVp0cUE5UnFnUm9rdGIvMUdC?=
 =?utf-8?B?TDg1bWkvWkR0eWdhWkRSWkREcjlKL2k1K2poLzFoaVFDa3k0ODR4eW5HYlBl?=
 =?utf-8?B?d2hoMzVJMHRtRVdKd0VObVlkWHhscCtLMjFKemo0Q3FGSXFsakVaU1Rpa3Zr?=
 =?utf-8?B?WXJMc3hoRTRQaUtzWE9FVDh1MUliQ3g0Q29DL2gvTXJQNysvS2xUeUo5YnRi?=
 =?utf-8?B?Q2dmOFdNQXZqMGczaXg5am5yaWtWSm83cGQrSWg5K3pLeStsZ1VJVXNEVTRj?=
 =?utf-8?B?UEFabm9saFNxZlBJeWxXM0ZGYk91YTlQTzgwMEJLNm0wcVAzdGxjV3hEODBT?=
 =?utf-8?B?VTl0YTBMUGxycnNWQXh5ZWtpMndQQWlJZ2VxTTZtdjNpZ3l3YUxDSG54b3hz?=
 =?utf-8?B?N3FKOTNkUEM3UzJ0OGRFaUpUM04vZysveVlCaUdlajExL3FlUlFHYWlJMUFz?=
 =?utf-8?B?RStiUnJGbkhFWUpwSTJ2Y0wxKytubGxEdnVNeTdHS3M5Y21LenlDVzhrY3lt?=
 =?utf-8?B?aFQyd2V5MXljdEZUQUpXK3ZTek4zTXJDalJkNldBVVRCbGp4YTg5SU1HUk0r?=
 =?utf-8?B?bTd4SmVHQ29maTUveE95NHVlYTBDUmorVFNXN0J4aCs3c1A4akx2dk4yRU55?=
 =?utf-8?B?TmVqV2tvSW1zUFNqNEhPV1lNMkdKYURZUC9VckxRMDJUNDg1Wko1UHpRWWNW?=
 =?utf-8?B?R0RpOWFSRTZFSjZGUW9MVUtNN3RyeVg1c1o3NmdGcWNmVXFKM0t3VWNna3Jk?=
 =?utf-8?B?OG1Wd1R0eFRBVjh1bWdZYUdvWFNkU1ZCUUtjc3FNQWJvblYxUHk5WS9SbVQ1?=
 =?utf-8?B?dGs2dG9TQWxWUXBBclhSOWJxMUhNSEhReG5oMEtQSHlObkd0SkV1bDFveEpO?=
 =?utf-8?B?aVpYalNLaG9URUdZL2wwa096cW42WlVOS2kzdDRDRmh4NCtrbDd2cmlqZ3lo?=
 =?utf-8?B?T1pJRXROc3lFUXN1MjFUU3IyZVE1U3VkbG1oQno0T20xcjVBeC9LdldtdFFp?=
 =?utf-8?B?UUp1b1c0a3VWQkN1bURjV1VlckFIaWVyVkJpeW5CYnA2aDEvVlV0QUFFWjdH?=
 =?utf-8?B?c3M3NFNCVFpueFVuVzkyUDFhcGJ4bHgxb1JIVnMweTBVQmVrS1BZVzFWV3Bp?=
 =?utf-8?B?MEw1aFdMaG9SVE9Ib2xweXdzSTc1Z2l2MmJEM2pra2UyRzRZdmdOQXJtMldC?=
 =?utf-8?B?T1ByRHhnVnNhWXY2OVpFWkNvMXlYZ3lHUkRlNjhwSERaVUZWeThyOVNvc3h6?=
 =?utf-8?B?MnoxUW1FMmI0TXdNVC9ObWlrbUtIaWx0Tnc5SWRmUWlMdU9NRll6T0UwZlY5?=
 =?utf-8?B?dGU1NEI5cEo4Mm1tNTB0bzZzSklxZjN5cGM3U1BiTzR3ZUh6RUdkTkVFNXN5?=
 =?utf-8?B?K3hxcEllRTRiNEFRR3ZoaEZGUzhFbFBxRWkyUmU5Zmw2N2JjMU5URzIrUUhu?=
 =?utf-8?B?eUdDSUNybWJnUFpWMitiRWNHR1RQRDdXbGF0cXZBYm9sMDY0TUlJbDYrMkdX?=
 =?utf-8?B?bW5sWk1YalVkcmNFb3NPUFYrUnk0MEwrRHI2dlltMDBPUzV0NW0raloxZE1I?=
 =?utf-8?B?Rnh1VXE4YkV3KzYveEs4RjVoQk5pblVEUm9RS0phOHBXT0tGQk5xc3NjbUt6?=
 =?utf-8?B?RnlBS05Ia0lOR1dCUlVEdWl5ZEdwZGRjZDgycktLdzcrWEZXejhnd3o2ZzNB?=
 =?utf-8?B?eDY0ZXkvSUJsUGRrR0dLTUc0MnJzMDA0cTBhL3MrOXJvNUIyT2ViY29tdldw?=
 =?utf-8?Q?bzrrcCwL0Kp1lJOoV9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51ca396-e7fa-4e09-db8e-08de5ee3f4c3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:10:29.1552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzGPMtgWHhiNaWtZPBp627HiFQDelYkm1Shy8GfAr78M+5JJB3sDvEToQCSfzrm/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_191037_445474_59DD6E43 
X-CRM114-Status: GOOD (  15.97  )
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

T24gMjggSmFuIDIwMjYsIGF0IDIyOjAwLCBNdWNodW4gU29uZyB3cm90ZToKCj4+IE9uIEphbiAy
OCwgMjAyNiwgYXQgMjE6NTQsIEtpcnlsIFNodXRzZW1hdSA8a2FzQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Pgo+PiBJZiBwYWdlLT5jb21wb3VuZF9pbmZvIGVuY29kZXMgYSBtYXNrLCBpdCBpcyBleHBl
Y3RlZCB0aGF0IHZtZW1tYXAgdG8gYmUKPj4gbmF0dXJhbGx5IGFsaWduZWQgdG8gdGhlIG1heGlt
dW0gZm9saW8gc2l6ZS4KPj4KPj4gVHJpZ2dlciBhIEJVRygpIGZvciBDT05GSUdfREVCVUdfVk09
eSBvciBXQVJOKCkgb3RoZXJ3aXNlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLaXJ5bCBTaHV0c2Vt
YXUgPGthc0BrZXJuZWwub3JnPgo+PiBBY2tlZC1ieTogWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4K
Pj4gLS0tCj4+IG1tL3NwYXJzZS5jIHwgMTMgKysrKysrKysrKysrKwo+PiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vc3BhcnNlLmMgYi9tbS9z
cGFyc2UuYwo+PiBpbmRleCBiNWIyYjZmNzA0MWIuLjljMGY0MDE1Nzc4YyAxMDA2NDQKPj4gLS0t
IGEvbW0vc3BhcnNlLmMKPj4gKysrIGIvbW0vc3BhcnNlLmMKPj4gQEAgLTYwMCw2ICs2MDAsMTkg
QEAgdm9pZCBfX2luaXQgc3BhcnNlX2luaXQodm9pZCkKPj4gQlVJTERfQlVHX09OKCFpc19wb3dl
cl9vZl8yKHNpemVvZihzdHJ1Y3QgbWVtX3NlY3Rpb24pKSk7Cj4+IAltZW1ibG9ja3NfcHJlc2Vu
dCgpOwo+Pgo+PiArIAlpZiAoY29tcG91bmRfaW5mb19oYXNfbWFzaygpKSB7Cj4+ICsgCQl1bnNp
Z25lZCBsb25nIGFsaWdubWVudDsKPj4gKyAJCWJvb2wgYWxpZ25lZDsKPj4gKwo+PiArIAkJYWxp
Z25tZW50ID0gTUFYX0ZPTElPX05SX1BBR0VTICogc2l6ZW9mKHN0cnVjdCBwYWdlKTsKPj4gKyAJ
CWFsaWduZWQgPSBJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKSBwZm5fdG9fcGFnZSgwKSwgYWxp
Z25tZW50KTsKPj4gKwo+PiArIAkJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX1ZNKSkKPj4g
KyAJCQlCVUdfT04oIWFsaWduZWQpOwo+PiArIAkJZWxzZQo+PiArIAkJCVdBUk5fT04oIWFsaWdu
ZWQpOwo+Cj4gU2luY2UgeW914oCZdmUgZml4ZWQgYWxsIHRoZSBwcm9ibGVtYXRpYyBhcmNoaXRl
Y3R1cmVzLCBJIGRvbuKAmXQgYmVsaWV2ZQo+IHdl4oCZbGwgZXZlciBoaXQgdGhlIFdBUk4gb3Ig
QlVHIGhlcmUgYW55bW9yZS4KPgo+IEkgdGhpbmsgd2UgY2FuIG5vdyBzaW1wbGlmeSB0aGUgY29k
ZSBmdXJ0aGVyIGFuZCBqdXN0IHVzZSBWTV9CVUdfT046Cj4gaWYgYW55IGFyY2hpdGVjdHVyZSBj
aGFuZ2VzIGluIHRoZSBmdXR1cmUsIHRoZSBtaXNhbGlnbm1lbnQgd2lsbCBiZQo+IGNhdWdodCBk
dXJpbmcgdGVzdGluZywgc28gd2Ugd29u4oCZdCBuZWVkIHRvIHdvcnJ5IGFib3V0IGl0IGF0IHJ1
bi10aW1lLgo+CgpWTV9XQVJOX09OIHNob3VsZCBiZSBzdWZmaWNpZW50LCBzaW5jZSBib3RzIHNo
b3VsZCByZXBvcnQgd2FybmluZ3MKZnJvbSBhbnkgcGF0Y2gvY2hhbmdlLgoKPj4gKyAJfQo+PiAr
Cj4+IAlwbnVtX2JlZ2luID0gZmlyc3RfcHJlc2VudF9zZWN0aW9uX25yKCk7Cj4+IAluaWRfYmVn
aW4gPSBzcGFyc2VfZWFybHlfbmlkKF9fbnJfdG9fc2VjdGlvbihwbnVtX2JlZ2luKSk7Cj4+Cj4+
IC0tIAo+PiAyLjUxLjIKPj4KCgpCZXN0IFJlZ2FyZHMsCllhbiwgWmkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
