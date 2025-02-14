Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FC3C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 08:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1s9EKag9wOh29EoCYbsl+aTfGP6Z6WaNunfS7++o4M=; b=yvB1xLJ5XFKx31
	ylrFhco88Jf1UdoF9gZs0MXrkdIOs4987sYLf2yKR3RLjIrUCutFCEhwcILIcotiIFTiViUrUQP3L
	OhN1oe3qf04TqRp9u/cTmZNQwN3nmxQ/fPtJzVIP+2ZDEw5yFkjdh+LPwaee55xKuu2FYe4mYGlyy
	P59xRZFEuDu6eZiKgawjUt/S4wXJGT+fcqFqoaexQOlvKEGj7gP+ko3l2CjweltUICgaeb5RopAXH
	zGXK+e73M/7ctP+hkoAFrGZ8JQtUVrrP7otYvuGRN3F7c4eU/x+kOvLYZk7IrMC+uhmeUwu5yhsWs
	nmbKTtePYlLNGhab95/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqyJ-0000000E6Ra-0PsU;
	Fri, 14 Feb 2025 08:22:51 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiqwu-0000000E6C8-3LqS;
	Fri, 14 Feb 2025 08:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739521284; x=1771057284;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=F6f/H3aURKZKV6VWUin9dCzADbPoFt4/uxVlK3qKe7E=;
  b=Q6k/WyL3reC++USNxpw9wBmc5j+ZokWnh4RxnMqiVORrT8GVHCscyke+
   6xrAXjgMMD6lYS2fd1zttS+QwLqXbUOaQwBP8eXL4Tue3ABYcLw10Q7NC
   3x0A4YEtNg2cce4WOpAc601ili9Dns76QWpdh8RdD7gQTL43/NK+wrykF
   0JjpjLSE9sI+W7gGevxIoKFbHHxUVBkmTgsi3o9mweysFlkB9mzhbRCQ3
   AAkVFuj1tbZRFM5+4Qp6Q2RYtYcs4kdM8ZvhX46I3RLWCRmmnKL24ruyE
   fDASy7n8Qq7lM+6O6ISfgjLaKcHPi4rfZtmpmu9AtU5QU2KrRbb5P9K/Q
   Q==;
