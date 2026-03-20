Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70633108B901
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 11:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bKRd0soBYXXB3zEHjyzfolmdEd3ReCYwCfEtLuMt+Ak=; b=qs4HHyVYtBVcZj9vMpNrs90cCu
	I/gYAjXlnAYXWm7jqDVOCNdfjT4+q4gwByf4anAUbItA/fuyQZruerLiWSLBGFVJDBLT9f/2wGWRt
	uVpyK2BJtUo6dcTIK51AlL8SFXYbXpjU5vQx/DUlSrGh3Dwz0UymxXzaJoYwTPwJ5cJL6IBhAwtBf
	J9k4KRLaTZ4U2eW8Zv2/58ZSrp1DvCYkgFGMum9CqHdMSyCRv0afvmyK3vs+JsMKdOHZwUj1NO/Er
	0Annh6ceL4Qh0e0KA3dGENFTnYY0JhT53Vqbr5s6PIyrUKHACB8hxBUNW9phnkFn1+1qiPWJn7btf
	oQ4ebGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y56-0000000Cht2-1cvf;
	Fri, 20 Mar 2026 11:31:56 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Y53-0000000Chs2-1EnX
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 11:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774006313; x=1805542313;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ndgGIqAH84ZXr/mq/UypJkNxl8ubE0sX5c74iO0DsK8=;
  b=VDD35SSe1/CtAPVuxrZv4QBRN10bOafQsIvyKEMB/wunZtyY6uFywv49
   sJR0ezyA18axoNRmmSKW7IRGv+1HPH6W1VN6Q8a/d9uaTn0lSshuAp/pM
   /fCNnIGlA9wynJHVWkiN/1XATdbJ5MkREA7B+kBLlJdd5tJiOtwZb8J0A
   ucpTCFClLMAOHGXnYw2GcXkEC24AnvHo2LQnAb80fTuxM9uTDjQ0PhoOA
   oLXu3aSuk510Xgzkij7zNjVL2AZX9TEbjJWqwAsYn8Md9rS1l36wn8H/j
   +lHcTtEKz4pA5JdSNSk3/Obi+PDKytjZKMac3N+mNXrSS590lUgzI31CK
   A==;
X-CSE-ConnectionGUID: 0Le//67mQ66g0o7g464gbg==
X-CSE-MsgGUID: 93PWu+HiTxyfJDMzlkzzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="100544194"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="100544194"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:31:50 -0700
X-CSE-ConnectionGUID: APToZZz8QyqUltB7Gd0c8A==
X-CSE-MsgGUID: OgdToWsJTv6B1ZVsePRD+g==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 04:31:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 04:31:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 04:31:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 04:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPSLyeccWvkADe38U/Cl4ZB/ldPYwtTvyQFRFqMiDpjnpyth+ig1SyZR4xrLUT+lMeBkf4k60APvpUJp2v5Kt+6rnzaZ07yrqclnV3dy/RHDMATL2pjlTGh25svpLqLweJK2vd2IKL/xU/V3HtA5Jj7jqxHX/hZ74+qr2mGx4Tpt+bRWNHviga7zDy09OGla1/rel6xlPv0GnbPxrZ2Zmhd97Kg0BA3M+jZV53Ex0tsFXM4lDjN7ooR4B8DuZxAbOuqfGqcO/TZUBnrLRXVe/8Dk6ACKJSGkyR1ZpdkBXxGkMmknxyXt0bu+omA2OVxlqYbRQyFryaPMpDuSf5kxbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTOks4Ib7foLu1ZFwpthfHLnMJHNKh2PhDSf7HWbgEU=;
 b=YkuxoPzxDwekZwEC1HIlwtdeV+Jk36A9o8j3SfYvlXoIlDLa+7AAu2Mu8EuXExMhBbnQalmNHwjymI2+lcz2Fam9uwAmorB8P0QM5P0PO1m6VRjyZDPAmK03uIzEUR4gUi7lpwkaU4adP8xrELdwwOcHmbA/o2WmxyHOsCzrDOPbNNlkaDgNjc9VXIKfY5necxs/nWiYWRYsFh6d8Zn1cSGsdIPZIdxqCVog0DjzYZGnKvSH+S7FeZRL8a0Anobd8TjFWD6XlqlG+bmpbgsj7OHMX6msODPQ7fxP/kLRJLfQSF5Emrd/EGCGhK/l0py47q1rK94aXXXCab4Glyuf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA3PR11MB7584.namprd11.prod.outlook.com (2603:10b6:806:305::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Fri, 20 Mar
 2026 11:31:40 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 11:31:40 +0000
Message-ID: <d3e54adc-46b4-4ece-ad75-fc184f0b111d@intel.com>
Date: Fri, 20 Mar 2026 13:31:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] mmc: sdhci-of-k1: add regulator and pinctrl
 voltage switching support
