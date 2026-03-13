Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38298105F7A8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sqSepTPF96fJHKAiaFGZuLeh+Q/li/wKzEC6GKXc4wU=; b=iKhwa99//dB675W2jm/VPiXE1d
	1PSWVaSFiMPt8hC5WPFc15er55dz+1tODTDFdHyRFVLAJBQGiHuxEyAAFvTRN9S7Xp5oJ0Xfj2hky
	dbl888AtKM+3H2PiIxUk1dhPpG1RNelh9jiB3yl64Ej9q4+MqWbk4t4S16GwRJUz2WaU0ti86hx1c
	PtCVVXXeOsy13Bm+vpyIv58TfkeF4FtNw868bFcEBEL2LWV9Ej9HqrToR4YKtPCBCFtGy895/WNwk
	qCChIcCem8EmS4lrxOxbAEpnViympGQUynGHIHiphqER0rl8ufZoQ2TM6FMApNNvNcaP/BqzYMrY9
	xwU18BaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12CG-00000000Abo-43gA;
	Fri, 13 Mar 2026 13:04:56 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12CE-00000000AZx-2Zyn
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773407095; x=1804943095;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FWbMzhbaqpaBUtdoOFrWMcEftoAWXCmZVDsRdmquZns=;
  b=TJp8oclHGuBu4rTh9KXHRaLNEHRWICK9LM3vAZ5UMrwiNgtcAWsjkJnG
   NmqxADGD6tgvqLRdrQCTqNRD52JCEblonrzfbamSw2u7Gi/G2d1hsHChV
   NIOGRQoh4d6z4NYt0nZ2UCEk4NzNk0Q6OWRPUIji0j96P+H5doDFbjaUc
   cmbNO+KUADqVSSfS3+8pPqPGcXCZyfIfqT42pBxGkYH4BgRbVGw29y5lP
   4M+PvPGc2xq5/Q8Qkrem284sD69Pdkb05F2dpFuti1IyyfUo+63U/kjr2
   q1XNDbsHbboMQbMNFWLo3dmgk++UVUrauEO7u4ncNwMj1uMQpa6vqnzBR
   Q==;
X-CSE-ConnectionGUID: ZnP2YsUTS6+aXQ83pRMHYg==
X-CSE-MsgGUID: 6faO7eTLTPWgRzCWbJ1BmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74550124"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74550124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 06:04:54 -0700
X-CSE-ConnectionGUID: 8xlrADTUQsmld6/sLgIbgw==
X-CSE-MsgGUID: 2/By/RPmQ7GI7EYYq/6Amw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="259051415"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 06:04:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 06:04:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 13 Mar 2026 06:04:52 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 13 Mar 2026 06:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROqyEgve7Z7gVztHak7cTjflp7VQEir4gsGr8+Px8IDvlRB0/csq3Bqy18Jyea6/f3ZGMQq51g50gklvA3TRI1ZmI5054MiunRo3hRD2vOe4lgtyDNZqQhK/BH9NPqlhucqLmQiPj19hE0GqtfMplskiY1o9raJ1x480YUWodNLIG6kTfeFeYiUkex3clxPx6WyXJw9OWJM6JmQpuvbqrb/953RciTOMWjnQKCimjt77zuUDew93Xo3VLDRS/eheRHRLEM/o1Tk2F4HmAq7YsqS1wxjFRQBUpFQUj0O0vcj/9Hx0GgqAGiwCHhItqT4wLvK3RdjcuPcblaoHC9GYhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QC769X9RtLhNDx+m8rhvHvWaQJrUX4B9d13Fc3sv9lY=;
 b=T6elsr8jj/UO++KhIl3ZlVRHpyAM/+AT8ftYNUTAIMTIgq1c4yz0Rv0wwH2toAxH1M5ejfZ1IkS4blgs4cJ5PgegmpfVC7aOiMm+rBvpDm6B2MiRt1/0fpgmmmQ0Ox1XL5SuYFbyK6eOIYkEKxwgqDp4ORpBGaj36MQii5GBXSoVyOSlhdVU5gIMTzRkxsWHmEkvX2Cdoeqz6U8zL2knFqVsf0V52b+hrs9RW6cd6ktZB3fudKG7EQpGg2JfubJqKlL+yF/8mAtmy9Ow+46uDjLwIX0nDnUqoZ7p5PnCKuN7gjqnAQmycGpiYaNBi+AoczGT7RZmi4oqQWJ2Jc6X6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 13:04:49 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 13:04:49 +0000
