Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D132C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 03:56:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EBD264E05
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 03:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EBD264E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gn2jPA1rXMmTxXy6JyzSxvskGXXWrg1cX448MMViWMY=; b=QKyGuM8fXMz/G2xpbq3UXr4BS
	qX6LDiCo6ontmmTLTqIjwSzedB7Y0nMThHAsiYGFRs9LFIC0OL3rO8i1cbg8nlux8KCBN80uxT0Kr
	rR8io7DNXuOifThoJZWd098kKZNjvb2RfAYw6BdcQZs3zG0JjuhjRVeGLt+jYsBArFN3gorxWMsbB
	C9JYeMkG4QrxJbYGGRbGRLmf5tmlhoa1w9MHi6Bmg+wIJCGPA7IdF+IZudMZ7GZmu1mt+CA1nrXrO
	tsfyKNiyTdyIsCvqG7Fis7s4tC5FgfZBydC9m2OEDo3RjGdwFSOW9nu/BJ3qXBcF6hBGiLdP07qS7
	MikNiT1hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6FM-006RMW-3a; Fri, 19 Mar 2021 03:56:24 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6FI-006RLq-TZ
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 03:56:23 +0000
Received: by mail-ed1-f53.google.com with SMTP id y6so9213658eds.1
 for <linux-riscv@lists.infradead.org>; Thu, 18 Mar 2021 20:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zuozRhYHLPEHI/9P6pE8GrRW/dv3ARhH5puPoNBpR8w=;
 b=o4HyQlKr+ep9OdXryZ7yKCT5C+IVP07pETlCD8GHxECL4EzS7gDnIHQ/1Fnc8z8hGa
 B5MetrHkse7RURfDK5+CC6y6+zO4FTlTVfQXV/1dqgec+2FlNah/nG/u3pKTQAh4gq+V
 jOQR9MNOJDNSAN8cP3sQ40EsQe8IU0mQyE7Pm4zEVGX/YrmFTGWDuPV7h3TFH8QUqTfh
 XmioyMxx4BnZqex/RP/fAGX69nc3E43XJkrlpe6en8i8eD674MjYo7+PMDL/oQKbl36D
 nI8jQs8ZdlO+Z66DmaqlOcCAYcrr9guJMYYQuWI1xl9liqhyC9cVHJWGuUhv9tUul92h
 hJuA==
X-Gm-Message-State: AOAM532l/qPoiZN7XXjCOSHSHm9jYx+ycfLaDWtypVkREZOxI9dDcojr
 ALYEn5WKy2pLrQZzrChFfyM=
X-Google-Smtp-Source: ABdhPJxyssy9zDn2RmoeOErpQKJpYn48Kh+W0/J9I6FyH4ME5wlgtBlBjPohUOIs4WWNjivrfwKoqw==
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr7377600edu.268.1616126179855; 
 Thu, 18 Mar 2021 20:56:19 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id l1sm3287589edt.59.2021.03.18.20.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 20:56:19 -0700 (PDT)
Date: Fri, 19 Mar 2021 04:56:17 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Message-ID: <YFQg4RdOWUABOlPN@rocinante>
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_035621_373590_29D85136 
X-CRM114-Status: GOOD (  11.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Thank you for sending the patches over!

A few nitpicks.

> +title: SiFive fu740 PCIe host controller
> +
> +description:
> +  SiFive fu740 PCIe host controller is based on the Synopsys DesignWare
> +  PCI core. It shares common features with the PCIe DesignWare core and
> +  inherits common properties defined in
> +  Documentation/devicetree/bindings/pci/designware-pcie.txt.
[...]

In the above title and description it would be "FU740" to keep this
consistent with everything else.

Also, as this is a YAML file, a multi-line description might be better
expressed as "description: |" or "description: |+", of course it depends
on whether you would like or not to preserve line endings.

[...]
> +  dma-coherent:
> +    description: Indicates that the PCIe IP block can ensure the coherency
> +
> +  bus-range:
> +    description: Range of bus numbers associated with this controller.
[...]
> +  resets:
> +    description: A phandle to the PCIe power up reset line
> +
> +  pwren-gpios:
> +    description: Should specify the GPIO for controlling the PCI bus device power on
> +
> +  perstn-gpios:
> +    description: Should specify the GPIO for controlling the PCI bus device reset
[...]

All the above descriptions should end with a period, so that we keep
things consistent throughout.

Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
