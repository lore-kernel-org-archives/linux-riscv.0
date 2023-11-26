Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CCDC4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 11:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+do/bXNtDkWityLTsvyLh1GTrw07nANZzSYZnbbScuY=; b=F5fwKG5+m7iLQoML15YzToQo3/
	pu9xJx94TaPr0rgl5ISwLTlc37T/BdlyZttuHS62Uci/n4fKcYOAiVREYISP0atT3r8VI9JlAkP2G
	C/KZx9MQp08pyXDaY8gtqs+KhgKrvCPzgCdMxRK4+cIUQmOMKdXXbYHAkalKa/jVJKOsOKH+Ab2je
	aDADP1X6KopcLvvCoCZdfTxLmPWTObKc7TOXeiMpq3diqvKpz2pazaaOGDs7hSREocvsZ3roPR5Vo
	okQLy3mmAhP4brvA9m1DAza44dDQIgKl4aZO6VFue83QeL2hxqFlHBCkLGEvUIg4GEZcSEuu1SWNO
	5lxcacFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7DRD-00Aq7C-20;
	Sun, 26 Nov 2023 11:36:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7DRA-00Aq5R-10
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 11:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF705CE08CC;
	Sun, 26 Nov 2023 11:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF45C433C7;
	Sun, 26 Nov 2023 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700998589;
	bh=P2P43SYXv6u+aOpsTU/RQ6/+rVreClZ6o7li0KxB/6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjrmWqk1+DbOryXclrK/r7SZdXk3DcsNeTRgHuGdTKdF3l0JVVjN1uOZhuOVwYkcS
	 +a+GVTrx+nGWEd5hLUoG39sYZ6vb6tegM1zNPhkuiNasLtvwbo6GqbUkiEjJJ2y0tl
	 qWySar4H2sguCPv+IDwdPeNPEbqwtyhIe3Al4YF9vHTZ2bgmyYCsZ9a8hFgnuiIsDM
	 zZ9QrD3BDbxiRXKDuzD/6J6eThmgezkopACfr29woOfkXX6jKwlyc8e0Y4rsdQVyBk
	 idLuBpoDOEwkW2K5RnBYWAZvd3//Zi9WOsfThc3N0Um/XX6j3mcDqL6QRNkupsGa0F
	 7XfwrU9fm3UJw==
Date: Sun, 26 Nov 2023 11:36:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: add Milkv Mars board device tree
Message-ID: <20231126-attractor-swampland-b1b95bd1322b@spud>
References: <20231126100055.1595-1-jszhang@kernel.org>
 <ef4eda2a-4be5-4992-a315-d02e1a36b656@linaro.org>
MIME-Version: 1.0
In-Reply-To: <ef4eda2a-4be5-4992-a315-d02e1a36b656@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_033632_588227_E66FDB45 
X-CRM114-Status: GOOD (  14.80  )
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
Content-Type: multipart/mixed; boundary="===============2650393036769838621=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2650393036769838621==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gYJgPLPFWEYyFUMA"
Content-Disposition: inline


--gYJgPLPFWEYyFUMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 11:27:20AM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2023 11:00, Jisheng Zhang wrote:
> > +	cpus {
>=20
> Board should not bring new CPU nodes. Override by label instead.
>=20
>=20
> > +		timebase-frequency =3D <4000000>;
> > +	};

This particular one is widespread, but I am not sure why it is being set
on the board level in any of the individual cases. On the platforms
where I do know where the frequency for this comes from it is set by the
SoC, not the board and so should really be fixed by moving this into
$soc.dtsi. I suspect the same is true for the jh7110 and
timebase-frequency is not a board-level setting and probably needs the
same treatment. Those with more insight into how the clocks on the
jh7110 are routed can hopefully advise us here.

--gYJgPLPFWEYyFUMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWMttwAKCRB4tDGHoIJi
0pICAPoCeTCnmr5Ffb8M9OFyuV+MeSGUq3QE+0enkLN9i+3KygEAqJ0V62Uifzg9
9r6wcYvE7wwFGV7sgZr3x+gCUKUyPgc=
=a9J5
-----END PGP SIGNATURE-----

--gYJgPLPFWEYyFUMA--


--===============2650393036769838621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2650393036769838621==--

