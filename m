Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DDF105F7A7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zwOF6K9bTJHLVRXOTyV+/e7IBhDdmA2GHV4KTQd+DgA=; b=VKZkaVxkbGOApu8wUHYx8zP6rt
	2LFMJKAlvEFbFK78cLq2TY81jaRAHomWA12i2iutk0F4kNnsjdUwpAkcQ5gxrNtoWcFHsCb5Z2zb7
	blSsRSHZ2Jv7PxSnqIQYirFZgX6nZ0fYM2IsoemDMBeaSjMSnmrnFF8MWV9+fpRccUly/pnDTzDan
	7E+3TjgTVsK4zO2kOqW5KpggdMpOoFJz21px/FIwXXKzrxJXj+ceDnvupyQNi+MC2688STgPGXa/4
	78k+dXPXlFvflG4qkBPUMlW07g/11pf8HSbCWWIaQN25RisB0KKJDheJPfHtSOBNq/5aNsoJEn+3f
	2lzocQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12C5-00000000AYb-3zqS;
	Fri, 13 Mar 2026 13:04:45 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12C1-00000000AXr-39nz
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773407082; x=1804943082;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MHb7IrMkLcYyAPqdlhWhe4LeUtKRmCPYQ3/34Ve4vhY=;
  b=Kj6qg0CPWFTASP55GjKnOHphQEqPptEYvC42jSNJADkyo/T2ZSZ6qNoY
   UINls/9XQzb15CLH6nCxpzHrx44lvzXWbProG+zZegUpmfudW4guAVfnm
   gUKcKz0Xbb18Y/TGeobdy+nhRt0kXvLEATq6mcCsJ3c4Jrqvh2tB7g0lz
   BVHti+cIDwWIlu/3vVvZmiPKhcPms24eQcQgMUckf1zbw/u24BKTepN1m
   oqGmLBgnMulnCorqBZ5VZnOKY+FAHFg3joYAAEC98Pmqbbp6guwkpDsyV
   UIjJXKXj6fYbj1Ekrm7kOH4hYbUDNWcnrO1BqqIhvK/RCr4I75ayrjbe0
   Q==;
X-CSE-ConnectionGUID: LwuaPoi4SuKLbSmD9ryiAQ==
X-CSE-MsgGUID: fCrUPwDZS7yc4CLtJMgfzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74592492"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74592492"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 06:04:39 -0700
X-CSE-ConnectionGUID: fWjJBpW4TaqMmYnTq9rNWA==
X-CSE-MsgGUID: fiSss4O7RGG67Lp4RpWNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="225845958"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 06:04:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 06:04:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 06:04:38 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.62) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 06:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxFsMAg+69otCrA8mm5n3S0sXpX0/p9thPzx2wloL2jXYSwV4qwFj9MsbcXpa860r1ySsWZCTpldkdpLNE5T4GkF8d9pbdp34VM80XkSXZwycvUPFlzyFFfElPx031nFp4F5ancktdyvbzAyV5CopKjnPLEpGWCzJZXm/okPnQZSMfxiLVWbfq9MMQ9188+m1A/m263sxSW2eL16jHIqzFZ++Ij0eHqR+TrRnZyNlLL6hZC0HVGnPpT4vf7qBBddEUJK70mO7v8LqvQR1R5HFTKyRdagK0JD+M/X8WHu9a9mjD6kZb+WUTR+5eJwSFH8uEv6Qf0Auit0WwENH5WsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LyA5U7YRSd6WpyEG/CN8fmnkdvjDWmVqMeYai8BBxs=;
 b=H2s+CXAk9/Vx5dVGt0RUlea4QvomS2epRrXEURcn7lFYC66x28Vk2kIE0LHz9xbCEcFvYbJVxGqs6jPlMHSRAs5RW88wHPpuZbM6Nqx/YuOeyvsFPPa+p+Cwwzk3CItr0EMXXHq0j7OdV9p7+7IFmIDr48wkcWCV8FpIyOoMvQN3702PfXVI2lqViUinGp5Gou9PYAteGBVbVtYxM5qMNEyOQO8b0IMnLr/Jt5Z2nkYDv91clxe3S0dwcEz0Ed6j8PeYbT+rHyV76oLT6Fxbgsa9o+E7HxsK23bW8BJK3XWE1XxG3msM2XCi8DzWoObHmD0MDOO5G6ANFtPwQXXiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 13:04:35 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 13:04:35 +0000
