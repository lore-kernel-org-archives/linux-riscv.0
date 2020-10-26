Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E248C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 00:54:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C53121548
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 00:54:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QUgnOcsF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="mG1NfB8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C53121548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oq+nFxzGB8qIF8fXOWgc1f7nwuuQ7y85bXd1VkRF7DE=; b=QUgnOcsF2xN2Onasf+j4BqdCa
	dYunQMYbV/n6zEh/goQywpFgp/Mal+4/JRx1aPX3m+3EqdGbUs7/XhUk7Ri5wlTdhOhpFETu9ksyg
	9D88Y7hwtXVWiaMxWwRfdb0scjbByJ+86OjcIu5AFMnw9UIcx4/BW6Ty5oV2hOTCTX0zaf1i/Pwsa
	TfeZCA+ZVK7cxPjqb9pSCQctNYBn8fx6I9CfaILGDt3a6w9oUoUg+X2NrM9A+0hWZJWNg58wxbMi9
	KtSCl2BhV1KZE2APGSEu9oQpxCdUiVz+yBGWOZhIGq10keP+wmWtzx5xfYFfyJMYOhO0QoEfN5uoG
	ErWgnpFNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWqmM-0001FH-Gk; Mon, 26 Oct 2020 00:54:30 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWqmI-0001EE-KQ; Mon, 26 Oct 2020 00:54:27 +0000
IronPort-SDR: Mrqnb7tzyIDuHHtIjkEc+XW49kJutQbbf46859vWWZEfMrLtKAjP+3c7yAT1W0PRljtwH8RK5M
 +DWIh1pmnelA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="185583420"
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="185583420"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2020 17:54:23 -0700
IronPort-SDR: HN9nkUjtT1hTkoq911CDEB08SF0czOfL4YeC4arXtATrh4XjZoREB7hvV5VMSsmJjtsULFMr0W
 XT8zwE5BJYsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,417,1596524400"; d="scan'208";a="525331540"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2020 17:54:22 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 25 Oct 2020 17:54:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 25 Oct 2020 17:54:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 25 Oct 2020 17:54:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpHSVGRCK8WzsDWqycSIq5SDuTOif1r2TUQIdu1h5meueiZkJl0XI9vIz/ZO8BALxFoWAcDeVaAVeNXaGNR7GxlNJwNpPE5yLDOrEJQl4yml17TOrK9PpCbuOh8FJaxTq/HFOZEfqgBan+itXvRafr3axE4tr437DR5vCozRtDo0kcGbmXtc/5JmIu/QCy064xU6gOavwab16qbGTQ1+GQOOfXWCP1ZXE7La2fom21hQyDB+0vO08teGtG0MRFz75aAxQ+NQZmP5KyNneQBs+gnjkYMs5GlEp+30Sf9ddmJsxVe/YegKL1TthCRAafP4peUT7nvXI/+8+p2c8ac+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRWgkX3wTOs8LWwscatjLHQQw9l2RnFQe7QSWQPoBvs=;
 b=gGScUFlXUQDIZ72EX64vvudqbjymw6skJ3YqDhNwTN0IpZXZD4Nt1isn/4i4mJd9EBR1BkGvbkAGC9YloQ13gI9nw83p3J8NoybmftZbHyUtxe+3dqMrR0+tpMZOJwyWYXrj4rT6fKjiQstxTwZE75tdNAn/6ohQQyUXZrh8p8ixDkAaWRdiqtw5sQhYl7b+aMGrXgXG0lgZPB+HWALq5xVl+fIiZ/iWO9RwR8uzSuadToj0NyIYxmNVWp7cbwpVBaPPdpCvJU77ft6QyW8etmAYzj57KkLif6lAeEPW8KL1xHpbdtjgfTXi7AAMCUfGwG0cEJpKdHB6FmbUquMH/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BRWgkX3wTOs8LWwscatjLHQQw9l2RnFQe7QSWQPoBvs=;
 b=mG1NfB8KzrhjpW6MkTek6fmb1nGtzTr5kMOpMEljQMk3V9CBH1xTYoWoUqpqNaXB28lCgSLvRMq2Z3T+l4xdL5FIHGfD3ZV9BrGiPCXXPc3JFbKxSFq8EDRZ8TEvb6JpRZPpK05a1NJqQSZhsInv1Ew68rQlDYaZYaKTDLwdknM=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SA0PR11MB4606.namprd11.prod.outlook.com (2603:10b6:806:71::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 00:54:01 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 00:54:01 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 4/4] arch, mm: make kernel_page_present() always available
