Return-Path: <SRS0=hxxf=EC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB384C4363A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 22:44:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5479F2070E
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2020 22:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnlMrKy2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="jEXzbr3m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5479F2070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SkFT9b6oUjH+hAJLfKs4G+NsyySnyMvjovSZtC2qtfA=; b=VnlMrKy2l3hKUvkerHrNMoHRG
	i5mDny+kA2bph4anuxbVK0hDt9qwqDVQg+5iUYdVMY7OgwtkEWgjnjNR36QWFYauMNpJvn3kLQ4pp
	8Ygoogey2H/9wWmNzMtnS+uY8kd9CZS8gc++JOvjRVdrMY2BkCtFwBh4CLtf3TsNbLfS1Y5Sg44x3
	z3sVVwoAx5SOKFxPVNFNWXVvNqjOOkUfxvnQWlQTSO7bJqVgymzjagzMEMpUuUmWSndS1dEzVFWys
	YWZhbvuv1TiLHxDIaihVQZ/5Pb8odisixwXC98+OztKYvxc0wmRQVbipkg3SUpQALrNJfMvV8Tv9P
	ipNWcgwyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXXhh-0003xA-IF; Tue, 27 Oct 2020 22:44:33 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXXhd-0003vQ-4T; Tue, 27 Oct 2020 22:44:30 +0000
IronPort-SDR: nI83mnqFNY+x1FLnqV6Hu+UfVNcXE3FuDQpGRq9KgJZYY8bO0J6FS8Dw8bELg0u/7e7CRvC9oT
 vsYLuziNEBhQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="147458838"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="147458838"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 15:44:25 -0700
