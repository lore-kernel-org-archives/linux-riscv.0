Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B27C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 05:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNIkg/aWuBUZb6dJfektQfPLAP+pFfZ1edzoNNWqq+I=; b=dXmfKi060xdI/Y
	R6kdGRQPxhahQ6FJ6oVUf+4rvRXljf6qvMhMqhhxLQ6TvYJ5A7Drz+OsjvDUnxv8PD2nM1MhnE/vK
	M7r3teBSdm8BHnBx2JVVAJvwSOG+gF5NacWq32lbv8+s3bHgT3YhLblnwXJio3YE6q50CjLIkHwfX
	ln9YD3cCq8/GmtVADprM1wsQpPJPlZwzTn3xoxT+N48pGuOv/czW1BofwNpRhLOBQd1CREryOrQkR
	7phKiuRD+02HQL4HhWFxLir9+COKWfJXVLag3X4peR3eLVeU9Xzn0r0RC9G0GkQDb/30gt5UjLllC
	doxaYebQxP4CBOYKasGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbE2h-00Crwu-0R;
	Wed, 30 Aug 2023 05:47:03 +0000
Received: from mgamail.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbE2Y-00Crvp-1d
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 05:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693374414; x=1724910414;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iKUSbPPFLE7+jJMnqnFcX96rTKGI3NGW3wG0BmXSMf8=;
  b=PkIs6jVyN68QKESBIyTQrnk7c0CjVvVZN/rCbnqulp18Shk0H638sYTq
   JOPmXeZyF0xZUatadtmqLcBXePSFu4SxUKOQrrOIlGsh4+xr0tFx382AQ
   n9UrPo+Y6c6pAUE/6GR6JyuyfWfUHFPLB5zXvdBhdFmkJaHp+n4EQKBzj
   r6f8PePrmDcPe8GSTzV01NILEyLpYmJX+9ZE2L6VHB/uwt0XOADTWXeAl
   c8DRvLy16IjEYs85UGYzWhW9XYud5GU59NuIOuH8L4LsrRTMDGc3T9nA5
   2Kpz+hWDSm/1oGu3xZ+PMcu1Kivcd9kABugZnBqdSMB762S/GCN3OKY48
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374459785"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="374459785"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 22:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="732470136"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="732470136"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 29 Aug 2023 22:46:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 29 Aug 2023 22:46:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 29 Aug 2023 22:46:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 29 Aug 2023 22:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAaTykHHPLmlqom6/rUz72oCsGlhOivfcU+YdvkMvPiU5ctcxh6L90mp6ol4rXAgRhlCRTfcc06E+G4rF2nvc+DNLZagCphv3lWp0ZbF8LLUaSdIGv5KSgzQgv5vEnYrPRbU57U16p7e9bej9Q+/po+jGDTre/fhUyMJgbboG4OpEIhJ+UFNOhkBAMgJiSQbntMP/GVoJdZfxIJbrp6AqR5mreRgisCyFilS0xcpAQb2XOYumprXy5IKx1QwpflTUMTTljoUmiEfS+E/oq6eZ1b234/6CNT1b1Ww0M35kM6X2+QszgXrmJ5fN2pMaNep/ExltCNq9b7xCCbiGB3kWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKUSbPPFLE7+jJMnqnFcX96rTKGI3NGW3wG0BmXSMf8=;
 b=P7lenKz9hI7XI/FpDpfrZpG2MMHor8dechzI1DCP+akLciuaXKIZZODmTLadMgttSAEE0moZHR1kYF+dZLG+W/6RkPAi5TaBkM1ctkNVHzWGaFQw5myszyxS6WCrblTLdQzE44mPaVxODAsn8ZMDTNljgT50bTbamEmO1myFd99TsDW23aATkmVL+BWoDkJAYDdIC174WHHLps03Lr+1yiNqGSoRzWI7DYvYV3zoW1FzHIF/1/tFBHXjSTgnfUfKdG2K+0GsifRZmAITA0tFZI8v9L0sp5ZSuGmlBr4KCh9E4uolrz2g5Y/67Vh1I7pGe4bxA0MlqSrzU1CQDHofRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB4850.namprd11.prod.outlook.com (2603:10b6:303:9c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.35; Wed, 30 Aug 2023 05:46:41 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 05:46:41 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "anup@brainfault.org" <anup@brainfault.org>, "Li,
 Haicheng" <haicheng.li@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-efi@vger.kernel.org"
	<linux-efi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] RISC-V: Optimize bitops with Zbb extension
