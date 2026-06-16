Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D03CD98E3
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/u7zIO+wO/hN2h9BGQjibPGTc0tKGzfzi8Zrof25d10=; b=cmI0crhUtmWc88c6yFtawsSmYJ
	3XpcLEdIxlADOK+hDmSxuPupyUoG8fxfxG5HmEeuzHuXBiq5+bb3sstkm78lBl5wZcPD+GesTmkxG
	28xJ8/3T+b046REXcTu9oN3ZVSToTWZP+ZWV28qU/Brzvvo6jwpOLcFqGyGWvLYWy+FkUBy8oMgWo
	OskZm/LqG5ymNZ7eZRBQDQL3na6hdTp5CQeRhPJIIyoa/ZfUqDz9EId/IGFvu2j3HLHbBvH/hXQyU
	35q2n3haPXVuF2QpLHPA5FrftgY+OU9NFjsuZZxwjf+4z3qmsk1YfBUDkoGegG+CQDSm/XH8s2RYz
	rcuYpHoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVjE-0000000G170-0FLq;
	Tue, 16 Jun 2026 15:29:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVjC-0000000G16t-3KX6
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 15:29:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4001043B1A;
	Tue, 16 Jun 2026 15:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D148A1F00A3A;
	Tue, 16 Jun 2026 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781623766;
	bh=eFxrHPeVMv35WCYKKiWqiAydCveSL3x1ksY5DFkpIek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YI+KDXyX74hxLCPBRICJUnLXcVK6U7+/IXX03LoZZ/0QI9PQNrxUDDXOWMAIIrwNb
	 zWNIvC5/bfBgRsaENem9N9gyjYTZvH+lrD0nPrYLtWwJPS8o+9Lj72/hPW1SkXZOJi
	 o2k4q5pijVvGlojOoye+sOdzfux505vkKBmQuVnuWHxag6PyjYaVHqnfTG6CTUaEhR
	 /7lKURDV4csDVS9KgEaOvnfXTOs9j1aD8dsZvbGYZvN42HiJ8fJVBIEymjKRY6w2V0
	 SQqmN3LDXsBwfqpAtvh6JSrlVy+TCh957inBPh81A4si2ocaX7+u0ffaTNYYAvPtBD
	 hR13/cZ7/h3Ww==
Date: Tue, 16 Jun 2026 16:29:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: remove debugfs on driver register
 failure
Message-ID: <20260616-fossil-labored-ea8b8b08c856@spud>
References: <20260616151314.87102-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20260616151314.87102-1-pengpeng@iscas.ac.cn>
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
Content-Type: multipart/mixed; boundary="===============1079108856578360158=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1079108856578360158==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJ26ZYpqGmXav2NH"
Content-Disposition: inline


--DJ26ZYpqGmXav2NH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:13:14PM +0800, Pengpeng Hou wrote:
> sifive_ccache_init() creates the debugfs injection file before
> registering the platform driver. If platform_driver_register() fails, the
> error path unmaps ccache_base while the debugfs file remains and its
> write callback still uses that global mapping.
>=20
> Remove the debugfs tree before unmapping the cache controller registers
> on the registration failure path.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/cache/sifive_ccache.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index a86800b123b9..cf7877d8e3e5 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -100,6 +100,12 @@ static void setup_sifive_debug(void)
>  	debugfs_create_file("sifive_debug_inject_error", 0200,
>  			    sifive_test, NULL, &ccache_fops);
>  }
> +
> +static void remove_sifive_debug(void)
> +{
> +	debugfs_remove_recursive(sifive_test);
> +	sifive_test =3D NULL;

Firstly, do we really need a function for this?
Secondly, is there any reason to actually explicitly NULL this after
we're done removing? The driver has failed to probe so it's not as if
something is going to refer to this dentry pointer anyway?

Am I missing something?


Cheers,
Conor.

> +}
>  #endif
> =20
>  static void ccache_config_read(void)
> @@ -336,12 +342,16 @@ static int __init sifive_ccache_init(void)
> =20
>  	rc =3D platform_driver_register(&sifive_ccache_driver);
>  	if (rc)
> -		goto err_unmap;
> +		goto err_remove_debug;
> =20
>  	of_node_put(np);
> =20
>  	return 0;
> =20
> +err_remove_debug:
> +#ifdef CONFIG_DEBUG_FS
> +	remove_sifive_debug();
> +#endif
>  err_unmap:
>  	iounmap(ccache_base);
>  err_node_put:
> --=20
> 2.43.0
>=20

--DJ26ZYpqGmXav2NH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFrzwAKCRB4tDGHoIJi
0mSqAPoCMsVmRRUk4H9aIzfxB3cXd/R8bMloIGhVGiSAk5wUjQD8DLBvxG4dZL6J
1bHtOxa2mtWPVGV0kTQJtwYe1D8DdgU=
=T7EI
-----END PGP SIGNATURE-----

--DJ26ZYpqGmXav2NH--


--===============1079108856578360158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1079108856578360158==--

