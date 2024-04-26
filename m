Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2990EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 16:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaEF8tag0cfwRRi2PSVgf+7Syi9r9/GD2HI38fkTxaU=; b=JYaobcCFc9HN9E7xAq5NeXFhfD
	PyKZP1Q1hp0atVDz03bpIywnod7LQonXS06CplN45a7Q3NUPQGqTaqSEZ4tOwV4Qn42gb2KZv7oQr
	y9Ty4AOoqgelKHqB6q6PgF/VtBkyS2SKSq538rYD0ZeGO4/JIjvC/NjEp+bJRo4kP9Paqyg/ULRHn
	gPVHxLP+r0nkfdSlHVcJlVYPhGwOyYHuFfioW6CIZBR0pN6M/u3VNc9KxZ3vrJ+t2jD/pBYN6MLRk
	e1pJaIvhOVm77PeGD0pPFRUfgbWVI3vLzc7m0o+OQ8VIRVhfg6ZVqoRecbRUPITs8HJbM1J044jMC
	qFW5Tl/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0OKG-0000000DEYs-1Jul;
	Fri, 26 Apr 2024 16:21:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0OKB-0000000DEXF-3qbF;
	Fri, 26 Apr 2024 16:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49C0E620B8;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3655DC2BD10;
	Fri, 26 Apr 2024 16:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148482;
	bh=Hn61kMNsNgWegMIQkOGTIDhsBAX/ZE3MuYFJqXsyHb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2QUeRo29RObmBT2HjfP9+CpfdSFo4Va7UuLo0EUHi7pFuVVGmIU6aFXfepxv8S3L
	 MsVCiGr3lkN5OoBlh/rmfl+Knh+SKkPhI4Gz7S5a8KkRn8/BRccFi5NonrhAuJGrtJ
	 ZH4A+V+7sneSC5Z03t8JyNv0TFYlaZBA5H6GfXCUQ8BFw37dw7evzQWeFyuLeVWEjW
	 nLX1ltHW0QZ6vF1Zs/TNZC+oW7MHNcbaXqRjJANc78VfmvSDpM3YbxNMU/Mna/LWWY
	 xeZGDrtLL2AlnfmrowVhJbAjR6QWCS+w9sM+pJkY7rsJNLFxEpCgKXeDypFGU7VEL3
	 8j7LoQaN45t7w==
Date: Fri, 26 Apr 2024 17:21:16 +0100
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
Message-ID: <20240426-unfixed-mournful-0a71fb3972b4@spud>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
 <20240420-dev-charlie-support_thead_vector_6_9-v3-4-67cff4271d1d@rivosinc.com>
 <20240426-unfocused-amount-e4e74e66962f@spud>
MIME-Version: 1.0
In-Reply-To: <20240426-unfocused-amount-e4e74e66962f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_092124_363762_2F7BDFFA 
X-CRM114-Status: GOOD (  30.89  )
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
Content-Type: multipart/mixed; boundary="===============8777223644336719207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8777223644336719207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y3AOSiB6kporqE+7"
Content-Disposition: inline


--Y3AOSiB6kporqE+7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 04:17:52PM +0100, Conor Dooley wrote:
> On Sat, Apr 20, 2024 at 06:04:36PM -0700, Charlie Jenkins wrote:
> > If vlenb is provided in the device tree, prefer that over reading the
> > vlenb csr.
> >=20
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  2 ++
> >  arch/riscv/kernel/cpufeature.c      | 26 ++++++++++++++++++++++++++
> >  arch/riscv/kernel/vector.c          | 13 +++++++++----
> >  3 files changed, 37 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/a=
sm/cpufeature.h
> > index 347805446151..809f61ffb667 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >  /* Per-cpu ISA extensions. */
> >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> > =20
> > +extern u32 riscv_vlenb_dt[NR_CPUS];
> > +
> >  void riscv_user_isa_enable(void);
> > =20
> >  #if defined(CONFIG_RISCV_MISALIGNED)
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index c6e27b45e192..48874aac4871 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) _=
_read_mostly;
> >  /* Per-cpu ISA extensions. */
> >  struct riscv_isainfo hart_isa[NR_CPUS];
> > =20
> > +u32 riscv_vlenb_dt[NR_CPUS];
> > +
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> >   *
> > @@ -656,6 +658,28 @@ static int __init riscv_isa_fallback_setup(char *_=
_unused)
> >  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
> >  #endif
> > =20
> > +static void riscv_set_vlenb_from_dt(void)
>=20
> I'd expect to see a name here that had "of" in it, not "dt".

