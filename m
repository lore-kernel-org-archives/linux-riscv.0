Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACF1D78310
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0b8clxGX2UV79pxFB1pZbBtXhRciTBZwaJlYRSVP7UI=; b=d4MUIHOFapDVSNJI0PdmsG1nUc
	yiNdxAXYnZKp35uuWm4dPFfBS9NNcm/k/HJa1RrHWZA4LEquSLeBet5bAfaqJki06txDBUldCggah
	CdX9JTldUzE5nHT16W0Rf9DbgszzG/eqk2iTGvWiEgcibAuscK0ESyCPKydT/NEo+8lJXZx1BPOsS
	f/1Wb1n4GAdPPrTDF0i05gv3NtbnTwoYNAdim4tqpDtbsgDbqq8xHrL57/53ZCbX48bDfcW+UnbOZ
	LAIB9NDOI7jnIIqigHNfSDwTD10eFhzf1NRRkQvQusrROLu2sM2TnQ1u8XD0I86+wZx7tA0mOmW0T
	+IxjW8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5He-0000000620y-0QKh;
	Mon, 02 Dec 2024 12:12:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI5Ge-000000061ml-2Ib5
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 12:11:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51103A40B71;
	Mon,  2 Dec 2024 12:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E99FFC4CED1;
	Mon,  2 Dec 2024 12:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733141467;
	bh=LsP9CgzJ+Y+sKgxaLMOV69iCWU+C4h7rrlW1sun0Wq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DtVsEOnEymQbCqj0nMkRW/4Me25USsUS1i7F5u90FS8KklyW0ISsUt8taa/mJ3+zn
	 YEYXz5ty08tFwVYji1+LqnHz+LaVfCtbegVLplbhGsw+Pb7/hindKs9HjfJPcWBkRR
	 UtanJH3XNygwsHcVpQJ1klAstg4WZDrvA3dHD2IITloeQqprq0GawNqtw7AIS/SBtE
	 QZFnXGvHyWUffsMU5tnclRjUWj72FXVebFG8D/IZTquoEAlj39tSxDKs5YnvWAt6+A
	 5NsUFMA+D5HkBTpqCD/ocM/Sv3+PKAJheuZfvwZuQnVr9NQWX+nsVjSyeYFf8LU/fR
	 3Bj4fE2asM/Qg==
Date: Mon, 2 Dec 2024 12:11:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mailbox: mpfs: fix copy and paste bug in probe
Message-ID: <20241202-given-elite-bcff7bdc290d@spud>
References: <9e760329-80ed-4bf7-8d4f-dbb16a736497@stanley.mountain>
MIME-Version: 1.0
In-Reply-To: <9e760329-80ed-4bf7-8d4f-dbb16a736497@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_041108_652552_565B20C9 
X-CRM114-Status: GOOD (  17.88  )
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
Content-Type: multipart/mixed; boundary="===============7389576846657815684=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7389576846657815684==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c+C96bfMaMmx84Ld"
Content-Disposition: inline


--c+C96bfMaMmx84Ld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2024 at 01:07:23PM +0300, Dan Carpenter wrote:
> This code accidentally checks ->ctrl_base instead of ->mbox_base so the
> error handling can never be triggered.
>=20
> Fixes: a4123ffab9ec ("mailbox: mpfs: support new, syscon based, devicetre=
e configuration")

This got merged? Would have been nice to know about it Jassi, you
really should adopt some mechanism of informing people that you applied
their patches.

I had added a fix for this locally Dan after we discussed it previously,
but since this made it in without that:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/mailbox/mailbox-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpf=
s.c
> index 4df546e3b7ea..d5d9effece97 100644
> --- a/drivers/mailbox/mailbox-mpfs.c
> +++ b/drivers/mailbox/mailbox-mpfs.c
> @@ -251,7 +251,7 @@ static inline int mpfs_mbox_syscon_probe(struct mpfs_=
mbox *mbox, struct platform
>  		return PTR_ERR(mbox->sysreg_scb);
> =20
>  	mbox->mbox_base =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mbox->ctrl_base))
> +	if (IS_ERR(mbox->mbox_base))
>  		return PTR_ERR(mbox->mbox_base);
> =20
>  	return 0;
> --=20
> 2.45.2
>=20

--c+C96bfMaMmx84Ld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ02j1wAKCRB4tDGHoIJi
0p/nAP0T1+p5CcIFqSqdwkulKIE1dpZGe7o3wJ9GOEDok8e//QEA7HDMHVJ1wuBg
teJIyHLOc627VuGVFCijuhJTIPYo3Q0=
=ekih
-----END PGP SIGNATURE-----

--c+C96bfMaMmx84Ld--


--===============7389576846657815684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7389576846657815684==--

