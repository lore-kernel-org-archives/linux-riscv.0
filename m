Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EE7C83F25
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=c4gIMWTjpOIYaD1yhAmbVCp4zn5+eL8siTAD6gkXETY=; b=C8dspW2E8g435hHntjuGtln1z7
	J3bjyU51yspjiSUREIAKy/G9e9gMo1JupQt2fHAg1ieI92xhE68esHF4Rb/0IFQFI0vuubHx1921p
	83TtVTxQpmNFzQenOLSnaImxCozXAt/PS7hKu4BpeCp3fWQgAHHk6bCcarKq7GLX8at97oPvMBl9u
	xUgjfY5b/st2t7jMKlPh9SgglhRcsnu8L5uyFEWR+B9pBLkZsozHzTGf9J4EdvYaNZc3lHPD3kLzQ
	aJyaq6T8FMekHkDQUaXmsJbFfrc5gomSNcbeV3PxcYbTw3i3CPRXhHxH62hfLsVo9FYaXLJXFwQIs
	hMwC4AWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueS72-000000043vY-2MIf;
	Wed, 23 Jul 2025 05:33:56 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueS6z-000000043uj-3wRT;
	Wed, 23 Jul 2025 05:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753248833; x=1784784833;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PQMwPlAKdPZx1FUx+KyG6l1HbaC9nBgwdGxaRTd/QXc=;
  b=nHxfGNyozyIy44xOv1epZtBEYsCznFtxi9A5z9mQ+I8H9IBQ9k/VB8+n
   J0VbVnp1syXYQVP3TGLYQfhkgtGj5DKx2cyzT9ZjYsJk5U9MgDhe/4jxe
   2FhkkrXLJ7j6eq+iYZlkfEi6Ko2NLfURRXXacIXV3CT9/CTF30GYgmiAS
   XNqy2Utp/1ndfy9tQezRlt2FSgKQ7z0/QM2xB+fIKbtB1e1FZu/1B5rSR
   eA5Jf7EycJCKpuknYbMzTMpRLbnptV92Uedu/ZXgZiiiUgEIleC1RWleS
   1fsFjNbMUaeX5VthNhKPfOzNL+qMAaDW/2nLF3M25LMBWoXJEGRfcgAaG
   w==;
X-CSE-ConnectionGUID: 35zh9BE5TuSjSRol53852g==
X-CSE-MsgGUID: qAnwK0neTh+hTrvWmeOcJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="58135197"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="58135197"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 22:33:52 -0700
X-CSE-ConnectionGUID: D+qbN+hJQ6y61RQGnlM4YQ==
X-CSE-MsgGUID: Vtan6JRlT0+oCUUeDuJHbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="190296378"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 22:33:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 22:33:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 22:33:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 22:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R15EGVSmYsLbEydBQD+agmbld6xw2FlRB6cvPm4AgQ73/1Mmqd+iT+trpdMzyIEGLyBrjBAnpZKbBj1QjtpraW45LZ/qAa5g0ZO/4R2bAzGm2hjhDLXz/CIHcEWz9A7KaUK43az7nX/8ITeaFheWYRo0FJDFzdVwmht5BJWzQjvKFrmfS8Ul18ooeD9+4EHEkTbmT6U9Bz51mUOITOcKoTwbZvLhhFYgLBE4yy0LAYaIfCu/3T7Bt+kMvHPhq1iW7/N4rB5uhHKD8axEITJaE24jUGodC1nauSHsI7Ftnn9HoNdF2ewJFrmSsYeJLUgO8LuirRXdrHd8LSTaMU3r8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZr1fCZGfxQhnze7QP03MSIFL1tf6ZeNQjhFH9p76ig=;
 b=C+4ENRvJ8Fb/Ovl+Y41f0SMcEzs49u5S3l1c26sI59I8TFW7Vj4NPaDHZkGKsssdnR48jvyl4gDl4EYz9wSUTPghmP+uDL/p1Q3dzJrgbrX1Pto2oIw2KX+Ax2foQlwg4B5/jEC+Vmh9PCNwmNVO+5B3i8ccZ/nG69fDHCnneg8KZbtw0/OcAZkumw1lclg7++c/X0yEK6/OFUc2Aed90wPd8QsAVaJFz1Dyb5c4AZvGCbL9kRQHmva3TsiF2Vtui+57lVAzbFLXHQcf6wU4mTlCDFd1CDjmiVVSXB6fQ+BrAZoQRxJvdBXke0kwk/E3qnbC/wkxw43mq356o4s8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 05:33:36 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::eeac:69b0:1990:4905%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 05:33:36 +0000
Message-ID: <99899915-2730-41c7-b71a-f8d97bb6e59c@intel.com>
Date: Wed, 23 Jul 2025 08:33:29 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] mmc: sdhci-of-dwcmshc: add common bulk optional
 clocks support
