Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102E0FD8745
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CGf364P8+FPq+5TinVrmLh9vycU4nYKjhEioqpXKHQc=; b=2loPHyRgi+1HTqIo6uChrbM8v/
	LpjvQ/4NjPOTt5lfOeqYzjyxYrMc1H1UUm2aq46lnaUSfrHcl1rstnVamTwDjtJpjbF+HgGkEmyBs
	OvPxM5u7nUDquZZbnzPFzikjx0u4IWO0+6uUxUyaburdbd1P1wKhoniCPZCsidqsy5nu0Is7JywKE
	ksLHbkSX/eEo0T1cbgTV3rP8osP+ljyT0RdsLdLTLuKNx8E7Oo7YCBXQcnHAaKS4dpwsXbWkgxR71
	X5NyzTgLTWqSP4qQkszUTiJvqGaMsXhH8D9QaXK/2frN/napEag7KVDrmXr0IkodJbRwzM/TC5SlR
	Gir/FAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sg7-000000069UR-3JMP;
	Tue, 17 Mar 2026 11:33:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sg6-000000069Tz-3bxj
	for linux-riscv@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KiQhMUw45Hk1hQxizz1Ua6dXVtF21cve6Qk8M9mUq8g=; b=lwZudxX+O8QcWsUI2jm08qWD15
	4ZT4FA65+/8o/fgjoEPcwlFhlqadcZiyP0tHufQkaLsn8PaCoJND7HaItz01LJpIcvfTBWMDVYpKu
	QVQSulwXCadKqs6kLWhRFG1C5QUxOa9daoZSuPJT3CW1RJRqJHdUc4fNABg4jE7LO76NRDxcWkto6
	3hO5mjxJ3AvCnuybsW233t1fuxWkBQ5bhScaYIVzhXKJOA/fvg6H8VvulvVhDVtXFn6jsEMJrhQ8C
	1pK8O4+JB6zS94KYKW15FYCcShYj+w944agNBGy9RZ+G10orQVoanicLyIfqLjdcm3Q1bhC9DBVnJ
	gAQvXL2w==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sg3-00000008pyh-05we
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773747215; x=1805283215;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/w1kcLaIfpNFc8F+CuZdPZFWwfJR/zoffw/9OYSHb3Y=;
  b=g07wyPeLu1VNPdVeQH0isTEK2ZdYO4iJKfT6jtmWJrjc1LC4tzH0DMwJ
   VFvscCqV9WUkVYyuHDMwjE3YZDPtVGLcYK9GC+vWTBs4e2IT5Uwi2//xb
   ngzPTC1a9JeV4bNIxWsLEJpUQS2DmEl9dNzPvSOerO5+tZc6ho40JOrQv
   6DFUCtEeojRvmcsAIK6njZ0LSV5UUDU5G6UtllNpJNXyY7g1f02BCryRN
   auIGcXzqrIWtVfUN9quru3hUMoZBtkRRRajGDoIZ+UXDFZ+ziiUyMGkLd
   TGx8SmH10evboFAIKMhjGq0q13D9hrTAluFu+IppA+uRK/pybubvhRxrI
   A==;
X-CSE-ConnectionGUID: x4Xhw+gbQE+zYUTWqfkgWA==
X-CSE-MsgGUID: P1EOAWPSS0yJpBxK2wbJzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74958682"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74958682"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:33:29 -0700
X-CSE-ConnectionGUID: hIVJVRhvQ7eXwbe5d1OOYA==
X-CSE-MsgGUID: OIXU2zQWQ7SYgOU6xL0vgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226366222"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 04:33:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 04:33:27 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 04:33:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 04:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lX5T1I7J4cr2spkCV7ShaU3vbzzq2tSLvqS97n6VixT/ATnsCrBWNDEFSpM7FBmX4uYhHB3L5oBiB4RHWuhDmbs4qG3vIE43xAyjq7SYW9WPtbSmV7DJTTnd9sDpPVDLSvpw34ebnPkPneG4UPM/I07ry1DJynoPrjM4I7jsghFlREC8dGzCJm6HNNl7/X4A3KwMUVX0dbOAqohCnqaJ50CY9hTuBPAk5D7xY4VtPDXU2yV5+6Ac3gHvuwJ8yBc46W41yK48FZR47u3nj7FFLufovuAF0bLdtFJyArl9O1Y1qT9SWKZh9cVqpp27pVU9YcLjVVLFMRxVIaifijoVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiQhMUw45Hk1hQxizz1Ua6dXVtF21cve6Qk8M9mUq8g=;
 b=U5OwPucwUhEHNzZZwI1q+Zd9VQABGZO43ydIVW+SXYgXJ4jbEKr2r3SPGTFf6GPVDxYVwZE7pC0QYyVHi0e/Nvyp856XD/d4u5h+J16Psb7vNgieKgvG500q858KR7gycLkdHDtueWJ1x1rAKQfemObXr5EzabDWEvWxOyNK0RzSlkwXV8M/XN5eznaMe1h+324JjrxcXaGAJFyFI/VoO/vbhAdmDc2fgEs8pdJeyiCwCq0DL20jNtiReOAIeEnxpdGB/+CXjWFaUJxweZmT+dXPVCLtC1gKl0US3XJjOV7ibJbuTxTa5EwxYe4oabnap+FOAfLgdtpiclx//d80vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA3PR11MB9160.namprd11.prod.outlook.com (2603:10b6:208:57a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 11:33:24 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 11:33:24 +0000
