Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F6CC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 03:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlwthRuhWInCs9SzQdB89gF7+MCGgIlCwamaVufZXnY=; b=0/kyw53tbU+UXN
	d28HTjyAyOZpaeQtCMwcYNGRsTM0PLAYD69RTtPNfIpNyHsTN4SISzI15flirNUtd7GF9+MubLiD0
	ItVzyE4CXRk+/cL/AckZWBLuzcALOa8zqb7GBAapJYridzKe1FFBKuiCw4yXsxFA6z5ligOTgIIv5
	u2MYThNBCUF8LQuB5KQITP/z0WXs0q1xBoyJGYT3DruBBOzrAS3cOTMz03SA2LgEwCqLDPy5E0seQ
	DKKfdwueMe/k64Zkqy9E1rxG4ocdVLGUWCC+bf13fRRew4gA4KMhAcZRJ/Tf0611O9g+NNC+WT9ij
	uUS/n75zNwVvBQNEIAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yrV-00000004raC-3VRX;
	Thu, 23 May 2024 03:11:29 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yrO-00000004rXK-33qp
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 03:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716433879; x=1747969879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JshyzCH51kHzKZCaYPg6ron54107HUg1skAOCvKn1GA=;
  b=ecAlFZP8NBKjuDNW038YPHhudgk7OzWsZdA4hYX4QndFD2wZATGUEC50
   SXNWHM87xxYMhud+pfrfH2++IbopWVy9vC9gwkxDKP3v+fCsxBK5oSLHJ
   dhlYE4NBhJS72xmvrtiz29nNLFYVZS17i19GfLz4lZcIrg3ReEGpZYXjJ
   50bL+gZkXCl+YrPKs/j2FoJB/hGbG2qX4aWGzKKgVitqtn3d04QMKrfGm
   o7vKU7MBOCQAO7DhCuHoWl0kB4jG1dnnTqK2xcE53jBN5oZuvk6A9vi0Z
   4t48zbMoId2wCmuS7cIgKGKfcXntBzduyD5NWooviW4SUzzGs/DEx4jJ9
   A==;
X-CSE-ConnectionGUID: gnuB0xlIRoayh5lMvd1pKA==
X-CSE-MsgGUID: 1d1tl/vdSL6yXxT8st5MQw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="24131859"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="24131859"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 20:11:14 -0700
X-CSE-ConnectionGUID: +ZnlFyYQTCOfBs/9HT3gYA==
X-CSE-MsgGUID: 9vqWTz1zRr6f2wWxejaIDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="56751437"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 May 2024 20:11:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 20:11:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 20:11:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 20:11:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 20:11:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1StSuznGoqDrWJZ2K+4bn5sDX5gH3Lut2Pq/SO0IaK67DqJNfASfKvQX0DMefIwAFtK9y19B0kuQMbgVsjfJKdcHKDJsXLLaj2/xGo8eY1C1bypDmFkdx4szk6PgFOrCT0UvZH2XM67tR+qSiOh3gNJIyrxGqS/aj2zKsWtY0OyiFoNS3Zl3E5tAAFotyt+c4gwYIP9pn3ql8HoKTP6MIekxhfBt0bhEfbblNEQJgVRa3fxFqctUUKj1G6Nz8+Yq1OZ52IggtaRXPNeERjiq+YKl5iBBh2/stWvEvTqargEixFy1zi0ylTJ0y/UMZ79z3mS4rLb2dwgEPam+xNJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JshyzCH51kHzKZCaYPg6ron54107HUg1skAOCvKn1GA=;
 b=LoohQs6T8KrcPpWGcfN1kyfVMP4GtqsB7o25nlyeVOXgLzwardVCKvatGrAoPxKyHrvbfPOJLDShsjXLka5nwWaTNlzN+IueAoywQIc6J18L8aDSpdNrjWpaVknpi02Crf/3WIZDlJjaNi32rKmnke1eF1UrlFGU5AuyUDfZWCTaOKmLJy8vLnnEr5ivdXcvimcTqDKeIVKEKkWbdfEcg8T6TzBmbUs87Z3jLjwdqrDo2/1TM9DD5gvcpg/kFA+XhR8NLZrvK0QYVdjLyeErckzeOlfmwUHTN20duZpNPw/mC2enfWEWP+f2GaLfyFd1gYs+rt04v89Br1CEsSA6EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.22; Thu, 23 May 2024 03:11:06 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 03:11:06 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Pu Lehui <pulehui@huawei.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "luke.r.nels@gmail.com" <luke.r.nels@gmail.com>,
	"xi.wang@gmail.com" <xi.wang@gmail.com>, "bjorn@kernel.org"
	<bjorn@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net"
	<daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>,
	"martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com"
	<eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>,
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org"
	<kpsingh@kernel.org>, "sdf@google.com" <sdf@google.com>, "haoluo@google.com"
	<haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "Li, Haicheng"
	<haicheng.li@intel.com>
