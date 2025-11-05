Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8378DCCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 16:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Yfdz7sKt9WvnoyzhhkUaoOrHPz/aQwDZHGXzITyyRU=; b=puAOeasc5RoaIW5jAi1bzrmXpB
	wOkupzLvjyokBStJQe8WQ0e11eC7DnF/bZW545fUGiMU1J4ojiMuew4byl8KHTk0J6DmAxnxMPN5J
	AcwlAf9x6zvr+nz8oWsqE9MCfAX2NOuM1KfKoBFbNL+o6gatyHyoYtzGQJmJmb2sPnNi5QcoCZSkP
	RsLfBtV6vfk3nb01aaCVhUuX0JMxtAYbsFIP2ggvkYMqIDBsh5RPyMIWLNP5nT3sOihuOoOSgBMXv
	RTOa8QvoLRnrNb4PIy0R6jPhJ6s0fNFHUKmj83hb/4yt6VdvbkWkKSiNj770KJC9jSe+aoxWNJsMc
	PntqL8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgDU-0000000E3Il-4Bq2;
	Wed, 05 Nov 2025 16:18:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGgDS-0000000E3I8-1buK
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 16:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 642A741A7D;
	Wed,  5 Nov 2025 16:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4DEC116B1;
	Wed,  5 Nov 2025 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762359513;
	bh=jtQ6gEaQkzmYc07dmXo9QQFsS8gV6DmjYJ4TO+qHYGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dx6nxMHATznO5a67WfGEYEyTibBUzhlWgJPru/yRj/Hv8ahqTpqdD1VD0+nB/i8iV
	 nb93S1jksm2LS7do+VINUKNk61t6PzjkhkKOlecvghf/hVqdLZBUVl37ZIDYdPTMp5
	 JjRdGNA5kHN4O5borDM0eYWuKR/z1UTBmGyf0xNhxIqjHWc0vyitcM2kx60doP+EnO
	 cb0idfAwq2iKMq1f529MVbhLPj3muyohpV3K6DP1cGpqSyZ2mgGp7nKEGT9tEdjlt8
	 6TPiyYzWkuLGjZMPf9LuJFRzoPci97DXGyzKN37TEWdKvtaM/cYCMt0oRxTVU6t8Nx
	 KHiSf+qGmkiDw==
Date: Wed, 5 Nov 2025 16:18:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>
Subject: Re: [PATCH v2 3/3] spi: add support for microchip "soft" spi
 controller
Message-ID: <aQt41uGfmbs7Qa7x@finisterre.sirena.org.uk>
References: <20251105152823.730422-1-prajna.rajendrakumar@microchip.com>
 <20251105152823.730422-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20251105152823.730422-4-prajna.rajendrakumar@microchip.com>
X-Cookie: If in doubt, mumble.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_081834_462367_939817F0 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: multipart/mixed; boundary="===============4182935476666829619=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4182935476666829619==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ahMTsRXk43UBu4Jy"
Content-Disposition: inline


--ahMTsRXk43UBu4Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 05, 2025 at 03:28:23PM +0000, Prajna Rajendra Kumar wrote:

>  drivers/spi/Kconfig              |   9 +
>  drivers/spi/Makefile             |   1 +
>  drivers/spi/spi-microchip-core.c | 442 +++++++++++++++++++++++++++++++
>  3 files changed, 452 insertions(+)

> +config SPI_MICROCHIP_CORE
> +	tristate "Microchip FPGA SPI controllers"
> +	depends on SPI_MASTER

Reusing the same filename and config symbol is almost certainly going to
create issues and confusion for people upgrading their kernel or doing
backports.  Perhaps CoreSPI instead?

--ahMTsRXk43UBu4Jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkLeMcACgkQJNaLcl1U
h9DBEQf+I+GMNJBKyuyNbyKECoiylM6NJCpRPBtRkDC8FlF/4NmPRyJVc2NtggBJ
0oE+Z29HdILxT7LZGiFS9Bohm1aV3polVze54vy08v+AGpmVWavecwP0A8267I09
cgRP/g6g2uS5wsSoi5KaFNKzKHbv7iY/4VMyQqR45a9wmsnzHc5jCjGutCRbmIgy
ehRT21gKFbzMDbL8uBgRwszxHj6xuYJ17NfiBCcbl/wRZV+22deriTxUywW8QIT7
abi9fowOftdD9fD8mjyKZ8gQ++hFFBrS6UpWtSbSdpLHnmAtREK/4RNsimAfIq6x
jRzSeE1l+fF0eV4OPnzRnvVWq4ms/w==
=ohJB
-----END PGP SIGNATURE-----

--ahMTsRXk43UBu4Jy--


--===============4182935476666829619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4182935476666829619==--

