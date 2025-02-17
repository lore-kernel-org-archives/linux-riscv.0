Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DA6C021A9
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 18:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kC9d+VKG5J4Cavzzv5QbZuTlnl+Tr0zZIVdewkB3+aM=; b=ufT0bFl5DQAjOG
	ayFyFsGmo/I9RxkN7HATLsdFHvvHiIGzK2xyXrVSsXqJeAfFF2mYSwNDQ6hXos0TmCFNkz5E+qegn
	Nd59mMAWyl6CimF2SmrjrcR5/XMrM8/NcQtOyPEF3AtL1Etdw4H5KTjORmOPGQjGlqIzohocAaM8S
	XoIdPGGaIEalWQa3HKXS7gAx0i6q8jPavuHCUilkkALgrtm0Vs/dfkWtXeloDcoNtd/2JGcxO9sxn
	JuGv7ixyTyZQKjqvVoWBzqI+BWn8IjBh1z3QVRbjFHnzh2wz5rjnnnBgK2+9aq9CNn56IlT4NPh1d
	CpiWo9DHJO4Fx4XxStRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk60b-00000005dLp-3A2K;
	Mon, 17 Feb 2025 18:38:21 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk60Y-00000005dKs-3TZy;
	Mon, 17 Feb 2025 18:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739817499; x=1771353499;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CFz3QexjusFaCouZT7biffI13dt13YhFqjzjcPZ33+E=;
  b=dDupkiyud2azBsvzhcW29fXgg2Ionxac2tRUYoKMlaoGN1qiWjq1aK0U
   ygXy6pPqWIlsZUk1fHKWX0LGZtbcXZPI+jKA6kRkkmJH8X0tvMrvAMpi3
   dgr90UAfC7Mlq5iVD0JUYbq+LQNrPlKQ77rlXsyPkitPFVf2f79tN8qqB
   ZbXOz29borPG8Y3y8Gb7UCySvmrIdy7iRy6LJ8AkOe7wweQSkqvTaxOG8
   cR3aAlPOOXWFIngK5u7I4/CzWxfXOhF/Nkmvgt7vgfLzJ/zGMv3ABZJoU
   V/P5TRfk9TLXge0IJQ46jS7DtMZHJnSkTTE848RES4EDLJPveUoUBJSUd
   A==;
X-CSE-ConnectionGUID: FtKSQp0lT0SPZcj01IFuUA==
X-CSE-MsgGUID: njsKz4lcThyA4HCVbAIDlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40214119"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40214119"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 10:38:13 -0800
X-CSE-ConnectionGUID: 6rBB0pooTYyJwpVire+I9g==
X-CSE-MsgGUID: isLAIaGlRWix1d3Hz0A3wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114386506"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 10:38:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Feb 2025 10:38:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 10:38:12 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 10:38:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSJRo5CDU1O9HFg6TyIQTfxgFbsKNUvRiLSz2xx8hyjsLN3CTVh+hBZyvx/6TtDe9huXWqeDhFsyisjYzwlZT2e9CZq/F/ujOKxvoHbW1boKPRH5mMfdQ62sl7K512N119Mb4/niAuf3kfRPXlk2hXrvme4mCgmfJy2I9B9kyb211FrT/JNX9LHwmKVv0llsqrSTAy/NCWwqhQqKCO16uuN4yBds0S7uhGxMxXkHYBVnLHZYcY0Fy20Xhl1KOhnlp4poTq4+aEIfNr+7pxR6oPrsCMkclf1tKqMXd7rS+ljxOeqc7J1NSoQ6yy1UXbUIVRHA9fN9xOmM0eqShzkwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJOr/W5XvA4Jct+SudYeYcMy2N3Q46HCp6mZjRtE/Vg=;
 b=g6gNxNCkKzGDI35i+whcD+OU5Loq5gJCH351R8a/vZhvN3npd2PG1pHnoLy86DZSZDjkI4/ZrLaNDLTdRF19XICQ8r0nT/T3OfcUP5T3jpBThbEwNl7Hz4GwgG/h9WLGc0S1Ai2bCpeo/mL7iY1XPbMGY9O/NyYfi+vksii9PUz49EbraTzxlLKX/Wjh13uRO8jjnfntmmHDcYwdSEv5KtFD5YJKK53xADISZPHVMjDtgYQNSnGTy7NHrKaav5N0THsBrDZlzc7fNjiO3O//EX3tZQ3Sg+0U8NTL4M5nIBT0mrFOrHcWXbc9RDSia+JRrtvSS/n7ssgnmymB4hmAXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by DS7PR11MB7860.namprd11.prod.outlook.com (2603:10b6:8:e9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.13; Mon, 17 Feb 2025 18:37:42 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8445.015; Mon, 17 Feb 2025
 18:37:41 +0000
