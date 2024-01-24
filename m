Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D52C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 05:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTbmO4nipmhmXhM2BrR9Th2x988uesWneb/FdYFkkgA=; b=iF55cCoXmvmyol
	qDvgKPDNMpvtsR28ACUoF4MbIYiGQ1woXT0unIMfYPyM4kPFBQAMPaRsZi63fQCcdDMJN5Xy9EIMr
	odtJzyDIzNB0kfNI5HJKbiIL7mvDI9zOOogrQmZfCyreZQ48Ro5HfSUsxujTUBlRucxwSyiL1AiG4
	Dyy7R/vjXeWST5TREvDsYkZxzH1Q0GPfhZAda8mcxMNzKNIG6UfZucMnPDU2I3q6OVI2ec19vDq+7
	UtotwKys9HiRTzQTJgCZGW9iIbxTlPP1QdioBVsN2fbXp0brVL1txFFkI2fDlqxB1jSLd/c/tqZZm
	c58Wp0aqZPeVdSPUtcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSW4R-001cpJ-11;
	Wed, 24 Jan 2024 05:45:07 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSW4O-001cnn-0i
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jan 2024 05:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706075104; x=1737611104;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+boVkHIjtxzqgQ01idi9vMajXGbft0DW/wFmuNI+iPw=;
  b=UidAPYMxKT5wmH6wNNNDzVJE1psWSiGbRwE0puudnKPM3WVbfZFkAeNA
   gjuYQeraOah6rFpKaJU7de2DtSmaBHcF/qsNLLpIb1yrQ2+rcCha9QERb
   fqvS+VEypGOXnB7Vn2dAKFiP7gNDWjZ3UEjIONHhQAQHefbcpEAuEbEJU
   mFaH16Jxg9RDPNqu+igzSAPLeoMetc5BoW3Bdm8LtboVaPnfVxk/f6eoN
   sh1LzlpfXnKmiUxsw8tlK/CSsqXu4r7Ib0kJoig1uN6+db3DxX7Q1Kjsg
   jLgXbxTVaU5xuLtpXMfPT1mztbpyPQQSNSjOIm2QyhDrM3NiMYP2SbiEs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="20304209"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20304209"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 21:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735808072"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="735808072"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 21:44:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 21:44:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 21:44:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 21:44:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izCwaD6BZqJLeNUDjdNwSBzULa06WYnpDi/u5SvwjK7g7OdPNaBjtnLSfTS977hoobnPiRftt8hXp62Bg6M5/ZGsmveqYN4gPugYhpiAKP5icRYnnV+s3tUEu/YXRCoTBmtiOJ+ZreWMgNZGSHmaBm1+KxaOW0ZyLc0CwNw6kbv5UhXn+1bYgQ1jAbtR53g5C1uEDvB9W9d7ItJBPQcv23cgOgEbRrw0KZE3kDF8wTLlzGYXcjpdfU6cqqk2ulyqlvkhOrq9MQHQkxCOft580mfLMHf2BD7szEnUsf8wRxeehvpkW/btNWBHwCmb+FNhNK2j/QcK/YK94X3mqle2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au7YMmcpqAcMV/6F/kKWMzNNkaiHrSYGfpqx1clm9iI=;
 b=cD+afj+l7hFc5/P8FNm4oPlMVtJc8F598SyparFkHzq6B0jZmAiDi6WHj7gIOhwa35vXo6WZ2ne7WjS/dTxaG+sw8aaK/rv4gKCrQUfizuaJWdPv5j89WIGmtkbKfkLDFWXaw60+YFnoQaFImLKZQXnpyVGZh0nVS32HZ4QJotBuIE9zsD2AYyAX+WOVOzMOU+4v2mx7RufM3FbPU6wriNjMvw8gsG7V3GM+pXi+iIqEiRtZFRU4iGCMcYb7urqZDYTORSmiPrZPb3C3cuz/EERk0pWiAsNiFAykfr+Cu7189zfcIuDjdO+xinTpPZIb+Ul22VQuqqaA+iSf4e3IYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 05:44:53 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::7627:31de:36ec:27c]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::7627:31de:36ec:27c%5]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 05:44:53 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, David Laight
	<David.Laight@aculab.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>, "Li,
 Haicheng" <haicheng.li@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: Optimize crc32 with Zbc extension
