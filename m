Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F201BD1266B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tss4CQBRj5fjIJ2XemzXFHgxoMY1s1uLrRviZ4aiQs=; b=gPvuuzkiXmzE2e
	XDuWXobX2bPoCU42WxMBO+zY5jQPU9+J1jknZL5ggFiOmDxskOFbp0gK+iUE02tb8SwT1y0rj16JE
	FpaU59XtTpqIFRrQ5l0JiCJslJiZqC5EXduhJNwO5Q6HZ5Ej6CmnQlW1f3wrf4PV5I1cTkaEclxJw
	eW+2iYKMmNHQ1L+oF+XBZAMbUC/UlWl2UW87d0pMWWoAGSdA1RMysVhJDpcv2WKZQq2HmkJQ2peik
	JxgHSQq42WguofR71BAErdi42b486WKkGo/bx5vzhOuxYbxSvkLvqVMq1IzBIHQRC6F6VvljNcSS9
	UUhDAMHP54W9/67q/xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FEb-0000000GObB-2HrE;
	Tue, 05 Nov 2024 08:48:21 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FDl-0000000GOPY-00sl
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 08:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730796449; x=1762332449;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=J885qS9ifUf4nvCmgAdAPy4C4Y+Q1TInz4ZrNi20ptE=;
  b=JUO9qkXwDX2szqGshOtH/ntVb1uKpt7lVGI/uOkrBhvo0q2Yso/b45v0
   IHFAp1HOKd1oRM1qIbEh7dsjieKtGVnLczq6fIzMChTcQvYZnSUG7uPXH
   BZ/L25GvxgosQhdrqRPCeFu2zxE8J/TJLlCJRQuMbfghHnf6YMwrXX52g
   J5c2eesbjmd3vlE9oMHponid5qFwG+e2KAhwgWgKqJrGJmkB9XddkOxOw
   roIBVt3o8es2MMwlxc0jINtLN3oTPMy2jRNvUmL9CyT6LWFe6egrJ006b
   Tj+lq8Wie4HCLkzZHZqtunEjybUVmQkDticnnbKov5Btzu+XQ75pnQWXX
   A==;
X-CSE-ConnectionGUID: EsGV/yWnRj6vWk2xCydVtg==
X-CSE-MsgGUID: 991YPcwPQ6aDyNKLHP7i1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30409213"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="30409213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 00:47:24 -0800
X-CSE-ConnectionGUID: cFJvsXJnT9yr9/r6HK10SQ==
X-CSE-MsgGUID: 2ZAWXvMWRXCzLdWQU6wDeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="83590043"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Nov 2024 00:47:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 00:47:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 00:47:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 00:47:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzg5Iv1LCyc6LsSW6n4Ll7csEEvcnqrOo3WywFWyCYJxkalMgfv6UhYUvAY4RaNUZyprx7t8SacBzRDO6tBgHEMNcaPUMr9qql6ocakdof6OhsEaS5BFP0Jw+KPBehNBRS9MSyNeAoB8y9ZIj/HUI7JKMvfQceUgmrVTfqNt5M6wsMAZVmDtq1uXQIm0qtLKYpx83AvTBEh9WhN+XiBi61OmWGPvhsQSO4N8H92ZovzESrDi1yHOD5mpgYySo/h80UdyzpaeqeoiQJUsfZbgZs5ojOGC+c5AlY/RMXcMnZjO7GzfYLiOVZjdiFRSOBnwMq2ub8ri2udHJ3aWHzmBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKvC2VLYYGmkddfvKt4tSDJe3h3T6ePcDHlS4z9qtJ0=;
 b=kRVCDSLc8Mka5vp1Q8Tr0AkxCXXTVOSLXuzA5qpDoIFpUqA/Klauk+EhNhy6PcDHi5a62CaV7CjG8/tJqm9Wjxi10VgIFtSaVGCVwz9hULr+QWveuf465q+LHkjFpScmLZwaUiYWu5JRwuNv5XF129O/Aq8IfAVqyN4EnHaV0YyMroH7fbAQJTTVQK03hPspyLDfLEd4fMy83XrtU3EgkcrLEiNrw9EqNB2to+WmhYThALcZYCSiYV8hrpg6wWBW9WuG6cJ5RqATtln5kzapwL327zg5uZA5ulpGIoEjvtK4fNnZfkkdQy995SAPV4XTPnCK9DDcfctOQKy44497kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 08:47:16 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 08:47:15 +0000