Thread-Topic: [PATCH] RISC-V: Optimize bitops with Zbb extension
Thread-Index: AQHZyA83tlYFgJbtxEiuzFgm3vAb3a/dA3eAgAAJ0KCAIOt48IABq9CAgALU8nA=
Date: Wed, 30 Aug 2023 05:46:41 +0000
Message-ID: <DM8PR11MB5751239867AD8E114B9C52BAB8E6A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAMj1kXHicVpT7PDSB=BgYEuhBxgufHqd9X8ZCg19k0_U+rjvEg@mail.gmail.com>
 <DM8PR11MB5751DA69DEEAAC9B06623E0BB80FA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <DM8PR11MB575198187CB962EBE663B7F0B8E1A@DM8PR11MB5751.namprd11.prod.outlook.com>
 <CAMj1kXGCGVhA=bc+2gNZwb7s_H4K6yk54J04pUQ1XPW+8-2COA@mail.gmail.com>
In-Reply-To: <CAMj1kXGCGVhA=bc+2gNZwb7s_H4K6yk54J04pUQ1XPW+8-2COA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB4850:EE_
x-ms-office365-filtering-correlation-id: 43b80741-9279-4249-0e4a-08dba91c7c5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NPRRUiTlUf1TgzHVeGgoBXCybnM10w/nTNHcQCmO1Qb2GeS6rVOmmG2C0mndjW1VbZdWgF9+mIgZ1P91NkmpQfXPYIpMakTKpo4jkk9UUwwV0nCFCBMebc70OaBo2DCmDPygvJNUFKv74UInNlvXBSXZU4iolFY3igm5zcouaPEgFUGJA+2BsO+mbXuuDoRwZUZUKT89kQX8UN8e2hixN2CNIPig61xUFmZYv2mv3oso3hMg6YeV5BmzEc7QpGKKA25sNWBWgR3MrEsFHyZ6gueIL4KHIwh9KZB2DAeyG0k+++gYvLqJq43heVCHEWBYN283avVb5SEZVQF6A/HezLXto3KfMlZW00HDzAiVkdNWJYzSv6BaIncezQgjQItQEY5hm0f2K5ZdIqtvwg5gz+bYKxNcmqIq1TwUeq+MaX22Bjy2wzuuwddM9UCcHB7eE8rAh+rtqqjr3gNfzqYbs3v/vtjGeXcD6fvQfoQrvFO39z+gUSbI+EiHxh3yFMl/IZqvZNiGjZDQHIJK/dqmEh7MRPqptd57zKv92M1NZHI3lM+amSqaRVk/cPXsAz/U7m6+U2zwjuEJ4Jcd3gZ9uHlhub+yy4cpHoYoq+CeUO6qaXeWz+Gktds8+gQFs8XM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(186009)(1800799009)(451199024)(4326008)(6506007)(9686003)(7696005)(71200400001)(83380400001)(478600001)(53546011)(26005)(2906002)(66446008)(64756008)(41300700001)(6916009)(54906003)(66476007)(316002)(66556008)(76116006)(5660300002)(8676002)(8936002)(52536014)(66946007)(86362001)(33656002)(55016003)(82960400001)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEw1ZTJKZDJFenhZdER5aW00NUdvc1VLaCtCejRGWkNzVUdXNllHdWhLVFA1?=
 =?utf-8?B?cFJCdCtnSEVRN2pHYUxQemQyQjRJbHN2VjNRYkVWZUNOK0c2Q0pWQWVpTlFs?=
 =?utf-8?B?d0wzTStwcUtoWGxCelcvWHl6OHNvM1JEOGNoSkZpTDV3dzBSQ0k1eG1tdDJr?=
 =?utf-8?B?bVRucjBhSWxTK3lRMy9PaGt2QzdvTGdkVXdXaFVSQkNHZXpLaG83TjB0SFcw?=
 =?utf-8?B?WEFIZmJiTkFSaWcxczcweUpmempMS3haam5IdjVWdE5ueGs0TmFxRUNsSk1v?=
 =?utf-8?B?ZFh6V2x0MDdnQTh1MFAwRW9xeHlnRlR6VDgxUkwwVWg2Y1ZYTnVFdHZ3QVp4?=
 =?utf-8?B?K3hHUXluTWIzcUlLOFk1clZVNGMvdXJ5QUVZS1krU0Uwdlg0RTBmS0xYNUxQ?=
 =?utf-8?B?ZVV2V29WUjJlR0daRUZnOG1ORHg3ZVBPNXhDZUFRYS9xc25zOXlxSFMyRFlv?=
 =?utf-8?B?Ykh4U3BCczNSZ01mUFZ2WVlQTGRtVy9xdFNuKzVZbGRhRklWVVFHQWtLenFH?=
 =?utf-8?B?clYwUXBVR1JENHhZdGlKQXhzOFpHdkJZRk1OSlp4cVFhdmgxb2llTDhyZWl0?=
 =?utf-8?B?RXBiZytRTmZpZVJIYkVEVnZCaWs0K0pnMTlpWnVRalBIVGNMUWJpb0d5NGFs?=
 =?utf-8?B?cjJIM3lQQWRGR2poTkdraFlmUVhDUDZidnNxeXY5YjJEY2pIa3dKekNxOUZM?=
 =?utf-8?B?d3pnQVVZeFJzbVc1MlppOFdmMVorN0t4a0ExUlVwYjFiTnlyWVN0M0JENVI4?=
 =?utf-8?B?YmYxVyt3ZWxQQUd1L1BaSXFQRGZnaUZVOENuSHBndVBaNjRMMnVLL0JmQ1RB?=
 =?utf-8?B?ZHl0VVRxcUJVQmdSdUxHVFRCUlRZekg2ejVoOVdIMDcyUURyWWtiSy9idVhH?=
 =?utf-8?B?eGVxNmZQUnlHSVd5UVhBM0tPQiswK0lmRWU1QnZ1ZFpKSllXVlN3dnQ4cUJS?=
 =?utf-8?B?eU00Z2dlR0ZRTERjc2VtNVlVc3c3eWZvQzcxMlZUSnlXdzQyaWQ3N1NFZ2o5?=
 =?utf-8?B?Nk5idmJGNHdXSXE3a005WXFva3RsSDBkRm9OTkdQdHozSkFCQTdXNll0NWxh?=
 =?utf-8?B?MmVnZ1VTb3JQd014UHZmaXkyY003TkRXek1rdlVFNG14bnZqRjE0cTNtRUt5?=
 =?utf-8?B?Nk9RbkZ6YWVtNUQxZ0NneUNJVDlyZnN1dThIaXAxQjNNeThsTkd2a2gzeVJQ?=
 =?utf-8?B?MUdlMWJRdVlrWTQ3cWRVa2FiSzFTZjJrUksxeUQrVFZuVjJ5ckxjbzg5dVdY?=
 =?utf-8?B?TmllRnc5VTNxa0p0QkJ6RDI5NW80S3IzbjR2eS9icytkTkZOZ3hNalNyQ0gx?=
 =?utf-8?B?bm9LRnJsV2ZzQVR4dit4QVppdHNwa3Q4bTZqOFZBOGVBR0pJM3A4RHp6TkpB?=
 =?utf-8?B?Q0ZEMGRNd2N6MDJHMUpzTnpkMzdENWpGelhOaUh4bnJOWnJzOG9Yd0U1WWdx?=
 =?utf-8?B?VExRU1d3R2RweFBjak85ZzNmODlTSnZNMUpia1RLYm5JeVB1NVZoc1NoYnNU?=
 =?utf-8?B?MVd2MlVFWlZvMXo2U3ozcVpmeUpLVjJrd2N1a0UzUElxOGRUNkh2UkROYWdp?=
 =?utf-8?B?Q1FObEdRNUw5T2pPNzJBeWJ2LzBib3MzS1dQVnUxMjRkZlg5REF6NkxiQVV3?=
 =?utf-8?B?UE5nM01oNzgvenlueDB3UmJpNng1QU9RRXZXWVljOXM0ZFhsTVVXYXFmVlRj?=
 =?utf-8?B?S3pONWtHc29yUnlTS25JcWlHNGVIZlVBM3ZrbDNxOE9uajhRQjlIdm96eVox?=
 =?utf-8?B?dUdjNFp2YVJhR0dQMW1BQWZCS3FpdXdaU1F0dWxhQ3NTZUpOcnREMlBpSVN2?=
 =?utf-8?B?SEE3b0d3MFJDdHo1UExJNEN4MktnN0YxZitCb0hISWxVcGVvcExqRE51Q0Jo?=
 =?utf-8?B?YkFTV2ZZMUE4S0N5dlliclUza3hVMHJWbDE4MTVuVXhHcE4wZnV1akQwdHlv?=
 =?utf-8?B?UnYvTDVzV3RCdXZJQi8wYXVrSHhidStXSFpqWGlLTUhyL2dEREpoT3JwUnRO?=
 =?utf-8?B?VGd0UkdmQUEwL2Z5YkVmbEVucTVsdVMvUHBTM21od2tSdTdNa3lPRFFRL0kr?=
 =?utf-8?B?MllQZkpVUmcraXQ5K1ptclN2U0k5MTZvVU9IYjVvUzlVdXNnRHZ6MzNBZTBF?=
 =?utf-8?Q?fOX8DXEb9AAPFR8sM5eV0IbTh?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b80741-9279-4249-0e4a-08dba91c7c5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 05:46:41.3615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDiK3V/uvMogAVsoo60xsvCu+/sfujbBqG/rFJ0vSoJ/RIAIgGwpZoRw3Er9dxHbUN7c1rRnK9CpzuN5lmU0/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4850
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_224654_580343_62F7D40C 
X-CRM114-Status: GOOD (  31.50  )
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

