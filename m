Return-Path: <SRS0=+Lbj=JF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3032FC433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 16:26:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1528610F8
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Apr 2021 16:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1528610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rHfr824KNsR4WQesRuEYq9SCjRmp9f+B4Uccsqh+skY=; b=bn7C9RYlyN9cyr+VXJLZQRx4M
	85usIHeO1Woov6OVp+m/rapbap1ngEeo4JVHk4+vtvuaWqrHVHQut/PTjJ1TcIdOCW6AmailsCeb1
	DGRXNR7IRa8dmvWKuj/Hnj4CdnSQzfOxBBfOTwwba/c5UQzJ/b4Q7IeYNOUzqb4COhpbHfuerPzfu
	XZGfdlM6Xzu+VtMfSTkoy5KvS2avdFV1yiXZQV5hM/kCBU5zp+OkFXKXnMTS2pTNTLivqEQv1jQxs
	DTbLAyaslpyO+yQayPeDoS78I0LNMZTQw1lwkRhNSF9ruHr69dGUV3dF4E4N0Ckjyh22ODAsWPVVt
	lIGkTJo3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUXTi-008cXo-VE; Thu, 08 Apr 2021 16:25:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUXTe-008cWi-Cr
 for linux-riscv@lists.infradead.org; Thu, 08 Apr 2021 16:25:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57886D6E;
 Thu,  8 Apr 2021 09:25:49 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFD6C3F73D;
 Thu,  8 Apr 2021 09:25:46 -0700 (PDT)
Date: Thu, 8 Apr 2021 17:25:39 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 aou@eecs.berkeley.edu, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com,
 khilman@baylibre.com, hayashi.kunihiko@socionext.com,
 vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
Message-ID: <20210408162539.GA32036@lpieralisi>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406092634.50465-1-greentime.hu@sifive.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_172555_128281_81BF8FEE 
X-CRM114-Status: GOOD (  20.83  )
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

On Tue, Apr 06, 2021 at 05:26:28PM +0800, Greentime Hu wrote:
> This patchset includes SiFive FU740 PCIe host controller driver. We also
> add pcie_aux clock and pcie_power_on_reset controller to prci driver for
> PCIe driver to use it.
> 
> This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon R5
> 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based on
> v5.11 Linux kernel.
> 
> Changes in v5:
>  - Fix typo in comments
>  - Keep comments style consistent
>  - Refine some error handling codes
>  - Remove unneeded header file including
>  - Merge fu740_pcie_ltssm_enable implementation to fu740_pcie_start_link
> 
> Changes in v4:
>  - Fix Wunused-but-set-variable warning in prci driver
> 
> Changes in v3:
>  - Remove items that has been defined
>  - Refine format of sifive,fu740-pcie.yaml
>  - Replace perstn-gpios with the common one
>  - Change DBI mapping space to 2GB from 4GB
>  - Refine drivers/reset/Kconfig
> 
> Changes in v2:
>  - Refine codes based on reviewers' feedback
>  - Remove define and use the common one
>  - Replace __raw_writel with writel_relaxed
>  - Split fu740_phyregreadwrite to write function
>  - Use readl_poll_timeout in stead of while loop checking
>  - Use dwc common codes
>  - Use gpio descriptors and the gpiod_* api.
>  - Replace devm_ioremap_resource with devm_platform_ioremap_resource_byname
>  - Replace devm_reset_control_get with devm_reset_control_get_exclusive
>  - Add more comments for delay and sleep
>  - Remove "phy ? x : y" expressions
>  - Refine code logic to remove possible infinite loop
>  - Replace magic number with meaningful define
>  - Remove fu740_pcie_pm_ops
>  - Use builtin_platform_driver
> 
> Greentime Hu (5):
>   clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
>   clk: sifive: Use reset-simple in prci driver for PCIe driver
>   MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
>   dt-bindings: PCI: Add SiFive FU740 PCIe host controller
>   riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
> 
> Paul Walmsley (1):
>   PCI: fu740: Add SiFive FU740 PCIe host controller driver

I can pull the patches above into the PCI tree (but will drop patch 6 -
dts changes), is it OK for you ? Please let me know how you would like
to upstream it.

Lorenzo

>  .../bindings/pci/sifive,fu740-pcie.yaml       | 113 +++++++
>  MAINTAINERS                                   |   8 +
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  33 ++
>  drivers/clk/sifive/Kconfig                    |   2 +
>  drivers/clk/sifive/fu740-prci.c               |  11 +
>  drivers/clk/sifive/fu740-prci.h               |   2 +-
>  drivers/clk/sifive/sifive-prci.c              |  54 +++
>  drivers/clk/sifive/sifive-prci.h              |  13 +
>  drivers/pci/controller/dwc/Kconfig            |   9 +
>  drivers/pci/controller/dwc/Makefile           |   1 +
>  drivers/pci/controller/dwc/pcie-fu740.c       | 308 ++++++++++++++++++
>  drivers/reset/Kconfig                         |   1 +
>  include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
>  13 files changed, 555 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c
> 
> -- 
> 2.30.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
