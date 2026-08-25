Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B23C61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 23:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KoKRZUi0EqlESNaUqSHM10cCeIrIZAbe0TbWWKF1uU=; b=vOISA499BkZ1z3
	9ZqvLlDW104mYYZ7zDYl1BgT53/d3Q+Cbvk2HI6Sfky/C2kfiZNZ4x3ciAnHMs8iF+B27aYbqB1Et
	G6/r8jvyEFvNAmtBvVmNS2FsPjytJg+66XJtV82p39O1Tr+CgEsNSVxWkzux/lEhk1RJ0k+czUxCq
	reYQKs4I0xGP9pEfQe4/5ipfJ/ml2Dsa0Oa/Ny9f5blR+0D+1m9SUVSAsReQ2X8jsWQaDQDr9XJ5l
	MvUAVelHnjcmvmF5l9BAHjlC+NiGPdzZK/tWffPjCqjb/j5rLjXIlyVQCfVV1p2Gf9g9+eoqmDb/h
	ehhngGWUXvOPyjjafWGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz0Er-00000001ekW-2fS2;
	Tue, 25 Aug 2026 23:07:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz0Eq-00000001ekH-1qU8;
	Tue, 25 Aug 2026 23:07:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 707D460053;
	Tue, 25 Aug 2026 23:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AB91F000E9;
	Tue, 25 Aug 2026 23:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787699247;
	bh=1T+yqlLfjZvb7tE/yxSJSdtLanULbQSxCY7Q0MzmI+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b8+ZVnOCbBQxI1XWH6g96OTUS3SSgIkNzk2zPh+wdtROmGeIW2WEEpV2usbXzthg1
	 JMXrAEU/9jUyQ/0DImtguD17Sxr1w9elFP+WAkG6Ja5/XSri5B+xUwbbpYSGoW/X87
	 ERmbCq0z+XrDNwf7RHtsT4ifBthtQm1cltWMcRRSc7Kg66wmFtsv2bwsIQHf5RqYmt
	 VnX9OXTPpdsecFpXNig9/A53poNBjZT/sMaFF7QxoZXGbbZgvrL9/tKtk6PN3HJ3Xb
	 NUP+4ZdF7NC7yQb4CedTcaX4rUk3dW77KK0A5J9hDWuOTbj2ICoZpp/uOJi4kli2Sy
	 KDeVEPJBGPumw==
Date: Tue, 25 Aug 2026 23:07:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0 PHY
Message-ID: <20260825230724-GKF631715@kernel.org>
References: <20260825065007.69353-1-bbanelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
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

Hi Bruno,

On 08:50 Tue 25 Aug     , Bruno Banelli wrote:
> v1 was a single patch adding "default ARCH_SPACEMIT" to
> PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
> Kconfig problems in the same entry, and that change makes them easier
> to hit: enabling the symbol by default means configurations that would
> previously have left it off will now build the driver.
> 
> So fix the dependencies first, then enable it by default.
> 
> Both were verified against the driver source: phy-k1-usb2.c calls
> devm_platform_ioremap_resource() and devm_regmap_init_mmio(), while the
> Kconfig entry has neither "depends on HAS_IOMEM" nor
> "select REGMAP_MMIO".  PHY_SPACEMIT_K1_PCIE, directly above it in the
> same file, already has the HAS_IOMEM dependency.
> 
> Tested on a Milk-V Jupiter (SpacemiT M1) running mainline 7.2: without
> patch 2/2 a "make defconfig" kernel has no USB at all, because
> dwc3-generic-plat cannot get its PHY.
> 
> v1: https://lore.kernel.org/linux-riscv/20260825052158.66367-1-bbanelli@gmail.com/
> 
> Changes in v2:
>  - new patch 1/2 adding "depends on HAS_IOMEM" and "select REGMAP_MMIO",
>    with a Fixes: tag
>  - no change to the patch now numbered 2/2
> 
Thanks for this v2
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
