Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F24C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 18:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C635207E8
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 18:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wcvckooo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="CNt2PJpH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C635207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CcaAb/ETTStuQwu+J/32vM4TSJ4Ijlrb9pIdd0wYmQM=; b=WcvckoooI2hQqDOYzKgDUAYDX
	5Ugq99X09538TwB4EzY7HQzK43TqWtp1n70ZNUEAL9Er0Qi3IC5gfkAR0n0EM8MtoqV8laO2J53rJ
	kahQLlbtx+8vqPjV7quQ7MzRfStTqIWC/VI7urBgBuqKWTh8Qzq6xEdr0MHEmJwcUJpVJBz6L/Ub7
	hqEu3N0lQvhjIC5b9xdNnM+PoYCsxAC3koY9v4aE6a0plgXqGRfOU1LDv/uHhD0tyn0eB7Ucm8UmR
	ahO+wBuR9hcxFAWLXRwQyY3JNwS7XfceN6PSAGOXNszN8eAvmT4mrje9sxdisgTZr4fLIwp5NP6aW
	G6m58cSVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX7h8-0001Gl-Oq; Mon, 26 Oct 2020 18:58:14 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX7gc-0000wP-2y; Mon, 26 Oct 2020 18:57:43 +0000
IronPort-SDR: 22fdkzRSQosF1anQT8/+X1xO57FaBxkxMLOj2WWEF94QweT+VzNxUxlce4r48zrqhMw7i2xreV
 B8RtxpM+COhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="252671234"
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="252671234"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 11:57:37 -0700
IronPort-SDR: kDCuGF/INurHLzkGxp1atk6PecmLBn+41125sYA6Q4z690BfomjRZkbSkFslIQU4FbWDNQy8SR
 hMAuuCKdljbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,420,1596524400"; d="scan'208";a="361099020"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 26 Oct 2020 11:57:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:57:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 11:57:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 11:57:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 11:57:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRtcACMT18VEnjz5dQkzdP9yk8z4iGtrnCS5VScWmhATTM/DBgoNGeRA2xaEpZMToTX38H6JqIcrlhV3P9T5KtSqHQDULXRDmLmVsvKCMza4708Wj/xhUmb+GqAjLpX5sSLTLgJD63VFDF7iZVJjGuo5YX9lowV0C5UEZdr11hbDmhYmbEBX6J7umyur2ewrLhCN2v0IgwhqaGzH3ulhTUe2hmcFMCUFYd2DFCy6clFJvQ0dU8ttdLDnsccnkeZB1AaVT8odD6yuUb3nQ8DDneXcwktwJoS6qqPtIbOEWCbgLJt1p4oKGrZeVz9ReSyPN0rbA44BI0QIq0xr3BxRfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/jmZB+JeNW9FSro3Zu1DhxjPqZtbl1rGi0ooZOMnY=;
 b=hqwrYaHKk2Eus3utHyYsdXAmPWEibzmLZBwpiKeF9rOWvqaieXUzL2THop+AbiJRVw4JnImeHGZoW361kiS0Z1kqQstI75v9daT8Zxgk/0H97TxM7Bm3rN8SSAZdkDttaMCWK21NJ9Swqm9BbeXig/OAgSxmTm8FzyVZWIj6xMYlyV7giJFEMD+xOdVcHFLWHD5+P3cmcrDXxtvvdq8RAMG50UQFxyVg9NHRNNFZk7VNqoJc2BSOUKmPpBF13J8U2Dz8Q1n5Mdfs9NhaXC2SYDtmwp+gdYtYQN+5261pBY11mLwexBjTlgu4RaZD6JBkEtY7xDTfbIxv/FeLi1Li3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT/jmZB+JeNW9FSro3Zu1DhxjPqZtbl1rGi0ooZOMnY=;
 b=CNt2PJpHMNccCX8emcaKNwstcrNWJNuoOsjMVCdQA/8OzUDsVa3ZfUeMFsGiq90B4G/PUysEDYx59me+g8b+oWfZ3Ey6WzIBmuVPzF6gWaLtFtG1iriEShwaP1X/Fu1HOkpgyB1msqz4qsfFN/ujGdJxnkAFrsxbyMC1rDg0hSE=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2670.namprd11.prod.outlook.com (2603:10b6:805:61::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 18:57:33 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 18:57:33 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYAgACQkACAAKKAgA==
Date: Mon, 26 Oct 2020 18:57:32 +0000
Message-ID: <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
 <20201026091554.GB1154158@kernel.org>
In-Reply-To: <20201026091554.GB1154158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.79]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ff5ae49-7b36-4024-8d5d-08d879e0fefc
x-ms-traffictypediagnostic: SN6PR11MB2670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2670258C5426027F170B537DC9190@SN6PR11MB2670.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gbW+iMo/Bs82ZT7ywfNN/D9qUA2XLqXil+b1CHYx05cm2iGVWywoMc5gq9B3sBg0JvowexS4GirlAOJECkMFYKxdk2b7RGdhJfhC+I7/svp/pGrOsr1UHXmhxCuJP2+Y0i11oA4b2WgrFheOLWdvdqQKNrdo0mFE1MyUv5ms0MfUS7jsycLluESb8IKMKR6PHtS6j2Fy3qvF+lvH3r7bua+1Yw82EmIUimxU5HjzZMGY+Zd/qkUxu3yE4FH6JA6F2W463PzGndBfIbeIEUY6K4Ait98fjJVHMPYiAlopkA1A/nZscj8s3sK1YQbueETL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(86362001)(4001150100001)(6506007)(6486002)(6916009)(26005)(8676002)(6512007)(7406005)(8936002)(2616005)(36756003)(186003)(7416002)(2906002)(91956017)(76116006)(71200400001)(478600001)(5660300002)(66476007)(64756008)(66946007)(66446008)(54906003)(83380400001)(66556008)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5pN9ujDgUJvGEnb/4+6QgHpP2B/+8qA3Z15GD2rPS0Ou8DOVUM0mqvY8e9cqYFH79erItZ2GG3ssxp0aAjSO/3Y8NtfJPL+2vasb2h44DkldhDOo+nlhDTIjjfifbMMJT6hnrjZogFabZAU+y47SEQ0cOvKERI0upc6FOJw2RCLH44PAeRoA5Y+Rpw8JL3iyS+mGlYgV63R/YnDyMyg/uaT2kL11xCMmyzJwVYYlaAlzBmZnj104ZEqevUkEZjTTgt09l/le8D8GRWCcvjdBm4QOnAYsDy07EQCxp1xE7CWq1mr5JMzybNptakNfI2hT5GT9ukL1DmcHo0USfqQ5g37qN90yjEy8BR58CGydmZ3eBPFI+NXSJmaLSXIYTSpSPQ4JfJmXwb70Ne8HDLg6vEjH+LsfZJaQmAhT6uG+U6ESJXlrmb7xK5BDLS1I9I/f6Av1CRhLcwc4vfQgSvwcYUIon43vdR0a9QoJTzuxt9xIkpCQ1YwJp7inuEhuy4RdRMv3z4ve9klTHwaWiBLDnRnfKqc0FFEwDhmSt5NKmVGBug4y7HaZVO4muZXUtMbUCw5rdLear6YeR10qJCygRta6hXxMVru+PfzKWec7iqjfXEVTifMHRt1d94WB+6rUTO8cyuxAhzu6jeDpTjPCIg==
Content-ID: <C54C396FD8B75148BC4BDCFF5A414CD9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff5ae49-7b36-4024-8d5d-08d879e0fefc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 18:57:32.9485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJEotTFxYRcT5AhVWylIGfgF/JtWN8OP/KguE9Q+/4woG0+Dq3ohn9pjeth1BF3Gf0wEPYPnJ8SFUeYMKgvoj1W2/UA/ZzcQhJ/ZWz7+RnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2670
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_145742_336834_A0B73E24 
X-CRM114-Status: GOOD (  24.35  )
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

