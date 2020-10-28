Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37921C4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 18:32:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DA0C24803
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 18:32:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rc6cjy2Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="SF5L4+t2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DA0C24803
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z9w2hkiee9qTCqIkGxsxyKYQSgjuTVDPqje0lU4VJIE=; b=rc6cjy2QhRUB47IhePi8SB4aQ
	3xGx1upJEHZERuwpGQvSTIdB4eOlf1yUY2KhQ0AuXbu4AkJARBVnhyRn16KFwPs9zZFTBOaU/Icxh
	aBw/xYq5vi5Zb2l6R9tAf4oKXO6nVo/PelcxtIFjUpmA+IzxrxaPC8k5lyQdcmDpyvdAJ/xPBs/co
	8+c1TPXBxa3UceWTqfVEa47eCJgAIpDvHYsDb9RkJNS5jAN1/DkXcX+95o7E5wSP4EYjfCpXbPsvn
	Vtw78R1bA4pSdpvpQWiS5by45A7U3yxc3htwE8KUCidMHJKlK0n4Vg8TICKfHfdcy31afbfEuNprr
	mrIC9AUjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXqF4-0003dk-Pu; Wed, 28 Oct 2020 18:32:14 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXqF1-0003cP-Mt; Wed, 28 Oct 2020 18:32:13 +0000