Thread-Topic: [PATCH] riscv: Optimize crc32 with Zbc extension
Thread-Index: AQHaP65h4Tgp9DgCwEu/ue2vJWxme7DcmyaAgAvSDaA=
Date: Wed, 24 Jan 2024 05:44:52 +0000
Message-ID: <BL3PR11MB5747805F781890D336A417D7B87B2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20240105080830.3738117-1-xiao.w.wang@intel.com>
 <20240116-9f09b002afc2337ab5e41e3f@orel>
In-Reply-To: <20240116-9f09b002afc2337ab5e41e3f@orel>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|BL1PR11MB5954:EE_
x-ms-office365-filtering-correlation-id: b2975d85-886e-4234-bde3-08dc1c9f9682
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s3iSpSqBG0fdp2iSj4sxAd1KK4bsD2ZxooxMea+6Yqo0GDXbz36oHaH22QuhBkyixoNCKVBMJtQy68W4iGClhcZ6kVwSg/zRFd/T/WjFAtAmDN5YnXQv8VMXcp30dNM3UY3uP2H/z6QDjgkqisQS2W/ZgcrUlMzjEHLota0RQmYMsYRdJvoNIdpponx9mlZLZCal67oqHsa2yWsi0VrKBsuke6i0ckhbcgNnt8N9y9wuA2UTxOvAWbWmUVsKROtulqGkbEWjFrLIaqfB9+AdkMyrNG4jlLlvD47uhyvEC279t/nPZW3HIzcqK1hzYtjb93WTMCNwH+vehxCLt2gaX5pNHp3daCVJRXMT2t3ptUknQMG1t9TqSp6Tkju8910jV5oOKnddEVOV7p/ZyModYl9uGGKlSqBHKnq68vp/8Yv34TuS7vRy6K/PJETLGyxRbxAk1d9j1ljYuy0zdTSmGNPniaXPl4eunyRBB41SGwVaoO8w6FTsu2U52K5GGlRaSXqK6OoobtYZcBCtTgjoyrI+p5iOUaYjSxRqxvk/azi49TZ9mhAilSoPODtdPK8rf+M8hviza5jW87UE/vXD4n6JJapC12o0U3allqBsesxXnWYYCnDUtbw/Y8/AMyElIWrzhY8hYcVYIzEd0aDZMfZn8v24fPBsggaEqXCDoZXHIOyI42oDZW6OV6222y9y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB5747.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(366004)(39860400002)(136003)(396003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(186009)(64100799003)(64756008)(66446008)(54906003)(66476007)(66556008)(316002)(110136005)(66946007)(76116006)(26005)(66899024)(38070700009)(478600001)(9686003)(71200400001)(41300700001)(33656002)(966005)(38100700002)(2906002)(122000001)(53546011)(5660300002)(7696005)(6506007)(82960400001)(86362001)(52536014)(8676002)(8936002)(83380400001)(4326008)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?dUh/sl15NP7vOdlxpgFg5BsUDjKXrguQTSEK+9YoMZZCR45fFVbL5bkz?=
 =?Windows-1252?Q?zZ52fhxtFlWoswHtr0NWappNiSjf+3iWBTh7nxuSVcYRwFwAvHfffAH+?=
 =?Windows-1252?Q?MsdQhQgR8BzGGwTrg2PZSQkMhhVwwsG+vIn1/ecTI4Gb2F0+YHvnFzQO?=
 =?Windows-1252?Q?Bt8Ji3lPgpUu+FgBeiMvmfu6V4bCNWjfke2pl3psxyTT3c/g9XCJCTGF?=
 =?Windows-1252?Q?qSTKTzTtg2AhqX1AwanEqJzwkCGrCy+rBSyWff97Vy2u/hnOTRyF1AtO?=
 =?Windows-1252?Q?ghVunh5/utgT/NPMXYCpRBcXefe6+0bnPBe/pqtZIr3ftSjDcrnslyFS?=
 =?Windows-1252?Q?vv7dgfirXOM8tq7ISdgo31PUpdEkeWzzxLNzMICRzbvlTf0JU9OnX3Ko?=
 =?Windows-1252?Q?KjF7mU4+Ub/sgO/FK4l1a/GEKvqOJcKlO9QZUNGJuIpqKMTJTCir66tl?=
 =?Windows-1252?Q?J/ZZc2fa9gwrXUAPABgS4t5D1XCmTZ2MOV4VcKU8iupVa+N1Dj+nOYWP?=
 =?Windows-1252?Q?w0XY+gHWLX35Q3eV1M8zFCnDuZ2WE+VkSGb59A10jffiS4H80phvO7qt?=
 =?Windows-1252?Q?/LdUpmytVzdf4w5kie/C4KqRT9cTpdVf37xMwPVb0n0hqhpXkPKv+9GX?=
 =?Windows-1252?Q?7t6u79beBz+dhhOLjekI+t7p20rwqNFis9CpeuuFZQXX2fmkDvoTjX8p?=
 =?Windows-1252?Q?BJ4AuIaIZrI6BB8NzRCnMOyLJUcQdfamzV5xvXmkchZX0yNeaZq+xvmT?=
 =?Windows-1252?Q?tIYPKLSlriev7BQ5ylVmaG96nhW3V9IHL8pB8Sao40z5U5AFiI88sY+Y?=
 =?Windows-1252?Q?ipoI9wXCj6XG4YFQGC0aScRz2iymmqjoWGAURktP+L7d+WHasqb0739T?=
 =?Windows-1252?Q?UlvKn3V5eKoWBWiWFUmu1rxxnr0EnqNr+NAg/35nD+45r98muzHK+vRb?=
 =?Windows-1252?Q?tUBikd/R0MHgm3tnmKgdrKVRyHEl6XINofIJgE+G1bKforxU1bP+y2DF?=
 =?Windows-1252?Q?FiIOeLwzdGxiuw6Yelt5z1/HjZEjCoY559MXBVaQNbrtAIJGVKdabH9P?=
 =?Windows-1252?Q?ZEzdYjafDBbwoyfDDl6x/FfQjCnKV85g+HKMd9zvWc1kmh2ySzd1ZwmA?=
 =?Windows-1252?Q?NFyAJrRsC6sIiYQy3CPQx08S1frBZOcYprld7ZQ6p0LrE1QB7FAShG58?=
 =?Windows-1252?Q?iHZ+ykRCzu6LdL5zIYGlY30ckkJApbCv1wSjNjK1ZfZVdep13kcQiWiA?=
 =?Windows-1252?Q?NcDRVG3uONqANsfFrzFof2BsY7cOfmz96DYwC1eUZhmm1rpZZDRcml7u?=
 =?Windows-1252?Q?LiOi9Pcuxcj0GaWWl7s4nKzwBUt4g7Fwkruoc4KXeAevdkq9QuRuvZLE?=
 =?Windows-1252?Q?aBwa/uNjW+zCnmhm5Bv5Q07J7jwSMVFXSsDXgrc6Y04qtapvZH74FyQ3?=
 =?Windows-1252?Q?EaiY/Ll7DPboypT9YODBfiXpu8er30+GGi3R87niHFKxm9EcITmrKuzc?=
 =?Windows-1252?Q?V8I9gA72kBGDDDW6CL0Pr/0657cZAUXt4DC7kaPp52RPyZNda4VF+Z+Y?=
 =?Windows-1252?Q?L7n8tTo4ESbUVn6uiAd27xSVgqJTEo98bduMQnuVJTpP7f5Ge1CHEj0e?=
 =?Windows-1252?Q?/Qs+WO9QEAc7XOKqtU+ZZyok/gO3wzopueB9wmencGsSNG1PyugziUPj?=
 =?Windows-1252?Q?K3x0gZ7SHX4jtO0ei1LJQENPfKAPDWL/?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2975d85-886e-4234-bde3-08dc1c9f9682
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 05:44:52.9704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /0R+CaLb63Gdv4WkNd9v8XfpeKa0R7iUPltMaP6wke1msY1DMPF5BOamUS7bpPFyn2r7gyiYCZo2OQ+hK62c5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_214504_386748_B5ED698A 
X-CRM114-Status: GOOD (  39.30  )
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

Hi Andrew,

> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Tuesday, January 16, 2024 11:04 PM
> To: Wang, Xiao W <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; conor.dooley@microchip.com; heiko@sntech.de; Li,
> Haicheng <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] riscv: Optimize crc32 with Zbc extension
> 
> On Fri, Jan 05, 2024 at 04:08:30PM +0800, Xiao Wang wrote:
> > As suggested by the B-ext spec, the Zbc (carry-less multiplication)
> > instructions can be used to accelerate CRC calculations. Currently, the
> > crc32 is the most widely used crc function inside kernel, so this patch
> > focuses on the optimization of just the crc32 APIs.
> >
> > Compared with the current table-lookup based optimization, Zbc based
> > optimization can also achieve large stride during CRC calculation loop,
> > meantime, it avoids the memory access latency of the table-lookup based
> > implementation and it reduces memory footprint.
> >
> > If Zbc feature is not supported in a runtime environment, then the
> > table-lookup based implementation would serve as fallback via alternative
> > mechanism. To avoid the performance concern of unalignment access, we
> also
> > use the fallback implementation to handle the head and tail bytes if any,
> > the main body is accelerated by Zbc extension.
> >
> > This patch is tested on QEMU VM with the kernel CRC32 selftest.
> 
> Ideally we'd also have the results of some benchmarks, or at least a
> dynamic instruction count or something, but I don't suspect that the
> table-lookup would "win" over Zbc. The bigger question is whether we
> want three implementations, because I assume we want Zvbc, particularly
> since [1] says
> 
> """
> Zvbc is listed as a development option for use in other algorithms,
> and will become mandatory. Scalar Zbc is now listed as an expansion
> option, i.e., it will probably not become mandatory.
> """
> 
> [1] https://github.com/riscv/riscv-profiles/blob/main/rva23-profile.adoc