Message-ID: <1b7a6774-8842-4808-a61c-e3c0e4c38a3d@intel.com>
Date: Tue, 17 Mar 2026 13:33:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mmc: sdhci-of-k1: add comprehensive SDR tuning
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
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Anand Moon
	<linux.amoon@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-3-aefd3b7832df@gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-3-aefd3b7832df@gmail.com>
X-ClientProxiedBy: DU7P194CA0009.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::8) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA3PR11MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ddf58f2-6dcb-4a70-1287-08de8418ff7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: xkOApqLgplPDJgk+Px6VqbWkeIIpAX7JG3++M6SwX8N/yjIlDDSgywM5mIZ8fYTFIXUU0d2hNxExXlM85HtvvH1euU+vFLNOej6jN69MjRiWbxUFNtvy53cbs1n/eVBx538Y76L8uymgI2bHBG705/KUCfP1IWOfzX94sO/xvdaP4i8+lBnvPAbxw/IF0DHSCsN9qWSKb45KdohfAX0I9VM7sbYNCzYvyr3lLocL7YPdcxfpKvAHf3YDWhGCXiZSl9qMrlbFpg2joX/BSHKaSZWv8xl11pcNBCAYBcObhBDiEkDxqfnc9Jen4idpPkEqLUrcG6CEhmkga4OVq3+cbHfITlUbQvyd6n1m8kcUHVczm995F23mDa5UlKTUzYvt1wsEi9UBGwv98XelYD4mMqHDOJ53JOJo4K7YOkhz5MrxSIX9Piz0TlcHyocp4fN0x1VeosEWvwdoNpRzQ1CYaner9VvS6AbprjxeZPM5OXPmBR5eQVrIdNZe9EG8dqnJg385hKmB7sSgNrQOwTPto1jkm26rFKkhqZlR2WGoGOPe7I9YBQQdeCe1DdTa5mO+hGHy839xe23fBhrw04hr6Jsyd3Ye53cQX8HDH5p+WjMx27W1VKToQDlJHUvb1onVkHvRFbU+Cj+9jixXXQQ9rEbpIaA+moCmqrB6yHjU/j8do+S7MCfH0ZZ//MED3k+IC93sUuCepHrVlQc4Z53+/JdMNqQQ/sP4qDDs94GHRPMltMTq3MRNAJRdw+bEWQS6bpnShnmK1N/73fACdLT93A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R094ODh5bGRkczZjczdwK01UQmJGS2xzNGVJeHdTWHFNb2R1SGp5dk9YTGlD?=
 =?utf-8?B?MjBGenU0bU01VDN0YndKRC9rdndPeFVDOVpMZ0NiRnM4NzcrVkFpblpPVi9G?=
 =?utf-8?B?ZmRRZS9TR0VYTXU4WkYzQnpvOXJVd3VZNTVScWJHQmNtOEFOU0lvNCtINzhU?=
 =?utf-8?B?aFJHN1l1WlBSZkVTOG5UUndKUFVqWHh3YVNINTdVU3VDNEpONVpuRnJYL29p?=
 =?utf-8?B?SzltNTFjR2NRWHhGazJDVmNWdUIzNWRHSmk2WFFKNUJtczQvbWVlczZsSUdB?=
 =?utf-8?B?RlZoQUdCenVTZzdGSEE5L2RDczh5d3ZxTWtvNWNUbGRmK1RRVnFPUUY0cUlX?=
 =?utf-8?B?RmZkSTh2QWt1NlFLUUU2cWxJc045K0hrLzVZeTdHTUNFMUxud29EcWlKalJF?=
 =?utf-8?B?TTZCRFd5aGl4bnVqVTE0WFh5L1pSNXAyMDVERlpLL21CTFJwSkdwUEhreHZR?=
 =?utf-8?B?cU9wVFdMQi9GMkMvdVRYWVM1SDRPNE5ZVFZtNGNVSHByUEZnZ0duMFpVUEtG?=
 =?utf-8?B?dVQyWEJXTTk1WkpnYW9Tc3lINzNmS0NqRDYzTVhjaHdRL0VYTDhtTlNHTXBr?=
 =?utf-8?B?YWlweFh4cGZhWHpGcFg1RlZBY3ErRU9SUGJtZjc0T1dmUW9SYkJ3M2oyQmRL?=
 =?utf-8?B?TndtWnA5RUlCcDFEZEN3bDRoamdORVpJdUUrL2Y0cmRRMW5KVnlGK2w0Y3JO?=
 =?utf-8?B?dUNhYmlaaVNRWklsMEd3a1RVK0VxcEliNS9qTXhGaHFRUGZMdGJQMjF6TXpx?=
 =?utf-8?B?Tm11MEpKZGZnelJXWHVRNlI5dStUQkZLRU9tanNyTkJjNlNRd2N3UU54MTFR?=
 =?utf-8?B?Y3V5S012RHVpSWkrUE8wdENsUGIyVFY3RnZ1aURYOU1PV2Frb28weHZ1d3Vq?=
 =?utf-8?B?R29rNXluaHFtdGZMYXZSd0p2REJqRjd2Z0RGNFd2UUVYQnFTQmFITWw4a2N1?=
 =?utf-8?B?L1RYUitwcHV4aS9aTDI2Yi9hSzJpcWZVR2V1Y2ZDbTNGU2lYeFQ3RHpBZWhV?=
 =?utf-8?B?WjFCV1oybFptbEhuRThRQUVWanZjcVBxaUhVMmJES0lrR2xEOHdWemdLK2hp?=
 =?utf-8?B?ZDJRU0RPM2FWTUdHNmZlREFVR0NiM1pna1ErR0F2cmdaK01LMGxxK2ZOUlBx?=
 =?utf-8?B?SC9iOXN5RzF4ZEgvdSt0c1pqL2F1cEZLR0RJcUIxZE1ZUyt6WkFjbHBIVFVh?=
 =?utf-8?B?SDlwZmoxOHgrcDFsTDJjdjdmTGVSQmNOOVR6bDl5RGFiNUpoNnhQb0lEQ25E?=
 =?utf-8?B?Mi9ZYlRTb2VPMlE3K2M3WlpLMDVJUGQ2TDBsamp1akZKL0VNeSs4VmJuZWxm?=
 =?utf-8?B?cm9TVkRPQncyTU9Yb3FzWXBhZGhmSTRyZkY2VUVZM2tKdUJHS3g0NFV2cUdH?=
 =?utf-8?B?WCtEVG9BVEQydjdlU280eGJoRWtnOTNpRlVzUS91QjEwZHZuMXNGYlREdmVK?=
 =?utf-8?B?dXNSVEd1ZDdHcFQxbnhGaWRkcFBic3NzUFo1QkFac0pGWCtqZko3OUFnN2hw?=
 =?utf-8?B?WFk1czBJNzlCZUZEdmM4TlVDb2hBeWNjcWJFMEdUeWcwWXU0YlYyb29KYWww?=
 =?utf-8?B?TzJxNlNiUUVSM3JnNzlWemhxWi9BZEpMM3R3T1dta1hwTU8vZEk1eERrMHBQ?=
 =?utf-8?B?UFl4WGQ5Vy9ZU1V1RDFseGoyb2p5bnpsclcyT0N6NVNnMWtoRHMwcTlGUThG?=
 =?utf-8?B?aGNyVmNac1BIV0c4Z2pGU1Q0WDJSUmZNSjhndWNLYXJqejZqNzI3ci90c0dN?=
 =?utf-8?B?d1l5WTN1TG9TMTVIU2JmTDgrUVhGdjdJNzhJNkI3VGNOMC9LL3NCRDdxb2s3?=
 =?utf-8?B?TDM4KzhrN3RaOWtKeWJkMkd0ckEwWnhuaVBBTnJqWHB4MnRQQmZPUEcvOGpJ?=
 =?utf-8?B?b3ZZWUFOM2tPcjV5SmdzTzhDWmxwT04xK1NWRDBiNzNydkFlQWtSalpZUHpT?=
 =?utf-8?B?dTVLMUtZVGp1bG1GWEhwZkhzNm9UWkoycVJ2Z0Fpekp0UmNRdmY2NjZkRVdi?=
 =?utf-8?B?T0JRcFhSRVVkZk4zWFZxanM2UHZ6MFNpTElnZTczcFRpMmJOU2Z5YjJFSU5E?=
 =?utf-8?B?Zk9hdDAwS1EybC9IV3M1S1hFM0EvQlhsQVd3WGVnei92N0tuaVBqZ2hlWTFY?=
 =?utf-8?B?QVMveHpKaHdmYjJZdmJEbTdRQklSZlpiY0RReEloU3gvN1hyWWJTTmRKdzdU?=
 =?utf-8?B?RXpLelcxZFk2bXE3UFdIUThRRm5rcm8rcHo3MjhZdEdvTjhSajliWFVKaVZQ?=
 =?utf-8?B?MUxJMFNXOExsaHc1a2RZM1BDZDhZMUYrVW5QRmxpRFNSbVg4WTFRcTg5RDNm?=
 =?utf-8?B?bjVpRDk0dWJ1bkY1TXI5Z0t6WW9EdE5JN1BrVXErTFRFMFdMenNUMkNZS0sv?=
 =?utf-8?Q?GK1DBy9g+9AypkyY=3D?=
