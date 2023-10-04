Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C79DE7C4D0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otI2oG92sSTneUZNU4Brgl2qxBasu5edtWmtHkxouf8=; b=YMcqwKxPlpp5tk
	JfigX51VkSX1NzzZpU6TJ3S9OwTzHKp9+3JTm1DGVRaGRhmj/lYP9s6ycLQRE3dIzfn2MmoX9hyE4
	Yq3baocaOl6gkovxHR3Qm1YNlLe3TO7jESiyWreTaxv0vAr3JgUBSQ3vyOI/ma70mLWmfRYvI9CNO
	SdJ9PQAgThCm5ht2U7kTpAmtCOrPNpk3KgxufuYfpsJEkmxdBRXLed1F4V1FSEbdV08zGZydrTL5H
	s0UEdh3fd4StzOsUR8jnKMCXW5q0WJ7gwvY+LBh6EYp+zw/+iWGmAsYAhypqqSSctu41T56VwO2KY
	rCyBp/x0rDvMtgOD7h4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3n7-000LzX-08;
	Wed, 04 Oct 2023 15:28:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3n4-000Lys-22
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:28:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 146EDC15;
	Wed,  4 Oct 2023 08:28:32 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 134A63F762;
	Wed,  4 Oct 2023 08:27:51 -0700 (PDT)
Message-ID: <c4438f24-fe87-bf22-183b-f53376e950db@arm.com>
Date: Wed, 4 Oct 2023 16:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] soc: renesas: make ARCH_R9A07G043 (riscv version) depend
 on NONPORTABLE
Content-Language: en-GB
To: Jisheng Zhang <jszhang@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Drew Fustini <dfustini@baylibre.com>
References: <20231004150856.2540-1-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231004150856.2540-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_082758_715107_DD95E1CF 
X-CRM114-Status: GOOD (  18.70  )
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

On 04/10/2023 4:08 pm, Jisheng Zhang wrote:
> Drew found "CONFIG_DMA_GLOBAL_POOL=y causes ADMA buffer alloc to fail"
> the log looks like:
> [    3.741083] mmc0: Unable to allocate ADMA buffers - falling back to standard DMA
> 
> The logic is: generic riscv defconfig selects ARCH_RENESAS then
> ARCH_R9A07G043 which selects DMA_GLOBAL_POOL, which assumes all
> non-dma-coherent riscv platforms have a dma global pool, this assumption
> seems not correct. And I believe DMA_GLOBAL_POOL should not be
> selected by ARCH_SOCFAMILIY, instead, only ARCH under some specific
> conditions can select it globaly, for example NOMMU ARM and so on,
> because it's designed for special cases such as "nommu cases where
> non-cacheable memory lives in a fixed place in the physical address
> map" as pointed out by Robin.
> 
> Fix the issue by making ARCH_R9A07G043 (riscv version) depend on
> NONPORTABLE, thus generic defconfig won't select ARCH_R9A07G043 by
> default. And even for random config case, there will be less debug
> effort once we see NONPORTABLE is enabled.

FWIW,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Reported-by: Drew Fustini <dfustini@baylibre.com>
> Closes: https://lore.kernel.org/linux-riscv/ZRuamJuShOnvP1pr@x1/
> Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required configs for RZ/Five SoC")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   drivers/soc/renesas/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 5a75ab64d1ed..12040ce116a5 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -333,6 +333,7 @@ if RISCV
>   
>   config ARCH_R9A07G043
>   	bool "RISC-V Platform support for RZ/Five"
> +	depends on NONPORTABLE
>   	select ARCH_RZG2L
>   	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
>   	select DMA_GLOBAL_POOL

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
