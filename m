Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FB6D33992
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWoD/TL9N8tTVReuzCbc5IdHabkWMQpXasmZFElRt24=; b=WsMfFYVWt4Y5ezIKJQDX+9Xrrc
	vHRxiA/IBwAJQRR51+w0pnwTUn5ZxxqhyYCh6JjPrG5BxStO5tyBcFg73yGSKG2UVuPJy6WS9shfL
	6Gy6KtHcKrWOe4817aozewTdSB0k3e/2UuywD+fribXcBBrCq5q5KP9+zYbEyG95ZtXbRLHXDRwvw
	AOK/y5w8xk6OsEPdKNH0VCgrNM94joDJqj2i0k5CFmgJ+RadMV24QHLBT+uHtt+ucqhwS4Ldlh6Ex
	14TGt/kSdfK8x0+r3d+HBQcUfd3WMgZGrwr24RsmrX8P1CxMY7o2meHpDT+DNB3MMzl4IxdbDZCfU
	bIBlZ8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Quu-0000000B9iP-0cxR;
	Mon, 28 Oct 2024 14:40:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QZZ-0000000B5Rc-3RuR
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 14:18:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5QZN-0002bl-NX; Mon, 28 Oct 2024 15:18:09 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t5QZK-000s76-0y;
	Mon, 28 Oct 2024 15:18:06 +0100
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D06AA360975;
	Mon, 28 Oct 2024 14:18:05 +0000 (UTC)
Date: Mon, 28 Oct 2024 15:18:05 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	William Qiu <william.qiu@starfivetech.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
Message-ID: <20241028-great-worm-of-snow-494fa0-mkl@pengutronix.de>
References: <20240922145151.130999-1-hal.feng@starfivetech.com>
 <20240922145151.130999-4-hal.feng@starfivetech.com>
 <cf17f15b-cbd7-4692-b3b2-065e549cb21e@lunn.ch>
 <ZQ2PR01MB13071A093EB33F48340F753EE66F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ2PR01MB13071A093EB33F48340F753EE66F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_071821_882079_8E4A150C 
X-CRM114-Status: GOOD (  22.82  )
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
Content-Type: multipart/mixed; boundary="===============4305591929303849588=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4305591929303849588==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d6ye2orfo4iuw6ou"
Content-Disposition: inline


--d6ye2orfo4iuw6ou
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [PATCH v2 3/4] can: Add driver for CAST CAN Bus Controller
MIME-Version: 1.0

On 23.09.2024 07:53:24, Hal Feng wrote:
> > > +static inline u8 ccan_read_reg_8bit(const struct ccan_priv *priv,
> > > +				    enum ccan_reg reg)
> > > +{
> > > +	u8 reg_down;
> > > +	union val {
> > > +		u8 val_8[4];
> > > +		u32 val_32;
> > > +	} val;
> > > +
> > > +	reg_down =3D ALIGN_DOWN(reg, 4);
> > > +	val.val_32 =3D ccan_read_reg(priv, reg_down);
> > > +	return val.val_8[reg - reg_down];
> >=20
> > There is an ioread8(). Is it invalid to do a byte read for this hardwar=
e? If so, it is
> > probably worth a comment.
>=20
> The hardware has been initially developed as peripheral component for 8 b=
it systems
> and therefore control and status registers defined as 8 bit groups. Never=
theless
> the hardware is designed as a 32 bit component finally. It prefers 32-bit=
 read/write
> interfaces. I will add a comment later.

As mentioned in my v1 review, you are doing proper u32 accesses.

> > > +static int ccan_bittime_configuration(struct net_device *ndev) {
> > > +	struct ccan_priv *priv =3D netdev_priv(ndev);
> > > +	struct can_bittiming *bt =3D &priv->can.bittiming;
> > > +	struct can_bittiming *dbt =3D &priv->can.data_bittiming;
> > > +	u32 bittiming, data_bittiming;
> > > +	u8 reset_test;
> > > +
> > > +	reset_test =3D ccan_read_reg_8bit(priv, CCAN_CFG_STAT);
> > > +
> > > +	if (!(reset_test & CCAN_RST_MASK)) {
> > > +		netdev_alert(ndev, "Not in reset mode, cannot set bit
> > timing\n");
> > > +		return -EPERM;
> > > +	}
> >=20
> >=20
> > You don't see nedev_alert() used very often. If this is fatal then netd=
ev_err().
> >=20
> > Also, EPERM? man 3 errno say:
> >=20
> >        EPERM           Operation not permitted (POSIX.1-2001).
> >=20
> > Why is this a permission issue?
>=20
> Will use netdev_err() and return -EWOULDBLOCK instead.

You have a dedicated function to put the IP core into reset
"ccan_set_reset_mode()". If you don't trust you IP core or it needs some
time, add a poll to that function and return an error.

Then there's no need on ccan_bittime_configuration() to check for reset
mode.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--d6ye2orfo4iuw6ou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcfnRsACgkQKDiiPnot
vG+52Qf9EYytqiZDcw1r+TVbTIDJoUzjC6e0XKFkbT2/IBKG1usCbI8BwlKdXwu+
uIU8xA7v62V41WBLyNHAXgeQTnjy1aNsMRUi8pJxVADI/PS91RzdWQXcHb1h6HPQ
HfhJvmk0/nz6CFOXoIlPg9bwm2uB7MxPIS3y/aZ7Mo0e6vW5ChjtcmMXW9Ma/u08
CrOsC92UX2ERW3o9nVhGqTgeKAFxiagUZMYFFMkqCDn1Pzas1EhixcpMmgbtff/q
4cesN3k0tY37qg279JvVVBZhCDcbE2ueHSxjHwITsVxKvsL8HdWp+4c5o48EP3kD
QQd+hao+9llKWOEpwduz8XmDjq3W5g==
=TefK
-----END PGP SIGNATURE-----

--d6ye2orfo4iuw6ou--


--===============4305591929303849588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4305591929303849588==--

