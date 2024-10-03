Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE592CF34D5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 23:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gm0KXC4N/wESCLDN9aE2IaVy9BpNcZNG11mjocaVac4=; b=b6xbJk7aXK543C
	79BtUEtgsec+Af5Dwb/YHTM2sHF+27ll5s7gmrXYM6QVBy1P3amZMoHEx6CY8ggwccrkDqdvME475
	5wC3oqv7Jkja/BRswIFrz/TvB9YGNJBCyYS2Cuue6t3AtWTOCoBx2sJT4FS3vMi7m4xEoXjcSgpva
	nNMlykOqm/fD3tfg9G3RoKn6ek7FFAe0EAEccF4HYZFEv6SJzzqa95T6mABwfL3we+Wldz9PkpXCl
	KWY0o64oaVBJFr3Nr54uJarQeDFDTLPPBn2Tr7W7fvzlWHmLp6ZSPYEevkVYA9o9HuLUXDM/RBZGp
	uFIb1bUG/MFtmWt0wyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swUzb-0000000AbAS-3I2R;
	Thu, 03 Oct 2024 23:12:19 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swUzZ-0000000Ab9x-04cf
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 23:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727997137; x=1759533137;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yIEz4IygsWlfI8cA8srg/hW285EjBnEky8O55OX9wDE=;
  b=F2T4SOiSo53NgfwJJF3wKyy9GnQP4SFuIV/aQ9aRWOTtmcpC1W3juJ1X
   FTOUrARNu6IgrqZhfvv3zY2HsF1/pvf6JzvnPbl0vq9UDjrbaLupWxjs4
   xxsvX+uk5OwgpwPlWeADVmI0syIKtVZU7Gi4xQvG7xImSUl5A89kCsLGG
   K/H1n/9zpaVO6iliWBCu+Egr/NizIh0A3/P9Hju1o0eXDVkItQkkoTN76
   9wWf+OP3M68Ijmlisw9U18RGYfig0w83AIAn5u4JxnJn8rEG7P9euaTKI
   0cJ1yzRhtU4l7/qbK3TJ3pBhfX3MTOtwefcbvHLu/GxiZjHHXaLCC06tI
   w==;
X-CSE-ConnectionGUID: ZeQzxHzkRN6VytfEQYplUA==
X-CSE-MsgGUID: XcNmhgjJQOeHZa7Bhc4toA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37817780"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="37817780"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 16:12:15 -0700
X-CSE-ConnectionGUID: 3SUREua1TniGYAkIhETHbw==
X-CSE-MsgGUID: SrmJS93MSvixjdjj7FO+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; 
   d="scan'208";a="74192063"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Oct 2024 16:12:15 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 16:12:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 16:12:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 16:12:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 16:12:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 16:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfVZZvbG4WGgOJ2HNUPU8/8cBGASzfKNIx7tjAKUFOFwRwwe90gf4wfwuHVKir+5g1zwsYTSo7KK2fckVK9PPhkvj8zsiD/N+p65k/aCIs/a75EJt3miHbCcquCMkfAB37tzXLoD7pUyOfzuSlrUxwkvSxaUahtVf13vDtRP9F7AKs/HI0qxscwX5ItckZiOSF/N+MjT3eADsJNymh+yqa9TkcUPDUxj+hgoj8QbTragHz4akA+WJHxYydvmkaP8l6arSwviqLKe7xaBwcRcGjk9zfXwhdKcjjH11Es0ixxUkSH+cqzBGAEtBpVRAyIlfE7KOir/MvbGBNl8cHgMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIEz4IygsWlfI8cA8srg/hW285EjBnEky8O55OX9wDE=;
 b=CFw+WJYecJ0NTdx5TreVjt6aDKkYJYb2thgLRis1fpnRTUHwgd6sDNBtgzZBK2v4ylA5YPTUajauJC5eIDGMHq11JZQqUzuhk6/h9rz4cPFlgDbYl2Z/SWZGGzFyzSChQILddpEaGeSwxAEsVnKasB7AI1l2YstQaMZWJ56ilFV4axQomSPz9s4+c/aOD6vzAI1pZ0n4JTCHBi1K3Nm8HQeZIOhkqkPEB4Qk4Zi4PHOKB7zAhkrdme0ZHIujNT6epb+x65ypup4LYjRyKh9OiOgdCZhr3yVqTsmAu6L1hTYgaKL8ownK8QAFAIuUdj1ET75oik3x5zhGDCF/W8+aEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 23:12:10 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8026.017; Thu, 3 Oct 2024
 23:12:10 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "kito.cheng@sifive.com"
	<kito.cheng@sifive.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alistair.francis@wdc.com"
	<alistair.francis@wdc.com>, "kees@kernel.org" <kees@kernel.org>,
	"andybnac@gmail.com" <andybnac@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "debug@rivosinc.com" <debug@rivosinc.com>,
	"x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "samitolvanen@google.com"
	<samitolvanen@google.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "Liam.Howlett@oracle.com"
	<Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"shuah@kernel.org" <shuah@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "ebiederm@xmission.com"
	<ebiederm@xmission.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "brauner@kernel.org" <brauner@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>, "atishp@rivosinc.com"
	<atishp@rivosinc.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "jim.shu@sifive.com"
	<jim.shu@sifive.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"evan@rivosinc.com" <evan@rivosinc.com>, "conor@kernel.org"
	<conor@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: [PATCH 33/33] kselftest/riscv: kselftest for user mode cfi
