Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9A2CF042B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FO0rrLgFuJbW+5nJu85XkT/HNHfuK6cI0KKcODpxR9w=; b=YkWV/UNHG0G/v3
	QwiK0kU/HxTBNUwhrkavduSXtPFpHDtIx3IQ4cu8KupmyBOP7EO312ZXY0FoLuiOCawhxCFJI9gDq
	MCCl2mHkYabcBVJrf4ymhH1MLIJv3afYErI0aIfRryTKhb+agpWPAu7aIVeG63hOUSG9Lt/Xtzgas
	P18P4oz+edU5UkimN5Q1W5T3Kz/WluV7YCNfUhavIlsxqHFi6SnkNifYBP7C7U1klYwzdSqb3wHKL
	l9DI+i1J0I0WdNtRtMpLnYdE1vOFl/wqgFvc4PSM9VmiDIGN10+n/oxu5ljX6JqqkJb2KBNW7h6i5
	wkF+ZFLL2PlYYY51TCkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJfx-00000007QsZ-3QGE;
	Tue, 08 Oct 2024 23:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syJfw-00000007Qs9-1Uqc
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 23:31:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=+GUkBXoLbsR04iGGS/h7GIcYd/UFn8ZQK6WIjMp3kXg=; b=C6SawKzNe4RNknR337rIs1wT8t
	G2J/GJwwgDXj3FqSdWisEymsICGJWsymBJo+vZ/zblmd0vIHAy6VEE2gZFxeP4Exl60yULpblyqT7
	DpICtFoJFy2iOpdNL3/YQRrTet/8kSrYvduRh8XJMTApzh281tgOGlS+g9zVhnta34c52AH18fBwE
	3NlH1GYmvC2W/eseGiIRXtWgbwRKTDblUxSTxODLRaes3GjYUlLCKS/mseqT742r0H9AVBtvx7UFd
	wTuwG+DnYGN7zs6NSJKK1y1PGZl1LLjWm266vx4GCtTSpWoNMfL/jBffMVfaVTYVJdE5ICgUqamJO
	zy1rEHcQ==;
Received: from mgamail.intel.com ([198.175.65.17])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syJfq-00000004kr9-0s87
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 23:31:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728430286; x=1759966286;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+GUkBXoLbsR04iGGS/h7GIcYd/UFn8ZQK6WIjMp3kXg=;
  b=agw4cCCmKBZxLWau2e/xTePjGLeF0WoSgs126tyRXZcMByDPk2j+jW5b
   sxbYEQeA0wckZPVXMuxXDzB6CqMggbM4HOouH9UpfAsoUMqb28VvWsiuN
   FkRiuFFMukA2IJm6e5Cx6tcjgtp4LyNi42hKxjlAFAybtUpnhykRgnhUi
   vQPtd0LGPtLDgapvqXwXxObovwXgsPEN4ayKTR5xYUz8gHPRfboGZEwZZ
   ERsY+oM+uceJ04bQiAG6nNU6ekUm3+uGwgQyrdTe5MeZgor363rGxsIwe
   x1QArYZKCZXkZux6dPswxFpA0JiZDKnNwvvkNWpndmXw8hhbUeG7xq5LV
   w==;
