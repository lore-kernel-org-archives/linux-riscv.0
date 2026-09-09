Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929CCC79F8C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TYMoPZjKONXdwdZ1MCT2emzIxh9xndCkQyiAi8LggvU=; b=3IJn1ZRlhzYC8ZJMSRFgONs0Du
	yfIPiUAPyYSzm84HZrOiiR7uBTTkHzwRiL28oohnoJ3QpTdNHwFhKOTeX1SAEbOHm9FD/CHPelXFT
	hBLHQOQ5tCrr7YwwXwwpu9OG8fbgU3hELLZAI0Yk/I0COCCeJDya1RfADI4bumzfDIeOLgcSAEwc4
	MypXh+XKLPB4vq8LTD9u/wDnACOR/VKkaRH5WJ31M6QxfsDvaLQorfGLWbM24SwgxkITD0dwZslZ8
	fNSahZvaTK4egcNGaokTRwDlQOOf0Xp9YZsdL7nrkhY0li0VG5pzkLmdkO50wI0fvafhhVoPbEsGn
	QMhWeHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DrK-0000000B9Lz-2TJ6;
	Wed, 09 Sep 2026 08:40:46 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DrH-0000000B9LS-1CMp
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 08:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788943243; x=1820479243;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DiCOBhqPRhlDog3gTviTE70AZ1ce45egB0jknk/nHHs=;
  b=fZijB3peuDoH/b6lfX2uPZtGpKH+XzwsjTxq1KXWXa1Kr758Tn/TQlYi
   a10SkmuyKeX4BZjLgmQA0moJdmbs4cTo0sHVDEumLcdoZa6uWWH69gwpN
   bJmrLwYr8J3vsJ8U0TZSbFB6GIUpIb6DyOlk//xZ7fyvxQEG+husKWbPz
   NwsnAYMbmMK2Uu5bFmg4MCoaGMgfPABreIKQ/nXlF0bwxk+Qf/Asve3D5
   RXNlLE/JpPMsLqvm8TlH/iKifqyiPF+w2vILDYRAgB5t74m+bBunXrTY/
   xrXWlu0d5JI0BJtdazoZEF65l1RrImJ89WyAsmC86BqKw++ERebUS+18e
   w==;
X-CSE-ConnectionGUID: bQZ7D8BVTYe4+f7BEJg66Q==
X-CSE-MsgGUID: WWEj3H/XQ5K7mTi1lUJKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99689174"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="99689174"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:40:42 -0700
X-CSE-ConnectionGUID: H0By0LwkS/utNdt5TmymhQ==
X-CSE-MsgGUID: Dp+Yvma9T5imGxT/jUkk0g==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 01:40:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:40:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 01:40:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 01:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVF/96ObmWZPWPSpUU82unT78XjGBxiEg0Gju4O4HxeSAFPFE6AT3895v39vnXw5cVhxrujo4CcE8SBvc3JOP6cfoJMIgJ33YLtlvl7JevcbRm19G/GX9DxHSY4QPhhcJJZM87xpPK2uOLhBvwV0ZjVMzwjIOb+bsY9/rZ/vxlG9RaelowfoO2dTCLfK2MVhXcTLzn9I5pe/fJriORBtk+AhlcOxSECvQOFIZO7Au5rKpgJh8Aae763cmgYWaLN/Gtz9HvDu6cZp/DH/+qw8U6oh0LzZdqHGIYU1Zkj8V88f4/6c40IbB0lxKFbjGZ7dFpRo5LKyInPwfMl3cbRjwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WkjPjMm3GcMqq45BwJQdyCzWZ0xdUpCJ5B57sNtlTI=;
 b=h91qXTCjY155ZasEpV27rrprWCCHEi1Qy65P65v+OY1xt+wLdjuOrjabeQU3n3sLh5OfTHoBhuX+yAnxa4LaWRR6Sp1RT0MtzsF31YhWqMMstuEkA09fwMA+cSrHCG0ICzzUmXNdFu4yfLht+0AndLqM9hsxezqBmfYERjfvF735kI7DEi+co9KfmSFaVxVBPAxfwWybINVKrLeZ9yojRiZVvm+L8vndHSuA07Mrc0VJLqVaEo1st6JszVb0eY6z/LLUliYz6bGo0hhzhioD0wFr7H5ZpBC8vCXlIDkxjUiQeIMBh7TJJTEoPUIP3euRn9umMDMBxEp3I3xCwtn17w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 08:40:37 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:40:36 +0000
