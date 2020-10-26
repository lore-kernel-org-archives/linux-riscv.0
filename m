Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D575C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 20:17:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D83F121BE5
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 20:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y3bt5PCG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="a/vPDPRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83F121BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zCiDYdYCq/CAcgVB4nPg3S/b2BeiFLQRn0//6yVlVWM=; b=Y3bt5PCGWeOZX5je+aOEjDJ/x
	+1/Sc8S7ZLP6NN5VvBG6cOEXEJ75517EAutDc63s1KvJrtBhC6PfsTZQZSMCJ8MQoO2MS59bZWKmQ
	GQzz69DwyQKodxse3nLbhslYmhHrTdgRMcaa7WkvrvBIgHJGe2H7jwrhzY6vZGGHKdgm4kdSn9a4A
	Ocb7z9+R1g09l/9909eov+zshyCIWqy3cfgveYt+4XWun0w+WajOA1wYiMLiAjOm9NsJgvNWvW/gE
	jTgjUHfwUp2GdmTKxddOt695jCurJLYoEV36glDUHXbF+OF4CMZH/9WMRJEROh0LdwDm3KzSdCKxv
	zV5lLpXmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX8vT-0000Vg-UO; Mon, 26 Oct 2020 20:17:07 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX7kc-00033u-B3; Mon, 26 Oct 2020 19:01:58 +0000
IronPort-SDR: ErKRzzb0+QR7Xah6BJ7TPwaBFNVT4aIPKagzpy2OLCbCfMjN4KFNs2iRf74bo5GFHeN5DoIEIf
 8pyytbOTuFTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="168098491"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="168098491"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 12:01:43 -0700
IronPort-SDR: /LvAuZbLvD6Jvn9XarAI6t4jv68vg40z1gd1G6s27lG0HpIFmmXo6VIa/tcJuJPCuhhv7Cehoo
 yfD8/a9H8UOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="350225103"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 26 Oct 2020 12:01:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 12:01:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 12:01:42 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.52) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 12:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LuzxFyrqQ3jZEIUkcXjWBLXOn2GZxsTx/5H2yyUdRFU/FToBvNKnY6DzxvcKPPz+A1uIMUprJPely4hxqJ/ZTONP0zG4NkrC++hzH20lQ8As6b8oiovqtUz8yNoNkOcCozfXkrXnWc7dbPxWDoOk+fmkChVhKvUJS0Mw1hxIYdqgHrSKb6fzS3OcW8xRBAAsxnKcoCVj062wkcKyvawQeNPWB2RRVNdFXtqIdX38LkyHtK4ppwuXyz8Z7uozcBBujVrqRt936Tx6c5TtDVyBMDuSOncWIRpKNKkoc5fNYh1Kr1kQXIp4Jc3crztKgtWVEdZpt93IUZgYSO0xu/y0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NF4yvjjQB60CAJBcKIBIEO1nVtwTjUfRE/w5vohYrI=;
 b=jMUDMOWys4S2AhJH8GEll7NvGz8zrgcGGWbi3ZCeCY+3BV9ySkDOxdTw2oHgdBJF4EEzwhlb+qhu+p3vYSgoO7GUtO18z2swSJLKT+i9fWcZsEMC3MMzJN6ZCTyYuU/YFAjjE/+R+bxa8RkngZJZOU8HXIWAfIY3nRh7vVD2YFWC2WSwX1x8H1WD51UvqsEGpqPMnw/6zaOk3S86XVwmJ7+hkVyWVcnafXkAcZI704YGN3PnpghzzDx0BUUOSgUXqH+1O1PQY5s5Foxt9zTyDBPwhav2sqnudKL+u91l1KMdAQIBXZG4WIjUI1stJ4DYzrMSqImuGMkzsd/cmrZbOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NF4yvjjQB60CAJBcKIBIEO1nVtwTjUfRE/w5vohYrI=;
 b=a/vPDPRDw6TAI0lz1+iQ0esBQZ57gZlojlfS01XNHQfGuqTpUx3l6aCrJE5VVaWAOo+/tmLnb2tIQ/73GVsVkenyde5M48EqsP3AJNk2EujjRDsHb/AOy/wnUzx9uVhetsf2wDV9ajtkW+0bbuD/C7XRPXRJfRwEyxNHFa0Ow8E=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 19:01:36 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 19:01:35 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v7 3/7] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
Thread-Topic: [PATCH v7 3/7] set_memory: allow set_direct_map_*_noflush() for
 multiple pages
Thread-Index: AQHWq3OMPAgNCAY0I0aqf226x9KmgKmqPfEA
Date: Mon, 26 Oct 2020 19:01:35 +0000
Message-ID: <e754ae3873e02e398e58091d586fe57e105803db.camel@intel.com>
References: <20201026083752.13267-1-rppt@kernel.org>
 <20201026083752.13267-4-rppt@kernel.org>
