Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B55C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Dec 2021 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66CRu6PlQdbRoeYo2tVSw+9xwwkILmb8z7tJgXbF6sg=; b=VCFg4UsUyRrC1alLk/pWUefN10
	XD/C7UjJ1IFUbjUoMJap6myl7GSJo5RStcA7jQZihr1uz4O0qXjB2sNXEY28NY1iLDcyxuEz94hCZ
	whP7bCrD7sjKWB11HYpfpzjRz5YEp5vRk2ESi4Ai5ajf+PYEWE3B7HW2xod0g96vdYXonvo0bStfY
	TlpNCNDqs8GxmLIhSbacoXGxW6eWtUhR3p+ioPuiZGD9cRLgZZX6MqkOhVBr+IHuRiFyPjft6GPzW
	2Bq3EAfeZO0NllpmFCK8HZmiqlKMmoyd3Y1Qw/CNIbNUHm4GBDGZC0Ct9xckq8miC4kMxvyWMd4Zm
	kyDcqPfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myBei-009vYF-5O; Fri, 17 Dec 2021 11:44:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myBef-009vX5-MN
 for linux-riscv@lists.infradead.org; Fri, 17 Dec 2021 11:44:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 212856210D;
 Fri, 17 Dec 2021 11:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E106C36AE8;
 Fri, 17 Dec 2021 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639741444;
 bh=N4SLJbonmm8jBnFacqm9G6G41H3dlxGpaFVouOO8aLE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Aijgx0ZIQWQAeb7gNbL6SpclY57lW1QH0Tjj3lrF/XSwEDWHugwzvn5/s/1FKJOQZ
 pMfarvCtO2n6TMepMbTJta2l2d2dBhZ30HsQGQnNMkZbX+M9wjvCIP45pe7ip0Jb6d
 t1L4C3jdIyEZW4kIbK3N3eDfMSl9TMsVzWRs1icIJfjNRHDeum0xEfwgvz93MG4d6z
 awp9XipBLcVyB2cWVHPejEh53NMcYLIPkxvC2cJ0CCKJZ+uBhrSnAe/auux+I3KTD5
 xFRHR4vdmElgOxACGGACl9xld/yXnMVUL0Yvx2S8kxsPIfrWy8hEFEej6h92auURX4
 Fm/jKx8mARyyg==
Date: Fri, 17 Dec 2021 11:43:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Conor.Dooley@microchip.com
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
 Lewis.Hanly@microchip.com, Daire.McNamara@microchip.com,
 Ivan.Griffin@microchip.com, atish.patra@wdc.com
Subject: Re: [PATCH v2 10/17] dt-bindings: spi: add bindings for microchip
 mpfs spi
Message-ID: <Ybx3+3QaVe2lCcQP@sirena.org.uk>
References: <20211217093325.30612-1-conor.dooley@microchip.com>
 <20211217093325.30612-11-conor.dooley@microchip.com>
 <YbxxrlmYGC3Pg8+j@sirena.org.uk>
 <606633c8-6cd6-af3a-4d6a-bb3058a64026@microchip.com>
MIME-Version: 1.0
In-Reply-To: <606633c8-6cd6-af3a-4d6a-bb3058a64026@microchip.com>
X-Cookie: Pause for storage relocation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_034405_821657_BCA42057 
X-CRM114-Status: GOOD (  12.36  )
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
Content-Type: multipart/mixed; boundary="===============8100018702968572669=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8100018702968572669==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AfGRrf1crhTWT0mA"
Content-Disposition: inline


--AfGRrf1crhTWT0mA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 11:40:29AM +0000, Conor.Dooley@microchip.com wrote:
> On 17/12/2021 11:17, Mark Brown wrote:

>  > Why do you need this property in the DT - isn't the number of chip
>  > selects in the IP a fixes property?

> Nope! It's an IP that's intended for use in FPGAs so the number of=20
> selects may (and does) vary based on implementation.

That doesn't explain why the number is needed in the binding - why do
you need this property in the DT?

--AfGRrf1crhTWT0mA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG8d/oACgkQJNaLcl1U
h9BGLgf/SiqoIpPFvZymGI+lV8cyTUm+CuIWdAYRxHOotUpqpCdFDWSt6ungnucf
L+CKgnigBiPYJ3jZs9yRuC1kaIDnha4hNFuGs8nlVgdVOd5k+PhGI3B6Vtz9sjv7
UKnkHSHk7yEcMB1CKjrgWDs5d7dcaA9vwNNrQNLd0TaqtSPR8VPUuW4uM1/gPVbt
g8MxN6GRUTiGKG8GIAVFXNQ1NFuGXti9FrbYZHelZQM811Gjua3bqRY6RfPGoaSu
2AudboDMa+HNohXPvKaRolBubzwtXw2zX3GABTZSHaG9/X/3C9LeJFR53x1Avmib
ak8CKqa7Sou8MLRP9OiktJGz1dPYTA==
=9ef7
-----END PGP SIGNATURE-----

--AfGRrf1crhTWT0mA--


--===============8100018702968572669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8100018702968572669==--

