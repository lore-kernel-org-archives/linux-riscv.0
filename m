Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BAEC388F7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 00:39:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2135F20756
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 00:39:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rHdXslBN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="gospHVgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2135F20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4WsPsOLkKyNogCc53Upc/S+KrIVIA/yZrCvcZB7bLVE=; b=rHdXslBNVyRD+99pNWM9f2XqO
	sWgBXx/p2WpEUzBko+tEm9ngIlb7yQjhrluy0VVYocd6pPqCFKU3st7ER+06kLcN+kbcWQFOrAQIe
	xxt4r44KzmHwQCIfrlaO9VYuPXXKL4H3CoKAFZnxQmBgMa+BApR82nH5CzU2YCAX6/c++5gq4ZU+9
	wzY9f2Bk4lwD0/7l0t84vgVHQO0PSgmsiRi3mV7zcZQ+nf1srgPgFiPj0Mqrrce8DHzbKCKbK1KcA
	ViNm4xD85v7KWZBvK/KntsnCXAB2hSN4f+8qpZUV50hRfpqFY8lP0Y0eKpipHiVmqzGzmtKj4PIRX
	xAVwZ/S0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWqXA-00009h-Vw; Mon, 26 Oct 2020 00:38:49 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWqX7-00008F-8m; Mon, 26 Oct 2020 00:38:46 +0000
IronPort-SDR: bJTTsHDyZNXZm7n5w91tUe4Z5m8+9Ww1zqkieFRjtrZlidt9VdlyA7S5IxI62p4ndbBkFiGgSK
 K1DuR2Xpv4ew==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="165272290"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="165272290"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2020 17:38:36 -0700
IronPort-SDR: NWnfmoweVKhceYnJFLmUykx2hcUpt8jp2DbEv0eIW9LVg/qjt+3EeNBwUDR27kN1v6J2l7J1Kq
 mWtdmKVb8Kug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="467730532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 25 Oct 2020 17:38:35 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Oct 2020 17:38:35 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Oct 2020 17:38:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Oct 2020 17:38:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 25 Oct 2020 17:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ec+qzFkPOjHk/MJQ1bDtHBfoQ2TolaeShfPqSxzuCzNhVk4LaiV72VxGC3I4OEzHwx0CUWmnVL5gipsf6eYgwmRpnCjtvEgntxD70tPdliRAgnVABqregaXtHhdxyS0KobKjyIux25njdrh69Qrw6MvhkoebYwmKBvhhF02PYAUvzAOzKVm+0NNlvUNXENGSPyVklMiVvKwfG1OGSfYX6drl+vPg+2bP6RLkA2cy8s5O286SSQGgLwJwcfwWW4huGBv3nVwCqlLqoZ+09xLSsGx3zLhQLhJw8Ijx14j1mvotyrwqpk4CLYGEDqO0Rvji65LohR+ImQP9kL4quHIQag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POHANa+eDkgXYJDNU3Y0iPAgKW1aGHYmuM+lFsPa7vs=;
 b=b/W7tbQ9DshCRAV5JowNuPRHBJq4VshbGdnOKlkrtCTF25wpWXUkASzEvv7e9nCtY6/+VphCN3fAxgiQaicGLNRi+REs1nRuWvYez6fGuNcMxSlFNTgjIRGYM8ot4W9fwcByrxHoRFUVQdoplJzCZYkl0v682YcADNstfusumkmBi3FHBfh1ZR+3L31W3wru2OexCpNyZ1p8AS+z7jKn5i1foVs7lyzhYlMqnV4OkqOImcp36VRH8fEPDwIx2MsoQoGe3Nl7NmQsioK1dng41Y1H0mHFoIdRYTGSK/YzwCfBWfS3z/iVRxnpkRbolA9Y41fq1zzNp6dmNadApaePOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POHANa+eDkgXYJDNU3Y0iPAgKW1aGHYmuM+lFsPa7vs=;
 b=gospHVgXqRS7jku2UwYT8z+JZjzp1XGy7Qu41uyGtgo/EYsZkaxJeHNueKmIka9FfzpUDaIqmWAijsiimEKwGbbN3ZuHUStfUduNan4SK5cR2KkjY9TIYFbX7RWxwS19KeVKv0Atyr1v9NxkN2mxbNZQr3DUPmPAgL60XY5vJGM=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 00:38:32 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 00:38:32 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYA
