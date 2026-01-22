Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0F6D6CFAA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 22:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LLpbtywfmFJyO1gd2OboP/gEDqtWmA/jgk7GJShnHWY=; b=vCTpPmGaqdfJcLsIOvA4VxmfMX
	jJp5fYtRUkr0pBDQieRkvqm8KPe8ItJxte3hteO6MkmCHH9otLrgrttXjFwqvxi5VKx4AnOTZHD2D
	/DnHVOk0kmyh1065qVzvvD+Iksj1JEP1gzdGg1M7iuhakz5qSgq751ZZeXEWHEROU34WiOxuQktnI
	0+Fheu6jdjSz2aUHHfLeSjNJqkRucc8VDa+QpIIByakQeVdtBNYAvFlIAEeaJwn5A7uvKZCVUVR9L
	0r3/eZfx8d606JCkKUd3wCltYMQHXZk9LvUWYy3Y0ACNK99lMIJ5IL6HE1uZUIdylb56E/pUeCLUr
	aiigmfFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3EP-00000007qXN-0Ndg;
	Thu, 22 Jan 2026 22:32:49 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3EN-00000007qWw-0N7j
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 22:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769121167; x=1800657167;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R0EdcDlWSVK+Kg9y+L25CgJZcMCK7QzqbJ1j3b1XrtM=;
  b=FCe8jG+YTIjTB8+9e4qhPDpYvDFS6m3gWVZxkwGqiWmrn7ASz9fuyPgZ
   EeYvQYU5groGNRXdPgjeGy2t7f8OMOMifwHjl8keLdwxDt7kB4Pwk+KXu
   FJMseM1sPp6e6iDBTsY3vHfr/vNihv4NmihCkYlk0pjwxInrr+02XoQEN
   gwz0ocVi0wT8C6Irppm0RfvFSQzzr9V7RuOa3Y9Oil1Yzv/2mllXKqVpB
   QS/IUHgp6O4DFFq1egNuGtXOR4ysdW/UqMMM0uRlLKKzCfX25IxX7HR4u
   sTmchYpjkl7QbR56HaKqtoM61cBIlfYozx7BgmJkUAxSUuz+RAWoNKuGS
   Q==;
