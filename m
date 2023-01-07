Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A853C54EBD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jan 2023 00:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1GXPqZWz4SRwvmMbKy1gd/vtR1+pPqrKeufJskGgbU=; b=RHpI6mY53wv1Ynw8yIehzwDliv
	MLcMcxjl8+DZ2cNQ3E2HGFL6RCRQmBavpmE3kJaRd6wqhGC3rWdDeXwbOHViyb/eoS8Z4Xkh0hbaR
	IZT7J1pyMDosh2apAGO7yK9OpMEWtkSR32XcaSghlN5fXooFIucX9xMW4Nwf/HGSxuF2HeAKw+QdY
	yvhG0bGYQOYZbqVlNSq8XnGZcIS+F4GhaaJDLFmW89ygdQO3F6bqQ8JmMx/C9CgPtksI/s//l9BPD
	Wh9VxJAYaFEVz323TkcsOTHzSVtkM0j+XpjtvrxtA8V8zm2DXxn8xZnLKNiWYPyd5BrP4Yc3cXcGj
	xWm/kbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDwmX-00FqqU-Ke; Sat, 07 Jan 2023 00:09:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDwmT-00FqoX-Tt
	for linux-riscv@lists.infradead.org; Sat, 07 Jan 2023 00:09:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C683761FA5;
	Sat,  7 Jan 2023 00:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E01E4C433EF;
	Sat,  7 Jan 2023 00:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673050187;
	bh=m6PnPs8IPNxdzKfMtMy1rvaf+NNUmxloEl6Q0gnALuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAQ6yuvd8TJMpyLzDU/c1nhFXVgRCvZqUc0VjayfEdnGeVaI3fQQdouqefVGVF6VS
	 JyVztY9Lmg9MAak2r5ZkgOh0sQb5Mi7Mk3DGptvxlFY1LDP77mNDtFWj8dMap/9UDI
	 zxtd+KD8MpZEI22Gin5bXMx/S7IXtriIfD/6kFKZVd9uITUGTHmHTsSQRT77g5im7O
	 sfyeNaD2LErrFT+R9dZ1PjaE1hBZFUIsrvLrkSh1obAIuKmxK8v24rGguBkmynxeBK
	 /LqlmP/l0av86Sip59hT0pXgqDTS2avw/5Jm1u+MrPhA9T2YTjQSNCJt+F3V0QaFaj
	 Nuv6dIm5IJSRQ==
Date: Sat, 7 Jan 2023 00:09:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Dipen Patel <dipenp@nvidia.com>, Oded Gabbay <ogabbay@kernel.org>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jason M Bills <jason.m.bills@linux.intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v6 5/6] cache: Add L2 cache management for Andes AX45MP
 RISC-V core
Message-ID: <Y7i4Q3CAbiCzvGS/@spud>
References: <20230106185526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230106185526.260163-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20230106185526.260163-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_160950_062531_4963430E 
X-CRM114-Status: GOOD (  34.88  )
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
Content-Type: multipart/mixed; boundary="===============4352295117162502769=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4352295117162502769==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8K7N8HqoZq1rFis2"
Content-Disposition: inline


--8K7N8HqoZq1rFis2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 06:55:25PM +0000, Prabhakar wrote:
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

> diff --git a/drivers/cache/ax45mp_cache.c b/drivers/cache/ax45mp_cache.c
> new file mode 100644
> index 000000000000..556e6875627c
> --- /dev/null
> +++ b/drivers/cache/ax45mp_cache.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * non-coherent cache functions for Andes AX45MP
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <asm/dma-noncoherent.h>
> +#include <linux/cacheflush.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/dma-direction.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +
> +#include <asm/cacheflush.h>
> +#include <asm/sbi.h>

You don't actually need this anymore, do you?

> +static int ax45mp_l2c_probe(struct platform_device *pdev)
> +{
> +	struct riscv_cache_ops ax45mp_cmo_ops;
> +
> +	/*
> +	 * riscv_cbom_block_size is set very much earlier so we can
> +	 * definitely rely on it and only if its being set we continue
> +	 * further in the probe path.
> +	 */
> +	if (!riscv_cbom_block_size)
> +		return 0;

Return 0? That's because we may actually have the IOCP & do not want to
install ops, right?
If so, please add that to the comment.

> +
> +	ax45mp_priv =3D devm_kzalloc(&pdev->dev, sizeof(*ax45mp_priv), GFP_KERN=
EL);
> +	if (!ax45mp_priv)
> +		return -ENOMEM;
> +
> +	ax45mp_priv->l2c_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ax45mp_priv->l2c_base))
> +		return PTR_ERR(ax45mp_priv->l2c_base);
> +
> +	ax45mp_get_l2_line_size(pdev);
> +
> +	memset(&ax45mp_cmo_ops, 0x0, sizeof(ax45mp_cmo_ops));
> +	ax45mp_cmo_ops.riscv_dma_noncoherent_cmo_ops =3D &ax45mp_no_iocp_cmo;

Yah, drop this dance and use a static struct foo_ops construct please.

With those two, I'm happy with this I guess..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +	riscv_noncoherent_register_cache_ops(&ax45mp_cmo_ops);
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

BTW, I think these are surplus-to-requirements since this is never going
to be built as a module.

If you resurrect the directory level maintainers entry from my v5.1, you
can also add:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--8K7N8HqoZq1rFis2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7i4QwAKCRB4tDGHoIJi
0kkgAQC+HuesMdtYYrATDJSUb/hkmgjShlN7xrvaSTXquTxaSgD/YLkLJtFZklda
U5JJAd2XROeK1C01js1TXGoi/MDOsgE=
=XvPJ
-----END PGP SIGNATURE-----

--8K7N8HqoZq1rFis2--


--===============4352295117162502769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4352295117162502769==--