Subject: RE: [PATCH] riscv, bpf: Use STACK_ALIGN macro for size rounding up
Thread-Topic: [PATCH] riscv, bpf: Use STACK_ALIGN macro for size rounding up
Thread-Index: AQHarArIeseTFgIJskauI1Gs51fBIbGkDPkAgAAYdIA=
Date: Thu, 23 May 2024 03:11:06 +0000
Message-ID: <DM8PR11MB5751D22AF1FF43D1D56F3288B8F42@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240522054507.3941595-1-xiao.w.wang@intel.com>
 <e769b8a5-dd11-4cf5-95bb-4399dd836113@huawei.com>
In-Reply-To: <e769b8a5-dd11-4cf5-95bb-4399dd836113@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7010:EE_
x-ms-office365-filtering-correlation-id: d64d891d-a309-4763-1d00-08dc7ad5fc92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|7416005|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?UXlhSVVnS2FMZk5tWmwyN1l6aHZmcExXMS9ySkVNc3pCU3piK3A0Mk0wSnV6?=
 =?utf-8?B?TFZLbVphTzNsUXVFaGZ4ak5xRk5lQWZSUHpIQzVFQ21iUjRORGRlZk96OFRl?=
 =?utf-8?B?MXpRV2Q3Zm4yM0RMc2kyalBPT0pqYW1KaW5aQjlIVW92bEJFSlJzdWVZNzRs?=
 =?utf-8?B?NzMvY0FUaWR0NHFWRnhVOW50dytVbUxEdkVuZ0JPakpVOTBNaHRuWFBPWkpl?=
 =?utf-8?B?ZzVLemJSb3U2OTh6MzlyY2U0bGpIS0NiY1ZSTkRoS0U4NmYwWXBVTTZBUXI2?=
 =?utf-8?B?cVRDT2FjajRSejhDSWxYWFQ4d0xaTEJWTU43YTJxTXdFSEVyWGNNTXhxOWtT?=
 =?utf-8?B?NmtVN1BJRmJiVnZzenZkUDFVYkdPakZwc2JyLytSK0RTT2ZyaXc2VENuVERa?=
 =?utf-8?B?dkV3eWUrbDQ3VXZPbVhHZTBBYWFtcFpGdTFocVd4b1lkdUlOZHhsem9VQytO?=
 =?utf-8?B?RGtMUVVQTXF6TTZuc05TQnBua3RkaHJ6WXE4L28vN3VDU3FDZWg4b05TSjNR?=
 =?utf-8?B?aHhFR0FEYU1NSmc2bTVPRmdSRkgvRWFlTEppSnRnSjdTS1pLeGZ6K3paZjhz?=
 =?utf-8?B?L2NVSWpZS2JnNVpPWFZ3SXFzblNkVWtYK29kL3loMWF4R0w1RFRBY0l3aE1Z?=
 =?utf-8?B?M0tIZk5PZkZGOERjdXNuc3hqOUF2T3JFZTlwTzNnY1dHQVp2VTlZYUlhZGgz?=
 =?utf-8?B?a2pOQXo4T0lSd21Xa2U1UVZpUXJWS1ZXRUdybDBlVDNreHdCUVloNERnaTd3?=
 =?utf-8?B?YldQTThud0RKTXN5RGtweHZITzh1T0tuOGlaS29jQmF6R3lRSlZEN3N0OGpn?=
 =?utf-8?B?YzZ0cDBwRWRBbGNHK2Q5NHZmZ3ZRZjQwL01DRTZHUk1pUENTalpHMytjdTFz?=
 =?utf-8?B?dktDWUJvVkFvM3ppaWFQeTJwN2N0Y0IyYk9KSCtRN0RaYUdnLzNvTHBldmFT?=
 =?utf-8?B?OGZhYStRY2tkcWxDVXJyZHR3QUVHSEVhRkd4V0JONWRlbG81Qzh4cWF3Rzkr?=
 =?utf-8?B?ejkwNFBoZUtFVHluSVBOYmh4eWxtQm5iT014Umw1eHhQNEVqVFRVc3VVUktv?=
 =?utf-8?B?ZVoxaENMUVdJcGVpa2w3UEJ5dWpHRDd0bzllNGsrRlRmSms2WTRzS1p3Z3pp?=
 =?utf-8?B?bERWY0xIWWszb1FuNlNpOStJamQxU2dualVXS25VQ0FIZmZiRlRYVzJQaThI?=
 =?utf-8?B?K2JXTnpSK3dFME5ETTdqdlRrL21pYVdYSHlBakZRanJnWEhEV0k4dkNMMjBv?=
 =?utf-8?B?bmJwckZnekhYMm9CV0U1bHhUUzlqa3JnRkE2dVdOdUU1enNhdjdCbDlyazAx?=
 =?utf-8?B?QmEreWF4OW4xbHU5ZWppaXVSVnBvRTZKbWdBUVNxUlpXZ0dwTFNxd1J6NlND?=
 =?utf-8?B?bFllVlpsNE4vclM5bGE2Ky9vR09tVXI0Nys3WklVbVRWYjdpMENaYTZKa2tx?=
 =?utf-8?B?NVlsQnpXOEdrYjd5YUtsNjFKU2hRd29ZVjVCQmg4SnFLZXlSbVdBWERNNjdH?=
 =?utf-8?B?WnBoais4SUlxdy9KTDVaTVdlUjRGRlZzWHRQaFpyZkJkTHdVbmZBeEZ2UytR?=
 =?utf-8?B?TllLUnB5akhDWU40ZUlwSTQvU1doSFpPZkY5VVByY0xBMkxkWTIvRUxwdk5H?=
 =?utf-8?B?VCtobEdoUVNhQ2o5OUFxdDEwZDBsT1FzcDUwSGlwaTJ2Mm1zOTIvQ0ZBUUNs?=
 =?utf-8?B?enEzM1RBQUlTM1dxWFU1M2U3ZUJ1WUgwZENEZDhiL2IvamROVE11WXpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0xZZkZMSVJTNjFyc2NZU0pEZzZGZUx1NmZzMSt0eTlCVDRvNWxpbE54Tzkw?=
 =?utf-8?B?Z1VtRG9xV2x4c3FES01qZHdZOXBWK2V1L0dqWDVjS2Z2Y2ZSOGJ4WjFrYlJI?=
 =?utf-8?B?aUpudnNiOGt5ekdXZTFPK3FJSzJ5bWozeitseFExSVE0SVRaWkQ5K054bElw?=
 =?utf-8?B?ek5iZ200cFFQcFZQenBLUjd1RHFxT3lKRUVKRUVhWjJwK0R3NlJLYlVIOXdh?=
 =?utf-8?B?eVQrZzl3SDBNU0pJbTFwR1hZQW5uV1lPN3Ivd0NUUVZlNm5CS2ZqNjlMMUhQ?=
 =?utf-8?B?NjVOdWlZdEpEUEtCS2tBR0JwWkFHOGhzSTVrMEtEK3JqS2VyZzlKZW1Fd1Bv?=
 =?utf-8?B?NFpGWTRaUzRkRXpvVCtScjhLUzdqUEtCNjQrbkk5eDh5V1pwTUc0Uk1HM2cy?=
 =?utf-8?B?eVVBcUc1R0tIUkEzWC9kTmdib3o1MTJxT2xRVHVWVldPS3RwZDBPaytmNjY0?=
 =?utf-8?B?ZE9FRnNaKzlNRXozOU0xQndvd25XZGxGSXltWG1EdUowclFPTnNXaDNlb0Nl?=
 =?utf-8?B?N29FS1dqc2tUQU9VY2w3VHU0ZHZ5Rk0rYVRMWDEyVWg3eDhRQzBibElBK1NW?=
 =?utf-8?B?YVp3R3pOQi9aVk1KcElYWVdORHBabDFxVlczcEJhNkxFU0F5cVRJdTVucEw1?=
 =?utf-8?B?Z2tWdWRkV0pzdUFNVFcyckRPbDAwaXNLbElKY0lnbFBaREw3eERGbnlHR3Zw?=
 =?utf-8?B?VnB3UGptUGpnWURqdDNDRk8yNHowRkZ5bnNLWno3Y2RhSldaeHZRTStzVW5H?=
 =?utf-8?B?dDZKb0VIYzl3Q2w4akgrOE56M2pCMFQydHhrSng3dFMvNkp0ZTJWNlJMUk5q?=
 =?utf-8?B?dldwUDFkbGYxdG5nMTQ3OVBmVGd4enRVTlB0SHVBdmFTQXNKQk9HVXpaVkxT?=
 =?utf-8?B?b1E3TVNZemRBVzhTREdPM1RBcjdOdkFnMGJtTi9rSzRyVkt0M05uLzJ2TWov?=
 =?utf-8?B?bE9nVlpETEZITDJHak1NeVBCUE5OMG1nOU1MK3pmQ05SSEZpWGtBZHIvS3Jm?=
 =?utf-8?B?RWR6aG1nZ2liWVZxYkdUeDhUeW9ya1pRRVNNU0NydDVNVzk0SERDNVpuSEFa?=
 =?utf-8?B?ZkJ3WlZ0aEtQT3U0eDBzQy81NUxFWFR0L2s4MW5SSWRnK0NMOEVmVDZMd1Ix?=
 =?utf-8?B?RkwyTFRBU1A5RFJDNkt2ekFTS3VFNFR5ZW1YLytlcjRVS0tSMEI3ZG9hSTJn?=
 =?utf-8?B?UDNsZ2Y3Z2FlclBmdm1GNDlHSEU4UEp2bUVLOVp6OUNNeEluVVZNZ1lWUWUw?=
 =?utf-8?B?US9ES2JIMkRSVFA0Zlc4Qmc1WXVVQTNQckVzNEZGbFBITGE2dnV6akU4MWpa?=
 =?utf-8?B?MTNtQmtjdGEwdS9RTmYzaHpUZGVMN2NYYmZmRGx6ZGZVQUF2Q1BGQjA0R2kz?=
 =?utf-8?B?R1M0a2RyK24rSXZsSDdXbkFVek15RVJUcEVseHRYSjdDUVMrNUp3dEpJOEth?=
 =?utf-8?B?ZGZzcEJaMVUrczY4WUFSdkkwaXZwekM4NWVuREZsZmR5UEh3OUpoVndmWi92?=
 =?utf-8?B?ZDVGR1cyTHFjTkRsLy9MTjVXTzZvanU5b1pvb2Q1MnhxVVZSSzVjdlpGMTVp?=
 =?utf-8?B?N3NGSEtsdzNOTUorUGJaS2E1dWFzeTNKcEN2OGRtNlBPMWZJbWE1MDlYU0hP?=
 =?utf-8?B?TTBITElteFlpY1pJaTVuRkdDNDY2V1BEL1lNZUJNSHgyUE5ESE45UDBTSTlW?=
 =?utf-8?B?aVhHaUIzVnJXbGtDRmZaUzVWZUpvSE5JM2ZlN1Uvb05IanJCTnY2bERpSXdm?=
 =?utf-8?B?SVBCQTN1Q3B5c1J1dXQyeDROeEVIZlBRbWlWU0ZMQkRYM2oyYmhwRU9DSzhY?=
 =?utf-8?B?MkdRTXZUbzNqU3hNb3FXdllBNG1hZUJ0NWpwZW9zNkx2ZEtmTHF6VG83NU5t?=
 =?utf-8?B?aWg4dDFPdDZsaFh0OTZYQ2JLNnA4Y3d3SnNlajFESGU2NENUd0hlT3ZJSU5N?=
 =?utf-8?B?cDJsdG4vWVhYbGk2S0dmTUxkRWhTWXNMbXJBQ3RiY3J6OU1jNURuMmRCaDda?=
 =?utf-8?B?YkcwcTE1a3ovUzFMdnV1L0xQcXhKVWFGMjgydGtqazNPSW9tQVJzRWE0WEZG?=
 =?utf-8?B?NDlHeGlNdWVHUmxCSXdLMnJjdERJRHhxLzI4eUd0bUNIZStiSUh1NEQ1aVlm?=
 =?utf-8?Q?LoI9Nf1ogRSYoCxA39Gb40AO0?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64d891d-a309-4763-1d00-08dc7ad5fc92
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 03:11:06.3758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVHmfH//1EgyJA0rd7jbbqxNhbq+2Gb4uJ2/jWnRHLOg9R831EyEhuRpHCgfd/H8MqsTw7vfSGmKYotMwP64jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_201118_909070_90E69E68 
X-CRM114-Status: GOOD (  14.05  )
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



