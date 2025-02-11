Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73791C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YuRnlPxnMeAhGTdtc06zWvWQ/JgzbbCVp1g8jZjM8R0=; b=K3D8y896xXPaaO
	+KX2uaOg/iRG1yATzE5DLhyyYD08aoIVv1jk9+j8NZMFOntIfqaPxrWq1uHjgBNKWtgcxZVKGkRlo
	F89bxtVfn7QfnAbIzgKWf4OsfL0t51y2xg6daeXO4tb7zAOI8++p/p3HZ4jbl52a7Sl+1ZApW1v5Y
	mKkkKvTT36wKHnPSnOLJ+bnkEIucAzz47sHumf2u9P1wvo1omc5YKWYKJuWK3nWQDXeruiMZdPOnO
	/ENPnocMpXgM8M0CEm70mR6XuFBxEcBQd26NaJNKR6daQd6gW8RJnzjU2iG2xGu6scBpRslmeTFTy
	GbwfjZ2rOFfi/uuaq1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thufF-00000004nKR-2iSi;
	Tue, 11 Feb 2025 18:07:17 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thufC-00000004nJY-3suh;
	Tue, 11 Feb 2025 18:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739297235; x=1770833235;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=31/9zzX4XdgVSUPnbJh0EsJD7cFr4Kx9wNnNWHNWRVQ=;
  b=T0L+qyU19dbMbVnhKhKk7aQf581V4+9rExRgBM/QGUZPaAFThqrv82+r
   i8ZjL+x11SCC/wTpepfvFRgR78JD06N9EmyktvWzynoefwpBjTNx7ePWs
   3nB7aR1GcAZb7XtLEzqgsLE5JtkbBZjIqUNJacPcjLJ9GfKE2jeSS0Qnr
   8bQD4tCPy3GFGCa4Q+9hcAggBoVMjxTaUtq0+ui5Iv8bRiijaR4xs14Cd
   eR9BZyjRtvwFj1Nvb6lfaso8nhuVtk1tsWOuAaoZgpJWCTLCmNZD9B9gd
   ZCyA78aPtGlHzYouJlu2lEaKkteecqP42euCvA+pSE6BvnH0arfpBdoVg
   w==;
X-CSE-ConnectionGUID: DOZk/yRPSceoMnGuJy+sUA==
X-CSE-MsgGUID: nNHD3ieXTACamOMiCUHLsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42775001"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="42775001"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:07:14 -0800
X-CSE-ConnectionGUID: Ee+KlhsyRbuGSvNcQ3gEVQ==
X-CSE-MsgGUID: EnsCil4JTCeHhclcpq2ZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="113225615"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Feb 2025 10:07:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 10:07:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 10:07:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 10:07:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDBtPDllVYjWaUtX7pyODBuGGd/Eg5D/Hj+nkDAWgM1WNYXkQh2E5tvEfnIs4KNfvADcEQFwb+St1qoW+Dh9q48Willft4M/LGtOHb8b/LNT503krQ+/D3gWO81VkCdk8YXGwqFW6bvMCmATJJsSzXmLKOGyg0IkHEhDR1wtRDY5ZyF1aoDL8jx+TRlLpLWVmTgcBLZ790UluFBCWBUvUO7YG+OiOu6fdxONyS1XkxolaOnwTsMy0popfYchNO/R4nDmOGKXuK/0fhlGB5G2cnlP1VkdI2o0XU45mQ53Vr0k8XQ0gQUrsQpO9p78SClZiPyb1XbAlSZxfImozVUa6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGGSQwV3a1a0L2knURqhiYZ41iqTJ6DHL5eMBp6RGSk=;
 b=iIiY/Tuimeb/FPednX9UstfxgYwXE00HLMupIAUaTmZFr+KtsIo4lvJxvBOw9Y6ZGMDnpprD1/lCmWu8Q31O3rM7IMoaJvw21QyQArv/0UM4zehsiiv0Yes37/kyqG07nf63HFibpnMpXPkm7Fcfvoz9WNE7/AHTY7pXblgNzkmoOEK5mkfktlZwtyjhiOrGD2Dtdn4Lk0duAPA0U1icRWYobsT+89yoQFzWvkRO5FZEKXIf2GdLnrstyDgPxX/Dwx+KKJ/WAR1s4GgJvGUmjLmPWn2NGCpFwTWJg9emLnqDOPMLA+NavaJIHUM3UeOTihJ7g5jfCerTG0Rin/DqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by SA1PR11MB8395.namprd11.prod.outlook.com (2603:10b6:806:38c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 18:07:09 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 18:07:09 +0000
Date: Tue, 11 Feb 2025 19:06:38 +0100
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
Message-ID: <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com>
 <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0315.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::6) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|SA1PR11MB8395:EE_
