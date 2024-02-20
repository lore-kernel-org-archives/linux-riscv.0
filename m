Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBF2C48BC4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQnNzJhFfBUXVBb5Asnjsdt/yDvMD/spd3cBC0sEjAM=; b=BCif64sTlZ226p
	Ri2il21V0fqaldjdLqdKUq80mxYfmtrN76a74epEaz1J2k7+AtadWaXlfMEV4T+bV5Jva6ngRZ/ru
	3CcAnz10krk13Ln9INRwTGFW8e/FjW6+NT6YIXWt1eQwJymVWpkNWljl7wwEkSvMUeCK6+RJuc09y
	bySsmqBCull+bg0YiaIBHxb3KolK1s2HC65woxIjwdJTUML0fovDLmRlfJcIrC3KEnxpRfZo56C4c
	hOYnPPZzUL7NOMRBq9ZgBIFryQxXX3z4s4BuzWRQ2njNotye/WQjn8m0b0RIajAk+u/q/S3ItMlbQ
	kUtIRXvfL2SlJ9TXziZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcZZH-0000000GVjs-3Xtr;
	Tue, 20 Feb 2024 23:30:31 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcZZF-0000000GVj0-25rz;
	Tue, 20 Feb 2024 23:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708471829; x=1740007829;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=vHcdGsBiA0g3ai2BEPvu+PoGa9QJUM5Az1pTdjhxgp4=;
  b=Wm3P0HHEqld0lkKrKYEQYNd1PJ+LKz+eRZ0OZG/Yqi3cRUqbjdpt4fdL
   Jaj/pEP7F8TI7YsEizmfAbTiZT5juWQ+f4Mt5W2MSRnJ0xvgba8BoBJIq
   Kk8z3xV8F3XFYZPWQ/5gRlcCXEDUIaFIAgT9j2qhFcxmcbSwhvIC+K/u6
   2iUd7UwcEcYguAN43mU5/XRBR3E5hwX+brMCJiis5+66oBV5exymS7Lsm
   hhvInP69SXXAjAC3EMetw6AoaOx+E/ge7smAzmY5/q62Jtgl2Gxr+oYdR
   WUiUnzPlsBupSziwBE+tVX04LMjdQyDWxggcK9LDTxJN3oMwWrV6Vt/0h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="5562155"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5562155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 15:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5236334"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2024 15:30:26 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 15:30:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 15:30:25 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 15:30:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q26Q8u/hHgyapj+DlLHTngYQIYzziESfpc+iqTapkv4vAJKsP3Pqx6FO4WXAf9enzsbHGW4Q+5fD1ap82zKG1RqgUUXpGj4JpufDA2f85PDkYLEWLyl+Ymxh19UGrCqV8YhCGNJ0c60HEA4RQcqZ58mPX4EQ162bVhjIt9L2Jcid2qpMi1YktegXqaocX7yMZoFXTBz2wqLlRyXhCGxDtlg7J19UtdUshi9+73NVObC+kCFarvSMcn30ehJWMCQEpVnGWFXiv5KYwS+y44zdkj3skBjo5if2l3/J4ErvXrVyr+mOth6r8G/oxvg2GeQR74nCR1p9Chu6aPrzsQJWaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHcdGsBiA0g3ai2BEPvu+PoGa9QJUM5Az1pTdjhxgp4=;
 b=YbZeX+X4NlXWK/edeSC/XURfr+By+xTsUkA+AuexdcgHdN4DcLc3uA/dRnsCsGyb6BBw2pLhSO5/H8J09dEDTovGq4OlPeA71E7/WSygzJFboLGQu7cFa4p6xoIPO0nTKWDQ2jxntthPtFci9/5v8uChxcjjfY8Liu3ugJWnTCf0hdvB4hQu/hDVu5OgWXVrnvqZnAH5R5xmlw7DzCZMX3JSlVLknPOBdTImM4bx8gT6Wf50DdkrYBE90vSifsjgOzIFuz0fME1Y5OdaYeuQfx+2xXOEuTq+HjGSXLUxpA+xe5ARx2q9EMxWmUxip7BbZBi3a/X3YbsF49cQHlTTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB8442.namprd11.prod.outlook.com (2603:10b6:610:1ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 23:30:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 23:30:23 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "dalias@libc.org" <dalias@libc.org>
CC: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Szabolcs.Nagy@arm.com"
	<Szabolcs.Nagy@arm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "corbet@lwn.net"
	<corbet@lwn.net>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "broonie@kernel.org" <broonie@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "shuah@kernel.org"
	<shuah@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org"
	<maz@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>, "fweimer@redhat.com"
	<fweimer@redhat.com>, "keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>, "ebiederm@xmission.com"
	<ebiederm@xmission.com>, "will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>, "thiago.bauermann@linaro.org"
	<thiago.bauermann@linaro.org>, "hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ardb@kernel.org"
	<ardb@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "sorear@fastmail.com" <sorear@fastmail.com>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in
 userspace
Thread-Topic: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Thread-Index: AQHaVpxQxL7eT1mQek6VcjPJOSVEZ7ETiLSAgAAiyYCAAASHgIAATE8A
Date: Tue, 20 Feb 2024 23:30:22 +0000
Message-ID: <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
	 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
	 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
	 <20240220185714.GO4163@brightrain.aerifal.cx>
In-Reply-To: <20240220185714.GO4163@brightrain.aerifal.cx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB8442:EE_
x-ms-office365-filtering-correlation-id: ba4184fe-3d62-4453-c121-08dc326be8e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yl7cdz09XK47zs1uVrczQSG65+Hz1zKcjpOARtq3O83jcyAgIVLNkSN8DD0pHNKVBfd2XoIrdQENsT7yWzWO+TCv/MUV6LIUbhrOvv2bUbcb1Esg4xMqmrxhYspQOGNA4A+MMWg5lrUBPK+vC5qVn2qsWMifWU8kC1WJ2TEnJgvY0kS4Ww4L0Gju+Wu5oDzJUbzf8mD5ZRZcIDGBHIf7RuHRnU8GM9HptKXZ1+ol/vyt/crrNUQgHpQj4qTmNxPMzFFWNK5Bz3b/+jmCOaSR2wsxbxukPdwEsSUVujE1EjFl3sr0AnGlDs2eS8ib8unrAORUa5DLR7zBFpUOLlqmAI07ZFZwNd5ue3eFcvL2T0BFpNGMCAjQsIv63ra/S2RPncrL+21SpvK/W7TbxQBbXULBBvA5EVT5Lb/JSTzjiHyhB/ov+10AbIvXVOJNnyVcnnFntToYU5iOv0tOq2STG1vFX30pVgdkH2FaNkA5/1KButfY0hswX71O0qpqudviR834EqNSOtuPclfeB6pWWAZswP2FMBKOVtvldmtAMo6Ygt/OTEorYBkxBNm7swhuSxu+fLLo5+xR28I2Rhoz1+2O0gMx4skgOdanqe2wRyDkhbD/YPM0QQrNvhqdqTi+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlpBbTBLZURXN1pzZDVCSW1TS1N6KzNjaUVJUlJrRGpxanZXcmtqV3FQay9X?=
 =?utf-8?B?bjBpVmFGTFdoa3N6ODdXN0ZSUjlyekRRdjBodEE5clZyRVhnL1lka2Nwallm?=
 =?utf-8?B?eWxGTzh3N3c5TWdnQ3BOcnM1SHZPWllsZkVEK1lLTG1Qb2h4YmVJd05jQkQz?=
 =?utf-8?B?ejJOMGhjU2RDNE55MUZoVVY2TU5vWDMzZjlObi9vYUNraGtXM255ck5QZUdF?=
 =?utf-8?B?UkUxUzQ1b0xnTytKUGdvSEt0ZjJmcDMzbXRSK05xR0JqeGdzcEhZOHBzdnRB?=
 =?utf-8?B?Z2ZqMmRxajRsK0hvVitmL2pwUFRjNWxDSUsvaE0yYjdqOSt4WUhRVHZIV2NX?=
 =?utf-8?B?TkM1dWdHSjFtamgrSU9JQ3VMTWpWQWdnVWlBeFBJN04zNk90YWxndktlSU1k?=
 =?utf-8?B?Y1VjaEVTTUQ0SW5aa3ZqVnN2bDBOZ2hWVjJxL0lKbkpSL3VFVTJUT1ZlSlFO?=
 =?utf-8?B?NjdvYjNqQ3F0L2NvRG9xV002ZnVGbUlEeENPa3Zwa09hT3B5U1lvdmR3QkFn?=
 =?utf-8?B?MnppdDlwaG16bUd6dUgrNGp2TUJpY1I2aW1MWmdXb21YNS9NbzJkdFk5ZTl4?=
 =?utf-8?B?SFg5UnlHWlB5V1djUUE4dU5IV1Y3K00xUm5pU2MwNkh2R0RiclFkdDd3cEV4?=
 =?utf-8?B?VWluQitzaXdyOUg1cEZBNXlkKzNkbm5zR3BJaXpmR3ZIVFpqNzN4UTVsNlVu?=
 =?utf-8?B?VzFyVUx4ZFRIZWE3NDNLTjdrS0FveGM1M3RGaGRXYmluRHlyTk1zQ0hEWXF1?=
 =?utf-8?B?MGRPRkFpQlI1L1c1eUFLRXExY3g1WHkvalZIbkNKS2haSzZFRnpMSldxU1lW?=
 =?utf-8?B?cHMzdVo3cnVmVlFOTHdkb3VjUTFKdUF5VGxpekt1Z1paY2VtYnAwNXk2dFg5?=
 =?utf-8?B?MXNDWTI5QlJCK0p0VE9DRURHeGdkWGExM3EwTzd4RDRpNjB0Qk9VMFZIeXdR?=
 =?utf-8?B?Rmp4Q1JMN1lvM1NtNkttbWZuVHU4ejdLNWRPWUFvaklJeGl0TlNpT0JJOGN3?=
 =?utf-8?B?c2xMeUZ2SzBBOVJUWC9vWFB2V2ljZVUvbmk1T0U1WEhtblNySHNPV09xMFdZ?=
 =?utf-8?B?a0xVYWZjcWc1MFV4cEl2a00yZmI4c2RRWlc4Rk1XR1dTeTdEek5SOThIeC93?=
 =?utf-8?B?NzhBb3RydFZGbmlUSTV6VTlIMmY2LzFXNmcwSjEvdk4waG1WVE9rQzh3cGZB?=
 =?utf-8?B?UFE5TlBuR1dDR0xRMVh4WkJxSzcraUpaNmFLVjEwb2E1U2VoL0RneUtRNnVl?=
 =?utf-8?B?STV0NEphYVVBVlFQTS9PTzBVNjlHZDFwanI2K1M2ZExUYUJPSUV3cW9vUktK?=
 =?utf-8?B?Z2J1QWkrL25ZTVdDUWI2YWwrNyttd0s5dW8rNjd3TUtTbzlVcUxXaXlhNXo2?=
 =?utf-8?B?VWVGUVl6R3V2b1k5MTBiYUhaSytTQjZXSTJOcDc3UjBxRyt2bFRTMzY2SGRk?=
 =?utf-8?B?RDhqbHFxdnQ3WjdxT1pqT0JMdkxoUWdQaW95d3BVQ0orejRQVzVHelA4d3d2?=
 =?utf-8?B?NkJkZ2RCblJTUUtmN3VPYlNQMGg0YWliVTJvVWRrd2R6L2tnS3IyL0xqRkdr?=
 =?utf-8?B?NXdUUkh5QTY0Q3FRaWJ5QWZ5UWxyMjJIZzF4a1dTTzdyVlJZREJWV0lCK254?=
 =?utf-8?B?VnFRbkQxUzUzY0hFaXZaV0VIQ3lIUzhkYmhkSTVQRG81cm81Y0Y3QWUyNG85?=
 =?utf-8?B?aGNBcncxd05OeWlpMVpjNmlFeHZPNjMwZm5ONkFqWkpaOW1DQTBSN0UyWDFF?=
 =?utf-8?B?bnVxZE42amVNT0djUVAra1Z4R3JJNjRRMkE0ZzdOK2MxbXFqc2RyZTc1ZVNW?=
 =?utf-8?B?NkpCRk9WM1owVXpISUZXSEJLazNVeVYvWG9objRESmFITHJyNFNVZTd5U2FQ?=
 =?utf-8?B?OVE5WGVmaDhvM3ZWWDA1Vk1hZkNPTWlQMU4ydjRxeXkxMlFJdVJLa3RkdWJS?=
 =?utf-8?B?cTBJaDZ1WUxocWhOZUE0RFJOSTNLNWlxZUl2RjdrcnVGQU9venVNWjNCNHlR?=
 =?utf-8?B?bkNrZngwVXkvanpKcThPMGUzTmVuakVsYUxUNEpoMFhtaWN3ZlUvQXJOMzQv?=
 =?utf-8?B?aWxzc1BDQmhTTDBsVkdlNFhJNUFjQXh2OHNOem5xbzdmMDkrMEcybnliK09M?=
 =?utf-8?B?WkxUU21rZ3UrVGtud3dTdTNaV0lsOCtqbkNsU1doMjJRTzg1V3NjYWRwcXU5?=
 =?utf-8?B?UkE9PQ==?=
Content-ID: <01D5DF396AAC104797E8D63FDC3E515F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4184fe-3d62-4453-c121-08dc326be8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 23:30:22.9747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGGvGeRrmBjSTgCv8tz+1PYm+Ih7Tr/7AXJeMArcaERLBGRcELewNxOvbg3qfLMjyNKcOV2AIwii7Us+kfrEd4QRNs3leWbM5x3gIe0LbiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_153029_583798_153CA26A 
X-CRM114-Status: GOOD (  33.82  )
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

On Tue, 2024-02-20 at 13:57 -0500, Rich Felker wrote:
> On Tue, Feb 20, 2024 at 06:41:05PM +0000, Edgecombe, Rick P wrote:
> > Hmm, could the shadow stack underflow onto the real stack then? Not
> > sure how bad that is. INCSSP (incrementing the SSP register on x86)
> > loops are not rare so it seems like something that could happen.
> 
> Shadow stack underflow should fault on attempt to access
> non-shadow-stack memory as shadow-stack, no?

Maybe I'm misunderstanding. I thought the proposal included allowing
shadow stack access to convert normal address ranges to shadow stack,
and normal writes to convert shadow stack to normal.

> > 
> > Won't this prevent catching stack overflows when they happen? An
> > overflow will just turn the shadow stack into normal stack and only
> > get
> > detected when the shadow stack unwinds?
> 
> I don't think that's as big a problem as it sounds like. It might
> make
> pinpointing the spot at which things went wrong take a little bit
> more
> work, but it should not admit any wrong-execution.

Right, it's a point about debugging. I'm just trying to analyze the
pros and cons and not calling it a showstopper.

> > 
> > Shadow stacks currently have automatic guard gaps to try to prevent
> > one
> > thread from overflowing onto another thread's shadow stack. This
> > would
> > somewhat opens that up, as the stack guard gaps are usually
> > maintained
> > by userspace for new threads. It would have to be thought through
> > if
> > these could still be enforced with checking at additional spots.
> 
> I would think the existing guard pages would already do that if a
> thread's shadow stack is contiguous with its own data stack.

The difference is that the kernel provides the guard gaps, where this
would rely on userspace to do it. It is not a showstopper either.

I think my biggest question on this is how does it change the
capability for two threads to share a shadow stack. It might require
some special rules around the syscall that writes restore tokens. So
I'm not sure. It probably needs a POC.

> 
> From the musl side, I have always looked at the entirely of shadow
> stack stuff with very heavy skepticism, and anything that breaks
> existing interface contracts, introduced places where apps can get
> auto-killed because a late resource allocation fails, or requires
> applications to code around the existence of something that should be
> an implementation detail, is a non-starter. To even consider shadow
> stack support, it must truely be fully non-breaking.

The manual assembly stack switching and JIT code in the apps needs to
be updated. I don't think there is a way around it.

I agree though that the late allocation failures are not great. Mark is
working on clone3 support which should allow moving the shadow stack
allocation to happen in userspace with the normal stack. Even for riscv
though, doesn't it need to update a new register in stack switching?

BTW, x86 shadow stack has a mode where the shadow stack is writable
with a special instruction (WRSS). It enables the SSP to be set
arbitrarily by writing restore tokens. We discussed this as an option
to make the existing longjmp() and signal stuff work more transparently
for glibc.

> 
> > > _Without_ doing this, sigaltstack cannot be used to recover from
> > > stack
> > > overflows if the shadow stack limit is reached first, and
> > > makecontext
> > > cannot be supported without memory leaks and unreportable error
> > > conditions.
> > 
> > FWIW, I think the makecontext() shadow stack leaking is a bad idea.
> > I
> > would prefer the existing makecontext() interface just didn't
> > support
> > shadow stack, rather than the leaking solution glibc does today.
> 
> AIUI the proposal by Stefan makes it non-leaking because it's just
> using normal memory that reverts to normal usage on any
> non-shadow-stack access.
> 

Right, but does it break any existing apps anyway (because of small
ucontext stack sizes)?

BTW, when I talk about "not supporting" I don't mean the app should
crash. I mean it should instead run normally, just without shadow stack
enabled. Not sure if that was clear. Since shadow stack is not
essential for an application to function, it is only security hardening
on top.

Although determining if an application supports shadow stack has turned
out to be difficult in practice. Handling dlopen() is especially hard.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
