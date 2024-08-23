Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35810C5321E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QkWlTSwS+B14TveH1XSFrZE3uokol3v7GngeKvZzHs=; b=c3WIFixwzhJ95sXHM4SEqvyk7N
	TnJuz6qtV1vA10gCEm44HyQ5Go15jWPOyIjsJ21hRvjhlc7AhGKUw3YIj2QxZ0eT1R23gpbp5lWP7
	0gx8BtgC4oJKYWdaOfAxTdFiYzcKNk11rpSqKJQ5Fa+VR62imoe7R8w5oWwwPF1o+q+85Nw9ftmUP
	OdmR/X3ayhaBhmREQydrgYG4TU6/FMtNuubI9Y/nQKuFEhDLm41ybdfq3RM6K8EjuafxLrN/1EeIK
	yjDQ2TI1NiSqyY+xebeDoFjOBrZ6gxNpJlRmOHo3UIWsw1iw4DuTzOWQwl6QNzhtNH7zJBM+RdEzX
	gICemxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTtP-0000000Gn2I-3bY3;
	Fri, 23 Aug 2024 12:59:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shTqm-0000000GmVt-4A0J
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 12:57:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2FD0CE0E12;
	Fri, 23 Aug 2024 12:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A571EC32786;
	Fri, 23 Aug 2024 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724417826;
	bh=sGmHqigfi91h++MeSMtlhXkd6vbhLv6URYk0YuK46s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbdnMo5d55IdSjhgLtcvmiSUiq/dv+hk5KM6y+MQiDDaeW0rvNEcJgSXSQ34Mhwf8
	 zQmQwEiItTdC36StskZgYLUpfr//Yf6rBH001jenF54dryZLzdeZx4NKEdFT4te75y
	 ngqL6K2DIUFSa8W0Tajj4wKCLgrNzlyJoWDiJ8PiY3cqNYN1WnmQTXIKUgFAuQTcqk
	 es1SFOfNaJ2HDJS8x+5DLnZnxbeLDtPdL+5ayHE+QZmRbEJaEmW5XdEXrkU8IQUhz5
	 rigzhB1otII5Y3X8Uu/X378c0IJW4m8/xeMkDbH47ZiDuaoVxd4G3Nfi8BmrdK9OV2
	 d9+M3OPB2X3ow==
Date: Fri, 23 Aug 2024 13:57:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhe Qiao <qiaozhe@iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, samuel.holland@sifive.com,
	evan@rivosinc.com, tglx@linutronix.de, andy.chiu@sifive.com,
	cleger@rivosinc.com, ajones@ventanamicro.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Report error when repeatedly recording CPU
 hardware ID
Message-ID: <20240823-circulate-underarm-13406fd8cc44@spud>
References: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_055709_405833_A08B4D93 
X-CRM114-Status: GOOD (  21.57  )
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
Content-Type: multipart/mixed; boundary="===============0423077434512371159=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0423077434512371159==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1gk8Xx/zdEe749N2"
Content-Disposition: inline


--1gk8Xx/zdEe749N2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 05:11:00PM +0800, Zhe Qiao wrote:
> In the of_parse_and_init_cpus() function, when the __cpuid_to_hartid_map[]
> array records the CPU hardware ID, if the same CPU hardware attribute has=
=20
> been recorded, an error report is issued, thereby ensuring the uniqueness
> of the CPU hardware ID recorded in the __cpuid_to_hartid_map[] array.

Why is this actually required? On what system did you encounter this?

> Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
> ---
>  arch/riscv/kernel/smpboot.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 0f8f1c95ac38..698f9fe791f7 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -118,6 +118,16 @@ static void __init acpi_parse_and_init_cpus(void)
>  #define acpi_parse_and_init_cpus(...)	do { } while (0)
>  #endif
> =20
> +static bool __init is_mpidr_duplicate(unsigned int cpuid, u64 hart)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 1; (i < cpuid) && (i < NR_CPUS); i++)
> +		if (cpuid_to_hartid_map(i) =3D=3D hart)
> +			return true;
> +	return false;
> +}
> +
>  static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
> @@ -131,6 +141,12 @@ static void __init of_parse_and_init_cpus(void)
>  		if (rc < 0)
>  			continue;
> =20
> +		if (is_mpidr_duplicate(cpuid, hart)) {
> +			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
> +				dn);
> +			continue;

Why would we continue in this case? If the devicetree is this broken,
why shouldn't we just BUG() and abort immediately?

> +		}
> +
>  		if (hart =3D=3D cpuid_to_hartid_map(0)) {
>  			BUG_ON(found_boot_cpu);
>  			found_boot_cpu =3D 1;
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--1gk8Xx/zdEe749N2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsiHHQAKCRB4tDGHoIJi
0koxAP9sghG9OoWshjsuVj24oEUwt51pZSe90s5Ueu+Sg0ExKwEA0HAyUVMgE7sL
yteP1g/gbK+VV4uHO6ELtK0bzChEeQE=
=MNX+
-----END PGP SIGNATURE-----

--1gk8Xx/zdEe749N2--


--===============0423077434512371159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0423077434512371159==--

