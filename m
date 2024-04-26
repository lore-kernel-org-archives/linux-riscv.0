Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02B8C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E8GxUXfOWbaX5Y9cqdWeIEEgRRF/CpqMBz+f9nFZYIA=; b=PO12fzshA22F+D39oePkD28G88
	1pW5+AnFyvf87CMtNt4uWPGJIOsr8ojxpPauDWLf244jsha5Ec7+LlHS1DN/1dQG3mmOFnF5Puz5W
	AiM+IrgHOx9O2lKsYtXjkK0DtGoWxnSj8QZfzfLD4BFUQgu9iBzEw0/NwAMzDDYag+NeIUMQKVJH3
	TX0s60ooDAwAfarymFEoiJQSk39JTVNoZQrpQo6cugxvC6nKvsaDjvkD9Tyidy1rw6R5K1r48hYTK
	MdjwgsDqimWPyXKX0uG3B+wbeREsML5yPKtoxyHzgcAdblBVcWWr29L7ZhtSXDf/qAlwlICLTfKU/
	ciNQRP/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NKu-0000000CzhS-1Jcl;
	Fri, 26 Apr 2024 15:18:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NKp-0000000Czg8-2wZk;
	Fri, 26 Apr 2024 15:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0800D6202A;
	Fri, 26 Apr 2024 15:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F55C113CD;
	Fri, 26 Apr 2024 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714144678;
	bh=+/fENaK5cFg3kscakPUFAoJIJiT0bv1e6mPEpyZqBr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8EO8pjGnbGSXuuL1OtXwdhfm6ZO1hYNJiCIWrOD5+TidBHDEMBP2H0XXK6sAx1Gh
	 WRzI/hZ/FmVRPe+Wkqh/qUndVxQzUVqVpFJoqgLl8wcBGuIDpLpR3eby3yVgqBIFyM
	 kW0vR+6LUOdFfT1y7Gkf4pCcLS7IU3WoiNzYs7YI12ZnvE7+EyNhL1szux/vBuPkuP
	 JAU3Di1GeehfGa6RK3a/MEoOkxTSzZ26u5+DN9ywvyA8fPJ5gjQ/mFK0ItEa/toO6w
	 EgMH3tl6aH9y931UT5HWsC9po8EpwU0UPR8QdZzH/XrnEq+5ufni1qcQzAfzDSXyFc
	 8Ml/rFYdMuJ+Q==
Date: Fri, 26 Apr 2024 16:17:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 04/17] riscv: vector: Use vlenb from DT
Message-ID: <20240426-unfocused-amount-e4e74e66962f@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-4-67cff4271d1d@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-4-67cff4271d1d@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_081759_855159_502171AD 
X-CRM114-Status: GOOD (  25.38  )
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
Content-Type: multipart/mixed; boundary="===============3096799538175813532=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3096799538175813532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/f82oMmmh2jh87go"
Content-Disposition: inline


--/f82oMmmh2jh87go
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 20, 2024 at 06:04:36PM -0700, Charlie Jenkins wrote:
> If vlenb is provided in the device tree, prefer that over reading the
> vlenb csr.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h |  2 ++
>  arch/riscv/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
>  arch/riscv/kernel/vector.c          | 13 +++++++++----
>  3 files changed, 37 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index 347805446151..809f61ffb667 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> +extern u32 riscv_vlenb_dt[NR_CPUS];
> +
>  void riscv_user_isa_enable(void);
> =20
>  #if defined(CONFIG_RISCV_MISALIGNED)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index c6e27b45e192..48874aac4871 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __r=
ead_mostly;
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> +u32 riscv_vlenb_dt[NR_CPUS];
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -656,6 +658,28 @@ static int __init riscv_isa_fallback_setup(char *__u=
nused)
>  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
>  #endif
> =20
> +static void riscv_set_vlenb_from_dt(void)

I'd expect to see a name here that had "of" in it, not "dt".

> +{
> +	int cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		struct device_node *cpu_node;
> +
> +		cpu_node =3D of_cpu_device_node_get(cpu);
> +		if (!cpu_node) {
> +			pr_warn("Unable to find cpu node\n");
> +			continue;
> +		}
> +
> +		if (!of_property_read_u32(cpu_node, "riscv,vlenb", &riscv_vlenb_dt[cpu=
])) {
> +			of_node_put(cpu_node);
> +			continue;
> +		}
> +
> +		of_node_put(cpu_node);
> +	}
> +}
> +
>  void __init riscv_fill_hwcap(void)
>  {
>  	char print_str[NUM_ALPHA_EXTS + 1];
> @@ -675,6 +699,8 @@ void __init riscv_fill_hwcap(void)
>  	} else {
>  		int ret =3D riscv_fill_hwcap_from_ext_list(isa2hwcap);
> =20
> +		riscv_set_vlenb_from_dt();

Hmm, I think we can go a step further here. We know all of the CPUs
widths by the time we get to the first call to riscv_v_setup_vsize(), can
we examine the whole list and decide not to enable vector if they do
not match, rather than continuing and failing to online CPUs that having
the mismatched size?

I guess that can go into the `if (elf_hwcap & COMPAT_HWCAP_ISA_V)`
condition we already have, and would require clearing the bit from the
mask we have at the moment.

Cheers,
Conor.

> +
>  		if (ret && riscv_isa_fallback) {
>  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
>  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 6727d1d3b8f2..fb7f3ca80d9e 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -32,11 +32,16 @@ EXPORT_SYMBOL_GPL(riscv_v_vsize);
>  int riscv_v_setup_vsize(void)
>  {
>  	unsigned long this_vsize;
> +	int cpu =3D smp_processor_id();
> =20
> -	/* There are 32 vector registers with vlenb length. */
> -	riscv_v_enable();
> -	this_vsize =3D csr_read(CSR_VLENB) * 32;
> -	riscv_v_disable();
> +	if (riscv_vlenb_dt[cpu]) {
> +		this_vsize =3D riscv_vlenb_dt[cpu];

> +	} else {
> +		/* There are 32 vector registers with vlenb length. */
> +		riscv_v_enable();
> +		this_vsize =3D csr_read(CSR_VLENB) * 32;
> +		riscv_v_disable();
> +	}
> =20
>  	if (!riscv_v_vsize) {
>  		riscv_v_vsize =3D this_vsize;
>=20
> --=20
> 2.44.0
>=20

--/f82oMmmh2jh87go
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZivFoAAKCRB4tDGHoIJi
0lF6AP0ehEsfxARMlCxOz5UMGtGRXyOJbr5gWiVUL5P1faiZAQD+NLZW+R2Tboo5
nIrNrSxgWYbJVCV/sCH9Gny0THVwGg0=
=jRyL
-----END PGP SIGNATURE-----

--/f82oMmmh2jh87go--


--===============3096799538175813532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3096799538175813532==--

