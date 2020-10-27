Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9D6C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 01:10:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C2C20829
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 01:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pgEjfMfZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="nnrcytRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9C2C20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zTGcydn218ScmR48FZpY6ezv9+cEth0UBYe91vjLoEM=; b=pgEjfMfZ3LFWM3IOlYF+2n1pM
	+ACG9Far4pLEPV89NUUmy8H9scUgZ+xVq1XWoZwbhI/ch2gxIZ3P7MKloVCinUAyDLsKbIT2ChOcD
	F3zEB1kpeBVzgo4GTAFpXswwhdc05eDnQjKPB/omPdmZTnc0CxOgnLjnbjtPj1WfwPF9oAU1b1jLA
	HMlTSNJh/EH4UIbPAuN2yMirbYM7D3Wj1o4zEKD/IqWRTcah5V6RkXdqf681RSS2PQlnN3oGE46QQ
	1slBRcVic9jDGgYnvKSV7zyDMaiPwKXuvuQxznPDeOK8liyqgjTVnK4ql8CkJQ0De9lgZuXH7Q5MX
	DbNuYBi1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXDVH-0000qZ-Ga; Tue, 27 Oct 2020 01:10:23 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXDVD-0000oy-72; Tue, 27 Oct 2020 01:10:20 +0000
IronPort-SDR: ckgimkj48d7zw1p+t+tN7aSvZYwQgAux0cOGLGeshVCLTKyUDnSYJ+mOc0I+Xo7oKMdDZUvkj2
 SRNGhrsu8rEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147294537"
X-IronPort-AV: E=Sophos;i="5.77,421,1596524400"; d="scan'208";a="147294537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 18:10:14 -0700
IronPort-SDR: WRLGEyye8GXNMU4+58poBfahyGzPWLiQ7DALjAphRQGpgrRz5GdM0ORU/MXMkfx1mOtY4qOlmM
 hmGS0Znt8rcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,421,1596524400"; d="scan'208";a="535583959"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 26 Oct 2020 18:10:13 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 18:10:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 18:10:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 18:10:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrcVbDpz2WXFitAC8lvG5fHiYTHgqrPOA+rtVboDu0jw/N16ZN7jRjR8CZYvGAvBVLXoaTYP/LSoQCY8TPnqEHqNiw0NZbrWtyF27BoB+04hbxESvsC6Md6LEFgUQk2o1RVVB/4C5E/1IN6gG2sdIHWArF6UvOdv37KbicsNwMLCoFIxXbRBvNmWNI4/Zan8BK+l02J9FWDnTVhixuiDE8t5iEmzS8ukIFryQP8PR8rxUBAHOJvxwviFAesoPTGye3akoEGFNp5cPvAlJ5Ah/HLdL1hwF/oyqj1c2quAdxo8LvIdHbcxXcUJb5G9ToPiR6e7Hp5vaXNK6jx5k/X0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih1tvWmhfrkBZo7MJW7d95569Y2IjWWrKu98dvfFJoc=;
 b=Lcxh/4PgqYtODBWmcJBYJRrMSpNrz68zjiruAotwuKchZLpr+smK9EqzWn48vcizanImmNPCxa0P0syH5A5nQsw9Fxo/6YBnMD8cBMNnLt981KOWCQC3g9oGEw1GHrgsQbPlhuGeaH4oKr0AArGftWV9bsY8CVpw/XNddLZG0CREwOfcl/6IfEKUHj7e0PepyPK/JKR+BayPx44GhPKd9vNcAZrTwkMXa81nlB+ozuTnCTKDOLRtKUluTtc98j+A1m//gQ2YTv73Fm6qGzZKRgQKhsIxT6WFhCGb+uV/2+e48b1cjugBqganez00Z3rd8QrPn+eX912fA0MZJMbALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ih1tvWmhfrkBZo7MJW7d95569Y2IjWWrKu98dvfFJoc=;
 b=nnrcytRsAPLZ9AAk4XQ90i7NnR0JKNS4DRJloWbUfVKqvVIBS8GPxNGRIbwBl1R/cdSOIMZKebLUBQvr8dqrTWkZcc83G81pJu4K/+QWZNfhaHi0JkOiE70EhbjbjI/vKGMc2JS0W3pC6mKOb5C2Q1ga7XbDhDqXTkShtNRgbSc=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Tue, 27 Oct
 2020 01:10:12 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 01:10:12 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYAgACQkACAAQqeAA==
Date: Tue, 27 Oct 2020 01:10:11 +0000
Message-ID: <3568e23fb551ae4b8d583c3e6bfdbed505e460e9.camel@intel.com>
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
x-ms-office365-filtering-correlation-id: 2d78955d-bfd4-4206-891c-08d87a150e12
x-ms-traffictypediagnostic: SA0PR11MB4768:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB476872441823E8BD7F7754C4C9160@SA0PR11MB4768.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: etpjFjmNlhD5NPu8Lr9UaB2xe1ARUSY2KosIpK2nRC29xn9qw7OigPgNq4YGFm3pHAFAjBnZW4fHzPmmFG+PNhVNc4yftnZy3A8I1kq5+TPpJgzPXdlj4UDNFWHtrg5EJv9UOsSkgU7d3+h220YWHFohxYjxEqFG58kuyrRUCGGOV3S1cLjih1DkLsdXySQ/coNPfUlHe2gScJqawc79ORZq8Xwlxa8mrC9e+cF7XRMberTq1bpo8ceiiSbsr3LqwFnHuGrBYfInR82DPgu/xEMvsmZBRmq1xF0R/FqG72UsbX1sGAujBxH6Vbp+Fo5m
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(91956017)(8936002)(4744005)(54906003)(6916009)(2616005)(6506007)(2906002)(4001150100001)(26005)(86362001)(71200400001)(83380400001)(7406005)(186003)(6486002)(64756008)(66446008)(8676002)(66556008)(66476007)(36756003)(76116006)(66946007)(6512007)(5660300002)(4326008)(478600001)(316002)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wEIFVyWFEQt2Phq1p3KXHe0P5Ion8FTuCwyO4PlkuXkF9faRg4VwqvJZlaS7EZrBdiYurTwEppG8KXSVeNrgt8OkBYrysaaAEc+jpuoIvikkP/K6AANHbQUR4BakrCNpccIORD/3imjZlunW3qreLUUIwTgnVuR2zMTWQprAGwD+2YCIv7exgMsRKzXDOmziopRaHnKP/1aQFL/KtQI1daxULS3x/xDAQFLCbsBBF52cw45ge1KRSFdgi70IisLvxtn0oIa0nNGRFcJLG28+M94U5Fqxq0xKzS8hn1G8ipk5ZyG2XkHLJcpbIhzvuvAV/bBFKuw8uuCtJDPbuqrx4BPR9TnsHoB/6XjaEr/kFvdT/yaxj8Q81n2DNCSov61CLzFIwWAcMCSIxJA+d0aZMfMIkYVlW4UnvVFVcMR20XTdLnr4BX6cUUQKmV07KHldzGtiyQ2rECddAX5iExbJKTncImp6QiqO+DE2cJEtZ+ScwVgdwASHhFl353OMhlyPhj8TyoMdLXkdMLqlqjMu5ghO5aQBg5RvuNfx+ydqmcuKNZutOkSFCK4iDCZX3asoSL4aCrStoPEBsgWmwc1WYQWA5HCd4E1Nb/eZAVleqeZe0RVqavNbdpNgUUARHfch5YZ7tf6RX4l+qBvGZtQzAg==
Content-ID: <E3779E710F79FF429E5DF57F8CC012D2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d78955d-bfd4-4206-891c-08d87a150e12
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 01:10:12.0243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: otiJMahpdVYKdYd3f33b3xjCQYQ9IMUcS5XNV7Nbj+AjWdhXoHGKDTd/aYVIW8hfej1+KONuubl9stQp4W0yRnYpCjdEY3/lMeK1D0w4x6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_211019_403560_CA849BAF 
X-CRM114-Status: GOOD (  13.54  )
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
> The intention of this series is to disallow usage of
> __kernel_map_pages() when DEBUG_PAGEALLOC=n. I'll update this patch
> to
> better handle possible errors, but I still want to keep WARN in the
> caller.

Sorry, I missed this snippet at the bottom, that your intention was to
actually handle errors somehow in the hibernate code. Please ignore my
other comment that assumed you wanted to just add a warn.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