Message-ID: <a1e4f4fd-18b6-4bc0-a504-919d81dd4842@intel.com>
Date: Fri, 13 Mar 2026 15:04:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mmc: sdhci-of-k1: add comprehensive SDR tuning
 support
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan
	<dlan@kernel.org>
CC: Michael Opdenacker <michael.opdenacker@rootcommit.com>, "Javier Martinez
 Canillas" <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-4-5bb2b574df5d@gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-4-5bb2b574df5d@gmail.com>
X-ClientProxiedBy: DB9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc91807-58f4-427c-4cf5-08de81011327
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: nzNm2lnQfrCho/QpO3J5X1a93zI/UnAX/zAnZ3E4vRBxIpa7gl4JGeyNRJfM4uUMxgw+qbHbNjCCjghJNbbBlkdKCGwExHzT/JO1ek1dUHOMbK5IkFEuRIxLm7uQSI+gPz74XigxJ8Gj0WIBxK7OYNdPQIcgBmhnvokt7Rfj84c5hjc66umFaJLGf8KpY//Ei9AYywtje5fqKxkFqWCb0+FqAzPYOEC0b62VATxy+88AN4RK2zbZ7XTPZdtwzhc2oYMpASoz2fvdhOiO25kShLKRbZL5AwcXSRauv7jvQ3VHWRClt+W9PBKY838GIjPEsS84s1kVSNouzOXh61AHoYbQZiokpvXfsFvXcMY/scJtxAMz8uwnsI8MYS8LrXpUTgIw6Ukqf910giW3aJn+UKxoIedmH508Fjq3ub90fX0QGj+3UNsKPvjyXGU4sfd6EDZ6F3hjl2+DpH6S6+gMxyRKwp5dQ8W2uRtG+CwitE1J5wLj2+OmdtqE3pedu9L7hksW5AOWWQnmoL81V6CM+jVUyED+cGM3KHdfDgmY/nWrEaXZYI1lCECdUm/6yJ/s1AbtIeUArQWN54AV0Rw3kdBW2b7Ve1pMhanUmzTCekAm/Bt4M2V+kQjYXPOq5rV3thC8/T1aC/gdOmRcG/fnxcJy+fwvHpN5pe5ARaytZc3ahuNA1VUMLUdPlMSXmKiinuADze1j+L5rRaISQA6waROwK6GCEHNuovbhZRRiXMYoeAzWTuSFc9IwTR0VkuOv6NgVLEAfoYnuDsCP0UdFgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHlZVUMzbW13NjViNFV2VlRVVEFLTUNmcmZvMlhUSTlXZER1VEl6L1dRNFVE?=
 =?utf-8?B?YWh2dnpCeXNTdWxaNTU4RndNZzA2TDAwNjkvbVRRTDlGT3I0cjNvaWFtMHZQ?=
 =?utf-8?B?enZ0bEo3bmE4R0JjWnhiMExRc2ZnaXZXT2tJbGQwcng0a1N4Qm1ZYWEvZEpI?=
 =?utf-8?B?Zi9TMit0STNrZFJxcFlRSER6QjE3Mnc1N01Qd05OUGRWMGdVKzN2NG1uREI5?=
 =?utf-8?B?bndqc0NFcUpTK0VDUksvSzd5NTJHTUVzaFhvSXRNK0VOK2hRLzFaMXFSelBx?=
 =?utf-8?B?ZloxckxJVEM3M3pRVDZERkVFdXl3K0NMRmtHRnJRQzFSM2hWNnlqUjJqUFRw?=
 =?utf-8?B?U25VRjVWMXNlTXNWRExFUW54UjhISTBHR2NFWHNUNk1hRXl2amRrbFdPaFE4?=
 =?utf-8?B?eHgyWjJTTHc3aVBOaGE1d21LakFpeDVDQXhHNkZhWDVwQU9nQVVRRlZZeTlq?=
 =?utf-8?B?MCtwRURHM0NPQmlwWW8vQWl3bFRiZ1hMZTZIb1UzbnVVRkJkMGpOZG5SZ01N?=
 =?utf-8?B?bDBRSHo3NjdFUnBFK1A1anF3K0NNWHcyblpPc2lCVzZYQmw2ZWIxa0hjTzVK?=
 =?utf-8?B?cGFublp5MUVzb0h3b2ttS0hMSVdpV1diRHByRWJESnBiTXZTTmNLdDN2QUJT?=
 =?utf-8?B?VkFTR1V4WFJyV2dDMG1vdXlyOFF1VUdlMml2dUZrTDhJRFNmQURqeHZVeDdJ?=
 =?utf-8?B?TDRLcDM4R2dZZllmZ2lwNUtKTFVWekN0ZWlXcXBiakZ3VmExUHNyTEVaU0RS?=
 =?utf-8?B?TEhnR3JjYjZteG5jWGtnbWhpaFhodXBldFFLTHAyL1BuQ0J5bEtvQkpPN3hi?=
 =?utf-8?B?YTdrSWhER2dydVNWWUo4eWExMkdiQVFLRHpPU0MxcFhqYUsrVHNrVkJLaVhR?=
 =?utf-8?B?SkROMXVGQVFBM0dZUnYyNCtqQnVVMVJLYk4yNmYxclNncStLUENHZmxnNnJV?=
 =?utf-8?B?N2FOYXZkRFB6M3JmMGJCUzVmc0Q2Sm90UmlZVW4wYm5yb1BRUnI3Z3pPNFNv?=
 =?utf-8?B?VXZmREtCUk9CN2F2VXN6S0dJQUZERUR5dVNPbjFsOUdlSW5KSWh5cTNVa0Vm?=
 =?utf-8?B?QmdRZ0RPcVV0RXdzQkVpR2s3Q2FJV1lFYm5URUkxOHVpWmlOMnBud1diN0NM?=
 =?utf-8?B?RERGa0REeVdTeUEzczZQbzFjaDd2RTJWY3hJMXdtUTRHemRwL0VHaGYrd2Jo?=
 =?utf-8?B?ejdTTEM0SFhLM1dXY1hyUUMvWEUzQVhSck8zQkhJaDBaMzFoSEFia0ErR1Mv?=
 =?utf-8?B?d0N0N2NwZ21UTXZ0ckptLzFrWGNjaG5QL0pMYTdtWlVMc1JiRFBKL0FXRU5y?=
 =?utf-8?B?aEJKTTRDNFRkZEx5eG43c25vVXBmdVI2cHhEVUMzMHoyMmp5MUNQY1JxWXow?=
 =?utf-8?B?emdDdnBRSkx5M1hyelRmdEhoTytJY2xFVlNEeGNpS2Y5OW1QQytYaEtkZzU3?=
 =?utf-8?B?aFNFWjc1SWJLVHppbjZSYkhNU2RyYlhrSjFvRVNBSkkzV2Z4U1BGUmsyQU5N?=
 =?utf-8?B?U0c3YjFGMFJHUnlkWXNobXozSUVhcWJxYi95c2NyZnNXZVVTcFBUR1JPTVhr?=
 =?utf-8?B?b2lieGFRRkZJb3VaVlN2dEI3dHpVeGNRZVQyT1FWZUFBMGZVbkFmTFZNQW1L?=
 =?utf-8?B?WEEvN08rb0s2WTFwWThlTVhhdWFPREcySkJ6aW5icmxaRFN0dHBrZllQejRR?=
 =?utf-8?B?elVPUVBLMUkxYkI2NS84RDZ5STRsNXh3Q3p4c3RBVE1yc0VPa0kwek1ybEtr?=
 =?utf-8?B?OFlpaStGcG10SGpTUmxRMTdrMnBJaTVUbnlaVVRIWUhqbkc5eWNKVmd2OG5Q?=
 =?utf-8?B?R0pkdDRqWnFEOHVudHhNU2hRQmNjMHlUbHdBcGhLU1MwcXJUOWNlWGpNUkZG?=
 =?utf-8?B?NDB3WTUrdHZvcEYyVnZjYlhjL0kvWmJpbkEyWUFwWHJoRUJ0TjdqV09HVldT?=
 =?utf-8?B?MWFmL0xKYVlZUmNWNVNUOWdTd3UrZVVtK3lpbzVveENMV3VuQ3hxQkJzOUtw?=
 =?utf-8?B?TXF2V3p3UGc5cWd6NjYzUXJXbXJRd002QjVjczBDQyt2QmlLQVh1T2NlRlov?=
 =?utf-8?B?M0ZxbmlEU0dmaXpqcGJkL3dscnRVblJ5YU93MnJPMjhwTjlIeUN2WlNSK2w5?=
 =?utf-8?B?cno2MGpQNlYxeXpTR2pxazVkUkVScGg3a3RUNmJ6UGc2T3RZVjNERnhVY2RO?=
 =?utf-8?B?NC9CRThWaHNKUC9BWmhTbXNGUWZzN1pEb2VXV1J2NjY1eUR0dmdOSXRZRi82?=
 =?utf-8?B?aDdWSVc3UVFGRHVhUTVjRzAzZUc2YXhLU0xabEJTNGxoUnM1YVc2V2k1TjNi?=
 =?utf-8?B?L1ExZHlKSks2d1FidW5WbGlnZGZSTERtSGtIVGtZOGo3SWt6U0dtVTFEc09N?=
 =?utf-8?Q?IHFQ4z86VlfEHlNQ=3D?=
