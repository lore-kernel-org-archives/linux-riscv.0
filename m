Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216F9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Dec 2022 21:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGEQCM7mubr62wWZy8wXWLNNAzvbasbGMEGHn+zfYBE=; b=u9HNJP9MgWhHHe6FnDUzN9Gnqg
	02lTvGbc0ARzEllItYZFVge1B4+V6w4AG2s78yPjvbfcBxPfG3sb58qcY4GJFXZfxPYgpmOQwfiOR
	XZn8CWTCVXpzuQC+i/TxqG3XZ+sGMlT7r4vfITzNPH1VxIorAaYqyOoC1c9vLRpGvWCPCC11ZqaYG
	Es5A44ieo/Ttc6IQcajdrfS9lsjgjyIaL+zf4N9yqEgKx9DSUyQNaF+57k41XD2Eo9J8BHA+hHDbC
	BU/K8Ya+J7zSDjMTrEw7yFVRtSXRTVu3mh7oDHkbD4yazv1YpW7WoMvu+sGEe6ORsmsTJJSTRtkjp
	0vjQjS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6eqd-00Cwh9-0z; Sat, 17 Dec 2022 21:35:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p6eqX-00CwgG-W9
	for linux-riscv@lists.infradead.org; Sat, 17 Dec 2022 21:35:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 945B760C4D;
	Sat, 17 Dec 2022 21:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69ABCC433EF;
	Sat, 17 Dec 2022 21:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671312949;
	bh=3k2/+IttE0UVtgnXTF81w69NSEhUurD5Qa3BilDCE2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=noTzd5kQ40AjxwJ/xPXpuD1mDjL2wz6cpCgZo/M0bToWjdBoU8fYv7+XXhcBigX4L
	 BSp1u5ucrd+0CDcS264C3vI0OuOStXVL4t+f5ERaz0NcNHj1ihEN+Nj9TTNW5wHoKq
	 LEWBNqp5Nc8mEBanujmwu45YcF3z4ICj4ITl1MTX2KdvoRjlkwrhz/g3iCi7Kx4599
	 1L/KO+4Z4i4xI2GbZ8M2EcAVYd6zZNKOTBDMjLOOHlv4KSMGrezWzUF7JKNebggutO
	 qS2N27kQJdAD7llaYG6nF2eSeStCV2d/2DJfwo+E2oK9j1Qeblv9IbPAp+M7C6UFuB
	 VKrddsb9H61Sg==
Date: Sat, 17 Dec 2022 21:35:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 6/6] soc: renesas: Add L2 cache management for RZ/Five
 SoC
Message-ID: <Y542LhJszxZqLS1P@spud>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20221212115505.36770-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221217_133555_010219_BE831E53 
X-CRM114-Status: GOOD (  41.74  )
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
Content-Type: multipart/mixed; boundary="===============3923552528964334593=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3923552528964334593==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OxhlkhVJ/Ei+GPxT"
Content-Disposition: inline


--OxhlkhVJ/Ei+GPxT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Prabhakar,
Just a couple kinda minor bits here.

On Mon, Dec 12, 2022 at 11:55:05AM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
>=20
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC due to this reason IP blocks using DMA will fail.
>=20
> The Andes AX45MP core has a Programmable Physical Memory Attributes (PMA)
> block that allows dynamic adjustment of memory attributes in the runtime.
> It contains a configurable amount of PMA entries implemented as CSR
> registers to control the attributes of memory locations in interest.
> Below are the memory attributes supported:
> * Device, Non-bufferable
> * Device, bufferable
> * Memory, Non-cacheable, Non-bufferable
> * Memory, Non-cacheable, Bufferable
> * Memory, Write-back, No-allocate
> * Memory, Write-back, Read-allocate
> * Memory, Write-back, Write-allocate
> * Memory, Write-back, Read and Write-allocate
>=20
> More info about PMA (section 10.3):
> Link: http://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Da=
tasheet.pdf
>=20
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
>=20
> Example PMA region passes as a DT node from OpenSBI:
>     reserved-memory {
>         #address-cells =3D <2>;
>         #size-cells =3D <2>;
>         ranges;
>=20
>         pma_resv0@58000000 {
>             compatible =3D "shared-dma-pool";
>             reg =3D <0x0 0x58000000 0x0 0x08000000>;
>             no-map;
>             linux,dma-default;
>         };
>     };
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Dropped code for configuring L2 cache
> * Dropped code for configuring PMA
> * Updated commit message
> * Added comments
> * Changed static branch enable/disable order
>=20
> RFC v3 -> v4
> * Made use of runtime patching instead of compile time
> * Now just exposing single function ax45mp_no_iocp_cmo() for CMO handling
> * Added a check to make sure cache line size is always 64 bytes
> * Renamed folder rzf -> rzfive
> * Improved Kconfig description
> * Dropped L2 cache configuration
> * Dropped unnecessary casts
> * Fixed comments pointed by Geert.
> ---
>  arch/riscv/include/asm/cacheflush.h       |   8 +
>  arch/riscv/include/asm/errata_list.h      |  28 ++-
>  drivers/soc/renesas/Kconfig               |   6 +
>  drivers/soc/renesas/Makefile              |   2 +
>  drivers/soc/renesas/rzfive/Kconfig        |   6 +
>  drivers/soc/renesas/rzfive/Makefile       |   3 +
>  drivers/soc/renesas/rzfive/ax45mp_cache.c | 256 ++++++++++++++++++++++
>  7 files changed, 303 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/soc/renesas/rzfive/Kconfig
>  create mode 100644 drivers/soc/renesas/rzfive/Makefile
>  create mode 100644 drivers/soc/renesas/rzfive/ax45mp_cache.c

