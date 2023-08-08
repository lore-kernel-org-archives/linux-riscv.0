Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A090C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nw8siKB+9SRQxLEB1/aSEFpxE/ZHE9CrKZoMxkJkcVo=; b=EHrRPnhx/sjzlpCMEyEwLVoXAL
	WL2OCiQQ+0Cx1GNAtUdt3zklzAPiP81Cqph7uLASoq+LyTMJfu6eQs3PiUfMhl9DzAHwTsJIqvuTK
	8PprfB9F4GrrXXnro/3zGIgMagvCvfexFaPbTKOZW3Qp/2if5YyVnZodPnna7V+HiU9S3wuXXwhUH
	NUfQb8jNgN/lU81rMxIY1iIQV/uR32OvqqeL6lHyvOCN7zLoRoZ8qxgPcHsG0NRzvfqV21kVP4eh9
	7ksG4/yIdhjjgiI08/azlABveM81sovjOyOBOMu/ff3lLvVyp44Go10ofOO6kdFYd8ApFDudPRUA4
	nVpfWS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJyx-002EoS-0f;
	Tue, 08 Aug 2023 10:30:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTJyt-002Eo4-2A
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 10:30:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 205626249C;
	Tue,  8 Aug 2023 10:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B69C433C8;
	Tue,  8 Aug 2023 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691490626;
	bh=SPAy6eRxInTV27hAHN7hrh7bz66HIoGmfibRbIsJlNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FN8Qv+wGJ57hL9moCI/O2xbu0fndzE0Ij633wrVw1sF8XAkrm7oPOuhyPHLBmFlUa
	 CyWLXKylcYhDReLRicHZOX5u7c7VM1OVpFziFL5SrY3nfCXBzuy90MPhtR4dR7QQIH
	 buhwz3JAOi8QViIKQ/Uo3817x5FR2MHZudYhrk24D//c6Bxx3IyhhKg+v26lWf5YTL
	 E5RAmfVK/dRdB0qW2xUbTaMWY0WXEf05IV7ZE9sNxLtq+H+DAsMPQx7TKJY3WODbRi
	 QywJrqDQRRw9GR1tCzHVdnsTxEoj4E7VPYr6SdWl1BqT7hB0QuzCztIvdgLFgoDW2i
	 CNdO8u5/tUs9A==
Date: Tue, 8 Aug 2023 11:30:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RFC PATCH v1] clocksource: entend the max_delta_ns of
 timer-riscv andtimer-clint to ULONG_MAX
Message-ID: <20230808-essay-paprika-886382801149@spud>
References: <20230808045145.3552312-1-vincent.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230808045145.3552312-1-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_033027_798396_8B359A1E 
X-CRM114-Status: GOOD (  23.57  )
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
Content-Type: multipart/mixed; boundary="===============1698235494300552412=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1698235494300552412==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v7X+xlEC8KdFDfPN"
Content-Disposition: inline


--v7X+xlEC8KdFDfPN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Vincent,

On Tue, Aug 08, 2023 at 12:51:45PM +0800, Vincent Chen wrote:
> From: Vincentc Chen <vincent.chen@sifive.com>
>=20
> When registering the riscv-timer or clint-timer as a clock_event device,
> the driver needs to specify the value of max_delta_ticks. This value
> directly influences the max_delta_ns, which signifies the maximum time
> interval for configuring subsequent clock events. Currently, both
> riscv-timer and clint-timer are set with a max_delta_ticks value of
> 0x7fff_ffff. When the timer operates at a high frequency, such as 1GHz,
> this causes the system only can sleep for a short time. For the 1GHz
> case, the sleep cannot exceed two seconds. To address this limitation,
> refer to other timer implementations to extend it to 2^(bit-width of the
> timer) - 1. Because the bit-width of $mtimecmp is 64bit, so this value
> becomes ULONG_MAX (0xffff_ffff_ffff_ffff).

You've marked this as RFC - what is it that you are unsure about that
prevents this from being a regular patch?

Thanks,
Conor.

>=20
> Signed-off-by: Vincentc Chen <vincent.chen@sifive.com>
> ---
>  drivers/clocksource/timer-clint.c | 2 +-
>  drivers/clocksource/timer-riscv.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/time=
r-clint.c
> index 9a55e733ae99..09fd292eb83d 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -131,7 +131,7 @@ static int clint_timer_starting_cpu(unsigned int cpu)
>  	struct clock_event_device *ce =3D per_cpu_ptr(&clint_clock_event, cpu);
> =20
>  	ce->cpumask =3D cpumask_of(cpu);
> -	clockevents_config_and_register(ce, clint_timer_freq, 100, 0x7fffffff);
> +	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
> =20
>  	enable_percpu_irq(clint_timer_irq,
>  			  irq_get_trigger_type(clint_timer_irq));
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index da3071b387eb..b25c91d41968 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -94,7 +94,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>  	ce->irq =3D riscv_clock_event_irq;
>  	if (riscv_timer_cannot_wake_cpu)
>  		ce->features |=3D CLOCK_EVT_FEAT_C3STOP;
> -	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
> +	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
> =20
>  	enable_percpu_irq(riscv_clock_event_irq,
>  			  irq_get_trigger_type(riscv_clock_event_irq));
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--v7X+xlEC8KdFDfPN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNIZOwAKCRB4tDGHoIJi
0nffAP9yFlzcoMd/80yugZDiFMKJu81C1XRHyWzdM7qZjTPZlgD/cVQNjuhSeQi1
qt5EOYcb1Z26fPlCBy5mcjcsBxSunQc=
=nO0O
-----END PGP SIGNATURE-----

--v7X+xlEC8KdFDfPN--


--===============1698235494300552412==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1698235494300552412==--

