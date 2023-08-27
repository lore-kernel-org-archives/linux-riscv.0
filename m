Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36558C83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvvqTD4tih0Jhcp8jczRgehcB/+N16NJkhsT5TYxgjM=; b=LHPCMGTL2Mx9Gh
	0sqebiTLACzEYkszrCCJA1uQ0UPR/OcjPYoRvS64fryaCtU9hGBJL3aYrEri8vofPB9Z4BpwDEeaL
	q5kzI08xoxJw7OPpCtTm8PMVZ7w4sNC31LDo/ngDOSQeBWuSSRWXoX+GQtsy8v7Ya1vSewZHkLz2L
	6isymjBP9k+XQIyg/Dke0c7msiBSHjE1twFu3yrD5lc6b8phQHxXffkaA2YY9hLfZmDzJMIRsivGP
	vd45nCHm8SnrA15Ea5cMdSjotrMnJNBpefrQ2+t3gcl1tl5GtjFS0dvfe4oaG/slKNImv2I6hRQDn
	NMnhf/2MOHSo5SjFCYvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaC28-007jGk-26;
	Sun, 27 Aug 2023 09:26:12 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaC24-007jGL-08
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 09:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693128368; x=1724664368;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CLB98l5d14Xq1QQJ6A+X6NOacSEqJr4W2xdHdW10P/I=;
  b=Ig0yp26CVsbZsQjZWTP4CQKH/RYBO8g6R95qcfQCzIFpi6o+HwfmPDPp
   RbKBhIejjyddjIZu9l6bUHM/D1avFSWUAH8FcZoVWmYlqYEf2/5xdfEMQ
   G7U3l75XTqQtZeUAKCfbnriOTjhvEgR4Q690CN/aDC803lkU9DERL4Blk
   4pRm+0vCdLTl4XexY7HIhXBqYk6xeKOr4+2lBwQhcxk1maQMdUiwabKTJ
   LhhO7isykg6a9nEYk/QebDxTx7VniFmed4PjhnRd2ZXGjXubMMIK8TJT5
   NHtyHzp9RZp8lNdvwG1/o/QKaJ8rClrRAMbSihFIlLO/zL8Dztqq2U0Yg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="365134021"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="365134021"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 02:26:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="852485616"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="852485616"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2023 02:26:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 27 Aug 2023 02:26:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 27 Aug 2023 02:26:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 27 Aug 2023 02:26:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFWt7gaCtXmXMeObNqJEFYiM79AoO6+f7/J7yWU8NjXSIGh0Vm90qZjq0A01le9xNNGrJrzZ8tcMh7WqaHnHMaJcyrb3cBYPLBxfDQKTRGmlgreePA1kj10xfj6qsKIISzHhuymhFHZG6OWtaCRmYyAbaIAiEmqHT1+++Ihs+nKVpAB73gw/XqJMMCoFJGx8VLp8gdyaqiYbudEFrdoMxO47ryK4F6CcZr54HH6YSjcinRsAh8OqDT5YI2n8NC5B6xA0mtZcif0Nj7ce6ivwlwx0M4nqWRDmu3kMW978CF2VDk0R/1+AXx/C2xZDvty5p6IKOzd0SytWQ6VgCJ7Xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CLB98l5d14Xq1QQJ6A+X6NOacSEqJr4W2xdHdW10P/I=;
 b=IemtJFEv7F6nfOyrZv5a1rSm2SvVSDZhPdfbAll7sdwrDgzk3eaIf7B35zdqCWvVOC7AURjPPPvCQDjvUxxVmJErgpNz3hC6/EfbPS7WjsXuOzKcEMLkQqVWcmE3YsJhLLd/EAu/MNP0pttOEnvPdBuOpmfz7emcQ+vTAyh6U7N+lNyUKFThVIq3TwNTt/z8wxMRXiAvbuBfwg2guvaiyAOBPE0osmZ/wM0ACzJdN/TFMKgE+gDYkcFxXBRPOtn0HWFH63hcdc/HGJbSItxdBtyRNkcJqpDD8PAPz/5S/RjAWEXB4dSzs2w+jlv5q4ey5pp83en5AyZUMPug5Op9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Sun, 27 Aug 2023 09:25:58 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 09:25:58 +0000
From: "Wang, Xiao W" <xiao.w.wang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "anup@brainfault.org"
	<anup@brainfault.org>
CC: "Li, Haicheng" <haicheng.li@intel.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-efi@vger.kernel.org"
	<linux-efi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] RISC-V: Optimize bitops with Zbb extension