I would collect instructions count change and include the info in the commit log.
Regarding to the bigger question, I have some thoughts:

- It looks this question also stands for some other cases like lib/str*, which currently
has been accelerated by Zbb-ext, but since the in-kernel RVV support has been enabled,
we may also use RVV to accelerate the lib/str*.
ALTERNATIVE_2 mechanism allows a second code patching on the same location. So
two alternative versions for the same function can be supported.

- At this moment, I can't figure out how Zvbc can be used to better accelerate these
crc32 APIs which take just one data stream as input. I have rough idea for a batched
version API which takes multi data stream as input (a parallel implementation of below
Zbc acceleration), but not for these 3 APIs here.
BTW, the vector "clmulr" insn is not listed in the Zvbc spec, but it's useful in below implementation.
https://github.com/riscv/riscv-crypto/blob/main/doc/vector/riscv-crypto-vector-zvbc.adoc
Anyway, if we come up with a Zvbc based optimization in future, then ALTERNATIVE_2
would help.

> 
> 
> A few nits below.

Thanks for all the above & below comments. Will adopt most of the suggestions, except two,
please check below.

> 
> >
> > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > ---
> >  arch/riscv/Kconfig      |  23 +++++
> >  arch/riscv/lib/Makefile |   1 +
> >  arch/riscv/lib/crc32.c  | 216
> ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/crc32.h   |   3 +
> >  4 files changed, 243 insertions(+)
> >  create mode 100644 arch/riscv/lib/crc32.c
> >
[...]