X-CSE-ConnectionGUID: kjRUAcuvRga/AhZ5h6xwRg==
X-CSE-MsgGUID: g2xir93DTNO+Wko+UP+HfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27810836"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="27810836"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 16:31:21 -0700
X-CSE-ConnectionGUID: Odios2NuSNGow/11DQPyEA==
X-CSE-MsgGUID: 4iD1LLb2SQO19fbNYvEEZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="76148996"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Oct 2024 16:31:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 8 Oct 2024 16:31:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 8 Oct 2024 16:31:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Oct 2024 16:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvR9oTW7hkJECwUQm6Iv0KulGOiUdLUmZ9dz2q0RGRIEJltCAy2GVbcQ/+8rEbOWTbML+FaL7pQQw/gkeU8mEdXQ/UoKxI5G/dUgA6dvUHknSER/ue2XWP0+UWpvkscK9COoLARlqnaEzhQxFJ0cl/ALzcYCBBe0EOUUdUqcQT5mKn1qHeDmRlpAuZvQKaQgkwIyk+2oym6WUe1duHPtv6CbihJ8HZBMvVh9IVFMArQn0bvJzqHbJXLKkbc567IVop8rnJcCRlxXFgq9h04gXOGSBLljUL+P2QmZlzASe1D0HPwPC1m3iS+biUynh6vkfodzYkRo/5X4jEZjp3pdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GUkBXoLbsR04iGGS/h7GIcYd/UFn8ZQK6WIjMp3kXg=;
 b=zW47GxiBUq8M0vMr2+MBRZqj/WZMbLGkMWxj+cV1TnIbOVp5ySClhfBghitzL477Q94c49C1GHxKWLsIup8v7Mq45+wsrFrQIqeHzIOQOroKabCXaOAFush3vISvFNnZzRv7q2grEU/t1S4P4oQ4MylqNiCqXgSRJc2oc02O7I3RBdOzNpSdWPcXfMWKgwTlzJbFr0fzNmUUw9qgIRE+ESI/l2LPxHl+2iLY5/KhA30htrkEWyAUrvsJiCnWu7mF/CrL0TgPoUoB+ofIo+Rppc8xt/FzflFmavfEqZLUJFKa3ruWZNFWDX3VFe6ZvNz7lqH37QMqxYBxyLzHmgwL9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM4PR11MB7301.namprd11.prod.outlook.com (2603:10b6:8:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 23:31:16 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 23:31:16 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "debug@rivosinc.com" <debug@rivosinc.com>
CC: "kito.cheng@sifive.com" <kito.cheng@sifive.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "charlie@rivosinc.com" <charlie@rivosinc.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"samitolvanen@google.com" <samitolvanen@google.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "corbet@lwn.net"
	<corbet@lwn.net>, "kees@kernel.org" <kees@kernel.org>,
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "andybnac@gmail.com" <andybnac@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de"
	<bp@alien8.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "arnd@arndb.de" <arnd@arndb.de>,
	"jim.shu@sifive.com" <jim.shu@sifive.com>, "vbabka@suse.cz" <vbabka@suse.cz>,
	"shuah@kernel.org" <shuah@kernel.org>, "Liam.Howlett@oracle.com"
	<Liam.Howlett@oracle.com>, "oleg@redhat.com" <oleg@redhat.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "ebiederm@xmission.com"
	<ebiederm@xmission.com>, "atishp@rivosinc.com" <atishp@rivosinc.com>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"cleger@rivosinc.com" <cleger@rivosinc.com>, "brauner@kernel.org"
	<brauner@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "evan@rivosinc.com" <evan@rivosinc.com>,
	"conor@kernel.org" <conor@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
Subject: Re: [PATCH v6 16/33] riscv/shstk: If needed allocate a new shadow
 stack on clone
Thread-Topic: [PATCH v6 16/33] riscv/shstk: If needed allocate a new shadow
 stack on clone
Thread-Index: AQHbGdLZKp0M89bQgUujzl7/KIk8xrJ9drAAgAAGPICAAAPEgA==
Date: Tue, 8 Oct 2024 23:31:16 +0000
Message-ID: <93a3315b3acd8a0585fe266bdfdbd44e54aabaee.camel@intel.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
	 <20241008-v5_user_cfi_series-v6-16-60d9fe073f37@rivosinc.com>
	 <aa75cbd142c51b996423f18769d8b8d7ecc39081.camel@intel.com>
	 <ZwW9m6pqcTFBovuG@debug.ba.rivosinc.com>
In-Reply-To: <ZwW9m6pqcTFBovuG@debug.ba.rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DM4PR11MB7301:EE_
x-ms-office365-filtering-correlation-id: 0edcf508-6321-41fb-6de2-08dce7f14e31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YkZZWXp4OVdzajVXSFMzZndVQmRwbWsrcCtRTHB1UVhxRTNVMmNWeWpwZVhs?=
 =?utf-8?B?SGtGUTBYNFNSMTdKeDJPejRpZUgzelhSdUtQd1ZLMnJ2bWtnQkcxT0VualhK?=
 =?utf-8?B?azVrLzA4RkhWTnF1bHZKa0lFK2l2U2pic1NpdWh3MWtwVVhCOUtKS0hjQ2tL?=
 =?utf-8?B?OHUxN0hzOFdVVWdUMFE4eUVQV2JJajZrZ0FhTTNUbElJdGRCYjdnaGNMU2d3?=
 =?utf-8?B?WFFUUzR0QlFHSnZobW1pSklmdWxYaGkyM2NkQ3FDREJrTkluMGRuU2hFQm9v?=
 =?utf-8?B?VlJCQ05jV3lrcUs5TWMyUzducjlmSk5oc2hZZWJiRVFpS0xBT1Yrek9Tbkpj?=
 =?utf-8?B?U1J4MjBLdVNvL3FmdkZEYnhyaTJ4WVdaTndDUTRPM2FhclowaXVaRkVOU2dX?=
 =?utf-8?B?VVNFdktNQmUyL3gvMGtUY3NvZU9DaGovalYyR3U4MkxrQXR3Y2c2R2VTOFpS?=
 =?utf-8?B?YWFXMEZINWpFc0RMYXZic3lHTXFJQlBycVRLWkZxS05JbStZYWR1L1JaWkU4?=
 =?utf-8?B?djNUWnYxak5HNWFSNlIvNTFFMkJhYTRDUGIyd2kxd1dITDVHb2YxQ0ZTa2JP?=
 =?utf-8?B?VlMvZzZaVWd1UXQyMjE3RmVtdHJ4UmZzR25zdks2eVB2ckZqTU9iVllLcjRH?=
 =?utf-8?B?MXI2dDduU3dEVG15Q0dYdUNzaW9RS3p2UjluK0UzZ3BqdWxsNFFTSWRPaGhW?=
 =?utf-8?B?UGZ2VmxubERHOW9aY0gxSUxsYkYxVS9JMjljK3lsRWxjRUxWVjFyZTlna2tU?=
 =?utf-8?B?Vk9XNHhKcTZObDMwNHBnbEo4YUF5VTU0MFFiQ1daNDZySDdnd0FUVHBHQmdW?=
 =?utf-8?B?RXJyUTNjYmUyeFJXUFpaMVFSZDB3NEFFRTJxU01zYmJpTDhBdVBmcU92UTdk?=
 =?utf-8?B?ZDRhcDg4bVBLRzBHQlc2UmljWlpJSzhkZzgxdVArOU5OTS9ORFBxczdmN2ta?=
 =?utf-8?B?T2E5VytUK3ZuT1BJY3YwUmxTMElhWXZUek5ncERUcDlkV1lwYitMRTNOai8v?=
 =?utf-8?B?TXphVGRWRS9Qdk8xUUFFWk9BSWxxNXliQ0h2UkFDK2xuRDBVLzVYZUwzd0w1?=
 =?utf-8?B?aWtVNHJUR1JFLzhHZmxXdGtZV21iMDJnMkUxL2lCQ3RGUWt1Z1BJNFR4aG5y?=
 =?utf-8?B?QXpzNnJKeVNvcVBvVVdJSXdYaHpnQmRsYS9FeC9rS3gvc1hPNi9SNEpJUWJs?=
 =?utf-8?B?S0o5QzFhTThlQTZ4YzZrM01rbGUwc0lCcGdTakdPSVFad2F1OW8zVG9BMklB?=
 =?utf-8?B?MVlaN0xlK3I2MzNrUUNZa2Z0QlN0MnFOLzl6SGFMeU5vM053TVBmOHk3aHVZ?=
 =?utf-8?B?SFNSbE1ZczRHbk5mL1hSSU84dUNKeXhZU1JDMENPY0JWRG50TGR3aWE1R2xH?=
 =?utf-8?B?UlpxajlJSmo4eDFIOUZueGVKd2NzaGFReEx1WWl4dDdHSFJDTVZLZW9SVFMx?=
 =?utf-8?B?eEJCZ3FxdTJjY2lUNVg0ZU9xYkU2dDRjQlNjcDdJZVErbTBBaFRaRlg4NXpD?=
 =?utf-8?B?VWhzUW42RXp0N3lRTVkrcEFyR3FlR1RlVTNYVzNkeEtLRHUwK0VuaW1WS3BT?=
 =?utf-8?B?Z0g2ZldudG9saUhtbUtxWU01OUh1Ry9QTFMwTlV5QjFRYTIyNWdnMVd5UXVF?=
 =?utf-8?B?WkUrS3A4aUw4ZWkzaTdkTEVvd0FVOU1xTVo3K2dGRmFPZmRidXNsMHc4UGpD?=
 =?utf-8?B?b2l3ZmVwNENRZGxJbVY4bmFWTjc1ZlZEUndXNk42dzhvM3YybVFCYlQyNWZt?=
 =?utf-8?B?QTRSMEN1OTJ1MVlhUlpYcm5KZkpjN3FIN3ZJcDZ3dEozcWE4ODB3ZXJud3E3?=
 =?utf-8?B?amZGRVcrVVJmUGM0d0lNdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXduamNSS3BzaERDaE5MNzlNYzd2RmMyc2VHSnVQTG45dlFvYVA1WU1Wdit1?=
 =?utf-8?B?SE83b0pmZUhnTDg0OXI5T3hPWk5YdjhuVHdOR21sckFORy9XMU10amgwZlVX?=
 =?utf-8?B?bXZ6dkttZXllczB5WUl2QktVYUVUeXZpTzFlRzVBYXVJQXIzdytWK1Q4ZklT?=
 =?utf-8?B?N0lYSDRoK2pZRlEzcU81dDlNOGJNT00zcWpGbGZjNHhxM29sTXpnQzM0SktY?=
 =?utf-8?B?KzBqdkMrdXBzNmlxaCs5YTRaTmpQakdkT1dKV2JWWk1jc1JVMTlYSkgyMTRP?=
 =?utf-8?B?aTdSeG5INlBVd3JFZ1E1amlsNVVoWHkxZWdGWjYya0s3ekt5b212YXhXMnRo?=
 =?utf-8?B?c00wQ1I3K0ZwL0Z1SXFZS1ZKSys4NW4rMFZoYnJkaUNYUkhybEwxV1pZZEpo?=
 =?utf-8?B?ZGNHK3BYSnhmaUlQaTdFbS9YQ2xaZURyTDBWOVY2cDZQN0Z0T3RuQzJBR3p0?=
 =?utf-8?B?RDBFb05KK0dNcUZLZDdXbG5jeVpxZmM1VGgxajRnL05PQ0RLSTNGL0xqQ3N6?=
 =?utf-8?B?L2JncTRsek1UM1dwUkNYcDJrTTRWeUE2TkJXTlY2L0REeXlKenR5c3Myd285?=
 =?utf-8?B?TnBHdUNFcjl3bnJ2QTErbktpSEl5UFB5c1lOM3RJUC9NNnJza2hYVWExQmZW?=
 =?utf-8?B?bWdFa1hGelRLN052Z3Y1VFcxM2xOQ25LTVNZMDhCY1JLMHN0VTZtQThDcE0v?=
 =?utf-8?B?V0lLblVmaXRJUWZraGpqTk5pUlV5azh4cDBUUkNoRGU0ek1mTTVmNlRKbUVJ?=
 =?utf-8?B?K0pIS0pCZ0RDUWd3QnZUZFdZd1hrUGNsWWFYeHVyR0c0cVhqVjdBS3JUL3Vx?=
 =?utf-8?B?SitVRGp3YnlVYklxcDVqUnZJYlN2dU50UU1tRjVHalNVR1ExSFdLeWxaWVRm?=
 =?utf-8?B?aXVlb1YvOE9mZlBkTzcwSjRmcXdVYS9aY3FyRUx4elhSelhuTlNjYXc3UXht?=
 =?utf-8?B?QWFxRDRTbTIwc2FxNVpxYzIwMEpQbFdHdzFERGxYSFI3RU9jUmt1RzE5aU95?=
 =?utf-8?B?bGFJT3RTaUcyQTBYM0g4ZjA1QVFPWDd2ZjYwZ1VlOHIwbFFoL283K1hZdXE4?=
 =?utf-8?B?MWc5MnlLRTJ5Q1JEVkd1N1BwV2loOVIzZUJ6OCtUekZBcDQ1YTZrdCtrcmtw?=
 =?utf-8?B?aWNFVk1VZXI2Ump2TnlOeEVPL1B6QTFzN3VCWjJUQ1pLQ1FnSUF0NHJDOThB?=
 =?utf-8?B?WXp6bThVeXJqMjExdUFLTWFFWElsT2FUZnJMUG5oQk91Q2dWWThaTmFoTzFT?=
 =?utf-8?B?WFppeWs2NTF0WnlkUUR3djNsTHdFTFRNMExCSmgwNXp2VE82bzZRYnBGNHlu?=
 =?utf-8?B?WkFFL28wYmJSRkUrRENBNzJ3TDV6SFZNUVlGMkJIdHdlQ09HaWxWbGRucGJ6?=
 =?utf-8?B?RTdsY2hPVnpUckR6Z1ZKeWJWQnEwOGRsWTEzcG1XaElVb2ZpRnBReDRIQk5j?=
 =?utf-8?B?Mlp4d2ZvcHNqLzUvR09HdkZVLzZDYTJLSjN6cFZOVWNyT2tXb3VWdnBXZEww?=
 =?utf-8?B?L2s3YmhvUy83dS9tVnJFb3R4RGtlZzZPVUk2NmRvNlBqS2RldElXTFBWVzFw?=
 =?utf-8?B?bCtLYWZnbzJYWEhyUWtQTGxPZFcwUVhjVnBBUW1idndZWVlOVzYzb0M1bVpD?=
 =?utf-8?B?aWF6V0lYckQraEEyS0VtVU9NNFJSMHliRFA2MzFETkw5dElEMEc5cW5OanZN?=
 =?utf-8?B?MkRUbnJIMTV2TFdzYS9ic0hGeWZWMnNVSldSV1dFSXlJekRibGZDbXlmQ0RF?=
 =?utf-8?B?Mk5Pc0tlVEdPMXhoelM3YTh6OTJvdmV3djZQd1hHdUtyUlBVSWNPZDkzRkhy?=
 =?utf-8?B?aXB2SXNVUjd1Z3ZDSWtQVHR1amFYWCtabmR6bDZhL0ZCSDlnZE1BT0c2c0w3?=
 =?utf-8?B?dWdqdEx4aW8wWEpQdzhrNjVCbmFyUG13aG5kU2VuKzFWcHJBekh1RTVWQm1X?=
 =?utf-8?B?dmxkUERoT0ExZ0tlbFduZjFhNGNDVENDTEp4d3MxY1JQaDcrZmt2TC9KR2l0?=
 =?utf-8?B?dmh2a3M1SUtVaUE0UlNUeVlHQ3Zhb1hPZHlSeVN3bTM1bE1oa0ZUK0tub2p3?=
 =?utf-8?B?QU54OE03NHM5elBNSGdiQXFScHNEWnpmWHVUNGFyTTlFcFlBRkl4K0JOT2xq?=
 =?utf-8?B?MitkOFVtMm16dWwyYmpFbmFVMVFBYkdrZ2ZGZEcwMVluN25zN3puRDlRY1Ro?=
 =?utf-8?B?V0E9PQ==?=
Content-ID: <13496FA7EA2DBB4F92BCD91C68DF7F31@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edcf508-6321-41fb-6de2-08dce7f14e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2024 23:31:16.4516
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6dZVeu8B2foNexiVKDdBwyu/1u6Ufi7QVoovsxe3KcqnOlWeB/bHJ/ZJifChhi2ZXCOX64pQa+lkS11jfmAINTLIqC3SLRKR6T/yRRAnyu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7301
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_003127_367170_C3983B99 
X-CRM114-Status: GOOD (  18.19  )
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

T24gVHVlLCAyMDI0LTEwLTA4IGF0IDE2OjE3IC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6DQo+
IFllYWggeW91J3JlIHJpZ2h0LiBIb25lc3RseSwgSSd2ZSBiZWVuIHNoYW1lbGVzcyBpbiBhZGFw
dGluZyBtb3N0IG9mIHRoZSBmbG93cw0KPiBmcm9tIHg4NiBgc2hzdGsuY2AgZm9yIHJpc2Mtdi4g
U28gdGhhbmsgeW91IGZvciB0aGF0Lg0KDQpBbGwgZ29vZCwgZ2xhZCB3ZSBlbmRlZCB1cCB3aXRo
IHNpbWlsYXIgYmVoYXZpb3IuDQoNCj4gDQo+IE5vdyB0aGF0IHdlJ3ZlIGBBUkNIX0hBU19VU0VS
X1NIQURPV19TVEFDS2AgcGFydCBvZiBtdWx0aXBsZSBwYXRjaCBzZXJpZXMgKHJpc2N2DQo+IHNo
YWRvd3N0YWNrLCBjbG9uZTMgYW5kIEkgdGhpbmsgYXJtNjQgZ2NzIHNlcmllcyBhcyB3ZWxsKS4g
SXQncyBwcm9iYWJseSB0aGUNCj4gYXBwcm9wcmlhdGUgdGltZSB0byBmaW5kIGNvbW1vbiBncm91
bmRzLg0KDQpUaGVyZSBoYXZlIGJlZW4gYnVncyBpbiB0aGUgc2ltaWxhciBiaXRzIG9mIGNvZGUu
IFNvIHdpbGwgYmUgbmljZSB0byBub3QgaGF2ZSB0bw0KZml4IHRoZW0gaW4gZWFjaCBhcmNoIHRv
by4NCg0KPiANCj4gVGhpcyBpcyB3aGF0IEkgc3VnZ2VzdA0KPiANCj4gLSBtb3ZlIG1vc3Qgb2Yg
dGhlIGNvbW1vbi9hcmNoIGFnbm9zdGljIHNoYWRvdyBzdGFjayBzdHVmZiBpbiBrZXJuZWwvc2hz
dGsuYw0KPiDCoMKgIFRoaXMgZ2V0cyBwYXJ0IG9mIGNvbXBpbGUgaWYgYEFSQ0hfSEFTX1VTRVJf
U0hBRE9XX1NUQUNLYCBpcyBlbmFibGVkL3NlbGVjdGVkLg0KDQpZZWEsIEkgZ3Vlc3Mgd2UgaGF2
ZSBjb21tb25hbGl0eSBmb3IgKGluIHg4NiBuYW1pbmcpOg0KIC0gbWFwX3NoYWRvd19zdGFjaygp
DQogLSBzaHN0a19mcmVlKCkNCiAtIHNoc3RrX2FsbG9jX3RocmVhZF9zdGFjaygpDQogLSBzaHN0
a19zZXR1cCgpDQoNClRoZSBzaWduYWwgcGFydCBzdGFydHMgdG8gZGl2ZXJnZS4gVGhlbiBJIGd1
ZXNzIHg4NiBoYXMgYSBkaWZmZXJlbnQgcHJjdGwNCmludGVyZmFjZS4NCg0KPiANCj4gLSBhbGxv
dyBhcmNoIHNwZWNpZmljIGJyYW5jaCBvdXQgZ3VhcmQgY2hlY2tzIGZvciAiaWYgY3B1IHN1cHBv
cnRzIiwgImlzIHNoYWRvdyBzdGFjaw0KPiDCoMKgIGVuYWJsZWQgb24gdGhlIHRhc2tfc3RydWN0
IiAoSSBleHBlY3QgZWFjaCBhcmNoIGxheW91dCBvZiB0YXNrX3N0cnVjdCB3aWxsIGJlDQo+IMKg
wqAgZGlmZmVyZW50LCBubyBwb2ludCBmaW5kaW5nIGNvbW1vbiBncm91bmQgdGhlcmUpLCBldGMu
DQoNClN1cmUuDQoNCj4gDQo+IEkgdGhpbmsgaXQncyB3b3J0aCBhIHRyeS4gDQo+IElmIHlvdSBh
bHJlYWR5IGRvbid0IGhhdmUgcGF0Y2hlcywgSSdsbCBzcGVuZCBzb21lIHRpbWUgdG8gc2VlIHdo
YXQgaXQgdGFrZXMgdG8NCj4gY29udmVyZ2UgaW4gbXkgbmV4dCB2ZXJzaW9uLiBJZiBJIGVuZCB1
cCBpbnRvIHNvbWUgcm9hZGJsb2NrLCB3aWxsIHVzZSB0aGlzIHRocmVhZA0KPiBmb3IgZnVydGhl
ciBkaXNjdXNzaW9uLg0KDQpTb3VuZHMgZ29vZC4gSSBoYXZlIG5vdCBsb29rZWQgYXQgaXQgdG9v
IG11Y2guDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