Thread-Topic: [PATCH] RISC-V: Optimize bitops with Zbb extension
Thread-Index: AQHZyA83tlYFgJbtxEiuzFgm3vAb3a/dA3eAgAAJ0KCAIOt48A==
Date: Sun, 27 Aug 2023 09:25:57 +0000
Message-ID: <DM8PR11MB575198187CB962EBE663B7F0B8E1A@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230806024715.3061589-1-xiao.w.wang@intel.com>
 <CAMj1kXHicVpT7PDSB=BgYEuhBxgufHqd9X8ZCg19k0_U+rjvEg@mail.gmail.com>
 <DM8PR11MB5751DA69DEEAAC9B06623E0BB80FA@DM8PR11MB5751.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5751DA69DEEAAC9B06623E0BB80FA@DM8PR11MB5751.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB6538:EE_
x-ms-office365-filtering-correlation-id: 848ebdca-f207-458b-86e1-08dba6df9f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WTJ5our3RdR+Tm0cT4CDbmCxqdagXb1rfGRT8hMUQSZCOZVMTcpSraznOORAmSTMWIDq8FwRgT/I+aBnQd6xC6cerKhT8cJ2tGje4HvHmgkzYmP8jXiRzsKrkvFhvSQZG83C0q6fj6fHkE7epJ7oTwOzSyDfXIvbStdirlJx3ZRzrbtc/UIyAeeyeg7qY/04ZjnU4dPXuxOMWuh5k1DGY+BwvbOlL31DL++5A+id5Qd7YgG4aof0wrjTLWCG9PFZQmgNAjIAEKRS0PjELw5pp5yTojBjWSZo3FWLgGWkaDz73pdeFowvencDuaFK/+dQWfvQdueshD8yK05lA3TO2DJ5oVscz1mEzmQg8uWyQtjUfLRwgkuMn4h+9lfDRFwMioRgjTLnyLbSxQuu5gwUaj0dWghO71lIiUQZEfOWCA0QrMnRyihYKwnhPT9FumftK9wV1PzzGcSUJCzJz2Kt68A4WOt/QCwjRFPKHdb3vQwYvaeR3xBpp1lDVn2E7O9kDGHPp+nRZD0uO7sVMk0JCGpV+mu+7W1M2hDqjNgS2vOm7flu66D3XHayZmqUKELAkH9+onmQhcCzJMUv5FgdnHfVhvFv30TW1NS55S2xyG+Ml8LZWX/O0S1sKJMYnABW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5751.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(71200400001)(55016003)(53546011)(6506007)(7696005)(9686003)(110136005)(52536014)(33656002)(2906002)(86362001)(5660300002)(82960400001)(4326008)(38070700005)(54906003)(8676002)(8936002)(66556008)(66946007)(66446008)(64756008)(66476007)(41300700001)(76116006)(316002)(38100700002)(122000001)(478600001)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3AreDF2OWdtOExUZElId04xbENZSE5Eb0Y5aFdZNkVEbFora25IbGcwZEhx?=
 =?utf-8?B?RFBVc09CRmpXQVovL1pMeitSbUIyV2l2bkFHT2wzUkRYa2ZCZVpMYXdHK3I3?=
 =?utf-8?B?NE9YRk1NRHNoQXFpSWR3dGRtMUZwN0FaVTNvZVJqcTRxN2lXRitQQVBjdWxm?=
 =?utf-8?B?dEVBd2FLbnZWa0NSV3NGUVA5eStsWUt4bVNXTFk1NmxCcTlKWUpuNGN4NXZa?=
 =?utf-8?B?OTgyK1BxVThEZW4yMXNrU2VOaGNYWEl6UkdvWEhpTFNXb2VYSFJIYkozQklM?=
 =?utf-8?B?S29KVGJ6Yzdoc09ibHB2RUVBY0RqeUdFZURuSHJPcGxqaytsOXBTWXYweDM5?=
 =?utf-8?B?Nlg3WkZhdklHN21xT3dXOTJDTDg2RHF5YzZDZVZTS1ZRVlJpeUZSYUIrMzVU?=
 =?utf-8?B?OWZTUjNwQXVNeHdEQUtvS0VoTmdpQkxFUGN5bHN5bzFoeHB2Y3c4L21sWGhm?=
 =?utf-8?B?UWRTanNwUDhjdUlIYjVIWWN3SUV3bEN2QVFPQ1A5Q1V5emttZWtNWjVGK1Y3?=
 =?utf-8?B?NVkrWjZTU2pWRXpzT1J0SGxzQlFxOW1sTkkvakZSQVJLZDZFMFZTNFJDZ05i?=
 =?utf-8?B?dmlBNk5nZHFjdUFTY2JVeThXMWJSTGEzNjJDWldDdE5oV0pkbTZobDJoWm9h?=
 =?utf-8?B?M2xyL0hsMkVsdWdwcTVBbjhYUlRzSWhSc0t4YS9NR0RIT21CZ1Y1OGVQdnpt?=
 =?utf-8?B?RFBaOSszdUdRc1A0dVU2d3dDUnZ5RUxOL2tEc0dSV05ISnpSVUlvSkMrZ0p2?=
 =?utf-8?B?bE9MWUZWK2Y0ZFFIaVkxSUZsQUlUMTlaRTQ1Skw3UVR6YlJjM0Y1cHFTOHVo?=
 =?utf-8?B?L0ZYcDIzcDF4ZEhjdnBqcEhET3NORHlwZytkSWdTMG1GWm02Tk15TDBDYlBG?=
 =?utf-8?B?RVVNWGJaUGdVSFN2K1lTa3BINkdTNGdTMjNZT1BlaE5DRks2WUp0ZS9sZHd0?=
 =?utf-8?B?TzBLOFNlbmVEMHZaTlhnNGtSU2Yyczh5ODRCaGpyREF4RDdxUDJnbjAvd0Nj?=
 =?utf-8?B?RDBha0pZb2tKT3dvbkJGSWc4QlJmazNJdEc2ejIyT1ozRGRmSWpSL0FEWGRr?=
 =?utf-8?B?N0cyN2hubXJSdUhORFZkNCtTamxQc3ZndUd3T01hUUJEVW00Q21PeFpFQnZ0?=
 =?utf-8?B?TTBVNmx0U2k5UTlQdnRPOER1OVlPOFNsYVA1V2RRanUyYUZiRmpsZC9MSVps?=
 =?utf-8?B?STdZcjFGKzQyWTNrb3BCTXVtUTR5Q2Q0ZnhrT0txdm5PNFVvOWtkc0YxRWlP?=
 =?utf-8?B?MVkwcCtzNE5RNHhTUWR6T1d6K0ZlUlcxS2Iwb21kVlEyQ090dlBtU2RSb1Nt?=
 =?utf-8?B?QWNTL0FvR3pBekEvUWx5bjRCY0kxMmlZWTJMemtaYU1WL1BRbjFINGVIT2la?=
 =?utf-8?B?OTJsSWowTGw5R0E4WC9CRUp0SHFLeVdTd0ZoMHhwVW5raXhqZ21uWUhZeDdl?=
 =?utf-8?B?VnFhNVdIdk4veEs0NDF2TGpTVHphZUpobC85S1Vac0p4TlhNdHBmSTAvTGZN?=
 =?utf-8?B?YWIvTWl5VG0rUGEwdVVhV0hWNFZkNlpJd1hXZEhtZTlNc1lEellmaWxoVDgz?=
 =?utf-8?B?Y051dzRnbHBoV2pmbGtrejU0SExQZHBZblJVaXkrbU5FQnY4MWJVd29lejBY?=
 =?utf-8?B?NU03U2poWng4bXZwNWM2U0hYbGx2WDR5ekwrTm1DZFhaZm42VkFJWVQ4M2dO?=
 =?utf-8?B?RzduL3MwZWVNeUVNWEI4eUhzVGlBZlJPSUJhVnNoODhZLzJHM3RERks3VVJJ?=
 =?utf-8?B?ZVlWeDJ4ZkZhRmU4dHp1dVpCS25ZdDVLMWlSM1pOSzN0MGljSEFGZ1JxQzBr?=
 =?utf-8?B?ZUFZYTB5bGh0RTZFK25nQzJYaGEwaGdRR1FKY1VtY1I0Mm51Qy9Jci9KcGRm?=
 =?utf-8?B?YWs4YUxLOTdsc3JCTXQrWDVtbTN4aU1YdkxMYnFBWEN1enV0Rk40MGtvQzZh?=
 =?utf-8?B?V3MrV292T2RYM3FENUxmTDBrejY3RU9sNWx6MzlDK2RDYnRzS0UrZ3RPZHJS?=
 =?utf-8?B?TDBvVnBOOUF0djg2NVJwbnZxa3hHWmNHc280dmhqSFh1YmdmRTVtODAzOSto?=
 =?utf-8?B?ZWdPZDFWRDlrYnRONTZzQVJuZ1h0R2JhMkJLN2hPaDZ1aythV3J6YTRyTVgr?=
 =?utf-8?Q?cmz/PCE6A7jKSx7q1Ibqjho+d?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848ebdca-f207-458b-86e1-08dba6df9f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 09:25:57.9159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9nF250UP8DwSvKYIGJ2PADK0sgLp/XSuE+bWd7CqDPw2YAApxe0P8bwBoOlfAnM1Ejy6QV0xCtGBR3xLct3Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_022608_166520_EB7DD7AD 
