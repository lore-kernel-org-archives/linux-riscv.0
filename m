Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B61D111BD
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiYsYgwfarRQq8818Rj9D2nZsOcq+bz7gf4SD32C61g=; b=NhKzwofkSyVs1s
	+/RmOA9SYOz71G6r6K9km/O6dt4C1GPvwN7gFtAcpz30YQd8/Km65shFVHWLOayDhhEWDxwLLfuRD
	Bov/ojAgxPfZixS3CG7qDgTvDr45uHfZFT1Z1DXhWFkXs1YRon4vlckZ2Fti3SJhxQJGoNOE4Ku91
	d6yKkgaW9AAHwbLbHmjpywqLzHeyz4byFOIkAkjAbxv7pd0XIYwZ1vMktmAMkm2hGPAwlAR1Pi8At
	D9c7o7JCKsrB13y+5QNgl8HDIXoQ9nBLgYfo/8pa3VWpsSkxyPHNlceIIJyO5VrdK6MlSHqpdawce
	KNVdDrRZSPRwz7PB8uEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sXH-0000000Cz4Z-3LHG;
	Mon, 04 Nov 2024 08:34:07 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7sWZ-0000000CymS-0UUX;
	Mon, 04 Nov 2024 08:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730709203; x=1762245203;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SBUxsoIl+ujRD2QuSpw7uNj//62vAV7KS6hUvxNZqiM=;
  b=ky9PIBo8LhZKa7kvn2q9hCbOXbMa0AhRR1/G3RK1/cnNRN+s+56uP6e/
   HL1zm5n+IEyZb1kie0jj6Q3psT13PD1mDPsF6cxCUeZft1wC5ln9+h9b3
   v0Pt6169om9DIh2+1VWQ8WafWhK0zfzCHMkpvGse0IpliyPRa9RjCqCIo
   cGa6N7RF9uhJcZ3gQCqRRC5XKCydrLL1bK/P9XduCTR0WKn5gOUK0uFVP
   4BgSvUdJIHAchltWojuPB42tDeV5k1s4QxOFQbWJJZfElq401P6euqRaW
   Whr/q2djEtPHuSSlDrdCx8ddO7Cia+goFrSVgHg3Tzhjtd5FSrg6jgqth
   w==;
X-CSE-ConnectionGUID: QdtutvayT6OfYqV2sMskyA==
X-CSE-MsgGUID: /cAVDl45Q6Gpx6Z1kD7LYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41500959"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41500959"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 00:33:13 -0800
X-CSE-ConnectionGUID: LJASWSgvQpqWMDpM5UdEWQ==
X-CSE-MsgGUID: XNes8ncuRY+h++vbMw6cnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="88716801"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 00:33:11 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 00:33:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 00:33:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 00:33:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeuVi/AIpVu823e8rpV22fAYQK6UI5ZqDJB/FF+74aBug/dYf/Y6RhiKMtPwL2MjHTXGzlxAwNfkpuK4pIYmdASUPnqITogniR+/T36zL56/CtN/TGHIom9bmhuOioXD1i3YYH8TWKm0tw/T3qPn0yFRpRXH/dbAr2op6HJWITdAuJZuOAIWqJ2ZRPGoWdFvKyDRNV3QyHEW+ycOnfB6MRjYYElh5mKUBavVmC6+u+WGfpA1cbEXc/H/E8Rgt+JAuoYGQLqcz389e6bxSzXtV+R2uSbf/oP/ZxH6if7rYCyok7xF7kX86bxH+NuzPUr6vBNSXLLRAC78NARYmonTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBUxsoIl+ujRD2QuSpw7uNj//62vAV7KS6hUvxNZqiM=;
 b=KHjsflyj4LR2528599lQnnPiE8m6d1ELiq5A2fjPtDcH4N3p5yN27sxvDjA40H4SKA/A1TXRKFWeTbmn6uNdkfqFWMS505cfFh7StWuAtXwmp3HzT+GK0j3kS1JJVUo/lyJGeSJ01pJcuDdDdQwzMZTXNYXLYYNo1NjVqvBqtRbSSv+ayN8JyUl9buWxDLfpTWHbJ9D2/mnKfe8ATeqeSr9y8ra9hOz2ppZTxinNTtMTXxcvAvVkPquftFRKJdNHrjoJVQqUl99BVp7s1qbxdE8X/O6bxDfvJ4Gvis6QIj2xgFOdG+GbwjCbPpx8P0kOmOKXBaGbQw/zEcKH2XMwqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5750.namprd11.prod.outlook.com (2603:10b6:8:11::17) by
 DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.29; Mon, 4 Nov 2024 08:33:06 +0000
