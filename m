Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE104C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5hz1/qWvoP3yR6Y1um7gLMLu5SfMGZxr4NIRXM2ZVJs=; b=mwcpEGMa/zcs4j
	i0cl1GwimeydUd0fY+Ag5436Vz/K7t+tTscgxN2C2M8UkpEPZQXUc4H0+xx2lLzTFCbq2lTjXY6Sa
	hRMNU5smnOxRKtdHuj4R+FsfoCL3WZFapxnSbiXRpl+n/8/yHEzHi7E5tLnCioRMiKX5mj692zxZ3
	x2L8ijcSN/ixGcIDt/s+CawqQRWw0UHb1DlnrjkV0/3Dlq2STKCwrghIebA6lpW5LXLGT4gWAfPss
	1w/j5WCbgeckbZK/WTf9bdphHC3m4nzjPlKz8LD6o1KkMPtXAUW/lA3u/cbdvU1DX559OfkNOczTI
	joRP/bfCQshQlQHyfCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15iZ-00GXat-U8; Fri, 02 Dec 2022 13:04:39 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p15iA-00GXPv-HL; Fri, 02 Dec 2022 13:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669986254; x=1701522254;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8pf42RGz4FHJE0Rl/WyfFubpCcQo7x8hA+IHUUMjWt0=;
  b=hk12H1+CX/h5gOTzFpaYz5S3itpQUddShhqD9TYbdfZASMZWNBd7qGLM
   rO88/uyg7wuyPgZI7AXi2USeZqIfsNtD6t0goiwlr+4uDzGy+kboTXyYD
   zI5AMKBfz51hTaCH+iwAriZBNEK8JV19eU3Oa+70j2mxVU2eWRtbrJq7y
   ass/QypVbBlWobKDugoRlHdHEuCGjNyxM0Q6XJOrzZgT+Bwsk3dn7MAlu
   y031fr2xaAYYu3JMU5l0rh/q7gmB1m5YgWwdtI1OS08Iv7e3SXIx9Whkh
   ftyrqN9VblTs5N9MnC3eGUcbCTqWb3t1lI6fKsXOVf+Wmhc/HnFMnMFiZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="380237588"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="380237588"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 05:03:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="787280404"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="787280404"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2022 05:03:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 05:03:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 05:03:40 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 05:03:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4Ct16zivN8WVxqbQ4gqE4iukadbu/gLMsUrj5w7CXfFHSs0JrljV+XPb8tJG/rmz9jEGFXZetdJywqJpTaX2TlfVA7XunTu3yJ1gi+Q2pgFlCwX/CLKFZo9k7nWILluZFl8U/U/zXRb7kVD0C8wug7K/5QQp+v1M34AGzsGR68jnZIs7M5H/8Zl5zpdm451ThjrIAM15u3GXeQvblmxFytujlsGYv7MkNJB4NXBJNKq0zEwQsV7FA3/zB09bn8zPExRidcQ5hvVUdSuYZwXJz0zhO8mfFjXVFs5DS+UOeBMYPb+rAmesDVJifsJWM+TP0/VXqnY7t4ymceLK9pEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pf42RGz4FHJE0Rl/WyfFubpCcQo7x8hA+IHUUMjWt0=;
 b=m9PlZbLfQMln6VgBBO8FiByUssmHY0xu2JyMd64f+H7Yacf9l0WurxT28YEbbfoUMb6L5oK4YD+ciOhANp3oFnILErZ6SSbxexvWBDMCdkHe0RIh9FMxr0h5gSuYu4WxHq6vzAiInuwUQ0VoPKItnyR2m/UehOwSFkzDI/ozSQ0+K7x1rrs7AP13jlY3masl7asAr6v0rs6BFKyO+SAR+A8kn+uWTIxJyy/tGP71FcZoA75beqIfWd+9f0D7G82I7yrTHfhNh/jls4ilwbk1SMDzc/RGvpZ5iXdoNNRv/icH7enKY3TO7kOD7qx2irTB6aKT2ItZ8JvswvDje1TEUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5978.namprd11.prod.outlook.com (2603:10b6:208:385::18)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 13:03:37 +0000