To: Iker Pedrosa <ikerpedrosam@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan
	<dlan@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Anand Moon
	<linux.amoon@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-2-aefd3b7832df@gmail.com>
 <182321ef-f01e-4bc8-8f23-aa85b4c70860@intel.com>
 <CABdCQ=ODJyeC4Lb_XFxHaxQpem0F3v=tw+5CipCHFU8T5zr8Ww@mail.gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <CABdCQ=ODJyeC4Lb_XFxHaxQpem0F3v=tw+5CipCHFU8T5zr8Ww@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0120.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::18) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA3PR11MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: cb0dcfaf-25d9-4e11-a83c-08de8674412b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: ylxGBb6sbFxYkPnVnwoCt1yf//bqiQmEbl9CA8qT7lCT2MxRxSn1Cri+XgOIgPDQom5hpQCk29t8hcWG9/ckV66rpC0JqlAPdxLp1iF1W9bCE+0Y0zS1GeV08TTglMqAbtO//kKaOV6QDMIIHVPLJDFHVzUfqlv+6R4btokYqxwTSrumXz9HvRRktFKYrlm2Ajmq6s62eeoq62PuLRlQEy3Xuhfr3kyZJk27k2VQaZjbDiA2lNsQRFHSv7mTa4iPsQGh9ELJA9mHPLHJLYWlM79lMMcFAI8qbq/Mcqx2zBhL8iFibA/aw8p//Qv1bBdh89jLGujEkZI19TWN5mfcYiWyaj3kCzDQ1AQ+WrVb1IOnt+ZYyg2wEz9hcX4OPO/NZfNIBfXvH5Ay0h5LGoCnnSBF/TOuZ+BEd3n9FxfFLBdqbGTYKtax1h/fI1oHokGvtxevUzGwRH1nJuuQh8s5WXUubCr3HcZNG9DT48Dk3CPBsPmT5eKeQQXYOEvwhxWkZrgJ6goVkIleNW188UDfyaURsmQAw3lRK5GY9UP7Ks2lPimfuhoUlWLcbcvkS78aS+1fa/0f4ZAJXLqOvIijy/5AvmwY0wd8zZ1ZSySBcyPPbS+AsYi6L47jIncrinZqqKn4mtM99HRtf1eVxfk7ECG0++Ei8MSfOkryOQPOxU6KaNOKUr/p0FNzvK2NqMyXgTrSrQ2iTNjKLs/sqkq7tXCwOBdpcqcMbK4Vyc8SphE0SDF08/Mff/UZhNa/kvGN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkRrb242WG1oTVNpUmttanFyVWxYY2Zpc05EOFV4dEV4VnhsYkZNbk1zN0Uv?=
 =?utf-8?B?WXlxOHBIQUh3cm56RnNaWEp5dUtObnNtazNTSzAzS3RYeDZMaVNRUVZZMC8y?=
 =?utf-8?B?c0tXYktXUkg2OXYyR2dJekFoS1U2eHdBMlVvTTJoZzRWOFVBZnNoQlZjTExk?=
 =?utf-8?B?bWRSNTJuLzRKSW5YMVd0cHpINlhCNGVlbUVscWNNVXkxelplanYyYTNOS3NF?=
 =?utf-8?B?UVBVNURpdDlNUGtMWlEweFhHSHlzUWNES1N6TUtuNDlNRWhobmwvamtoQVBB?=
 =?utf-8?B?alpERUZCSHVLS28zSVhzUU5jdWdlZUd4ZTJqMWg1Y2xmTzRVVE5ZeVNPYkFH?=
 =?utf-8?B?ZzlXazBxOFhzeld1S3RPSU1WMDRNWkFxS3dNemtiU2xrYTkrNk10VDl0eUtC?=
 =?utf-8?B?YXUycXgyRVRnOTdrMkg0NlloSFdscWpreGVZcitDQ01vSzRzbW9QdUlCc3ZM?=
 =?utf-8?B?cDI0TTMwcDBmZ0svUlNCY0ZKR3VMemt0aG9yT1R1TTNNdFQ3WkdEUlAwaGRu?=
 =?utf-8?B?cmwvTnVvM0Jqa2FFT3hzUGxBNnZidTdRaDdQclEzS2IreFNLOTBXUUhkVkdl?=
 =?utf-8?B?RXpvelRxdG94WEIxYWdzeUdMOXhTSm9WellaZzVIVzYxOUFyT1NkS1pHeHJw?=
 =?utf-8?B?Z1RNVFJjbW9rc2Q0UFJkb3dxcEhwUFJTMVJCbmNZdmtwcFhoeGZjYXNoUjFl?=
 =?utf-8?B?YzkyZEltbnlld3NqTFpkanZ4Rk9vRkdxeW9UWi9UQTZiajhZYVFNaXM4dUtK?=
 =?utf-8?B?ekFuV2NxL3Y1eUlKSTQ1Y0lnVFRrWm84eXdFeXdRYTBqRElGaVFQaitqVE9V?=
 =?utf-8?B?OHNEemFQRlVGcUMrS1pBM2VyTTFwaDVLYm02VWk3a2Ryb3RRSVZQeUNlVHVz?=
 =?utf-8?B?SUFONEZXdTY2K3hwZS91WGx0MlVjWmVka2EyWVAvVXdiQUdIdlVKK1l4Wk9l?=
 =?utf-8?B?RHFHYXEwZmJiRkdoUFFyazJSRnR0akZtRXZHeVRZY2xiUU9rVzJjQndnZW1C?=
 =?utf-8?B?dGNxOVNkMUZWWDlTTEM1aWppd1dNdGhHd1lsWnRCNUJqQVRRNUg1ZmJvL0Ja?=
 =?utf-8?B?blNIczZQR0ZQRDB1R0lsLzBDeXY5T28wK210WTFTRis3ZkU2WWhMbzUyd1Nl?=
 =?utf-8?B?V21FdXdUUmtPQ2NzVkJ2eGZjSjRxbE5rdWNsdG1xVGFaS20wR3NxT0oyS1hM?=
 =?utf-8?B?RXg5VGNvRVVqNjVIU3lYVE9meTZ6dEcvWjFtUHpMNy82djM3aXFSSkJTZEls?=
 =?utf-8?B?WGZmVzhBOG5HNVJQTEJXakdSckxZYXZXU2VYZ1RCSWZQVDVuamNPK2xtK01h?=
 =?utf-8?B?L3dXUFB1M0hHQkV5bTJvZjZ1SGpKdmVoaDU3c0FsbmVFVUx0cGVwZVpWRjla?=
 =?utf-8?B?Ukc4L3M2RUF6eDVwU29NV2YzRDVJVmZwQmNWWm9lakpLRzhXOEdKUHU1VCsv?=
 =?utf-8?B?OTFVTmFLc2ZweFgyL3ZZZ1htUUJDTVF6L3JSL1Zmbno3ZTQraWU3djhNVnN1?=
 =?utf-8?B?VGt4aXl3dmlUMU83Z1RWWHAxNUd2UUp3aXpKYWRuNVNnSkpGdDNEZWJickhX?=
 =?utf-8?B?Q2xnRk9rTjQwRnFKU3JtOFRBa1ROWVptV0h1SUdlSVpMQldtY01ocXowdjlM?=
 =?utf-8?B?R1orekpNZVlMcTRhNHVCTzM0OHB6djhmYlVmVzlFTmRxbmVhZUZrSHNzajBF?=
 =?utf-8?B?bXBMNXRod2tPRUh3LzZNMk4zQVFyN3VLL25XZDJUdTMvTWdsZHh0cEQ3VExM?=
 =?utf-8?B?bHVkNTZsbnJwanVadVF2cWx2bE4zek1XdmhwOWpqU3JRVlo3Z2lCWVk1T3hs?=
 =?utf-8?B?Y3RETTk2ZkRLNXNnWjRLeUcxWWhsRXRUdkVWZ2k4UkJGM0xHaVhxdHZrcmxy?=
 =?utf-8?B?b1FmdmpVNUxRWU1JSG95L3VtNkVWNm5yZTFqL0tuck95eHR2NFhKbVM3WDYr?=
 =?utf-8?B?dXJ4b0NGdjRTdkVkNnVxNGxlcnlQaDA1L3ErVjAweWE5cm5iQWhuamdjVTJn?=
 =?utf-8?B?TnNSQnprNmczTkpsS2RnTHVGdTdjRkx3ZHI0cGxDK2Qrd1dsbUxRRnhPMDFr?=
 =?utf-8?B?YXZoL0NWcXk0cDkwT1lwdHFxQ0RNcnJoYUFPNk9pUFdtTllQOUcramhCWjlt?=
 =?utf-8?B?ZUN3aFpRWlFzWVRaL0FmWjcyemFrVkp3UXNyS0d6OFNaMkgyRXhMT0NqcW5I?=
 =?utf-8?B?TWxDYVpkVkpHankyWStPU3U3YmRFOXdMM29WNlRLMzNxQXhlcG5zTFAyVTJm?=
 =?utf-8?B?RGNOa1p3OUFXb2lyRVhxeWh6SmhQTzZyb0ZMNktvVVZ0WVdlWm1NRnUxc0Zu?=
 =?utf-8?B?Z3EvcFF5S1lmTlVhYmVuQXJla1NDaVlPYVRYM2NybG5HK3ZEYmh4bHh4Q2JR?=
 =?utf-8?Q?tkSesuhZWunFBt1g=3D?=
