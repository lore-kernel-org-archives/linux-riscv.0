Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF0DEF99E7
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 23:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=beJCRv+2DHJjJCgS97sxQkJrPdrDGp0brN+b8WFijO0=; b=lroC4lsIP8oEcW9LNVLsCLg9SA
	9yBF6HwgdtEhl7dBUil0BtlZ7R0MrMLcbN1tyTwEb0yz+3hid6zBJKegXzg5XYMvw+HrrsLm0Ze4x
	yxI+NOH9kUgXTnKFq8S7pqIgYxvWoy5RVvhnoviZTBeWsxTc0icQN1T/aUOLSTJz7q9RGX2YnAO3n
	EVek07cUi4Wxs4zbbOq6KkIa5KZVfZsTI8ndu/AoIsNb/AjKKlgR7U9M0RX/7QZK7oIULEKZSRcUC
	IGTF2Yk6ovULFFhZSrq1Dmc1XPa8aQG3mmlfglBY+KcsMn5mTEag3MX0BGi8/bJAZPDE2v0Nru0OT
	hR70EsTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2MK-0000000419K-1RGa;
	Fri, 13 Feb 2026 23:14:00 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr2MI-0000000418w-1eFb
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 23:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771024439; x=1802560439;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CTRLpNOkvrQL6BSGP13C3b/RyM4es0loHOI6z7hMjqo=;
  b=SFMS85gD+IDfZODCwB2D5nRgX0QxQmjv7T2J77e91OuMKi026dNA3YG1
   s4TGbnyL28mX7m+assu1vArJ2nYeRYe92NRUDTkXf7ybXRyfxxgGiPFam
   jt75IY2/IakwkIo4yYxfJ+RrywA+Vk+DhukwNDCrEuoLSx5paO0zs7ECu
   3ZvLyavpigx4OFKaV+xAn2hTCBzydzz4A2xU1hHUOCur1rL2dlwHLB+FF
   rz1FIIXFsa3h9v40VCCqm0QhbtIXCyAhkUmQo1H0BUKi1CkporiWsJrGB
   jrmvm7849w5rCae9bp9UYL5qsiipNYLlX3KgkD2gO4yw5LvCdH+H80b3y
   w==;
X-CSE-ConnectionGUID: 5swXFLIXRe2QVYi4mrjhDA==
X-CSE-MsgGUID: cDPXhZo7QditxlGXPVVsag==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72117757"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72117757"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:13:55 -0800
X-CSE-ConnectionGUID: AaPhem/vQ82W8Ptru0/PUQ==
X-CSE-MsgGUID: z3Hs0LNlRg6mzCtESsxOSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217171718"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:13:54 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 15:13:54 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 15:13:54 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 15:13:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrwA7pCSuqjLQAmhvQAT8SQdi3r6gLdjC4Pl1y7D9LGIxiZz/MUUSgc8A1gS0Ew/oSlvfNdVgFcew8igks3fGRZXpBL68XVUQoVSSWXsQUi7L4kq0HFDgtULuAFhfbpdkvZQuwn0AsGZI2HpVIjebtgav7+3qICZz0NMsgWbsQ4Z8PVcN2oyc7skbZqzTBA+LSfyuPWiRIQXSsnkv36DjYmpgSih4rW6QV/uRTm76+earRBehCmoDpzFlhksdLe5Qyl9gbnzUdLk/fvUEAb+cO5aGWyfTSMuGZl6wvBari0z6NU6Q4L7I7mfrZTv7aBp4kOk9BpYUR4llBE45Jorbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5UImsJ1HjJwvPSA6ZxNilijbFjJFo1k/hg6NEk9UzM=;
 b=JNdWLfL9CdJH0GXud9Qk982nGewGObQnIAaLtqwtvJ6WtZzeO2jhvMCUamFgmnYpwJG5feQylOqZ9h9ZxJcuGVv8pmqlrZU9JHjKrlOk53bwTyXYRMBpRAgOEHDsFkJIt4t0jmaJWW8PQDxYv1k7C9WiEdiKIaxJulL08rQUOCYFMWJ5ccOIhMnb0MWJaQvdjRkfckfUK5SVnkUS0SAMw4DKlWJ+lfPnhimVjYYl7G08OBoTqZLDeWSOLed9CQiW5kbPAkX9UOEGZpPBcJMI4MPoDpkjk4u2Png/DgzOw3OgGthX/QgIVtN8YiL51LiMFEy0m4o2KuScynga5R7/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CYXPR11MB8756.namprd11.prod.outlook.com (2603:10b6:930:d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 23:13:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::bfe:4ce1:556:4a9d%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 23:13:46 +0000
Message-ID: <3f53c823-74ab-46c3-9cf0-c28b062f2c89@intel.com>
Date: Fri, 13 Feb 2026 15:13:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 05/17] RISC-V: QoS: define CBQRI capacity and
 bandwidth capabilities
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
 <20260128-ssqosid-cbqri-v2-5-dca586b091b9@kernel.org>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260128-ssqosid-cbqri-v2-5-dca586b091b9@kernel.org>
