Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E453AC02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEWhSJvt371deICGL07HwxTsNuWS52pZhrF1I70HcoE=; b=QRADnFN9msrrVx
	bEY9lzfkPAfb+x9yLsLrjNtNzU+SKu8KEJ7q/K2QZqU7aDllHcQdaceJ6tp1ay7w6UE635M0uSl5L
	7xhvhLdEbIbu99KFm82kBkrVgEjzyA2y5cZ2dl1bMx7VVJKiBWNKwgVFhLvUbPhlKgQvsYm4HMNuy
	l9maX9ukn+z9XEcnBTDyM03/lnm/wlXnJ1br3kWi8jmVGOm3MlnVM14/DYqDPuPOyuucOWXBEyCEy
	/nW8ornGXSMLvPX43bCpuW1uhqso9MnjqZ+6At/5qbpiZYEXl85iBKaKuGa0JnMqMEGHo1Cu1Pzsc
	5TlO1oaVWzCntm0TyHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1Sh-00000006KL9-0qkn;
	Thu, 06 Feb 2025 12:58:31 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1Sd-00000006KJw-47UV;
	Thu, 06 Feb 2025 12:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738846708; x=1770382708;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Ali9KIyuf9qAG4O8RAl7dDwQG2IvPt23GGSv0cQQKSE=;
  b=GyS8EpfdToRe50BUNoBTc1jVElwf8OjkckufbsUcnatJfAJkluPujV3w
   2dhHjLXO3HTV1vbVhEx7ynC1sBzH0X2QGQC6tVGAHVnQ+t6gCN2lr/XDi
   PmzZWHPGButUwgsNEnCPTMiLme4L2DDzVrWzOd7XsEUu0ASby6fDyWOVD
   nd6v1p7v2z2n+ZoYjGnTci1XonML5fd72kaTSzZ2zIRsRq1FYSCjso2wB
   i2GJo0GjEV+JOPO3QdUWSaLNxORPxyK4AWhZddDbYsdFp0EecgOIngzQ3
   Kjh+T4ggYoTq6tSj6MCmNruT8iqSCGA3nZ3SFMJY0rkJTUBEcl0eETSnD
   A==;
X-CSE-ConnectionGUID: 6USRI3pYRMW2oRXKoEqdng==
X-CSE-MsgGUID: sgUjd6c1RomD0kPFAljBWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42281984"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="42281984"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 04:58:25 -0800
X-CSE-ConnectionGUID: ttN44p78Spuc2cv8ztNT0Q==
X-CSE-MsgGUID: 7tLQslnWQRiHeKlxYMZmMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111030285"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 04:58:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 04:58:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 04:58:22 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 04:58:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMxckqGEL/bR0I31J2oPbUYgDxOFYKXlY2OzbKiGc2EISsof/A+UnH2/HFcVCWVbn74jc7SUmmnUDlNkP+NsJgz2lG949w4LiBBn19ykwxejoZnj2bAiAfv9f+NodI488R+NOb9jqZ1rXjQsoddBFP5RpBaOd1kwAe0sFvLKzhqssh8JUKEUi05I07bqiX57eTgZFG4xA+aUcH7pUlDKgJ/cXckSG5QiV9YW4DfzD0mXxfKIDoj4EonSKIeuqWZUYqqhOnmlGwtYPo/ERboZB4WX0U72CdyfPNYcwPojEiaNmHXlz4bPFksIs3w8GjsNSc6bXj0ZO4LvSaWm9d0FUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PQtbDOswEvWlnfSu7y84F88uLmn8i2rk+bytGB5RBQ=;
 b=QdIX6NE1Yb4A7ruMLzRuuwhUf6iq7ailGizUVPLpPN66MyB/QZI8XsvMU82d277Y/7AgDHBy232eGccKZAASuEgG+IIK4Sm+8YyXe5lNdXiLQfgkaJxLYYsk6p7HTsFEamc0HslNhl3LXJgAgHSYz3CMkkCY/rQK2dyBkVVJwOy55zfnFqd4I/gIaZuqbIk2SGftBLjkMuqzTQRZ5A8a5jMO1O8Hb50thz8HBZl4tMoBhb5MwUDv0XFovQUstUB1DTWJ5TGiWFnR6OtseGh0BGWdf+DoxqmIZAAVzFPo6B+ItH1uelo32iovqBQYYHvM4IYdbzRT6Vpmm13FgLICbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) by
 SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 12:58:06 +0000
Received: from DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5]) by DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 12:58:06 +0000
Date: Thu, 6 Feb 2025 13:57:33 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: <luto@kernel.org>, <xin@zytor.com>, <kirill.shutemov@linux.intel.com>,
	<palmer@dabbelt.com>, <tj@kernel.org>, <brgerst@gmail.com>,
	<ardb@kernel.org>, <dave.hansen@linux.intel.com>, <jgross@suse.com>,
	<will@kernel.org>, <akpm@linux-foundation.org>, <arnd@arndb.de>,
	<corbet@lwn.net>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<ytcoode@gmail.com>, <tglx@linutronix.de>, <hpa@zytor.com>,
	<seanjc@google.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<justinstitt@google.com>, <jason.andryuk@amd.com>, <glider@google.com>,
	<ubizjak@gmail.com>, <jannh@google.com>, <bhe@redhat.com>,
	<vincenzo.frascino@arm.com>, <rafael.j.wysocki@intel.com>,
	<ndesaulniers@google.com>, <mingo@redhat.com>, <catalin.marinas@arm.com>,
	<junichi.nomura@nec.com>, <nathan@kernel.org>, <ryabinin.a.a@gmail.com>,
	<dennis@kernel.org>, <bp@alien8.de>, <kevinloughlin@google.com>,
	<morbo@google.com>, <dan.j.williams@intel.com>,
	<julian.stecklina@cyberus-technology.de>, <peterz@infradead.org>,
	<cl@linux.com>, <kees@kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 01/15] kasan: Allocation enhancement for dense tag-based
 mode
