Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C50C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 13:30:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5AFA206ED
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 13:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swrja5hO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEG8KeoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5AFA206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7VNegx5An36+pbZHwRXtlSY1UOUTcuIZI2OJ03TKYkk=; b=swrja5hORR+TpB97iUBoqSmYX
	/UWCuRmjFweVkIXmPsp0gSDJYBRSe+7E0wd/MDQDYYBlKlMh5tSLk3H0hLatDfPZYYEXXGmvXdXnw
	nkRs3Y4FJ0aiEULlwLf5sIAHcyYsfTZ/BfVa90dlz17qkr7imuSdnxfZQ58eRv/Oz0CVePnzVOwTL
	bfNK2ydyMnu6dEqJ6lcCg4/p/q8jmwqgLIM2s66Lplzfgcv5BzB0Atb1BttWH4uRbw7YXS6Eplk74
	YEdWmhgCdcdxLytk5JPazvpqwykW/eCnoGDdMt42hDDN9NcqzTcsQ5bp4p2D9z+0R59g0wGhufnAz
	4Y7rHDaFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc7F2-0002km-TA; Mon, 09 Nov 2020 13:29:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc7F0-0002ij-IV
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 13:29:51 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBC40206ED;
 Mon,  9 Nov 2020 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604928589;
 bh=uFEtIlKezOT9TIZTKmINrxsNQ5X+2p18rkvgsgVL0L0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PEG8KeoO1wg/M/IVLPzj/C7ZEL4s3Tsx4rRoTdy2l5sVppOCViz/ToFBMFM9h5eLU
 675zJRzfjOBHcbcf/fqIsV8GcVcTDcR8WetZMirDPxwSkOwPCynyj7c8zdLekufxcQ
 BsW8dXU9EUPjownhVubxXbCndz6dsSeLOCFKVreI=
Date: Mon, 9 Nov 2020 13:29:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 03/32] spi: dw: Fix driving MOSI low while recieving
Message-ID: <20201109132935.GB6380@sirena.org.uk>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-4-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20201107081420.60325-4-damien.lemoal@wdc.com>
X-Cookie: This fortune is false.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_082950_702921_D342FD89 
X-CRM114-Status: GOOD (  16.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============3346364022914302484=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3346364022914302484==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 07, 2020 at 05:13:51PM +0900, Damien Le Moal wrote:

> The resting state of MOSI is high when nothing is driving it. If we
> drive it low while recieving, it looks like we are transmitting 0x00
> instead of transmitting nothing. This can confuse slaves (like SD cards)
> which allow new commands to be sent over MOSI while they are returning
> data over MISO. The return of MOSI from 0 to 1 at the end of recieving
> a byte can look like a start bit and a transmission bit to an SD card.

If client devices are interpreting the transmitted data then I would
expect the drivers for that hardware to be ensuring that whatever we
transmit matches what the device is expecting.  We shouldn't be putting
a hack in a particular controller driver to paper over things, that will
mean that the device will break when used with other controllers and if
different devices have different requirements then obviously we can't
satisfy them.  There is not meaningfully a general specification for SPI
which says what happens when signals are idle, it's all specific to the
client device.

In this case it also looks like the controller hardware requires
transmit data and therefore should be setting SPI_MUST_TX and just
removing the in driver default anyway, though that will have no effect
one way or anther on the issue you're seeing.

Please also try to avoid the use of master/slave terminology where
reasonable, controller and device tend to work for SPI (though MOSI/MISO
are going to be harder to shift).

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+pRD4ACgkQJNaLcl1U
h9C5TAf/XbwBOxTibzpvLt8ovg4q6S5JE6AAQVhlhvghT7Yf7yrHRWjzb0yS6iYp
KQb6/34eaIvIS48nMgl+1nODQGH7gALefdHDVJgWJzW2pz66UBMG8Eg5DzUagnZM
QrFDJwjghbqyKutTPSYyJqYkhdzxZH15TlJeAu43BVuAF0c7Znxpk3apXr54b6J0
nXV+CGRukYMHoT0kcNAZRG/znjrFFxUz8yBtAqR6Ue2AvSU3QGDVU7O+JHlRfMj6
SPeCXxvDhVBz7Sbo+XWoesnhzGza5+1fQdYSur9vVxjKmrI5pbxBZpBXHJ2WvTnt
HSXi47r4tVbbZC4W3BBRJPE6KTFQLA==
=2gHP
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--


--===============3346364022914302484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3346364022914302484==--