Message-ID: <6d983739-6455-4ba7-a530-95ab8c2dbc18@intel.com>
Date: Fri, 13 Mar 2026 15:04:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mmc: sdhci-of-k1: add SDR tuning infrastructure
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan
	<dlan@kernel.org>
CC: Michael Opdenacker <michael.opdenacker@rootcommit.com>, "Javier Martinez
 Canillas" <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-3-5bb2b574df5d@gmail.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-3-5bb2b574df5d@gmail.com>
X-ClientProxiedBy: DB9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c07392-4049-4c1d-9782-08de81011b6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info: pJd/yPdUhrRIQOXfI2SOpqPzHuMaR6efsBzeZnwqBRpQnVuJ+g2Rm1BMrb2bvPLjaaIG6K6p3qCuEoa+xzB5R0bCvxzd60Ca9/aMkRvPua4WL9VY2y08yJzm7Fn01M0jY+3m1QnSzwOC6fRxv4SrsaHrSD4tPHcz3m1edj6NEq3q8gv9aa1rURlbTvBV99JjEZpgCQm/NjGEpbQdEHWY8N7zY9fbNNjaOQ7ITmBM97ubIVETp608yt417T3SWIOBFJniAG4PUwTF2HKbZE87TKNEwrjiJmOEaMEMqXnSzIkPGN+/7qhidKWiDHRGGy7NI2692Y2jcMu/+KThsOU1zQLCq5KuFhDHVP+2J/8fiEg68PhxHoEdcMwfzcZ04PCH29LpliGK/1l8cdGO34s8+Ulh01igFuj1w7deRhX76eqyDV//XDlpbTrMeC3rUC8DaSxLuSi7fEbzs8RUJ9t23xHWBT/OPBegD6c4gnIRLkk9Nx4aQsLV4+q+RP+Row+B0PGXSTgbOLWzVzc/YOA3wB47ZJKCxiPhU3ZKTjQuS5WwlEi1X3ltT+kxPn975NkIR44Eh8NtZ7Y39eAsJXZXNHjgDgvvIvz6bn71+spBLVi1YJ5YCZSSOoAbcDn7WSpc2ALpBSahKwOgxycxrWm4Q5t/HD33/bGsmWXIZFJvstx2ClaHtdp7WoNNJCkATCsZS3yRngOpXqwYEBmtL44HC5dScXlNdSxxd3DzQzFSttPNLygarhdQhVeN9seQIHzj1jcTmgUAkT/8xDYFtaehbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG1LTGtrSDNudzlCNEo4UDI2Ymo3eG5qRGFhME5Dd3JPZlgydWQ2WmVCTnc3?=
 =?utf-8?B?ZG1aZHZIdWdJNWw4eHZiS2l5dzdnWmpaT3I5WlU4elZFQnhDNW5SVmxZQy9t?=
 =?utf-8?B?UlBKNmUxUVlKYVpFN2JUQ1J5S20yaFloNnhFNjhDVWZsM0ViSjVHRE5YVlRt?=
 =?utf-8?B?dEpQREtjN0dramcrWTA1NkswM3RFa0JpR2h6WWd0dDYyZnpXaStBUERMRDZa?=
 =?utf-8?B?bS9aS3R3d2ppZjRONVFoMkNiSk44czRwYi9DZkZnRlAwQU9SSUxnNi9XTktv?=
 =?utf-8?B?a2hTcXhzYTFsMk1iMkV6M011MVlnOHh3QWFNS2tDZ3dwUmZscmszZXNaVDQr?=
 =?utf-8?B?cVFFTUhFVlRKVTRJZm1pc3Z1MXNJR0xQTjlpaE43MVBrZXFkYktsN0xiOSs2?=
 =?utf-8?B?WkZOWDBSWTU3M1hUQVBoYzZMUlJBamk0YmZpdWx1TTUvSTE2OVZ4Z2pwNmRC?=
 =?utf-8?B?cmVOaFpIODlTK2hueVlMREV0Ti9yZ0VLVlpEYkVFRzhvbHcvOVE2SWNpbk84?=
 =?utf-8?B?VDM4MjR6VlkwRVk0elV6RGFwa1R1NXFTYnF5UTVGM2FsNkMweDQyNVNRdmow?=
 =?utf-8?B?Q0ZyWmpFcSs1MVJqKzdxTUdOdnc1Y0RZSVUxeXZ3MEtQNEVCcTYyV1pZUktF?=
 =?utf-8?B?SXo1VEZHTUxhQzU4SkU0d0NDSk0vWUwwTzBYYzZoNHN0OFB6WUNZdXpDRXgy?=
 =?utf-8?B?ZmhJRHZjNFBwTjQweWxZTU1Wc0w2dTRmWHJEckJWcUFtSkQxMFp4dXlUWVhu?=
 =?utf-8?B?T09raXRCRzlucUNVSVFSdklIZWJvSEdoTjNwaUdTSmxLNDlKYkoxK0NOcnNv?=
 =?utf-8?B?TjZnRDZwL3BZMW8wcm9BMVJDVjRnaHNxMHB6Qlk0L21xUnRnKzFMaDhSazJo?=
 =?utf-8?B?STBZU2w4NFl5UkFQajZzVGh5MlNoYlhKb1A3TzQybUJTRndyUG5aNXVnck1x?=
 =?utf-8?B?Ri9Kdk9hWk9qTjU5RkNEM1VoRUl4RjZkT2ZRQkJQNm1QcTc3eGJRYkxwaDg0?=
 =?utf-8?B?TUFxWlplWW1SenRJZTJhNU9kNmJKYy9Yb3ZGaXlmbkphV09XWk94U3dVcFpB?=
 =?utf-8?B?c2QvZEpFSURWS0l2MFBERFJOY2NoaE9LWnd4VkZDZ0hxVG5UZzJXRWduQi9j?=
 =?utf-8?B?WjhNMi9ycStIdGpwaFFicDdwdjJQa1lXRWR1UU14TDlLOEVZZEhWMkZKeXZJ?=
 =?utf-8?B?b3dEemQzc0l5ZDdqQUx1bmpWdmlTbzcrVEJoS0NuaTN0bm1weWNRVkpyQjJE?=
 =?utf-8?B?RWhYRElMTHRBcGJ1UGMwUXVXQVFEVHpoWDQ0Zm1PVllSWFBhZnQwdDRjak80?=
 =?utf-8?B?QW40Wll6SFdhOE56bVZOV0FvQ1QwRTYybWt4TzQ1YVBqaW9jc2ZSaWh3TlhE?=
 =?utf-8?B?d3VqdTltMWtESm00WDZjeklZcXAyUTdZYy9nODBjbWM0ejNHaHVVd1FSMjVP?=
 =?utf-8?B?Wk1kWVJWdUQvVnlSVmVXUnNtVitDY2x2T0RIR1JTRXlYQ2ZRcmxHR1prclVl?=
 =?utf-8?B?eTl4eFVmYzFCa2xpenZtVVkxMDRBR09oaWpxbktUaVMwQnkvYXAwc0g4Umpy?=
 =?utf-8?B?SjdWMGpORmpnT0dVNURLc3ozeVRTNVdmRGYrZ1JkUGs1Vm9kR2Fuem91ZS9F?=
 =?utf-8?B?Qkc1VVBMS3crZ1puREF5dGk0NXE2dFo1eVFwMWZSRStDR05tWTR3QTk3aUNy?=
 =?utf-8?B?UGw0bkJCci9jbFdZNVcybVFuVkdqZFBMUk84YTNrVGMvQmhwcXRUTjhvdmFw?=
 =?utf-8?B?Vy9uZkk4dHJUREJrZDdJVFVvUFN4ZWlibUN5QytpWTVaOW42b01GcU11aFIz?=
 =?utf-8?B?SHE4b0dhMHE1Q1dnZWxhMWwzNkYvYzBPZmJ6aXBMdEtHUDF1UTZBam9COVBP?=
 =?utf-8?B?blZQajlyZWlYNGNhN0orZU5vRjhYajEzRk9ZYjU4dnlQRFFEQlQxZzEvN093?=
 =?utf-8?B?SmlFd1loTFhqcGoyV2p0N01vRCtVTmZ1ZTdNQ1FDeER6VUl3b2IzK3N3Qk5o?=
 =?utf-8?B?RXlRN0FxOFNwVDNKei9PV210T2RNSFB4VHJIRUlmUUJYdlgwVEdEOTcwYkMx?=
 =?utf-8?B?L056RXJRNmtiSWNBMU1FQkY0SjBwdHBSM0hQckV0aXRIVU5BQnplZWkvNHg0?=
 =?utf-8?B?Wm9nRW5KUyt6ZzFDNVgrUHNkaVhNS0lLNmhibUJUaVErdCtwVDVUTTRiL2tp?=
 =?utf-8?B?Y1BYT0tJY1lvSXlPcTYxb2JZMmt4VlJoeWdpNmdPekJDOVlsQnFQMFpxNlhj?=
 =?utf-8?B?NUtEZzQvbEtHcnIxMWZueGxZOHFDMzE1Q3c3M2RjbExmUjJFZWxSNTRTaGZJ?=
 =?utf-8?B?NmFZNkJ6dCtuSi9UTVFsQWdQMjN1dkVZVjRReVZ0S1RrQ0JJU0VPN3NtM0FO?=
 =?utf-8?Q?b5wLq3OUXR1JKSxs=3D?=
