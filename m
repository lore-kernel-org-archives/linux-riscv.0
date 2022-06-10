Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5833C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 12:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4U9RHmxlUijQ4hpjboeuaNfxp+g07keif1fW/hWDWnk=; b=vRyhe7iHFKWswZf6zXmg35UCf8
	Te9oaB0biKDyJOZnNkTxfoaYSmr+bhghyfjWg+qyjovPP8FJOoK08gmsRpofiLgwKV9Y5m5jqAdhC
	0j7KTHXMaTwLnyAZkb1W9kqDPwQCZm2c3TnMpAZ7yJoQ7bJQyDwfpJX4V1uUJ1gl9euhNIPglTIl2
	9K4Tw+fWuUNrVi9mdDjag28lpTQQBGENkxHBY7TDKOweeRAH6kQJb3ES7F+AV5sKuxA72BV8tsCkA
	Fp6yYz0kVzipVQhWxY1p6LxBrZQ3Brpu41r7+xK9NOqdbqavo30/pEzeKYPhbDuZhI5bShL4FmfB7
	cLRVPXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdNh-0084Uz-4t; Fri, 10 Jun 2022 12:04:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdNd-0084Rr-ND
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 12:04:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03F9062154;
	Fri, 10 Jun 2022 12:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B73DC34114;
	Fri, 10 Jun 2022 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654862684;
	bh=Y7U05lDA8BRgzCDC/Tmj1GEdicb87DiN3T0aBgPmwE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NI9tynBf3FiwPQbJrhwd2bfGp/1vw7iRkNSF/OxeHNVuGSZ3OObIIO98rsftOQGi2
	 hCeUjoM+HM2DyqsiNxCLheR4JKGxJhyg7F8m14Z+Q6J/pt82P6NZi418drYs1JwW+O
	 TN/+CSf8y5AUI2WVdCROYrQMp+JNHmRYsqtAMKHDpyIxt7IaZxbNFVXCZ4Wm+Rhuby
	 ykQLhHIywt4MrVxLUG86oALYhgmmUqlNj/piEb+8iU/clJyBNzBXoC6TvnXfE5x+4r
	 ZbmGaadUcIYWuKQRtpg915adYImB6TXevN/H8+sAamhh+4fdunhxZQ8vMnGfY30QoA
	 UD8jUXil9jW9A==
Date: Fri, 10 Jun 2022 13:04:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH next 1/1] spi: sifive: add PM callbacks to support
 suspend/resume
Message-ID: <YqMzV/kXeHso3QW+@sirena.org.uk>
References: <20220610074459.3261383-1-andy.chiu@sifive.com>
 <20220610074459.3261383-2-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20220610074459.3261383-2-andy.chiu@sifive.com>
X-Cookie: Teachers have class.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_050445_860719_12CEA42C 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: multipart/mixed; boundary="===============2219080333565246426=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2219080333565246426==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="padlAlf46HdwYK6i"
Content-Disposition: inline


--padlAlf46HdwYK6i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 10, 2022 at 03:44:59PM +0800, Andy Chiu wrote:

> +static int sifive_spi_suspend(struct device *dev)
> +{
> +	struct spi_master *master = dev_get_drvdata(dev);
> +	struct sifive_spi *spi = spi_master_get_devdata(master);
> +	int ret;
> +
> +	ret = spi_master_suspend(master);
> +	if (ret)
> +		return ret;
> +
> +	/* Disable all the interrupts just in case */
> +	sifive_spi_write(spi, SIFIVE_SPI_REG_IE, 0);
> +
> +	clk_disable_unprepare(spi->clk);

Seems like the clock managemnet could usefully be done as runtime PM
too?  In any case, that can be done as an incremental change.

--padlAlf46HdwYK6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKjM1YACgkQJNaLcl1U
h9CpAgf+ICpsIexQGWxgh/zE1CZJy/k0JC6GLWHRVLjR6HBCGcB/HzaZ3uspueEP
HfglvPUC2qXkO45fodYPfXMb1ByQtDXnQPBBwLZVKNUD+BLD0jlQogYK6PynhTj+
XA4+1FZG0hsfy/68yPu5eM+5GpcHsQkxXYWryRIznz4IiX0S8vY4hoxnbTYGHiFy
N3PJG3eRrmOolV1Oh6oqXt14UqXPgb5QBee6U8Cd/MJaQdu98Pvez02kvVRlEloc
YLrpxLscFWt/W36RHr5+hpCYh6r98hgsSKNjxgIyRnYrFChvWri1SC8J53GvuzFK
TalUGA+3s+6cPsTUJhqbC9wShj+fZw==
=sTjx
-----END PGP SIGNATURE-----

--padlAlf46HdwYK6i--


--===============2219080333565246426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2219080333565246426==--

