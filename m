Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E516C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 19:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R69hyKOdAFYS5zQePrvPFsAzmtn14gC+4f7K0y3FkJE=; b=vAWyFipe1c82vy
	D0zH/wCY1CE0ljMeGSqGu63YKGZsDZ+pAGbUAWj/NoMPJjR1F7kaPKZADy0Ka/TdvQq5kKhvLh5Dk
	LRSdFdkFqMJVwIrmfOjyv078/20aTjlGf+MCRNpQNDwdfuCg84WGPZPTNASBJUJpJAkN9UZBMaZ3x
	ouZUTv4a9/cNE4OpKERIDzOZPtLm3MsePtlzLyjM2rcVnx19mYzEtlOAviQrjc7B7XaOLRHVnW4bX
	cKwNIK7VBaMrEScXr2Cy48tdvH9AR1pQ6owYOxuQU9v3HrMGCGEmXEiIlv8yT+txVs+I6Wg6f5Boe
	TD8eJA6I2IC2rpeCsrXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsCU-00000002GHx-32yb;
	Wed, 21 Feb 2024 19:24:14 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcsCS-00000002GHN-0aG9;
	Wed, 21 Feb 2024 19:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708543452; x=1740079452;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zcCPT7AHSGRei7HNsiUe5F7y+lEXjyUmqtMeTNfcCFQ=;
  b=ikyNryHSuUEsdt3pFOUfyYMTQkMpy0QXyl6TRwY6t4UPh+sisDcsMCNi
   8qg5by8pQQ0QUSL433KSWn2SZZBHxbZTpPJkpYKDplhGhXLvgG95YxxRK
   evQfCgJ8l/+TL1drtetiNNMWkjWcZSEjr41yiwEaEEGWYQpuTCHw2hOL7
   rnsfq5wpfehuvbbFFK1hQ0KiwlSAyAbRJpW3/OlaJHgnQtenGYaPOkbs6
   ONRRrJ7XgGhh1H8gqg7U/O8biICUZn8eRdcK+DxZEQKcq2A74hMG72xSG
   NfGqPf9ofKPKonhqMlrIvF6vyE6TYy9wZP9npl/NpTd7kukQxTVa//Y9a
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20272088"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="20272088"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 11:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="9816182"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Feb 2024 11:22:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 11:22:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 11:22:30 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 11:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZ0LuyKiRVsIomzWUC8kFovPWO0YbTobEJsKFMAdaQcolAUndQKRixhq7WUItfpnXTXuybefmDn4CC9DMapap8y1XnF00PVHHVQiOCv73Z1lA6Ti09XL6swXEtA9f/6rWKFKQaGSpMBJl2BGVDw1RLAscLaiUvch8iL+u/0p5mW09nVuS34DLn9H17MnykMXEvv3hvqo40dVOfvmeINfSmao+ikCRRT/+MU9pLGPgEmYcIoisxDQ/7lH/706dg4FyKLRcmpzONLhFi7SZkKc3mrVX7lwA4vXKD7m9+HyXxUC3eGYasvPXSLbwV9yQ3908TIA+MbLybm5THV0TJaCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcCPT7AHSGRei7HNsiUe5F7y+lEXjyUmqtMeTNfcCFQ=;
 b=ckIcSoYMBABQadoeO9+8s2WOjPcM4JWSR/fuh+K/rv4Ros0yO3abyYMiKiPA7unCBiXYKipV0Gl8yvtTXxLg3N0KbHLkbtmm7+XteaZnO1OGc3iG2opSE8yEtgrR7zEO3NcV/ajfg2L2BgR913qwtuOf4DlOGUAAOK+HmPocCM2az9JHPFTZoLI+smzPpoffTeidpssRqWGN9c5Gk2f1ii1Cl6lK8AVc0gW8BX82j9DfdTaMdDNDDxdj/CM9n2vXJm7qDJxZHx6eYyo7u6tsAEpZpztBS2T/s4CQjQu4WHGPmG6jQwd7tTtMvxS3eUS58+DgGTW0qt742sdnFXizTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 19:22:21 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 19:22:21 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "dalias@libc.org" <dalias@libc.org>
