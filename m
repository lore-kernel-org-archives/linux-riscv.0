Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6543C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 15:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jo1uN3QdLAFjsWDITOiqvvTzUk62ngKv2L4jSRrP8ks=; b=gDZBZwqls0kwaahgH3HqjeETtd
	ZQTLi2xBJP0CbbbeIoQMaldr+n2qVxFA+48GVa1fspkVmV3Cbt3G+Uh3y+V/xQSvzdXExbiV2dRZs
	uPExLr9EQM6vbufDp2xqjfvxoCVbE8DI53V6AEeZmonpGZZc5jrjY8bX8q3qlY2/50Okf6Ujw9kxn
	WntSoa+Qe1lbq0SrWiNig4qRVNOASbVS7PpFPCMxBdJiosamjEQndA41G9k9OmMNTzwGuWFdkn3GL
	2Af8oP3Laa2ViD85bpq8upRJ7bHvSPQU4UDeFjI9okBoOxQEMgwbkveydjKB6ODupJUst6GHQF3Jf
	jizI76sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHbF-0000000DOii-3DQt;
	Wed, 14 Feb 2024 15:55:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHbD-0000000DOhO-1P9A
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 15:55:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F7B261A6D;
	Wed, 14 Feb 2024 15:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00213C43399;
	Wed, 14 Feb 2024 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707926102;
	bh=I5QmVlSxsPE/Gk4+HnD06ucKGeusZCkAT0pMy1rJFdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvqkGmDfiWK0/udDnfCBRaDRe2kArttC6QTkDsM1BxGHPZTBnbzWYTP4veP3ZargP
	 aa80u28eGTmb3HYZ6oGtKR65HcpjxycM1VMzPS4fYFTC0EbeI+rblhYH5Pxe8kkoTk
	 piWqBbRlZ3WUN8Ur08uVW+pleZvBCYBuFxtDvJH0kTxKRxdrLHSaweAq9p/Ya8HFOM
	 sD0nomU3aUbzp3g/hO/j9ABxNQ+PevDhv8jT7tFPC+GjPBI0HImRZV6jPzw3axLIAC
	 CzUwM/eHkXlHKHd9XW1i4L3SQ30mWBeGeaEFgIOQeI9Ks+AjSmvK9B5bf7NlwGMfJr
	 fmbaBGfW564vw==
Date: Wed, 14 Feb 2024 15:54:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
	jirislaby@kernel.org, Atish Patra <atishp@rivosinc.com>,
	ajones@ventanamicro.com, apatel@ventanamicro.com,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH] tty: hvc: Don't enable the RISC-V SBI console by default
Message-ID: <20240214-impound-gumdrop-230d0725f5ce@spud>
References: <20240214153429.16484-2-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240214153429.16484-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_075503_552927_BBE82C75 
X-CRM114-Status: GOOD (  25.88  )
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
Content-Type: multipart/mixed; boundary="===============6616106846757788498=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6616106846757788498==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZpSavjsIcxHJ5llO"
Content-Disposition: inline


--ZpSavjsIcxHJ5llO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 07:34:30AM -0800, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> The new SBI console has the same problem as the old one: there's only
> one shared backing hardware and no synchronization, so the two drivers
> end up stepping on each other.  This was the same issue the old SBI-0.1
> console drivers had, but that was disabled by default when SBI-0.1 was.
>=20
> So just mark the new driver as nonportable.
>=20
> Reported-by: Emil Renner Berthing <kernel@esmil.dk>
> Fixes: 88ead68e764c ("tty: Add SBI debug console support to HVC SBI drive=
r")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

As was brought up when we covered this earlier today, if you're going to
probe a driver based on an ecall, the same hardware should not remain
enabled in the DT passed to the kernel.
If you want to enable this driver in a multiplatform kernel alongside
"real" drivers, then the solution is simple, firmware needs implementation
needs to patch the DT and, at least, mark the uart as reserved if it is
using it to provide the debug console. Marking this nonportable so that
people only walk into this with their eyes open seems like a reasonable
action to me.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  drivers/tty/hvc/Kconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
> index 6e05c5c7bca1..c2a4e88b328f 100644
> --- a/drivers/tty/hvc/Kconfig
> +++ b/drivers/tty/hvc/Kconfig
> @@ -108,13 +108,15 @@ config HVC_DCC_SERIALIZE_SMP
> =20
>  config HVC_RISCV_SBI
>  	bool "RISC-V SBI console support"
> -	depends on RISCV_SBI
> +	depends on RISCV_SBI && NONPORTABLE
>  	select HVC_DRIVER
>  	help
>  	  This enables support for console output via RISC-V SBI calls, which
> -	  is normally used only during boot to output printk.
> +	  is normally used only during boot to output printk.  This driver
> +	  conflicts with real console drivers and should not be enabled on
> +	  systems that directly access the console.
> =20
> -	  If you don't know what do to here, say Y.
> +	  If you don't know what do to here, say N.
> =20
>  config HVCS
>  	tristate "IBM Hypervisor Virtual Console Server support"
> --=20
> 2.43.0
>=20
>=20

--ZpSavjsIcxHJ5llO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcziUQAKCRB4tDGHoIJi
0ha2AP4h37dfZJEi2Ma4Nfwx6PGVD0xADFSNtFYCxflzdgLW7AD+OawAfKCLrXnJ
5fR1lKUHo+712HP3zmc1aJ6D2m0LTg8=
=3+DZ
-----END PGP SIGNATURE-----

--ZpSavjsIcxHJ5llO--


--===============6616106846757788498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6616106846757788498==--