X-CSE-ConnectionGUID: tww8DPxoTzOrvpjT3T7V0Q==
X-CSE-MsgGUID: zTmR2J45TmmEUzboHhS05A==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50889086"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="50889086"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 00:21:23 -0800
X-CSE-ConnectionGUID: UI67639qQ8iPr53b0V8c+w==
X-CSE-MsgGUID: y17JDYZnRSukreTjauejqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118014627"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Feb 2025 00:21:23 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 00:21:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 00:21:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 00:21:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiT8a/VGQLCo8NbJDRqMQ084JLvB/xpuldTwUHd5wr/1/Zfzp8mrlNIkHqf1jGq1kaAUi+jmnrOq6wod3n8ppxf++UhVSotIVQLsj1YyD0927F4CpsPskH/7/N5JOGav9rtpT0ZPmAnn9j/SGUrbWI0dUL5VD0fvwpErM68NgW9Us1g3ID54MJstvUApPROpwA7qzb3rQ84rMpz+YwK6M0ASk9bc8cp9tZvzVqIIBJTZ9nfievK2A1aD1oOFjoOXJxVjmmR8IHQsbychBxIdEZ3Uup5AiYjHxtIlPlVzk/pS6J4A/9bJ6Hc6TZqTdU9w8A9+kcoy0C/TrjYCttAOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A92lyeoUSceLW7ws1Ei77N8ZURN8y3DQnHLfvZzPzis=;
 b=XkaZmNL88VAIOg3JTKbQWOCIF3/6EQV307Smx/Y+3rUCRU5ImLVfrhJRqRDFPkoZamQBCtfSUXNcyMMEMm3iw36B7GquFbTq7xNvmqNr7MSDO7E3nQoRjySAB5JsU5iFurjgUu06il+5+xBSR54OQzp9t/N9fuf0w2aPIipYJOdF4953JvGojqpgDwHK/lR0QYFebCw/VVPBau6Cjj3xNfz5Z9WHPedPtFCqEErTIrhYGSwKg8WwBfjPhVR+5W5bac1ODtjZpMupxl/vYYsz+Os7F090gRtDxQCZXtwJFcpqjigMXBbgZu6TaxFQXEJdr26l97cD9qZ8qM8Tw7sIzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH7PR11MB6675.namprd11.prod.outlook.com (2603:10b6:510:1ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Fri, 14 Feb
 2025 08:20:47 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 08:20:46 +0000
Date: Fri, 14 Feb 2025 09:20:19 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>, Andrey Ryabinin
	<ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	<kasan-dev@googlegroups.com>, <llvm@lists.linux.dev>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon
	<will@kernel.org>, Evgenii Stepanov <eugenis@google.com>, Andrew Morton
	<akpm@linux-foundation.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com>
 <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
 <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm>
Content-Disposition: inline
In-Reply-To: <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm>
X-ClientProxiedBy: DUZP191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::19) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|PH7PR11MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 211262af-5c3a-4f36-df49-08dd4cd07b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUtkTHFZSmJ4RmNaNi8zZ1l1QS9hT1BERGFiVlh4L3NXclVCTzJTZnpxaDZy?=
 =?utf-8?B?UW9SSnVVSUx0VU9RbnduUjhsU1RHem41b2hIRHMwbzJCRHJpbTdMVDVPODVU?=
 =?utf-8?B?dkM5bFA2RWxGRHoyTGd0MkVIWlpHOU9OSTZFMUZrZzU3ZzRZaWVvcXBObkVI?=
 =?utf-8?B?UmVKdWIvVG93RS9ZU1g1SGlyUnBpZWwwNVd4UHI4OXhqTFErME1XeCt4cW9N?=
 =?utf-8?B?VURxRVVKeHRrTDdoMU5sUUtUWUp0Um9xWDhRUS9pMEJZeEkyblZEUE1ITXZ2?=
 =?utf-8?B?N3EvNFBBTDZLOXBCZHlLQjVMM0JlSjFFaWY4dUtSeG5xREYvWmcyZE42WC94?=
 =?utf-8?B?QXZ0dTZnQTRHclRBenRHN0QrRlZuWEVYWjdjOUIvSjhpNFFHUGUyeEZ4dHV3?=
 =?utf-8?B?a3k2ZjhPTHE5c054TWpwbW4rcHhoYmxPMmRGTEJIekhudzlFK21lUHdtZm00?=
 =?utf-8?B?VGtUb1JyTHd0OUpJajdSWVhGY2toR003TlgvbTJxR09jRks5TFJUbDF2anVt?=
 =?utf-8?B?MXJ4SkdvNWw0VnVSN0RtSTdnanhGMXRyUFNHYkJaTEc1M2xnWVlYVnVRb0ZT?=
 =?utf-8?B?bzNlQWVqaTZ3V000MVlmMmg0NHMxZnE3Y3NDd0QxaHE5QkZrUk9lcmxET1Uw?=
 =?utf-8?B?SnFkQWFqSk9OOWVlakUrNVUwdVRDcFlwVHpwSXpySFdhZkE0ZkJNTFhtSkpk?=
 =?utf-8?B?Q3ZtMld5UWl2Wjduak02RHBHcGxVWGdlckx2WGlleDk4Vm81N24xOE9Wb2U3?=
 =?utf-8?B?a21YMzlQSU5OU29tbndBYmpXWkZCc1lkUmFpMStMTVBKMTFBZk1Md3c2SjI3?=
 =?utf-8?B?OEVUUjlwRWRHbFU2R1A2TCs4RHAxelgxTWNkNWJ0QzFVb3NmMWx1cyt5S2l0?=
 =?utf-8?B?a1FPdGNCMXpDRnFkNFMwZ2ozYlhhZFd2Nk5mVWdHWlRzeWFQTHZmNExMQmlR?=
 =?utf-8?B?bUF3UTRiYnhBK0FPMUQzTHlsdFovNS8zTlBRdk1WTVU2Z05TUmxjd3BiY016?=
 =?utf-8?B?V2IxQ2kyZU51cHpSZWVaVk9XTTRxL2drR25zL09vejNzdlpPcmhDRldGa0t5?=
 =?utf-8?B?bm01cS9yY21SbzZqMU82MXZVamNYTVJNbHFkekZpa0N3VEw4YkQ5RnRpakV5?=
 =?utf-8?B?L0FsSVpLUncvSGtzc0VRS1YwL2E2NC8ycm5kSW1VMTQvcStTQUx3R1VEa3lD?=
 =?utf-8?B?Yjdma0JBOGVNZE15eGorSU8weFdJT0RhM256ZXBNYlNRemxwVDRmWk9wWjNC?=
 =?utf-8?B?ZG03a0pHRU1oTTZWdWFmbVNrd0lFT1pGTUF4ODdnTnE4NVFra25HNTdWdTl6?=
 =?utf-8?B?YkhweXQvK201UzBqNHN5NHlNZWxDZDdLRHVrTkhzRDQxakczbXkrRmhsbFYw?=
 =?utf-8?B?M0J1NXdCNm8rMHJmQmxKYzBOeFBPTmlBUkRlQkthSXg4WFZSOUpXQlRKVkZ6?=
 =?utf-8?B?WjlUcVF5cHl4Ky9EWlVvWUlLRTN2YU94TGpKYnYzSUVmZHNGNFNUZ0o4YzVi?=
 =?utf-8?B?T0ltZzRmcjNIczhwZ3pMbFppbFlVWkloQ09NeXJBUmFEcGhGcnFtcDFnWkF0?=
 =?utf-8?B?OHQ0UHVXT0VHaXdSdVhiYjRPeGpzS280cWJ4elRINlhkWlptQ0FXcEZVMFA4?=
 =?utf-8?B?UXhXQVRNOTBZYm5vYVNzdmVaVnZwanVyMjgyZmJPeExDZVc3NlgwaTdqWlgr?=
 =?utf-8?B?ck9hZmhVdlZvRk1OT2tzc21EWjRXRUNHV3E5K3RDWTBpVEVsYzliVlpmQ0RN?=
 =?utf-8?B?dGdyZE8wbjc1ZE51bVZJMnJFT08xbUUvNlFiZS9sRy9oMm1XYVFFb1ZJMkpw?=
 =?utf-8?B?a3Jlb0ZjRW1DTTVGczBKM0FGMEljL2VlTWRMMFRtdE5rNVBHMXhRaHBpVHdL?=
 =?utf-8?Q?6wM9ivKo8lFdK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTNUOXZCLzY3dFUxbUw4eWxhMHFwNE9JWDFmdEVrcnVKamNzY0x5UXBYNjNN?=
 =?utf-8?B?VEZXVytVSk5JMHFZZC8vZHVNdE5ydGw2OXR4RzZkdTFQU0psdCtzb0IzTVRk?=
 =?utf-8?B?NFBqY01KK2xDdGttbi81OWplVUhLbW5DNHgvRmFOTG0xbGxmWGJLMlV0OE05?=
 =?utf-8?B?L0hteGlGYXlINXU1N24rMjdZNlVaNi91aGZ4ZmVFVk92SkU2YWRvUGlqSjFy?=
 =?utf-8?B?MGJiaEs4U1RvaGRpd09WNTVmTFpkSnkycGdIMktoeExGY2loQS93NTdrR3ds?=
 =?utf-8?B?cnE5Tzl1MXBEMlQvY01Ib0JsaHRUdnZ4UWZCYWZlMS80aEpHNnErTTdKMHg2?=
 =?utf-8?B?Umx0K3lIMWNGaWFlMElQNUR1eE4zeExKOWJJVXdHTU1wbEpTOUNUcDNjUDdE?=
 =?utf-8?B?bDZELzZQcGhSczVEK1Jwc1RNV2g1V2U3OTY3TkxRZDRmMXN3VGE2SU1jKzg5?=
 =?utf-8?B?YkFIRHNjbTZhYWt2NXFlY2hsSGJtY2cva3V1WEwwdjBNL1FjSGxPUVMyWDh3?=
 =?utf-8?B?SGkzVkVxQStUYkp4NEg0STFmNFN6bXBZMFQ4ME5tdFlsT0ZzVVlrU29CYkZx?=
 =?utf-8?B?VUFnNmZicklncEZqelVmb2R2VGp5YW9DRjhqbmhOcW5JMzc5b1ZTQXJVM2N2?=
 =?utf-8?B?ZFRxZVB2RGxtbWJQb3BmRmYrTmFsSmNZNUF4emQ0TXhJaWMzdUF0dUdhVXVV?=
 =?utf-8?B?NEtqeXVFQTZyUDZZdE9MaXEwZ01taGdTVmZleFVrYlhFWjhJOXpsbXpKSnYv?=
 =?utf-8?B?TWw2K3QyR1ZFbWFmZjM4RVlCTzVMbDZJajBvR3dzUFdhMzdGamFFdG5PbzV0?=
 =?utf-8?B?bDN0S3ppU0ZiNUNxN1BVbUxJYm5xVzVRWFZISFl6N01NRGkwdnNHa2lnSXBF?=
 =?utf-8?B?dHp5ZmtwZEpuSjEzTWljOXdkV2VvSi9nMGxpYmVvWVllWmF0Y3l1Rmp2MG9r?=
 =?utf-8?B?UkJCeERVaWNod2E1dDMrbk80MmFXVDJkWExTVGhxNU8zKzFHKzVWc0IrbHFu?=
 =?utf-8?B?OW91dVJDbElYVkpzWlFBZVMrcVczTUVIU25Xc2Z2Y0VnTGtBenFneXJCK1Nm?=
 =?utf-8?B?cHE0aGpabTJJVk9CVWlJY25YZTJDbm1SRU8yQi9kZ3FER3FlUnhLTGdGMUZS?=
 =?utf-8?B?d2l2ZzI5RCt4RXY2NFNzcFJIY3VRRHk5b0xLNkZ0eXZ5a3VIY1JpZ0xHdzI1?=
 =?utf-8?B?Z3RRRFBIK2J0YnFGbDZFdXpiUlJSa1NZYWhWdDFoVU5jVXB3QXhCWksrYzlB?=
 =?utf-8?B?Qm5oL1RzRlRSSUFpNkFKTGFqRm12RUkxaHhhR1RQdzIxT2FPT2NxYURnWEhH?=
 =?utf-8?B?eVJuTFNad0FlckhYald3SDdnMi9icThmMk5hbGlTa1FUM25kR0E1azFNS1Nr?=
 =?utf-8?B?Vy9oaTYyaE5PZDNwbmdaSzlmRFVQNlozOHZQbjMrWWxvazlKckYzTmxMeEIz?=
 =?utf-8?B?S2dvZ2MremRlZE15UEFyOXpJL3NtZWVseDVvSStuemY3SVpyNWhNV2drdVNR?=
 =?utf-8?B?ZnY5MXl0aXJxajVrL1dmaVoxaUtkcUxucmFrL1RSMXZpQ2YvWS8wYkF6VnJy?=
 =?utf-8?B?ek03c3lDSGxoUlgrdnFseDdNY1lSaFIwSTR1bWw2d0QzcndoY2EzazdjZTJB?=
 =?utf-8?B?RHVZVHdHMXNCWmxPMUliUE5GQmx1dVk3dk1vZ0wxbWw2ZE1XQ2hJY1krazVo?=
 =?utf-8?B?UXZhcTZRNjFVc1E5Wmt3ZHhrUC8vMFZoSFJtN1NGMEZaNDFYSE9ZNEVycWk3?=
 =?utf-8?B?bmMxdGxVZ0hpYmlhemNGQ1BZMEFaUTczN1ZNNEtvTkcvWnRkUWVQalFQNW9p?=
 =?utf-8?B?MkVFL3VaUXk4ajBhd3d4ZmtFRHVpeEZiV2NkTG1ta3d4Y1JodnViZnFxKzRQ?=
 =?utf-8?B?VE83ckNHdFdKenI0RVQxbHA0S1FBZWt2NldiaUpVWXRRazZmZVFWdEVGUzFp?=
 =?utf-8?B?ZC9rS0VlS0N6SDQvcHU2ZjQxWnVyREhhMXM4d0ZmbkhRU3pabm1Jbmt3Ymkv?=
 =?utf-8?B?ekRqN2J5SE9pT3FxbGhnR29qc3ZTQy9ZazJIUU5rZzdoN09JTEVqK1BUZkZR?=
 =?utf-8?B?dWtEbHk3RTFvMFdDcnE5cmZ6TDVzNk95VllYV3ZTYlFxS2QyTjhVZzlUV2lR?=
 =?utf-8?B?aSt4cTUrUFNJTUlvYUVqOG5pUkRWQVBlR3EzZ3pnbk9QMW5oaWJqWlcybi92?=
 =?utf-8?Q?v7nZzhZAiuFsj6oNogCNR8g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 211262af-5c3a-4f36-df49-08dd4cd07b9f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 08:20:46.9026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uFMNza4xilRO9sl7NlI0LeYjRq4A4DAjraaQwFjuRfoNcSlbAHQ1oPMXMYUve01Mta51GruqsUC1LZIoibZmsfB4pdcOrUBZzoLD685xRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6675
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_002124_907656_D678D46E 
X-CRM114-Status: GOOD (  24.26  )
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

