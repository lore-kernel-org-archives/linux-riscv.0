Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7714CA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1L8jG3zUBwiheqZOI7AL3Ld07wLMSA+jSZgU3OeN8U=; b=sFXhJRX/TljcHp
	gj9R8lIH+FL1vQ5qof+wFbbefhDz/AteWM0n7Byh2J9Ooi3R6FtYsXIAkmM3ztuTW1wtBxlJhBhVq
	LyA3WGurVSQwKdToIUmbztH95HdnPEO2UmQFkZA6HALLy8ix/OKbUGDvGdIDXJGxz7LR+5OZF/Xcc
	eoEc+msEDePpZEPRwG8MJKs61X8UaxHowamdU8a5FflUbIOKfInI6j5Ohkd5a2M62yYKVjccAXZcG
	0ZeuUE+BKqkiFSO2jQvsHsh8VR7h0fZJJtBCUfq3RLTtnnuQJghtuUDnzVqVGmQVCgdLYpekDF+py
	ONzIU7eubKplaOv++EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0x9-00000006GFG-1O6V;
	Fri, 30 Aug 2024 12:42:11 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk0x5-00000006GCv-0U5y;
	Fri, 30 Aug 2024 12:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725021727; x=1756557727;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=j6ptf/rlQSyuG+u/e/h1BOfuEIPYR3LcD9QOzKTkUe4=;
  b=Uqi/bRD+LrVNpezy28FbJ/K1MmRMMyJ7kVnTBZR2HRhNCZ/KBqd7ysBq
   NyNsf5UbCS7vzWa3Am8Uf8RA3ywBiYKiru6xsuGXpHW8UjtrTMY7w1ypQ
   MLQ+LMDiCZ+bNGnUgKK78Q6JUC3O+2+q2b/LZRLoKwZIdeaRwkZ9E9cvS
   5kkUcLG4fQH2HB+UrNOMZgMICORbfZUcvzgDd/fQwWqtWLB03/NLaVHGq
   Xdrq1H4Q0PTxZuN+WrzANYbdm1EYd/O0E8xkDoyHCFegzaaHsdBXxP7xp
   zrp1vbCMRlLn5fdM/nncOkkmqTLzys5tco099pyYqYL1tHuUqR9GElg4z
   g==;
X-CSE-ConnectionGUID: Nu3Pq+1nRu6mmTLQzElHag==
X-CSE-MsgGUID: wlohjtwNQzGDU5mIm+C6Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34822201"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34822201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 05:42:06 -0700
X-CSE-ConnectionGUID: NEDJRp6XR0KFDiCoAgJlbg==
X-CSE-MsgGUID: c9jYPQHPSd24XHcaRidGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="68737428"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Aug 2024 05:42:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 05:42:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 05:42:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 05:42:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eg4meMkK176gc+uUbgjh4+ukVkiD4So8+CjB/C3NtxGhOKnEzk3FeJLfcxXkDidRFuEN2zHQELxZFPrdVM8ORO7xn5pF7c9fGVnn14M5T9dDkDySwaTYA9nO9Gq+JAkna49C9WZ9taaM2Li13Fpq4eZHhC2eohPD15DXcvrXgYqOf3f1qmD68dZSijgi4+TTBVtN5H0ln2C4Ud2r1541FNGsBtrNI6D+8OfleLzrHR5aTzC0wHZ+hBsVzhbXMM44Lg0ITO2PTHQh7A9oObW6+Roj3DwrpOZYU8KbvlwwYA7f3t/d1sTMF1HUh3dkX9/pd0XIr2d9b5dxNCCt/ju8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6ptf/rlQSyuG+u/e/h1BOfuEIPYR3LcD9QOzKTkUe4=;
 b=Ru/ZAca8t4agS0B98DuTx7irqeOBznAgqnkpp1O1ymZYTB/OLlLHcgFF93WhrjNsY4y5/W1qKFReDkazUSUHdzSzxaDWDOql6+rJxb5yNgL0SidF0Dmd08I6i00YgKLy25jB93+H5qVTWNstwJdQpylx3z0ug+eAbqcIKoOFAhqjrNWBuG/bf5nF0u3gT32S9uUSmv20x590ILBGImGca17vsJnWTM6TNV2nGsbq41sN5Rjpqj4uYU1zih+cTt4hCNyoVSpvHDMNE59jVuh6pbaDTC5HlZJKTpLcBKtj7tUMg2cIpICV1ceyMM/Npf5Po9nj2yxlKh5rodeCn0XyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by CH0PR11MB5284.namprd11.prod.outlook.com (2603:10b6:610:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 12:42:02 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%7]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 12:42:02 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>, "seanjc@google.com"
	<seanjc@google.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "anup@brainfault.org" <anup@brainfault.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "Gao, Chao" <chao.gao@intel.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "Chen, Farrah" <farrah.chen@intel.com>
