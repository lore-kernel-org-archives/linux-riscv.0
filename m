Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA17CC48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUxGA+I1+jXCEgNFzIP8vSi4HV0pwwdhkZ1J0HRVIHQ=; b=QuxvsV66pzi+h6
	QoAn23gUJ0eHxRNkEw4e22K9HuD/Hw/kBguj9Yv8ChYwznCR0kbsU86vYKrRq6zlwImVPyvyhCQqX
	hRda1itqaeJds9NA2n0ak4KYKShl31nnOo6X6wJc8sIGNj3iAvepUK/UCg0D5QUhIXbH3mRH8h83a
	UE2G5pgNWia+iJTm7X63FY5z/n/Dr2ssX94lNEtIfG22FtlMum8t9YLUXfWuSkXbCLzESmAfeA1S9
	VYTTW2LfKjQ6KXxEKpRvBdIooeOWntiQGvkzj4vRbkEVlomjg1XkYmPC6U4MYXnk/zBh099/gCKts
	MBePopUqN2fyLknl631g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rceG4-0000000H702-3cjC;
	Wed, 21 Feb 2024 04:31:00 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rceG2-0000000H6xf-1TqE;
	Wed, 21 Feb 2024 04:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708489860; x=1740025860;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/haKh5XkLk63Ews24pAIl9uKjQoYPq3dFaKmxCA+hvk=;
  b=USxcDLl2Pr3KGdlmRyEeFQ1df1SqKJ+P4jdmMo92Pa6AkhBofaUrhSmc
   WStVnNwCGUrbLXQoWtBT2ffbjSDLn7gBwHTF1evODGBtKbyEDhjbqog2M
   EW2+5OFxM6A742+CQPUvcdfHg3IEiYCVYs1PUYeTAqqsnoYvBb/hpAiwC
   KSTRrkxXzASeG5L+HYyI6GT01dBCrtWaj32qHkiQv0Yyji+6v0X7eJPsk
   5lQQo4QYF0w4V27HDzxckZGuIzqbGLB3Q8skLKK7jW2VAMe5qoSzz4gbR
   jL8jxpcZ4nqBJaKRrFHGlQ8PqcaT/ME2BRW5SY3FA08y9N5kLdBYCVaIK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="25094049"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="25094049"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 20:30:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4979723"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2024 20:30:52 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 20:30:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 20:30:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 20:30:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7FzGxDjbYMEfiVOUtr9MIXNjyOkq+jLo4KdPCvDvD9xHJemKldV4E8+cV6IhTEMpTL6wRKA66OZG+5obwORpJa5IzVY/3cmOpzHSmgbVMC6Gk2+DDeN8QFcuMr+TS2Xs7o3uo9lB/VWfE2gff13h5FQDNl7PrWq6JJu1YwdpIoF5ALOGmnmYmAhirvluQrNix9GZfztZY69Sp2C6/D18KRYOPgCxpVrqw4djr33f/49luq2oHKyiDqpb252Z4cJ3Ic2e6FkhswgzO4Rhx1fvioCL3f0iEyaAYeme8IQM3Vss/bcxxwHoprkD7b2JhUHpTOs4kz0TYgZTOsEEJd+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/haKh5XkLk63Ews24pAIl9uKjQoYPq3dFaKmxCA+hvk=;
 b=RdJvRPQnOqRm6bdip3rne6Rg6CfPO7/gmREZIIkzukf27+pTUCJJNsFEFPFljJrj7pC2MpTIfeE0cSnvKYSM0pyiOTMCpaCPX68IFGtp5IwERP9CRt2A6nMObctIF/sxjYoF2nyBimlBJefhkO1NJQiD3pID3ye1a8E39DVRAGSW8ASWcIAGyW+onjstv8RYc4b/BtpsyaXAnl5jf3kw8it9sZo8Zt9bPv+fTWpS3C8cXxsmMdNwt4gqIsgJl9Ya2MmvDGfe/gPo6tKhnZaMplmyT6cGVSE+BdL1J0Dsu1uZrykkLn9aanumlpRDR7iBaKLSk9JCTBk+cFeb7IdRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 04:30:49 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 04:30:49 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "sorear@fastmail.com" <sorear@fastmail.com>, "dalias@libc.org"
	<dalias@libc.org>
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
	<akpm@linux-foundation.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in
 userspace
Thread-Topic: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Thread-Index: AQHaVpxQxL7eT1mQek6VcjPJOSVEZ7ETiLSAgAAiyYCAAASHgIAATE8AgAAIRQCAAEurAA==
Date: Wed, 21 Feb 2024 04:30:49 +0000
Message-ID: <8d28fce4b0d1fc2c757621d9a0f82a5c2db8e78c.camel@intel.com>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
	 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
	 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
	 <20240220185714.GO4163@brightrain.aerifal.cx>
	 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
	 <063acc75-ea1d-4dd3-aecb-e5c8884005db@app.fastmail.com>