T24gMjAyNS0wMi0xMyBhdCAxNzoyMDoyMiArMDEwMCwgTWFjaWVqIFdpZWN6b3ItUmV0bWFuIHdy
b3RlOgo+T24gMjAyNS0wMi0xMyBhdCAwMjoyODowOCArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3
cm90ZToKPj5PbiBUaHUsIEZlYiAxMywgMjAyNSBhdCAyOjIx4oCvQU0gQW5kcmV5IEtvbm92YWxv
diA8YW5kcmV5a252bEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4KPj4+IE9uIFR1ZSwgRmViIDExLCAy
MDI1IGF0IDc6MDfigK9QTSBNYWNpZWogV2llY3pvci1SZXRtYW4KPj4+IDxtYWNpZWoud2llY3pv
ci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPj4+ID4KPj4+ID4gSSBkaWQgc29tZSBleHBlcmlt
ZW50cyB3aXRoIG11bHRpcGxlIGFkZHJlc3NlcyBwYXNzZWQgdGhyb3VnaAo+Pj4gPiBrYXNhbl9t
ZW1fdG9fc2hhZG93KCkuIEFuZCBpdCBzZWVtcyBsaWtlIHdlIGNhbiBnZXQgYWxtb3N0IGFueSBh
ZGRyZXNzIG91dCB3aGVuCj4+PiA+IHdlIGNvbnNpZGVyIGFueSByYW5kb20gYm9ndXMgcG9pbnRl
cnMuCj4+PiA+Cj4+PiA+IEkgdXNlZCB0aGUgS0FTQU5fU0hBRE9XX09GRlNFVCBmcm9tIHlvdXIg
ZXhhbXBsZSBhYm92ZS4gVXNlcnNwYWNlIGFkZHJlc3NlcyBzZWVtCj4+PiA+IHRvIG1hcCB0byB0
aGUgcmFuZ2UgW0tBU0FOX1NIQURPV19PRkZTRVQgLSAweGZmZmY4ZmZmZmZmZmZmZmZdLiBUaGVu
IGdvaW5nCj4+PiA+IHRocm91Z2ggbm9uLWNhbm9uaWNhbCBhZGRyZXNzZXMgdW50aWwgMHgwMDA3
ZmZmZmZmZmZmZmZmIHdlIHJlYWNoIHRoZSBlbmQgb2YKPj4+ID4ga2VybmVsIExBIGFuZCB3ZSBs
b29wIGFyb3VuZC4gVGhlbiB0aGUgYWRkcmVzc2VzIHNlZW0gdG8gZ28gZnJvbSAwIHVudGlsIHdl
Cj4+PiA+IGFnYWluIHN0YXJ0IHJlYWNoaW5nIHRoZSBrZXJuZWwgc3BhY2UgYW5kIHRoZW4gaXQg
bWFwcyBpbnRvIHRoZSBwcm9wZXIgc2hhZG93Cj4+PiA+IG1lbW9yeS4KPj4+ID4KPj4+ID4gSXQg
Z2F2ZSBtZSB0aGUgc2FtZSByZXN1bHRzIHdoZW4gdXNpbmcgdGhlIHByZXZpb3VzIHZlcnNpb24g
b2YKPj4+ID4ga2FzYW5fbWVtX3RvX3NoYWRvdygpIHNvIEknbSB3b25kZXJpbmcgd2hldGhlciBJ
J20gZG9pbmcgdGhpcyBleHBlcmltZW50Cj4+PiA+IGluY29ycmVjdGx5IG9yIGlmIHRoZXJlIGFy
ZW4ndCBhbnkgYWRkcmVzc2VzIHdlIGNhbiBydWxlIG91dCBoZXJlPwo+Pj4KPj4+IEJ5IHRoZSBk
ZWZpbml0aW9uIG9mIHRoZSBzaGFkb3cgbWFwcGluZywgaWYgd2UgYXBwbHkgdGhhdCBtYXBwaW5n
IHRvCj4+PiB0aGUgd2hvbGUgNjQtYml0IGFkZHJlc3Mgc3BhY2UsIHRoZSByZXN1bHQgd2lsbCBv
bmx5IGNvbnRhaW4gMS84dGgKPj4+ICgxLzE2dGggZm9yIFNXL0hXX1RBR1MpIG9mIHRoYXQgc3Bh
Y2UuCj4+Pgo+Pj4gRm9yIGV4YW1wbGUsIHdpdGggdGhlIGN1cnJlbnQgdXBzdHJlYW0gdmFsdWUg
b2YgS0FTQU5fU0hBRE9XX09GRlNFVCBvbgo+Pj4geDg2IGFuZCBhcm02NCwgdGhlIHZhbHVlIG9m
IHRoZSB0b3AgMyBiaXRzICg0IGZvciBTVy9IV19UQUdTKSBvZiBhbnkKPj4+IHNoYWRvdyBhZGRy
ZXNzIGFyZSBhbHdheXMgdGhlIHNhbWU6IEtBU0FOX1NIQURPV19PRkZTRVQncyB2YWx1ZSBpcwo+
Pj4gc3VjaCB0aGF0IHRoZSBzaGFkb3cgYWRkcmVzcyBjYWxjdWxhdGlvbiBuZXZlciBvdmVyZmxv
d3MuIEFkZHJlc3Nlcwo+Pj4gdGhhdCBoYXZlIGEgZGlmZmVyZW50IHZhbHVlIGZvciB0aG9zZSB0
b3AgMyBiaXRzIGFyZSB0aGUgb25jZSB3ZSBjYW4KPj4+IHJ1bGUgb3V0Lgo+Pgo+PkVoLCBzY3Jh
dGNoIHRoYXQsIHRoZSAzcmQgYml0IGZyb20gdGhlIHRvcCBjaGFuZ2VzLCBhcwo+PktBU0FOX1NI
QURPV19PRkZTRVQgaXMgbm90IGEgdGhhdC13ZWxsLWFsaWduZWQgdmFsdWUsIHRoZSBvdmVyYWxs
IHNpemUKPj5vZiB0aGUgbWFwcGluZyBob2xkcy4KPj4KPj4+IFRoZSBLQVNBTl9TSEFET1dfT0ZG
U0VUIHZhbHVlIGZyb20gbXkgZXhhbXBsZSBkb2VzIHJlbHkgb24gdGhlCj4+PiBvdmVyZmxvdyAo
YXJndWFibHksIHRoaXMgbWFrZXMgdGhpbmdzIG1vcmUgY29uZnVzaW5nIFsxXSkuIEJ1dCBzdGls
bCwKPj4+IHRoZSBwb3NzaWJsZSB2YWx1ZXMgb2Ygc2hhZG93IGFkZHJlc3NlcyBzaG91bGQgb25s
eSBjb3ZlciAxLzE2dGggb2YKPj4+IHRoZSBhZGRyZXNzIHNwYWNlLgo+Pj4KPj4+IFNvIHdoZXRo
ZXIgdGhlIGFkZHJlc3MgYmVsb25ncyB0byB0aGF0IDEvOHRoICgxLzE2dGgpIG9mIHRoZSBhZGRy
ZXNzCj4+PiBzcGFjZSBpcyB3aGF0IHdlIHdhbnQgdG8gY2hlY2sgaW4ga2FzYW5fbm9uX2Nhbm9u
aWNhbF9ob29rKCkuCj4+Pgo+Cj5SaWdodCwgSSBzb21laG93IGZvcmdvdCB0aGF0IG9idmlvdXNs
eSB0aGUgd2hvbGUgTEEgaGFzIHRvIG1hcCB0byAxLzE2dGggb2YgdGhlCj5hZGRyZXNzIHNwYWNl
IGFuZCBpdCBzaG9sZCBzdGF5IGNvbnRpZ3VvdXMuCj4KPkFmdGVyIHJldGhpbmtpbmcgaG93IHRo
ZSBtYXBwaW5nIHdvcmtlZCBiZWZvcmUgYW5kIHdpbGwgd29yayBhZnRlciBtYWtpbmcgc3R1ZmYK
PnNpZ25lZCBJIHRob3VnaHQgdGhpcyBwYXRjaCBjb3VsZCBtYWtlIHVzZSBvZiB0aGUgb3ZlcmZs
b3c/Cj4KPkZyb20gd2hhdCBJIG5vdGljZWQsIGFsbCB0aGUgS2NvbmZpZyB2YWx1ZXMgZm9yIEtB
U0FOX1NIQURPV19PRkZTRVQgc2hvdWxkIG1ha2UKPml0IHNvIHRoZXJlIHdpbGwgYmUgb3ZlcmZs
b3cgd2hlbiBpbnB1dGluZyBtb3JlIGFuZCBtb3JlIHBvc2l0aXZlIGFkZHJlc3Nlcy4KPgo+U28g
bWF5YmUgd2Ugc2hvdWxkIGZpcnN0IGZpbmQgd2hhdCB0aGUgbW9zdCBuZWdhdGl2ZSBhbmQgbW9z
dCBwb3NpdGl2ZSAoc2lnbmVkKQo+YWRkcmVzc2VzIG1hcCB0byBpbiBzaGFkb3cgbWVtb3J5IGFk
ZHJlc3Mgc3BhY2UuIEFuZCB0aGVuIHdoZW4gbG9va2luZyBmb3IKPmludmFsaWQgdmFsdWVzIHRo
YXQgYXJlbid0IHRoZSBwcm9kdWN0IG9mIGthc2FuX21lbV90b19zaGFkb3coKSB3ZSBzaG91bGQg
Y2hlY2sKPgo+CWlmIChhZGRyID4ga2FzYW5fbWVtX3RvX3NoYWRvdyhiaWdnZXN0X3Bvc2l0aXZl
X2FkZHJlc3MpICYmCj4JICAgIGFkZHIgPCBrYXNhbl9tZW1fdG9fc2hhZG93KHNtYWxsZXN0X25l
Z2F0aXZlX2FkZHJlc3MpKQo+CQlyZXR1cm47Cj4KPklzIHRoaXMgY29ycmVjdD8KCkkgc3VwcG9z
ZSB0aGUgb3JpZ2luYWwgY29kZSBpbiB0aGUgcGF0Y2ggZG9lcyB0aGUgc2FtZSB0aGluZyB3aGVu
IHlvdSBjaGFuZ2UgdGhlCnx8IGludG8gJiY6CgoJaWYgKGFkZHIgPCBLQVNBTl9TSEFET1dfT0ZG
U0VUIC0gbWF4X3NoYWRvd19zaXplIC8gMiAmJgoJICAgIGFkZHIgPj0gS0FTQU5fU0hBRE9XX09G
RlNFVCArIG1heF9zaGFkb3dfc2l6ZSAvIDIpCgkJcmV0dXJuOwoKa2FzYW5fbWVtX3RvX3NoYWRv
dygweDdGRkZGRkZGRkZGRkZGRkYpIC0+IDB4MDdmZjdmZmZmZmZmZmZmZgprYXNhbl9tZW1fdG9f
c2hhZG93KDB4ODAwMDAwMDAwMDAwMDAwMCkgLT4gMHhmN2ZmODAwMDAwMDAwMDAwCgpBbHNvIGFm
dGVyIHRoaW5raW5nIGFib3V0IHRoaXMgb3ZlcmZsb3cgYW5kIHdoYXQgbWFwcyB3aGVyZSBJIHJl
Y2hlY2tlZCB0aGUKa2FzYW5fc2hhZG93X3RvX21lbSgpIGFuZCBhZGRyX2hhc19tZXRhZGF0YSgp
IGFuZCB0aGV5IHNlZW0gdG8gcmV0dXJuIHRoZSB2YWx1ZXMKSSdkIGV4cGVjdCB3aXRob3V0IG1h
a2luZyBhbnkgY2hhbmdlcyB0aGVyZS4gSnVzdCBtZW50aW9uaW5nIHRoaXMgYmVjYXVzZSBJCnJl
Y2FsbCB5b3UgYXNrZWQgYWJvdXQgaXQgYXQgdGhlIHN0YXJ0IG9mIHRoaXMgdGhyZWFkLgoKLS0g
CktpbmQgcmVnYXJkcwpNYWNpZWogV2llY3rDs3ItUmV0bWFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
