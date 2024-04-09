Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351A4C67861
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj8urv0E7zX2L0Ec7Qlu1x+6s6cnISqBUnShwDgZ5MQ=; b=lPS2bWejrO4pZ494kmEhYVuC1/
	8UUx2IXP5bThOM6biHvOQNrxzdvGcNByuvKCt06tlGoC/p+/npA183nbwwBw0ZYDScn8j4BZ4jKHQ
	+2beq5W9CnDRJDgdubH/YtAbH3Dc/rKXQz9zI0hbTLD/rFvcS6Gio68SchNUT3r9ZKo+ZdtMilLtR
	hyVVVFMmdCEOep5Vj+00jr54gSh8FQBJw80BkmMmsBGQ8reTlI63PodQgYBcr5JWud4Dfp6yHwzqr
	DlOg6t2kCKrvDGnNKi076b72oes6pNV26jAGTfHaNOrYpmPe+9PDW7r+CLMPnPjle9QuLB2fFE5Ee
	vBe6gvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCQc-00000002POa-1DgC;
	Tue, 09 Apr 2024 14:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCQZ-00000002PNn-4BUx
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 14:26:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A715617CA;
	Tue,  9 Apr 2024 14:26:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF85CC433C7;
	Tue,  9 Apr 2024 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712672782;
	bh=XZ5Ck0nfJ0Ggyp+wq5ALEjcfOIvvT0xFKQ9Frag88PU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COty79kttqgrA20uwUrzujjlvsp0hHCI+nVtuEfZx6ive5tCPArV2/azRIyCnFvMe
	 x8urPkeTfLUSG0Ny6tLG7k2SgNyG5E1XalwbsBeMVzsKuSFGMEh+z8C98Jcf6A4g5n
	 bCD2ibPQRS6q3CO1Hfff+utuxz8Gy7W0VSjaE4qjvgo4KwuhWktqhEJSq7kpeLExYD
	 bemBoOkDAVEqZiOFNdAiGZYj1M4BbNwo66oZYWLCAxcJYYqOK3n3yVfnFsvccV7y71
	 fw91KEPlVF48um4JQO6cVyFNHorbeQkHmhqEv91HB9beKjS/vFiNpnso/Vw1brU390
	 YD4dB1WTFti7Q==
Date: Tue, 9 Apr 2024 15:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clocksource/drivers/timer-clint: Add option to
 use CSR instead of mtime
Message-ID: <20240409-krypton-employed-b2e0e1b46ddf@spud>
References: <20240406112159.1634-1-jszhang@kernel.org>
 <20240406112159.1634-3-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240406112159.1634-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_072624_185583_72B2836A 
X-CRM114-Status: GOOD (  26.13  )
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
Content-Type: multipart/mixed; boundary="===============2235227113453713945=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2235227113453713945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bvCDlpY1czo324gx"
Content-Disposition: inline


--bvCDlpY1czo324gx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 06, 2024 at 07:21:58PM +0800, Jisheng Zhang wrote:
> As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer: add a
> quirk for lacking mtime register") of opensbi:
>=20
> "T-Head developers surely have a different understanding of time CSR and
> CLINT's mtime register with SiFive ones, that they did not implement
> the mtime register at all -- as shown in openC906 source code, their
> time CSR value is just exposed at the top of their processor IP block
> and expects an external continous counter, which makes it not
> overrideable, and thus mtime register is not implemented, even not for
> reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
> extended CSR, these systems still rely on the mtimecmp registers to
> generate timer interrupts. This makes it necessary to implement T-Head
> C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
> reading mtime register and falls back to default code that reads time
> CSR."
>=20
> To use the clint in RISCV-M NOMMU env on Milkv Duo little core, we
> need to fall back to read time CSR instead of mtime register. Add the
> option for this purpose.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> index 34faa0320ece..7bbdbf2f96a8 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -650,6 +650,15 @@ config CLINT_TIMER
>  	  This option enables the CLINT timer for RISC-V systems.  The CLINT
>  	  driver is usually used for NoMMU RISC-V systems.
> =20
> +config CLINT_USE_CSR_INSTEADOF_MTIME
> +	bool "Use TIME CSR instead of the mtime register"
> +	depends on CLINT_TIMER
> +	help
> +	  Use TIME CSR instead of mtime register. Enable this option if
> +	  prefer TIME CSR over MTIME register, or if the implementation
> +	  doesn't implement the mtime register in CLINT, so fall back on
> +	  TIME CSR.

This, as a Kconfig option, seems a bit strange to me. We know at runtime
if we are on a T-Head device without the mtime register and should be
able decide to use the CSR implementation dynamically in that case,
right?

--bvCDlpY1czo324gx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhVQCgAKCRB4tDGHoIJi
0tR/AP4mG82+NEm1+kAhs2ooDe7PKBIO8/n++HPlnHP8ABuVawD/cc2uB85eshUK
N39p401AWTvQGUxodbiC8LbazhONdgg=
=hDmj
-----END PGP SIGNATURE-----

--bvCDlpY1czo324gx--


--===============2235227113453713945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2235227113453713945==--

