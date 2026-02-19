Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D08E9A053
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1FTsXuwXCDzrFpLZxDV9rAPcY5dPEyYmEAqRumoq+w=; b=p5Vmu7qnbCtunA
	knfnl5azrQFrOepwZ3tTCxYijxIbm9NlOk/pbfNVD6OmYDWPzqrZZOkLMX+Pm3fJf98SJrktSbDaZ
	NNhTOe/6sMGgFxF/0DaXTWSDBQAaMdyhMXhZ6TCspj0DYpJT1UYOd+UXIJsX1HBmeNO+E6ZWPQJZR
	oOEosC8/eQ9NZiuMoVAnbhyEZMgLZgyPqsqypDXvaOh+PjfbkzxR/FIRMeAh4i/Myz9Dp+BCoJvc6
	mekLnN7tkcwjbkBd25Gug8cEOhHIydhkUM8AqrgGBan4lg9Ca4c3aVu9uj5EwGK+IAd3xqgqXgrol
	mnmns3pjLxWubM1+itxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt80t-0000000BiTs-2STr;
	Thu, 19 Feb 2026 17:40:31 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt80r-0000000BiTT-1Nxw
	for linux-riscv@lists.infradead.org;
	Thu, 19 Feb 2026 17:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771522829; x=1803058829;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IAa9jXsKFgw5anVJ0U46Llqxyh2583RrS72g9fcBH/U=;
  b=JWyUGJNbVy3biFYMU8qSS7Hgifh6uYi/gA3x9AzZ/8GsMRaMYhByIV2n
   N+YCObTa1T6lvCPl8++HjfRsqhDv80sWYmOmHpXO5s/qRVVmOb2Q9FNmD
   7EYN3/8dkdY5lUy2TAOCWW7HTPH/6guGyoG7WCJlq51dyLxNHPJOwn1/P
   jcLh4U3hgnezW6DV2LbqQ0zWgvEvN7T2afKzHW17e2rZeucuPUzrw154b
   XSwE/P4YKYxUXQrITS+V/I2PjmnGW2Y8WYs/gkwa2ToASKeaRT/4L1y/X
   IqYNpMi91qdF5/9utG8abGOfYX/LSax8cLhit5Li31wMGuSi9ueFLVx22
   w==;