X-Exchange-RoutingPolicyChecked: W8pS+EHEJD5iRTY/hivxUu0AbEiaCezv/6aHC2iljgIoUKOnl36j4AdjPtv7RfFW7KQcOZ0WKPP+RxACf60BFAxykLIID7LuTj/ePlvNAVXrOA+8zcauCh3bNYbZnDgYOQnKyhsnJNVH/w9qsrXmU9QeTMdM+hfzTAlW/8oAh5AwgI1HXTXju6irFLrGhIDtaHKyqSk3RPBn+CVtg1W0c0rALJDx4U1MkN+9XwwoyYEux6hDgSs3DEsurZYl+nt9b+6/nFW50CAbf3tJshT8GtclBF+Ez716JE2SPkMDkYzLTC9JCh81g42P3wFnxDn9OdCzcsz1b/YxFDLxVvrWbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c07392-4049-4c1d-9782-08de81011b6a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 13:04:49.4817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlySE1ZpcgtzORF1nb5R6KjDHlc7f7KCvI+e8SWpcpYyuOMeoA6N5u7/Ekxkt1UQQjsvE5CWzTAfaz1DINxr2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_060454_726897_D78E27B8 
X-CRM114-Status: GOOD (  13.83  )
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

T24gMDkvMDMvMjAyNiAxMzo0MCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+IEFkZCByZWdpc3RlciBk
ZWZpbml0aW9ucyBhbmQgZGVsYXkgbGluZSBjb250cm9sIGZ1bmN0aW9ucyB0byBwcmVwYXJlIGZv
cgo+IFNEUjUwL1NEUjEwNCB0dW5pbmcgc3VwcG9ydDoKPiAKPiAtIEFkZCB0dW5pbmcgcmVnaXN0
ZXIgZGVmaW5pdGlvbnMgKFJYX0NGRywgRExJTkVfQ1RSTCwgRExJTkVfQ0ZHKQo+IC0gQWRkIGRl
bGF5IGxpbmUgY29udHJvbCBoZWxwZXIgZnVuY3Rpb25zCj4gLSBBZGQgdHVuaW5nIHByZXBhcmF0
aW9uIGZ1bmN0aW9uCj4gCj4gVGhpcyBpbmZyYXN0cnVjdHVyZSBwcmVwYXJlcyBmb3IgaW1wbGVt
ZW50aW5nIHRoZSBTRFIgdHVuaW5nIGFsZ29yaXRobQo+IHdoaWxlIG1haW50YWluaW5nIGFsbCBl
eGlzdGluZyBmdW5jdGlvbmFsaXR5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElrZXIgUGVkcm9zYSA8
aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1v
Zi1rMS5jIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEuYyBiL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEu
Ywo+IGluZGV4IDhhZjExN2E4ZTI3MWMwNGE4MGQ4ZGM3YmI1Y2UxMjA3NTY1MmRkN2EuLjc5Y2I3
YzhkMGI2ZDljNDIwNmJmMDE3MjE2NTFjOGVmZThhMTczYzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1v
Zi1rMS5jCj4gQEAgLTY4LDYgKzY4LDIzIEBACj4gICNkZWZpbmUgIFNESENfUEhZX0RSSVZFX1NF
TAkJR0VOTUFTSygyLCAwKQo+ICAjZGVmaW5lICBTREhDX1JYX0JJQVNfQ1RSTAkJQklUKDUpCj4g
IAo+ICsjZGVmaW5lIFNQQUNFTUlUX1NESENfUlhfQ0ZHX1JFRyAgICAgICAgMHgxMTgKPiArI2Rl
ZmluZSAgU0RIQ19SWF9TRENMS19TRUwwX01BU0sgICAgICAgIEdFTk1BU0soMSwgMCkKPiArI2Rl
ZmluZSAgU0RIQ19SWF9TRENMS19TRUwxX01BU0sgICAgICAgIEdFTk1BU0soMywgMikKPiArI2Rl
ZmluZSAgU0RIQ19SWF9TRENMS19TRUwxICAgICAgICAgICAgIEZJRUxEX1BSRVAoU0RIQ19SWF9T
RENMS19TRUwxX01BU0ssIDEpCj4gKwo+ICsjZGVmaW5lIFNQQUNFTUlUX1NESENfRExJTkVfQ1RS
TF9SRUcgICAgMHgxMzAKPiArI2RlZmluZSAgU0RIQ19ETElORV9QVSAgICAgICAgICAgICAgICAg
IEJJVCgwKQo+ICsjZGVmaW5lICBTREhDX1JYX0RMSU5FX0NPREVfTUFTSyAgICAgICAgR0VOTUFT
SygyMywgMTYpCj4gKyNkZWZpbmUgIFNESENfVFhfRExJTkVfQ09ERV9NQVNLICAgICAgICBHRU5N
QVNLKDMxLCAyNCkKPiArCj4gKyNkZWZpbmUgU1BBQ0VNSVRfU0RIQ19ETElORV9DRkdfUkVHICAg
ICAweDEzNAo+ICsjZGVmaW5lICBTREhDX1JYX0RMSU5FX1JFR19NQVNLICAgICAgICAgR0VOTUFT
Syg3LCAwKQo+ICsjZGVmaW5lICBTREhDX1JYX0RMSU5FX0dBSU4gICAgICAgICAgICAgQklUKDgp
Cj4gKyNkZWZpbmUgIFNESENfVFhfRExJTkVfUkVHX01BU0sgICAgICAgICBHRU5NQVNLKDIzLCAx
NikKPiArCj4gKyNkZWZpbmUgU1BBQ0VNSVRfUlhfRExJTkVfUkVHCQk5Cj4gKwo+ICBzdHJ1Y3Qg
c3BhY2VtaXRfc2RoY2lfaG9zdCB7Cj4gIAlzdHJ1Y3QgY2xrICpjbGtfY29yZTsKPiAgCXN0cnVj
dCBjbGsgKmNsa19pbzsKPiBAQCAtOTUsNiArMTEyLDUwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
cGFjZW1pdF9zZGhjaV9jbHJzZXRiaXRzKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1MzIgY2xy
LCB1Cj4gIAlzZGhjaV93cml0ZWwoaG9zdCwgdmFsLCByZWcpOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
dm9pZCBzcGFjZW1pdF9zZGhjaV9zZXRfcnhfZGVsYXkoc3RydWN0IHNkaGNpX2hvc3QgKmhvc3Qs
IHU4IGRlbGF5KQo+ICt7Cj4gKwlzcGFjZW1pdF9zZGhjaV9jbHJzZXRiaXRzKGhvc3QsIFNESENf
UlhfRExJTkVfQ09ERV9NQVNLLAo+ICsJCQkJICBGSUVMRF9QUkVQKFNESENfUlhfRExJTkVfQ09E
RV9NQVNLLCBkZWxheSksCj4gKwkJCQkgIFNQQUNFTUlUX1NESENfRExJTkVfQ1RSTF9SRUcpOwo+
ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9zZXRfdHhfZGVsYXkoc3RydWN0
IHNkaGNpX2hvc3QgKmhvc3QsIHU4IGRlbGF5KQo+ICt7Cj4gKwlzcGFjZW1pdF9zZGhjaV9jbHJz
ZXRiaXRzKGhvc3QsIFNESENfVFhfRExJTkVfQ09ERV9NQVNLLAo+ICsJCQkJICBGSUVMRF9QUkVQ
KFNESENfVFhfRExJTkVfQ09ERV9NQVNLLCBkZWxheSksCj4gKwkJCQkgIFNQQUNFTUlUX1NESENf
RExJTkVfQ1RSTF9SRUcpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9z
ZXRfdHhfZGxpbmVfcmVnKHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1OCBkbGluZV9yZWcpCj4g
K3sKPiArCXNwYWNlbWl0X3NkaGNpX2NscnNldGJpdHMoaG9zdCwgU0RIQ19UWF9ETElORV9SRUdf
TUFTSywKPiArCQkJCSAgRklFTERfUFJFUChTREhDX1RYX0RMSU5FX1JFR19NQVNLLCBkbGluZV9y
ZWcpLAo+ICsJCQkJICBTUEFDRU1JVF9TREhDX0RMSU5FX0NGR19SRUcpOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV90eF90dW5pbmdfcHJlcGFyZShzdHJ1Y3Qgc2RoY2lf
aG9zdCAqaG9zdCkKPiArewo+ICsJc3BhY2VtaXRfc2RoY2lfc2V0Yml0cyhob3N0LCBTREhDX1RY
X01VWF9TRUwsIFNQQUNFTUlUX1NESENfVFhfQ0ZHX1JFRyk7Cj4gKwlzcGFjZW1pdF9zZGhjaV9z
ZXRiaXRzKGhvc3QsIFNESENfRExJTkVfUFUsIFNQQUNFTUlUX1NESENfRExJTkVfQ1RSTF9SRUcp
Owo+ICsJdWRlbGF5KDUpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9w
cmVwYXJlX3R1bmluZyhzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkKPiArewo+ICsJc3BhY2VtaXRf
c2RoY2lfY2xyc2V0Yml0cyhob3N0LCBTREhDX1JYX0RMSU5FX1JFR19NQVNLLAo+ICsJCQkJICBG
SUVMRF9QUkVQKFNESENfUlhfRExJTkVfUkVHX01BU0ssIFNQQUNFTUlUX1JYX0RMSU5FX1JFRyks
Cj4gKwkJCQkgIFNQQUNFTUlUX1NESENfRExJTkVfQ0ZHX1JFRyk7Cj4gKwo+ICsJc3BhY2VtaXRf
c2RoY2lfc2V0Yml0cyhob3N0LCBTREhDX0RMSU5FX1BVLCBTUEFDRU1JVF9TREhDX0RMSU5FX0NU
UkxfUkVHKTsKPiArCXVkZWxheSg1KTsKPiArCj4gKwlzcGFjZW1pdF9zZGhjaV9jbHJzZXRiaXRz
KGhvc3QsIFNESENfUlhfU0RDTEtfU0VMMV9NQVNLLCBTREhDX1JYX1NEQ0xLX1NFTDEsCj4gKwkJ
CQkgIFNQQUNFTUlUX1NESENfUlhfQ0ZHX1JFRyk7Cj4gKwo+ICsJaWYgKGhvc3QtPm1tYy0+aW9z
LnRpbWluZyA9PSBNTUNfVElNSU5HX01NQ19IUzIwMCkKPiArCQlzcGFjZW1pdF9zZGhjaV9zZXRi
aXRzKGhvc3QsIFNESENfSFMyMDBfVVNFX1JGSUZPLCBTUEFDRU1JVF9TREhDX1BIWV9GVU5DX1JF
Ryk7Cj4gK30KCkRvZXNuJ3QgY29tcGlsZToKCmRyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2YtazEu
YzoxNDQ6MTM6IGVycm9yOiDigJhzcGFjZW1pdF9zZGhjaV9wcmVwYXJlX3R1bmluZ+KAmSBkZWZp
bmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dCiAgMTQ0IHwgc3RhdGlj
IHZvaWQgc3BhY2VtaXRfc2RoY2lfcHJlcGFyZV90dW5pbmcoc3RydWN0IHNkaGNpX2hvc3QgKmhv
c3QpCiAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJp
dmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jOjEzNzoxMzogZXJyb3I6IOKAmHNwYWNlbWl0X3Nk
aGNpX3R4X3R1bmluZ19wcmVwYXJl4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVu
dXNlZC1mdW5jdGlvbl0KICAxMzcgfCBzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV90eF90dW5p
bmdfcHJlcGFyZShzdHJ1Y3Qgc2RoY2lfaG9zdCAqaG9zdCkKICAgICAgfCAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9m
LWsxLmM6MTMwOjEzOiBlcnJvcjog4oCYc3BhY2VtaXRfc2RoY2lfc2V0X3R4X2RsaW5lX3JlZ+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dCiAgMTMwIHwg
c3RhdGljIHZvaWQgc3BhY2VtaXRfc2RoY2lfc2V0X3R4X2RsaW5lX3JlZyhzdHJ1Y3Qgc2RoY2lf
aG9zdCAqaG9zdCwgdTggZGxpbmVfcmVnKQogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jOjEyMzox
MzogZXJyb3I6IOKAmHNwYWNlbWl0X3NkaGNpX3NldF90eF9kZWxheeKAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVuY3Rpb25dCiAgMTIzIHwgc3RhdGljIHZvaWQgc3Bh
Y2VtaXRfc2RoY2lfc2V0X3R4X2RlbGF5KHN0cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1OCBkZWxh
eSkKICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KZHJpdmVy
cy9tbWMvaG9zdC9zZGhjaS1vZi1rMS5jOjExNjoxMzogZXJyb3I6IOKAmHNwYWNlbWl0X3NkaGNp
X3NldF9yeF9kZWxheeKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtZnVu
Y3Rpb25dCiAgMTE2IHwgc3RhdGljIHZvaWQgc3BhY2VtaXRfc2RoY2lfc2V0X3J4X2RlbGF5KHN0
cnVjdCBzZGhjaV9ob3N0ICpob3N0LCB1OCBkZWxheSkKICAgICAgfCAgICAgICAgICAgICBefn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KClNxdWFzaCBpdCBpbnRvIHRoZSBuZXh0IHBhdGNoIEkg
Z3Vlc3MKCj4gKwo+ICBzdGF0aWMgdm9pZCBzcGFjZW1pdF9zZGhjaV9yZXNldChzdHJ1Y3Qgc2Ro
Y2lfaG9zdCAqaG9zdCwgdTggbWFzaykKPiAgewo+ICAJc2RoY2lfcmVzZXQoaG9zdCwgbWFzayk7
Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