Thread-Topic: [PATCH 33/33] kselftest/riscv: kselftest for user mode cfi
Thread-Index: AQHbFBw+DXzApbj3vkCnLyQH439A27J0GpcAgADE3ICAAMmeAIAAAg8A
Date: Thu, 3 Oct 2024 23:12:10 +0000
Message-ID: <924a926814689c22a8c23ac08aaaef0723cca139.camel@intel.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
	 <20241001-v5_user_cfi_series-v1-33-3ba65b6e550f@rivosinc.com>
	 <fdf602e9-a8b1-4f62-9e26-bb62a7202d22@linuxfoundation.org>
	 <b4347055-46f7-4e06-b484-bbf147b80fe4@sirena.org.uk>
	 <cb25b144-a388-4535-869d-98220a601ebe@linuxfoundation.org>
In-Reply-To: <cb25b144-a388-4535-869d-98220a601ebe@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH7PR11MB5820:EE_
x-ms-office365-filtering-correlation-id: dc545753-6524-427e-daad-08dce400cf2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UDZRTW9Rc2ZYa3RxVmF4VkhwKzRWYjJRRUh6dElCVDJONEVVR1pZdTJ6QTJ0?=
 =?utf-8?B?SzZnVC9SYXZTQ2NOYWc5SE51N3cwODlVYkRub3Z4MXUyUG54S2Z2SnRkSUJ5?=
 =?utf-8?B?d0phOWtZTWpMMGZwTndaN1BoU1JWR3pjYjZQd2hQclRjdHVHZk4vdGxabEY5?=
 =?utf-8?B?bmZnMWpEMFcyRERPZUkzeCtTYml1UkZqcy9zNTlwWXNadDZxMDJ3cjRsNzJN?=
 =?utf-8?B?QytZb0JML1ZuZWRtMnB6cmZBdlM5WnJ3TG5vcWRpUHJmbU05UmNDVWIxTW1J?=
 =?utf-8?B?WVBUUWROa2pQdDFsT1Z3L0MvVUlIYldwS3poYzBiRkgwWkJ3NUVhbVhKbm9u?=
 =?utf-8?B?NTBkMTQwcEYyYVhMT0lpYWsyNkxmdXdYZFhEZVhHU2JKVndLeDQxK2lCOVNr?=
 =?utf-8?B?MFRnQXBucjBmRW5mZ2RvYklVbElUV3JQUnNEcTZodjdpaHNMNmg4R29RRVlx?=
 =?utf-8?B?YkJwTm5LdWdJSG1OSFF3MHNwSitNNktCUVJpV0FBME1DTm1PNGg2a1FwK0pG?=
 =?utf-8?B?QUVhbGFVOHBHcURCSnNtdTc1dktXTlR0V21lUm42aStDeC9vblNQWUNiMXl2?=
 =?utf-8?B?TFJJY1hPT0RvZ09JVTNaTE1NejFwQjBLSFREMkVudG5VcG80OCtVdWY2SjY3?=
 =?utf-8?B?dXZDdTM5YW5SN3dxUTVnWlFSZHorN3ZveEU1VS9lbnFxMlQzUEpUT0gvYlFz?=
 =?utf-8?B?Z3g5M2JES25DMlBBSHJ3WkdsakJ4QzJCRkUrRFk1WXNuUFQrRVFCdXFoYW1v?=
 =?utf-8?B?aFE4QS9DVkpBaVlVVCt1UTZpeWFQWWIyMkhlSlA2WGU5MDZma0lPc0pNaDFO?=
 =?utf-8?B?UlNGK2Rna1Rta3o0K21HYVEvWlN2TFhlMUx5RUZ6Sy9STDhPWlZXSVNneFcw?=
 =?utf-8?B?OCs1eDU0dUFKaUtVNzQ2YjJ2eFNoSG8zbURwV0FVN2lWd01YZDhBOVdSODlB?=
 =?utf-8?B?SjUzVmpmRXRhWUt5RzdiS3lEUVdtNm9NWnh3a1liMmp4TGVRRXdnUEhYRloy?=
 =?utf-8?B?dHJ2REhyUUdyYkU3dHBsQnVlVkJQYjJJTnJvaVBqUUhPd2VQQnM4NjlCeVEx?=
 =?utf-8?B?WExBZElyNWtKTW9odytrUGdoWjNGODBXNlVjcGtxcHYrck0xKzVrcE1OL3d0?=
 =?utf-8?B?UTZRR1A5NmVpeTNGVE0yV2lQQ3doTEdmYi9mYjJPUnhwOTVuUkhscm1lMEZo?=
 =?utf-8?B?TkE5cGQ5M2p4Y2hSYVZwM1lPMTRpQWpRa3Q5azBhRHNIMklUaGt4QitDVEE5?=
 =?utf-8?B?bStLMjJ4TzlHLzhRcjBTd1lpZFExeHRLSzdzMkdycmNzcTNBN0xENzRJQzc2?=
 =?utf-8?B?R1NTallpVVcwS2RKOW1UZ09FUXZtMk9PeThiOE80ZTZBZk1YT1FsNUd3UTh3?=
 =?utf-8?B?SFl0Q2ZVOVY0eHVjWVJwcGxmRE9lY3A5ZkFuYXJ3YWxacjBjWFoyMDZwakJ5?=
 =?utf-8?B?cnVtTUZoTDczVVpvQXRNZ3NSa3Y0QTlFVVdtZXNlWWpuVHhiY1ZHay9VZlNL?=
 =?utf-8?B?NWs4eEhkaTFjOWVSdmxsNkJiMnZ6Q3lja0NyQ2Irc2dNTnpxVS9hRk9udGlh?=
 =?utf-8?B?S3JBZmVXVkNmUXJ4biszVTR4RjV3SUVLWFEzeUpKSFE4VmF2Uk5WMnpIQkJ1?=
 =?utf-8?B?S0trV0tuV3FkejVYME9MQjd5VVd4ZjgxOGhlK3Y3SU5neURhaGtNS2dzbTVV?=
 =?utf-8?B?TVdnOUtjZzZ2eUpvSG9GMXNsUHRNa1k3WEJCSk4wcEdRVktyRHJOR2RjUFo0?=
 =?utf-8?B?T1crcGZKNG9pc3F4S1RRZmtzZDVNTGFoMzhqTkh6WUVBdnNHOUlMNG0vVEN0?=
 =?utf-8?B?L0U5eXVvNXVuUklwMHpwZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFM0WlRHaWszSmpiSC94WUkwclNHdFNub0kvWnZ2aUdNamZBNVBnQXNXOHVP?=
 =?utf-8?B?TENpS1NuQjRSYWh1OUNsUFJyM3VTWlNCa1pZUDljLzNhOU93aUtMMkMwWEh2?=
 =?utf-8?B?R00vY25tbWlDZklKVUxyM3NUd1NkWnVNSnBoeGZDYyt5UVpNVy9ROHR5OE9E?=
 =?utf-8?B?NVpyeDZ6TFNYYlhDVUdtMjFURFlwQjhBbWFrTkJrRUJxem1ORis1enBtblBh?=
 =?utf-8?B?VDJtamFWNVU2dnhON2NVYzBsVUJHQ1lTc1FBdTlLTUU4eGRNQUdJWkh0SEI3?=
 =?utf-8?B?SXJzQTBuSXN4RkxyT0F4U3Noa2V6Z3I1Zy81UjdhNmdFOElBUmtOclMxa1gr?=
 =?utf-8?B?MlBkaGduRTdSREFHUzlXUFlqU1B1MjNMS0F0TEZWTHRiMjRWaGRLZHRlRENi?=
 =?utf-8?B?OEZ5R0grcHN4OGNnR1F4SnhzLzFKanpvcGFLZEE0aWM1UEg4RDhobHJPRHFv?=
 =?utf-8?B?bjUrVEJ0N1F3WkR4QUJocXE2eFBucE9udkxOeTY1NzRZVFhzQ1VLbWNxRTVI?=
 =?utf-8?B?RDFBSGxIUTJkRjZrWkdtdXhmVkh2UDRVT2pmMVZqY3ZyWDcxL3ZZbzZaNGhr?=
 =?utf-8?B?U3h6dGJTa1pud0RhQzBWbG93Nnp4VWJSNzlkZVFYY3JOeXpHWlhRcFF5b21U?=
 =?utf-8?B?RnRIUzI1bmE2b2VOalBkS3pWSjY3WmhyeFhoc1FMa09TM1BGYnl2dTh4YWJT?=
 =?utf-8?B?ekFtV1RER05odWd5QmVSb0hSOC9KOHAwUXh6QnU2Wmsyai9lR3NDNzcxUkFT?=
 =?utf-8?B?N0hFZHd0aGx2ZkpvQUtIeCs5TElpMUJ1Q2YxazFsdXhWZi9CU1p1eEU1cFR3?=
 =?utf-8?B?K3NtWWVnNUxjNXpBUENGYUt2WnhzS2tKTTR2V0NWSWpxeit3djZLb3Jrbk11?=
 =?utf-8?B?TFFtNlJIL01HM2duZFRlTzRiN1Y5QmplUDBERkMxUktxeE5kUnBobDQ1L3p5?=
 =?utf-8?B?U1ZaZkhNVFpaWnQ0dExGTVNVWTF5UUVsRHZqemVDam0yeDhmZFUrOXBRcWJv?=
 =?utf-8?B?VWxLdW9mNVBVbFp3K3lGbW9CNXZMd3ZXaC9YeEt4T2xka1B2MEo0TUhhTVdT?=
 =?utf-8?B?bGpybk5ZZ0hheGVRV0d6MVBvWnpqUHZTZGhLRUo0NTQwYWE5ZXdpam8wSG15?=
 =?utf-8?B?Z1JWQzc0czBmWUZTUGo1Z2VvVFBrOWhuUEtqSTB3VERrR3NCRDlLeFBPOFc0?=
 =?utf-8?B?dmRZc3g2SjNvN1pGNUYzV0pUWWlqYnBXZnJla0dFa25TazdHS2RTR25nWXNG?=
 =?utf-8?B?OUdYT2hwVVlkZkxKL250dWpQM1ZOY0pKc2dLcE9xcDErUkRodE1DSUE1dCti?=
 =?utf-8?B?YTVNUURxWU1xUTducWhiUDM5UTZoMitzc0tweUhiM0xRWXQ4Mkk5SGtQYmlh?=
 =?utf-8?B?NUpKd0VoZGZXNTRBdmpSUW5JU2FqYVg5NTZRWndlVVJYSWNMUmY5WDVoZCtz?=
 =?utf-8?B?SlJGN3dTL3NUS2c4bERWNU9pcmF5MnlhbkEzWFVqWG9yVXFXOHBRVGZJSFZj?=
 =?utf-8?B?WXQrN0xNWnNBcyszaEc1bTNqUlNlRWQrbFdUUFpGNkJ2bEhxaWdlOTVKVHZo?=
 =?utf-8?B?VXRhY0JzWDFONjA5R05kSGU2WFREYk1JTG9QU0s0VlRoSFFwMnB1RjRIQVNE?=
 =?utf-8?B?VGZWQ2dmeEJBK2xFL1FIenh4K2VuT1dCcVYycUppOXNvU3IvOXZwL1ErbVls?=
 =?utf-8?B?NEVtZHpTUUhBMmE3WThBRFZsV0JYcXA3RGZ5Z0RKWHlHZEJCck0ydDl1ZWRp?=
 =?utf-8?B?L2ZxWVVRMTZtYzdHREZPU2ZEb1YvUmtSUklTaXRIQitEYUttOFE4VTR0Zlg5?=
 =?utf-8?B?RnlRS3RDWlI1ejB6aDlwWFZGQlVzVVJ2OGIxOHpWQVVlTCsvdHVkRXF3RmRR?=
 =?utf-8?B?ZUNWNGJhZ2VDMWk4a3lzUWoza2gySGdPTi9CZEtvZUplOWRlWWFpeUFyRnlr?=
 =?utf-8?B?bmVaUTJyelZEOTdZVENQN0tvNTg1b1RibEJXMTVuWEZQZm1Vck5GSUlVS3Ir?=
 =?utf-8?B?L2ExeEE1RGw2dXlhUElqYWZ6dWdUanJ2dDZPTEdweUdkc2lUTkROcGdXKzZG?=
 =?utf-8?B?RHRkT2psSlR0b1FqY2YxdXFoamFvdkthdVg4b3pPRHA5eUtrVFIyQkVSbHdH?=
 =?utf-8?B?TUN1MGd4a3NBTERMUEErdTA0Y1Erd2UwMFBNYnErK1lKQXpZSk1yZ3BqRVBp?=
 =?utf-8?B?Nnc9PQ==?=