X-CSE-ConnectionGUID: aTb8ehI5QACoU37XQibH2Q==
X-CSE-MsgGUID: N9wvDv5gTQSQ1sfp9GF9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72321062"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="72321062"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 09:40:26 -0800
X-CSE-ConnectionGUID: g7xsechrQ96g6ENMO6WMCg==
X-CSE-MsgGUID: RXUuxlKFQ7KDTRJJ6d+3jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="213233679"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 09:40:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 09:40:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 09:40:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 09:40:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CP2/0TJq2uqKHzytpTpgSixWvdSBgbIafGzqjxK1rZK89pYFeDafhsXjyV7HwOd0+RIp1jmT8aS8UZtw/LApbrwY51akti6booQMROge0+d5s0K8fV7iISN9XgwahcsNJs63bDgEU4KVfuIngd1YwFiWEE9JzT8Nh1EE+O4ed6te0ic2uPMwcbfQw2mpsiEALmoeonRtJKsp0nTS7CrZhkWqw3tCXnhWyYKZKsQETit13tR+SAv3/opwrtjCOqV2jdT1Qbd6/uDrVirLqaWPnD9l4JRHeNU1FP1pL9YEqaJ9BW54RIuLP53VIdmojtNK/YI4jnBeJ97+FYE/nZzcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAa9jXsKFgw5anVJ0U46Llqxyh2583RrS72g9fcBH/U=;
 b=LO3z04y3fPBxIi6i801J3G7uGRkWN9OPpXkkTRMlC3AjtLyNxnjs293H9XvxVFakbtXeI4YJGGAQJ7wA3bzBE8l6eAHDTf86MZMU2nnu8vYfdjaTDAepOzwK0EM3WBZVCOcWj+2xa5CRHk1oLNY/erPG7fkT4Ar4T6ZOyhy4C0SMNvR+icZLRA6HmR21fkO3UW675Z6YO6mKWiyR86Hwq8etr98l1JdJG5+0VNTFZjMG08n5oMbz3I7CQjOnJQMK5+V7DKVzz04XJdaBTyv/toS5unRmEV2J8NJfGjGE2DsitPA1Lg3Dppa2lyc94BdNeQInLRnjyf9TEGjdhTwIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB8435.namprd11.prod.outlook.com (2603:10b6:610:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 17:40:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 17:40:21 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "debug@rivosinc.com" <debug@rivosinc.com>
CC: "Yu, Yu-cheng" <yu-cheng.yu@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"zong.li@sifive.com" <zong.li@sifive.com>
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Thread-Topic: [GIT PULL] RISC-V updates for v7.0
Thread-Index: AQHcoRDb1MjTrqD39UWBYVZ0RnvrUrWJAVkAgABCzICAAQdbAA==
Date: Thu, 19 Feb 2026 17:40:21 +0000
Message-ID: <d1b2468975079ae4eda4d976dfa81bcb236399c4.camel@intel.com>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
	 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
	 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
	 <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
	 <CAHk-=whfQXKr3Sgoc7R1tPWFD3A1gEhUh=j7GGwz8yg_EQVhNA@mail.gmail.com>
	 <aZYZsBlH_tVxnZIf@debug.ba.rivosinc.com>
	 <196537b2933567d1781901f813a72ffffedd10fd.camel@intel.com>
	 <aZZuGYQUy11Gse7x@debug.ba.rivosinc.com>
In-Reply-To: <aZZuGYQUy11Gse7x@debug.ba.rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB8435:EE_
x-ms-office365-filtering-correlation-id: 2f223526-1110-4b17-b306-08de6fddf4a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|3122999021;
x-microsoft-antispam-message-info: =?utf-8?B?b3lqWUIwUmhlVUZ6ajluYllQY0Vnb3RmNjRMZTd2b2ppTHZsYUgxemdjV0xP?=
 =?utf-8?B?bFlGT1hkbHozUVVaVjY0NEtrRnZHVDB4VWFlZGwrTzRzKy8ybU9RWVFVN3Fl?=
 =?utf-8?B?Nm4yOUdIKzNSWWhVNEU4UGNRQVp4OVRRTW1QVkZ0dXZLWmhtb2VQM1VlN1M0?=
 =?utf-8?B?bHQ3UnpnRTJUQWNsRGsvTjV2Tzk3RytOQm9Pb3A0ZlBrU1d2SnR6WTYwTXpT?=
 =?utf-8?B?b2lYVVdidmJVVnpDTzMxa1B0VjdSeHdFbkNWNkJSSWp0Kzg5aC9lQlpXREJ5?=
 =?utf-8?B?TW13ZkVLNGNQREVWUmhrQ29jNDRObEFSTGY5cU5RRThldEo2SWZrcm9QUlFq?=
 =?utf-8?B?cG8vQkwwNFRvbjBIZTJLdTNaNEp2T0w1b2tLa05waE13OHdUNTh0c3lXcmVo?=
 =?utf-8?B?d2ZoT1R5RkgySnh4SnpnWXYwVFVDTmgvTXNRc2tyekZZNldPc3ZxajVGdVBT?=
 =?utf-8?B?VTBoNkxXK0Z1WjZoeHZYWk9pQWd5MEFDMkdTeTZiSmUwZWo0STJpVFViOHlR?=
 =?utf-8?B?b1V0RzZRckhEaDhVWkwyNk9FSjVvRkpIR0NRMTB0alJXUzlrZy9ZbUdHU092?=
 =?utf-8?B?SVlsOUl2L2cyTVZUVmdhTGpsSDUvdTltVVlCVEZwMVo2NVJJMGk0dUsycWdG?=
 =?utf-8?B?TmFndHR3YldaR09zN092RXVUUUhrSkR1UENZTG92bmNORk1CMFRjT0l4ZWVO?=
 =?utf-8?B?WXJwbTUvbk80N1o4TUVtYm9halpxaVJxOWJNdU00Ti9zQ1pGS1RpQTM4K1k0?=
 =?utf-8?B?RFhHOElJTUNmRXJtOXBsRWNLN2ROaG5PT0hXT2djc2RUd3hMZ3F2b1VOQjBl?=
 =?utf-8?B?RUpwdVlaR0JYVHR4MmlldU9FOUw3bENoMEl4MkUzTTJCSnBkQUk1ZzlZdjB1?=
 =?utf-8?B?eS92aFRleDkzdDlPQzArcXROQnZvaTRlZjZ4ZVppampxRnpyUUtOQUZROUFk?=
 =?utf-8?B?aFVyTHk2MkN1MFlXRUl0TlY2NWptMjlaT1lKQmN0cDEvMFYybDJ1V1pMbWZ0?=
 =?utf-8?B?T3REbE9ReGl1dkZ2ZkozT1NzK1dUTmRzdUhkSU5VTzZpWWRrTGpLd2FzaUlG?=
 =?utf-8?B?ekhwUmlVemJwdXlITis1aExxV2ptcjRtbzMwVE52b1NMZTk0RlNabmtQV24x?=
 =?utf-8?B?MWhqVG01bi94aGRQaUUyaHBSWXJxODMvc1E3OGNraldsVTJlYmQ4VGpHbGVy?=
 =?utf-8?B?WlFMRTJveDN2YVZjMGg3MCtwaFd6Sk1TYkZqUktYM21wMmM4Y0ZUc0kzSmUr?=
 =?utf-8?B?Sm9VZ2hMSEhETGNlemFxNEJOVDh0c2N0ditOSCs2Um1iVjZIVGZ3L3IrdkpV?=
 =?utf-8?B?VHZVYmlhSnQ4Q2wwUXZtS1l5UnZabWRPc0NkUlVDcEZYWDVDZ3UwZFkzOU1h?=
 =?utf-8?B?WDFWQ3VBM2ZjYTBKSW1wemhJQTV1V2J3czZORkR5Nk9JU0VvaVlTdVhCQ2xq?=
 =?utf-8?B?TFNzZENPTjNzYnJHRTBPWVlaeXBkdk1pTkJMcUxOUFlNejdmWm96OU9XQXkv?=
 =?utf-8?B?VVlKUzBtakRVOGZJYWYwaWNrb1NIdEY5UVZ6U0l1THYrRnZ5QlFacTNVT3Jx?=
 =?utf-8?B?OVJicDhHc2NtUk1lT3lxSkhmZ2ZnZUdmTzhOZ29XUWJ5SVpUcFpzbitiSTln?=
 =?utf-8?B?RE1DQW1JQU5abW9GZ2M2VEx6U0p4d0tlVFo1RHVKeC9zUTd4MUJpdmdsVUw0?=
 =?utf-8?B?ZXNXbXFkdFFpbE5MTUpQUVQydjlzcm5FakF2alpuaXptV1M0TW1GcnJUYlZC?=
 =?utf-8?B?TWRiVzBNNFFFd0VpeVNUMU5WcFFXeHVIU2xXNjlaY1VjMmhLck1KM2Rzby8v?=
 =?utf-8?B?SFdlZ3REVTJWSWJKcGk4eGpBWURIMTgzWkl5blJtZjl4OUJNTEt6dXpQOVE3?=
 =?utf-8?B?YW5VQ3J1Y3RiWmIrVVR3Qzl4bmhieXV0TU1UWm9JOW9RZTlzWjRXc0dUT2Jo?=
 =?utf-8?B?VHV4QjhiQUV1TUtTeFdzbTJjOWZZeHRPY0RXRjRvYVVrcTZqNG9mQmpPVzg4?=
 =?utf-8?B?ZXpGYm1vQkM5TjNYMmgvTWVPWjZ1Y1ZKR1hhQ2M3SjdoUnVqMWZUaTJ5YXJa?=
 =?utf-8?B?MFBkVFdUMlNkRE15WXdYRkc3TVpEOEVyeFhPdUhQVHVVcENGaWtmVDNqUTVS?=
 =?utf-8?B?K1BnNUg0b2R2RFVwdUg5VUJwTDRLeEs4QmNhMmVKSzRaVVBiVmJpZzNiS29N?=
 =?utf-8?Q?9ne8KOTeoYH08K4Nzpxd2PY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(3122999021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rnc1ZUg1VFczWVdDbVNBaDRIUXhXUDZaS2hGUkw2cWFWVklRWU5MNUdsc1pY?=
 =?utf-8?B?Z0FHYlNpMGxIS3pwQTRaM0ZTc2JtR1RRMmJjRlM3Z05EZ050OGRtYUpMUVZY?=
 =?utf-8?B?NEE5eUdKbVU4YXVJQ3FNWGlmTkFlTTI2NFVvRnc5YWdKaEpldC9SVzlGRmdu?=
 =?utf-8?B?N2RrMDJPVGtqeHJFT25KejlsQ2xLWWhGSmFDbm5zYXRyZGdZSWlDY2dNTU9R?=
 =?utf-8?B?N3JzMHluRVJRVmIwelU0TGtwNUM2SmhwRENvRmxyVFBuQ054Umx3S0NDWVdN?=
 =?utf-8?B?dXZNdGN0N0JMZ3BBUU5xRUI1eHRpb21QTUpFWkV1TnhkMExVOERoc1F5b0x0?=
 =?utf-8?B?dU8vQ3RZV2ZRYTVsOWFId1c3bkRmZ3VLc0pkeFFqT21HTVBDMENXcURwRVF2?=
 =?utf-8?B?STU2eFBhQy9NOFJ3NE5GRDFGZFh6Yms0bjZsd3lVczUyOEpBREpybHZ3VDAv?=
 =?utf-8?B?YklocTBKaCtFNE4vZm50ZGxIS2dubE1GVWlpbXFYei9ZYmJUWEk5TkMzZmVN?=
 =?utf-8?B?RlFGZ3NnNnN1RVpYdWhUOG5hUytoaVJTT0FZdXIzcU5kazg4T2Y0MVBYNFNu?=
 =?utf-8?B?cTdFT1duWnVIQkg5KzRkOThMRlhYOXhkeUNmVTNXOUpkcU1aU3duTGpsWFl5?=
 =?utf-8?B?UGFqS1J6S1lXTXljbitUbmlKOXVVb3ludE5QU2ZpcXMzcG1JRzhWTXVESGhp?=
 =?utf-8?B?eGhqUEcwc0NHZ25QOTV3a3dPSVVpUTJyK1haUEJNTExKNHBjd1FZRDFhWmNB?=
 =?utf-8?B?REdnR1lYTUhDYVg5aVdxYjVTZllvbmVOL2JpZUJVcGZLUmVuamhBVzhGWmVG?=
 =?utf-8?B?OEFhK0NMK1djUG1LZFhBUzYvVDg5L3FMSmMwclZPU3ZTWitnS3UvSHRkWUx6?=
 =?utf-8?B?akxOcEhNanlJcWN1SENBSnhqbTV3MnV3endsQXk0U1crQ0FySHBwbmN1SFJ0?=
 =?utf-8?B?eWhsN0N1c25VNFp1Q3QwT0QxMDZIaHF6VmNwUFMxS2xzZDZBdkw1UU15VHI2?=
 =?utf-8?B?WERkMWRrK05KeVVNVXdCZHBVUU5VN0I4dUhQMVJvOHFqOEtrdDIram9MQXVP?=
 =?utf-8?B?aHcrRGVkZ0dpaG9Zd3NtQTlwNWZNZzJsU005dnd3Z3E1M1J2U0pGU0tZMHcx?=
 =?utf-8?B?SjdsU1BZOWk1S21wMzUyWnA4SUZiK0szdDJWZUhIQklVRVN1TEhBQTlnWHNv?=
 =?utf-8?B?bFl0MWFjSDdVaG5LRERBdDNNM3ZUR3Q2OWxldGZmWW55a0R0TWlUVkhpdEIr?=
 =?utf-8?B?aUhKN1BXMENZQlpuWFhkOVZaM2JpNUxkV1A2YnZuanZxZnNkZW9pQm8yQ3RH?=
 =?utf-8?B?VkExb0lFOWhlUTJENUV4Um5zU1BTdDJrL0lIMGhneENpVnJ6TG1QSWtlS1lX?=
 =?utf-8?B?WXRhRXl0cisyVjNiN0FBQXF2OG5JeFFKclJjQlM1akEzTDVPU2l1TWdGY3lU?=
 =?utf-8?B?N3pwbUk1YTUxcFlsOHFpdmxabEVMd3pBZDVrcXVFUWN0eDl4TmhibysxVEg4?=
 =?utf-8?B?ZG1tOENabXg4bTVHSXh2MVhjWDlta09ZUGlnaDlmZmdRMlE4djJDS28zWXFJ?=
 =?utf-8?B?ZXV6SHhxRlR4THZHTEtWTWIxb2NWYnJ5WWlmN2lkM2dyRkVkT1hEYVBMbW9P?=
 =?utf-8?B?NHMwTjY5VDhzWmtpQVR2SXZyVi91cEtVTHBxdnJRL3NLZnZYckNTQW9LOVBa?=
 =?utf-8?B?bXkyWEoyU1hSQ084QThKenZBaGNnc0tnbHhRZDhKcEFkZ3ppVElSL3RKUURY?=
 =?utf-8?B?QWt2SFZvdlozR1BxQ2NvVHhQd1RsNS9XMnF5ZVh5Y242MW5YbUx0OFE2QVd5?=
 =?utf-8?B?bnNKTnVYV2p3ZzZUTUgvRXFLcHYyY2c2ZmNPNE1rTUoveHZqWnlpNFNvRGV3?=
 =?utf-8?B?dVBZZnNHWkNJRjBIcDh5WUtpN3pHRFpnRkMwQi9td29jTmoxaFlPc2taVWE0?=
 =?utf-8?B?aTE4S2FONFp4S0tUeVl5OU5ibi9Pa09hY1JKaFIyTEFBaTRqZUE2ZmNMeWc0?=
 =?utf-8?B?NWdlZE5iak4yWnVhL3pMNGhBUVllZUxDamlhTldnVHNZWVZ1Sld0a0JEcGRE?=
 =?utf-8?B?ak0wL2NLQnhJdy9xd0VQeDkvOHBkbmdwYUtGMFNISjhvUGJrMnJROWJqSWdL?=
 =?utf-8?B?ZG1Tc3k5TGFldkl1bDRKTnFodEVBYk1rMlp3UmRWNTYycjlrVm9kaFpkeVNJ?=
 =?utf-8?B?dFVJSjVBTHB3N0ZTMkQ1dG5PNXpaWW1sOXk2RmQ2Z0V5M3JSUUJXNW5ucERZ?=
 =?utf-8?B?eEVQKzNUZFFSdEt3YXRLUUNXdTJhMGIyMHFLRXBXWVo2ZU9xekF3aEMwTTUx?=
 =?utf-8?B?R3lDaU1haU1RUUcvYzNqNzNHVzlqek4zUkMzNFp6UTlkdVFYRVdCSUlONHU1?=
 =?utf-8?Q?K9P5XqvopfBaIjSg=3D?=
Content-ID: <64B6EFEC8D7E9C4C93FE008442082369@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f223526-1110-4b17-b306-08de6fddf4a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 17:40:21.5627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhIPHi2zi7q7TaF1/MiDaqN7Np6PUzkOMemVyOJikSsd6gjF52b+ol6+4EY2aQS3SeWwllnGfHfM6f9YNv9pnxkP/SZePV+dGYXDKQFKUGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8435
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_094029_454156_D003C87B 
X-CRM114-Status: GOOD (  16.02  )
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

On Wed, 2026-02-18 at 17:57 -0800, Deepak Gupta wrote:
> x86 doesn't have any equivalent BTI bit in PTEs to mark code pages. IIRC, it
> does have mechanism where a bitmap has to be prepared and each entry in bitmap
> encodes whether a page is legacy code page (without `endbr64`) or a modern code
> page (with `endbr64`). And CPU will consult this bitmap to suppress the fault.

This might not be the right thread to get into the gory implementation details,
but at a high level, I had looked at two ways to tie it into the ARM interface.
One worked with the bitmap, and the plumbing to connect it to PROT_BTI was
horrible. The other simply handled the #CP exceptions and checked the vma. If
RIP had !PROT_BTI, it cleared the TRACKER bit and continued. It was pretty slick
and small. This of course penalizes any non-IBT DSO that is loaded by an IBT
executable and is targeted by an indirect call. But it wasn't as much of
disaster as you might expect. I have the numbers somewhere.

> 
> As of today almost all distros and packages are shipping with
> `-fcf-protection=full` compile flag and that means all userspace binaries should
> have `endbr64` compiled in (i.e. modern binaries).

This is actually more of a problem than a solution. The automatic CFI enabling
dream didn't quite work. In the end, glibc made the shadow stack feature so you
need to opt-in via TUNABLE env var, instead of opt-out.

> This is a lot of throwaway work to support a usecase which likely doesn't exist
> because most distros anyway compile binaries with `endbr64` and even if such a
> use case exist, its perf characteristics will suck quite bad and security
> guarantees are also poor (worst of both world).
> 
> So my suggestion would be to keep it like shadow stack:
> 
> Loader takes a decision whether to enable forward cfi for current task or not
> (like it is done for shadow stack)
> 
> Hopefully Intel will deprecate legacy interworking part of Intel CET in future
> generation(s) and simplify it.

One of the reasons to use a PROT_BTI type interface was to make it work like ARM
for reasons like up the thread, but also because distro-wide enabling is hard in
the long tail. I think it would be nice to take the learnings from shadow stack
distro enabling and try to make IBT so that it could more safely be turned on
automatically, via a more flexible intermediary step. Like a "mixed mode" that
warns about mismatched executables, but prioritizes not breaking any user
visible behavior. But this is a much larger topic.

But taking a step back, while I'm still keen on doing user IBT, the longer time
goes on, the more it becomes an "if" rather than a "when". You probably
shouldn't count on any of this too much for RISC-V enabling decisions.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