Received: from DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a]) by DM8PR11MB5750.namprd11.prod.outlook.com
 ([fe80::4df9:c236:8b64:403a%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 08:33:06 +0000
From: "Reshetova, Elena" <elena.reshetova@intel.com>
To: "Manwaring, Derek" <derekmn@amazon.com>, "Hansen, Dave"
	<dave.hansen@intel.com>
Subject: RE: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Thread-Topic: [RFC PATCH v3 0/6] Direct Map Removal for guest_memfd
Thread-Index: AQHbKtKhCUbJUgt2lUeVsVW+MLeJCbKgnuYAgAAOfACAAOHOgIABC0kAgAANywCABCeKsA==
Date: Mon, 4 Nov 2024 08:33:06 +0000
Message-ID: <DM8PR11MB57509ED04CB0730680735AC9E7512@DM8PR11MB5750.namprd11.prod.outlook.com>
References: <784d1522-0451-4844-a334-8b7d49019437@intel.com>
 <7bd627df-0303-4ded-b8c8-ceb84fb20f0d@amazon.com>
In-Reply-To: <7bd627df-0303-4ded-b8c8-ceb84fb20f0d@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5750:EE_|DS0PR11MB7767:EE_
x-ms-office365-filtering-correlation-id: 44b7022a-1098-4d80-97b3-08dcfcab4e38
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?akpFbHRObjRIclF2aGpxVjNRZHFrUDV4VkxaMEcvQ1F1ejRlWUthY04zN2hZ?=
 =?utf-8?B?V21SaWpNQXZoK1czTE5QbHlGV1JrbS96SmFpNzVpSnQvQjVLbEtyRkhsNkRC?=
 =?utf-8?B?WVgvVnNackVUQkpvSVdONElHN2hBZUxnbUM3MnFrUDV3WFRlNVEzeHpuaDJ4?=
 =?utf-8?B?NGtWYXV2N3BWckVJZE00ZGhxQSt6NFNEK2JYanFiQjNXWVgzRXpzbE52OFJw?=
 =?utf-8?B?WHo0cmdkb3lUL3pjWDlBNGt2RGxyQkQrR1RQNzZYcVZpZ2xGcHdlYlFHTGFx?=
 =?utf-8?B?SlhXQVJlQzZ3TUY4WlNzQVZmK0c0ZjhrdEJrRnlsUGwrc3dFM1lVZldjZFk1?=
 =?utf-8?B?RmQvNEd5U2cyNEcvVE12ektWZDdwN09CNFBLRHdNMWNyWnhUZE1DTlEvNjdB?=
 =?utf-8?B?NS92dUszbEJSSjdxQVFNekZBYWVIWkdkY3dEMFFqSU5VMDVmMmJaT2l4cEdR?=
 =?utf-8?B?akt2YTN5SU5Sb3dkOXgzQ0lOTkJSYmVkdllHQWlmSDhuL1l1bEhRcXIzanhR?=
 =?utf-8?B?NUY5TW9EU3BUZEI2VjJsTTBUYWNTMHBxZGFTNytkTDFzUEFFSmJnUkZpa0hl?=
 =?utf-8?B?RnBzak50eTZrcWNsTDVjRTlmaW9iUXJaYUI5NjQyTjZySnlmNVZOenlVanhK?=
 =?utf-8?B?S1p5cjgrNGxjbk1YV0QwVUl4Sy9oYnpmenhJYjNxaWdjOFBsL0J6cUxOUThG?=
 =?utf-8?B?eFRhZXFTR29yUGd5S1ozdGZwZ09DM3E1M1Qydm5ZTnhzaDB6NWJ1Ylk0RWNp?=
 =?utf-8?B?eWZHZzFvOXdlLzhrQm5qbjlzTzRRYk9TTml5VmFnY0xLOUxDcGNPMXJsQlpj?=
 =?utf-8?B?K1V4bU5DbnhOelFwaDdCZ0syUEtMSGo3TDNrakRoQVdBYi9yQUM2NVBSbWl0?=
 =?utf-8?B?VFpWNC93aGNCUXpyQmhGTlNrazgvdXd6R3JIbERDaUhwbWVvc3l5aVNseWJT?=
 =?utf-8?B?azNqd1BGeHIrRWJPTFVpd0V1ejcrYUtORUFVTWc3NlBDL3V6MHFzUmNidHd2?=
 =?utf-8?B?aU5uZEJHTEM1dWs4NmxwVUdSSFpVY2ZTMHFBVHJlSnNlUlhBRHVsWkFialFv?=
 =?utf-8?B?b3d3QlRMVThlUy82Q04zV2V6ZkVqQkxHQWR1Q29FNVpaVXJPUGc2K25mZyty?=
 =?utf-8?B?TUVLNFdXbklvWHgzb0pGQ2ZPckhZYnhsc2Frb25SaHJRMkhvMG9UMmlSRjA2?=
 =?utf-8?B?aEpLdFdjNkIwSHI3cW1QSWFZSmJ4U1R6QXNHTzM0NWZHcXQ4cldFbUNJcTZS?=
 =?utf-8?B?Smd6ZS92czFUZGhvREZxZnQ5U04vd3ZiNGNYTlhYUFdvbFdDYll3R2F3TjJT?=
 =?utf-8?B?THBRMXVtTHVPS2oxcEdhZ05tR3FmTjRwdFR6K2tSUXBzN0U4OTByUElRdVZ6?=
 =?utf-8?B?Qk93ejhSTDFzVVFTN0VGNVpKRXgySlhQZGRpNkl3VU5EZkJZRXgrUmpkZ2h0?=
 =?utf-8?B?QXF2cU8xaTNmMEo3Wnl6aDgraml5MDJPckdCcUVRV25ZS1RPRXc5OTlqZUlY?=
 =?utf-8?B?ekI3L0hHUHRvSzMyZ2d0WHJlN2Faa2hzZW0xY1BQRUhzSDBFZW1aendGOCtD?=
 =?utf-8?B?NmhLVUEyU2VHV29uSHlrc1lSRUtZZXJETmIyY2tPUkcrZHB0b3ZGOXV3S3l6?=
 =?utf-8?B?cnJGL3RxV1RBMUkxSWNCS3YxdEpvWTYrRG9pMjlVTGQ3REk1TllSZzRsNTRI?=
 =?utf-8?B?NzNnYVcrSFRxTzV4T2ZyRGdXVHdsL1BFZnJGaytxNU1GcWtnU001dk9nN3B2?=
 =?utf-8?B?TFRTdXNSOWV0VnNOaXI2UFoxenpkN0JDQkkxeXFYYUpkcTIxamhvQUg5bjVv?=
 =?utf-8?B?L1BUdzN5ekFjUlNhaHdjNFgyckxjL3Z6MHEzUFFNTGtIQ2p3Zmo2OVZOcGVD?=
 =?utf-8?Q?w0iy4WvSwrnlu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5750.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QjBpdzVxUFlVNW1sM2U3aE9HclRhd0FvVEdGUlM4ZkZhQTFoTUJXaG9TRUtB?=
 =?utf-8?B?Y3VzOTNFWFBHQ2tnNnV4QkJha0VYYXpabmIvUXhOSGtJVDFTQi8yRXprNDcy?=
 =?utf-8?B?WVVlR2k5MG9sN0Jpc1Z5MUhCQXJNTWJvUS9SeE9jM1JHTGE0WVdsNDF4QnpL?=
 =?utf-8?B?MmRJcm1DM1F1Yk5nT3ppbkpjekpKOCtNSEZSUWJhOGlUeCtRZ3FEOUZNNWMw?=
 =?utf-8?B?YVhFSkRDVThxOElMMmlIVDU1TXdFNW5xWXNBYlgzcUdrZGRNQklkNzVrcERh?=
 =?utf-8?B?c1lvOWp1M09xazl4RjY4dHBHLzQvTFZpWEVVNmZQSGIyUEhyK0QrL21wRjV5?=
 =?utf-8?B?M2lNeGhOK3FRSG5HRUJMMU1saE5lcmJzSmJMYlVjeEF4THBtQU9xaURxYUZu?=
 =?utf-8?B?Tkx6U2lSYWE5SzcrNmxYVitGeWR2cGNJdjVSOEk1Z3U0VzlLVXFiam1NNzM1?=
 =?utf-8?B?UnN2T1lWN3NGUWkzd1NJK0tkTmJYaDlWWWIzNjllZzVxUisxcFBPSFdNWUx4?=
 =?utf-8?B?SkVhU1ZIVW9pajZwNW43MkFiVkpBcHl4bTlOQzFvUy8rbHRYeWxJT1dRM0U3?=
 =?utf-8?B?Wk5tZDBaMHA5YnI3N3lRK1ZzSFV2UFB3TXBmbUd1OGNUSjR2WGhjbEtDMCtE?=
 =?utf-8?B?Wnl0bDhjSTZ2TlhsZzlnNTZqeHhqd0x6Qk5VZTROa2pub3hXWC9WM3pwOW9z?=
 =?utf-8?B?M3ZVTkN1Ni9JL3FGMGQwbWZLdFZWbllSTFRRVG1YTW00M1dVQ3lXRGRTNHNU?=
 =?utf-8?B?ZVdFUGd5a25lYkJrNkFZNGZuN3k0akhNMWd3YmdraTEwbEdPL2FYZEJxU2l2?=
 =?utf-8?B?WHdsQmJCb3hHdEx3SE55SU9iRk5EK2U4ZlE0SDZZZENKV0dxcFJVQXNiUVhx?=
 =?utf-8?B?S2pqQXZXRWJ3d2g1eW1EZHhKS3BFTlpvY1MxZ3RIbURtVnFDbXZId0lvd1hZ?=
 =?utf-8?B?eEVycS82Kzl1VjFhL0VhVkVjVGZkYVZUNGdJVnRKakJkUkRDNkhrVnd0cEFD?=
 =?utf-8?B?eE1OY3NiQ2k3bUVCSnJOZDRnY2pKYTh5RW5OUEZRa0ZNZEVNbWU5MWVNZG9t?=
 =?utf-8?B?Wi8zSVBVUXA2ZkdGQTJrd0J3dWZMRHZNVEtBU21lRVNhSE1mbGFzWHpXRnUy?=
 =?utf-8?B?YmhBWTBSTThjSTlLODJMSTF5SitXUDkwTExTS0hnNXJGL20wSTJSdGt0Q0Y2?=
 =?utf-8?B?RTRqT0dEWjkwRWhGT2M4QzUrbjRIMllqcUVJS25UV3Z4Z1lzNU1RZXoxZXRj?=
 =?utf-8?B?SHg3eks3TjNmbkF4VXlxOStWNnJLaDdpV3oyU1c0emZUOGUrL2UyckxsbTlJ?=
 =?utf-8?B?OEh3YlZ5K3RBVWVKeGpVbE9EQ1REa2FWWFVBd0o2MDNVcXVLR2pkazhOVmxZ?=
 =?utf-8?B?NUVYRm1Pam9iSm9wazdweUtMQ2lyUXJDN3FzSUsvajZ3eDRKN0prNTJuVEhv?=
 =?utf-8?B?WEVIOXlzWmZuMnRxV2cyY3FMSnd0MGZWdjBLQXZiT2swdTQ3cWdaOU90WWxG?=
 =?utf-8?B?Mjh4VjBzQ25qUmlocVdBY016WmJxM0cvcmpsY3ZLM2trOXJQazdmUkFNZHN3?=
 =?utf-8?B?TVJocXJ6bSthdEdqV0hvd2J4V2RJdUgvN0ZPTnVRVDB0R3Zvd1hyVDVpQ0Mx?=
 =?utf-8?B?WmQ4MndNUTBpcERIOUVmVjNuK1lUUFhGOXZ3Vnk0UmxPZVZWRnZycTdaV1pX?=
 =?utf-8?B?UkVITDVlZUdzeEl3dkwzRnZqdVlWTVpodDc3S2NHOGtwQlh5bnVWbWFlZ0xY?=
 =?utf-8?B?S1djQlp5Zm9xMlNmSmswSEFUcHplM3NEdnJXRHNtUEhYQ0FPb21qNTBaeWVS?=
 =?utf-8?B?eWQwcHE3Z0ptZjAvWE03anhFMHJDOFg1bWdVaFZCaC9wU3FmYXYvaEFjay9h?=
 =?utf-8?B?dGVZTlAyNDRVM0hOaG1yaGY5MkpRdm9NSVJCVkJsZUZSVk1kQ0R0NGZkTEJj?=
 =?utf-8?B?WDJQend6R2sxbVk1aEM1akQvWWd0NDY1Nys0VzBqNjNXcGZPSWNaZnArMlA5?=
 =?utf-8?B?MEpRQzA0Q3VGY093V3hoeFM5MTZsRThKT2QxR0VYVmRLYnBXV0J1d0pFWkJZ?=
 =?utf-8?B?SXpDOHhhRWZTbys2U29sVnR5Q0RBaVZDZGFxcDdoK1g1Z2ZhUWlraUtvbU9h?=
 =?utf-8?Q?gja5/IJZrNG7qGNm3xgkHHNR0?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b7022a-1098-4d80-97b3-08dcfcab4e38
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 08:33:06.1671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jsvtZ99UzqDrycFkGtccGjh3V1PsXi9ppn+sX6VA20SjRteuNjYhKIduQJPTVKlQ+5xLZtOTsZDzZF80j+0GDVSqbVfqtaVTpNp/sSnMkVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_003323_258057_F82D443A 
X-CRM114-Status: GOOD (  16.21  )
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
Cc: "jthoughton@google.com" <jthoughton@google.com>, "canellac@amazon.at" <canellac@amazon.at>, "luto@kernel.org" <luto@kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "david@redhat.com" <david@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kalyazin@amazon.com" <kalyazin@amazon.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "mlipp@amazon.at" <mlipp@amazon.at>, "corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "tabba@google.com" <tabba@google.com>, "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "roypat@amazon.co.uk" <roypat@amazon.co.uk>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "jgowans@amazon.com" <jgowans@amazon.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "ackerleytng@google.com" <ackerleytng@google.com>, "xmarcalx@amazon.com" <xmarcalx@amazon.com>, "bp@alien8.de" <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>, "seanjc@google.com" <seanjc@google.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "Graf, Alexander" <graf@amazon.com>, "Annapurve, Vishal" <vannapurve@google.com>, "rppt@kernel.org" <rppt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiANCj4gK0VsZW5hDQo+IA0KPiBPbiAyMDI0LTExLTAxIGF0IDE2OjA2KzAwMDAsIERhdmUgSGFu
c2VuIHdyb3RlOg0KPiA+IE9uIDEwLzMxLzI0IDE3OjEwLCBNYW53YXJpbmcsIERlcmVrIHdyb3Rl
Og0KPiA+ID4gVERYIGFuZCBTRVYgZW5jcnlwdGlvbiBoYXBwZW5zIGJldHdlZW4gdGhlIGNvcmUg
YW5kIG1haW4gbWVtb3J5LCBzbw0KPiA+ID4gY2FjaGVkIGd1ZXN0IGRhdGEgd2UncmUgbW9zdCBj
b25jZXJuZWQgYWJvdXQgZm9yIHRyYW5zaWVudCBleGVjdXRpb24NCj4gPiA+IGF0dGFja3MgaXNu
J3QgbmVjZXNzYXJpbHkgaW5hY2Nlc3NpYmxlLg0KPiA+ID4NCj4gPiA+IEknZCBiZSBpbnRlcmVz
dGVkIHdoYXQgSW50ZWwsIEFNRCwgYW5kIG90aGVyIGZvbGtzIHRoaW5rIG9uIHRoaXMsIGJ1dCBJ
DQo+ID4gPiB0aGluayBkaXJlY3QgbWFwIHJlbW92YWwgaXMgd29ydGh3aGlsZSBmb3IgQ29DbyBj
YXNlcyBhcyB3ZWxsLg0KPiA+DQo+ID4gSSdtIG5vdCBzdXJlIHNwZWNpZmljYWxseSB3aGljaCBh
dHRhY2tzIHlvdSBoYXZlIGluIG1pbmQuwqAgWy4uLl0NCj4gPg0KPiA+IEkgX3RoaW5rXyB5b3Ug
bWlnaHQgYmUgdGhpbmtpbmcgb2YgYXR0YWNrcyBsaWtlIE1EUyB3aGVyZSBzb21lIHJhbmRvbQ0K
PiA+IG1pY3JvYXJjaGl0ZWN0dXJhbCBidWZmZXIgY29udGFpbnMgZ3Vlc3QgZGF0YSBhZnRlciBh
IFZNIGV4aXQgYW5kIHRoZW4NCj4gPiBhbiBhdHRhY2tlciBleHRyYWN0cyBpdC7CoCBEaXJlY3Qg
bWFwIHJlbW92YWwgZG9lc24ndCBhZmZlY3QgdGhlc2UNCj4gPiBidWZmZXJzIGFuZCBkb2Vzbid0
IG1pdGlnYXRlIGFuIGF0dGFja2VyIGdldHRpbmcgdGhlIGRhdGEgb3V0Lg0KPiANCj4gUmlnaHQs
IHRoZSBvbmx5IGF0dGFja3Mgd2UgY2FuIHRod2FydCB3aXRoIGRpcmVjdCBtYXAgcmVtb3ZhbCBh
cmUNCj4gdHJhbnNpZW50IGV4ZWN1dGlvbiBhdHRhY2tzIG9uIHRoZSBob3N0IGtlcm5lbCB3aG9z
ZSBsZWFrIG9yaWdpbiBpcw0KPiAiTWFwcGVkIG1lbW9yeSIgaW4gVGFibGUgMSBvZiB0aGUgUXVh
cmFudGluZSBwYXBlciBbMl0uIE1heWJlIHRoZQ0KPiBzaW1wbGVzdCBoeXBvdGhldGljYWwgdG8g
Y29uc2lkZXIgaGVyZSBpcyBhIG5ldyBzcGVjdHJlIHYxIGdhZGdldCBpbiB0aGUNCj4gaG9zdCBr
ZXJuZWwuDQo+IA0KPiA+IFRoZSBtYWluIHRoaW5nIEkgdGhpbmsgeW91IHdhbnQgdG8ga2VlcCBp
biBtaW5kIGlzIG1lbnRpb25lZCBpbiB0aGUgIlREWA0KPiA+IE1vZHVsZSB2MS41IEJhc2UgQXJj
aGl0ZWN0dXJlIFNwZWNpZmljYXRpb24iWzFdOg0KPiA+DQo+ID4gPiBBbnkgc29mdHdhcmUgZXhj
ZXB0IGd1ZXN0IFREIG9yIFREWCBtb2R1bGUgbXVzdCBub3QgYmUgYWJsZSB0bw0KPiA+ID4gc3Bl
Y3VsYXRpdmVseSBvciBub24tc3BlY3VsYXRpdmVseSBhY2Nlc3MgVEQgcHJpdmF0ZSBtZW1vcnks
DQo+ID4NCj4gPiBUaGF0J3MgYSBwcmV0dHkgYnJvYWQgY2xhaW0gYW5kIGl0IGludm9sdmVzIG1p
dGlnYXRpb25zIGluIGhhcmR3YXJlIGFuZA0KPiA+IHRoZSBURFggbW9kdWxlLg0KPiA+DQo+ID4g
MS4gaHR0cHM6Ly9jZHJkdjIuaW50ZWwuY29tL3YxL2RsL2dldENvbnRlbnQvNzMzNTc1DQo+IA0K
PiBUaGFuayB5b3UsIEkgaGFkbid0IHNlZW4gdGhhdC4gVGhhdCBpcyBhIHZlcnkgc3Ryb25nIGNs
YWltIGFzIGZhciBhcw0KPiBwcmV2ZW50aW5nIHNwZWN1bGF0aXZlIGFjY2VzczsgSSBkaWRuJ3Qg
cmVhbGl6ZSBJbnRlbCBjbGFpbWVkIHRoYXQgYWJvdXQNCj4gVERYLiBUaGUgY29tbWEgZm9sbG93
ZWQgYnkgInRvIGRldGVjdCBpZiBhIHByaW9yIGNvcnJ1cHRpb24gYXR0ZW1wdCB3YXMNCj4gc3Vj
Y2Vzc2Z1bCIgbWFrZXMgbWUgd29uZGVyIGEgYml0IGlmIHRoZSBzdGF0ZW1lbnQgaXMgbm90IHF1
aXRlIGFzIGJyb2FkDQo+IGFzIGl0IHNvdW5kcywgYnV0IG1heWJlIHRoYXQncyBqdXN0IG1lYW50
IHRvIHJlbGF0ZSBpdCB0byB0aGUgaW50ZWdyaXR5DQo+IHNlY3Rpb24/DQoNClRoaXMgc3RhdGVt
ZW50ICppcyogZm9yIGludGVncml0eSBzZWN0aW9uLiBXZSBoYXZlIGEgc2VwYXJhdGUgVERYIGd1
aWRhbmNlDQpvbiBzaWRlLWNoYW5uZWxzIChpbmNsdWRpbmcgc3BlY3VsYXRpdmUpIFszXSBhbmQg
c29tZSBzcGVjdWxhdGl2ZSBhdHRhY2tzDQp0aGF0IGFmZmVjdCBjb25maWRlbnRpYWxpdHkgKGZv
ciBleGFtcGxlIHNwZWN0cmUgdjEpIGFyZSBsaXN0ZWQgYXMgbm90IGNvdmVyZWQNCmJ5IFREWCBi
dXQgcmVtYWluaW5nIFNXIHJlc3BvbnNpYmlsaXR5IChhcyB0aGV5IGFyZSBub3cpLiANCg0KWzNd
IGh0dHBzOi8vd3d3LmludGVsLmNvbS9jb250ZW50L3d3dy91cy9lbi9kZXZlbG9wZXIvYXJ0aWNs
ZXMvdGVjaG5pY2FsL3NvZnR3YXJlLXNlY3VyaXR5LWd1aWRhbmNlL2Jlc3QtcHJhY3RpY2VzL3Ry
dXN0ZWQtZG9tYWluLXNlY3VyaXR5LWd1aWRhbmNlLWZvci1kZXZlbG9wZXJzLmh0bWwNCg0KQmVz
dCBSZWdhcmRzLA0KRWxlbmEuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