X-CSE-ConnectionGUID: lXrGIHstS+yCvkeTe40IKg==
X-CSE-MsgGUID: X+cQsBQaSGqjg0+xBWBMdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70423050"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70423050"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:32:26 -0800
X-CSE-ConnectionGUID: TuDIryfaRzW8a8Z+ZmjKsw==
X-CSE-MsgGUID: w3HAc0OaR9GcMKIyKiAs1Q==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 14:32:25 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 14:32:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 14:32:25 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 14:32:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJQYPKb7WC+9l/69hsnplGHjvyUjEaawtawI7AKlilDMpye+XMOb/HNAuJNYXy55N3S012a6dkuheNMe6w9DxEyRHhAfjVUub+wF5jL2noqGuHRiqNY5YfbjXB650HXuDUAAt26UV6mu2zgF+voBCZxfBfa0M62L52bvCwzqVUuRuI3tqrO+fQNNgqA1R9EdnXcuY4IdjcqtIB65EWzPcIjNU2rU73wakILY0EEKiazXPlxdkAqnDb92CDsJEx68/e4k8zo/Yd6CWZSPb9bTW0OHakmJ4iEILRKEJXhOg9Fx/m+GKxJJ2aZ+WJIJ//zc/75cIX/fuEL8i+XyXSevsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eY8CLM03ZGpQnS19KQDKqEHgmMql97V4kVuG/S60sm4=;
 b=rfjjspJPkeQfZ7bbIfisaR/U6dDjDqTsc/4GaAOODBnWJwt/yFh8ZCTiF3ckCqs44cxrUS5wRnJHsNiPB3nsAJUzGqunVR6jlX48YKoZhAzr630FyhF3twKAYdxIMPYzlJmdj+iQjMkY/ed+wX71MSOwIUIoC6j056H5o1VQrPttFYo5KJqHgUp5nEDLAytafAACZC411nB9qdbjzdqGeVINBG3Np1lSL3N6lmuR3uwVv6R3XfAxzuBz3ccybCukkZ0h8O6PSwkvs0i3xFiYS2eOfymDLHuoCl7DxW0912FeT/2dChY9Fa6J2zDd6tMG/7CHY185U8Sb/i9AsCoQVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ2PR11MB7574.namprd11.prod.outlook.com (2603:10b6:a03:4ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 22:32:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 22:32:22 +0000
Message-ID: <1c9b21e3-f64b-4a0c-9e1b-cc90d981159c@intel.com>
Date: Thu, 22 Jan 2026 14:31:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/19] RISC-V: QoS: add CBQRI resctrl interface
To: Drew Fustini <fustini@kernel.org>, Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?=
	<rkrcmar@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>, Nicolas Pitre
	<npitre@baylibre.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
	Atish Patra <atish.patra@linux.dev>, Atish Kumar Patra <atishp@rivosinc.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>,
	yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
	<guo.wenjia23@zte.com.cn>, <liu.qingtao2@zte.com.cn>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Tony Luck <tony.luck@intel.com>, Babu Moger
	<babu.moger@amd.com>, Peter Newman <peternewman@google.com>, Fenghua Yu
	<fenghua.yu@intel.com>, James Morse <james.morse@arm.com>, Ben Horgan
	<ben.horgan@arm.com>, Dave Martin <Dave.Martin@arm.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <x86@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ2PR11MB7574:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a66417-f678-4182-7bc4-08de5a061c56
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTFNNXY5K1h2djNEaVJoNDNqY0Uwalk2TW5BWmZKMlk3eStoaVBmbkRGclJo?=
 =?utf-8?B?L0pYM0g4dk0vY1haWEprYkZPY1lUbWhPT0h6d3dzZm11YnFnQW01N1JlVEJv?=
 =?utf-8?B?cEs1ZFVVZWZhUTBIWklic1ZiVldCdjJyTklzSllUcU1OUGhUQnZXOXUxUUdh?=
 =?utf-8?B?R1VXQmN0RHVCMGpvenl4azdhWlJLT0VicUgyeFVPRk9LdWtLMVlCS0YzRWVO?=
 =?utf-8?B?ellta3Z4VTRhTkYrcGxsMHA4VlpWMEhTUGVRUnY5MWgxTkhJVCt5c1M4WW9W?=
 =?utf-8?B?QThzZ0QrU1FncnRBcmM3Ymdud2l1SFlhaWxNTkJkdy96cHFuckNuUVVkR0Jv?=
 =?utf-8?B?b2wrbVZZYWp6R1VHZStkWnAwbDk3ck1CKzBxQU5RVlBTWjZXWmxsVExid3hq?=
 =?utf-8?B?ZG9SamZGZnBzSmk1MjIveFFSd0hYMkVRbGk3cm8zS0FPM0xCQmdwZnR1bmJM?=
 =?utf-8?B?ZkY1Z3h3VWpDQXNTWTl6b2pDUncvN3Fpc0pRMlp0RkwvODQvL1BoTU9WQkFa?=
 =?utf-8?B?RERvTWhaOExTL25acWN2VUZ0bmRKRjBxYlZnSE9Id1FpaU5FMFpuOGVPeWFq?=
 =?utf-8?B?OFEwOGMrVHRGYUt3VjRuVUhvMjBaK21rUVFzMnRqQmxjSWw1cEsveEJlanJr?=
 =?utf-8?B?QThBQi9RWDZQRHJTN01ERmloa0wwbzI4b1U2MVgwSmY2Zk5DYnBqZ0F1Q2ZT?=
 =?utf-8?B?c2FZZUt2aE1MRHp0SFhVcFhmS2JWUkN1QTJDUjJNMjBQWVh1RndkbHRuUmd6?=
 =?utf-8?B?d204U25LdzlxTHRXZVpUdzdmajBERm8zakhzU0ZobHNFWkRWSmp0MHU1RW1U?=
 =?utf-8?B?allpdUlGSHk1dnVmRkpkQUZaMFVPaGd5aVVLZ2ZVdkozaGR5M3FOeDJPWVF2?=
 =?utf-8?B?OGdrRVZ4NDVKN1ByNHArdjh3SVNSQ05NNmtPaitkbWs2a3NYbmMvQ1hlMXE2?=
 =?utf-8?B?VnM1OEJWb05PdnA4dUF1WXhWY3VUZStvU203SlpSTkJ4ejh0cGtDVmtteE1V?=
 =?utf-8?B?OVhoalJsaEZxSHdBTXYyTGFCOFZ0L1Q1ZStkZGVEQUpKRUpnbFdieHQ1dHk5?=
 =?utf-8?B?NDhZblVQR2R1ZEJmTmdQcEhQSXhxS1FDTlZaMjd3T3JCaWVRTnM3bFZCSjRs?=
 =?utf-8?B?Rk5NU2lJd0ZaUDB0R055LytXUi80QVAzUWwya3ZKN1BVWExrRnJwWStJbGtL?=
 =?utf-8?B?aDhHYWc2aGFqbng1aW5yekNUTzZKWHpXdWhJVmZLSnRhcXkwa3J6OWZJbS9t?=
 =?utf-8?B?UC91SlFXR0I0RUZhbUUwUERML3dPS001bWdxWlN1alJlN1YyS0o5ZlhCdXBy?=
 =?utf-8?B?clhySVV0SlFRUVRncWRMQjd5YVROUUNlNHNwRzNyd3JxOHdZSXdTYzFqRkNQ?=
 =?utf-8?B?eThVR1VIRSt5Tm1kYm42Z0dBL3d5c0VhMnRSTG01R2RkRThXZmFZRFNuc2Jo?=
 =?utf-8?B?UUNMTmEwUFRTNHV4MlhxN3FsVCtlYlNQZ1RxaFFyWk5TelBhMTJTRHA1eHNp?=
 =?utf-8?B?c0hKYmVVbitCdG9wSG9pTkdhbExML2FkV1ArK0VvdGVFODRJdXpkYWQrdS8w?=
 =?utf-8?B?REVSd1o1T0xuNHA0dCtIc1dNQnF6SkhKb0JQRDdIU0NqZ21xWWRha2c4aTN5?=
 =?utf-8?B?cjNjSys0SG1tdGZhc2FxaVlRL3RuanEvdUR1d0RTSVV0QjJENVRHTldxb3dz?=
 =?utf-8?B?eURaRDhGWWIwVmRCUFNyajEycDhySmROSUpDejN2ZWRnMDcxY1VBVU1HWTVy?=
 =?utf-8?B?a1VYQkVzYzJnakxjN0pxNUI4SmFpcE41SURtQXNFYlZ2ZEdCbjRIUEgvUmRF?=
 =?utf-8?B?bDB4TklIelNoNTNCVmUvaWQ2ZVhtYU1XTXB3ODlxcWh6cDZROXJxU09iSHN0?=
 =?utf-8?B?OFppbDBCcTZ6VEMxZi84MWZXYWRsK0FZUDlzV1U0QXdvSGJDWlM4dFRmM0Ft?=
 =?utf-8?B?aE9OSlRadVBJTW5yVGZYUTNBOXMwOVhlK1F6RWpCNmlKczl1RityeFh4TTRT?=
 =?utf-8?B?cE1JbjQwRUdPZllEcHRMekhpZk1qVGVDc2JQLzFUVXJmaEVobGtNd2daSTRG?=
 =?utf-8?B?bDV2dmVRRTRwSDEzVzlKSnIvOEV4N2RoQVY5b2hmRWNtTUMzWTBqUTQrRGth?=
 =?utf-8?Q?dqVw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm85UXM4Q1gzM2xuZmxIRnlvSUhFbmdPazdZSFNNNXNXSDJsbDVjT2hjcnl2?=
 =?utf-8?B?KzRNeVc5bWl3UFZjeG9kRkxSSTNzZG1RVTJSaWV4SlN0MWRqOEpxYWhORVNp?=
 =?utf-8?B?TklIVW9Ha053OUFZZzZ4aXpGTzlFOHZ6Y25zK3lJMi94UUtNL3BjUkd1bnlG?=
 =?utf-8?B?dkQxWFVDTjMrQkR5YXN3NEpaN2lBSjBiV0QwL2xHRCtLMENjLzAwajZrWURo?=
 =?utf-8?B?c0U5dzVLaXEzczIzQ3VObHNUTlRiY0l1N3QvOWo4SHdvTUZaZWhpbEdCRzA0?=
 =?utf-8?B?Qk1sK2tBMU9zaHQzTVk4K2NXN2Q5ZUR2SlRRMVhpOEhPKytnNVIrdkt2anhw?=
 =?utf-8?B?eGVhc2NtUEcxOHRSdGlTNTRjNDBJWFNYZFlHcmcwQ0t6dDEwUjlobG5kOWRr?=
 =?utf-8?B?emxIbzYvRGl6dGsvZFZYNFBJYW9IdXl2ZUE1YWQ3UFlXd2pVMUVGK0JqWU9y?=
 =?utf-8?B?RlhybzZJcGZXMnllOE1ZLzl2Nm5GMENEaHYxQzdQcGQ0UWpSMFF6T2RuUmVz?=
 =?utf-8?B?M1RNVTgyaTYvb3RQK3FSdUx1T3R1TUY3cU1NNlc2YnNzTUJYYVdCRVRLcUpF?=
 =?utf-8?B?L3ltQjVDMWVqZHBJT3NSeHlqaUlodWZVZUZCdjRQMndtV2Z0d1NPWUh2MlFY?=
 =?utf-8?B?dW9PR05EVjBuU2pTWHRyTDFTSmI3VU4wOFgwVXdJQUdrYStJWk9hWE1jTWpU?=
 =?utf-8?B?TGk0VDEySjZNVUNNNlNDZUIvMG00SzNIckhPWmhvblBUYkg0TVJlR2ZIOENx?=
 =?utf-8?B?Rlg1ck1wdmlTS3U1ODB2MG9ZZTdaM1dFRllJVmVhcDJ2SU5PYU1oRlF5bmVP?=
 =?utf-8?B?dmZtNjlxRXU3MURBTVpkRXAyKzMrZkFiN3NVR3JEbDhSOVE5cEpYYU9KNFZ1?=
 =?utf-8?B?anhLOG1waDRpTks3REFNbW5sUjNLazlOb3ZGNDZ2TzNyWnFyRGxTUnZFYTlC?=
 =?utf-8?B?YlRHWFBXOGtqYmVHRzY2NUVPTWdwd01MSW9SNWM5dXQzYzBsOU9UL0Zmbjdr?=
 =?utf-8?B?SHFkUFFoVCtxOTdjd0twMjQzd0ltakZxclJ1YTVaNUppa0ZYYnk2NjRKeUx2?=
 =?utf-8?B?Q0k2a3pKSm4rRjNOL1MyOTBzWUV4Zi8vU08xOHhhU3hkc0tKVWYwNW1PUGVV?=
 =?utf-8?B?MzNBMW9tYTNHYzZnb3ltdkFBL1dwNDZDTnFua0NZU1MrN2dIMzVuejBMcVlw?=
 =?utf-8?B?WHhGaXk5ZGhBdnR1aE9nRG1HazdIUXIxRExzRTR6Z1JLNm9DblVheXpnYnAv?=
 =?utf-8?B?RFdUN3FKczQvLy9oSmJwVFFHenNIWDMralJxZWM2Tzh4TlZjRVlwa1J6YTJF?=
 =?utf-8?B?MFBmSndZMmRFMzdQNFd3NThYMC9VQ2Q2UHg3ZytKTkdqZFBsSmwxdW8wL0xz?=
 =?utf-8?B?QjVFTWh6RXhuSWZLUXpyaXVaTy80d21NQVlvZGt5VEx4WkdGSWZrbnVtd3hG?=
 =?utf-8?B?SkU1WnZDTXlMZ0F2MDZIemJkRGpQektDcmhDdWRzTFE1dTNSdlFiUjlUSUt6?=
 =?utf-8?B?aHBSaWE1MmpRbXZCUmxhZHRqRVRyTDJ0bHkxejJCTk15bWhXanNsQk40emYz?=
 =?utf-8?B?M2dPUkJiTUx0eTQ2enRtVTJiK1RIcmpwaGFLaVdObEsxN2FCemdrZCt2dEho?=
 =?utf-8?B?ejdRN1hxTUl3Uk9ra1Q5NUFkcS9QSXpWQnRNOG1jYS9TUUwxZXlCTithVzJX?=
 =?utf-8?B?Z2dINXNQTjYzVC80K3lWOGpZN0IyTDdpN1R4ZEc3ZEJLYkNMckI1SkhEVjRn?=
 =?utf-8?B?ZkRBWFpSSEppL3dIeXhNb3BRTk9naDdjTjg5L2xMb05SUjFBVlBBcjNjbVlv?=
 =?utf-8?B?MXBkVTFzM1YzNHE2anNWZVc3N2J6aTQ2NEV6akJxY1RQRU9mRy9oMGlkMUtw?=
 =?utf-8?B?cXpvOFpPSk9wbDZSUUJDeGgwOHRzWG5TQzBzNEhYUU16bVd4OWZrUWFWTmNy?=
 =?utf-8?B?dDk1M0hhUmNXdDhSc2VJSjArVG5EOUJiU2Era0xqSnBFSmtFM0huOTVNY0Jw?=
 =?utf-8?B?QlF0c3JyWFVwQVhiakVEeElaSGFaK3ZtMTJTcUFRaGpHKzVDOVNhTDkxWjNr?=
 =?utf-8?B?QTE0dmtSVmNCRVZZMUp4aUlDZVIyWFAxdDNGNUF5UDdoZ0dSa3czQmlVQVg0?=
 =?utf-8?B?S0xFeVFoUlJUWk5ia2djTkVRT1hZVmkwRmR3eUxBSVdCVnQ4NFZaL092R05R?=
 =?utf-8?B?cFJyT2ZNSW5QZmpYUk9BU3pCTkI5clozazZ1dDAwM2pyY1BWZnQyL2JVTXZY?=
 =?utf-8?B?eEVOOVcwWXN4Qm8yNDdkTlkyS0hXdWg5TmlpV09STjVkOXVuc2E3RXd1anBt?=
 =?utf-8?B?YnU0MmcxMjNQWmFuREZjUncxYXNmY0U5eVhzMStJL1JaU1pLVWY0ak5ZMWJl?=
 =?utf-8?Q?xz4I7moiJaCLYM30=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a66417-f678-4182-7bc4-08de5a061c56
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 22:32:22.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyEFKin1fH3OVoGbp9HUbsfRG9V8XQvAkPeyJyzknWHEwHUB4or1cf6CqlFyASIWrykPTVXi9UXjcwwEI9u7FMG1Qsv4Id5mQyQ/bKBfjjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7574
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_143247_252132_F5CD9F6C 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Drew,

On 1/19/26 8:14 PM, Drew Fustini wrote:
>  - No MBM (bandwidth monitoring)
>    - MBA schema works ok for the CBQRI-enabled memory controllers, but
>      resctrl does not currently have solution for representing MBM for
>      bandwidth resources that are not associated with a L3 cache.
>    - For the old CBQRI proof-of-concept RFC, two separate domains were
>      created for each memory controller: one for MB (allocation) and one
>      for MBM (monitoring).
>    - The monitoring domains had to pretend that these memory controllers
>      were L3 caches which is not the case. I have removed this as it was
>      too complicated and not the right solution.
>    - Fenghua Yu talked about a similar problem last month at LPC in the
>      resctrl BoF during the "MBA/MBM on CPU-less Memory Node" topic:
>      https://lpc.events/event/19/contributions/2093/
>    - I hope to work with resctrl developers on finding a solution.

Specific to this open, could you please consider [1] that proposes a way for
resctrl to handle allocation and monitoring of resources at different scope?

Reinette

[1] https://lore.kernel.org/lkml/fb1e2686-237b-4536-acd6-15159abafcba@intel.com/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