CC: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Szabolcs.Nagy@arm.com"
	<Szabolcs.Nagy@arm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "broonie@kernel.org" <broonie@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "shuah@kernel.org"
	<shuah@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org"
	<maz@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>, "fweimer@redhat.com"
	<fweimer@redhat.com>, "keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>, "ebiederm@xmission.com"
	<ebiederm@xmission.com>, "will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>, "hjl.tools@gmail.com"
	<hjl.tools@gmail.com>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "thiago.bauermann@linaro.org"
	<thiago.bauermann@linaro.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "sorear@fastmail.com" <sorear@fastmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in
 userspace
Thread-Topic: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Thread-Index: AQHaVpxQxL7eT1mQek6VcjPJOSVEZ7ETiLSAgAAiyYCAAASHgIAATE8AgAAGrQCAAAuagIAADnuAgADQTgCAABIegIAALDIAgAAF54CAAAQ9gIAABSaAgAAGX4CAAAOdgIAABGIA
Date: Wed, 21 Feb 2024 19:22:21 +0000
Message-ID: <e3a432c0fa9f5fe837e9d2fc7b36304709a34428.camel@intel.com>
References: <20240220235415.GP4163@brightrain.aerifal.cx>
	 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
	 <20240221012736.GQ4163@brightrain.aerifal.cx>
	 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
	 <20240221145800.GR4163@brightrain.aerifal.cx>
	 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
	 <20240221175717.GS4163@brightrain.aerifal.cx>
	 <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
	 <20240221183055.GT4163@brightrain.aerifal.cx>
	 <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
	 <20240221190639.GU4163@brightrain.aerifal.cx>