To: Robin Murphy <robin.murphy@arm.com>, Chen Wang <unicornxw@gmail.com>,
	<aou@eecs.berkeley.edu>, <conor+dt@kernel.org>, <guoren@kernel.org>,
	<inochiama@outlook.com>, <jszhang@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <robh@kernel.org>, <ulf.hansson@linaro.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<chao.wei@sophgo.com>, <haijiao.liu@sophgo.com>, <xiaoguang.xing@sophgo.com>,
	<tingzhu.wang@sophgo.com>
CC: Chen Wang <unicorn_wang@outlook.com>, Drew Fustini <drew@pdp7.com>,
	Diederik de Haas <didi.debian@cknow.org>, "open list:ARM/Rockchip SoC..."
	<linux-rockchip@lists.infradead.org>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
 <e57e8c51da81f176b49608269a884f840903e78e.1722847198.git.unicorn_wang@outlook.com>
 <f81b88df-9959-4968-a60a-b7efd3d5ea24@arm.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <f81b88df-9959-4968-a60a-b7efd3d5ea24@arm.com>
X-ClientProxiedBy: DUZPR01CA0228.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::23) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c008b3b-3a2c-424b-432d-08ddc9aa784b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzBPQlkzUlc3djlJZzQwb2FFMEtSM0ZVTkdCSUxjNjZBUGRyeksvcUZoOTZa?=
 =?utf-8?B?TzQrZytqZTJ3TTJUMUdxNmFxVGFIcDE2ck96M05GdkJMM3VwUi9VTXZzWC84?=
 =?utf-8?B?NGlRQXZWYUViRGJVSkJGRDBmdDlCdElyN0ZSdTA1ZytQSFFpU1hhSG5zQkJZ?=
 =?utf-8?B?OUtGSzk4bGlzL3d1ZE9yNXp4a3JhUjZUZzVOR0FWclJYUEp2KzVObUMxSUtC?=
 =?utf-8?B?b1dncFNEK09jZEZaWnRnQzVPbkIxR1FjdXl6WjhBNDZSbmxFeU9nYVhYRTlo?=
 =?utf-8?B?UVg1RjVHUW5nSzc0TjcvV2w5eVVMUVZvVlZ2SEx0cGJveCtpSzIxOUlMODcz?=
 =?utf-8?B?NkFxUEVlMDBSc3N5L1BYbFNZMzNFdjlRaXB5U0xIc1doSVVEbzNVZjJYQng1?=
 =?utf-8?B?Y3lJM0RtUlp5WWwzZzNVRzM2bUxBNk0zTzRCbzl2aHozL3RUMHNFc2JEQ2Fy?=
 =?utf-8?B?SnRrOFRJdkpvdWVodjdJWnBOR1ZidGdRb3BFSFA0QnV0WTJId0U4dG1ZZy9q?=
 =?utf-8?B?elhtcDh6QTl1ODh2QkNnQUV6ZHlLRXZXcGY1UUlpRjVHSWVXWnRCWTlxTVc4?=
 =?utf-8?B?a1JSck5lTTQxRzJweEVIbGlPUkVLMEhRK0pwc3dSTkxHeFRMMlF4OWt1Y0JE?=
 =?utf-8?B?dkdjNVlsa3N6aGFUSGQ3MWFOb1hqdnQraGNRL1lXYVk5b1lSU2FXaDdxaDBK?=
 =?utf-8?B?UHJQZjBOelpNaUpFYmN2WGpPZFJIM3BHU095TVJBSXIwSGp0QkhEcmUyVDRV?=
 =?utf-8?B?d1hvMmU2K1NsN2ttSGdSMFFBMFVNejlBQ2liTzdVc2VoUUhrdU9ZRDhYakxU?=
 =?utf-8?B?S0JRQXQ1K2hDV2NHam43d1NlbnJiTkJQaU1XZjI4R2srbU1UcGowL1ptUHRx?=
 =?utf-8?B?c09sZ0psSlM5T2hvakV5QVBRTXZEdDZoUWFtNEJuWm9CN1MyQjdKMVZyMDVR?=
 =?utf-8?B?VGg0REJqbU5MdUV1Q08yRjFEd2V3blJ6Ly94VlRoRmFVRThSbVF2QUdWckRn?=
 =?utf-8?B?MkEwUzVsZjVyd0FLU21uUk5DUjRhWXFmZVllQ2VwTDNOM0NkNVJIRjBpR1Nx?=
 =?utf-8?B?WEc0ZWUvcXNSUG5LN1NYSGtNOTQyL3FGRmtRNVVpYnEwZ3IwcHgxSUEzaWR4?=
 =?utf-8?B?SllSQThGOTIyV1JiSmJrYWtIWXpKc2ZhODVhU1pucXQwSnp6S1VOelExdmZP?=
 =?utf-8?B?emluaytESjVYYm9qMXVRQ2dDNnh4QmE5K2NtYWI1UUNhajZUTFpCNkZCbnJv?=
 =?utf-8?B?Q2RJbHBqeFVFOUlsK0U5ajdnSFJhcmlpN0o5b0dJMTJxc3R1ay9QLzczQlJU?=
 =?utf-8?B?MFNEZDAzSDc0VUtrT1BubG9xYW9uZkxVVnB3eXlqUm9DYmlYWDFyWUdVQ3FL?=
 =?utf-8?B?cGZVeWNqbFpnekphcEJ6SXU1eTVqOHUwT1Bsb1FWYzZVMzZBWUNpWUtpeEo4?=
 =?utf-8?B?dFNwTGQrSnFqSmcva0VhODBQM2VEelRTN3B2UWxLWE40RmpWRk5wSFdvZlk3?=
 =?utf-8?B?akYvajdNWGRQeFpOQjJraFlqUzVYMC8wZGRWcXI5eTVyN0orWitaZjc4cHk4?=
 =?utf-8?B?MnEzNVpkUnc0NDNBU0tWQnNTazdxODZPcVQ1SzdHcC9EcHAreGc5bWgycG5K?=
 =?utf-8?B?a0xibEdWUE1nTks3UVdjcTBDODl0TlF1SkZSZ0w1RnNORXo4MTdnMzhhMURa?=
 =?utf-8?B?QkR0bHE1QXI4a3N0YUhBQnRRcW5GcUhacFlOd012VVdSTFRkYVVzcmNBU2hO?=
 =?utf-8?B?T3hjN2hIWmxaaHFvNnRtYmRGZ0NJa28yakd2aS9sblg1SUZUbkVjYldHTmh0?=
 =?utf-8?B?YzBweGE1LzJSL3YyYWJsVURCQjRBUHBnSFNHRFJ5czBRRS9tT1E2ZGkzYXJp?=
 =?utf-8?B?Yms5eXFuNGUxS3ZzMkhDeVFIVm5ESHZzZDFPM2EvNkM5a2ltKzFFQVRhSE13?=
 =?utf-8?B?Q05FMzN6YlRndFVTNTdnUXl6bzY3cDFoMEMrQVVsd2lTQUtHT3luS2U0WE5F?=
 =?utf-8?B?T3FYSm55bGtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkxDajFISG8wT2Jqb2hPNU5pTENaYVFuN3ladzVPOE9CRUxKZTFGcjlnelVl?=
 =?utf-8?B?OVpWM0REN2R4S3plMThndlhJWXlvSjVQZzV3Y2gzcmtlZEpzWjhSeHR3TkNO?=
 =?utf-8?B?Y3EyZTZkVDN2ZmhKU0ZUTkhDUi92TDFBTUVRRTIwelVjYlNUSEQ0MG9BdjBa?=
 =?utf-8?B?bHBXdi9DT29lZUxPa3JFVk82dmZ6TjIxMmpwdTR2OTJ0NzB4c2RsdEtOWHFq?=
 =?utf-8?B?eFJxdW9ibFl2SFJqdVNVNVQ3M3lpUVQ4WC9TcTdELzQ5ZUgycmpSV2FFVytM?=
 =?utf-8?B?ZmtnWnZjWEtFVmpGWTZhY1FEaFM3THExMGVOcXFrOWRveG1qL25RdFRqU3Bs?=
 =?utf-8?B?VkoxWXlpTUNDVXB4RmN3MVNocHJ6VmxRT2kzUjlrWUFMNC9yUEI2dVhicnBE?=
 =?utf-8?B?d1pPWE1CWVh0Zi9MYlJ6QWsxWE5FMlU3NHcxL3BIN0FtS0NqSTA4c0ZLaloz?=
 =?utf-8?B?QkQrWm5sS0o3cjZLL3BpMndwZk9VeDNBY09qd1llNlZUNzMzYndJUmdyVHM1?=
 =?utf-8?B?RVcyQ1grY05NcmFRdVlwYmg3U3ZIN2xSLzNqOXNpZkEzTElDMlVDWTVNckhj?=
 =?utf-8?B?WVlGeWZjdE1BMDJDaVJqMi9TalRpbVN0UThURDR2RDhqUmg5ZkRoekZ1OUhJ?=
 =?utf-8?B?L2RjSkpqU2IwUTVtT1BHcE5QcTIxNytBT2hWeldSSkg5cGNoVnl4V21jRW5a?=
 =?utf-8?B?ai9Kdm9Mc2VPbFREY2wzWmdCbnFyUHlLRlJmeUgrQ3pwZXhxWm1pZ01CUndp?=
 =?utf-8?B?OTc0anloOGlWdDlic203NlB1bmNXL2hzc2ZudXovT1BmVWdOSGE5VmRCNDJV?=
 =?utf-8?B?cXhaVkRrQUhyVzhDd0FWMkxhZHlzZE9GR3JtTEhPYVZ2YmR6THJIUFFlUTBm?=
 =?utf-8?B?SVpQNnFlZFA2c1JDSXJ0ZXJLbmxoRk9wQStKT2hLOGRBOHo4NndjalZXcmlx?=
 =?utf-8?B?eUoyOGVnTHBJU2ZUOU9QemZ3aVRqbU9yQnlzM0VXSWE5UXRhalo4YVpqM1ly?=
 =?utf-8?B?UFF1OHBQenZxbTBOQ1l0WFFUQVVUU3psRUlacGZLc1J3b3pZamErRGlkbndx?=
 =?utf-8?B?YW54ZGhaSUNrWEpHbGQ1SldFaW4raWlxWHdDSVZlMCtmdDdVT0VpTm9lU0px?=
 =?utf-8?B?VXVtSVNqc202SUVyS3g1RFBjbGwvdDJNN1hEbDlsWko2VDFOL09UZTdoSWNu?=
 =?utf-8?B?YTFja2xLVml2RGhiczZEWHZIWmpJRU5HamwzTDh2Z3JzdWNtQ21vL2lGa0Zs?=
 =?utf-8?B?UklQNTVDKytOWE91WWY3Z2RqNmhVUUlLNjZkZDh6bHdGYVM5U1FGNUFIQ2l0?=
 =?utf-8?B?YUZTK3JRMmpURVIzV3NwL2xXZ3pXRFM2QTlnSlZCVnB2eDRxaE1EV3N5YmY4?=
 =?utf-8?B?SkVkZHhlREFYM0tHbkQwcUdQaHh6bENlZzRKZUxVbG1WR29RVFJReExQaTlO?=
 =?utf-8?B?dWlkbEhia2J5Qzh6VVhsRXRKL2xFVDd6ZVpmVkp1ZU9QWFhNUi9FdlZ0Rlhs?=
 =?utf-8?B?L3JONHdJTHJkdU9lMHFKd3NubGJTUHdoTytJZWpMU0ZzWFpwczEyWUtVZkgr?=
 =?utf-8?B?UUdZdXh4dUx3ZGtsb29jenhjUGlMMnJhbDlKTU5oS0wvSmc4N2lJcFRMdGN1?=
 =?utf-8?B?Vnk1TXVKWEZTOUhDNWFvN3lsYzRRa3Z6YzZqMlhmR1dIUWxwc1loU2VUa1pD?=
 =?utf-8?B?WWhRSWRFQWhpMWpDOVVqRjBMRUxzcDBBa21rZ1NvVHo4MzdRdjUyMlJxdzh4?=
 =?utf-8?B?YVQvM3JTQVdGV3hwWkNKYUdUcEJieVRaL3pVeUtXSThaUW5oUitucitGVnhJ?=
 =?utf-8?B?SGdyVFQ0cUNQWWNGYmphblVnaDBFdnFKMjgra0pYUkNpVTN6VUJUTXN3WGpV?=
 =?utf-8?B?Rm0yWllEQmsxY05GUFhjRTI0bmNDQ1pmT2lvWGZkdEhqcmVPdjVDMjNoaGZj?=
 =?utf-8?B?Zm8rRHNTRlAzaFNiK29ReGthUzdjZTMrRG5tdUxoVkcrSHBlbUYxR3ZnQjVG?=
 =?utf-8?B?TUVieVpUd1hoMVdHUUNxL0Evei9scDd4aEJmeEJrUG13VzNGcGVMbWN3TXFT?=
 =?utf-8?B?SFhlZHFCVlpaWVV6RjdoZ3R3SitqODUxdjRiS25qN1AyNkhCN1ZabXdiekpv?=
 =?utf-8?B?Yit4TXA2N1FjdFppalFGMEVEK2tWTSttZXg3d3BtWGp6U0NteXBlMjdzbFdv?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c008b3b-3a2c-424b-432d-08ddc9aa784b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 05:33:36.1965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/YKeKLN7S9Popx/dUPiY1IL5+9T29ermtO7+j4+GB8HJNjRMm6relkGqMSRxWwdFfkk3GVVDBvOf0UmzWTQMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_223354_029635_54DB6D6E 
