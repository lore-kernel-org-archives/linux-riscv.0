Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DCBCDB484
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbkjowIJPUtsJ96VC8vWwH01fb+JUrmCY3xJYM9m6FM=; b=c5tHg+DzbqxEFF
	/itNrRZlrO7GyXOLIaBpxuUp5IdkGaHC99kMJDpIkMTZzhOfWJtC/1flB9MdMKRZtSVLWq+VXdksK
	GoeE3YaEhQiiwu1vknR2pyoXsswVi1ORpiHJD8IJaz09beHembtvjIsEjFu+E5MJurTWW0pNJkfLR
	X6BxHdWj7fTM/2DjBxOjXmbau/NjfF+zn7nM+UrOuZwPuDokG9isP3UUni77Yttyf5nZiSTL6OCDc
	+6ylxagPup9eKLbqFRy2i2uuwuWJUT6LDCYFKQyNhgUrbBqou9dRZPPtaE4vBM5EfcvhtMtqSbtm9
	jFn1lhzjaC3B6CL/SEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsLca-009SsI-0Y;
	Mon, 16 Oct 2023 11:18:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsLcX-009Sqt-0g
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 11:18:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 667561FB;
	Mon, 16 Oct 2023 04:19:28 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7628A3F5A1;
	Mon, 16 Oct 2023 04:18:45 -0700 (PDT)
Message-ID: <986636cf-5ae8-4b86-bf00-acae8f2680ad@arm.com>
Date: Mon, 16 Oct 2023 12:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
Content-Language: en-GB
To: Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
 iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-6-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231016054755.915155-6-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_041849_299568_7081605F 
X-CRM114-Status: GOOD (  11.52  )
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

On 16/10/2023 6:47 am, Christoph Hellwig wrote:
> CONFIG_DMA_GLOBAL_POOL can't be combined with other DMA coherent
> allocators.  Add dependencies to Kconfig to document this, and make
> kconfig complain about unment dependencies if someone tries.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index f488997b071712..4524db877eba36 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -135,6 +135,8 @@ config DMA_COHERENT_POOL
>   
>   config DMA_GLOBAL_POOL
>   	select DMA_DECLARE_COHERENT
> +	depends on !ARCH_HAS_DMA_SET_UNCACHED
> +	depends on !DMA_DIRECT_REMAP
>   	bool
>   
>   config DMA_DIRECT_REMAP

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