In-Reply-To: <20240221190639.GU4163@brightrain.aerifal.cx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CO1PR11MB4865:EE_
x-ms-office365-filtering-correlation-id: 3bacb91a-3e7d-4d7e-4bad-08dc33126d57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lA1DGPK2VrKkREIodDb1OumuUukP/gvkYW69XCCKAnPIb6B6yCPyDGeE8y60EDwjp0ffJGgk0RMlpxC3IYBnBPf+jeYwUmBw4tC/r0PZJI0wOtk1TS31ojn49R4BcbYloMEZTM3kMeZQN/fEfGmEm9gjZhOKT0giy1rcdEEejfJGvp2ckrp2nFJ1aWQbu0kZ3eBRf8bMn9ls/hP5LbOcAgpte7qA1Tm+RZ+XRd00SHgOuuC6PlTWNo8/sDo3Yjh309xquB7I1mvTIVTj8auuTHOH4qgGdYZvFEAGCOzBrCjxlqZDW3AvDCsemiN99q8bCyVpHJhT7r5ZwtuhelArcWZmOw2kN9d1v7zCJN0sAWg58k2jiS/ufn9c9VgKcQpEablnFc8Cjv6gOumchwQ2G0TmD07FwnJtmA/PxqBuKy92JCUwUkTPNtjfCanhTwghUhtU361vPLSKRrJedOGc3tojJ0VOef5pB11Ob88o1n7wxjKfeUjFjJycGCerjpJRQxsuFmkaV6GrnE9aN256D7Eh+j7Ds2GBL4op5xQcKNkxQzd0e+RR4zlXoofEuyuOWablCFdqXQjtf8jCYngKLAm6NQFdX0Gk/GfGhJOqzG1Uliu8X9k8Fgs36aIIdfHf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(230473577357003)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHBEMnFmRW9Tdk1la2hhUUluS2EvQm55bTMrUGRLbHVhelZDVWRya1J4K0V3?=
 =?utf-8?B?SmVibTBmNHdaNzdTa01BNlFxQURGR3pqeGpKODB5OE9Kbmk5L2FYd3hWZE50?=
 =?utf-8?B?dkM3eHpIckk0MHJ5YUU1c29kMWViR2JtcFN3S2w5TUdTRWdmeDZnaUZ0eGJM?=
 =?utf-8?B?emFJM2pudTFqaDl5SmduYnZ2dnBmbHdpeTZ4NGpGeDlwRmZvUlRiYStrM3pG?=
 =?utf-8?B?YU1ZRXdnMEwyN21tcHZSTVZZVUwwMWNHZnBoMXRvUXQ0MDNXR00yeHA3VU9F?=
 =?utf-8?B?Z1h2YkVaemMydUJLT2dLUTk2S1FWb3RoNXo5ZFY1dVY4U3h0MzZzVmVtRGxW?=
 =?utf-8?B?N1lzK0NTZlJuZEpRQ2JiM3lCUFJjUHZVUWlidk5QTnFLeksweEo3WklzWTVh?=
 =?utf-8?B?blJBWVV4SDFGZlUwcmdSVFBuNTlTRG42SUEyS21oaGdjMS9hUXlEWTdMYnh6?=
 =?utf-8?B?SnhYNHF4VktMSlB1dkR2SmF5SGhxcmZZRHZaSEtWVks2ODUwZkdaWXRNTzdO?=
 =?utf-8?B?NkxZRnlsVnI0WDZoeUdHdnFaL1UwcU8vOVZucWFia3hqTGo0SEFGTUxyZ1pK?=
 =?utf-8?B?a0NPaWNhT3J2YWluSzU3VUxoenhSY3pldnFpYXVJektKaVIvQUxGUW9Zc09D?=
 =?utf-8?B?VGZZZmJSdnpXa2ZoaFQwZDdCWnhFaUZwRHVNQzVOUENpWnhSdUFoWGZPZE54?=
 =?utf-8?B?Q3UvWlpmQWxqYlREbGRZK1ZveFpYR0JSelJsOXhOeUZFcDc4Y0c2ZHZJbEdK?=
 =?utf-8?B?VkJNR3BRb1MyaEhhSDhodzJkVk56UHFZcGlNKzV3S1FhSEM1b2w2S3pMejF6?=
 =?utf-8?B?QnUrUEpNNzFoS2Uxdm9URVp3YWJlbllOS3MyVEVOVE5QZ1RVaHZCdHNkMUN5?=
 =?utf-8?B?WnFMbG05WTJrT01BcWlNL2dDV0Q0V0FYOUVSR3FuLzJlb3FEVkx4Z3JUSy90?=
 =?utf-8?B?R1lYc25TQ0t4aUN0L1Npa1pwUVpyRHNmTmlnVkEreUJVVWVhcGNpUWVFVVJs?=
 =?utf-8?B?V1BYWmprN2htZUlWZW11Z1N1RmZ0R2xMQUpGdWhYcmk4cG9CUDkxbUZIUVpl?=
 =?utf-8?B?enQ2dXFqbmdLdmNFdlZCUy96YXA2Yk1iSHZIN2RWMmd6SVFaazVVVXNCOWZl?=
 =?utf-8?B?ZFRJaCtHcVl2ZGp5UkNtMmVHOGZGUUx0aHlFeUNqY2dGU2ViODdtRUd0ZTgw?=
 =?utf-8?B?MHdEMGVzbDE1aHBDcEgzWU1wSTJ4TXM5MWpuQzBnQUpEbFhvQ284ZlZvMitw?=
 =?utf-8?B?YkRoR1BRNGd5dkhWWGIzWk1mQzQvOWNXMTh0RUx1OXd5NFFPSVNnZ29nL0s0?=
 =?utf-8?B?eGFtUStadzRVbGpFUzV0QjhXTG5TZTRKMmVkc1RVa0dUekMyenVNaElFM2N3?=
 =?utf-8?B?TW1Oc1VXRitiR3RZZFhFeUpEbVZ3aFk3VE9obWFyMFFHenlSeDY5ZC9SKzJp?=
 =?utf-8?B?ckN2WThIVm9CTitHRi9mRE5CbGhJSlNXeFpJMDlVNVVvQXlJQno3Wjcrdlpl?=
 =?utf-8?B?MytCWEszNVc4VEJMMDBjUklWOE5hcDY3NEhxV3VNc3FJSjNOSXpYZzhoVmVJ?=
 =?utf-8?B?ZTBvcUJZR0pnbzFjc0l0TWVkMFFOQVN0d1FCRmtWWkJJUHVZa3I2UmJRSHNN?=
 =?utf-8?B?NGV0STlERGtUMjc2dzR1L1M0Um85bnJROVVYckJiNnU3RXRqQXRvN2thdUlC?=
 =?utf-8?B?V1RGaUJpQWEwM1YrdDIwZVVUaythYTBCV09IYzBmeVMvUE9HSkZrNk9qRklE?=
 =?utf-8?B?b2t6RFNpLzRXeS9HYUtHZitCeC9IeXpKNy95akNaK3RKS3pibGRwRkRSN2ZJ?=
 =?utf-8?B?d09DcUlHQVBQVWZGVUZpTnRLcHpCNTJkVEFDckFQQ2I5Rm95VkRrSVRyUTI2?=
 =?utf-8?B?c3I0RlhjbUVMa3lyM3lHUFRqSFY5R3p6Qjl0c2VPZ2xLKytJcWh1OVo1WWUz?=
 =?utf-8?B?MkpOT0o4bnM0ZytIWEZKSGV2bVlsWDNyTUI1bGduNWRmVkJBNUVzdUt3T0xo?=
 =?utf-8?B?Nk9ORGQ3UnA2Y01sa3dGeTlWUHorV3VsWkI0WTkwVzBpQ0lRU1Budlg0TERh?=
 =?utf-8?B?WTZ2TlYxcGpNcFYyZ2RMWlVnY3JDL1JFVjlUUDBKaVluaEJENFRTc2NwQ2V0?=
 =?utf-8?B?Tm1nQlcrbXo5YUsyS0p0ZXE1YW14MUhVMjdkcFVzNUUvZERWYm5DODJMelZa?=
 =?utf-8?Q?Xt8KuF4NfegkRcukoWb20HA=3D?=