X-MS-Office365-Filtering-Correlation-Id: 744c0e24-d67a-469b-60bf-08dd4ac6e6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGdnT1Y4ZlBLT1BBL2t3bHhUS2V5YVVLOWNwdVRncEdrWTQxblM2Qzc1UXQw?=
 =?utf-8?B?dkg5V2M0UlhzR1U1OHBuOVJ0NEZRWmJPWm0rZEtJNTk2bWtRZ21RaEFoUmN3?=
 =?utf-8?B?OXhQK0xVT1N5b25CcHNmS2d3OFIwbVpYWHM3MUxJOE0va3lBKzN6QlJUaVZr?=
 =?utf-8?B?dGpDSWpteDJtTVlQemlyckRMbzVVUkY5ZFcvbDZkbXgyYVdZdjc4Vyt5T0NM?=
 =?utf-8?B?ZjVzWTVPN08vRkF5UXIvVnIxT1hQYkdKamtFRjBPajFQUUU0QkRnaWFmUnpW?=
 =?utf-8?B?V0dwd3FwYkFLSktEOEYvckxsaXB5cWg1cVlDV1NGclFLNFRUSXVrMkFlYndD?=
 =?utf-8?B?dGJDaGduUlNienVhUlBJOTI1bW5nS0cvM0IrbnFZc3V5SWFpOU9wZFBERHcz?=
 =?utf-8?B?NDlqcmpzeWJFdTM3aFQ4eGF6MTRZdFB3T0tXTndVb0ZZeFhNc09KQWp3Rklu?=
 =?utf-8?B?aXpSUVNzUCtJSmlOVkE4T2I1MGdNamtFMUh0Mjd1OXpVSnZlRG1IOVBmYktD?=
 =?utf-8?B?TzJ6djJVdDVoUGJZdEVTMjUzcy9LclNRc2g0bXJGTWg0dVMxekRTQ3lLa29W?=
 =?utf-8?B?R0ZjYlJMbjdmZzRxZWpraXdxbzRxQnhudzlsQXpRREdOcTFjVUJGMUhRUmpl?=
 =?utf-8?B?SWtWd3Z6cDc4RGJLN0VJWGVmVmtsSTV0MmFkclN5a2RsZ0hTemRvLzFZcSty?=
 =?utf-8?B?RVh5T3ZTMWtpYXRXanVlNTd3cEZsRFpQMlI2NTJCYlpENmRCQWJwQzl6Y0NI?=
 =?utf-8?B?cFNMVCtEV2dBTkkySVFFNmFRWko5YkpEWkZrVkRZaCtOUU90QmpNcDYvUFNo?=
 =?utf-8?B?TWFpV1M3SnF3UGdQOG5vbW1mNHQyUXVJZDhqRythUFd1bERsODdLOWRvYVZW?=
 =?utf-8?B?ZkVMbjdmdSt2M3lJWGNtb1E1UHE1UGd4b1ZmNTVvRnJnaWhkS01uR1JGZXVP?=
 =?utf-8?B?UURXa00yKzlDYWFEaGt1aHNvMUU5OFlRU3AvZXFMeHRCUGhHeXA0ZXh1dDR2?=
 =?utf-8?B?ZGJtZXh2aGcxTnBKcUF5M0w0OHRIc2ErdTArWGpBUWNwWlR6cGc4TVIrTlQr?=
 =?utf-8?B?d01qTnIrUUk0UGVXQVhVaVJhSkptdDlpRWE3YUFkS0dSOEtoMUZ0ZWpRQyt1?=
 =?utf-8?B?NW5UN1JhOXN5aFBnOTllQ1FLaXcxcngxeWxUbEtiNUhHWWhQYWFtUExHYUw1?=
 =?utf-8?B?RjBFOHJBMmJObWFHb243b2ZCWjNVekdRZENjM3VtcmFPN3pjS3F0VFluN2JU?=
 =?utf-8?B?VzVIcER1ZjExeGhWQ2tvQXFKZUFWSWIzUlZraHU2R3MxVVBXN25LTGdpa1JI?=
 =?utf-8?B?MWFCZ2VUWEVHSUpIUzJ4Mjk1Slluc2dxTDkyeEV1VHVRcG5mYklaTjFPWXAv?=
 =?utf-8?B?NVZmVlo0MHByaHA0WGQ4WGdCSy96ZnE0bDE3Z201RkM1cGhYWWdzaCtOZm83?=
 =?utf-8?B?UVVmYVBBcC9zaUJ4V1ZybzlRNUFLMDU2ald3SUNrSnV5WDhuUk9neHViU1ZY?=
 =?utf-8?B?NXVpRXNwMWVQRzBKOVJFZ2JSVVlISFVTVnRwd1U4TEVkUnhOTGo1enI2dnN5?=
 =?utf-8?B?aU13UmZIaHJKUVBISHRCdnQwWU5VQ3lrckZGcDhEcWVUMEpreUNDeWZUSmhP?=
 =?utf-8?B?b3VPdTlmVVRxT29YbHNQQmlzUTBhYm1wS29lTi81OFBoNGhoRHpiSElVcmVr?=
 =?utf-8?B?cmQwMFpYWVJ5WVgvZ0IzVzFzaThUeGQ1Wk0vRGxLVFp4SkY2TDYxVmgvYnRH?=
 =?utf-8?B?aTdwWUZBRmNkZUZzQjdFSVdqeG1OQ3ZQbFZmS1FqZjJlVVJoVjhFU3VpTXNV?=
 =?utf-8?B?QlVxdE82YzlvYkltNFBOeGx5K3djd0J5alFKbWs3SDg0TER1NHZIVTMxTFNP?=
 =?utf-8?Q?r9T0oODdSzcQX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1RWcXhVTWd4anErZ3JmVTd6cUwxMWh6QVJFa0RweHMrVlllaW1hUzJhRXhk?=
 =?utf-8?B?U0dXNSs0S0RiK0t6WjFhOGVicEptajFrQ3dXSnptZ2JjRkM3bHZRZkVaeWpu?=
 =?utf-8?B?RnM1TkVna0FxdEtDTzE2KzZqS3dlWmI0ZWRjTkttYnVCanVWVWZZZ3JCOUhz?=
 =?utf-8?B?aVNnVk9ZQkZYekl2NnNoNGdhNXMyS0NDK2FGOElFbWhJSmZneExWWFNiWDFx?=
 =?utf-8?B?ODA5UDE4eS80WE53N3dyYjFiZzZhR0tCQTdVWmhIZVhQMmtpaU9RRWYraUpm?=
 =?utf-8?B?bFBVZFRPbnBkVCt3Q04xaXRCbFlURDRmYUFGRStBbDVmcWk1NW8rQlVUd0sx?=
 =?utf-8?B?U1ZKcWpGZjBnay9VN1NnQVIrSDhQa2xnZ1JkYXN0YnFvUGx5QW4wVTl3WDUv?=
 =?utf-8?B?SjJIZGJzYjRxaFRTdklIQnZaMmxyUzI1eVBlelNLVmRjWU5FNEFrcEtjN2VT?=
 =?utf-8?B?Wk1tUlFQNk9DREQrU2lZZUptRHJQVVJVV3NmZGZKT3FaeHVLaUxSQ3kxN3ph?=
 =?utf-8?B?bzE4dUwya1NGSnB0VlNaV3RhenQ1UWRxelV0ck82Z1g0SGtPcFFPSnhZbWx5?=
 =?utf-8?B?NGFGR0ZoOTNpYTNBdnd0cXpYR0doNnhBdFVub1cvb0FGcVVMdmhjT3FNRVRH?=
 =?utf-8?B?UitqMk56ZnhTN1pVdGJNUnZKM2RqZ0JoMWUycE9Jd29OdEYxTkRVeHNna3VW?=
 =?utf-8?B?dGl3NHk2Z2UvbEc5VjkvcjZsZG10cy9lbklWbFVWYkJ4RVg5Yys3ZkdtMGFP?=
 =?utf-8?B?Mm9HOEpYbnhQVngrVGNsWkRHRTNZNkdQZm1ta3kwTEgxUGpyUnJTWVdpb2g3?=
 =?utf-8?B?UmxXTy9ZdmR6dFp2RkM1YmNwcm5BK2owTGh3cXZnZEdMZU5YUnlSUEcvdTRY?=
 =?utf-8?B?YS9TajVUWFVwK3hBS01abDBZQ3pvTlg0MVFVQnE2RVN3NzdaTThhSm42cThy?=
 =?utf-8?B?RGF5dm4xbVlZMkZ3bWUydHBoWTI3emNaYlA4K3pHb3lMaHpuMlNOc1lmdmtx?=
 =?utf-8?B?UnoyVUQ5T0ZLYktxRlBobHlvdWlwVENUS3dmL20xWk1YMWF4MVEySmNnbCtw?=
 =?utf-8?B?NVBEYnZ2ZmZlZ0orVWxUMndCSVZJMmdma0Y4RHFrVzFUbm1lblR0TGdnNFlt?=
 =?utf-8?B?NU0yNzVTS1QxU00vd0twa240RGF6Y3RhdU9obGp4SkxESXJ1Skhia2xOdVA1?=
 =?utf-8?B?MXdpUHNQMlA0YmlZYXlhNS96RXN5UVBYU2dYNXZNSjUvcjBOeWxBaUNZRXNy?=
 =?utf-8?B?YXRPZUdNRE5YeHpDNGwvL0s3ZmMzdFVsSmIwSXA4Z1NqeWdKWjBQbERhMDNj?=
 =?utf-8?B?NDBTNzU5bjNFclpaNkthSFlua3ZYSU5POE43RUJ0QXdFLzdpcE9jdUVSMFk5?=
 =?utf-8?B?UCtqc2VKSXExS0VlNU9TT1l0d2pPb2o2SkMzZ2dURFFzbjZhNko5TFQvSDFM?=
 =?utf-8?B?RXBCVit1R1hsd2Vud1VmMGI2eGloOExDUDRvZjdQWlRtZ1h5R1lDZW1ySS9P?=
 =?utf-8?B?RTNaemtTUW4xUmU1S1gwREIvMjVRWmJqZXEyNWJOb1YweXIwYlJrMGt0c2pw?=
 =?utf-8?B?ZUN3MUxtaG1rUEFldzRwS2RiMnlFZ0Mxdi9kTWFJWGFIVThPcys3dnN2Vmtj?=
 =?utf-8?B?cGlkUjZLUm9MREJrTHlVWUprcFlISlBlRHNKZWw0a3NUK1lBdzkvZ1Q5d09Y?=
 =?utf-8?B?UGYyeFR1MXpxTm0xREE5bGM2bGtnSG1rTWlxM1YyeEdUN2FpTDRoQmF0eFVq?=
 =?utf-8?B?RWNnRHFVZ2VlRFVMNlRjd0N1a3hZT2s5QUZZVFBSZmNuUm9oZlpQQzljM0dY?=
 =?utf-8?B?NnNWU3pQcHNONy9sOWg2OVc5QjB2LzNkZlRZN050Y0x4bUxOdmlGZVUyR2lC?=
 =?utf-8?B?WVhXQ29xR1h4TGdmSW11SWd1b291WlBnUDUzeVM1UmlmTlhPd09CQzJjbERj?=
 =?utf-8?B?YzZseXo1V0d6Mmc5OGxCbnlMSk85bnQwUVhzK3FZVitBVW1YK2VPSkhBb2o0?=
 =?utf-8?B?YnlUai82bEZpK01td1lHZkZyRm5meTRBcmp5eUpQMDBqdXRnM0NCaUo1Smww?=
 =?utf-8?B?UnplUzJwUUU3V2cyVnlYUUV4UkJ5MlcwU0gwckwwUEowejlubUlpRGhUSWxt?=
 =?utf-8?B?ajRNV0k5TmJaR2IveWNycEpSQ3FuM2htVDhTaG5vU0Ywc2dsM2phZ3VRNTY0?=
 =?utf-8?Q?IunXcSC8NWf9Gcj9ORviwic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 744c0e24-d67a-469b-60bf-08dd4ac6e6df
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 18:07:09.6205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aptKyYxRPfpOIhoGzVGPdv5C4Hgs8MsoygiTU7AtuipkZ3StJS9an7MVsvNz24nC9CZduH5Wv+JgvRNe6AZUqTNnwxDL3u1oEw/X5TmJWp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8395
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_100714_981253_C070831B 
X-CRM114-Status: GOOD (  24.78  )
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

