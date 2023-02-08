Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44272C636D3
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 21:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XV8Dq3ed55yUyqDuKcjoNd3qCsAUIXhgaHSURgXZGp8=; b=X9yAWLbAFf3984uKN1dOwXC4Av
	KuhKd3OyMTfbOOfLG6VcxHY8jBcv3VREBgI7omNrOKdpeDyLnQnL75IOnAaF0voGuJgmuJ7xBA+0W
	tO1M8SQCvnbS6FBWL1lESO0YiBK/hc9c2h6+gwQMqbu1Y7SOI3u0Bg6sd/Ux2SSkRNHbOsjilTh79
	qWIq2eWpV3wTy8hnI5PyV96WoOsxVHioifAGL+NIqySDN8pyJKesFqe0x0CazLlHp+IYZLsK4wJnw
	nyvlkkjYHq+yxavtKEcdIsfkFv/AOTl8NFNsNq/d4G4JnxDEkK67IuwXCCy6OWntnQcdK0Cm6QxHb
	MuTmOGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsK8-00H15F-Mh; Wed, 08 Feb 2023 21:49:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPsK4-00H14b-RA
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 21:49:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 11DDEB81FAC;
	Wed,  8 Feb 2023 21:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3D5C433EF;
	Wed,  8 Feb 2023 21:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675892985;
	bh=wj5vfzfVr8l+HoJfz2VIJSWnMOX1Qnb2cZ0rsoPxTvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpYB7qcXFmR4rPZWVxTpaWhOmSv3BLrMMPJUfYvmDKZpidFOXxORwDaDoDT+H8NR7
	 0pXpttoNAtQs7XDbuAVgs5v0xvbJ3dfFbGgfaAANzreCJBjtrHTWy/nCs9pSTBKbD0
	 V9RGcoxfxbzreN1e5nykhO4oDUTB8ljgDUotGPO8/9/01I2tS7m5IbPJJ3limXVhnw
	 Z5A1iVpkbI1eBwqcgz6LwCQ1XPac/9/Vnu5X6bnce0pQY5g3/0S928EAZMTF4NxS2O
	 q+tib17QgIoRI+fcQIP+ZffRyY2Ho4A+0goqPcP5hE2LkjBCswHOvAUmGULZ0DLczn
	 6IYcgfFVt4pFg==
Date: Wed, 8 Feb 2023 21:49:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 11/24] RISC-V: ACPI: irqchip/riscv-intc: Add ACPI support
Message-ID: <Y+QY9DCf6JPBNVS7@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-12-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-12-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_134949_218269_D9E8F24A 
X-CRM114-Status: GOOD (  18.83  )
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
Content-Type: multipart/mixed; boundary="===============4448367357707134105=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4448367357707134105==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FkTChGvxflSskHE0"
Content-Disposition: inline


--FkTChGvxflSskHE0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Mon, Jan 30, 2023 at 11:52:12PM +0530, Sunil V L wrote:
> Add support for initializing the RISC-V INTC driver on ACPI based
> platforms.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

> +static int __init
> +riscv_intc_acpi_init(union acpi_subtable_headers *header,
> +		     const unsigned long end)
> +{
> +	int rc;
> +	struct fwnode_handle *fn;
> +	struct acpi_madt_rintc *rintc;
> +
> +	rintc =3D (struct acpi_madt_rintc *)header;
> +
> +	/*
> +	 * The ACPI MADT will have one INTC for each CPU (or HART)
> +	 * so riscv_intc_acpi_init() function will be called once
> +	 * for each INTC. We only need to do INTC initialization
> +	 * for the INTC belonging to the boot CPU (or boot HART).
> +	 */
> +	if (riscv_hartid_to_cpuid(rintc->hart_id) !=3D smp_processor_id())
> +		return 0;
> +
> +	fn =3D irq_domain_alloc_named_fwnode("RISCV-INTC");
> +	WARN_ON(fn =3D=3D NULL);

Is there a reason that you do not just check this as !fn?

> +	if (!fn) {

This is a repeated check from the WARN_ON(), no?

> +		pr_err("unable to allocate INTC FW node\n");

Why do you need a WARN_ON() & the pr_err() here?

> +		return -1;

Why not an actual ERRNO?

Cheers,
Conor.

> +	}
> +
> +	rc =3D riscv_intc_init_common(fn);
> +	if (rc) {
> +		pr_err("failed to initialize INTC\n");
> +		return rc;
> +	}
> =20
>  	return 0;
>  }
> =20
> -IRQCHIP_DECLARE(riscv, "riscv,cpu-intc", riscv_intc_init);
> +IRQCHIP_ACPI_DECLARE(riscv_intc, ACPI_MADT_TYPE_RINTC,
> +		     NULL, 1, riscv_intc_acpi_init);
> +#endif
> --=20
> 2.38.0
>=20

--FkTChGvxflSskHE0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+QY8wAKCRB4tDGHoIJi
0rhbAP0c5iexcaIlQM8iL+DvYIOwu7IRC087VNqdopdTjepYHQD9GVGT+vN2Psae
gsDMt8FH4tgfoYPmthIAfw3XtOVNQQM=
=lDAG
-----END PGP SIGNATURE-----

--FkTChGvxflSskHE0--


--===============4448367357707134105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4448367357707134105==--

