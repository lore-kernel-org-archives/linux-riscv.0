Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62040C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 21:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDGJ8gPdvEGwSk3CWfeSHWJeqGPjThGVm6PBRbiXUQA=; b=jVJn6nw0/HBvU31TJsvtpN3tVl
	3A3aJATiVk61cpAusYd3mz6LG0GD571cAxXtxzyiix3OuFdOCltF+3ic2khUciztQAH1pI/v+gY+D
	uUtTt5Dv2KgNtuLHJmEceIrP0lqCw3iEjTxaqyVfrgEm0bjdDUz2oFPEVP9aR7PkHoSZ3ReRPO6/E
	L5U5uDtKHbqKzdItYk/ad269/DF5DJs2Eo5QdjHv5w3IcFEZ6o14xDRkmyZ1AnBH7qC6tJrXD0XpM
	BEvVUC5cp5wv/Djagj6P+OBvZyFkQrvYfJqhCsLl1sWTphl3wivcf9C5WZ+TFR1xNBwzW4XSTJ7xz
	VmfYz0VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHxI-00F1yr-Bj; Mon, 06 Mar 2023 21:01:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHxG-00F1y8-9q
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 21:01:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E697660B71;
	Mon,  6 Mar 2023 21:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3FEC433D2;
	Mon,  6 Mar 2023 21:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678136468;
	bh=yqidNwgp7HCd2mFZnWBGnmFlAErUVkw5CNhyg4udVxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qVYEPC7fl+EPjpQBV09cn3eYFU4yvIjPx82G6PRN9v4dGWM7tA0Uf7g4KCQsAVEJZ
	 BMS0RlGS+jbVJ4CmY6Rjl/RJz8595YaL3wny6SgyYMrT2CvdGFBArTzlZIavyXPdBX
	 8EIZy/xbp1NUQbcZontIMKh8PuZf6msVDD6hDu67oEXxH4GIDc1uig2GhK3/FIJxIc
	 DgHcPz4QZSWidhO6pwVizj6S7vePesaNQNPuTu+N83Zj8/20XzDOvpKIwG0mVaC/7W
	 d1gNKYsQp+cUVKRBBFdF1QMsoLKZAZLuBM/m/fCAluemq3ibDzOc3u+OyXltmDog7Z
	 nZgpgP2KMoQKA==
Date: Mon, 6 Mar 2023 21:01:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 15/20] clocksource/timer-riscv: Refactor
 riscv_timer_init_dt()
Message-ID: <c2c1bdb5-aee6-4f4c-9f7d-073917e75b88@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-16-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-16-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_130110_446701_85E6BC08 
X-CRM114-Status: GOOD (  22.16  )
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
Content-Type: multipart/mixed; boundary="===============0368424594692874364=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0368424594692874364==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AQdH4wZIprRDoHja"
Content-Disposition: inline


