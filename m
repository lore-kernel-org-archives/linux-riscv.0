Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAF4C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+tfukKFOQDJ+BePw7CLOMoAKbkNc7aalDlEK1hK64YA=; b=i9ZoQi4ThzV+gKEIBwpmQ2H/tp
	hevwwmYhaLOV9g5yP3GsdsLNOmOREjx9zlwFpa4mwAmCnA+jGQGMmF1qR2jF/CfyevE0yeNSYxHqE
	wIvlPUWf0JgLd7kDEHUJKFE6CKbwiTlBorCNmCCicHbJjppkyHR8iCYH7McwdIBD99JNj6SYbh+/1
	NgrzsDNcXxNiXn6ZTI2k8RiEPnNVGTQIfg5mhVSHoFVJdOm3mV9SsmvkTyXBIJIR82mLvMso+5HHF
	p8htj2TURDp7bfkLwV8uLQDkjsWTqnk2H3ou/O6tLYXX/5fu5D+haDOWIDXrK14u0Tx8FSQPLoznL
	r42qIuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5C9n-000000035Ak-10GD;
	Thu, 09 May 2024 22:22:31 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5C9j-0000000358b-084T
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 22:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715293347; x=1746829347;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ukTgLHWvF3vO3V2Sb39JVrobnqm0YH2VNu5Hvdm4ZcM=;
  b=SF7SHJqXhej76a35Fm76yXouoG279+LUGISP+VkSEr65QiLxXB4m4w35
   mHKCf44d5kuT1vMkG8HbnAT2GZSsHBpub80jGBYOmWAmXtbYFfRw2xsAs
   ZItlzkqvnVwiJt+adwmbCetlgoFLGqdi5SYGXSjjpigiMzNSrmmA2H499
   Onmba6fyUsW5LCnPoFzp1qu915/iHhITp8ChTaTq/CN9Kiq1u2WWM7ktZ
   X149LsWnF5xgyZzK3HaIiMhPCMFV91NQo57LpEAMNDukTsGkujt5GaYpv
   CisbtPmfbDXMFaTdDOlIMH/OWHmBLtu5LVExMUgFP2R2iPTCdCncFEEQE
   w==;
X-CSE-ConnectionGUID: uWVnAnCpTh+pJeMTGkeoBA==
X-CSE-MsgGUID: p+eBGBeLRqmHVYsp2fdxQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="21846306"
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="21846306"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 15:22:17 -0700
X-CSE-ConnectionGUID: 9bvPfIGIRn6XqQYWgT/FOQ==
X-CSE-MsgGUID: lpeLS0YaQrOIXkErS1h7Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,149,1712646000"; 
   d="scan'208";a="60248129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 May 2024 15:22:16 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 15:22:15 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 15:22:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 15:22:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 15:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CByA2Tb+EeEkpYkEI5qTOvUG0Hjk8DF6Ex6v2apLivBTH3J7giUVdpT0IuI0/UxCe5J1g5EDyBGf/yelnd8MV8U0ChD924JlLZX+JW4HQgFdKg6IdOPgUN52NoBCcLVQa9YuGjefVDUFKmXtxeDRAq8co0uBv0PWyf/yk0U6BVGEoyfbNfa0Wham7FPnoS4h2lKV2LNjdeWzgjwN5FNJZ6GidAUxhcVo8bSeYg4OZ4rnTpV04iDBkIEG6zlXd/Nu8UuW3Tc/Uzv164wryQisSrSW4COjg6T/r5KikPW+X0msiVkXXExbQhDCyX+Ctu1rmgwVnyMD9TUGLnutJ2k9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBs+mZqv+AYA0jCQFXZ0kTYdCicTYCLz6N27/FhJMoQ=;
 b=Ez3Qvr+pDaE3Q8qZu/9SkQEfvXSChlrE5BAbmXZj9Za7ylVcq9BJ/RBdx0kb+DtDuOiViwUdVIskHuMjfOmSBBsR1bnrUvHlTvhcG4GngiXQ7Yki/JdI5ZS4lZjzZ7kfz5xeP7XNHhOTmLK8YtlKpC6777Xr/LFRmcWO2C7Op8pAHoyolQkn29SHBD/rRf8wf3OArD025Dz7xACuxwF3JTb419tLl7S6aXWBERVKFttKHlbcY0BvKwEQxo5pe/0mvd/W8Si/GvA98Rbc/ZWo+DXiXjbXApcM0k7NwVd0u4wzzhk/s8a0u7k4UY6ktqYhw0xBoNZzCBItkKbcqeri+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 22:22:09 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::b394:287f:b57e:2519]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::b394:287f:b57e:2519%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 22:22:09 +0000
