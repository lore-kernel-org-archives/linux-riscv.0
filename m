Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1379DC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJmwvuF2TDh73KNIUFIT154Jmow8/v6cWLiZn1mN3LY=; b=dkR/fpm7SXlp80
	7cBSs0vF6PKhbPu+Z/1cqNE2pYjZoCu1p6UY7v9i+NizYj3Uh6Gio51fZdIkXIlS76If9UO06u/Ie
	O0zoDktSCioQnqyfuuxTeHktLYSTCHIuQ/wyeeqTDUkil8fBAXl+XhmFAKvaylxTveCm3ssoNUwLN
	7J3Y2n6Gvnvw79MOLWRnGydrdQlUZV8BjA2wK8ku+YQ5PqaWJ1Dn0K6301uPgQDkSXY6WzrYSFpGu
	AUWZn9qBcLRYMfFWC3RksJsbfKHUnLOxDs2FspkvgUyoqRM848uLeUH3JQ3Fm8A1bMYNjHGeyeQEZ
	6r2enCodhiljn2PXACZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCGti-00000003rU5-2PsF;
	Wed, 29 May 2024 10:51:10 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCGtb-00000003rQm-15wQ;
	Wed, 29 May 2024 10:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716979864; x=1748515864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=WAuqbneYpqfCPkKmo7X4KbRUYPtmq2ITGPGsTMLTmKg=;
  b=bCUor/Ge5q/v+Qmwg1fE3vKhCabc3SMEHBzeR34ZbvDI3hlOJe8jhfrz
   YNrIX5w2kZ3vf8BOqxeFP9fqWWVP4WrKOyQvKo6GTrjSEmbAwzuXlvL5T
   kpQmyl5kqp3PRYWb4r6j5Vp6ROQU8IpYtgQ4AturMuLo7qZbffRYTQXtj
   jnue5XWFmAuGdtQUtFSBzc6IX71PuMS5AFdDLwxFGCnJ5H/UKhTufpHlF
   ZYgcWlfxPcFgywMlkCJK0AL5XRIu9hNttxVggxj9kEqTbbDQ2JoaJPI2Y
   mBZlaaF5bj2dQhIgDsJR4rXM2IDuuCpxhhe3W2qhr0zihYWzFNf3WOGtn
   w==;
X-CSE-ConnectionGUID: Tu9wGTs+Sg6RIR3r3Q+wBA==
X-CSE-MsgGUID: 4tJgdluNR2u995HO7boZzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13495707"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13495707"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 03:51:01 -0700
X-CSE-ConnectionGUID: dRKfLXMxTk+IHSn3ZluApQ==
X-CSE-MsgGUID: BfPfubCsRs+qY8j3u5Q+Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="66270587"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 May 2024 03:51:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 03:51:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 03:50:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 03:50:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 03:50:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6W+GFxDRJANMMYx2rTi1STVdkr7P1gmcand7Ho1hwcmDt6cU8ksgHBxRcBqhJ0yuwRVQ67MdftlCNyqwDwmvqZj/r08x7XM97mxyDPBGQBAbFqY3V4+OsVEE5r1d3U12g3b37CFpPj0sWQdcJfhvvpROSQrxkNgeuTeRim9JGg+fC2cTsEhKvrOG3zYeTW+YB6t8XQe28a9DLm5U8GNn9j3e+XeXRV5+o1K9DQRLLCYAneZttYXgOmEJSpOGzPT9Hqz91A9wDaPIW/qsHxuOTOarl8XnXmN7qtbzlBz4M+pLe+hqlmI7nE6Fd+3J42HCojNynr99sN54a+QQlD4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAuqbneYpqfCPkKmo7X4KbRUYPtmq2ITGPGsTMLTmKg=;
 b=Npk4eAyaFFrPJoyE8FMp1hfIaZF7UzLjCzyCMFzQAKdVfk280ndrkTVp0rKgVcLZiSGLfOT2UkiCHE6pIp5vtXJYM0JmU83Xw6wbOppZRn9Lmh1UcMGEL9GL9zupwMPBNDAaXBIIR89P/WsNSv3VsYBxQA/7ygE7c6JtuD3NvPdGj/8G+XqQNitYMBDgP9FQFv2KrE+cMyFb3Zl4H+Vcu4CeNcjAvHo/gQvn6r3Z7btfNsmcXx+6VU8ZxW9PYjRP8Tts1JYGnTZmU9qLQnlmz8JsRDU9fM8pvU2G7dIMGTsTMqo/HWnzGJX3d2hhGK8GOz5Fpg0akTQRgtXJBp2d2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 10:50:57 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::fdb:309:3df9:a06b%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 10:50:57 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "seanjc@google.com" <seanjc@google.com>
