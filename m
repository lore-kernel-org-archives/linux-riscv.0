Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16094C5472D
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la1UsxrdYzIF8LWIWn4L4cHwtlVIbAQaY9SjaWWuPYw=; b=H9GEqg/Os9PalaNL6nqGonnjCE
	QqO8m3FYBtjItpgoyJazvlL0apoPygl4rJmKc87h88HKWJqgXR8bV+G03FShNd4qh2SHPtFU1TqT1
	hSmCm5eZhsScvkU+f2dTMELZCND9Tp43Lnt6m/ca3+KYzXNatj8UTN1SDNHTWFu1EppTbWBLaVMMz
	Ubcb8b1mI2OJbbBa0itjWqr8OElGfiiGmVQ0brSaj78IuYfuWQgcZ6Qw4F3KHyxToZKAVoZjMGvaH
	++bKnemtFrsphbihWe53nE0hVr116tO2nYzu1zCs10YbE7khMwsyH3YDBfQ1G9ORkfWk7HW7txRJM
	9s/laisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDcZ-0000000ES1J-1QWV;
	Wed, 28 Aug 2024 08:01:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbA-0000000ER8R-02Et
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 08:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1724832012; x=1756368012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UlG6nchsqBKmiYp8pAVvbHG5hJwd3EJQs1Sv91Wc4dM=;
  b=JYX+zymgdHoENh2JW0GQFmM7Htr6mVWLh8dfuLiIlU1QI2puQOl71MVa
   0qhhcohAi5NWUaEw6JG3O6ifxM7twzls4F1UR6RSbGXBGNS8gH39wriPc
   +afZHe2b50MMDh/PavK1UTPUKbspJ0J+pYcy8u8odHajdYqSHJKf7pnch
   RjvIllEsGd5E29c00eDVExhPG/CoVudqytDnGMu/lkabd8mQ2XpBTWcS6
   xNtZA5awN/Pzab4/piN7PqaLDwmkTA/Wo7tdSv14w6yqiQUSwX9JKg1sO
   8RIrJf7Tf5+K1xSXlF19U3HtoZYe7bJsbAmwSxn0zDhErfHPNObmdsmew
   A==;
X-CSE-ConnectionGUID: vBLI3Y69RSK7UCFTHu+5EA==
X-CSE-MsgGUID: JIhNA13dTE6oYGp9Pk08yA==
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="asc'?scan'208";a="31646340"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Aug 2024 01:00:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Aug 2024 00:59:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 28 Aug 2024 00:59:14 -0700
Date: Wed, 28 Aug 2024 08:58:43 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Bo Gan <ganboing@gmail.com>
CC: <zong.li@sifive.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<Pragnesh.patel@sifive.com>, <aou@eecs.berkeley.edu>,
	<erik.danie@sifive.com>, <hes@sifive.com>, <mturquette@baylibre.com>,
	<palmer@dabbelt.com>, <palmerdabbelt@google.com>, <paul.walmsley@sifive.com>,
	<pragnesh.patel@openfive.com>, <sboyd@kernel.org>, <schwab@linux-m68k.org>,
	<yash.shah@sifive.com>
Subject: Re: [PATCH 3/3] clk: sifive: prci: Add release_reset hooks for
 gemgxlpll/cltxpll
Message-ID: <20240828-duplex-skillful-752582090412@wendy>
References: <cover.1724827635.git.ganboing@gmail.com>
 <e47b943c0f685cd028ebd477e97e1706f184a7b6.1724827635.git.ganboing@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e47b943c0f685cd028ebd477e97e1706f184a7b6.1724827635.git.ganboing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_010012_264664_0DCC41E4 
X-CRM114-Status: GOOD (  34.90  )
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
Content-Type: multipart/mixed; boundary="===============8458502362822449096=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8458502362822449096==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J+WpBVuQQDWSZqNh"
Content-Disposition: inline

--J+WpBVuQQDWSZqNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 11:55:20PM -0700, Bo Gan wrote:
> This patch adds the release_reset hook interface to __prci_wrpll_data.
> During clock enablement, the function (if present) will be called after P=
LL
> registers are configured. It aligns the logic to the driver in u-boot. Wh=
en
> there's a previous bootloader stage, such as u-boot, it usually enables t=
he
> gemgxlpll clock when trying to PXE/network boot. The kernel boots fine, b=
ut
> we should not depend on it being our previous stage, and the logic within:
>=20
>  a. We (linux) can get directly invoked by firmware (OpenSBI).
>  b. U-boot doesn't necessarily have to initialize ethernet and enable the
>     clock (when not enabled in CONFIG).
>=20
> When the kernel is the first to initialize gemgxlpll, it must also release
> the corresponding reset. Otherwise the chip will just hang during macb
> initialization, and even external JTAG debugger will lose control over the
> risc-v debug module. (Observed with my Sifive Unmatched Rev.B board)
>=20
> The patch took the dt-bindings and logics directly from u-boot with some
> additional modifications:
>  - Use __prci_writel after __prci_readl to have barrier semantic. U-boot
>    has the strong version of readl/writel, but linux has the relaxed ones.
>  - Use pd->reset.rcdev.ops to access the reset regs.
>  - Split reset bindings for FU540/FU740 and use them directly, instead of
>    looking it up through reset-names.

