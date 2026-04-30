Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761E6FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unZDO19jWS+0cogLN/hiLZM7PGgDyxsKWxoTGB9hsqU=; b=2yHSVi07U5MsnFrNtuUcC/IkcD
	5nLepqtMingSILG0r0ZDg2kfKr/OqsZyQQg5gfau7YLNMO6vs7/DI8xm7q64j0l0nTas0ZQ35UKci
	rOlXu48QZSjDA+UbL6cnATQdIkzui7Z4aYoG5bhXqCRFmiVO8MMyeQhyo4SAGF0m2VkEPIfGaN/a2
	GDCaatUyMHw3l97FTXXDYWXLinZQE7Fo45h6fBsHe2rYUECspsPqNRnnFAPR8Wk/fuBWx3Pre4eb+
	yPvnGFZoInM/HgbYiM/+6wgKxjt2wgQ6f35aHIIEdNQUiEY/Hzr14T5lbFZagKlo+HnY3aQ+p4X/q
	QKObxQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ5W-00000005Q7R-145M;
	Thu, 30 Apr 2026 12:01:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ5U-00000005Q7H-3R8Y
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 12:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24A5C60180;
	Thu, 30 Apr 2026 12:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4655C2BCB3;
	Thu, 30 Apr 2026 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550507;
	bh=IV9g4ZwLr8OltYknyWwgkPlaopAbf6RRhghSyRxuMCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTuYeXm90pxGoSPdy11TaSBmPtCNCrpn0GmIRa7B2iarUav50vZpOV3d1f4p/0jtZ
	 1eNw8iQkL+7BxQoxqq9mPbTaUDUj2i+yf977LTxpeHsfYK3hmR29I5h6N8K7Nr6X7i
	 zCnrQbmQIrY77O/KygGZQm4cq8+IdIK+Ri/4mJzYAr6Mm09o8Xg59KBj7PjKNTIXq1
	 N4v6ZRrCX9QSF/Teth8lGJ/Bq0rFXjOiocKZ2sCkJrdmR1tZyc7ycKVyF23U6KNNCB
	 xl0DmnyFB8fFTbwulIKaDFtxX3iUQBmdnicmk8h/s31RqppPP7dqvd4Fk586CEz+ei
	 93I10KpjnYEGQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 37F7A1AC585F; Thu, 30 Apr 2026 13:01:45 +0100 (BST)
Date: Thu, 30 Apr 2026 21:01:45 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	jinmei.wei@spacemit.com
Subject: Re: [PATCH 1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Message-ID: <afNEqXIKRgzRJt7W@sirena.co.uk>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
 <20260430-i2s-same-blk-v1-1-3a1f04eb6159@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260430-i2s-same-blk-v1-1-3a1f04eb6159@linux.spacemit.com>
X-Cookie: 667:
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
Content-Type: multipart/mixed; boundary="===============2743609573169016715=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2743609573169016715==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LP/4rLfr3gGl1SWy"
Content-Disposition: inline


--LP/4rLfr3gGl1SWy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 03:46:01PM +0800, Troy Mitchell wrote:

> @@ -116,10 +116,27 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *=
dai, unsigned int ratio)
>  	    dai->driver->ops->set_bclk_ratio)
>  		ret =3D dai->driver->ops->set_bclk_ratio(dai, ratio);
> =20
> +	dai->bclk_ratio =3D ratio;
> +
>  	return soc_dai_ret(dai, ret);
>  }

This needs an error check, if the op fails we'll write the error code as
the BCLK ratio.

--LP/4rLfr3gGl1SWy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnzRKUACgkQJNaLcl1U
h9C0LQf9Gg/ej8yDL7e3JCskfpRbEHWZL+hrdT18BF9bPjEfAkm5JjUJTKlgCGZL
9/ywXiuHg26nQyYeEy5qUpvO7xi07TuDtXDib+9PODa16OyBYmMD3va5AFRarP81
WnXpOyX98PUc9SdnI5vz2KSoiEW9gp6LXlmFP7tsWAb5eHrBMWLaCrNuKRxsXcvA
9RZ3pRspDYSRntaRUrFEO7GvrZidKdEAW2j6h+mNgYuBeT/6Grj6W6GO/qnm3f/6
DKTC8flBURawpkqtktGfsCk5qi7uZDt37NwhPVIavmH/suCRB67p8xqg7XVi2TyD
r35ssypOquxGkK1aOWdW/xUDZZ2mvw==
=5Vap
-----END PGP SIGNATURE-----

--LP/4rLfr3gGl1SWy--


--===============2743609573169016715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2743609573169016715==--

