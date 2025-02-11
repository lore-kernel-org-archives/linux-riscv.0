Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25A4C0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hSAEhzhkLy0YlSffhWJJi4WqBxjOrbDSzS2oJCbQA6A=; b=sugKoOHzCkOB08
	f3qFhVlj5lPMYjDslltNMCsICiiCtiaDXOy91NMbTU5iTes9eHIhnqZdAOSqQL5/RdpeuUeMOwoH8
	10xAmAM2s8jULPtRBRL0fzFDCt+aqRIOCIvtsbT8gUeVuOIYzcsEl+eGpA148eBuL74Mw+FyzSS0n
	sbcqVTkUHz14eY7n9NKRTfgwQg2bZ4FLkyfA80PRudYI9NXsgH6m+iPlgz3NI8a0jct5QvRUdvaoH
	iDElp+RKWWVmASxdWqiYDF1gKmtIppUQbHkA9WPn9bESEu9voyxZZfWV70R+N+G4lBmRQVxfKsaYp
	LnmSpRMfRuKiWmUkhk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqXg-00000003zmx-1ZN1;
	Tue, 11 Feb 2025 13:43:12 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqXR-00000003zj4-48OX;
	Tue, 11 Feb 2025 13:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739281378; x=1770817378;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=pZT88gMtNeMWlwN7KFX6vNYTmtaPDWIa7cExXiJf0kU=;
  b=HPRFvO20YTochWUNWFlk7eM6MYiofM0xaKaej+9KUsJCeHoHZPzPCpn6
   LjjVZg2EsBeeARMB7sSc9/8ZRTrTpgyRU4OOQTt0nS28hiYojFcpoknNv
   cHmdji1vyx8ePKEsGjxNMDujUrOSOYS82x4hAIjQGEmv7TiUmTTGSxqzO
   CZ52ZYNs1KU+u04POs0+J8rfLZP64AHn50+31BSSIb9FtWailUcHGNX4Z
   6k5Gscpa4iViqaAa82kcPeu5G4mKzmeyGJe802DB523rs2Vb8ZWHcfNUl
   rUa2QaOIBxPy6XTPK+rhiUwvY5PMWk1mwze6BU+FVGDHjj2Yniq6geJS5
   A==;
X-CSE-ConnectionGUID: Xe1IanSIQrCayCpeA4wNXQ==
X-CSE-MsgGUID: 89pMe1I8RUeF/bH+K9iXrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39135853"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="39135853"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 05:42:24 -0800
X-CSE-ConnectionGUID: y1JTG44/RFqyHYKBiFABEQ==
X-CSE-MsgGUID: 7XU8g3hlTH+g/rf4eIn78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="112482693"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Feb 2025 05:42:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 05:42:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 05:42:23 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 05:42:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQGjIidsh74HR1VQtQui3TNLWdJJiN8xPn7TBabdRSaMsqWqqwELRYqCj/XZkOcAZ98700ikYh9TSwnURpYhuMc7EHPPgQ/XubV8CFwqx7QzvZ/4whVCFRM7exZbmWS7SNrfUAfwU4+NwJ6ehm+MscFwGnYvy8GKzu+EMeC96W0Cc9qZte/EREqS6mDSCPJlYgkN5LwEwyuElSGGlxS5BJE8m2xPsiIXT3UX30HB42qL2l6Q0j4UFPUrIOe6u2+pVe3DVQUBZ4zmSeEyDDIiakCtmTOIhuZwJH4ZyyDnk1V7ppoumBfxb4I2/1EpGV6QGV3OPQN6KdKOWiNVrN7c1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=906hJVJvloG5PggyPyN+1kX5lKyJvKtsMmkFuhee76s=;
 b=UTUd7FK3sfoIYegMc18Ehayrlam0jUjt7S6hG5xmPe3O10s/YyD9SqMJrEDRaHh4mpQEnLj50pYq/TS7P6pc/B1ElFJpDACkvNsKU1KdUcmw2wi9IY9AD9MzPv+p7Xx3l41HbfLvB1TaIPa3vJhei6izr1N9aOcYTA1D9zPC0AjbAP441s5pZQvEKIp1wj4U28BQYrFkMPZ285F1ezbU3SPEMyCaPOolyRXzjIvGOFzlKLtHolaXqRS63Ab2eci0VyLmzSg+G8f8AXhylvGet0N7Nh67KbNv7doYuQCUEaAbGXCfnsovBwLIL+J/ekRvluPea+GdmT6Po56R6N2Dzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 13:42:20 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 13:42:20 +0000