Message-ID: <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd3sP1_x2c5FvztA6LzsBY3Fq3cD5cJ6FQ+FAnmawe06Q@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CA+fCnZd3sP1_x2c5FvztA6LzsBY3Fq3cD5cJ6FQ+FAnmawe06Q@mail.gmail.com>
X-ClientProxiedBy: DB9PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::27) To DM4PR11MB6239.namprd11.prod.outlook.com
 (2603:10b6:8:a7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6239:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f61d69c-7158-4439-4902-08dd46ade5fa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3ZzUU5wK2xLa1dPZmpYNFR6OXZMOVZGZ093WXFaMGx0ekxLRCtDL0FvTXZw?=
 =?utf-8?B?ZStIdHovbHY3NXJoSTAyTDA4dkVRb2JZMlIwRUl5SGN0eS93ZC80U0JNRTk5?=
 =?utf-8?B?a2VGM2d6Y1JYcVduU2p3QmlkTGpKNnhwbW5TeVpXYmF1SHoveWlJb3FweUVn?=
 =?utf-8?B?Ri9Pd09TaERxZFIzVGwxVzJXTThsOXJUOGtKNW5IQUZsUUIvMkRWWm1pM2NH?=
 =?utf-8?B?OTlZTVBlMSs1UGpJVll4dEhxSGdrKzlxc3pDWUZUY0RhN29KeEl0MDY5dW9Y?=
 =?utf-8?B?SktDaC96N0dtNEpUYlhUdzUrY1h0UkpPS3FJWDFVTGw4ZTJZMDNvTWhTLzhM?=
 =?utf-8?B?azczaHQwU21OeWIyZHZpTmQvWGlCMFFtRUpCWUFxYjNTVnY4UGc5R3liQkRx?=
 =?utf-8?B?bU16T1cyODFUWHlPa3phQUViWmZGb3ltbngyZmo0RFZ2WUw0b3o0aElqdk5E?=
 =?utf-8?B?WnZ3eXBiWHpyVnZXaU8wWGdZT3RISGRRckk4MEhUMzF3SC81MkgzVk1vNUFE?=
 =?utf-8?B?d3BBRmVvYUQ3SmtDMnl2NWdmQUJMTUlMdkZ5VjJxbGUxa3VSaU5zR1hQTDMw?=
 =?utf-8?B?UDY0YVdUWVFkZjR3NGZSTUw5aWdseUZNSndnQWJwOUVaTmRlM2xqT0RIaEZp?=
 =?utf-8?B?YTVhenIxc3ZZODZ6ckJodHdWbGxlMXZCVldSZnVIcUVFdkdsekJJNGZGWFh1?=
 =?utf-8?B?NWJqc01HU25QL0Zid3ZlZlNCWkhkOFJPWE14UGp6Q2xvck1qQTF6QUtibmRv?=
 =?utf-8?B?UEJmMDd3NFloR3RTdFAzZ28rdktnL0V0RTFmaEZjTnRNTUtveDFqWFFXNjFo?=
 =?utf-8?B?QmpQR001L0JmeUdkY25zSkZGcy9GL1NQUng5dDlPNWQzMlR4WFRBK0ZEMjdD?=
 =?utf-8?B?cDJxcWlIRVBDczAxV1dTeGV2K1lRZ0RFNGE2T3IvMTdkbEZoTkx5YXZQc1FH?=
 =?utf-8?B?cTFpd2dWbnNpOWl3OWZQNWVjNzNsNktUd2hsbU5yaWJWaVc5NzkzWEE0bUxL?=
 =?utf-8?B?cGk1WHVDbFg0dm0wWHIwNUlQOThVQm0rZjNYZGp2c29KSEFneXV1UGErU0RM?=
 =?utf-8?B?eWw4ZGlseTVMQkFyRTEvVFJ2b2lwZVhGdzJjUXFEOU15bENZR2d4MC9ETWUx?=
 =?utf-8?B?TzJVbm5XL1dXY1I0OGk0ZElTRE5qMjNmeldUQkEyY3pIb3lLSnYxMlE4KzF5?=
 =?utf-8?B?MjNiT3FiSEU5SlVOTmR4ZVhMcmVSb096MDh1eU5LWHp1dFhLamhjRTBmUlJ5?=
 =?utf-8?B?azA2L1FnejdlTjdwM1I5c3d0THAzYjhXZVIxQlRuamcrS0hqYU5qbGJvc3R6?=
 =?utf-8?B?cGsxWWdEbWtnYjEvaWx6RUxSM1BRVUtERFAvZ215Q2YzbnpBOVYyeFR5RzRL?=
 =?utf-8?B?Mjh4YzNaNWdhOEVGazJ5QlRSUDJjOThYN1FzbWl6VDlDYVZ0UXA2UU05WXpY?=
 =?utf-8?B?UUY1dUw0NVRkblY3blRoMkNQTFF5TVdybEwvanRpTWg5TU5jQU1na1MySmJa?=
 =?utf-8?B?M280ZEdUaDloWFk3NUVYVERhOTc5Y0ZhZUFWT0Y4dGg3bkZEa3N6bkVvdlAx?=
 =?utf-8?B?c3REdG1wTkl1eWt2QThHRjFLMkVEQVN3UFdzSTRTUjdmNjR0OU43UTJ3bG95?=
 =?utf-8?B?dDlyY3lpQVBNTGQzYVJMdzM1MjA2K0FTRkFqV2xXNDdkYjRZcDVjOXBGQjBv?=
 =?utf-8?B?emVoQUJaYXhOWkNTK2h2MWF5VnR0ZTZWYjJtYTMwNEkyUm5adUxnZHhnSllJ?=
 =?utf-8?B?QWxDYmtUc1o2UE5EZlVCMkx3L1dUMkh2WFFXNllHVVdhL3dkNVYraHVEUFdX?=
 =?utf-8?B?SlpjazBnQUhSZjYxQlVQbEtsayt3cU01Y2RLNk9BazJ2K0RQZVRPN1JIbEFo?=
 =?utf-8?Q?xNS6UoHwZYJl9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6239.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1I1NGhjMXZjT2JHRkdQdWR4OVdYcm12bjBKSU9VZGszci96c20wcUlFYlJu?=
 =?utf-8?B?dUlZS3gvNzFqdTRPS0FnNmttd2Z5T0JST0ZSU2JUQ054L2VNS3k0TWlZSFJW?=
 =?utf-8?B?bU9Lelk2OXlodE0xZWw5RDJhZGt0bWR5TUhGTExRSUNGeThUMnBPejI5T1ZU?=
 =?utf-8?B?ZWlxN2ZoQm4zelY1NDRhS0x1aWsvQjBIZGQxSDhmb2Z1KzFXdUpKOTBWS0NC?=
 =?utf-8?B?NnRjekxFUWhXV0FMSXBOMlBMUmRtc3g3MFJVZXlrNGdmZjlpdmQvZXU1eEc4?=
 =?utf-8?B?dFdNY2hqU1NWaVNKS2JsYTZ5ei9VRTJJMVhOS1NJNFJxRG9KYVRLWVJWRXJn?=
 =?utf-8?B?VXhjcFNIeFZvZThDQW9iTzQxaUtTZnRyM3hTQllWTHFqeFdqem9nWTkyUlpl?=
 =?utf-8?B?YWJhaGJFVG5ERWFlOHRSeThTRFBsTWpqbTlGR01rL0N6MW1lSzd3Zng0b2NQ?=
 =?utf-8?B?MVRMbGdPViszSUFiSDJmYTBkVWE0czMwaDVJL2U0cGVadjAzTTNHaFE3WGJn?=
 =?utf-8?B?SGNwdlNvUGlCbDJicjZUQVEwZzBmc25tZE9VbWI0QXF5ZStkMURZakVISVpS?=
 =?utf-8?B?anVpT0RZZnZVZ09HMFFhL29TcjNMU0xUQU9nL1hDMkdYait1aFY1UTBsM0x5?=
 =?utf-8?B?MUFnUXh6MjgrVWMzeTk5bHdVU1VGQnR5WFhlNlAvR1FPR3ZRT3cvWHVvVGtP?=
 =?utf-8?B?c3VaRzhleW1xQlhpc3R4NWNRNTRIV3FTZEN6Q20rcUcvaGo1S2pPZFM0NGtZ?=
 =?utf-8?B?UGcxL0dJMEpjU0NTTWVvWEVZZWliQjZ0ZEhOQzVzeklpVmpBUXJweVFtQklx?=
 =?utf-8?B?VFNFSWdOOHdwTVo1ZXlWSnRWRDFRTDdIS3ZVQ3lKUmQ4NWRIN2VNSThlNjB6?=
 =?utf-8?B?aSszanllTFBwY1A2dU84bTROODdUcDZxaktkNk81RGd1bFNhUXVEakFDQldL?=
 =?utf-8?B?YlhaeC9zSkhHNmRSQU5TZTl4NmtTcTU1aHgydncramMrV2Yvcyt5ZzE1OVps?=
 =?utf-8?B?cHhORjRCMUpna1pYNFlicEZSZW9IVFNnME90a3NNZ0xjQTJmNmVnVmcvRHEz?=
 =?utf-8?B?QXJ4MDVtOGNJVGVIb3c1aFhhS0dXcDNJZzRESTV6ZTJsa0NzQ1U2VjNpYTBH?=
 =?utf-8?B?WjloejQwcTNIMVRDbXRJZ1FnUnpvZnZIN3poRkJrZGMveHNkb3R5cnEyeHI1?=
 =?utf-8?B?WjB0a3d5K3YyOHg3UWsrVUFDTXRZK2pBdm0zVmZUeVpSZHZqRXNyNEhaUEg5?=
 =?utf-8?B?M25oTVBtaS9yQ3VSejkxU0N0MFZjN1hweHJ6bEtpYzZnWUlZN1dFY3ovc2xw?=
 =?utf-8?B?eUlRSERnTkVKWXhrNkZIUlhzUlBFNjB3QmdGQzVmZUI3WG10djRMT1ViSUU5?=
 =?utf-8?B?VWxqRDEvMzJMTXYvaE5rZDk1UUVINWs5MW5QK3F5WUcrd0NLOW1jTUVDRWNp?=
 =?utf-8?B?VWVlczFmNmJ1Yng5ZUVRZFFiM2VYMFR5Vzl6YjJkajNMc3ZRcU4vN0g0cWJm?=
 =?utf-8?B?RDk5cEt2dm1naHlzcHRUV1J4T3kzL1l6Y1NtbnRBek9YYWRjNGpPS1NmUVQy?=
 =?utf-8?B?eUs3S2VDMEFNZURKclVNeFZXN2pRTFl0Z2tlcHBZNkY5bHBzeTVlak5zSGV5?=
 =?utf-8?B?VlNoRjdrRHM4LzJ4SWYvSVJWdlduUFVROUdIRC9lVU1zVW1XTU5QTUxITCsw?=
 =?utf-8?B?Y0VwSzlOT2NsZjhyaE04eWhqVE1PSnVBaWtnN0lzMndLZUlYWmJiTE9NOVg0?=
 =?utf-8?B?TTY4VkZrVmlVZ0ErblBQNlg3RjUvRG84SUYycUg3WFUyWUNtYTBYVUFLU3d3?=
 =?utf-8?B?WklZK0pGOWhQdmJMR09Md05CaEswT0pzN2JLT0FBUjZtREh6MDlNWER1Y0Nm?=
 =?utf-8?B?QVcxOTNTNi9NekRTWWpPTWdmeUdkSnovTEFSY0dhQU82RWtLcVRSbzFUSHBy?=
 =?utf-8?B?bXUzaUJnc3Rta1hDUWdheWNIWGFqWi9VQmprMWtPbkRMQUNGOVRpbDZiWTJo?=
 =?utf-8?B?Vk5WWWV3OFdyak9lYVZtUlJqRWE5OEN4dEpJLytwQVExZ2J2bE9XRjdNbzFn?=
 =?utf-8?B?SW1rUmFJNFhlT2JGNEVMb1dCSWYwWlUyNVJ6dUJCcjdUSzBSWFZMY3hGYmFY?=
 =?utf-8?B?ajZsZjdPTFVJM0FGWWJUWitscGc5ZHJuTmV0Z1FpVkJwRlNiVy9NeSt6L01O?=
 =?utf-8?Q?icNptX48dzWiD2B8/y2xlOQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f61d69c-7158-4439-4902-08dd46ade5fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 12:58:06.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCJZ9Ci/6SmfQb0nmcwnv7xPL1zaIV/JoLbMQIXOb4yV+fxU1D1D6F6hAPK0/b692M5+Z8Zhmzut4gnTj2F+e11gfDmmdw/LdBYb1BqtuBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_045828_039535_CEF04C04 
X-CRM114-Status: GOOD (  16.98  )
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

T24gMjAyNS0wMi0wNiBhdCAwMDo0Mzo0NiArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pk9uIFR1ZSwgRmViIDQsIDIwMjUgYXQgNjozNOKAr1BNIE1hY2llaiBXaWVjem9yLVJldG1hbgo+
PG1hY2llai53aWVjem9yLXJldG1hbkBpbnRlbC5jb20+IHdyb3RlOgo+Pgo+PiBUYWctYmFzZWQg
S0FTQU4gKG9uIGFybTY0KSB3b3JrcyBieSBnZW5lcmF0aW5nIGEgcmFuZG9tIDgtYml0IHRhZyBh
bmQKPj4gcHV0dGluZyBpdCBpbiBib3RoIHRoZSB0b3AgYnl0ZSBvZiB0aGUgcG9pbnRlciAodGhh
dCBwb2ludHMgdG8gdGhlCj4+IGFsbG9jYXRlZCBtZW1vcnkpIGFuZCBpbnRvIGFsbCBieXRlcyBv
ZiBzaGFkb3cgbWVtb3J5IHRoYXQgY29ycmVzcG9uZCB0bwo+PiB0aGUgY2h1bmsgb2YgYWxsb2Nh
dGVkIHJlZ3VsYXIgbWVtb3J5LiBFYWNoIGJ5dGUgb2Ygc2hhZG93IG1lbW9yeSBjb3ZlcnMKPj4g
YSAxNiBieXRlIGNodW5rIG9mIGFsbG9jYXRlZCBtZW1vcnkgLSBhIHZhbHVlIGNhbGxlZCBLQVNB
TiBncmFudWxhcml0eS4KPj4gVGhpcyBtZWFucyB0aGF0IG91dC1vZi1ib3VuZHMgbWVtb3J5IGFj
Y2Vzc2VzIHRoYXQgaGFwcGVuIGluc2lkZSB0aGUgMTYKPj4gYnl0ZXMgY2FuJ3QgYmUgY2F1Z2h0
Lgo+Pgo+PiBUaGUgZGVuc2UgbW9kZSBvZmZlcnMgcmVkdWNpbmcgdGhlIHRhZyB3aWR0aCBmcm9t
IDggdG8gNCBiaXRzIGFuZAo+PiBzdG9yaW5nIHR3byB0YWdzIGluIG9uZSBieXRlIG9mIHNoYWRv
dyBtZW1vcnkgLSBvbmUgaW4gdGhlIHVwcGVyIDQgYml0cwo+PiBvZiB0aGUgYnl0ZSBhbmQgb25l
IGluIHRoZSBsb3dlciA0LiBUaGlzIHdheSBvbmUgYnl0ZSBvZiBzaGFkb3cgbWVtb3J5Cj4+IGNh
biBjb3ZlciAzMiBieXRlcyBvZiBhbGxvY2F0ZWQgbWVtb3J5IHdoaWxlIHN0aWxsIGtlZXBpbmcg
dGhlICIxNiBieXRlcwo+PiBwZXIgb25lIHRhZyIgZ3JhbnVsYXJpdHkuIFRoZSBsb3dlciA0IGJp
dHMgb2YgZWFjaCBzaGFkb3cgYnl0ZSBtYXAgYnl0ZXMKPj4gb2YgbWVtb3J5IHdpdGggb2Zmc2V0
cyAwLTE1IGFuZCB0aGUgdXBwZXIgNCBiaXRzIG1hcCBvZmZzZXRzIDE2LTMxLgo+Pgo+PiBFeGFt
cGxlOgo+PiBUaGUgZXhhbXBsZSBiZWxvdyBzaG93cyBob3cgdGhlIHNoYWRvdyBtZW1vcnkgbG9v
a3MgbGlrZSBhZnRlcgo+PiBhbGxvY2F0aW5nIDQ4IGJ5dGVzIG9mIG1lbW9yeSBpbiBib3RoIG5v
cm1hbCB0YWctYmFzZWQgbW9kZSBhbmQgdGhlCj4+IGRlbnNlIG1vZGUuIFRoZSBjb250ZW50cyBv
ZiBzaGFkb3cgbWVtb3J5IGFyZSBvdmVybGFpZCBvbnRvIGFkZHJlc3MKPj4gb2Zmc2V0cyB0aGF0
IHRoZXkgcmVsYXRlIHRvIGluIHRoZSBhbGxvY2F0ZWQga2VybmVsIG1lbW9yeS4gRWFjaCBjZWxs
Cj4+IHwgICAgfCBzeW1ib2xpemVzIG9uZSBieXRlIG9mIHNoYWRvdyBtZW1vcnkuCj4+Cj4+ID0g
VGhlIHJlZ3VsYXIgdGFnIGJhc2VkIG1vZGU6Cj4+IC0gUmFuZG9tbHkgZ2VuZXJhdGVkIDgtYml0
IHRhZyBlcXVhbHMgMHhBQi4KPj4gLSAweEZFIGlzIHRoZSB0YWcgdGhhdCBzeW1ib2xpemVzIHVu
YWxsb2NhdGVkIG1lbW9yeS4KPj4KPj4gU2hhZG93IG1lbW9yeSBjb250ZW50czogICAgICAgICAg
IHwgIDB4QUIgIHwgIDB4QUIgIHwgIDB4QUIgIHwgIDB4RkUgIHwKPj4gU2hhZG93IG1lbW9yeSBh
ZGRyZXNzIG9mZnNldHM6ICAgIDAgICAgICAgIDEgICAgICAgIDIgICAgICAgIDMgICAgICAgIDQK
Pj4gQWxsb2NhdGVkIG1lbW9yeSBhZGRyZXNzIG9mZnNldHM6IDAgICAgICAgIDE2ICAgICAgIDMy
ICAgICAgIDQ4ICAgICAgIDY0Cj4+Cj4+ID0gVGhlIGRlbnNlIHRhZyBiYXNlZCBtb2RlOgo+PiAt
IFJhbmRvbWx5IGdlbmVyYXRlZCA0LWJpdCB0YWcgZXF1YWxzIDB4Qy4KPj4gLSAweEUgaXMgdGhl
IHRhZyB0aGF0IHN5bWJvbGl6ZXMgdW5hbGxvY2F0ZWQgbWVtb3J5Lgo+Pgo+PiBTaGFkb3cgbWVt
b3J5IGNvbnRlbnRzOiAgICAgICAgICAgfDB4QyAweEMgfDB4QyAweEUgfDB4RSAweEUgfDB4RSAw
eEUgfAo+PiBTaGFkb3cgbWVtb3J5IGFkZHJlc3Mgb2Zmc2V0czogICAgMCAgICAgICAgMSAgICAg
ICAgMiAgICAgICAgMyAgICAgICAgNAo+PiBBbGxvY2F0ZWQgbWVtb3J5IGFkZHJlc3Mgb2Zmc2V0
czogMCAgICAgICAgMzIgICAgICAgNjQgICAgICAgOTYgICAgICAgMTI4Cj4+Cj4+IEFkZCBhIG5l
dyBjb25maWcgb3B0aW9uIGFuZCBkZWZpbmVzIHRoYXQgY2FuIG92ZXJyaWRlIHRoZSBzdGFuZGFy
ZAo+PiBzeXN0ZW0gb2Ygb25lIHRhZyBwZXIgb25lIHNoYWRvdyBieXRlLgo+Pgo+PiBBZGQgYWx0
ZXJuYXRpdmUgdmVyc2lvbiBvZiB0aGUga2FzYW5fcG9pc29uKCkgdGhhdCBkZWFscyB3aXRoIHRh
Z3Mgbm90Cj4+IGJlaW5nIGFsaWduZWQgdG8gYnl0ZSBzaXplIGluIHNoYWRvdyBtZW1vcnkuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IE1hY2llaiBXaWVjem9yLVJldG1hbiA8bWFjaWVqLndpZWN6b3It
cmV0bWFuQGludGVsLmNvbT4KPj4gLS0tCj4+ICBpbmNsdWRlL2xpbnV4L2thc2FuLmggfCAxOCAr
KysrKysrKysrKysrKysrKysKPj4gIGxpYi9LY29uZmlnLmthc2FuICAgICB8IDIxICsrKysrKysr
KysrKysrKysrKysrKwo+PiAgbW0va2FzYW4va2FzYW4uaCAgICAgIHwgIDQgKy0tLQo+PiAgbW0v
a2FzYW4vc2hhZG93LmMgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
Cj4+ICA0IGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2thc2FuLmggYi9pbmNsdWRlL2xpbnV4L2th
c2FuLmgKPj4gaW5kZXggMDNiNDQwNjU4ODE3Li5lYTBmNWFjZDg3NWIgMTAwNjQ0Cj4+IC0tLSBh
L2luY2x1ZGUvbGludXgva2FzYW4uaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2thc2FuLmgKPj4g
QEAgLTM1LDYgKzM1LDI0IEBAIHR5cGVkZWYgdW5zaWduZWQgaW50IF9fYml0d2lzZSBrYXNhbl92
bWFsbG9jX2ZsYWdzX3Q7Cj4+Cj4+ICAvKiBTb2Z0d2FyZSBLQVNBTiBpbXBsZW1lbnRhdGlvbnMg
dXNlIHNoYWRvdyBtZW1vcnkuICovCj4+Cj4+ICsjaWZkZWYgQ09ORklHX0tBU0FOX1NXX1RBR1Nf
REVOU0UKPj4gKyNkZWZpbmUgS0FTQU5fR1JBTlVMRV9TSElGVCAgICAoS0FTQU5fU0hBRE9XX1ND
QUxFX1NISUZUIC0gMSkKPj4gKyNkZWZpbmUgS0FTQU5fU0hBRE9XX1NDQUxFX1NJWkUgICAgICAg
ICgxVUwgPDwgS0FTQU5fU0hBRE9XX1NDQUxFX1NISUZUKQo+PiArc3RhdGljIGlubGluZSB1OCBr
YXNhbl9kZW5zZV90YWcodTggdGFnKQo+PiArewo+PiArICAgICAgIHJldHVybiAodGFnIDw8IEtB
U0FOX1RBR19XSURUSCB8IHRhZyk7Cj4+ICt9Cj4+ICsjZWxzZQo+PiArI2RlZmluZSBLQVNBTl9H
UkFOVUxFX1NISUZUICAgIEtBU0FOX1NIQURPV19TQ0FMRV9TSElGVAo+PiArI2RlZmluZSBLQVNB
Tl9TSEFET1dfU0NBTEVfU0laRSAgICAgICAgKDFVTCA8PCBLQVNBTl9HUkFOVUxFX1NISUZUKQo+
PiArc3RhdGljIGlubGluZSB1OCBrYXNhbl9kZW5zZV90YWcodTggdGFnKQo+PiArewo+PiArICAg
ICAgIHJldHVybiB0YWc7Cj4+ICt9Cj4+ICsjZW5kaWYKPj4gKwo+PiArI2RlZmluZSBLQVNBTl9H
UkFOVUxFX1NJWkUgICAgICgxVUwgPDwgS0FTQU5fR1JBTlVMRV9TSElGVCkKPj4gKwo+Cj5JcyB0
aGVyZSBhIHJlYXNvbiB0aGVzZSBkZWZpbml0aW9ucyBhcmUgYWRkZWQgdG8KPmluY2x1ZGUvbGlu
dXgva2FzYW4uaD8gQXQgbGVhc3Qgd2l0aGluIHRoaXMgcGF0Y2gsIHRoZXkgYXJlIG9ubHkgdXNl
ZAo+d2l0aGluIG1tL2thc2FuLCBzbyBsZXQncyBrZWVwIHRoZW0gaW4gbW0va2FzYW4va2FzYW4u
aC4KClBhcnRzIG9mIHg4NiBhcmNoIHVzZSB0aGVzZSBsYXRlciAobWluaW1hbCBzbGFiIGFsaWdu
bWVudCwga2FzYW4gc2hhZG93IHN0YXJ0CmFkZHJlc3MpIHNvIEkgdGhvdWdodCBpdCB3YXMgY29u
dmVuaWVudCB0byBhbHJlYWR5IGhhdmUgaXQgaW4gcGxhY2UgaGVyZT8KClNpbmNlIEknbGwgYmUg
cmVvcmRlcmluZyBwYXRjaGVzIEkgY2FuIGp1c3QgbW92ZSB0aGVzZSBjaGFuZ2VzIHRvZ2V0aGVy
LgoKPgo+PiAgI2lmZGVmIENPTkZJR19LQVNBTl9TV19UQUdTCj4+ICAvKiBUaGlzIG1hdGNoZXMg
S0FTQU5fVEFHX0lOVkFMSUQuICovCj4+ICAjZGVmaW5lIEtBU0FOX1NIQURPV19JTklUIDB4RkUK
Pj4gZGlmZiAtLWdpdCBhL2xpYi9LY29uZmlnLmthc2FuIGIvbGliL0tjb25maWcua2FzYW4KPj4g
aW5kZXggOTgwMTZlMTM3YjdmLi5kMDhiNGU5YmY0NzcgMTAwNjQ0Cj4+IC0tLSBhL2xpYi9LY29u
ZmlnLmthc2FuCj4+ICsrKyBiL2xpYi9LY29uZmlnLmthc2FuCj4+IEBAIC0xOSw2ICsxOSwxMyBA
QCBjb25maWcgQVJDSF9ESVNBQkxFX0tBU0FOX0lOTElORQo+PiAgICAgICAgICAgRGlzYWJsZXMg
Ym90aCBpbmxpbmUgYW5kIHN0YWNrIGluc3RydW1lbnRhdGlvbi4gU2VsZWN0ZWQgYnkKPj4gICAg
ICAgICAgIGFyY2hpdGVjdHVyZXMgdGhhdCBkbyBub3Qgc3VwcG9ydCB0aGVzZSBpbnN0cnVtZW50
YXRpb24gdHlwZXMuCj4+Cj4+ICtjb25maWcgQVJDSF9IQVNfS0FTQU5fU1dfVEFHU19ERU5TRQo+
PiArICAgICAgIGJvb2wKPj4gKyAgICAgICBoZWxwCj4+ICsgICAgICAgICBFbmFibGVzIG9wdGlv
biB0byBjb21waWxlIHRhZy1iYXNlZCBLQVNBTiB3aXRoIGRlbnNlbHkgcGFja2VkIHRhZ3MgLQo+
PiArICAgICAgICAgdHdvIDQtYml0IHRhZ3MgcGVyIG9uZSBieXRlIG9mIHNoYWRvdyBtZW1vcnku
IFNldCBvbiBhcmNoaXRlY3R1cmVzCj4+ICsgICAgICAgICB0aGF0IGhhdmUgNC1iaXQgdGFnIG1h
Y3Jvcy4KPj4gKwo+PiAgY29uZmlnIENDX0hBU19LQVNBTl9HRU5FUklDCj4+ICAgICAgICAgZGVm
X2Jvb2wgJChjYy1vcHRpb24sIC1mc2FuaXRpemU9a2VybmVsLWFkZHJlc3MpCj4+Cj4+IEBAIC0y
MjMsNCArMjMwLDE4IEBAIGNvbmZpZyBLQVNBTl9FWFRSQV9JTkZPCj4+ICAgICAgICAgICBib290
IHBhcmFtZXRlciwgaXQgd2lsbCBhZGQgOCAqIHN0YWNrX3Jpbmdfc2l6ZSBieXRlcyBvZiBhZGRp
dGlvbmFsCj4+ICAgICAgICAgICBtZW1vcnkgY29uc3VtcHRpb24uCj4+Cj4+ICtjb25maWcgS0FT
QU5fU1dfVEFHU19ERU5TRQo+PiArICAgICAgIGJvb2wgIlR3byA0LWJpdCB0YWdzIGluIG9uZSBz
aGFkb3cgbWVtb3J5IGJ5dGUiCj4+ICsgICAgICAgZGVwZW5kcyBvbiBLQVNBTl9TV19UQUdTCj4+
ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX0hBU19LQVNBTl9TV19UQUdTX0RFTlNFCj4KPkkgdGhp
bmsgdGhpcyBzaG91bGQgYWxzbyBkZXBlbmQgb24gS0FTQU5fT1VUTElORTogQ2xhbmcvR0NDIGFy
ZW4ndAo+YXdhcmUgb2YgdGhlIGRlbnNlIG1vZGUuCgpJIHdhc24ndCBzdXJlIEkgZnVsbHkgdW5k
ZXJzdG9vZCBob3cgaW5saW5lL291dGxpbmUgaW50ZXJhY3RzIHdpdGggY2xhbmcvZ2NjIG9uCng4
NiAoZXNwZWNpYWxseSB0aGF0IEkgdGhpbmsgc29tZSBwYXJ0cyBhcmUgc3RpbGwgbWlzc2luZyBp
biB4ODYgY2xhbmcgZm9yCnRhZy1iYXNlZCBLQVNBTikuIFNvIEkgdW5kZXJzdGFuZCB0aGF0IGNv
bXBpbGluZyB3aXRoIGlubGluZSBkb2Vzbid0IGRvCmFueXRoaW5nPyBJZiBzbywgaXMgaXQgbm90
IGRvaW5nIGFueXRoaW5nIGJlY2F1c2Ugb2YgbWlzc2luZyBjb21waWxlciBjb2RlIG9yCnNvbWV0
aGluZyBpbiB0aGUga2VybmVsPwoKPgo+PiArICAgICAgIGhlbHAKPj4gKyAgICAgICAgIEVuYWJs
ZXMgcGFja2luZyB0d28gdGFncyBpbnRvIG9uZSBzaGFkb3cgYnl0ZSB0byBoYWxmIHRoZSBtZW1v
cnkgdXNhZ2UKPj4gKyAgICAgICAgIGNvbXBhcmVkIHRvIG5vcm1hbCB0YWctYmFzZWQgbW9kZS4K
Pgo+QnV0IGFkZHMgc29tZSBwZXJmb3JtYW5jZSBpbXBhY3Q/CgpJIHRyaWVkIHRvIG1lYXN1cmUg
dGhlIHBlcmZvcm1hbmNlIGltcGFjdCBvZiBkZW5zZS9ub24tZGVuc2UgYnV0IGRpZG4ndCBzZWUg
bXVjaAptb3JlIHRoYW4gbm9pc2UgaW4gbXkgdGVzdHMuIEJ1dCBJJ2xsIG1lbnRpb24gdGhhdCB0
aGVyZSBpcyBzb21lIHNtYWxsCnBlcmZvcm1hbmNlIGltcGFjdCBkdWUgdG8gbW9yZSBiaXQgc2hp
ZnRzLgoKPgo+PiArCj4+ICsgICAgICAgICBBZnRlciBzZXR0aW5nIHRoaXMgb3B0aW9uLCB0YWcg
d2lkdGggbWFjcm8gaXMgc2V0IHRvIDQgYW5kIHNpemUgbWFjcm9zCj4+ICsgICAgICAgICBhcmUg
YWRqdXN0ZWQgYmFzZWQgb24gdXNlZCBLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQuCj4KPkkgdGhp
bmsgdGhpcyBwYXJhZ3JhcGggaXMgYW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIGFuZCB3ZSBjYW4g
ZHJvcCBpdC4KCk9rYXksIHdpbGwgZG8uCgo+Cj4+ICsKPj4gKyAgICAgICAgIEFSQ0hfSEFTX0tB
U0FOX1NXX1RBR1NfREVOU0UgaXMgbmVlZGVkIGZvciB0aGlzIG9wdGlvbiBzaW5jZSB0aGUKPj4g
KyAgICAgICAgIHNwZWNpYWwgdGFnIG1hY3JvcyBuZWVkIHRvIGJlIHByb3Blcmx5IHNldCBmb3Ig
NC1iaXQgd2lkZSB0YWdzLgo+PiArCj4+ICBlbmRpZiAjIEtBU0FOCj4+IGRpZmYgLS1naXQgYS9t
bS9rYXNhbi9rYXNhbi5oIGIvbW0va2FzYW4va2FzYW4uaAo+PiBpbmRleCA3MmRhNWRkY2NlYWEu
LjBlMDRjNWUyYzQwNSAxMDA2NDQKPj4gLS0tIGEvbW0va2FzYW4va2FzYW4uaAo+PiArKysgYi9t
bS9rYXNhbi9rYXNhbi5oCj4+IEBAIC0xMjgsOSArMTI4LDcgQEAgc3RhdGljIGlubGluZSBib29s
IGthc2FuX3JlcXVpcmVzX21ldGEodm9pZCkKPj4KPj4gICNlbmRpZiAvKiBDT05GSUdfS0FTQU5f
R0VORVJJQyAqLwo+Pgo+PiAtI2lmIGRlZmluZWQoQ09ORklHX0tBU0FOX0dFTkVSSUMpIHx8IGRl
ZmluZWQoQ09ORklHX0tBU0FOX1NXX1RBR1MpCj4+IC0jZGVmaW5lIEtBU0FOX0dSQU5VTEVfU0la
RSAgICAgKDFVTCA8PCBLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQpCj4+IC0jZWxzZQo+PiArI2lm
ZGVmIENPTkZJR19LQVNBTl9IV19UQUdTCj4+ICAjaW5jbHVkZSA8YXNtL210ZS1rYXNhbi5oPgo+
PiAgI2RlZmluZSBLQVNBTl9HUkFOVUxFX1NJWkUgICAgIE1URV9HUkFOVUxFX1NJWkUKPj4gICNl
bmRpZgo+PiBkaWZmIC0tZ2l0IGEvbW0va2FzYW4vc2hhZG93LmMgYi9tbS9rYXNhbi9zaGFkb3cu
Ywo+PiBpbmRleCBkNjIxMGNhNDhkZGEuLjM2ODUwM2Y1NGI4NyAxMDA2NDQKPj4gLS0tIGEvbW0v
a2FzYW4vc2hhZG93LmMKPj4gKysrIGIvbW0va2FzYW4vc2hhZG93LmMKPj4gQEAgLTEyMyw3ICsx
MjMsOCBAQCBFWFBPUlRfU1lNQk9MKF9faHdhc2FuX21lbWNweSk7Cj4+Cj4+ICB2b2lkIGthc2Fu
X3BvaXNvbihjb25zdCB2b2lkICphZGRyLCBzaXplX3Qgc2l6ZSwgdTggdmFsdWUsIGJvb2wgaW5p
dCkKPj4gIHsKPj4gLSAgICAgICB2b2lkICpzaGFkb3dfc3RhcnQsICpzaGFkb3dfZW5kOwo+PiAr
ICAgICAgIHU4ICpzaGFkb3dfc3RhcnQsICpzaGFkb3dfZW5kLCAqc2hhZG93X3N0YXJ0X2FsaWdu
ZWQsICpzaGFkb3dfZW5kX2FsaWduZWQsIHRhZzsKPj4gKyAgICAgICB1NjQgYWRkcjY0LCBhZGRy
X3N0YXJ0X2FsaWduZWQsIGFkZHJfZW5kX2FsaWduZWQ7Cj4+Cj4+ICAgICAgICAgaWYgKCFrYXNh
bl9hcmNoX2lzX3JlYWR5KCkpCj4+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4+IEBAIC0xMzQs
MTYgKzEzNSw0MiBAQCB2b2lkIGthc2FuX3BvaXNvbihjb25zdCB2b2lkICphZGRyLCBzaXplX3Qg
c2l6ZSwgdTggdmFsdWUsIGJvb2wgaW5pdCkKPj4gICAgICAgICAgKiBhZGRyZXNzZXMgdG8gdGhp
cyBmdW5jdGlvbi4KPj4gICAgICAgICAgKi8KPj4gICAgICAgICBhZGRyID0ga2FzYW5fcmVzZXRf
dGFnKGFkZHIpOwo+PiArICAgICAgIGFkZHI2NCA9ICh1NjQpYWRkcjsKPj4KPj4gLSAgICAgICBp
ZiAoV0FSTl9PTigodW5zaWduZWQgbG9uZylhZGRyICYgS0FTQU5fR1JBTlVMRV9NQVNLKSkKPj4g
KyAgICAgICBpZiAoV0FSTl9PTihhZGRyNjQgJiBLQVNBTl9HUkFOVUxFX01BU0spKQo+PiAgICAg
ICAgICAgICAgICAgcmV0dXJuOwo+PiAgICAgICAgIGlmIChXQVJOX09OKHNpemUgJiBLQVNBTl9H
UkFOVUxFX01BU0spKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Pgo+PiAgICAgICAgIHNo
YWRvd19zdGFydCA9IGthc2FuX21lbV90b19zaGFkb3coYWRkcik7Cj4+ICAgICAgICAgc2hhZG93
X2VuZCA9IGthc2FuX21lbV90b19zaGFkb3coYWRkciArIHNpemUpOwo+PiArICAgICAgIGFkZHJf
c3RhcnRfYWxpZ25lZCA9IHJvdW5kX3VwKGFkZHI2NCwgS0FTQU5fU0hBRE9XX1NDQUxFX1NJWkUp
Owo+PiArICAgICAgIGFkZHJfZW5kX2FsaWduZWQgPSByb3VuZF9kb3duKGFkZHI2NCArIHNpemUs
IEtBU0FOX1NIQURPV19TQ0FMRV9TSVpFKTsKPj4gKyAgICAgICBzaGFkb3dfc3RhcnRfYWxpZ25l
ZCA9IGthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilhZGRyX3N0YXJ0X2FsaWduZWQpOwo+PiAr
ICAgICAgIHNoYWRvd19lbmRfYWxpZ25lZCA9IGthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilh
ZGRyX2VuZF9hbGlnbmVkKTsKPj4gKwo+PiArICAgICAgIC8qIElmIHNpemUgaXMgZW1wdHkganVz
dCByZXR1cm4uICovCj4+ICsgICAgICAgaWYgKCFzaXplKQo+PiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+Pgo+PiAtICAgICAgIF9fbWVtc2V0KHNoYWRvd19zdGFydCwgdmFsdWUsIHNoYWRvd19l
bmQgLSBzaGFkb3dfc3RhcnQpOwo+PiArICAgICAgIC8qIE1lbXNldCB0aGUgZmlyc3QgdW5hbGln
bmVkIHRhZyBpbiBzaGFkb3cgbWVtb3J5LiAqLwo+PiArICAgICAgIGlmIChhZGRyNjQgJSBLQVNB
Tl9TSEFET1dfU0NBTEVfU0laRSkgewo+Cj5TbyB0aGlzIGlzIHJlcXVpcmVkLCBiZWNhdXNlIEtB
U0FOX1NIQURPV19TQ0FMRV9TSVpFIGlzIDMyIGJ1dCBtaW5pbWFsCj5zbGFiIGFsaWdubWVudCBp
cyBzdGlsbCBLQVNBTl9HUkFOVUxFX1NJWkUgPT0gMTYuLi4gV2Ugc2hvdWxkIGF0IGxlYXN0Cj5o
aWRlIHRoaXMgY2hlY2sgaXMgdW5kZXIgSVNfRU5BQkxFRChLQVNBTl9TV19UQUdTX0RFTlNFKS4K
Ci4uLgo+Cj4+ICsgICAgICAgICAgICAgICB0YWcgPSAqc2hhZG93X3N0YXJ0ICYgS0FTQU5fVEFH
X01BU0s7Cj4+ICsgICAgICAgICAgICAgICB0YWcgfD0gdmFsdWUgPDwgS0FTQU5fVEFHX1dJRFRI
Owo+PiArICAgICAgICAgICAgICAgKnNoYWRvd19zdGFydCA9IHRhZzsKPj4gKyAgICAgICB9Cj4+
ICsKPj4gKyAgICAgICAvKiBNZW1zZXQgdGhlIG1pZGRsZSBhbGlnbmVkIHBhcnQgaW4gc2hhZG93
IG1lbW9yeS4gKi8KPj4gKyAgICAgICB0YWcgPSBrYXNhbl9kZW5zZV90YWcodmFsdWUpOwo+PiAr
ICAgICAgIF9fbWVtc2V0KHNoYWRvd19zdGFydF9hbGlnbmVkLCB0YWcsIHNoYWRvd19lbmRfYWxp
Z25lZCAtIHNoYWRvd19zdGFydF9hbGlnbmVkKTsKPj4gKwo+PiArICAgICAgIC8qIE1lbXNldCB0
aGUgbGFzdCB1bmFsaWduZWQgdGFnIGluIHNoYWRvdyBtZW1vcnkuICovCj4+ICsgICAgICAgaWYg
KChhZGRyNjQgKyBzaXplKSAlIEtBU0FOX1NIQURPV19TQ0FMRV9TSVpFKSB7Cj4KPldvdWxkIGl0
IGJlIHBvc3NpYmxlIHRvIG1vdmUgdGhpcyBwYXJ0IHRvIGthc2FuX3BvaXNvbl9sYXN0X2dyYW51
bGUoKT8KPlRoYXQgZnVuY3Rpb25zIHNlZW1zIHRvIGJlIHNlcnZpbmcgYSBzaW1pbGFyIHB1cnBv
c2UgYnV0IGZvciB0aGUKPkdlbmVyaWMgbW9kZS4KPgo+SXQgbWlnaHQgYWxzbyBiZSBjbGVhbmVy
IHRvIGFkZCBhIGthc2FuX3BvaXNvbl9maXJzdF9ncmFudWxlKCkgdGhhdAo+Y29udGFpbnMgdGhl
IGlmIChhZGRyNjQgJSBLQVNBTl9TSEFET1dfU0NBTEVfU0laRSkgY2hlY2suCi4uLgpzdXJlLCBJ
J2xsIHRyeSB0byBtb3ZlIHRoZXNlIGNoZWNrcyB0byBrYXNhbl9wb2lzb25fZmlyc3QvbGFzdF9n
cmFudWxlLgoKPgo+PiArICAgICAgICAgICAgICAgdGFnID0gS0FTQU5fVEFHX01BU0sgPDwgS0FT
QU5fVEFHX1dJRFRIOwo+PiArICAgICAgICAgICAgICAgdGFnICY9ICpzaGFkb3dfZW5kOwo+PiAr
ICAgICAgICAgICAgICAgdGFnIHw9IHZhbHVlOwo+PiArICAgICAgICAgICAgICAgKnNoYWRvd19l
bmQgPSB0YWc7Cj4+ICsgICAgICAgfQo+PiAgfQo+PiAgRVhQT1JUX1NZTUJPTF9HUEwoa2FzYW5f
cG9pc29uKTsKPj4KPj4gLS0KPj4gMi40Ny4xCj4+CgotLSAKS2luZCByZWdhcmRzCk1hY2llaiBX
aWVjesOzci1SZXRtYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