The macb driver already supports using a reset at boot time (see zynq and
mpfs) if hooked up in the devicetree, why doesn't that work for you in
this situation?

Thanks,
Conor.

>=20
> Signed-off-by: Bo Gan <ganboing@gmail.com>
> ---
>  drivers/clk/sifive/fu540-prci.h  | 16 ++++++++++++++++
>  drivers/clk/sifive/fu740-prci.h  | 31 +++++++++++++++++++++++++++++++
>  drivers/clk/sifive/sifive-prci.c | 23 +++++++++++++++++++++++
>  drivers/clk/sifive/sifive-prci.h |  8 ++++++++
>  4 files changed, 78 insertions(+)
>=20
> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-p=
rci.h
> index e0173324f3c5..9d2ca18f47a4 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -23,9 +23,24 @@
>  #include <linux/module.h>
> =20
>  #include <dt-bindings/clock/sifive-fu540-prci.h>
> +#include <dt-bindings/reset/sifive-fu540-prci.h>
> =20
>  #include "sifive-prci.h"
> =20
> +/**
> + * sifive_fu540_prci_ethernet_release_reset() - Release ethernet reset
> + * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mu=
x reg
> + *
> + */
> +static void sifive_fu540_prci_ethernet_release_reset(struct __prci_data =
*pd)
> +{
> +	/* Release GEMGXL reset */
> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU540_PRCI_RST_GEMGXL_N=
);
> +
> +	/* Procmon =3D> core clock */
> +	sifive_prci_set_procmoncfg(pd, PRCI_PROCMONCFG_CORE_CLOCK_MASK);
> +}
> +
>  /* PRCI integration data for each WRPLL instance */
> =20
>  static struct __prci_wrpll_data sifive_fu540_prci_corepll_data =3D {
> @@ -43,6 +58,7 @@ static struct __prci_wrpll_data sifive_fu540_prci_ddrpl=
l_data =3D {
>  static struct __prci_wrpll_data sifive_fu540_prci_gemgxlpll_data =3D {
>  	.cfg0_offs =3D PRCI_GEMGXLPLLCFG0_OFFSET,
>  	.cfg1_offs =3D PRCI_GEMGXLPLLCFG1_OFFSET,
> +	.release_reset =3D sifive_fu540_prci_ethernet_release_reset,
>  };
> =20
>  /* Linux clock framework integration */
> diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-p=
rci.h
> index f31cd30fc395..dd0f54277a99 100644
> --- a/drivers/clk/sifive/fu740-prci.h
> +++ b/drivers/clk/sifive/fu740-prci.h
> @@ -10,9 +10,38 @@
>  #include <linux/module.h>
> =20
>  #include <dt-bindings/clock/sifive-fu740-prci.h>
> +#include <dt-bindings/reset/sifive-fu740-prci.h>
> =20
>  #include "sifive-prci.h"
> =20
> +/**
> + * sifive_fu740_prci_ethernet_release_reset() - Release ethernet reset
> + * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mu=
x reg
> + *
> + */
> +static void sifive_fu740_prci_ethernet_release_reset(struct __prci_data =
*pd)
> +{
> +	/* Release GEMGXL reset */
> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_GEMGXL_N=
);
> +
> +	/* Procmon =3D> core clock */
> +	sifive_prci_set_procmoncfg(pd, PRCI_PROCMONCFG_CORE_CLOCK_MASK);
> +
> +	/* Release Chiplink reset */
> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_CLTX_N);
> +}
> +
> +/**
> + * sifive_fu740_prci_cltx_release_reset() - Release cltx reset
> + * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mu=
x reg
> + *
> + */
> +static void sifive_fu740_prci_cltx_release_reset(struct __prci_data *pd)
> +{
> +	/* Release CLTX reset */
> +	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_CLTX_N);
> +}
> +
>  /* PRCI integration data for each WRPLL instance */
> =20
>  static struct __prci_wrpll_data sifive_fu740_prci_corepll_data =3D {
> @@ -30,6 +59,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_ddrpl=
l_data =3D {
>  static struct __prci_wrpll_data sifive_fu740_prci_gemgxlpll_data =3D {
>  	.cfg0_offs =3D PRCI_GEMGXLPLLCFG0_OFFSET,
>  	.cfg1_offs =3D PRCI_GEMGXLPLLCFG1_OFFSET,
> +	.release_reset =3D sifive_fu740_prci_ethernet_release_reset,
>  };
> =20
>  static struct __prci_wrpll_data sifive_fu740_prci_dvfscorepll_data =3D {
> @@ -49,6 +79,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_hfpcl=
kpll_data =3D {
>  static struct __prci_wrpll_data sifive_fu740_prci_cltxpll_data =3D {
>  	.cfg0_offs =3D PRCI_CLTXPLLCFG0_OFFSET,
>  	.cfg1_offs =3D PRCI_CLTXPLLCFG1_OFFSET,
> +	.release_reset =3D sifive_fu740_prci_cltx_release_reset,
>  };
> =20
>  /* Linux clock framework integration */
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive=
-prci.c
> index caba0400f8a2..ae8055a84466 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -249,6 +249,9 @@ int sifive_prci_clock_enable(struct clk_hw *hw)
>  	if (pwd->disable_bypass)
>  		pwd->disable_bypass(pd);
> =20
> +	if (pwd->release_reset)
> +		pwd->release_reset(pd);
> +
>  	return 0;
>  }
> =20
> @@ -448,6 +451,26 @@ void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct _=
_prci_data *pd)
>  	r =3D __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
>  }
> =20
> +/*
> + * PROCMONCFG
> + */
> +
> +/**
> + * sifive_prci_set_procmoncfg() - set PROCMONCFG
> + * @pd: struct __prci_data * PRCI context
> + * @val: u32 value to write to PROCMONCFG register
> + *
> + * Set the PROCMONCFG register to @val
> + *
> + * Context: Any context.  Caller must prevent concurrent changes to the
> + *          PROCMONCFG_OFFSET register.
> + */
> +void sifive_prci_set_procmoncfg(struct __prci_data *pd, u32 val)
> +{
> +	__prci_writel(val, PRCI_PROCMONCFG_OFFSET, pd);
> +	__prci_readl(pd, PRCI_PROCMONCFG_OFFSET);	/* barrier */
> +}
> +
>  /* PCIE AUX clock APIs for enable, disable. */
>  int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw)
>  {
> diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive=
-prci.h
> index 91658a88af4e..825a0aef9fd5 100644
> --- a/drivers/clk/sifive/sifive-prci.h
> +++ b/drivers/clk/sifive/sifive-prci.h
> @@ -210,6 +210,9 @@
> =20
>  /* PROCMONCFG */
>  #define PRCI_PROCMONCFG_OFFSET			0xf0
> +#define PRCI_PROCMONCFG_CORE_CLOCK_SHIFT	24
> +#define PRCI_PROCMONCFG_CORE_CLOCK_MASK					\
> +		(0x1 << PRCI_PROCMONCFG_CORE_CLOCK_SHIFT)
> =20
>  /*
>   * Private structures
> @@ -235,6 +238,7 @@ struct __prci_data {
>   * @disable_bypass: fn ptr to code to not bypass the WRPLL (or NULL)
>   * @cfg0_offs: WRPLL CFG0 register offset (in bytes) from the PRCI base =
address
>   * @cfg1_offs: WRPLL CFG1 register offset (in bytes) from the PRCI base =
address
> + * @release_reset: fn ptr to code to release clock reset
>   *
>   * @enable_bypass and @disable_bypass are used for WRPLL instances
>   * that contain a separate external glitchless clock mux downstream
> @@ -246,6 +250,7 @@ struct __prci_wrpll_data {
>  	void (*disable_bypass)(struct __prci_data *pd);
>  	u8 cfg0_offs;
>  	u8 cfg1_offs;
> +	void (*release_reset)(struct __prci_data *pd);
>  };
> =20
>  /**
> @@ -290,6 +295,9 @@ void sifive_prci_corepllsel_use_corepll(struct __prci=
_data *pd);
>  void sifive_prci_hfpclkpllsel_use_hfclk(struct __prci_data *pd);
>  void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd);
> =20
> +/* PROCMONCFG */
> +void sifive_prci_set_procmoncfg(struct __prci_data *pd, u32 val);
> +
>  /* Linux clock framework integration */
>  long sifive_prci_wrpll_round_rate(struct clk_hw *hw, unsigned long rate,
>  				  unsigned long *parent_rate);
> --=20
> 2.34.1
>=20

--J+WpBVuQQDWSZqNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs7YsAAKCRB4tDGHoIJi
0luTAQCIgvGMDu52ic/bzKzN5OE+pVDqeHGa26Ys8vhKE2rAQQEA99NdX7lzDF1W
zK5BU6vMP12OdOmCBJ3GhrEQieARWg0=
=hBF/
-----END PGP SIGNATURE-----

--J+WpBVuQQDWSZqNh--


--===============8458502362822449096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8458502362822449096==--

