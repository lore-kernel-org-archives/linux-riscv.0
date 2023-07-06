Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78D9EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2A8krfjel4RvcJhI8/8zVDheK66d2wycsR2Iqg1PqQ=; b=SSK4FA7tkZxAcS4YHRiJrzu2A6
	CaoJlktp4TMisIwmYgPhwJag77HPBvHRR35SkTLgLY+o+H1SGFXXM57NFXF4RFFkhdA1+iBWeElJI
	SNsg5XfYZDiRutlOCcQryIbvQh4Aj2kLn+6TYX9/nLGBq+rQkNpSOcMRGWx552BvPiJIpl0k/dlTx
	jD+kx7ZZ9vehdt9W2IL+koDmoK3YcCwVxr9H3pl+U8kwd2hu/vUkPeYDCxCwPpk/G7zESJJth+07+
	Yp1+sCxpRvdJkGceJ0QPJHDG6B8HeQsLG2aMmilVAk5ZvJgtUvWgg8JdnwRxBSZ6dZ5FZmL+qOVv5
	KyHjU+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMcb-001Jrz-2p;
	Thu, 06 Jul 2023 10:54:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHMcY-001JpD-1e
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 10:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688640838; x=1720176838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o50z9Dt6f6niYBZzkVylMnavHJWjV/lG6IzZydHxJ9M=;
  b=LXMdJvgf5awOpbILaFG/owkUNZ9ISc4DbkQsDADvB+m2ccs43mdrXHrt
   inijnsIMdnrHCM4a0OL42o2Oo0kkbO13pQhC3b/b2EDiY7Rq4rzlg4krQ
   Qc5K6lFRB/Zy1aiAOUfNtHBbpuikN+vvAQ3gO1JqgvaPFHpNVm23d02a4
   Ipf3Sut1xqlOUzadr2KzFHrJwa/E/7YlpFIazwfGNN5yU5GAL7Rwh7oS7
   fxG/E5afYxPAbuZNNc0yzfIneAYPvYknJYgqzhgfDC4KPLiXatIupYp/A
   fS+/LFHRXCIh1E2LNtk60UpkVWtcpJNiXywz5DCkkSRWjam5TuJkQUEN6
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="asc'?scan'208";a="160126353"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2023 03:53:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Jul 2023 03:53:44 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Jul 2023 03:53:42 -0700
Date: Thu, 6 Jul 2023 11:53:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230706-murkiness-oven-444f25924546@wendy>
References: <20230705172931.1099183-1-evan@rivosinc.com>
 <20230706-dbdee6eba0c4a16084587b10@orel>
MIME-Version: 1.0
In-Reply-To: <20230706-dbdee6eba0c4a16084587b10@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_035358_728563_53D44001 
X-CRM114-Status: GOOD (  40.19  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Content-Type: multipart/mixed; boundary="===============3945690177638417339=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3945690177638417339==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0qpcjaRKI05o/cBU"
Content-Disposition: inline

--0qpcjaRKI05o/cBU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 10:01:31AM +0200, Andrew Jones wrote:
> On Wed, Jul 05, 2023 at 10:29:31AM -0700, Evan Green wrote:
> > In /proc/cpuinfo, most of the information we show for each processor is
> > specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> > compatible, and the mmu size. But the ISA string gets filtered through a
> > lowest common denominator mask, so that if one CPU is missing an ISA
> > extension, no CPUs will show it.
> >=20
> > Now that we track the ISA extensions for each hart, let's report ISA
> > extension info accurately per-hart in /proc/cpuinfo. We cannot change
> > the "isa:" line, as usermode may be relying on that line to show only
> > the common set of extensions supported across all harts. Add a new "hart
> > isa" line instead, which reports the true set of extensions for that
> > hart. This matches what is returned in riscv_hwprobe() when querying a
> > given hart.
> >=20
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> >=20
> > ---
> >=20
> > Changes in v2:
> >  - Added new "hart isa" line rather than altering behavior of existing
> >    "isa" line (Conor, Palmer)
> >=20
> >=20
> > I based this series on top of Conor's riscv-extensions-strings branch
> > from July 3rd, since otherwise this change gets hopelessly entangled
> > with that series.
> >=20
> > I was unsure if I could snuggle the new "hart isa" line in just below
> > "isa". Aesthetically it would be quite pleasing, but it runs the risk of
> > breaking brittle usermode parsers that are assuming a specific line
> > order. So I put it at the end.
>=20
> Actually, they're probably only aesthetically pleasing when they match. If
> there are differences, then I'd guess having them side by side, almost the
> same, but different, would make them even harder to look at then they
> already are. So I think I'll be happier with them separated by a few lines
> anyway.

This list is eventually going to be so big that I don't think doing
by-eye anything is going to be useful, so aesthetics be damned.
That said, a parser that relies on the order of individual lines like
that might deserve to be broken ;)

