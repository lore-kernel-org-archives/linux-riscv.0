Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54692C369B5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8X2lDtuU1waCaNEoueqDBGZ3gz9d0uYBLH2Vljk0qg=; b=nOtf6lNKDIppLd8c6g1rkPjy8Q
	hM53VHrwccTJJNWIqUq+o8l7sf5C9tQNM5OjsHg46Wc8pzjml+72SCr+1SIJBgZSHmL2nstKK9tRw
	ZIc84ntcLs1VR+SMgSmiokgfynvF4Fmx17D2y39HsPNZq8QxTYpHTC8s9s3OJnAxXyeCN0ySG15tF
	N5YLzA/t5v3LDDAdeleXCTqF2KzAgTjk9By4pQ9gZtt0H2Cwb5e6CNuJ7yNKyG2MKBcJOpmEUW67j
	tXtzG0pa4DmoOYC1uX5J2zu11/5kiicmnr8WBMdhNXPXxxMWkJMlz5ms1C77LzIv8W99lSb8Kolrz
	xKtgm7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cAU-000000055Q7-2uzR;
	Tue, 15 Apr 2025 09:01:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4c4V-000000054ZH-1jND
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 08:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF19FA492A5;
	Tue, 15 Apr 2025 08:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A690C4CEDD;
	Tue, 15 Apr 2025 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744707310;
	bh=vGvpKawwe3gI5yvFnpIT7nHbouJvN4MFyvJyYAkbBsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gl2fmgtD+ZSCoo67x4oHR2ZYoD3QcZhpyCGP8Scecgr+Fp/lHASgEDumO10W8Dv7O
	 035vsmJvbj5Vg0UD6MiI5xbxLNRWG+0xtq95m2U5Nyb5W6WaMbcwSgaftRmdcwOeW6
	 EhbsZt3RYI3vrz4Q95FvtyS6Z/t1USGZrynKrZCnjbs7pM5TXTPMgDNKOncboH6VfA
	 JLRWFKbZVKfARUb+bFqM652yrz+KDihgB9912fHs0nR8W7kFQ6dOygjGDcnX/YPilC
	 ZHfvb6jjjgjsVCqqN13FHowyIaqHtc5C2UU7fs+U1STPxyOfF626j8WooeXh1jJ/KT
	 /d7UI6axfZbHQ==
Date: Tue, 15 Apr 2025 10:55:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, m.szyprowski@samsung.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
Message-ID: <20250415-poetic-magenta-cicada-9d1ee7@houat>
References: <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <CGME20250414185317eucas1p139284a38dc4418ac90bd081c2825142a@eucas1p1.samsung.com>
 <20250414-apr_14_for_sending-v2-4-70c5af2af96c@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250414-apr_14_for_sending-v2-4-70c5af2af96c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_015511_583708_5BE2353D 
X-CRM114-Status: GOOD (  23.05  )
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
Content-Type: multipart/mixed; boundary="===============4692484828398117140=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4692484828398117140==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dpgfk2bi35c7deux"
Content-Disposition: inline


--dpgfk2bi35c7deux
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4] drm/imagination: Skip clocks if platform PM
 manages resources
MIME-Version: 1.0

On Mon, Apr 14, 2025 at 08:52:58PM +0200, Michal Wilczynski wrote:
> Update the Imagination PVR driver to skip clock management during
> initialization if the platform PM has indicated that it manages platform
> resources.
>=20
> This is necessary for platforms like the T-HEAD TH1520, where the GPU's
> clocks and resets are managed via a PM domain, and should not be
> manipulated directly by the GPU driver.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/i=
magination/pvr_device.c
> index 1704c0268589bdeb65fa6535f9ec63182b0a3e94..f40468b99cf14da418aeecde0=
86f009695ff877c 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -504,10 +504,16 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
> =20
> -	/* Enable and initialize clocks required for the device to operate. */
> -	err =3D pvr_device_clk_init(pvr_dev);
> -	if (err)
> -		return err;
> +	/*
> +	 * Only initialize clocks if they are not managed by the platform's
> +	 * PM domain.
> +	 */
> +	if (!device_platform_resources_pm_managed(dev)) {
> +		/* Enable and initialize clocks required for the device to operate. */
> +		err =3D pvr_device_clk_init(pvr_dev);
> +		if (err)
> +			return err;
> +	}

So, how does that work for devfreq? I can understand the rationale for
resets and the sys clock, but the core clock at least should really be
handled by the driver.

Maxime

--dpgfk2bi35c7deux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/4e6gAKCRDj7w1vZxhR
xeTeAQDBOrkzTJtdQ3A1rnkjHNj0lVxM4Ty8cZ/N6If/1qYvgAD/S8+uTDIzPSNF
nUiSeauW8K+11TmEGBs2o10AHNMK4wY=
=lBeR
-----END PGP SIGNATURE-----

--dpgfk2bi35c7deux--


--===============4692484828398117140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4692484828398117140==--

