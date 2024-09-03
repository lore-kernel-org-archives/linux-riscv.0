Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73B9CA0ED3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5l7oYWkbOcyzTYubdusJKb+tvyGS96z5bHihppgAzQ=; b=GYkc4NBoVxDX+DnBQIOru7ugzB
	O5CvI3yZigqGCekGkYnMjSBN2v6Q27hp7rfX8blsr0ipbsCOsQPzoQtALp+jkXmFHh81HDfY9OUI6
	jEHlYx+PtK4Sj3Ors1MlWv+3cxop10aEsFp+HI1R1Y7DgkHTAz/qRrcayJFJeCoVCgt5/Z1uTK+FM
	BPoptpzuSD8DFxJqGzFUlO13z8WGeySdbxuW8wyVdPKV7N3wyeVIzUhBoqLm7FR42NtV9J4/GFvVZ
	z/6kU/tOC6Nc6cf5RXbSxqyoqvnHp49ACTuEV9n5YV14hPI7O0NUl5vEVA/v1PhN1oSdeSQ4xXIoI
	RelOJxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slHkA-0000000FtH5-227A;
	Tue, 03 Sep 2024 00:50:02 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slHjE-0000000Ft6U-1oFT;
	Tue, 03 Sep 2024 00:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725324545; x=1756860545;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0Q5qWjmGPAPsLeVYHBxJIPz8Cc6LAyOtyIdUeQOxgvg=;
  b=Uz6h0ubZht3arQDZjoifooc3OokDqLfAqmS6Py2Yvvz53iA2QfaaJg7R
   X8BiHwkZirps//Qx9Qin2YXmkfwOzJC6UX66s4Y59x0s7/no9seGfLFtp
   tCBYtoL3boPpj2MjGWFXxL9eOb/qvL6PffDBa/78V4hvZFDQvAtjGXzTl
   KnzDXcWNofYrzF2WnNTCdEi1jm0RoivxDNvHOo8O/XuTMwOLKC5L4Na7C
   v1eI63AIQUjP1XAfNPlLsW+vHisut5mhkJnRHgSyqJd92G7hfqP9OfQ57
   wTZHOxML3z2vSR5eYMDw+qCGIgahqry6Bz2CcztkvZ3pBNL8XNeRmJKxj
   g==;
X-CSE-ConnectionGUID: pYvmoFUsRFSW6vUYeLnnaQ==
X-CSE-MsgGUID: +SDhQ1sNSTOdL8YbDqXe+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35059155"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="35059155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 17:49:01 -0700
X-CSE-ConnectionGUID: EquXtHvFTPKaL2SHtL0QSA==
X-CSE-MsgGUID: T5cnbhfeQnqYUcQmRVSwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="64417164"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2024 17:49:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 17:49:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 17:49:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 17:48:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qk/2ikXiNKZMKmH4qO/mn/Y0/BudRxrUmYyzrD7FfsxJmXB8KC+p67KU95AcE9a/3zK13VS5YVR/i/ug0yMxteiz2l3nwAMNQ1Guy1bLmORyovlsdISW6wGvbgLkAbbaj0OEZLYEDToAIXMlPNR3XQuy8BaTwSKxrXwJu3S/GuiZqnY5rWKU1VnQnXOXnQEU+AkRzm2O8mi1sxUFEtlmacXLL1jvYXsWDmcqKhaiBU5cUtN1FIloHTnPMd1pijXduYI/MKtLPfRgu9/LSJNnpr9yMPJ8f78XwZhhIH9b/QFRyvLIHr3h7yNZA6SOn5qqisZ6Ny/VkVLqsrExOYsEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LdOGFlEZvQENeLFbliApAtCm56xnCXpxJDNmJqUU2Vo=;
 b=HsrN/QVYnSn8X8NW0Qyo2mI4b3LT/DrbAbeAdNA2E+yZPYCxrRy+NW1G5O9Qqp/PosczXh6gmnYrNfZXGHR2/nQKsqjCJuuI0r850EXcnEruQQulMKycYe7PaSYM7ZR50s/45FP3Kv583Qf8viURSW3+RT+rKtTLvvTqWkxJ/0vjRZ1ZmbWboG12DxKbSbVAmCywZVM+ani3mPaAmA1djgAn37BXKm9tf7EQhGdIX8YjzpmmgKWf9LTeHubllC1QccfRnvgNfF80s7t8MB2X6oiTehwpwQnJ5pJHEi3wZlOgQWOVpfN4kRPg7j0hrOq+NJzfQOH4jO96gWKfJujgNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SJ1PR11MB6154.namprd11.prod.outlook.com (2603:10b6:a03:45f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 00:48:57 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%7]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 00:48:57 +0000