On Mon, 2020-10-26 at 11:15 +0200, Mike Rapoport wrote:
> On Mon, Oct 26, 2020 at 12:38:32AM +0000, Edgecombe, Rick P wrote:
> > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > 
> > > When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page
> > > may
> > > be
> > > not present in the direct map and has to be explicitly mapped
> > > before
> > > it
> > > could be copied.
> > > 
> > > On arm64 it is possible that a page would be removed from the
> > > direct
> > > map
> > > using set_direct_map_invalid_noflush() but __kernel_map_pages()
> > > will
> > > refuse
> > > to map this page back if DEBUG_PAGEALLOC is disabled.
> > 
> > It looks to me that arm64 __kernel_map_pages() will still attempt
> > to
> > map it if rodata_full is true, how does this happen?
> 
> Unless I misread the code, arm64 requires both rodata_full and
> debug_pagealloc_enabled() to be true for __kernel_map_pages() to do
> anything.
> But rodata_full condition applies to set_direct_map_*_noflush() as
> well,
> so with !rodata_full the linear map won't be ever changed.

Hmm, looks to me that __kernel_map_pages() will only skip it if both
debug pagealloc and rodata_full are false.

But now I'm wondering if maybe we could simplify things by just moving
the hibernate unmapped page logic off of the direct map. On x86,
text_poke() used to use this reserved fixmap pte thing that it could
rely on to remap memory with. If hibernate had some separate pte for
remapping like that, then we could not have any direct map restrictions
caused by it/kernel_map_pages(), and it wouldn't have to worry about
relying on anything else.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
