Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5C7C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6B/V1LlD1dIdUKmJDsCpDHPiGsYTjZZ48a5BZoxLFo=; b=tKynBs4Fw0uV5xmTUgIrrNvpHQ
	L21wbIqoQB2e4kM1pR8XfEy1TBP7hQT/z0mtbK1yi6L62sofSOqRfmhT5Oz4/Kp8LQz+64QZowSYs
	6s174SglzrauG3qbk9Y2B95SGRe8inhF05YarrFrJaYIVcwz3eWMr5eUK1AQ2UewqQp6JqsA4fYhj
	2qCqCAIHPTELDzRwJ9r+mcXXNJbNshAlsn4bIAIpOmPpiRUaAvU45d+dLJ6nKJubs+C0h+X7uYVzm
	+1nF1R6hVKaG2thXnLcKhNL/JZAZMmtcSqln2BmlI4nejlenWJItXNK6WA+AEZ7Cx0K8dh6OqIxya
	LPsKVFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeUW-00G9jX-37;
	Fri, 08 Dec 2023 17:18:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeUT-00G9j9-2j
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:18:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rBeU9-0006oS-Lt; Fri, 08 Dec 2023 18:17:57 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rBeU8-00ESyf-8k; Fri, 08 Dec 2023 18:17:56 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CB34F25EAD8;
	Fri,  8 Dec 2023 17:17:55 +0000 (UTC)
Date: Fri, 8 Dec 2023 18:17:54 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v1 0/7] MPFS clock fixes required for correct CAN
 clock modeling
Message-ID: <20231208-atonable-cable-24ce1ceec083-mkl@pengutronix.de>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
MIME-Version: 1.0
In-Reply-To: <20231208-reenter-ajar-b6223e5134b3@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_091817_903432_7CC579A3 
X-CRM114-Status: GOOD (  12.58  )
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
Content-Type: multipart/mixed; boundary="===============8892452411927379650=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8892452411927379650==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xyc7h6dsb2frvsw2"
Content-Disposition: inline


--xyc7h6dsb2frvsw2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08.12.2023 17:12:22, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Resending cos I accidentally only sent the cover letter a few minutes
> prior to this series, due to screwing up a dry run of sending.
> :clown_face:
>=20
> While reviewing a CAN clock driver internally for MPFS [1]

> 1 - Hopefully that'll show up on the lists soon, once we are happy with
>   it ourselves.

A CAN clock driver or a complete CAN driver?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xyc7h6dsb2frvsw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmVzT78ACgkQvlAcSiqK
BOhBxQf7BYrhkxcGONNExkw5pTvSe2aLsApA8F4gr/MdexrCCcTenD7cTeiajOzK
K0oLIoWt5Gu2YpWLNf9rl6YAjTSMel/sbvSpwi5VpC0sJXtQ6snB522S7zB40dBX
DlV/YH+cIaYauSFFcCRGD/SBAKdNn24jn87i/lG4Ban1OXDZ979dRxwqZC+OXhJ+
E4noB9XsO4EalZtLDH6R3jKxTUmEgh43ic9c2v73S0tJO4P8v3bEWocQoManBJsa
09Lk42+pknYNywmrtNJnzBoJ5CAm5DojiSVBRmi0/3VTcOZDulX+1rY4+BeDFtG7
CszXgKFkjG9kv7z0kmuxK0NANfvGxw==
=7yOt
-----END PGP SIGNATURE-----

--xyc7h6dsb2frvsw2--


--===============8892452411927379650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8892452411927379650==--