Message-ID: <3973e934-df9f-457e-bba5-7dea5f782931@intel.com>
Date: Wed, 9 Sep 2026 11:40:31 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] mmc: spacemit: improve clock and tuning logic
To: Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>
CC: Long Wan <long.wan@linux.spacemit.com>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<spacemit@lists.linux.dev>
References: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
X-ClientProxiedBy: DU6P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 9468858a-7147-4671-b50b-08df0e4e050a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: AdAPFkk8A4J/UZYAnHDA8Z1ovNmjjDrMgz3UyOtK9nM8Uhrg+ev2j78E1KLFWpLTgl0isqe3rEbaOCJWNEAORybDp2GUYljHBCerA6oJPq/zr5rh0dqsWycYUxw+MvqHb/yyaQ3xvqxrcv/oJVPo7sHP9yCq/6b0w9Q/jOFqBykAvILbOkwhURn9cRTJDm4KGPFfaFNg6qBs6gbotAYGLnPmh2xT3t2foCThlVG6i9+oSGIRudP6yfMSvHZHXcRbFl7YUb0QLadekU3+c9HTEqkw/pWFQUxFSd8KYsp9r2TlUaRMv1mt5hQp5eVuHt1ly0wcRNcjwi81ofRjBigc81kijJDkaGCJVwDNotG0ef7D29Jq43m+Rnhr7J+HqW0Tnxr3U10rK1mcXLNRHV6LSK2VUoRE2/0+qm8VmOdRIAXTDFZqp50ORnGLobfgai0HOhpePt2ICjI+oqxrHkRAqnY0XvN2cjYxyPkUplfyawvSIhobSenMtsn/4hKzuNmvaDdkyuh6w46ddTLL/za/Oq4IBBLRo4tZ5s/qO896XnQ/trBlwWcC85Z3eUCNyrKl/6/qZU9VCdor6aZfRANcis7JrcV6fzmj7Rut2L+FbRM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXpGM0wvemh4RDMraEFzYjlyNkliTXpEc1prYmFiZ3JORHFiMUJmQ3dRZmgx?=
 =?utf-8?B?bkFpai9YcURFZnc0NytYMUZvZGNDWmlTSXE2dzdkYVNob2pBMUw2MzRrWFdt?=
 =?utf-8?B?RGg4ekRweEhmeFBtaVFMek9uMjJ6NnUvZlNnU1dTM3lEUytrWEZVV05jSnFY?=
 =?utf-8?B?bTJpejBNT2ZLWUpEd245NHl5SlVZOGh4K211YzJZd2JhZXZWT1VRVWZ3bTFU?=
 =?utf-8?B?REZwSlVMeXRIUHpXRTcxckdOcG9PREkzVnRpSndnVzQzaTlhTVphNkI2T05T?=
 =?utf-8?B?Ykd6MnVhNHdkZFdOdlRKdVcrVmtwemZlNUlwV1J2SjBaNXM1SHZ0QmxnOEdP?=
 =?utf-8?B?NUFqeUFSbGZhVmcvN2N1a0p2RU9ISVZ3QnNqUWVxYUlsNXlFWDhmdkJNUzZE?=
 =?utf-8?B?Wlc0RFIwc1VIUTg3WVdWWXZsQ0ZMQTdZU1RLaWZ4Y1k4SnRxL1NFdXcwUmxz?=
 =?utf-8?B?dzJON3Z6aStsMXlRUEZFT2hUU2p3eGYzUGdHUTJiby9QVGJYV2hMNGZKZTZ6?=
 =?utf-8?B?WWZUbndxZTlIU3lJK0pZMFVsa3c5ZEgyKzA5V0grcnlMY21lbjNFTkNmWERu?=
 =?utf-8?B?eXNwdW50UmMzeWZvbWhOVDM3UlNWKzVwSkdVYXF6OGZnU1pmU1lHbGVjaDYw?=
 =?utf-8?B?RGlqcDF4ajd6ZENZRjNKcGVlcXBCMmJ2TVFQWjZpNkRTbFFvK2RQUkdHb0x2?=
 =?utf-8?B?VG44OFhmUlJvQS9jTW4vZXNsSzh3S3FhbDhlcUtiRmFRUm9zamswOXA1djlr?=
 =?utf-8?B?TE1iN1lDeGJmV0dHdDVzQUJERHo0QXdZMWtEYmVBRjJQTkZESEFvNkZLaDZM?=
 =?utf-8?B?UjlJaFRHRzFSOXJobmZ4dHBqT0szVzBCK1RNMm5oWDd1NEtsaXR6VHhqZWk3?=
 =?utf-8?B?TlhscXdUSDMyeTRSRThjTFF0TUJ5aDdINHZ2WFpKWUhBdG9xdjd0MGdhVXV6?=
 =?utf-8?B?SFV6azgzcnNITGtyWlE5YXU3clBmMGNhNHBiWFl1c2lKbEZEeWVuTmYwQ2tQ?=
 =?utf-8?B?YkdYRk1HdW10UDBZR3Z2Z0VSMFI4ZFVQVVljQ2xOT0tmb0ZDYk9saXdKMGpv?=
 =?utf-8?B?MHNaNURPRUZ0YjRkVTVaWStYaTlDVGgzZXgyTVhZYXRMZi9EWktuMXdtV0V6?=
 =?utf-8?B?amdjeUMwL1lUTzlVaEFCeHpLWGNqUkkzK1FoNHgyMWVHVGl3Y0RZRCtuZG5H?=
 =?utf-8?B?cTFaWkdJL0F4WGpaSE94ejgvR1g2cU51em5NNmEreHdSYUpjYjMzblIrTnNn?=
 =?utf-8?B?YmdFVUdTdy82cG9ERW13M3RjSWY5aklUTVB5b1R0RGcreFB4aFNyYWxDYjQ0?=
 =?utf-8?B?VW1wU1g3d0dvci9pc3Q4RUxnR0tkMHBGanZOSHZ5QU9XZUl0TUZBM1puR0Zq?=
 =?utf-8?B?a0VWL2RIN3EvczF0dHd6U1BDK2xwTHpkQ3ZNTjE1ZkdCd05IdERsM2NxRXMv?=
 =?utf-8?B?MDNET0NtZnlXZ3FwV2VXNGFPRjU2QjlsaXZVR1M4UU5Cc0RyQWFGbkc4NXh5?=
 =?utf-8?B?SU9NK1lIcEpMOE83V2kwRktJWTRESjFvMTF0cFhOZWpHZ01uUXVGYXdyS2w3?=
 =?utf-8?B?ZzZmVWl6SzlaeWxkaEZZQzdkZXRIeElycnRmbjNWRUhZMzVjc1diUVIwWEFt?=
 =?utf-8?B?U3pVNnBtNnhoWm5iYTd1b012RUE1MTh3OUlFcDJGTnNmbDRUY1hremxubEtS?=
 =?utf-8?B?SkhYOFlpM2F3dVN0VlNrdEVkNTF2TmhuQzVZVnJmK2NNeEdPUTJPL2IxaGhZ?=
 =?utf-8?B?VkgzUDYyWGxqQXFJYXp3U25sTW54a2NSRW94bGhydXZHbUd6OUFwa3MrOGZ0?=
 =?utf-8?B?TkJDNWhCUit1eFFtZ2VXdEFIZnpiVytKaUU3b0YwVllkZC9KZmFzRGNjVVEv?=
 =?utf-8?B?UHdnVUh3SWZLTmlxK1Y4SUhtYk5LNzIvU2lwRUNNSVp6TlFXS3BhWkw5YlNH?=
 =?utf-8?B?cHlENWpmdVFXOG1qV0hnNFZwNWgxNVNuTmVvSzJ6bHlTWXpiRVhtcGdaTUwr?=
 =?utf-8?B?d0xMeUE2d3p3ZjE3b1IrMFJzb2V4Z2FDU202Rm1HYmorNmhROXRBTUwwOG5B?=
 =?utf-8?B?Zkp3MFVNL2pBNzBLdEVyazNJN3FUeUsxM3Q2a0tKTHNXcDkxRlpMR3pKM3V0?=
 =?utf-8?B?ZVhrMHNKUnVqQ3NqTmdmYTM5Tms3YnBGS1NsWXdxblJwWXBQaXRIa0tuMS9k?=
 =?utf-8?B?SGp6YzhzbitUZkp4YkhDc1pzam4vZ1h6cnlyeFVla3ByNmcxN3loUU45OW5s?=
 =?utf-8?B?d3pMY05tYkVQdGJ5eitwUGo5UDBXV2J1UDhILzNzYVUxb0pRQ25MZlpYNEJS?=
 =?utf-8?B?YmpkWTdnQVBDMlp2ZmZXanUzdW4zSUx2T0FoKzZkNWZmVFlpT0RpOEdNc2FB?=
 =?utf-8?Q?Oj4EpfMlSGp4iEqc=3D?=
