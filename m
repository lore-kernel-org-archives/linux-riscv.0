Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59199C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5m3U44vw7QqiDH+zzTBo4cjTIdArxlBNFaXQwrLzHnI=; b=njuywPSUjgAndwgMy0LUApm+3B
	pz6FoLjZ/i3I2QP81zsLgHy6KyE+Mb5juaWzLynrNiYRNMwdorRs4IzH40ftPvsMIpKl4hExOE7vT
	x33B50GiaplVovCdymmmvlosR87nrH+htJPEUmvZjI8wV5auYwGgWYWsuKoO/a3Nj2a8iwLCcBQ5e
	i+mHYjEqa4N6EhQIJ9oEkPGsGJtWfmJrJACUAM4Fy73GbbOKpk8SQkLW2TGiGgpScGHl6/61zqFOd
	w5xQvtmLcVU3RWBxpvv3UR1BgXD1fsygSplMERiJs09WDIQ8tnumY6+lsTD0HVr9RcBuFKvb4oOOv
	cZG7EVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6YwV-002Ips-2c;
	Tue, 06 Jun 2023 15:49:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6YwS-002Ioz-1m;
	Tue, 06 Jun 2023 15:49:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F1E0E62F8B;
	Tue,  6 Jun 2023 15:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DBF3C433EF;
	Tue,  6 Jun 2023 15:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686066591;
	bh=0d32+WCapjwVnQgaci/Xdg3bjraWXhNb2bKu6buPcK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IoZi0BQW66anQarIWSMnPwiut1QOJ9Q+u7ExVx3uFR+qftDx3biEjQ+U+w8aiHAvd
	 xijGUPsZ3PdGeSWthdwbJmya9zMUgYGdj7JWkOOmAMyVucibyR0+kdLfkneyKyP2XX
	 lRlI4M2d5BkG+eFM0NHenP0AfNyW1R1J50ehfrrGhOrAF6fuVCgLhMMLX4aCJGo84+
	 TU/DRAXRf8egURMhhWLq/DSJB53CLKxi3YEkI/2Odc0mEYbaRVmiS9B8Q9Sx2QHlQi
	 328SLQ2WvI7DemhS7edZdynQHYf7qLNXpTlDejTdHnolQaKDfEhphP75lXJh/zped3
	 HF7FHPcjs7thA==
Date: Tue, 6 Jun 2023 16:49:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v1 -next 2/2] RISC-V/perf: Use standard interface to get
 INTC domain
Message-ID: <20230606-scribe-discuss-b884605cb870@spud>
References: <20230605143512.707533-1-sunilvl@ventanamicro.com>
 <20230605143512.707533-3-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230605143512.707533-3-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_084952_665246_BF0225B4 
X-CRM114-Status: GOOD (  21.66  )
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
Content-Type: multipart/mixed; boundary="===============8950667640362724767=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8950667640362724767==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gwX9jHrHYHhC33x/"
Content-Disposition: inline


--gwX9jHrHYHhC33x/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 08:05:12PM +0530, Sunil V L wrote:
> Currently the PMU driver is using DT based lookup to
> find the INTC node for sscofpmf extension. This will not work
> for ACPI based systems causing the driver to fail to register
> the PMU overflow interrupt handler.
>=20
> Hence, change the code to use the standard interface to find
> the INTC node which works irrespective of DT or ACPI.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 4f3ac296b3e2..0bc491252a44 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -739,7 +739,6 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu, =
struct platform_device *pde
>  {
>  	int ret;
>  	struct cpu_hw_events __percpu *hw_events =3D pmu->hw_events;
> -	struct device_node *cpu, *child;
>  	struct irq_domain *domain =3D NULL;
> =20
>  	if (riscv_isa_extension_available(NULL, SSCOFPMF)) {
> @@ -756,20 +755,8 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu,=
 struct platform_device *pde
>  	if (!riscv_pmu_use_irq)
>  		return -EOPNOTSUPP;
> =20
> -	for_each_of_cpu_node(cpu) {
> -		child =3D of_get_compatible_child(cpu, "riscv,cpu-intc");
> -		if (!child) {
> -			pr_err("Failed to find INTC node\n");
> -			of_node_put(cpu);
> -			return -ENODEV;
> -		}
> -		domain =3D irq_find_host(child);
> -		of_node_put(child);
> -		if (domain) {
> -			of_node_put(cpu);
> -			break;
> -		}
> -	}
> +	domain =3D irq_find_matching_fwnode(riscv_get_intc_hwnode(),
> +					  DOMAIN_BUS_ANY);

This riscv_get_intc_hwnode stuff is horrific, but that's besides the
point.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>  	if (!domain) {
>  		pr_err("Failed to find INTC IRQ root domain\n");
>  		return -ENODEV;
> --=20
> 2.34.1
>=20

--gwX9jHrHYHhC33x/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH9VmgAKCRB4tDGHoIJi
0oFHAQCK0+LA4Hkdi2DZBS7TOsIy0vK07SpAap5peSAzvtbB9AD9HXu6oqENThnH
LWiUD5Y9PW0nx9C+Y9alXKaylYBWPwk=
=BJKN
-----END PGP SIGNATURE-----

--gwX9jHrHYHhC33x/--


--===============8950667640362724767==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8950667640362724767==--

