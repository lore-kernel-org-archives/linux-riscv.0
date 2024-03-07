Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8023C54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 17:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5yuvBDuaAJuJt92V6aJEmuGRrGpokn2JX0DmI8IV8w=; b=ToSHfQmIGydBMFuMnzRjsADcZq
	sBXp1VjTN6cSTDOUzTDo2Bf9eY4ngCu+a0d9EEOHaoIIuKwXgpBFkn4dJNPa4DMnytI3iA6xT+AfA
	bJBumzpQsQzdjE/ucWfWAAQVfRDdWws/9W61nmMvrMD+7RtJQAKS64VJVouFgM7v1asS+0ou47jNw
	1uuSE2P7ybTu2t3J5fHAaFlP727AJpZLAdAKJbarjZ62g92yKB71JcKlb3kVLgO5SRdL9zHMZwdhN
	4oDlAIIUayNgXYvcMS/9ken7DsZkFpzLj8yEbECFEtX1qb6nJ5B+nHfh2f5xoxp5SUQXNXSuT7I7j
	7sMAkEYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHiP-00000005jVd-0MER;
	Thu, 07 Mar 2024 17:39:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHiI-00000005jSQ-2VfX
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 17:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B389617E9;
	Thu,  7 Mar 2024 17:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B6EAC433F1;
	Thu,  7 Mar 2024 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709833165;
	bh=EXKFh35gS8V+J1+Go5gS5JEIT1Jvmz68gYCN4Q0+iyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMbGK8jO2syJIVKZdvt51rA8YJUDtOe33AIMbaPpDXAudDqJwaagVHYLByHG7sizj
	 Vo+/KQtbXGgIX3//5+YPoBil7yop8mSFYxI5nIu4xTdeWh0f5Mx8MdoPkjMQY4d3Pv
	 K3S9x+cfOrGFGkMt/qXE3BKWWbtqoHCaVQDAaKV/wuqCGUy/JFvC2PsHPFvonHOnM1
	 kag2BMei2Vg5ZyaHqgcdiy1lg/YPcyYtleUVFUt1gDOa7Mj4hcZ41MlywrIq5pBYNy
	 o6/zMV5pmYdRTS+WE96ElArACQwtNBzPsQyNnMAAzT6N4nuNgs7JE0PgZimw+OsyH+
	 MhPVrld/vAylg==
Date: Thu, 7 Mar 2024 17:39:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-serial@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] serial: sifive: Remove 0 from fu540-c000-uart0 binding.
Message-ID: <20240307-sacrifice-dares-09c91fc8fefe@spud>
References: <20240304105947.SJcVAdr1@linutronix.de>
 <20240304-whomever-gladly-d43da7ad2fe6@spud>
 <229b34c1-5419-93ae-0a6f-a21cf4e4a276@sifive.com>
 <20240307090950.eLELkuyK@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240307090950.eLELkuyK@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_093926_784204_FFACEEB7 
X-CRM114-Status: GOOD (  27.03  )
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
Content-Type: multipart/mixed; boundary="===============5440027225759003058=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5440027225759003058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CLdB+aCot+C/VZ9x"
Content-Disposition: inline


--CLdB+aCot+C/VZ9x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2024 at 10:09:50AM +0100, Sebastian Andrzej Siewior wrote:
> The driver is using "sifive,fu540-c000-uart0" as a binding. The device
> tree and documentation states "sifive,fu540-c000-uart" instead. This
> means the binding is not matched and not used.
>=20
> This did not cause any problems because the alternative binding, used in
> the device tree, "sifive,uart0" is not handling the hardware any
> different.
>=20
> Align the binding in the driver with the documentation.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> On 2024-03-06 18:48:13 [-0800], Paul Walmsley wrote:
> > On Mon, 4 Mar 2024, Conor Dooley wrote:
> > > I suspect that the driver is what's incorrect, given there's little
> > > value in putting the IP version in the SoC-specific compatible as it's
> > > a fixed implementation. I'd change the driver to match the bindings.
> >=20
> > Agreed
>=20

> I didn't add any stable/ fixes tags as I guess there is no point in
> backporting this.

Every documented device falls back to "sifive,uart0", as you mention
above, so I think that's reasonable.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> > - Paul
>=20
>  drivers/tty/serial/sifive.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 0670fd9f84967..cbfce65c9d221 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -761,7 +761,7 @@ static int __init early_sifive_serial_setup(struct ea=
rlycon_device *dev,
>  }
> =20
>  OF_EARLYCON_DECLARE(sifive, "sifive,uart0", early_sifive_serial_setup);
> -OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart0",
> +OF_EARLYCON_DECLARE(sifive, "sifive,fu540-c000-uart",
>  		    early_sifive_serial_setup);
>  #endif /* CONFIG_SERIAL_EARLYCON */
> =20
> @@ -1032,7 +1032,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops,=
 sifive_serial_suspend,
>  				sifive_serial_resume);
> =20
>  static const struct of_device_id sifive_serial_of_match[] =3D {
> -	{ .compatible =3D "sifive,fu540-c000-uart0" },
> +	{ .compatible =3D "sifive,fu540-c000-uart" },
>  	{ .compatible =3D "sifive,uart0" },
>  	{},
>  };
> --=20
> 2.43.0
>=20
> Sebastian

--CLdB+aCot+C/VZ9x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZen7xQAKCRB4tDGHoIJi
0gR5AQCPmIRTe5TDrV3kat2e6/iKMKoN57R+OYfmtDHYDxi6+gEAl/ulgY53fzfU
qhAWnE7r6rcbR1Ko1p1bFENf2peI7AE=
=5vC3
-----END PGP SIGNATURE-----

--CLdB+aCot+C/VZ9x--


--===============5440027225759003058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5440027225759003058==--

