Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4BCD46BFB
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7rNaL7xXVjOgaQWWNQeAzM50jMeIN3q7jV+Vuma060=; b=reDDbVWqQ97A5Kp8tKZ7bwqjme
	kx/UB0JY6cC5rg3cz+Df46PhnhUSxARThj7Zu8y7ZTuOJe0x2kbh7PpWFIjlaQU+IbdeNBKQp3N6L
	QgLBH0MUVeJPFLw80aHqKFL39g9Brl4EPGOmsYZiVbiZ3yCt8D1NIrA5TND2y1l1O26MSFFj0YUqN
	gQUWV3+Y6ImkxpacNvadDU+eVnTrcN2nALl3+8IvejLPe5oI2vED6VBoJrTCAXGUkPmE/FEujBtLm
	QeHZ/UZtSavibAYcredS8PfB46vKS72zL92YYH0DsO4Q88qagtiZGGr7YByu12Qi5y1hbZxLXk7wY
	GuIsT7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCUd-0000000Gnnj-3bTu;
	Wed, 28 Jan 2026 20:50:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCUb-0000000GnnW-0FNv
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:50:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCB6E60054;
	Wed, 28 Jan 2026 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7B9C4CEF1;
	Wed, 28 Jan 2026 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769633423;
	bh=cX69s2o4o62ZvAs8fXmfN8sDkaWTmiMI+MiDnGzbd28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLQlIWubeB/tZOlihSrax7xkShRBHnwfcxFU4OBaOyVPjOzOqzjUGO036naQZHT35
	 MGAJMlUgLXVujeneiDcPG+LaI9ByNlFLcS5HIOQgqXwbHn6t4jnkbLyXQZT4mEMo6Z
	 XdT3zSvLHoXtMiV/cIU6BBPQCWr7wusHMx4yNNAIP73FlJxY+x5vBTJjCQ8/42/Pfp
	 u3WVlpxUAho677bcxUo/ItWEQ8s9NuJGRg7ZS0dIPyNjN1FZ7Q0XQTjZCBOHJeXOsA
	 cpAkau1y+3pTzwsVkBqdR779vBextOLMsJ+yebClfa0lEvNTHdn8AJRseqf7uwt0/T
	 bcHS4ko2JXaIg==
Date: Wed, 28 Jan 2026 12:50:21 -0800
From: Drew Fustini <fustini@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v6 1/9] dt-bindings: vendor-prefixes: add verisilicon
Message-ID: <aXp2jfkpQVZ94rjU@x1>
References: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
 <20260123092830.4046009-2-zhengxingda@iscas.ac.cn>
 <aXpwED5wSZbnIjae@x1>
 <20260128-smokeless-angular-cff7e16ff8dc@spud>
MIME-Version: 1.0
In-Reply-To: <20260128-smokeless-angular-cff7e16ff8dc@spud>
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
Cc: dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Thomas Zimmermann <tzimmermann@suse.de>, Han Gao <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: multipart/mixed; boundary="===============2354428835324049295=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2354428835324049295==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="39FyjRiqT1aLZNV0"
Content-Disposition: inline


--39FyjRiqT1aLZNV0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 08:42:11PM +0000, Conor Dooley wrote:
> On Wed, Jan 28, 2026 at 12:22:40PM -0800, Drew Fustini wrote:
> > On Fri, Jan 23, 2026 at 05:28:22PM +0800, Icenowy Zheng wrote:
> > > From: Icenowy Zheng <uwu@icenowy.me>
> > >=20
> > > VeriSilicon is a Silicon IP vendor, which is the current owner of
> > > Vivante series video-related IPs and Hantro series video codec IPs.
> > >=20
> > > Add a vendor prefix for this company.
> > >=20
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > No changes since v4.
> > >=20
> > > Changes in v3:
> > > - Add Rob's ACK.
> > >=20
> > > No changes in v2.
> > >=20
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index c7591b2aec2a7..18f931f369198 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -1745,6 +1745,8 @@ patternProperties:
> > >      description: Variscite Ltd.
> > >    "^vdl,.*":
> > >      description: Van der Laan b.v.
> > > +  "^verisilicon,.*":
> > > +    description: VeriSilicon Microelectronics (Shanghai) Co., Ltd.
> > >    "^vertexcom,.*":
> > >      description: Vertexcom Technologies, Inc.
> > >    "^via,.*":
> > > --=20
> > > 2.52.0
> > >=20
> >=20
> > I've applied the bindings patches (1, 2, 4) to thead-dt-for-next as well
> > so that 'make W=3D1 dtbs_check' won't break for the next release of
> > linux-next.
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?=
h=3Dthead-dt-for-next
> >=20
> > I wouldn't normally pick bindings patches but it is a short timeline if
> > we want to get some testing done in linux-next before sending v6.20 pull
> > requests. I have created an immutable branch thead-dt-v6.20-dpu-hdmi in
> > case that helps.
> >=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/log/?=
h=3Dthead-dt-v6.20-dpu-hdmi
> >=20
> > I can drop the yaml patches from thead-dt-for-next if people think that
> > was the wrong thing to do. If we think that the driver changes won't
> > actually be ready for the merge window, then I can drop all these
> > patches from thead-dt-for-next.
>=20
> If you're taking the binding patches, it means the driver hasn't been
> applied, and therefore there's not much reason to do something abnormal
> like this? I'm not sure what the benefit of getting the dts patches
> applied if the driver hasn't been accepted yet.
>=20
> If this is only about linux-next, and the driver /is/ going to land in
> v6.20 (or v7.0, w/e it ends up being), then the warnings don't warrant
> doing something abnormal either, as long as whatever Linus ends up with
> at -rc1 is clean.

Okay, thanks for the guidance. I felt the urgency as I had the
impression that Thomas Zimmermann might take those driver changes for
the next merge window.

I will drop the bindings patches from thead-dt-for-next right now.

Are you saying it is okay to leave the dts patches in thead-dt-for-next
even though that means next will have W=3D1 dtbs_check warning about
undocumented compatible?

Thanks,
Drew


--39FyjRiqT1aLZNV0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSy8G7QpEpV9aCf6Lbb7CzD2SixDAUCaXp2iAAKCRDb7CzD2Six
DH1JAQCzvcGMBy9B4A47b6gXkVcbNsZzVI7DY0W0YDyZcS3zvgEA4W535byDQFen
E4YKTUPt3ZHKwbQEu0qezexVhwj3cgY=
=I5FU
-----END PGP SIGNATURE-----

--39FyjRiqT1aLZNV0--


--===============2354428835324049295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2354428835324049295==--