Thread-Topic: [PATCH 4/4] arch, mm: make kernel_page_present() always available
Thread-Index: AQHWqrgGgdwDAwy5cUu01lVq6vOTuKmpD4sA
Date: Mon, 26 Oct 2020 00:54:01 +0000
Message-ID: <979889bf987fdc7268a973fe7398198bfad1644f.camel@intel.com>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-5-rppt@kernel.org>
In-Reply-To: <20201025101555.3057-5-rppt@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.1 (3.30.1-1.fc29) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.55.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 794bf28d-df69-4611-d787-08d87949a137
x-ms-traffictypediagnostic: SA0PR11MB4606:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB4606B6552F6501FD8D221323C9190@SA0PR11MB4606.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fpsZHvV7qYqVZkCugBUPgRi9DL10h/AUHnveifgqN9JpA8IFkUv7bt5xz6eGR/ksklqW+9+q+128RgXC3thRkQMIkW0PlUlukp3wAnmnY8otCvotpLJTU6Jktfe/WkvTsx+XpDygoVqigXpodFPS/TFPX4RjXKgE89S+0cerqvk4tfpvbxC+JiIH0Gv14+gp4/5uCmxJYQQl5gRu/P5ZoeCbeBehBEZ22910ojoSjV6bWBubCt3l1M4q+nYdULkv27GRgV1gOq1STzO7ZoygRe84LfUZpxoWFsRuqM9WL1w+NbH3kRPu4OwmXWSLwdSdFjFc3hfIZaCZzdh7dsqHBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(6486002)(66476007)(110136005)(4326008)(8676002)(316002)(478600001)(4001150100001)(186003)(8936002)(54906003)(6506007)(26005)(5660300002)(66446008)(7416002)(83380400001)(64756008)(66946007)(86362001)(2906002)(71200400001)(7406005)(2616005)(6512007)(76116006)(66556008)(36756003)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: WAIHpPlEyh9DlbJJ/HkKEjOrj3rQTFAXq28J6rFp9fxqgNatbPTiPYg+oeGUXvggbItHHwuxwqsxuG6AHxqEF1H9fPV5AzT8aRT17vKmThSysopdmlhcVvH2YwKru2BULVmzfJaFRPwRyZrWC7betBc97pFfyUv/lQos2cQpLXO8RMD7hWxHmtGc7sobHvEjBRmSyNswdy3x4v9DDvM9xpeQRm04NuS3OxLwdMn6L4G4gCi1DawpuiAXBBE987W6RCIpQ2G1tj5yBfk18Y2a1SFz5pdWBppAbYAyn/6X5nSecw5hdRDQx1SOuSfNMp2WJPMMLZ/3QtLQXeWwkasoz83BcIXEBeNEPnDb5hz6NM3achdThdAJUjTwgT6ErCbulmK4JmMrv6dfPxonICRckO+uqE9BpVGau9aZtECbxJBob8557MktYD4Fkv0DqruhhH6CPIUQAA0uGbwi4tdDjA3kjBqjTmLY3KXT4kDpr/qWpD3rgANwbJ0U8KF9XTPrUqnVOhZGB5JSRwtsrixZx69oZTLagHwd4QCZHDfBfnolAA51+Jfc9UCU330/TO/52wK08EmwiG+6DH4pPU4430qKKkR6IV8mQpOGF4h4roux8zLrDgmSXZahvSvdkf77d0vvPMrFXqLeR0g5ZSHcpw==
Content-ID: <3D4CB5DDF3DD214BA434D481A4E9F078@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794bf28d-df69-4611-d787-08d87949a137
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 00:54:01.5631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1jBix2rtmPMikGlcaNeeA3YbAxRYzrAps7Fk/uxDW3dOkih6NNXzKLnvvbPTR1ZWAlg7y969nwvK8cVE8l7Usd+u1HEw4Gt3mXtH90WVL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4606
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201025_205426_854578_B99685F1 
X-CRM114-Status: GOOD (  18.27  )
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
> index 7f248fc45317..16f878c26667 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -2228,7 +2228,6 @@ void __kernel_map_pages(struct page *page, int
> numpages, int enable)
>  }
>  #endif /* CONFIG_DEBUG_PAGEALLOC */
>  
> -#ifdef CONFIG_HIBERNATION
>  bool kernel_page_present(struct page *page)
>  {
>         unsigned int level;
> @@ -2240,7 +2239,6 @@ bool kernel_page_present(struct page *page)
>         pte = lookup_address((unsigned long)page_address(page),
> &level);
>         return (pte_val(*pte) & _PAGE_PRESENT);
>  }
> -#endif /* CONFIG_HIBERNATION */

This is only used by hibernate today right? Makes sense that it should
return a correct answer if someone starts to use it without looking too
closely at the header. But could we just remove the default static
inline return true implementation and let the linker fail if someone
starts to use it outside hibernate? Then we could leave it compiled out
until then.

Also it looks like riscv does not have ARCH_HIBERNATION_POSSIBLE so the
new function added here couldn't be used yet. You could also just let
the linker catch it if riscv ever enables hibernate?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
