Return-Path: <SRS0=w96C=J6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00CBC433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 16:42:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C3861951
	for <linux-riscv@archiver.kernel.org>; Mon,  3 May 2021 16:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C3861951
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=h5iImFsj5GFiyExWF7bL5fh0XXwGFrXTReGNG8rJNFE=; b=FmZHF/pGd0Aw46XM4WiTqaBop
	nKiccpZL/DmiuvcrNbEcQPx/WA9yQsbx+P5wz2rdReV5MGFZlSVN1cr8TFcVCi7h2xcG/OY1etWe2
	9vihMlSObmm39MGHX1x0T0avYRYcjd5cqXFrofEts2xhE35OB4k7QKEZon5OczGnGT/1HqHg74Aca
	NZs72xlN9z0A+J3c51fJCfWTfeazYR88lCOCr2Ujb3mriAKMHVVCOaazjb1S0zVkzQDx66zQL/71T
	sy1dEyrEZUcWby+SRMTntsDj4cPYvXdZ371AJVO6KWPVCGqYDz9sjFmTVPUTCnFTsFum7f8jY/yDO
	D+pFOAvSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldbeE-00EQ67-9U; Mon, 03 May 2021 16:42:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbcS-00EPSH-PI
 for linux-riscv@desiato.infradead.org; Mon, 03 May 2021 16:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=qT3aBZpv9oGRYq44NKFfP4UzzIwvKTYme00AJi1+gKs=; b=B68ZU5mN+R/RjxEpPye3JmLVOX
 Odm0T9pTNRBDlsX7FEVupxi8h/VMY/SmSPqVRKcR6wt6rZACrHXwyb5v0GIMPkIw6re8GW0OluWUl
 7ip573XQaR1+0cfnlq6dGGFUu5LP1qIzz1Lg7YgQ8dkdqJOJVXqMdfac6kPxifCbAe2dMVnCFpcUH
 Dd7KhHt0/SqRb6dmgO1H1eEebQFnYnICKJrUNRU6DLGx6P/j2SuzX/Prxf7JAGgu+kuj2/wwGuCaK
 JF+Ko8jcw4iE81dEoPBYi1pCSEwsvxiGb8D/bH+syZwejr6A12qPjFFqspR5UPRTOE4AZsOoVW5T8
 X1J5l7Tg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbcP-003HCn-TW
 for linux-riscv@lists.infradead.org; Mon, 03 May 2021 16:40:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1AD06191F;
 Mon,  3 May 2021 16:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060025;
 bh=tHYHD0jT1jG1itD5UPajDk4y8ocfKR79gQ2CjG/pTbE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JLcFn19J2apAX5K6ef/KUYrOmvgNsunQdt63eKOmDkGhDnGLgDFdRB28ot7D5pyH1
 h7FjPDwLxcv/lBZoRCqschRbNQJyuaUlQEvu6LAdC3EPK6IB3XuPpz/haaWUPJoqRA
 178OmpJBsTkGhHwdI7FrX7de02BLp77vbKCE4zWBQBHUaTZ0T+UfPOnhSEXca2f50h
 VFgjuxVEQafjC+uGCmls8vfTGrwMsu4HVWLvww0OzwbF4wsLh4+NBwIIg+WMwqGw9r
 Ao/8VK+gu4mPYmjitl2EcyaxWahhfbK+p7wOpx881wxfeiSp1TOv+tMN1sGNYOhwxj
 JWfD4/WsFmLiQ==
Date: Mon, 3 May 2021 11:40:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: paul.walmsley@sifive.com, hes@sifive.com, erik.danie@sifive.com,
 zong.li@sifive.com, bhelgaas@google.com, robh+dt@kernel.org,
 aou@eecs.berkeley.edu, mturquette@baylibre.com, sboyd@kernel.org,
 lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
 jh80.chung@samsung.com, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver
 support
Message-ID: <20210503164023.GA919777@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406092634.50465-1-greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_094026_072333_3E6ED823 
X-CRM114-Status: GOOD (  19.95  )
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

I dropped this series because of the build problem I mentioned [1].
It will not be included in v5.13 unless the build problem is fixed
ASAP.

[1] https://lore.kernel.org/r/20210428194713.GA314975@bjorn-Precision-5520

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
> 
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