Content-ID: <4275E97108F917409F49BAA85992435A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bacb91a-3e7d-4d7e-4bad-08dc33126d57
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 19:22:21.6561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8GCGNJh4YNueAWcT29XOHiiFIf0A+7NxpsO+z/QQPpGy+CliOKfumLxtAWpSJIOibGGdM1jQTCAzy2E92JwD6TgqNp7b70B3AmBnZZiPdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_112412_274751_0272D953 
X-CRM114-Status: GOOD (  21.72  )
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

On Wed, 2024-02-21 at 14:06 -0500, dalias@libc.org wrote:
> Due to arbitrarily nestable signal frames, no, this does not suffice.
> An interrupted operation using the lock could be arbitrarily delayed,
> even never execute again, making any call to dlopen deadlock.

Doh! Yep, it is not robust to this. The only thing that could be done
would be a timeout in dlopen(). Which would make the whole thing just
better than nothing.

> 
> > 
> 
> It's fine to turn RDSSP into an actual emulated read of the SSP, or
> at
> least an emulated load of zero so that uninitialized data is not left
> in the target register.

We can't intercept RDSSP, but it becomes a NOP by default. (disclaimer
x86-only knowledge).

>  If doing the latter, code working with the
> shadow stack just needs to be prepared for the possibility that it
> could be async-disabled, and check the return value.
> 
> I have not looked at all the instructions that become #UD but I
> suspect they all have reasonable trivial ways to implement a
> "disabled" version of them that userspace can act upon reasonably.

This would have to be thought through functionally and performance
wise. I'm not opposed if can come up with a fully fleshed out plan. How
serious are you in pursuing musl support, if we had something like
this?

HJ, any thoughts on whether glibc would use this as well?

It is probably worth mentioning that from the security side (as Mark
mentioned there is always tension in the tradeoffs on these features),
permissive mode is seen by some as something that weakens security too
much. Apps could call dlopen() on a known unsupported DSO before doing
ROP. I don't know if you have any musl users with specific shadow stack
use cases to ask about this.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
