Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A411C4167D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 15:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfCw33xg42AMTkSaAAsFOgQWgTCaXlBuTiL2Yni4oDU=; b=ta1TcXM6TkcB7oaoJwL7M+x7Aj
	zJJuKXcNCT9ccysIldHRp+AuyvlPxDZQA30FGSRYUDv6zwvzaCNl9fDP7d6PCAyZfWIpapMD2DpXz
	SsyaQGapCqKUqwgS409W+bRAJCj2K7K5AKebVGi3qJXpjD/oIjI19pz13Rn8ZaG+ZgLQWdcZZTKaZ
	r/KfzdqNSC6PK54WZ8d0Kkgg5C1raWPoyuOBocLMTV5q8vZCm3Z26IckP90T+3DxrN6Bfp6cDiVxW
	QmfV2cV4dBDEYWoyAWEUt8f5oWuRvH9RVB1whiKew+QF9ConJN4leRxCTnikgJ78Q1Dw4mI+A9s2W
	E/4Hjfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qywUn-00BinG-39;
	Fri, 03 Nov 2023 15:54:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qywUl-00BimO-1i
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 15:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8CD5615D4;
	Fri,  3 Nov 2023 15:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1D7C433C8;
	Fri,  3 Nov 2023 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699026842;
	bh=p+ENcx9viqbFbNj4L1L7KtqifbLzhKbAlpgUQs8oCJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdRmH88EBPJJ6ebRpfn8BmjVvKQO28L5tDNxjmgj1AJq9bTi4AQgAG8n1DPYuEPqA
	 0l7wYUnKEVHwXsjj1JKKfDbUhW0S9Tb1wHlassoF92J9TrJ/LLkU5jcnDbgTQgV1+P
	 PdTBJvuAXdAeXf5RHW/0m/8pq3xwwAIBYymJNEKmAmoluhdDeFJ+iKsXh3Sfw4tyNx
	 mmD7DoivmJweX3DZZCcBcFi95oDCmKKerHax15bq5B90RI4lqbj8A0a5/E4Os5Q6dM
	 LyZDQOHYcfmOLJGHCAvz65Om9Z5mE/46t4byseG9Kcy/O4d3WYZiCSzc44xI1T8Cl9
	 pvJsqCyjVyIJQ==
Date: Fri, 3 Nov 2023 15:53:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 2/2] soc: sifive: ccache: Add StarFive JH7100 support
Message-ID: <20231103-wielder-poem-19ffccf03031@spud>
References: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
 <20231031141444.53426-3-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20231031141444.53426-3-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_085403_655158_F06AD7BC 
X-CRM114-Status: GOOD (  27.42  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6282717165615081914=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6282717165615081914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dkUUJ2jFvkz63zmC"
Content-Disposition: inline


--dkUUJ2jFvkz63zmC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 03:14:44PM +0100, Emil Renner Berthing wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> This adds support for the StarFive JH7100 SoC which also features this
> SiFive cache controller.
>=20
> The JH7100 has non-coherent DMAs but predate the standard RISC-V Zicbom
> exension, so instead we need to use this cache controller for
> non-standard cache management operations.
>=20
> Unfortunately the interrupt for uncorrected data is broken on the JH7100
> and fires continuously, so add a quirk to not register a handler for it.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  drivers/soc/sifive/sifive_ccache.c | 62 +++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifi=
ve_ccache.c
> index 3684f5b40a80..0da3d1bd0866 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -8,13 +8,16 @@
> =20
>  #define pr_fmt(fmt) "CCACHE: " fmt
> =20
> +#include <linux/align.h>
>  #include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_address.h>
>  #include <linux/device.h>
>  #include <linux/bitfield.h>
> +#include <asm/cacheflush.h>
>  #include <asm/cacheinfo.h>
> +#include <asm/dma-noncoherent.h>
>  #include <soc/sifive/sifive_ccache.h>
> =20
>  #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
> @@ -39,10 +42,14 @@
>  #define SIFIVE_CCACHE_CONFIG_SETS_MASK GENMASK_ULL(23, 16)
>  #define SIFIVE_CCACHE_CONFIG_BLKS_MASK GENMASK_ULL(31, 24)
> =20
> +#define SIFIVE_CCACHE_FLUSH64 0x200
> +#define SIFIVE_CCACHE_FLUSH32 0x240
> +
>  #define SIFIVE_CCACHE_WAYENABLE 0x08
>  #define SIFIVE_CCACHE_ECCINJECTERR 0x40
> =20
>  #define SIFIVE_CCACHE_MAX_ECCINTR 4
> +#define SIFIVE_CCACHE_LINE_SIZE 64
> =20
>  static void __iomem *ccache_base;
>  static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
> @@ -56,6 +63,11 @@ enum {
>  	DIR_UNCORR,
>  };
> =20
> +enum {
> +	QUIRK_NONSTANDARD_CACHE_OPS	=3D BIT(0),
> +	QUIRK_BROKEN_DATA_UNCORR	=3D BIT(1),
> +};
> +
>  #ifdef CONFIG_DEBUG_FS
>  static struct dentry *sifive_test;
> =20
> @@ -106,6 +118,8 @@ static void ccache_config_read(void)
>  static const struct of_device_id sifive_ccache_ids[] =3D {
>  	{ .compatible =3D "sifive,fu540-c000-ccache" },
>  	{ .compatible =3D "sifive,fu740-c000-ccache" },
> +	{ .compatible =3D "starfive,jh7100-ccache",
> +	  .data =3D (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_BROKEN_DATA_UN=
CORR) },
>  	{ .compatible =3D "sifive,ccache0" },
>  	{ /* end of table */ }
>  };
> @@ -124,6 +138,34 @@ int unregister_sifive_ccache_error_notifier(struct n=
otifier_block *nb)
>  }
>  EXPORT_SYMBOL_GPL(unregister_sifive_ccache_error_notifier);
> =20
> +#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
> +static void ccache_flush_range(phys_addr_t start, size_t len)
> +{
> +	phys_addr_t end =3D start + len;
> +	phys_addr_t line;
> +
> +	if (!len)
> +		return;
> +
> +	mb();

Apparently memory barriers are supposed to be commented as to why they
are required.
I'm not sure if I care about that particular checkpatch complaint here.

> +	for (line =3D ALIGN_DOWN(start, SIFIVE_CCACHE_LINE_SIZE); line < end;
> +			line +=3D SIFIVE_CCACHE_LINE_SIZE) {
> +#ifdef CONFIG_32BIT
> +		writel(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
> +#else
> +		writeq(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
> +#endif
> +		mb();
> +	}
> +}
> +
> +static const struct riscv_nonstd_cache_ops ccache_mgmt_ops __initdata =
=3D {

And apparently this should be __initconst rather than __initdata. I can
squash that in.

Cheers,
Conor.

--dkUUJ2jFvkz63zmC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUUXlQAKCRB4tDGHoIJi
0nplAP4nR7w+c0LMD8c8f4DCaqH7YR2rczTSHdp7L3vtTAhNBwD/ZEbsaTGkESxY
ukdYKvQIJ0YhHCRy0LVkW3tauK4NMQc=
=ZOJ+
-----END PGP SIGNATURE-----

--dkUUJ2jFvkz63zmC--


--===============6282717165615081914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6282717165615081914==--

