Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DB3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Feb 2022 12:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AG+SnIWjJMDYoTUUpuUcjAWfwDzY5vU5Vvp54YUrYIY=; b=WR5yxcQtQ4K5aMz1X/k7gqjP82
	KhxntTODjmXEgC23PzINaXlk7ucdmvjD+gjgA7K2VIKrHBFky5XAdWojyImknj8mbvEfYt/zxEHpX
	WxO4iygdhuCN5V2kdz60jVtVWFURCvbllOQH+cR3ZMG4mF9CAizVcsGIkFtHLs2MRBCkB9bKJd0HJ
	cbIxftDCsJZr5hfsBl177OQNbQfiJ2t5TTwgv0e5TC4z/nZQd2rMUkhucS2x1fZcAwibLm5Yf2xiA
	hMjbtp8CpD4jFBR3bUFMaFjug2Ojkf1hslqE0JO/Woiz5m8O7vqZl0OBVhQO6MrW3Rp4jYD09iRYt
	eHgm7ufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPSB-00DjUy-TI; Tue, 08 Feb 2022 12:18:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPS9-00DjUU-67
 for linux-riscv@lists.infradead.org; Tue, 08 Feb 2022 12:18:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4CC40B81ACB;
 Tue,  8 Feb 2022 12:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58648C340E9;
 Tue,  8 Feb 2022 12:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644322714;
 bh=+jhBmsQwTJRGwAwlQW6FTGpVyZorlTh6XXyLTNZaKtM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jGFn+QhLelOPYfhz2FlG8XDs13dxBkoE4Sze6DbEgt+XrSfcByVQnWMlOj75yGkhi
 3yPz6zATvF1nsQbiYOJx9JZa2NZ5oH9zkLywt6bbgEiZb+iH3nDH4YfdjnAGdwVNIf
 BbsdjCtUVoGVyuXLer7OHfpeFRRx1A4ktMyRfNKQ8Ru0eEEcLfs5JvY94yhUP4G6Qr
 au2zYAK55xnxMVNnfI/MFnvs5YceUHT17Jq0jB9WZb5gFKtUruw4i8fnZNNWgLPBxp
 6Xo6/B0qhxeh0wgKvEX9chUI+ldjJ1TDtT4wxmeAgjCGuRG+wmItthm/7gIaYe9OpV
 gBy8l5vbATDMA==
Date: Tue, 8 Feb 2022 13:18:31 +0100
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
Message-ID: <YgJfl5CmepRMb5He@ninjato>
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
X-CRM114-CacheID: sfid-20220208_041837_539549_AB8F14AF 
X-CRM114-Status: GOOD (  10.82  )
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
Content-Type: multipart/mixed; boundary="===============6073673753717739291=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6073673753717739291==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sdYSIm6VkoPV0MiH"
Content-Disposition: inline


--sdYSIm6VkoPV0MiH
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

Shall this go via DT (Rob) or I2C (me) or some riscv tree?


--sdYSIm6VkoPV0MiH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmICX5MACgkQFA3kzBSg
KbZzxhAArSdMKMsyP4zt6H3heN8FNENRNOKYegpVuGgnCzbtLbitNEQvjx0Z9HdF
BUbaytztYIVoDstV1SxiWczUikuOQ7pQ2TB585jhzhF7FATjt0zqIr22/ATEBmN5
nUNlnWMt5s05zgcppQyksrVddYYvgs+HqtTCNXCk6LOz0qC54dxze8766ageQYPz
1gBy5cDmJrUMJ+X8JnveuPgKv4BrZgGKZsrNgHy5dOAdF0B0WyI4i/uv2YTq2y+o
XIOA/B60tgZtIWkWWcFNPIE+TQQIDVY93O2R3i4gAvCfwYVqyRdtG5i5p3eK74RM
LwpTEv6SJE5KJ0pxYmo5SP4AKsMaN7Z6ePga6LQz2tPETjhKNZixntc/KsoIPXQJ
sQ025iG+3stSKxpnpWg/VjqM6ugoDQOX+VvsxFe34KjtmbgRYTROfxHY173+TfVb
hZb+CYNHbDxl7/gGHkXlsbcNC6sSZq7qvu0ZeCXPvq4nzk1V0KwKPGLocQaTrGVo
qNHIjEnA5CeIu8y5fF7r26769safY0B9chLwsxXWujW3WSHY3FYPmRDMtX89sVhr
WxlPZDxBvIv16LQjg4lXWLrTsgkUaVU2xiHe8gd+gulSVMgKeeePSkiU4fKgonRj
+KJRlq7MvI0G5Mdb0F3PNIHoq4R/P8FYBNmGgRmjvIxBNzggd2M=
=TDLj
-----END PGP SIGNATURE-----

--sdYSIm6VkoPV0MiH--


--===============6073673753717739291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6073673753717739291==--

