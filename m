Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0EAC88E72
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 15:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7U93g/MTrq4gTHRs1wsTStCEuTrZePd3LQAciZ3Wkho=; b=m1Qyp3Zf8aP8/G
	OXyti/8HAf57rIDK48hadFUlco7gO6J/edNX3HRycBbxkAX38Z+3FdrFnta+VEj/4BOU04lTqKaWF
	EFjPGCM60GI3rn8cGGDhjaeS0EWsoHJb3QjKYQuoDN5qQboY3eNifbZXLmPc7krs2CceOhYPPxeFp
	HeCyRFRa1aZ+fsTtdk7+ABAbNB0WXfc1XHdD6i1pdXaPbmX6jkBSfQDfjJeXfgXxQbu6ZCYgtOeGO
	lnN4+0TwskIUbgF4sOfeEz7L5F0W0WgqoQnLLGdhBDgMQR5t9Gnsg13C5/iQ4PfTrjW3v4trxxyDq
	aJK8wRrWylw0Y4bbiU8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EUC-0000000Bmcc-2k89;
	Thu, 17 Sep 2026 15:57:20 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EUA-0000000Bmay-0RrB
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 15:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789660638; x=1821196638;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FCZktuUADf12SjkE1Om02roWd8UsbwP4tefjeavL33Y=;
  b=GK1xLxjdDsylsRQJcHIyJkjSatCK1qDPvl1cKe5BPgNm9ebNGcVDtMXj
   MA3v2SMPzI1UHPfdrWTuQNLU6voVPoTQRLC/8glHFETWuvALWUNS/BuXC
   0C04/W2wWXNR3ncT6OJuiWEI8MCjrOojw7Vl2jmZaOY320uu7OP1PKf/Y
   R7Zo/1JE4WMXXclnFjdBIS3/qI87p6hf97IpqQyoTbjlyn3EIem1hFfHl
   m9FI7ZUotrAOx8PTowqQvQISqsyk8NXF/HCyUBcdgw5UqIVK+4eHUeUpy
   B2XNqpmLum1gVBEuRgBkuhPoY90kpdvykf0eRTl3NMDqcpZ/J+DJ6DwfP
   A==;
X-CSE-ConnectionGUID: A9RnGpvISw+753QZ6HNwpg==
X-CSE-MsgGUID: XIHMk3Z4SW2cPDOX4vTTKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89030210"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89030210"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:57:16 -0700
X-CSE-ConnectionGUID: UvUT7ezERHSeYsGwonwtpg==
X-CSE-MsgGUID: 3R841hPVSLKPBt0+5BJugA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2306974"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:57:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:57:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 08:57:15 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:57:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9Q6CNpFqy7p+Jpbp0jWwktz30FGvXlVpHUx95Qk+yt9H16L57/fDLjWlDcsMvd7v6AGjcZBRQey3EPTYzckNWcR6UZLuU0w2BZQebCAmG3DnSR8c73+MDR7XlizTRBpRazJtOO5BbrQewis8IKxi+qI+OBQR/VJnp+CoG8VFZ0aSlBLivu4oF08hnnH+dxhCwkVdZqk65FAVrkJaOgibU517pKVf2cOLVqPb18GsoxJ9FGMSURwXqerZBm4NpVUDgcP7r2mUEulxnqOiy0if6sZKEZLDjgTbuLLFFMb/gH+XuMZZb0Os4nFcQx2NYelLI36Jq0s68m52wNZTpayIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zh31XFI/Mq4NFBuO5JsEUeT8Zl2HQx9yyw+vFf83oBg=;
 b=JjU6EtdVbDpwsc56Wrm5SCDU8EZ58pJSIQqLXc8B8oPqR1Zxzpgb2loHSWJ9TrDinvGDx+hXPOL2b4oBMUx6IdFIamRuhXcro52tapGswxkoKqg7NxjFIL9NFCWsE2YlM/ugmLvPVZJmm7CWuYfNfwYk6Jv9bRFkAB4AcpGb1j0oYdGVL3MuIJjyn6F188l++dDoZ+MLpnR7qVLOQCcKmgrGNavAO/9LeaC/q+vOvuicuNpTkjzdUoGXvtnZ665k9VhYcEHmN5cQYFZCLK6qPkzWOkmDZw0TDI5L1tFK7lH0dqJaTGzvKHt0wbqEqzz6Oa28yydfc7f4j1nQ42DBeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 15:57:12 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 15:57:12 +0000