CC: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "maz@kernel.org" <maz@kernel.org>,
	"frankja@linux.ibm.com" <frankja@linux.ibm.com>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "loongarch@lists.linux.dev"
	<loongarch@lists.linux.dev>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "anup@brainfault.org" <anup@brainfault.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Thread-Topic: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
Thread-Index: AQHaq+kvNSE54PKrvEmweOF4RZvjhrGlbnoAgAegs4CAAQUoAA==
Date: Wed, 29 May 2024 10:50:57 +0000
Message-ID: <2a221116a03f57dca8274b6bc2da7541b21d86bb.camel@intel.com>
References: <20240522014013.1672962-1-seanjc@google.com>
	 <20240522014013.1672962-4-seanjc@google.com>
	 <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
	 <ZlYte16cvQpPGHkx@google.com>
In-Reply-To: <ZlYte16cvQpPGHkx@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 (3.50.3-1.fc39) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|SA2PR11MB4956:EE_
x-ms-office365-filtering-correlation-id: 7cf63ac3-31db-4a7b-8be1-08dc7fcd3867
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?YzVQYkFYeGJIT1NlcG5Zd1JkNDduaGxKWGQramQ3d29ZTXhrZmtscFNxNHZr?=
 =?utf-8?B?TlJOVmU1Q0V4U3hWUjQ2MGNUaVZIZmdMK2VnemMxNzV0aEpIemY2QjY4UnZZ?=
 =?utf-8?B?Ym5zQzhMaXgxaWJLKzBTT3BxbVlZTVR1ZEtXQ1ErMTBuUm9raEMrNWZ0RE5k?=
 =?utf-8?B?TE4ybjFwZ0JweEtrb1Zqd1FQaEkyanNjZ2kyVFFURGozUGo2WU5TZ2dGL21J?=
 =?utf-8?B?SFU0NmcrU083U3BYL0lvdlorVXFHNTY1c3lGNUlIK1RNWm1yZllKTTRObG9T?=
 =?utf-8?B?MmVVZmliQ1RsOUs3ZDVQelVXNFU1aWE3VStZMFd2UnRRSTFqaGxSS2lSUWJP?=
 =?utf-8?B?U1I3RHdvcmw4TmQ4T3FITUJEc3RNVXVZWFdqUlptUnJ2YVhVUzJ1bjlMVVY5?=
 =?utf-8?B?Uy9FSnFCMlI4U3NoaU5CVHpIaDJqSWRQQ1Y1emVNNzcwZmFaNkxIYmo1WENm?=
 =?utf-8?B?SEwwazd2UHN0Mno1QVVEMFB1TU1aMnRERlZjWVlqeW9mWXZyU243KzNSZ0FH?=
 =?utf-8?B?ZHFxZlJlN0FBSnZSK0tyYTF1bzgwdVo0dmNiaWxEYTJWeTFFVVlDckdMYVk3?=
 =?utf-8?B?TTVTUTJRK1ZlbU82emdxVFhBV3JlbGxHMzVrVWxWMFl0VjEyUng3QkRoemho?=
 =?utf-8?B?dlgwU0ljNzFOUGRuTWJhVmpjTHRHMGNsOW8zV3laSWlsaHY3WGV3anVlc0ZY?=
 =?utf-8?B?N01VUHB1RksrNlZTUGpYbDJCSDc2NHlqZC9Ia1V6T1NoaTlsdzNVM1F2V2hL?=
 =?utf-8?B?QmtqZnpHbWdkN1hxMW9CUFMydUp2YXJwNUN2dU9PTi9uNEFsNDVVWGJQME1u?=
 =?utf-8?B?emN6cEltdjBkeXRhWWhJVmtWYWxlWHkwSkhvMFI2eTh0SkRORWNHK2xSQzQv?=
 =?utf-8?B?bjFIZ24vSmwyMnBYYTVTOEUwZUJDdTRhZEhyOXpucXV5RW1ieFNpckVHbnNr?=
 =?utf-8?B?SVFmUENiaHBod2RFT29xVXBiYks0NFo3MThtZ0UyanpZT3MvdHRnd1BnOHRn?=
 =?utf-8?B?c1Jic2hSN0JHenp4MmE1UnpIYlArcG5BVHhBYVl0UDM1Y0RmWHIrcXlzZlRq?=
 =?utf-8?B?aWw3Skt3cVFySVI5MnJBVEZlcTAraUo1eWFSNUFzeHQxREF1alBuUUV5V2pi?=
 =?utf-8?B?enJ2bFp1ZGVQeG9jYWs2S1RGRTg2cnJWZzVTT2RMRm90YlJJcDNYUFh3QzdM?=
 =?utf-8?B?MUxPZkhNYk1IM21SSzYvY0dHQVFscW9VZHFMN0ViTStaT0hKZmNPQXNCdTNy?=
 =?utf-8?B?d0k0cFlzMVBhOVVJNlFMbGc1VlRTakk5Y1VhNllDSTlPZFNRemdZQUIvN0Zx?=
 =?utf-8?B?aitGcy9tMVhwN0pwMDNGVXZ2NSt0ZGx3RjZSb1ZFNitYRHFCY3VZWTNVSEd5?=
 =?utf-8?B?WWZ3ZXczc25EMEV6eGRXYTFBcnE2aVdmV0RmME03b0ZPQkZTMVBOOEYxS2VQ?=
 =?utf-8?B?SXVSUU9kNnd5WFZMYjZHNzUzblF6RUlZbktEZWNsUU5hZU5TUGtoaTYyL1NZ?=
 =?utf-8?B?eGY3d2k1QXJDZTBoNHBIWHh1ZUV4TlRpekxuaU9CVjljNzZUUGdMY0dCMXl6?=
 =?utf-8?B?RUwxUm1zMzQ2YU85Z3NEMFl5a3QvN3IwS2I2aGpLSGNnSmxSc2hYSlZCdk5L?=
 =?utf-8?B?ME8vTFhic1hDbnVSaEpUQUhCL3NsNzBRTENJaWp4L2I5U1J1eThBR3NBOWxJ?=
 =?utf-8?B?WmQxVHRNRUxXN0RPSUF6TVVtVmx0RnZPcWtpWENqNmpOSElkdFBraUxIa0I3?=
 =?utf-8?B?UlYxc1luT0k2d094Z25tTkx0alBOaElkQlJkcjVyWEtXbmU4L2wvNzZwbmkw?=
 =?utf-8?B?bGpoNk1sbTduWmlYMHV0QT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VmtuOFpDNE5La2pjUmtVSGdMbEQ3SHFQM053WUxvSDAwTWNMa3NTQ2E1bHYr?=
 =?utf-8?B?OVJZZXJKRVZwemtPazBXMTVrS1hSM2NjTGVHR0xoMTRNLy9NdnNmMklhN3d4?=
 =?utf-8?B?Wi9HeDQwNXlreEZiZFhrbDJNa2ZyclVGWWxOUm01dCsxeUIvei9GdnFZUlR3?=
 =?utf-8?B?V0l1Z3hqMnk5M3h0SVBXZjNicndCV2hBVmswZVR5MU1JL0lodU5nYmd1cDRj?=
 =?utf-8?B?Mm1jRU5sendVWE9teEpsRGlIOFpFUmtmV1dCaXQrZHBkellzeGtlUVNpTGpW?=
 =?utf-8?B?b21WNFc2ZUowcXJWbktNd2FDRGlpRUdSaHRrWS9LTzIyK3hEZm9MUWtLcFdy?=
 =?utf-8?B?czRTbHZKQnRJMm1HZ2hZcVV1M3RoWVVoSlVwcWdzeG5jSXN6cHhoYlJxM21D?=
 =?utf-8?B?N0tmbmEzbW5wS2RnTUoxVGsvWnFMbEFKSnd6TmxnQ3Z1Qldad1RMbnliZ01m?=
 =?utf-8?B?YXZ1Nm1DK1pNbGhveFZJaUE5SWNZNTY2NHUxU2xydkpRYUhGQmdMWmtLVys2?=
 =?utf-8?B?SkhneHI1SVdvMjR5T09USjlsT0wzZi9yYXBtYUxjMGJKSy9hc2M5RDZhYlpO?=
 =?utf-8?B?bThjMS9ydWRTZENOd3FaYnlVR3BGclg4bnNZUmk1dDZremZXVUtJV0tTcmty?=
 =?utf-8?B?cTdzZlM5anZUYytQc2J5WS9BSXo0V2pJbXExYXVlSHVJUnRZSml2djNmcklq?=
 =?utf-8?B?bGo5MFhBaFJLS2VDRGNnQVdMejRjbEN2Y2ZrVzljbFdybFVCekV3ZTRKY0Jm?=
 =?utf-8?B?bHEzemNXenVjYTRYU2RBTnBKWEQ3WXpnTk0vRks3NkxoWmowZFcreFlmd2Fa?=
 =?utf-8?B?T0JRVUVCUTZ3cFFwQ2crRlEyNTR5dmxWM1NoakJMWXFrYVV6SFNqM2R4SGh6?=
 =?utf-8?B?U3NKNWt1YTFoakdONEJWZmJuakM0NVJJdFg2MU1mUk5NOVJGVTBvTlY0WVhG?=
 =?utf-8?B?ajJlUnhxdVZ0RWtPSGs3ZjF5S2NoQkMvcXI2UEhjZ2Z4dmFxdEZSWGRyOXIv?=
 =?utf-8?B?a2JSbnRYWFVCMmM1OWVMK2tPMUlLWXZCVGZFWlRXRmFEaEVGd1NsNzIvN3Fv?=
 =?utf-8?B?SFA4MFFBUFBCd3NDRnNOYzdMMitPUjV3cytRTys3Z2ZFbHpTSUdnSUE5RWpj?=
 =?utf-8?B?Tm9qeWk3UEtqSithc0dmK1FSMVVuZjV6RTVJdm9hamJxTWkxRmVOZGE4eXFQ?=
 =?utf-8?B?VExrRk5OSDI2VkNSeEQwTXJIZGg4K2lrTVBNWnpxaExEbWVqdmE5dmpFMmVx?=
 =?utf-8?B?eU1kc2FmdmdlZG41N2ZoUHVGdXU1ZitxV3dueHpzaXBDZklpVHhjbm1YSTdh?=
 =?utf-8?B?bkp3Zm54eCtvSm45dDJaQURIUTAyVnUzMXlsdnkzQWRyaEhJdTZPc3ZzYnN1?=
 =?utf-8?B?YjhUWmR2SU05SW14bWhFdmNINk1ncjVqd0ZudGllTDFiTDAvTFZRQVJYTWoz?=
 =?utf-8?B?MnM2bmZzZWpSWFo1SHpodjl1UzRjeEp2TnUzcExFeC82d2hyQStVcWNzYkox?=
 =?utf-8?B?MVVjdTJEYlZTY1NWT0l1Wm5nMVBDRTBSNDdDWGdIRE9lZ2NNYTFrTjVlY2M2?=
 =?utf-8?B?Zzd5NC93ekNYZ1JsMzhGU1p6S0lDV0YyZjhLeTRCUE5mOXRTMDloNlJIRWhG?=
 =?utf-8?B?OGhkbGNKNnozK2ZwZ3JvNzErbjJYLy9UQktUckVFSjU5eG1hajJReUlXQlJZ?=
 =?utf-8?B?a3B5TCtUTmp6bS9Ta2xqSWd1T3RMeG5taHlocTJlK1RMb2pXbkpUOEp4S3pB?=
 =?utf-8?B?NFdEVzN3TkR4UFVtQnQwYzNVTjJTNm5aVnJOUHZnVndwRHRVQnV3OFc3Lys4?=
 =?utf-8?B?RXF0YU5PTndRSDdMQUJzQ3NRVkJ5RmhXN2hFaCtnU28vMFd3SGdvdE95eENF?=
 =?utf-8?B?NXZTYm8rNURoNDhUcFppeFl0OGtNOXE4Ky8wa0J1ZUJBUzZoUTVydThIVk5q?=
 =?utf-8?B?S0djYzIwVnE5L3dxVlNjWm1hazFCa1V5cTVlZmF0WEFSTGQvamlpdXlmbTdz?=
 =?utf-8?B?ayt4citabnNCazBPaVJ2d2c3RHpLQkdCR21zUjFLbXlTMG5Ya3luWHYvUU8r?=
 =?utf-8?B?ejNYLzdVb0tlbU03OXdxNXJjV08vU0s4OGJxY0ZnWFdYSnMyajY4U011Uzds?=
 =?utf-8?Q?y+4lHuu0Qj5aW37zD3bCBQgbZ?=
