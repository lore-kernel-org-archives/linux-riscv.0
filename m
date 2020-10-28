Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F18DC4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 21:16:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB00624837
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 21:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGMEAB6O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.b="Rldddwmx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB00624837
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EYk24dL6L+cnS3diWv7TM9/je2f8WSHJ3bxpyiwM9Q0=; b=PGMEAB6ObXsFoqMdZKpcOtct3
	YyBHMJVnsi+r44bYA60SkCEC1XIgQrL9wMlVyV1LRFaCO8Y1SKIIbxq9k+b2YzI5eQYX5gwIewySF
	pi/3EMIk89W673VQkylb1KsnES31LU/BEHyDNAxzkRPbXgJfrqDCWXTdC+9cF7ntnYZqfslrJD+CX
	JqbMP+BC4zuHRMt9WnoyZLwUlEGgoh+uk1fILB0ogzrXQGb1X1iK3xS0qp4gfPa+aZZcJPI1CUt0D
	nZf/oNZmGvIVH5gfURzeiRKC0RfE+mKZL7eCwrYroEM8PIKq+fs7+OMnIvIpZ93PMUxgouAWJPibL
	lNpfXQfWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsnO-0004eG-3C; Wed, 28 Oct 2020 21:15:50 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsnL-0004ce-9Z; Wed, 28 Oct 2020 21:15:48 +0000
IronPort-SDR: GjRNYY9vxrvcCneLCXPNRnsDThdp8HuMPM7FZC50cnoPO0O/ZYQ6R88c5ylUn3xvgYSgXkfeBd
 vGe0iqvfU00Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="229977385"
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="229977385"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2020 14:15:41 -0700
IronPort-SDR: gtxxgM7N+xzhVMbZb4ZlUx7yJyo24qrJipNYJQTRA2Wvm5a7usoSj1q3M2YWM3r9xQ5lKbqV1q
 4vhc2nYCdbAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,428,1596524400"; d="scan'208";a="350743016"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 28 Oct 2020 14:15:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Oct 2020 14:15:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Oct 2020 14:15:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 28 Oct 2020 14:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naKT6xdjpEwEJA3sxk3yHS0jrS9werBjDLEOe3dU8mUC+vFdYW2+azxUrriFxqyFbMMpYlha98nRyv4CMac2gjywvxFJ7WTLbXKtkUjf4IvrtnBptnSxJjOn49/uLngChecGNdhZs8shVSXOAwy0XvfN6NYOftHFlXAZKCjtnZvI//0v0LJCKpY2I7VfefAL/1y9RGWz19Jtqokokp509riHdJ8mBPblHTFq4zAhL7+p/DLy/QoeX3L8zYj8oBggCzO/W53nyFJS57I2pCD1ONeAqnjRNn89tAUO+9tErdImFsnVRIB4nBU5nWpyLF62YCVJusTv9sEQrNKjKJTsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjndY2lYTfTdjTw8DdB0/klY+dGykydX7sBoy2Bru9A=;
 b=mqg2fID2oqgNaHfgwliDfSnrTnVq6p1eCrhfHEi81Lut2tfzgBPy8m5o62uu3httxWZiOGoGaIZXyycvgeHHX4L4G75hbn5hpxaalwzRMs5lNO7Xjc9gcshDsKmRITlL1h0O/oOBj/AFolM5nTkgFt6EGTDKkwL11EEwC5PxM88dvq1f25VqfamXhfl5LR14K3wyD0mGqW84JIhXnRcDZk7CQODi/jTYiMasf3mFaWJyRPeXGnCsbmcrhBOgYWyT0isKCDN1Br8mCiB+dOmI5tkd7SQ2viPFkr0LJIsK/QslxnRXorUforv8AyxIO3ddygCr4TUK5hmZpxs3LqcBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjndY2lYTfTdjTw8DdB0/klY+dGykydX7sBoy2Bru9A=;
 b=RldddwmxQygxC52mi5QuDfOFMM7cUNsr2HVeBQFjPIzBtZgtCDaIP6gWal9RdEnw1mal8aJzD7ZBPSymSizi7yMoIQ9bezdz1nin6Gl+E8/okLm5AJ/U3B03pOigbpAX+RmHS36romkY3WVvfLV6fFBwOXEn3V6ZhNt4N7oa0SA=
