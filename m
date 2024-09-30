Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D89CE8349
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 14:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuRPd382vofJAS8sEwFdmYSWh3UU81JvCiePmjvaYdI=; b=u0vABNApNe8Jnx5OvJ2Uggcig2
	rb+endV+J2ZD4ahGH9gRJiahUKLfG/GMp0NnHrgkLi6gEl/6EXK/JcW9ShH8OWlTbKDX2Fnt3+eIl
	WtDvLwwC4+c2CaAxL9SsoHeBNSbOe0KT6vpPFXnUcpyTfGMMiK2rI6elLfGFJjkBLS/DMrUQixA2e
	YOlrZFteZ2+GdVtkZ1h2f4Qwao/x2Y0UQ8uasRTy33z2vl0NxlONK1xH7YGI0eomoKAY8YDGYAY1Q
	hrwkRGw7jR/jBjsUwk3AZffqtIIbOk6fMYTzWUrafWWrrwcS55Li7sZhoJ/AqKZR9TWP2izzkO0ZH
	ivkjna5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHAM-0000000HT3F-41Vf;
	Mon, 30 Sep 2024 14:14:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svGpU-0000000HOMX-3Pdq
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 13:52:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A3DBC5C4C14;
	Mon, 30 Sep 2024 13:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F75FC4CED0;
	Mon, 30 Sep 2024 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727704367;
	bh=wdUZmpIBZdNPj4I1JKNhPU/kdEl+3H2071J5EjhlRZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4oCRo+5A1o9iOJUsyH14zG5F7G1eSVDx443n9SPjYn/xpC77MlhtrQTLwEIDzxaH
	 MGWxMvDbyCgAjoJFM4i7FcuzzjU61g6rpMJ1sPpZ2pSe/mlIcPCvz+PyzWQu8qcmPQ
	 6yBBVyr9NZtWJxeOCg/mISrLnUt7T5LCnZG/1b067RXvpUtHP7Hn7fPF7w8Wz1UHun
	 uXJHhrazCTWd3OlV1DUHdXc3JutB4iEH32dQKkzUF3nRIUYI5IPdCqMeQxI3OCAAmI
	 A52H+a8nq1Zy4vYv4QbGP/C9ol9B3EvVh/4ATIF2iCsNV2chK4+L14/sWfeGotDhJH
	 ZcyxnXgo5BEmQ==
Date: Mon, 30 Sep 2024 14:52:42 +0100
From: Mark Brown <broonie@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Linux4Microchip@microchip.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 04/20] dt-bindings: spi: add PIC64GX SPI/QSPI
 compatibility to MPFS SPI/QSPI bindings
Message-ID: <1f54805f-f06d-4732-a124-270a36dbff4f@sirena.org.uk>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240930095449.1813195-5-pierre-henry.moussay@microchip.com>
X-Cookie: My EARS are GONE!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_065248_923660_578C57AA 
X-CRM114-Status: GOOD (  12.71  )
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
Content-Type: multipart/mixed; boundary="===============0007408006684714101=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0007408006684714101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ON/Pr4mvjRo5l4wh"
Content-Disposition: inline


--ON/Pr4mvjRo5l4wh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 10:54:33AM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX SPI/QSPI are compatible with MPFS SPI/QSPI, just use
> fallback mechanism

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

--ON/Pr4mvjRo5l4wh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb6rSoACgkQJNaLcl1U
h9D1pwf+JFH727JFNoEx84gYQwKAvz+cdKLsqrQxz+8QuE0z4nlSUrRoNCV9BKSN
TzRE6wddI3I7fl5W1cnqDvRHoevwreZDTzqMW9dVVuFhyUcIriUH42yFTk1nsGt7
A58VM0bneMcjyltwtT5ZdVanMl8dJCuNsPXEedQ3RdEwHO3s7VxyAJFVfGflPNPC
6fk35U/arMyMZHcKrzNFXYdd4SJxa2zFK+9Ns4uH4K3N/F8JmzYwT85cXNrW3Jd2
Mp7o/ztY8UAuP3oclsjlelUGzLgFIVjQ49+wm+cq0t5IOWZ4IgmZT9HWTodbMWcC
3d2VyHY/9NrlSjyMrz4HJNwJk97u1g==
=CNfL
-----END PGP SIGNATURE-----

--ON/Pr4mvjRo5l4wh--


--===============0007408006684714101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0007408006684714101==--