Content-ID: <631E382FB1C5D74A8A59B6B59663346A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf63ac3-31db-4a7b-8be1-08dc7fcd3867
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 10:50:57.0856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kfCcSuoEjZg6W7iD8m5BSjtjsH2bY6AcbtyLdQVKVYHTlDHfeMc9dDRyNtBrMrydKG7uutenDephrVvv+779Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_035103_418384_464AB959 
X-CRM114-Status: GOOD (  18.49  )
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

On Tue, 2024-05-28 at 12:16 -0700, Sean Christopherson wrote:
> On Fri, May 24, 2024, Kai Huang wrote:
> > > @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> > >   	struct vcpu_svm *svm = to_svm(vcpu);
> > >   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
> > > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > > +		shrink_ple_window(vcpu);
> > > +
> > 
> > [...]
> > 
> > > @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
> > >   {
> > >   	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > > +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> > > +		shrink_ple_window(vcpu);
> > > +
> > 
> > Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)
> 
> Heh, that duplicate code annoys me too.  The problem is the "old" window value
> comes from the VMCS/VMCB, so either we'd end up with multiple kvm_x86_ops, or
> we'd only be able to consolidate the scheduled_out + kvm_pause_in_guest() code,
> which isn't all that interesting.

Agreed only consolidating scheduled_out + kvm_pause_in_guest() isn't quite
interesting.

> 
> Aha!  Actually, VMX already open codes the functionality provided by VCPU_EXREG_*,
> e.g. has vmx->ple_window_dirty.  If we add VCPU_EXREG_PLE_WINDOW, then the info
> get be made available to common x86 code without having to add new hooks.  And
> that would also allow moving the guts of handle_pause()/pause_interception() to
> common code, i.e. will also allow deduplicating the "grow" side of things.

Sounds feasible.  I am not sure whether we should use
VCPU_EXREG_PLE_WINDOW, though.  We can just have "ple_window" +
"ple_window_dirty" concept in the vcpu:

	vcpu->ple_window;
	vcpu->ple_window_dirty;

I.e., kinda make current VMX's version of {grow|shrink}_ple_window() as
common code. 

I am not familiar with SVM, but it seems the relevant parts are:

	control->pause_filter_count;
	vmcb_mark_dirty(svm->vmcb, VMCB_INTERCEPTS);

And it seems they are directly related to programming the hardware, i.e.,
they got automatically loaded to hardware during VMRUN.

They need to be updated in the SVM specific code when @ple_window_dirty is
true in the relevant code path.

Anyway, even it is feasible and worth to do, we should do in a separate
patchset.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