T24gMjAyNS0wMi0xMCBhdCAyMzo1NzoxMCArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pk9uIE1vbiwgRmViIDEwLCAyMDI1IGF0IDQ6NTPigK9QTSBNYWNpZWogV2llY3pvci1SZXRtYW4K
PjxtYWNpZWoud2llY3pvci1yZXRtYW5AaW50ZWwuY29tPiB3cm90ZToKPj4KPj4gT24gMjAyNS0w
Mi0xMCBhdCAxNjoyMjo0MSArMDEwMCwgTWFjaWVqIFdpZWN6b3ItUmV0bWFuIHdyb3RlOgo+PiA+
T24gMjAyNC0xMC0yMyBhdCAyMDo0MTo1NyArMDIwMCwgQW5kcmV5IEtvbm92YWxvdiB3cm90ZToK
Pj4gPj5PbiBUdWUsIE9jdCAyMiwgMjAyNCBhdCAzOjU54oCvQU0gU2FtdWVsIEhvbGxhbmQKPj4g
Pj48c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+ID4uLi4KPj4gPj4+ICsgICAg
ICAgICogU29mdHdhcmUgVGFnLUJhc2VkIEtBU0FOLCB0aGUgZGlzcGxhY2VtZW50IGlzIHNpZ25l
ZCwgc28KPj4gPj4+ICsgICAgICAgICogS0FTQU5fU0hBRE9XX09GRlNFVCBpcyB0aGUgY2VudGVy
IG9mIHRoZSByYW5nZS4KPj4gPj4+ICAgICAgICAgICovCj4+ID4+PiAtICAgICAgIGlmIChhZGRy
IDwgS0FTQU5fU0hBRE9XX09GRlNFVCkKPj4gPj4+IC0gICAgICAgICAgICAgICByZXR1cm47Cj4+
ID4+PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTl9HRU5FUklDKSkgewo+PiA+
Pj4gKyAgICAgICAgICAgICAgIGlmIChhZGRyIDwgS0FTQU5fU0hBRE9XX09GRlNFVCB8fAo+PiA+
Pj4gKyAgICAgICAgICAgICAgICAgICBhZGRyID49IEtBU0FOX1NIQURPV19PRkZTRVQgKyBtYXhf
c2hhZG93X3NpemUpCj4+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4+ID4+
PiArICAgICAgIH0gZWxzZSB7Cj4+ID4+PiArICAgICAgICAgICAgICAgaWYgKGFkZHIgPCBLQVNB
Tl9TSEFET1dfT0ZGU0VUIC0gbWF4X3NoYWRvd19zaXplIC8gMiB8fAo+PiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICBhZGRyID49IEtBU0FOX1NIQURPV19PRkZTRVQgKyBtYXhfc2hhZG93X3NpemUg
LyAyKQo+PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+PiA+Pgo+PiA+Pkht
LCBJIG1pZ2h0IGJlIHdyb25nLCBidXQgSSB0aGluayB0aGlzIGNoZWNrIGRvZXMgbm90IHdvcmsu
Cj4+ID4+Cj4+ID4+TGV0J3Mgc2F5IHdlIGhhdmUgbm9uLWNhbm9uaWNhbCBhZGRyZXNzIDB4NDI0
MjQyNDI0MjQyNDI0MiBhbmQgbnVtYmVyCj4+ID4+b2YgVkEgYml0cyBpcyA0OC4KPj4gPj4KPj4g
Pj5UaGVuOgo+PiA+Pgo+PiA+PktBU0FOX1NIQURPV19PRkZTRVQgPT0gMHhmZmZmODAwMDAwMDAw
MDAwCj4+ID4+a2FzYW5fbWVtX3RvX3NoYWRvdygweDQyNDI0MjQyNDI0MjQyNDIpID09IDB4MDQy
M2E0MjQyNDI0MjQyNAo+PiA+Pm1heF9zaGFkb3dfc2l6ZSA9PSAweDEwMDAwMDAwMDAwMDAwMDAK
Pj4gPj5LQVNBTl9TSEFET1dfT0ZGU0VUIC0gbWF4X3NoYWRvd19zaXplIC8gMiA9PSAweGY3ZmY4
MDAwMDAwMDAwMDAKPj4gPj5LQVNBTl9TSEFET1dfT0ZGU0VUICsgbWF4X3NoYWRvd19zaXplIC8g
MiA9PSAweDA3ZmY4MDAwMDAwMDAwMDAgKG92ZXJmbG93cykKPj4gPj4KPj4gPj4weDA0MjNhNDI0
MjQyNDI0MjQgaXMgPCB0aGFuIDB4ZjdmZjgwMDAwMDAwMDAwMCwgc28gdGhlIGZ1bmN0aW9uIHdp
bGwKPj4gPj53cm9uZ2x5IHJldHVybi4KPj4gPgo+PiA+QXMgSSB1bmRlcnN0YW5kIHRoaXMgY2hl
Y2sgYWltcyB0byBmaWd1cmUgb3V0IGlmIHRoZSBhZGRyZXNzIGxhbmRlZCBpbiBzaGFkb3cKPj4g
PnNwYWNlIGFuZCBpZiBpdCBkaWRuJ3Qgd2UgY2FuIHJldHVybi4KPj4gPgo+PiA+Q2FuJ3QgdGhp
cyBhYm92ZSBzbmlwcGV0IGJlIGEgc2ltcGxlOgo+PiA+Cj4+ID4gICAgICAgaWYgKCFhZGRyX2lu
X3NoYWRvdyhhZGRyKSkKPj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPj4gPgo+PiA+Pwo+Pgo+
PiBTb3JyeSwgSSB0aGluayB0aGlzIHdvdWxkbid0IHdvcmsuIFRoZSB0YWcgYWxzbyBuZWVkcyB0
byBiZSByZXNldC4gRG9lcyB0aGlzCj4+IHBlcmhhcHMgd29yayBmb3IgdGhpcyBwcm9ibGVtPwo+
Pgo+PiAgICAgICAgIGlmICghYWRkcl9pbl9zaGFkb3coa2FzYW5fcmVzZXRfdGFnKCh2b2lkICop
YWRkcikpKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj5UaGlzIHdvdWxkbid0IHdvcmsg
YXMgd2VsbC4KPgo+YWRkcl9pbl9zaGFkb3coKSBjaGVja3Mgd2hldGhlciBhbiBhZGRyZXNzIGJl
bG9uZ3MgdG8gdGhlIHByb3Blcgo+c2hhZG93IG1lbW9yeSBhcmVhLiBUaGF0IGFyZWEgaXMgdGhl
IHJlc3VsdCBvZiB0aGUgbWVtb3J5LXRvLXNoYWRvdwo+bWFwcGluZyBhcHBsaWVkIHRvIHRoZSBy
YW5nZSBvZiBwcm9wZXIga2VybmVsIGFkZHJlc3Nlcy4KPgo+SG93ZXZlciwgd2hhdCB3ZSB3YW50
IHRvIGNoZWNrIGluIHRoaXMgZnVuY3Rpb24gaXMgd2hldGhlciB0aGUgZ2l2ZW4KPmFkZHJlc3Mg
Y2FuIGJlIHRoZSByZXN1bHQgb2YgdGhlIG1lbW9yeS10by1zaGFkb3cgbWFwcGluZyBmb3Igc29t
ZQo+bWVtb3J5IGFkZHJlc3MsIGluY2x1ZGluZyB1c2Vyc3BhY2UgYWRkcmVzc2VzLCBub24tY2Fu
b25pY2FsCj5hZGRyZXNzZXMsIGV0Yy4gU28gZXNzZW50aWFsbHkgd2UgbmVlZCB0byBjaGVjayB3
aGV0aGVyIHRoZSBnaXZlbgo+YWRkcmVzcyBiZWxvbmdzIHRvIHRoZSBhcmVhIHRoYXQgaXMgdGhl
IHJlc3VsdCBvZiB0aGUgbWVtb3J5LXRvLXNoYWRvdwo+bWFwcGluZyBhcHBsaWVkIHRvIHRoZSB3
aG9sZSBhZGRyZXNzIHNwYWNlLCBub3Qgb25seSB0byBwcm9wZXIga2VybmVsCj5hZGRyZXNzZXMu
CgpJIGRpZCBzb21lIGV4cGVyaW1lbnRzIHdpdGggbXVsdGlwbGUgYWRkcmVzc2VzIHBhc3NlZCB0
aHJvdWdoCmthc2FuX21lbV90b19zaGFkb3coKS4gQW5kIGl0IHNlZW1zIGxpa2Ugd2UgY2FuIGdl
dCBhbG1vc3QgYW55IGFkZHJlc3Mgb3V0IHdoZW4Kd2UgY29uc2lkZXIgYW55IHJhbmRvbSBib2d1
cyBwb2ludGVycy4KCkkgdXNlZCB0aGUgS0FTQU5fU0hBRE9XX09GRlNFVCBmcm9tIHlvdXIgZXhh
bXBsZSBhYm92ZS4gVXNlcnNwYWNlIGFkZHJlc3NlcyBzZWVtCnRvIG1hcCB0byB0aGUgcmFuZ2Ug
W0tBU0FOX1NIQURPV19PRkZTRVQgLSAweGZmZmY4ZmZmZmZmZmZmZmZdLiBUaGVuIGdvaW5nCnRo
cm91Z2ggbm9uLWNhbm9uaWNhbCBhZGRyZXNzZXMgdW50aWwgMHgwMDA3ZmZmZmZmZmZmZmZmIHdl
IHJlYWNoIHRoZSBlbmQgb2YKa2VybmVsIExBIGFuZCB3ZSBsb29wIGFyb3VuZC4gVGhlbiB0aGUg
YWRkcmVzc2VzIHNlZW0gdG8gZ28gZnJvbSAwIHVudGlsIHdlCmFnYWluIHN0YXJ0IHJlYWNoaW5n
IHRoZSBrZXJuZWwgc3BhY2UgYW5kIHRoZW4gaXQgbWFwcyBpbnRvIHRoZSBwcm9wZXIgc2hhZG93
Cm1lbW9yeS4KCkl0IGdhdmUgbWUgdGhlIHNhbWUgcmVzdWx0cyB3aGVuIHVzaW5nIHRoZSBwcmV2
aW91cyB2ZXJzaW9uIG9mCmthc2FuX21lbV90b19zaGFkb3coKSBzbyBJJ20gd29uZGVyaW5nIHdo
ZXRoZXIgSSdtIGRvaW5nIHRoaXMgZXhwZXJpbWVudAppbmNvcnJlY3RseSBvciBpZiB0aGVyZSBh
cmVuJ3QgYW55IGFkZHJlc3NlcyB3ZSBjYW4gcnVsZSBvdXQgaGVyZT8KCi0tIApLaW5kIHJlZ2Fy
ZHMKTWFjaWVqIFdpZWN6w7NyLVJldG1hbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