Date: Tue, 5 Nov 2024 16:47:01 +0800
From: Philip Li <philip.li@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, "Andrea
 Parri" <parri.andrea@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will
 Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng
	<boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Leonardo Bras
	<leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	<linux-doc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
Message-ID: <ZynbhcW864CHhpDL@rli9-mobl>
References: <20241103145153.105097-14-alexghiti@rivosinc.com>
 <202411041609.gxjI2dsw-lkp@intel.com>
 <CAHVXubj8EXCXNPuJ+hqrHwyujjz3GDcqqMjQ4ZFC5VbmZurV3w@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAHVXubj8EXCXNPuJ+hqrHwyujjz3GDcqqMjQ4ZFC5VbmZurV3w@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a95f27-8439-44b0-1031-08dcfd7672ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2Q2dG1qaUl0Rjc1c1FtdWhGcTBZYkdPc3A2Ymp6VjVGd0RWeFZtUTVDUndB?=
 =?utf-8?B?ZjA3K1pSTDREejdNTklBTktDOERmZXdud1g2V04rMzdYWW4wd2d1cXVlNVBT?=
 =?utf-8?B?eUFZaFhnUWl2TTNCT2hOTjhnUkU3UDROQTRWS2c1NzNoMkE3Y2tOQStrZjc2?=
 =?utf-8?B?YisyWFJPZDJtUkdTMXZvQk9IY255QWRSWjhuazB0K3M0TUY3YnlCejFNeXI3?=
 =?utf-8?B?cldsUGxjeHIrNlc5RUtwRU0wc2tIQXlqem9OdVFId3pFaTRVS0VYTUNlY0J4?=
 =?utf-8?B?VXhidW96WmJXZ2JiV2x4MFhoVFluQlNPVmFJL2NqSUZZOXNJWEJKaGwvOGVS?=
 =?utf-8?B?d0NNNzhpTUFnLzZjMWtQNFBLTVFiZmRGMW9yU1YrMDUrOS96dnVtQUpRV0V6?=
 =?utf-8?B?WTAzSnpuemc0dFpSNTROd1FXUzhnd1VqYkNMcHFCUUkyZThselNJa1JWdEE5?=
 =?utf-8?B?MU9TZnJDWTU4L0ZMT0hKb3RDSGh5WU4zaTUvU1loQnEwSnpsMHhxalhzdWxT?=
 =?utf-8?B?a2g3MWREK3FNSnFVbGRmOGRjTTdIQklGWHhiSlZ5N2dhR1lUL3NuRi8vbVNz?=
 =?utf-8?B?cUltbDlGTExiVUZUT1JaZ1U0cGRDS3BYMzhCYXl0R2JXRXJZVktlS2xIVHhC?=
 =?utf-8?B?U2dkaDdmbEFFazAxcEhwcVlrRW5RNjI4aGNpVHNrKzBMS0p5S08vTDgybnow?=
 =?utf-8?B?aUpya2ptZDVNdWF2aklWZEpZQUk2MnhCRkt3aFh0WlRSdU92dkU4bkZza0ts?=
 =?utf-8?B?QUNzNzdkZk9VQzNiczdFWGlKd0VkRmh1TlN2NzJ6clhJNkQ0V3FObGs2M1l1?=
 =?utf-8?B?Q01PWUJsQ1FKMWllY0NpcHpobnF2ZmtNOVVvYlUxVnlQZnR1NThPNTZvekZv?=
 =?utf-8?B?akk0K3hya0ZjWHNKVFRHRitIQ1JibkgvOUlZTWIxUHc5aml5Z0VlV3RGUDhQ?=
 =?utf-8?B?dmc5YndrVHJ5TzNjVjNmaGFpSW5lUFkxMEdrazQ4UytLWlRwbTFHZnFmSmw3?=
 =?utf-8?B?ZlZmcVpGSkJET1kwQTl6T2NmeG1VdHhuSnN3RFZnaTJ4VEZMeVI2YUk3NEpG?=
 =?utf-8?B?U1dRTGt1c0VCcndVQWpwQmFKS0NDMVNZNlJ0dk9PVzBHZVJxaG1ERkpqZThj?=
 =?utf-8?B?TjZuQmxLY3BNN2ZVWDlaVzYvTVVWQXlPVUpzMWdLb2JqQnljbTNpd2hLOEN5?=
 =?utf-8?B?TDBNVWhHQklNdEtIVjVtcG80aGZBbWkwa1JrRHdYSlpOMUZwUGFOM2JXeTVX?=
 =?utf-8?B?NVNUUXUzU04xZUxWRTAwVkswZkhBV2J0cGF3Tkp5OWhjY25EM3NKUjZjdkJw?=
 =?utf-8?B?NWlXTUpxZmtEaW0wenBiQXJPSHFNRm1TdkZrVkRMelFKWHQ3RzNSL21oQVJE?=
 =?utf-8?B?YUJ3ZGlxS0d5cEJKOWZEZlgvOVRSQklKalp3NXFncjZGZWx1b0huZkthakQ1?=
 =?utf-8?B?UnFVZno2M252MS9jbGFoTVhrS3RCV3AzVnVMaXB1anBoZHRkNHlEUW1nS1hD?=
 =?utf-8?B?STFiKzNoM0JXYXRFcFdOUXBRUG5LdEV3NnllWTdlYWFUYk1QZUdIV01NZlhJ?=
 =?utf-8?B?a0E3SUlaNS9WT0RTOU9mWG5rNGtXa01jUlk2ZGJFdzlTendTck1wZnY3N1cw?=
 =?utf-8?B?eGczdG9UcGRDcmt4VFprRWRqZDI3SEQzQWYwa3hFZDlmRTlzbDVZRFZ3K1pm?=
 =?utf-8?B?Z2FkeE0rb242QTh2Q3RFOVl0ZDUyc3RraGduWFduM2FqY0FNSjZWQ1JRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2U5M1JJVHUzMWc1NTBUcGZPeTIzY3B6TUF4REtkZGNsbGpwUnZaYytCUC9I?=
 =?utf-8?B?Z3ZCUUx6S05KL1BlS2RRc1I0NjdKd1RKODczMndyV29uamdVSStjaVFNaXAz?=
 =?utf-8?B?YnBOUnRIWEhZYlE0QzNOM1JJMDcwRkVhbm1hemg5ZDh5OGxRenk1NmZ0N1Na?=
 =?utf-8?B?NU1YWjdWNzFKUFdLc0RucGxqY2RMWUpjakk2VE1FZ05lTUNCWVFXUTRldTkz?=
 =?utf-8?B?djlWS0QwT3h5L0J4RXNiemdUbzdoa2haL2FIN1d6VmtSeGxWbk01M0ZJZUtP?=
 =?utf-8?B?WE1jT0ZZR2MzclVYUnRKaWZya1UvQThIdllNQS9sOVpPeEVtTlVzZmhGVVJI?=
 =?utf-8?B?TWx1RmNsS2FmenFFVjE5aXdGK1lITEFSUjFubkRldkM2VC9jdGk2YitkYU96?=
 =?utf-8?B?YnJCOGhKL2lVT1BVV3J1TEVIZ2RwM2JKVGt0aE1nSGlkN21uT3MwNEJHc0dM?=
 =?utf-8?B?eVcwbmxKcUFVTXd4cE1DOVNpamtka1hzcXQyRFBFZXgrWXFwVnNvN3RaVVM1?=
 =?utf-8?B?RU4rL09QM2l3QWdQZWNKZzMzQ0dGMG1LTndPTkdnSi9WbGVyckt1VElIYStr?=
 =?utf-8?B?RStMVWExcndwWmYzd2V5aHB2c2NKbTdXSVNVUTNVQnVDWWxGZkdWaGRnNTVJ?=
 =?utf-8?B?WG1CQWtpSXNQLzEvVERHV0dibDRLbEp1V2djM2p6aTVtUFU4Z25VTnJteHJR?=
 =?utf-8?B?NzNnbkprMnREaGdvS3YxcFF4L0ltbkYyakxhMmNXUThwcXpybDBYY3B2SGJy?=
 =?utf-8?B?WDN3Sk5KTmFxK2F5TkQ4VEJUY1JqK3l2V1VqeitoUHcrclVtdkpOUUpTcEJu?=
 =?utf-8?B?QzlHcDRUa1gzMENmeXpSVjRudUIydFFLRTUvOEdEenlsVnlzUDk5U3VjYVBm?=
 =?utf-8?B?N21ISTRUdHBOb0grL2poR0VvOFZDVHllTndtdG56bkh4S3lMMnFKdkxzb0Vk?=
 =?utf-8?B?Um1RT1l2MVhZRlZnQXhjSHBtOUtNMGo3RW9kc05QT0ZaZzFYVU1YQlBrTkln?=
 =?utf-8?B?bW9Ta2s3S2hJN01PL1JxVUdnTld4V1UweXpIN0EzS0w1ZFJBdFJOUU9nU0dj?=
 =?utf-8?B?UU1sODNCMmlRTFhpYlpJTXJJVUhwTlJRdjFyQTFDZk80NjU0SlZ0NGZvWFBS?=
 =?utf-8?B?akxobFhVMno5a3FhdGxSN1pXbVg2OGFwWTRSOXhDblZONlVFUGk0TUhkOXo3?=
 =?utf-8?B?b0tVU1ZsZ1lWejZYbS9IRGpWRkcxaVdzMmpPZHdDRTZ3SzNXUmZOOTNxTkJt?=
 =?utf-8?B?MGxXS01EMVdQZUQyOUk4VjNmN1BzcVdlWWFPSmp0MzluLzY2N2d4enFoMWp3?=
 =?utf-8?B?eU9zTk5Fb0IwVVZNbktNWlM1TDZxdkVqZVRYN2FNRG5VenhCZXRhNmJVbW1O?=
 =?utf-8?B?dzF2bUdEeDZBWjNIM24yakVhTzgyVWtTVDh4RERyT1g4azBFZ0I0QVJmVVVU?=
 =?utf-8?B?MVpJM1RRNHhmaHNLUk1JOVp5VitoKzI3SWk5b1hYaVFoUTlMWlNMS2w3NFBO?=
 =?utf-8?B?VlV2Y09TUkM3UEY2OEEzY1NXME53blQxWTlURXl4bXBwbHdRMlZvTmVCY2xK?=
 =?utf-8?B?R0U4d2lHdDZSdFd3cHJqTnRMaXdnZFZSVzlocDU1bHZUY0NyMHUyODNHdUU0?=
 =?utf-8?B?M0YvaW90SzRWbzIvWWw2Sk9MVXh2V3Rkeng4a2J5RjM3WU1zQ1A4M0EvSVg5?=
 =?utf-8?B?U0VKbzdENHQzS1h5WVZtOWR5aFB1bkVvbkRPQWdsWHlXWmZwRExtQ21IcEc1?=
 =?utf-8?B?U2ExOHJLUTdHRHEwMlB0VktvM1dFbGtuaTV4RHFnM2xtdjJXdlo2dUpoRXo3?=
 =?utf-8?B?UTlTam1hc1hJb3BjNS92eFpiNjY2MmNnd2hjQTBncDhGVWZXeHd3S0dtYWZR?=
 =?utf-8?B?NFR4bnZYSGVtbld4Y2tuQVJmbWQ0K293WlJqQTBmOHJNSnFFWi9wZTFtb3V5?=
 =?utf-8?B?VFZHNmZuTjdLQXFnREZyQ0JFaEF3azNja1pKc0FEZEl2SzNoaTFmcGo4UHJO?=
 =?utf-8?B?aUppZGFFN3RHT09DT2NQeS8zM1diSFBkTjlLdERkVENJZWxESVJMenpWSG1C?=
 =?utf-8?B?eGhBYnVCdkdjaEUrWFV5ZHRKdzJJQ1Z2WVphSWhxTWwzZHcweUpGL3hoTFl4?=
 =?utf-8?Q?Gs9QggXVLp+DApAg/1t7jswSe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a95f27-8439-44b0-1031-08dcfd7672ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 08:47:15.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRvBpZWJmFQBrDGrVi1ibcjPWChNUCo6HeUX2s4sCIfpsGWOQWyZfY6edEadHMmU54G0K+RCMasktfkx19bZOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_004729_087940_345E2688 
