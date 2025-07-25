Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8A0C87FCE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 17:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRAfACuDC7qc2WmKCQ/uYtQg97WhGm2kBesLXCOp860=; b=UCS0IZwGWjP34S
	lwlF7XtfWjnM1CN8O6bnvFiCquFQAnLM69Bw1K5G95vVerlsIwiKbyH6JKrpXU5XxLYkYL9D9zt87
	U6f4E+0xdFt7SJmhpVlWrQlgMorM5lRgfmKHW1VUZ0qJxSauxgjQD4roe10+iGlWnraHg6lb6nfuZ
	E9THqL5K0uMtH8XwRLs9Yf4lbk6UmEvnyVNyZj+y4e5XvyHBEWhQdZD0he2Ai1JWfGosXpn4UabK7
	A45gAaErOUJ/DZN+RZ9IiwWfM6q4ac+mfGFivKO5HH21UJReBsYPt79l59AFYI/yRjSXvhC3KfSqV
	ok+1rKvfgcLsrnhCS6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufM1i-0000000AJPC-1ff7;
	Fri, 25 Jul 2025 17:16:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLt3-0000000AILl-3zMl
	for linux-riscv@bombadil.infradead.org;
	Fri, 25 Jul 2025 17:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To
	:From:Sender:Reply-To:Content-Description;
	bh=5FxnfOP1j8lU7u0nAaaVgOQcHiN85XxFxaAkTlEEAGI=; b=jMV5piS9XN+rClVKF1CDpYrsQi
	Z7Gu0yLyr6+6kgN+hOIJ/ldWXBw6+0+BfI/s8mchFoJFCoDKskdgKiN6lkPON7MRoD5UJrUocngWw
	Ige/fTajG5LZbU9wQLDX1IhXo/9qpCknEiwamYKTR/+lshohaYeXdaNGkwB6gzQmCum6Rb+6u2UQd
	CsSLB/PlHfrh53CTq9B+BNsF3zuYgxpMGmCxGEA2nj1TPGjlX/9vVipzie/cAT6Qx1Du+E0pIgpWN
	pVn0DYjlna2qiviIfg+Cpg9Xn1FqpkjLOu6w7F2s1sh3vRyeOsRMg8Nyiz0vdHJujujcy/AP+0Y2T
	PmvWbHyQ==;
Received: from mgamail.intel.com ([192.198.163.13])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLt0-0000000BtCS-1rhV
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 17:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753463230; x=1784999230;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5FxnfOP1j8lU7u0nAaaVgOQcHiN85XxFxaAkTlEEAGI=;
  b=mbCsOFSxZ7O+/4VTV/+gCevIFTmQfpjWVN0fDIR072XMt1OB3z82Wbii
   DRJXD1K+eiBmRaE2iuWVW37Tjl0MqE1YYp5NSeASiqw5KFPBzAkfuHJzR
   s1y5TIt9nDyEcecea/iqkdwzR8DZl+KJneeDgpMcTZ3kIfuUwdx+N04dE
   fHQ8XrGts+Wfwu66pukZpj639xnc/53Np/JmE+ajsDatvYe9ZKA1eKokS
   vsRFvlaggcEopOz3xVX4F3dqSvPc/vrG0pTpRqKj3QsQ6cGHW1ZnKa0qr
   xZ8+YQ4edVepzHZWkK/AVjunfM6Ib98AiDgSIWQooGBDSa6wP1iyi4xst
   A==;
