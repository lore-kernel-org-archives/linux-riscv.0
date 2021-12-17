Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C9BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 11:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApYSGqwf0PeOCC0GO2oGd07uJNB+xhrFJcn/onY2ufc=; b=axukgDhx2xVYOEOsCVURsnOAZd
	K6clkG5LfewTLFQfqjbVvThKVSiDB5r5plWFpUovjaUgUaRLqBG1/sHH+0NBZavcD0XYb7av3MUX+
	F5aUCpChqvTlhEvsLnpzO0TMZuNMQN8DsKo7auO6qM1pe26Uu61H6aUAps03LWO4WQ1YcNS9yeU87
	8dOMesHCJL1+TZpjcsJR9kJlMxidY+JWjzJ7kq375Fb06p4UAVQ1H5hPhRiEAmNr72H9XlubRPmFa
	nOvT3uiXoTlM8eZcMD7M3jjk0hiD9MHXhQ2pBasio2dXWimKK7uaEe3RVYoQp5WfM4PdmbZeoQj8X
	1AuzqgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myBEi-009jwT-KE; Fri, 17 Dec 2021 11:17:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myBEf-009jv3-G2
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 11:17:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8404A62109;
 Fri, 17 Dec 2021 11:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D67C36AE1;
 Fri, 17 Dec 2021 11:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639739832;
 bh=ciizNTJo2wPqNMTxwzDgqHE9JK7q6BV7T+/75cIK56M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nH7GUf5F3DdbIGiqXCbnIQyD6+vj31l6eJTYTXkZyYdWZoHhsGxPu4tRNKxlWgZBX
 1ze42PlgXL/aWXptLdbCn5f9HSAC53k+hN0RkIvTLbpvxCRnLwGFeM2vD0p1cIGNaB
 gs8YL04qGH3GTJLvfI2ek+S7OQ8aC2dgfv/1hNnoQI4w6YhlSNBxU641nNJR6a98di
 CwBjTaadjj4O44/xKIhVmPGlEk2w6umqHhZrb/PaswwDz57nXUIOga54rbiUgEgzX/
 Zq18ObE/m/NYLmLyCNhTX38sTKP4+C/1QvnC9bbb3CDSATqbdJLmaw4qopPC8CPJn8
 DxYqpFpEuWEmA==
Date: Fri, 17 Dec 2021 11:17:02 +0000
From: Mark Brown <broonie@kernel.org>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, gregkh@linuxfoundation.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
 lewis.hanly@microchip.com, daire.mcnamara@microchip.com,
 ivan.griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Message-ID: <YbxxrlmYGC3Pg8+j@sirena.org.uk>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20211217093325.30612-11-conor.dooley@microchip.com>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_031713_668254_8567284E 
X-CRM114-Status: GOOD (  10.92  )
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
Content-Type: multipart/mixed; boundary="===============3037943136210294152=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3037943136210294152==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q8nNbUqDPNVQRYrB"
Content-Disposition: inline


--Q8nNbUqDPNVQRYrB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 17, 2021 at 09:33:18AM +0000, conor.dooley@microchip.com wrote:

> +  num-cs:
> +    description: |
> +      Number of chip selects used.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 8
> +    default: 8

Why do you need this property in the DT - isn't the number of chip
selects in the IP a fixes property?

--Q8nNbUqDPNVQRYrB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8ca4ACgkQJNaLcl1U
h9CSxwf/ej8wQ0M9Gd+7rtUHtN3BktycYB5ZcTYF2vBKdmrv+nxD7gkrKJ55D3X5
Cq+ccL5v/vEk+7sKFZDtqt1Ro8Nb9xlge9lerzzE9UpRB47Aem2ixXy9LVkDSvJ6
3DEHtrwqqn5sAy0uBgRXNfc7FnGajIjLdBWKBER6cRrUIjaW8laQhkGE+cWq7xVl
vyhFYVIE8g0ffymZ6wCt/sLil+KhtZ5D1po3U0Gkdqf7UGxGUA1a+3mJT+zcoTXy
YDuBPq7dAbVXNu3HjAU2k127FTYkjzI/e7vvit4/0WKNqvUch0E8H0YoTki71DJe
pLmu1B/yykOCwy/UuX1wQ1U17x2Big==
=n9Eh
-----END PGP SIGNATURE-----

--Q8nNbUqDPNVQRYrB--


--===============3037943136210294152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3037943136210294152==--