X-CRM114-Status: GOOD (  23.51  )
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

T24gTW9uLCBOb3YgMDQsIDIwMjQgYXQgMTA6MDk6MDdBTSArMDEwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIE1vbiwgTm92IDQsIDIwMjQgYXQgMTA6MDXigK9BTSBrZXJuZWwgdGVzdCBy
b2JvdCA8bGtwQGludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQWxleGFuZHJlLAo+ID4KPiA+
IGtlcm5lbCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoK
PiA+Cj4gPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcgb24gYXJuZC1hc20tZ2VuZXJpYy9tYXN0
ZXJdCj4gPiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gcm9iaC9mb3ItbmV4dCB0aXAvbG9j
a2luZy9jb3JlIGxpbnVzL21hc3RlciB2Ni4xMi1yYzZdCj4gPiBbY2Fubm90IGFwcGx5IHRvIG5l
eHQtMjAyNDExMDFdCj4gPiBbSWYgeW91ciBwYXRjaCBpcyBhcHBsaWVkIHRvIHRoZSB3cm9uZyBn
aXQgdHJlZSwga2luZGx5IGRyb3AgdXMgYSBub3RlLgo+ID4gQW5kIHdoZW4gc3VibWl0dGluZyBw
YXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRlZCBpbgo+ID4gaHR0
cHM6Ly9naXQtc2NtLmNvbS9kb2NzL2dpdC1mb3JtYXQtcGF0Y2gjX2Jhc2VfdHJlZV9pbmZvcm1h
dGlvbl0KPiA+Cj4gPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1sYWItbGtwL2xp
bnV4L2NvbW1pdHMvQWxleGFuZHJlLUdoaXRpL3Jpc2N2LU1vdmUtY3B1ZmVhdHVyZS1oLW1hY3Jv
cy1pbnRvLXRoZWlyLW93bi1oZWFkZXIvMjAyNDExMDMtMjMwNjE0Cj4gPiBiYXNlOiAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FybmQvYXNtLWdlbmVy
aWMuZ2l0IG1hc3Rlcgo+ID4gcGF0Y2ggbGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDI0MTEwMzE0NTE1My4xMDUwOTctMTQtYWxleGdoaXRpJTQwcml2b3NpbmMuY29tCj4gPiBw
YXRjaCBzdWJqZWN0OiBbUEFUQ0ggdjYgMTMvMTNdIHJpc2N2OiBBZGQgcXNwaW5sb2NrIHN1cHBv
cnQKPiA+IGNvbXBpbGVyOiBjbGFuZyB2ZXJzaW9uIDE5LjEuMyAoaHR0cHM6Ly9naXRodWIuY29t
L2xsdm0vbGx2bS1wcm9qZWN0IGFiNTFlY2NmODhmNTMyMWU3YzYwNTkxYzU1NDZiMjU0YjZhZmFi
OTkpCj4gPgo+ID4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21t
aXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZgo+ID4gdGhlIHNhbWUgcGF0Y2gvY29t
bWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncwo+ID4gfCBSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiB8IENsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI0MTEwNDE2MDkuZ3hqSTJkc3ctbGtwQGludGVsLmNv
bS8KPiA+Cj4gPiBpbmNsdWRlY2hlY2sgd2FybmluZ3M6IChuZXcgb25lcyBwcmVmaXhlZCBieSA+
PikKPiA+ID4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3BpbmxvY2suaDogYXNtL3RpY2tldF9z
cGlubG9jay5oIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlLgo+ID4gPj4gYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9zcGlubG9jay5oOiBhc20vcXNwaW5sb2NrLmggaXMgaW5jbHVkZWQgbW9yZSB0
aGFuIG9uY2UuCj4gCj4gWWVzIGJ1dCB0aGF0J3MgaW4gYSAjaWZkZWYvI2VsaWYjZWxzZSBjbGF1
c2Ugc28gbm90aGluZyB0byBkbyBoZXJlIQoKVGhhbmtzIGZvciB0aGUgaW5mbywgd2Ugd2lsbCBm
aXggdGhlIGJvdC4gU29ycnkgZm9yIHRoZSBmYWxzZSBwb3NpdGl2ZSByZXBvcnQuCgo+IAo+ID4K
PiA+IHZpbSArMTAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zcGlubG9jay5oCj4gPgo+ID4gICAg
ICA4Cj4gPiAgICAgIDkgICNkZWZpbmUgX19ub19hcmNoX3NwaW5sb2NrX3JlZGVmaW5lCj4gPiAg
ID4gMTAgICNpbmNsdWRlIDxhc20vdGlja2V0X3NwaW5sb2NrLmg+Cj4gPiAgICAgMTEgICNpbmNs
dWRlIDxhc20vcXNwaW5sb2NrLmg+Cj4gPiAgICAgMTIgICNpbmNsdWRlIDxhc20vanVtcF9sYWJl
bC5oPgo+ID4gICAgIDEzCj4gPiAgICAgMTQgIC8qCj4gPiAgICAgMTUgICAqIFRPRE86IFVzZSBh
biBhbHRlcm5hdGl2ZSBpbnN0ZWFkIG9mIGEgc3RhdGljIGtleSB3aGVuIHdlIGFyZSBhYmxlIHRv
IHBhcnNlCj4gPiAgICAgMTYgICAqIHRoZSBleHRlbnNpb25zIHN0cmluZyBlYXJsaWVyIGluIHRo
ZSBib290IHByb2Nlc3MuCj4gPiAgICAgMTcgICAqLwo+ID4gICAgIDE4ICBERUNMQVJFX1NUQVRJ
Q19LRVlfVFJVRShxc3BpbmxvY2tfa2V5KTsKPiA+ICAgICAxOQo+ID4gICAgIDIwICAjZGVmaW5l
IFNQSU5MT0NLX0JBU0VfREVDTEFSRShvcCwgdHlwZSwgdHlwZV9sb2NrKSAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiAgICAgMjEgIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdHlwZSBhcmNoX3Nw
aW5fIyNvcCh0eXBlX2xvY2sgbG9jaykgICAgICAgICAgICAgIFwKPiA+ICAgICAyMiAgeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAo+ID4gICAgIDIzICAgICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5
KCZxc3BpbmxvY2tfa2V5KSkgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgMjQgICAgICAg
ICAgICAgICAgICByZXR1cm4gcXVldWVkX3NwaW5fIyNvcChsb2NrKTsgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ICAgICAyNSAgICAgICAgICByZXR1cm4gdGlja2V0X3NwaW5fIyNvcChs
b2NrKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgIDI2ICB9Cj4g
PiAgICAgMjcKPiA+ICAgICAyOCAgU1BJTkxPQ0tfQkFTRV9ERUNMQVJFKGxvY2ssIHZvaWQsIGFy
Y2hfc3BpbmxvY2tfdCAqKQo+ID4gICAgIDI5ICBTUElOTE9DS19CQVNFX0RFQ0xBUkUodW5sb2Nr
LCB2b2lkLCBhcmNoX3NwaW5sb2NrX3QgKikKPiA+ICAgICAzMCAgU1BJTkxPQ0tfQkFTRV9ERUNM
QVJFKGlzX2xvY2tlZCwgaW50LCBhcmNoX3NwaW5sb2NrX3QgKikKPiA+ICAgICAzMSAgU1BJTkxP
Q0tfQkFTRV9ERUNMQVJFKGlzX2NvbnRlbmRlZCwgaW50LCBhcmNoX3NwaW5sb2NrX3QgKikKPiA+
ICAgICAzMiAgU1BJTkxPQ0tfQkFTRV9ERUNMQVJFKHRyeWxvY2ssIGJvb2wsIGFyY2hfc3Bpbmxv
Y2tfdCAqKQo+ID4gICAgIDMzICBTUElOTE9DS19CQVNFX0RFQ0xBUkUodmFsdWVfdW5sb2NrZWQs
IGludCwgYXJjaF9zcGlubG9ja190KQo+ID4gICAgIDM0Cj4gPiAgICAgMzUgICNlbGlmIGRlZmlu
ZWQoQ09ORklHX1JJU0NWX1FVRVVFRF9TUElOTE9DS1MpCj4gPiAgICAgMzYKPiA+ICAgICAzNyAg
I2luY2x1ZGUgPGFzbS9xc3BpbmxvY2suaD4KPiA+ICAgICAzOAo+ID4gICAgIDM5ICAjZWxzZQo+
ID4gICAgIDQwCj4gPiAgID4gNDEgICNpbmNsdWRlIDxhc20vdGlja2V0X3NwaW5sb2NrLmg+Cj4g
PiAgICAgNDIKPiA+Cj4gPiAtLQo+ID4gMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2VydmljZQo+ID4g
aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy93aWtpCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
