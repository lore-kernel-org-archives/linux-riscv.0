Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EBFC636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFKbLUgI4PQnyqdzYflpUBYsTaXIqBrlokfwfPclNZU=; b=TWlxMgVRK59L7t9ViL+Gy39z1z
	OwVRujqwjn+SYo2Imnn4LAWkr4qZsP7mnkivhAfptsKi3J3tLo5jXCVJNPajRZ8WyqAl5gyTbi7b4
	ppE00hgiBMrcSxXO71jyFeFHEuzXr80yx5kHpmCaS/73FdjIgYHbqs63dYRQ2OveuCiTOqOzuP3cL
	zUvpg22hjcMJ3KIKCk+sdsH9bK/CHrzWHUlqLSdJt2ZNay0J3fnO85VuxND2jR8JAFtcfHGrMx2oK
	CyZY52o22NcyS1c2CJNLdLo/N1K+tDOF/yexMoo5FRg3P0z/FG3zkbjz7pE2i5NFTVy2f6+rHlEB6
	80yZrlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDvz-003Dhs-RB; Thu, 09 Feb 2023 20:54:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQDvw-003Dgz-1V
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 20:54:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4BFAFB82316;
	Thu,  9 Feb 2023 20:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D842EC433EF;
	Thu,  9 Feb 2023 20:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675976057;
	bh=JvtF9Km1ksiv9ZA0ap4rOqNOIgZmMUugZRJ2td2mHhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITRnAoqspNlb3tJ9FIUd/8R1cQCMMahJSlyFEjTJXjsClv1nLHjCSjWqT/aHGC1oc
	 BCVIGGLdx4sGe6/EFTbn9GgRjBf8Ip2CFqQPfIGNv8Sk3QJwtydFE5knh2wBEZVI+z
	 zI3NAl4BdVcCe2Nc1e7bHODhVTAjOH/bW4ologlCaK3V/K7uZm/m6IiUND+KKbvcir
	 9+aXU1J5TK/ff0Tw6XboSnACXdXs/mArEdrM7zYDx4R+5sSG8+ulPHtku33APZOFeI
	 jMIwul5uq2T5sHo4CIIc2B9tJyQFCGWeJlAngDh5p0QEfvxRKIqjV6y1FGAmvIokVG
	 gmCTgxnvUnQkw==
Date: Thu, 9 Feb 2023 20:54:11 +0000
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
Subject: Re: [PATCH 15/24] clocksource/timer-riscv: Refactor
 riscv_timer_init_dt()
Message-ID: <Y+Vdc09bWb9CTXyt@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-16-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-16-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_125420_422599_C82BBDFC 
X-CRM114-Status: GOOD (  23.32  )
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
Content-Type: multipart/mixed; boundary="===============1705847795245440227=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1705847795245440227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8h8914KTtxY4WtKQ"
Content-Disposition: inline


--8h8914KTtxY4WtKQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

On Mon, Jan 30, 2023 at 11:52:16PM +0530, Sunil V L wrote:
> Refactor the timer init function such that few things can be shared by
> both DT and ACPI based platforms.
>=20
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

What did Anup do here? He's not author or co-author, so the SoB chain
looks incorrect.

> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/clocksource/timer-riscv.c | 79 +++++++++++++++----------------
>  1 file changed, 37 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index 1b4b36df5484..4016c065a01c 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -119,61 +119,28 @@ static irqreturn_t riscv_timer_interrupt(int irq, v=
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
> -	struct irq_domain *domain;
> -
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
> +	int error;
> +	struct fwnode_handle *intc_fwnode =3D riscv_get_intc_hwnode();
> +	struct irq_domain *domain =3D NULL;
> =20
> -	child =3D of_find_compatible_node(NULL, NULL, "riscv,timer");
> -	if (child) {
> -		riscv_timer_cannot_wake_cpu =3D of_property_read_bool(child,
> -					"riscv,timer-cannot-wake-cpu");
> -		of_node_put(child);
> -	}

Uhh, where did this code go?
Unless I've badly missed something, this has vanished in the patch.

> =20
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
> +		pr_err("Failed to find INTC node [%pfwP]\n", intc_fwnode);
>  		return -ENODEV;
>  	}
> =20
>  	riscv_clock_event_irq =3D irq_create_mapping(domain, RV_IRQ_TIMER);
>  	if (!riscv_clock_event_irq) {
> -		pr_err("Failed to map timer interrupt for node [%pOF]\n", n);
> -		return -ENODEV;
> +		pr_err("Failed to map timer interrupt for node [%pfwP]\n",
> +			intc_fwnode);
>  	}
> =20
> -	pr_info("%s: Registering clocksource cpuid [%d] hartid [%lu]\n",
> -	       __func__, cpuid, hartid);
>  	error =3D clocksource_register_hz(&riscv_clocksource, riscv_timebase);
>  	if (error) {
> -		pr_err("RISCV timer register failed [%d] for cpu =3D [%d]\n",
> -		       error, cpuid);
> +		pr_err("clocksource register failed [%d]\n", error);

If you're changing this, s/register/registration/ to be grammatically
correct I suppose.

>  		return error;
>  	}
> =20
> @@ -199,7 +166,35 @@ static int __init riscv_timer_init_dt(struct device_=
node *n)
>  		static_branch_enable(&riscv_sstc_available);
>  	}
> =20
> +	pr_info("timer registered using %s\n",
> +		(static_branch_likely(&riscv_sstc_available)) ?
> +		"RISC-V Sstc" : "RISC-V SBI");

Why is this needed? Isn't there a print like 3 lines above here that
says "Timer interrupt in S-mode is available via sstc extension"?

> +
>  	return error;
>  }
> =20
> +static int __init riscv_timer_init_dt(struct device_node *n)
> +{
> +	int cpuid, error;
> +	unsigned long hartid;
> +
> +	error =3D riscv_of_processor_hartid(n, &hartid);
> +	if (error < 0) {
> +		pr_warn("Not valid hartid for node [%pOF] error =3D [%lu]\n",

While you're already moving this, may as well fix the grammar IMO.
s/Not valid/Invalid/

Cheers,
Conor.

> +			n, hartid);
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
> +	return riscv_timer_init_common();
> +}
> +
>  TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
> --=20
> 2.38.0
>=20

--8h8914KTtxY4WtKQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VdcwAKCRB4tDGHoIJi
0vfxAP9RZQGZEX7Y4ZgLFKvXN/0/gIJZuerkA4XQkDspYSkg8AD9G1YqTtZ6WpVW
0oeOQ7K3iWcMHOdT/zMy4JZcnKnHSA0=
=054u
-----END PGP SIGNATURE-----

--8h8914KTtxY4WtKQ--


--===============1705847795245440227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1705847795245440227==--

