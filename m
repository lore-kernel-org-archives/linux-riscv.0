Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75CBC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPugEAZI1geVVwHiJMNCYrE0FLbMY0cgaMMXmtiRiA4=; b=Urr6tUl2GLN+atJQGp5o0bT3N/
	EzE4f3xy8B7tAQhQGBMZzLEJXjpKN79qQPWgd7ZMPGOsowT1IEWTvi+fci+No6z5JuykjQGrG6Ln5
	X5KNgwxBMiGCweLLeV5tsfYIsepk2YQeKx7Ht0R0oxNmw7pMUXXMxRf8c6jj0P0Qook9SOx58U7xJ
	484mfwXK8zKmd6b6nTDCSZV+kdC8ZlDMKApRRHVEW8jYLSU49r5XXBtZNnOplMvpbVUmmEZojKmJi
	hTyT3orRfbYpbYTc9ivdrv7bbi3hizrcmmexJCYCgCFvkPk8E+OjEQpCPekoA4ZR2vxv8k7h0/+4+
	0oAn/8ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDUM-00000004X3F-3yXv;
	Wed, 31 Jan 2024 16:31:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDUJ-00000004X1S-3JX4
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 16:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E490CE16C5;
	Wed, 31 Jan 2024 16:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1BEC433C7;
	Wed, 31 Jan 2024 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706718652;
	bh=jV+IW1BRHUg+D+REntsLJtRkUxqONiKUmtqDsV82itI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udG2ZcRDmMPjbK6aF+4k7fsWHwlpGxyg8XCxDbLkppGdsq6L73vhfSAYtMyv4wK6H
	 IYkOX8GbR9Mm0ccp4sIcyKJzgdetiCpZ/Z2qrVrvhSBxihAI1IJ7T0cZIX/k+Bs2Yf
	 Avm64pVoXKnvHC6NT3YcaUAfhj6DkPmYYt4zR/D3jgBMlB9r86XcS/7T75NP86FSRy
	 tAhMSWdH528agAjz7fh/aVEVoAVzqx5x/+cU048NmS9NZSgOzWOLX3Evk2rr0S8uQs
	 4AzUMKoulmjNSNkA08hpSTv7lQGII9EXVs4w7dVCIZ1gMPxSkaO6KLlfRgDLfV8FZF
	 f0rEik7hgaleA==
Date: Wed, 31 Jan 2024 17:30:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"airlied@gmail.com" <airlied@gmail.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, William Qiu <william.qiu@starfivetech.com>, 
	Xingyu Wu <xingyu.wu@starfivetech.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Shengyang Chen <shengyang.chen@starfivetech.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [v3 4/6] drm/vs: Add KMS crtc&plane
Message-ID: <e2spje6iew6skzrhrcgr23g4dc7l7rjoq77ki6oupqborfl22b@owmd2sdzcdaj>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-5-keith.zhao@starfivetech.com>
 <o4ica2jg2rqfx6znir6j7mkoojoqzejjuqvlwcnehanw5mvop6@a3t6vi7c55tz>
 <NTZPR01MB1050AC99C38D2136D0354F3DEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <NTZPR01MB1050AC99C38D2136D0354F3DEE7CA@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_083100_204554_B943BBEE 
X-CRM114-Status: GOOD (  17.52  )
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
Content-Type: multipart/mixed; boundary="===============5569589071055971121=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5569589071055971121==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xv7z5ay3ishmxaq2"
Content-Disposition: inline


--xv7z5ay3ishmxaq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 08:57:21AM +0000, Keith Zhao wrote:
> > > +static const struct vs_dc_info dc8200_info =3D {
> > > +	.name			=3D "DC8200",
> > > +	.panel_num		=3D 2,
> > > +	.plane_num		=3D 8,
> > > +	.planes			=3D dc_hw_planes_rev0,
> > > +	.layer_num		=3D 6,
> > > +	.max_bpc		=3D 10,
> > > +	.color_formats		=3D DRM_COLOR_FORMAT_RGB444 |
> > > +				  DRM_COLOR_FORMAT_YCBCR444 |
> > > +				  DRM_COLOR_FORMAT_YCBCR422 |
> > > +				  DRM_COLOR_FORMAT_YCBCR420,
> > > +	.gamma_size		=3D GAMMA_EX_SIZE,
> > > +	.gamma_bits		=3D 12,
> > > +	.pitch_alignment	=3D 128,
> > > +	.pipe_sync		=3D false,
> > > +	.background		=3D true,
> > > +	.panel_sync		=3D true,
> > > +	.cap_dec		=3D true,
> > > +};
> >=20
> > I really think that entire thing is to workaround a suboptimal device t=
ree binding.
> > You should have two CRTCs in the device tree, you'll probe twice, and y=
ou won't
> > get to do that whole dance.
> >=20
> Hi Maxime:
> I tried to modify it according to this idea Found it too difficult In ter=
ms of hardware,=20
> the two crtc designs are too close to separate, and they are even designe=
d into the same reg with different bits representing crtc0 and crtc1.
> It seems not easy to described the 2 ctrc hardware by 2 device nodes
>=20
> The idea is to avoid a whole dance
> I don't know if I understand correctly about whole dance.
> Is it means I create 2 ctrc and 8 plane in the dc_bind?

It looks like you just sent the same mail?

Maxime

--xv7z5ay3ishmxaq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbp1uQAKCRDj7w1vZxhR
xTVnAQCPu+rxm42307fHf03GbrgNfJK7FjrljEfpxkkKMR2KHgD/TaZnj2hQnMsv
I3q4pY+SX55x7qpgGeeIIDvyLXESOQE=
=S6wD
-----END PGP SIGNATURE-----

--xv7z5ay3ishmxaq2--


--===============5569589071055971121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5569589071055971121==--

