Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CCBFC2D0A3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 23:19:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D3862076E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 23:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFglLIsc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="sHYtkacO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D3862076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eMZG/wbtG0fDlLEmEoc2dkr2Lsrl9nzScw2RepXHrqg=; b=RFglLIscbDQeNTMuHpEwbb4Ed
	qzOhvQH+swJHVgoTRTs/hvhlIa0hIzMFBmpW4okh5t4JF2i3Ik7nxJMoSLv0zNrdS0n35zSgGauUq
	IWTKDgdgQZCTrs8RFDQN6B2rfOecJU1KTi7InkZDuuEynj7knP6WNIIWtF5DKEiwlb/iqEU6CpO7e
	rt/bf/XjN8R2e9LR1C4hLC/3F0GAEs1jX+y6qqWXmku7rtO4Hd7VTNluKCF7pFQ5lS0HNpLOyoJqQ
	HW4aCJnJx1mHCClB/XJwiiLStWu74trXZucR45+6omFcUtCwSSA/xxVH5lw7rqkaKRE9q4C+F8xPK
	ze7CYNx6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYHCa-0005sZ-9y; Thu, 29 Oct 2020 23:19:28 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYHCX-0005qq-Ov; Thu, 29 Oct 2020 23:19:26 +0000
IronPort-SDR: n/gJ+SPEfRrVB+8kq665Myl1hhDTzenDH5LdrreSj9OvWIn5o1RyMmu3KupgA/+ZSjvCsQGyJb
 ZCCnhCK4fjfg==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168625695"
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="168625695"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 16:19:21 -0700
IronPort-SDR: EacVCkt+Idgux8T4QRvqC2LMmznM5Ir3X8oA6NfvJL0wKj6klWjU+RQkjfw91fepr7Z6yScah7
 rVmIJkdsu4eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,431,1596524400"; d="scan'208";a="361665180"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 16:19:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:20 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Oct 2020 16:19:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 29 Oct 2020 16:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbQH/NrgqaX5kmQOZ/Xq+ZRb+8ln/I9hK7r6pVi0aS/+2pJk1bdF5QNtm+XFxD9no6kDeZV4EQ4WZOBhWq1+C7wf0cB2yWGSOwzebQGf3QGz0OzSk8+C/yH2EU2hkWOqlx64TtFOm4+lKFQygb0kYz/a+gaNR7+/wn6sEHakQps6QlsSAqaIkk7cK2XhUkK7KFeNDyablCPtpdbiKaBJPtt7X+0qICHq6qX9j5rr3NL2Z5wktZNZ3OVoj2uJuKAu8RPLjXoup207APV6q7Z8PLqPmE+k5VZBPeyP5kRDylgg9S6msjkb3mvwDHvU2+srT6LSWsM6fZarfJiV3w1raw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlkKRLsjXRaHph13IEtdL+fwzUtGJxn0yGzCa4w0aVk=;
 b=MUGZRjmjMNuBm3+ARIyIKugGHVq/t7Sb+pFexPEMAy4paCErbr50dxVmvbDow0gQUsZspPx1/2U+jFoBt8k3hwBPORixH5sR9+6DAQ8IsfE3q37skCR3vZTTSV10uzsHnf1cdN6H75K3rhoOtCedjVVxuRnos/PVaM2FJPzXyshdTYwqmJMif6SermJrUgOaYQnl1r5NSba6eMwj/qTjrLAqKAd+fnst9gIAfMBf8wmPI8YakluTn1km43uJRZne/xwe/Q48lUDL/8yPnNP9sYsMEOIPB66bMoBGaH22Byr5oyT9MjNK2o7I/4UX1OYy0hiKRrxzfN+ArH79BagCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlkKRLsjXRaHph13IEtdL+fwzUtGJxn0yGzCa4w0aVk=;
 b=sHYtkacOjt3LFvR9Pc4YdnBzPAVMrCEGaOoYT2ZV6YM4vRDf3C8tedmx4KrAqKglWC5ZyrNx5G+N8CHbCPeqcCQahok9UHWTbtWgy8FHv6dMDuErAzzmDvCWpCD9t4o9ovOPBUay743zafYSmTPJb01chYTVqpbu7SpxH1aUd/k=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Thu, 29 Oct
 2020 23:19:18 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Thu, 29 Oct 2020
 23:19:18 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmtiYWAgACycACAAQJvAA==
Date: Thu, 29 Oct 2020 23:19:18 +0000
Message-ID: <604554805defb03d158c09aba4b5cced3416a7fb.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-3-rppt@kernel.org>
 <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
 <20201029075416.GJ1428094@kernel.org>
