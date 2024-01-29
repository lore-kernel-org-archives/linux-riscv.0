Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1924AC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hW0C/T1E/r0Ebc+iZJVD5TR+OYFHeB++fIg53R8lfE=; b=bW0WN24DCucf4G3F9ZCsOm8jYV
	Cs6WvQ+CkpdfWJa2TQ8ucych7tZ/yO6+3C8mz6dBtQ2eZls4LC6/c8NCZOCnDbgbUOWpZWUc+QeJV
	NOgvOaDe+Auk5YixcZg/M4ZdUt1bTouYA4nj4lDoByo3+LA60BYq6EVVj1v19BrQJUr+P3Fkh2oQZ
	gR/iuyODLujGoPaqzEl28U1IKqZuKyGfzKaktq4DnJMis4YsPAGofhiZRnOrAn2y4I58Ynnkyq1Io
	/DdTvwkyxE6r0AB3/U0CXCmOkmAyAr0hiyZ7MJN0h6iGf0gdI6umZOfYjQZZAo+kLFeJCmAsBODVx
	t3fXUWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMyC-0000000BlYw-1Gur;
	Mon, 29 Jan 2024 08:26:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMy9-0000000BlXz-27kt
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:26:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUMxz-00071K-Tv; Mon, 29 Jan 2024 09:26:07 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rUMxx-0037so-TF; Mon, 29 Jan 2024 09:26:05 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 72691280715;
	Mon, 29 Jan 2024 08:26:05 +0000 (UTC)
Date: Mon, 29 Jan 2024 09:26:05 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 3/4] can: cast: add driver for CAST CAN controller
Message-ID: <20240129-zone-defame-c5580e596f72-mkl@pengutronix.de>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
 <20240129031239.17037-4-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240129031239.17037-4-william.qiu@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_002617_586380_FA3091E1 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Type: multipart/mixed; boundary="===============5107007637981449743=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5107007637981449743==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zggniggrx7ssk34l"
Content-Disposition: inline


--zggniggrx7ssk34l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello William Qiu,

thank you for your contribution. I've some quick notes about your
driver.

On 29.01.2024 11:12:38, William Qiu wrote:
> Add driver for CAST CAN Controller. And add compatibility code which
> based on StarFive JH7110 SoC.

Please add yourself or someone else at starfivetech to the Maintainers
file.

Please use BIT() and/or GEN_MASK() to create the _MASK enums. Please use
FIELD_GET(), FIELD_PREP.

Please replace the ccan_ioread8() by a proper 32 bit read and use
FIELD_GET to access any non 32 bit value. Instead of ccan_iowrite8() use
FIELD_PREP and a proper 32 bit write.

The enum ccan_reg_bitchange looks very strange, why do you have OFF and
SET values?

The ccan_reigister_set_bit() and ccan_reigister_off_bit() functions
looks very strange, too. I suggest to use a 32 bit read, set, clear the
bits followed by a 32 bit write. Having set_bit() clear_bit() functions
may lead to more register accesses than needed, if not handled with care.

If you think the driver absolutely needs bit set/clear functions, please
follow the name and signature of the regmap_update_bits(),
regmap_set_bits() and regmap_clear_bits().

Please use can_put_echo_skb(), can_get_echo_skb().

Please implement proper TX-flow control. Stop the TX queue, if you HW
queue is full, start the TX queue once the HW queue has space again.

Consider using the rx_offload helper

You claim you IRQ handler works with shared interrupts, but you return
an error if there are no interrupts by your IP core.

Please enable the clocks during open() and disabled during close()

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zggniggrx7ssk34l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmW3YRoACgkQvlAcSiqK
BOgKmgf8CP4DHYvozr25yPE/15GRtr4yDQDy5doYFxV8tAO2r1Y1iiU0mIz3aCLp
e3qWwbV9jcftKht75T5CgcurR8Ouc6P4O89HsGkpyRz0c4Pg4X/gswBJ29hTRFQw
JyaxQCaelQ5mbSAq0i2ZFCNiqBEzk6KyegUcmUabqOHmQTlpcXRYiJWRgKlKMoHr
xjkTF4HgTcViIXb/JislwP7q8C4F2/qEEtSLfqgOCzZjaPSRP6cTo8yy+YdITFhx
ntGdaMLEktRyMJVCcMfk5TXzea45E7yCa6cLL/4+VNzm/dsB1YF7Si9CC/nTXP9U
G5qmdcL6AIGzthY2poRxdC/oX7ppgw==
=HX7Y
-----END PGP SIGNATURE-----

--zggniggrx7ssk34l--


--===============5107007637981449743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5107007637981449743==--