--AQdH4wZIprRDoHja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 07:06:42PM +0530, Sunil V L wrote:
> Refactor the timer init function such that few things can be
> shared by both DT and ACPI based platforms.
>=20
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  drivers/clocksource/timer-riscv.c | 81 +++++++++++++++----------------
>  1 file changed, 40 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index 5f0f10c7e222..cecc4662293b 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -124,61 +124,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, v=
oid *dev_id)
>  	return IRQ_HANDLED;
>  }
> =20
> -static int __init riscv_timer_init_dt(struct device_node *n)
> +static int __init riscv_timer_init_common(void)
>  {
> -	int cpuid, error;
> -	unsigned long hartid;
> -	struct device_node *child;
> +	int error;
>  	struct irq_domain *domain;
> +	struct fwnode_handle *intc_fwnode =3D riscv_get_intc_hwnode();
> =20
> -	error =3D riscv_of_processor_hartid(n, &hartid);
> -	if (error < 0) {
> -		pr_warn("Not valid hartid for node [%pOF] error =3D [%lu]\n",
> -			n, hartid);
> -		return error;
> -	}
> -
> -	cpuid =3D riscv_hartid_to_cpuid(hartid);
> -	if (cpuid < 0) {
> -		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> -		return cpuid;
> -	}
> -
> -	if (cpuid !=3D smp_processor_id())
> -		return 0;
> -
> -	child =3D of_find_compatible_node(NULL, NULL, "riscv,timer");
> -	if (child) {
> -		riscv_timer_cannot_wake_cpu =3D of_property_read_bool(child,
> -					"riscv,timer-cannot-wake-cpu");
> -		of_node_put(child);
> -	}
> -
> -	domain =3D NULL;
> -	child =3D of_get_compatible_child(n, "riscv,cpu-intc");
> -	if (!child) {
> -		pr_err("Failed to find INTC node [%pOF]\n", n);
> -		return -ENODEV;
> -	}
> -	domain =3D irq_find_host(child);
> -	of_node_put(child);
> +	domain =3D irq_find_matching_fwnode(intc_fwnode, DOMAIN_BUS_ANY);
>  	if (!domain) {
> -		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
> +		pr_err("Failed to find irq_domain for INTC node [%pfwP]\n",
> +		       intc_fwnode);
>  		return -ENODEV;
>  	}
> =20
>  	riscv_clock_event_irq =3D irq_create_mapping(domain, RV_IRQ_TIMER);
>  	if (!riscv_clock_event_irq) {
> -		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
> +		pr_err("Failed to map timer interrupt for node [%pfwP]\n", intc_fwnode=
);
>  		return -ENODEV;
>  	}
> =20
> -	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
> -	       __func__, cpuid, hartid);
>  	error =3D clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>  	if (error) {
> -		pr_err("RISCV timer register failed [%d] for cpu =3D [%d]\n",
> -		       error, cpuid);
> +		pr_err("RISCV timer registration failed [%d]\n", error);
>  		return error;
>  	}
> =20
> @@ -207,4 +174,36 @@ static int __init riscv_timer_init_dt(struct device_=
node *n)
>  	return error;
>  }
> =20
> +static int __init riscv_timer_init_dt(struct device_node *n)
> +{
> +	int cpuid, error;
> +	unsigned long hartid;
> +	struct device_node *child;
> +
> +	error =3D riscv_of_processor_hartid(n, &hartid);
> +	if (error < 0) {
> +		pr_warn("Invalid hartid for node [%pOF] error =3D [%lu]\n",
> +			n, hartid);

I know this was there initially, but why is this (and the one below) a
pr_warn() if we're aborting the init if we hit the condition? :thinking:

It's not your doing though, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +		return error;
> +	}
> +
> +	cpuid =3D riscv_hartid_to_cpuid(hartid);
> +	if (cpuid < 0) {
> +		pr_warn("Invalid cpuid for hartid [%lu]\n", hartid);
> +		return cpuid;
> +	}
> +
> +	if (cpuid !=3D smp_processor_id())
> +		return 0;
> +
> +	child =3D of_find_compatible_node(NULL, NULL, "riscv,timer");
> +	if (child) {
> +		riscv_timer_cannot_wake_cpu =3D of_property_read_bool(child,
> +					"riscv,timer-cannot-wake-cpu");
> +		of_node_put(child);
> +	}
> +
> +	return riscv_timer_init_common();
> +}
> +
>  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> --=20
> 2.34.1
>=20

--AQdH4wZIprRDoHja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZUjgAKCRB4tDGHoIJi
0mZPAQCogioAGeu/rH7vLjcGivv0bAimROIjihyABpXi3fiJ0AEAmUe5cTGCAW1k
wL1pBsU4gSGXk9HUSJpK0vRRT/x7OgA=
=fi1h
-----END PGP SIGNATURE-----

--AQdH4wZIprRDoHja--


--===============0368424594692874364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0368424594692874364==--