Date: Mon, 17 Feb 2025 19:37:12 +0100
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
Message-ID: <kmibbbrtlwds6td64hloau7pf3smqth4wff33soebvujohsvli@kni5dtvpwsxf>
References: <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
 <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm>
 <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
 <CA+fCnZcHnWr0++8omB5ju8E3uSK+s+JOFZ3=UqgtVEcBzrm2Lg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CA+fCnZcHnWr0++8omB5ju8E3uSK+s+JOFZ3=UqgtVEcBzrm2Lg@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::7) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|DS7PR11MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cec8ee-d1c9-40ca-7e93-08dd4f822979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGdXbG1CV014dmlZd1Y3bXVlQUV5MWpuOEFSUHZiVXZ5N2k0aGJNbXI3VlNR?=
 =?utf-8?B?L3J2Z0JuQ0VHSG04Snh3dk5SUWpaTXB3UkNtZUpnZGpqZnNaM3hkZ0VSWXZy?=
 =?utf-8?B?cFh6WmcyblpOZEF3SzF2cUV0NmVCV0poM2dzRmJBOWluck1iSldnVFRSQ2ta?=
 =?utf-8?B?RDVCejA3Uyt3aHFIRWhpSk5xeWhicThYODJNVHhEc3hjRW1JVi9SNk11VDVG?=
 =?utf-8?B?SzYxblJZYStRd3V2MFlqQVJoL01ReG14VUpDY1pmbWlkWFphMTFsZXdYQ1Nx?=
 =?utf-8?B?ZHhRMDc5VWhySVpHNjdPeSsrSFRYbjlqM3FzZFd3RkFEcnBWZGREeHFFVmZ5?=
 =?utf-8?B?MnVGWGloK2pIVmQwOEwrcitBY3hIL0k0cU45YzVNQ2xEOGE3cnhFRXAyUFMy?=
 =?utf-8?B?N2JVOHFzQThwb2JIRnhaYVk5d3ZYcnlKWDNDM2ZPLy96aXk4K1FiOGN3bUY2?=
 =?utf-8?B?OEU2czNDUVNua0htby9nVTJJSWc4aExJaDZYZU5jNUplR3RzUEpmMStLWGN2?=
 =?utf-8?B?STROMGtXaGZaWm1ab3lPcGdLQlNjdTJHR0gxOGl2TGpmR2N3QytPM29GSkNK?=
 =?utf-8?B?VEozTU5TT0MvNVdQOVhvVEpEd0ZLMXBYdEIyeDdUMlRkNWNTd3BDa2hjWnUx?=
 =?utf-8?B?UEJ3VnhRNGx4UVlSQjNkdjVmSU9YcERlUkFXK1dMS2xVbm1aTllBazFjdTFP?=
 =?utf-8?B?Nk5nTWZTeFhYdDVqOUVEb3ZJV2RXTGdCU0dRRm4wYTlxbmVrVnJZOUpDRXpW?=
 =?utf-8?B?d2RsYTJCSWJOQWZvVXZvRCtuL1QxRHhFRjNlNmFqNGxnWlFjajQ1L1FDNzRq?=
 =?utf-8?B?Qml2R0Y0eHg1MlppMkUxUWNCVzA5WlBCYXAvRk11aGQ0bElYNXJFYUVXSUpX?=
 =?utf-8?B?Y2tkRHhQc0VNKzVDTFNSSUh6MFJ0UU1OTmJadjVuZzE5RWxkZHErM21sam9O?=
 =?utf-8?B?bGtzdTRMYUF2L25VWGV4UzlTc29ReGxPYXU1K29ydHJ6UzI2MmpoaGoxWFk5?=
 =?utf-8?B?TWkyWnZOSnlCOTdUYnE0Ty84U3EybEZYeEJsY1NRMG1HNTdIL0dNLzZxVVZ6?=
 =?utf-8?B?eVoya0x6bnd2bDRUTlJWYTdNaGJXMjRRUytSTkpmbTh4bWFJekM3R1NvZjZ2?=
 =?utf-8?B?emVmVWlienRZNEFxN09qNmxLMTFaa0FTeWJ0N3Npa2wwREpqUG1waXlSVjZ5?=
 =?utf-8?B?bjlCWXBFckVoTGIxeWQwUnlQR09UbG5NcHpKRkNlN0FPbXVKZzV3SEZzaXhX?=
 =?utf-8?B?QmFRd2RmWXNGNU1rM2wxVDdPRythMlBjZUUyL3FQSzV6bHZhYlQrVjFhTHhx?=
 =?utf-8?B?aDdVaG1RUmg5djNzSkFwcDNQRURBazBaNDIzazJnWU83MVZQMjFDVFhFL1VU?=
 =?utf-8?B?MjdYdkczelpyRDY1a3VVZTh5OGV6YmRhVDhoTEEvUHlqOXJIMlZMSlFkYWQ2?=
 =?utf-8?B?ZnRKQnRtanV6Vi9sTWQ2OW1iTHBJYmNCY1l3ME5rTTFKV3pDMkRvMWN3YnhZ?=
 =?utf-8?B?RGlNUDNPb2p6WTVhQnRmSXFYOW9GbVY4OFdyYWhBenRlUmNkTE5WV1JlcW1L?=
 =?utf-8?B?aHlLSXhSbjlLMjZaOGp0U2g2c3FvWmZvN2hUVThJTlY2c3EzSFdTRm9YVllD?=
 =?utf-8?B?aFRTbU13SVdHT1hXcXl5VkJYU3VWVko4anFEMk5UQU1DZ3hRdmxzU1V6ek0r?=
 =?utf-8?B?RXVWczJqeWNmaDlvRkZOWHZyZHRsSENGSzA0K1NBZXMyU0xyRitzYUxENFUy?=
 =?utf-8?B?ODhkSkZoTVVZZTZ0L0RhWWk0cEtQMWdUZG00YmxLMHA1MGNnUnRHTG1uaVd2?=
 =?utf-8?B?dHFTNVZrdW5sZ1llaVlWS0h4bXZ3NW1wdlc2Rm5FcjROYjVnK1NZWGlXcWd0?=
 =?utf-8?Q?KXXem+9otIMea?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2hUTk1pcVZ4OXZ2eitrN0J2aTZtOU5qdWlvTmdyL3pzVWJkSTZTSVRLVjNj?=
 =?utf-8?B?bjQwd3dKQ1hqNGR4dDJtQVVWbU1KYTdaSDRJY3hhaHF1VHVkVCszMFhkSVdn?=
 =?utf-8?B?YzM0NTU1M1ErZ3dTYVRyL0JJdFY0YVVzWDV6eDJhWW5XRHdTdjcvRUxPS09u?=
 =?utf-8?B?clRmNndMVS9pdHNLb2N1VkpaVVJpeE1wOCtoVURoY1p0c2N6bzdrWFhyUVNY?=
 =?utf-8?B?TmZmRnQ1ODN0djVTRS9iYXdOdjczcHdJb3pnZkhKT2FBdFAxQUZZRm55MGdY?=
 =?utf-8?B?bW9uZVFsMzFaM2pzVjF2ZUFubFozS1VybHVId2o5d2lHOStTODNReG5QdlRW?=
 =?utf-8?B?S3M4UHdhd1FQVEhqdUFCVFl6RVNXdHozVkFxb0hSNVJIdlBvaDcxdmhxVE5o?=
 =?utf-8?B?eUV5aFdFa05ZZ2pCSDhRSHRtd0ZJeWcrM0duRjBNenp3THZTSFNiY0tydjFq?=
 =?utf-8?B?NjlzZitOR25WalBKVWh0UTUwSkJDYUdUdytSNW40bi9KTUQ5a1hhOXVkWTM2?=
 =?utf-8?B?WXBpdU84RDhrU1l6WWJ0c1pQUkxxbThLUlg3M0xPSXQ4N1dGcG8xZGs1Z0Rx?=
 =?utf-8?B?L0tvc2kzWVpncnhkSnhoT0hoSm5BS2RkajJMbTdGQWRJdmg1NTRmZDhTTU1n?=
 =?utf-8?B?dkQwWXdvek5pMzRhOGlCVG9IR0tjNFZBNGtMWUhEVmNsZzRhZDN2ejhqc0FE?=
 =?utf-8?B?ZWwycTRhampvUzExMEl6d2xJMDJDZ0J4Szc3TkszTXVOcnJBOFVBeGJ2a1hj?=
 =?utf-8?B?d3FUeW1DV2ZtZFFzbUtuWEVhM1RWN0ovaHRTQk9HNFprSlNYQjYxdWUwUDNX?=
 =?utf-8?B?elZyNXMyTU9xVmRKSkZ5WFZmY01MeHpkb2NQN24xeUMrMjRqbWs3SGNVbE9z?=
 =?utf-8?B?alpCZjE4SkgzVms4MkdGa2luZG9uUGVmemtQVFRTdjRxWXhHcEhWYTd4Wkty?=
 =?utf-8?B?RjAwa0RUWWN6Rko4QnFUTlg2T0dIRVh4MkpVT25FTXI3SHg1Si9lU0ZpRkdk?=
 =?utf-8?B?ejJaeDhIWXdaVng1Z0hFcG1XSm5uRnBsWWhHNjNUK3ZzaFNiOUYzLzJSbkp2?=
 =?utf-8?B?V1QvK0RhMHNKcGRJemt6R1V2Q2Nab2Fkc0pCWmd1UUMzRUcwNzBJUWw3eXlZ?=
 =?utf-8?B?VURkM1c4Wmh2VTJKSllNYmVmK1ZYL09lbFhhdk5KUVJmL00wTlluNndvQzRB?=
 =?utf-8?B?bFoyQzVKVFRrZnBFTENOdStxcFRzeFkrWlpUdnU3WGpGZ2hHa0FUWm0rblky?=
 =?utf-8?B?WFAvVksxTGFsbTRUU1M4elp3aUJKTFI3L1dyRnZ0REdBblI4ZittdG16L3Vj?=
 =?utf-8?B?K1ZRV2pBUTVzbGQ1UzVmUHd0YTl5OS9RZHBvMm1BQ3cvc0RGZVZLRDdBUlFt?=
 =?utf-8?B?UXREU3A0UEg2K2lnR1ZPTm1xZVpUT042VFB3cmlyTWxzaERtTzZMLzMxWHNh?=
 =?utf-8?B?RVgzbXRhRHlCbW5qakRJeXZyTlUyUGNPZWhmcURjNWNhdkNLbVoyMTlYNDBE?=
 =?utf-8?B?UVBZN0ZrdG1GNk5vTFZVQ2RSMG1haHp6WUROMTlFZTFyNkxaL3A5NTZ0cFRu?=
 =?utf-8?B?YmREbW5DbmtyOGlIVFV3TFdxSWFRY1R0UlhIZUh4d1prRzY5S3JEeVBIc0R5?=
 =?utf-8?B?eUtiem84RmpnTmdhZjFCVHZYRC9TTlVkZjJxbzRTcFI5Y3NsYWlmTURpcm1i?=
 =?utf-8?B?YXZpT0dQWE5MbUlxdTVYUjFQTEFMZjRRUW9CVzdsdjZJbE1kNHl3T3lFQTZR?=
 =?utf-8?B?QXRRZldvOHNsSWlEU1ZWME5BTUdJQlk4VDVWMW5qS3d5NDlJSE9qWGdpVDJX?=
 =?utf-8?B?clYxZytNTDMwN1dnODhIOXFLSmloa1BHdEhCbmZzdkFEcjVtbnNxb3pvR3ZE?=
 =?utf-8?B?VW5QTnU5YTRDZXlGZFJlVXUvM3Y5UG9oQm9Vak5FR2Y2WVNGSWNuM29MazRu?=
 =?utf-8?B?ZGxPSnBCd2h3c2l6WUtmaGtjT0dMWTFPaGNSK2FDVUhRcGlWZFZRNHlmSUJL?=
 =?utf-8?B?VUxqTjVyRm9GWEx4QUttZlBUMEFtMTNjaEhZQ1JQaHVtUkluMEdrZTBpMHlX?=
 =?utf-8?B?Z0RlbTNrcVVXMnNYWlNQUU9leklqOEpOajduWTdleTQvdWNDcGE0eVcxeGdR?=
 =?utf-8?B?OWtzbmpZTWZGcnp1Z01taC9Mc3c2Z1dlRlBMRExiZk9veSt4a3BlNDc5TTc2?=
 =?utf-8?Q?tXRZJgVTLDWquoa2f7MFFGA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cec8ee-d1c9-40ca-7e93-08dd4f822979
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 18:37:41.8862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnde02ZQefCeJ+Vw4RcdDaUi3QdNfeuWsahKFtY7vOH5FAnhL0rMt16LRV+DdRwkLaDbTxAwwsLo9YwZtOgNwMRPaIeglJfI86jin5AV+1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7860
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_103818_932980_44FF4C72 
X-CRM114-Status: GOOD (  24.37  )
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

