Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176C606A32C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 12:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXjAVnt0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aS3IHyWQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1BXZiKNjsTAvZCxr1inG0kGoFf5Tz2JU3sVDSOhTwo=; b=hXjAVnt0uMWy2vpDLrh6/q5P6X
	mxysatRqTogHHPjoEuSw0vb0KshCZWxhk/VaeLlkdL8WleQuK1wxoJlsnB5cfF1zlqwU1l4vWj7Yp
	zW/+IgH/V4RH0h3AHrLW/8BZEG9D1X89JfROaHcCTLQFr83JIRtlbG1vf/AEARt4nTe5PEPyOULqh
	G816HK5RliQno/XUn0+24C7JOCTL11doBvnVLIIVbHEFJqNNYJtot+Oeo/TqwcG0Jze+xyBvcqXZy
	bEz9P+CYROuv7yv001mXq0Dl74K20Ju0x1UXz8AcxqO7wu9L53CUh6oEy7LH9GWfZ9wXswgbIRyzn
	KipE8o0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZfY-00000005F5F-0AVF;
	Wed, 04 Nov 2026 12:00:44 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZfU-00000005F4H-2FMg;
	Wed, 04 Nov 2026 12:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793793640; x=1825329640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JrJIZS7mdC2DNBsFz30CB/vSL/nLJEAA4va9gpdgOXI=;
  b=aS3IHyWQ7H96qmfnrabJT97DZXtH9/ZWvSlMtfb27kJsTRnVgL5rYVwg
   6NWqidFNMf1JRfM4ixHaDLxNDusTVDxYCXbWFzFW0CUO5CeZ1+8OsYTmn
   IO2+sSO+N3dggSYO/KU5BNrnTgE5N+ZWIWdhrICHRx0/y1ZrwG1NqIYPI
   jSFp6AgrcahOJLwUG/g9e4NRBYOtIEcnyEdrR6shh3RGAZwLQNdJNWDf7
   0bRYCXQwpmBXtPb1Z0nrjPVBQD6hM8A8RSdzDSL9VqKLIvJ4wCEP1Ci9W
   0nkXFRhGVedNqVvFyWMO/M0FlldhhrRDU/GovZi1JgLUyV0xFMUpr5fdn
   A==;
X-CSE-ConnectionGUID: BldBvp48QA624j/Eyb4XzA==
X-CSE-MsgGUID: Rjhht/U/QVWUjStUyUtZbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424972"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424972"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:00:38 -0800
X-CSE-ConnectionGUID: UyX6S0NrR8Cn/t3ekVp3Kw==
X-CSE-MsgGUID: RILWyBVVT9C9yvWe+V/zQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="7047392"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:00:35 -0800
Date: Wed, 4 Nov 2026 14:00:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Viresh Kumar <vireshk@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dmaengine: Convert to subsys_platform_driver()
Message-ID: <auseYVGGYnxXMCUf@ashevche-desk.local>
References: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104113302.1634102-1-peng.fan@oss.nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_040040_610419_6E45C06A 
X-CRM114-Status: GOOD (  11.09  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 07:33:02PM +0800, Peng Fan (OSS) wrote:

> Replace the open-coded subsys_initcall()/module_exit() platform driver
> registration with subsys_platform_driver().
> 
> No functional change.

Ah, good one!

>  drivers/dma/dw/platform.c       | 13 +------------

> --- a/drivers/dma/dw/platform.c
> +++ b/drivers/dma/dw/platform.c
> @@ -194,18 +194,7 @@ static struct platform_driver dw_driver = {
>  		.acpi_match_table = ACPI_PTR(dw_dma_acpi_id_table),
>  	},
>  };
> -
> -static int __init dw_init(void)
> -{
> -	return platform_driver_register(&dw_driver);
> -}
> -subsys_initcall(dw_init);
> -
> -static void __exit dw_exit(void)
> -{
> -	platform_driver_unregister(&dw_driver);
> -}
> -module_exit(dw_exit);
> +subsys_platform_driver(dw_driver);
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Synopsys DesignWare DMA Controller platform driver");

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # dw

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