X-Exchange-RoutingPolicyChecked: tNdQ5Yci+GweRArwISZDam10yBIx3aJwKBUigOx11tkzcAjCnzcnv3hX/tfneyjKznoEC2wZEZoMYjz88lCh3iRj8m5sq2S9Bg45cgSG45EzOnLYeYz9bfWmtcg25J3N64omxxNkllMOMtWvBU++5DLovtpC0IljGmybXiuh2q44N5j2cmtjsSeAY6SX1HuMnt6pu5Jixy6KfUJz3T1zTboWAxeDH9Lrg0GdEOq2AIJdNxX9VQw3MCUXrz7JunAVCjWul+shd0ev5fMRQdb3VTeCiTLPDJgqBIWOm020wM7hhYbeof3Ur80QwUW6iAO4Xdze+rrRl62BRTqWIFTSjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc91807-58f4-427c-4cf5-08de81011327
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:04:35.2912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjiN/qYOhCwIXt+RJqQj5h4icg/FkEbcMx1NnWaGXf/ukVuRBWe5e73/wfUeqPsBL+dLX9fxQSs8B72lIdmcDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_060441_849549_B4720CFF 
X-CRM114-Status: GOOD (  22.65  )
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

T24gMDkvMDMvMjAyNiAxMzo0MCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+IEltcGxlbWVudCBzb2Z0
d2FyZSB0dW5pbmcgYWxnb3JpdGhtIHRvIGVuYWJsZSBVSFMtSSBTRFIgbW9kZXMgZm9yIFNECj4g
Y2FyZCBvcGVyYXRpb24uIFRoaXMgYWRkcyBib3RoIFRYIGFuZCBSWCBkZWxheSBsaW5lIHR1bmlu
ZyBiYXNlZCBvbiB0aGUKPiBTcGFjZW1pVCBLMSBjb250cm9sbGVyIGNhcGFiaWxpdGllcy4KCk5l
ZWQgdG8gc2F5IHNvbWV0aGluZyBhYm91dCB0aGUgSFMyMDAgc3VwcG9ydCBzaW5jZSBpdCBpcwpl
TU1DIG9ubHkKCj4gCj4gS2V5IGZlYXR1cmVzOgo+IC0gQ29uZGl0aW9uYWwgdHVuaW5nOiBvbmx5
IHR1bmUgd2hlbiBTRCBjYXJkIGlzIHByZXNlbnQgYW5kIGZvcgo+ICAgaGlnaC1zcGVlZCBtb2Rl
cyAo4omlMTAwTUh6KQo+IC0gVFggdHVuaW5nOiBjb25maWd1cmUgdHJhbnNtaXQgZGVsYXkgbGlu
ZSB3aXRoIGRlZmF1bHQgdmFsdWVzCj4gICAoZGxpbmVfcmVnPTAsIGRlbGF5Y29kZT0xMjcpIHRv
IGVuc3VyZSBvcHRpbWFsIHNpZ25hbCBvdXRwdXQgdGltaW5nCj4gLSBSWCB0dW5pbmc6IHRlc3Qg
ZnVsbCBkZWxheSByYW5nZSAoMC0yNTUpIHdpdGggd2luZG93IGRldGVjdGlvbgo+ICAgYWxnb3Jp
dGhtIHRvIGZpbmQgb3B0aW1hbCByZWNlaXZlIHRpbWluZwo+IC0gUmV0cnkgbWVjaGFuaXNtOiBt
dWx0aXBsZSBmYWxsYmFjayBkZWxheXMgd2l0aGluIG9wdGltYWwgd2luZG93IGZvcgo+ICAgaW1w
cm92ZWQgcmVsaWFiaWxpdHkKPiAtIENvbXBsZXRlIHJlZ2lzdGVyIHN1cHBvcnQ6IGFkZCBkZWxh
eSBsaW5lIGNvbnRyb2wgYW5kIGNvbmZpZ3VyYXRpb24KPiAgIHJlZ2lzdGVyIGRlZmluaXRpb25z
IGZvciBmaW5lLWdyYWluZWQgdGltaW5nIGNvbnRyb2wKPiAKPiBTaWduZWQtb2ZmLWJ5OiBJa2Vy
IFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbW1jL2hv
c3Qvc2RoY2ktb2YtazEuYyB8IDExOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jIGIvZHJpdmVycy9tbWMvaG9zdC9z
ZGhjaS1vZi1rMS5jCj4gaW5kZXggNzljYjdjOGQwYjZkOWM0MjA2YmYwMTcyMTY1MWM4ZWZlOGEx
NzNjOS4uZDkwMzg1MWI5YmUwZTFkMjFhMmIzMDYzNmY1ZTYzYTUyY2FkMGRjMiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKPiArKysgYi9kcml2ZXJzL21tYy9o
b3N0L3NkaGNpLW9mLWsxLmMKPiBAQCAtODQsNiArODQsMTIgQEAKPiAgI2RlZmluZSAgU0RIQ19U
WF9ETElORV9SRUdfTUFTSyAgICAgICAgIEdFTk1BU0soMjMsIDE2KQo+ICAKPiAgI2RlZmluZSBT
UEFDRU1JVF9SWF9ETElORV9SRUcJCTkKPiArI2RlZmluZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZ
X01JTgkweDAKPiArI2RlZmluZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWAkweEZGCj4gKyNk
ZWZpbmUgU1BBQ0VNSVRfUlhfVFVORV9ERUxBWV9TVEVQCTB4MQo+ICsKPiArI2RlZmluZSBTUEFD
RU1JVF9UWF9UVU5JTkdfRExJTkVfUkVHCTB4MDAKPiArI2RlZmluZSBTUEFDRU1JVF9UWF9UVU5J
TkdfREVMQVlDT0RFCTEyNwo+ICAKPiAgc3RydWN0IHNwYWNlbWl0X3NkaGNpX2hvc3Qgewo+ICAJ
c3RydWN0IGNsayAqY2xrX2NvcmU7Cj4gQEAgLTI1MSw2ICsyNTcsMTE4IEBAIHN0YXRpYyB1bnNp
Z25lZCBpbnQgc3BhY2VtaXRfc2RoY2lfY2xrX2dldF9tYXhfY2xvY2soc3RydWN0IHNkaGNpX2hv
c3QgKmhvc3QpCj4gIAlyZXR1cm4gY2xrX2dldF9yYXRlKHBsdGZtX2hvc3QtPmNsayk7Cj4gIH0K
PiAgCj4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfc2RoY2lfZXhlY3V0ZV90dW5pbmcoc3RydWN0IHNk
aGNpX2hvc3QgKmhvc3QsIHUzMiBvcGNvZGUpCj4gK3sKPiArCWludCByZXQgPSAwOwo+ICsJaW50
IGk7Cj4gKwlib29sIHBhc3Nfd2luZG93W1NQQUNFTUlUX1JYX1RVTkVfREVMQVlfTUFYICsgMV0g
PSB7ZmFsc2V9Owo+ICsJaW50IHBhc3NfbGVuID0gMCwgcGFzc19zdGFydCA9IDAsIG1heF9wYXNz
X2xlbiA9IDAsIG1heF9wYXNzX3N0YXJ0ID0gMDsKPiArCXU4IGZpbmFsX2RlbGF5Owo+ICsJc3Ry
dWN0IG1tY19ob3N0ICptbWMgPSBob3N0LT5tbWM7Cj4gKwlzdHJ1Y3QgbW1jX2lvcyBpb3MgPSBt
bWMtPmlvczsKClByZWZlciB0byBhcnJhbmdlIGxvY2FsIGRlZmluaXRpb25zL2RlY2xhcmF0aW9u
cyBpbiBvcmRlciBvZgpkZXNjZW5kaW5nIGxpbmUgbGVuZ3RoIGUuZy4KCglpbnQgcGFzc19sZW4g
PSAwLCBwYXNzX3N0YXJ0ID0gMCwgbWF4X3Bhc3NfbGVuID0gMCwgbWF4X3Bhc3Nfc3RhcnQgPSAw
OwoJYm9vbCBwYXNzX3dpbmRvd1tTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWCArIDFdID0ge2Zh
bHNlfTsKCXN0cnVjdCBtbWNfaG9zdCAqbW1jID0gaG9zdC0+bW1jOwoJc3RydWN0IG1tY19pb3Mg
aW9zID0gbW1jLT5pb3M7Cgl1OCBmaW5hbF9kZWxheTsKCWludCByZXQgPSAwOwoJaW50IGk7Cgo+
ICsKPiArCS8qCj4gKwkgKiBUdW5pbmcgaXMgcmVxdWlyZWQgZm9yIFNEUjUwL1NEUjEwNCwgSFMy
MDAvSFM0MDAgY2FyZHMgYW5kCj4gKwkgKiBpZiBjbG9jayBmcmVxdWVuY3kgaXMgZ3JlYXRlciB0
aGFuIDEwME1IeiBpbiB0aGVzZSBtb2Rlcy4KPiArCSAqLwo+ICsJaWYgKGhvc3QtPmNsb2NrIDwg
MTAwICogMTAwMCAqIDEwMDAgfHwKPiArCSAgICAhKGlvcy50aW1pbmcgPT0gTU1DX1RJTUlOR19N
TUNfSFMyMDAgfHwKPiArCSAgICAgIGlvcy50aW1pbmcgPT0gTU1DX1RJTUlOR19VSFNfU0RSNTAg
fHwKPiArCSAgICAgIGlvcy50aW1pbmcgPT0gTU1DX1RJTUlOR19VSFNfU0RSMTA0KSkKPiArCQly
ZXR1cm4gMDsKPiArCj4gKwlpZiAoIShtbWMtPmNhcHMyICYgTU1DX0NBUDJfTk9fU0QpICYmICFt
bWMtPm9wcy0+Z2V0X2NkKG1tYykpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJaWYgKG1tYy0+Y2Fw
czIgJiBNTUNfQ0FQMl9OT19NTUMpIHsKPiArCQlzcGFjZW1pdF9zZGhjaV9zZXRfdHhfZGxpbmVf
cmVnKGhvc3QsIFNQQUNFTUlUX1RYX1RVTklOR19ETElORV9SRUcpOwo+ICsJCXNwYWNlbWl0X3Nk
aGNpX3NldF90eF9kZWxheShob3N0LCBTUEFDRU1JVF9UWF9UVU5JTkdfREVMQVlDT0RFKTsKPiAr
CQlzcGFjZW1pdF9zZGhjaV90eF90dW5pbmdfcHJlcGFyZShob3N0KTsKPiArCj4gKwkJZGV2X2Ri
ZyhtbWNfZGV2KGhvc3QtPm1tYyksICJUWCB0dW5pbmc6IGRsaW5lX3JlZz0lZCwgZGVsYXljb2Rl
PSVkXG4iLAo+ICsJCQlTUEFDRU1JVF9UWF9UVU5JTkdfRExJTkVfUkVHLCBTUEFDRU1JVF9UWF9U
VU5JTkdfREVMQVlDT0RFKTsKPiArCX0KPiArCj4gKwlzcGFjZW1pdF9zZGhjaV9wcmVwYXJlX3R1
bmluZyhob3N0KTsKPiArCj4gKwlmb3IgKGkgPSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01JTjsg
aSA8PSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWDsKPiArCSAgICAgaSArPSBTUEFDRU1JVF9S
WF9UVU5FX0RFTEFZX1NURVApIHsKPiArCQlzcGFjZW1pdF9zZGhjaV9zZXRfcnhfZGVsYXkoaG9z
dCwgaSk7Cj4gKwo+ICsJCXJldCA9IG1tY19zZW5kX3R1bmluZyhob3N0LT5tbWMsIG9wY29kZSwg
TlVMTCk7Cj4gKwkJcGFzc193aW5kb3dbaV0gPSAocmV0ID09IDApOwo+ICsKPiArCQlkZXZfZGJn
KG1tY19kZXYoaG9zdC0+bW1jKSwgIlJYIGRlbGF5ICVkOiAlc1xuIiwKPiArCQkJaSwgcGFzc193
aW5kb3dbaV0gPyAicGFzcyIgOiAiZmFpbCIpOwo+ICsJfQo+ICsKPiArCWZvciAoaSA9IFNQQUNF
TUlUX1JYX1RVTkVfREVMQVlfTUlOOyBpIDw9IFNQQUNFTUlUX1JYX1RVTkVfREVMQVlfTUFYOwo+
ICsJICAgICBpICs9IFNQQUNFTUlUX1JYX1RVTkVfREVMQVlfU1RFUCkgewo+ICsJCWlmIChwYXNz
X3dpbmRvd1tpXSkgewo+ICsJCQlpZiAocGFzc19sZW4gPT0gMCkKPiArCQkJCXBhc3Nfc3RhcnQg
PSBpOwo+ICsJCQlwYXNzX2xlbisrOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCWlmIChwYXNzX2xlbiA+
IG1heF9wYXNzX2xlbikgewo+ICsJCQkJbWF4X3Bhc3NfbGVuID0gcGFzc19sZW47Cj4gKwkJCQlt
YXhfcGFzc19zdGFydCA9IHBhc3Nfc3RhcnQ7Cj4gKwkJCX0KPiArCQkJcGFzc19sZW4gPSAwOwo+
ICsJCX0KPiArCX0KPiArCj4gKwlpZiAocGFzc19sZW4gPiBtYXhfcGFzc19sZW4pIHsKPiArCQlt
YXhfcGFzc19sZW4gPSBwYXNzX2xlbjsKPiArCQltYXhfcGFzc19zdGFydCA9IHBhc3Nfc3RhcnQ7
Cj4gKwl9Cj4gKwo+ICsJaWYgKG1heF9wYXNzX2xlbiA8IDMpIHsKPiArCQlkZXZfZXJyKG1tY19k
ZXYoaG9zdC0+bW1jKSwgIlR1bmluZyBmYWlsZWQ6IG5vIHN0YWJsZSB3aW5kb3cgZm91bmRcbiIp
Owo+ICsJCXJldHVybiAtRUlPOwo+ICsJfQo+ICsKPiArCWZpbmFsX2RlbGF5ID0gbWF4X3Bhc3Nf
c3RhcnQgKyBtYXhfcGFzc19sZW4gLyAyOwo+ICsJc3BhY2VtaXRfc2RoY2lfc2V0X3J4X2RlbGF5
KGhvc3QsIGZpbmFsX2RlbGF5KTsKPiArCXJldCA9IG1tY19zZW5kX3R1bmluZyhob3N0LT5tbWMs
IG9wY29kZSwgTlVMTCk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJdTggcmV0cnlfZGVsYXlzW10gPSB7
Cj4gKwkJCW1heF9wYXNzX3N0YXJ0ICsgbWF4X3Bhc3NfbGVuIC8gNCwKPiArCQkJbWF4X3Bhc3Nf
c3RhcnQgKyAoMyAqIG1heF9wYXNzX2xlbikgLyA0LAo+ICsJCQltYXhfcGFzc19zdGFydCwKPiAr
CQkJbWF4X3Bhc3Nfc3RhcnQgKyBtYXhfcGFzc19sZW4gLSAxCj4gKwkJfTsKPiArCQlpbnQgcmV0
cnlfY291bnQgPSBBUlJBWV9TSVpFKHJldHJ5X2RlbGF5cyk7Cj4gKwo+ICsJCWRldl93YXJuKG1t
Y19kZXYobW1jKSwgIlByaW1hcnkgZGVsYXkgJWQgZmFpbGVkLCB0cnlpbmcgYWx0ZXJuYXRpdmVz
XG4iLAo+ICsJCQkgZmluYWxfZGVsYXkpOwo+ICsKPiArCQlmb3IgKGkgPSAwOyBpIDwgcmV0cnlf
Y291bnQ7IGkrKykgewo+ICsJCQlpZiAocmV0cnlfZGVsYXlzW2ldID49IFNQQUNFTUlUX1JYX1RV
TkVfREVMQVlfTUlOICYmCj4gKwkJCSAgICByZXRyeV9kZWxheXNbaV0gPD0gU1BBQ0VNSVRfUlhf
VFVORV9ERUxBWV9NQVgpIHsKPiArCQkJCXNwYWNlbWl0X3NkaGNpX3NldF9yeF9kZWxheShob3N0
LCByZXRyeV9kZWxheXNbaV0pOwo+ICsJCQkJcmV0ID0gbW1jX3NlbmRfdHVuaW5nKGhvc3QtPm1t
Yywgb3Bjb2RlLCBOVUxMKTsKPiArCQkJCWlmICghcmV0KSB7Cj4gKwkJCQkJZmluYWxfZGVsYXkg
PSByZXRyeV9kZWxheXNbaV07Cj4gKwkJCQkJZGV2X2luZm8obW1jX2RldihtbWMpLCAiUmV0cnkg
c3VjY2Vzc2Z1bCB3aXRoIGRlbGF5ICVkXG4iLAo+ICsJCQkJCQkgZmluYWxfZGVsYXkpOwo+ICsJ
CQkJCWJyZWFrOwo+ICsJCQkJfQo+ICsJCQl9Cj4gKwkJfQo+ICsKPiArCQlpZiAocmV0KSB7Cj4g
KwkJCWRldl9lcnIobW1jX2RldihtbWMpLCAiQWxsIHJldHJ5IGF0dGVtcHRzIGZhaWxlZFxuIik7
Cj4gKwkJCXJldHVybiAtRUlPOwo+ICsJCX0KPiArCX0KPiArCj4gKwlkZXZfZGJnKG1tY19kZXYo
aG9zdC0+bW1jKSwKPiArCQkiVHVuaW5nIHN1Y2Nlc3NmdWw6IHdpbmRvdyAlZC0lZCwgdXNpbmcg
ZGVsYXkgJWRcbiIsCj4gKwkJbWF4X3Bhc3Nfc3RhcnQsIG1heF9wYXNzX3N0YXJ0ICsgbWF4X3Bh
c3NfbGVuIC0gMSwgZmluYWxfZGVsYXkpOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgaW50IHNwYWNlbWl0X3NkaGNpX3ByZV9zZWxlY3RfaHM0MDAoc3RydWN0IG1tY19ob3N0
ICptbWMpCj4gIHsKPiAgCXN0cnVjdCBzZGhjaV9ob3N0ICpob3N0ID0gbW1jX3ByaXYobW1jKTsK
PiBAQCAtMzQ0LDYgKzQ2Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2RoY2lfb3BzIHNwYWNl
bWl0X3NkaGNpX29wcyA9IHsKPiAgCS5zZXRfY2xvY2sJCT0gc3BhY2VtaXRfc2RoY2lfc2V0X2Ns
b2NrLAo+ICAJLnNldF91aHNfc2lnbmFsaW5nCT0gc3BhY2VtaXRfc2RoY2lfc2V0X3Voc19zaWdu
YWxpbmcsCj4gIAkudm9sdGFnZV9zd2l0Y2ggICAgICAgICA9IHNwYWNlbWl0X3NkaGNpX3ZvbHRh
Z2Vfc3dpdGNoLAo+ICsJLnBsYXRmb3JtX2V4ZWN1dGVfdHVuaW5nID0gc3BhY2VtaXRfc2RoY2lf
ZXhlY3V0ZV90dW5pbmcsCj4gIH07Cj4gIAo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNkaGNpX3Bs
dGZtX2RhdGEgc3BhY2VtaXRfc2RoY2lfazFfcGRhdGEgPSB7Cj4gCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