> diff --git a/drivers/soc/renesas/rzfive/ax45mp_cache.c b/drivers/soc/rene=
sas/rzfive/ax45mp_cache.c
> new file mode 100644
> index 000000000000..d98f71b86b9b
> --- /dev/null
> +++ b/drivers/soc/renesas/rzfive/ax45mp_cache.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * non-coherent cache functions for Andes AX45MP
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/dma-direction.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/cacheflush.h>
> +#include <asm/sbi.h>
> +
> +/* L2 cache registers */
> +#define AX45MP_L2C_REG_CTL_OFFSET		0x8
> +
> +#define AX45MP_L2C_REG_C0_CMD_OFFSET		0x40
> +#define AX45MP_L2C_REG_C0_ACC_OFFSET		0x48
> +#define AX45MP_L2C_REG_STATUS_OFFSET		0x80
> +
> +/* D-cache operation */
> +#define AX45MP_CCTL_L1D_VA_INVAL		0
> +#define AX45MP_CCTL_L1D_VA_WB			1
> +
> +/* L2 CCTL status */
> +#define AX45MP_CCTL_L2_STATUS_IDLE		0
> +
> +/* L2 CCTL status cores mask */
> +#define AX45MP_CCTL_L2_STATUS_C0_MASK		0xf
> +
> +/* L2 cache operation */
> +#define AX45MP_CCTL_L2_PA_INVAL			0x8
> +#define AX45MP_CCTL_L2_PA_WB			0x9
> +
> +#define AX45MP_L2C_REG_PER_CORE_OFFSET		0x10
> +#define AX45MP_CCTL_L2_STATUS_PER_CORE_OFFSET	4
> +
> +#define AX45MP_L2C_REG_CN_CMD_OFFSET(n)	\
> +	(AX45MP_L2C_REG_C0_CMD_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
> +#define AX45MP_L2C_REG_CN_ACC_OFFSET(n)	\
> +	(AX45MP_L2C_REG_C0_ACC_OFFSET + ((n) * AX45MP_L2C_REG_PER_CORE_OFFSET))
> +#define AX45MP_CCTL_L2_STATUS_CN_MASK(n)	\
> +	(AX45MP_CCTL_L2_STATUS_C0_MASK << ((n) * AX45MP_CCTL_L2_STATUS_PER_CORE=
_OFFSET))
> +
> +#define AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM	0x80b
> +#define AX45MP_CCTL_REG_UCCTLCOMMAND_NUM	0x80c
> +
> +#define AX45MP_CACHE_LINE_SIZE			64
> +
> +struct ax45mp_priv {
> +	void __iomem *l2c_base;
> +	u32 ax45mp_cache_line_size;
> +};
> +
> +static struct ax45mp_priv *ax45mp_priv;
> +static DEFINE_STATIC_KEY_FALSE(ax45mp_l2c_configured);
> +
> +/* L2 Cache operations */
> +static inline uint32_t ax45mp_cpu_l2c_get_cctl_status(void)
> +{
> +	return readl(ax45mp_priv->l2c_base + AX45MP_L2C_REG_STATUS_OFFSET);
> +}
> +
> +/*
> + * Software trigger CCTL operation (cache maintenance operations) by wri=
ting
> + * to ucctlcommand and ucctlbeginaddr registers and write-back an L2 cac=
he
> + * entry.
> + */
> +static void ax45mp_cpu_dcache_wb_range(void *start, void *end, int line_=
size)
> +{
> +	void __iomem *base =3D ax45mp_priv->l2c_base;
> +	int mhartid =3D smp_processor_id();
> +	unsigned long pa;
> +
> +	while (end > start) {
> +		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> +		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_WB);
> +
> +		pa =3D virt_to_phys(start);
> +		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
> +		writel(AX45MP_CCTL_L2_PA_WB,
> +		       base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
> +		while ((ax45mp_cpu_l2c_get_cctl_status() &
> +			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=3D
> +			AX45MP_CCTL_L2_STATUS_IDLE)
> +			;
> +
> +		start +=3D line_size;
> +	}
> +}
> +
> +/*
> + * Software trigger CCTL operation by writing to ucctlcommand and ucctlb=
eginaddr
> + * registers and invalidate the L2 cache entry.
> + */

This comment and the above are written in the wrong tense, I think it
should be s/trigger/triggers/ & s/invalidate/invalidating/.

> +static void ax45mp_cpu_dcache_inval_range(void *start, void *end, int li=
ne_size)
> +{
> +	void __iomem *base =3D ax45mp_priv->l2c_base;
> +	int mhartid =3D smp_processor_id();
> +	unsigned long pa;
> +
> +	while (end > start) {
> +		csr_write(AX45MP_CCTL_REG_UCCTLBEGINADDR_NUM, start);
> +		csr_write(AX45MP_CCTL_REG_UCCTLCOMMAND_NUM, AX45MP_CCTL_L1D_VA_INVAL);
> +
> +		pa =3D virt_to_phys(start);
> +		writel(pa, base + AX45MP_L2C_REG_CN_ACC_OFFSET(mhartid));
> +		writel(AX45MP_CCTL_L2_PA_INVAL,
> +		       base + AX45MP_L2C_REG_CN_CMD_OFFSET(mhartid));
> +		while ((ax45mp_cpu_l2c_get_cctl_status() &
> +			AX45MP_CCTL_L2_STATUS_CN_MASK(mhartid)) !=3D
> +			AX45MP_CCTL_L2_STATUS_IDLE)
> +			;
> +
> +		start +=3D line_size;
> +	}
> +}
> +
> +static void ax45mp_cpu_dma_inval_range(void *vaddr, size_t size)
> +{
> +	char cache_buf[2][AX45MP_CACHE_LINE_SIZE];
> +	unsigned long start =3D (unsigned long)vaddr;
> +	unsigned long end =3D start + size;
> +	unsigned long old_start =3D start;
> +	unsigned long old_end =3D end;
> +	unsigned long line_size;
> +	unsigned long flags;
> +
> +	if (unlikely(start =3D=3D end))
> +		return;
> +
> +	line_size =3D ax45mp_priv->ax45mp_cache_line_size;
> +
> +	memset(&cache_buf, 0x0, sizeof(cache_buf));
> +	start =3D start & (~(line_size - 1));
> +	end =3D ((end + line_size - 1) & (~(line_size - 1)));

You've got an extra () in a lot of these operations that you can drop,
both here and below.

> +
> +	local_irq_save(flags);
> +	if (unlikely(start !=3D old_start))
> +		memcpy(&cache_buf[0][0], (void *)start, line_size);
> +
> +	if (unlikely(end !=3D old_end))
> +		memcpy(&cache_buf[1][0], (void *)(old_end & (~(line_size - 1))), line_=
size);
> +
> +	ax45mp_cpu_dcache_inval_range(vaddr, (void *)end, line_size);
> +
> +	if (unlikely(start !=3D old_start))
> +		memcpy((void *)start, &cache_buf[0][0], (old_start & (line_size - 1)));
> +
> +	local_irq_restore(flags);
> +}
> +
> +static void ax45mp_cpu_dma_wb_range(void *vaddr, size_t size)
> +{
> +	unsigned long start =3D (unsigned long)vaddr;
> +	unsigned long end =3D start + size;
> +	unsigned long line_size;
> +	unsigned long flags;
> +
> +	line_size =3D ax45mp_priv->ax45mp_cache_line_size;
> +	local_irq_save(flags);
> +	start =3D start & (~(line_size - 1));
> +	ax45mp_cpu_dcache_wb_range(vaddr, (void *)end, line_size);
> +	local_irq_restore(flags);
> +}
> +
> +void ax45mp_no_iocp_cmo(unsigned int cache_size, void *vaddr, size_t siz=
e, int dir, int ops)
> +{
> +	if (ops =3D=3D NON_COHERENT_DMA_PREP)
> +		return;
> +
> +	if (!static_branch_unlikely(&ax45mp_l2c_configured))
> +		return;
> +
> +	if (ops =3D=3D NON_COHERENT_SYNC_DMA_FOR_DEVICE) {
> +		switch (dir) {
> +		case DMA_FROM_DEVICE:
> +			ax45mp_cpu_dma_inval_range(vaddr, size);
> +			break;
> +		case DMA_TO_DEVICE:
> +		case DMA_BIDIRECTIONAL:
> +			ax45mp_cpu_dma_wb_range(vaddr, size);
> +			break;
> +		default:
> +			break;
> +		}
> +		return;
> +	}
> +
> +	/* op =3D=3D NON_COHERENT_SYNC_DMA_FOR_CPU */
> +	if (dir =3D=3D DMA_BIDIRECTIONAL || dir =3D=3D DMA_FROM_DEVICE)
> +		ax45mp_cpu_dma_inval_range(vaddr, size);
> +}
> +EXPORT_SYMBOL(ax45mp_no_iocp_cmo);
> +
> +static void ax45mp_configure_l2_cache(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	ret =3D of_property_read_u32(np, "cache-line-size", &ax45mp_priv->ax45m=
p_cache_line_size);
> +	if (ret) {
> +		dev_err(dev, "Failed to get cache-line-size, defaulting to 64 bytes\n"=
);
> +		ax45mp_priv->ax45mp_cache_line_size =3D AX45MP_CACHE_LINE_SIZE;
> +	}
> +
> +	if (ax45mp_priv->ax45mp_cache_line_size !=3D AX45MP_CACHE_LINE_SIZE) {
> +		dev_err(dev, "Expected cache-line-size to be 64 bytes (found:%u). Defa=
ulting to 64 bytes\n",
> +			ax45mp_priv->ax45mp_cache_line_size);
> +		ax45mp_priv->ax45mp_cache_line_size =3D AX45MP_CACHE_LINE_SIZE;
> +	}

Between both of your checks here, line-size is forced to be 64. Is
anything other than 64 actually supported by this l2 cache?
If not, should we in fact fail to probe if something else is detected
rather than falling back?
If other sizes are possible, forcing it to 64 doesn't seem advisable
either.

Thanks,
Conor.

> +}
> +
> +static int ax45mp_l2c_probe(struct platform_device *pdev)
> +{
> +	ax45mp_priv =3D devm_kzalloc(&pdev->dev, sizeof(*ax45mp_priv), GFP_KERN=
EL);
> +	if (!ax45mp_priv)
> +		return -ENOMEM;
> +
> +	ax45mp_priv->l2c_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ax45mp_priv->l2c_base))
> +		return PTR_ERR(ax45mp_priv->l2c_base);
> +
> +	ax45mp_configure_l2_cache(pdev);
> +
> +	static_branch_enable(&ax45mp_l2c_configured);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ax45mp_cache_ids[] =3D {
> +	{ .compatible =3D "andestech,ax45mp-cache" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver ax45mp_l2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "ax45mp-l2c",
> +		.of_match_table =3D ax45mp_cache_ids,
> +	},
> +	.probe =3D ax45mp_l2c_probe,
> +};
> +
> +static int __init ax45mp_cache_init(void)
> +{
> +	return platform_driver_register(&ax45mp_l2c_driver);
> +}
> +arch_initcall(ax45mp_cache_init);
> +
> +MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Andes AX45MP L2 cache driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.25.1
>=20

--OxhlkhVJ/Ei+GPxT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY542LgAKCRB4tDGHoIJi
0rIFAP98KtNoWh0RHLlzxfXDijPEhCiTNaNmhlt/RSW5SOjICQEAozfBiOqE2yL7
pNlYHP8SaFFaq4ooDcX8oyzGF8Rm2w8=
=g2TL
-----END PGP SIGNATURE-----

--OxhlkhVJ/Ei+GPxT--


--===============3923552528964334593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3923552528964334593==--

