Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF742CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqV1qY+Fz4xzP43eqD8aKU/3W9FQRhyzZ910U4O6qyc=; b=YsYHtWpTd8lqbu0Q5xHbpHsUFD
	s8T2CQQjGRBlN/VyUFe0JoEjipO6SwJfeU1WxXtsCA1vPvXuF1FLqTDSD8yxjvfnUIaeJ5qpenKkU
	m62buauYT6XtDf4Qv5ua4moxejJrMb67ZwGHogQYPlIWvioUSitjXACxuWUQD/Fw3uGwm4XjwC3Ej
	5i4nF7G70w1F9LT/rM5MI0thAPTOz83V9rCe+Np7hnEBG5QPqcVJAHZG2TjXEETb6gSJAQOwUjD7B
	DgdlaBn+6t67xUR2bYnZsslXIlOn5oJ9I3aRa+0QWaRe1SHZ/sY34TYJ32ay5mr58H76NhzP/yAA2
	MD0F/j8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwP30-0000000Fu6z-0gMh;
	Wed, 10 Sep 2025 17:55:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwP2z-0000000Fu62-0Rg1
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 17:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8387260144;
	Wed, 10 Sep 2025 17:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8772C4CEEB;
	Wed, 10 Sep 2025 17:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757526956;
	bh=JVRXb5XrUwUv0N4CpWuSYojhTxosrZTNOjVAr0HhqxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCJWeY4zVR3ckpzLM9+4lFrn0f6wbjhI1YwZLJUpF77KUb7fQ8d6V47nHN/A+qwsK
	 CUt2qDd9i8Kq2mgSs3wlmMSTjWCZjfUHRMqTO1/acJ/LWS7IwEIMlaECtuNZUDOp/o
	 6yFDoJLhM7AS6W1AVK32Y0RO1SNCvntp+TY/wHgeTmod75UTl66jezZdZ1Jt7lWIbw
	 DRnUWRSOX2ogJHIJv7J7qG82hii/YDaqSH8Uf2b/09FzM42Q8V3Ic/NsiZueZ7akUZ
	 1wkIofTXZVSJkqlOn3N9XRjp6s2mDWdn6JEpbwb7AGyGoVAleOCUEO6v1s6lBBtk9E
	 nZcVDkUUD+NtQ==
Date: Wed, 10 Sep 2025 18:55:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, robh@kernel.org,
	krzk+dt@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/6] Icicle Kit with prod device and Discovery Kit
 support
Message-ID: <20250910-visa-fanfare-ec0bfa5c588c@spud>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
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
Content-Type: multipart/mixed; boundary="===============3657265313680655651=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3657265313680655651==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmJi2N4SPCruLI6A"
Content-Disposition: inline


--wmJi2N4SPCruLI6A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 08, 2025 at 12:57:26PM +0100, Valentina Fernandez wrote:
> Hi all,
>=20
> With the introduction of the Icicle Kit with the production device
> (MPFS250T) to the market, it's necessary to distinguish it from the
> engineering sample (-es) variant. This is because engineering samples
> cannot write to flash from the MSS, as noted in the PolarFire SoC
> FPGA ES errata.
>=20
> This series adds a common board DTSI for the Icicle Kit, containing
> hardware shared by both the engineering sample and production
> versions, as well as a DTS for each Icicle Kit variant.
>=20
> The last two patches add support for the PolarFire SoC Discovery Kit
> board.
>=20
> Changes since v2:
>  - rename ccc clock to clock-cccref to match fixed clock binding
>=20
> Changes since v1:
>  - fix order of properties in mailbox nodes
>  - drop redundant status property from ddrc_cache nodes
>  - fix lowercase hex in reserved memory regions

I've replaced v1 with this version in my tree.

--wmJi2N4SPCruLI6A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMG7pwAKCRB4tDGHoIJi
0n+KAP0df8X1MKkS1jU9l8y6r6wOiHtADWf19177Ot3ZLlxOhAD/Xq9lijPzz1iX
/KZKqkiYmVREk41nVDYhFiocw79apws=
=GbN8
-----END PGP SIGNATURE-----

--wmJi2N4SPCruLI6A--


--===============3657265313680655651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3657265313680655651==--

