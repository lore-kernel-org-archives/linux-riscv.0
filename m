Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A09C79FA1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwaM6VM1BVCI7L5MhGXMTOGkhEXrlME1Htz4rED24iE=; b=INLK3rAqA7/dWizDVWY2DvL2uL
	qmzo82D9+YFoQM8VceD+Y/CT4II5ZB0xLVXLBxn+K1ztMcD/lKu2n6FWxqLEgVDcRVCaLKqhyMPgL
	Ezr+HQH9hNse0Ch1Jt2+Sh9qN3RS35Rd0vy8nllGUyGVSpbdbb756n3iXENEygZxNQ2thZE+uzhdj
	TRKGxzzWG0NGUwRkW0zQLutZeXkkhq06oirynY56s09q1t729PTnKd2LMML8XA5vSKz5apColYrsO
	5iutySg6QtHZVEZfjo3MN1aldVcCsbXfkwPyGqgDlx4UFanWXT1An7oTcRVJspaAU9ui+yXocmqTK
	lUGMdPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bVz-00000007Dk4-1mC6;
	Mon, 07 Sep 2026 15:44:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3bVx-00000007Djm-3wqB
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 15:44:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08ABE60D86;
	Mon,  7 Sep 2026 15:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB5C1F00A3D;
	Mon,  7 Sep 2026 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788795848;
	bh=tbQq5RgYEJ47ld3xIo72HwJt8v+OFaeEdcvJPqwKMVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gCUCHx/iwie1N3me2583hWdlBbjU+HuEQoojJHoet/tgkegs9+HnxUMFhSgZI6ghE
	 My6yFOx4AoMZKjYP1FDaBpRjty5sjXjYTsH/t8XeEEYytCNQTqefrsOeJLFh6WNqeM
	 EtpsEy4njjV6MgBDTymJlViMIRybYqtSWwNOwPfVa6SX+TijCoRkjh9GdpjUD8Lq/4
	 OKRMRb9UXS7gwUHi8dqm5LTIWNYiVOm1AY/NtiO/oAoJyPDFce1/Aig+7r/ELhtC24
	 bysxp6wNb3JOJZdnYSVP8o7fBOnEJoANfqTysq/Yq/MsJn7WCwsClOonAXnThBgPU6
	 /v2IoeYwAP45g==
Date: Mon, 7 Sep 2026 16:44:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, wangruikang@iscas.ac.cn,
	ganboing@gmail.com, alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	cleger@meta.com, geshijian@picoheart.com, niehaitao@picoheart.com,
	cuiyunhui@bytedance.com
Subject: Re: [PATCH v3 5/5] riscv: errata: picoheart: Add workaround for
 AMOCASQ errata
Message-ID: <20260907-wiring-paramount-33df8fcf7c35@spud>
References: <20260907072149.72031-1-yang.yicong@picoheart.com>
 <20260907072149.72031-6-yang.yicong@picoheart.com>
MIME-Version: 1.0
In-Reply-To: <20260907072149.72031-6-yang.yicong@picoheart.com>
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
Content-Type: multipart/mixed; boundary="===============1049514856157083088=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1049514856157083088==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M1C4aw77Ka2DKvzT"
Content-Disposition: inline

