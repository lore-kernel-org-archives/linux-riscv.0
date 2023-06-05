Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C17C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asa1tbIobRQucz/bpP6GbcWgTOppwsKypgDt5nL84m4=; b=0qQ2s34IsTZXFSguLPpLdJ9NSV
	CwCDrCNHR0x0llx2HOU3ub2Cqo96A3lQxwDMcsaw16QQB9y/ngLn5sP8KMdrq5ZsABnE/WQa38Xq0
	MPgJ6L2HxdUu7kztbHwNcX8+ZIN88LC/NVBCfu9yXHhXV5/p/urDYJEyyKgvnx3KsKIhJ89EGHci0
	3DvBtRdjPS35gnawCyxlpGGcuWzVSVjuLKdejOBP0tImBxxFv3LEUQIg1SUnm+OoRXAkLKbCtjdZz
	RQo27iIXgvrrgWRRJ/KM+oinTaOwaxCTWKT3NmJoBVpLQ/QgBxT0VDrFrTEll905DP8A7/xIxim9c
	t5n/s0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6D0x-00G7Ni-2g;
	Mon, 05 Jun 2023 16:25:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6D0u-00G7Lw-1c;
	Mon, 05 Jun 2023 16:25:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1607260B84;
	Mon,  5 Jun 2023 16:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A67BC433EF;
	Mon,  5 Jun 2023 16:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685982299;
	bh=2k5gsovXlJIC1RZserxxFdrudV31qBUSxSuOtRRJwrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iixl2+w277wloCrH/fuvS0EtM3J6dfF5nQQoMSsbPDBdLAwobs9zR94E1L1EcPn9P
	 P0HiCilKL+3ZQ0+oxgiLOm/bbZ1y4kdGJjux1bsHe9gx4w4gaBk0pBeaFlivnnn4oz
	 p5UzqsmwlJ2kkkhHDcA6tI6wc47r9elqZ6leUSGFtLQcbQv2rLTEGa9wkDnYRpXcNE
	 IZj2VPBEMij8da+4j2SyftPyd26/afd21O7ZGuABxUQaguFEI27ROVfNH1mFbf81Ug
	 dTx9J8g2kauMJi8MGeszYc44yAALPGE/JCSsxI5m8wN9DlpLBYRV46J3KmVTnkYTbE
	 hEjlt38KuqBwg==
Date: Mon, 5 Jun 2023 17:24:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH -next v21 20/27] riscv: hwcap: change ELF_HWCAP to a
 function
Message-ID: <20230605-embattled-navigator-408a7b60b2ab@spud>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-21-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230605110724.21391-21-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092500_626609_374700A9 
X-CRM114-Status: GOOD (  29.08  )
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
Content-Type: multipart/mixed; boundary="===============0521927385259970627=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0521927385259970627==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ye2ug/mzlrhRInNk"
Content-Disposition: inline


--ye2ug/mzlrhRInNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2023 at 11:07:17AM +0000, Andy Chiu wrote:
> Using a function is flexible to represent ELF_HWCAP. So the kernel may
> encode hwcap reflecting supported hardware features just at the moment of
> the start of each program.
>=20
> This will be helpful when we introduce prctl/sysctl interface to control
> per-process availability of Vector extension in following patches.
> Programs started with V disabled should see V masked off in theirs
> ELF_HWCAP.

For the uninformed, like myself, this needs to be a function, rather
than open coding the masking of the V bit at the one user of ELF_HWCAP
this series adds, because the binfmt stuff needs to get the value in
create_elf_fdpic_tables() & co?

If that's your purpose,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

One minor comment below.

>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/elf.h   | 2 +-
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpufeature.c | 5 +++++
>  3 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index ca23c4f6c440..c24280774caf 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -66,7 +66,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>   * via a bitmap that coorespends to each single-letter ISA extension.  T=
his is
>   * essentially defunct, but will remain for compatibility with userspace.
>   */
> -#define ELF_HWCAP	(elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1))
> +#define ELF_HWCAP	riscv_get_elf_hwcap()
>  extern unsigned long elf_hwcap;
> =20
>  /*
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 574385930ba7..e6c288ac4581 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -61,6 +61,8 @@
> =20
>  #include <linux/jump_label.h>
> =20
> +unsigned long riscv_get_elf_hwcap(void);
> +
>  struct riscv_isa_ext_data {
>  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
>  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 28032b083463..29c0680652a0 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -293,6 +293,11 @@ void __init riscv_fill_hwcap(void)
>  	pr_info("riscv: ELF capabilities %s\n", print_str);
>  }
> =20
> +unsigned long riscv_get_elf_hwcap(void)
> +{
> +	return (elf_hwcap & ((1UL << RISCV_ISA_EXT_BASE) - 1));

If you respin for some other reason, could you drop the open coded mask
creation as part of these changes?

Cheers,
Conor.

> +}
> +
>  #ifdef CONFIG_RISCV_ALTERNATIVE
>  /*
>   * Alternative patch sites consider 48 bits when determining when to pat=
ch
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--ye2ug/mzlrhRInNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH4MVAAKCRB4tDGHoIJi
0sGMAP9be9EOLf6i4DMdXuL6QfJTFwY/2NQFtH3LnUACf9gi/gD+MXwPxiXlWVKA
seOkZ2VbAthKJU/Oe82lycblm5OAMAQ=
=TfHl
-----END PGP SIGNATURE-----

--ye2ug/mzlrhRInNk--


--===============0521927385259970627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0521927385259970627==--