Message-ID: <7aa6ab47-2492-43f3-bf4f-ea50e2464894@intel.com>
Date: Tue, 3 Sep 2024 12:48:47 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] KVM: Use dedicated mutex to protect
 kvm_usage_count to avoid deadlock
To: Sean Christopherson <seanjc@google.com>
CC: "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "chenhuacai@kernel.org"
	<chenhuacai@kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "maz@kernel.org" <maz@kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "Gao, Chao"
	<chao.gao@intel.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Chen, Farrah" <Farrah.Chen@intel.com>
References: <20240830043600.127750-1-seanjc@google.com>
 <20240830043600.127750-2-seanjc@google.com>
 <1f037b5604deb5f83f05e709b2edf3063372518f.camel@intel.com>
 <ZtHPusyTNkQ_a1Y-@google.com>
Content-Language: en-US
From: "Huang, Kai" <kai.huang@intel.com>
In-Reply-To: <ZtHPusyTNkQ_a1Y-@google.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To BL1PR11MB5978.namprd11.prod.outlook.com
 (2603:10b6:208:385::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5978:EE_|SJ1PR11MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: d4648c2d-a092-46b5-83ed-08dccbb23183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlJaTVNkNVJUdHZkTThMd0tOcGsybFJ5d2RyUUwvTW8zQUxqN0tUVFkyY2gz?=
 =?utf-8?B?WkUxUy9va2NuODZNOGlmWjVUYURiQkZhTHY1OURzUzdaRVY1T0hYcmhLM2lN?=
 =?utf-8?B?QVlmb3dGMVM0N0h5WFliVTR5R2NYQkdtcXpDRWV2THZHam9GYkpjdTJhN2xY?=
 =?utf-8?B?dWlRSVdJRnQrczRCTk93UzNMRDhQOHgvN2FrSTlxeDJaMDVZQmdQM3Z3OFpC?=
 =?utf-8?B?RGRWdHZpWklJaTk2QkNNb1RWVVd4RHR1ckQxV0tYSXBsTGVKNFV2NG1vR1Ba?=
 =?utf-8?B?UVRTT2VhOFN5N2IxUk43Qkp6ZEh2M2VQOUxOUWNCcGNJU29hSXhvbFYvaFl1?=
 =?utf-8?B?d3h5aUJtMlZtSDlkZjNjQWp0ejFkc2xmUnFQUFhwYUZwdFJPdThWcXFYWFRT?=
 =?utf-8?B?YTY1ZkxNZVVNbDkzZ1lFdHpGVGlGVFd0dHd2Rjk3YXh6RWdXSFRsVTJwS1h3?=
 =?utf-8?B?NHZvYWROUlRNT0l1NWZ5UXljcTE4MGFGMGhFZ0VuUHBQanNOdmdVaXFqeHhM?=
 =?utf-8?B?UTl3TVRHWFFQTWU3Ykl3bDRtWkNOTjdTSGhXT2VVck95bHR0cW1CZGlUMW1z?=
 =?utf-8?B?MjZhaU5xMDUyUVVmYkhzYnd2WTQvcnU4R3NkVTRuaDBUb25GVmM1Q3dxcTlh?=
 =?utf-8?B?WCtBbGQ3NkZOWVpRZUFuV25vOXFFU1A3SVptM1dkdkd5aVpLOE5OL3h0WEY5?=
 =?utf-8?B?M21MUStjc1ZieGd4YnIrSjFOSEN5MmJIYVIvVzQxanhEbjkzeTBrdE5Sd2Ji?=
 =?utf-8?B?RlFxWGR6eVpsVlhnVWFtdXJYVTl2Y3NWVlhSRnpFcVpjNUI1UUJOa0d1L2RC?=
 =?utf-8?B?dUlVY05mK3BXQUJHaENYa1BTeXVNRngyZjNvcG1vcHhqRFd5Qm4xY3dMUFlq?=
 =?utf-8?B?QmtlMmRTR2xTaDRnRnlYbHFRWmkvdHZucEtiWkhTL3pPcDdCK2dZcUp5UHBs?=
 =?utf-8?B?cTZVVWl5SmhHbnlOby9NNDlvZ0c2TnhkaHBlR1pWSnFoRnA2ZFhzRnliZ1By?=
 =?utf-8?B?MHExT0ZkWHFBR0pMYTdyM2E4TTNXbmpyNHkvNlRybG5ZM2dETGF5WUFtcno3?=
 =?utf-8?B?YmxKZ3M4czVmam10enRMUHpLNnRTVEUySklTdmh2eWNjY2pXTlA2cWp1OTRk?=
 =?utf-8?B?Zlk1b1AvUVhsbGdUNWE1eXNKSzlmdjNxaG9YZmFSSzJYVGh3SHVXZWQ3VEFm?=
 =?utf-8?B?VCtSR0M5ZU1oUkhsZXIxVk5NRjlqRWo2SUNJdGVpTkZmYnkrYjNKQ2N6VTlq?=
 =?utf-8?B?cys4SEhwRCt2N3EwRmZRcHQwbE1LekI4NU92WDJWbWNmZmZIQ0h3WW1GYlU3?=
 =?utf-8?B?QUFoaXlXL2NFTXdOcUNOWkdOQm8rS1JQVWNhK0o1UWNlaUY0cTI2aGNRWk5y?=
 =?utf-8?B?dXhxaWtHWis5TWdrNEVOMHNHbm9ra2lIaDV5eVhySWduMkJuQmNQOUdhM2xa?=
 =?utf-8?B?MGMwaDdZMjRhN0diazVrbEdMMFEvc1YrT0ZaRXlTTDUwMmYrajJMQVAwNTFN?=
 =?utf-8?B?MEhpM2E4ajhTbE9VS09QZTU4WG8xWFl2dTlMdWRweldNckUwaFpyOXZVSFh5?=
 =?utf-8?B?WVEvN0ZGOTZrYTVPSkhYc2t0VGxodkd4VjMvMmdyUkRMTGZqR3JOTnpvMTZF?=
 =?utf-8?B?eWNDODdRNXFwWHFSZzBOWHVPeHZiZUlSaFNTK2kveVZNS0xWcHVaMzZXR1dU?=
 =?utf-8?B?OEFQYkJSMWs4LzZBR1k1NFdJNjJOd3NTRCttTi9sam43a3c4NkNCc1lJbVRH?=
 =?utf-8?B?bHVtd0FiemFPWEMrd1FpaUwzeHVyN0doa1JQckR1dDhEanF2YldVa3lDaDlN?=
 =?utf-8?B?bG5LcHBiVjZDQkhmOXpuZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEpHcXlDc04zbmJoMUk2TlB0am51V2NHRHBEcHc3aytiZ1hGcjBKNzdYamtC?=
 =?utf-8?B?ZmVFZndDL1RSZ3p5eUloQXZVV1IvYTRnWUxhSW8vRFliaVZZcnNvbFV0dFk2?=
 =?utf-8?B?VlVmRlZKZTVUdHk0WE1zWmh4YnVaYUo1bzNLbWI1Z2dqVWIyaWQrTW9STkNK?=
 =?utf-8?B?Yk42NDRBYXJ4S3p1Z1BBbTVpRWlNTlVMS1YwQndWUG0zeHJKc0Y4WFJDbFo4?=
 =?utf-8?B?VGZiUUpXckhNRngrbG82TEdEUFlGSjQ2TGdPM05kQ0F6R01meitxN1lsOVo3?=
 =?utf-8?B?bVlHbWs0L3A4c2FZZWRILzJWeFBwcExBdEJOdVRkTlJ5NnptN1Nla0xPWDhv?=
 =?utf-8?B?ZXUxRGl2NlRPY25EeWk0OTROR3dSNFRuZWo5ditranI0bFhwa2V0R2ZXY0NE?=
 =?utf-8?B?Ui8wMk9ydUNIcnZPRG5VR2pFcjJ5dnh1V3lmMXNydExyS2tFaDl0Z2JWOWQ0?=
 =?utf-8?B?dW9YMFRVOGdFYTB3RzMvaC8wV1RFQTZTZC8zUFZzMWpCWjViQldyN2NtclBo?=
 =?utf-8?B?VTk4bWxWZHZ5c0xQOUVnRVgzWTM3QTh1TFVTdHZzRGxTYXNsSENkM01WVjJM?=
 =?utf-8?B?WjNGb0dhbld1emZpQ24zMjFaV3Z2ODdOWjRTYlNRSDVEZUdMMHBIdHIxeEhF?=
 =?utf-8?B?OGpUOG1IdGNOdW4yZGxlcURkZXlSc2RnUzhkbTNBZnJWNGM5Vm11TGd2NVpl?=
 =?utf-8?B?emFpa2JrVTZJZE1lNFFKR0RJWlpOczJJK2tIRmVQbzNSckpkWjIvd2dBUFF6?=
 =?utf-8?B?VUN3ckdNUDZGcXpKSHFVMEhPTTYyYzFCUmtiU3Z0SEhjU09jKzRudmpSY1lz?=
 =?utf-8?B?cnRoUytHaEFhd2FkcTM1alUrbmhpVXlrTitjbDdyQmpCVmM1MS9Mci95VWc2?=
 =?utf-8?B?VElCTWorYXpVM2xheElnWFY4YVFxZGtoR3pHWkY5S21ETzVISzRoRjZBenJE?=
 =?utf-8?B?WW1qdUtFYWk1M2tpRGJLQzZJVVFOZ0xYSWxqS1lTWE1nTEc3YzBYaTNHZ0p0?=
 =?utf-8?B?VnZBSzhpSGRaOUlpNnBaMzhKaXM1WUtkelhEOGloWm5GMlltVmNYdCswdU9q?=
 =?utf-8?B?a0U1dGJpb0trZ2ttdTM2M055Sm11YnhVbWtTQko4YmpvQ2lITkx1UGdOeUJo?=
 =?utf-8?B?RFVQRHhTRDdaQnNiT3pUSCtBU1VXS1h2L2l6OTk5TzBLT28yZk90ZHJUVWRl?=
 =?utf-8?B?WEMzbkxTSFcxZUpvbW82TGl4NmtBVGNDNC9SV3NZRlBpZU93NmFWU3lFai9w?=
 =?utf-8?B?bDlLVVBsdEdBRWdGUWJrNFE2dkZvamh2WDFheUp5dXJZcE1oSmZUOVg4Rm16?=
 =?utf-8?B?ZFNJYVFXS1hQVm9PZ1ZvcDZJUlRYZEFiRXBaZjdML0RNM2U3UVJvanF5ajgy?=
 =?utf-8?B?bDhWdkdpU2dhSnV4K3QvMm1WNm81bkVQL1dKaUVaSlp4Q1Y3OHVORndRRXgw?=
 =?utf-8?B?Y2NqdExwYzh1WXY1M0tIbCtmaWIycnVmeFVaMXdHTnI1R2UxTkR0dndDbkZK?=
 =?utf-8?B?SzNqdE51dzJSSjBLWEZmY01iVGFBd2N0R2R6anJXMm4veHhXbWNpdmlDS3JY?=
 =?utf-8?B?ck0yVEVFYThNR0syWlFUY2JjZC9JVlFHd0JEbTNQODFUaFJtZlBYOWdVdEhR?=
 =?utf-8?B?dnRteFkwQUdiN0k2dGNBZk9jT2YxNmpMWXB6dVhTN3pyeXVxeG9yVlNobzBh?=
 =?utf-8?B?N3NRc04rb2RQZWIyYjJPbWxCbFV3Z3R6RkFPejhBYk0vQTFvRkI1dURDQ1lp?=
 =?utf-8?B?bnNSTmdyeGphazJyZVhQOGRmWm9nSFBKOHNZMWNsYVY2TUJUeUhLYm9LOHhv?=
 =?utf-8?B?MHVYT3Y0dDZEV09SZXRFbmNhU2k2bFVkaFFyd2oxR2pBSmczQVY2VXlWSlR2?=
 =?utf-8?B?RFlxdnMraVVFT1J4bEFaUldVTmpkVGhZWW5hL284Wml2MEl4azNrRzVGRldB?=
 =?utf-8?B?R1NVRTdIaWxBVm1aUmlnNVJSOE1CemxBUEJvcjRYOHI2OGlUc21hQVoxUXlr?=
 =?utf-8?B?L0drMytPY216eG9PZHdRUmNBL2pYbUFIVElLRVI5ZFZ5NjFoU3JNRnBsR040?=
 =?utf-8?B?WDF2aFFPL1p2a2hIZkhRZDJRa3MxVkQvWkhubSsyZ2hjMWUwVDI4RldtcFIw?=
 =?utf-8?Q?FkcCVItyakSr+lbQwsf4Sztqr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4648c2d-a092-46b5-83ed-08dccbb23183
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 00:48:57.6600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWx3Z9Z0Og3j5OcSQzmNQzo0uEsv9xGFfYs2AaLLezRR4CpvVzQKldOMUDD/Whxo4Q2fCvVoX7nAWc7Lp4y4yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6154
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_174904_552338_C5B5B2BA 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 31/08/2024 1:57 am, Sean Christopherson wrote:
> On Fri, Aug 30, 2024, Kai Huang wrote:
>>
>>> Reviewed-by: Kai Huang <kai.huang@intel.com>
>>> Acked-by: Kai Huang <kai.huang@intel.com>
>>>
>>
>> Hmm I must have done a lot for me to receive two credits (and for most patches
>> in this series) :-)
>>
>> I think one Reviewed-by tag is good enough :-)
> 
> Heh, indeed.  b4 has made me very lazy; I just `b4 am` the patches and let b4
> grab all the trailers.  

That's what I was thinking about too.

> I'm guessing something went awry in that flow (or maybe
> you acked a previous version or something?)

Anyway will pay more attention to this.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