--M1C4aw77Ka2DKvzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 07, 2026 at 03:21:49PM +0800, Yicong Yang wrote:
> Some Picoheart CPUs implement Zacas extension but lack support
> for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
> facto unavailable. Since currently no ways to retrieve the PMA
> information and the riscv kernel will declare cmpxchg128 support
> if platform declare support of Zacas, the use of cmpxchg128 will
> lead to PMA violation and crash the kernel. Add the errata
> workaround to disable the use of cmpxchg128 on the affected CPUs.
>=20
> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> ---
>  arch/riscv/Kconfig.errata            | 12 ++++++++++++
>  arch/riscv/errata/picoheart/errata.c | 22 ++++++++++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h     |  2 +-
>  arch/riscv/include/asm/cpufeature.h  |  8 ++++++++
>  arch/riscv/kernel/cpufeature.c       | 13 ++++++++++++-
>  5 files changed, 55 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 8ce5c0314321..16e37391d596 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -176,4 +176,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
> =20
>  	   If you don't know what to do here, say "Y".
> =20
> +config ERRATA_PICOHEART_AMOCASQ
> +	bool "Apply Picoheart AMOCASQ errata"
> +	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
> +	default y
> +	help
> +	  Some Picoheart CPUs implement the Zacas extension but lack support
> +	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
> +	  unavailable. Enable this errata workaround to disable the use of
> +	  CASQ in the kernel (cmpxchg128).
> +
> +	  If you don't know what to do here, say "Y".
> +
>  endmenu # "CPU errata selection"
> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/pic=
oheart/errata.c
> index 21480d19c084..0fb4cb41ab03 100644
> --- a/arch/riscv/errata/picoheart/errata.c
> +++ b/arch/riscv/errata/picoheart/errata.c
> @@ -174,10 +174,32 @@ static void picoheart_errata_probe_cbo_clean(unsign=
ed int stage,
>  	static_branch_enable(&has_picoheart_cbo_clean_errata);
>  }
> =20
> +static void picoheart_errata_probe_amocasq(unsigned int stage,
> +					   unsigned long archid,
> +					   unsigned long impid)
> +{
> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
> +		return;
> +
> +	if (stage !=3D RISCV_ALTERNATIVES_BOOT)
> +		return;
> +
> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
> +	    !riscv_isa_extension_available(NULL, ZACAS))
> +		return;
> +
> +	if (archid !=3D 0x804a555049544552 || impid !=3D 0x100)
> +		return;
> +
> +	static_branch_disable(&cpus_support_cmpxchg128);
> +}
> +
>  static u32 picoheart_errata_probe(unsigned int stage, unsigned long arch=
id,
>  				  unsigned long impid)
>  {
>  	picoheart_errata_probe_cbo_clean(stage, archid, impid);
> +	picoheart_errata_probe_amocasq(stage, archid, impid);
> +
>  	return 0;
>  }
> =20
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cm=
pxchg.h
> index 662e160b0522..e231e9619eee 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -329,7 +329,7 @@
> =20
>  #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(=
CONFIG_TOOLCHAIN_HAS_ZACAS)
> =20
> -#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISC=
V_ISA_EXT_ZACAS)
> +#define system_has_cmpxchg128	system_has_cmpxchg128
> =20
>  union __u128_halves {
>  	u128 full;
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 739fcc84bf7b..f9d95cbf5abd 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -164,4 +164,12 @@ static inline bool cpu_supports_indirect_br_lp_instr=
(void)
>  		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
>  }
> =20
> +DECLARE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
> +
> +static inline bool system_has_cmpxchg128(void)
> +{
> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS) &&
> +	       static_branch_likely(&cpus_support_cmpxchg128);
> +}
> +
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index b56d149cf4ed..f73ce43df626 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -46,6 +46,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
> =20
>  u32 thead_vlenb_of;
> =20
> +/* All the CPUs supports cmpxchg128 (CASQ*). */
> +DEFINE_STATIC_KEY_FALSE(cpus_support_cmpxchg128);
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -317,6 +320,14 @@ static int riscv_cfiss_validate(const struct riscv_i=
sa_ext_data *data,
>  	return 0;
>  }
> =20
> +static int riscv_ext_zacas_validate(const struct riscv_isa_ext_data *dat=
a,
> +				    const unsigned long *isa_bitmap)
> +{
> +	static_branch_enable(&cpus_support_cmpxchg128);

A validate callback is meant to determine whether or not the extension
can be used, it's not there for people to add arbitrary code, partially
because each validate callback runs multiple times and may change state
depending on what happens with other extensions. E.g. a validate
callback may pass on the first iteration but fail on the second because
a dependant extension later in the list fails. In practice, this might
not ever affect Zacas, and doesn't at the moment, but this sort of code
should not be added to validate callbacks.

To be honest, I'd rather just turn the extension off entirely on this
platform rather than make everyone suffer.
The errata probe functions run after extension detection but before
patching, so could we just clear the Zacas bit in the isa bitmap?

Cheers,
Conor.

> +
> +	return 0;
> +}
> +
>  static const unsigned int riscv_a_exts[] =3D {
>  	RISCV_ISA_EXT_ZAAMO,
>  	RISCV_ISA_EXT_ZALRSC,
> @@ -544,7 +555,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
>  	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
>  	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
> -	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> +	__RISCV_ISA_EXT_DATA_VALIDATE(zacas, RISCV_ISA_EXT_ZACAS, riscv_ext_zac=
as_validate),
>  	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
>  	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
>  	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
> --=20
> 2.50.1 (Apple Git-155)
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--M1C4aw77Ka2DKvzT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCap7bwwAKCRB4tDGHoIJi
0kNwAP4rYgncaBLwdheHpNGRtWNtMtkAfYYjaYHzQ3E4Wl2ikAEAm38gUhMZ4v9K
CPQ8gbO6yPX4QkxsiLrHdISAf1R6NwA=
=If9k
-----END PGP SIGNATURE-----

--M1C4aw77Ka2DKvzT--


--===============1049514856157083088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1049514856157083088==--