IronPort-SDR: FnszGRvD9fS0eb992EhhmDXV6lf/2zUshFoZQHpsFtkUdeacl74bxwWdGtD4r7ShYvKGlsq0tH
 HAa2Tr6BTNaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="232496054"
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="232496054"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 11:31:56 -0700
IronPort-SDR: k8WEu2xJod9Gh65MDikTUTVL65k/9697+11gvxY2ZrL0kbs6/CG9HEv6zQX8FN11DsCCl95h9R
 39eMB5iiQvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,427,1596524400"; d="scan'208";a="318688762"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 28 Oct 2020 11:31:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 11:31:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 11:31:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 11:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvi+t6ym82FpU7Ces4k/Bk5U5Dav8vr5cbEgfDJYXzOki6o1VpZIHqSUeNr9zpmKzX4XS5dJ8my4MeHGMqcSUMcZNT1DXeCd+WMNXJoRVEVfis1IYxJQLS9fFigHX/AsPYLGt6t4/VyIxPOcierl3Hn7VG9tAsxmfCjR82NWSS2JT1iV8vA/IZoUalZvGoAntsKDIscKEdtftnJxnHAU2H5d6tkPH63r4vLWhRB2a5LDYRo3dwAqDkAZNNbQkVxrtLZtT+b3b82OcORqQUYORuyawcA+ZJ6BPy6zcjd8msGrLN67boR2pWYeH5cDAuYjzOo+23IZby+segRl0JtGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q35qe2M9jKLfjQKtKKvinybSElB4zMUgzTHnvsZXZIc=;
 b=WDlCcTJK9mFwrl90CD+Bilf6aDMcE6v7mQXEiQDZc0z13usx/wxR3xdI8Qq++vZu3Rhhe3d/TBTujdWS6j3ETYIfTVV+ACJHovHq4PI+Wzfgr8CFd0xz37R7HiyLTIw6I+eZhRL73hbf7oPnfiAwSB0kQGnDCaIV+WZhAxGJAQWiAtEyX2XoNah+1InMT+cqPrKZKoOXLqKIqEXetVlaVdjs4qxwAnAPpq3xFYMuk2YrOKPxNGZClNChCIPT8ZKShkgLxK2cNDfS1l5DOSfMHjJSIHhFGdA7iWwMJCYJXqWhaQQlFo0+z23CnGQDqmITenzd7eRjDUR5icn8mvfmsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q35qe2M9jKLfjQKtKKvinybSElB4zMUgzTHnvsZXZIc=;
 b=SF5L4+t2AJDz22YQPZNWPU8NNUqu/Jt3HXXhL97Lx/xlfkSMebBQNcBlpH4+jKNtYV1cAV6mDpCdgWsoTL3c/wldZukIEwI61qU7pU0c2zqkyaEsUtfhGruMsesBi8sqTNVkXqB6fRusUHehZYkM+ZlHKEHnewqqXW4qYqSu4Dc=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2701.namprd11.prod.outlook.com (2603:10b6:805:54::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Wed, 28 Oct
 2020 18:31:49 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 18:31:49 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "david@redhat.com" <david@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAIAA89wAgAACU4CAAbpVgIAAe4CA
Date: Wed, 28 Oct 2020 18:31:48 +0000
Message-ID: <0471581f783632648ab5d38753f16ed34ef0d941.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <e5fc62b6-f644-4ed5-de5b-ffd8337861e4@redhat.com>
 <20201028110945.GE1428094@kernel.org>
In-Reply-To: <20201028110945.GE1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bb37a9e8-1868-4ab8-7aa2-08d87b6fbb94
x-ms-traffictypediagnostic: SN6PR11MB2701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2701144BCD9398EF655EFD5DC9170@SN6PR11MB2701.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kisrae4O9TdSGdLxkfMvZ8ZWPfZDxVGM8vR5KDHVy4PjAKAIN794zXfPLH5RTy9qBhtBh7F1ekysCKaYUcKAtP322hfFxiD0/pJ4HZfWzz6g6dRZT9V1XCv+eeSl08P7sDZoPusfyHcyaU/9Nwc38ZENSPwCgMa4Bs89xhaD4rqI2QQ8pTBhYZcN8N/QL4wCB+R0g4Ytl/O9M/k0PRyu1NmtYuS06cL448xON905zWQt/mTSj6kknyohUV7X/gXqjDaKFetQPVNgf/K/pgfYg/Q6lt6XTjWPhtPHwf4wQed6KWLo7flX9mFV31iTUgGbV4mNcdZhaogFI5j5NBusdYqSumcL3e+4lCSRszRnMBRKwd8xHYjNQD7Z4UNMBzkkUPhRsX1Ofxb/iSF5sF24Gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(66946007)(4001150100001)(5660300002)(110136005)(2906002)(8936002)(4326008)(83380400001)(36756003)(76116006)(54906003)(186003)(316002)(66556008)(91956017)(8676002)(64756008)(66446008)(66476007)(86362001)(478600001)(966005)(26005)(7416002)(6512007)(2616005)(7406005)(6506007)(53546011)(71200400001)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: uObe2BXsB+uCnnpInkYfumv6HdVo46M0bo+rIsPtvmc4w9MQrjq2QKwXzXXTQ+vnTS8MCPqbFIqaG3PJ/w/k4m1UOLIls/6vkgsvfgo2DJo0pWSOIGDQ+5YLhl2f1EiZDoAzTdcijnmP6vf46+LExoFXZMmVJRWcmXlR8J+UrAWU+SB7Pkpte6DE4PjEqTsu+jMdU/nhEzdo7XW1ECRkxXrNDRa5J7SUTADDtYqP3VP2ztzh0+onY32VEYdCddkoLNL5S/Jne04L51t56ng/m8SPEiUc29mKsZd6ECB+n2abcGM+7h1iwiLZ0sp+q0jXOpPrFeVkn08hamVB6Ktk40DADiL/jLHtH87xu9Hw4BqtjSUvF9uH6ObHh22CtHeWOEioYz1YsSpn0qxY243hvRmQJrh5KcCjGDCvswpcWPtRxrS//aabfne+JAVBy08YUAO3T9X52WZYX2vFjY+Lp/7vymkOd1AHT9dYdbckgMJExhAS9lwJrmoKTS/tSD9mPit3a4UJ+/gOZjCAHSMHJO5J5ExDSIuLAAMk06BoDcb4TpiGQPtb7WR7iYZDXl2B8KaBv3ecz/vZAGorxjL9nxuZAi1vTGtRB4XzSoTnIm0e0etuexQJ3wv+FU6yW80LFsvjpP3w8ExcGbcNl24TAg==
Content-ID: <8984C15CA4511541805C8B1A65EC6DE8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb37a9e8-1868-4ab8-7aa2-08d87b6fbb94
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 18:31:49.0042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XcDCWGO0I6jZiLVC9xQ6R+ruEappaKJBJ+hpXQi97HJSQa7cpSPtWhSmdYH0eQNBnbom3lFT2Ea68kSpyG9JHOPvMNXFhIH+w0iTPuGwmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2701
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_143211_882437_C8F323A6 
X-CRM114-Status: GOOD (  31.93  )
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

On Wed, 2020-10-28 at 13:09 +0200, Mike Rapoport wrote:
> On Tue, Oct 27, 2020 at 09:46:35AM +0100, David Hildenbrand wrote:
> > On 27.10.20 09:38, Mike Rapoport wrote:
> > > On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P
> > > wrote:
> > > 
> > > > Beyond whatever you are seeing, for the latter case of new
> > > > things
> > > > getting introduced to an interface with hidden dependencies...
> > > > Another
> > > > edge case could be a new caller to set_memory_np() could result
> > > > in
> > > > large NP pages. None of the callers today should cause this
> > > > AFAICT, but
> > > > it's not great to rely on the callers to know these details.
> > > A caller of set_memory_*() or set_direct_map_*() should expect a
> > > failure
> > > and be ready for that. So adding a WARN to safe_copy_page() is
> > > the first
> > > step in that direction :)
> > > 
> > 
> > I am probably missing something important, but why are we
> > saving/restoring
> > the content of pages that were explicitly removed from the identity
> > mapping
> > such that nobody will access them?
> 
> Actually, we should not be saving/restoring free pages during
> hibernation as there are several calls to mark_free_pages() that
> should
> exclude the free pages from the snapshot. I've tried to find why the
> fix
> that maps/unmaps a page to save it was required at the first place,
> but
> I could not find bug reports.
> 
> The closest I've got is an email from Rafael that asked to update
> "hibernate: handle DEBUG_PAGEALLOC" patch:
> 
> https://lore.kernel.org/linux-pm/200802200133.44098.rjw@sisk.pl/
> 
> Could it be that safe_copy_page() tries to workaround a non-existent
> problem?

It looks like inside page_alloc.c it unmaps the page before it actually
frees it, so to hibernate it could look like the page is still
allocated even though it's unmapped? Maybe that small window is what it
cared about initially.

There is also now the vmalloc case, which I am actually working on
expanding. So I think the re-mapping logic is needed.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