X-Exchange-RoutingPolicyChecked: dtUFv+HQ1EDlX5O6lIlfGadAUHp1OsHQX4zBxJJMhMaF/4BXu1a6NIr/yMOmlaW/zmzldwpBUcJ+qk5ezhODe1vuuIlKfirZ08UHxbE8j3dQnG8vnWCxaQ/VFazYhn0rdeS7SKbdh96AW7O8nqw012pyKstBOG6Rn5ILZAFQB6O3wilKzRoNoGTQc4CKMHThz91Y2rGmjBgDaNpSfdvVZw0t+Z5AHk84YM7nFE0O2Sz1K94M/6VaDn5HAgxBVCm+7oocP3cTcz+lncN8IrO4KzNMWN8gLW8fwBTD9MtzDKtoSJRTHI2jD41GNaJQNZYkTmb4pLgUHV9lyaJsqoyNVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9468858a-7147-4671-b50b-08df0e4e050a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:40:36.7887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpzUGRiRp3w+gb9e+crXikt/CtmXmb93de8G1tcTfbLNiho0K5Iwp60j9kteRL5MrwcpEhgbKMXU6to3BCcEXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_014043_374702_B01DEEE6 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/09/2026 11:04, Yixun Lan wrote:
> This series includes some bug fixes and improvement to
> SpacemiT SDHCI driver, which relate to pinctrl, PHY,
> clock, tuning logic. Most of them are quite independent,
> but put them together here for people to easy review.

Please cc the authors and testers of the fixed commits.
Also have a look at Sashiko comments:

	https://sashiko.dev/#/patchset/20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd%40kernel.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