Date: Tue, 11 Feb 2025 14:42:14 +0100
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
Message-ID: <4tuj7f3ttmm7xxkom3cm6xjnmd742twbaoieggnzwtmkif7l2l@hgilk7qn5te5>
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com>
 <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <lrlnvcxofcnsm5rou3iwbawyfwtz6mx4gn6eflpm4srhjj37kb@pwsozjgdyxfu>
Content-Disposition: inline
In-Reply-To: <lrlnvcxofcnsm5rou3iwbawyfwtz6mx4gn6eflpm4srhjj37kb@pwsozjgdyxfu>
X-ClientProxiedBy: DB8PR06CA0013.eurprd06.prod.outlook.com
 (2603:10a6:10:100::26) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|PH8PR11MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e02cf78-028b-4d53-84c0-08dd4aa1e85a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnprRmgzaGJhK1BJM2RMOXJKb1ZhN3BGWEZEbTlrdmE1R091RzRiMzRwNlRV?=
 =?utf-8?B?YWJ1UjBZbVhxUGhXcFZvYjdGVnlKRnJtcTBuOXFBcnNNYk9JNWFuQ05teUU3?=
 =?utf-8?B?bmJ2RGpJTFZsQjdsOXdRQUc1WlZ2YVZTQ2NPTGVIbFRXUU9rVW1kV3AyMEZR?=
 =?utf-8?B?a3VKZEI2b0plNlQwZllVL1BmTy95TnpxSmd1djcxWEc5TGRhaTNod09ib21L?=
 =?utf-8?B?OHArSkZNRWcyY1UzUmhqTGhnejJ4b2JjRTNMV2QzaUNTYWhPUWx6YVNpN2NK?=
 =?utf-8?B?TDZRY3hqOWZCODZZeEpkOGYxajJxeHYrWmMrT0FxZUJxQTRUSWwwTjFnRVlJ?=
 =?utf-8?B?Wk5vM25vZlFJRjZJVVQ1bjlyREl2aWlGSy93WEZmbDBsMTJUSzBkcHNiYnVq?=
 =?utf-8?B?QWNhdjRSRkNrY0E5cC9WMDl3bzg3NHRMaXVVa1pod2RsMS9GQzV2TGs1T2tl?=
 =?utf-8?B?UDVSN1dBeHNaYzlqN0xKVS92eGhSNytlQUROUFNwMlN6bXZQaFAxdWFqN05o?=
 =?utf-8?B?Vm8wVXBJU0JLQmdBTWh3NDRYR081OFVIdDNoMGZHOHFKcWhmQUZZRDdrWEJF?=
 =?utf-8?B?emRHOEZJMTdjUEhHQ2paWW56WHZpbGVHaVA2UXdNczRJaktxOXRlL3lEeDEv?=
 =?utf-8?B?eGI0cUl3TU42Rjl2UzJIZndHMlZ4bEM2cWY0K3VmZ0txUzdGOWZCTGFTYmRo?=
 =?utf-8?B?NFF5TmxhWlJtV2FqMmJ1YlRLUzZJeHJobHFhM1VsenV1WFdDTFJNZE5yNFhv?=
 =?utf-8?B?dktPdDI2Y1RscTRCTU1KSHB4SnVzVEVyMWRBaFZwN1lIUFBoT0VEUUc3NWJr?=
 =?utf-8?B?Z3ZHODZHOUEzZEpFUlNkMFM5cElsa0RXNTVndDU1dFI2OGJCWC8xQ2h3WTF1?=
 =?utf-8?B?VE0yMXY0ekdyQUhyU2YzaUJEVDFyUjNFdW1MTDhkOEppS2w5SjBEbUlJQmxa?=
 =?utf-8?B?NUhpV00yeUFGQ2hPUVFPOHExU3lEaWZVMlJPVHg2WkxoWForUlhSWHQrZEwr?=
 =?utf-8?B?WWdUNFF6VFhBcmM4b2I3a2taTmJGblRFYlpDTkRYcVZNUkErUkc3MzU4TWlX?=
 =?utf-8?B?SzJkZHhyTm1iWWMyTytWYWtyRnRrQTlTQ3R3U2U1cGxrbnpSRzFrOS9nczhJ?=
 =?utf-8?B?UXBkZy9Zcnc4TzdVaUVBMytCclJiZFZMeDFsemhGT01rWXgwUktqcXMyZ3Uv?=
 =?utf-8?B?R1BENFhKQzREdk9hWmlvcitwVERZdEJ0Z0xVTy9tRHRkV3E2VXN4UmFucERu?=
 =?utf-8?B?bFpPL2Z2QldQYVArclJmVXlmT2NYbGZqYlFKbVpTWnE1T3I4WW5TZWM5R01w?=
 =?utf-8?B?eGVSQm1xa24rQlRuRWhNKzBVUVVXNGpZdVZwaWY1N1FaRVF1S1ZPQVp1cGRU?=
 =?utf-8?B?RDZUc2laUW1mSVgvcS9FNUNTeFZKVEpWQnVJQlhZY0JPdlo4RVVXcEkrSTR5?=
 =?utf-8?B?TDJxNVphN0VyNmtLdzVTMXp2eEhaaW9rVlRhUlRDMVgzdWQ2TnR1VXdMdTRH?=
 =?utf-8?B?di8yd1BtWURQdXpHSWw0M0dheS9NZVFiVEt2UmVIVHZMWktoTFZFYzFwbFc1?=
 =?utf-8?B?aDR1ZFp0VDd1cWgySnd3WGxPZ2JqNEtuN2JYaUwxQk0wcndsRlBXeUNIaUVE?=
 =?utf-8?B?TDZOOXpya2o0MFFGeXVWakZnSXJ3MVcwaUVHRGRHZ210OWxkNXdua2N3SG9I?=
 =?utf-8?B?eW1rbEpIaDhQWTEzczNkWlZ5VjhCVUUvWFJuLzQ5UncySy9TeHBHTVFCem5q?=
 =?utf-8?B?YXlJZVdZTFMzWThvTjA4UUNzWHdzWjlFbm81eGI2ei8zbHVBTTNqTnYxQWh2?=
 =?utf-8?B?d2ZtSnB6U3l4dTArS1E2TGU3cVQ2WVBDcDROWXNtZlB5S1pqRWsrbk5YNzFl?=
 =?utf-8?Q?7zBkrTa5ORO9/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXA2MXNVT0pUSzQwTy85eE4venJzcFpyNG1NYzgzcE91RlBtbzZYUXRnOWwy?=
 =?utf-8?B?QW9XL3N4Q0NZd0lNUml4VlFmYlptMEw3Mm9uR1RZc25ONkxjSG5IbUsvVzQr?=
 =?utf-8?B?QUxaUlVYak5rQzFLc2pHZnByWnhUdk5YNDk3VkhnSTBHT3ZTUndMWXd5aGVR?=
 =?utf-8?B?cnRPeFVaTFhTbjBZRy8yaTF1U3g2QjhqZ1pWbmNCTm5hYVcxdlVvc2NYbmZT?=
 =?utf-8?B?RzNNS284QS9kUzh1WGQ3V2pQbFlOYVQ1dm1uOEVFZXpCMTRia1hKb0t3ZS9r?=
 =?utf-8?B?cDZTS09VTW85ZEx2NkEyWW9JS0EzRFVyNDlSQkhMc0l6TEExTlRuT3pneU80?=
 =?utf-8?B?VENERVJEUVgxWk04MVVKV0RoV210TnFYckRWejdJbXlJeTh2UkZ0YzRyRVBh?=
 =?utf-8?B?SmE5V0lpZVBMUHpFeS9pQk9mWEZ5V2JYUW9IbFRFa2xvZTRmWXJrczJsMmNB?=
 =?utf-8?B?c3cxMi9uRmkyNVo0NFFZSmljUkNJRG1ZNjhUSGp2VkFFZ1dvQno5SVE0RE9X?=
 =?utf-8?B?ajlxMHRJWnRLbUcvT1ErMlEwYU9KbHRsc1ppVXZmV0h1UWNha2pIcHVsbURY?=
 =?utf-8?B?ODJwa0NicEZ3V1lDNmNNbzh6K25SeFlmWE8wSzJqS2pOLzhmSGp6Z0tOL2ow?=
 =?utf-8?B?NmcxT0xGRnZ4N3VvZ3JLMkdpUkFLSTRlR0k3N0NBVWVjNC92RjdRRzNzbnk1?=
 =?utf-8?B?TGNNbmpweHVMKzdFRHhBU2ZaSVR4RzZKSlVaald5TmljdGFyTmtaaTRrNitE?=
 =?utf-8?B?bEpGaWlzU2U0QVF4VnhQZFdkRDFpbnRlN2xlMzNiUHhHY2t5RmdxbmJhbElj?=
 =?utf-8?B?a2Jwb1VhOXkwNmw0dnRvT2tMU3B5OVg1UWUxUnY3U3hmQzB1TldzeVFWN003?=
 =?utf-8?B?d0ltL2R4UjlJUWRWcnVWMW0vU2FBdC9sbTlpcWxnYS9IS3pNellCajR4NmpE?=
 =?utf-8?B?MEVQTU8yZmIwNzBxQTBVcnNnVmJHc2ZEdVpXNnlUTGgySGkrRzQyOTExMWo4?=
 =?utf-8?B?eU56QVIwQmUwdzl2ZGZhVTR1UjNPck5jQWJja0RBaXpIZjkrcTVLY1FTVjZT?=
 =?utf-8?B?elE4YWMrcHdBSm5IUjFGbGhlc3l6WTVLU2hXT3FMVmtJRVQ5NzFBdHZpalhH?=
 =?utf-8?B?bjNuTFFmczJzVW1kY2RHVGFHMWd4aU5VOGdnK0xua2FYTmRsWkdBZTNCbG03?=
 =?utf-8?B?VFV5REFqTDNqakhDamd6WU1UcGpwa2hodWtDeE12QzY3dEN3STJkTExBRnp1?=
 =?utf-8?B?cnBEK1A1eUZJL1ZyU3NvVFVkMkhiYVpWT3hKMnZzVE5OYXpncnE0UFB3d0lk?=
 =?utf-8?B?U2h0aW5QSjBJbjB6em5INzZQUXM0TUZIb0NiMk40OEp3OFpHNTN1ckJXMG5B?=
 =?utf-8?B?WkpHNUFtM2QyUkp2ak1lQ0F0ck1rNVlPYWVsTERVR1hnUmZpaWJKU2tEK0tH?=
 =?utf-8?B?Si94QmVpUWVrZXdTQXlhWkpEaDh6UTNKeXhoaFJyYmtuUWVZQ21pd0NsREFE?=
 =?utf-8?B?YzlSLzRJelpJdkZVQmV0eHV1VFRKQlpFblVDUndsaGp4U056Mm55cHhEeTdt?=
 =?utf-8?B?RDVoaG9PbTFpUlZLZ2RJTTFrRGdGUjEyVzBFQmRJT1FJaVR0VXBGWjZxcXZ0?=
 =?utf-8?B?VTRuUXM3d1dSZlBpL3FsT0NvSTdqUlNkQWdXc0VXbldsN2lCbGRSaURVdUIz?=
 =?utf-8?B?eVMzWWllTUxwWUE2T0o4bk9LR3JEM3lLTnV6UjlNMi9HQWI0M0hCSit0eFMx?=
 =?utf-8?B?cnVVU1BBNFdzUWVWb2IxMTc5bEtGNFFOQjE2bE9OdEM0OG1yTmxpSUhmWDFn?=
 =?utf-8?B?Vm9oNkNHOHVBRGJVV2dZdGp0ZzhURTRKM21mMUw4VkNJVjlwZVBGZmFhUFY5?=
 =?utf-8?B?UEMxNjk0UmlGdWZnQWl4Zks1ZUNNd0QwQlpjTFpZbzF0S3VBUFNyZEJKN1dD?=
 =?utf-8?B?cVB0WUpwYUpvN0hSRFZOUWpYa2FQVEFYR2pCMjY4RjVUNW5SNWJoSXVFRHdx?=
 =?utf-8?B?ekplZkx0VEVheHZVVjJXSlUrUDM3Qko4eWFVejZOekhRWVZvalF0V3phcmov?=
 =?utf-8?B?UTZHVlJRRlN2UVF4ZlVpbG9TL21jaGJnNktSMmN4RzlRemdDTzFVdEtsNzRO?=
 =?utf-8?B?SnJxTU5iQVFod2pKZXV2WWlDVmFGOFNkaHhoN0lGYndiSGZiVGVuT0d0dlN6?=
 =?utf-8?Q?vwvWC22WKFKnOHCspNmlmIQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e02cf78-028b-4d53-84c0-08dd4aa1e85a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 13:42:20.6621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFn763YXEb8pEL3FH6EkneP1Jm9jF0JS+XzpigozPaBMPGbtIsKKpaIU5cReun4Rr608HpVQ/ezbN0JezMx11AxKagbfEWHwxmR0ZD0wF0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_054258_140112_9DED842D 
