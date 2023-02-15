Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A895C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 08:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKkBWKDKctr5K0l2DrDxZmPM3F6y5hvQ29pL/pg6BU4=; b=aOr4HsP7pY9r/c
	fTh9wd845dO2T5HBWTVCrO1fiegztHEXQiQtnHItyRv1gPWrT0tCU7mKdMoX//ZuiABpuCE1pLKPJ
	dbYZ1y5GfbOS2P61tZ9rC/yqVYYa1Y+6B4mC15OBir8eFs+kRqN1UGbk9akLdv1WofxwvwXCNWWH5
	6YQAieNfzXPeYLgk3mt6E9aEXgDJyY2ygyun6zFgbLditnYvzHy/DprgWerwQL3rM+IVy5R8oWXDh
	9C1A/3WTLzO8IUCs9rtQw8nnCFkOvUvru7RG+xYqeQsI3/cZ0TZGWaa3G3l/JzgSXZl06nO49js2I
	gqiKczwnFUmstfEmCP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDJE-005C0V-NQ; Wed, 15 Feb 2023 08:38:36 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDJB-005BzB-A5
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 08:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676450313; x=1707986313;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=+NeMeAfPp5YsWE8s5bfNx3Dh/B4ig04aa/qzhcv1jRs=;
  b=d9cW7je7dPHRsTaCI4UFZ5fi0XsUkqRfN2xKkO/KkEH3iCFJdmm/Y4Dw
   0HPepsjf7sRSyfi0yUW0BGKFV2NP4eavUhxBWWbiP8jhk7A32A3Fhkjhv
   MLM+s4f7kZMHBXuosrObeuXKNLfDDNCCsivCka4QVDsB2wcb/CQiRdFKs
   Y3XLS0irT2v765P/3TOnqkM9OxHCj+uCV0ayB5Y1x6O/eJWXqn/bONFYm
   hms6Ae4LjkFJMp1HsRIXB8l8Jg7jUIoljBsHH38d0bbeEI7NnHShSvhuC
   m5e1f2o7lfLhvCtyELXTgTBQpZSfcpu+ipRKnfIUwB8Go+VxvlKkLPXF1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333514466"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="333514466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 00:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671551435"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="671551435"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP; 15 Feb 2023 00:38:19 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 00:38:19 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 00:38:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 00:38:18 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 00:38:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvZXP5npQrz7d11cl8uhUVkitYlKjV3VwNB1bjjrpNUjnZWf0EedmKdRRDd52GrU1yqUgwH9ahdG9TtLI1XCJGepQLN5DETTnfO4ybKVxkwHytswx6I3TtvpfwynnhSTmZlJ5rQoZlWWX2jpOgc25x4GDAtDdVR3xgfeJ+KNQCJ4Kx/pQfvL2WSfS/sXaNhR1+BxgDtzjhppIa88x2B99JEDOoanjgu6kSkgQOJWJdm8G9E6wumhbXVXTAPURrrdlKpcZYxKVrpfp8VQp6nNrQsqFv5bQoz1/yt3bSOAhG7Q91QIlBqJpADLqseW72Hosr0duC9hbtR+64Lede0tuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NeMeAfPp5YsWE8s5bfNx3Dh/B4ig04aa/qzhcv1jRs=;
 b=iCQ5ysEIK5sbFGonbtCRPFuaLXxsLnn3ra3YqhRZ9rgL9A+0EGLYhyvjzJ7HUAhgaitLe/ybJ/Wjajd73NitArD/1Vsr8WIDKzj/jWvLB/9647tAUg31ZFvL0hiSTCT7KY9B3lOJSVF2h9J4WvVO/F9ueMz/d2ZbLr4VNPFnUbCkxqcNVLQa6qvyx7YpAwZL4FURNgx7z7UIYD5LtsXFSiAw4P531LzAoGgF03vF4z3QkOywXyit7RoqU+iHBvGPFT5o4grf/Uy5fPNZE7AUCI3nJKz50j9zoiBD36hcLtbVbEDnKS3iMtqbXfkZTp5ilwlsRQse10PVf5804R5vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 08:38:14 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 08:38:14 +0000
