Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5937FC46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47VSPP91cSutGxEa83AMl53eoS/OzcKN2gppA4qq2F4=; b=F6fg4nWNrTdfwX
	vNGzq0BuQ6x6DLbpi0CyC2OTwdD6fqdzcNBYUGFxLm+OVhj5drpKLEDEcaOKhN4bbLe3OoyaVhmNF
	/mDQGgAd0ZYcIsHyEAmCew6gTgJev6JSpXnSmLTBKjUTKcQq1d+qB6O2R3D6ANV1ehAIEgUqvaWA+
	v2r8c9PRhbe283rTjqJqf9a5UCQrZokmN3Q/Da7NKyukwvFX+STuDAm9ndLU199GU5FrxCSl0N4R2
	qVAYmWa4WUQX3CbXKNKvUBlW3tYeWVg8Cl6cil7/plI22xUltEtnH69NZkOBVNJ0UR6hO8q2qlsGo
	OYE8hAo3wF1cMSplXf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0Po-008DtE-Qf; Wed, 04 Jan 2023 09:50:32 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0LP-008C1T-9c
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:46:02 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pD0Kx-00G7tJ-Mm; Wed, 04 Jan 2023 09:45:31 +0000
Message-ID: <6ef122f6-12fa-777f-b4e7-a02531380391@codethink.co.uk>
Date: Wed, 4 Jan 2023 09:45:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC v5.1 9/9] [DON'T APPLY] cache: sifive-ccache: add cache
 flushing capability
Content-Language: en-GB
To: Conor Dooley <conor@kernel.org>, arnd@arndb.de, palmer@dabbelt.com,
 prabhakar.csengg@gmail.com
Cc: Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com, atishp@rivosinc.com,
 biju.das.jz@bp.renesas.com, devicetree@vger.kernel.org,
 geert@linux-m68k.org, guoren@kernel.org, hch@infradead.org, heiko@sntech.de,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, magnus.damm@gmail.com, nathan@kernel.org,
 paul.walmsley@sifive.com, philipp.tomsich@vrull.eu,
 prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org,
 samuel@sholland.org, soc@kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>
References: <Y62nOqzyuUKqYDpq@spud>
 <20230103210400.3500626-10-conor@kernel.org>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230103210400.3500626-10-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_014600_453291_DB997A15 
X-CRM114-Status: GOOD (  29.80  )
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

On 03/01/2023 21:04, Conor Dooley wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> SiFive L2 cache controller can flush L2 cache. Expose this capability via
> driver.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> [Conor: rebase on top of move to cache subsystem]
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> This commit needs more work, and a way to enable it from errata. I've
> not gone and done this as PolarFire SoC has archid etc all set to zero.
> So we need to go figure out a workaround for this, before adding in
> errata enabling code for this. I've included it here as a second user of
> the cache management stuff, since what's currently upstream for the
> ccache driver does not do any cache management.

I think errata isn't the right word here, it's more of a system 
requirement for anything that isn't coherent. All the SiFive systems
I have are coherent so won't need this.

> ---
>   drivers/cache/sifive_ccache.c | 45 +++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 47e7d6557f85..3c00f205bace 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -9,12 +9,14 @@
>   #define pr_fmt(fmt) "CCACHE: " fmt
>   
>   #include <linux/debugfs.h>
> +#include <linux/dma-direction.h>
>   #include <linux/interrupt.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_address.h>
>   #include <linux/device.h>
>   #include <linux/bitfield.h>
>   #include <asm/cacheinfo.h>
> +#include <asm/cacheflush.h>
>   #include <cache/sifive_ccache.h>
>   
>   #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
> @@ -42,11 +44,15 @@
>   #define SIFIVE_CCACHE_WAYENABLE 0x08
>   #define SIFIVE_CCACHE_ECCINJECTERR 0x40
>   
> +#define SIFIVE_CCACHE_FLUSH64 0x200
> +#define SIFIVE_CCACHE_FLUSH32 0x240
> +
>   #define SIFIVE_CCACHE_MAX_ECCINTR 4
>   
>   static void __iomem *ccache_base;
>   static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
>   static struct riscv_cacheinfo_ops ccache_cache_ops;
> +static struct riscv_cache_maint_ops ccache_cmos;
>   static int level;
>   
>   enum {
> @@ -205,6 +211,42 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>   	return IRQ_HANDLED;
>   }
>   
> +static void sifive_ccache_dma_wback_inv(void* vaddr, unsigned long size)
> +{
> +	void * __iomem flush = ccache_base + SIFIVE_CCACHE_FLUSH64;
> +	phys_addr_t start = virt_to_phys(vaddr);
> +	phys_addr_t aligned_start = start & ~0x3f;
> +	u64 addr;
> +	u64 end;
> +	u64 aligned_end;
> +
> +	size += start - aligned_start;
> +	end = start + size;
> +	aligned_end = end += 0x3f;

I think you meant + 0x3f here. There is an align macro in the kernel
headers, and I'm not sure by inspection if you'd miss the last line
with this code.

> +	aligned_end &= ~0x3f;
> +
> +	for (addr = aligned_start; addr < aligned_end; addr += 64)
> +		writeq(addr, flush);
> +}

The p550 manual states that the zero device flush method is quicker for
any large area flush. However not sure what that level is and whether it
is worth dealing with here? If so we need to have the L3 zero are mapped.

> +
> +static void sifive_ccache_cmo(unsigned int cache_size, void *vaddr, size_t size,
> +			      int dir, int ops)
> +{

technically dir should have been of type "enum dma_data_direction"

> +	switch (dir) {
> +	case DMA_TO_DEVICE:
> +		sifive_ccache_dma_wback_inv(vaddr, size);
> +		break;
> +	case DMA_FROM_DEVICE:
> +		sifive_ccache_dma_wback_inv(vaddr, size);
> +		break;
> +	case DMA_BIDIRECTIONAL:
> +		sifive_ccache_dma_wback_inv(vaddr, size);
> +		break;
> +	default:
> +		break;
> +	}
> +}

I'm not sure why you'd bother checking the dir here, the cache can
only be flushed (I hope DMA_FROM_DEVICE is done /before/ the DMA op).

You could have saved yourself an include if just ignoring dir.

> +
>   static int __init sifive_ccache_init(void)
>   {
>   	struct device_node *np;
> @@ -254,6 +296,9 @@ static int __init sifive_ccache_init(void)
>   	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
>   	riscv_set_cacheinfo_ops(&ccache_cache_ops);
>   
> +	ccache_cmos.cmo_patchfunc = sifive_ccache_cmo;
> +	riscv_set_cache_maint_ops(&ccache_cmos);
> +
>   #ifdef CONFIG_DEBUG_FS
>   	setup_sifive_debug();
>   #endif

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
