Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B28C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 14:24:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D12C61183
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 14:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D12C61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8qVsQPlitILuZY2L7pL9NcDAtdcWEFZPcZgrt2ecCuM=; b=a1z/SxnLOUSaVVKlI58Jmli2I
	VqWHSm7xe++Iq3iN2FRpPuGL7+/vhfF2Xas0i0Ik05XhF0xiY25JTbMrCTwwVvWyqucH21Hv0T2Ff
	R9pcOEfZrHq4NBniBjXH2ZzVRkWnva4kINvHybooXCsz3EWiqRl/kV4bjWj3cQxI1ORGS2OamCOTR
	i3b2MvYfMpUViv3s1R47KS5hq4GqGwDyBwMdFYzJr6S9DNbzy0/nScQj56xEQJQ8cLPdFN2n1Y0dg
	XrOsevQ7xYBXitf+ZsJTkDAijk4bXnARacVncxEzVn82ffknE/d/0en6O6A+42yl7ysMTWh1X3CBD
	9TrHTX9NA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldvyH-00GM2X-Pn; Tue, 04 May 2021 14:24:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvyF-00GM2R-TO
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 14:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SmsKdExe4v2/sba9NMdGCfTO5GZ4kk9/eWEOLFyUMCs=; b=lkWLAhHOkruA9P881+D72FUxzc
 /Fe4PZC+BFRB72cVR3KAlVa/klr5xQ4GQg+LfztJ3MUtqxfjzFsfOSxcIrnGb4lBoP0oHmDLscS3d
 0udv1kzj0tbj/rmidrO9CHoRDYNCiTnCfP6BT/rQnQhmDDil8514gtg8GPzP17JGIl9BjDtWlnMRR
 dCh3hbIYBz94Hl6K+EvSjVKLSPFyFTvTTFsGX7bc/4jT8yp3kiyeM0m3SCBx4/LpknKXLRZI79fkI
 McdeM96zSfWFZW+3oNaz+2sG2Wr0GuPs8RWMs+NSJD6Kvw3Pa79v+O0zuiTNFSz62gb2n0UnfXEM5
 M84LBfOw==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ldvyC-00429c-3E
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 14:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF76AED1;
 Tue,  4 May 2021 07:24:05 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF513F718;
 Tue,  4 May 2021 07:24:03 -0700 (PDT)
Date: Tue, 4 May 2021 15:23:58 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greentime Hu <greentime.hu@sifive.com>, paul.walmsley@sifive.com,
 hes@sifive.com, erik.danie@sifive.com, zong.li@sifive.com,
 bhelgaas@google.com, robh+dt@kernel.org, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
Message-ID: <20210504142358.GA25477@lpieralisi>
References: <20210504105940.100004-6-greentime.hu@sifive.com>
 <20210504134632.GA1088165@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504134632.GA1088165@bjorn-Precision-5520>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_072416_254612_69E17D20 
X-CRM114-Status: GOOD (  29.15  )
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

On Tue, May 04, 2021 at 08:46:32AM -0500, Bjorn Helgaas wrote:
> On Tue, May 04, 2021 at 06:59:39PM +0800, Greentime Hu wrote:
> > From: Paul Walmsley <paul.walmsley@sifive.com>
> > 
> > Add driver for the SiFive FU740 PCIe host controller.
> > This controller is based on the DesignWare PCIe core.
> > 
> > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > Co-developed-by: Henry Styles <hes@sifive.com>
> > Signed-off-by: Henry Styles <hes@sifive.com>
> > Co-developed-by: Erik Danie <erik.danie@sifive.com>
> > Signed-off-by: Erik Danie <erik.danie@sifive.com>
> > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> >  drivers/pci/controller/dwc/Kconfig      |  10 +
> >  drivers/pci/controller/dwc/Makefile     |   1 +
> >  drivers/pci/controller/dwc/pcie-fu740.c | 309 ++++++++++++++++++++++++
> >  3 files changed, 320 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 22c5529e9a65..255d43b1661b 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -318,4 +318,14 @@ config PCIE_AL
> >  	  required only for DT-based platforms. ACPI platforms with the
> >  	  Annapurna Labs PCIe controller don't need to enable this.
> >  
> > +config PCIE_FU740
> > +	bool "SiFive FU740 PCIe host controller"
> > +	depends on PCI_MSI_IRQ_DOMAIN
> > +	depends on SOC_SIFIVE || COMPILE_TEST
> > +	depends on GPIOLIB
> 
> 1) I'm a little disappointed that I reported the build issue 6 days
>    ago when we were already in the merge window, and it's taken until
>    now to make some progress.
> 
> 2) I would prefer not to depend on GPIOLIB because it reduces
>    compile-test coverage.  For example, the x86_64 defconfig does not
>    enable GPIOLIB, so one must manually enable it to even be able to
>    enable PCIE_FU740.
> 
>    Many other PCI controller drivers use GPIO, but no others depend on
>    GPIOLIB, so I infer that in the !GPIOLIB case, gpio/consumer.h
>    provides the stubs required for compile testing.
> 
>    We could have a conversation about whether it's better to
>    explicitly depend on GPIOLIB here, or whether building a working
>    FU740 driver implicitly depends on GPIOLIB being selected
>    elsewhere.  That implicit dependency *is* a little obscure, but I
>    think that's what other drivers currently do, and I'd like to do
>    this consistently unless there's a good reason otherwise.

I will drop the explicit GPIOLIB dependency and push it out. For (1) I
agree with you - I merged when I received some input - it is reasonable
to avoid adding it to v5.13 material for this reason, apologies.

Thanks,
Lorenzo

>    Here are some examples of other drivers:
> 
>    dwc/pci-dra7xx.c:
>      config PCI_DRA7XX_HOST
>        depends on SOC_DRA7XX || COMPILE_TEST
> 
>      config SOC_DRA7XX
>        select ARCH_OMAP2PLUS
> 
>      config ARCH_OMAP2PLUS
>        select GPIOLIB
> 
>    dwc/pci-meson.c:
>      config PCI_MESON
>        # doesn't, but probably *should* depend on "ARCH_MESON || COMPILE_TEST"
> 
>      menuconfig ARCH_MESON
>        select GPIOLIB
> 
>    dwc/pcie-qcom.c:
>      config PCIE_QCOM
>        depends on OF && (ARCH_QCOM || COMPILE_TEST)
> 
>      config ARCH_QCOM
>        select GPIOLIB
> 
>    pcie-rockchip.c:
>      config PCIE_ROCKCHIP_HOST
>        depends on ARCH_ROCKCHIP || COMPILE_TEST
> 
>      config ARCH_ROCKCHIP
>        select GPIOLIB
> 
> > +	select PCIE_DW_HOST
> > +	help
> > +	  Say Y here if you want PCIe controller support for the SiFive
> > +	  FU740.
> > +
> >  endmenu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