Message-ID: <b451be8b-6197-4cf8-bed0-dfb63973ec05@intel.com>
Date: Thu, 9 May 2024 15:22:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 50/68] selftests/resctrl: Drop duplicate -D_GNU_SOURCE
To: Edward Liaw <edliaw@google.com>, <shuah@kernel.org>,
	=?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, Christian Brauner
	<brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Fenghua
 Yu <fenghua.yu@intel.com>
CC: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<kernel-team@android.com>, <linux-security-module@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<bpf@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Muhammad Usama
 Anjum" <usama.anjum@collabora.com>
References: <20240509200022.253089-1-edliaw@google.com>
 <20240509200022.253089-51-edliaw@google.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20240509200022.253089-51-edliaw@google.com>
X-ClientProxiedBy: MW2PR16CA0065.namprd16.prod.outlook.com
 (2603:10b6:907:1::42) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH0PR11MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a241a27-d1b3-41da-4e1f-08dc70767756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|376005|366007|1800799015|921011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2l5dy9JcUF6Wll0S1d2QUYwRkY0bUZZODlsS3FwSDRMSk5TbDhIU3k2b3RM?=
 =?utf-8?B?VnRoZUM4YkVtOGJ2N1VCb2l2Y09ZcGY3czczSktoOVJWZmxpaG5LR2p3K1hp?=
 =?utf-8?B?Sit5TlMyakYxcWE0d040ZXo5eTZyNXRNV2Q1MEZMaWc0TDNIVEYyL2dDUjJS?=
 =?utf-8?B?UHlVUUZudDZsUGJXSkhRS3F4UTNHZXNWZmx5YkVORXc3MUJ0M1YxN1lINDU3?=
 =?utf-8?B?VlhVdklzekVBcmZyNVBmN3NWNHd1NndndEFSSW1jZ1M0T0Q3citiWVR3UFJK?=
 =?utf-8?B?K2FGSDlzelFGZW43WkcwT1ZMQ0tadVUycVYvMk13OXZFazE4cHgrRHNwN1Fi?=
 =?utf-8?B?bitwOFlQVU84WHNqNks1bGcvWEV0ejErdEtlQk1qTTlxbW55c3B4eXo5aXpJ?=
 =?utf-8?B?Vk9tU0hvcXNJZDFOY0NmOWtWMEJNS1FDb2pjZ1hLanA0WkY2QUE2bE9BOVBs?=
 =?utf-8?B?amlaVFZiUUIzWFc0dHY4aGdkcHdSZTNhS1lSZzVnVHc2dW5vTFJtamNPN3hM?=
 =?utf-8?B?ZXlqTkg2a3Jka1NhNE9lN0hZK0VHVFdZaG1pbWhKSXZVaEJUSzBzQ1M5Yjcx?=
 =?utf-8?B?S2M2QncyUjNDVjhWWUdvQytqbTR3OG95cjJZclByK1g4WFYvQXQxdHppWWJK?=
 =?utf-8?B?MVpzM0tWK3NXWXB3Q1RjenRkVlBhQlVEMktlYWFiVkVpaU9rdi9EbE51Tjh5?=
 =?utf-8?B?RnVkcDFqQXVzQkhOOGlweFRXeGRGaWJPU1htWVIzb0wvVDlrOHB0RGEwWUU5?=
 =?utf-8?B?MmkwWVUyZERIeUQ1eGZ2WjMxMk9DL3pBSTZ1Vmhvb2xidFdjTzBRZGo5Mk9X?=
 =?utf-8?B?SVl3SDZlUWEweVhKK2l2UFZ3NmJ5b09FRzk5ZW9USEdPajlFUm1POVpla0gv?=
 =?utf-8?B?V3NaWHQ4cGxHZkFtakpwYjU1OGpCRTBXN3cwRUhrcTdsN0xWRzFLWnZkSUR1?=
 =?utf-8?B?OEpNdDFYdFlDNmFWOVhTb1B6NWdCRHRDeThwWVBZY3piNHlySkk1L2xhRHVG?=
 =?utf-8?B?c2VZUHIyZXoyZXA0RFIxdm1LSVVPMG5oSnpCbk1jZnp0dEZhbm0ycHRkcGFs?=
 =?utf-8?B?TVBMK2l0eFMvdlc1QStzT2xpZUo5R2xJL2Ryb2pSN2YzNW15RUZNRlY1YWRx?=
 =?utf-8?B?NUVtNUlZV052VUNSamFWbVRyTDk5c1hnM2FsekpHbVVuMlRsb1IzUGVkYjFQ?=
 =?utf-8?B?VHJGZzlHdmNEYzdjaDgyNjhjK0YvWTNUR0NiT0RZcDJ1L0svTTg0OElDeFha?=
 =?utf-8?B?UklKakZsZEhQNnhtblFuRGdOVVdNRXR3UGZXVjNqRDROSmFvU2hkNitibTBK?=
 =?utf-8?B?bHZUaXpkSzJncm9JZzlWQXoxYUp2Z2VBcGczcHlHK3VRN2ZmNUhvNVpoTno5?=
 =?utf-8?B?R3JLMGxRNFBmN01PMjhyU08wQXJWdlFwVDc2bVJ1WVg4UDlQRis2ME0ycnRq?=
 =?utf-8?B?U2ZNeHlScmxscDFvSkV2bWppaXpNQ3d5RTh6c1EyTEtuTW16MjRzaGpReTV6?=
 =?utf-8?B?VW1BN21VMzBmMXdGazloaldEeiszL051bXdXTDZuQ3FkQjkwVThRRzF5ODN6?=
 =?utf-8?B?YWdna1hnZVpWY1JzZWRncm45TmIzVHNDZzFKaGozNlJHRTdZZ004VHpkbUFR?=
 =?utf-8?B?ZmJoOW1kSmE2aFVaemZHSzF1clVqaVY1WU8yZmtINUd6UVZvdnY2cFFsTWNP?=
 =?utf-8?B?NnZ4N0NWMnMva08yRmtLMzJldyt2eGRVWndmajFUbnlDby9JSFd2MU5yb2gr?=
 =?utf-8?Q?4m9if9UuEfuSVE+sJuQz7wKC4DWXEXVAf6N9kjS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(366007)(1800799015)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aURhem5wTTA0c1JHeXRJRzVQd1I5UHFBM25xZW1WRzVXKzNia0g1V1paUkRp?=
 =?utf-8?B?M0Q1OTZEMlVFSE5kaFZ0QU84WHJnZERrVjVmSFJzNTJ6L3lvaDBrL3hzVHBx?=
 =?utf-8?B?dldGamJEYmhid1FPNXFUWSt6bU05bEI1SHlLVkpjK1hMZjBYdDQwMjNxRWpC?=
 =?utf-8?B?K3RmL3Y4U0EwTHhMUEJjODhrWXJiSVBQVFRCaU1nSGNYVEVTeGJobm1Vam92?=
 =?utf-8?B?OVc1NmJYNFNYYllSOFo5eEVPUTRtYzI0clp5SjRYMlRsdXFFMzBRZzdGbEZ4?=
 =?utf-8?B?a0srRHhVVUZIWTB4K2lTeDlmVFphQXVrNDhod09mTm9hTStDUHNGRnQ1NFlm?=
 =?utf-8?B?ek5wMUIxK1BQZ2U3SkRlRVY5dWxvZGt3STE4a3lJVGtmMHpiMk9aRWt4ZnVw?=
 =?utf-8?B?Qm9LWmtjYUljVUZNR1J1SURNUlpJK0d4MXBkOGMySjdYekNRcHVKc0ZWVkF2?=
 =?utf-8?B?dUpFcnRmVDJXdVYrSmNnUjhCeGFoKzdLRjZiZGNVOHdWTE5QMUJrN0JmQjd6?=
 =?utf-8?B?aTVMeEkxS2NxZ0g3V1pIVm1sd0JqNFBkMnNBTmpjSkRXMWJSREtPQXg4NmhL?=
 =?utf-8?B?aHZacVlSNEo1Y2lMVEttSncvV1M4MFMrREV2blNvQVlzRWUwenhzNEdsZ2tF?=
 =?utf-8?B?bXR1VnBhQ2JzeGU1b292dEwvR1haY1FlUnowWnUxK1pWS1JZeHMvUEFPZXNW?=
 =?utf-8?B?bkFKd2o4REZSWHB6V1dKMzNpU2FqNkM4K05uUHI1ZkhwT0xJV3plVXBtem1D?=
 =?utf-8?B?a2dsY1NiRmNOUUdaRzFvYURDQXJIVjl1MnQrMHErRk1VdkZsbGcrREZSR0ht?=
 =?utf-8?B?SWtZUlNWLzJqTlBhbXVsbmhPV3dLK2gvclBLUE1HR25VL1NkaFMxRWZIVFha?=
 =?utf-8?B?NVlwNDBQeUFwb3VHQkFNdDlwUk1SV1JiMzNkZ0lKd01DMVNSSUp3dG8wcThI?=
 =?utf-8?B?NjMrdkRMRml0MXFnS0dVTlkzbHRZdGVRaFBISnpPNlNua1NGNTdSYWlJQU1J?=
 =?utf-8?B?N1BRbXplUFVSRnpWajEzOXZXZlcrTUtyaWdKdHFXNFVKRnNDUURQZCtwb3Z4?=
 =?utf-8?B?M1FEVVRtN01oQ3diaVlHWjlnSmg4am4rTStnVnEvWGtCNi9nVDlMSnJHRFdp?=
 =?utf-8?B?UGdPRmIzZlVGaXU3dm5CUWtGTDBwWk9YQkZsUkRmVlFiYzgrZE5ndGdUdHAx?=
 =?utf-8?B?cGszeWhQNHRxM0Q3MjRrckwxanBhNTE4RXBNZUdUQllmQ1NKRGZGcUZENmVh?=
 =?utf-8?B?VTQrMVlKYysxZERpcFR3Z01WaTBlbmllZFA5OFpEYzJiUUFjVEVWYmNoZTFU?=
 =?utf-8?B?cnNqQ2RBWUFBU0Q3a3o5S0QxSURDanpjaStsOTNEUDNvL1JGK2FVblNEMVdZ?=
 =?utf-8?B?NStwS3ZuZDJnNjRuTUtDSVkvVVduK2FHc21ZWCtFQmV3TlhybHQ1cGxtcmNt?=
 =?utf-8?B?QVJmdnNoSGkwQXFaZHZEVzl2Z1FzZGZvcC85Q3ZaK3pGN2doSUtGQ2hzUlZ2?=
 =?utf-8?B?OTBKcjcvZXE5VS9WRkJIc2N1THZya2tLK1VGSEZocngzLzFKVm1UUUxQZkZK?=
 =?utf-8?B?bUlucFc3OGFtQ2RySEZ2UVMwQXVoY3JCZTB3c1hkdkpKbDZmT2hMRytsUlgv?=
 =?utf-8?B?ekhuOStZd0pLMmtqMEQ1NHdJTTNqM00rOHVMVkxFcE1xUGUxM0wyWDNGYVpV?=
 =?utf-8?B?YWpkUjBrR1lKcEVrempVTGZqS0VtZ0VWYVZLekFqdjFpQ2pKalZKbEhRWEZB?=
 =?utf-8?B?N2dvTWNuUDlwNjlQZWtOcmdoL3RzWTFiZ3VReUtML1dZMUN6d1hlc0dnakFO?=
 =?utf-8?B?bnhqSlo4cUhEajVWbHA0RHFVSG42YUNHQThZaVhBMlliWXlBUWIzRFprdjJ4?=
 =?utf-8?B?Qm9QRUtUUXJoRGJncVZXMVRtYnRoeDZkbjdHOGZLSyt1SFdJTDM5MWJScVJK?=
 =?utf-8?B?WkQ5cUg3WE9vRkhwQ3piV084eHlIMVVSMElYR2owZTBON0kwS0JCSWtuZHZP?=
 =?utf-8?B?SklvNmhMTk02Qm1KMzNGK05MMlZwQW5DOG9YeUdsTEpwd1dOMnIzSU9DTERZ?=
 =?utf-8?B?UXBvRnBZWEllWnNETWhOa0hjRmxDalZ0a2MrRE9zL1ZFRlB2dmYxTU5hbi9q?=
 =?utf-8?B?Y3JteWUvWWFXeUg4ak5zNXlYVU4ydm10aVJOMTQ1OHZnY0dHL1lmRkJZRDZ1?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a241a27-d1b3-41da-4e1f-08dc70767756
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 22:22:09.1858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgIwZn7PqPT02NXND0KH0ylo/LaL4A+27POT67C9rxQgustD7jPoWRZppDdE0R7sAynEQwYe1k/1v7HOALTSvYs3961nDO1F7bL09Y4wVUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8189
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_152227_107524_B75B5A13 
X-CRM114-Status: UNSURE (   6.79  )
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

Hi Edward,

On 5/9/2024 12:58 PM, Edward Liaw wrote:
> -D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.
> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---

Thank you very much.

Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
