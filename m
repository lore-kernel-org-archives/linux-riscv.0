Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23921C3DA6F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu50alN1lq1TbPnKTx45vUbNYdIrFlHV4rNpjkvYIDQ=; b=fZwQ2T267mp11R0WDpXNImrw1t
	jUg1qL1RjaAcMnXgCiV2y/bYYAxxSRpVvFm1Lx6BwnrfvsJ3qike+tW1l2ccqIMgy6VAtsDteYzFJ
	+Zyi2bJZNQ1ElRspWeuvUdXGSuvo5UKnFA/f3WbpPdGHzZoX/jatF0E1uPKx+lW4rXGK/2rHf7Yj5
	Q94/4DCmJOU69KjVh7A6dRemiROv9jJn5ldvZ+H8WHExpvEvR9uBI0IurvSumIFwLxuzsJsAA6AqC
	KTw26PeOBwg9gkiH5I2Fu4HAHJFcWMGtFFg6P2ezhsKKDzpVG6nhyy1cG3ikJZb2BB/InLTVLqnr4
	OUg+sQ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ9Ke-0032zP-0m;
	Thu, 24 Aug 2023 12:21:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ9Kb-0032yX-14
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 12:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1692879657; x=1724415657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UniHE8T8CBJsXsp5AUwf/p97KIJh8SiPdFKSRg4PQ+0=;
  b=DJ41wetBYss3Xc3QZb6IvGjJsprDwo8oRBizsAEwQzP/nN5ZmFLh90ab
   kCO/0io3ey9EXkVBlOgkq7Lyhb/0Z67KZnbHMI2EqpK57D+Rkc8kCVDwL
   49STckbb1I2vIrC1lwf/mmM02yD/ciTnJy+kcPsEFXYUxNF6apV3K5bLH
   8CORm8UWuEqKYgojumV2fUUC3fxwJw8ndpzhuXAmqO3aLln/tXT7DW0QM
   MjARiEOJ9a/5yFS6QhpJqu0kZJ2TAAgot8nibQoy3iywi8Nx7fBquuU0q
   UcIX2oqhuAZ6k09cCbfHXH9+yg9Hga2nllma94mKSLcVBw5QXCSQ+r+p6
   w==;
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="asc'?scan'208";a="1101686"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Aug 2023 05:20:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 24 Aug 2023 05:20:49 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 24 Aug 2023 05:20:47 -0700
Date: Thu, 24 Aug 2023 13:20:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230824-factual-jawed-2dddd2cf2bdd@wendy>
References: <20230711201831.2695097-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230711201831.2695097-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_052057_496599_7E926E8B 
X-CRM114-Status: GOOD (  32.89  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============4777992566427201896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4777992566427201896==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qk1i/rPebejGNd0P"
Content-Disposition: inline

--qk1i/rPebejGNd0P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2023 at 01:18:30PM -0700, Evan Green wrote:
> In /proc/cpuinfo, most of the information we show for each processor is
> specific to that hart: marchid, mvendorid, mimpid, processor, hart,
> compatible, and the mmu size. But the ISA string gets filtered through a
> lowest common denominator mask, so that if one CPU is missing an ISA
> extension, no CPUs will show it.
>=20
> Now that we track the ISA extensions for each hart, let's report ISA
> extension info accurately per-hart in /proc/cpuinfo. We cannot change
> the "isa:" line, as usermode may be relying on that line to show only
> the common set of extensions supported across all harts. Add a new "hart
> isa" line instead, which reports the true set of extensions for that
> hart. This matches what is returned in riscv_hwprobe() when querying a
> given hart.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> ---
>=20
> Changes in v4:
>  - Documentation: Made the underline match the text line (Conor)
>  - Documentation: hanged "in question" to "being described" (Andrew)
>=20
> Changes in v3:
>  - Add some documentation (Conor)
>=20
> Changes in v2:
>  - Added new "hart isa" line rather than altering behavior of existing
>    "isa" line (Conor, Palmer)
>=20
>=20
> I based this series on top of Conor's riscv-extensions-strings branch
> from July 3rd, since otherwise this change gets hopelessly entangled
> with that series.
>=20
> ---
>  Documentation/riscv/uabi.rst | 10 ++++++++++
>  arch/riscv/kernel/cpu.c      | 22 ++++++++++++++++++----
>  2 files changed, 28 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 8960fac42c40..afdda580e5a2 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -42,6 +42,16 @@ An example string following the order is::
> =20
>     rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> =20
> +"isa" vs "hart isa" lines in /proc/cpuinfo
> +------------------------------------------
> +
> +The "isa" line in /proc/cpuinfo describes the lowest common denominator =
of
> +RISC-V ISA extensions understood by the kernel and implemented on all ha=
rts. The
> +"hart isa" line, in contrast, describes the set of extensions understood=
 by the
> +kernel on the particular hart being described, even if those extensions =
may not
> +be present on all harts in the system. The "hart isa" line is consistent=
 with
> +what's returned by __riscv_hwprobe() when querying for that specific CPU.

Thinking about this again, I don't think this is true. hwprobe uses
has_fpu(), has_vector() etc that interact with Kconfig options but the
percpu isa bitmap isn't affected by these.


> +
>  Misaligned accesses
>  -------------------
> =20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1acf3679600d..6264b7b94945 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -197,9 +197,8 @@ arch_initcall(riscv_cpuinfo_init);
> =20
>  #ifdef CONFIG_PROC_FS
> =20
> -static void print_isa(struct seq_file *f)
> +static void print_isa(struct seq_file *f, const unsigned long *isa_bitma=
p)
>  {
> -	seq_puts(f, "isa\t\t: ");
> =20
>  	if (IS_ENABLED(CONFIG_32BIT))
>  		seq_write(f, "rv32", 4);
> @@ -207,7 +206,7 @@ static void print_isa(struct seq_file *f)
>  		seq_write(f, "rv64", 4);
> =20
>  	for (int i =3D 0; i < riscv_isa_ext_count; i++) {
> -		if (!__riscv_isa_extension_available(NULL, riscv_isa_ext[i].id))
> +		if (!__riscv_isa_extension_available(isa_bitmap, riscv_isa_ext[i].id))
>  			continue;
> =20
>  		/* Only multi-letter extensions are split by underscores */
> @@ -271,7 +270,15 @@ static int c_show(struct seq_file *m, void *v)
> =20
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> -	print_isa(m);
> +
> +	/*
> +	 * For historical raisins, the isa: line is limited to the lowest common
> +	 * denominator of extensions supported across all harts. A true list of
> +	 * extensions supported on this hart is printed later in the hart_isa:
> +	 * line.
> +	 */
> +	seq_puts(m, "isa\t\t: ");
> +	print_isa(m, NULL);
>  	print_mmu(m);
> =20
>  	if (acpi_disabled) {
> @@ -287,6 +294,13 @@ static int c_show(struct seq_file *m, void *v)
>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
> +
> +	/*
> +	 * Print the ISA extensions specific to this hart, which may show
> +	 * additional extensions not present across all harts.
> +	 */
> +	seq_puts(m, "hart isa\t: ");
> +	print_isa(m, hart_isa[cpu_id].isa);
>  	seq_puts(m, "\n");
> =20
>  	return 0;
> --=20
> 2.34.1
>=20

--qk1i/rPebejGNd0P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOdK9gAKCRB4tDGHoIJi
0liiAP4gl0tcLeJen0DrqHl7mUfFjKLV+rxAVZFw6sBF8FRmaQEAu0Z51JiElsPS
KyIRZMIWB/CZJgPwPVBoToRKWWbtSAA=
=u5eg
-----END PGP SIGNATURE-----

--qk1i/rPebejGNd0P--


--===============4777992566427201896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4777992566427201896==--

