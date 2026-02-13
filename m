Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057FDEF99E2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 23:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RZk8OV5CrMt5aBwqwy7QfKBuAFAKpE+nh91BoHlbB+k=; b=ir3hYP89ghMAHpFjU4QX4PvfgU
	ODXamOL03vFfuxVGMpZODymou46iCsWQalOilup1jwFTZHJe3l/VCKhc+FgniPnO+LN5Xpzbt08kj
	LPTvSR+aifK803Dmfzfn/3gQoVWVoFQLrIdZ0R8ku7MsgykfSEKJXSt/yTfVRZeTOM3AGA6jkWs7q
	YOm1Ap6B6fLUStQYtadWbCF1vSjeYlV1lkvJhUpEtSqljjBHmxNTEfTkue8afDZd0SgRCeuE5tMn6
	UqZMm8BByZ7L1ZEetiT2LLEobQIyxuVQ0qAQ1Bmz3nwH+ItspFqCqJh32k8Q83Pxqwv3FD/VhF7Pc
	xbqrk5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2OR-000000041Nq-3Eyp;
	Fri, 13 Feb 2026 23:16:11 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2ON-000000041NE-4177
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 23:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771024568; x=1802560568;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jBYsg69+GgXjpZGGdsg0y1NsSxDnZ9zYnOw0xg1fLGU=;
  b=kagFlHy9rsMEtJ6Jwb6XhQhtHZAGoNO5KSygP0hnajOxZVXvciTXbHnj
   f1BIwOToZXRhFCXIDyURsg2cEfU+IBvA8ShzEPDpkp4iP5Yt/8UdpMu1V
   mcZvHwGXNU1zmMKMpBvWQpmuXAvZAa42TKbqu4TaDstvyvbKrsjJm5ZrA
   6f5cKn9AYd9PKtaBdGJHA9syJQUpfBW74raAkyEmrmBY6ttaAeIsb3qlv
   eydTxqYeRs3zYo669acqDRl6v/RuJ8/qplFlZoBHrFNpSuEiZWRfRLyBG
   X8Nyrt9qMo31/RdKVNpiTLA9kpWfZ/9WkyOgF+Lq+ulfHPAvYyPeRYI42
   A==;
X-CSE-ConnectionGUID: mRLkBcFpRzGsmJ5CEMc1vA==
X-CSE-MsgGUID: ezAnnmE0QomOiO06nnjyhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="83313867"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="83313867"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:16:07 -0800
X-CSE-ConnectionGUID: Fm3/+PTsSe6K7pt2h3pHRw==
X-CSE-MsgGUID: 2bLusi0vSe+G8bm3d+1h2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212890138"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:16:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 15:16:05 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 15:16:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 15:16:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TiLoNW+ryAeFqD1zWgrN5yKCenOkL3tAe6EiTYtDfXtyDtl+C3fJ9Fa2VlJlYl96Rg7ASUv8fdw6+gpGPmweb59+ststqyID80RdN+O6VrjIJaT+9+PDTvEJRqeBpAbUl8ygTMZIKB918ueDy438VIOpv5Om8Ka/b/ZhfqA6D4j4C4HaLQ2m33gcB86uRr/W6tseL3cP6TgBG5aUswyBQ0KCay0Jp2kQiN+63+EnIANsL9d8mOscpglyP4l/HynthAPbjIIjlba18Lr9YkeNZxnghjrh6JbH8nlw+qXnN5B5/FKwhs5F5lgPY6kEuDzBIO/dOam0GoE0cJ0wilJXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GS4qFuVYNbKSPN3gXnAtSqZa8FC1Xb8mGJZiz2n11to=;
 b=QChMC+KaqNCaIJ4gDxPRII5AHkqniLe6Nk0dfMPlP1AREp9jQ3Re0Jhkr/Zc76CtygzzGwLDDpBtyDBCUQtFJAgCmY1X5FQjaKAPBKiLxdQrI2wC2KhCvIEFXw78yOnyUCNGuJNut6Akvmc6dt4neM9yWciW4SrO9Zm7rMR2GX5ad6f42aZYgXZ8G9Y6u3qIqJTfMC2Sqb/BFGwVE9DJ5dpmEF7qtY+fwEUAog/C43GD5T3NNMemCCCimJHlZBeOHRO8lY1W6YmUMv4YiF/vaGOv9TmNgSP7734I2kFheAnZJVct/oLTYqQp2vVwavSH86BnV6uwqoXAkM7JfcG3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 23:16:02 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 23:16:00 +0000