X-CRM114-Status: GOOD (  20.03  )
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

T24gMjAyNS0wMi0xMSBhdCAwOTo1ODoyMiArMDEwMCwgTWFjaWVqIFdpZWN6b3ItUmV0bWFuIHdy
b3RlOgo+T24gMjAyNS0wMi0xMCBhdCAyMzo1NzoxMCArMDEwMCwgQW5kcmV5IEtvbm92YWxvdiB3
cm90ZToKPj5PbiBNb24sIEZlYiAxMCwgMjAyNSBhdCA0OjUz4oCvUE0gTWFjaWVqIFdpZWN6b3It
UmV0bWFuCj4+PG1hY2llai53aWVjem9yLXJldG1hbkBpbnRlbC5jb20+IHdyb3RlOgo+Pj4KPj4+
IE9uIDIwMjUtMDItMTAgYXQgMTY6MjI6NDEgKzAxMDAsIE1hY2llaiBXaWVjem9yLVJldG1hbiB3
cm90ZToKPj4+ID5PbiAyMDI0LTEwLTIzIGF0IDIwOjQxOjU3ICswMjAwLCBBbmRyZXkgS29ub3Zh
bG92IHdyb3RlOgo+Pj4gPj5PbiBUdWUsIE9jdCAyMiwgMjAyNCBhdCAzOjU54oCvQU0gU2FtdWVs
IEhvbGxhbmQKPj4+ID4+PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Pj4gPi4u
Lgo+Pj4gPj4+ICsgICAgICAgICogU29mdHdhcmUgVGFnLUJhc2VkIEtBU0FOLCB0aGUgZGlzcGxh
Y2VtZW50IGlzIHNpZ25lZCwgc28KPj4+ID4+PiArICAgICAgICAqIEtBU0FOX1NIQURPV19PRkZT
RVQgaXMgdGhlIGNlbnRlciBvZiB0aGUgcmFuZ2UuCj4+PiA+Pj4gICAgICAgICAgKi8KPj4+ID4+
PiAtICAgICAgIGlmIChhZGRyIDwgS0FTQU5fU0hBRE9XX09GRlNFVCkKPj4+ID4+PiAtICAgICAg
ICAgICAgICAgcmV0dXJuOwo+Pj4gPj4+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX0tB
U0FOX0dFTkVSSUMpKSB7Cj4+PiA+Pj4gKyAgICAgICAgICAgICAgIGlmIChhZGRyIDwgS0FTQU5f
U0hBRE9XX09GRlNFVCB8fAo+Pj4gPj4+ICsgICAgICAgICAgICAgICAgICAgYWRkciA+PSBLQVNB
Tl9TSEFET1dfT0ZGU0VUICsgbWF4X3NoYWRvd19zaXplKQo+Pj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybjsKPj4+ID4+PiArICAgICAgIH0gZWxzZSB7Cj4+PiA+Pj4gKyAgICAg
ICAgICAgICAgIGlmIChhZGRyIDwgS0FTQU5fU0hBRE9XX09GRlNFVCAtIG1heF9zaGFkb3dfc2l6
ZSAvIDIgfHwKPj4+ID4+PiArICAgICAgICAgICAgICAgICAgIGFkZHIgPj0gS0FTQU5fU0hBRE9X
X09GRlNFVCArIG1heF9zaGFkb3dfc2l6ZSAvIDIpCj4+PiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+Pj4gPj4KPj4+ID4+SG0sIEkgbWlnaHQgYmUgd3JvbmcsIGJ1dCBJIHRo
aW5rIHRoaXMgY2hlY2sgZG9lcyBub3Qgd29yay4KPj4+ID4+Cj4+PiA+PkxldCdzIHNheSB3ZSBo
YXZlIG5vbi1jYW5vbmljYWwgYWRkcmVzcyAweDQyNDI0MjQyNDI0MjQyNDIgYW5kIG51bWJlcgo+
Pj4gPj5vZiBWQSBiaXRzIGlzIDQ4Lgo+Pj4gPj4KPj4+ID4+VGhlbjoKPj4+ID4+Cj4+PiA+PktB
U0FOX1NIQURPV19PRkZTRVQgPT0gMHhmZmZmODAwMDAwMDAwMDAwCj4+PiA+Pmthc2FuX21lbV90
b19zaGFkb3coMHg0MjQyNDI0MjQyNDI0MjQyKSA9PSAweDA0MjNhNDI0MjQyNDI0MjQKPj4+ID4+
bWF4X3NoYWRvd19zaXplID09IDB4MTAwMDAwMDAwMDAwMDAwMAo+Pj4gPj5LQVNBTl9TSEFET1df
T0ZGU0VUIC0gbWF4X3NoYWRvd19zaXplIC8gMiA9PSAweGY3ZmY4MDAwMDAwMDAwMDAKPj4+ID4+
S0FTQU5fU0hBRE9XX09GRlNFVCArIG1heF9zaGFkb3dfc2l6ZSAvIDIgPT0gMHgwN2ZmODAwMDAw
MDAwMDAwIChvdmVyZmxvd3MpCj4+PiA+Pgo+Pj4gPj4weDA0MjNhNDI0MjQyNDI0MjQgaXMgPCB0
aGFuIDB4ZjdmZjgwMDAwMDAwMDAwMCwgc28gdGhlIGZ1bmN0aW9uIHdpbGwKPj4+ID4+d3Jvbmds
eSByZXR1cm4uCj4+PiA+Cj4+PiA+QXMgSSB1bmRlcnN0YW5kIHRoaXMgY2hlY2sgYWltcyB0byBm
aWd1cmUgb3V0IGlmIHRoZSBhZGRyZXNzIGxhbmRlZCBpbiBzaGFkb3cKPj4+ID5zcGFjZSBhbmQg
aWYgaXQgZGlkbid0IHdlIGNhbiByZXR1cm4uCj4+PiA+Cj4+PiA+Q2FuJ3QgdGhpcyBhYm92ZSBz
bmlwcGV0IGJlIGEgc2ltcGxlOgo+Pj4gPgo+Pj4gPiAgICAgICBpZiAoIWFkZHJfaW5fc2hhZG93
KGFkZHIpKQo+Pj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPj4+ID4KPj4+ID4/Cj4+Pgo+Pj4g
U29ycnksIEkgdGhpbmsgdGhpcyB3b3VsZG4ndCB3b3JrLiBUaGUgdGFnIGFsc28gbmVlZHMgdG8g
YmUgcmVzZXQuIERvZXMgdGhpcwo+Pj4gcGVyaGFwcyB3b3JrIGZvciB0aGlzIHByb2JsZW0/Cj4+
Pgo+Pj4gICAgICAgICBpZiAoIWFkZHJfaW5fc2hhZG93KGthc2FuX3Jlc2V0X3RhZygodm9pZCAq
KWFkZHIpKSkKPj4+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4+Cj4+VGhpcyB3b3VsZG4ndCB3
b3JrIGFzIHdlbGwuCj4+Cj4+YWRkcl9pbl9zaGFkb3coKSBjaGVja3Mgd2hldGhlciBhbiBhZGRy
ZXNzIGJlbG9uZ3MgdG8gdGhlIHByb3Blcgo+PnNoYWRvdyBtZW1vcnkgYXJlYS4gVGhhdCBhcmVh
IGlzIHRoZSByZXN1bHQgb2YgdGhlIG1lbW9yeS10by1zaGFkb3cKPj5tYXBwaW5nIGFwcGxpZWQg
dG8gdGhlIHJhbmdlIG9mIHByb3BlciBrZXJuZWwgYWRkcmVzc2VzLgo+Pgo+Pkhvd2V2ZXIsIHdo
YXQgd2Ugd2FudCB0byBjaGVjayBpbiB0aGlzIGZ1bmN0aW9uIGlzIHdoZXRoZXIgdGhlIGdpdmVu
Cj4+YWRkcmVzcyBjYW4gYmUgdGhlIHJlc3VsdCBvZiB0aGUgbWVtb3J5LXRvLXNoYWRvdyBtYXBw
aW5nIGZvciBzb21lCj4+bWVtb3J5IGFkZHJlc3MsIGluY2x1ZGluZyB1c2Vyc3BhY2UgYWRkcmVz
c2VzLCBub24tY2Fub25pY2FsCj4+YWRkcmVzc2VzLCBldGMuIFNvIGVzc2VudGlhbGx5IHdlIG5l
ZWQgdG8gY2hlY2sgd2hldGhlciB0aGUgZ2l2ZW4KPj5hZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIGFy
ZWEgdGhhdCBpcyB0aGUgcmVzdWx0IG9mIHRoZSBtZW1vcnktdG8tc2hhZG93Cj4+bWFwcGluZyBh
cHBsaWVkIHRvIHRoZSB3aG9sZSBhZGRyZXNzIHNwYWNlLCBub3Qgb25seSB0byBwcm9wZXIga2Vy
bmVsCj4+YWRkcmVzc2VzLmsKPgo+QWgsIG9rYXksIEkgZ2V0IGl0LiBXb3VsZCB0aGUgb2xkIHZl
cnNpb24KPgo+ICAgICAgIGlmIChhZGRyIDwgS0FTQU5fU0hBRE9XX09GRlNFVCkKPiAgICAgICAg
ICAgICAgIHJldHVybjsKPgo+d29yayBpZiB0aGUgKmFkZHIqIGhhZCBrYXNhbl9yZXNldF90YWco
KSBhcm91bmQgaXQ/IFRoYXQgd291bGQgc29ydCBvZiByZS11bnNpZ24KPnRoZSBhZGRyZXNzIG9u
bHkgZm9yIHRoZSBwdXJwb3NlIG9mIHRoZSBpZigpLgo+Cj5BbHNvIEkgd2FzIHRoaW5raW5nIGFi
b3V0IGl0IGJlY2F1c2UgeDg2IGV2ZW4gd2l0aCBhZGRyZXNzIG1hc2tpbmcgZW5hYmxlZCBrZWVw
cwo+Yml0IDYzIHNldCwgc28gYWxsIGtlcm5lbCBhZGRyZXNzZXMgd2lsbCBiZSBuZWdhdGl2ZSBp
biB0aGUgc2lnbmVkCj5rYXNhbl9tZW1fdG9fc2hhZG93KCkuIFRoYXQncyBncmVhdCBmb3Igc2lt
cGxpZnlpbmcgdGhlIEtBU0FOX1NIQURPV19PRkZTRVQgYnV0Cj5pdCBkaWZmZXJzIGZyb20gdGhl
IFRCSSBhbmQgcmlzYy12IGlkZWFzIHdoZXJlIGhhbGYgb2YgYWRkcmVzc2VzIGFyZSBuZWdhdGl2
ZSwKPmhhbGQgcG9zaXRpdmUuIFNvIHRoZSB0ZW1wb3JhcnkgcmUtdW5zaWduaW5nIGNvdWxkIG1h
eWJlIG1ha2UgaXQgc2ltcGxlciBmb3IgeDg2Cj5hbmQgYXZvaWQgYWRkaW5nIHNlcGFyYXRlIGNh
c2VzIG9yIGFsdGVybmF0aXZlIGthc2FuX25vbl9jYW5vbmljYWxfaG9vaygpCj5pbXBsZW1lbnRh
dGlvbi4KCk9oLCBuZXZlcm1pbmQsIEkgc2VlIHRoYXQgdGhpcyBpcyBtb3JlIGNvbXBsaWNhdGVk
IHRoYW4gdGhhdC4gU29ycnkgZm9yIHRoZQpzcGFtLCBJJ2xsIGRvIHNvbWUgYmV0dGVyIGNhbGN1
bGF0aW9ucyB3aGF0IGlzIG1hcHBlZCB3aGVyZSB3aGVuIGRvaW5nCmthc2FuX21lbV90b19zaGFk
b3coKSBhbmQgbWF5YmUgdGhlbiBJJ2xsIGZpZ3VyZSB0aGlzIG91dC4KCi0tIApLaW5kIHJlZ2Fy
ZHMKTWFjaWVqIFdpZWN6w7NyLVJldG1hbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