> > +#if (BITS_PER_LONG == 64)
> > +					  size_t len, u32 poly, u64 poly_qt,
> > +#else
> > +					  size_t len, u32 poly, u32 poly_qt,
> > +#endif
> 
> How about creating a new type for poly_qt, defined as u64 for xlen=64
> and u32 for xlen=32 to avoid the #ifdef?

Would make it as "unsigned long", as David's comment.

> 
> > +					  fallback crc_fb)
> > +{
> > +	size_t offset, head_len, tail_len;
> > +	const unsigned long *p_ul;
> > +	unsigned long s;
> > +
> > +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> > +				      RISCV_ISA_EXT_ZBC, 1)
> > +			  : : : : legacy);
> > +
> > +	/* Handle the unalignment head. */
> > +	offset = (unsigned long)p & OFFSET_MASK;
> > +	if (offset) {
> > +		head_len = MIN(STEP - offset, len);
> > +		crc = crc_fb(crc, p, head_len);
> > +		len -= head_len;
> > +		p += head_len;
> > +	}
> > +
> > +	tail_len = len & OFFSET_MASK;
> > +	len = len >> STEP_ORDER;
> > +	p_ul = (unsigned long *)p;
> > +
> > +	for (int i = 0; i < len; i++) {
> > +#if (BITS_PER_LONG == 64)
> > +		s = (unsigned long)crc ^ __cpu_to_le64(*p_ul++);
> > +		/* We don't have a "clmulrh" insn, so use clmul + slli instead.
> > +		 */
> 
> need opening /* comment wing
> 
> > +		asm volatile (".option push\n"
> > +			      ".option arch,+zbc\n"
> > +			      "clmul	%0, %1, %2\n"
> > +			      "slli	%0, %0, 1\n"
> > +			      "xor	%0, %0, %1\n"
> > +			      "clmulr	%0, %0, %3\n"
> > +			      "srli	%0, %0, 32\n"
> > +			      ".option pop\n"
> > +			      : "=&r" (crc)
> > +			      : "r" (s),
> > +				"r" (poly_qt),
> > +				"r" ((u64)poly << 32)
> > +			      :);
> > +#else
> > +		s = crc ^ __cpu_to_le32(*p_ul++);
> > +		/* We don't have a "clmulrh" insn, so use clmul + slli instead.
> 
> also here
> 
> > +		 */
> > +		asm volatile (".option push\n"
> > +			      ".option arch,+zbc\n"
> > +			      "clmul	%0, %1, %2\n"
> > +			      "slli	%0, %0, 1\n"
> > +			      "xor	%0, %0, %1\n"
> > +			      "clmulr	%0, %0, %3\n"
> > +			      ".option pop\n"
> > +			      : "=&r" (crc)
> > +			      : "r" (s),
> > +				"r" (poly_qt),
> > +				"r" (poly)
> > +			      :);
> > +#endif
> 
> Instead of the #ifdef here, we could provide function wrappers for the asm
> which would be defined above in the first #ifdef ladder.
> 
> > +	}
> > +
> > +	/* Handle the tail bytes. */
> > +	if (tail_len)
> > +		crc = crc_fb(crc, (unsigned char const *)p_ul, tail_len);
> > +	return crc;
> > +
> > +legacy:
> > +	return crc_fb(crc, p, len);
> > +}
> > +
> > +u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
> > +{
> > +	return crc32_le_generic(crc, p, len, CRC32_POLY_LE,
> CRC32_POLY_QT_LE,
> > +				crc32_le_base);
> > +}
> > +
> > +u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
> > +{
> > +	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
> > +				CRC32C_POLY_QT_LE, __crc32c_le_base);
> > +}
> > +
> > +u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
> > +{
> > +	size_t offset, head_len, tail_len;
> > +	const unsigned long *p_ul;
> > +	unsigned long s;
> > +
> > +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> > +				      RISCV_ISA_EXT_ZBC, 1)
> > +			  : : : : legacy);
> > +
> > +	/* Handle the unalignment head. */
> > +	offset = (unsigned long)p & OFFSET_MASK;
> > +	if (offset) {
> > +		head_len = MIN(STEP - offset, len);
> > +		crc = crc32_be_base(crc, p, head_len);
> > +		len -= head_len;
> > +		p += head_len;
> > +	}
> > +
> > +	tail_len = len & OFFSET_MASK;
> > +	len = len >> STEP_ORDER;
> > +	p_ul = (unsigned long *)p;
> > +
> > +	for (int i = 0; i < len; i++) {
> > +#if (BITS_PER_LONG == 64)
> > +		s = (unsigned long)crc << 32;
> > +		s ^= __cpu_to_be64(*p_ul++);
> > +#else
> > +		s = crc ^ __cpu_to_be32(*p_ul++);
> > +#endif
> 
> Could write the above without #ifdef with
> 
>  if (IS_ENABLED(CONFIG_64BIT)) {
>     ...
>  } else {
>     ...
>  }

I got a warning for riscv32 build with this change, gcc v12.2.0
../arch/riscv/lib/crc32.c:191:40: warning: left shift count >= width of type [-Wshift-count-overflow]
It looks compiler takes the always-impossible code branch into consideration.

BRs,
Xiao


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
