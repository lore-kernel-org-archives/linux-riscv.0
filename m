Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7891C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pdkgs36rFTQ5EsRk+6DLod6Tmb1hZbehSJmx0kvbFKo=; b=EF+dAdXsoH+c0MZ2iCFx+FbuRj
	AGxGl7/pKYsAKgniCnoxpOTSeTCDcQendO8UTbIqyvd0oPXDvbgVYQh1bYifwnPNgDXUispPNULw5
	rJNLAAXspEHRZ0vbYtyzM0+p1IuGUZQrYPfP8D5Kdb1NV1NljXdHHc/ZU8mctlKM7bxm4/FBuoead
	0/5GLP6gwTSEq+yJN1Mz7IFf+3QZ+cxlYqs+0ZuWXsSUwrv051Z+h/HP34Do0IvP+zixIP6PzMR/6
	uVRNdzKzIiJr0+9AUhfayPq1xUerJHeN36hEiclqCWOa0pyxK5PAgBRNSiJiDVwP+uF+C9V7E49j1
	r3GAltnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTo1-00000007EVS-0BKP;
	Wed, 26 Jun 2024 14:39:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTny-00000007ETA-0g2F
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E808ACE21F8;
	Wed, 26 Jun 2024 14:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583B3C116B1;
	Wed, 26 Jun 2024 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719412762;
	bh=A7sl8CPPaVUstW1VuKH/AzdyszBx003K6aNayxGnNsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGNMZWMCelzit7KEq0uGy6ZHa1de205PzOdJS5GsrSsFfIt+vFkadx2GE/9tXY5sg
	 pyDvBD0BDhj+G16M1vX1b5gWLW+fiRtGZum9NSKlaIk5i/Ap3LvOdmhEM8pIPHhbzG
	 05l9yqlRNt8T1So3UwyboALbmROobKmjuL4f6iPN+bYR+g9RV/sSOMnfdlxpHmCTUR
	 n20L7H3gPlPwPJb+Tyf4w/+wkJcWa3zKxNl9eNQ6kXwh80P2psuQa38L+T8sOb3hBC
	 QUhamfxNHu+me/DCMrHScymncia/ZMY+6PMHMMDaohJPYiFXSVmnO40lD+jb2yLL1i
	 z3G+kg0X6RZWA==
Date: Wed, 26 Jun 2024 15:39:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/8] RISC-V: Check Zicclsm to set unaligned access
 speed
Message-ID: <20240626-march-abreast-83414e844250@spud>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-5-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625005001.37901-5-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_073926_581196_EDCD162F 
X-CRM114-Status: GOOD (  21.78  )
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
Content-Type: multipart/mixed; boundary="===============8789213666449535593=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8789213666449535593==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zHOnQ2y5n0TrwW6w"
Content-Disposition: inline


--zHOnQ2y5n0TrwW6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 08:49:57PM -0400, Jesse Taube wrote:
> Check for Zicclsm before checking for unaligned access speed. This will
> greatly reduce the boot up time as finding the access speed is no longer
> necessary.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V2 -> V3:
>  - New patch split from previous patch
> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 26 ++++++++++++++--------
>  1 file changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kern=
el/unaligned_access_speed.c
> index a9a6bcb02acf..329fd289b5c8 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -259,23 +259,31 @@ static int check_unaligned_access_speed_all_cpus(vo=
id)
>  	kfree(bufs);
>  	return 0;
>  }
> +#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> +static int check_unaligned_access_speed_all_cpus(void)
> +{
> +	return 0;
> +}
> +#endif
> =20
>  static int check_unaligned_access_all_cpus(void)
>  {
> -	bool all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus();
> +	bool all_cpus_emulated;
> +	int cpu;
> +
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICCLSM)) {
> +		for_each_online_cpu(cpu) {
> +			per_cpu(misaligned_access_speed, cpu) =3D RISCV_HWPROBE_MISALIGNED_FA=
ST;

- const: zicclsm
  description:
    The standard Zicclsm extension for misaligned support for all regular
    load and store instructions (including scalar and vector) but not AMOs
    or other specialized forms of memory access. Defined in the
    RISC-V RVA Profiles Specification.=20

Doesn't, unfortunately, say anywhere there that they're actually fast :(

Thanks,
Conor.

> +		}
> +		return 0;
> +	}
> +
> +	all_cpus_emulated =3D check_unaligned_access_emulated_all_cpus();
> =20
>  	if (!all_cpus_emulated)
>  		return check_unaligned_access_speed_all_cpus();
> =20
>  	return 0;
>  }
> -#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
> -static int check_unaligned_access_all_cpus(void)
> -{
> -	check_unaligned_access_emulated_all_cpus();
> -
> -	return 0;
> -}
> -#endif
> =20
>  arch_initcall(check_unaligned_access_all_cpus);
> --=20
> 2.45.2
>=20

--zHOnQ2y5n0TrwW6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwoEgAKCRB4tDGHoIJi
0nz9AP97Mhuw65wobghk127Wwur0uFXEaFlNScYBqqh+mfmywAEAoFFB6kqgUedE
Bg3ErXmAie3wm8zEH1ifrdpajW8O5wQ=
=aDKF
-----END PGP SIGNATURE-----

--zHOnQ2y5n0TrwW6w--


--===============8789213666449535593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8789213666449535593==--

