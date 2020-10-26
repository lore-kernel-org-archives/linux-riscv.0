Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADC5C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 18:06:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A95822222C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 18:05:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SH9FBrbe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="UbYscDRF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A95822222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uXZGArmwUNwRhmzDoX0AKurhqyu6D/bsWy9Ou2BWeB0=; b=SH9FBrbeg5y+k2ILD8XSoKH2+
	Z3duIGLi6rj8o+9m6Gjhd/pUjRLWK/7KkY7MKL/7Hx6FEfToBaSRsyFl6YFG0TEmSSlVsOe2hGUi6
	VEsaIUYTi2Z0oR7NSk1eGgDA4eVNd9yrUvksu1sGYrhuUXAKoCTeQrJ3I8WVVGhVEwiFDS5gEwp+L
	U7thyn+WVWsZB5r4Zd4GTIOTNqCJDNYdVzFKnIbCT+5IpE2+nujd76yqZi4m/Z69nlgQBi3CNwRCX
	23LneTijvSSOnVeuB90H6tjA6sVqqLtVif6rjga2J+hZts5QcBmfHxw4WwBVHuS6h+dD+XWyq4Y7W
	mevECLVnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6sL-0004Sb-HH; Mon, 26 Oct 2020 18:05:45 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6sE-0004Mz-QS; Mon, 26 Oct 2020 18:05:42 +0000
IronPort-SDR: Nzpe9XJwNDbdOAt2eyxyROyRB3ayi3/frfeNb1krBtC7VXF2AsMckYsHvQT/vqWndS/GrBt2jM
 YcVwAkplcmZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="168066221"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="168066221"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 11:05:35 -0700
IronPort-SDR: Uc8K+VFVZ93aVM/70+ctVCa853/stfzAFxIAPyYpUo5uk2WnhoTIb5snEL1Sv8PyU2Z6/3gbmM
 Wks/iF1281vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="349992430"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 26 Oct 2020 11:05:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:05:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:05:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 11:05:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 11:05:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtvjJ1BfbAxGwy8/BIXUTBnOWEa+Sb1xd3bT23USlqbYSJnJ1fMoDe5JkmeRdafXD3l2l5a8nm/0hjCaz7bBZ/JVVtfso6sLMrN+PQCnz8c2kk0hFnBolhFdQoeHMTnYG9G1xsRNcExnlbymrJsiGg/hHJ/amBOpd00CM2dH7kxNeImzlXxGE5ieCUrHBS0m0sWyTQqXe0d2CQoZh+CPwu2vdNl8tX88Vdk6pOawDHP0l07YlrIeb2jE4vAx86JQF1FDxJCVFT0pti9Iy8CdIeQnYY9ljR75BkyRBw2MNQ9P40woBt4DYXIuxXPuQZPJ4j78q3SGOg90i7WOKge00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI9SKFxZvC9/fJMUywS0/LT7gv1p6aMQH877Grvd/0Q=;
 b=LPwvjbIXl3L0TPRnC+uP5vycj8P2NKiNL3oZMQXhB6qQE7RYivjibIBkZ7l2Gf712OOr36PWob0nQSj1fs/PPyRQpULX4pZClkXBSl6GtuPst2TGgxqHPorjT40dXdqdoy0gczubGMNk9E6docx7YPzK93Pu0TxNmaZmAAG2RWLyiek4us8AyuxMh5+fnNHpsU4CynY/7DRoucWWHUB++W9rP1+2uXdwO6mbT1tZswm49oE3is3b8jhSyxAxGwl4+/wWFsJo/uYV1jr9Jjxh1TzVAIhTBNHcbLuK4sMlVuoP8Xlb7ZFHZB7ID1C3EbFdDlCDgrF6VHExq51wj6UMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pI9SKFxZvC9/fJMUywS0/LT7gv1p6aMQH877Grvd/0Q=;
 b=UbYscDRFf13GafA72jxAfFhbWgsANwlb6qLyXctmu4QYM8hqNQgaggPIpfbkYMj5FwmCr8RHlw+jfGkddvRbUVFVjguQayZJvU3n7jeCSbq0NLm6mXMbzwdK0jlwQI92L6phrSjZnqNf0imFLFxFQaAi9qXJUxb7hiCEgv59sMo=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Mon, 26 Oct
 2020 18:05:31 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 18:05:31 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAA==
