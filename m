Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A665606A322
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JxqORDI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DPfmQr1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iw0eW4UBIS03klqogXEwyJMtHBuR0CMpdS9LXGmfkM=; b=1JxqORDIGAKiMFWS/hgby3uFph
	ADNFCmXECOvsiXV4dMda8zT4DFUqWufJbBCobJYwvfy1eg+FXC6fqjfPXVVblnSpzDG/VUuokE2eN
	MdcU7Nkd/C0xIqm6gRkCmCoDiR9myuPSjjS5o15RXy1D+Xmppsn/U1VBa2q5IFwPmZ3/WkcMwSMQP
	szcrnb239SgEqx9lzTCbSGLxRWb2KaX5f/12uWWL8FfTCcpJjN4jomNBzvRnCosNBgOZxd2Dbc2Bo
	2pj2W5HcO6uGCCdXTvCGwyr7BFwk10MR48/kukyts591jceMWCa8NnXgB/uZjM0PKHU8rkqJQRgp5
	6TS4PkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6uj-00000009PXk-2bkB;
	Tue, 20 Oct 2026 10:17:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6ui-00000009PXZ-3Ffq
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 10:17:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E4E6B60136;
	Tue, 20 Oct 2026 10:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD311F000C5;
	Tue, 20 Oct 2026 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491467;
	bh=UKzrd54OMkG5fM6Hq82N9GAY/LO634g6mtsK7/1Cxe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DPfmQr1XpGn1F7zlc60wK5nEJ91BJpuKAKsF8lExqKfooOyIiWGPlLylSgVIB3Poo
	 W1aUFP8Vh9YIT3WRyrmvTfHlzmC40HX5Ur+NoyQ7gtyNPGtRQGFB68UsJZUwXDoVDv
	 aRwBsDD0kCvXANW+L6bDQ3/5Mh2c5/sAkAeOYYMd2g62dwEHvMDtFX3HOkcj8BMIgN
	 JhlnxtSw2xd1ansNwlmtGpH+CrpEHCV1TdbILuKeIbCDJOV4kA1mRecsyaV8Wpzycr
	 Po631d/fNggmeIVEF2+H+R11g2hC4DsFPPl6Y+I3jEqUa5E+ZaGb8/tgnPuu63BBgZ
	 Gizma9CCv5Ouw==
Date: Tue, 20 Oct 2026 11:17:43 +0100
From: Conor Dooley <conor@kernel.org>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mpfs: Fix alarm register word order
Message-ID: <20261020-frequency-gloating-f9fd455d4fd2@spud>
References: <20261019151024.2232338-1-pocj8ur4in@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261019151024.2232338-1-pocj8ur4in@gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1479107059249318928=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1479107059249318928==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3X8iI98+7hL0ZN1"
Content-Disposition: inline

--o3X8iI98+7hL0ZN1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:10:24AM +0900, Baek Kyu, Kim wrote:
> mpfs_rtc_readalarm() swaps the low and high words of the alarm time.
> The RTC core reads this value during device registration to initialize
> its alarm timer. This can populate the cached alarm and timer queue
> with an incorrect expiry time, or leave an enabled hardware alarm out
> of the timer queue if the decoded time appears to be in the past.
>=20
> Read the low 32 bits from ALARM_LOWER_REG and place the masked high
> 11 bits from ALARM_UPPER_REG in bits 42:32. This matches the layout
> used by mpfs_rtc_setalarm() and the low/high assembly in
> mpfs_rtc_readtime(), so the RTC core imports the programmed alarm
> time correctly during device registration.
>=20
> Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

That's very odd, wonder how that happened. Definitely a blindspot when
it came to testing. This should look the same as reading the time.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
CC: stable@vger.kernel.org

Cheers,
Conor.

> ---
> Tested with KUnit under ARM64 QEMU using RAM-backed MMIO and the actual
> MPFS RTC callbacks and RTC core registration. All ten tests pass with the
> fix, including importing a preloaded alarm and checking its timer queue
> entry. Four additional tests covering current-date alarms also pass.
> No physical MPFS hardware or suspend/wakeup was tested.
>=20
>  drivers/rtc/rtc-mpfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 60596b0ea9d8..6616ca1f02c7 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -131,8 +131,8 @@ static int mpfs_rtc_readalarm(struct device *dev, str=
uct rtc_wkalrm *alrm)
> =20
>  	alrm->enabled =3D mode & MODE_WAKE_EN;
> =20
> -	time =3D (u64)readl(rtcdev->base + ALARM_LOWER_REG) << 32;
> -	time |=3D (readl(rtcdev->base + ALARM_UPPER_REG) & ALARM_UPPER_MASK);
> +	time =3D readl(rtcdev->base + ALARM_LOWER_REG);
> +	time |=3D ((u64)readl(rtcdev->base + ALARM_UPPER_REG) & ALARM_UPPER_MAS=
K) << 32;
>  	rtc_time64_to_tm(time, &alrm->time);
> =20
>  	return 0;
>=20
> base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
> --=20
> 2.55.0
>=20

--o3X8iI98+7hL0ZN1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatc/xwAKCRB4tDGHoIJi
0mnfAP9WHLFsH9RNlptmvuRa3tCyL3gcyFP1D4ouXo0XLigQXQEAiSt75Wu3OUbv
ThkSkMDr/yWEXfi5RfyATq3bW78TkAI=
=vBRu
-----END PGP SIGNATURE-----

--o3X8iI98+7hL0ZN1--


--===============1479107059249318928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1479107059249318928==--