Anyway, change looks good to me:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I was thinking the uabi doc might need an update - should we add to it
that "isa" means the common set & "hart isa"?

Cheers,
Conor.

> > ---
> >  arch/riscv/kernel/cpu.c | 22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 1acf3679600d..6264b7b94945 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -197,9 +197,8 @@ arch_initcall(riscv_cpuinfo_init);
> > =20
> >  #ifdef CONFIG_PROC_FS
> > =20
> > -static void print_isa(struct seq_file *f)
> > +static void print_isa(struct seq_file *f, const unsigned long *isa_bit=
map)
> >  {
> > -	seq_puts(f, "isa\t\t: ");
> > =20
> >  	if (IS_ENABLED(CONFIG_32BIT))
> >  		seq_write(f, "rv32", 4);
> > @@ -207,7 +206,7 @@ static void print_isa(struct seq_file *f)
> >  		seq_write(f, "rv64", 4);
> > =20
> >  	for (int i =3D 0; i < riscv_isa_ext_count; i++) {
> > -		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
> > +		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id=
))
> >  			continue;
> > =20
> >  		/* Only multi-letter extensions are split by underscores */
> > @@ -271,7 +270,15 @@ static int c_show(struct seq_file *m, void *v)
> > =20
> >  	seq_printf(m, "processor\t: %lu\n", cpu_id);
> >  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> > -	print_isa(m);
> > +
> > +	/*
> > +	 * For historical raisins, the isa: line is limited to the lowest com=
mon
> > +	 * denominator of extensions supported across all harts. A true list =
of
> > +	 * extensions supported on this hart is printed later in the hart_isa:
> > +	 * line.
> > +	 */
> > +	seq_puts(m, "isa\t\t: ");
> > +	print_isa(m, NULL);
> >  	print_mmu(m);
> > =20
> >  	if (acpi_disabled) {
> > @@ -287,6 +294,13 @@ static int c_show(struct seq_file *m, void *v)
> >  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> >  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> >  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
> > +
> > +	/*
> > +	 * Print the ISA extensions specific to this hart, which may show
> > +	 * additional extensions not present across all harts.
> > +	 */
> > +	seq_puts(m, "hart isa\t: ");
> > +	print_isa(m, hart_isa[cpu_id].isa);
> >  	seq_puts(m, "\n");
> > =20
> >  	return 0;
> > --=20
> > 2.34.1
> >


--0qpcjaRKI05o/cBU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKadGAAKCRB4tDGHoIJi
0pK8AQCYZpuP+ABbmojkwmSlqKPYl+thQSqwUqrJsDOgD51+aAEAvyq/zo3OaIWj
saOw+IqxHnyBVjVvUCz1KNx9ABaCBQ4=
=UJ59
-----END PGP SIGNATURE-----

--0qpcjaRKI05o/cBU--


--===============3945690177638417339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3945690177638417339==--