Date: Mon, 26 Oct 2020 18:05:30 +0000
Message-ID: <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
In-Reply-To: <20201026090526.GA1154158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 757383ae-c314-4130-c79f-08d879d9ba6c
x-ms-traffictypediagnostic: SA2PR11MB4956:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB4956DFBF6DC6124E41B60183C9190@SA2PR11MB4956.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8gugbyRvXc1FrYJthS1/KT7bV9ujecCUln/j9Asi874O5De+jDJCp3Mg3Mqc08gZS0nrTjv/qATfmpl8zNTGEngCbaKVGgbQJ5ZhvZ2dUnKTxr9mVHf8eJoYvhK2CTtV9ymJtfnUdpePeecN0j1nn7fDuQ+HRo5CirpCXUlVplqx3HbimIxVrh3ha2TTweL0gsLxP4OGYdfut1gzM49h0aNEM/VJxflWtswXo3PgJcPxBU5SdD2J4NO1AYOtapw/sFmIJU6TzyYAavyvL/UsdLdTvvAJUWG3AaqUcOMohZY3liD3aZwdM6ook6jPtoDN4i41E6feO/szdnDABEkNRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(66476007)(66556008)(66946007)(186003)(83380400001)(91956017)(478600001)(316002)(66446008)(26005)(54906003)(2616005)(6486002)(6506007)(71200400001)(64756008)(36756003)(7416002)(6916009)(6512007)(4001150100001)(76116006)(4326008)(5660300002)(2906002)(8936002)(7406005)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: u6Y97UyC5dfZkZY5bjEaYRgqOLONgvzb75mSLbCRug2w34dlOkPVpWXAFRiUyj5/JhyOA8CdqditoYx2UpExek/EwoHuyCHm6pXa11HyKW0Iwrvn4WTdcyjxTGPp0JydnYay1YuM4KeCWP4oZkLNdPAHdJEKyO+9AeF8O3aGJdwgWCdbVKxCkQH00EBITNQ0fkWjy5NXbv5aRBylNRwxAVQi8Y3jIIcgOaYOYCIavDG8yvxhhLKl8cGzGtMOaZ8jxTKx9P/V5yH/NAaTZZNsfyujOOleHpMqSCI8kbP5Ib0t/zA1GHBJLISsbQqFBNePoabJY+b2R3aIQVhtVCXCiuDwwAZ3aa4MuSVsj07gFxJFNAUn+F0UOLsWTnGgu1slyYv31/3hk8RaqpGavo4pYBhYGxFWLXjNY6QCN5j25D2BGir2uLsxcBgb3H5cmp75vK2S+ryQelvPVVB9oNBdTuEN4weAzsln+Wmb0MtxpllxgNX7SaYHqfrEjm3GnUj4HlYpmfN2gJMzNwgm6PRwZbEmVkasPdDl8by9Odj3WFSbc+t6jTBeztaPELdB9nPVArb1ymjAw8EzjQzPCHYBhPYiRvBsKclOdktUKtRYsiw1yZpib006Czp+Hz2eLCJteLsO7E/g1NgPdh4p8yGcIg==
Content-ID: <D9F6DE933B80F84DA6EA9C88BA9B05F4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757383ae-c314-4130-c79f-08d879d9ba6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 18:05:31.3661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQ2kBQXNfq1dLhyfcQFZ9pWdMDNoCDpS79wzzMNDV7orkFmVpIWFnNkhKC/mogzdcrAO8ema/BYkJl5wo7vwxWaAVJI62zFOIC1a/BojB1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_140539_067453_FBC4234C 
X-CRM114-Status: GOOD (  28.04  )
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
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "david@redhat.com" <david@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "paulus@samba.org" <paulus@samba.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "cl@linux.com" <cl@linux.com>, "will@kernel.org" <will@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "x86@kernel.org" <x86@kernel.org>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "rientjes@google.com" <rientjes@google.com>, "Brown,
 Len" <len.brown@intel.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "gor@linux.ibm.com" <gor@linux.ibm.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>,
 "luto@kernel.org" <luto@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "kirill@shutemov.name" <kirill@shutemov.name>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
> On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P wrote:
> > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > Indeed, for architectures that define
> > > CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > > it is
> > > possible that __kernel_map_pages() would fail, but since this
> > > function is
> > > void, the failure will go unnoticed.
> > 
> > Could you elaborate on how this could happen? Do you mean during
> > runtime today or if something new was introduced?
> 
> A failure in__kernel_map_pages() may happen today. For instance, on
> x86
> if the kernel is built with DEBUG_PAGEALLOC.
> 
>         __kernel_map_pages(page, 1, 0);
> 
> will need to split, say, 2M page and during the split an allocation
> of
> page table could fail.

On x86 at least, DEBUG_PAGEALLOC expects to never have to break a page
on the direct map and even disables locking in cpa because it assumes
this. If this is happening somehow anyway then we should probably fix
that. Even if it's a debug feature, it will not be as useful if it is
causing its own crashes.

I'm still wondering if there is something I'm missing here. It seems
like you are saying there is a bug in some arch's, so let's add a WARN
in cross-arch code to log it as it crashes. A warn and making things
clearer seem like good ideas, but if there is a bug we should fix it.
The code around the callers still functionally assume re-mapping can't
fail.

> Currently, the only user of __kernel_map_pages() outside
> DEBUG_PAGEALLOC
> is hibernation, but I think it would be safer to entirely prevent
> usage
> of __kernel_map_pages() when DEBUG_PAGEALLOC=n.

I totally agree it's error prone FWIW. On x86, my mental model of how
it is supposed to work is: If a page is 4k and NP it cannot fail to be
remapped. set_direct_map_invalid_noflush() should result in 4k NP
pages, and DEBUG_PAGEALLOC should result in all 4k pages on the direct
map. Are you seeing this violated or do I have wrong assumptions?

Beyond whatever you are seeing, for the latter case of new things
getting introduced to an interface with hidden dependencies... Another
edge case could be a new caller to set_memory_np() could result in
large NP pages. None of the callers today should cause this AFAICT, but
it's not great to rely on the callers to know these details.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