X-CSE-ConnectionGUID: 9KNB3gX/SxmSuDk9F1vuvw==
X-CSE-MsgGUID: kcxMVt9uTsa3ntL9+IdMuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="58423430"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58423430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 10:07:02 -0700
X-CSE-ConnectionGUID: g5Nh0hP0Q/Cbjh010iUtZQ==
X-CSE-MsgGUID: XWYbb1Y7TKqR5e8z1Y/O+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160208281"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 10:07:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 10:07:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 10:07:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 10:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBuW+mym152rNfzjAOFFso0NAFLNVZJooWxuTdOQhuKgF8zi87e76wwAOmUQKtvH+VrW8Nqa+x8q1rs7MYGKjAD6Mf04jPP3R/kyDJsOQTt280osL4HXXikChpj1VClRdsxKfAwsy2Fobxjo30nDNZdpf0aq66+1itsz1fWuC4vqcsLXksOdI/M7VEQqnuIn+3Zak2HioROozrthbNl5xLRN+Bz+rATYCFUcpOysNmLBXeYWsaszt7sD/ZQUBD10svghAoqY/kLMyN+lJnqft+/SaQpYPUvyNq+8zSJf05/Hat+xWYRmL36F+t2K4lN/cN8K+olnmw6M6mzbdo3+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FxnfOP1j8lU7u0nAaaVgOQcHiN85XxFxaAkTlEEAGI=;
 b=RuUmmR1D8vNaa5LL/gsp0Qs+dptoZswg0BwyjotKRwGOR6lWIGhgkIxjEdG0ytQKLCLWKp95UHXiRxXhS3BkxrTJAwvVbIEiMuT4iFjLJjM/xVYFr8hjl9I614XiHmsBEddgqHuAsNmi00jLNaI3VHRO3e+FGcRGVU1q4UjlcvyPgvpYaV4DZpCJFLpUYsKYqzAUdmSU93ufFcXDMx7B1Af3Q+Romq+fMGCUalmqFu0BWCyfaxdAKNwu3pnahAUL2V+4V2gVRcBuNu8ADX8hUt8T12hEt3QuQR+d6zbloLG5L9Dix4HxqrMaJXrRaOgC5HeZTQ2oiYJhjsAVcPaOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Fri, 25 Jul
 2025 17:06:17 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 17:06:17 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>, "rppt@kernel.org"
	<rppt@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"david@redhat.com" <david@redhat.com>, "debug@rivosinc.com"
	<debug@rivosinc.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "morbo@google.com"
	<morbo@google.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>, "surenb@google.com"
	<surenb@google.com>, "monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "kito.cheng@sifive.com"
	<kito.cheng@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mhocko@suse.com" <mhocko@suse.com>, "alex@ghiti.fr" <alex@ghiti.fr>
CC: "andrew@sifive.com" <andrew@sifive.com>, "samitolvanen@google.com"
	<samitolvanen@google.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "ved@rivosinc.com" <ved@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>, "jeffreyalaw@gmail.com"
	<jeffreyalaw@gmail.com>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, "apatel@ventanamicro.com"
	<apatel@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Thread-Topic: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Thread-Index: AQHb/PPxu9eTHUKFUke14vTmf1bCHLRDEvUA
Date: Fri, 25 Jul 2025 17:06:17 +0000
Message-ID: <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
	 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|BL4PR11MB8846:EE_