Message-ID: <34bb3ae7-b48e-4c29-8762-0d16e0e7838f@intel.com>
Date: Fri, 13 Feb 2026 15:15:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI resctrl resources
 and domains
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
	<guo.wenjia23@zte.com.cn>, <liu.qingtao2@zte.com.cn>, Tony Luck
	<tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, Peter Newman
	<peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, James Morse
	<james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <x86@kernel.org>, Rob Herring
	<robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Robert Moore <robert.moore@intel.com>, Sunil V L
	<sunilvl@ventanamicro.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <devicetree@vger.kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CYXPR11MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4e742d-d8da-481a-ce57-08de6b55d9c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS83Y05RNTBOQklGbkNjOGxLYU9iNjdNNjRuQ3IyYk5BRS9iQUVMc3JmVGxJ?=
 =?utf-8?B?Qm5qV0p4c09zOWltVHdZZ1d3KytjTTJBczdlQ0FmekVBTTUvTnNGcGdQbzE3?=
 =?utf-8?B?Y3FyLzJyaDBvL2FUNm5YOTF1emVScnI3T0FyNE44aktYNERMOXB5UThiZlJ2?=
 =?utf-8?B?VW15VSttblRaVFhzN1hOQWRyNitPbzJBSnFZSWhBN3dPMllzY1RSYlNPNjdt?=
 =?utf-8?B?TXc1b2lMSlRoVi9ZVFU0UHAzTC9mQnpXeHk0d04wcnFQSEQxRUdUdjk0T1Bh?=
 =?utf-8?B?UnpOV1lXaTIva0ZLZ0tYK2pxK2lvM0tQWUsvMzRPOWpwbUk4dzdXWVRzaEY3?=
 =?utf-8?B?V3phZHdSZUhCY3NiMUFtcnEwWnVIcm5vVFRwVjZRZm1JUFRpNXFmcm1PSnVC?=
 =?utf-8?B?V1lKNTRseVQ2Smg4aWhwbXNjZDVyajJzNXJXQ1U0WG9mSWFHRysvQTIxaHkr?=
 =?utf-8?B?MHNlUTlhREpydlo5NG5ZMzBMaFQrTW5hUjhMcy91Mi81a1lIQXkrZk9kejQz?=
 =?utf-8?B?aDFaU21tWGlaSWx2R055L3Q0bVcvU2Nva1FnTzVwNkd3L0wzd1pnUDBVQUh4?=
 =?utf-8?B?dHhoUG5uaEQvdWhNMFMxMDA1bmJicVZGcWp2VEhwREFHc3prRzQvUk1iaFRo?=
 =?utf-8?B?NnRLaTR1TE9wd3lRTUhvaGFjWnpXcnRDTmc5RG5UMmVXd0REUUwvRnJjYkZR?=
 =?utf-8?B?aFkvQU1KK3orR29CK1JZUjhLeHdkR2NlV0Rvdis0R0N0UVZDRk4vM2JiaUJJ?=
 =?utf-8?B?Q3dzM1ZvNjdsOHhadDdnSmNMTkQ4d2hvaGdrS3FHU05WQ3g1VUx2TlRtK000?=
 =?utf-8?B?RUxROVVaTlpwVm9mUWk3RXl4Y1BQa2Q4czhTZTBpQS9kTFROeUZmbDZwSlRX?=
 =?utf-8?B?NXRoeGlKYU01cXVCQll6SkF5RU1kckhTQUhQWUxIWVZZNkZnWjBhQk1jMEZD?=
 =?utf-8?B?TFNtY2orZitJbmovWmtrMXZuc0dnU3ZWbldmZmVFK0Rkd1Z4RzV1bzYwekUy?=
 =?utf-8?B?bWVmZjIrTHpRS1dtczRaNkRGbHpmWkFwWEt4cGJEWVVLQWhDTjEydmRaeWx6?=
 =?utf-8?B?N2crcFZNWWJHY20xMzdoa1BQNEJ0K3Uwb1ZCL3U5RmNFU2dsYWNrWjNBd1V5?=
 =?utf-8?B?d1lwdnFGMlZXTFhrWE5QOTFZNFFPTkIxMUJuQ3ZQZUpsSW4wSk5YVnhYRk5S?=
 =?utf-8?B?QW9CMjVpSEhFZHQ5QVNVWnFxQkVLbWczOG5yK1ErUGZoZVFIOUVtNEhDaThl?=
 =?utf-8?B?TnBxVk9MdG1iVnJYTTBsUys4U0tZQjY0eDFzYzM0U1J1dUVOVnNMQ01yUGkx?=
 =?utf-8?B?emd5akorTFhnSk5GeGtjNlZqVS9SNVIzL0thRXVEYUIxMEdMR0VyNXViZ2xh?=
 =?utf-8?B?ZDQrRDhraXdnVm5ubHpvR3FmOVZKU2RaNzRyeTRCYk94c3FhTUJjdmhob0s0?=
 =?utf-8?B?MkJsTnJhcGtwTzIyQmErME5nZ1ZuMmlheERRNGFXRE8wT2pkaWJqeDJZcXVD?=
 =?utf-8?B?NjNNcnVjR2pwMTZVTjFCQmxxTVRjbzAwUDQyd3N5TWZMbzdLN1QwMWdsZjhH?=
 =?utf-8?B?Sjh0YzhscDRZeFArTklOUTlXQlA3WjF2UE5BR3ZzcjU4bTVXKzh2WVI1YzZG?=
 =?utf-8?B?TGh4cElPUmEvY0gyQytVVkVucXlpOFhRQlZ5SzZ4UjI1bEJFcXhYRmdyNk91?=
 =?utf-8?B?cHZ0R3dOVm92OFY3eHovMTdqb1VhbTJHYnZiemFRM2RJY1JWVXZqUkx3WDdo?=
 =?utf-8?B?SHczMkNhR1hHTGJPK093TDBqNndEaFI1bGZZQWt5TzMxUlFVdGZWNWcrdERm?=
 =?utf-8?B?TWM1d2JhYjRVQ3hROGJDZkhLZ01qWlhZNVloQUlyek5YR2ZVazd4MmlpNzNs?=
 =?utf-8?B?b1Y4dFV5MURxaGZmNmdycUZDMzM0QWZHMnBnNlBWa3lYRlhxZXJ4UXM0VG5n?=
 =?utf-8?B?dlZMbkZKN1g1SkYwTU5WTUE4Mk5vQittQlhqNHQ2c25Zd1Z2NzZiTDZsMm41?=
 =?utf-8?B?czBHQm85Z3Y4aWNDWkNZS2NmRk1DSUtYVU13R0tQTWQ5U1cydlBJczYvTE1Y?=
 =?utf-8?B?cXVhRFk2ZHdwSCttdDFmMEtiMGNSaFZ1dXVKNFFQc1pwTTJoVmtCSVk2OUkx?=
 =?utf-8?B?M2hqZHRCZ2xLMG9hUFUrbjUyTWtOY3BtZkFnejlpQ2Z6U082NXpDQnk4V1dQ?=
 =?utf-8?B?dGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFFLaXNGb29pQjJUeFhEWkw1dU8rdmF3M0Y1a3RSdFRiUWZUWEVDekk2VHJT?=
 =?utf-8?B?ZjBPSFlpaE8wU21hSW5JQ2FrdjQ0Tis1MGc4SzNjazhCdWpIZ2lsaGliTW9J?=
 =?utf-8?B?N2F2Wmp4WUg1QkhpNy95aVJLV2FOUkJVTUpTSjdkZFp4QWlEMDhHd0Q5a0ZG?=
 =?utf-8?B?MlIvYzMrZERXSGVCa2Y5NHVxTWF0dXVFOSt6NitHY1kvWHNLczArb3UrNml0?=
 =?utf-8?B?dXNvR0ROWmd4clVheC96Z1EwK1daYVZQbVZUVC9JR24vN1dmaWFzcFArRlln?=
 =?utf-8?B?M3A2TVJhUUlzU2lRZ2tpdFFtcXkzeGJJM2pFcXVZODNxb3JpNW5jR1VySGFC?=
 =?utf-8?B?RWt5N1E3VUxpNkMrc0VxQnM3TEc5ZHFlam5uaDdPb0lsZHByTk9FRnpZaFN6?=
 =?utf-8?B?QUhBQ0NkeDQzNUhGczNOSmxsclZLK2h5WUNJTWR1UXZaR0dUTFgyODA5eHgr?=
 =?utf-8?B?MXZMOUx3V0Q0SEJMWFlXUERYQ1hHS20veW14VGs0SXc3MWtabXhiL0hqblQr?=
 =?utf-8?B?czBUN0ErS0d6dmp5VVNSZlNRVGRjZzBqdzhIYWJsRnhUZThMdkM3UTFYK3Br?=
 =?utf-8?B?anMvUzlQLzNocVpacnpBL2twVDB2NUJYSHMyVnVxeGRDcStqZXA5MUFDQUZj?=
 =?utf-8?B?TWpPSU5ya3IzeWNaYU43YWhVaHpsbjFCMk9acXE5YThLNEN5WDB4U0RFWUdj?=
 =?utf-8?B?Q1dDZ0ZVdkEyeDJlN0lJZ3hRdTNKODRheUw5MFZXZkRjeThTa0tJTVJRYi9W?=
 =?utf-8?B?WHZiV2l0NUxCMkhwcWFjTjJNM3k3dnBnMkl2UmhoV1FUbm5sTE9QTExyMi9i?=
 =?utf-8?B?WEtCT3VlSnVRYTl4bmJjVURpd1UvajNCbkpOTGlneVBHbkJJNFFvTFkrRTZm?=
 =?utf-8?B?dWlvNjJMenV0bDBPOUw0V1YwZGk0L1ova0JJME9pUys3WWJrVUhXbkNiL2lF?=
 =?utf-8?B?aXJIVUdQcm9DNnpteVRaR0xlWlo3VGt6NWtUeEtOVWcxNGFOMGxFV2g5VGpw?=
 =?utf-8?B?eksrV3NOL3E4YURUOXo3R0c4cHJJd3Z0RnZSTFpQRjdNaTVETlNQVVU0ZVps?=
 =?utf-8?B?RGhDTUZTTVhMK3oyS3FjQnRObHNtTXFDTWgyQStPZWxBY2huY0dLazl6aXps?=
 =?utf-8?B?UjlKcVYxVGZ1TG1QZTJpSUtzOXVvanJiNnFDbHpPb3VRZTJXMjdHY3ZqR1Vq?=
 =?utf-8?B?c0FxR0o4czY5QnNjWjJRQ2pUSGF4YmlTWTlmcEI5NkJyVXlEak9vZmVFSFkz?=
 =?utf-8?B?eWFSMHlWU1UwWnJSeDBjTXEyaW0wM2hIMk12YU9GeWRiQW5KV2RQZ1FtckVz?=
 =?utf-8?B?c2M2WVRITGhiWnhYd2hReExjZk9HU0xIYlEwUFVHRGZUWFRhS0pKeHpKdytl?=
 =?utf-8?B?emJXc3B0ZEN1ek9POC9OckhyS0ZzTy9pUVRaVWFLME5Ld0lYT3FJdW95Zm1z?=
 =?utf-8?B?YkZBQ043dUFrZDBOMWIvWXhIMG1KUlJXNDBzYjlRb2dBaTVuTEYrNGloQ25y?=
 =?utf-8?B?TXBkN05DSXYwU0hZVk1ubXBlMko4RjF0alF3bWRzOVYwMldaL0RRMGtDZVFz?=
 =?utf-8?B?Z1lYVXZkenZBcWp6Wm8zNzZZWi9mb3MwMmpDTTVzbEd0dXNkc1NVanhyUnU5?=
 =?utf-8?B?aW5TNzN1Q2R0a0Y4Yk4xYTBlNFBBTXgwcXVaYlNmOEg5NFJvbHBoMVJ6dE5s?=
 =?utf-8?B?TzBqeXBNMlpHNFJZSHE2S3lScG5KZENtV0FsWlhnelJGQW84d3B5cmlkVEdH?=
 =?utf-8?B?OFRMaXNlMlJFaGlCTmgyV1pPb0lLWFJDTFcvbmc0R3VnbEhUY3F0SUpkOVNQ?=
 =?utf-8?B?ZmNxWndwR0EvZzV1Z3h4NUU4S1diM3lpYTNmZy8vQUhXeUtSbzh5dVdncTNp?=
 =?utf-8?B?akdtZ1J4U1ZHNEJXT3RlaXdIZ3FycDB1Y2RpWGswTzlybGdsbEpzTWQ2blhJ?=
 =?utf-8?B?N2ZTUnk1Z3pPc2pSY24rem83cGdQMFRqTEF2b1lDMFlaOWZOWnR2dHhSMEZ2?=
 =?utf-8?B?aFp4Yjc5NTREdkJzUEl0Vy8vOEZ0WmZKRE9TWENaS0s4QkM0YWRpZ3JLckVm?=
 =?utf-8?B?aGNmUUp1R3AvQlpBUFhTTER1UDEzdHg1dndNQU9JOStlUzZJME9qVnA5S1A1?=
 =?utf-8?B?Y0MrRXBBVnhqRkJzY2RRQkhYQmlZQ2pXSkg1clhCNVFNMXU5bU1CM0JhZFVK?=
 =?utf-8?B?RmUzNlY3bnZ1S0lJc3pJKzVkeWdSSlE4U0dxeHNTdjRsOG5Ham1zUGFWK3Ri?=
 =?utf-8?B?V1FxeGszQ0syTUpyWjRpNS9RczErUDVKa0tKUzcxVWRmdnEvdStpVVNuZXVF?=
 =?utf-8?B?S25iajdjNCt3N3dtT0FCT0NiQk1LYzFBaDJSNXRGc0tQYWRNaWwzRUllNXZn?=
 =?utf-8?Q?WO6M04pCPTeWVHbs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4e742d-d8da-481a-ce57-08de6b55d9c4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:16:00.4432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgwS/S9d1SeZs3+3GchrKEzvKVVsoEsNTfRDR+PQY/7wSIaaSzcq2VxCW0HPlcXcYhqEvol5Fb2Q9U6Vs6HVufk+8uMshM7kjL7aVKK7dWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_151609_276419_197A7A82 