In-Reply-To: <20201029075416.GJ1428094@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.54.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b7bebee-1e29-4c9c-7598-08d87c610f9d
x-ms-traffictypediagnostic: SA2PR11MB5082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB50828EBA8F73327589D59CA8C9140@SA2PR11MB5082.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UgzqgZYeU8jfSl1RANTSDQVihV2tNzmYTaoRyWHKVnYvN1TpEpoTiRweZgwrTyADA/0EiNOKvqhPYlSerPNMa8zqLysQcbWgO8Uc8XkEKlFb7cTiz/7fQ7aSn2lAro8E01C3ccBoGKrZiBKXJ1h6d0wHDwvu48fEH97otaumd5A9S5P+fcFF59NzDFA8NEepzKL74vcGUdRnQiTBVEs7X73BskSpoLeKeFQBlUgjrqKqQ+I2zZpjE/idOjAfB9OankgHYeVBnGfQZGAIvASdYBziAczns/dAoUHSJahluC+VEul24cigmmjiaoXDcUNXOr0xF8I7bZ8PIsxYmvrbMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(66556008)(66476007)(64756008)(4326008)(4001150100001)(36756003)(86362001)(2616005)(26005)(5660300002)(6916009)(8676002)(316002)(66446008)(76116006)(6506007)(91956017)(186003)(71200400001)(6486002)(478600001)(7416002)(8936002)(7406005)(2906002)(66946007)(6512007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qpQYqLLAon6LEwZNKLf4AJoZIsa5wxWDCF2POHArhqq2sq0RAoft4XlpAAj3tXijW3TRCXkMnq6Q4pGPabqXlke4WaF/L0OoZUcxo37QkQICPzfK+sH6tN5bySuFYunrXiGYCD9mpmSFKLvjrRWuFS1sWgU6RFQpskC4Jqp0hqPqMxnH0c/+7bCp8iQzjOr+/spmSCsMiN72buLP93ri9slBRVy+Xgy8Tj15HV11todUxUGqd0tuIxEjdlGPgnUDCOWCSiBRttiQ55fopfmsUzMKwDg9wSJRfe+33Pv/rg8XxszxNvl8ry9wK+a76rqmxqBjdKGpgqUX0Y++avBcOCoVbyf8WlmSCBmc1WRd9SU1ECGwr4VEgxkStmIfBUwX4/fRBTEwJZQNrikMz/5cgPtp52W6DHHLMb+8NlGJUmmPs6Bqd5hksKQXr4f5tpxkyrtqt7CFjuoxG6K8mBGss0PlQmZqt4WxqfD+ltHzKVXCEYr3Mby/ixDfZJG29utf45p27F0bv/9WiHvSomx8vCuqnLXb13yjSyN54tkBVoLb6Awzg+aWcGCf7EPJqiuOp0V+OoxjE2d0mRwYXrL8RaQchOrFND0P28/O1D2w4EuLFTY+D+8pAj9zaZmqbO1unoZfOAhPGNaBCn/gT2xE+w==
Content-ID: <11D21EDBF291D74CA174712AD209EB75@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7bebee-1e29-4c9c-7598-08d87c610f9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 23:19:18.7375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S68+5zl9Am2ZgVcrJ/pW6AKc6OUcFGZR0mmKsMuUgDr667MV1ftgnOIEAjIt9PWAiwy3DII5co5NazSo7PXSDuMpAnCYXlBH0vmkUxaOZ8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_191925_934887_E7C1DA74 
X-CRM114-Status: GOOD (  16.01  )
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

On Thu, 2020-10-29 at 09:54 +0200, Mike Rapoport wrote:
> __kernel_map_pages() on arm64 will also bail out if rodata_full is
> false:
> void __kernel_map_pages(struct page *page, int numpages, int enable)
> {
>         if (!debug_pagealloc_enabled() && !rodata_full)
>                 return;
> 
>         set_memory_valid((unsigned long)page_address(page), numpages,
> enable);
> }
> 
> So using set_direct_map() to map back pages removed from the direct
> map
> with __kernel_map_pages() seems safe to me.

Heh, one of us must have some simple boolean error in our head. I hope
its not me! :) I'll try on more time.

__kernel_map_pages() will bail out if rodata_full is false **AND**
debug page alloc is off. So it will only bail under conditions where
there could be nothing unmapped on the direct map.

Equivalent logic would be:
	if (!(debug_pagealloc_enabled() || rodata_full))
		return;

Or:
	if (debug_pagealloc_enabled() || rodata_full)
		set_memory_valid(blah)

So if either is on, the existing code will try to re-map. But the
set_direct_map_()'s will only work if rodata_full is on. So switching
hibernate to set_direct_map() will cause the remap to be missed for the
debug page alloc case, with !rodata_full.

It also breaks normal debug page alloc usage with !rodata_full for
similar reasons after patch 3. The pages would never get unmapped.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
