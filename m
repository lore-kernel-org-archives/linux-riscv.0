Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576BDC05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=92hXqC7Vwvb6kEEF5+/gm06ayF+azGBtnmhSV5kmqd0=; b=oMEsaMYExQhbAL
	+H+L5cw6EALEhtYtkpbg4GGw1/qvo34MRxUSSVDYI8utXAg1J5PZNGrQoTQh8sBQSLP2IZsyay92Z
	8SwQdME4yoWQZL9uin5zKBB3H6Wwek7bp2PjgDQhp1A7swAvlxUV3/9sdK+5wgqkkULZnqa28Mlnh
	jwkp2LtMF2teNdSWxPcWd+xUZ7xdABWrtys2T9E6klIeCawMxUC55/JNgXaZqNQmLE9Oy7LJ+/WJj
	ew8yYBciQzPoWgmiSUeiDcPCau5aPwLOsIV/dkEfOn2yjkYB9I+bv6f4c4iqW7cx+yDb7voHN57zM
	zruzjr6gQ+C4xRagKhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS028-003AkN-2f; Tue, 14 Feb 2023 18:28:04 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS025-003AjT-89
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 18:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676399281; x=1707935281;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mG3iFmZSm2t1hjpNhfluGRFFUZZxyWrPFgo57emblz0=;
  b=VguxaI8wmGdN3xWoEA8ElAvQDWUTe5Q50EpHBaHTPOd4cyVMrhTfTCaZ
   tqa6R7GZHxScDa9KgMRB9CN7WwaiCKadAvakx0FZbzmXQkZnrljOsvp81
   YX4l5B40D4n27DI/xETW52+9csviYFJkuwEUkd0dfneUGAwGNvdXYj6vQ
   HPRgNxKo5WjraZKnEFdnIs9x2jXjR1el9aS5TZbDrfuOz2Y8imdEEK4pw
   ok8vwkXF60/NH3gxmOjdtzLOqJiET7mOketQ6oaxl2K4+CgwHa2L/HE20
   IO3QZnd8B1NBW3ncxZ2cNBMBGx1qj7YMNOQFAglYl0Co/zIBfrv2UrLL4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="319263250"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="319263250"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 10:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699623692"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="699623692"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 14 Feb 2023 10:27:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 10:27:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 10:27:57 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 10:27:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpsManetv2B2w8wOSXPDhsQeLCwTzTmULCpm/mY2BPePCwjXJU5uQxmN70PpVAPKh4w4rORcE9WIvicZ599iJAIkxDYdSRmrZwDIqfbDIWIG68tqBiLVpnNpqtDspDvX+r72Bcj89jZp0tsCo6q+Ky1fJ38xkSkRmdUGgkONeuXRLJH4UhypkZCDGCMIVkYDh17CASj8uX/scNuKeUS8p9fZq/RzeO6cStFsW9yx8vj5OAuNV8qtdwGD6YS1bxEFRqdYSymvb7H5YgVvLU5T2KlG37cGc8WN3mmd1fDxNaslO3kZcAYM9vPqa7439RA4YBdw4LC2x7Zf/l0vjZlF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG3iFmZSm2t1hjpNhfluGRFFUZZxyWrPFgo57emblz0=;
 b=ml3qD2OAHpNQKCVlvn1QfPZC3x2eAiFWe2O/nPlrCojo9kmfuHHECWwt24E7Mzc1LPf1sSlJAOnGIDn07E1klWaWSMTm/a96h/YNmXI2T5q7ydZctvHbsZS/BqAUzqzt4yHJTbeC8Qj5peyOxVqN+Azq1DpSvFbJ8ORS7GWuCyoIkbJKoNHWuL76LBsIi4uQpauld0WTdEDd1OwZSAngeMeLbJTa+B/qDDfGjD1sMv8QxLRABeHN/thyVmCWnRswSKeQiz+rqee19SezWWo6sCoo0SFKhSmmLp50XspfDmQ0lcj+2JI2iqvX+UGMhWuHllCiweX8+GOprgp+GTziOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1392.namprd11.prod.outlook.com (2603:10b6:300:24::14)
 by MN6PR11MB8169.namprd11.prod.outlook.com (2603:10b6:208:47d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Tue, 14 Feb
 2023 18:27:54 +0000
Received: from MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::d41f:9f07:ed56:a536]) by MWHPR11MB1392.namprd11.prod.outlook.com
 ([fe80::d41f:9f07:ed56:a536%3]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 18:27:54 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "david@redhat.com" <david@redhat.com>, "debug@rivosinc.com"
	<debug@rivosinc.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>
Subject: Re: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
Thread-Topic: [PATCH v1 RFC Zisslpcfi 11/20] mmu: maybe_mkwrite updated to
 manufacture shadow stack PTEs
Thread-Index: AQHZQG1Y+xNKbdAzOE6ESasRXNtyCK7Owz+A
Date: Tue, 14 Feb 2023 18:27:54 +0000
Message-ID: <cd9110241bf7d24137c306d83602a329412a1199.camel@intel.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
	 <20230213045351.3945824-12-debug@rivosinc.com>
	 <2d6eefb8-c7c5-7d32-9a75-ae716f828cd9@redhat.com>
	 <20230213143754.GC3943238@debug.ba.rivosinc.com>
	 <7693247c-a55d-a375-3621-1b07115a9d99@redhat.com>
	 <20230213200109.GA4016181@debug.ba.rivosinc.com>
	 <4c9e7ddb-b303-688a-5fc6-be83ca1a8a2a@redhat.com>
In-Reply-To: <4c9e7ddb-b303-688a-5fc6-be83ca1a8a2a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR11MB1392:EE_|MN6PR11MB8169:EE_
x-ms-office365-filtering-correlation-id: 06e09601-a816-4402-64db-08db0eb93033
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: udijy/MVMxv+w/VvcznG5rLN+r2F46ULadDmjuPmWxhefxvdUyxzr+pI7pDBoTDQ3adsGn6DhcoqNnyeqlsm51Z8WJSEKyJSM+BmUa9lrqwf2T31hARP1LE2cDOA7cRgQ5Ezyp1O5LPnfm3xtJYmx6akDiJh0BV2tVjbus+nmT8dogRcXgk7pcUJH3Qmu8/QBzJm1Ss7Zj86QgV/z84OL6SZG6JT4Mg4VT5Sm+VZuGZO0ko6CObHUudrOykwnA0AXglgIC4ZL9shrIXbBB1WrXdLK3KYYIlqM43TEgUY9z+/+0dr6TEOm07EfU7fv1r0V3mh/wFQvyvk3QWjo/oieR7Tg+k1BzFrlmmW+cV9bKlqPsNjq0ywZ4XmRvpJbbJmpqB6CxIJ/b5SMLM5kekjknrzBWZmsAn5icACrwdBx0J6OaBN2RgO/2vrJQ5FnGScy/DZOQnF6S55As3cvDoIF98XPyJB7kL0w06S3ebQyUPjnHEG/DIE6Q7a8k3/1ts3RgHDYKnAji1RYNfvMiEp4+KT+EAKb4mkJABeQqv/vtHmafVZSFDsaTBKfZdkX10lqy6OGqhcjCyIoMmp7q6+Py/eQyTzA39blkoMhFPOr0pubT5xrYiUTx6GjgjLhF8qrNMjtqu7u/iEi3jst+2ZEE4wh3U7/lC9JGJ7dEIX8f4N4+rFPaxqrR+ag9bPFsc1vxdHNpSOVG7xAw9eX/TLP+LZRomVa+/ogCgpQ5YmGEA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199018)(4744005)(2906002)(26005)(2616005)(122000001)(36756003)(71200400001)(38100700002)(38070700005)(86362001)(82960400001)(76116006)(316002)(8936002)(54906003)(110136005)(5660300002)(66946007)(4326008)(66446008)(41300700001)(66476007)(6506007)(64756008)(8676002)(6512007)(186003)(66556008)(478600001)(6486002)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWZ3b2F4c1NaZ0FaYmlYa1dIQlR4Tms4cHNPNlZMYTFaTHF6cDJHVVdsb2h2?=
 =?utf-8?B?YlpBSzAzUTdLSVlmMUM4S25Lb1JOVDlnYmtvMmVRZldpdVY0Z1IzVmtvdDVS?=
 =?utf-8?B?NEc2S3Vsd2pFb2ZodWc5YytxZTBUdVFnNG5YdG8xellmUlU0c0tDQzQvTXdE?=
 =?utf-8?B?NGJKOGFaWUdNUWtiVW9YWGpqTEs5bHRhWWp3c3kzWEdkSG1Mc3JBemhqMGxw?=
 =?utf-8?B?Rm5wRTAwMEZ0RjVuQ3YrakJzb2lCYTVjbHVjTUpDMVh0TW11K2RLcDZWMXFY?=
 =?utf-8?B?U0RsTVRUdGU0RFVybGFyNTJwWGUrS3MzbytZdHFUbnNNSXVDNXZRcU54SUJR?=
 =?utf-8?B?S2xxdUxQZzhnNmRiWGw5eDlJUEVaZHgwcmI2THFJUjdDL3U4cjZnbzhKT3Qy?=
 =?utf-8?B?dUFKNnNpcnh6WmJjQ1RHK2xQY1lFYzhJeEswalJiWXkxeUJCR3RhNnBQa3U2?=
 =?utf-8?B?M1BDeEp5aHdSbENYeWswa1NBSXZ6NjhuRjdvT2p0SmF3dEE3UG90aDNOMnRy?=
 =?utf-8?B?T0QrcWd1Mi9wZng5YVFzUEx4RnZtdmg4ZGJmekRkNzdhVmh3Tnk3amtWZ1FT?=
 =?utf-8?B?RnA5bjlkd0pRVHBXcmVOWU8xTUYzelNIM1BDalFhNjZrZ3FtSGh1a1VzZ1pk?=
 =?utf-8?B?OFY5bldNR3JlK2NIQi91cHFQamlxZ05aSzV4M0FPVnZlUnRJT0FoRWN5OGF0?=
 =?utf-8?B?QXliQ3U0YmdoaTdNWU53U3JYdXZDT3NxWHkzWE1TTnF4ZHVKWGNCTkd6d1RC?=
 =?utf-8?B?Y3c0eTEvT3RkeWJOUzIwNkJEY1VndHFEb0sxQVgyaEJmSU5xYjNZY0dIMUZL?=
 =?utf-8?B?WlNYZHkxQ3VWZk84ckJISGV3WFFLc0pneGltaloxYjlnMWwyTGlrT2EvNm5W?=
 =?utf-8?B?UjRXL0txRVdreEZWdmpvd2ZkaFR1cDlqMElBNVFDblV6aURTZ0UzYnY0T0Mx?=
 =?utf-8?B?R0ZjUGdRTC9VaVNPcDlTYkpzOGJyR1N3TE50NTloNlpoOUd3R3JnRThhWDNZ?=
 =?utf-8?B?SWZ2bzFFNDJhc21NZUQ5OWYzd2R6MFNyK2pnQnNUU0pMQ1JaQVVSbEoyVEdk?=
 =?utf-8?B?N3p4SUtFeHVxd3ltNDJpMnVhUFBGZkRFdjRNVENPZ2V0VFpIVWVDdkdBWXYz?=
 =?utf-8?B?UGJZdzMyWjhITnFjME5MQ0VsQlhGbUVTb203Q251cmFOSXNPd2VUVFo1bjhl?=
 =?utf-8?B?V2ZmSXZMeWlmTkRFYmk4TVQwQ1dWbHMyM0hTSVZWcDFkSVN6Mitad2xHVmhh?=
 =?utf-8?B?VU8xZU43MjJNNG16L1dZMTI0MUxncFEwejF1bngyaVlLMmFpM1F2MWRBa2ZF?=
 =?utf-8?B?blYrdUo2bE9zMU9FMTFHK2s4cjY5bmxXdWltNzVxNkJDbnN0VWs2V2NZZSto?=
 =?utf-8?B?S2lYN0djWEt0Zm9DVzNDTm9iR1A4QXhIUHI5bEIyS0NEd0NuNWVJZDIwSDht?=
 =?utf-8?B?aHhsQkJ0SjF0TVNoV3k4Slk2NE9sbmRsQ1hQY2FkTk5DYXpzWi9mbVFKL2M5?=
 =?utf-8?B?ci9IMHR3dE9PUVpsdGhMc0hBZXNXMmlmL2ZDeE4zN3VNL0VsWXczYUJmMHlS?=
 =?utf-8?B?dnJIams1QTZyYk05d2k0RnhaV3o2TVRIYkdPN2lja1dRVXB2VTl1UVN3dkZ0?=
 =?utf-8?B?dStRbDk1V05HaDV1Y2QxazF5MnJpMGMvYnhyRGVDdUhJOXZubnlpWFlKVGEw?=
 =?utf-8?B?RFJ0dVowb3FUWC9nc3NYaHZONUtIZmRTSC9IbGFFTzgxNzhCY1hDMFpKRkxk?=
 =?utf-8?B?M0VOSEczVUhzQ1lweTJOemZ0TGJIY2NXckpEclczdE5IUERJZDNMYWNpWEVV?=
 =?utf-8?B?Rno3Q2F4c2ZXUzI3K3g5dmxqRjUySnlwUVdPUk1RekJTd25sWmJpK1Q5clRB?=
 =?utf-8?B?ZzM5akw5R0RnbmNWODJ6ZC9tbkw3b3FoejgvTDJXKzY2RXRtSmxsbWx6K25N?=
 =?utf-8?B?aGdGS0JTNk4zQTd6UUt5M3dWbGN3MjgwTDgxTEZnR091Skl3QUZNa1pydEQ1?=
 =?utf-8?B?TTVtSlUrRTFvR1lDSFVYRkU4NXUvRjEzVkdEMm02K21BYVBXNHJBSEVrMkl5?=
 =?utf-8?B?ajZVTEU2RldZVzZGMG13SEJITFgxOTRab294REFmdXNjUnlwODNsWDBBTzFQ?=
 =?utf-8?B?RTdrV0RPQmIyeFh0K2FDYVJmSTZsM2c4VXR4UlJpdldERDk1bmE4eXZkblBM?=
 =?utf-8?Q?YNelRwZr5DXrsL1ysLaJZ7s=3D?=
Content-ID: <39B14D95F520D243ACB7EFED1211E7D0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e09601-a816-4402-64db-08db0eb93033
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 18:27:54.3001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O411nLZmAbeaNX14ejoXEGycm4YWis1gcMWs1Vw3uh35LSG6gghcS5jbeV6Nx9ERxPDMlloyMwyLXOgs31aDrenAGc9RhaDbzVB48hkYZf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8169
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_102801_339237_A32BA312 
X-CRM114-Status: GOOD (  10.37  )
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

On Tue, 2023-02-14 at 13:10 +0100, David Hildenbrand wrote:
> I assume Rick will have something to 
> play with soonish (Right, Rick? :) ).

Yes, Deepak and I were discussing on the x86 series. I haven't heard
anything from 0-day for a few days so looking good. There was
discussion happening with Boris on the pte_modify() patch, so might
wait a day more to post a new version.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
