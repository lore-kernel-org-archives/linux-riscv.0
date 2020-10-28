Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9DDC4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 21:04:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F06E224836
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 21:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qQJVSRII";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="wqW1ZG0A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F06E224836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a7DqeRyiOTY1JoYYFtm5mIGWsemnaT+qoPibR7629O8=; b=qQJVSRIIfXOBTHEzGXzaWQCP8
	6WclrgqBiAzy2liR6T2WTK5yHxGI1lpHrfHsZHEH6m/MiWO5+jucS79SbdqsGs19kS97A9WRmSbNa
	0WjrRa9uVVa1Es5nSsq6kqDKruWN9fUdbd5T0Wnkq22fRYPWIubozVNHY2IiW7zr8uGKUMPwMgis8
	+fi/4pDsdao6n9owl12HSP/VNxfqPSze4m2m9mo7IOWRN3Ct3EieBgWVMY6TnwwOn3s8mxOHFSx8N
	AsAhfPgCO6tRZJ4yo+xYIt90N38Tux80wtx5xFhiYrAtQ4s06uE9nL+M7UL1HB63Vx4RJwd9T4bHW
	/CbaFZfnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsbh-00039M-VQ; Wed, 28 Oct 2020 21:03:46 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsbf-00037p-0N; Wed, 28 Oct 2020 21:03:44 +0000
IronPort-SDR: 5atrJ0Y8f8S0h1yF4v7nHfjuxmk4uPAe43Jss1D7cLS5FHhRtkZjnI+PE6Q8xoHu3n1KyPO3FL
 5LpgIOmHwjMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="186106084"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="186106084"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 14:03:36 -0700
IronPort-SDR: 8Fnp/m19OoQ0PF94x+pIsBXqe80yUPmUNRJphy71q+x/GktXHCxJ5kepMftnOVAi6MUaTHu2qi
 WcfBF5VSowNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="351158856"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2020 14:03:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 14:03:35 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 14:03:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 14:03:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 14:03:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/3Mpb+SGN4+cSQ0FYq9/PJlC/wYmKNvukJkKSBmxUS7YkhdZcUs4C2/xbgA4l14f/okwUYcghZZ4/lL1N6L5k0uV/h82A17JS08yrUklD58lxmYSGKkyHsa+JiOfq2cz5+fv0XPVwhrpzeswj1F9t9OJIxJkcD78WbaP+a1GmQ/7JTdZM5KpMA+fyfqjFdh1fDBlpPe2cpxXW1v9Bv1hovTC/+hjWkN9BjuUQ48eoDFPsgZWx2Q3FSkSJl21JkcfrATJZALOfw6rBULRk2HfGbQ0Ubgq3/9QXwixkzCh1XkgPoWxfOgi58V/4Pbdeqb26JVvw7K/vV6lhj7W+TMIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAZhJfD6OsQo5ORolnzWi25k4gfuBM7Onv0jt2kzKUg=;
 b=iJ8hwZc9zd5TCwo+ZDyxZczaMNmILA2IaI7W3Ac2Aoehq6zLmBdTMS86yrXmWq6mRkkG6difG38+d1ZRFvLh54wYL9uM36kmuT1oY/wi0ncRdW7GqdyptJ5ZPaHUUkLY3GOfTZpwUzg1D3rMuEicCilppAY+1JEwTmz9Af/tr4wQqLNpjo+0gWDVHfidLHXkjigSMgVo+OChRacczHGVlc9lybir+Dcqu88N5jJn/NYBUvmpoFB5ivmcZX10uL/EXb/RWG2Qtw4LFSOQ+KrMerC2CuvY/Jv6MkFv7RZIMoZtfR9s8O+509gAIS8yEPn2fA/0/eqP+641H7G1unuXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAZhJfD6OsQo5ORolnzWi25k4gfuBM7Onv0jt2kzKUg=;
 b=wqW1ZG0AtZzRHmDuhHgb+8Ww4Jfeep1mPb5qcFiXapOydJD0B27pnbNGUWzfF5AHpgyWtkhO03Mx96gMHkjsqe5bVFepeONx8Zr6ykBdGdGLwuIg8aHsklOBlD3yf2v9TIgj3//BPuY3C72bNvz1oYpdXZmLK7jyVjn9k/Ytqc8=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB3437.namprd11.prod.outlook.com (2603:10b6:805:db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 21:03:33 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 21:03:31 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "will@kernel.org" <will@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Topic: [PATCH 0/4] arch, mm: improve robustness of direct map
 manipulation
