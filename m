Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E643DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NhrC1F9W0e26VVslpmbeiZJL4+NInCeQ30D5blFDqrI=; b=qpx/oZvdKI1HPi
	C0agSBbYPA7QynVvs7YiXMgUy4K0AzzxWHwH57aZk5Nlee1FQc3GSY+VeIbEPA7umz21oyh31O8DS
	qeOCOPtu9UbgPv7CSwj8gqgyQ8/Fu5GGNULURelot7+7frGx/0mGZvstcRQhyjhUmdOWp1nBssoYx
	/r9N9ZXtbNO1o7aTu6gEeFFF6TilAE3nKlI1yThDdemgh1uj7T12IgYJr8aGS8xm/b7lDYIZK378B
	ZBkXhwhIWCWalr41Ci6ooO0y9Cs/0oJIpJL0SngvbkRuhoN3kwSPmSVig4BYGZRqmKFxTdrLow4I0
	VaNQkI5rrM3Op76xewVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk26A-006Sbb-5k; Thu, 28 Apr 2022 11:14:14 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk24o-006RvE-DH; Thu, 28 Apr 2022 11:12:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EB2B1474;
 Thu, 28 Apr 2022 04:12:49 -0700 (PDT)
Received: from [10.57.80.98] (unknown [10.57.80.98])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DF4F3F774;
 Thu, 28 Apr 2022 04:12:45 -0700 (PDT)
Message-ID: <7b09e989-0aa1-a557-485e-572f69caf881@arm.com>
Date: Thu, 28 Apr 2022 12:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/5] iommu/sun50i: Ensure the IOMMU can be used for DMA
Content-Language: en-GB
To: Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20220428010401.11323-1-samuel@sholland.org>
 <20220428010401.11323-6-samuel@sholland.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220428010401.11323-6-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_041250_632893_2CBB232A 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-04-28 02:04, Samuel Holland wrote:
> So far, the driver has relied on arch/arm64/Kconfig to select IOMMU_DMA.
> Unsurprisingly, this does not work on RISC-V, so the driver must select
> IOMMU_DMA itself.

No, IOMMU_DMA should only be selected by the architecture code that's 
also responsible for calling iommu_setup_dma_ops(). Without that, this 
select will do nothing other than add some unused code to the kernel image.

I appreciate that the current state of the x86 IOMMU drivers being 
tightly-coupled to the x86 arch code might be confusing (which reminds 
me I'd totally forgotten about [1]). I'm about to start reworking the 
whole area anyway, but for now please just follow the existing intent.

Thanks,
Robin.

[1] 
https://lore.kernel.org/linux-iommu/9ba6f2e8568a3ff6a94fade66668d99705433c44.1631536879.git.robin.murphy@arm.com/

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>   drivers/iommu/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index c79a0df090c0..70a0bfa6d907 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -223,6 +223,7 @@ config SUN50I_IOMMU
>   	depends on ARCH_SUNXI || COMPILE_TEST
>   	select ARM_DMA_USE_IOMMU
>   	select IOMMU_API
> +	select IOMMU_DMA
>   	help
>   	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
>   

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
