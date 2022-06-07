Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A63C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 07:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om30QV30vui/vdWKl2tgbA7BDIlQFAuVMjOZWZfL2/s=; b=MRcu9WtV0iGQXdhe0YwE0JIoPF
	pc/qZrrkomFWF41qtVCqOKy1prnwAlDT03pWfOc/eR76RJhAQP2CfuOT0pt+Zx+oiGSIIDYScgryS
	BQmv60L61YVGdemAYsZJ/EDoxoR8RavFrWGK2QEAZgDyvmKWv7LZq9OGJgAUrfPeStO7SwKVp4Jaq
	p+sEgWGsqBwKqrFP0srDuiLo340lqbOHsH8XBR61TiNV/+DepzmYaeSDh4YYmPK/0lNOwgmWCddD3
	4uZCQA56Q9qFCorybK6Jm7+xK5WnXPWXTdFLoLTrweuifJVJiq8HNJ7G4iLgpZhTnlN+mUpY3e+e2
	61yFcPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTRW-005Nrf-Rm; Tue, 07 Jun 2022 07:15:58 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTRA-005Nfa-Ng
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 07:15:38 +0000
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1nyTQy-0002zY-S2; Tue, 07 Jun 2022 09:15:24 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C17DC8D788;
	Tue,  7 Jun 2022 07:15:20 +0000 (UTC)
Date: Tue, 7 Jun 2022 09:15:19 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Wolfgang Grandegger <wg@grandegger.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next 0/2] Document PolarFire SoC can controller
Message-ID: <20220607071519.6m6swnl55na3vgwm@pengutronix.de>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220607065459.2035746-1-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_001536_801142_4F56EF42 
X-CRM114-Status: GOOD (  12.07  )
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
Content-Type: multipart/mixed; boundary="===============3376057570663390190=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3376057570663390190==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wmxu3eossejojdgn"
Content-Disposition: inline


--wmxu3eossejojdgn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07.06.2022 07:54:58, Conor Dooley wrote:
> When adding the dts for PolarFire SoC, the can controllers were
                                             ^^^
> omitted, so here they are...

Nitpick:
Consider writing "CAN" in capital letters to avoid confusion for the not
informed reader.

Is the documentation for the CAN controller openly available? Is there a
driver somewhere?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--wmxu3eossejojdgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEBsvAIBsPu6mG7thcrX5LkNig010FAmKe+wUACgkQrX5LkNig
010mGwgAsk4h1zagYu60b6rZjltdh82vMaUZuWWlhOtLWxaZXbgHboLYurlj7gq3
dXxVDkrAByE6WcaAkKCRdUSGV66X+amInYdrRsvG9wfESbX001Lj3XdwyL97XI8g
WGs4T0e0dhR/EjU0Ap8YZh3KyIs9vyfLzACRVWyRJhLQXz2KLtWMTa/QGzAd9hQJ
j4vT0fIesQFuh1qxqZw2eYUxpYN5o6aysm4/qfXJTIVIn9Y03jwPcRVWFWt+GiQl
xirOrt/V5cw72EE02V0IWnmKT7fylD3HgTrwgyAInguTharRV9WZYhXttUwQc+Kc
SFIA5n4bQb3DdGldoJGkkCUDJPAT9A==
=epBJ
-----END PGP SIGNATURE-----

--wmxu3eossejojdgn--


--===============3376057570663390190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3376057570663390190==--

