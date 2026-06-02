Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35CCCD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLf0KHy092I1JkvEYxFrpP3RX13r2Mb4qu/JLPorIH0=; b=AizpGRQNCsFJ3Jj+o151WHN7O8
	k71Wubqe47hzUD/bZSTwC+BHc4SZRExSMNff7AFDXDg93ahp9Vwcl9PA9jlboJTdxoNJt13D4ijui
	uSamteXfMKddzqsLWrKN5/eBu11NyL72YEjlA211Qqq9eJkPT72/g3kMkwd6lymQMiAg/Hfm8IEkT
	RXhiCDPDk/b/rOfFizUdQBCrDqrkgcUohSthag/QhvnCMQJe3OPItEGanMfCYh3qjdVFHqgEKDwY3
	t/P6HpUcsma1mCHmwpfmpbeIXKzeCGD/hxS/RXUGSwthnROEGQ9bk5gWBeotYtP8tuN/Q52sWzBze
	mqNJzrPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULEL-0000000CdX0-3U2u;
	Tue, 02 Jun 2026 09:16:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULEK-0000000CdWr-0WA8
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 09:16:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C11D6001A;
	Tue,  2 Jun 2026 09:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769191F00893;
	Tue,  2 Jun 2026 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780391771;
	bh=lH5knxgbqX8/3lsdm5nj+uNvYVsYtKLfkK4ffYsxzK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNrP10utxVtWXLzXcio7C2JL9/NrdSxZvzDuIOA3uSC0Ty+8VpWHqaNFng1NMziOX
	 3mc6LBWe/F77mrn1g95sXRCZV/ZP4VKmhC8f3LL8Bu61L+EsyHPZUIljWnyphEfxNO
	 kGxYxNnFjrSm+IdcnZN7iL1EO9hdgQp2QjzpzebF+M8NmUpABTcsd0b4sCCjfY3d2K
	 NfbQKGBYn5lipbgrf7W3zdokvhRDUQSKpiFs+jOrkWw2WV3z1DFe9DF4y9bJVtYq7j
	 eF1UyYiyCdujLNueVtJBOxhVPVkaUrB7lO94PHHAQQWUNwN4xYsMwdZZhoGHRMH9f4
	 DHjeWny4inQuQ==
Date: Tue, 2 Jun 2026 10:16:07 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Message-ID: <20260602-buddy-lumber-2be20af90924@spud>
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
MIME-Version: 1.0
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
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
Content-Type: multipart/mixed; boundary="===============1996734029807598834=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1996734029807598834==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3s4pjNosPPIt5FlC"
Content-Disposition: inline


--3s4pjNosPPIt5FlC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alexandrew,

On Wed, May 13, 2026 at 06:55:55PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The condition that needs to be checked for upload completion is the
> UPLOAD bit in the completion register going low. The original iterations
> of this driver used a do-while and this was converted to a
> read_poll_timeout() during upstreaming without the condition being
> inverted as it should have been.
>=20
> I suspect that this went unnoticed until now because a) the first read
> was done when the bit was still set, immediately completing the
> read_poll_timeout() and b) because the RTC doesn't hold time when power
> is removed from the SoC reducing its utility (I for one keep it
> disabled). If my first suspicion was true when the driver was
> upstreamed, it's not true any longer though, hence the detection of the
> problem.
>=20
> Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Any chance this could be applied as 7.1 fixes material?

Apologies if I missed an application mail somewhere,
Conor.

> ---
> CC: Valentina.FernandezAlanis@microchip.com
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-rtc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/rtc/rtc-mpfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 6aa3eae575d2a..ece6de4a6adbd 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -112,7 +112,7 @@ static int mpfs_rtc_settime(struct device *dev, struc=
t rtc_time *tm)
>  	ctrl |=3D CONTROL_UPLOAD_BIT;
>  	writel(ctrl, rtcdev->base + CONTROL_REG);
> =20
> -	ret =3D read_poll_timeout(readl, prog, prog & CONTROL_UPLOAD_BIT, 0, UP=
LOAD_TIMEOUT_US,
> +	ret =3D read_poll_timeout(readl, prog, !(prog & CONTROL_UPLOAD_BIT), 0,=
 UPLOAD_TIMEOUT_US,
>  				false, rtcdev->base + CONTROL_REG);
>  	if (ret) {
>  		dev_err(dev, "timed out uploading time to rtc");
> --=20
> 2.53.0
>=20

--3s4pjNosPPIt5FlC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah6fVwAKCRB4tDGHoIJi
0v7oAQCz1CCZBWpyWPNGEqYZ863RGC7Cs4/nJxTSqZo+lbBpjgD/S0fCwGvik9ow
UdXAUzjUecYvu2M9n+kHvZgLi3/dbA4=
=Buf5
-----END PGP SIGNATURE-----

--3s4pjNosPPIt5FlC--


--===============1996734029807598834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1996734029807598834==--