Subject: Re: [PATCH v4 04/10] KVM: Rename arch hooks related to per-CPU
 virtualization enabling
Thread-Topic: [PATCH v4 04/10] KVM: Rename arch hooks related to per-CPU
 virtualization enabling
Thread-Index: AQHa+pYq1r3JCuwhAUKTH7rS1QoUw7I/vtWA
Date: Fri, 30 Aug 2024 12:42:02 +0000
Message-ID: <2dbfc6066e32da4d2c847bf00260313ab8c5aea8.camel@intel.com>
References: <20240830043600.127750-1-seanjc@google.com>
	 <20240830043600.127750-5-seanjc@google.com>
In-Reply-To: <20240830043600.127750-5-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-1.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|CH0PR11MB5284:EE_
x-ms-office365-filtering-correlation-id: 70b2dc6e-121e-4dd5-3995-08dcc8f12581
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?QS81ZTZNSlR5aE9kckZQSnN6WHBxWk1YQ1dVMGxYdW1CZXNjYzhyd1lUVnQ4?=
 =?utf-8?B?VkhiT0ZhWW02YUN0MXBTbnZPZVR5L3VvL0JYeU9FWDBDUENxWWJhdmswUzA3?=
 =?utf-8?B?aTNLb3lrMGVqQlJFQVArRlVpOFc3Wm05V0lFN2pBNTBKT0xjUVlFUHhaUEww?=
 =?utf-8?B?Y0UxeW90bVlOQWRZYWtXZXRMcVBWRnd2VkVhdWpUTzl4WHVLeHkrWUFqQitC?=
 =?utf-8?B?c3ZXdnRId05OWExGZ0JKV1FsN1pJblRMWWl5UXRXZDlNMGxSTlp4SU1YVk9m?=
 =?utf-8?B?OGZ1WnZiT1FZN01wK0JVQ2JlK2lOakRoYjNmaDMwVmlYM0IzdG9rOXBiUkkv?=
 =?utf-8?B?VTYyUEhBVFF4SE5kVTdoSkRJRmYwUXBaK1NYdHRWcTFVeGJYM01zVE9Md1hT?=
 =?utf-8?B?TjZrSER3a0xxNlMyQXMzWUg5c0hpd2lYTWFCNlFWb01GSDlsSG93UXJxM2Nq?=
 =?utf-8?B?UmlFbENBZEp2eE82dDZ3eGVpZGplMW1qTGRXMDFycElvdGhSc2FGaUFXMm8w?=
 =?utf-8?B?VGZkL2FSTHpTdDZWdVRPdDVkcWYvUVhVSXBlUW9XdmU4c1ptbHcyUERuODVk?=
 =?utf-8?B?RDJKUHNhcVZiZlBzK2pteUQ4WDg2SFd5bGhZOFUwOHFrYlA1VTMreWxCb1Qx?=
 =?utf-8?B?WVEyekpOZEtXYjlnaHBlN1R6TkZwRXMxYS9LTnBzVTQ5cFVHZlREdzBXU0NN?=
 =?utf-8?B?TTJLVEp5TXVab2grOUVKbTBsb1orVW5IOFF5MXE4Y3NoTXQrQVZQcGlsNnM2?=
 =?utf-8?B?elJ3dXgzVUlRNDFLcmcxUE1sUVJvOHFWemZpcHQ5T2s4YVVXVVBsaDRDOENh?=
 =?utf-8?B?Vm9IbU9pN2xGNUE4N2NyZ2tzQ25QcWpXV2VoVjZQVXQ4eTlLRnBSVDVQRUpk?=
 =?utf-8?B?ajVQc2hhRmxvbzFnR2lIZmRZcG9peGhadUR0SHVOU1czellJMWFRS0N4cnUz?=
 =?utf-8?B?dTVCRnBxb2U1WmMzV3FOWlBrQnZCRVZ1TkdPRFUvYkl0cmhXQXJ5T3ZvVnBx?=
 =?utf-8?B?QkxkT3RTYlltcmhsVlBzN1lOdnZWZzVZeVl4MU1Uc0xSMzB0bnlTRjM0UkVX?=
 =?utf-8?B?UXBVeXlFTVZHWUJrQ3BjVyttWEdDblgySXd4ZkdJTEFYRSt4OERjQkhkVWI0?=
 =?utf-8?B?clRJT0Zac25SM2tvZ1V5dHRUbTlxZGpnUkhxdmFmRmdHZ2dNSzBZdmFVVjVm?=
 =?utf-8?B?c3kyN291TmZBNE1xUFl5OUVrZXc0bE9ZL2lMUGdqVTNjVGZ2aDVCY0pNQnBP?=
 =?utf-8?B?MjZhSGFETFVBclNJSU82LzQzN20zbGRuZUxINWxka3ZJb1M1ckJRZE0zVXh6?=
 =?utf-8?B?cFNZcUovL3BpK0pnY3NzWG10R1dBRkZGU1ZCUnZUUjFkWmcwNFVvcGdPWGw3?=
 =?utf-8?B?bUZ2Wjhjb1B4NmZzaHE1NitPckhyYmtTNjAxYzVCdFdXcUpRVUk1dzlvT01Q?=
 =?utf-8?B?MHExZ3NHUm9KMU15VmNOMHIwMWJRWWhucXlTWXg2T0NkeFMvSGRyTHVSNnd0?=
 =?utf-8?B?NmlCK2xwVjdPcEUxWVNlQ245QjJ6dVpPdHh0Vk5nVSswb29SZDNGbnQ0aVk1?=
 =?utf-8?B?ME9XaVZUZEpZMmJ1Y09XeEUydmNIRXA3TTJ4ei9EVHlHYXlUbXIyeWhIRUN0?=
 =?utf-8?B?ZG53M0hHRGRDMllXUHVCTXlKd2p0d3R2WjlTcnBxK2NiRTVIMWxhTFdZMDJW?=
 =?utf-8?B?ZkZnMHlBMkJ1RE1pMFRvclp0V1ZHbC9ZMlFrRGd4Y2lGU0I2bEttQlhsWjNN?=
 =?utf-8?B?eVEzcXRBTmlMblJUK21NMUJnb2s1d0RZajNOK3hYUUZZMGgvd2tpUFFyeldN?=
 =?utf-8?B?MFVucHRDcWdhbkQ4U1JPcW8xekYzaFhDN2hqYllSODZUNW1vQjlMenRReW9m?=
 =?utf-8?B?QmN3akJxSkVZbkhkN1kyZkdGbUJzYVJOWWFEYjlyak5zRTViTWVVMTh6aWdw?=
 =?utf-8?Q?kJeRBejZ+mM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnJWSnM0RDBCNTc3VDJBeEhhRDU2Z1o1NUlsTUdZSTNMaXdUcm5SNldIN0hZ?=
 =?utf-8?B?MVVLd0NNRXRkV0RGRnE3azlqQXZod3Zla09VWEFCclBrQWhGNi9xU2hiSXph?=
 =?utf-8?B?Qi9FQ1VhWUNJc3RwN09nc210bG1YdDRUK2hkTjRsSUlDZ2dOSDcyazdpWXEw?=
 =?utf-8?B?dUdHRlEwRUdhRkFlQ3g1V09UR1RTclI0RTk3eER1aWJ4YklheGEvQmREK0t1?=
 =?utf-8?B?UGNjNHUzUlRSQ2VFUXZuUUYrNTgvZDdubUFkdXo5dzRiUkN4SG9wVms3R1FI?=
 =?utf-8?B?Rm42SDFqbzMzU0FuaXZWcEpOY25Ra2RPVHZhZFZ6VVprRXFHb3hwN1kwQXFw?=
 =?utf-8?B?UnBIdS83SnBCTmFoa0todXQ4V1dyQkx0UEZXZGkyN2VrSFhCZ3kwMW9Nd1dt?=
 =?utf-8?B?bitlOXRjUFlxTERMcXBUbzBReFpzNnZqY1VIYnptT2s0cjNCSGgxNitOcDdM?=
 =?utf-8?B?N2pFa2U2aHhQRWZsWlJwNUZIbVJwV3U4blZUYnB2ZXpsRnRhUzR2SnJNZ1pC?=
 =?utf-8?B?VUExa3h5SEc4YTZqM04vQkFZblA5ODAzU1IyOTZ6bjNReTVUTDZENjBsS3dH?=
 =?utf-8?B?dEtjTXZ4Zmo3bVNEY2x2N0M3dFZWbWZBemY0Nm14bC9EOGxQckxjalJoWndh?=
 =?utf-8?B?L2FtRk54alh0ajU5R0VTTW01eno4alE3M3FWZThZRzh3VFRRYzJvREsreGg3?=
 =?utf-8?B?QVRyNVRpSTkxdFl6b0NSU0IwdmlhcmE0N3huUkx4UllkVitiSUpBZDN1TjVV?=
 =?utf-8?B?YjhmclhwRjZFRTMzVGRXTDh1eHBMdnFWM0NqMElacDlPa2RRMno1RENmM0Zh?=
 =?utf-8?B?NFNnVkttd0JzTlQ3dk1mVGRHR3hZNWdQejdIcVU5WVlpYkNsa0dsemVqQlhs?=
 =?utf-8?B?WFF0V3pvbjRJSDVZamZlU0JWQXhFYWtjLzJEZTZCL1hWN01CNWcwTS9PZjJn?=
 =?utf-8?B?NzAyczN0V0hrUlBjVWVOVUZHOFN0SitWQnVIT2RRbm4zNThNVVBhRGtuTEl4?=
 =?utf-8?B?ZVJka3RJME1ZVDdtT3IzT0pEbGJSWms5b0hXM1hrc0swK2JNVHFicHBsY1VX?=
 =?utf-8?B?RkNzWUtKQmlVZkZjRmJhVUNjYnhHSnNtcHAvYzZ5YTRiQ1VNQkdhcDhaNlVp?=
 =?utf-8?B?QloyMmU0dTZtUm5wUmhXRFhsaktXLzFBR0w1M1ZoazJvdUtyeWx4cWVHMGlv?=
 =?utf-8?B?WnA0ZjFCRUNvM1NKZ0Q5UDNTdFZuQklWTlFqSVdzczhOclhmckgwK0NLdTNt?=
 =?utf-8?B?WHZtejJKbnUxY0R5RlZWMTJRdHg1bk5pTWdXbjh4aUJ1QlJBVFBtZGJacCtM?=
 =?utf-8?B?NXFnc1pkOFMrY2w5VSt3bmwxOVpMZ1JjOHI3TndWQmF0N2JlTHRqVEF0b0VV?=
 =?utf-8?B?NUpjbC9GejdkZVV3WjFqcWFnbFNBVWNmblRuVS80b3RMK0hZRnJ0bmFnUkh5?=
 =?utf-8?B?eUZjZGV6UzlmdloranBSeHQ4ckw0M3premRKRlRaa25yek9sSXBQNVREeWdH?=
 =?utf-8?B?dnk5ZUpHdlVzMUU4c0hZYUk1YXFNZTFaNzVRdm1vNWFFbHM2WW9HM2VQT3Vu?=
 =?utf-8?B?RWI4MlR1TVpkWWx1UzFHcGw2c0VVd3dZRzlBbVNsUTBFNnYweUNkSTd2MUlF?=
 =?utf-8?B?bWRTakZlZ3BBY0JzSlBST0l0bmJXUnJnVE10MW5pSWtVSDB1U0JmNDNsYWhC?=
 =?utf-8?B?VmJzSGZqMWV1WENwS2JDeE9JRUxHZ1JMUW1DK0E2QkZPcFZPZ2JsOWZFRXpt?=
 =?utf-8?B?THJmRHMvRVZKNUtoNTdpeTg1UG03dk1EZk40M2xTUFU1MDdCQmorRVFpMGNY?=
 =?utf-8?B?emtYUWtpQ2pCUjlzL3BoOEpyYXEwcm84ZHB1QVFvVEV5OW1MTWkyLzQzZFpr?=
 =?utf-8?B?TEdqWWlwWFY2dXlXbjI1NnJNamVGaW9QQTRYUTJsa1NvUlh6ODN5NmIrNlBp?=
 =?utf-8?B?bzRMSU9uNEErS0V4eEJRSktFQm9yL0d6aUNkWW56WXJRVU5sNDd4aUlRUXM5?=
 =?utf-8?B?NnJRRTVMNkN2SlJFRDNvTk5zZnBQN25sSW9TOFh1WThYM2prYm1zRVIyZWV6?=
 =?utf-8?B?djJPQVl2SnRFS09iUzNiRUtvNjFrd0lQaS9qNG1Sc2VJZXVZTWJyeUhya2dl?=
 =?utf-8?Q?X7xtRIn51kFTy1OBMVWb1zM6r?=
Content-ID: <2819FA10C9F7E14F998EE7A4CF7EFA83@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b2dc6e-121e-4dd5-3995-08dcc8f12581
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 12:42:02.1623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WbXOiT5iswqVefJfLxZwSHVDZyy7Ietw81fQOw4J3XlQyWkFI/211SUc1jpT5LTOay8XTGVdewywM46oa5oag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5284
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_054207_220903_F513186F 
X-CRM114-Status: UNSURE (   9.44  )
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

On Thu, 2024-08-29 at 21:35 -0700, Sean Christopherson wrote:
> Rename the per-CPU hooks used to enable virtualization in hardware to
> align with the KVM-wide helpers in kvm_main.c, and to better capture that
> the callbacks are invoked on every online CPU.
> 
> No functional change intended.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> 

Reviewed-by: Kai Huang <kai.huang@intel.com>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
