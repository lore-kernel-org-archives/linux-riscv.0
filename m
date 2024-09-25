Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA90CCF9E6
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 16:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+JYlUCGTafN56UHb7ly/vMYyvOx0VrpXaGnjoRmYEM=; b=Ple9T7BUCDpfKeIrz0phOmLH0c
	pKjRs69Pn+3Ox+pDA6I1s4Kj/cPR0EopLaQd0ZGqNP07wylKRB6S8lOLqHZ3SQ1Q2mgYI7j/k0Aa8
	bRCW4lHWseetrm3gT9YEQ2gJLar0jgdSyE0lOuZd8yZyFEYrigxdSLSuaWhya3tY4fqC1A7nrj8Ww
	yjdsyF+7bQyF72Bx+r7OTGyeAUzaNnQ4HTriHitcYLZ9jzB9jTENCS2H3WLiyqFARV2SzaV7Vv+Y6
	AoO8KnH/Vh5RYHMX2jQta5PXKXPE5/Yce4w6fIcQMnq8uc1hjdCxKSYk7h/+tp5+KvshAs8dDZWKW
	zM21lOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stURV-00000005yjr-2NKJ;
	Wed, 25 Sep 2024 16:00:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTJ2-00000005hmH-1t65
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Sep 2024 14:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PfQH9V3yVWo/El9fAn7UpxgYuAy071avSQykvmTiCNM=; b=d+xJvZJR8kHlrMQPcQJim1k9p5
	NS7NU86G6urGGIV3Pi3IsxH0tBifzJ64P6MAuCFwjyldqlBJb4+lrmQ+eh3me00q2eb4AuSdh6jOl
	upNILcpIrtF+9uAp8nmn28BfJyCqsAzg6cbOXSCdd26U4HvHnenV8g1gwMsEJVoCSBYqhkYHuntMg
	vUhTnPKoEZQyRr3UJmeK7Kda569uVVPmM2uyWEFJ9FuQgYHyhQn+94EUn98R6kYSh738wFeau3T9Q
	MXj0L5TTyR358fZHt88QNALW6VCJLY7IID78qrsx8gq7Swm3SM8waviDA7wcPFzrif9+dF8hfByay
	9SBZpenw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stTIz-000000023f8-06Zo
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 14:47:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BE4A6A443A1;
	Wed, 25 Sep 2024 14:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DBD0C4CEC3;
	Wed, 25 Sep 2024 14:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727275665;
	bh=wx8YONyUFoGvQ+t2pLQ0u5COnOIGNKXY8cwi+lc2Zpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtuuYyWe9+JJVya0RkxlfL4RuzBsZJP3OJCBfm+2SHkU3FCcLuNGiklfW35bglE1J
	 8cl6ghnUjRTXjyZ0y8VUvJwoeyYbYrYq+EYeePRoQQBV2U2pPeM2dsyCVy0fV1Q+Pf
	 xj1Y9wyKs48+hczjLdOfEYQkVYz52z4j1zEvlex+kOHP6f452YT2tCR+n1ovH/bqPZ
	 +oHYf+YBaHXlbt6iA+C5GRN+1RrTonQ+kKFDBfI0DTTfjRXelJUyPmHEwOo6RRBajU
	 WPKmtKD7sZxa66LQ76LMbbPNNLfzE6ozEHrotWmMagLj5aJJlI6Xv977BsheIpZbi4
	 +l3rlznWXQuIQ==
Date: Wed, 25 Sep 2024 15:47:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
Message-ID: <20240925-ammonia-expenses-e13bb113538c@spud>
References: <20240925142532.31808-1-namcao@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240925142532.31808-1-namcao@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_154749_330173_C7008330 
X-CRM114-Status: GOOD (  18.08  )
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
Content-Type: multipart/mixed; boundary="===============5276081278692469785=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5276081278692469785==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SsDGt9N5z5dUUoB0"
Content-Disposition: inline


--SsDGt9N5z5dUUoB0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 04:25:32PM +0200, Nam Cao wrote:
> The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').

Heh, it is indeed.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Also, the riscv privileged specification names the register "mimpid", not
> "mimplid".
>=20
> Correct these typos.
>=20
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> ask me how I found out..

Gowan, hit us with it...


>=20
>  Documentation/arch/riscv/hwprobe.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 85b709257918..fb0affa61eb9 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -51,7 +51,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid`=
`, as
>    defined by the RISC-V privileged architecture specification.
> =20
> -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid`=
`, as
> +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``,=
 as
>    defined by the RISC-V privileged architecture specification.
> =20
>  * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the b=
ase
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--SsDGt9N5z5dUUoB0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvQijQAKCRB4tDGHoIJi
0vCHAQC/XuZFxbv10n6zq5HRutrUOVvtWK7lHh7PZezj2Bj7aQD6AgswVFQjsVnR
ztulw03/EAqAWsUyR6omJckf2DYNbQA=
=cFBD
-----END PGP SIGNATURE-----

--SsDGt9N5z5dUUoB0--


--===============5276081278692469785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5276081278692469785==--

