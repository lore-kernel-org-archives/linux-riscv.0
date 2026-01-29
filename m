Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2655CD46C1B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 03:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZeERwth2L9ofMdTJJqEn1sPaMPOGamvsYSEPy9yZ0g=; b=Hz/jrg1Xs0sBIE
	qPE7QfCNPm/0cVgGF5FPnTaF+xEoWcXBNltNz4JfLM0fQZ8YS5m8VQxMwJ/jcJlq2dNpQOnTrybIF
	eTwFb/8S5Q93XaR75FY5bzWcCYf/9JUCMCt3MKw3SjGFlJMTiOk7F8iDpbNLq8m9pfF5L6EFT1E2F
	MLcppjZsHSel2MpqZDl7NWvN/U7iVHScEf2dW/QE3yRmNHCk7RWX8sjxYvfPibmq+X4x6+BCk4bf4
	O9SeiKLALeiUF1zUrwsKVjsNMuKWe8ChAvn1DIKlo+wq8DX02lsaWLv1qqvyR1Ilk5hJdMDeQmgp8
	ZI9kj/tb4C8uSJMdkUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIjB-0000000HBu1-0rHE;
	Thu, 29 Jan 2026 03:29:53 +0000
Received: from mail-eastusazon11012004.outbound.protection.outlook.com ([52.101.53.4] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIj8-0000000HBtf-1nfJ
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 03:29:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iavx2Ewg+y8H65fO8G1etKJB7H5uxyRUlD79w/MTIH7Tw5sTqROpq2OV7pvpROdlGxVAYVeKvSJFD3lJ93AlBWJBgi3DJQj8MhyE6B9d76qS8Oe9uYYJlIdiLBeG9xsCG+p+J5fJUleoLzU1GY6xV0FQdMqGe1Lc788wM91nf3Ly7RXQI4aL6A5soNV9ohqRy6h2/xpw065x3MLcr37dn/D/1ZLBv8kAO2nnQ7KlG065lsy9nQIFSpyO11oVPecH5azTAb6bkEwal62rI5DSw8SlKtGoeyj4PNW3Y/0iEZlkPbVk33/tNgkhl82aIK5GQzmnMUd4rNvw51ByGaezQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCyPoEoE2tQGag+LWxkyo72daHVs8+N5KrA777a0AZ8=;
 b=XkEWMN1ocqLDqubveIfqh7zUshO1zh1qNun0tIktJbmUufs3RpNGL0ZFD2MMwmLrXNRL52xJRpmrDlhrKM2nlf7PJnJlfwWvSCGI+7ROYwarkss5MHLWdcZpvQy05OOIQyKSxV5VML+jpsekIDMjOK/nWeJz9HknVXzGvGu5RxQCml9QcCJL6j9vPTh9R4GbyWjKaMO0d/t4gF1g/aIm8vIgEIEpNmSEijdFnVvMcnaR8y1kY7BuSs8Z30UEHOxOhtRNh9i5NskvE4cE2epfE10Qx5OEDrChesCWhu0lkvtS91VRm+KdQaw7MAieOWPtV0kMn7pGPb0T24+0LO+Svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCyPoEoE2tQGag+LWxkyo72daHVs8+N5KrA777a0AZ8=;
 b=arK0HxD/fFSNM6NyTFrHUMcWPMNuT7Pw2AoCj3fuVbg8Fj8F0G3TO0f0xd+h9mEWdhEsTe+a9KRhxt9mY3ObyA31/wG9GIimNT44bHloJM9A/PT7k4cXaODeQ9PhS8kejR15wwCW3SOBrJqh2ADpTnfnfriu9qSirFnnhH4q/ywQsJMbJ1aqI8hYl6nm86gxEgHaogvaHb0dVe7b1V4OiV6Td+c8SbiHMogvyEhOujpfk05Z+wwvf+NhZsRRCkuZAjGZf+hsG74JZEaIp8EaKRMERwd8bwqK2qHtIfolvb2UaoWDuAPI7PqwVlHP+67Da8mR0b4Cj98DbJn4RAKOBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL1PR12MB5971.namprd12.prod.outlook.com (2603:10b6:208:39a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 29 Jan
 2026 03:29:44 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 03:29:44 +0000
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
Date: Wed, 28 Jan 2026 22:29:38 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <5AFAE2FC-7274-4A23-AE92-797D5B69AA8B@nvidia.com>
In-Reply-To: <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
 <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
 <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
X-ClientProxiedBy: BYAPR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:40::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL1PR12MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d894e6e-1083-479d-7ac5-08de5ee6a588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnoyY29aQ3NHVnRpQkFjbWprRWRmUkRqT3I5cG51R3dGSnFYSHNaeWs5dE1U?=
 =?utf-8?B?d0Z2d2V4MG5kMlFHSzc4SytHYzdDa2F4c05YbklOVUVmSms4MUYxMVRqemN1?=
 =?utf-8?B?S1ZUMWgvTTFEOHZudVV3aW5KdUVsbjZvWkJZWGNMcTRWYlRVd24vRm5BNXJo?=
 =?utf-8?B?cFBlUi91M3B3TkZpRUtYV3dwZE9TaU8zZng5enplM0tJOXgzU0dqUS9Db0Vm?=
 =?utf-8?B?NktDWll2SGtLeFRURWk3SVdiNUZWMkNtT1lXSGw4bSsyM1dqeCszSTFiK1N3?=
 =?utf-8?B?L0ROQnZoUTlzWTYvM0EyQ2dKOXE0YmVTZlVhRkVXOCtXOGtEVEhJQjFENTNz?=
 =?utf-8?B?bHVCMWgzVnA5bU9FWGtiMFExRXN4SUM3WURvZ3ZsYkVkUFdneldpeDdqZmtS?=
 =?utf-8?B?aUI4b1A1cmRDT3lVUU5SODNHUDdYZlpPa2tkSzlYWmpKaFNvejRsaFlja3FB?=
 =?utf-8?B?TWxIWGNwelVndGdBNXZndURyQTUyTHFuMXJPZmh5aVNnTG5vWkdLRGlyUlRy?=
 =?utf-8?B?aUFveGNMOFpSYktKMkVPWjYxcjdUSkFYWlIrZWlITVFGUFFKQ3p6T2pWSWZh?=
 =?utf-8?B?QVg4WHNLZ0R1VXZBU1B5UUFpakVsdmJENzh3ZEc4d0lxc0lQcjdNUGNtRjdh?=
 =?utf-8?B?a1VyQjhENmk5Rit4ejd0UUlwWWZZTjg2MTVTOVJja3FCREVkMkZaR0MvekFm?=
 =?utf-8?B?N1pCVVluUEdkMEh0QTNyM2Jnb3llcUxLNEF1TnNTcXdzQTZpMEZ5SW52VEhM?=
 =?utf-8?B?RHh0VkVKeEZBUlpQOEtJZzFHSlQ2bXpsbGdYeXY3djdLTVhobzdQOHhiRlZG?=
 =?utf-8?B?U2FRdWtDcmpjZm40WUlSL2JOZnZMcWtOZzlCU04wREhhWVRMQUJBSUtIeUs4?=
 =?utf-8?B?YlU4LzdWUXZ0dU93V1VNQ0RQYngrditrZlBrNXBHc1BlZlp6ZFVkZjBYbE1P?=
 =?utf-8?B?aWZDTzZmOUVWYklHVTJEcnRmYk4yTzFqR083ekhPRUxjdXJVc1dBdjZMS3p2?=
 =?utf-8?B?NUNNV0t0VEN6Y3M5NEVhaC82QnRjU1pDN2lzS1Z0SzIvaE5tZFZXQytkM1R0?=
 =?utf-8?B?TTVqc3FKWGs5ZzhaTTVqbzJhdDNsK3FXZW1Wa3N0MGJGMS9nSFVlTUtCc2o0?=
 =?utf-8?B?V28rR1ZBMDNQUitQN29ZQU9Pc1FPUzA4RjFuZlpWWjAvSUpiSkJGZTYwbzJW?=
 =?utf-8?B?Q2dJa2RVcVkwenlHZHBrcGUwNUY0cjdKVVFTZ3UxS0ZwSkl3RzZjNTFMdXdS?=
 =?utf-8?B?c3hmendVQUNSdUViV1FYYXh5K2VtRHJ5dHNyZ1I5TUJuYVVCUDFnSnhjSWhQ?=
 =?utf-8?B?T241SnpINUhocGIvdk0yZC9MZnM5RVdpMVRDcm1oN2VTaTBtUTlicWJmVlR2?=
 =?utf-8?B?TjZrWjNpS25qNkJiNnhkaVJDMVByK3V3YVloUHE1TVI4bkVuRmdSZDhEWkx6?=
 =?utf-8?B?S2tWRnZ4dHZOdGcraE9PK1FvTnEyNEVyMTJ3d2hoNk85dzVXSFBrN09CMFJD?=
 =?utf-8?B?VGlvTFYrSVlQSkE2T2F3YkNZVko1cjV4eklJZ3lsY1hBWk5XU0pmTWZrSWFp?=
 =?utf-8?B?Zmt6MzJuSEZJcWRmYUxZbVhubWE5NkdOVFZsU1JlNFBmRGVobUJBempDRWU1?=
 =?utf-8?B?MmRMZ3ovalR6N3g4cFpZNzhGc3RKRjNaVFJLMWhzNGdYMis1UDJUcFoyNDVh?=
 =?utf-8?B?bi9uZGtjczBXNTErdE5DTDFUbTd3V2dKdXR0aWMvUU4zR1hGZWxCR2twaGVR?=
 =?utf-8?B?UGRoTThiOG12RkhzaHhUajBWR0NLMHhYRGFVUEIvNnJtenNmZ0w1SEoxV1pP?=
 =?utf-8?B?bGRyOWFRT3hLRm5menBhZmx4RTNWVWF2TFpRYlBuSzMzYVEzTDMrWGN5bjFk?=
 =?utf-8?B?NUdYZExXQnRhbjUvcFliY1UwWFZLS1hZcVhGY1NJUGJmeEl6S2tDNjd4c3BP?=
 =?utf-8?B?N3Q4eTJZMy9wWW5PZmxBN3IyUUZ2VUN5VkY4eFkwN3E4MzBMTTVjbFlFdllh?=
 =?utf-8?B?ZWhaM1lKZy9ON25XNGgwcE4wRUg5d3paVEtGYlNMU3FxbGZPeGR4Q1BZdVBL?=
 =?utf-8?B?akFXY1BocWduMVBRYVFRZlVyaGwwRWJ0TDdBc2lDMnpKZGp4MFJXTFdjQ2Yz?=
 =?utf-8?Q?kEsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1l6T0U1MHJIdEJxeXdvSHM2TWFzT29RVnZUaGlmYW1ON1F2Ujl2MXRHVnV3?=
 =?utf-8?B?Yk5YVks1REhnSjFoU3d4a0xTaThGMXpMeGNjUjhDdmVqZm1YYmFCb2FXb3B0?=
 =?utf-8?B?VFVjZDgzcnVwaDk1VDdoREdVSFNEdmZFekszbzV2MDkwODJuNWFUV0tXK3pu?=
 =?utf-8?B?cVdHdVptVlBCM3cyUlJuRDQwVmJrYy9vR1J5Mk9neStaVm1Zb0J2RDFCWlJy?=
 =?utf-8?B?UkltZlJObVZyUERMYlliQ1RMbDM0TXZub0JRR0VUdlA3RkRNWGFyUHMyWGFt?=
 =?utf-8?B?QklRMnBkRmNJOWk4VzQ4ZExDbXlqWmdUd1FXazdYbkdCN1hUMEtCR3VLUGov?=
 =?utf-8?B?ZUFYdWZWRUpGanVWcVd0UGczTVNxai9wcWtxM3lENTBmNEFSZWlqeUtmaWha?=
 =?utf-8?B?UHJ0Rk1iSnhDWUZBdlRLbS9LNmZ3OUZHdWZHZEliYVhnQXZxOUROb1BxOWd1?=
 =?utf-8?B?UC9WTjUzbDd0cll1VU8wci9rL0VIRlFWTi9lT1ladDJqeDNJR0RBdlB2SkVO?=
 =?utf-8?B?Vm1wcHNITDRWSW40UnBQbU9zcHJSczJVNE9TL244YVFlVE90d2pGVExIc3NI?=
 =?utf-8?B?TUZLWnhuaWJpS09WWTI0WTVoVmFvbFdGWm0wb1pTaTNhUEh6L3FUYzhLRnlP?=
 =?utf-8?B?UisvL0JaU3BnajVaOVlnSFBtRXkvbFRqdEpVTFZOVjlJN2lGQlB4Q2JZMWJO?=
 =?utf-8?B?ZGxldUxkc3RsaGRNRk9uTnV1YXdOQTdFZ2V1cWJLalRkY1BDUytVNTFUSzZv?=
 =?utf-8?B?dlRnbnRlQ08vYXVtcnVMYkNNQTNBeXVBYTBlaXJpNFlnNDJ6Z0RoTXl4WXFp?=
 =?utf-8?B?OXhma0RPcmdWQzZ5c1BydzlNVHNMemFCaWFxM0craENVUHBJR3dCbUJSSHZD?=
 =?utf-8?B?Njh5YTVUNGZJOTFBblMxR2p1WDVpVk5IMUFHL1Fmbmx6dGNrazl3cGRWNW9x?=
 =?utf-8?B?Y3YralQ3YTJnMHhpSFlkdlgxd0lEMjViUk9oM3BRTGZFQitvOUxUQVYrNVh5?=
 =?utf-8?B?d1BIYXBneExad0ZpVEVTM3VxWC8wcEpaTzlWUXYzbkE4VC9CUU02NCtoajhz?=
 =?utf-8?B?T1J4UExaZ2RmZXAyTkVvR2t3b05kZzBINWgwZGgyRkxIQlRWYXdHRVdzSzIy?=
 =?utf-8?B?WlNVRGw0Nm5DbVhSd0F5eWxXN1g0TXN2VlZUU3JOTzRESndheE9CZjhVQnFO?=
 =?utf-8?B?WHF0UmtNdHV4OWVlSHljanZHd05nNE11WHhiL2hseVlqdEFVUUxPdUhkY2Vv?=
 =?utf-8?B?eFU5SjhUZElXYys1K0pTTWkvZ1Btc2VRbm9ER3pHL3Ezc0NjRE5WTXI5L3h5?=
 =?utf-8?B?N1FVbHV4cTFyTVhEQlcwVW4zREp1Z3U0MnJ5Mi92bmZxUU84TmJHNG1FNjNH?=
 =?utf-8?B?WUtUR3ZsNzNQQWZIUXpNWTdnbXYvRVZOUStYdnBUREJzMEU0MDg1SXdqYzVB?=
 =?utf-8?B?UWcrMm43Y3Yrd0FLS2p3SkFLc29nREp0VEd5WHNnWU5OQVBQYzAzRkp2RWoz?=
 =?utf-8?B?ZHovbTNSdkp0akVBbGpvcHQ2T0s0Wk1kNVEwZUFPcVhOdU80NzFWdXlmbFVw?=
 =?utf-8?B?bEI4ZDc4d2FMMnpGWWtKeVFQZU1qYTF2eTEyekVPczZUZElhTWR3OFNaVkZR?=
 =?utf-8?B?aCtQUTBwQ3lEVmJiQ05GWjQ2dHVMK3VBeWEvaGR3emN0cUlmTllZc09iV01P?=
 =?utf-8?B?TGR2QjRPTHh0Y2xQUSs3VGVqY0xNSkdsMU9ZTUVISnM0TGJCM1hTb0t5T0xS?=
 =?utf-8?B?emQ4NlBrUndTWENFNHc3dG1URHpvRmFDS1UyU0oyZjFydzhyTk5PK2c4VW4v?=
 =?utf-8?B?RmdockVkMnF2eWt0Z3BzTExmR0tXUUFhRWVpVTZzckZsMUVpRWFOdUNkWmRr?=
 =?utf-8?B?TDZIallIMHRScGVnb1RpMHVNbkwzbU0xbGZ4ZVlsUWh5WTQzL2NFM0xCY0tR?=
 =?utf-8?B?cmp5Rkxhb3RMR2VOTDRKTEo0azlrN3ZBdENLM0hxVlhMbTNEaUF0SXZ3NnJI?=
 =?utf-8?B?bkV3ZHBnUjVHdlBQcElVM3BiZHBndWQyZUs3c1ByeDM2aUYwR0M3TGxzZm93?=
 =?utf-8?B?cW5OWGVuUVpqMGxDcFlZRDd2WXBua3VpYnluajFMYXA4SHdqOEVZT1czeGFu?=
 =?utf-8?B?TFBBY1p0bXRFSVpkVVpodkY2T3Z6alBUelRzdnlXVmpCOUVxa1RURlkwUDl2?=
 =?utf-8?B?ZEJFUDRmSHF1Z2l5YlVsbkdGK2RpZC9aZkhqVmNXVjlKTTd4MWgwKzFJakQv?=
 =?utf-8?B?SzhtQ01sWEF0Y3Q4QVZFbkJuZE5veStmbUh5emJnZ2tOeEwwVFpXeFFiN0xE?=
 =?utf-8?Q?cuZDHVGjrgsqTt2Pp+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d894e6e-1083-479d-7ac5-08de5ee6a588
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:29:44.6860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/ZWK39tMFyNgVsHrVKW+99hNkpL8DVf4ftUwVR5dEaOn8K5Ecxtdgfik4qzm7oj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_192950_491521_DB2C1A77 
X-CRM114-Status: GOOD (  15.85  )
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

T24gMjggSmFuIDIwMjYsIGF0IDIyOjIzLCBNdWNodW4gU29uZyB3cm90ZToKCj4+IE9uIEphbiAy
OSwgMjAyNiwgYXQgMTE6MTAsIFppIFlhbiA8eml5QG52aWRpYS5jb20+IHdyb3RlOgo+Pgo+PiBP
biAyOCBKYW4gMjAyNiwgYXQgMjI6MDAsIE11Y2h1biBTb25nIHdyb3RlOgo+Pgo+Pj4+IE9uIEph
biAyOCwgMjAyNiwgYXQgMjE6NTQsIEtpcnlsIFNodXRzZW1hdSA8a2FzQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Pj4+Cj4+Pj4gSWYgcGFnZS0+Y29tcG91bmRfaW5mbyBlbmNvZGVzIGEgbWFzaywgaXQg
aXMgZXhwZWN0ZWQgdGhhdCB2bWVtbWFwIHRvIGJlCj4+Pj4gbmF0dXJhbGx5IGFsaWduZWQgdG8g
dGhlIG1heGltdW0gZm9saW8gc2l6ZS4KPj4+Pgo+Pj4+IFRyaWdnZXIgYSBCVUcoKSBmb3IgQ09O
RklHX0RFQlVHX1ZNPXkgb3IgV0FSTigpIG90aGVyd2lzZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEtpcnlsIFNodXRzZW1hdSA8a2FzQGtlcm5lbC5vcmc+Cj4+Pj4gQWNrZWQtYnk6IFppIFlh
biA8eml5QG52aWRpYS5jb20+Cj4+Pj4gLS0tCj4+Pj4gbW0vc3BhcnNlLmMgfCAxMyArKysrKysr
KysrKysrCj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRp
ZmYgLS1naXQgYS9tbS9zcGFyc2UuYyBiL21tL3NwYXJzZS5jCj4+Pj4gaW5kZXggYjViMmI2Zjcw
NDFiLi45YzBmNDAxNTc3OGMgMTAwNjQ0Cj4+Pj4gLS0tIGEvbW0vc3BhcnNlLmMKPj4+PiArKysg
Yi9tbS9zcGFyc2UuYwo+Pj4+IEBAIC02MDAsNiArNjAwLDE5IEBAIHZvaWQgX19pbml0IHNwYXJz
ZV9pbml0KHZvaWQpCj4+Pj4gQlVJTERfQlVHX09OKCFpc19wb3dlcl9vZl8yKHNpemVvZihzdHJ1
Y3QgbWVtX3NlY3Rpb24pKSk7Cj4+Pj4gbWVtYmxvY2tzX3ByZXNlbnQoKTsKPj4+Pgo+Pj4+ICsg
IGlmIChjb21wb3VuZF9pbmZvX2hhc19tYXNrKCkpIHsKPj4+PiArICAJdW5zaWduZWQgbG9uZyBh
bGlnbm1lbnQ7Cj4+Pj4gKyAgCWJvb2wgYWxpZ25lZDsKPj4+PiArCj4+Pj4gKyAgCWFsaWdubWVu
dCA9IE1BWF9GT0xJT19OUl9QQUdFUyAqIHNpemVvZihzdHJ1Y3QgcGFnZSk7Cj4+Pj4gKyAgCWFs
aWduZWQgPSBJU19BTElHTkVEKCh1bnNpZ25lZCBsb25nKSBwZm5fdG9fcGFnZSgwKSwgYWxpZ25t
ZW50KTsKPj4+PiArCj4+Pj4gKyAgCWlmIChJU19FTkFCTEVEKENPTkZJR19ERUJVR19WTSkpCj4+
Pj4gKyAgCQlCVUdfT04oIWFsaWduZWQpOwo+Pj4+ICsgIAllbHNlCj4+Pj4gKyAgCQlXQVJOX09O
KCFhbGlnbmVkKTsKPj4+Cj4+PiBTaW5jZSB5b3XigJl2ZSBmaXhlZCBhbGwgdGhlIHByb2JsZW1h
dGljIGFyY2hpdGVjdHVyZXMsIEkgZG9u4oCZdCBiZWxpZXZlCj4+PiB3ZeKAmWxsIGV2ZXIgaGl0
IHRoZSBXQVJOIG9yIEJVRyBoZXJlIGFueW1vcmUuCj4+Pgo+Pj4gSSB0aGluayB3ZSBjYW4gbm93
IHNpbXBsaWZ5IHRoZSBjb2RlIGZ1cnRoZXIgYW5kIGp1c3QgdXNlIFZNX0JVR19PTjoKPj4+IGlm
IGFueSBhcmNoaXRlY3R1cmUgY2hhbmdlcyBpbiB0aGUgZnV0dXJlLCB0aGUgbWlzYWxpZ25tZW50
IHdpbGwgYmUKPj4+IGNhdWdodCBkdXJpbmcgdGVzdGluZywgc28gd2Ugd29u4oCZdCBuZWVkIHRv
IHdvcnJ5IGFib3V0IGl0IGF0IHJ1bi10aW1lLgo+Pj4KPj4KPj4gVk1fV0FSTl9PTiBzaG91bGQg
YmUgc3VmZmljaWVudCwgc2luY2UgYm90cyBzaG91bGQgcmVwb3J0IHdhcm5pbmdzCj4+IGZyb20g
YW55IHBhdGNoL2NoYW5nZS4KPgo+IEnigJltIG5vdCBzdXJlIGEgV0FSTiB3aWxsIGdldCBkZXZl
bG9wZXJz4oCZIGF0dGVudGlvbiwgc2luY2UgdGhlIG1lc3NhZ2UKPiBpcyB1bmxpa2VseSB0byBo
YXZlIGFueSB2aXNpYmxlIGNvbnNlcXVlbmNlcyBhbmQgb25seSBmaXJlcyBvbgo+IGFsbG9jYXRp
b25zIHdpdGggYSBzcGVjaWFsIG9yZGVyLgoKSWYgYSBkZXZlbG9wZXIgbWlzc2VzIHRoZSBXQVJO
IGFuZCB0aGUgcGF0Y2ggZ2V0cyBpbnRvIGxpbnV4LW1tIG9yIGxpbnV4LW5leHQsCmtlcm5lbCB0
ZXN0IHJvYm90IHJ1bnMgc2VsZnRlc3RzIG9uIHRoZSBrZXJuZWwgYW5kIHJlcG9ydHMgYW55IHdh
cm5pbmdzCnRvIHRoZSBtYWlsaW5nIGxpc3QuIERvIHdlIGhhdmUgYW55IHJlbGF0ZWQgdGVzdCBp
biBzZWxmdGVzdHMvbW0/IFRoYXQgc2hvdWxkCmhlbHAgdXMgY2F0Y2ggYW55dGhpbmcgaWYgYSBk
ZXZlbG9wZXIgZG9lcyBub3QgY2F0Y2ggaXQuCgpCZXN0IFJlZ2FyZHMsCllhbiwgWmkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