From: "Yin, Fengwei" <fengwei.yin@intel.com>
To: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "alex@ghiti.fr" <alex@ghiti.fr>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "willy@infradead.org" <willy@infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH 10/7] riscv: Implement the new page table range API
Thread-Topic: [PATCH 10/7] riscv: Implement the new page table range API
Thread-Index: AQHZQRjYwJoTyhH5Gk+Wwo0+4D7ZvA==
Date: Wed, 15 Feb 2023 08:38:14 +0000
Message-ID: <c02faf6e4af4babd24b3107d5fc2c6bff1d63100.camel@intel.com>
References: <20230211033948.891959-1-willy@infradead.org>
	 <20230215000446.1655635-1-willy@infradead.org>
	 <20230215000446.1655635-2-willy@infradead.org>
In-Reply-To: <20230215000446.1655635-2-willy@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4820:EE_|CY8PR11MB7731:EE_
x-ms-office365-filtering-correlation-id: 6b449fb8-f5f2-4343-a5c2-08db0f2ffab9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jaduBV3QFzIJxxHxJbgWIWuj9ClKrBAklZGiPdri6lv1h4fFMSXTBnjgr+VDVDhawE11M6O8rBaksRB9AWeZBT4dQrhR/Xb6DE0hrLP4LYtd9gmPIKDrVvX0mWsIMbRcd/mK8ROKYaoqLSOJIc74K+KLZLRAzeExWSHVDfCeZD197z4t86NorNvvgyjWwe3NihoBqx/ZXJp2DgbTx/7kAXK3RNA+Rmhh2E1ZBceNzwemlRcS9TPjJj1/esEEEmMUiNavgfYNNw/VIkF0Zo72OfMBjW+1VtZ+jVAVEWYOZjsTuQYRyJPjOP696GvZrWFNWecZmYnv4MPwxGE/RHJAhn5EU2xOEJOdUh/ZFxFBV1BofvD2FhEY2IbhCm+ecOpqdlmy7QtnaSQeY9v9yNauTNyMbZZgRHOJiekByxwMgmJXd3vrcImS/bBzJlidMl5YKc8H4KhHLgAyORNyYbcIjFzZJ2oOQny2a34BS2VckvhJW2dgUP3Ii4Z1SUobgSL/eeQm2qnEnmLr85AJ5LdUysiMOvYkUVbHmdNWJ63K5S0h/rSjN7u+aOUbBq+qI8RBpq9f4EpokFmkOzXiYCm9nwwwFnpctAyq/6peLZWLB7JKaNEJTTg7E8KtrWRDIB5EzAHdRfVK8SkmTcMurX8tdvN9X93xP3rNHpm6be1Op+FQiskw3tbdwp54/VhdvzXo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199018)(5660300002)(71200400001)(6512007)(186003)(26005)(6506007)(41300700001)(6486002)(2906002)(38100700002)(8676002)(38070700005)(8936002)(478600001)(86362001)(110136005)(66446008)(76116006)(316002)(66556008)(66946007)(64756008)(91956017)(66476007)(83380400001)(36756003)(2616005)(122000001)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmN2dXNEOHM2bnpDbTh4c1B5bDFKTXNrbFRBY2J3SGVrd29Xb2xhMzYvenh2?=
 =?utf-8?B?SCs4ZWlHNFYrTjd1U0Q1cllYR3JVOERyNExhVDhodjUwRzlvZXNxSGZwWGtk?=
 =?utf-8?B?NjR2Wlk4MHhVNjNHREZ4S29hV3hkaXFqVldCcWc2YWV6bjFZdlppUkRtdHVR?=
 =?utf-8?B?OVlHcG5GTmlWRVVRbENJTTRMdjJvUlZENzVFakNObHYrQUJaQnRMelY0NzAr?=
 =?utf-8?B?SXB1alZzZ0FCUk5zZGJrMFczTVNoNTBscHBza2NJZXJ2bGJpU2kxc0tkYVdF?=
 =?utf-8?B?NnM4UkttRUZQdjQrRVQ2dk9UM2ttdXVNUWU1aHJIaGk1bkxSdFVZajFsRmpl?=
 =?utf-8?B?cDNkbW9pSzk2SkJqUjZ5elRSaXYxbUxKRU9JZDdJa1p4emM0NWptVHlyMUVw?=
 =?utf-8?B?TDE1T0x2QSs4TWVxMjFBQzkvNkJOOFg5MGtGaFVYYmFlUnBuTzhVdE1ORlBy?=
 =?utf-8?B?SFoxMFY5YWdyUk5PMnhLaTZZWERzL0pwMjBrRTNIWi9FY2orY0NrVmQreVlL?=
 =?utf-8?B?bEFOTTNKc3QvYzJRQm5meTBuT2k2WEU0bHlpdTlNR2lMUjF2d1NtSEVKY29D?=
 =?utf-8?B?NnFZU0Rza0gvZU1JTWt5VlJNNUhiSVk3MnJDU2JLNXhSTkNwY3lZWUxzSGhE?=
 =?utf-8?B?RThjcys2QXV1MlZkQTZaa1hlNFBETWl1TDZZU1NhSEUyTkxkUDRCbWlpQmpR?=
 =?utf-8?B?aUlVdXdiU3MreWFyUDlIVS80STJqMXdwQ0xjS3RZOUlqTUlRWlFHWXd6YzJS?=
 =?utf-8?B?UG5ZRS8ydGtKLzZhdEp2OHA5TE9IVUJhbHo4ZjdYOGtwRXc4aXhza1hRanBY?=
 =?utf-8?B?ODJ4R1liMTI2aFpmc0VWcFRHZlZQWkxKZkkxUWpOR0VDUDcrajBxeXFrTW02?=
 =?utf-8?B?a29tSkFrUng3UVdKanJTWnpWV1ZEM1lZN3d5YkxnZzc1NE5WRUw5RGRpNE5s?=
 =?utf-8?B?bFpJUk80KzRFd0dQNzg3OWdQRkkrN0FXNnUvQXVWOGgreVBtaXBndVRkSmk0?=
 =?utf-8?B?bkovczg1Nnlpem50VnlqSFdrN2NueUZlT2hva2N4V2dNZVZ5b0FyOEdwS2lW?=
 =?utf-8?B?SGJVNVp3dlkrM0J0MGlnbkRVNTFuU0RLbjJFMW1zWEF2ZEVvaTluVDRpdXNS?=
 =?utf-8?B?ZTl3d3kvcWJPS0xOaVhzempXYUYyRGtjdFZTVU1wWFFOcUgzK0JZVUg1b0JM?=
 =?utf-8?B?cGI5TjRzcjZWMmIvZ3Q2SG9FMXc0RmlLSEdlK0dYRXVuTFJpdWNtd210R0FN?=
 =?utf-8?B?RjJQUmRkZU16NGo0V0ZXNG9wSWJJdjMrWFZ0VUZaMmNkVmcyT3lYWU9Vc0JS?=
 =?utf-8?B?eTFmY3RjOEhiekZKZzRtTXhSam4yN2JWQlBNNklXWVhVdW5WakV2TVlCTE1P?=
 =?utf-8?B?ajFSTW9RK2t4U3BLMW5WbTdKTFIwajV1VTNMNE16QmljZW96TERxbW9JUytp?=
 =?utf-8?B?QnluYmpXbWliODNFOUxtZFdjSk1GRlYxMVRtYllIbHRUWWZxb2wra0ZHRWxF?=
 =?utf-8?B?OVRNenZMejI5bXV2WXVOeG1XTWxRNHFjN29lZ1JXbG9xOG9iRVdBV0t0ekcr?=
 =?utf-8?B?Nm1Kc3RlU3hSS3g0ZzBZeUU5SHBOdWFvUFk5SWF5R1N6NHYzR3REOFJnSDcy?=
 =?utf-8?B?bGdCZTU1aC9UQXZQLzlwbEhidUh5d2d0bk1RbEthMHZFUWZFMXpwRVFvMXhX?=
 =?utf-8?B?UE9yRlpzL1gwc2VHOXh4RnNSUzlld3YwbS83YnFDcFFPVnpLOXJTd1UzZUV3?=
 =?utf-8?B?WTNxRDViWXJvWFdIdEl6L25XbUkrNnNxTGpqdDcvcmNtSEt2bVZJSWFtamtF?=
 =?utf-8?B?cXl0cDdhZnZjL3NuZTJRWDZRWWVSSkkvak9vWVRVL21VbThZUlBvODNaUjB3?=
 =?utf-8?B?WThpMHlNeFV4UjNpWEJtQjM1ZzdBUGNRQ0ozQnR1MXRCM3k1NVlDcTg0Y2Yw?=
 =?utf-8?B?a1VOZFlkWlFiVTlpbkFtME1WVHpBZ3hlbGFCWDQwTnBXR2RoQ0ZaVDAramZW?=
 =?utf-8?B?dWFHZjFIWEkzM2NDQWN4eE1lYzQ2TjNpUDN0ODY2a0NqU2RWTUlIS2xrc2Ni?=
 =?utf-8?B?WnVMWms4VGxYSzNSaSszNDQ1UkM0MllTTnltYzd2UVdJUnFqTEoySTFzK0Fh?=
 =?utf-8?B?UFZtQmVzU3dXYnI5UUZlK1ROT1B4V1Z4WjdOak1Wc3ZLQTJKenRKMlJmOG8w?=
 =?utf-8?B?dlE9PQ==?=
