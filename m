Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF583CCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 10:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N0zPfQXp+sNVtTidAugoLtXc8auq1JB+ytiINV2fdbg=; b=jHOujwNOLpzKi5MlCXnzLH2Vfl
	Bh3EmcneJIY3DuPT376QDXs7pT4jAwFwnpyUkuTovHPMHJqUuydMGGqV71GqLrV2sHUt17i0Dalg0
	WQjSzuez+5Knv2MXmJRo6HDULLf+cAyl/+xyIv5sumkD+bSvsXgsTYesCTX23OlIWpgt9AnhDOwKS
	hos7PAcF++c4GqIh5C/mdK/w46iT1vMIB0pPZcT1tLUdepVwj/o5r2XtT6wPXXrfMC7cY/QeQWdHe
	Qm+fjnoidllE0DvIe7h+u9Vk1+llN1Ibn18L/Ij3Dcr256jC/571TtykaO5H0RR5obHvEyj/TbEEx
	A17lqjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nqe-00000005mqR-0cyK;
	Thu, 09 Oct 2025 10:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nqd-00000005mpY-0Ntg;
	Thu, 09 Oct 2025 10:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=biWLAK0VQUxowCTa/aYyaJoQmxJX91FUNylh8OApvso=; b=bXhZ0l4XX3PLa05Mzwb9dSlJvM
	KdlcLsb0OliQQoqoQhsw/cs5N1Jh57L0G6M1TigdZoQoTX83qgG/3hFVEJiYKHaLKS57kCEazd5Pt
	oM5NGjWQoJqx9dQ0JPqdHntuRtchAoHzGyI42U59B7HXPd5EPu1dS7ZwAw3CNbzL8Ca8Ho00/fzVQ
	h0HuwL9vVZRn5m8agQnJP8h0AOynNqjNMOujeVKw+qvDRTnsDHb6dlBb/IAukOwwhB/QFYYNRJxKQ
	3LI3PuZuMi0cU/bc9l+txsFNqq7uD32qQQTrVeXirU/P5mdtnmAZRoiTLMqjKrJ0FOVJeALSvQvsS
	d4baaZgQ==;
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6nqZ-00000001N2K-0qIN;
	Thu, 09 Oct 2025 10:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPJawCBvlNpu1oP6SlGKaWPBKvCgBaXt5knCw9W5wgVd4wWV/8/e41tFIaVtoi+DvySnbctSfvpq7CECOAGMhSQXGPyfG0dmZfULenc+8E/EbDX2c/JaEwDcWcCP/XJZ5N+a14wbVJTurk/LGUkmprOT8gMmrpszr1b0ZPZN6sUXDfMDdraTBYS194onXyzh33kANiy+N5W8iPhufLHhMyl2z64WF4KY3UlAO7/qMKO2ELzMOEDjHVLqa/HeHgtpvgDM7dlOEvWlbDSGlkiNkcHIXaSCgCsQP0lX7NnsC/3OPHks/xXQXgsCGJ+YTQaLanVWz/zIseYB+0qm6J7jTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biWLAK0VQUxowCTa/aYyaJoQmxJX91FUNylh8OApvso=;
 b=tjsBr5Rnu5JUB2YChOCfBtXX1sASbxwpxG4kkVS/3ae+g8Ju5Kn9TG8CzxtNbWIAIFml5MdvccRpjTvwATmwbSlkEaqrtu92jb5mQsvvDu5ezwU8QbBAAzqZMvxmJz34C3Od8JUbZipM9hXblov1PorErrfKBa+xtpzUuA6vT4/XtD8l0xMqkJjQ7RhY/BQtCpgUM9U1R+YORnhMFuojrgNxUTVtqQzBsIW5+9emmTow1BETlURWrQ+fA4TWh0H1eTgs3miNOVB4nHwuxVnLAe+qjqgafrccFVwqktIW1+3qCLkaujFBiU5nDGg/sfs/TwL+Fz3y2zJH7Fk9fULZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biWLAK0VQUxowCTa/aYyaJoQmxJX91FUNylh8OApvso=;
 b=AEkkbBeTUwol5us3ROkbAmaPeGD0TxWx7uK/Xhn979IVUSv40JhSvCk/PHINPD0K4Yhh8kJOjqI6kChQWkCoEQSPnI7Kfmy41Dkv8SkFswT6QuT2zDqyxn+pVTWvvQEBprczJIxe/R9J+niSahd8ZULkHPDrK+/lKQlPQ5zS+DDNKxmAqQo5VoIpnMo3/7L5z9bDGcd/l5e9Jo0P9AY3J1J8kmIrRVgj58qDpngRt/xxtCA0UCWAVPWw8B0YPp96RNamkFAYdwcvp1DDofkmPEgFmzM+qKpm+GwU16NLEvkbwrf5EcL7eaes6mlWYrzsRybtxiOuHY9YWDkXMK4VCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 10:25:53 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 10:25:53 +0000