Thread-Index: AQHWqrf3SYgZeORHqEa1kMKSitw9UKmpFReAgACDwgCAAJbiAIAA89wAgAG/kwCAAAMDgIAAn/WA
Date: Wed, 28 Oct 2020 21:03:31 +0000
Message-ID: <9e77d0a939eda3029d6ae89bd14d7f1465b0559d.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <ae82f905a0092adb7e0f0ac206335c1883b3170f.camel@intel.com>
 <20201026090526.GA1154158@kernel.org>
 <a0212b073b3b2f62c3dbf1bf398f03fa402997be.camel@intel.com>
 <20201027083816.GG1154158@kernel.org>
 <20201028112011.GB27927@willie-the-truck>
 <20201028113059.GG1428094@kernel.org>
In-Reply-To: <20201028113059.GG1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1172831f-adbc-41cc-b38e-08d87b84ed44
x-ms-traffictypediagnostic: SN6PR11MB3437:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB34375DA7570B1F899B151780C9170@SN6PR11MB3437.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tJfm5p48V+DiodzMvNLUYiWMC39XjyMOSoDghzvvfmUr32QKdjniwAu8ktLu0jy9EFu5i8OZ4jEe7Uu6pd8BzRRZbt1HH+F3c9a2b1e5Q3cittABLg5E5GbOtu3nkaDtRrORnPHrIFaguRroyR0G9qeUEnCElcy0rU1XyNMshMZiE+88imLbGHRLJcgm3qnjtSF13srsSoy/12iL1gD4bSOy5EAxSTSAHzMrW0uzYfxoVx6eWZ8+bCRCuxE/0OT97Id5O5OHjaGsUh/TcgWtPPCf5q/ABGi2Nc9XxFsVg3YDhoNlBnborB2ehaH9R4fmxiudVBZiaISyVu94q9wc3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(7406005)(91956017)(66476007)(64756008)(4001150100001)(186003)(2616005)(8936002)(26005)(76116006)(36756003)(66946007)(478600001)(66446008)(66556008)(6486002)(86362001)(4326008)(110136005)(8676002)(6506007)(71200400001)(83380400001)(54906003)(7416002)(5660300002)(316002)(6512007)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: fBWAiccndId9oskYRy9/C10+ebq6uEZ7vhv224LX0XWtxIHvu+YCYAudwl7ybJg5CfRMRqcfhMFtQOU2RQJWBfUWYqFM4Zf/AYfmIIH0RDQNeCiFiPsZFpmRZ/m8ZQ7WSX1nZQbxUdSqVGPkd3AKh1mPQfdB1BWeAeX7Bjap+yxJQVenZ0pBKAmlQgL8qTSz/9xXcD+TXTrmMBBwvJgSyvEzzNEBDT+2bsw/7RrLJG11eB4MM7GiwCsIWszHKQBKugWPM7Dbd7Xi/tsx/MjRNc/QfQjldVmHao01ZZueJ2+XFxUeEY7sO7DHkg51x8FPpR6oW+Yxb7LHCj41XjuTY43vG0w5FBFu6zzTbFwoFUXszrqSUdVt7BozJkPurleB8vUU9Zf1vH8uHMP9XqgPmUF+SaMFQ7USlW01GfGYHmFsuE9Jt0+54Zzq4j69N5MjDfTn8roqze0nm4i+XS7rdv/MCs4X4Pn3C/ku3EGkFGiGp0Bq71T71rWfxHlFA8RfI7ciqYXC7bUaX5R+hKRDxj0eFr9rgbD3n7izcIsdBMHYZgXmcYEDvzwTPN+LEaAsNngtFOEsgOf6adtLiOM6wHQMEu49iPyqt4j3JzkoGTWvrXI/0XoDLZfuNJ5Oe6kx9nj3y64izN7VpdSufyM9sg==
Content-ID: <6A57DF794371B74D8EDF50341EA0B257@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1172831f-adbc-41cc-b38e-08d87b84ed44
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 21:03:31.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /v7YTfuF7d6l8QAVjaRFt8aGtaUV+331a/dKdsPQ5YuwSDYBuLMmOUdoDn6N6zBfw2g0WOPCtth+2tso3T3TfDQTIOdkHoTlltxTNbIlz44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3437
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_170343_342613_FB47951C 
X-CRM114-Status: GOOD (  42.95  )
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
 "cl@linux.com" <cl@linux.com>,
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