Received: from SN6PR11MB3184.namprd11.prod.outlook.com (2603:10b6:805:bd::17)
 by SN6PR11MB3280.namprd11.prod.outlook.com (2603:10b6:805:bb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 21:15:38 +0000
Received: from SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704]) by SN6PR11MB3184.namprd11.prod.outlook.com
 ([fe80::b901:8e07:4340:6704%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 21:15:38 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages in
 the direct map
Thread-Topic: [PATCH 2/4] PM: hibernate: improve robustness of mapping pages
 in the direct map
Thread-Index: AQHWqrf6LRJhAvsqzE2DP+hB1ynbOKmtiYWA
Date: Wed, 28 Oct 2020 21:15:38 +0000
Message-ID: <3b4b2b3559bd3dc68adcddf99415bae57152cb6b.camel@intel.com>
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
x-originating-ip: [134.134.137.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96bb975e-2509-469a-dcd9-08d87b869e7b
x-ms-traffictypediagnostic: SN6PR11MB3280:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3280D14DB862EF38BB86EEE1C9170@SN6PR11MB3280.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vxRQYMBT+wNP4IwGhgFILe3n5aZvgwKXdHnC7hfcwzY8hJXisEz+U5TZFRNLFQ5hFr9aLfk80cB+ty+6N0dakPJuEpFLHF+ezpLDwP6Cf4hI2PTyqpTwGISUZ2imwUOFuhPpakvV0WSxqwxuOfs0alovc4YsAxrT86pumb7jqb4fXODlWF88U2QBhB6tJ+4lVaPG3AZ5dTMtc6wz/Sr8YPNyLBWrCltG7HOctONX1fIDU3XUcyIjSy4QIWt5pg6ZCfRoPqlsHLAfHnrRrxb1H3lU3/mbLJqfho5eoKsQKBLBWpwGFvmYaP7AtVgy0Goc9RmOR5AGCHs7z9NahW9s+Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3184.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(76116006)(7406005)(91956017)(36756003)(7416002)(6506007)(6486002)(83380400001)(86362001)(2616005)(2906002)(4001150100001)(186003)(6512007)(71200400001)(64756008)(4326008)(54906003)(8936002)(316002)(4744005)(66556008)(66476007)(5660300002)(8676002)(26005)(478600001)(66446008)(110136005)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kCUbV3gAcUCX1YObZMPYByBb1wLvIhoX2RnJI4Gonw08TfaKjAueXfxIFAO6CdPfQpjxec47NMZYQ4zS4gXYOuU36yNPPfmOskmsD+GTVjr9xuGDXQ0uoAw26Arb3hK4ftZBYOaKs//PFQv16tXSGkYjr7wna4ZMXwwoLCxnNMr/2zHi/guO/Bnhw620P7JQP4B435O6g0G9rhAket7WSYjKVCjkcfQgB4KeTGSUCYP+K5/GxwWJO0/+fsw1jATb1c107ZgyGD2IO0WyN/+Xi0DsY/11iv3g3yNdJCTEVvTjh2LE0izTR1/ynV4LGGemVTBLvmHh6G8BYx8DN4J9B4zLk2BZrzOfpD5Ah/4iRNgbx/akVy/LBIH7IcRQA4gSaU2tM/d7sXFKLsnbV0c4HNsukSjrwwlnUs//iQ7TjKhhvCnHgD8b0xoTrSff/TrYAgEdwp5FtunLhvH8Llx0n//0fxVogmh2MbY/fj/SS2lsfiAKNgj4eWzaduZNaYktad8GT/wwamS8UC5UEC2hcXFK4KCjMSVkJRh9igsvfdVR87e3dVk8gph3s7ZZF41RJVxyplHXlM32dwcuXq3Xh90S3x/Mip9QcxA8riMxAVdF1xrx6chpXhn4U/erdk7TXHA3hwkI6Ui8PpSiwpSUiw==
Content-ID: <CAF0959967EBF445A06BE79466629D75@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3184.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bb975e-2509-469a-dcd9-08d87b869e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 21:15:38.6557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9aQoHtg1DLalfWBo37yiD5QdwvCp27cYz444ezwEcRbr4c9AbdANp7KtHAQUhEheH7ZO6hcQGXjo+702UBz/jUmQRaMObIf6tnKcryR3ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3280
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_171547_468541_5F3B72A2 
X-CRM114-Status: GOOD (  15.33  )
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
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> +               unsigned long addr = (unsigned
> long)page_address(page);
> +               int ret;
> +
> +               if (enable)
> +                       ret = set_direct_map_default_noflush(page);
> +               else
> +                       ret = set_direct_map_invalid_noflush(page);
> +
> +               if (WARN_ON(ret))
> +                       return;
> +
> +               flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +       } else {
> +               debug_pagealloc_map_pages(page, 1, enable);
> +       }

Looking at the arm side again, I think this might actually introduce a
regression for the arm/hibernate/DEBUG_PAGEALLOC combo.

Unlike __kernel_map_pages(), it looks like arm's cpa will always bail
in the set_direct_map_() functions if rodata_full is false. So if
rodata_full was disabled but debug page alloc is on, then this would
now skip remapping the pages. I guess the significance depends on
whether hibernate could actually try to save any DEBUG_PAGEALLOC
unmapped pages. Looks like it to me though.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
