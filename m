Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB037C7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sf5tcBJQaAP4c8+cctvnM4kT738o+alpzActdIL+a+8=; b=E37m0tsY7oI0X4dMv1g7Ze4hLM
	Ms4v/qcFd9Mw+asDmWiBNFWLM8WJHflmRpWpWaOP+3bCD4LdMIX7TKbtr1/bJcsPfzyC+9qvT76v0
	CYaTWPsWIqFPMkUf2+6Df1NkEP6WWCYSgobKht9OeM0F4PBRgxPoxmXBWMZnZz35kyRZw1hzq2YGI
	qNtLF/MOSM+YdpnEHpnZQy8ee4aPBFNdka+nl/Cr7mR+2vjWeTEvUYcefOOz0jYyqWyCjPViNk7wI
	uLjZO5HlCFXyVUyOu86uh9xlhxZnI++VG0FNr5eiADglCQ2Ns2VTwSnYIsf7xsKuVs7CcIkk9QeQv
	6NrBmCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8kK-006r1P-KI; Fri, 03 Mar 2023 16:59:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY8kH-006r0g-W5
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 16:59:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B82EB8191F;
	Fri,  3 Mar 2023 16:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B200C433D2;
	Fri,  3 Mar 2023 16:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677862739;
	bh=z0SfoQpwZEfIQgXPO1rQgO6UNErYjmoidz6DFukMqtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjlCgeWiwHNlbeEnXmtpsFTVV2C4SIz9hsbYHcmuxM52cLHlpccEHteOnEj/JNyPc
	 HXC/cjBOnnZWo8qMLUYrSlqAXaI0NdxQg83IVTq385Vq8tvSnWAkXs68g+ewYlFJsC
	 e2KMQq1s2YVPIDrQagmV2R5VNYk2vVKcTYc+7ekR+EMZ7TZpXuCIf5B0RBxhE1KMpQ
	 c5FPkRt8h+iKINzxK3yUgzVCoj4Y+iYP6NaTXKSThyRoGHKszWqQrPiARX1O4G+eOc
	 Cl7TcF94nVg45zsXkJRU8U2Q4pt89ozeO7RnRI/sjH+T9vpKtXFXSkocBctIVEv6Nk
	 Yebh9LFCxe1OQ==
Date: Fri, 3 Mar 2023 16:58:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH V3 11/20] RISC-V: ACPI: Cache and retrieve the RINTC
 structure
Message-ID: <fdb52973-0cbc-4d7e-88bc-534fe43eec9b@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-12-sunilvl@ventanamicro.com>
 <20230303160556.lezccmwa7ymymxws@orel>
MIME-Version: 1.0
In-Reply-To: <20230303160556.lezccmwa7ymymxws@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_085902_378657_0A4223E8 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============7206092103134619608=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7206092103134619608==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AUUK7G7NpwIF2qsL"
Content-Disposition: inline


--AUUK7G7NpwIF2qsL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 05:05:56PM +0100, Andrew Jones wrote:
> On Fri, Mar 03, 2023 at 07:06:38PM +0530, Sunil V L wrote:
> > RINTC structures in the MADT provide mapping between the hartid
> > and the CPU. This is required many times even at run time like
> > cpuinfo. So, instead of parsing the ACPI table every time, cache
> > the RINTC structures and provide a function to get the correct
> > RINTC structure for a given cpu.
> >=20
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  arch/riscv/include/asm/acpi.h |  9 ++++++
> >  arch/riscv/kernel/acpi.c      | 56 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 65 insertions(+)

> > diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acp=
i.h
> > index 111a8ed10af1..8be16c1ef7da 100644
> > --- a/arch/riscv/include/asm/acpi.h
> > +++ b/arch/riscv/include/asm/acpi.h
> > @@ -61,6 +61,10 @@ static inline void arch_fix_phys_package_id(int num,=
 u32 slot) { }
> > =20
> >  int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  		       unsigned int cpu, const char **isa);
> > +
> > +struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
> > +
> > +u32 get_acpi_id_for_cpu(int cpu);
> >  #else
> >  static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> >  				     unsigned int cpu, const char **isa)
> > @@ -68,6 +72,11 @@ static inline int acpi_get_riscv_isa(struct acpi_tab=
le_header *table,
> >  	return -EINVAL;
> >  }
> > =20
> > +static inline u32 get_acpi_id_for_cpu(int cpu)
> > +{
> > +	return -1;
> > +}
>=20
> Why do we need this stub? I wouldn't expect non-ACPI code to need an ACPI
> ID.

I think I asked for this (or assumed it existed) in v1, when I requested
the removal of #ifdef CONFIG_ACPI stuff in riscv_fill_hwcap().
Personally, I'd rather have this stub than the ifdeffery :)

Cheers,
Conor.


--AUUK7G7NpwIF2qsL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAInSQAKCRB4tDGHoIJi
0q0kAQCRhhViXko50omZit7Mc2H7+lY6SumTsapcSF6E4s9TSgEA2I1OvC1P0fbJ
L9+705mVwaQcCRmFffXsNrh8zobzyg8=
=nTk5
-----END PGP SIGNATURE-----

--AUUK7G7NpwIF2qsL--


--===============7206092103134619608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7206092103134619608==--

