Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AC6C48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 02:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NBRE2GiNrpc+IVm0rnpmi1jbpXv7gZEmM8OxR0dVADI=; b=Ibwg2cohTZUwxg
	ftNcOicuN/PWAZDNkfZhYi3gF2HmEgDp38yW4wLS640XIKWiha4G6JtdLBl+Vg1REvocbf8psNAEx
	Nb86+ptaAJa+dYi8wpTmKwA/POEzJAqrmYGMNCmkXvJmLKTPFexP109aPPQqI6IBJszaVzdxwInE9
	M/lX1pZIdOw3rDhElyp3MZonzfIw/va7f6ZBACBXtbiObGwTEDPnem3sNilrlfJOkVx+KlAcpUgY1
	yyat4uzXr5z3u+tDPrpEmM48pX2+cWbcHyrbBpl7jaUIqMcTl1XB7jhiMoH0+L41Jj1m6GXH5qAG5
	Ej/upLRrOARfRFPO13AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcc58-0000000GpH1-3Tm4;
	Wed, 21 Feb 2024 02:11:34 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcc54-0000000GpFK-34T6;
	Wed, 21 Feb 2024 02:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708481491; x=1740017491;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ncTDQSMGXEEdYGauYSPKEAYev2NFhqpDDpvFDFQ32Kw=;
  b=ihkjvgDqMMfMP0inpNZsiopsVyFZ6fKf7roPBapqItJFdJ5iElFUIL86
   taQL6uOWRyGMMhsOnimKCRX5OND1Vwsd0yxAXIXfe79I8FcR+YYddOshe
   g01YZVg112DKADnBYEICZHz69E+T+s5dnvSZes023tmwgIv3vwTJ5Xdly
   vXgx1g10gmiQqeg1Y5zannUXghjv7HFl/ysqdi6LMdAcmSuUdiK+KTjEo
   W807DtDTecqlEi67KT0RBNfXxrgJmQ5nArIep9ei3YDYBIkofq+WqTIhe
   9EqV0dJLEKu5xddWdHlJukY/z5VYaDpUVVSSbczkOX5mDL56ESeU9tVTl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2484787"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2484787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 18:11:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9601753"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Feb 2024 18:11:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 18:11:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 18:11:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 18:11:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 18:11:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3m1f/J/cqE1+lnucZFE7l/d+AKxJGbG3Bi7g4eosWNR8z5OSxniwIQW3wFE8Shzy9pSYUzW/rsJ7ob56dzD15Nk4ioLyu5ollC5Pik0Gha5G7WW/9WQZalu3rEjBoNlSwAmesQmJpD/vdgS4/HDLtyOyQZXclUWV/QK3SrGwWR7M97ahR/9raahO5M5o7KWaCz0PA9eOpYf7XuyYaf5RDHUxbqaLWeK1G3DhK75p4mmFDoC/kmliLxcDXLKvqwWcQD+jEIo3CjrqvoHNSZc153NyrHzZS9g0CJiNzdsJmpzmgQTvLY/9iidIDxQ9T/ah6+HdkbkagCddRzpn9OWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncTDQSMGXEEdYGauYSPKEAYev2NFhqpDDpvFDFQ32Kw=;
 b=N4U/KhjF7bBPFMe12Iwd6RWB0qThVEwbInrGO3RxnHLr/NNBi7EBkdqAwCyUGUkSzGO5A/F7Cg5+bDuG8eXkVGEqZlhRn/szDlJOJBArjJCY0RkPys7IWMsfY0/pZIRb2XHEqejIwGKsWqZ6+zM6U/EJ/kv9Dh0q3q7Opkdc/f8LtFdaNRP5ErO/a+iXcDI/aRe5b1mzzksNwJ/bLXAh6fZAcipBAdG9N6NbnQ4E2/sFRdXYSfvkd3jlRyPgYOhcYxbNxMu7c2Fi33Drl344w00rJiW6OccaQhwl45fQxm6bS5BTHTq/hYfoue2SscN1SP9b6C5a5X1IoZaQCtJAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MW4PR11MB7006.namprd11.prod.outlook.com (2603:10b6:303:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 21 Feb
 2024 02:11:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 02:11:23 +0000
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
Thread-Index: AQHaVpxQxL7eT1mQek6VcjPJOSVEZ7ETiLSAgAAiyYCAAASHgIAATE8AgAAGrQCAAAuagIAADnuAgAAMOQA=
Date: Wed, 21 Feb 2024 02:11:23 +0000
Message-ID: <6332963a828d247ef935b7d3352fa1fbd83b11b0.camel@intel.com>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
	 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
	 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
	 <20240220185714.GO4163@brightrain.aerifal.cx>
	 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
	 <20240220235415.GP4163@brightrain.aerifal.cx>
	 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
	 <20240221012736.GQ4163@brightrain.aerifal.cx>
In-Reply-To: <20240221012736.GQ4163@brightrain.aerifal.cx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MW4PR11MB7006:EE_
x-ms-office365-filtering-correlation-id: 8a001086-f6c8-466e-8024-08dc328266c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U9g8ergQ+av2SJ/t25j8Vwm6eeMiYmLyeMTVbxwZRwATsm9MLj+WvaxsW2/+coaLqAPmMGll59ZB4FiRhXooT/Bo9wGRrNLjSSm1Xa6U3iZyy64Yw7uxIElw5qsjl9rp0MA1+n0oV+xTmqRdf1dewYqfbsJYnKzxWjInMXtkJ/isU+6BZT68B9uEPMGxXkaoP+yuqQRVVYL0/CY+UBFP7c5NmXQhN3UcwAvRVvd3O5EGaS4OtKAeIJ6proqyM5Z10NHxune9tKfKgmyVFHfhEiy+hITQgXy8DkJ6y5N7oBYEVmsSULlKTMcEsb4++RndiTHmjEN5mrrKAe5wXyR04/NKNNa4XUVi/R7RzfA7oEqbqb1EsErhW6mgX9sIqhmWqhKDb2OmqcXr/S33yI+m7/3tMI7dWVDo0AWz77hFAgGizcr3MBrkligU7AWnYl3LgtAlJOer7hJ3fv8lRRlu/Y+U5fJxvDeOZJHfIfQpHusz3uYZ3D6TmK0R4sS94AM/HJa6XZ3VtjhK2NV47sVccoZxeLskje48yNwFlpvVkRwmIRORCJvyEQ5kMJSnZjyDnzEW/KAC/pDbaemRn9lm9rzPmD6eDXtZ73QZ75xIl/SfhwDIZxwk7Jaza2k3gXZ1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1RJaDZjYVFvdEtHdjNNWEVqNzV3cjBQQ3hOWGhIY0Fya0JnWGs2TDU5SElT?=
 =?utf-8?B?SmlaT2hkaGZMZXJwWVJxNGlCVHFKY1BtQ000WXpwWXc0M1JDb21SOU1tUk01?=
 =?utf-8?B?ekowZDROei8xQ3JwemYwTEJ2YVVXekNOT1oxZFlkMUxqZHAxT01rYzQrTC9E?=
 =?utf-8?B?eGViam5ZMngwclVaUkJFQnB5Smp1a3ZOQlpCWmtIM29hcG8rL1pTYWVDOGU5?=
 =?utf-8?B?K2RBQlo2WmVCeVlySXJ5OEdKd0U5c1Eya0lDbzZsN3d0Qk83SEc2TGpRWHhk?=
 =?utf-8?B?T1MxUlcwejNwdjRjS2s2VGdLa29OV05tWEtoM2R3SFkzTHlQS1NobWFXaUxa?=
 =?utf-8?B?NFNUVzk0dzVIaVBBU3l2YXI0YlJqcDRWZDR2ZDBuYW4zQmYyS2pHRWNIbFdZ?=
 =?utf-8?B?SUxWMitWTnQ2NUJpTUthU2Nha3FBcjB0Qnd1TEJCNVBuNFhsRkZ6NDVMUHAw?=
 =?utf-8?B?Qm00eUxXZ3hienRsZU1RWTlXNjVZZGdkaDdjU2d3QWFZUGxtT2xEM0FBbm5h?=
 =?utf-8?B?NWEwN3FFSkhqSTVJcDEzZXNzYWNEcjl1Mkd3SGk4TTFlUHlWN2FCYXc1by9V?=
 =?utf-8?B?Tno5cTRmb1lzUmhjbkx2UGhwV1J4NjAvd0dMcjUxVTRsT25rUG5tSk00cEh0?=
 =?utf-8?B?ZmJ1elQ3Rkl6MlJOakwvdFBNY0c5L21EN0g1SlBraUx1b2wrK2ZUSXF0Q2Q4?=
 =?utf-8?B?SE1xNURFZ2tCWjdHR1Z4U25ydi94bWZzTFdVUzA2RTYyVStMZUNyYm4yb1pO?=
 =?utf-8?B?Vm5YVVhmYlIvTWhEOTZ1U2pMZzZkMndwQmRSTVZpYWJCSXBmRWNkQTZRekor?=
 =?utf-8?B?b2cxemRGZ0x2U21UMGtoSlpHejY3WHlJVytaWStEdStQYktSd3Y0NDltblVm?=
 =?utf-8?B?SHBFL1Jqb1Uva1U0d2M3VTk1QllYVWkzeGxodU9xZ0lZWGp1VjN6ZzRld1NJ?=
 =?utf-8?B?WGJpMWhkQTltY3Nmd2srdDRBTlJYTk1zSXN4UE12eUVnOE1oUklNUis2ejVY?=
 =?utf-8?B?VkdWandGWWY0QVdHTEZMd2FTdXBCWVRuMVN6aHpIcjEweVBnb0k3VnRsOHg2?=
 =?utf-8?B?YVhORXRlMnhQNWNJbzQ3WHBsNWVSUWh1UzNhRkllenh5ZVpudFNzdW45c2Vh?=
 =?utf-8?B?Y3NDZVNtRjBDeTNhejlQZ2toUmpHcGV0TFVJbTlKdlFLMmRNcjlBMGllTmNu?=
 =?utf-8?B?eXRpaXIrdlZ3NTZ6Qk10YzNPRGU1K0F3TGNrOEVFUnpqM1ExV1RhYitXZTht?=
 =?utf-8?B?RktTVGJXVDFaNzE4VnFnRE9nYTFMVVUxcDlLQi9QVXdnRTBvSEFhQWVOYmVS?=
 =?utf-8?B?Nllrbk1OSndMWU83STlXd09YeUNBWGxuc3huSlczYWh0YW1rS1duQ01pejF1?=
 =?utf-8?B?TE1OK24zdXpDNFI2WXIzSjkrYmk5YXJ6YzJwZG0yWmpLWlpyOFllVStad0xT?=
 =?utf-8?B?QkNxUmNRL0xpeFRKbDljNy9EQ1lmRUxMVzJPMTJ6UGp3UHBwa1lKTVBHeHZw?=
 =?utf-8?B?WUpMbFpkOXdqa0cyWmRKZlY4TS91UHNDNk5SeS9Pb21NdlhqNXJkQWRxbFpJ?=
 =?utf-8?B?bnFOSUppY1JsWWI0c1hIdFllMzNJTWxZVFlPQjZ5aVVERVBHL0JVMzBCUTNl?=
 =?utf-8?B?bGE1TlBHRTljRkhmWDlmeUhOWDBHTVE3N0ZWUVRxaW8xSG1RL3EyUTlaNXRX?=
 =?utf-8?B?U2Z1RnRTb2pJSUNCMEVmUkY4VEhPZzl0bXY4UUlwTDROVkUvbnBSSW44cXlJ?=
 =?utf-8?B?dktxYXcwTnpQRjJrZ0xqb3VCcGN4QkxkRDZ3WVVsUkMwWm1ad2U1Y0I1RVFi?=
 =?utf-8?B?YUR6T3lVZThWNy8zSnJ0TVV0WkFQc0JRRm9Ybk11emJ0R3Z5cTVSQTZHN1dS?=
 =?utf-8?B?TEZTVHl4NGlEc1lTWEgzOVNaRnFzdTJGK3BlZWlUN3dJY1ZXOGpJMXVSSjRv?=
 =?utf-8?B?QmZFZVUwRHg5SW0xTW1BQmI0T29qM2lucU1FTFNjK0hsckhEYm9hSTlTVXVS?=
 =?utf-8?B?SFJGSm1CV203cENGTEZZVFhiQTlZUzJhT3NjRHFUNm1zYkRSOVRNRVpUQ0sr?=
 =?utf-8?B?aENoNTRTYk5CWnVldVdCdENVTWpIWk51NkRPemVVOUF4OFVRT1V3WmttVzVt?=
 =?utf-8?B?QndRZmduSlc1YUt1dTVOQlptTEdiYUZkam01QUlzd3FjeGd4QjBSYXRMQVU2?=
 =?utf-8?B?cHc9PQ==?=
Content-ID: <8851A1C899EC24478F25894595770BF5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a001086-f6c8-466e-8024-08dc328266c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 02:11:23.0552
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qoRXUgslkP5/TNNChVA/y11tl5lPKHJtB//iyyokpPf/CqubGXx+UiBQArDEKUmKkrFaliNDi08YHGbop8HJ5q8sGXH6iSVZMHdqkimoDCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7006
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_181130_819555_F046941C 
X-CRM114-Status: GOOD (  23.38  )
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

On Tue, 2024-02-20 at 20:27 -0500, dalias@libc.org wrote:
> > Then I think WRSS might fit your requirements better than what
> > glibc
> > did. It was considered a reduced security mode that made libc's job
> > much easier and had better compatibility, but the last discussion
> > was
> > to try to do it without WRSS.
> 
> Where can I read more about this? Some searches I tried didn't turn
> up
> much useful information.

There never was any proposal written down AFAIK. In the past we have
had a couple "shadow stack meetup" calls where folks who are working on
shadow stack got together to hash out some things. We discussed it
there.

But briefly, in the Intel SDM (and other places) there is documentation
on the special shadow stack instructions. The two key ones for this are
WRSS and RSTORSSP. WRSS is an instruction which can be enabled by the
kernel (and there is upstream support for this). The instruction can
write through shadow stack memory.

RSTORSSP can be used to consume a restore token, which is a special
value on the shadow stack. When this operations happens the SSP is
moved adjacent to the token that was just consumed. So between the two
of them the SSP can be adjusted to specific spots on the shadow stack
or another shadow stack.

Today when you longjmp() with shadow stack in glibc, INCSSP is used to
move the SSP back to the spot on the shadow stack where the setjmp()
was called. But this algorithm doesn't always work, for example,
longjmp()ing between stacks. To work around this glibc uses a scheme
where it searches from the target SSP for a shadow stack token and then
consumes it and INCSSPs back to the target SPP. It just barely
miraculously worked in most cases.

Some specific cases that were still open were longjmp()ing off of a
custom userspace threading library stack, which may not have left a
token behind when it jumped to a new stack. And also, potentially off
of an alt shadow stack in the future, depending on whether it leaves a
restore token when handling a signal. (the problem there, is if there
is no room to leave it).

So that is how x86 glic works, and I think arm was thinking along the
same lines. But if you have WRSS (and arm's version), you could just
write a restore token or anything else you need to fixup on the shadow
stack. Then you could longjmp() in one go without any high wire acts.
It's much simpler and more robust and would prevent needing to leave a
restore token when handling a signal to an alt shadow stack. Although,
nothing was ever prototyped. So "in theory".

But that is all about moving the SSP where you need it. It doesn't
resolve any of the allocation lifecycle issues. I think for those the
solutions are:
1. Not supporting ucontext/sigaltstack and shadow stack
2. Stefan's idea
3. A new interface that takes user allocated shadow stacks for those
operations

My preference has been a combination of 1 and 3. For threads, I think
Mark's clone3 enhancements will help.

Anyway, there is an attempt at a summary. I'd also point you to HJ for
more glibc context, as I mostly worked on the kernel side.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
