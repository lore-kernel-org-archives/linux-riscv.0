Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CCCC6B12
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5Xf6ZO7JUgZWM4dbPsW6tGpcBz5MmVPp/4meXBuTbE=; b=jUouaLRJcWYewx
	a0XoKL/z9P8ClIL7sPuAY7mPrX/t9uYVtUQ9tvX4MKly8TRuwUhT96HRHPyFCQDSLm/HTicsd4ekt
	emO/Y5v0C0EGIMAgwZ/SE2GEU0PvIxx/8XUlGbGtEpxERmzHXPyRfxVFcbGzG1PuA43okV/k79RrD
	mZmCuzLVg4DZgruc4/f50T0XSyFH1kTHSWNjCrf/JVhadRVfidbE98BjaW7XbM3KLJkQ454cdcFBy
	HIED2I0qbzUiC85PDTJtCjHRRl1X96i8GqNizVTKEtTVK9bWw8DKDB0glL0+M+4D33fwhKTGo7kRW
	mnvN437IQMDkG0lcqjYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGerI-0000000DRKu-0DLo;
	Tue, 13 Oct 2026 15:56:08 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGerF-0000000DRJq-3iOL
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 15:56:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791906966; x=1823442966;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tUdhhqazPGqwL4bHSyO91jrWfN/geAnXT3eXbZJmU1k=;
  b=DnKpklDSZUUzVEu4Ky4of5mRmO7c8iPULZJydeMwsECStnAHj/yZbX2v
   M2mpmdF0nHBeUGCEOOj0skOLu0qO8OOc2/QnJ6Tmz9IwyofEe+sJo9/7f
   e+U4kA1r+XHP6xkt9U0N4mfu58FwBUe3VxlAkkMRY9t4WDE0zG6AWJmf8
   y4Oq+cBrQhR/J1g/IVf6AMlvFdW3hIb0iNpESrVsbLffAfNTSFl3K63up
   FJGn05AcnxumAPvYkSFt2xmymTL+LSeZ3tM26G8Ca7m3IxD5eUE/2gtKa
   Z61kdl16ZmEmradg59VeNU19rUrQkat+QSM3LSm8eD9a6Jz5TS5mQZ18u
   w==;
