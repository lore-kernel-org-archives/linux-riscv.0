Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CE8C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 21:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/sZcmMLRKB21jdHkYXh3U8PGP8ZheRUYEaMiqFQ2nw=; b=sfhq/eAe1VgLN1u5PKx9SwccjT
	vQurAm6xww7uLP1OdvZY8PTFuPJANDhaabeRf8beeaVNxIrbvm0hXGANi0T7V2LMZA5bUsuCNCUwx
	Owl1v1X71Ks9D/vUwQe0URQkLgpAaDMF6SXLe5a11IR0uPc3CnN5/R5C7SK4Z9ZtSVpC403e98YTu
	HSBdK0/TyCDjEdpHheGOl9E9PdRxItZrof/alqy0+E3QSiNLsqk1qM6R8ljPFdCMwLoE/A9a3L7rt
	Yu9pcOFcWePKOjGvlQ6rhFixaWHqgdFYnN2jejhmzQz5SnDO1dPMs89X6qvdbjPYNqb1VPc+LqrXD
	N2MJeeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZI5B-00F3Gr-Q3; Mon, 06 Mar 2023 21:09:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZI58-00F3GE-O3
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 21:09:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D43860110;
	Mon,  6 Mar 2023 21:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5523C433EF;
	Mon,  6 Mar 2023 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678136957;
	bh=D7hWlHPkxCHLmVrT+DiT6xkGdDskW5thK7niBxeh04M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mJWPEujZmIUYE6OUHwuuyaWs5gYoiX4mwLmxqbrcHALw1Ox54QKIpzoH9FueSBEGh
	 /DthUfR3FQvRQExHZWC8w3zsDF8GuKihsyq6/+UGMI+E1SKQr8rzjz4dwuPc+Bt+vG
	 ZsY9Ll9URemzFEKiU2ctO3x9wG1m0YzHJEW7lxr9Rw1HejeoBf5h2WORWwofq9wC3Z
	 LRVcKmO7vapRRHJgCmEQO/HusrwP0bnR4rKRTWaK2JQdkO97QAojCUOfQjA4iH7A+9
	 TeEWxynFs1m+xVi9yPWPXd+7DPjrFhqmYnUowWzhc7MNPI1BiPPvBK4fkPD1bHuqzl
	 EtBoSD8wWFh5Q==
Date: Mon, 6 Mar 2023 21:09:11 +0000
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
Subject: Re: [PATCH V3 17/20] RISC-V: time.c: Add ACPI support for time_init()
Message-ID: <0cceafc3-522b-4ce0-9016-e931c818adec@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-18-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-18-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_130918_901057_A4C4C021 
X-CRM114-Status: GOOD (  21.63  )
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
Content-Type: multipart/mixed; boundary="===============0039161113032986717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0039161113032986717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9ueEUgWWOucslAoO"
Content-Disposition: inline


--9ueEUgWWOucslAoO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 07:06:44PM +0530, Sunil V L wrote:
> On ACPI based platforms, timer related information is
> available in RHCT. Add ACPI based probe support to the
> timer initialization.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/time.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
> index babaf3b48ba8..2c29543549c3 100644
> --- a/arch/riscv/kernel/time.c
> +++ b/arch/riscv/kernel/time.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2017 SiFive
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/of_clk.h>
>  #include <linux/clockchips.h>
>  #include <linux/clocksource.h>
> @@ -18,17 +19,27 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
>  void __init time_init(void)
>  {
>  	struct device_node *cpu;
> +	struct acpi_table_rhct *rhct;
> +	acpi_status status;
>  	u32 prop;
> =20
> -	cpu =3D of_find_node_by_path("/cpus");
> -	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> -		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\=
n");
> -	of_node_put(cpu);
> -	riscv_timebase =3D prop;
> +	if (acpi_disabled) {
> +		cpu =3D of_find_node_by_path("/cpus");
> +		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
> +			panic("RISC-V system with no 'timebase-frequency' in DTS\n");

I appreciate that it was like this before, but a newline here (and in
the corresponding spot below) would be nice.
That's a minor nit though, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +		of_node_put(cpu);
> +		riscv_timebase =3D prop;
> +		of_clk_init(NULL);
> +	} else {
> +		status =3D acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header =
**)&rhct);
> +		if (ACPI_FAILURE(status))
> +			panic("RISC-V ACPI system with no RHCT table\n");
> +		riscv_timebase =3D rhct->time_base_freq;
> +		acpi_put_table((struct acpi_table_header *)rhct);
> +	}
> =20
>  	lpj_fine =3D riscv_timebase / HZ;
> =20
> -	of_clk_init(NULL);
>  	timer_probe();
> =20
>  	tick_setup_hrtimer_broadcast();
> --=20
> 2.34.1
>=20

--9ueEUgWWOucslAoO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZWdwAKCRB4tDGHoIJi
0tRbAP9sV9/i+Nt5TFgt3D3dQu0MRkMmaWwMmRuG9k6Af62B0QD/cYMZAGC8XVRw
vGCpsH5Ygi+gGrH6Cok66aQs9RTt+wU=
=S8pz
-----END PGP SIGNATURE-----

--9ueEUgWWOucslAoO--


--===============0039161113032986717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0039161113032986717==--

