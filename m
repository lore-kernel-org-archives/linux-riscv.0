Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC81C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JJrF+rEeR59fyYFnyrOLznRaQzIIE8Vb4oX3VIhkEn8=; b=Myp8sD8eZFIbDs8H9dAq/ifvoL
	1nj7mz+In8WkVC6QvnOdzszZga9HOvRqEJ3s85pHjV7jfW45FzOzSrdN0G8AV1gLSNnaObHyKffwK
	nzKS63Kg0IdeB5VhT7/16R886mEILvaoMuBKikTPEMAnqXEnxbxjVsIaQ8FZ9SokAH9rZL/4HUTIR
	V03YPbvxE44mdIs6z4eNKDEfxdacHTbxix6ZklK3M61bqU7n+RTmIKt8wjLf1+PFkIS+JdTdNo7OB
	o0jWvhHPSDH4SwZ8prSyWTZDsfmuqiD7YaMEdL9Ho++dWi0JjJolFltDpFpVhUKWUaqC7PxZFqFMI
	EezLz0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Mc-005ZAY-2v;
	Wed, 19 Jul 2023 06:08:42 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Mb-005Z9q-1u
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b1kccRJOFvESEqgKmX/D8t2pL0Rvl2SD+lFU2s0r7m0=; b=K5Fb0XNLR+TDh9tfq8MwcrVbVm
	Ua8XxLamLldLif9V8XJ5e1yv41rpKxdGOdHPX0m0pmJq5vTUKtS5Do1zF6naO+4ZFjsb2sempFS3r
	YGpf83LJl1EfeJkDK1nlvKffEML/ZjPUDX1YFfRaOswqQvchigMGwNY4ohNN2vYME0RuNB3LivfqY
	GTDue9erFTDI8YK+DKWLT8BxgfL4sQp6pPB4zEQt2fYRXOUXeiPfv3LZIgLduJk0VLCT1e4e+JtfH
	PYpPv9FAN2JOdSBAZ0YwJ7y5Nav9IIntPL5VVSqUa6NHkW5YPRk21JqusRo//EGRPM2M7LjOfWlOF
	H5X6o8OQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLiIC-00BQSk-2d
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 10:50:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 70BE5614FC;
	Tue, 18 Jul 2023 10:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9510C433C8;
	Tue, 18 Jul 2023 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689677418;
	bh=zQYgnIFILucON97OJBM634+neVy/AE4BCTs3b8kgD2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMcxujb4TVnixpr7r9rToI8n3qx8a5CwcYzdw0ZOba6lyNqJcXXNQbnEY7zGsfe60
	 atBpJcHIfDuf6zzX71ClfRBTaR7irBFDVbCh/DE3JzzABAEbgn/dEqakyjmCSyeO+C
	 vWD5wsnTcJesNngUc1vGbGBOYQZnYoJfo9haUbkMJfvzpKL5GNYELi4bDOd89VB4n+
	 3p4Le+vz4HVs8n3xwBNCkgTXhiFP3BIoqtzjk9iHy6vFA6tAaoSxt/XOsFpOZb5TPL
	 ntzWRgvJcJZ0pfXQ1OLv0nV63a0JgBrQf7U2f64gTx9xyp38UDkruY+gpfn1jgWVfC
	 SqoMWOmJWaBiw==
Date: Tue, 18 Jul 2023 11:50:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/1] PCI: microchip: add return value check to
 devm_add_action_or_reset()
Message-ID: <20230718-scalding-troubling-3ac96e7ce4d6@spud>
References: <20230717144451.21314-1-ruc_gongyuanjun@163.com>
MIME-Version: 1.0
In-Reply-To: <20230717144451.21314-1-ruc_gongyuanjun@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_115057_310854_BE15250C 
X-CRM114-Status: GOOD (  18.90  )
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
Content-Type: multipart/mixed; boundary="===============8187700444719219517=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8187700444719219517==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fs8ZuB3FAvcTEt0Q"
Content-Disposition: inline


--fs8ZuB3FAvcTEt0Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Mon, Jul 17, 2023 at 10:44:51PM +0800, Yuanjun Gong wrote:
> devm_add_action_or_reset() may fail, therefore, a check to the
> return value of devm_add_action_or_reset() is added before return.
>=20
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>

I thought I gave a reviewed-by on the v1, so here you go again:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  drivers/pci/controller/pcie-microchip-host.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/c=
ontroller/pcie-microchip-host.c
> index 5e710e485464..dd0215dbda77 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -863,8 +863,9 @@ static inline struct clk *mc_pcie_init_clk(struct dev=
ice *dev, const char *id)
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_unprepare,
> -				 clk);
> +	ret =3D devm_add_action_or_reset(dev, (void (*) (void *))clk_disable_un=
prepare, clk);
> +	if (ret)
> +		return ERR_PTR(ret);
> =20
>  	return clk;
>  }
> --=20
> 2.17.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--fs8ZuB3FAvcTEt0Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLZuZwAKCRB4tDGHoIJi
0iN1AQCNqYM6ascH6iZjh/zSOFYZEqFi7j2cZHosSIZz+KBz5wD+INXoLBOc2Mp+
WBDJrTAi3GYJ4mpLjMHji0R+UAzDDg0=
=hPZj
-----END PGP SIGNATURE-----

--fs8ZuB3FAvcTEt0Q--


--===============8187700444719219517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8187700444719219517==--