X-CRM114-Status: GOOD (  15.59  )
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

(caveat for all my comments)
I scanned this series for resctrl interactions and my comments are
focused around that instead of a thorough review of all the code
within. 

On 1/28/26 12:27 PM, Drew Fustini wrote:
> diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
> index ff2c7eff50be..c0402dd06cfa 100644
> --- a/arch/riscv/kernel/qos/internal.h
> +++ b/arch/riscv/kernel/qos/internal.h
> @@ -65,6 +65,11 @@
>  #define CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT   2
>  #define CBQRI_BC_ALLOC_CTL_STATUS_SUCCESS  1
>  
> +int qos_resctrl_setup(void);
> +void qos_resctrl_exit(void);
> +int qos_resctrl_online_cpu(unsigned int cpu);
> +int qos_resctrl_offline_cpu(unsigned int cpu);
> +
>  /* Capacity Controller hardware capabilities */
>  struct riscv_cbqri_capacity_caps {
>  	u16 ncblks; /* number of capacity blocks */
> @@ -125,4 +130,26 @@ struct cbqri_controller {
>  	bool mon_capable;
>  };
>  
> +struct cbqri_resctrl_res {
> +	struct rdt_resource     resctrl_res;
> +	struct cbqri_controller controller;
> +	u32 max_rcid;
> +	u32 max_mcid;
> +};
> +
> +struct cbqri_resctrl_dom {
> +	struct rdt_domain_hdr       resctrl_dom_hdr;

The resctrl_dom_hdr above should not be needed and indeed does
not seem to be used in this series. The two members below it,
struct rdt_ctrl_domain and struct rdt_mon_domain (now named
rdt_l3_mon_domain), have the necessary struct rdt_domain_hdr as
their first member.

Without any comments or changelog that describes the other members
I am not able to really consider their inclusion here. From the
names it seems that most members are intended to support the
control domain usage so it is not clear to me why the cbqri domain
contains both a control and monitor domain while they are interacted
with separately by resctrl. From what I can tell resctrl_mon_dom
is not used by this implementation.

As hinted above, when you rebase you will find that struct rdt_mon_domain
is now named struct rdt_l3_mon_domain (see commit 4bc3ef46ff41
("x86,fs/resctrl: Rename struct rdt_mon_domain and rdt_hw_mon_domain")) to
make it obvious that it is specific to L3 monitoring. Having this
as a member for all cbqri domains will then become increasingly confusing
since the cbqri_resctrl_dom is also used for L2 cache allocation as well as the
memory bandwidth allocation that are not at L3 scope.

I think it may be simplest to drop the resctrl_mon_dom member until
monitoring is supported?


> +	struct rdt_ctrl_domain  resctrl_ctrl_dom;
> +	struct rdt_mon_domain   resctrl_mon_dom;
> +	u64 cbm;
> +	u64 rbwb;
> +	u64 *ctrl_val;
> +	struct cbqri_controller *hw_ctrl;
> +};
> +
> +struct cbqri_config {
> +	u64 cbm; /* capacity block mask */
> +	u64 rbwb; /* reserved bandwidth blocks */
> +};
> +
>  #endif /* _ASM_RISCV_QOS_INTERNAL_H */
> 

Reinette

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
