Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E719DC46467
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 22:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov2hBvcbDpyyFORloJ1gJ1OKw6m44D6TaWO4TyVjP+w=; b=kzsGkB0iqnYBChL6Y2eWGiD779
	OHImpzeXm6bx6CqQxCpfAG3vz8AX+3TtkIYI8Js9NTqtZ0wKfaoh0RopTCds+ya2zItOw2JZmnqUZ
	q/Clh87DdhEwD3xL8o70sh4GRoTOnFTs43uH/ikmJYFFaJuazVQua2cCVioo7lC4ppZxgWjDs9IzZ
	tKhIS1cbBPuKCpfMRSQb/D7cjfYpWMMM7mcWQ84TsszisPbANsIhqlb9iVNZb76Y3iXtgM0oE+boa
	5g9zNaM72uTwSBidk81vbexuinmOydM0YcFvKNyswH4fdRycAecVg+kK/Qx/TmkPks2EUuSe9vAzw
	hpalvvaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdDh-007QwI-Dk; Thu, 19 Jan 2023 22:17:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIdDb-007Qsz-U0
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 22:17:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B23A61D8F;
	Thu, 19 Jan 2023 22:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7243C433EF;
	Thu, 19 Jan 2023 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674166630;
	bh=89utuYKQCGzeq83oKyHYUYUZDVIx127sMQsoQcEb2wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbXgWUQIUKpa3h09/Ocor30Egjb4MGaL7bx1gdKjpc2q4enyEUlMoMPksx2Cf0CKc
	 oAYbo3lLTXDxvwnhRTSMe54EZETX4XQUIIsfASm1hjfv7MVEYFNjROj38OoDBRrRp8
	 UHZt2wqjGbJMPxyBmBdirkPnFiyaeLVUaK0mgkleCHMunxOVh291Y92pbDPNshygZU
	 5XxibQVOkBWbshESs3encPisolIseGbkEhJz3HflnIL5vOf3LeVICHn3vdbwoI5a+3
	 4QGTHrp/yz+f0opebObVO2TfTK2GbSs6+QAn1wJoUkNnsISE3NcHWnIGqs6aXU98hv
	 h8ZZNNVBFeFbw==
Date: Thu, 19 Jan 2023 22:17:06 +0000
From: Conor Dooley <conor@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mmc: starfive: Add sdio/emmc driver support
Message-ID: <Y8nBYpMWZnPfIqxH@spud>
References: <20221227122227.460921-1-william.qiu@starfivetech.com>
 <20221227122227.460921-3-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221227122227.460921-3-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_141712_087336_B0EC190D 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: multipart/mixed; boundary="===============4959834374556199482=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4959834374556199482==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NUNkl8OsrY3EJ11E"
Content-Disposition: inline


--NUNkl8OsrY3EJ11E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 27, 2022 at 08:22:26PM +0800, William Qiu wrote:
> Add sdio/emmc driver support for StarFive JH7110 soc.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Gave the patch a go w/ a chroot running on the sdcard. Seemed fine :)
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--NUNkl8OsrY3EJ11E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8nBYgAKCRB4tDGHoIJi
0ugVAQCT1oOYndDpHRFXvRmGKO5D1/5gymrPbI0BvzUu7bYCzwD/djaRzOTVgw9C
+WbQyiNFGpHXG1pGlshWuMzzbeKYYgY=
=pLQz
-----END PGP SIGNATURE-----

--NUNkl8OsrY3EJ11E--


--===============4959834374556199482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4959834374556199482==--

