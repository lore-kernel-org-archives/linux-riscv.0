Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14276C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+Es6NPXOV7o7pGMSjtG4GJu5/sJ0opro1IIi4vD84g=; b=mBevKXOKT7H32PmfBYXIhQafzZ
	JY1wsTDq4SEmY4Xg3nnf6HZ6oFahBJ3L/uCcsGHMdfOpy45+a6G8PtcNA0GClYnXIEXVymQ/2AD+6
	phrXtMKryUyK54yGi/CTF8M9LqScYBHJY/aZVo/Ty6AVducsVfEucaTrHdjPAjYvOQp6qro9Hybvt
	1jEiw3Qm4uyXsGrzDMozSQQ0bWULPEa3BGw/cR9YmQ4Ovr5M2dqBaOFk0/5bkWWTpp90Ffdqk6jtl
	MhJBu86h7alfhTozmIFxzdWvjnJRljRvasdXhppi4fRAGOdnTpuF//Zi3w2pUwWN5bF4Sg6T1QcRb
	hpr8SC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1to2-00H8gv-MS; Mon, 27 Dec 2021 17:29:06 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tnz-00H8fR-GM
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 17:29:04 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1n1tna-0006qz-7p; Mon, 27 Dec 2021 18:28:38 +0100
Received: from pengutronix.de
 (2a03-f580-87bc-d400-8412-c786-637d-2154.ip6.dokom21.de
 [IPv6:2a03:f580:87bc:d400:8412:c786:637d:2154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 39EF76CC499;
 Mon, 27 Dec 2021 17:28:21 +0000 (UTC)
Date: Mon, 27 Dec 2021 18:28:20 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org
Subject: Re: [RFC 17/32] net: Kconfig: add HAS_IOPORT dependencies
Message-ID: <20211227172820.hbxdrrkyezdzrlr6@pengutronix.de>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-18-schnelle@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-18-schnelle@linux.ibm.com>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_092903_566486_F9F261F2 
X-CRM114-Status: GOOD (  12.26  )
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
Content-Type: multipart/mixed; boundary="===============8658463906162725285=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8658463906162725285==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="245rarqcf5vldb7b"
Content-Disposition: inline


--245rarqcf5vldb7b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.12.2021 17:43:02, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=3Dn will result in inb()/outb() and friends
> not being declared. We thus need to add HAS_IOPORT as dependency for
> those drivers using them.
>=20
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/net/can/cc770/Kconfig    | 1 +
>  drivers/net/can/sja1000/Kconfig  | 1 +

For the CAN drivers:

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--245rarqcf5vldb7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmHJ97AACgkQqclaivrt
76kJwQf/YZuHeaxAaIqpnKk5ebNRkZaiADk2wY6053aiOFrchhX+W6rdKv6mgiIg
f/nVGw6D52LCXz7TTZXQn/TUWv+CUMoiLLHANURD4f5qkVSjryI/mAFmnKnm0ip7
abEryjHc+LdLl+zuBJEuD8nkvhV6MOa5WoYxpyBpMHWmK6zlXBV70Qcv+RNmuaQK
1KHD1nNELUM2F5TIFM/Z4F4uEO2BWNnXCYka5fwi96xzKx3m4ExMDh04FyQgtVW3
19YmDZuME6WOFaJMjK0VBXd+pj7Jt1lqVJ7Uf/pgKhvNAnv+mY6wsKKyHBz/oxDi
HZ32rax5tItZ6xQs547v/SVqFrAQsg==
=pAuN
-----END PGP SIGNATURE-----

--245rarqcf5vldb7b--


--===============8658463906162725285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8658463906162725285==--