In-Reply-To: <20201026083752.13267-4-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 831d0aab-984e-43ca-be4f-08d879e18fb6
x-ms-traffictypediagnostic: SN6PR11MB2670:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2670C2AD587A0AACDA0CF33FC9190@SN6PR11MB2670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MKYgs+I9xgTiUbv3g7/pOUCPlxP8y79v/91bAdNHzvQUCnYjszS7bQud6ytGBh/w3IUbo6qd54D8tHJS2Ix/gNIUhlnTBo/eBivyUYPOjLzbc9EaSL+kS3f6xk+9o8UlYEZEwYZsY71IXsMl6jba0hChhJebhReDe/6SnTSdhzOpzoFT2ynD5YOoo9Hv6P8oYxbBm5kYfRNC4Iprzv1HTwIzmSSwwKTdqT1B6FflZzSzwLFLCrX+ZLi9g03zKUeI1iWRP1Gg3+QxHXGoEPrX4vlq8F9WGroaklI7WFG3dfK+4Jf/MI4tmKV7161uhR8ZOUF+AjC9D3eCKv79tIpUFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(71200400001)(76116006)(478600001)(91956017)(2906002)(4326008)(4744005)(110136005)(66476007)(64756008)(5660300002)(54906003)(66446008)(66556008)(316002)(66946007)(8676002)(6512007)(7406005)(6506007)(86362001)(4001150100001)(6486002)(26005)(36756003)(186003)(7416002)(8936002)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: leddIN0yhCwx9tLT5sYtS3UgyYJuD7WN9DKkliWAgkoEmVlV3tuZsPdMFAtS1nljzuk/TAD0JOqeWjwmorvc+AWraLTrqKvm8j69SQ1QpdyRnl9PSnTqdpDitQ+dvexG1zHnWPlv5nB29XzlxOuQnCfLHJtVuwxaGS+x6iRYij4/RqFj8e11OWjrlPr7C+3azU/OFQAOTtb61CrYr2Rsq/PvYUiQDMzEXCW5w1EVvrV//pKCwOGOZ9UnaFb1jEDOXkx4PTnJaS+nr9ZBa3VRK0fnhBt2NRcLZ0dywY6MPuxHH5il0FC2jozPi4dAND25Wock+ARXuGodHwf6CTWkJ+1/saFiPUc6nvzulG1QDR/6ktmfj19ipvYCZpc1db+AmzOMSsTkf2+ZGTQdsYYgMCNdxQQtSeBACLTsAmOyGTaqFXarFFnL7GKRezCVsDLg1MP2TeVx8T/hPFEDWCHmi0HJUHi0kMt9H5QhZOT1zCOfW0KB4Cig4OOS/NuetkNSfgcLO4Np6WFgqUU8wSKjqISFyFsaS9ugj1jxiyk3V0+zTkOLNQ+5NgCIVTlBOpQ7oPR1dtnxQKmOcaQd1gH8yqD6ql8ThgGYmvuVXSVncQuNz3CM9aOWQKVrUIp4EBhgtmxAximFQh+zNGZEeEjHew==
Content-ID: <BE9967912813C94AB3CCC9D15F421100@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 831d0aab-984e-43ca-be4f-08d879e18fb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 19:01:35.7336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OFvFgsbvKk5OlWUhRYxyvk8h4UP51JQ11V7igFujnoGjPLjKuXbz46Goc36uMgxgWvORz+8dOFaOcMS7xeYMxXwwimc4KDLOSgZgFDlImew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2670
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_150150_583277_459E6E3E 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "cl@linux.com" <cl@linux.com>,
 "shuah@kernel.org" <shuah@kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Reshetova,
 Elena" <elena.reshetova@intel.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "tycho@tycho.ws" <tycho@tycho.ws>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "will@kernel.org" <will@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
 "willy@infradead.org" <willy@infradead.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "mtk.manpages@gmail.com" <mtk.manpages@gmail.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-26 at 10:37 +0200, Mike Rapoport wrote:
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2184,14 +2184,14 @@ static int __set_pages_np(struct page *page,
> int numpages)
>         return __change_page_attr_set_clr(&cpa, 0);
>  }
>  
> -int set_direct_map_invalid_noflush(struct page *page)
> +int set_direct_map_invalid_noflush(struct page *page, int numpages)
>  {
> -       return __set_pages_np(page, 1);
> +       return __set_pages_np(page, numpages);
>  }
>  
> -int set_direct_map_default_noflush(struct page *page)
> +int set_direct_map_default_noflush(struct page *page, int numpages)
>  {
> -       return __set_pages_p(page, 1);
> +       return __set_pages_p(page, numpages);
>  }

Somewhat related to your other series, this could result in large NP
pages and trip up hibernate.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
