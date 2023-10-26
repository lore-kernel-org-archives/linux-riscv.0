Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34468C25B6B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzW+m31DZeJGOJDUw1+1sQJUiD7p/i3tLmmC/FuOmzE=; b=kuQ7cMrf2J5pT/caVPmeFQcTZ7
	RpIE/SryHnn/ngp3k7ULFyB6Ny3/saeCn7wy+vr++Q7/RIJi7B0xw/vqeYmPwx9JcbKKkn0InAnRK
	MvKHJpuP7HrnnAZ5M4MCUDMYnQrhqFIHMNS/wG2cQrG1LUon6kF4dtghN1dj7aqPlFAv0kQ17P+aQ
	U5bnQkjV0xExK3qHtSjRdDseWe6hI30GWy1M0uDZ12qWTfqS445O3lC6JZaq450M1FTcgISjrZsvx
	3ghUsQsArLZZ7kCHhgSiZbj287T2Efy3gHf7aefllqjQSlM9L/Lp8y1CUp04PIEOajOHbYJSeORSF
	j1h5UTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvP9-00Dv4n-1w;
	Thu, 26 Oct 2023 08:07:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvP6-00Dv4J-1k
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 08:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99C1561C54;
	Thu, 26 Oct 2023 08:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C32C433C8;
	Thu, 26 Oct 2023 08:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698307663;
	bh=MRgZsiUVmIfZKqCwNfNZ0a7KfMg57CWlHCRug7dRYiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h4BZUaWNpPw0JlhG/Aqlkb6iJ3x6gBmrkWVdvfMKm1Vcpsx5D2OFmlCecVVOI60pS
	 MPEMTlRIOMTF+mBiaE1Kkjwm6SPOPTJzk7p18x/eSJOtErkRe986WGLnOOiT7j42No
	 J2WvuZscQ3o9v89HAWZpvH+SRgCprj9P55k1XTNCKICa39ZENF+0lFSwT3IISmBi7H
	 pkL87DzM9AOHRtDt5HgVxkXv74Q2K8zYYnRCc107VAY40bm/myYUM3IqHF/9GfYBtZ
	 RJ0YUxhTJdrGN8uP0MC3FE+Rt/4/7h6yprElSn+8KGiRYr2g/JfZ3LHj7wusiScWrG
	 zEUttswk1AJJg==
Date: Thu, 26 Oct 2023 10:07:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Keith Zhao <keith.zhao@starfivetech.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Shengyang Chen <shengyang.chen@starfivetech.com>, 
	Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Bjorn Andersson <andersson@kernel.org>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
Message-ID: <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
MIME-Version: 1.0
In-Reply-To: <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_010744_660825_6730C437 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Type: multipart/mixed; boundary="===============4030227939078871326=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4030227939078871326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l2pgpleihh7nbgyu"
Content-Disposition: inline


--l2pgpleihh7nbgyu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > +static int starfive_hdmi_register(struct drm_device *drm, struct starf=
ive_hdmi *hdmi)
> > +{
> > +	struct drm_encoder *encoder =3D &hdmi->encoder;
> > +	struct device *dev =3D hdmi->dev;
> > +
> > +	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_n=
ode);
> > +
> > +	/*
> > +	 * If we failed to find the CRTC(s) which this encoder is
> > +	 * supposed to be connected to, it's because the CRTC has
> > +	 * not been registered yet.  Defer probing, and hope that
> > +	 * the required CRTC is added later.
> > +	 */
> > +	if (encoder->possible_crtcs =3D=3D 0)
> > +		return -EPROBE_DEFER;
> > +
> > +	drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
> > +
> > +	hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> > +
> > +	drm_connector_helper_add(&hdmi->connector,
> > +				 &starfive_hdmi_connector_helper_funcs);
> > +	drmm_connector_init(drm, &hdmi->connector,
> > +			    &starfive_hdmi_connector_funcs,
> > +			    DRM_MODE_CONNECTOR_HDMIA,
>=20
> On an embedded device one can not be so sure. There can be MHL or HDMI
> Alternative Mode. Usually we use drm_bridge here and drm_bridge_connector.

On an HDMI driver, it's far from being a requirement, especially given
the limitations bridges have.

Maxime

--l2pgpleihh7nbgyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZToeTAAKCRDj7w1vZxhR
xQohAPsE2kzpXlr9RqQPDtJRNj8AtNNrqzpApALpLI553biaLgD/RpyXbzEyRIo3
cDu23rmpQ4eOQdldwjqobLYIqhayago=
=B4HD
-----END PGP SIGNATURE-----

--l2pgpleihh7nbgyu--


--===============4030227939078871326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4030227939078871326==--