X-CRM114-Status: GOOD (  28.76  )
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

A gentle ping.
Any other comments or suggestions for this patch? Or maybe we would review it in the Linux 6.7 development cycle?

BRs,
Xiao

> -----Original Message-----
> From: Wang, Xiao W
> Sent: Sunday, August 6, 2023 6:24 PM
> To: Ard Biesheuvel <ardb@kernel.org>
> Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> efi@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH] RISC-V: Optimize bitops with Zbb extension
> 
> Hi,
> 
> > -----Original Message-----
> > From: Ard Biesheuvel <ardb@kernel.org>
> > Sent: Sunday, August 6, 2023 5:39 PM
> > To: Wang, Xiao W <xiao.w.wang@intel.com>
> > Cc: paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; anup@brainfault.org; Li, Haicheng
> > <haicheng.li@intel.com>; linux-riscv@lists.infradead.org; linux-
> > efi@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH] RISC-V: Optimize bitops with Zbb extension
> >
> > On Sun, 6 Aug 2023 at 04:39, Xiao Wang <xiao.w.wang@intel.com> wrote:
> > >
> > > This patch leverages the alternative mechanism to dynamically optimize
> > > bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
> > > Zbb ext is not supported by the runtime CPU, legacy implementation is
> > > used. If Zbb is supported, then the optimized variants will be selected
> > > via alternative patching.
> > >
> > > The legacy bitops support is taken from the generic C implementation as
> > > fallback.
> > >
> > > If the parameter is a build-time constant, we leverage compiler builtin to
> > > calculate the result directly, this approach is inspired by x86 bitops
> > > implementation.
> > >
> > > EFI stub runs before the kernel, so alternative mechanism should not be
> > > used there, this patch introduces a macro EFI_NO_ALTERNATIVE for this
> > > purpose.
> > >
> >
> > Why? The unpatched sequences work fine, no?
> 
> It works. But there would be build warning: orphan section `.init.alternative'
> from `./drivers/firmware/efi/libstub/gop.stub.o' being placed in section
> `.init.alternative'. Besides, w/o this MACRO, the optimized variant would
> never be used at runtime, so this patch choose to disable alternative.
> 
> BRs,
> Xiao
> 
> >
> >
> > > Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> > > ---
> > >  arch/riscv/include/asm/bitops.h       | 266
> +++++++++++++++++++++++++-
> > >  drivers/firmware/efi/libstub/Makefile |   2 +-
> > >  2 files changed, 264 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/bitops.h
> > b/arch/riscv/include/asm/bitops.h
> > > index 3540b690944b..f727f6489cd5 100644
> > > --- a/arch/riscv/include/asm/bitops.h
> > > +++ b/arch/riscv/include/asm/bitops.h
> > > @@ -15,13 +15,273 @@
> > >  #include <asm/barrier.h>
> > >  #include <asm/bitsperlong.h>
> > >
> > > +#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(EFI_NO_ALTERNATIVE)
> > >  #include <asm-generic/bitops/__ffs.h>
> > > -#include <asm-generic/bitops/ffz.h>
> > > -#include <asm-generic/bitops/fls.h>
> > >  #include <asm-generic/bitops/__fls.h>
> > > +#include <asm-generic/bitops/ffs.h>
> > > +#include <asm-generic/bitops/fls.h>
> > > +
> > > +#else
> > > +#include <asm/alternative-macros.h>
> > > +#include <asm/hwcap.h>
> > > +
> > > +#if (BITS_PER_LONG == 64)
> > > +#define CTZW   "ctzw "
> > > +#define CLZW   "clzw "
> > > +#elif (BITS_PER_LONG == 32)
> > > +#define CTZW   "ctz "
> > > +#define CLZW   "clz "
> > > +#else
> > > +#error "Unexpected BITS_PER_LONG"
> > > +#endif
> [...]
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