X-CRM114-Status: GOOD (  18.86  )
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

T24gMjIvMDcvMjAyNSAyMTozMywgUm9iaW4gTXVycGh5IHdyb3RlOgo+IEEgYml0IGxhdGUgZm9y
IGEgInJldmlldyIsIGJ1dCBEaWVkZXJpayBhbmQgSSBoYXZlIGp1c3QgYmVlbgo+IElSQy1kZWJ1
Z2dpbmcgYSBjcmFzaCBvbiBSSzM1Njggd2hpY2ggYnkgaW5zcGVjdGlvbiBzZWVtcyB0byBiZSBj
YXVzZWQKPiBieSB0aGlzIHBhdGNoOgo+IAo+IE9uIDIwMjQtMDgtMDUgMTA6MTcgYW0sIENoZW4g
V2FuZyB3cm90ZToKPj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+
Cj4+Cj4+IEluIGFkZGl0aW9uIHRvIHRoZSByZXF1aXJlZCBjb3JlIGNsb2NrIGFuZCBvcHRpb25h
bAo+PiBidXMgY2xvY2ssIHRoZSBzb2Mgd2lsbCBleHBhbmQgaXRzIG93biBjbG9ja3MsIHNvCj4+
IHRoZSBidWxrIGNsb2NrIG1lY2hhbmlzbSBpcyBhYnN0cmFjdGVkLgo+Pgo+PiBOb3RlLCBJIGNh
bGwgdGhlIGJ1bGsgY2xvY2tzIGFzICJvdGhlciBjbG9ja3MiIGR1ZQo+PiB0byB0aGUgYnVzIGNs
b2NrIGhhcyBiZWVuIGNhbGxlZCBhcyAib3B0aW9uYWwiLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBD
aGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4gVGVzdGVkLWJ5OiBEcmV3IEZ1
c3RpbmkgPGRyZXdAcGRwNy5jb20+ICMgVEgxNTIwCj4+IFRlc3RlZC1ieTogSW5vY2hpIEFtYW90
byA8aW5vY2hpYW1hQG91dGxvb2suY29tPiAjIER1byBhbmQgSHVhc2hhbiBQaQo+PiAtLS0KPiBb
Li4uXQo+PiArc3RhdGljIGludCBkd2Ntc2hjX2dldF9lbmFibGVfb3RoZXJfY2xrcyhzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBkd2Ntc2hjX3ByaXYgKnByaXYsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGludCBudW1fY2xrcywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqIGNvbnN0IGNsa19pZHNbXSkKPj4gK3sKPj4g
K8KgwqDCoCBpbnQgZXJyOwo+PiArCj4+ICvCoMKgwqAgaWYgKG51bV9jbGtzID4gRFdDTVNIQ19N
QVhfT1RIRVJfQ0xLUykKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiArCj4+
ICvCoMKgwqAgZm9yIChpbnQgaSA9IDA7IGkgPCBudW1fY2xrczsgaSsrKQo+PiArwqDCoMKgwqDC
oMKgwqAgcHJpdi0+b3RoZXJfY2xrc1tpXS5pZCA9IGNsa19pZHNbaV07Cj4+ICsKPj4gK8KgwqDC
oCBlcnIgPSBkZXZtX2Nsa19idWxrX2dldF9vcHRpb25hbChkZXYsIG51bV9jbGtzLCBwcml2LT5v
dGhlcl9jbGtzKTsKPiAKPiBUaGlzIGxlYXZlcyBhIHBvaW50ZXIgaW50byAicHJpdiIgaW4gdGhl
IGRldnJlcyBsaXN0Li4uCj4gCj4+ICvCoMKgwqAgaWYgKGVycikgewo+PiArwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IGNsb2NrcyAlZFxuIiwgZXJyKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgZXJy
ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUobnVtX2Nsa3MsIHByaXYtPm90aGVyX2Nsa3MpOwo+
PiArwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgImZhaWxl
ZCB0byBlbmFibGUgY2xvY2tzICVkXG4iLCBlcnIpOwo+PiArCj4+ICvCoMKgwqAgcHJpdi0+bnVt
X290aGVyX2Nsa3MgPSBudW1fY2xrczsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBlcnI7Cj4+ICt9
Cj4+ICsKPj4gwqAgLyoKPj4gwqDCoCAqIElmIERNQSBhZGRyIHNwYW5zIDEyOE1CIGJvdW5kYXJ5
LCB3ZSBzcGxpdCB0aGUgRE1BIHRyYW5zZmVyIGludG8gdHdvCj4+IMKgwqAgKiBzbyB0aGF0IGVh
Y2ggRE1BIHRyYW5zZmVyIGRvZXNuJ3QgZXhjZWVkIHRoZSBib3VuZGFyeS4KPiBbLi4uXQo+PiBA
QCAtMTI4MCw5ICsxMzAwLDcgQEAgc3RhdGljIGludCBkd2Ntc2hjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgIGVycl9jbGs6Cj4+IMKgwqDCoMKgwqAgY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKHBsdGZtX2hvc3QtPmNsayk7Cj4+IMKgwqDCoMKgwqAgY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKHByaXYtPmJ1c19jbGspOwo+PiAtwqDCoMKgIGlmIChya19wcml2KQo+PiAtwqDC
oMKgwqDCoMKgwqAgY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoUkszNXh4X01BWF9DTEtTLAo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmtfcHJpdi0+
cm9ja2NoaXBfY2xrcyk7Cj4+ICvCoMKgwqAgY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUocHJp
di0+bnVtX290aGVyX2Nsa3MsIHByaXYtPm90aGVyX2Nsa3MpOwo+PiDCoCBmcmVlX3BsdGZtOgo+
PiDCoMKgwqDCoMKgIHNkaGNpX3BsdGZtX2ZyZWUocGRldik7Cj4gCj4gLi4uYnV0IHVwb24sIHNh
eSwgLUVQUk9CRV9ERUZFUiBmcm9tIHNkaGNpX3NldHVwX2hvc3QoKSBiZWNhdXNlIGEKPiByZWd1
bGF0b3IgaXNuJ3QgcmVhZHkgeWV0LCB0aGF0ICJwcml2IiBpcyBmcmVlZCBoZXJlLCBzbyBieSB0
aGUgdGltZSB0aGUKPiBkZXZyZXMgY2FsbGJhY2tzIGV2ZW50dWFsbHkgcnVuLCB0aGF0ICJkZXZy
ZXMtPmNsa3MiIHBvaW50ZXIgd2hpY2ggdXNlZAo+IHRvIHJlcHJlc2VudCAicHJpdi0+b3RoZXJf
Y2xvY2tzIiBwb2ludHMgdG8gd2hvIGtub3dzIHdoYXQsIGFuZCB0aGlzCj4gc29ydCBvZiB0aGlu
ZyBoYXBwZW5zOgo+IAo+IFvCoMKgIDEyLjQ3MDgyN10gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwg
cGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzIDAwMmRmN2IzNzg5MTc2NjQKPiBbwqDC
oCAxMi40NzIxMDRdIE1lbSBhYm9ydCBpbmZvOgo+IFvCoMKgIDEyLjQ3MjQ3MV3CoMKgIEVTUiA9
IDB4MDAwMDAwMDA5NjAwMDAwNAo+IFvCoMKgIDEyLjQ3NTk5MV3CoMKgIEVDID0gMHgyNTogREFC
VCAoY3VycmVudCBFTCksIElMID0gMzIgYml0cwo+IFvCoMKgIDEyLjQ3NjY1N13CoMKgIFNFVCA9
IDAsIEZuViA9IDAKPiBbwqDCoCAxMi40NzcxNDZdwqDCoCBFQSA9IDAsIFMxUFRXID0gMAo+IFvC
oMKgIDEyLjQ3NzU0N13CoMKgIEZTQyA9IDB4MDQ6IGxldmVsIDAgdHJhbnNsYXRpb24gZmF1bHQK
PiBbwqDCoCAxMi40NzgxMjddIERhdGEgYWJvcnQgaW5mbzoKPiBbwqDCoCAxMi40NzgxMjZdIHJv
Y2tjaGlwLWdwaW8gZmRkNjAwMDAuZ3BpbzogcHJvYmVkIC9waW5jdHJsL2dwaW9AZmRkNjAwMDAK
PiBbwqDCoCAxMi40Nzg0MTNdwqDCoCBJU1YgPSAwLCBJU1MgPSAweDAwMDAwMDA0LCBJU1MyID0g
MHgwMDAwMDAwMAo+IFvCoMKgIDEyLjQ3OTgyNl3CoMKgIENNID0gMCwgV25SID0gMCwgVG5EID0g
MCwgVGFnQWNjZXNzID0gMAo+IFvCoMKgIDEyLjQ4MDQxOF3CoMKgIEdDUyA9IDAsIE92ZXJsYXkg
PSAwLCBEaXJ0eUJpdCA9IDAsIFhzID0gMAo+IFvCoMKgIDEyLjQ4MTI4Ml0gWzAwMmRmN2IzNzg5
MTc2NjRdIGFkZHJlc3MgYmV0d2VlbiB1c2VyIGFuZCBrZXJuZWwgYWRkcmVzcyByYW5nZXMKPiBb
wqDCoCAxMi40ODI0MjFdIEludGVybmFsIGVycm9yOiBPb3BzOiAwMDAwMDAwMDk2MDAwMDA0IFsj
MV3CoCBTTVAKPiBbwqDCoCAxMi40ODI5ODBdIE1vZHVsZXMgbGlua2VkIGluOiBzZGhjaV9vZl9k
d2Ntc2hjIGRybV9kcF9hdXhfYnVzIGdwaW9fcm9ja2NoaXAoKykgZHJtX2Rpc3BsYXlfaGVscGVy
IGR3X21tY19yb2NrY2hpcCBkcm1fY2xpZW50X2xpYiBzZGhjaV9wbHRmbSBkcm1fZG1hX2hlbHBl
ciBmd25vZGVfbWRpbyBzZGhjaSBkd19tbWNfcGx0Zgo+IG0gbGlicGh5IGZpeGVkIHJvY2tjaGlw
X2RmaSBkcm1fa21zX2hlbHBlciBjcWhjaSBwbDMzMCgrKSBwaHlfcm9ja2NoaXBfbmFuZW5nX2Nv
bWJwaHkgZHdfd2R0IHBoeV9yb2NrY2hpcF9zbnBzX3BjaWUzIHBoeV9yb2NrY2hpcF9pbm5vX3Vz
YjIgZHdfbW1jIG1kaW9fYnVzIGR3YzMgZWhjaV9wbGF0Zm9ybSBvaGNpX3BsYXRmb3JtCj4gZWhj
aV9oY2QgZHJtIG9oY2lfaGNkIHVkY19jb3JlIGlvX2RvbWFpbiBpMmNfcmszeCB1c2Jjb3JlIHVs
cGkgdXNiX2NvbW1vbgo+IFvCoMKgIDEyLjQ4Njg3MV0gQ1BVOiAwIFVJRDogMCBQSUQ6IDY0IENv
bW06IGt3b3JrZXIvdTE2OjMgTm90IHRhaW50ZWQgNi4xNi1yYzctYXJtNjQtY2tub3cgIzEgUFJF
RU1QVExBWlnCoCBEZWJpYW4gNi4xNn5yYzctMQo+IFvCoMKgIDEyLjQ4NzkwMV0gSGFyZHdhcmUg
bmFtZTogRnJpZW5kbHlFbGVjIE5hbm9QaSBSNVMgKERUKQo+IFvCoMKgIDEyLjQ4ODQxMl0gV29y
a3F1ZXVlOiBhc3luYyBhc3luY19ydW5fZW50cnlfZm4KPiBbwqDCoCAxMi40ODg4NzldIHBzdGF0
ZTogNjA0MDAwMDkgKG5aQ3YgZGFpZiArUEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTIEJUWVBFPS0t
KQo+IFvCoMKgIDEyLjQ4OTUzOV0gcGMgOiBfX2Nsa19wdXQrMHgyYy8weDEzOAo+IFvCoMKgIDEy
LjQ4OTkxM10gbHIgOiBfX2Nsa19wdXQrMHgyYy8weDEzOAo+IFvCoMKgIDEyLjQ5MDI4MV0gc3Ag
OiBmZmZmODAwMDgwNzEzYjEwCj4gW8KgwqAgMTIuNDkwNjA3XSB4Mjk6IGZmZmY4MDAwODA3MTNi
MTAgeDI4OiBmZmZmMDAwMWYwMDFhMTIwIHgyNzogMDAwMDAwMDAwMDAwMDAwMAo+IFvCoMKgIDEy
LjQ5MTMwMl0geDI2OiBmZmZmMDAwMWY5OGUwMWEwIHgyNTogMDAwMDAwMDAwMDAwMDAwMCB4MjQ6
IGZmZmYwMDAxZjBmMzU0MDgKPiBbwqDCoCAxMi40OTE5OTVdIHgyMzogZmZmZmE4ZGExOTliNGI0
MCB4MjI6IGZmZmY4MDAwODA3MTNiYjAgeDIxOiBmZmZmMDAwMWYwZjM1MDEwCj4gW8KgwqAgMTIu
NDkyNjg5XSB4MjA6IGZmZmYwMDAxZjk0YWFmZDAgeDE5OiAwYTJkZjdiMzc4OTE3NjM0IHgxODog
MDAwMDAwMDBmZmZmZmZmZgo+IFvCoMKgIDEyLjQ5MzM4MV0geDE3OiAzZDRkNDU1NDUzNTk1MzQy
IHgxNjogNTU1MzAwMzA3MDc1NjU2YiB4MTU6IGZmZmYwMDAxZjQ4ODU2NTAKPiBbwqDCoCAxMi40
OTQwNzVdIHgxNDogMDAwMDAwMDAwMDAwMDAwMCB4MTM6IGZmZmYwMDAxZjAyNWI4MTAgeDEyOiAw
MDAwMDAwMDAwMDA4MDAwCj4gW8KgwqAgMTIuNDk0NzY1XSB4MTE6IGZmZmZhOGRhMWE3M2VmOTgg
eDEwOiBmZmZmYThkYTFhNDYwMDAwIHg5IDogMDAwMDAwMDAwMDAwMDA3OAo+IFvCoMKgIDEyLjQ5
NTQ1NF0geDggOiAwMDAwMDAwMDAwMDAwMDQ5IHg3IDogZmZmZmE4ZGExOGMyZmJlMCB4NiA6IDAw
MDAwMDAwMDAwMDAwMDEKPiBbwqDCoCAxMi40OTYxNDVdIHg1IDogMDAwMDAwMDAwMDAwMDAwNCB4
NCA6IDAwMDAwMDAwNmNiNmJiNjMgeDMgOiAwMDAwMDAwMDAwMDAwMDAwCj4gW8KgwqAgMTIuNDk2
ODMzXSB4MiA6IDAwMDAwMDAwMDAwMDAwMDAgeDEgOiBmZmZmMDAwMWYxMzY1YWMwIHgwIDogMDAw
MDAwMDAwMDAwMDAwMQo+IFvCoMKgIDEyLjQ5NzUyNF0gQ2FsbCB0cmFjZToKPiBbwqDCoCAxMi40
OTc3NzZdwqAgX19jbGtfcHV0KzB4MmMvMHgxMzggKFApCj4gW8KgwqAgMTIuNDk4MTU0XcKgIGNs
a19wdXQrMHgxOC8weDMwCj4gW8KgwqAgMTIuNDk4NDcxXcKgIGNsa19idWxrX3B1dCsweDQwLzB4
NjgKPiBbwqDCoCAxMi40OTg4MjVdwqAgZGV2bV9jbGtfYnVsa19yZWxlYXNlKzB4MjQvMHg0MAo+
IFvCoMKgIDEyLjQ5OTI0OF3CoCByZWxlYXNlX25vZGVzKzB4NjQvMHhhMAo+IFvCoMKgIDEyLjQ5
OTYwOF3CoCBkZXZyZXNfcmVsZWFzZV9hbGwrMHg5OC8weGY4Cj4gW8KgwqAgMTIuNTAwMDA0XcKg
IGRldmljZV91bmJpbmRfY2xlYW51cCsweDIwLzB4NzAKPiBbwqDCoCAxMi41MDA0MjZdwqAgcmVh
bGx5X3Byb2JlKzB4MWU4LzB4M2EwCj4gW8KgwqAgMTIuNTAwNzkzXcKgIF9fZHJpdmVyX3Byb2Jl
X2RldmljZSsweDg0LzB4MTYwCj4gW8KgwqAgMTIuNTAxMjI1XcKgIGRyaXZlcl9wcm9iZV9kZXZp
Y2UrMHg0NC8weDEyOAo+IFvCoMKgIDEyLjUwMTY0MF3CoCBfX2RyaXZlcl9hdHRhY2hfYXN5bmNf
aGVscGVyKzB4NWMvMHgxMDgKPiBbwqDCoCAxMi41MDIxMjVdwqAgYXN5bmNfcnVuX2VudHJ5X2Zu
KzB4NDAvMHgxODAKPiBbwqDCoCAxMi41MDI1MzVdwqAgcHJvY2Vzc19vbmVfd29yaysweDIzYy8w
eDY0MAo+IFvCoMKgIDEyLjUwMjkzOV3CoCB3b3JrZXJfdGhyZWFkKzB4MWI0LzB4MzYwCj4gW8Kg
wqAgMTIuNTAzMzE1XcKgIGt0aHJlYWQrMHgxNTAvMHgyNTAKPiBbwqDCoCAxMi41MDM2NDZdwqAg
cmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPiBbwqDCoCAxMi41MDQwMTVdIENvZGU6IGFhMDAwM2Yz
IGIxNDAwNDFmIDU0MDAwNmM4IDk3ZmZkOWM0IChiOTQwMzI2MCkKPiBbwqDCoCAxMi41MDQ1OThd
IC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+IAo+IAo+IFRCSCBJJ20gbm90
IHN1cmUgd2hhdCB0byBkbyBhcyBhIHN0cmFpZ2h0IHJldmVydCBzZWVtcyBpbXByYWN0aWNhbCBi
eQo+IG5vdywgc28gd2UgaG9wZSBzb21lb25lIGVsc2UgbWlnaHQgaGF2ZSBhIGdvb2QgaWRlYS4K
ClByZXN1bWFibHkgdGhlIHByb2JsZW0gaGFzIGdvbmUgYXdheSB3aXRoOgoKCWNvbW1pdCA5MWEw
MDFhMWEwNzQ5ZTVkMjQ2MDZkNDZhYzVkZmQ0NDMzYzAwOTU2CglBdXRob3I6IEJpbmJpbiBaaG91
IDx6aG91YmluYmluQGxvb25nc29uLmNuPgoJRGF0ZTogICBTYXQgSnVuIDcgMTU6Mzk6MDEgMjAy
NSArMDgwMAoKCSAgICBtbWM6IHNkaGNpLW9mLWR3Y21zaGM6IERyb3AgdGhlIHVzZSBvZiBzZGhj
aV9wbHRmbV9mcmVlKCkKCndoaWNoIGlzIGluIG5leHQuCgpJbiB3aGljaCBjYXNlIGEgc2VwYXJh
dGUgZml4IGlzIG5lZWRlZCBmb3Igc3RhYmxlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