In-Reply-To: <063acc75-ea1d-4dd3-aecb-e5c8884005db@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH0PR11MB4838:EE_
x-ms-office365-filtering-correlation-id: 2b021f81-719d-4d4a-063e-08dc3295e166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cDOAaRa2C0t1/o+h+zWC6vjHsgpB+fwl/j7dgci1pbXd/sDntgohehLESE9eXT7GdwrvgPPbyZVRaNPP9ZBhluKBXidwqpMNlBS72IwVrb950GYSN7go/RTmRQzozMrRCHZ6uGPtVsJGamSliCF97wcSX1r+PRIMuA3sOmYrMp2+gPShkgdnhLAmBKR0Jqv+7HrkWdO/h/YWwoM8LXM0t8Ef/IR9ksYHVl0oWvR3S+gugyh/qehfG+PqDOgrZSIg3c+bHeNVb10cG65X16XtdoOoFxJ2Ha8TUP8YO4bTZBPZcpHjzeRVFdVgZNMK59fhjmsC3TQksBTLuiyRorLzcjFZtaioW+bORlLOwVhfqnYHI9NSlMusyN14dvlGFxnYdOx5dOeWYPPYwF3BvRRj7Ono9/PyQpDEV/1iLqVC/uZwtg3IcEolhT9bg/hmeoFOCRaNSM2ENEQx84HaxgJEQ2o37JtkCV9AxCWpRIfa2qqHDCnEiD4AD/8mv3mXWRDx4ZUA+barzLE5QFsfhqwjhB8w/t3wV5lejcEtFHIy2S+7wMUBAZxbnccFprIq3DyDDSOG08aPmD6LcPE+dSfhJQ0CXWGjdMigBVyNI+irOruUNK2WM4xWvyf7ZsZeQgzO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXR2dG5aZzEyR250a3pJM0dOOHZoQzZwakEvbUZ6M3NNSFVFelBUai9hZytr?=
 =?utf-8?B?QnRYa1ZQWE9MbkJXekpvWU1EbTJxaVJna2w3ZmlmMWlZcEtkL2Raemc5aTlV?=
 =?utf-8?B?TzdjRlNyL2VLVEV2TzFBdzcyRDVid0VwNlE4OW5MM25obHNZUmFjZ2RyeHdm?=
 =?utf-8?B?aFg5R3B5UWRDcElvT1Flb3lCV3A4VlQ5bHZFdXZhRmFPb1BNREt1MHRUUnZH?=
 =?utf-8?B?NVM5Qyt5cXVscWkwWFBVV3hCbExFbXhEV2JWNWt1dkVGNmpwYUZyT09lZXgr?=
 =?utf-8?B?cDhqNHZ6WHpyNjZ0KzRYTTZYWjNLWWdrZ3M1NXpXK0twelB4dW9UMzFmbzVR?=
 =?utf-8?B?cG1pZHdUQVVKZFFxd1ZoSnoyTFFGRGZHVndEeWhySkVtbzJYYlFvSWt0LzVx?=
 =?utf-8?B?M1ZlbFNjYk5KSThIOFUyMmYzUG1WaHdKYThtWXByWEtGSEhlNzgwWkdFOHVj?=
 =?utf-8?B?ZGo0VjlUb0c3cThIald0c1R3TWxtT3NpMldsSEY4YTF5RGpWb3A3dXpQSG0x?=
 =?utf-8?B?bGNNWW5jdy9MZ1dvN1BjeEZlU1VpcVhhamFiOTNoVWNRQ01XRldaUHhzZW1D?=
 =?utf-8?B?Q2F4M0xwVVZKMGdYdjY5K2ZoYlU1SmFIK0JTcTlKUFNXS1NQK25oVkpoaFR2?=
 =?utf-8?B?VTFUZ09MRThUTmtTakgvc1kvREoveGZlQ01QVE5vRVNsSWRTVWRmRDk5NEgy?=
 =?utf-8?B?N095S050Q3d5dm4zU1I2Z3ptZVczYmhObzBXaEcxbW1Xd3hFTEkrYzBybXkv?=
 =?utf-8?B?L29tS3NTdytxaGdnOHA5bnBkVklhQVJzblZSU0k3RytNWlVGbjNOQ3JMZVdI?=
 =?utf-8?B?bWd0ZDRqQzhHREFVbWxHNmJtTDZQK1RXWFJjaGdnY1JHWlNTN0NGWkVyYWZI?=
 =?utf-8?B?Zmg5d3YrOGdrVUI1SjBvV3ovNmkreXdNYnRMMEZsTUt2NUFxUW1RRDBCSW9Z?=
 =?utf-8?B?Q0t6TG9veE9ROCszeS96cnpxaG1uY0J5MEMyQWtva083MU16RW5jL0NqZzdw?=
 =?utf-8?B?dWUwNVhuWVh2eTRkNVUxM2lSOGNHL09rS1lmUGVsaXdrY0k4VUh4QVE5U0tQ?=
 =?utf-8?B?QjVmOTgrZWVPRjFnU2FyallMcC81U24xZldZL21aSEN2K0NBMDdyZy9BREQ0?=
 =?utf-8?B?ZG5GMFdMa054T2szZFBhaG9RSEV0ZFpaYUFWSDN1TlBaVVN2K1lpc2JYaHdk?=
 =?utf-8?B?NVJkVU5KOXdUSUJKV3dLN0lCZUczbkJpL0lPQmZqWDFlak11V0VTVTV6OXBH?=
 =?utf-8?B?aW1IRm4vckNveXJnaFFmNmtFT21WQUZoZ3hhR3F3S1ZjeUR5QXBHd3lBY3RJ?=
 =?utf-8?B?VXJYTzJJaDFmZGZKZ0tPaWY5K2Z2YllaazFtaUExQWhyZlRRUjFvT2RIR29Q?=
 =?utf-8?B?ZHhPVGZQVjFyV2tjVkpRbFBHQTdpZ3g2NHFZbUR3Njl0TER2eVRpWC8zMml0?=
 =?utf-8?B?Mm1zTHUxSTZaajNaWFBzUGVLbVdNWGxlWndRd2V0ZXJmc2ErYVEvNDgrSnR5?=
 =?utf-8?B?dmxsZjdJak5lakh6dlhleGpyNnM1ai8wV3BlUStZc0xheCtOcHA5K21vbkNa?=
 =?utf-8?B?QVNkb1hOTnlNTG1qajYxNnhuNVk3dzllTTVDOG16d2NnM2U5VHZ1MldMblE1?=
 =?utf-8?B?MWdORlBxc2xUaDhEZi9lTzRPTVJ2ZWJ0anpid0d3VTJScU9Lelc0V3dKb3lu?=
 =?utf-8?B?SVdYdEJISlZWeGRBVmYyVjlUOEJXS3dHSFJqU0h5UlhFaU14Q2FxQjR4VGI3?=
 =?utf-8?B?ZDE3d3NuQ0MycEYwZUUrcGVkRzcwVW5GbVhaUm9nM050U0t3TTg3UjZCbzBw?=
 =?utf-8?B?YXpQYXZ2SjRYYldQUUdqdTMvTy9LTXdsckl5RS9Lb2FESXo4aEtmdSs1aVNh?=
 =?utf-8?B?bEx2aWwyRmhFcm5LTW5ZMklmOHMvb01ObVhjVFpzZ0c3b0RzZ0FwZTZvNlFV?=
 =?utf-8?B?Sy94Qy8yUmd4cTRvM2RGYUltYWZQWTZIaGxILysrQ2I5a1pRZzRKVnZTOEdJ?=
 =?utf-8?B?WVhiNkZwWklESk9aODM2ZFZXZmZrL3JFT0Nlak1KWXVRdEtPQ2Fra212Mzln?=
 =?utf-8?B?dDRrQzhSK0xxVE9tOUhNMUhDcUxoOXNKWCtZVEtLUjJLNW5ha1JUU3pIdWNK?=
 =?utf-8?B?SjVMaDJicDJIeVUxNXpjSmFsMEV5bzR2K3ZaNjBWa2diSzhOdWo5M2dZSEgv?=
 =?utf-8?Q?Wv6+6q+hl7VuEk1a67LH4eI=3D?=
Content-ID: <F73A1482C2DCA54DBF0A9C909029FCBD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b021f81-719d-4d4a-063e-08dc3295e166
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 04:30:49.2634
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zXiPL1z2q4+rwNjcM434V4Pw3uG/lVvJYAY2+eyhkjeFa0b0GtLRB2rl1A+n9h+jSS9fcZB/MTWo33C6lE+S+rczK52NaCiWYV+FaUHgQPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_203058_495578_E4311B86 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue, 2024-02-20 at 18:59 -0500, Stefan O'Rear wrote:
> 
> Ideally for riscv only writes would cause conversion, an incssp
> underflow
> which performs shadow stack reads would be able to fault early.

Why can't makecontext() just clobber part of the low address side of
the passed in stack with a shadow stack mapping? Like say it just
munmap()'s part of the passed stack, and map_shadow_stack() in it's
place.

Then you could still have the shadow stack->normal conversion process
triggered by normal writes. IIUC the concern there is to make sure the
caller can reuse it as normal memory when it is done with the
ucontext/sigaltstack stuff? So the normal->shadow stack part could be
explicit.

But the more I think about this, the more I think it is a hack, and a
proper fix is to use new interfaces. It also would be difficult to
sell, if the faulting conversion stuff is in any way complex.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