> -----Original Message-----
> From: Pu Lehui <pulehui@huawei.com>
> Sent: Thursday, May 23, 2024 9:43 AM
> To: Wang, Xiao W <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; luke.r.nels@gmail.com; xi.wang@gmail.com;
> bjorn@kernel.org; ast@kernel.org; daniel@iogearbox.net; andrii@kernel.org;
> martin.lau@linux.dev; eddyz87@gmail.com; song@kernel.org;
> yonghong.song@linux.dev; john.fastabend@gmail.com; kpsingh@kernel.org;
> sdf@google.com; haoluo@google.com; jolsa@kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; bpf@vger.kernel.org;
> Li, Haicheng <haicheng.li@intel.com>
> Subject: Re: [PATCH] riscv, bpf: Use STACK_ALIGN macro for size rounding up
> 
> 
> On 2024/5/22 13:45, Xiao Wang wrote:
> > Use the macro STACK_ALIGN that is defined in asm/processor.h for stack size
> > rounding up, just like bpf_jit_comp32.c does.
> >
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >   arch/riscv/net/bpf_jit_comp64.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> It met a patching conflict. I think you should target for the bpf-next tree.
> https://github.com/kernel-patches/bpf/pull/7080

OK, I would make v2 based on bpf-next.

BRs,
Xiao
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
