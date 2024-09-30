Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4504CE8374
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vf6EWYAxw3dKlrywcHCmVXNa2XBLtaDh8hSHTkL3ZY=; b=0sAdDfkSTOUzcMt+OyDoc0Iorl
	XlwsoECcOMm/IOBJmqEcib9jxvYZW7CgpGglWlSfCL+YU8F7PLF6G5VjSkPOsn9lGSqNbRC+M4VIs
	c4b1baiKZ2PCtXVwRkaS/LUCjxP2/TwdCm3fbBKNYkZqEUXwkBGIppTrSAO4hX9hMIm0jR3zHq9dY
	y2QYtAiKjVQeCUc+bAQ0P/fHh9+prSgjDc2rqPmm98GjyaeXklv3n49fXoEJlFuZkha0VJZunotWu
	KeYJFp+7a1eQhV/qeoCJw2FVA8D5to4TMC7+dIfuOMgfUWbchROS34xc0+O6q4cty/anDuVhmPKYc
	lDeCFoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJcx-00000000IWl-3Zmo;
	Mon, 30 Sep 2024 16:52:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJcu-00000000IVc-1z5C
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 16:52:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1svJck-0000VS-JM; Mon, 30 Sep 2024 18:51:50 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1svJcj-002fuM-J1; Mon, 30 Sep 2024 18:51:49 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 33EB5346E15;
	Mon, 30 Sep 2024 16:51:49 +0000 (UTC)
Date: Mon, 30 Sep 2024 18:51:48 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: pierre-henry.moussay@microchip.com, Linux4Microchip@microchip.com, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux][PATCH v2 01/20] dt-bindings: can: mpfs: add PIC64GX CAN
 compatibility
Message-ID: <20240930-unyielding-hypersonic-marmot-7bf720-mkl@pengutronix.de>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
 <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
 <20240930-voracious-hypersonic-sambar-72a1c5-mkl@pengutronix.de>
 <20240930-skeletal-bolster-544f3a2b290a@spud>
MIME-Version: 1.0
In-Reply-To: <20240930-skeletal-bolster-544f3a2b290a@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_095200_530496_B22A7769 
X-CRM114-Status: GOOD (  16.61  )
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
Content-Type: multipart/mixed; boundary="===============2700353006160369584=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2700353006160369584==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zdxv4cgborwrwqlm"
Content-Disposition: inline


--zdxv4cgborwrwqlm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.09.2024 17:37:22, Conor Dooley wrote:
> On Mon, Sep 30, 2024 at 06:32:29PM +0200, Marc Kleine-Budde wrote:
> > On 30.09.2024 10:54:30, pierre-henry.moussay@microchip.com wrote:
> > > From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> > >=20
> > > PIC64GX CAN is compatible with the MPFS CAN, only add a fallback
> > >=20
> > > Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.c=
om>
> >=20
> > Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
> >=20
> > Who is going to take this patch/series?
>=20
> Ideally you take this patch, and other subsystem maintainers take the
> ones relevant to their subsystem. And I guess, I take what is left over
> along with the dts patches.

Makes sense. Consider it applied to linux-can-next.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zdxv4cgborwrwqlm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmb61yAACgkQKDiiPnot
vG8ikQgAlPCBr+HZlUczPrHGyPED8iTqJvYiS+OfZKtoDXIwin93VavN8tobss+8
m/27veo7QQ13j1ss5NuDAZg+ZcfwSffO7ZwkF8YymyJCNIK8cfBojJCs3To+gWLl
X12JvSFLUceKWx3fPE7+YPUtOO8uKmSx1tEMAOAjzK9H1ASUfIw1OaQhkY0BF7AC
oRG9dk+druUBEgQuAtF3mv4ix87m08XlaWd3ceJFqFWLhnubI2mEw7mMSqmxyKEQ
t+9ncwVF8z15AyhTyp34bVCkz55q7WC4t+qwgSTIgLhj4BZFjJZcKLmNhz0NsiTG
0jgMQh1QxhdOob6MppRYPfDzWgS3lg==
=ZzHq
-----END PGP SIGNATURE-----

--zdxv4cgborwrwqlm--


--===============2700353006160369584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2700353006160369584==--

