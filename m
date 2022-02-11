Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0152C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 17:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g8sSodi7JUeyi1Aye0a025HSMwYUZvOKUfEHULJY2Q=; b=bCawSVybAvYlW7IZqMywo2kAhW
	xAQW3rjub0laQhOQtKrK1oqsovV6+4dyG392YvRccxltXbeNma6D7yY2PkGzG9BFBJ23uJBfNCrXZ
	+D5+Bvg5k2ghgNG/Qtr61ENLnvW9p9VxiO/PFxVm65YenpgrmMPqUtN11H4EbfuSvvy9HVD36LMMM
	VUtiNZO5teaRdYES4Z7bqDv5D9Hfe8dC0sZFm9RrbsFGPj++ij6cgba4zcijrau+qs89SFoUtS9F0
	GWsNMCD63vaqsGeJLz2BDWSRHim95iCvJ7QvP40BNzmOhbpr7ndlHehkY2uDMK+1NdAkhuBfaaMo4
	anB9ZRkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIa79-008HeA-Bf; Fri, 11 Feb 2022 17:53:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIa76-008Hd0-MP
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 17:53:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ACEA461CB3;
 Fri, 11 Feb 2022 17:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25105C340E9;
 Fri, 11 Feb 2022 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644602023;
 bh=j9io4CjQGVmdKTFgkV+LOFNgAGw4pDMvV9VClqq4hNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ImbAKQ08m0iW6t5yD2Mda3NMteEnVLoMuQgQ9UKKJBNvanJ3/fCwzKuSQpoxUEkQa
 ktg9R1F0JLd6e+rr8mc7dTEn04rO2kXUN2uRdwMHVAJE3yMr43XizMt7NuK5G7VH+9
 8GfrijmzRv8mfDxeW6/TihWh+owSsDtaaDV9sW328/dhe9p1Q/pfHcgL30pWCUn5eR
 eyY68igzE9qcTQ7gkMtwDz5X0gIvSqFpdcYiDi2we5kkwIcat9jzx2tyMNniWMKx5P
 kRi8O7OKyWyHl3FkQeV0DdLyBqT0EORI3+MFh3iAGR74ZkAWEOSPYaaDcesD4bdla2
 vY29d+PAfi+/Q==
Date: Fri, 11 Feb 2022 18:53:38 +0100
From: Wolfram Sang <wsa@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, bin.meng@windriver.com,
 heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v6 03/12] dt-bindings: i2c: add bindings for microchip
 mpfs i2c
Message-ID: <YgaiorHf7/Za5vib@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, conor.dooley@microchip.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, bin.meng@windriver.com,
 heiko@sntech.de, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20220207162637.1658677-1-conor.dooley@microchip.com>
 <20220207162637.1658677-4-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220207162637.1658677-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_095344_828748_3242329C 
X-CRM114-Status: GOOD (  10.19  )
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
Content-Type: multipart/mixed; boundary="===============5110798414171175978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5110798414171175978==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jVl1itNwmbBofVyK"
Content-Disposition: inline


--jVl1itNwmbBofVyK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 07, 2022 at 04:26:29PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the i2c controller on
> the Microchip PolarFire SoC.
>=20
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Applied to for-next, thanks!


--jVl1itNwmbBofVyK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIGoqIACgkQFA3kzBSg
KbY5zBAAky+SkyXA2LOT59kq0mn8oO/pzp+w/OnfTlN/Dn3GgC5ljGVYLc8MECQ/
Q2KKs+hINDGYIlDYCWxrDTQqNtaK+j35bY4m5uXiWFZWA7p4kMkOeaHfRVrbyg6S
b7XaVq7myEkDrO+Xfw2MGxyJTLksSq0o7Ql7g4mSZkPyDYNycT/JUTyb5ac+D/pD
yN/GK6kgiUvWeYrRCueJCTzYzpgwEdGex0wVQaOXDGVwSPZbM/j9RlBrmw4IBEIH
1gToRHIKoLmbVx+MvyRACu2aRXUXhS7nPg9Yuq3Ftfge4RWzYhlzIITdcpSs+U74
iuQkSCkKr0J3DvMwDKURl4g1BiPsKODTgvvYp4Fkw1LUad4hNEPrnLbxgZP6HYB6
svl6Jy9aQoqQx5UeH1WHIBeRqzJlCKrr4HOCwuC+HIQ9//sqwd9OEIah32F1B+AZ
wl0VhHqHDBUOimTbhr5QrvrTNEn4U5f5+eLToJbaGKEcplkJXlOFQg3xqaYN8hdB
o/MAbfRWOPDYm/nXM+gK6LbXxCmhEBWgsqOeiOuC13RBOdiLyRNhl/tH0wd+e24K
IHvmbZwmDhaKQ7U6Al0aeCQDzwULEpRtIhqHR1c+z18q9tA33GDfg0ukH6URjaLa
PnbVeIhZNqyNmsa4P0nbDSjxqVhzZPiiPyEmAA/t0cFAaad37CA=
=9qL3
-----END PGP SIGNATURE-----

--jVl1itNwmbBofVyK--


--===============5110798414171175978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5110798414171175978==--

