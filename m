Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027B7606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SyZQcf2Y;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKOWrRsJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:In-Reply-To:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cX0uTFNobAWzQb5CtqdeXnXWNkJXF4DVQsGHKVEBVoQ=; b=SyZQcf2YDcGnbusXrWkIf4o42i
	JF5IP1QfcqYRD9G/enIIQIW9b/bUs6Kq8SyJbg52mhN9rBvFM5EwAnNG+h+FKMHvSEbY0uy90NZEt
	/FkCilV3nIsphqkGBvg7oT5Xx01frMAFWyd6yzgboSyNroOgIrLzpdHPQe0XuRNWC1sPEuucDPuFU
	NYG70onplnDWYMar8fi3f8Zl3/xK8JhX95HBY3SKbE1asfwvLgwd3HeXsdH92chsqeA1fRkms9/JS
	mH2pp3Qh4PyFSsDdCXhbfj/p2GCy89NxlLkzlBoz6P5NIXO0641ZxLK9+Op4roLEcMhYMkrDex29B
	9l7Nn9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbpn-0000000Ae0p-3ixO;
	Fri, 30 Oct 2026 01:55:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbpm-0000000Ae0d-0CRe
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:55:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F5A143B9E;
	Fri, 30 Oct 2026 01:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E3951F00919;
	Fri, 30 Oct 2026 01:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793325307;
	bh=Bxo8jJFd0r8cFUbwZTI2sPMZTh9847a0AbtlpmmJS3Y=;
	h=Date:Cc:Subject:From:To:In-Reply-To:References;
	b=dKOWrRsJLVmZrcKzJ4TataGEgTAQ0s4UdHiybjyG4H3n0RXWwwhy6363+GHzqi7N5
	 ix4oHUMEsiXCUodANrkqdl/1BVH+MZZXnCggVOGG0r9GU2RW0TMU64nJwXa56cdA9u
	 bAib/zp9RRwmTaT2hZNVaAsLBgzmSiXSBH7fQ1mwDVBaQOIu9lUQwTItS0o4YgLH+i
	 UbPxU9IVErjLR0bwv02yIN5az4AlaBXAhBQprNDbETEBIxc+QJYiFb3jQOPyvCVaBu
	 40/zUJFqGRRZ6xD1wrBD2Nmu/++4d2PsUc5lmTUOsMam3lroK/eA556x8VogXi9bBU
	 nARS5O1b3RKnA==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 30 Oct 2026 09:55:02 +0800
Message-Id: <DMHSRIU2XCB0.35RV6ADY6W1IE@kernel.org>
Cc: "Alessio Belle" <alessio.belle@imgtec.com>, "Luigi Santivetti"
 <luigi.santivetti@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Yixun Lan"
 <dlan@kernel.org>, <imagination@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH] drm/imagination: retry runtime idle when firmware is
 not yet idle
From: "Troy Mitchell" <troy@kernel.org>
To: "Baihui Liang" <liangbaihui@linux.spacemit.com>
In-Reply-To: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com>
References: <20261029-img-pm-autosuspend-v1-1-26851840a34e@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3072644976165655675=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3072644976165655675==
Content-Type: multipart/signed;
 boundary=0127f86fc4a58c91f388809e3d2707f04403f9e1da5ca1b482b2ae563e30;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: 8bit

--0127f86fc4a58c91f388809e3d2707f04403f9e1da5ca1b482b2ae563e30
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Baihui,

On Thu Oct 29, 2026 at 4:38 PM +0800, Baihui Liang wrote:
> Returning -EBUSY from ->runtime_idle() prevents the PM core from
> retrying the idle check. Schedule an autosuspend so the idle state
> can be re-evaluated once the firmware reaches ROGUE_FWIF_POW_IDLE.
>
> Signed-off-by: Baihui Liang <liangbaihui@linux.spacemit.com>
> ---
> Tested on SpacemiT K3 (PowerVR Rogue BXM-4-64) by running vulkaninfo
> repeatedly. Without this change the device intermittently stayed
> runtime-active after the last user went away, because the firmware had
> not yet reached ROGUE_FWIF_POW_IDLE when the idle check ran. With the
> change the device reliably suspends.
> ---
>  drivers/gpu/drm/imagination/pvr_power.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/im=
agination/pvr_power.c
> index eb4b6ecdf4f..6f38249ffcb 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -434,7 +434,16 @@ pvr_power_device_idle(struct device *dev)
>  	struct drm_device *drm_dev =3D platform_get_drvdata(plat_dev);
>  	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
> =20
> -	return pvr_power_is_idle(pvr_dev) ? 0 : -EBUSY;
> +	if (pvr_power_is_idle(pvr_dev))
> +		return 0;
> +
> +	/*
> +	 * Firmware not yet idle; reject but schedule autosuspend so
> +	 * runtime_idle() can be retried.
> +	 */
> +	pm_runtime_autosuspend(dev);

If I read the PM core correctly, when this autosuspend timer fires it
calls ->runtime_suspend() directly rather than retrying
->runtime_idle(), so this looks equivalent to returning 0. Could the
real issue be the pm_runtime_put() in pvr_watchdog_worker(), which
perhaps should be pm_runtime_put_autosuspend()?

> +
> +	return -EBUSY;
>  }
> =20
>  static int

--=20
Troy Mitchell

--0127f86fc4a58c91f388809e3d2707f04403f9e1da5ca1b482b2ae563e30
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauP49gAKCRCYCe+A+TM0
L0hwAP9eNE++iKtZwfItKoa5Ce0VIc5lPf242yrrDF5VaIkx8QD+JwWLmwTRebkd
XinBsGjYMNrSzC78VKKxAT9MxMy9WAk=
=W/PY
-----END PGP SIGNATURE-----

--0127f86fc4a58c91f388809e3d2707f04403f9e1da5ca1b482b2ae563e30--


--===============3072644976165655675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3072644976165655675==--