T24gMjAyNS0wMi0xNyBhdCAxNzoxMzoyMyArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pk9uIEZyaSwgRmViIDE0LCAyMDI1IGF0IDk6MjHigK9BTSBNYWNpZWogV2llY3pvci1SZXRtYW4K
PjxtYWNpZWoud2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPj4KPj4gT24gMjAyNS0w
Mi0xMyBhdCAxNzoyMDoyMiArMDEwMCwgTWFjaWVqIFdpZWN6b3ItUmV0bWFuIHdyb3RlOgo+PiA+
T24gMjAyNS0wMi0xMyBhdCAwMjoyODowOCArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pj4gPj5PbiBUaHUsIEZlYiAxMywgMjAyNSBhdCAyOjIx4oCvQU0gQW5kcmV5IEtvbm92YWxvdiA8
YW5kcmV5a252bEBnbWFpbC5jb20+IHdyb3RlOgo+PiA+Pj4KPj4gPj4+IE9uIFR1ZSwgRmViIDEx
LCAyMDI1IGF0IDc6MDfigK9QTSBNYWNpZWogV2llY3pvci1SZXRtYW4KPj4gPj4+IDxtYWNpZWou
d2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPj4gPj4+ID4KPj4gPj4+ID4gSSBkaWQg
c29tZSBleHBlcmltZW50cyB3aXRoIG11bHRpcGxlIGFkZHJlc3NlcyBwYXNzZWQgdGhyb3VnaAo+
PiA+Pj4gPiBrYXNhbl9tZW1fdG9fc2hhZG93KCkuIEFuZCBpdCBzZWVtcyBsaWtlIHdlIGNhbiBn
ZXQgYWxtb3N0IGFueSBhZGRyZXNzIG91dCB3aGVuCj4+ID4+PiA+IHdlIGNvbnNpZGVyIGFueSBy
YW5kb20gYm9ndXMgcG9pbnRlcnMuCj4+ID4+PiA+Cj4+ID4+PiA+IEkgdXNlZCB0aGUgS0FTQU5f
U0hBRE9XX09GRlNFVCBmcm9tIHlvdXIgZXhhbXBsZSBhYm92ZS4gVXNlcnNwYWNlIGFkZHJlc3Nl
cyBzZWVtCj4+ID4+PiA+IHRvIG1hcCB0byB0aGUgcmFuZ2UgW0tBU0FOX1NIQURPV19PRkZTRVQg
LSAweGZmZmY4ZmZmZmZmZmZmZmZdLiBUaGVuIGdvaW5nCj4+ID4+PiA+IHRocm91Z2ggbm9uLWNh
bm9uaWNhbCBhZGRyZXNzZXMgdW50aWwgMHgwMDA3ZmZmZmZmZmZmZmZmIHdlIHJlYWNoIHRoZSBl
bmQgb2YKPj4gPj4+ID4ga2VybmVsIExBIGFuZCB3ZSBsb29wIGFyb3VuZC4gVGhlbiB0aGUgYWRk
cmVzc2VzIHNlZW0gdG8gZ28gZnJvbSAwIHVudGlsIHdlCj4+ID4+PiA+IGFnYWluIHN0YXJ0IHJl
YWNoaW5nIHRoZSBrZXJuZWwgc3BhY2UgYW5kIHRoZW4gaXQgbWFwcyBpbnRvIHRoZSBwcm9wZXIg
c2hhZG93Cj4+ID4+PiA+IG1lbW9yeS4KPj4gPj4+ID4KPj4gPj4+ID4gSXQgZ2F2ZSBtZSB0aGUg
c2FtZSByZXN1bHRzIHdoZW4gdXNpbmcgdGhlIHByZXZpb3VzIHZlcnNpb24gb2YKPj4gPj4+ID4g
a2FzYW5fbWVtX3RvX3NoYWRvdygpIHNvIEknbSB3b25kZXJpbmcgd2hldGhlciBJJ20gZG9pbmcg
dGhpcyBleHBlcmltZW50Cj4+ID4+PiA+IGluY29ycmVjdGx5IG9yIGlmIHRoZXJlIGFyZW4ndCBh
bnkgYWRkcmVzc2VzIHdlIGNhbiBydWxlIG91dCBoZXJlPwo+PiA+Pj4KPj4gPj4+IEJ5IHRoZSBk
ZWZpbml0aW9uIG9mIHRoZSBzaGFkb3cgbWFwcGluZywgaWYgd2UgYXBwbHkgdGhhdCBtYXBwaW5n
IHRvCj4+ID4+PiB0aGUgd2hvbGUgNjQtYml0IGFkZHJlc3Mgc3BhY2UsIHRoZSByZXN1bHQgd2ls
bCBvbmx5IGNvbnRhaW4gMS84dGgKPj4gPj4+ICgxLzE2dGggZm9yIFNXL0hXX1RBR1MpIG9mIHRo
YXQgc3BhY2UuCj4+ID4+Pgo+PiA+Pj4gRm9yIGV4YW1wbGUsIHdpdGggdGhlIGN1cnJlbnQgdXBz
dHJlYW0gdmFsdWUgb2YgS0FTQU5fU0hBRE9XX09GRlNFVCBvbgo+PiA+Pj4geDg2IGFuZCBhcm02
NCwgdGhlIHZhbHVlIG9mIHRoZSB0b3AgMyBiaXRzICg0IGZvciBTVy9IV19UQUdTKSBvZiBhbnkK
Pj4gPj4+IHNoYWRvdyBhZGRyZXNzIGFyZSBhbHdheXMgdGhlIHNhbWU6IEtBU0FOX1NIQURPV19P
RkZTRVQncyB2YWx1ZSBpcwo+PiA+Pj4gc3VjaCB0aGF0IHRoZSBzaGFkb3cgYWRkcmVzcyBjYWxj
dWxhdGlvbiBuZXZlciBvdmVyZmxvd3MuIEFkZHJlc3Nlcwo+PiA+Pj4gdGhhdCBoYXZlIGEgZGlm
ZmVyZW50IHZhbHVlIGZvciB0aG9zZSB0b3AgMyBiaXRzIGFyZSB0aGUgb25jZSB3ZSBjYW4KPj4g
Pj4+IHJ1bGUgb3V0Lgo+PiA+Pgo+PiA+PkVoLCBzY3JhdGNoIHRoYXQsIHRoZSAzcmQgYml0IGZy
b20gdGhlIHRvcCBjaGFuZ2VzLCBhcwo+PiA+PktBU0FOX1NIQURPV19PRkZTRVQgaXMgbm90IGEg
dGhhdC13ZWxsLWFsaWduZWQgdmFsdWUsIHRoZSBvdmVyYWxsIHNpemUKPj4gPj5vZiB0aGUgbWFw
cGluZyBob2xkcy4KPj4gPj4KPj4gPj4+IFRoZSBLQVNBTl9TSEFET1dfT0ZGU0VUIHZhbHVlIGZy
b20gbXkgZXhhbXBsZSBkb2VzIHJlbHkgb24gdGhlCj4+ID4+PiBvdmVyZmxvdyAoYXJndWFibHks
IHRoaXMgbWFrZXMgdGhpbmdzIG1vcmUgY29uZnVzaW5nIFsxXSkuIEJ1dCBzdGlsbCwKPj4gPj4+
IHRoZSBwb3NzaWJsZSB2YWx1ZXMgb2Ygc2hhZG93IGFkZHJlc3NlcyBzaG91bGQgb25seSBjb3Zl
ciAxLzE2dGggb2YKPj4gPj4+IHRoZSBhZGRyZXNzIHNwYWNlLgo+PiA+Pj4KPj4gPj4+IFNvIHdo
ZXRoZXIgdGhlIGFkZHJlc3MgYmVsb25ncyB0byB0aGF0IDEvOHRoICgxLzE2dGgpIG9mIHRoZSBh
ZGRyZXNzCj4+ID4+PiBzcGFjZSBpcyB3aGF0IHdlIHdhbnQgdG8gY2hlY2sgaW4ga2FzYW5fbm9u
X2Nhbm9uaWNhbF9ob29rKCkuCj4+ID4+Pgo+PiA+Cj4+ID5SaWdodCwgSSBzb21laG93IGZvcmdv
dCB0aGF0IG9idmlvdXNseSB0aGUgd2hvbGUgTEEgaGFzIHRvIG1hcCB0byAxLzE2dGggb2YgdGhl
Cj4+ID5hZGRyZXNzIHNwYWNlIGFuZCBpdCBzaG9sZCBzdGF5IGNvbnRpZ3VvdXMuCj4+ID4KPj4g
PkFmdGVyIHJldGhpbmtpbmcgaG93IHRoZSBtYXBwaW5nIHdvcmtlZCBiZWZvcmUgYW5kIHdpbGwg
d29yayBhZnRlciBtYWtpbmcgc3R1ZmYKPj4gPnNpZ25lZCBJIHRob3VnaHQgdGhpcyBwYXRjaCBj
b3VsZCBtYWtlIHVzZSBvZiB0aGUgb3ZlcmZsb3c/Cj4+ID4KPj4gPkZyb20gd2hhdCBJIG5vdGlj
ZWQsIGFsbCB0aGUgS2NvbmZpZyB2YWx1ZXMgZm9yIEtBU0FOX1NIQURPV19PRkZTRVQgc2hvdWxk
IG1ha2UKPj4gPml0IHNvIHRoZXJlIHdpbGwgYmUgb3ZlcmZsb3cgd2hlbiBpbnB1dGluZyBtb3Jl
IGFuZCBtb3JlIHBvc2l0aXZlIGFkZHJlc3Nlcy4KPj4gPgo+PiA+U28gbWF5YmUgd2Ugc2hvdWxk
IGZpcnN0IGZpbmQgd2hhdCB0aGUgbW9zdCBuZWdhdGl2ZSBhbmQgbW9zdCBwb3NpdGl2ZSAoc2ln
bmVkKQo+PiA+YWRkcmVzc2VzIG1hcCB0byBpbiBzaGFkb3cgbWVtb3J5IGFkZHJlc3Mgc3BhY2Uu
IEFuZCB0aGVuIHdoZW4gbG9va2luZyBmb3IKPj4gPmludmFsaWQgdmFsdWVzIHRoYXQgYXJlbid0
IHRoZSBwcm9kdWN0IG9mIGthc2FuX21lbV90b19zaGFkb3coKSB3ZSBzaG91bGQgY2hlY2sKPj4g
Pgo+PiA+ICAgICAgIGlmIChhZGRyID4ga2FzYW5fbWVtX3RvX3NoYWRvdyhiaWdnZXN0X3Bvc2l0
aXZlX2FkZHJlc3MpICYmCj4+ID4gICAgICAgICAgIGFkZHIgPCBrYXNhbl9tZW1fdG9fc2hhZG93
KHNtYWxsZXN0X25lZ2F0aXZlX2FkZHJlc3MpKQo+PiA+ICAgICAgICAgICAgICAgcmV0dXJuOwo+
PiA+Cj4+ID5JcyB0aGlzIGNvcnJlY3Q/Cj4+Cj4+IEkgc3VwcG9zZSB0aGUgb3JpZ2luYWwgY29k
ZSBpbiB0aGUgcGF0Y2ggZG9lcyB0aGUgc2FtZSB0aGluZyB3aGVuIHlvdSBjaGFuZ2UgdGhlCj4+
IHx8IGludG8gJiY6Cj4+Cj4+ICAgICAgICAgaWYgKGFkZHIgPCBLQVNBTl9TSEFET1dfT0ZGU0VU
IC0gbWF4X3NoYWRvd19zaXplIC8gMiAmJgo+PiAgICAgICAgICAgICBhZGRyID49IEtBU0FOX1NI
QURPV19PRkZTRVQgKyBtYXhfc2hhZG93X3NpemUgLyAyKQo+PiAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+Pgo+PiBrYXNhbl9tZW1fdG9fc2hhZG93KDB4N0ZGRkZGRkZGRkZGRkZGRikgLT4gMHgw
N2ZmN2ZmZmZmZmZmZmZmCj4+IGthc2FuX21lbV90b19zaGFkb3coMHg4MDAwMDAwMDAwMDAwMDAw
KSAtPiAweGY3ZmY4MDAwMDAwMDAwMDAKPgo+SSdtIGEgYml0IGxvc3Qgd2l0aCB0aGVzZSBjYWxj
dWxhdGlvbnMgYXQgdGhpcyBwb2ludC4gUGxlYXNlIHNlbmQgdGhlCj5mdWxsIHBhdGNoLCBpbmNs
dWRpbmcgdGhlIG5ldyB2YWx1ZXMgZm9yIEtBU0FOX1NIQURPV19PRkZTRVQgKGRvIEkKPnVuZGVy
c3RhbmQgY29ycmVjdGx5IHRoYXQgeW91IHdhbnQgdG8gY2hhbmdlIHRoZW0/KS4gSXQnbGwgYmUg
ZWFzaWVyCj50byBsb29rIGF0IHRoZSBjb2RlLgoKU29ycnksIHRoaXMgdGhyZWFkIGJlY2FtZSBh
IGxpdHRsZSBiaXQgY29uZnVzaW5nLiBObywgSSB0aGluayB0aGUKS0FTQU5fU0hBRE9XX09GRlNF
VCB2YWx1ZXMgYXJlIGZpbmUuIEkganVzdCB3YW50ZWQgdG8gZW1icmFjZSB0aGUgaWRlYSBvZgpv
dmVyZmxvdyBmb3IgdGhlIHB1cnBvc2Ugb2YgdGhlIGNoZWNrIGluIGthc2FuX25vbl9jYW5vbmlj
YWxfaG9vaygpLgoKQnV0IEknbGwgcHV0IGRvd24gbXkgdHJhaW4gb2YgdGhvdWdodCBhYm91dCB0
aGUgb3ZlcmZsb3cgKyBjYWxjdWxhdGlvbnMgaW4gdGhlCnBhdGNoIG1lc3NhZ2UuCgo+Cj5GZWVs
IGZyZWUgdG8gc2VuZCB0aGlzIHBhdGNoIHNlcGFyYXRlbHkgZnJvbSB0aGUgcmVzdCBvZiB0aGUg
c2VyaWVzLAo+c28gdGhhdCB3ZSBjYW4gZmluYWxpemUgaXQgZmlyc3QuCgpJIGhhdmUgdGhlIHg4
NiB0YWctYmFzZWQgc2VyaWVzIGJhc2ljYWxseSByZWFkeSAoanVzdCBuZWVkIHRvIHJlLXJlYWQg
aXQpIHNvIEkKdGhpbmsgSSBjYW4gc2VuZCBpdCBhcyB3aG9sZSB3aXRoIHRoaXMgcGF0Y2ggYW5k
IDMgb3RoZXJzIGZyb20gdGhpcyBzZXJpZXMuCgotLSAKS2luZCByZWdhcmRzCk1hY2llaiBXaWVj
esOzci1SZXRtYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