Date: Thu, 17 Sep 2026 08:57:10 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: Drew Fustini <fustini@kernel.org>, Adrien Ricciardi
	<aricciardi@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra
	<atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, Babu Moger
	<babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, Borislav Petkov
	<bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, Conor Dooley
	<conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua Yu
	<fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai
	<gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, James Morse
	<james.morse@arm.com>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, "Liu
 Zhiwei" <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>, Radim
 =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Vasudevan Srinivasan
	<vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li
	<liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Zhanpeng Zhang
	<zhangzhanpeng.jasper@bytedance.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <x86@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH v7 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Message-ID: <aqwN1szItGPg4Qjh@agluck-desk3>
References: <20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org>
 <20260901-dfustini-atl-sc-cbqri-dt-v7-2-ca2935d85622@kernel.org>
 <8230dae2-2cb0-4b46-8cec-dc4e281d4e4a@intel.com>
Content-Disposition: inline
In-Reply-To: <8230dae2-2cb0-4b46-8cec-dc4e281d4e4a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::21) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|SA0PR11MB4574:EE_
X-MS-Office365-Filtering-Correlation-Id: ef94e149-9c2f-4b4d-578b-08df14d4561d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|4143699003|10067099003|3023799007|6133799003|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: PqQTfVhe20iVALILY4XTxzH5RwzmlpGpgeMDGJdn+psGJnxglAUzaOQLEzTQ+HsZNT/ftaDtrB6RjznR4U5LQbZonLkLy/fhg/4+DeiZNUdQ57mjw+/VOEy9diYePE1iDw4vIF911t7xpQPfhpmgP/WeDma1dD0X1Hzi+MR1AOIk0g6y8mvA+mhzxjqYqVr6QhqqOlU3g0TBSwtd+QfawCEXEhhQ80i01SU/cqJ11y9iORLRcxLa1Yd9yYkb2DoFWpdodOdSoNSdsjc2MRoYmtDLrAA+p5XBgmMWG6BC/MHAs5FnPtD//bQMdE8NJG5M1Y4FVk6KehiQMUwB9oKvLoCj5a3MWLnFw29IeY7Ocvh/yEAMHtmhpPVuH6nLSoaqwH88h//wV1H7D9pU2sn0orj/KbZw9Bzz+vG7tdxp2AQcHy+k262BeIRl7y8kbKO/4wNWhBenCgwoD/ppQbw17gwjZ5cxSlKWwSn8DMMbjexbiBVMaK+l0fzUY8NgDKEom8/NL7xwzxAhCn4KO/45ZTyVyBq9tBD7WZ6BjyOuxi0aGQpVj31HaqzTn/0uHwlsGUVq1ZxUTc3JJ+m+pR0jiM3EKpJvqBBLyw8dFlWUoxeSp9+lWajWOjcKGjdLU9O/vB4Tje37fQqYfWr7gCZ4SSmOqnRIsSuE0NEB0ktRuGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(4143699003)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nAA1oENMIhkbdiQaBWQkWQuQhMHmzszY5lYUUE5Hex7z2yF74f83OxDm2m4w?=
 =?us-ascii?Q?tuiQ6Y3DUAUpv9chMkr0wx+zpFr3YczqwrBNsLFHL7oboEPO1Xpr9fMKvT92?=
 =?us-ascii?Q?6iUpK5zTwhQAHElCXfqGFO8mZmxKoea8lOQjj6oiTQOSEVTkpSsZ/SEIBm8/?=
 =?us-ascii?Q?Nls3IveVo29L40oZkRv712FQqlmyLwNpy3QcY1lkreP58JTdY268/NNUIw1E?=
 =?us-ascii?Q?tQy7IzRnh/1z13P/lYFFulu08DG0/P0X09SnB9y7RyulPneImw15kMek+1Jp?=
 =?us-ascii?Q?oZ0SiksTHnKl7NOAvqK3jRIIsh1Xh2Q8LnPOFzJtu0OXpBaicR0lN9d7gbqk?=
 =?us-ascii?Q?A4iGFj3c9qLIPDdSkxOWQrRvXWjONTPsDyDQ6+gvNK48chqGbWpemB2YHC4w?=
 =?us-ascii?Q?/2+tZVUI4SjtvUfZ9b+IL83RFs3nZjMHPA3JjwP6n9RdqJdlDh+OJSc4lpfF?=
 =?us-ascii?Q?5jz6036e2x1JJEPo7aCZQPDER+ES7sfrXhq9+7TTCjsIjFwi3XlNsNANZ2c2?=
 =?us-ascii?Q?x2WRxXq+2lW5mNYa455J5QzrXGZbRvX+SW1N9a3V6z3BVZeyye01YrZClVA4?=
 =?us-ascii?Q?iOejrXaBkiPbHJhPWA/j1uuVvhWqTUTWkDCocRdThnjMKTVCE8UiPTEvb+Ym?=
 =?us-ascii?Q?Ieeoor7f+EBMx3hM28R0WlXH9x2c+/GLSfFSzwKb0dX3efl+jv7mM9jj7DUN?=
 =?us-ascii?Q?ATRURcOO1m9uS1o1FXJpYG9fRzowdwpiji0uObfiJduwZsjUjae2yFQHtCsI?=
 =?us-ascii?Q?/sd6/9fFKKYftTMOMBh0TBE2rNtdS716ez/u0d80W85cCxnOkt8z5OnOSdWd?=
 =?us-ascii?Q?Z1nRj9hWJ0jJSueKUxQ2y82ueOnrHNI77n7DQPT6RiZeuieLHfEjdkH2N4Uf?=
 =?us-ascii?Q?t8ejChNQgMQvNZUei4EI+rPm+kwTFnFVNjuajur+gAiGH5i6LHV0mt8jiSpv?=
 =?us-ascii?Q?xrMrHv2o1u3euqraJ/y0vlSKle63bx+7wog/mQK9eJD7YSEtSHSn2NFopKqq?=
 =?us-ascii?Q?2m54HPhi6/XvTHqFop53rnMBi6wUsOnhD1LS0LfHj+2YVN9LFlotbYJi3dCq?=
 =?us-ascii?Q?rCBJ9QjN5Z3vJ1hx8ifQpArI8MsKGEllvWjALPlK5qIdA00AocV8DPUrF9zW?=
 =?us-ascii?Q?tx0vc3XzbBuTqwjtnxjMOyofz/4viPSPFv1NFbfqHqD21GpXSyYwCJD6juIQ?=
 =?us-ascii?Q?iKVGzpSHY0w297v1g3yHdIG0tp9tX4L66FcoSxv2Zc9AtE2fDX1vJ+Z2GCPB?=
 =?us-ascii?Q?7FTkDpANxPAxo96uFJomBMKKpDXgcuBz92TfWuQazaAbjFEJIcl+0dhhb3tf?=
 =?us-ascii?Q?eg4v5ZUteUFJt7l3yQrI6NvwtbKlBY1FfU1XOfV+gTzEX0wIhQB8dxkMrXR4?=
 =?us-ascii?Q?sr4VIciy0unkJC/EP+3xiaW3SIKx9J1OtvqHaZvZCv9RgaAL87XniJ+qkq4I?=
 =?us-ascii?Q?2LBuPQpuSfvYyQmjgtHasA7RG9nCq6Z3ItPClmAbIKQb0bv5KIJAKnPLNOG+?=
 =?us-ascii?Q?KVaJsQQIt92rcxayyPh8aChaGtDHESE1iz/DI1lEgPlSwTlIpZ8Lo48mf0V2?=
 =?us-ascii?Q?s/IYhnzDOGmjnlxgowuGBlN2DBIHcExUIcocc1YmrYnwaaJDNS00ArmJUKm3?=
 =?us-ascii?Q?FYQZQjO4//HrfC2y6mXOgciEv5GuSVKs5OI7ltywJxkvwoZFiAo0WdcD3xt5?=
 =?us-ascii?Q?VqgBwscUCd7fq3Feh56Ncqpkg+RhLW6ocN0FBRYW317VXYpuKAGdw3yE8cJn?=
 =?us-ascii?Q?2GZRcNQSeA=3D=3D?=