IronPort-SDR: ySPehf4FATLtXOEqimT6jXUaDZbddMSxJE1mCAMblSriFSbiqo6ezD0NBH6gBYL2yqXUoCIV18
 LoNCIfTuMVsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="350772630"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2020 15:44:25 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 15:44:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 15:44:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 27 Oct 2020 15:44:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.50) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 27 Oct 2020 15:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7lMv8jwDsNjysUK1JFMZOQrFboqPJD39bDrjIzOaduynaeXVePXTTtSHtY7RdLYctubMWcbB42/ZLzdCbzIrYYk/FwR2zCNvViYmUPI/XVNkdvRP/NhpJvooyq5Ju1hzlXXSxwNiCusfGyCTGNFBYhAoidrCdmMspcaixxjP9LTh8gwjc5QK0DX5rFR7+Ol2CW4d7uNjNRshvroirYFcLGelsEqwYEVt7l8tm/lum4iK2ksBpzQ8OOCYQQDqpWZVVxAalxv8tTdSNxqJHUYtOQI4XCkOpMZjZF49PFuL5jQbUO3XlzfU+vYFWubZSf59VdZJl2YJlLzb70swlsgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P1dwNVhyQjynAm9m4NDZBlkeuJK+JrO/RmcZcC9MDQ=;
 b=jdJuZCJ4rF90R2MmIFhHzB6lkYyxJN3LgwlKe/LrnOxrwjfJ+DskQ1YJW9+QqDEX2e99iOnFpC2CzD/7X8IVSC/5HtCi14LbiZwaCz5D0No3ajU7+et4WkDGoUQRczJ/2RDWQw7yUjqwpZKgixUWEeH0/wQ89Uv35iMncfhy6dM5kke7h4eLs7GepMO71su405lITMeBDfG9bdHqyHPaHFiFfjumfzhjjcZ26VTEP1bHqnLeFLQpevIp97BTM97+KK1O2KrXezwsQdU457znsfdXCE0+ggTwxv1+MODe636Zj3EfOSjkZvdRrDA91odZ6kXEm5Hqix2oTYSvgjMy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P1dwNVhyQjynAm9m4NDZBlkeuJK+JrO/RmcZcC9MDQ=;
 b=jEXzbr3mloyPftEYl9xf0v78ztI5VT4Jr3jH8ZrAuUBC0bvx7qlJkiZZ7B8DHAIXJMyFpsVI5p/HrsLZl89Q9jSr9AlpYqmFyez75IjN8FCpU8ApKjkYNJqts4hJJ1wRtASf+o0Dz6P+2+5s13Smk0T3SbG3v3t/FnddnflKJ14=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB2845.namprd11.prod.outlook.com (2603:10b6:805:5f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 22:44:22 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 22:44:22 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmpCzYAgACQkACAAKKAgIAA6FMAgADpYQA=
Date: Tue, 27 Oct 2020 22:44:21 +0000
Message-ID: <ce66dcf2bbc17d40bcbe752868edb13976b3f1bb.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <f20900a403bea9eb3f0814128e5ea46f6580f5a5.camel@intel.com>
 <20201026091554.GB1154158@kernel.org>
 <a28d8248057e7dc01716764da9edfd666722ff62.camel@intel.com>
 <20201027084902.GH1154158@kernel.org>
In-Reply-To: <20201027084902.GH1154158@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [134.134.137.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c7b28e7-472b-4c30-ca78-08d87ac9d8fa
x-ms-traffictypediagnostic: SN6PR11MB2845:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2845D35C9A095C02CA884AE2C9160@SN6PR11MB2845.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JOu4gJG5ejdqAOEiO/wg4qgB0WumcfZLfGmWEi5wt9P8k15AcPupu1ucjfc+ol6RrgZIAyV2BBZxvntFsDaAK9GY1Hp6f9B1qtytcA2ypPn+lF2/B53ySyLteO5m5BWI4/tQD9eFkpVwHJnqnFeTkQsUcwrkg8X8HGDciI7wab2EFhbTUgKzHc+S16tHaqqQc9aY2X+7CmbJltrZYR7x1+zPgvfR6MgpjIqeLSsjxxMST7UtsGKwFrL55MiWA0XSRWX2mVarJnZcE4ls4vHAA6rn52kAHXh6F7pBKLMLRXyIF50FlcsaQtDkm8ZJYRamNGkuoVsE/E/gxuvSO/1k1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(8936002)(64756008)(66556008)(36756003)(316002)(4001150100001)(66946007)(6486002)(66446008)(76116006)(66476007)(54906003)(91956017)(6512007)(4326008)(7406005)(478600001)(71200400001)(7416002)(186003)(86362001)(83380400001)(6916009)(2616005)(8676002)(5660300002)(2906002)(6506007)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Yp6AqedV1028MzqkAjufiAqtIIEkFc2Hhjdq5ec4rP6HIHz9hdyq9OnjrlKCgceG7aeib16bfKCNACxXHT1a/drAM7c1qK0G6VvEb7vfKeJuwBSZFFhvECsFf8rwHuC9WO9aaxz9EirP0VVW0A9kWbhCROy1yJUd1eeK8gntnNi+EbenrEnNaTzTlScsGwIeyCB/DzF4LN1tmdyPoe+/dxgp3astXEPqD7qNwZyH1E2/setjFP7VJ813EcroCmba9wrPruoR4snPML7auTzPTt2RlvAUl5V0i2g6zUMAS0UUf0ycH8ZzDbowF733llmd5tdr3ZWNnmMQHp7DdMy5pd3C2wyh9KXG7ebtpK0yFur8N3r638mX9+tpY1CBJpGCv51HGw/ykZyqTOfDLfWvACj2UqFUpsvT6t8rgULalSJHawhLKjTg/Wxsc5RdVDNCqdFbWXfNI1xd/4uw3gHIYC6HEojL/Sg/kXOWL853fKRh9g9n2jD56a0C3mc+m68HlmdFuYESr+oT5lcgEbCs5/Q0VB6GyH8FHYlh5kIZtDo7/xH83efudtOT90dt3tTTmUB1GixZBCObrHMNcr1i3hqq8r8F8vTaMjMk8OGD5aCdzTE282vAXjK8rkmiRXlHQuxu4BPgnW++6sDzLKCdbg==
Content-ID: <B57301ABB1B231459300569F98D25757@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7b28e7-472b-4c30-ca78-08d87ac9d8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 22:44:21.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gkng78fi8mnwQZH9Am1bRhwfPuNsMczfvrLJDpn/EAb711OwlyAwp7bSPSIw4exGtRw/mNxZmn+xp//rIL6bUPo1issaiTG/4+FAXz0YDtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2845
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_184429_439963_BE8A30BF 
X-CRM114-Status: GOOD (  38.05  )
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

On Tue, 2020-10-27 at 10:49 +0200, Mike Rapoport wrote:
> On Mon, Oct 26, 2020 at 06:57:32PM +0000, Edgecombe, Rick P wrote:
> > On Mon, 2020-10-26 at 11:15 +0200, Mike Rapoport wrote:
> > > On Mon, Oct 26, 2020 at 12:38:32AM +0000, Edgecombe, Rick P
> > > wrote:
> > > > On Sun, 2020-10-25 at 12:15 +0200, Mike Rapoport wrote:
> > > > > From: Mike Rapoport <rppt@linux.ibm.com>
> > > > > 
> > > > > When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a
> > > > > page
> > > > > may
> > > > > be
> > > > > not present in the direct map and has to be explicitly mapped
> > > > > before
> > > > > it
> > > > > could be copied.
> > > > > 
> > > > > On arm64 it is possible that a page would be removed from the
> > > > > direct
> > > > > map
> > > > > using set_direct_map_invalid_noflush() but
> > > > > __kernel_map_pages()
> > > > > will
> > > > > refuse
> > > > > to map this page back if DEBUG_PAGEALLOC is disabled.
> > > > 
> > > > It looks to me that arm64 __kernel_map_pages() will still
> > > > attempt
> > > > to
> > > > map it if rodata_full is true, how does this happen?
> > > 
> > > Unless I misread the code, arm64 requires both rodata_full and
> > > debug_pagealloc_enabled() to be true for __kernel_map_pages() to
> > > do
> > > anything.
> > > But rodata_full condition applies to set_direct_map_*_noflush()
> > > as
> > > well,
> > > so with !rodata_full the linear map won't be ever changed.
> > 
> > Hmm, looks to me that __kernel_map_pages() will only skip it if
> > both
> > debug pagealloc and rodata_full are false.
> > 
> > But now I'm wondering if maybe we could simplify things by just
> > moving
> > the hibernate unmapped page logic off of the direct map. On x86,
> > text_poke() used to use this reserved fixmap pte thing that it
> > could
> > rely on to remap memory with. If hibernate had some separate pte
> > for
> > remapping like that, then we could not have any direct map
> > restrictions
> > caused by it/kernel_map_pages(), and it wouldn't have to worry
> > about
> > relying on anything else.
> 
> Well, there is map_kernel_range() that can be used by hibernation as
> there is no requirement for particular virtual address, but that
> would
> be quite costly if done for every page.
> 
> Maybe we can do somthing like
> 
> 	if (kernel_page_present(s_page)) {
> 		do_copy_page(dst, page_address(s_page));
> 	} else {
> 		map_kernel_range_noflush(page_address(page), PAGE_SIZE,
> 					 PROT_READ, &page);
> 		do_copy_page(dst, page_address(s_page));
> 		unmap_kernel_range_noflush(page_address(page),
> PAGE_SIZE);
> 	}
> 
> But it seems that a prerequisite for changing the way a page is
> mapped
> in safe_copy_page() would be to teach hibernation that a mapping here
> may fail.
> 
Yea that is what I meant, the direct map could still be used for mapped
pages.

But for the unmapped case it could have a pre-setup 4k pte for some non
direct map address. Then just change the pte to point to any unmapped
direct map page that was encountered. The point would be to give
hibernate some 4k pte of its own to manipulate so that it can't fail.

Yet another option would be have hibernate_map_page() just map large
pages if it finds them.

So we could teach hibernate to handle mapping failures, OR we could
change it so it doesn't rely on direct map page sizes in order to
succeed. The latter seems better to me since there isn't a reason why
it should have to fail and the resulting logic might be simpler. Both
seem like improvements in robustness though.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