Also, "set" - I think "get" is more suitable here given that this
doesn't actually set the vlen, we only do any setting later on in
riscv_v_set_vsize().

>=20
> > +{
> > +	int cpu;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		struct device_node *cpu_node;
> > +
> > +		cpu_node =3D of_cpu_device_node_get(cpu);
> > +		if (!cpu_node) {
> > +			pr_warn("Unable to find cpu node\n");
> > +			continue;
> > +		}
> > +
> > +		if (!of_property_read_u32(cpu_node, "riscv,vlenb", &riscv_vlenb_dt[c=
pu])) {
> > +			of_node_put(cpu_node);
> > +			continue;
> > +		}
> > +
> > +		of_node_put(cpu_node);
> > +	}
> > +}
> > +
> >  void __init riscv_fill_hwcap(void)
> >  {
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> > @@ -675,6 +699,8 @@ void __init riscv_fill_hwcap(void)
> >  	} else {
> >  		int ret =3D riscv_fill_hwcap_from_ext_list(isa2hwcap);
> > =20
> > +		riscv_set_vlenb_from_dt();
>=20
> Hmm, I think we can go a step further here. We know all of the CPUs
> widths by the time we get to the first call to riscv_v_setup_vsize(), can
> we examine the whole list and decide not to enable vector if they do
> not match, rather than continuing and failing to online CPUs that having
> the mismatched size?
>=20
> I guess that can go into the `if (elf_hwcap & COMPAT_HWCAP_ISA_V)`
> condition we already have, and would require clearing the bit from the
> mask we have at the moment.
>=20
> Cheers,
> Conor.
>=20
> > +
> >  		if (ret && riscv_isa_fallback) {
> >  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> >  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > index 6727d1d3b8f2..fb7f3ca80d9e 100644
> > --- a/arch/riscv/kernel/vector.c
> > +++ b/arch/riscv/kernel/vector.c
> > @@ -32,11 +32,16 @@ EXPORT_SYMBOL_GPL(riscv_v_vsize);
> >  int riscv_v_setup_vsize(void)
> >  {
> >  	unsigned long this_vsize;
> > +	int cpu =3D smp_processor_id();
> > =20
> > -	/* There are 32 vector registers with vlenb length. */
> > -	riscv_v_enable();
> > -	this_vsize =3D csr_read(CSR_VLENB) * 32;
> > -	riscv_v_disable();
> > +	if (riscv_vlenb_dt[cpu]) {
> > +		this_vsize =3D riscv_vlenb_dt[cpu];
>=20
> > +	} else {
> > +		/* There are 32 vector registers with vlenb length. */
> > +		riscv_v_enable();
> > +		this_vsize =3D csr_read(CSR_VLENB) * 32;
> > +		riscv_v_disable();
> > +	}
> > =20
> >  	if (!riscv_v_vsize) {
> >  		riscv_v_vsize =3D this_vsize;
> >=20
> > --=20
> > 2.44.0
> >=20



--Y3AOSiB6kporqE+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZivUfAAKCRB4tDGHoIJi
0ja2AP41c5dc/6BG0GZfsJj9ddy8XtTl1UKbZXg4fm3rsjp/iQEA74sw0CHJBYlO
KyniXTb0643C0HtiMJns75Q4RVazuQA=
=lLBv
-----END PGP SIGNATURE-----

--Y3AOSiB6kporqE+7--


--===============8777223644336719207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8777223644336719207==--