X-ClientProxiedBy: MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::6) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CYXPR11MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 784456a3-9185-4c47-04dd-08de6b5589b6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEd1UnFSQnBGLzcrdmdPQWdqU3dxMVhrUE1KYlJPOFZuY2k3dE9HQ01xUW1Z?=
 =?utf-8?B?UzdJcjUyUkdqamN4emVHeTlrcnQ3cUptbEdGMFdRZ2Z2bC9vNEMvUnI5NE04?=
 =?utf-8?B?UUYzVUgwRHFmb29McjI5dVdQNGpUeE9wNlRHTlNUR3VFTE1QODAxek11cHNV?=
 =?utf-8?B?VUdwSUlwZTUvN2orZFUvWGVTRnhOcHBlWFJFb2FuOXBqS24vSkF0R1VLOUZj?=
 =?utf-8?B?QnVyaXhXNDNvL0NTeUs1YndwUVVCQ2V1QzhLRTZDZzdHU0pzcEorMEhmTkgz?=
 =?utf-8?B?am52OVFUdk1pTjNZeXpycmptcnhjOStnZ0JiemJPRHRVbXVzcmF0SjRLRGVa?=
 =?utf-8?B?SndzckVsU3BkM0h2eFB0N3lrait0YlBIWHFGZ2Ria3N1c2NtOFFvcytoNzgz?=
 =?utf-8?B?UFlpd3NneVJiTGE1VWs0MXZ3WlB6aHQ1anh2VXlhaE5hNjV5V0gyV25XNzY0?=
 =?utf-8?B?TGIxNm9QSEtIZzVhRUdCVlpaRzZoVE5GTG1PSUpxcEpoKzdMMk8ySHVnOEFH?=
 =?utf-8?B?NzRyRFc4Zy80MFhKU0p1b21RTFV0ZEx4cXlrTHpCdjVDdGlVcjhKWmNYS0pn?=
 =?utf-8?B?ZDJ4Rlg1U0QxM3ZTazRtUnZlUURDNjJFMkM1My94cldJd01GemR5a0wrSHVG?=
 =?utf-8?B?aXF3L3NzVksrY1NzVWw1KzJnRnhZWjBySFIrTGpuQW94U0hZTU1RaWk5MS96?=
 =?utf-8?B?UlE5YnN2c2dybjd0OFE5RnoxQWZuYVRtTFV6UzFweThoMEFiR2FvUUJuVW1w?=
 =?utf-8?B?NERDRlk4T1VTZVlwZ0FTMks2ZmFhVk5pcEJQeUJKYWMzdVdBUUlENmk1RFpR?=
 =?utf-8?B?Qzd2aWsxRmRqcm5PckkzUjBRbWdWam9uYWFwelZ6RUdUTkk1anJzMElpNW9t?=
 =?utf-8?B?TWJ6NTA5bWJ0NHROZU1EWmt2L041bjZKL0xrWE01U3c3dGxrMzU1RVZnb1Zv?=
 =?utf-8?B?VEVITThSN1NqdGFycFdOcWFBNGVFWjFhWGROa1JyTk9Vd05EVUlLdjVaZXFM?=
 =?utf-8?B?K1lENUJZRmhkMmRDNkdvQVJhVWpmWGVsVGRURDBoelpWN2hWMTRLWVpsWWdS?=
 =?utf-8?B?UG5rN1N6OCtnYnMyZjRtdVdZOVZtUTFDeVBVSG85R3l4bE1UZHd1YzlOS1lF?=
 =?utf-8?B?ZVAwZ0pVNDNrK1BoZjA2MlRSNk9NUXJiMWRGVG9zMGpnU2tHbjNVVjMzdUE3?=
 =?utf-8?B?eGhNTSt5Q0lPVGZPcWV6U0tTSWFkUkZMaHFLaFhTY1hOQS9BcTBISU5uVFp1?=
 =?utf-8?B?WGo4Z2RUdXZSUDJRM0pkb1pLSFRHK0Q5Rk9wenk2OFVxVCtsa092L3d4Zno1?=
 =?utf-8?B?Z3U3MkJ6azNQNHZubTBsY1IzeE5vMFIyNDZMdU9ra1dvL0RvaVZiRzVwanMr?=
 =?utf-8?B?aW5DTlV3TEhOZFhPU0lDTFd3YTBlSnlQUElvVWxmdGYrdHRkV0U0WDNJeGFK?=
 =?utf-8?B?dkhUblZEYXNIMStmK1BwSzFrQUpyOENxS0hlQVRHOEdaU09WdFNrUHVEVmwr?=
 =?utf-8?B?bkxvQjhNLzJyTmlZVjlRRlEzcVMxUTBYYzJFTTkrWVgrQUFsZHJkOE5DQmpt?=
 =?utf-8?B?Sy9iTVVLdXg1akJjb3kxUmhhNjhjWjRuUEQzUDBmR0F2eDlpOXlSUWNyWXdF?=
 =?utf-8?B?bzk1RGx2YXlHd05iYUY0ZnVxQ01yU05wODBSV2E5NUNQaFBpanEwV2pjODhl?=
 =?utf-8?B?QkZuOTVjZytlOUg5RzVGSGwvRmRQcGMwVWFIK0VKS1ByczA5MlhkM3M1enUz?=
 =?utf-8?B?dmVpR3YxVWx2RWNQZ0xqdGpNYnhZUm1FYU5wV2hYU0lsM3l1eTVoekFva0Nq?=
 =?utf-8?B?ODRXU0lXelVzT2NDMjhpQnVBUGNhRTRPRWpWSkFONlZpa2kza05JZnFSaUVz?=
 =?utf-8?B?bEdxblB3YUdKL0xYRkwxRG9WT05YTjlqdFpDWXEzVmFDZk02NmJJNWlvbzZW?=
 =?utf-8?B?d3Z0VVBzWExRcG56WFRsSndJbmhqYUxjMm52R0VEL05xckhsR1Z1ZUdnbk9J?=
 =?utf-8?B?dnlFWVFDc1Vpc3hOcERvZ2JWanlFakk1YUZDRG5JZDFZVEVMR3ZLQkp5eWFh?=
 =?utf-8?B?OXdlQU9Ld0QyT0J1OG5KNjRFVVRvTkh5K2dsZVZPRCtrYlVMTHlINnY5cTha?=
 =?utf-8?B?UklhYUkyNXlEcnNYOG5BanBEeERZQWUvSnB5bVZFa2RWdTJHejAvT3lYWlRY?=
 =?utf-8?B?dkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2xQMEVBSG9YTTlveGdaS0NzSjVDclU5eSsrMEpWOUJUWitweS8rT2JJdTU3?=
 =?utf-8?B?RDhsUWJ6enR6MXZXOEFGVDN4RGxiQ0RVc1FUdEplRG9qSEd5ZXdjTVpUS2lR?=
 =?utf-8?B?Y3ovQnJXK1ZWZVFtbEJQVHAxZ0RCQnZSNVRyQUtpeHdOVXZXWlRsUFZBN0Jq?=
 =?utf-8?B?a1EwdWVnYkd5MUVwUGN3b0FHWWtQYzd4ME9EK0tSNElQSU82TkxraUdsbXdw?=
 =?utf-8?B?emx1VndPbmpiNU94ZWp2K0ZWangvYkVvcnpOQXZpQW1HWEJiSnp3eUlrcU5P?=
 =?utf-8?B?VnZMYUJ1TWQwb2dRNmdNYkp6Tm4xODNZT0FuQko5QmloRm9PbzBIRGxXV0c4?=
 =?utf-8?B?UDZiYmxvTGcyVkF1TlQwSlFCb3RnaGl2ZThOQllJOUsvUDJJR1Rwa3daejJh?=
 =?utf-8?B?QWIyU1Q4dlROcElPTjBOaW9HdEY1b1NxcnpUcXh2VFh5eHNUSkEwdjdOSlRQ?=
 =?utf-8?B?T2FjY0lPd1RTTDVMK1dZWUVMQ0lZYkovdXpKdnAzMXU3Y08velNmTmlYWWM0?=
 =?utf-8?B?YlNkVjZqSzB0UlZ1SGRBdkJFdGJ4YzQyOHFyZ0JOVFJZbGwvQVhkRWRCZFZS?=
 =?utf-8?B?MVVyb1YvM2JlRG92dTRlRnJySkIrM0d2Uk16dU9pRXdPQk8xa3Jyb1ppRWNI?=
 =?utf-8?B?NnlMUFZTQS82ZVZ6eVZsUDVPSFlvdmswK3BrS1I5bUFiSVdPOG8ybWU5Yjdm?=
 =?utf-8?B?eFF4ZCtCVjBGcXRWMjJsMkRGOGRCVDZGeXVMZTA2bFJhdUFuWUplamNLdlpO?=
 =?utf-8?B?RmhhRzZZWTJtUG1EVzlHd0l4SVppVWY1anI0TDBJS3hrMnpJMW9IYmQ0UmlY?=
 =?utf-8?B?T2cwTlpxaHJUcVVISjhFVW5Wb1RyOHJXdDFoWlJxc1Q1dVJZdWt4d2hISDVO?=
 =?utf-8?B?clBaeXdNakxvcWEvRCtnOEZSOUtxc1Vhek5lMWF1ZFBxS1lFdThSQ25TdTBy?=
 =?utf-8?B?Q0RkWmN3UFhUNlRWMXA5NFk2a2cvOVdsWDh5NVloVEtsSnQyOWVBTHFEUFc4?=
 =?utf-8?B?dk1nQ2ZBR3NZUXBiK1BiWnRqRVhsVG5pQThpcmJkS0FrdjFFNC85UjVsQk42?=
 =?utf-8?B?N0FwazJ0Mjk0akZjZExqblVwQnViVUtJTnJuTy9UYTgzWGFtdmtsTmd4QUVC?=
 =?utf-8?B?ZDRYczljWDV3SzE3VllzbkFSOGQzREtJdmFPSTdncWFubkxjK3RlOGRKdE0x?=
 =?utf-8?B?VEV6VjA2TGZnb3daWHJxOElyaGhQM0cvSlNBdlBsK1kxTklTZ2JMVXRncUQ1?=
 =?utf-8?B?WndyK3JjYllYVWpQYURWQ2NGQTNZZ2x6WGQ4VXhVdXZ6c3N2ZjVja2ltc1B0?=
 =?utf-8?B?d1hhWmM0SjlhRzNMaHRkbFJ1YVZudzl1dkFFdGFXWk1XT3YwWGVMWU5IOW1m?=
 =?utf-8?B?N3Vqc0dCY2hDZWlRNHBXRkUvY0YxQTh1c2p0Mm15ZEJ0OUxJZzh6WkVlQ0VE?=
 =?utf-8?B?Q2RhRFZQYnJQb2NibzZ3bGt2YWdZblc2NDNzUTgraXM2Qjc1dFppSUZ5VVV3?=
 =?utf-8?B?UW9SWStTUDlDUTNyaC9aN2o5TUgzNXVYVkRxMmE4OVl1LzhsMFAyRlFBdVI2?=
 =?utf-8?B?eGNTeGlHdGlSNlJub1hncHVIL3pGY1J1eVB5TjJrcklYSkIydklVNGJPb2VD?=
 =?utf-8?B?aFBSbEswN1QxcEdyMlA0aDRYMFBDa29HeUd1L3BGZEtQRGZmWWVOSlhDZWJn?=
 =?utf-8?B?RE1Sdi9tdG1NaVRKY0tTcjBSWWdIaGRRT2tLMURzUUR4cFZBM0EzMWUwUGFu?=
 =?utf-8?B?L2ZLN1dXMzR4T3Q1N0ZvK1Z4bGZiUHY5bUdKa3BEQUVmR0tEWmxHZ3Z3WkFn?=
 =?utf-8?B?cDlIMHRjOUxFeENXSDVDbFUzZ1p0SEtNT2lHbnNvZ3FCUC9kclN4STUzV0w3?=
 =?utf-8?B?eW5hKy9mWjZTV3ZOWFYwOGEvcDYzcGl1S0pxWHhpd20zYXJvVDNPT2FXSHZi?=
 =?utf-8?B?ZUsyQmhDRFM3TXplRXg2Y1BwM3h5dC9xSWJ5aWhpeWZRMVZGN0FmWnBIZTMw?=
 =?utf-8?B?NkQrbnc2YmxNZ1o2RGE2U3ltS2RablpLYVBIZm1GK3FtbzVNTnV5SUs3dGZq?=
 =?utf-8?B?NWp5MW9nOStMNzRKVUxkTmJLUjVEUnhkY1lLU2VEOStFeFA1NStYNklZUDU4?=
 =?utf-8?B?c1l5aGZRVVpqMXVkbjRuZ1NJVnpWbmNKRUdnY1hRSVpIek16cWhGZ1FHdTNz?=
 =?utf-8?B?SlFKcS9WQ0p5UnJHbTVPV0R4aThLaDFreGM2c0hMajBpdWhIdXRqRnRKNzAy?=
 =?utf-8?B?eHl2UjNkZ0JsdnhNbjg1Umw3SWVIampobnhXV3d1TDNENmZaRVBtOE15R3lH?=
 =?utf-8?B?N2k3Z1NLVHhzNXdGN3F4TUVlMzZITjZCTCtXYXBna1N3L05zNGs4Vk5FU2lw?=
 =?utf-8?Q?UNN4DOX4XhsaTzQg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 784456a3-9185-4c47-04dd-08de6b5589b6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:13:46.1369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI/6uVNGtpFvqHeOTwcWn/riNHqjCRBIPEvCCoxUj/KqX4eyRXebrdXkQzamBXZxYW5/q5m8DtZ4+1kL8fJIPDXrjzWFXPwxIGnrSDswJCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8756
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_151358_522857_A1640704 
X-CRM114-Status: GOOD (  11.94  )
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

On 1/28/26 12:27 PM, Drew Fustini wrote:
> Define data structures to store the capacity and bandwidth capabilities
> that are discovered for a CBQRI-capable controller.
> 
> Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  arch/riscv/kernel/qos/internal.h | 128 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
> 
> diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
> new file mode 100644
> index 000000000000..ff2c7eff50be
> --- /dev/null
> +++ b/arch/riscv/kernel/qos/internal.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_RISCV_QOS_INTERNAL_H
> +#define _ASM_RISCV_QOS_INTERNAL_H
> +
> +#include <linux/resctrl.h>

The include caught my eye but I did not notice any additions in this patch
refer to it.

Reinette


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