X-Exchange-RoutingPolicyChecked: YHibpFHlaIDdK9YlyvP5qcZDGm1nWYgr0X26XyVY8sFNeVsBmwRyYHXj8ynJ1k9KYd7yuti9+HB+qm4Ns7XCGln4I896XuV5rn95LNh5vK//wfihTeQAsmK+4wmT4FXYu9nPqs7eH5dKQY4hqWMkF4/EDMmekrt4WFDOUj8vbjLxvjcExWv7ICJCq38cqASiC9BD0Tf0vTC6d+XKwwIkYf/ib8rkAG1JWV7dlYuZDY30qC6YW1oOo1Mi67lhAQh0ZiFXheisotNKRny3glFkHnHDOP9ilsu31+84X3bsZvzniLq62SM+NzkQNuTQbZ/RMRXiFysmROV7wO9/1aTl1Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddf58f2-6dcb-4a70-1287-08de8418ff7c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 11:33:24.0454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oENy/6PLqOBLWsMlVo/RQ88w8kGbpVm5+QokVRXou0czPWynDm/+vsoXALnWJiOyNciXS9i5QBwL3cbkzpn9ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9160
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_113335_566994_7A03C4EC 
X-CRM114-Status: GOOD (  15.39  )
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

T24gMTYvMDMvMjAyNiAxNjowMywgSWtlciBQZWRyb3NhIHdyb3RlOgo+IEltcGxlbWVudCBzb2Z0
d2FyZSB0dW5pbmcgYWxnb3JpdGhtIHRvIGVuYWJsZSBVSFMtSSBTRFIgbW9kZXMgZm9yIFNECj4g
Y2FyZCBvcGVyYXRpb24gYW5kIEhTMjAwIG1vZGUgZm9yIGVNTUMuIFRoaXMgYWRkcyBib3RoIFRY
IGFuZCBSWCBkZWxheQo+IGxpbmUgdHVuaW5nIGJhc2VkIG9uIHRoZSBTcGFjZW1pVCBLMSBjb250
cm9sbGVyIGNhcGFiaWxpdGllcy4KPiAKPiBBbGdvcml0aG0gZmVhdHVyZXM6Cj4gLSBBZGQgdHVu
aW5nIHJlZ2lzdGVyIGRlZmluaXRpb25zIChSWF9DRkcsIERMSU5FX0NUUkwsIERMSU5FX0NGRykK
PiAtIENvbmRpdGlvbmFsIHR1bmluZzogb25seSBmb3IgaGlnaC1zcGVlZCBtb2RlcyAo4omlMTAw
TUh6KQo+IC0gVFggdHVuaW5nOiBjb25maWd1cmUgdHJhbnNtaXQgZGVsYXkgbGluZSB3aXRoIG9w
dGltYWwgdmFsdWVzCj4gICAoZGxpbmVfcmVnPTAsIGRlbGF5Y29kZT0xMjcpIHRvIGVuc3VyZSBv
cHRpbWFsIHNpZ25hbCBvdXRwdXQgdGltaW5nCj4gLSBSWCB0dW5pbmc6IHNpbmdsZS1wYXNzIHdp
bmRvdyBkZXRlY3Rpb24gYWxnb3JpdGhtIHRlc3RpbmcgZnVsbAo+ICAgZGVsYXkgcmFuZ2UgKDAt
MjU1KSB0byBmaW5kIG9wdGltYWwgcmVjZWl2ZSB0aW1pbmcgd2luZG93Cj4gLSBSZXRyeSBtZWNo
YW5pc206IG11bHRpcGxlIGZhbGxiYWNrIGRlbGF5cyB3aXRoaW4gb3B0aW1hbCB3aW5kb3cKPiAg
IGZvciBpbXByb3ZlZCByZWxpYWJpbGl0eQo+IAo+IFRlc3RlZC1ieTogQW5hbmQgTW9vbiA8bGlu
dXguYW1vb25AZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8aWtlcnBl
ZHJvc2FtQGdtYWlsLmNvbT4KCkFja2VkLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJpYW4uaHVudGVy
QGludGVsLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYyB8IDE3
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMTcyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9z
dC9zZGhjaS1vZi1rMS5jIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jCj4gaW5kZXgg
MDFhZmRhZGNmNzA3OTY3MDRiMjcyZWU1YTMxNTQzYWZkNWUwMTE4OC4uODNkN2Y5ZmFkNWMxZmJh
MmYwNzYyNGVlNjU3Y2Q5NzlhMWM3ZTI1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21tYy9ob3N0
L3NkaGNpLW9mLWsxLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWsxLmMKPiBA
QCAtNjksNiArNjksMjggQEAKPiAgI2RlZmluZSAgU0RIQ19QSFlfRFJJVkVfU0VMCQlHRU5NQVNL
KDIsIDApCj4gICNkZWZpbmUgIFNESENfUlhfQklBU19DVFJMCQlCSVQoNSkKPiAgCj4gKyNkZWZp
bmUgU1BBQ0VNSVRfU0RIQ19SWF9DRkdfUkVHICAgICAgICAweDExOAo+ICsjZGVmaW5lICBTREhD
X1JYX1NEQ0xLX1NFTDBfTUFTSyAgICAgICAgR0VOTUFTSygxLCAwKQo+ICsjZGVmaW5lICBTREhD
X1JYX1NEQ0xLX1NFTDFfTUFTSyAgICAgICAgR0VOTUFTSygzLCAyKQo+ICsjZGVmaW5lICBTREhD
X1JYX1NEQ0xLX1NFTDEgICAgICAgICAgICAgRklFTERfUFJFUChTREhDX1JYX1NEQ0xLX1NFTDFf
TUFTSywgMSkKPiArCj4gKyNkZWZpbmUgU1BBQ0VNSVRfU0RIQ19ETElORV9DVFJMX1JFRyAgICAw
eDEzMAo+ICsjZGVmaW5lICBTREhDX0RMSU5FX1BVICAgICAgICAgICAgICAgICAgQklUKDApCj4g
KyNkZWZpbmUgIFNESENfUlhfRExJTkVfQ09ERV9NQVNLICAgICAgICBHRU5NQVNLKDIzLCAxNikK
PiArI2RlZmluZSAgU0RIQ19UWF9ETElORV9DT0RFX01BU0sgICAgICAgIEdFTk1BU0soMzEsIDI0
KQo+ICsKPiArI2RlZmluZSBTUEFDRU1JVF9TREhDX0RMSU5FX0NGR19SRUcgICAgIDB4MTM0Cj4g
KyNkZWZpbmUgIFNESENfUlhfRExJTkVfUkVHX01BU0sgICAgICAgICBHRU5NQVNLKDcsIDApCj4g
KyNkZWZpbmUgIFNESENfUlhfRExJTkVfR0FJTiAgICAgICAgICAgICBCSVQoOCkKPiArI2RlZmlu
ZSAgU0RIQ19UWF9ETElORV9SRUdfTUFTSyAgICAgICAgIEdFTk1BU0soMjMsIDE2KQo+ICsKPiAr
I2RlZmluZSBTUEFDRU1JVF9SWF9ETElORV9SRUcJCTkKPiArI2RlZmluZSBTUEFDRU1JVF9SWF9U
VU5FX0RFTEFZX01JTgkweDAKPiArI2RlZmluZSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWAkw
eEZGCj4gKwo+ICsjZGVmaW5lIFNQQUNFTUlUX1RYX1RVTklOR19ETElORV9SRUcJMHgwMAo+ICsj
ZGVmaW5lIFNQQUNFTUlUX1RYX1RVTklOR19ERUxBWUNPREUJMTI3Cj4gKwo+ICBzdHJ1Y3Qgc3Bh
Y2VtaXRfc2RoY2lfaG9zdCB7Cj4gIAlzdHJ1Y3QgY2xrICpjbGtfY29yZTsKPiAgCXN0cnVjdCBj
bGsgKmNsa19pbzsKPiBAQCAtOTYsNiArMTE4LDUwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBzcGFj
ZW1pdF9zZGhjaV9jbHJzZXRiaXRzKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgY2xyLCB1
Cj4gIAlzZGhjaV93cml0ZWwoaG9zdCwgdmFsLCByZWcpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9p
ZCBzcGFjZW1pdF9zZGhjaV9zZXRfcnhfZGVsYXkoc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QsIHU4
IGRlbGF5KQo+ICt7Cj4gKwlzcGFjZW1pdF9zZGhjaV9jbHJzZXRiaXRzKGhvc3QsIFNESENfUlhf
RExJTkVfQ09ERV9NQVNLLAo+ICsJCQkJICBGSUVMRF9QUkVQKFNESENfUlhfRExJTkVfQ09ERV9N
QVNLLCBkZWxheSksCj4gKwkJCQkgIFNQQUNFTUlUX1NESENfRExJTkVfQ1RSTF9SRUcpOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9zZXRfdHhfZGVsYXkoc3RydWN0IHNk
aGNpX2hvc3QgKmhvc3QsIHU4IGRlbGF5KQo+ICt7Cj4gKwlzcGFjZW1pdF9zZGhjaV9jbHJzZXRi
aXRzKGhvc3QsIFNESENfVFhfRExJTkVfQ09ERV9NQVNLLAo+ICsJCQkJICBGSUVMRF9QUkVQKFNE
SENfVFhfRExJTkVfQ09ERV9NQVNLLCBkZWxheSksCj4gKwkJCQkgIFNQQUNFTUlUX1NESENfRExJ
TkVfQ1RSTF9SRUcpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9zZXRf
dHhfZGxpbmVfcmVnKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1OCBkbGluZV9yZWcpCj4gK3sK
PiArCXNwYWNlbWl0X3NkaGNpX2NscnNldGJpdHMoaG9zdCwgU0RIQ19UWF9ETElORV9SRUdfTUFT
SywKPiArCQkJCSAgRklFTERfUFJFUChTREhDX1RYX0RMSU5FX1JFR19NQVNLLCBkbGluZV9yZWcp
LAo+ICsJCQkJICBTUEFDRU1JVF9TREhDX0RMSU5FX0NGR19SRUcpOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV90eF90dW5pbmdfcHJlcGFyZShzdHJ1Y3Qgc2RoY2lfaG9z
dCAqaG9zdCkKPiArewo+ICsJc3BhY2VtaXRfc2RoY2lfc2V0Yml0cyhob3N0LCBTREhDX1RYX01V
WF9TRUwsIFNQQUNFTUlUX1NESENfVFhfQ0ZHX1JFRyk7Cj4gKwlzcGFjZW1pdF9zZGhjaV9zZXRi
aXRzKGhvc3QsIFNESENfRExJTkVfUFUsIFNQQUNFTUlUX1NESENfRExJTkVfQ1RSTF9SRUcpOwo+
ICsJdWRlbGF5KDUpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9wcmVw
YXJlX3R1bmluZyhzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkKPiArewo+ICsJc3BhY2VtaXRfc2Ro
Y2lfY2xyc2V0Yml0cyhob3N0LCBTREhDX1JYX0RMSU5FX1JFR19NQVNLLAo+ICsJCQkJICBGSUVM
RF9QUkVQKFNESENfUlhfRExJTkVfUkVHX01BU0ssIFNQQUNFTUlUX1JYX0RMSU5FX1JFRyksCj4g
KwkJCQkgIFNQQUNFTUlUX1NESENfRExJTkVfQ0ZHX1JFRyk7Cj4gKwo+ICsJc3BhY2VtaXRfc2Ro
Y2lfc2V0Yml0cyhob3N0LCBTREhDX0RMSU5FX1BVLCBTUEFDRU1JVF9TREhDX0RMSU5FX0NUUkxf
UkVHKTsKPiArCXVkZWxheSg1KTsKPiArCj4gKwlzcGFjZW1pdF9zZGhjaV9jbHJzZXRiaXRzKGhv
c3QsIFNESENfUlhfU0RDTEtfU0VMMV9NQVNLLCBTREhDX1JYX1NEQ0xLX1NFTDEsCj4gKwkJCQkg
IFNQQUNFTUlUX1NESENfUlhfQ0ZHX1JFRyk7Cj4gKwo+ICsJaWYgKGhvc3QtPm1tYy0+aW9zLnRp
bWluZyA9PSBNTUNfVElNSU5HX01NQ19IUzIwMCkKPiArCQlzcGFjZW1pdF9zZGhjaV9zZXRiaXRz
KGhvc3QsIFNESENfSFMyMDBfVVNFX1JGSUZPLCBTUEFDRU1JVF9TREhDX1BIWV9GVU5DX1JFRyk7
Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIHNwYWNlbWl0X3NkaGNpX3Jlc2V0KHN0cnVjdCBzZGhj
aV9ob3N0ICpob3N0LCB1OCBtYXNrKQo+ICB7Cj4gIAlzZGhjaV9yZXNldChob3N0LCBtYXNrKTsK
PiBAQCAtMTkxLDYgKzI1NywxMTEgQEAgc3RhdGljIHVuc2lnbmVkIGludCBzcGFjZW1pdF9zZGhj
aV9jbGtfZ2V0X21heF9jbG9jayhzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkKPiAgCXJldHVybiBj
bGtfZ2V0X3JhdGUocGx0Zm1faG9zdC0+Y2xrKTsKPiAgfQo+ICAKPiArc3RhdGljIGludCBzcGFj
ZW1pdF9zZGhjaV9leGVjdXRlX3R1bmluZyhzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCwgdTMyIG9w
Y29kZSkKPiArewo+ICsJaW50IGN1cnJlbnRfbGVuID0gMCwgY3VycmVudF9zdGFydCA9IDA7Cj4g
KwlpbnQgbWF4X3Bhc3NfbGVuID0gMCwgbWF4X3Bhc3Nfc3RhcnQgPSAwOwo+ICsJc3RydWN0IG1t
Y19ob3N0ICptbWMgPSBob3N0LT5tbWM7Cj4gKwlzdHJ1Y3QgbW1jX2lvcyBpb3MgPSBtbWMtPmlv
czsKPiArCXU4IGZpbmFsX2RlbGF5Owo+ICsJaW50IHJldCA9IDA7Cj4gKwlpbnQgaTsKPiArCj4g
KwkvKgo+ICsJICogVHVuaW5nIGlzIHJlcXVpcmVkIGZvciBTRFI1MC9TRFIxMDQsIEhTMjAwL0hT
NDAwIGNhcmRzIGFuZAo+ICsJICogaWYgY2xvY2sgZnJlcXVlbmN5IGlzIGdyZWF0ZXIgdGhhbiAx
MDBNSHogaW4gdGhlc2UgbW9kZXMuCj4gKwkgKi8KPiArCWlmIChob3N0LT5jbG9jayA8IDEwMCAq
IDEwMDAgKiAxMDAwIHx8Cj4gKwkgICAgIShpb3MudGltaW5nID09IE1NQ19USU1JTkdfTU1DX0hT
MjAwIHx8Cj4gKwkgICAgICBpb3MudGltaW5nID09IE1NQ19USU1JTkdfVUhTX1NEUjUwIHx8Cj4g
KwkgICAgICBpb3MudGltaW5nID09IE1NQ19USU1JTkdfVUhTX1NEUjEwNCkpCj4gKwkJcmV0dXJu
IDA7Cj4gKwo+ICsJaWYgKG1tYy0+Y2FwczIgJiBNTUNfQ0FQMl9OT19NTUMpIHsKPiArCQlzcGFj
ZW1pdF9zZGhjaV9zZXRfdHhfZGxpbmVfcmVnKGhvc3QsIFNQQUNFTUlUX1RYX1RVTklOR19ETElO
RV9SRUcpOwo+ICsJCXNwYWNlbWl0X3NkaGNpX3NldF90eF9kZWxheShob3N0LCBTUEFDRU1JVF9U
WF9UVU5JTkdfREVMQVlDT0RFKTsKPiArCQlzcGFjZW1pdF9zZGhjaV90eF90dW5pbmdfcHJlcGFy
ZShob3N0KTsKPiArCj4gKwkJZGV2X2RiZyhtbWNfZGV2KGhvc3QtPm1tYyksICJUWCB0dW5pbmc6
IGRsaW5lX3JlZz0lZCwgZGVsYXljb2RlPSVkXG4iLAo+ICsJCQlTUEFDRU1JVF9UWF9UVU5JTkdf
RExJTkVfUkVHLCBTUEFDRU1JVF9UWF9UVU5JTkdfREVMQVlDT0RFKTsKPiArCX0KPiArCj4gKwlz
cGFjZW1pdF9zZGhjaV9wcmVwYXJlX3R1bmluZyhob3N0KTsKPiArCj4gKwlmb3IgKGkgPSBTUEFD
RU1JVF9SWF9UVU5FX0RFTEFZX01JTjsgaSA8PSBTUEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWDsg
aSsrKSB7Cj4gKwkJc3BhY2VtaXRfc2RoY2lfc2V0X3J4X2RlbGF5KGhvc3QsIGkpOwo+ICsJCXJl
dCA9IG1tY19zZW5kX3R1bmluZyhob3N0LT5tbWMsIG9wY29kZSwgTlVMTCk7Cj4gKwo+ICsJCWRl
dl9kYmcobW1jX2Rldihob3N0LT5tbWMpLCAiUlggZGVsYXkgJWQ6ICVzXG4iLAo+ICsJCQlpLCBy
ZXQgPT0gMCA/ICJwYXNzIiA6ICJmYWlsIik7Cj4gKwo+ICsJCWlmIChyZXQgPT0gMCkgewo+ICsJ
CQkvKiBUZXN0IHBhc3NlZCAtIGV4dGVuZCBjdXJyZW50IHdpbmRvdyAqLwo+ICsJCQlpZiAoY3Vy
cmVudF9sZW4gPT0gMCkKPiArCQkJCWN1cnJlbnRfc3RhcnQgPSBpOwo+ICsJCQljdXJyZW50X2xl
bisrOwo+ICsJCX0gZWxzZSB7Cj4gKwkJCS8qIFRlc3QgZmFpbGVkIC0gY2hlY2sgaWYgY3VycmVu
dCB3aW5kb3cgaXMgYmVzdCBzbyBmYXIgKi8KPiArCQkJaWYgKGN1cnJlbnRfbGVuID4gbWF4X3Bh
c3NfbGVuKSB7Cj4gKwkJCQltYXhfcGFzc19sZW4gPSBjdXJyZW50X2xlbjsKPiArCQkJCW1heF9w
YXNzX3N0YXJ0ID0gY3VycmVudF9zdGFydDsKPiArCQkJfQo+ICsJCQljdXJyZW50X2xlbiA9IDA7
Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWlmIChjdXJyZW50X2xlbiA+IG1heF9wYXNzX2xlbikgewo+
ICsJCW1heF9wYXNzX2xlbiA9IGN1cnJlbnRfbGVuOwo+ICsJCW1heF9wYXNzX3N0YXJ0ID0gY3Vy
cmVudF9zdGFydDsKPiArCX0KPiArCj4gKwlpZiAobWF4X3Bhc3NfbGVuIDwgMykgewo+ICsJCWRl
dl9lcnIobW1jX2Rldihob3N0LT5tbWMpLCAiVHVuaW5nIGZhaWxlZDogbm8gc3RhYmxlIHdpbmRv
dyBmb3VuZFxuIik7Cj4gKwkJcmV0dXJuIC1FSU87Cj4gKwl9Cj4gKwo+ICsJZmluYWxfZGVsYXkg
PSBtYXhfcGFzc19zdGFydCArIG1heF9wYXNzX2xlbiAvIDI7Cj4gKwlzcGFjZW1pdF9zZGhjaV9z
ZXRfcnhfZGVsYXkoaG9zdCwgZmluYWxfZGVsYXkpOwo+ICsJcmV0ID0gbW1jX3NlbmRfdHVuaW5n
KGhvc3QtPm1tYywgb3Bjb2RlLCBOVUxMKTsKPiArCWlmIChyZXQpIHsKPiArCQl1OCByZXRyeV9k
ZWxheXNbXSA9IHsKPiArCQkJbWF4X3Bhc3Nfc3RhcnQgKyBtYXhfcGFzc19sZW4gLyA0LAo+ICsJ
CQltYXhfcGFzc19zdGFydCArICgzICogbWF4X3Bhc3NfbGVuKSAvIDQsCj4gKwkJCW1heF9wYXNz
X3N0YXJ0LAo+ICsJCQltYXhfcGFzc19zdGFydCArIG1heF9wYXNzX2xlbiAtIDEKPiArCQl9Owo+
ICsJCWludCByZXRyeV9jb3VudCA9IEFSUkFZX1NJWkUocmV0cnlfZGVsYXlzKTsKPiArCj4gKwkJ
ZGV2X3dhcm4obW1jX2RldihtbWMpLCAiUHJpbWFyeSBkZWxheSAlZCBmYWlsZWQsIHRyeWluZyBh
bHRlcm5hdGl2ZXNcbiIsCj4gKwkJCSBmaW5hbF9kZWxheSk7Cj4gKwo+ICsJCWZvciAoaSA9IDA7
IGkgPCByZXRyeV9jb3VudDsgaSsrKSB7Cj4gKwkJCWlmIChyZXRyeV9kZWxheXNbaV0gPj0gU1BB
Q0VNSVRfUlhfVFVORV9ERUxBWV9NSU4gJiYKPiArCQkJICAgIHJldHJ5X2RlbGF5c1tpXSA8PSBT
UEFDRU1JVF9SWF9UVU5FX0RFTEFZX01BWCkgewo+ICsJCQkJc3BhY2VtaXRfc2RoY2lfc2V0X3J4
X2RlbGF5KGhvc3QsIHJldHJ5X2RlbGF5c1tpXSk7Cj4gKwkJCQlyZXQgPSBtbWNfc2VuZF90dW5p
bmcoaG9zdC0+bW1jLCBvcGNvZGUsIE5VTEwpOwo+ICsJCQkJaWYgKCFyZXQpIHsKPiArCQkJCQlm
aW5hbF9kZWxheSA9IHJldHJ5X2RlbGF5c1tpXTsKPiArCQkJCQlkZXZfaW5mbyhtbWNfZGV2KG1t
YyksICJSZXRyeSBzdWNjZXNzZnVsIHdpdGggZGVsYXkgJWRcbiIsCj4gKwkJCQkJCSBmaW5hbF9k
ZWxheSk7Cj4gKwkJCQkJYnJlYWs7Cj4gKwkJCQl9Cj4gKwkJCX0KPiArCQl9Cj4gKwo+ICsJCWlm
IChyZXQpIHsKPiArCQkJZGV2X2VycihtbWNfZGV2KG1tYyksICJBbGwgcmV0cnkgYXR0ZW1wdHMg
ZmFpbGVkXG4iKTsKPiArCQkJcmV0dXJuIC1FSU87Cj4gKwkJfQo+ICsJfQo+ICsKPiArCWRldl9k
YmcobW1jX2Rldihob3N0LT5tbWMpLAo+ICsJCSJUdW5pbmcgc3VjY2Vzc2Z1bDogd2luZG93ICVk
LSVkLCB1c2luZyBkZWxheSAlZFxuIiwKPiArCQltYXhfcGFzc19zdGFydCwgbWF4X3Bhc3Nfc3Rh
cnQgKyBtYXhfcGFzc19sZW4gLSAxLCBmaW5hbF9kZWxheSk7Cj4gKwo+ICsJcmV0dXJuIDA7Cj4g
K30KPiArCj4gIHN0YXRpYyBpbnQgc3BhY2VtaXRfc2RoY2lfcHJlX3NlbGVjdF9oczQwMChzdHJ1
Y3QgbW1jX2hvc3QgKm1tYykKPiAgewo+ICAJc3RydWN0IHNkaGNpX2hvc3QgKmhvc3QgPSBtbWNf
cHJpdihtbWMpOwo+IEBAIC0zMTQsNiArNDg1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzZGhj
aV9vcHMgc3BhY2VtaXRfc2RoY2lfb3BzID0gewo+ICAJLnNldF9jbG9jawkJPSBzcGFjZW1pdF9z
ZGhjaV9zZXRfY2xvY2ssCj4gIAkuc2V0X3Voc19zaWduYWxpbmcJPSBzcGFjZW1pdF9zZGhjaV9z
ZXRfdWhzX3NpZ25hbGluZywKPiAgCS52b2x0YWdlX3N3aXRjaCAgICAgICAgID0gc3BhY2VtaXRf
c2RoY2lfdm9sdGFnZV9zd2l0Y2gsCj4gKwkucGxhdGZvcm1fZXhlY3V0ZV90dW5pbmcgPSBzcGFj
ZW1pdF9zZGhjaV9leGVjdXRlX3R1bmluZywKPiAgfTsKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgc2RoY2lfcGx0Zm1fZGF0YSBzcGFjZW1pdF9zZGhjaV9rMV9wZGF0YSA9IHsKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