Content-ID: <5352F571FD1A1F4E83679CA0937AD5EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc545753-6524-427e-daad-08dce400cf2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 23:12:10.6600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mkK7OhwaRxT9Fd394sounp+S/r1VNc0f6lvjGFUTkZftxNOkTfhA2bWRZJTqZyEbvkzZokZP2xO3absd4bSTIy9qMEos6E7g6z5+yRv/Lwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_161217_099662_BA9D8C65 
X-CRM114-Status: GOOD (  18.03  )
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

T24gVGh1LCAyMDI0LTEwLTAzIGF0IDE3OjA0IC0wNjAwLCBTaHVhaCBLaGFuIHdyb3RlOg0KPiBP
biAxMC8zLzI0IDA1OjAzLCBNYXJrIEJyb3duIHdyb3RlOg0KPiA+IE9uIFdlZCwgT2N0IDAyLCAy
MDI0IGF0IDA1OjE4OjM2UE0gLTA2MDAsIFNodWFoIEtoYW4gd3JvdGU6DQo+ID4gPiBPbiAxMC8x
LzI0IDEwOjA2LCBEZWVwYWsgR3VwdGEgd3JvdGU6DQo+ID4gDQo+ID4gPiA+ICsjaWZuZGVmIF9f
TlJfcHJjdGwNCj4gPiA+ID4gKyNkZWZpbmUgX19OUl9wcmN0bCAxNjcNCj4gPiA+ID4gKyNlbmRp
Zg0KPiA+IA0KPiA+ID4gPiArI2lmbmRlZiBfX05SX21hcF9zaGFkb3dfc3RhY2sNCj4gPiA+ID4g
KyNkZWZpbmUgX19OUl9tYXBfc2hhZG93X3N0YWNrIDQ1Mw0KPiA+IA0KPiA+ID4gV2h5IGRvIHdl
IG5lZWQgdG8gZGVmaW5lIHRoZXNlPyBTaG91bGRuJ3QgaW5jbHVkaW5nDQo+ID4gPiBhc20tZ2Vu
ZXJpYy91bmlzdGQuaCBzdWZmaWNpZW50Pw0KPiA+IA0KPiA+IFdlIGhhdmUgdGhpcyBpc3N1ZSBv
biBhcm02NCBhcyB3ZWxsLCB0aGVyZSdzIHNvbWUgaXNzdWUgd2l0aCBkaXJlY3RseQ0KPiA+IHB1
bGxpbmcgaW4gdGhlIGFzbSBoZWFkZXIgaW50ZXJmZXJpbmcgd2l0aCBsaWJjIGluIHNvbWUgc2l0
dWF0aW9uIChJDQo+ID4gY2FuJ3QgaW1tZWRpYXRlbHkgZmlndXJlIG91dCB3aGljaCBzaXR1YXRp
b24gb3Igd2hpY2ggbGliYyB0byByZW1pbmQNCj4gPiBteXNlbGYgd2hhdCBpdCBpcyB0aG91Z2gu
Li4pIHNvIHdlJ3ZlIGdvdCBsb2NhbCBkZWZpbmVzIGxpa2Ugd2UgZG8gZm9yDQo+ID4gdGhlIE5U
XyBkZWZpbmVzIGZvciBwdHJhY2UuwqAgSSBzZWUgeDg2IGlzIGRvaW5nIHRoZSBzYW1lLg0KPiAN
Cj4gSXQgd291bGQgYmUgbmljZSB0byBmaWd1cmUuIFRoZXJlIGhhdmUgYmVlbiBzb21lIGlzc3Vl
cyByZXBvcnRlZCBkdWUNCj4gdG8gbG9jYWwgZGVmaW5lcyAtIHRoZSB0ZXN0IGZhaWxzIGlmIHRo
ZSBkZWZpbmUgaGFwcGVucyB0byBub3QgbWF0Y2guDQo+IA0KPiBEb2VzIGluY2x1ZGluZyA8YXNt
L3VuaXN0ZC5oPiBmaXggdGhlIHByb2JsZW0/DQoNCk9uIHg4NiwgaWYgeW91IGRvICJtYWtlIGhl
YWRlcnMiLCB5b3UgY2FuIGFkanVzdCB0aGUgTWFrZWZpbGUgd2l0aA0KJChLSERSX0lOQ0xVREVT
KSB0byBmaW5kIHRoZSBzeXNjYWxsIGRlZmluZXMgaW4gdGhlIGdlbmVyYXRlZCBoZWFkZXJzLiBC
dXQgdGhlbg0KeW91IGhhdmUgdG8gcmVtZW1iZXIgdG8gcnVuICJtYWtlIGhlYWRlcnMiIGJlZm9y
ZSBidWlsZGluZyB0aGUgc2VsZnRlc3RzLiBUaGVyZQ0Kd2FzIHNvbWUgZGlyZWN0aW9uIG9uIGl0
IGZyb20geDg2IG1haW50YWluZXJzOg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZJTJG
ZHVoeVNVaWVxVVdvR1hAem4udG5pYy8jdA0KDQpJIGRvbid0IHRoaW5rIGl0J3MgZ3JlYXQsIGJ1
dCB0aGUgb3RoZXIgb3B0aW9ucyB3ZXJlbid0IGdyZWF0IGVpdGhlci4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