Message-ID: <a04d8499-85ad-40b4-8173-dcc81a5a71bf@nvidia.com>
Date: Thu, 9 Oct 2025 21:25:42 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/35] mm/page_alloc: reject unreasonable
 folio/compound page sizes in alloc_contig_range_noprof()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-7-david@redhat.com>
 <fa2e262c-d732-48e3-9c59-6ed7c684572c@nvidia.com>
 <5a5013ca-e976-4622-b881-290eb0d78b44@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <5a5013ca-e976-4622-b881-290eb0d78b44@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: fc042970-8d41-4fd6-bef1-08de071e3985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUpVelpzcVYydjk3V1lyTVk2cGpJZmZuUUFOUnRScHhGUis1L25Ra3pEQVU4?=
 =?utf-8?B?L1BZREhsQ1o3WEc3VXdoRHIrMUdCeitRRmYxeTlONlhyRWFoYUlXQVNxVVE2?=
 =?utf-8?B?b1ZLaW9KR1RmUzA5bW5BOHdvTUt1c3h4a1F1ZUVRa0dUMCtjSjVmZjZsVGR4?=
 =?utf-8?B?WFJkWUZXT29IRUN1U2ZSMHh2VWlVMG9GSlM0MVVtYkZ3bEpER1ZTMm9jeWcw?=
 =?utf-8?B?RGVZakJ4bURmVGVJM05MMjgxT3FlTFlQNEY4SGtnM1F5ZEp0Z2Vjd0VQZi9r?=
 =?utf-8?B?cFlqMWt6bzRuQk5qdHZ2MGlVWkFBQmRVWjRFRUVrZ1d6blgxdlR4cDJhT3d5?=
 =?utf-8?B?Yi9VZVl5T1g2MUpHYm96N2c2M2tyS2djWDFoSENRTUpLZ3J3OE5qcElWQnlp?=
 =?utf-8?B?QjBKWnFwZ3E3bVAxOVM3WEhPVHhMQTNFV050aHdjalJMLzNQQnEvOXJ4c2lD?=
 =?utf-8?B?UlAxQTFaQ3krQTZiN25YS3duN3ZxclVUMjdINnQ3UGVUMzRFb0JHdGp4bjdE?=
 =?utf-8?B?Ym9wakZhQ1FkZlNBRGxhNmcwNHVDZ3Ywbno3bGIyZ3NUT1RBbXgxTmN0QWdj?=
 =?utf-8?B?OXRxMis4TWk4OUhPTHRTQmRld2FMb2FnYlZSN0J6L1Q5eUJ2Wm05RUdZdUhZ?=
 =?utf-8?B?ZXZadVVsdlJZUHVTeVhmNSsvdGY2eVJtbnVtQktsOWIxUHJiU3M2K2tPTXJK?=
 =?utf-8?B?a1YrVVcvS3RHZ21oSmgxYVZoZjBWRC9jY0ZlOXd5bFlyK0x1VVFHcElxejFv?=
 =?utf-8?B?M095d25yeW80R2x6V0JGb3c2WUhaa1JMaS8zbmg4ajM0dGZzdlZ6cDJuSjNJ?=
 =?utf-8?B?NVVoOFpKR0xlSnlaTmFJRURXNHdRdzRLRnduREk0eFVOcjNhaGVCcEQwZ0tp?=
 =?utf-8?B?WDhCaUFpZzlvQ0ZmQ2QyeGFmNm9uT2VhaC92SmJ3OFV6Vi93Mmx0d2FZeDU3?=
 =?utf-8?B?RzBTZHZSdVhtU3BnMHJKV2JpaVRpbGYwbVJ0REg5YVZ0MEg3cG5XVjJkY01h?=
 =?utf-8?B?c3hSMzVvR0Job2xVWlV3SElGVG84QytVUC8vbnF1UTFhVXExRCsrcVpTTTBv?=
 =?utf-8?B?SENKL2d5UnBLc3hjdWpsVjF5V2F0YjI5T2xsdzNIcGcxYlFqK09nN1pjdzhm?=
 =?utf-8?B?U1M2R1N3L3g4ZjRvajlwbXJxYmhKVW5ZRTVtRjRWb0Q1WnVJTmJWWXQvRjdV?=
 =?utf-8?B?TlVnWVRTWGdlTkUwS0F1ejQ5VWl6bkc5b0paREhLR3NFeWxJNTVSak8wSHUr?=
 =?utf-8?B?ZDVoMElwZzlSZmI3K05kNkQ4MFlKc3hxcDlNS0hyUFhCQjlMUzUwd1UrRHRL?=
 =?utf-8?B?NzEzcks2eU9jaFpGVkVTamt0Q1NwYzIrb1I4U1F1UU5HaVM3alNHTGhnaVYw?=
 =?utf-8?B?S0ZsUmpWTW9ZUUtHZVg2THVoTDRzVnQwS0NRSHlPZXBRYW5obmYrLzZPcGNm?=
 =?utf-8?B?MW40QXJLc1B3Z3dDRlN1aHNkZnFKNHg0VU5wYU9FT2xGbk9GSUlXM2RKclYv?=
 =?utf-8?B?MVA3cG03Q2xJeDEyZEtIOEwrYUlqbW5FS2w5ZkRuNkd3Zm9BTjNuWlFzZDVM?=
 =?utf-8?B?RkMyNjdIOGlTMWc5NTl2djNPRlZxY1hDZFJhRXgvV0REdDZITTg0TkE5ZC9D?=
 =?utf-8?B?WWdldmhzRVl1V3hmMVBGTjF4Y2thS2lrTGh6RjA2d29wNklCcUNaNE9lUjFk?=
 =?utf-8?B?R0tzQkR4bitDYUZwQVgzamNQTlVUUlBJYi96N1N0bTZEV2t5VXRRSjR4SHZ2?=
 =?utf-8?B?eTlUNmFyUWt0WnZDZU5kYWVRYlBLb0FTZVNlOEF2WWtNRTdUNWRVZllsbWp2?=
 =?utf-8?B?YUo0SVZuQTRkNWdLZUd4cy9rSHFMYUIwTFBkRGZENTZOdjU4UHl5L0I5N0hM?=
 =?utf-8?B?SWtGaGVLUXlMR0grcmd1a0dYOHZORHM3d3Ivbm4xSGpqM1F5ejE4S2tjSEhZ?=
 =?utf-8?Q?RIki05ZQBRLqC4OWQsYahsTOprT9c9ID?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFSQlFOSzNOSHBwYXBRZm5xNWRYa0M0KzdRR0JoTzRaVXFPR2VFNmNHV2hG?=
 =?utf-8?B?M0t5WW03V1FvVnJKTXVWVDIweWt6cDJ6RmlrdnoxMGVpYjUxRXN4VjQxUU15?=
 =?utf-8?B?cTRFWWp5Ukd0azJmZ0cxTjdlS2JWR1YwVnV3VCtjSU9Qa1dwTEpHSW5EVDE3?=
 =?utf-8?B?Ry9GVUJ5eE5mWXpORnpHSUZLMHBRVmxDNTY4V2xjYjlZaXJqWEtEaDJLVGU3?=
 =?utf-8?B?NFNIbXk1MUh6dThIRkw4WmlXWjJLaVdaWDIxNlhMQ2wzVll0ZFg1VDVVOW5s?=
 =?utf-8?B?ZmNwbXorRzVoUzVZQWVJSWJ1RnpwNHozOXJ5ZDdhMDN2TzFyNjF0WFVrTnl1?=
 =?utf-8?B?N3k0UUdTMzQyT2lpMWJDRjB4S3JmMTVheWtDajA2M0RYeFhIYW5VR240dC9a?=
 =?utf-8?B?UVhjMlc2a2xaUHIvUjQyVGxOS01GaXJHdytlMEVyYkRtWXJCckF4SXlUMSs4?=
 =?utf-8?B?M0hEWStPWnI1Mlc2QmVlTTBhTC95VE4zZk5STE1pTE1aOWlKT1RXM1BvMTdP?=
 =?utf-8?B?RFFMSFlvT0tURmtaYzdEaVBRWmVTK2ZyNS9EU0dzQy9oUHZFVkN4QlIvaDVR?=
 =?utf-8?B?ZndBQm1vMnBjM1BEN0orZXNhcUdEQThxYzRQSTVhTUI2VkJHaCt0L1F2L2ZL?=
 =?utf-8?B?L1NNQVhSTlhRVUVXQTJOZUlrUy9KeEpKRnhIZ29wVzFvM0hXNDFiOW5mcEJ1?=
 =?utf-8?B?N056YWQxQUxHNm41MzIwSERsNjI3NG9OVGdMaWRJcjU1TElHY21acEFPclBB?=
 =?utf-8?B?NklLc2JrVzZVcTVLMWh1WVNxZ2JRMmJ5TXZvZ2h5bHliQ2pvZzR3RFdKRDBu?=
 =?utf-8?B?ZkZCb1N4TGt2MTEyWnBXTDNQaFZZc1VEaHoyb3paTGhQK1FkSHFsQzNHQ0Uz?=
 =?utf-8?B?WmN6eHZuMXdFU2dFeE9laU0zek1oZ0pMU3REaW42WkZJTWpQK1A2cDIvdDk4?=
 =?utf-8?B?T3pnZks4cThmc2pxZUY4UllZK2JBT3h4a1VMT3p5MVVrUGdHOEx3bDhyUnFm?=
 =?utf-8?B?U1pKQVgvUTdwd3d0Rm1LYkJ1RXJCejNOVlVvVmtlUDg2ZTVTU3ZBaVRJaGxh?=
 =?utf-8?B?RmFiU1RIOTVlR2diNi91UUFMUFhYWEJJcytlazdjbkJxRWJyRUVUMGtzUFg2?=
 =?utf-8?B?WG9kMS9aNkJybVRDNGJTUnFCd21TcjBFNXFFaUZHd0Y5cE5GUTNHVGtZbDRh?=
 =?utf-8?B?Z2h3d0dYUWg2MG5aZlBJTWpYSnJ6RGpoNXVjdTJ0NzlBQWRmaERvWVJYN25R?=
 =?utf-8?B?SnRnS0VXRjNkVndpQVFRNFg1YnFpak5aNTVZSHF2bDAwRTdlNWFxd3ZpYTNL?=
 =?utf-8?B?OUpPRVNtS1JyRWorL2RYWTlrYktzMmxlZWtzTTF4WW5TY1BpU3d6U2pvRFpT?=
 =?utf-8?B?bVNVM2lxaDl4U0s0OXlHODVQWS9GdjkrSW1LcW05bDROeHlqOE5tQ3EraERJ?=
 =?utf-8?B?bHp3VkFySnBHTkpYS1dYRHZvWFcxVlRibkZqZHEyMlo3dGNtazJGM2RxTkN6?=
 =?utf-8?B?MFFybFRoV2NjUXlhelRqTUlObGszSjcvT3ordnZrcGVKVmN3RUc3TzgwMjl3?=
 =?utf-8?B?SmR5SlhRU1pPZDJ6QWxaeHhqdm1oL1NEcEc3c2ErS2pjckFKV285bURldERa?=
 =?utf-8?B?aDg3TEltTHlQdFc2MTROVW9DUDN4OXArQUNVNmtveU5hZjlkRkwwQVRmcEgy?=
 =?utf-8?B?cmU0TDhVOWoxRUJqTlBXQ1o5eW5uMVEyaWZUamNOb3hQOGx6K2RwT0xpTlpT?=
 =?utf-8?B?VVBBNjBZN3h6TGtYL25VMXNkK1VnZVVzS2NZU2grZ1A0TytxT3F3MVhaWkpv?=
 =?utf-8?B?eHl0MElDN2UyNnZOaDh5cXUyMUp5eE1TQVN3TGhjOHJJbUpBNk1xWVpselFG?=
 =?utf-8?B?Tkp2cnd5U2dJSEU2ZkpIbzF3Y29pK3RVanRXVUcxRVRDeEI3WlBLb1N5bFpz?=
 =?utf-8?B?ZkRvN1FkYWNtMksvUUlveTRCMXdiRXgyalJRSDZnTmlWSU5JbGhFN1RiRWZx?=
 =?utf-8?B?TC9hRU9XWFVSTnZ5MnJ2YThBRG1EYjlyb0dtYm1EU0twUW5xMTlZODBjWHdk?=
 =?utf-8?B?ZVBQRmh5MVpweE44ZHNMV1dGZ09aa1ZPNHg4SE9iOENIbEYzSHlxd1RXbStm?=
 =?utf-8?B?K1phdm5PS2pQc2w3dFdMT1U1OU1XTlVUcVZHRHBMdzArM1hRS2RVYWhYZXk0?=
 =?utf-8?Q?efW3/6z1peeZJ05KBnsNhLkPgCVix25OmEHkOeTGaYh2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc042970-8d41-4fd6-bef1-08de071e3985
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 10:25:53.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L959gJC8jrvJvfIb4iQtdd7P0YXxd978MySa+fAzHqrX3t6Dj+mRSWeQoKjvNjEI4YvCngzAp2V3GSUCLThCkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_112607_676373_C811A3B6 
X-CRM114-Status: GOOD (  19.36  )
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

