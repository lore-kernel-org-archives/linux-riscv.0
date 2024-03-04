Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C40FC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzyk6YFHpiqZ0WzYHUQePPCvOyzlycfEfOJQslSWoYg=; b=2qQz0HGhgx/+RlzwGJoMSS+U/N
	IUwwlb0qAs6tNosf6YReTSGelsxeRLXY8XOpEBFl5K3RosboMkXo5FCMtsMvbjSU36t6rOVNpnFbc
	YnPK4Jn+y8inDWAmjV1EdosWGGiUwF2TAxP6fWX6S/ODDb1gle5U9/PH0exQofxZb6wjjLKl50Nuo
	SwpNsc9G5O1SO4pr5X3WFnnEU6+8C/HvQxYYpo6ZTYab+UyoCLSpMbmNosxxkNn9XUYrXJE52gQ3G
	3Y/TXEoa/wqqV6wknl2URu3e668V9xh+xI0+IXz1KOpZSplQY+jAimUd70ICTr2CiUxKjVo7D/8Pu
	OD5d93ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDR9-0000000AGCO-39Vd;
	Mon, 04 Mar 2024 18:53:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDR7-0000000AGAc-02aH
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 18:53:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7ACE9CE12BA;
	Mon,  4 Mar 2024 18:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F1FC433F1;
	Mon,  4 Mar 2024 18:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709578393;
	bh=V37rd8PiGAomhKd4+inZBZxarQhrmyPY3/x1sHNH0Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chh0mb+LqnBnkw4LaW7GXGcf4MUfQbxrI1GPiO3rGliHt+iEnuPpVrGL74YA+11eB
	 YKqeYxSxlpofVGMQM0Ja6YGuaQetDJzVb60hbUJEDi1PlVG4cEb4nVdlDtqRQ9JXbq
	 xBD4P6A8pk6pRh83Ib26Riarw33D4f+xUWUobiJzyUK37lSJ4MH4DTgL1ty+ROff6f
	 yEAplu4CapIknsh9V56kknwXU5O2uknTdnA6forEuztZiC95OLeI4Uc2V1tdzE6bh5
	 qZm+mAKS/4704cicL872uYrMIEY/X9AfbnztAqIguotzkk9tiEBGdZBMHcp4/LRSmc
	 /PYattFbOnngQ==
Date: Mon, 4 Mar 2024 18:53:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [RFC] Inconsistent sifive,fu540-c000-uart binding.
Message-ID: <20240304-whomever-gladly-d43da7ad2fe6@spud>
References: <20240304105947.SJcVAdr1@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240304105947.SJcVAdr1@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_105317_249495_6539670F 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: multipart/mixed; boundary="===============8647755370309105582=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8647755370309105582==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9HC0fzGtO/m/qkzE"
Content-Disposition: inline


--9HC0fzGtO/m/qkzE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 11:59:47AM +0100, Sebastian Andrzej Siewior wrote:
> | $ git grep fu540-c000-uart
> | Documentation/devicetree/bindings/serial/sifive-serial.yaml:          -=
 sifive,fu540-c000-uart
> | Documentation/devicetree/bindings/serial/sifive-serial.yaml:        com=
patible =3D "sifive,fu540-c000-uart", "sifive,uart0";
> | Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.tx=
t:"sifive,fu540-c000-uart".  This way, if SoC-specific
> | Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.tx=
t:    compatible =3D "sifive,fu540-c000-uart", "sifive,uart0";
> | arch/riscv/boot/dts/sifive/fu540-c000.dtsi:                     compati=
ble =3D "sifive,fu540-c000-uart", "sifive,uart0";
> | arch/riscv/boot/dts/sifive/fu540-c000.dtsi:                     compati=
ble =3D "sifive,fu540-c000-uart", "sifive,uart0";
> | drivers/tty/serial/sifive.c:OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c=
000-uart0",
> | drivers/tty/serial/sifive.c:    { .compatible =3D "sifive,fu540-c000-ua=
rt0" },
>=20
> note that the driver has a trailing 0 in the binding while the yaml
> description and the DT part does not.
> The 'sifive,uart' has a trailing 0 where the 0 denotes the version UART
> IP.
>=20
> Was this also intended for the fu540-c000-uart binding? Should the 0 be
> added everywhere or removed from the driver?

I suspect that the driver is what's incorrect, given there's little
value in putting the IP version in the SoC-specific compatible as it's
a fixed implementation. I'd change the driver to match the bindings.

Cheers,
Conor.

--9HC0fzGtO/m/qkzE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYYkgAKCRB4tDGHoIJi
0hLtAQCeh/vjouGnruLo6WjBW4ItX+rl8PSOfBxPoyZ6qLT1pAD/VFIkqqRSQoJT
5af4p39+MyG3lRoOA+H3k7VIM/w0xAE=
=qY/D
-----END PGP SIGNATURE-----

--9HC0fzGtO/m/qkzE--


--===============8647755370309105582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8647755370309105582==--