X-Exchange-RoutingPolicyChecked: OYIfpUBHS8gjaozYvx0Km/ViWIQvs0EiZ2qlKjYDMIXTQFeF+QwvwVBLD6KJo5a2fVknbBP9LV05B8mUTkv+dgT2miMBZ7XYIC1EfS+bcvoQuhG2eEyKNPscS1Kb/PW72JvEkzI5OIbDZVJ6Kjb+aavx36htd5Z93IBoX9MXSWqWtWlFitYvpgsbINH4ZMUgIKc8CI5NWxzMtMi01MUJLWAELSVajTeeEenXFNZuVB09O4XAbrx6GkfeB1pIeGBpcgTvmk+sJHp8ub6oalVsQBd8G/6BHK/h7ALdfW5Odgy/YuM3rCUnY+E5sFxd5v+LBgDmrd6Qf4C/07Es45Q44Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef94e149-9c2f-4b4d-578b-08df14d4561d
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:57:12.1876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6r+u/+MCsn1AVZTGvXWxEXWBOsyTFe1r4YVdvOH3FGr/HEUpbVTu2yuCl387CQMb/px9x7vCgQYmKLpkyI4cpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_085718_158642_7E6B85B3 
X-CRM114-Status: GOOD (  22.29  )
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

On Thu, Sep 17, 2026 at 08:37:43AM -0700, Reinette Chatre wrote:
> Hi Drew,
> 
> On 9/1/26 3:31 PM, Drew Fustini wrote:
> > resctrl exposes a single cap set per rid, so when more than one capacity
> > controller backs a cache level they must agree on those caps. A level
> > whose controllers disagree is left unexposed. Other levels are
> > unaffected.
> If I understand correctly, while attempting to translate to resctrl terms,
> this means that a cache resource with several domains may support different
> capacity masks in the domains?
> 
> I believe the "single cap set per rid" you refer to is
> /sys/fs/resctrl/info/L3/cbm_mask and /sys/fs/resctrl/info/L2/cbm_mask that
> exposes a single capacity bitmask representing the maximum allocation.
> 
> As you know, resctrl is in the process of changing the way in which schema
> formats are described. The most recent PoC [1] added new bitmap description
> files but it kept a single value "max" file to describe the highest allocation
> possible for a bitmap schema.
> 
> To support asymmetrical cache instances it looks like changing the interface
> to describe the maximum per domain (instead of one global value) could address
> the gap?
> 
> For example, if there is a hypothetical system with two L2 cache instances, one
> with a 0xFF max CBM and the other with a 0XF max CBM then resctrl could expose it
> as:

That sounds like the not-at-all-hypothetical Intel hybrid client parts
where P-core and E-core have different L2 masks.

> 
> 	# cat /sys/fs/resctrl/info/L2/schemata/L2/max
> 	0=ff;1=f
> 
> The schemata file currently and will continue to display the allocations per domain.
> 
> resctrl will need more changes to support different CBM per domain internally and
> until then all these CBMs will be the same, but adding this change to user interface now
> may set resctrl up to support these systems in the future?

I think Fenghua once worked on patches to support this. But I don't
think they were every posted to LKML. One of the open issues at the time
was how to handle the info/L2/cbm_mask file.

> Reinette
> 
> [1] https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/

-Tony

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
