Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7EBD767D6
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ge817n9LQQ3jUDbC3JacRDAlPKxNvJaVSeXdtYY88yM=; b=rJIPZuyYX7hjx4
	cPVHM40Zy1ahOVzgto8YrIZp1AdnnnItN1EG/etQ42QFHwxpdYXMutoKDF3slUiJil1L/eYfVmTKB
	iVZHHeyClHyEP6Q9HcBQ0yqO6eX8INi9dvtLEQHFgLuAOhzBrKhhCVPAZZz2mBk+bQEO2mSSIO7C/
	NvzjWQGE/YCq1Bo57/DC/NN2m1LgvYWH3DpaZCykyr93cvuQjSU0eDweCYQ3Jz8urbT7Nf6v7Izq8
	CqK81LDRQI+XwpDU4f5Bc+X88Ea59cPsql8SSgu3JbY4uQ7KVhZE5K8FuH/m4YfTSkG54mO31Y/cB
	sBBJgIpJb3MroN3L/gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W3V-00000003n5m-3KNP;
	Thu, 31 Oct 2024 14:21:45 +0000
Received: from mail-dm3nam02on20624.outbound.protection.outlook.com ([2a01:111:f403:2405::624] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W2K-00000003mqy-2ZCR;
	Thu, 31 Oct 2024 14:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiE8kaNBSM1Dv6u8GtK5OFwXvgq9wehN4onbpjjq10NOSUzmZd4vLkA6PLGMBx/iU9OtZOONY+Bd5fytmw2biVeCR6Css85nygsRI5+Zu4DP0hewGCkn3hoGkpSttnrQK1I8kVdM0WBayr4n3H0toR7h0yJ2YdYA9MdLqLWK9ApDn0D8rvQsheVWiHmXh5siQNBXiIw6paqV6SBR8CNYhMZKVK+qInd3uBBbNd1EOjMuFVexi3shs5c/kJMtMH2t28h6ByjObNTDZogBqU6A3cbKm2xRDuQreDwnqUY7kCgc5TOOWc0+yxmiW1d1hbs0TXIcilob3JnignONQtL5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/MrVG8WveGddeEkdbdPceTerqMFZYZTgL7ZKhHJcTs=;
 b=BBwiB20JkZ7pax3ACthZ19u/O5cyh7xQdAIec4ZFLPO0KiTwilR3eTo5ShgDwV/u9NOtLDoro8YZFdgNxVXn7BbIqUAXsWStpW6T/aPJY0fzlFfYKzWtZq2euqPzk6GMRMQ/VRRzSQijJmss9ZtoSYkuLt+5tuUdz07+Hfy9FPpN0dJpdTU5zhv7VGCrdbkuvr6qYsqy4SKQdNJAmDDQaqlIttp9ZU5pjuB877qx3UwaOp926CEyucwyu0dxHQVmh/ZX43OQs/GShqTAq6iMooza4jnnsUD0nDMoYvMCr/tnDS+fkGW/p+xUm0zSFRl6CJsVZu4/6x64TLQ6EH5j1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/MrVG8WveGddeEkdbdPceTerqMFZYZTgL7ZKhHJcTs=;
 b=R1oCBAq9+ndhLcs0kONcYOtnQxshVm5SVw94oB4r+wTp44XV72m713n/BCmK5CwqL9dcxa6wn1io5sPSTWZNr9pagFwyHBQwkLR6t1Fno8Vyo6GVhWYxk3bTqg3TCePDbUXLv8wPm50X0uu2hJRbTi14OGmfIitpsMrlC5hBuhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB5672.namprd12.prod.outlook.com (2603:10b6:806:23c::5)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 14:20:28 +0000
Received: from SA1PR12MB5672.namprd12.prod.outlook.com
 ([fe80::60f:5e8d:f0da:4eca]) by SA1PR12MB5672.namprd12.prod.outlook.com
 ([fe80::60f:5e8d:f0da:4eca%3]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 14:20:28 +0000
Message-ID: <80d700e8-5800-4128-b9fd-6bd37525facd@amd.com>
Date: Thu, 31 Oct 2024 09:19:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 3/6] kvm: gmem: implement direct map manipulation
 routines
To: Patrick Roy <roypat@amazon.co.uk>, tabba@google.com,
 quic_eberman@quicinc.com, david@redhat.com, seanjc@google.com,
 pbonzini@redhat.com, jthoughton@google.com, ackerleytng@google.com,
 vannapurve@google.com, rppt@kernel.org
Cc: graf@amazon.com, jgowans@amazon.com, derekmn@amazon.com,
 kalyazin@amazon.com, xmarcalx@amazon.com, linux-mm@kvack.org,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, luto@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20241030134912.515725-1-roypat@amazon.co.uk>
 <20241030134912.515725-4-roypat@amazon.co.uk>
From: Mike Day <michael.day@amd.com>
Content-Language: en-US
In-Reply-To: <20241030134912.515725-4-roypat@amazon.co.uk>
X-ClientProxiedBy: SA1P222CA0063.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::12) To SA1PR12MB5672.namprd12.prod.outlook.com
 (2603:10b6:806:23c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB5672:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b27bb4-c192-41d9-b124-08dcf9b72af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qy9NOTdEUFFGbk1GZ2l5UlVYbndORFhycUJYeFprQ3FVZmpqYlF5YVFuRElE?=
 =?utf-8?B?d05FZi9tVkZSNTYvbkQ3YUxUMmZXUEl1TUxaWFE2V3hiZUdmS3ZrWTV4bVhm?=
 =?utf-8?B?K05ySCs4eWFESDBScVFoUnArcFVhcWtGRnBnRzcyME0ybWZJNHh6djNIS3FD?=
 =?utf-8?B?ZEVNVHhHd0hyNmRkQWdwZHFZM3ZWb0V5eGdOOUdab2k2dnVyNmpsSExQTjVh?=
 =?utf-8?B?Vk5pNWFFQ0J2THJSZGxYUXM3QXlKU1RCTy9VMEs3amxSOFBEN1QzWGNuK0Rn?=
 =?utf-8?B?TmprZ2JHaUpkaFNuR3VGWEdqYUxoRlVHVU9HWEhEVlE0VlkveVRrWHg5enhN?=
 =?utf-8?B?dmg1clVrV08xMzJYZ3FqSlNNRndQM2J4MWVyZW9XWEZwVzRwQWpPdjltV2FC?=
 =?utf-8?B?S2FqOXB3VFZ6QTc2dURQOW9VTW5mVVNCeE52VWQrN3R4aG1TQVBnM3RJK3V5?=
 =?utf-8?B?VjJobG1mTmJxTURkUDlISzQ5aWpYWno1M0ViVElCSjY2aUhBTUFqT0RFZ0sx?=
 =?utf-8?B?L0FERHJDaEdic1ZMRGwrVnV2OWhIVTBxZlN0MnZzcjhHaDVGOW5zd1gzRVlP?=
 =?utf-8?B?Q0JnKzlaNTZXTGFka3NPZXcrMHpBU1Y2dkpGV1IyTGFScVFMRGZwbXNpMDZp?=
 =?utf-8?B?RHZhUk5URTVidjRXdXFmTnpObFY4ai85eG1URUpCeVJ6WUNaYlNCOFh5M3g0?=
 =?utf-8?B?cm1VNHRnQ1Qyd2ptU0luOGNHYUJ3Y25xcFNrb3hTTWJMb3Z1S2xqcWRYaDJL?=
 =?utf-8?B?ZXpTSno2ck5lWC9INFNDQ1Q5ZFdnODlEM3FEaksxVGdtSFR1allnNUZkdzQ2?=
 =?utf-8?B?Z3lLWEIxRk9LYk1VRlQ4MzRxV2Rtb1RFOCt3OHJ0di9uTVhlMWsvT0t3WVRE?=
 =?utf-8?B?QlV1MVovN0xjNEhPcnlGQjU1UjE5ZHBHZXRDa2FaSTZuUGt1NkVBbjl3QlZZ?=
 =?utf-8?B?YTNtQzdNWTlBVWVveDFiMEFSVklhUUhBZ3lqM0hTczE1SXBaWG1UczVhc3d0?=
 =?utf-8?B?dFM1R1hFaWhVQmkyRTRyeE9OTDd4MHdCUXZVaTFqcmprUHFFZWtpTkx6bm15?=
 =?utf-8?B?RHJzSGZDUndMdlAwYnRVdFBJZXpOTHZtTVhtbUd5Q1NUcTI3UHF2NEFra21w?=
 =?utf-8?B?TG1lT0JRZWtzVTFzRHMyMVhFRHV1Z1pJbVVuNkpwaXpVVnprMHJaaUFSUU95?=
 =?utf-8?B?R29pcU5hSWxrWnVlYnlYVWdPUEx4UVBCQnhrNXhYdHhXRE9mUWRYZ25NaHUv?=
 =?utf-8?B?UHhsWjdxQmtkYUYrelFncHdtbmhIM2JJTy8wOEoxMXpYWmFmaW1iNldwLzgr?=
 =?utf-8?B?bjJPMVdpLzRPUE1xckxhU2dCaHBYdGgyUTJXb25EeXlGaXRxa0pCTGN0U05i?=
 =?utf-8?B?SG9FNlNHV1B5bTY0Zll0bE5oWU5Vb2h1N2NtWGw5VE1ZZHgzMFdsUnAxQkE4?=
 =?utf-8?B?N212c0lROEZQa1B6ZUZJVFN3ZjA1cXZzODd3aXhMRFRpaUMzeGhvUmhGaUdz?=
 =?utf-8?B?bkVxL2h4d1p0eE5sVGpUN3VQdlQ3bVZ1NlZzRi9hNEREN1RYTnpnVEtyblZ4?=
 =?utf-8?B?UFhmMk5wUlhNMHFNek9IOFpOVnQ5dS8zVVkvcXFMVmwvMW1MUFkvY0hRQjJa?=
 =?utf-8?B?eXVVaS9PeG1FOVR3d3dteVY3dFJBaUpqL2NHUEQrVTBtTmNXU0xscUsxYVpX?=
 =?utf-8?B?eWFCZU44Tmp0VXQxRzJmVTRVN3VjMnlBY1hLanNrSUpNZ3hkajk0Tjg3bnBE?=
 =?utf-8?B?TFdzeFFJUDVTZ1BEeG5QSWlScVZPeFRkUmQvcGl4cXYyUlFYRVpDT3hVQkdk?=
 =?utf-8?Q?gBLuBK4AhPLbZiIHa5qV2dkaafeLqDoqeUT74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5672.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZiVFJkd0xjSlNjQkFMV2JnUE1zb0Z4RndOOFltTUNwZDJxUVdJNkxzMzBG?=
 =?utf-8?B?aW0wblpicWZMRmtMMEg3dTVUOWhLR1VEcmRVeDR4MVJ6MURRSlhxNUZGK0Fz?=
 =?utf-8?B?WGd2eGFGOEluVm44S3pxcHFwSlNlVWRmNE9aNk1UYjlrejBjSkV6aUliRzRN?=
 =?utf-8?B?WEE2azBmUU8zbHVTVUZFcklSVHo4Mi94YlA5VXdva1NZN0x6TmdTVGpQcGRa?=
 =?utf-8?B?TUlQOThLTllTUmZGazZ1YlJxb0RmQUtIbGlhMXBnbnlTWnY3RXJFTjh4bkt5?=
 =?utf-8?B?N1QyaG5wWGJjZ21vWXo1UTZTYnhkd1RNQkZKVk1MMis1TnkxTkx3VEczdkxP?=
 =?utf-8?B?Rmd1OCtmNVZKYW9salRGR3JaZnk5MUYyaFRLdi9hQUpwV240em5iWjJXZTR3?=
 =?utf-8?B?YTMyay9Zbk1KWG8raWNJbWRiYkRCUFlJOTgzUllWK1MxVERNcEVEYUNGSWg2?=
 =?utf-8?B?QWRaUDMvQkNhN3MvTTlYNzBOSUlxR21EazJ0elZsd0tIdk1hbHV3dmxoYzNj?=
 =?utf-8?B?Q01Vc2U4cHZmb1lrY3hPdFdlVEtOQXlxR2NsNUlvai9FaUJOS0FIYzJ2T0FI?=
 =?utf-8?B?Qm1Tdy9TdktSaVlMaU03dXhZczRWOUoyWHNKZ1VndDdkUm9qbmROT1pCNXNk?=
 =?utf-8?B?b3dyMUV2aEx5ODZHeUZqdXhTYXEvWjJLZ05UL1U2N3dSdE5ObXJ0bkdER1Zn?=
 =?utf-8?B?citkZlUwUnV6RERzeE4wSlZUTm9zZ0lESzJuaDFReHgzVkpsZHovZk5nSUZE?=
 =?utf-8?B?djZIdzNQQVVNUkNINGxYQlNuMVcxcWtlMk5RbUF0R1pYSDZkSUVKc2MreC9y?=
 =?utf-8?B?MkhTS3pUNUpyMnlxMS9naXMzbjBaak15NEFpNFdaSmRFNU81NWg0WDl1NVBa?=
 =?utf-8?B?N0Y0eUwzZ2NjOW5uRmVEK1NDaDdXUjcyZGxyaUVNbSs2VGRMTTd2NGFVT0pT?=
 =?utf-8?B?WEhyanFDWEhqMkxYcHYrMVJsSGdrZkZlU0IrRUxjaUt3TTlGZFBhNWpMT0py?=
 =?utf-8?B?R2QzaFBMM0hwV2xCLzA0UjZYSFRDeUJ0eDV1NUd1S2IweFo1SU1QeVl1SEFW?=
 =?utf-8?B?Tm5pR3RqY3N2ZklaSHNacWJ3M0dUU0dEdDVCYTVEdXVsaHI0RC9BQWJreDJ2?=
 =?utf-8?B?NU13dlBEWTE0WnZ6VmVWTzg2TWR3TWpYLzhpaHBvWFlLOVFPL1pWSkNSSzNo?=
 =?utf-8?B?UjNqNjE5YXBTSDdGRW13ZTNVUjFnaTI5cHlXeUZwMDc2dlg2eU5yYW1MRUVT?=
 =?utf-8?B?a2NQdHFUdVBmNmdBWFQvZ0UydlR1bjk2RUNCWTRVVnR5VzVGM0xCeXNwTDRF?=
 =?utf-8?B?eit3b0E5ZC9weG54YmlwZ3hRREVJQU91RnZ5UktWbEtQcEJ2SEtTeXdWODRL?=
 =?utf-8?B?UHUyQ3YvekhhV0JpdU9sN05YRzVpUHVKS0pIZVIvWWx4REVUTTlybU9Mb1c0?=
 =?utf-8?B?V0pNYUdJeGpXQmVDMjFaL1FkZmhnY1puOUtBRDlTSFFMOWhyOEtQcEpoNHJi?=
 =?utf-8?B?YXF6SWVuRk5pTks2eFl4Q3gxY0djUEhseTVvOEpHT2xnTkpHUlczcFhIQkdk?=
 =?utf-8?B?SjkxQmM0WU1PVjE1SUtSbm5Cd21hbWxHZmEvbFd6NVV4U3Q0blVIaVZkRFBp?=
 =?utf-8?B?aVpSQytNc2d2WG9FS3hDT3c1ZjRxSHJqTEVHNHlqVDNvRXdUMnF5VzcyYWdk?=
 =?utf-8?B?U3pjQ29ZamtqeEFFVXFsSy9DeER3RkwyNnRhTHBkckJJOVpNQkNPOHlGaWdG?=
 =?utf-8?B?Ly9xd2xSajZwN0pKUFNwbVZSRlozeWx3NHhKNXYrSG1vUmw1anlrMTcvcndU?=
 =?utf-8?B?M2VuNU5JcjUyUHUvMmF6VHl5Zk1YOS9MZXZXM0JtSEdzTEt4UkZZQ1JUREVj?=
 =?utf-8?B?NDFscW5aVGR3ZHlvUWJKRURyMy9BTVR1S0d6cGduTjh0OUJvblBLSS9ENlZJ?=
 =?utf-8?B?ZjM0ekpVdnFLTjNqdHNpcnVGeG05YzhWZkpyMTJ6RFNDODdiY29JWDY2aG5B?=
 =?utf-8?B?ZGY5ZUZsbGd6K3pVRnFQcHZuMnkrZ1VYaHI3THhMYm56cGtOenNYY2phVkNj?=
 =?utf-8?B?cHoxVW9BTnJma1A4KzlXdEJCdDBDcFhWL0hIZGdpT2h3MWtIa041MVF3Y1Z2?=
 =?utf-8?Q?cOr1ZwR2iURIuAUvX3hlmvx+A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b27bb4-c192-41d9-b124-08dcf9b72af2
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:20:27.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKi41KtFA053dYVS9MqKWNzeU2bkCTpmMJ8ZrIKWkyuKrH3LZnj8LdFox0xlBIs9q6w+bqpvAgwuFot/4mmCBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072032_906588_B8EE3B27 
X-CRM114-Status: GOOD (  28.46  )
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
Reply-To: michael.day@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/30/24 08:49, Patrick Roy wrote:
> Implement (yet unused) routines for manipulating guest_memfd direct map
> state. This is largely for illustration purposes.
> 
> kvm_gmem_set_direct_map allows manipulating arbitrary pgoff_t
> ranges, even if the covered memory has not yet been faulted in (in which
> case the requested direct map state is recorded in the xarray and will
> be applied by kvm_gmem_folio_configure_direct_map after the folio is
> faulted in and prepared/populated). This can be used to realize
> private/shared conversions on not-yet-faulted in memory, as discussed in
> the guest_memfd upstream call [1].
> 
> kvm_gmem_folio_set_direct_map allows manipulating the direct map entries
> for a gmem folio that the caller already holds a reference for (whereas
> kvm_gmem_set_direct_map needs to look up all folios intersecting the
> given pgoff range in the filemap first).
> 
> The xa lock serializes calls to kvm_gmem_folio_set_direct_map and
> kvm_gmem_set_direct_map, while the read side
> (kvm_gmem_folio_configure_direct_map) is protected by RCU. This is
> sufficient to ensure consistency between the xarray and the folio's
> actual direct map state, as kvm_gmem_folio_configure_direct_map is
> called only for freshly allocated folios, and before the folio lock is
> dropped for the first time, meaning kvm_gmem_folio_configure_direct_map
> always does it's set_direct_map calls before either of
> kvm_gmem_[folio_]set_direct_map get a chance. Even if a concurrent call
> to kvm_gmem_[folio_]set_direct_map happens, this ensures a sort of
> "eventual consistency" between xarray and actual direct map
> configuration by the time kvm_gmem_[folio_]set_direct_map exits.
> 
> [1]: https://lore.kernel.org/kvm/4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com/
> 
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---
>   virt/kvm/guest_memfd.c | 125 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 125 insertions(+)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 50ffc2ad73eda..54387828dcc6a 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -96,6 +96,131 @@ static int kvm_gmem_folio_configure_direct_map(struct folio *folio)
>   	return r;
>   }
>   
> +/*
> + * Updates the range [@start, @end] in @gmem_priv's direct map state xarray to be @state,
> + * e.g. erasing entries in this range if @state is the default state, and creating
> + * entries otherwise.
> + *
> + * Assumes the xa_lock is held.
> + */
> +static int __kvm_gmem_update_xarray(struct kvm_gmem_inode_private *gmem_priv, pgoff_t start,
> +				    pgoff_t end, bool state)
> +{
> +	struct xarray *xa = &gmem_priv->direct_map_state;
> +	int r = 0;
> +
> +	/*
> +	 * Cannot use xa_store_range, as multi-indexes cannot easily
> +	 * be partially updated.
> +	 */
> +	for (pgoff_t index = start; index < end; ++index) {
> +		if (state == gmem_priv->default_direct_map_state)
> +			__xa_erase(xa, index);
> +		else
> +			/* don't care _what_ we store in the xarray, only care about presence */
> +			__xa_store(xa, index, gmem_priv, GFP_KERNEL);
> +
> +		r = xa_err(xa);
> +		if (r)
> +			goto out;
> +	}
> +
> +out:
> +	return r;
> +}
> +
> +static int __kvm_gmem_folio_set_direct_map(struct folio *folio, pgoff_t start, pgoff_t end,
> +					   bool state)
> +{
> +	unsigned long npages = end - start + 1;
> +	struct page *first_page = folio_file_page(folio, start);
> +
> +	int r = set_direct_map_valid_noflush(first_page, npages, state);
> +
> +	flush_tlb_kernel_range((unsigned long)page_address(first_page),
> +			       (unsigned long)page_address(first_page) +
> +				       npages * PAGE_SIZE);
> +	return r;
> +}
> +
> +/*
> + * Updates the direct map status for the given range from @start to @end (inclusive), returning
> + * -EINVAL if this range is not completely contained within @folio. Also updates the
> + * xarray stored in the private data of the inode @folio is attached to.
> + *
> + * Takes and drops the folio lock.
> + */
> +static __always_unused int kvm_gmem_folio_set_direct_map(struct folio *folio, pgoff_t start,
> +								 pgoff_t end, bool state)
> +{
> +	struct inode *inode = folio_inode(folio);
> +	struct kvm_gmem_inode_private *gmem_priv = inode->i_private;
> +	int r = -EINVAL;
> +
> +	if (!folio_contains(folio, start) || !folio_contains(folio, end))
> +		goto out;
> +
> +	xa_lock(&gmem_priv->direct_map_state);
> +	r = __kvm_gmem_update_xarray(gmem_priv, start, end, state);
> +	if (r)
> +		goto unlock_xa;
> +
> +	folio_lock(folio);
> +	r = __kvm_gmem_folio_set_direct_map(folio, start, end, state);
> +	folio_unlock(folio);
> +
> +unlock_xa:
> +	xa_unlock(&gmem_priv->direct_map_state);
> +out:
> +	return r;
> +}
> +
> +/*
> + * Updates the direct map status for the given range from @start to @end (inclusive)
> + * of @inode. Folios in this range have their direct map entries reconfigured,
> + * and the xarray in the @inode's private data is updated.
> + */
> +static __always_unused int kvm_gmem_set_direct_map(struct inode *inode, pgoff_t start,
> +							   pgoff_t end, bool state)
> +{
> +	struct kvm_gmem_inode_private *gmem_priv = inode->i_private;
> +	struct folio_batch fbatch;
> +	pgoff_t index = start;
> +	unsigned int count, i;
> +	int r = 0;
> +
> +	xa_lock(&gmem_priv->direct_map_state);
> +
> +	r = __kvm_gmem_update_xarray(gmem_priv, start, end, state);
> +	if (r)
> +		goto out;
> +
	if (r) {
		xa_unlock(&gmem_priv->direct_map_state);
		goto out;
	}

thanks,

Mike

> +	folio_batch_init(&fbatch);
> +	while (!filemap_get_folios(inode->i_mapping, &index, end, &fbatch) && !r) {
> +		count = folio_batch_count(&fbatch);
> +		for (i = 0; i < count; i++) {
> +			struct folio *folio = fbatch.folios[i];
> +			pgoff_t folio_start = max(folio_index(folio), start);
> +			pgoff_t folio_end =
> +				min(folio_index(folio) + folio_nr_pages(folio),
> +				    end);
> +
> +			folio_lock(folio);
> +			r = __kvm_gmem_folio_set_direct_map(folio, folio_start,
> +							    folio_end, state);
> +			folio_unlock(folio);
> +
> +			if (r)
> +				break;
> +		}
> +		folio_batch_release(&fbatch);
> +	}
> +
> +	xa_unlock(&gmem_priv->direct_map_state);
> +out:
> +	return r;
> +}
> +
>   /**
>    * folio_file_pfn - like folio_file_page, but return a pfn.
>    * @folio: The folio which contains this index.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
