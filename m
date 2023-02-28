Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACABC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OS4dvN0w8cM+a9CYb9lp48ZcbYsbCsF/TevXKVYkM0=; b=DMGM8OKkg3aaBxqWbRBjy6xy5E
	NKZ0NUNAwtqgf4HEh66WVswRDjCQ54286FLC+6/hQZHXQI20WpxcOJV9SUPWywKZ1irKmMWpPhcwk
	fYRv4Zatpl6a93cBF7BFzunXxngTXjOJTOVNMZ/NWRgA4EiayQxP4QewOoEaGC7g0laYXoN6rsDBA
	V4u5LsOv/IS7LCblLdKxP3vhGTt2cvY7UmFdQCmkadwMGuAy543es40PYeZpdLKpMyo7II+Bb9akI
	tgdlDhKjrIUN+XUWI2+tHAaN4PGCIaiBkp1KeqAFoSyQUcTdv9YkumcC37A9Jihu1aEvSu3GFBt1i
	xHloZ4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5P6-00E3ld-Jt; Tue, 28 Feb 2023 19:12:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX5P2-00E3l3-GN
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:12:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2EE3E611AB;
	Tue, 28 Feb 2023 19:12:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5845AC433D2;
	Tue, 28 Feb 2023 19:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677611562;
	bh=0LTo6HMt23WmtM0Vax6pGNl+Luyt5bdx2F5+Rjo3PAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nn6uPbiOqQfO2jIkeGqcQwVHtCJhwe9oIi9QBWa+SqIboRLR18HTKSUgV3yxkwgP4
	 cnPxtupG1NIxPpTJYQ/5GEEzgiAHXD5b04zu2/lW8NIz2qoW9/au3rwj310jZ/UsuV
	 waGs/EtFECv6/dCwt8iSodRUE/5tX24HPkDX5XMmFbNeR41zRaGFkny8vgRUWGcgn7
	 S5+A6nI9moR2wzgnxNklk0Y23gGhLDC1NNMuKMLaJG8ptKoMO8rlgjL+zLNr5D1Yxn
	 XfF+uglINDeioxZYcyclTaxYpsk55s2b2vTnfAsI2+mowRbypXv9ErsaldJxaaGPQ3
	 0St5qTQ4aFggw==
Date: Tue, 28 Feb 2023 19:12:37 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Christoph Muellner <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH] riscv, lib: Fix Zbb strncmp
Message-ID: <Y/5SJc1AlfnY/l3l@spud>
References: <20230228184211.1585641-1-bjorn@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230228184211.1585641-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_111244_624460_6077A56A 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: multipart/mixed; boundary="===============5461250973686741677=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5461250973686741677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="52A1aVqK5CYFRcnE"
Content-Disposition: inline


--52A1aVqK5CYFRcnE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 07:42:10PM +0100, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>=20
> The Zbb optimized strncmp has two parts; a fast path that does XLEN/8B
> per iteration, and a slow that does one byte per iteration.
>=20
> The idea is to compare aligned XLEN chunks for most of strings, and do
> the remainder tail in the slow path.
>=20
> The Zbb strncmp has two issues in the fast path:
>=20
> Incorrect remainder handling (wrong compare): Assume that the string
> length is 9. On 64b systems, the fast path should do one iteration,
> and one iteration in the slow path. Instead, both were done in the
> fast path, which lead to incorrect results. An example:
>=20
>   strncmp("/dev/vda", "/dev/", 5);
>=20
> Correct by changing "bgt" to "bge".
>=20
> Missing NULL checks in the second string: This could lead to incorrect
> results for:
>=20
>   strncmp("/dev/vda", "/dev/vda\0", 8);
>=20
> Correct by adding an additional check.
>=20
> Fixes: b6fcdb191e36 ("RISC-V: add zbb support to string functions")
> Suggested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

With your new selftest stuff & on a JH7110:
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Also, given the reporter, this should be:
Reported-by: Guenter Roeck <linux@roeck-us.net>
no?

Thanks,
Conor.

--52A1aVqK5CYFRcnE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/5SJQAKCRB4tDGHoIJi
0l3xAQCZKLmfj5cYFT/ka7xZYFVx6r07h9XeDxjPPQesBLq9LwEAn27MHVYozuzY
cieVNJC6+yCbK03HwNAkwwcTZSJKLwA=
=IfOP
-----END PGP SIGNATURE-----

--52A1aVqK5CYFRcnE--


--===============5461250973686741677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5461250973686741677==--