T24gMTAvOS8yNSAxNzoxMiwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMDkuMTAuMjUg
MDY6MjEsIEJhbGJpciBTaW5naCB3cm90ZToKPj4gT24gOC8yMi8yNSAwNjowNiwgRGF2aWQgSGls
ZGVuYnJhbmQgd3JvdGU6Cj4+PiBMZXQncyByZWplY3QgdGhlbSBlYXJseSwgd2hpY2ggaW4gdHVy
biBtYWtlcyBmb2xpb19hbGxvY19naWdhbnRpYygpIHJlamVjdAo+Pj4gdGhlbSBwcm9wZXJseS4K
Pj4+Cj4+PiBUbyBhdm9pZCBjb252ZXJ0aW5nIGZyb20gb3JkZXIgdG8gbnJfcGFnZXMsIGxldCdz
IGp1c3QgYWRkIE1BWF9GT0xJT19PUkRFUgo+Pj4gYW5kIGNhbGN1bGF0ZSBNQVhfRk9MSU9fTlJf
UEFHRVMgYmFzZWQgb24gdGhhdC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5i
cmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gwqAgaW5jbHVkZS9saW51eC9tbS5o
IHwgNiArKysrLS0KPj4+IMKgIG1tL3BhZ2VfYWxsb2MuY8KgwqDCoCB8IDUgKysrKy0KPj4+IMKg
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4+
IGluZGV4IDAwYzhhNTQxMjdkMzcuLjc3NzM3Y2JmMjIxNmEgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L21tLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+Pj4gQEAgLTIwNTUs
MTEgKzIwNTUsMTMgQEAgc3RhdGljIGlubGluZSBsb25nIGZvbGlvX25yX3BhZ2VzKGNvbnN0IHN0
cnVjdCBmb2xpbyAqZm9saW8pCj4+PiDCoCDCoCAvKiBPbmx5IGh1Z2V0bGJmcyBjYW4gYWxsb2Nh
dGUgZm9saW9zIGxhcmdlciB0aGFuIE1BWF9PUkRFUiAqLwo+Pj4gwqAgI2lmZGVmIENPTkZJR19B
UkNIX0hBU19HSUdBTlRJQ19QQUdFCj4+PiAtI2RlZmluZSBNQVhfRk9MSU9fTlJfUEFHRVPCoMKg
wqAgKDFVTCA8PCBQVURfT1JERVIpCj4+PiArI2RlZmluZSBNQVhfRk9MSU9fT1JERVLCoMKgwqDC
oMKgwqDCoCBQVURfT1JERVIKPj4KPj4gRG8gd2UgbmVlZCB0byBjaGVjayBmb3IgQ09OVElHX0FM
TE9DIGFzIHdlbGwgd2l0aCBDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRT8KPj4KPiAKPiBJ
IGRvbid0IHRoaW5rIHNvLCBjYW4geW91IGVsYWJvcmF0ZT8KPiAKClRoZSBvbmx5IHdheSB0byBh
bGxvY2F0ZSBhIGdpZ2FudGljIHBhZ2UgaXMgdG8gdXNlIENNQSwgSUlSQywgd2hpY2ggaXMgY292
ZXJlZCBieSBDT05USUdfQUxMT0MKCj4+PiDCoCAjZWxzZQo+Pj4gLSNkZWZpbmUgTUFYX0ZPTElP
X05SX1BBR0VTwqDCoMKgIE1BWF9PUkRFUl9OUl9QQUdFUwo+Pj4gKyNkZWZpbmUgTUFYX0ZPTElP
X09SREVSwqDCoMKgwqDCoMKgwqAgTUFYX1BBR0VfT1JERVIKPj4+IMKgICNlbmRpZgo+Pj4gwqAg
KyNkZWZpbmUgTUFYX0ZPTElPX05SX1BBR0VTwqDCoMKgICgxVUwgPDwgTUFYX0ZPTElPX09SREVS
KQo+Pj4gKwo+Pj4gwqAgLyoKPj4+IMKgwqAgKiBjb21wb3VuZF9ucigpIHJldHVybnMgdGhlIG51
bWJlciBvZiBwYWdlcyBpbiB0aGlzIHBvdGVudGlhbGx5IGNvbXBvdW5kCj4+PiDCoMKgICogcGFn
ZS7CoCBjb21wb3VuZF9ucigpIGNhbiBiZSBjYWxsZWQgb24gYSB0YWlsIHBhZ2UsIGFuZCBpcyBk
ZWZpbmVkIHRvCj4+PiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxv
Yy5jCj4+PiBpbmRleCBjYTllNmI5NjMzZjc5Li4xZTZhZTRjMzk1YjMwIDEwMDY0NAo+Pj4gLS0t
IGEvbW0vcGFnZV9hbGxvYy5jCj4+PiArKysgYi9tbS9wYWdlX2FsbG9jLmMKPj4+IEBAIC02ODMz
LDYgKzY4MzMsNyBAQCBzdGF0aWMgaW50IF9fYWxsb2NfY29udGlnX3ZlcmlmeV9nZnBfbWFzayhn
ZnBfdCBnZnBfbWFzaywgZ2ZwX3QgKmdmcF9jY19tYXNrKQo+Pj4gwqAgaW50IGFsbG9jX2NvbnRp
Z19yYW5nZV9ub3Byb2YodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhY3JfZmxhZ3NfdCBhbGxv
Y19mbGFncywgZ2ZwX3QgZ2ZwX21hc2spCj4+PiDCoCB7Cj4+PiArwqDCoMKgIGNvbnN0IHVuc2ln
bmVkIGludCBvcmRlciA9IGlsb2cyKGVuZCAtIHN0YXJ0KTsKPj4KPj4gRG8gd2UgbmVlZCBhIFZN
X1dBUk5fT04oZW5kIDwgc3RhcnQpPwo+IAo+IEkgZG9uJ3QgdGhpbmsgc28uCj4gCgplbmQgLSBz
dGFydCBiZWluZyA8IDAsIGNvbXBsZXRlbHkgYnJlYWtzIGlsb2cyLiBCdXQgd2Ugd291bGQgZXJy
b3Igb3V0IGJlY2F1c2UgaWxvZzIgPiBNQVhfRk9MSU9fT1JERVIsIHNvIHdlIHNob3VsZCBmaW5l
Cgo+Pgo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIG91dGVyX3N0YXJ0LCBvdXRlcl9lbmQ7
Cj4+PiDCoMKgwqDCoMKgIGludCByZXQgPSAwOwo+Pj4gwqAgQEAgLTY4NTAsNiArNjg1MSw5IEBA
IGludCBhbGxvY19jb250aWdfcmFuZ2Vfbm9wcm9mKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2ln
bmVkIGxvbmcgZW5kLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgUEJfSVNPTEFURV9NT0RFX0NNQV9BTExPQyA6Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQQl9JU09MQVRFX01PREVfT1RI
RVI7Cj4+PiDCoCArwqDCoMKgIGlmIChXQVJOX09OX09OQ0UoKGdmcF9tYXNrICYgX19HRlBfQ09N
UCkgJiYgb3JkZXIgPiBNQVhfRk9MSU9fT1JERVIpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOwo+Pj4gKwo+Pj4gwqDCoMKgwqDCoCBnZnBfbWFzayA9IGN1cnJlbnRfZ2ZwX2Nv
bnRleHQoZ2ZwX21hc2spOwo+Pj4gwqDCoMKgwqDCoCBpZiAoX19hbGxvY19jb250aWdfdmVyaWZ5
X2dmcF9tYXNrKGdmcF9tYXNrLCAoZ2ZwX3QgKikmY2MuZ2ZwX21hc2spKQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4gQEAgLTY5NDcsNyArNjk1MSw2IEBAIGludCBh
bGxvY19jb250aWdfcmFuZ2Vfbm9wcm9mKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxv
bmcgZW5kLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnJlZV9jb250aWdfcmFuZ2Uo
ZW5kLCBvdXRlcl9lbmQgLSBlbmQpOwo+Pj4gwqDCoMKgwqDCoCB9IGVsc2UgaWYgKHN0YXJ0ID09
IG91dGVyX3N0YXJ0ICYmIGVuZCA9PSBvdXRlcl9lbmQgJiYgaXNfcG93ZXJfb2ZfMihlbmQgLSBz
dGFydCkpIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqaGVhZCA9IHBmbl90
b19wYWdlKHN0YXJ0KTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpbnQgb3JkZXIgPSBpbG9nMihlbmQg
LSBzdGFydCk7Cj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgY2hlY2tfbmV3X3BhZ2VzKGhlYWQs
IG9yZGVyKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwcmVwX25ld19wYWdlKGhlYWQsIG9yZGVy
LCBnZnBfbWFzaywgMCk7Cj4+Cj4+IEFja2VkLWJ5OiBCYWxiaXIgU2luZ2ggPGJhbGJpcnNAbnZp
ZGlhLmNvbT4KPiAKPiBUaGFua3MgZm9yIHRoZSByZXZpZXcsIGJ1dCBub3RlIHRoYXQgdGhpcyBp
cyBhbHJlYWR5IHVwc3RyZWFtLgo+IAoKU29ycnksIHRoaXMgc2hvd2VkIHVwIGluIG15IHVwZGF0
ZWQgbW0gdGhyZWFkIGFuZCBJIGVuZGVkIHVwIHJldmlld2luZyBpdCwgcGxlYXNlIGlnbm9yZSBp
ZiBpdCdzIHVwc3RyZWFtCgpCYWxiaXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
