Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D649C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 11:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvTmtyIKIoVWRJtFWCPrVLPhiegGP8odZ8xaNZvnZZs=; b=ONINShHx9zXUKZUyF0yPm5l6Jf
	aT9YDlAAsRy+9JCXvSyOUiemTl2f0QiUVwGBPZrkadEmvlV1fy8GCjZT06gUrR8IdMgA4ZYsTEUfY
	GMKhaOt4x4why+LTrTdQA9FKZEnlgKEGtEMzvfsBhOXZnzHW3p/rOPc3npXBHASFutMjwIgtSNrKl
	6mflR1MRTjCo3PgBlBGNYow6EKqvRMDQe+mByTGqM2IzsfrjPBv9diXSrtSrX/5P1miqxs5hHL/De
	uZ3hp7mMvwax31E1+8ioSBgCeBBkYY71gOOlUevkYvGhTPf9MF7FbCHIfFEZz5DnjR18c8V0xh2TS
	cmneS1kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyw2-00EOfX-2z;
	Thu, 26 Oct 2023 11:53:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvyvz-00EOeO-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 11:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9E629CE3ED4;
	Thu, 26 Oct 2023 11:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C18C433C7;
	Thu, 26 Oct 2023 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698321232;
	bh=je+DADXCoX+kCTmWmZq0ysK4G7kIaCSpTWt8Az7jl+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WthaQ/2T2IwZQyvxbjc8i6TLCZH6R0bxGgKm3P19AQmdfpQ6FpjwwvQFGWuJlmFZh
	 tm7fXvL65CzQ5c33upmgr/CpnC+NcEfl7NPZYHB61Dli32HyEHjHTAEm7TVcOCAW6u
	 WX/pzPDujgTi+qekKeBkEKa/w3xdlsSoHtKQqepic+zDucRuItVq9HOI76c1zy0Fnj
	 tcQZxaUmgfx/DxBjhYrjFnhrEajLGZHbOZ1pNFf23+sav93OnPXQUIreqClHVVFSWC
	 4P6xH7xxp6pLnMn6QqN5PTG1/GsT6u4FVHAjey/Jdqt/t8/DPsiwi5Y8eT5xbu0gKF
	 PO2YZ9C1j9ydw==
Date: Thu, 26 Oct 2023 13:53:48 +0200
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
Message-ID: <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com>
 <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
 <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
 <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_045356_133736_794BF381 
X-CRM114-Status: GOOD (  24.48  )
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
Content-Type: multipart/mixed; boundary="===============4661358420385358037=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4661358420385358037==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ydghz6j3eeoumtu"
Content-Disposition: inline


--6ydghz6j3eeoumtu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 11:57:22AM +0300, Dmitry Baryshkov wrote:
> On Thu, 26 Oct 2023 at 11:07, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > > > +static int starfive_hdmi_register(struct drm_device *drm, struct s=
tarfive_hdmi *hdmi)
> > > > +{
> > > > +   struct drm_encoder *encoder =3D &hdmi->encoder;
> > > > +   struct device *dev =3D hdmi->dev;
> > > > +
> > > > +   encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev=
->of_node);
> > > > +
> > > > +   /*
> > > > +    * If we failed to find the CRTC(s) which this encoder is
> > > > +    * supposed to be connected to, it's because the CRTC has
> > > > +    * not been registered yet.  Defer probing, and hope that
> > > > +    * the required CRTC is added later.
> > > > +    */
> > > > +   if (encoder->possible_crtcs =3D=3D 0)
> > > > +           return -EPROBE_DEFER;
> > > > +
> > > > +   drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_f=
uncs);
> > > > +
> > > > +   hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> > > > +
> > > > +   drm_connector_helper_add(&hdmi->connector,
> > > > +                            &starfive_hdmi_connector_helper_funcs);
> > > > +   drmm_connector_init(drm, &hdmi->connector,
> > > > +                       &starfive_hdmi_connector_funcs,
> > > > +                       DRM_MODE_CONNECTOR_HDMIA,
> > >
> > > On an embedded device one can not be so sure. There can be MHL or HDMI
> > > Alternative Mode. Usually we use drm_bridge here and drm_bridge_conne=
ctor.
> >
> > On an HDMI driver, it's far from being a requirement, especially given
> > the limitations bridges have.
>=20
> It's a blessing that things like MHL / HDMI-in-USB-C / HDMI-to-MyDP
> are not widely used in the wild and are mostly non-existing except
> several phones that preate wide DP usage.

And those can be supported without relying on bridges.

> Using drm_connector directly prevents one from handling possible
> modifications on the board level. For example, with the DRM connector
> in place, handling a separate HPD GPIO will result in code duplication
> from the hdmi-connector driver. Handling any other variations in the
> board design (which are pretty common in the embedded world) will also
> require changing the driver itself. drm_bridge / drm_bridge_connector
> save us from those issues.

And we have other solutions there too. Like, EDIDs are pretty much in
the same spot with a lot of device variations, but it also works without
a common driver. I'd really wish we were having less bridges and more
helpers, but here we are.

> BTW: what are the limitations of the drm_bridge wrt. HDMI output? I'm
> asking because we heavily depend on the bridge infrastructure for HDMI
> output. Maybe we are missing something there, which went unnoticed to
> me and my colleagues.

A bridge cannot extend the connector state or use properties, for
example. It works for basic stuff but falls apart as soon as you're
trying to do something slightly advanced.

Maxime

--6ydghz6j3eeoumtu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTpTTAAKCRDj7w1vZxhR
xbLFAP4unIAE0v+sEMAKIEHtzqjUKfaDRvFMhet0vamy7Zof+QD/dgmnLOex7TJ1
wA5XuQ2uivS+Cv7xrc3HS7yTI5xVjAE=
=5wik
-----END PGP SIGNATURE-----

--6ydghz6j3eeoumtu--


--===============4661358420385358037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4661358420385358037==--

