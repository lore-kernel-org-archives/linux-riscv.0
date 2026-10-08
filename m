Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F940CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 13:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj1BPvQ4Ao572jzxp3Y9U12OAAMLpvN6N+qNC3Oa78o=; b=mIoYX/sc6jkU6C6bFSp8ffzL1C
	CzBSJlzZ5MjGYy5GeCZTHfSDHWdvWl4pMC0+/Rkz6JEoi+k2USvL81GzZqKzpXmcGgLlE6KWDaswf
	Rso1YWm8p58un6K5vHWtURoPNFoZKTtmhQnLK9fS5JDjyxZ/9Fm/VPZeh7rRPH8/w4YY1HAAk4Rpj
	/ktWtEn1QQknnO5DVqehmN54PbCvKmBiTi2w5HKpebO82oGIWJ/yxHRlY6e36QISjY8gMFMmr7Phb
	avNAL6QU5pUqof6vp2sSQvwx3T1oBluE0D3Yj7UH8juAH6yQF4u9AOJ9EyePGIJnp+4Ng+Qp0qNu5
	i5GhsfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnxQ-00000004QI7-1tyH;
	Thu, 08 Oct 2026 13:14:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnxP-00000004QHo-0MYR
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 13:14:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E2A8601DB;
	Thu,  8 Oct 2026 13:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A167D1F000FF;
	Thu,  8 Oct 2026 13:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465286;
	bh=N2acWtY1ipUiffzzGDX0s1gIQ1N+3h0sjovbkkO1ybc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G83LgMta8QKBoXDi2N2Qw1Zi4vSf9wF2eZmRkJ2KXgf5Dujm2M147rBcetHcNjKAI
	 LFmnxvDAUHlx2lGQRpzYdf0XMD4/aBlkZIf/1QR3dq/hKyKWrz/8sSievLYusidGN3
	 a88fUTV6TCtf6XHhv1d+dVkAJllQajhpvIr85X6W4hl+CkFJtRtfaEidDbGQ70ycUT
	 zlEiz4ucI4FpNHtP6MoPbzIk9/0YHIy7IFbeHZIy+uD5WEgm+5lIN9DNEq6uGpto+F
	 /qTUfEmMFaIDFzgLoIgwNz3ovYaiiYx8aCYE4pXBjwZlJeqEeNU0htXsrm5LIGPzdq
	 tMVDbmDzu6iwQ==
Date: Thu, 8 Oct 2026 14:14:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Felix Gu <ustc.gu@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: mpfs: use kref cleanup on probe failure
Message-ID: <20261008-590aec0ad34ba6c65b269ed3@squawk>
References: <20261007121743.192486-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261007121743.192486-1-lgs201920130244@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4406161332401387198=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4406161332401387198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="25uemib8zQO6l1ld"
Content-Disposition: inline

--25uemib8zQO6l1ld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 08:17:43PM +0800, Guangshuo Li wrote:
> After kref_init(), the device_get_match_data() failure path frees the
> mailbox channel and sys_controller directly, bypassing the matching
> kref_put() for the initial reference.
>=20
> Use mpfs_sys_controller_put() on this path so that the initial
> reference established by kref_init() is released through the existing
> kref release callback.
>=20
> Rename the error label to reflect that cleanup is now performed
> through the kref helper.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 75ef23397558 ("soc: microchip: mpfs-sys-controller: fix resource l=
eak on probe error")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> v2:
>   - Add the missing Signed-off-by tag.
>   - Rename out_free_channel to out_put as suggested by Felix.

Applied, thanks.

Cheers,
Conor.

>=20
>  drivers/soc/microchip/mpfs-sys-controller.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 0400a01b2338..ef27e1083f0f 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -159,7 +159,7 @@ static int mpfs_sys_controller_probe(struct platform_=
device *pdev)
>  	of_data =3D (struct mpfs_syscon_config *) device_get_match_data(dev);
>  	if (!of_data) {
>  		ret =3D dev_err_probe(dev, -EINVAL, "Error getting match data\n");
> -		goto out_free_channel;
> +		goto out_put;
>  	}
> =20
>  	for (i =3D 0; i < of_data->nb_subdevs; i++) {
> @@ -173,8 +173,9 @@ static int mpfs_sys_controller_probe(struct platform_=
device *pdev)
> =20
>  	return 0;
> =20
> -out_free_channel:
> -	mbox_free_channel(sys_controller->chan);
> +out_put:
> +	mpfs_sys_controller_put(sys_controller);
> +	return ret;
>  out_free:
>  	kfree(sys_controller);
>  	return ret;
> --=20
> 2.43.0
>=20

--25uemib8zQO6l1ld
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaseXOAAKCRB4tDGHoIJi
0mglAP9LFL+rx75JJZVcGF22GeaKs1JrUq0n7zmtswOTmVuBzQD/QJxwNqQuFgfU
G5Sf9nL2WAzwJajDzPZdbPQJ6p0nSgE=
=oelW
-----END PGP SIGNATURE-----

--25uemib8zQO6l1ld--


--===============4406161332401387198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4406161332401387198==--