Content-ID: <FF5529036FFD404FA61E0DE011290216@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b449fb8-f5f2-4343-a5c2-08db0f2ffab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2023 08:38:14.7094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/sOVgo+1m1mt1UB+XLOLmubH+ndJ4W+icZosFomY2MLfg+tN4nFIcBM35CcjH+XrH02UCZNGclRmnxZK/3yyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_003833_513482_EBF6A8CC 
X-CRM114-Status: GOOD (  22.06  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIzLTAyLTE1IGF0IDAwOjA0ICswMDAwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xl
KSB3cm90ZToNCj4gQWRkIHNldF9wdGVzKCksIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2UoKSBhbmQg
Zmx1c2hfZGNhY2hlX2ZvbGlvKCkuDQo+IA0KPiBUaGUgUEdfZGNhY2hlX2NsZWFyIGZsYWcgY2hh
bmdlcyBmcm9tIGJlaW5nIGEgcGVyLXBhZ2UgYml0IHRvIGJlaW5nIGENCj4gcGVyLWZvbGlvIGJp
dC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2lsY294IChPcmFjbGUpIDx3aWxseUBp
bmZyYWRlYWQub3JnPg0KPiAtLS0NCj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1
c2guaCB8IDE5ICsrKysrKysrKy0tLS0tLS0tLS0NCj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L3BndGFibGUuaMKgwqDCoCB8IDI1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gwqBhcmNo
L3Jpc2N2L21tL2NhY2hlZmx1c2guY8KgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrLS0tLS0tLS0t
DQo+IMKgMyBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaA0K
PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oDQo+IGluZGV4IDAzZTNiOTVh
ZTZkYS4uMTBlNWU5NmYwOWI1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2guaA0KPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2gu
aA0KPiBAQCAtMTUsMjAgKzE1LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF9p
Y2FjaGVfYWxsKHZvaWQpDQo+IMKgDQo+IMKgI2RlZmluZSBQR19kY2FjaGVfY2xlYW4gUEdfYXJj
aF8xDQo+IMKgDQo+IC1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0
IHBhZ2UgKnBhZ2UpDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX2ZvbGlvKHN0
cnVjdCBmb2xpbyAqZm9saW8pDQo+IMKgew0KPiAtwqDCoMKgwqDCoMKgwqAvKg0KPiAtwqDCoMKg
wqDCoMKgwqAgKiBIdWdlVExCIHBhZ2VzIGFyZSBhbHdheXMgZnVsbHkgbWFwcGVkIGFuZCBvbmx5
IGhlYWQgcGFnZQ0KPiB3aWxsIGJlDQo+IC3CoMKgwqDCoMKgwqDCoCAqIHNldCBQR19kY2FjaGVf
Y2xlYW4gKHNlZSBjb21tZW50cyBpbiBmbHVzaF9pY2FjaGVfcHRlKCkpLg0KPiAtwqDCoMKgwqDC
oMKgwqAgKi8NCj4gLcKgwqDCoMKgwqDCoMKgaWYgKFBhZ2VIdWdlKHBhZ2UpKQ0KPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFnZSA9IGNvbXBvdW5kX2hlYWQocGFnZSk7DQo+IC0N
Cj4gLcKgwqDCoMKgwqDCoMKgaWYgKHRlc3RfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBhZ2UtPmZs
YWdzKSkNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsZWFyX2JpdChQR19kY2Fj
aGVfY2xlYW4sICZwYWdlLT5mbGFncyk7DQo+ICvCoMKgwqDCoMKgwqDCoGlmICh0ZXN0X2JpdChQ
R19kY2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgY2xlYXJfYml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFncyk7DQo+IMKg
fQ0KPiArI2RlZmluZSBmbHVzaF9kY2FjaGVfZm9saW8gZmx1c2hfZGNhY2hlX2ZvbGlvDQo+IMKg
I2RlZmluZSBBUkNIX0lNUExFTUVOVFNfRkxVU0hfRENBQ0hFX1BBR0UgMQ0KPiDCoA0KPiArc3Rh
dGljIGlubGluZSB2b2lkIGZsdXNoX2RjYWNoZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQ0KPiAr
ew0KPiArwqDCoMKgwqDCoMKgwqBmbHVzaF9kY2FjaGVfZm9saW8ocGFnZV9mb2xpbyhwYWdlKSk7
DQo+ICt9DQo+ICsNCj4gwqAvKg0KPiDCoCAqIFJJU0MtViBkb2Vzbid0IGhhdmUgYW4gaW5zdHJ1
Y3Rpb24gdG8gZmx1c2ggcGFydHMgb2YgdGhlDQo+IGluc3RydWN0aW9uIGNhY2hlLA0KPiDCoCAq
IHNvIGluc3RlYWQgd2UganVzdCBmbHVzaCB0aGUgd2hvbGUgdGhpbmcuDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oDQo+IGluZGV4IDEzMjIyZmQ1YzRiNC4uMDM3MDZjODMzZTcwIDEwMDY0
NA0KPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaA0KPiBAQCAtNDA1LDggKzQwNSw4IEBAIHN0YXRp
YyBpbmxpbmUgcHRlX3QgcHRlX21vZGlmeShwdGVfdCBwdGUsDQo+IHBncHJvdF90IG5ld3Byb3Qp
DQo+IMKgDQo+IMKgDQo+IMKgLyogQ29tbWl0IG5ldyBjb25maWd1cmF0aW9uIHRvIE1NVSBoYXJk
d2FyZSAqLw0KPiAtc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGUoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsDQo+IC3CoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgYWRkcmVz
cywgcHRlX3QgKnB0ZXApDQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9y
YW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QNCj4gKnZtYSwNCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXAsIHVuc2lnbmVk
IGludCBucikNCj4gwqB7DQo+IMKgwqDCoMKgwqDCoMKgwqAvKg0KPiDCoMKgwqDCoMKgwqDCoMKg
ICogVGhlIGtlcm5lbCBhc3N1bWVzIHRoYXQgVExCcyBkb24ndCBjYWNoZSBpbnZhbGlkIGVudHJp
ZXMsDQo+IGJ1dA0KPiBAQCAtNDE1LDggKzQxNSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdXBk
YXRlX21tdV9jYWNoZShzdHJ1Y3QNCj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gwqDCoMKgwqDC
oMKgwqDCoCAqIFJlbHlpbmcgb24gZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVsdCB3b3VsZCBz
dWZmaWNlLCBidXQNCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBleHRyYSB0cmFwcyByZWR1Y2Ug
cGVyZm9ybWFuY2UuwqAgU28sIGVhZ2VybHkNCj4gU0ZFTkNFLlZNQS4NCj4gwqDCoMKgwqDCoMKg
wqDCoCAqLw0KPiAtwqDCoMKgwqDCoMKgwqBmbHVzaF90bGJfcGFnZSh2bWEsIGFkZHJlc3MpOw0K
PiArwqDCoMKgwqDCoMKgwqBmbHVzaF90bGJfcmFuZ2Uodm1hLCBhZGRyZXNzLCBhZGRyZXNzICsg
bnIgKiBQQUdFX1NJWkUpOw0KDQpUaGUgZmx1c2hfdGxiX3JhbmdlKCkgb2YgcmlzY3YgaXMgYSBs
aXR0bGUgYml0IHN0cmFuZ2UgdG8gbWUuIEl0IGdpdmVzDQpfX3NiaV90bGJfZmx1c2hfcmFuZ2Uo
KSBzdHJpZGUgUEFHRV9TSVpFLiBUaGF0IG1lYW5zIGlmIChlbmQgLSBzdGFydCkNCmlzIGxhcmdl
ciB0aGFuIHN0cmlkZSwgaXQgd2lsbCB0cmlnZ2VyIGZsdXNoX3RsYl9hbGwoKS4NCg0KU28gdGhp
cyBjaGFuZ2UgY291bGQgdHJpZ2dlciBmbHVzaF90bGJfYWxsKCkgd2hpbGUgb3JpZ2luYWwNCmZs
dXNoX3RsYl9wYWdlKCkganVzdCB0cmlnZ2VyIGZsdXNoX3RsYl9wYWdlKCkuDQoNCk15IHVuZGVy
c3RhbmRpbmcgaXMgZmx1c2hfdGxiX3BhZ2UoKSBzaG91bGQgYmUgYmV0dGVyIGJlY2F1c2UgDQpm
bHVzaF9wbWRfdGxiX3JhbmdlKCkgaGFzIFBNRF9TSVpFIGFzIHN0cmlkZSB0byBhdm9pZCBmbHVz
aF90bGJfYWxsKCkuDQpJIG11c3QgbWlzcyBzb21ldGhpbmcgaGVyZS4NCg0KUmVnYXJkcw0KWWlu
LCBGZW5nd2VpDQoNCj4gwqB9DQo+ICsjZGVmaW5lIHVwZGF0ZV9tbXVfY2FjaGUodm1hLCBhZGRy
LCBwdGVwKSBcDQo+ICvCoMKgwqDCoMKgwqDCoHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2Uodm1hLCBh
ZGRyLCBwdGVwLCAxKQ0KPiDCoA0KPiDCoCNkZWZpbmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9U
TEINCj4gwqAjZGVmaW5lIHVwZGF0ZV9tbXVfdGxiIHVwZGF0ZV9tbXVfY2FjaGUNCj4gQEAgLTQ1
NiwxMiArNDU4LDIxIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9wdGVfYXQoc3RydWN0DQo+
IG1tX3N0cnVjdCAqbW0sDQo+IMKgwqDCoMKgwqDCoMKgwqBzZXRfcHRlKHB0ZXAsIHB0ZXZhbCk7
DQo+IMKgfQ0KPiDCoA0KPiAtc3RhdGljIGlubGluZSB2b2lkIHNldF9wdGVfYXQoc3RydWN0IG1t
X3N0cnVjdCAqbW0sDQo+IC3CoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3Qg
KnB0ZXAsIHB0ZV90IHB0ZXZhbCkNCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcHRlcyhzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZw0KPiBhZGRyLA0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZXZhbCwgdW5zaWduZWQgaW50
IG5yKQ0KPiDCoHsNCj4gLcKgwqDCoMKgwqDCoMKgcGFnZV90YWJsZV9jaGVja19wdGVzX3NldCht
bSwgYWRkciwgcHRlcCwgcHRldmFsLCAxKTsNCj4gLcKgwqDCoMKgwqDCoMKgX19zZXRfcHRlX2F0
KG1tLCBhZGRyLCBwdGVwLCBwdGV2YWwpOw0KPiArwqDCoMKgwqDCoMKgwqBwYWdlX3RhYmxlX2No
ZWNrX3B0ZXNfc2V0KG1tLCBhZGRyLCBwdGVwLCBwdGV2YWwsIG5yKTsNCj4gKw0KPiArwqDCoMKg
wqDCoMKgwqBmb3IgKDs7KSB7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX3Nl
dF9wdGVfYXQobW0sIGFkZHIsIHB0ZXAsIHB0ZXZhbCk7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBpZiAoLS1uciA9PSAwKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcHRlcCsrOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRkciArPSBQQUdF
X1NJWkU7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGVfdmFsKHB0ZXZhbCkg
Kz0gMSA8PCBfUEFHRV9QRk5fU0hJRlQ7DQo+ICvCoMKgwqDCoMKgwqDCoH0NCj4gwqB9DQo+ICsj
ZGVmaW5lIHNldF9wdGVfYXQobW0sIGFkZHIsIHB0ZXAsIHB0ZSkgc2V0X3B0ZXMobW0sIGFkZHIs
IHB0ZXAsDQo+IHB0ZSwgMSkNCj4gwqANCj4gwqBzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2NsZWFy
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLA0KPiDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBh
ZGRyLCBwdGVfdCAqcHRlcCkNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVz
aC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMNCj4gaW5kZXggM2NjMDdlZDQ1YWViLi5i
NzI1YzNmNmY1N2YgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jDQo+
ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jDQo+IEBAIC04MSwxNiArODEsOSBAQCB2
b2lkIGZsdXNoX2ljYWNoZV9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgYm9vbA0KPiBsb2NhbCkN
Cj4gwqAjaWZkZWYgQ09ORklHX01NVQ0KPiDCoHZvaWQgZmx1c2hfaWNhY2hlX3B0ZShwdGVfdCBw
dGUpDQo+IMKgew0KPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcGFnZSAqcGFnZSA9IHB0ZV9wYWdl
KHB0ZSk7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBmb2xpbyAqZm9saW8gPSBwYWdlX2ZvbGlv
KHB0ZV9wYWdlKHB0ZSkpOw0KPiDCoA0KPiAtwqDCoMKgwqDCoMKgwqAvKg0KPiAtwqDCoMKgwqDC
oMKgwqAgKiBIdWdlVExCIHBhZ2VzIGFyZSBhbHdheXMgZnVsbHkgbWFwcGVkLCBzbyBvbmx5IHNl
dHRpbmcNCj4gaGVhZCBwYWdlJ3MNCj4gLcKgwqDCoMKgwqDCoMKgICogUEdfZGNhY2hlX2NsZWFu
IGZsYWcgaXMgZW5vdWdoLg0KPiAtwqDCoMKgwqDCoMKgwqAgKi8NCj4gLcKgwqDCoMKgwqDCoMKg
aWYgKFBhZ2VIdWdlKHBhZ2UpKQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcGFn
ZSA9IGNvbXBvdW5kX2hlYWQocGFnZSk7DQo+IC0NCj4gLcKgwqDCoMKgwqDCoMKgaWYgKCF0ZXN0
X2FuZF9zZXRfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBhZ2UtPmZsYWdzKSkNCj4gK8KgwqDCoMKg
wqDCoMKgaWYgKCF0ZXN0X2FuZF9zZXRfYml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFn
cykpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmx1c2hfaWNhY2hlX2FsbCgp
Ow0KPiDCoH0NCj4gwqAjZW5kaWYgLyogQ09ORklHX01NVSAqLw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