x-ms-office365-filtering-correlation-id: 1bbf5399-73fe-461a-22b6-08ddcb9d921d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emVFbmNLMnVyS00zaEwvSStmay9nb1VRY0dhZHhsNWZTQk1pTW1STTZiQlFs?=
 =?utf-8?B?NlhSRFdXU1pWM1RuejhqaVRXM2RRaERvVTVOL2dxdHN6MFllMEV3RGVOUWQ1?=
 =?utf-8?B?MWpwYThvMGtRaEYxV0pnSmFINlRYQUtwdmI2dDNIQmZlSUdlaGxDY3dHWjhN?=
 =?utf-8?B?d3ZGSk5oZnE1d2dkZ1FYOWVDMXZUR2JXZldvdUZ0K01ra2FPN2dXb3ZWTjNC?=
 =?utf-8?B?dkNycnhSTE5xcUo0UUVDeEthZXBPRzdNdUgxOUhlUHVmSnl5ZXBUWXdtZ2Fq?=
 =?utf-8?B?RGdVVlNXVWM3OG9mMGlOWTh4VnFQWThSY01ZanppVGMreWxsaEVlT0d4Q1Rl?=
 =?utf-8?B?TzljKytiM0RQeWlMR0p0NlZYN1E4UzdQRkpSR1M5UmFXUlg4V3NWRXNub2Ew?=
 =?utf-8?B?b0x1dGlrNFU3dWVYYk5OeEk4NWRoaHJWOWplNDZsRVpwbzFaMThCV3RlWmUw?=
 =?utf-8?B?T2wrMGpqQkl6Q3ZuZkN6eHBNamc1QktWdWdLcXl5TWZKTitoTTJRQ1cxblFp?=
 =?utf-8?B?R1JIOTlMMlJ3RGNRd2g1Qm95ZDBqbDhNa2tHN1pzUkFrb003d0J2dk41bHAx?=
 =?utf-8?B?MnI1N1NheUdXaUNoNVN3ZVdoMUxjUU1COW9OZzBraGdOQTlUVFBIcm8xWjZF?=
 =?utf-8?B?OFlNRmtlVzFROG8wbnZ5c3pZeGxXOVF4RVJqRDdrSkExaUhiTk5MTnZMY0Qz?=
 =?utf-8?B?REVsSWtWbkF0Z0sxVTcydm1rRWhIY2l1TEpWZ1E4UXdJMXNIamczR1MxZ1lW?=
 =?utf-8?B?TmlpRXhJdDlDNUFFRndUMjRqbHVLUTR1WGI2bVdmZXh2dWdlTTVKR2w1S00z?=
 =?utf-8?B?ZTlIYjFNTzFaYnVvclJ3OHdOcGFLeVFpR0Z3WTNEVnhKL3dETmJkSmN5TW92?=
 =?utf-8?B?UGc0b2JQKy94RUtCZVgxeDVHcEREaUdMUFppdEZ1ZTVlQitZU3c1V1BSMlpo?=
 =?utf-8?B?OEJ5T3M4MXpmZE5aTjVoYXBTVjY2OWplNzN6LzUrVHAwR01iT05yZ1JDa3Ew?=
 =?utf-8?B?Nm10NkFBRGFLdTlrZVpUdWtXV1Z1cWplMHEyNXMzUThXaStKYXBsYnQvUHRK?=
 =?utf-8?B?SUZ4anZYbGVNbE5lOUl3RGVWVnUxTXNram13dXZMNWNZMGVaNFNoYlMvUjhQ?=
 =?utf-8?B?ZDZPOFFndjJ2UjZFdW4wVDcxdHpvdldDQ0gzb1FTVzZHWTFYZHNWa0F1d1RW?=
 =?utf-8?B?dnhPT2F1QkdwekkxZFRyUmZ0TWhyaXUrcUN0d1RZL0dnQ2V4Q0VGWGNaWnZZ?=
 =?utf-8?B?TWhLUVZQL0swVitGaWRNVFRFMy91U2t0cGxrNW81VnFZY2tRSFFYUU92dnlG?=
 =?utf-8?B?K0lFU2hyM3FheXQrakVGSWFXZGlQdEVZR2piT3ZyckJiR3JVRHBpbmpNT08x?=
 =?utf-8?B?SmVTMmp3SHRDTmJabzZxWGltYmlRWVFRbVNaNDJqZ3ZmQ1N6WThrbURQVVZq?=
 =?utf-8?B?NHN0Uit1T0Rrdkc0bTJyWEdWcW9wZ3BTOCtBT3lFaVl3cGF1Q1NyK3BsclNH?=
 =?utf-8?B?M1YvNGxRUXEzK1JBaGt6aE1wOXMxNUpBZzQ0ajJHTEZGM1R2bDFVa2dmeHgv?=
 =?utf-8?B?VWM5ejV0czY4ZHkyclFyUUNmT2R2THZIV2Iya2dCZjIwVWppTHFiQlZzbXNW?=
 =?utf-8?B?K0RkeWM5NHgyMlZHbUNvejhsbFJ4MFZaNjVoSXBVUnJyZUxhQ2VvT1FqNFN6?=
 =?utf-8?B?QjNzeGRWSGJLZno3S0VMZU00Y2lmaE9JT0cyNXEzbFhjTWY3czJObHZ5elBo?=
 =?utf-8?B?SHFFQm1IcFFWU1hHbU5aYmRjRkI5cGIzZVBGZjFZWm5VZ0k2bElnOHB5KzNB?=
 =?utf-8?B?c1VzTFIxbDNHanJkYXhtU0ZFUG5rLzJlajJTNnF6ZEZXNDNrZVE3OFora1Bz?=
 =?utf-8?B?MDdBVWU1d3RyRWx6MWt2ZDV4Z2oyS0RzTGpOU1RSazh2YWxBME9GU0VTbTZT?=
 =?utf-8?B?VFAxY1EvOFUvVnVvRHF2TkloTWxEOTNvSEk0MzNTSit6VVdYbUErSldLWVdu?=
 =?utf-8?Q?EgJIGljwhe3FBtBeJmZEX17Viz9zzY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3ZjVEo5WVFkb3pIbmo4bjFMVmM5L1VHUHhtdGRVQjNCZnNZUllCMW13ajFO?=
 =?utf-8?B?MUd5ZzR3LzNKUzIxRHFMeGNhSkZYem4rTkV0Q0dBVFVHY0hJbzh0dS9hdU1K?=
 =?utf-8?B?Q0lZeE80VHNmajFwSUxuNktQZDZiUGIzZzJvTXpSaEdKRkJ0WUxjZlpCMXZp?=
 =?utf-8?B?OW1iSXBkTnlhaEMwaTJWK2hCelo0SUU1R1RNT0JaTnQ5eG5RYVcvU3NDS2pZ?=
 =?utf-8?B?YWhLMUpmVDNHbG1PaTF6bFo4QkE4aktFcFJBN0lHbW9WWnpKaUpKSTdFWFhm?=
 =?utf-8?B?aEVpalRxbi9hWHQwMFRmQ3J3ZXJ2UmFzMmZZT2JGRWJJSHViM2RtREZUdkJo?=
 =?utf-8?B?TmF4ZXVWNTl0WldmbDIzcjRyZGlWZktLYXVsOHMxa0VUOXNMc3c4TTYxNkUz?=
 =?utf-8?B?V2hZekV5bnRDb09HcEwzVkFDUEtQc0x2OXd5RkgyTWYzUTFnLzhPRmV3Z1B1?=
 =?utf-8?B?OE8rZ09HMEpCRC9kOGttcDAyTnBqVTBpUWdITGRiSm8reUdEVUFLQklLMVFx?=
 =?utf-8?B?QnlCU1p5eVM0bVMvcVhGdFJKYUdZM3ZPd2VLQVF5cjdCb3hjZ2dleTgxaGFi?=
 =?utf-8?B?aEJJbjVaeThSYzUwMThrOTJwZXE1Q1QzM29Bai96amxHaVFKYnFJcTY2UlVG?=
 =?utf-8?B?UDhBeEhCVHM5ZDhtWU5WSGdSRzFibStXN04raExrZXBVWDNIdzVUclIySUZm?=
 =?utf-8?B?RTM1b2pQL2l1L3ptSGd4ZERnQUtZQWxFamRmN0psRHA0Y1RrMzc0M3liMXdZ?=
 =?utf-8?B?S1cwcFBsNDVzL3RJVTBaN0ZBRDVlRmczS3IvcFJQck0xcEg5dkw5YitjcEIz?=
 =?utf-8?B?R0dXM2JrTEZhVmE1VmFUN3FtbXl0SXF6YStlbzlSYkJ2WXpSZG5RNmtqYmRy?=
 =?utf-8?B?UHUrdllRdW9tQUhuc0UzQ1UyTjlMdkxLUlFWaG5MckJjWjhMMVFiU3pmeGZM?=
 =?utf-8?B?TTQvT1ZYUWxwWHg2MlpRR0NhQnl3ZEV3Y1N0T0hHbHJYaEdUU0ZEQnVSZ1FX?=
 =?utf-8?B?dGFiaGJ0Q0VQUkp5aUVrRmhVd2NVOThkT25INExlSzJuOWxEbm9GSFFINWlx?=
 =?utf-8?B?Y3BCbkJTVkhzaTh2dU4zU1pkK0pLRkVzYmJXa1pzYXdVeWxOcXpva0RsMkMx?=
 =?utf-8?B?ZUZUVm1yYVBaTEEvbk8rdUh4YXhMc0xNYTF2dFpPb05mbmlNdDJGUlN4Mm9W?=
 =?utf-8?B?LzA2WGNtMXFsOVlMd1BsVk5OeXV6MEJLRmVUQStxWjAyMVorR083YXpUOWll?=
 =?utf-8?B?MWlXNytna2d1eERUaVd6QnV6bmc5cXBHK0poM0lGRk5nam9FM1BxYmlxUjdD?=
 =?utf-8?B?ZFNDOEFrNVR6dkF5dUhmb0x4ZVFSS1BORGIyK1RhQjhZakJGbXA4YlphZERt?=
 =?utf-8?B?a2hZQ2Y4SXZoNTMydG1Ea2VZV21CT2NqZkhzOFpiOFMvZ2t5OEIrWnlRNHdC?=
 =?utf-8?B?VEcwWWxzelBrUnR0RGZ6NU9JWXRYRHNvY1ZSeGtVaS9mUXhXdDVuVkl2ZTlr?=
 =?utf-8?B?QkEwOXdDTXN3QW40RWQwdU9YcGFacFAvVjduUUFicGtlcXRxM3NTS0drSk40?=
 =?utf-8?B?SUdmUmVURXlNTldtL0kza2xyTWs2enI1dUpNUWZURlNjNVdaeGFXSWxUK1Nn?=
 =?utf-8?B?cGpiT1MwK05ZSThmNVpEa2hsYUtmVjg2VUpocmx6cUtLT0dacVYvWm93OGYw?=
 =?utf-8?B?blV2bGZYVDZGaGNaMWRtWU85YnJnUnk3SHdjOG1FY3gyM0RIakhEUmdxNW1s?=
 =?utf-8?B?M1FPbGdldno4UGVuQSsySituSm04Q3pkNTdYWlZIbzhucDR1cTAvU0NyQmZl?=
 =?utf-8?B?NTMyYmtlNEtEaGN1a2kyVkNFVEF4MlJpNnRyczB1L2ZqcldDWHJ3TGd5NnpB?=
 =?utf-8?B?SXpOdGlXSjEwNERnNFB2b1JxUUVBK2Zua2RFYlk4YmRPUzc1YUNUMjJFUFgw?=
 =?utf-8?B?WGJ0YnpTM0NWa05nTzRzdkxvY3BKODFhU1dSaWtrT0N0bU9aRmFMQUFiY1li?=
 =?utf-8?B?bTRGeHZ5eVJtR2xjUUpMcUFVYThGanRLelM1K2cvNkpNVGw1cm1RREFFL0Ja?=
 =?utf-8?B?WWNzOXljNUxkRnpxOHZjVzFJUG9NbjhudDdVV1NXTGZjT2NUM0RRRlFSNkNN?=
 =?utf-8?B?WEcrRUplQng0N3FYOWFoNjhEOHJhb3ZDbVlXbkh2bzBwK2g0am9GYTJ4TmNo?=
 =?utf-8?B?T0E9PQ==?=