X-Exchange-RoutingPolicyChecked: mcb0/angYaPirLtz+dROTSa8O8J/wvWOUKDa1D3Zn6X3YtfePh1gfMm4DHP7JrephYDKZz/3xwLiZuSUDwoAHy1tpz3kU2OoHYUd2YVFHVcmzZ98QhQQBc2yblJXqFrVticnfiFpLAe6/ZFwjR+ZZomgIu8Gy4ul0ziyiA5ZZ/PBAy5LPDoWtD2X22KM6cUI0PXUyw/8yxCWkrVdgz4YdLzSHicPb7hLV3qrYG9hlV0mdCg48X0iPYazzQlAMFTG+VCvRcdQ9x4JQ0o8ChEfmzDmkYfOUMuhwh01NrxT5TvXb3FYgQh0JMe3978wrFRKj9n7H3XVnf3fZhSGiyjS8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0dcfaf-25d9-4e11-a83c-08de8674412b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 11:31:40.3955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erVSyPFZaZccr0OTUtKnqkLx8P+1+16Ar93BrFHM/2IK6wnjTKZavZzItM2Pr+8q2T4i1T++Y7rQQeu+ykPZxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7584
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_043153_359655_5B94209F 
X-CRM114-Status: GOOD (  20.12  )
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

T24gMjAvMDMvMjAyNiAxMToxNywgSWtlciBQZWRyb3NhIHdyb3RlOgo+IEVsIG1hciwgMTcgbWFy
IDIwMjYgYSBsYXMgMTI6MjgsIEFkcmlhbiBIdW50ZXIKPiAoPGFkcmlhbi5odW50ZXJAaW50ZWwu
Y29tPikgZXNjcmliacOzOgo+Pgo+PiBPbiAxNi8wMy8yMDI2IDE2OjAzLCBJa2VyIFBlZHJvc2Eg
d3JvdGU6Cj4+PiBBZGQgdm9sdGFnZSBzd2l0Y2hpbmcgaW5mcmFzdHJ1Y3R1cmUgZm9yIFVIUy1J
IG1vZGVzIGJ5IGludGVncmF0aW5nIGJvdGgKPj4+IHJlZ3VsYXRvciBmcmFtZXdvcmsgKGZvciBz
dXBwbHkgdm9sdGFnZSBjb250cm9sKSBhbmQgcGluY3RybCBzdGF0ZQo+Pj4gc3dpdGNoaW5nIChm
b3IgcGluIGRyaXZlIHN0cmVuZ3RoIG9wdGltaXphdGlvbikuCj4+Pgo+Pj4gLSBBZGQgcmVndWxh
dG9yIHN1cHBseSBwYXJzaW5nIGFuZCB2b2x0YWdlIHN3aXRjaGluZyBjYWxsYmFjawo+Pj4gLSBB
ZGQgb3B0aW9uYWwgcGluY3RybCBzdGF0ZSBzd2l0Y2hpbmcgYmV0d2VlbiAiZGVmYXVsdCIgKDMu
M1YpIGFuZAo+Pj4gICAic3RhdGVfdWhzIiAoMS44VikgY29uZmlndXJhdGlvbnMKPj4+IC0gRW5h
YmxlIGNvb3JkaW5hdGVkIHZvbHRhZ2UgYW5kIHBpbiBjb25maWd1cmF0aW9uIGNoYW5nZXMgZm9y
IFVIUyBtb2Rlcwo+Pj4KPj4+IFRoaXMgcHJvdmlkZXMgY29tcGxldGUgdm9sdGFnZSBzd2l0Y2hp
bmcgc3VwcG9ydCB3aGlsZSBtYWludGFpbmluZwo+Pj4gYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3
aGVuIHBpbmN0cmwgc3RhdGVzIGFyZSBub3QgZGVmaW5lZC4KPj4+Cj4+PiBUZXN0ZWQtYnk6IEFu
YW5kIE1vb24gPGxpbnV4LmFtb29uQGdtYWlsLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IElrZXIg
UGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gIGRyaXZlcnMvbW1j
L2hvc3Qvc2RoY2ktb2YtazEuYyB8IDU4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYyBiL2RyaXZlcnMvbW1j
L2hvc3Qvc2RoY2ktb2YtazEuYwo+Pj4gaW5kZXggMGRkMDZmYzE5Yjg1NzRhZTFiMDBmN2U1ZDA5
YjdkNGM4N2QwNjc3MC4uMDFhZmRhZGNmNzA3OTY3MDRiMjcyZWU1YTMxNTQzYWZkNWUwMTE4OCAx
MDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYwo+Pj4gKysrIGIv
ZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jCj4+PiBAQCAtMTYsNiArMTYsNyBAQAo+Pj4g
ICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4K
Pj4+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvcGluY3Ry
bC9jb25zdW1lci5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4+
Cj4+PiAgI2luY2x1ZGUgInNkaGNpLmgiCj4+PiBAQCAtNzEsNiArNzIsOSBAQAo+Pj4gIHN0cnVj
dCBzcGFjZW1pdF9zZGhjaV9ob3N0IHsKPj4+ICAgICAgIHN0cnVjdCBjbGsgKmNsa19jb3JlOwo+
Pj4gICAgICAgc3RydWN0IGNsayAqY2xrX2lvOwo+Pj4gKyAgICAgc3RydWN0IHBpbmN0cmwgKnBp
bmN0cmw7Cj4+PiArICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGluY3RybF9kZWZhdWx0Owo+
Pj4gKyAgICAgc3RydWN0IHBpbmN0cmxfc3RhdGUgKnBpbmN0cmxfdWhzOwo+Pj4gIH07Cj4+Pgo+
Pj4gIC8qIEFsbCBoZWxwZXIgZnVuY3Rpb25zIHdpbGwgdXBkYXRlIGNsci9zZXQgd2hpbGUgcHJl
c2VydmUgcmVzdCBiaXRzICovCj4+PiBAQCAtMjE5LDYgKzIyMywzMyBAQCBzdGF0aWMgdm9pZCBz
cGFjZW1pdF9zZGhjaV9wcmVfaHM0MDBfdG9faHMyMDAoc3RydWN0IG1tY19ob3N0ICptbWMpCj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNQQUNFTUlUX1NESENfUEhZX0NUUkxfUkVH
KTsKPj4+ICB9Cj4+Pgo+Pj4gK3N0YXRpYyB2b2lkIHNwYWNlbWl0X3NkaGNpX3ZvbHRhZ2Vfc3dp
dGNoKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0KQo+Pj4gK3sKPj4+ICsgICAgIHN0cnVjdCBzZGhj
aV9wbHRmbV9ob3N0ICpwbHRmbV9ob3N0ID0gc2RoY2lfcHJpdihob3N0KTsKPj4+ICsgICAgIHN0
cnVjdCBzcGFjZW1pdF9zZGhjaV9ob3N0ICpzZGhzdCA9IHNkaGNpX3BsdGZtX3ByaXYocGx0Zm1f
aG9zdCk7Cj4+PiArICAgICBzdHJ1Y3QgbW1jX2lvcyAqaW9zID0gJmhvc3QtPm1tYy0+aW9zOwo+
Pj4gKyAgICAgaW50IHJldDsKPj4+ICsKPj4+ICsgICAgIGlmICghc2Roc3QtPnBpbmN0cmwpCj4+
PiArICAgICAgICAgICAgIHJldHVybjsKPj4+ICsKPj4+ICsgICAgIGlmIChpb3MtPnNpZ25hbF92
b2x0YWdlICE9IE1NQ19TSUdOQUxfVk9MVEFHRV8xODApIHsKPj4+ICsgICAgICAgICAgICAgZGV2
X3dhcm4obW1jX2Rldihob3N0LT5tbWMpLCAidW5zdXBwb3J0ZWQgdm9sdGFnZSAlZFxuIiwKPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgaW9zLT5zaWduYWxfdm9sdGFnZSk7Cj4+PiArICAgICAg
ICAgICAgIHJldHVybjsKPj4+ICsgICAgIH0KPj4KPj4gSW4gVjIsIEkgcHV0ICItPnZvbHRhZ2Vf
c3dpdGNoKCkgaXMgY2FsbGVkIG9ubHkgZm9yCj4+IGlvcy0+c2lnbmFsX3ZvbHRhZ2UgPT0gTU1D
X1NJR05BTF9WT0xUQUdFXzE4MCIgYnkKPj4gd2hpY2ggSSBtZWFudCB0aGF0IGl0IGRvZXMgbm90
IGFsbG93IHRoZSBkcml2ZXIgdG8KPj4gc3dpdGNoIHBpbiBzdGF0ZSBiYWNrIGZvciAzLjNWLgo+
Pgo+PiBTbyB5b3UgcHJvYmFibHkgbmVlZCBhbiBhcHByb2FjaCBzaW1pbGFyIHRvIHRoZSBvcmln
aW5hbAo+PiBzcGFjZW1pdF9zZGhjaV9zdGFydF9zaWduYWxfdm9sdGFnZV9zd2l0Y2goKSBpbjoK
Pj4KPj4gICAgICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbWMvMjAyNjAzMDIt
b3JhbmdlcGktc2QtY2FyZC11aHMtdjEtNC04OWMyMTk5NzNjMGNAZ21haWwuY29tLwo+IAo+IFRo
YW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLiBJIHdhbnQgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFu
ZCB0aGlzCj4gcG9pbnQgY29ycmVjdGx5IHRvIGF2b2lkIGdvaW5nIGluIGNpcmNsZXMuCj4gCj4g
SW4gdGhlIHYyIGZlZWRiYWNrICwgeW91IG1lbnRpb25lZCB0aGF0ICItPnZvbHRhZ2Vfc3dpdGNo
KCkgaXMgY2FsbGVkCj4gb25seSBmb3IgaW9zLT5zaWduYWxfdm9sdGFnZSA9PSBNTUNfU0lHTkFM
X1ZPTFRBR0VfMTgwIiwgd2hpY2ggSQo+IHVuZGVyc3Rvb2QgdG8gbWVhbiB0aGF0IHRoaXMgY2Fs
bGJhY2sgb25seSBuZWVkcyB0byBoYW5kbGUgc3dpdGNoaW5nCj4gdG8gMS44Vi4gVGhpcyBtZWFu
dCB0aGF0IHRoZSBjaGFuZ2VzIEkgaW50cm9kdWNlZCBmb3IgdjMgZG9uJ3QgbWFuYWdlCj4gdGhl
IHN3aXRjaGluZyB0byAzLjNWLgo+IAo+IENhbiB5b3UgY2xhcmlmeSBpZiBJIHNob3VsZCBJIHJl
dmVydCB0byBpbXBsZW1lbnRpbmcKPiAiLT5zdGFydF9zaWduYWxfdm9sdGFnZV9zd2l0Y2goKSIg
aW5zdGVhZCwgd2hpY2ggd291bGQgaGFuZGxlIGJvdGgKPiAxLjhWIGFuZCAzLjNWIGNhc2VzPyAK
ClllcwoKT3IgaXMgdGhlcmUgYSB3YXkgdG8gbWFrZSB0aGUKPiAiLT52b2x0YWdlX3N3aXRjaCgp
IiBhcHByb2FjaCB3b3JrIHByb3Blcmx5IGZvciBib3RoIGRpcmVjdGlvbnM/Cj4gCj4+Cj4+PiAr
Cj4+PiArICAgICBpZiAoc2Roc3QtPnBpbmN0cmxfdWhzKSB7Cj4+PiArICAgICAgICAgICAgIHJl
dCA9IHBpbmN0cmxfc2VsZWN0X3N0YXRlKHNkaHN0LT5waW5jdHJsLCBzZGhzdC0+cGluY3RybF91
aHMpOwo+Pj4gKyAgICAgICAgICAgICBpZiAocmV0KSB7Cj4+PiArICAgICAgICAgICAgICAgICAg
ICAgZGV2X3dhcm4obW1jX2Rldihob3N0LT5tbWMpLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJmYWlsZWQgdG8gc2VsZWN0IFVIUyBwaW5jdHJsIHN0YXRlOiAlZFxuIiwgcmV0
KTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4+PiArICAgICAgICAgICAgIH0K
Pj4+ICsgICAgICAgICAgICAgZGV2X2RiZyhtbWNfZGV2KGhvc3QtPm1tYyksICJzd2l0Y2hlZCB0
byBVSFMgcGluY3RybCBzdGF0ZVxuIik7Cj4+PiArICAgICB9Cj4+PiArfQo+Pj4gKwo+Pj4gIHN0
YXRpYyBpbmxpbmUgaW50IHNwYWNlbWl0X3NkaGNpX2dldF9jbG9ja3Moc3RydWN0IGRldmljZSAq
ZGV2LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHNkaGNpX3BsdGZtX2hvc3QgKnBsdGZtX2hvc3QpCj4+PiAgewo+Pj4gQEAgLTI1MiwxMiArMjgz
LDM3IEBAIHN0YXRpYyBpbmxpbmUgaW50IHNwYWNlbWl0X3NkaGNpX2dldF9yZXNldHMoc3RydWN0
IGRldmljZSAqZGV2KQo+Pj4gICAgICAgcmV0dXJuIDA7Cj4+PiAgfQo+Pj4KPj4+ICtzdGF0aWMg
aW5saW5lIHZvaWQgc3BhY2VtaXRfc2RoY2lfZ2V0X3BpbnMoc3RydWN0IGRldmljZSAqZGV2LAo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNkaGNp
X3BsdGZtX2hvc3QgKnBsdGZtX2hvc3QpCj4+PiArewo+Pj4gKyAgICAgc3RydWN0IHNwYWNlbWl0
X3NkaGNpX2hvc3QgKnNkaHN0ID0gc2RoY2lfcGx0Zm1fcHJpdihwbHRmbV9ob3N0KTsKPj4+ICsK
Pj4+ICsgICAgIHNkaHN0LT5waW5jdHJsID0gZGV2bV9waW5jdHJsX2dldChkZXYpOwo+Pj4gKyAg
ICAgaWYgKElTX0VSUihzZGhzdC0+cGluY3RybCkpIHsKPj4+ICsgICAgICAgICAgICAgc2Roc3Qt
PnBpbmN0cmwgPSBOVUxMOwo+Pj4gKyAgICAgICAgICAgICBkZXZfZGJnKGRldiwgInBpbmN0cmwg
bm90IGF2YWlsYWJsZSwgdm9sdGFnZSBzd2l0Y2hpbmcgd2lsbCB3b3JrIHdpdGhvdXQgaXRcbiIp
Owo+Pj4gKyAgICAgICAgICAgICByZXR1cm47Cj4+PiArICAgICB9Cj4+PiArCj4+PiArICAgICBz
ZGhzdC0+cGluY3RybF9kZWZhdWx0ID0gcGluY3RybF9sb29rdXBfc3RhdGUoc2Roc3QtPnBpbmN0
cmwsICJkZWZhdWx0Iik7Cj4+PiArICAgICBpZiAoSVNfRVJSKHNkaHN0LT5waW5jdHJsX2RlZmF1
bHQpKQo+Pj4gKyAgICAgICAgICAgICBzZGhzdC0+cGluY3RybF9kZWZhdWx0ID0gTlVMTDsKPj4+
ICsKPj4+ICsgICAgIHNkaHN0LT5waW5jdHJsX3VocyA9IHBpbmN0cmxfbG9va3VwX3N0YXRlKHNk
aHN0LT5waW5jdHJsLCAic3RhdGVfdWhzIik7Cj4+PiArICAgICBpZiAoSVNfRVJSKHNkaHN0LT5w
aW5jdHJsX3VocykpCj4+PiArICAgICAgICAgICAgIHNkaHN0LT5waW5jdHJsX3VocyA9IE5VTEw7
Cj4+PiArCj4+PiArICAgICBkZXZfZGJnKGRldiwgInBpbmN0cmwgc2V0dXA6IGRlZmF1bHQ9JXAs
IHVocz0lcFxuIiwKPj4+ICsgICAgICAgICAgICAgc2Roc3QtPnBpbmN0cmxfZGVmYXVsdCwgc2Ro
c3QtPnBpbmN0cmxfdWhzKTsKPj4+ICt9Cj4+PiArCj4+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
ZGhjaV9vcHMgc3BhY2VtaXRfc2RoY2lfb3BzID0gewo+Pj4gICAgICAgLmdldF9tYXhfY2xvY2sg
ICAgICAgICAgPSBzcGFjZW1pdF9zZGhjaV9jbGtfZ2V0X21heF9jbG9jaywKPj4+ICAgICAgIC5y
ZXNldCAgICAgICAgICAgICAgICAgID0gc3BhY2VtaXRfc2RoY2lfcmVzZXQsCj4+PiAgICAgICAu
c2V0X2J1c193aWR0aCAgICAgICAgICA9IHNkaGNpX3NldF9idXNfd2lkdGgsCj4+PiAgICAgICAu
c2V0X2Nsb2NrICAgICAgICAgICAgICA9IHNwYWNlbWl0X3NkaGNpX3NldF9jbG9jaywKPj4+ICAg
ICAgIC5zZXRfdWhzX3NpZ25hbGluZyAgICAgID0gc3BhY2VtaXRfc2RoY2lfc2V0X3Voc19zaWdu
YWxpbmcsCj4+PiArICAgICAudm9sdGFnZV9zd2l0Y2ggICAgICAgICA9IHNwYWNlbWl0X3NkaGNp
X3ZvbHRhZ2Vfc3dpdGNoLAo+Pj4gIH07Cj4+Pgo+Pj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2Ro
Y2lfcGx0Zm1fZGF0YSBzcGFjZW1pdF9zZGhjaV9rMV9wZGF0YSA9IHsKPj4+IEBAIC0zMjQsNiAr
MzgwLDggQEAgc3RhdGljIGludCBzcGFjZW1pdF9zZGhjaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQo+Pj4KPj4+ICAgICAgIGhvc3QtPm1tYy0+Y2FwcyB8PSBNTUNfQ0FQX05F
RURfUlNQX0JVU1k7Cj4+Pgo+Pj4gKyAgICAgc3BhY2VtaXRfc2RoY2lfZ2V0X3BpbnMoZGV2LCBw
bHRmbV9ob3N0KTsKPj4+ICsKPj4+ICAgICAgIHJldCA9IHNwYWNlbWl0X3NkaGNpX2dldF9jbG9j
a3MoZGV2LCBwbHRmbV9ob3N0KTsKPj4+ICAgICAgIGlmIChyZXQpCj4+PiAgICAgICAgICAgICAg
IGdvdG8gZXJyX3BsdGZtOwo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