X-CSE-ConnectionGUID: UEDVVfn6SeGpOekglg7eVw==
X-CSE-MsgGUID: mj6J+vuMS+qqVzmJhrIYLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="641047"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="641047"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 08:56:04 -0700
X-CSE-ConnectionGUID: /XFTOCLZSyi9ZgO9/WLl0Q==
X-CSE-MsgGUID: MOMUAispRsm33n7ogyUlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1267123"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 08:56:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 08:56:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 08:56:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 08:56:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQTk+KH9CSondGO1bHRQl84rB8/23xYSrq+cjTFn82XYI94EoRzYmw1XXxcidgX0jQxB43hgA0GxuXIFMrpt4PoTdQEYthUHRkXr09iG78CStxMbi4O8fMCuV1hKb9U8qIAA0d1CHIhoY2cclg+1TU4G7uRuxw5VoEvobh22CHlY0QJ9wB1eEp9JzZ94P6X4TP4dzOeMIAzwInUzocr++BotgLSFeMTiW1vhe26BJgQCdV3kIt2yA6VgkkJ2AewaZpDSaSaX4CsLac0tFkVmn2iPzC8uuJQHJUIp0Dko4f6Bwd0tD8Ad+KCbEGi9QW2mxThwPXGS8QtvjMbqIW0naQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUdhhqazPGqwL4bHSyO91jrWfN/geAnXT3eXbZJmU1k=;
 b=KJuEo/vbw2jGJ+3/co4xCutCRyn5eDpsif6+aH0Pyi3I+G5yFlVsFfTkUMKjPiHcntiSWV9l/qWgeEBCXVwT7CJouRhcu9xvSzdOoqHUSU/wMFDKDtuCiKLjh2A8a5I4jxpWZ6CRGoRuhL2pSsmEBmgiZjJT5Wu0qtGd4Jo72d8bGWCD2ZrqUOGeSPu0mEdf7T1H0e82wLFHZ+DEGtMxvCtY8tDT49+chE0fR8YiIxFDnCBOWkHRrNKxzuDS4BFZ4cG7+ryTjRjU5otUzG/evUtT8q6XA4JfuO+sWoSiqcfsj2LJLpM2sjhcwDmL0JwrRwEcTB8pdtojS6jk8m4Mog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS4PPF30373102B.namprd11.prod.outlook.com (2603:10b6:f:fc02::1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 13 Oct
 2026 15:55:57 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 15:55:57 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "Chatre, Reinette" <reinette.chatre@intel.com>
CC: Drew Fustini <fustini@kernel.org>, Adrien Ricciardi
	<aricciardi@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra
	<atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, Babu Moger
	<babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, Borislav Petkov
	<bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, Conor Dooley
	<conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua Yu
	<fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai
	<gsh517@gmail.com>, "guo.wenjia23@zte.com.cn" <guo.wenjia23@zte.com.cn>,
	James Morse <james.morse@arm.com>, =?utf-8?B?S29ybmVsIER1bMSZYmE=?=
	<mindal@semihalf.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"liu.qingtao2@zte.com.cn" <liu.qingtao2@zte.com.cn>, Liu Zhiwei
	<zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Paul
 Walmsley" <pjw@kernel.org>, Peter Newman <peternewman@google.com>,
	=?utf-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Vasudevan Srinivasan
	<vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li
	<liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Zhanpeng Zhang
	<zhangzhanpeng.jasper@bytedance.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "x86@kernel.org" <x86@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v7 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Thread-Topic: [PATCH v7 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Thread-Index: AQHdOmHiBkXZvA3/GkWkPGt41t79rbbTADGAgAAFcACAJ2StAIAAbqQAgAEGiZA=
Date: Tue, 13 Oct 2026 15:55:57 +0000
Message-ID: <SJ1PR11MB6083F4281EDD036A4E73A532FC9E2@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260901-dfustini-atl-sc-cbqri-dt-v7-0-ca2935d85622@kernel.org>
 <20260901-dfustini-atl-sc-cbqri-dt-v7-2-ca2935d85622@kernel.org>
 <8230dae2-2cb0-4b46-8cec-dc4e281d4e4a@intel.com>
 <aqwN1szItGPg4Qjh@agluck-desk3> <as0Zeoyjiy5CW1DT@agluck-desk3>
 <eaeb4259-46d6-4656-8354-669ad32654b5@intel.com>
In-Reply-To: <eaeb4259-46d6-4656-8354-669ad32654b5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS4PPF30373102B:EE_
x-ms-office365-filtering-correlation-id: 7cc8afbb-91e2-49d1-3384-08df29427836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|22082099003|18002099003|261009223027099003|38070700021|56012099006|10067099003|4143699003|11063799006;
x-microsoft-antispam-message-info: t6Ej5OlqGHdrVnXn9Pq9E02QcBGlCXqstcS9Ar57/Gzgd6kbz7Tev5Man/YMTDoYIUE5P7RgzTOD/Yo2BJFjaopAZmQ4fWSIntp0BBrv5OeR+BoJnyLL6dbhifQsF7jrLFcGtJ/ELuofWAV+uknz04zh+R2iZm7w/eYV6EiVTO8DXC2NjSOf/92qgvO8kShBsy3DlrFwRSNkbGva0p5bduQqaQyLwBQQGpIhd4vaz/8eDGB6fINd3UM5vUjqChVXdlO9MEsBmm5u/oCx8nEbs9WXEcOanJ99XMRuV0So6sWf82RWz3trvAFRgr3mRTKEHsI/I0sIeEMAajKV8+VKBXvY3+Y5VKYiKmBjFe71hVdISDS3mjon2Hkgte8Uyjvk4MzTh2tqatk5cPaiynFNpdutKWw9azDNHUk8cH2foAZgMw0hbIeQDdWbHyoEX69Oq7bHio48SjwslUhewx0disESVL3otjUvB6Mqx8ZYjApx5gYfwemVcnF+oRTSU0IEoyXr5UeXNpn1k3rzCOgQPB01wjZ9Qa95860KmOaK61XNTuAWv1+3GqmmfthrbhQXCLpB8W0vQPr6tUIFLCCQWcrk/u7l4YudfVLYw5J+UfN+MeT5F+HaVsi342Keo/WulukzfNImlZqua2RBBeYElsW5XsiW7+Te4167fhNAX74=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(261009223027099003)(38070700021)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGJSYkNuaUdEMDJoM0FiU0VnVTk1VVZBWlVRK01mN0VrUXVhQ0FDakxrQ09i?=
 =?utf-8?B?SjJldkFIbFdKVEhsazdpbXJFZkhsaXJwRnY0blV6bzFMTlBBRGt3OFVtMkpF?=
 =?utf-8?B?WHg0UHdxeXdrVER0Z3J6YnlnNjZoVjJVdnNkeHMxUmxZaTg3UVdwMVZsWWN3?=
 =?utf-8?B?N2tILzc4aWtPYnZSdGlzY3pxSnVUYlJIUzNjYWlBZTVRUGdHUy96RTY3N1Fl?=
 =?utf-8?B?Q1lQanM1dTJsdkdpdC8rVzlPNmJLTU5NZDcycXhtcklUNW51ZFg5NHhPWHJL?=
 =?utf-8?B?RFR5K1NWWFc2SGtaUTdXZEFLc2Q0cDVJWGtpNVc1dVIyTy9KYTZRZERIL2xY?=
 =?utf-8?B?WDY3SlhNMlg2YVg1bGVqR1VMZWo2R041bDJCRHZIeXhKLzNQRDQ2OFBZazBw?=
 =?utf-8?B?ZUc0OGJ4TlhHYmx3cnFadm42bnNZWDd5SUEwT3dnMnlGZ0c5T2tkZ0V0Smdo?=
 =?utf-8?B?eEFnVW54eXlyMFNWS0VPNitGYnJaOHoxVDJ1cDBwVEZsOGdJZFNqZDNvL21m?=
 =?utf-8?B?U1VWNmRGbkt4OWp6bFZjZ1lEWWhyVXZnNGp3cS9ES1hyT2hJelJMM3RYZTZV?=
 =?utf-8?B?VDZsNFpHZTVxQzQ1QTNZVkZPY1pIYW5jUStUaDVveTd6dXlpWmZxOTZHTU1V?=
 =?utf-8?B?TVRWRE5tSDVyZkNXWUtHTzRlaDN4elV6ektOSzFORUFndjlTUk0zem5CNm1N?=
 =?utf-8?B?RXkvT0xkWUxPd1VQdCtJUGRXQXJJcG5PMXY2SkVLdzcvQ3pWL1M2RmFkTkhJ?=
 =?utf-8?B?L284TklhMEJFVDhrditHYk8wTHFXOFpVMDlMdFFnYXl3MzNaVEw3STFaSE5n?=
 =?utf-8?B?cDFMZ2JKdWJ0UjRheEc2VzlMblF3NjJrZlJncVRRZWVPc1NUMnJLclgxVTNk?=
 =?utf-8?B?WGRtbzBsa1Z3ckkrWm50QUFZeUFzczh0T3FoRE1BRGpacThKNTBZVHREYmwx?=
 =?utf-8?B?R3dHamtQM1J2WWtOZkdIcVZidUVOU0ZpVlhCNm9GZFdtRDIyUGFOdGVuVG56?=
 =?utf-8?B?TkQ2YmZDT2xOWG9iQ01pREI0SWRqVFpsbFRJTXg2eWtmWFdYR0pWUUFDcEZn?=
 =?utf-8?B?bGVZZG50RXhzSWFObXBPcG16eUFFVUtpK2QyeDZnUWpneVh5SndtbTRqdEFa?=
 =?utf-8?B?K1JZYitYRXI1OG8xZkMxNU0wNDMvYVRKamhWblZIV1JGeVc5Q0ljT2U0am43?=
 =?utf-8?B?b0IxR2JicWFiL2l0SWFWVEJLTlFPSkoxQnNQRm9WamZ2ZWUwS3Zmb3FyY3Vt?=
 =?utf-8?B?Wk5FTE9ER0c5MHplYk8ybWdLTUZSMzFXbDg5S2EvRkNnUlRhenZqKzcwZ21B?=
 =?utf-8?B?ZTdKOUR3S0M0dDg5dlh3R0MxWk4vMHhOZFJCZXZmR3VPSHlXcWlHYVIwU20z?=
 =?utf-8?B?NEh6cDQ4NEdDZlJVUFFPUVBiZ3JrYUtXQlFFeVMyckdsUk4zZ29mNm10Z3NF?=
 =?utf-8?B?RXFVb2FpNlpGejlQb3hJVWxiSWQyVEM2NE9DV0pjQVRva0ZvblA5YlJxU0Ur?=
 =?utf-8?B?VWJvR0dlU3dhdEsyV2lnRlJDVXJmYXRVdnFLTEtqWkhwM3YyR2p3empNbEZC?=
 =?utf-8?B?Uk5UMExaSFg5UU5BUXIyS0lPM3J4K0NIbEt1dHFxMW1CeWVqSmhXcE80ZVo0?=
 =?utf-8?B?aFRSQ0FqU2RjMklJTzcxTUljbGRXT21NZ2dnTi94NlZic2pnbzRqUlVKekEy?=
 =?utf-8?B?MVNOYXpVTG9aWFVsWXZYYjJtVVU4aGZteGlPSVVybVNGaDd1MEhBcnRwbGVN?=
 =?utf-8?B?UHNMZVc0L3hPcHBvcXhTT1ozem1pMkNJYjU5aHErZ3hzYWhmRUZSeEQveGhB?=
 =?utf-8?B?bi9FSGp1THhIMkw4LzFyWWozL204N1E5WGZwSlh0b1lmWnJYL3lmS040Tzk4?=
 =?utf-8?B?MktiUUJvTnN5Z3RvUTJTWTZXdVdxcHJ4eDVzM0VucmdqbTRmRlJUdnlWQUJn?=
 =?utf-8?B?MUM1ZGNaWExIVTRnQVdjTUg4WXNXaEN2RVU4Z2pLQWdRUWhJRXZ0QmR5UGxI?=
 =?utf-8?B?YW1KTk9abmFBUzNLRThTT01qcCtKR1JKbCt4MnNVaTVQZnMrOXRQRzRhdHhE?=
 =?utf-8?B?bzBMOTQrOGdNcjNoZ2dIYjJMVmIzR3pxUlF5QjVlT2pzOEdpd0NMUzZITFI2?=
 =?utf-8?B?WmlGV1ZjcUdOaDhEQUs2Z3BBdHQ3QmNzZjg4aThraW10TlVrV0NHeXRTdGJh?=
 =?utf-8?B?dUdqa3J5dUZWZWtuWitsMElEUkR4dnhQUjkzcWt3b1pVclVzNDdhcVkxT09B?=
 =?utf-8?B?WHBvd2hiMmtGTGVBL056UkZMMkVTRDVyUkM0eCs2Q3NPbERKbTNpeWJjNWNh?=
 =?utf-8?Q?oZGiYL/3KhnZu1QXo9?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aRiLQJbMrX/tx04/qaM0xho4V4YSn+oS66rOplaNKFGbYKNDuh2uYp8H2wRh7VIoN7iiJuJuysm7/cHerKarU+aMxwQP+Xd0RxX9pzeBQvrvxbRtrL/WbmSYMakJ8GJDme6PzFzw1H5MkHiClDV2xOfvVBCRcAM2gU3xfRQHqpG5FgUBCaVNAwNR8hnsEQB0rVakxmEBGPZVEfeH1g95B4KT4i9D+xLfI+fTRjfEKCzPiJlmu+WNzI4okTEXOblD8UC2ho2C1XcXx92QwtAl9fj934w007UF4/xXN6BjOrQ6SvNT9QtscimHvNOK6vjrcFGscF1atteuIaKtqS2SfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc8afbb-91e2-49d1-3384-08df29427836
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 15:55:57.0726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FB/BXvcYvWkeV9XgBHpT9dZHsUZHpLxvC0M0ucbNU85Wlej8RvQAB7kC1njfc5S0sWGhd8hJuKmTCEPiZDnVSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF30373102B
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_085606_007793_6A84BDC1 
X-CRM114-Status: GOOD (  17.19  )
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

> > 3) What should happen to the legacy /sys/fs/resctrl/info/L2/cbm_mask?
> > Just hide it? I also considered renaming the resource to "L2A" to
> > avoid surprising legacy code.
> The current direction is to have these top level files continue to return
> the properties of the default/legacy control while in "legacy" control mode.
> When user space switches the control mode then these files return empty.
>
> This is what is implemented in RFC v2 so you should be able to see it in action.
>
> It was noted as one of RFC v2's opens:
>       - When switching control mode to native the top level control info files
>         stop returning information. This could be considered "work as intended"?
>
> An example of this behavior in action as applied to "min_bandwidth" can be seen
> on slide 4 of
> https://lpc.events/event/20/contributions/2368/attachments/2066/4625/resctrl_2026_combined.pdf
>
> Hiding the files could also be an option. I have not heard strong opinions on how this
> should be handled after the above mentions of current direction.

My PoC hasn't implemented anything for the control_mode file so I get this:

$ cat L2/control_mode
[legacy] native
$ sudo sh -c "echo native > L2/control_mode"
sh: 1: echo: echo: I/O error
$ cat last_cmd_status
Changing control mode not supported for this resource.

But it isn't clear to me what legacy vs. native should mean for asymmetric L2.

Potentially: Legacy mode: L2 is disabled to avoid confusion with different bitmasks per domain?

-Tony
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