Content-ID: <6926D64E3C3E164B99A9CD7B25F85B23@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbf5399-73fe-461a-22b6-08ddcb9d921d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 17:06:17.7603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fi9RQr+VLyVvDM9bOGN1Gf9fKwNGBo0uhIIGEVQgzOfQ5nfKGoEnMNr/5ic2MycBLGXck5ea+Ng6STeGO2YsdkdclOyls3XjVheFBsW7y+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_180711_128731_00037051 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, 2025-07-24 at 16:37 -0700, Deepak Gupta wrote:
> If shadow stack have memory protections from underlying cpu, use those
> protections. arches can define PAGE_KERNEL_SHADOWSTACK to vmalloc such shadow
> stack pages. Hw assisted shadow stack pages grow downwards like regular
> stack. Clang based software shadow call stack grows low to high address.
> Thus this patch addresses some of those needs due to opposite direction
> of shadow stack. Furthermore, hw shadow stack can't be memset because memset
> uses normal stores. Lastly to store magic word at base of shadow stack, arch
> specific shadow stack store has to be performed.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/linux/scs.h | 26 +++++++++++++++++++++++++-
>  kernel/scs.c        | 38 +++++++++++++++++++++++++++++++++++---
>  2 files changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/scs.h b/include/linux/scs.h
> index 4ab5bdc898cf..6ceee07c2d1a 100644
> --- a/include/linux/scs.h
> +++ b/include/linux/scs.h
> @@ -12,6 +12,7 @@
>  #include <linux/poison.h>
>  #include <linux/sched.h>
>  #include <linux/sizes.h>
> +#include <asm/scs.h>
>  
>  #ifdef CONFIG_SHADOW_CALL_STACK
>  
> @@ -37,22 +38,45 @@ static inline void scs_task_reset(struct task_struct *tsk)
>  	 * Reset the shadow stack to the base address in case the task
>  	 * is reused.
>  	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	task_scs_sp(tsk) = task_scs(tsk) + SCS_SIZE;
> +#else
>  	task_scs_sp(tsk) = task_scs(tsk);
> +#endif
>  }
>  
>  static inline unsigned long *__scs_magic(void *s)
>  {
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	return (unsigned long *)(s);
> +#else
>  	return (unsigned long *)(s + SCS_SIZE) - 1;
> +#endif
>  }
>  
>  static inline bool task_scs_end_corrupted(struct task_struct *tsk)
>  {
>  	unsigned long *magic = __scs_magic(task_scs(tsk));
> -	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
> +	unsigned long sz;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	sz = (task_scs(tsk) + SCS_SIZE) - task_scs_sp(tsk);
> +#else
> +	sz = task_scs_sp(tsk) - task_scs(tsk);
> +#endif
>  
>  	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
>  }
>  
> +static inline void __scs_store_magic(unsigned long *s, unsigned long magic_val)
> +{
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	arch_scs_store(s, magic_val);
> +#else
> +	*__scs_magic(s) = magic_val;
> +#endif
> +}
> +
>  DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
>  
>  static inline bool scs_is_dynamic(void)
> diff --git a/kernel/scs.c b/kernel/scs.c
> index d7809affe740..5910c0a8eabd 100644
> --- a/kernel/scs.c
> +++ b/kernel/scs.c
> @@ -11,6 +11,7 @@
>  #include <linux/scs.h>
>  #include <linux/vmalloc.h>
>  #include <linux/vmstat.h>
> +#include <asm-generic/set_memory.h>
>  
>  #ifdef CONFIG_DYNAMIC_SCS
>  DEFINE_STATIC_KEY_FALSE(dynamic_scs_enabled);
> @@ -32,19 +33,31 @@ static void *__scs_alloc(int node)
>  {
>  	int i;
>  	void *s;
> +	pgprot_t prot = PAGE_KERNEL;
> +
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	prot = PAGE_KERNEL_SHADOWSTACK;
> +#endif
>  
>  	for (i = 0; i < NR_CACHED_SCS; i++) {
>  		s = this_cpu_xchg(scs_cache[i], NULL);
>  		if (s) {
>  			s = kasan_unpoison_vmalloc(s, SCS_SIZE,
>  						   KASAN_VMALLOC_PROT_NORMAL);
> +/*
> + * If software shadow stack, its safe to memset. Else memset is not
> + * possible on hw protected shadow stack. memset constitutes stores and
> + * stores to shadow stack memory are disallowed and will fault.
> + */
> +#ifndef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
>  			memset(s, 0, SCS_SIZE);
> +#endif
>  			goto out;
>  		}
>  	}
>  
>  	s = __vmalloc_node_range(SCS_SIZE, 1, VMALLOC_START, VMALLOC_END,
> -				    GFP_SCS, PAGE_KERNEL, 0, node,
> +				    GFP_SCS, prot, 0, node,
>  				    __builtin_return_address(0));

This doesn't update the direct map alias I think. Do you want to protect it?

>  
>  out:
> @@ -59,7 +72,7 @@ void *scs_alloc(int node)
>  	if (!s)
>  		return NULL;
>  
> -	*__scs_magic(s) = SCS_END_MAGIC;
> +	__scs_store_magic(__scs_magic(s), SCS_END_MAGIC);
>  
>  	/*
>  	 * Poison the allocation to catch unintentional accesses to
> @@ -87,6 +100,16 @@ void scs_free(void *s)
>  			return;
>  
>  	kasan_unpoison_vmalloc(s, SCS_SIZE, KASAN_VMALLOC_PROT_NORMAL);
> +	/*
> +	 * Hardware protected shadow stack is not writeable by regular stores
> +	 * Thus adding this back to free list will raise faults by vmalloc
> +	 * It needs to be writeable again. It's good sanity as well because
> +	 * then it can't be inadvertently accesses and if done, it will fault.
> +	 */
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	set_memory_rw((unsigned long)s, (SCS_SIZE/PAGE_SIZE));

Above you don't update the direct map permissions. So I don't think you need
this. vmalloc should flush the permissioned mapping before re-using it with the
lazy cleanup scheme.

> +#endif
> +

I was thinking someday when we get to this for CET we would protect the direct
map, and so would need some pool of shadow stacks because flushing the TLB for
every thread alloc/free would likely be too impactful.


>  	vfree_atomic(s);
>  }
>  
> @@ -96,6 +119,9 @@ static int scs_cleanup(unsigned int cpu)
>  	void **cache = per_cpu_ptr(scs_cache, cpu);
>  
>  	for (i = 0; i < NR_CACHED_SCS; i++) {

Oh! There is a cache, but the size is only 2.

> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +		set_memory_rw((unsigned long)cache[i], (SCS_SIZE/PAGE_SIZE));
> +#endif
>  		vfree(cache[i]);
>  		cache[i] = NULL;
>  	}
> @@ -122,7 +148,13 @@ int scs_prepare(struct task_struct *tsk, int node)
>  	if (!s)
>  		return -ENOMEM;
>  
> -	task_scs(tsk) = task_scs_sp(tsk) = s;
> +	task_scs(tsk) = s;
> +#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
> +	task_scs_sp(tsk) = s + SCS_SIZE;
> +#else
> +	task_scs_sp(tsk) = s;
> +#endif
> +
>  	return 0;
>  }
>  
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
