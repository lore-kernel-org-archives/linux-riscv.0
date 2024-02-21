Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC78C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 18:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzPY8IYSyJKf2E7ZL9Ko3y1+W8S8REB+Cb3nToW4Lf8=; b=4CP7yWOqqSokvm
	bd4JDS0BPMmKuxN/pVrYatvflMnJl8mQJPoevUE4/jwv604vSb0+yLUkaGubrdDL3RuNz8LqZaE8v
	jf4j4alz6iceTcomny8UF2BcvB+t+m90M6fCEkr+L7f6JPfF6nRD92V2FB6tonxq1MbE7Y1z40zn+
	U2Xjr16gn8TcmWbmGa/qDs8ZVHFoFKdkjuQ7AjljrN83bKJv7HaZU16c1LW0jqrYqLRgoTO5cp2T+
	wTn0KAY9pH7gdHliIoKnuR1QQqS8ZTgufocTYHDo5AqKG5AQ2aXjzDYu7yrcS3KmKeT7/Ic0Fnt9B
	OcBnyyYOdB1EXp1GEmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrjX-00000002C3u-3Bj8;
	Wed, 21 Feb 2024 18:54:20 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrjG-00000002Bwj-3YRv;
	Wed, 21 Feb 2024 18:54:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708541643; x=1740077643;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XD3/Dg2/lBptWkx+edPUXDYQQgAYQqietWZOEnyHKUI=;
  b=QFSt27nnW3KbECIMvUnnl5Sm8oe0qtLGb3T6nfgMG5/FIix0raC1qzGI
   I8ELNF9XgOMum0dZ7332GQ/p/9AEqrpy7BsUzgbc8/q6L63XqILBOdr0s
   RPfLL/sqAUbIJwPeFBtmA0a42C0jJGLDkxKssVSrtIOaRwTwZrb2qfoOb
   UwyLnXhK44vKbCI/cd7v7sKSCWDn3uESKSFJ3Lv9mPpfPG/VLkctaF6Ku
   NM/MRrOciycIUaHtRvE1pQwJC/h6jb9xAydaYMHXzUO7U9bNlBnpVgM9c
   oY05B2ivWIQ+eISIa1fp55/zB2Sf752fw4HmCfvG28qFZ1ZO0WFqFxz+d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2864295"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2864295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:54:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5243958"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Feb 2024 10:53:59 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 10:53:58 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 10:53:58 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 10:53:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 10:53:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHmOpcL2/QcfcXWM1kpkz60SmMBFH9uxZG5UapCfBY32YECV0xlj4o5M86FFLRFSUigS438HCuJQD/wf9GouK0mJXeXW6gRgC3gvki2QlVUkbzE+5Jl+paT3Qm4aAs2ytbIsXM/mbItAQbcJyI05/XbVwq2Y/c+pp6rjlApqXIBdroV7esoWxQEw3OfuWseoFb7A0x6oCclnSoTQJQ4NF1awSZYaqp6g4TsJ7Hv+pap+L/yhuwFMiEZ7ADwhk/2rTOLg/NI+OOFQ3Y9CvISzbl0WzuTm9uI+5ov/nsKE6948NWu+oErA3AVZoXZCesuLsd6xJlqqoeV6CmYqT3CwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XD3/Dg2/lBptWkx+edPUXDYQQgAYQqietWZOEnyHKUI=;
 b=eDxpOQr7GicVrYMBjlEeIK/R9GVa0lqpMdB4XYfTfzd0WAZ7ojFTsO094yPgbDyq4oCaxyBacLF+fvG4pLizbuFJtoHYdKjPLJO2PcMqxaW8jIn1AvcWU+G3Lv9ug+u+P0UNMmPtxeQzD8HA4W6KbTsbW1cwt0ZDn/itUufa8m4YEaiesfTZue3YyF8WVencELo/wKbWMc4oL8IrVZCTUdo0YAcc8WRGq+pBTlVAVcVMRMji1Hv0+AR3TTsUFJ5uQYo4i1yYxbFJm4i4k/0oWfmuv3hSGBZNLDBDMSyGCOETwCWg3KurWojQzhyTP/d3YzisQGP2sfaKWGbd2oCvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB7086.namprd11.prod.outlook.com (2603:10b6:806:2b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 18:53:44 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::5d40:83fd:94ac:d409%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 18:53:44 +0000
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
Thread-Index: AQHaVpxQxL7eT1mQek6VcjPJOSVEZ7ETiLSAgAAiyYCAAASHgIAATE8AgAAGrQCAAAuagIAADnuAgADQTgCAABIegIAALDIAgAAF54CAAAQ9gIAABSaAgAAGX4A=
Date: Wed, 21 Feb 2024 18:53:44 +0000
Message-ID: <c3085fbe10193dfe59b25bc7da776e60779b0e8c.camel@intel.com>
References: <20240220185714.GO4163@brightrain.aerifal.cx>
	 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
	 <20240220235415.GP4163@brightrain.aerifal.cx>
	 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
	 <20240221012736.GQ4163@brightrain.aerifal.cx>
	 <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
	 <20240221145800.GR4163@brightrain.aerifal.cx>
	 <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
	 <20240221175717.GS4163@brightrain.aerifal.cx>
	 <f4a54297767eb098d903404cbe8860d655d79bed.camel@intel.com>
	 <20240221183055.GT4163@brightrain.aerifal.cx>
In-Reply-To: <20240221183055.GT4163@brightrain.aerifal.cx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SA1PR11MB7086:EE_
x-ms-office365-filtering-correlation-id: 2cd7a699-a011-44df-0e2a-08dc330e6dd7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wb3iU4lBRYXmQL8QgNSm4obykimOm0FfHt8qIMd+Qmi5SnFLonkgNzRwTiNPsmoovXtkFxmiTRXoZSHjj5zs7OHlzFut5IRGTk3Yi8BFju12ZTG96dytPZDQZjn/fLeUGmb2BJW5O+S3nt7ydMU5pril77zfHrdV0hnoeYCqfGVVIiwIXi6Pj+e6nDbSd5SFYqvx+CiBWUeCvdIt47DteiFRM6VHrI+UR3yEP6u0/ijfyR2Hx6medHPM+QSvPW0bdYuRnV1eIXcw3CSAUfrNr6dDBSmJQF6dPAAGmeBtXmjfJqxoN3vZiMs+4JGBXIRjJiKZVhW6TisbmsPIJSGqQJ2Ou1ZM0kRKpauCok908kkWh5csgbjC55JnF5Ys2zQThO+lU2MfrB9uhzKnh03pjtQdSkzs/0ymX+pXLKYNxZOqSSBhkiJ6hOcV7kdKVsiwH1PcN1OwDgaDDJrjWQWYAZ5TXYuzBzEKP9KrYZ+jFGIeysZjP9G/j8Y/7CZtLNrJUPzHBaZBOoo4A9fFPZ8P2BCRLVSr9VPU2XFXKKsT3WPi8wnd1WyMCVe25TAkdJX2HpGuGaq6EwRxK+XGZO+1ed/73TG7Db6EwWL7UsImoN4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXFNc0p2bUlOWUtldWpiN2wyNEFYeVN1Q0hvbmxTblBxa1ZMNnk2UlVPbWtI?=
 =?utf-8?B?SXNVdWhzb1daZ0I4MFpDTVM2TExGL2FOWGc4Y3NrTExxRk5lOE9tNjdhY1ly?=
 =?utf-8?B?QkhQdHNsWHJCUUhCUVNXUCtXd3BYY0xuUGJsM1h0aEhJVHlMWlg5MFJWRXNE?=
 =?utf-8?B?YnpCMEUyQjllTGRGbWRmQ29XN0U3dk1UeWlsa0EydE1ianMvZFpacUhxd1h0?=
 =?utf-8?B?ZWw2OVN5c1pkRnFQbTBYRmJ1cVpQMGlYekhabXF6QnBtQkxRY1dhTjFoT2dL?=
 =?utf-8?B?Qm1tOEJoSW1FWXZDSDh4S1kvajBYV0xHMm5qNGkzTHZ4bVl1aUtIV1Q4V3VZ?=
 =?utf-8?B?OW1KcVdnRkNpK3JuazBUZ290K1puU3p2S3ZqSDVDRWQ1R3ZtVDRuTXhBOHVi?=
 =?utf-8?B?Q2tkMk44YTROdWtwRnFWcHREZm5jZC9DT2pKdjBab1pVM0hjbXZPTEQ4NHls?=
 =?utf-8?B?TjZHU21wUmw0cTkyWTgxalYxUzFJS2pzV2h5WFVqNWx5Rlh6V0M5RE93aGV1?=
 =?utf-8?B?UnIyMlB0RE8waWNoa21PUjBoMlhwTnQrVGU5aDRPSENYMHJHWmtPNWNIR2Fz?=
 =?utf-8?B?NDZCakR4QmNHLzBQOGpFOU04MjBZWkd5T2dLYmpjc0daRWk2N09YakhhcGlR?=
 =?utf-8?B?MWlCZ2pFZ1NjT0RlTTZ0azE0bnI0WDJKeHMrQU13V2V2V2dFeG8rMTQ5aWRS?=
 =?utf-8?B?dHUxWEJMV2djZUdRd21qKy9uRGNrRTFtSGUvZytqS2xoMVo4QnllK2krT2hm?=
 =?utf-8?B?bmI1WVJwRjdTYUxETVl3NFJkTzV4N01SR0gwK3czcE5oRkZGUnJOTjFLRWY5?=
 =?utf-8?B?K0xQS3BvUEcxYWtOSXRVOU95ZVNiM1hBSWFyVmdFUVJuSW9zdVlWd2pVcHMz?=
 =?utf-8?B?b3J2SEtpZjZzVTNZUlRVU3IzTG5talZxVWt6aDRQUlhYWG5BWFlBRmVlYWRC?=
 =?utf-8?B?SFE4SUpPWG1uamdCa0dWeCtZcU1BY3RreUllaXZBR2QwY1czMTRERDNENlRR?=
 =?utf-8?B?Y0FqQ0svcEU0SXlJaWZTa1lNR3NESlJXZkhPRDZrcU1Teno2dG1ubVJDbytG?=
 =?utf-8?B?NEZEanJEejFXaTF2T3VjckRMa1lVeSt5UjI2dDBCd3F3MFJTY09YT2JhcnRu?=
 =?utf-8?B?ZlFLZitEdWxURngwNyt3aWIyUVdUYzJqY2JSZHZEamlPa0prVUdaT2czWjdn?=
 =?utf-8?B?K240YmlveXhQYXZ3blJkV3pZVW8wUXY2QzJ6elNnOFEzNERaN3VlK1B5enVn?=
 =?utf-8?B?NXRlNWZhYjFlWFl6WW83eXN5SDRWNHY0U1pNMy9NR3JuZ0ZoL1hjS2UrMVRV?=
 =?utf-8?B?cXNmUDVMcDFGVmcyWmxqcEpwTE1Pa0hJZ2ZpSUJNdGtLVEN6M2RmMEJtM0kr?=
 =?utf-8?B?RThrU3ZhVDltZ3BMQ2pvZlQwMnFXNkNaZEFQOVdmZDVacnlNcVFEbFUyeHNB?=
 =?utf-8?B?aDNacDJlSzF6aHZONEx6cStyQzlMUVlMSjRrZzllZmx1Ti9lbm9HMGZoV0tB?=
 =?utf-8?B?aWRiRTA5VXRUL1h0SlljQkx6dFRwdjc5cmxwTGRoU0tPK1ZYOU51VFVWOFE5?=
 =?utf-8?B?QXpKbE0zWGZXaG5rODBnRlJweW9SZmN1VjZldks4eC9teExTUWJQN011ZFNO?=
 =?utf-8?B?WTd3VWxWdmt2VTlDbVVzeDJzZXh5SUhTemtOMS96UkNzaGVFbTU2aU5XOG04?=
 =?utf-8?B?OXZ0T0xSeEFqS1BOM3dMK0VlRjRmY1h4ZFBTSFJGM09adFl0Vk0yTEExd0Vy?=
 =?utf-8?B?blR5WVFmYjBsNHlRanUzQXlUYkF4STErWUo4d1FuK3BTTlEzUS9weGYvR29G?=
 =?utf-8?B?czJzRndiaTUrQ0dTaENEVDJHTlAzaU5lVUQvOUdHV3liYTVGT21aUzRUTlg5?=
 =?utf-8?B?ekVLcXBKdUJXVTBvNVRFZDYzQld5ZFpJQ3VIek1Ob0pRY0xxbUtMMTEyenRO?=
 =?utf-8?B?bEN5dXpMVUltZlBOeWxCWmRUdG1rd2p6MFRkTmFnbEROcTlkNVZaMjB5djgx?=
 =?utf-8?B?dUJ6ZXRmd1FGWjJ0OUw0TlhhamJLY1JlUzhwcHNXWlowK2dvRHY2ckFxeUNE?=
 =?utf-8?B?TXVTblFQL2MxbEJiRXVXVVpYbmt2VnZmT2xoN2pzQXZUanpDV0V2UDBzbGd0?=
 =?utf-8?B?d28wSkZPR3NNalhBeGtWMEFmcnd0MXNoTmpIY1p0b2hhWkh4QTdkcU9STkhL?=
 =?utf-8?Q?HAUgTmF7fSNcVTQIDigG70o=3D?=
Content-ID: <54FB79F0FF7D744E8DDF82D22D33BDDF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd7a699-a011-44df-0e2a-08dc330e6dd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 18:53:44.4632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4KEvFRa1hayVzlGJI/MhjHnStXlSjgSPqSyeMoO0NJVozWga5a1XdpBl4fM3S1db5DeXVMovvm+l4At/ygjbNNxGTEv1nSsNOkUyD8sR8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7086
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_105409_131369_E3D6F466 
X-CRM114-Status: GOOD (  31.17  )
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

On Wed, 2024-02-21 at 13:30 -0500, dalias@libc.org wrote:
> > 3 is the cleanest and safest I think, and it was thought it might
> > not
> > need kernel help, due to a scheme Florian had to direct signals to
> > specific threads. It's my preference at this point.
> 
> The operations where the shadow stack has to be processed need to be
> executable from async-signal context, so this imposes a requirement
> to
> block all signals around the lock. This makes all longjmps a heavy,
> multi-syscall operation rather than O(1) userspace operation. I do
> not
> think this is an acceptable implementation, especially when there are
> clearly superior alternatives without that cost or invasiveness.

That is a good point. Could the per-thread locks be nestable to address
this? We just need to know if a thread *might* be using shadow stacks.
So we really just need a per-thread count.

> 
> > 1 and 2 are POCed here, if you are interested:
> > https://github.com/rpedgeco/linux/commits/shstk_suppress_rfc/
> 
> I'm not clear why 2 (suppression of #CP) is desirable at all. If
> shadow stack is being disabled, it should just be disabled, with
> minimal fault handling to paper over any racing operations at the
> moment it's disabled. Leaving it on with extreme slowness to make it
> not actually do anything does not seem useful.

The benefit is that code that is using shadow stack instructions won't
crash if it relies on them working. For example RDSSP turns into a NOP
if shadow stack is disabled, and the intrinsic is written such that a
NULL pointer is returned if shadow stack is disabled. The shadow stack
is normally readable, and this happens in glibc sometimes. So if there
was code like:

   long foo = *(long *)_get_ssp();

...then it could suddenly read a NULL pointer if shadow stack got
disabled. (notice, it's not even a "shadow stack access" fault-wise. So
it was looked at as somewhat more robust. But neither 1 or 2 are
perfect for apps that are manually using shadow stack instructions.

> 
> Is there some way folks have in mind to use option 2 to lazily
> disable
> shadow stack once the first SS-incompatible code is executed, when
> execution is then known not to be in the middle of a SS-critical
> section, instead of doing it right away? I don't see how this could
> work, since the SS-incompatible code could be running from a signal
> handler that interrupted an SS-critical section.

The idea was to disable it without critical sections, and it could be
more robust, but not perfect. I was preferring option 1 between 1 and
2, which was closer to your original suggestion. But it has problems
like the example I gave above. I agree 1 is relatively simpler for the
kernel, between 1 and 2.

> 
> > > If folks on the kernel side are not going to be amenable to doing
> > > the
> > > things that are easy for the kernel to make it work without
> > > breaking
> > > compatibility with existing interfaces, but that are impossible
> > > or
> > > near-impossible for userspace to do, this seems like a dead-end.
> > > And
> > > I
> > > suspect an operation to "disable shadow stack, but without making
> > > threads still in SS-critical sections crash" is going to be
> > > necessary..
> > 
> > I think we have to work through all the alternative before we can
> > accuse the kernel of not being amenable. Is there something that
> > you
> > would like to see out of this conversation that is not happening?
> 
> No, I was just interpreting "uphill battle". I really do not want to
> engage in an uphill battle for the sake of making it practical to
> support something that was never my goal to begin with. If I'm
> misreading this, or if others are willing to put the effort into that
> "battle", I'd be happy to be mistaken about "not amenable".

I don't think x86 maintainers have put a foot down on anything around
this at least. They would normally have concerns about complexity and
maintainability. So if we have something that has lower value
(imperfect solution), and high complexity, it starts to look like less
promising path.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