Received: from BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e]) by BL1PR11MB5978.namprd11.prod.outlook.com
 ([fe80::2fb7:be18:a20d:9b6e%9]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 13:03:37 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "maz@kernel.org"
	<maz@kernel.org>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"farman@linux.ibm.com" <farman@linux.ibm.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"Christopherson,, Sean" <seanjc@google.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"aleksandar.qemu.devel@gmail.com" <aleksandar.qemu.devel@gmail.com>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "paul@xen.org"
	<paul@xen.org>, "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "anup@brainfault.org"
	<anup@brainfault.org>
CC: "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"farosas@linux.ibm.com" <farosas@linux.ibm.com>, "david@redhat.com"
	<david@redhat.com>, "james.morse@arm.com" <james.morse@arm.com>, "Yao, Yuan"
	<yuan.yao@intel.com>, "alexandru.elisei@arm.com" <alexandru.elisei@arm.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "Yamahata, Isaku"
	<isaku.yamahata@intel.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "kvmarm@lists.cs.columbia.edu"
	<kvmarm@lists.cs.columbia.edu>, "philmd@linaro.org" <philmd@linaro.org>,
	"atishp@atishpatra.org" <atishp@atishpatra.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Gao,
 Chao" <chao.gao@intel.com>
Subject: Re: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
Thread-Topic: [PATCH v2 40/50] KVM: x86: Do compatibility checks when onlining
 CPU
Thread-Index: AQHZBREUXZvrwOe3yEGmbvrorekRL65aktaA
Date: Fri, 2 Dec 2022 13:03:37 +0000
Message-ID: <34ed147326f8c0b0c7df4eeacb62fc802d030de1.camel@intel.com>
References: <20221130230934.1014142-1-seanjc@google.com>
	 <20221130230934.1014142-41-seanjc@google.com>
In-Reply-To: <20221130230934.1014142-41-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5978:EE_|SA2PR11MB4841:EE_
x-ms-office365-filtering-correlation-id: ef3c0535-b6ba-4363-57d1-08dad465a030
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oKi8sZuTlJagf/pWndO/Vu3HAx3CSvMdSiWwyBQF4bjSrCWGG9tIRuEUndeG8c29DFxSyWuFDsx7fM/yPDhoID/++xEUkvf46Z1A9T7XcBQ2kw9WE1knt/LnVd/q8mxtqdqNDndos/A6OJ1jQE627GSQRP7wwwGmNkWLE9VpZeO+YSkMWL8y99PwkIp54in9RyZy80yu8YYPNNLxd6bpvXJo0MF/SzSU6s5aagNGUnlkTvjxqnGnXjI+ZXYhF8Qe+bTMFaQKWwmmfhVS21GhOTcgc8gcNRHb8W+VcOjiXhuLqM21eTDEaW/wkI2PNwykpdv8dIu8sRjrcd20rYYp1Lmz9aiP/f+FzH53/wLj4euf958KYTTjVUjnECPcEfoYGkEf/gogThwI+NTiSK6jLHR2Q+sQ08+eyR2+WhLNEvXAAsyFLoy9kOncoRCAZBaTsF4Rq3mqUlDnvI4evIbk8rzD2RCzCUl7bUDO2yPhF87GsOgT68stKsiliUWg0W0c+OcTZe3Q9gYyxp+G5XJRxk+kz+wKfZYWaIMijY/ZBu4qFD9s+tpr9/FlLfb8TNxae1YfvNcP7yAYfTlk+uqiAcRJ743BuDEmT1HIhXkEyZe1BIYvkT6zY3iuPucFErEmZawpiizdImpxJkMHjo1cvpKjeouXJv+RRd4oN0Nd7ynhPWJTJPywtT28Z8KqF6iCVDFOtY1G0Z/97QzPwOkC2yjeS7Q1MtAn97sChNe1aU4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5978.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36756003)(4001150100001)(2906002)(82960400001)(38100700002)(122000001)(41300700001)(8936002)(5660300002)(7406005)(7416002)(83380400001)(38070700005)(86362001)(921005)(71200400001)(110136005)(54906003)(478600001)(6506007)(107886003)(76116006)(91956017)(316002)(66556008)(4326008)(66446008)(8676002)(66476007)(64756008)(186003)(6512007)(66946007)(26005)(6486002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zmw2aStEL2ZLRVVDc2p1S3M1ek9rWWE3L2E3MWVWTzJCVEcyU1poUVVPSTFP?=
 =?utf-8?B?Mzgyd0UzQnNlblQ4MzRSaWdDbTRnc2Q5VENBblVlUVhQeFVEQXNaWVEyZHQ2?=
 =?utf-8?B?N1RjSkVIUVM2Q0x0REdRUk5tUVdPN09oYlZ1SkFmdFZnQVo3enRtYUFHZVFJ?=
 =?utf-8?B?dCswd0d2SFNidndTUEpZZW5DK1M5QTFJQkY2V01GSmJKK1hPeTkrVm50WXlO?=
 =?utf-8?B?Z3Y3b1lEb0Q3SnFUbXhGRWlDOWZSbjFpR29tSmNCS3ZUSzVDaUdKWUdtT1pK?=
 =?utf-8?B?ejdML2YyL3VDY3R5Q0dLRFgwekxMYjduQXBLN0FQS1BCYVZDSVRiZk5ab2dF?=
 =?utf-8?B?QVBYazhNT1MxMFZoN0MxYks1RzhUV2Q0V3h1cG0wbTY5dlVieHVEWTFSZ0Nm?=
 =?utf-8?B?NjJ1b0RYQ21ZdjZHWUFwOGVFUk5yRXN2aFNBenRSeUIzVUdmZUZwV1Q0QnFt?=
 =?utf-8?B?Mm5HWFdzeWNkVS8xWnV5M3JEQmNwNkFFT2lhZEV3eXRla0c3MDIxRHlVamI4?=
 =?utf-8?B?VFNqYThCMkIwYVlHY2k5bnN5MVdQM0lLL1NHZUI5NzltMm5MZ2RLelhtL09t?=
 =?utf-8?B?ZVdPRTVHREdQQUVncmd6WGdTSW4vQ3JLMFVHKzFJVzFvN3dyM1dXVW9pdXFa?=
 =?utf-8?B?MUdCWm5YSGtZdmNMQ2JqZ3hNOG5CMnVVczhKWW1YY3lwcjZZZnZpN2p5S2Jp?=
 =?utf-8?B?MUF1Y3ZjQXh4QzJ1eGVCdy9Rbk0wa0kyNVBGZlA1dk1TMmFSKy9ubk93ZlZF?=
 =?utf-8?B?VnVQc2hlOEZ3WjlQOEtVWWY5Sm4yaG96YkpmV0lUMnNnVnhCK0haQWJhcjB2?=
 =?utf-8?B?cTl4MkovakNKV21KcFpNenc3Z3RrTUlBMXhCRGpHTlZ0TVRZbEMzVE1mMkhE?=
 =?utf-8?B?NmlLU21GaUx1RlpqK01pYVF2M2ozSk9hUWNSN1IvdGphdGhjdm9xZXNXd01i?=
 =?utf-8?B?R2p1eGdmbktGY2xNNFRoc2FTVXpsa3dmSGRRMk1nSzFMeUhNQjZkYkxWd1Rp?=
 =?utf-8?B?bGxJeklIMmVlQm5NZCt0bHhVUzFYZklLeVZ1ZVRyUUdFanJTNFNhVjlidVQ1?=
 =?utf-8?B?QVRXeXN5SHB5RjVsaEVvaythU3YrL0EyNHh5a3RjOGoxSFNpbkVVSnMvZ2l0?=
 =?utf-8?B?OE1qNzFzT0hOZExpU2t3Z3JpbDN2QnkyWnpZWFA5ZDFTQzhNN1NzWVNlRkZR?=
 =?utf-8?B?OHQ1Kzlqb24weUcyN2ZoRC95K0lwc29DYUZhMlQ5bXpGTVFFVmVxQWRvcGRi?=
 =?utf-8?B?a3dsRmxRdy9ueVZBbTdoZE91SE5GSmpoR1pMVzgrRmhQamVhUEo3Tm14N0xv?=
 =?utf-8?B?WU9xYlJKVzFZbWJOMWFoMG1GYWZubVN5OEtPRXA4eXFrMjh0YTRvZFJWamJR?=
 =?utf-8?B?cE4xaWZxOXM2cm1UeXZjTUFueDJOQTBLYXN3LzVWeWdtT05Dc05kbWJhTEND?=
 =?utf-8?B?bk9tVm5BZ2gwZ3FOR3BzRlhHYitUWndyeUFqVExTT2Rzem1vR3RnVzgwb0tz?=
 =?utf-8?B?VlB2NmVFVG44dlRvMkpuNjhZVjdNdDZOVUFyb0VDOGRsQ2J3TTlOQzJtS3Ix?=
 =?utf-8?B?aGpJa0JXNDVZcUVYT0JNa1dxZnQwMFhKRXRBUjFpaEsxejFhMnp2cGRYdmth?=
 =?utf-8?B?SStxK3ZQU1g0VFBYTndHVUtndlpCbDBxUU5Wb09FN1U2dE10MVpCTkpTZW0w?=
 =?utf-8?B?RkpkMFJjNmY4N2J3aVRNQnY3U3hCWURUZnFTVjFnMVllenpvd0NCdEx2VFc1?=
 =?utf-8?B?dDdQQVBpRTBkc0RVOWpwbWVjTjFDMWk3WWZEdjRqbHlLMWx3UFloWEJqQVRk?=
 =?utf-8?B?YXRmMEhSWHJVeEkrcUhXUXhLaWhyL01Nb1ZCVFlXWXdJSE03WFRhRFVwclVR?=
 =?utf-8?B?S1JnK2ZYZ0p1MVUwYTZKaXN0emlTOGVSRmI3NXRTdnlYaktJUGxvRTdrbTV4?=
 =?utf-8?B?NW8zTzEzL0k1S0Zzc05VdU9tdUtqd3pGVlVDbWtycUd4NTFrcGF2dkFqTXZq?=
 =?utf-8?B?aWRzdTlPWmk5VVhsaHRQc3FiQnFvcXZRaVBRS3hBS3BsY1ZxYUR4V1hMTVY2?=
 =?utf-8?B?Tm1LeFFQMGh1RjFma045RUhOYStaMC9SYmJjaDVCOGlDQ1lPZW1CUjZCZFZ1?=
 =?utf-8?B?YkZFV0ExVVVCM0RqUDJ5M2ZJc0VzUGVmaE9TWkoxWkFaN0svV3RJR1BVQkZk?=
 =?utf-8?B?THc9PQ==?=
Content-ID: <C3CD97BCF0B11640862D6F94AE0223EB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5978.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3c0535-b6ba-4363-57d1-08dad465a030
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2022 13:03:37.0029
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbI1EnGOowZzySemxmwUgZScCF9kwyDrayz7aC4S4CWQ8pduPw1ry8cYv/AK8h871sDirqoMhjdYPe52PLOuVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_050414_787255_4B63C982 
X-CRM114-Status: GOOD (  25.11  )
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

On Wed, 2022-11-30 at 23:09 +0000, Sean Christopherson wrote:
> From: Chao Gao <chao.gao@intel.com>
> 
> Do compatibility checks when enabling hardware to effectively add
> compatibility checks when onlining a CPU.  Abort enabling, i.e. the
> online process, if the (hotplugged) CPU is incompatible with the known
> good setup.
> 
> At init time, KVM does compatibility checks to ensure that all online
> CPUs support hardware virtualization and a common set of features. But
> KVM uses hotplugged CPUs without such compatibility checks. On Intel
> CPUs, this leads to #GP if the hotplugged CPU doesn't support VMX, or
> VM-Entry failure if the hotplugged CPU doesn't support all features
> enabled by KVM.
> 
> Note, this is little more than a NOP on SVM, as SVM already checks for
> full SVM support during hardware enabling.
> 
> Opportunistically add a pr_err() if setup_vmcs_config() fails, and
> tweak all error messages to output which CPU failed.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For VMX:

Acked-by: Kai Huang <kai.huang@intel.com>

> ---
>  arch/x86/kvm/svm/svm.c |  8 +++-----
>  arch/x86/kvm/vmx/vmx.c | 15 ++++++++++-----
>  arch/x86/kvm/x86.c     |  5 +++++
>  3 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index c2e95c0d9fd8..46b658d0f46e 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -521,11 +521,12 @@ static void svm_init_osvw(struct kvm_vcpu *vcpu)
>  
>  static bool kvm_is_svm_supported(void)
>  {
> +	int cpu = raw_smp_processor_id();
>  	const char *msg;
>  	u64 vm_cr;
>  
>  	if (!cpu_has_svm(&msg)) {
> -		pr_err("SVM not supported, %s\n", msg);
> +		pr_err("SVM not supported by CPU %d, %s\n", cpu, msg);
>  		return false;
>  	}
>  
> @@ -536,7 +537,7 @@ static bool kvm_is_svm_supported(void)
>  
>  	rdmsrl(MSR_VM_CR, vm_cr);
>  	if (vm_cr & (1 << SVM_VM_CR_SVM_DISABLE)) {
> -		pr_err("SVM disabled (by BIOS) in MSR_VM_CR\n");
> +		pr_err("SVM disabled (by BIOS) in MSR_VM_CR on CPU %d\n", cpu);
>  		return false;
>  	}
>  
> @@ -587,9 +588,6 @@ static int svm_hardware_enable(void)
>  	if (efer & EFER_SVME)
>  		return -EBUSY;
>  
> -	if (!kvm_is_svm_supported())
> -		return -EINVAL;
> -
>  	sd = per_cpu_ptr(&svm_data, me);
>  	sd->asid_generation = 1;
>  	sd->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 6416ed5b7f89..39dd3082fcd8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -2711,14 +2711,16 @@ static int setup_vmcs_config(struct vmcs_config *vmcs_conf,
>  
>  static bool kvm_is_vmx_supported(void)
>  {
> +	int cpu = raw_smp_processor_id();
> +
>  	if (!cpu_has_vmx()) {
> -		pr_err("CPU doesn't support VMX\n");
> +		pr_err("VMX not supported by CPU %d\n", cpu);
>  		return false;
>  	}
>  
>  	if (!this_cpu_has(X86_FEATURE_MSR_IA32_FEAT_CTL) ||
>  	    !this_cpu_has(X86_FEATURE_VMX)) {
> -		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL\n");
> +		pr_err("VMX not enabled (by BIOS) in MSR_IA32_FEAT_CTL on CPU %d\n", cpu);
>  		return false;
>  	}
>  
> @@ -2727,18 +2729,21 @@ static bool kvm_is_vmx_supported(void)
>  
>  static int vmx_check_processor_compat(void)
>  {
> +	int cpu = raw_smp_processor_id();
>  	struct vmcs_config vmcs_conf;
>  	struct vmx_capability vmx_cap;
>  
>  	if (!kvm_is_vmx_supported())
>  		return -EIO;
>  
> -	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0)
> +	if (setup_vmcs_config(&vmcs_conf, &vmx_cap) < 0) {
> +		pr_err("Failed to setup VMCS config on CPU %d\n", cpu);
>  		return -EIO;
> +	}
>  	if (nested)
>  		nested_vmx_setup_ctls_msrs(&vmcs_conf, vmx_cap.ept);
> -	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config)) != 0) {
> -		pr_err("CPU %d feature inconsistency!\n", smp_processor_id());
> +	if (memcmp(&vmcs_config, &vmcs_conf, sizeof(struct vmcs_config))) {
> +		pr_err("Inconsistent VMCS config on CPU %d\n", cpu);
>  		return -EIO;
>  	}
>  	return 0;
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ee9af412ffd4..5a9e74cedbc6 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11967,6 +11967,11 @@ int kvm_arch_hardware_enable(void)
>  	bool stable, backwards_tsc = false;
>  
>  	kvm_user_return_msr_cpu_online();
> +
> +	ret = kvm_x86_check_processor_compatibility();
> +	if (ret)
> +		return ret;
> +
>  	ret = static_call(kvm_x86_hardware_enable)();
>  	if (ret != 0)
>  		return ret;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