Hi,

> -----Original Message-----
> From: Ard Biesheuvel <ardb@kernel.org>
> Sent: Monday, August 28, 2023 6:28 PM
> To: Wang, Xiao W <xiao.w.wang@intel.com>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> efi@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
> 
> On Sun, 27 Aug 2023 at 11:26, Wang, Xiao W <xiao.w.wang@intel.com>
> wrote:
> >
> > Hi,
> >
> > A gentle ping.
> > Any other comments or suggestions for this patch? Or maybe we would
> review it in the Linux 6.7 development cycle?
> >
> 
> This is going to be 6.7 material at the earliest in any case.
> 
> I am fine with the change as far as the EFI code is concerned, but I'd
> suggest dropping EFI_ from the macro name, as it could be #define'd
> for other reasons too.

Yes, I agree with you. Would remove the EFI_ prefix in next version.

Thanks,
Xiao

> 
> 
> >
> > > -----Original Message-----
> > > From: Wang, Xiao W
> > > Sent: Sunday, August 6, 2023 6:24 PM
> > > To: Ard Biesheuvel <ardb@kernel.org>
> > > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> > > <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > > efi@vger.kernel.org; linux-kernel@vger.kernel.org
> > > Subject: RE: [PATCH] RISC-V: Optimize bitops with Zbb extension
> > >
> > > Hi,
> > >
> > > > -----Original Message-----
> > > > From: Ard Biesheuvel <ardb@kernel.org>
> > > > Sent: Sunday, August 6, 2023 5:39 PM
> > > > To: Wang, Xiao W <xiao.w.wang@intel.com>
> > > > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > > > aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> > > > <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > > > efi@vger.kernel.org; linux-kernel@vger.kernel.org
> > > > Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
> > > >
> > > > On Sun, 6 Aug 2023 at 04:39, Xiao Wang <xiao.w.wang@intel.com>
> wrote:
> > > > >
> > > > > This patch leverages the alternative mechanism to dynamically optimize
> > > > > bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
> > > > > Zbb ext is not supported by the runtime CPU, legacy implementation is
> > > > > used. If Zbb is supported, then the optimized variants will be selected
> > > > > via alternative patching.
> > > > >
> > > > > The legacy bitops support is taken from the generic C implementation as
> > > > > fallback.
> > > > >
> > > > > If the parameter is a build-time constant, we leverage compiler builtin
> to
> > > > > calculate the result directly, this approach is inspired by x86 bitops
> > > > > implementation.
> > > > >
> > > > > EFI stub runs before the kernel, so alternative mechanism should not be
> > > > > used there, this patch introduces a macro EFI_NO_ALTERNATIVE for this
> > > > > purpose.
> > > > >
> > > >
> > > > Why? The unpatched sequences work fine, no?
> > >
> > > It works. But there would be build warning: orphan section
> `.init.alternative'
> > > from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section
> > > `.init.alternative'. Besides, w/o this MACRO, the optimized variant would
> > > never be used at runtime, so this patch choose to disable alternative.
> > >
> > > BRs,
> > > Xiao
> > >
> > > >
> > > >
> > > > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > > > ---
> > > > >  arch/riscv/include/asm/bitops.h       | 266
> > > +++++++++++++++++++++++++-
> > > > >  drivers/firmware/efi/libstub/Makefile |   2 +-
> > > > >  2 files changed, 264 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/arch/riscv/include/asm/bitops.h
> > > > b/arch/riscv/include/asm/bitops.h
> > > > > index 3540b690944b..f727f6489cd5 100644
> > > > > --- a/arch/riscv/include/asm/bitops.h
> > > > > +++ b/arch/riscv/include/asm/bitops.h
> > > > > @@ -15,13 +15,273 @@
> > > > >  #include <asm/barrier.h>
> > > > >  #include <asm/bitsperlong.h>
> > > > >
> > > > > +#if !defined(CONFIG_RISCV_ISA_ZBB) ||
> defined(EFI_NO_ALTERNATIVE)
> > > > >  #include <asm-generic/bitops/__ffs.h>
> > > > > -#include <asm-generic/bitops/ffz.h>
> > > > > -#include <asm-generic/bitops/fls.h>
> > > > >  #include <asm-generic/bitops/__fls.h>
> > > > > +#include <asm-generic/bitops/ffs.h>
> > > > > +#include <asm-generic/bitops/fls.h>
> > > > > +
> > > > > +#else
> > > > > +#include <asm/alternative-macros.h>
> > > > > +#include <asm/hwcap.h>
> > > > > +
> > > > > +#if (BITS_PER_LONG == 64)
> > > > > +#define CTZW   "ctzw "
> > > > > +#define CLZW   "clzw "
> > > > > +#elif (BITS_PER_LONG == 32)
> > > > > +#define CTZW   "ctz "
> > > > > +#define CLZW   "clz "
> > > > > +#else
> > > > > +#error "Unexpected BITS_PER_LONG"
> > > > > +#endif
> > > [...]
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