On Wed, 2020-10-28 at 13:30 +0200, Mike Rapoport wrote:
> On Wed, Oct 28, 2020 at 11:20:12AM +0000, Will Deacon wrote:
> > On Tue, Oct 27, 2020 at 10:38:16AM +0200, Mike Rapoport wrote:
> > > On Mon, Oct 26, 2020 at 06:05:30PM +0000, Edgecombe, Rick P
> > > wrote:
> > > > On Mon, 2020-10-26 at 11:05 +0200, Mike Rapoport wrote:
> > > > > On Mon, Oct 26, 2020 at 01:13:52AM +0000, Edgecombe, Rick P
> > > > > wrote:
> > > > > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > > > > Indeed, for architectures that define
> > > > > > > CONFIG_ARCH_HAS_SET_DIRECT_MAP
> > > > > > > it is
> > > > > > > possible that __kernel_map_pages() would fail, but since
> > > > > > > this
> > > > > > > function is
> > > > > > > void, the failure will go unnoticed.
> > > > > > 
> > > > > > Could you elaborate on how this could happen? Do you mean
> > > > > > during
> > > > > > runtime today or if something new was introduced?
> > > > > 
> > > > > A failure in__kernel_map_pages() may happen today. For
> > > > > instance, on
> > > > > x86
> > > > > if the kernel is built with DEBUG_PAGEALLOC.
> > > > > 
> > > > >         __kernel_map_pages(page, 1, 0);
> > > > > 
> > > > > will need to split, say, 2M page and during the split an
> > > > > allocation
> > > > > of
> > > > > page table could fail.
> > > > 
> > > > On x86 at least, DEBUG_PAGEALLOC expects to never have to break
> > > > a page
> > > > on the direct map and even disables locking in cpa because it
> > > > assumes
> > > > this. If this is happening somehow anyway then we should
> > > > probably fix
> > > > that. Even if it's a debug feature, it will not be as useful if
> > > > it is
> > > > causing its own crashes.
> > > > 
> > > > I'm still wondering if there is something I'm missing here. It
> > > > seems
> > > > like you are saying there is a bug in some arch's, so let's add
> > > > a WARN
> > > > in cross-arch code to log it as it crashes. A warn and making
> > > > things
> > > > clearer seem like good ideas, but if there is a bug we should
> > > > fix it.
> > > > The code around the callers still functionally assume re-
> > > > mapping can't
> > > > fail.
> > > 
> > > Oh, I've meant x86 kernel *without* DEBUG_PAGEALLOC, and indeed
> > > the call
> > > that unmaps pages back in safe_copy_page will just reset a 4K
> > > page to
> > > NP because whatever made it NP at the first place already did the
> > > split.
> > > 
> > > Still, on arm64 with DEBUG_PAGEALLOC=n there is a possibility of
> > > a race
> > > between map/unmap dance in __vunmap() and safe_copy_page() that
> > > may
> > > cause access to unmapped memory:
> > > 
> > > __vunmap()
> > >     vm_remove_mappings()
> > >         set_direct_map_invalid()
> > > 					safe_copy_page()	
> > > 					    __kernel_map_pages()
> > > 					    	return
> > > 					    do_copy_page() -> fault
> > > 					   	
> > > This is a theoretical bug, but it is still not nice :) 		
> > > 					
> > 
> > Just to clarify: this patch series fixes this problem, right?
> 
> Yes.
> 

Well, now I'm confused again.

As David pointed, __vunmap() should not be executing simultaneously
with the hibernate operation because hibernate can't snapshot while
data it needs to save is still updating. If a thread was paused when a
page was in an "invalid" state, it should be remapped by hibernate
before the copy.

To level set, before reading this mail, my takeaways from the
discussions on potential hibernate/debug page alloc problems were:

Potential RISC-V issue:
Doesn't have hibernate support

Potential ARM issue:
The logic around when it's cpa determines pages might be unmapped looks
correct for current callers.

Potential x86 page break issue:
Seems to be ok for now, but a new set_memory_np() caller could violate
assumptions in hibernate.

Non-obvious thorny logic: 
General agreement it would be good to separate dependencies.

Behavior of V1 of this patchset:
No functional change other than addition of a warn in hibernate.


So "does this fix the problem", "yes" leaves me a bit confused... Not
saying there couldn't be any problems, especially due to the thorniness
and cross arch stride, but what is it exactly and how does this series
fix it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