Date: Mon, 26 Oct 2020 00:38:32 +0000
Message-ID: <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
In-Reply-To: <20201025101555.3057-3-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.55.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ad491d3-357f-4953-91f1-08d879477746
x-ms-traffictypediagnostic: SN6PR11MB3230:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB323086788B7DC160D562C876C9190@SN6PR11MB3230.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cb1AbnusLUbxe3Z2OFEwyuQmnllpwLPiW2RpHypzcRYXBmx3CeRUtPwEmrbYX4Do0WwJpUx8dI4/FTEmGH1fynKKw2XbPVRSOaXqEhegw8TOUHreZ/XiAduKTnj44K0OxxirL9ypiZkuTz3k7BsJOBJ1l6/mr8V+PwOJ8twMRnuxeC9yKwWf027hLwdRWn2AScZRwmbmX0xNO0/QpBRUj4PE6WffuoSohBNqYGbqZxIDyY74lpJ3YugJ8u3rylLXai2JHfP0FvTWo5re8gq/96+kBmPJc02PDk8AMa545uL/sHxV5j+O9XiLw9+vxY1T5+Wejo2JDiKr3QhEErD3Vg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(91956017)(4326008)(478600001)(66446008)(7406005)(66946007)(66556008)(36756003)(86362001)(66476007)(6506007)(76116006)(7416002)(110136005)(5660300002)(64756008)(186003)(2906002)(8936002)(54906003)(316002)(83380400001)(26005)(2616005)(6512007)(6486002)(8676002)(4001150100001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: glmLmLB12U0y5RY0L+ZT1Mi/9/Lz/KB/6WAVVycPk1YVeMOwoGyGUWU4Fq1MVzaBaZukNjhLe5PIBbbdY3d+VVjt9Fl6xRXYUGpfjJmWIWZun4seSr0uF+OSZyJo8Z91mRWPTmCFJXeFJbXdgyTNr1d8zGfztjMC3TKVel+Vpcbv54fKsjYIPOfWIP4XgjdG//4b5fNq6tKs/LR0iALRreua4medRAoUnZodcCHhxttXr+vOg85DRBUCF2uj7DJZSNfk8bu23YNOYfNwkNG4nc7E61V9uIErZ3kUL7xtLNAhbfjxRTDx1bu5MKEbQ2tkaRQq5TRtMoNxSHae3wqOFEW6LsIScfQypJUmfFhOxe0NK+qJs4e5ZBTbE9bH8OuJkMKxmpJqxMs6exVbM5lx8SvPvDm5OhEAV1zcZOmvjdP5TGEwtmPNtotm5fo/pQFfaJtSaazRa50xGa6WNz6IKHxVYbxneMyg8iPwwfBUv0Siqv2vv/L68HBwEi+xK1NW+KJ/rOLgMtYzy8fjEq9kcLNDy1una7Xc2p/gb5eiBRJDTyYQ+0sH9DHRydMNU73L7I1Hm6RYifUr7bRVb5shA0iEUX10uRGV6sIZfwp+wg3no4kbrvxjQNpJkaCbOXu+gute91p7zWzUiPuNP/m7tw==
Content-ID: <1A64047B5DCE1A409D92B085E6D25DC1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad491d3-357f-4953-91f1-08d879477746
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 00:38:32.2198 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EOqvkWZ3MNaT13nksG4s0qRyOCAw2mCf4k3JN5qlMHbWP/+ykROXQciwCEC8QPjPYsTstcrDbcEkIe/faBMY7w6mZB6T8UpndsedXRzgLyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3230
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201025_203845_463125_935F8B85 
X-CRM114-Status: GOOD (  30.09  )
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
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "penberg@kernel.org" <penberg@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "iamjoonsoo.kim@lge.com" <iamjoonsoo.kim@lge.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page may
> be
> not present in the direct map and has to be explicitly mapped before
> it
> could be copied.
> 
> On arm64 it is possible that a page would be removed from the direct
> map
> using set_direct_map_invalid_noflush() but __kernel_map_pages() will
> refuse
> to map this page back if DEBUG_PAGEALLOC is disabled.

It looks to me that arm64 __kernel_map_pages() will still attempt to
map it if rodata_full is true, how does this happen?

> Explicitly use set_direct_map_{default,invalid}_noflush() for
> ARCH_HAS_SET_DIRECT_MAP case and debug_pagealloc_map_pages() for
> DEBUG_PAGEALLOC case.
> 
> While on that, rename kernel_map_pages() to hibernate_map_page() and
> drop
> numpages parameter.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  kernel/power/snapshot.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> index fa499466f645..ecb7b32ce77c 100644
> --- a/kernel/power/snapshot.c
> +++ b/kernel/power/snapshot.c
> @@ -76,16 +76,25 @@ static inline void
> hibernate_restore_protect_page(void *page_address) {}
>  static inline void hibernate_restore_unprotect_page(void
> *page_address) {}
>  #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
>  
> -#if defined(CONFIG_DEBUG_PAGEALLOC) ||
> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable)
> +static inline void hibernate_map_page(struct page *page, int enable)
>  {
> -	__kernel_map_pages(page, numpages, enable);
> +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +		unsigned long addr = (unsigned long)page_address(page);
> +		int ret;
> +
> +		if (enable)
> +			ret = set_direct_map_default_noflush(page);
> +		else
> +			ret = set_direct_map_invalid_noflush(page);
> +
> +		if (WARN_ON(ret))
> +			return;
> +
> +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	} else {
> +		debug_pagealloc_map_pages(page, 1, enable);
> +	}
>  }
> -#else
> -static inline void
> -kernel_map_pages(struct page *page, int numpages, int enable) {}
> -#endif
>  
>  static int swsusp_page_is_free(struct page *);
>  static void swsusp_set_page_forbidden(struct page *);
> @@ -1366,9 +1375,9 @@ static void safe_copy_page(void *dst, struct
> page *s_page)
>  	if (kernel_page_present(s_page)) {
>  		do_copy_page(dst, page_address(s_page));
>  	} else {
> -		kernel_map_pages(s_page, 1, 1);
> +		hibernate_map_page(s_page, 1);
>  		do_copy_page(dst, page_address(s_page));
> -		kernel_map_pages(s_page, 1, 0);
> +		hibernate_map_page(s_page, 0);
>  	}
>  }
>  

If somehow a page was unmapped such that
set_direct_map_default_noflush() would fail, then this code introduces
a WARN, but it will still try to read the unmapped page. Why not just
have the WARN's inside of __kernel_map_pages() if they fail and then
have a warning for the debug page alloc cases as well? Since logic
around both expects them not to fail.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
