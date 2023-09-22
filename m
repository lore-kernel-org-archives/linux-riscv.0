Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95710CD4F27
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 07:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqTkpc1bAcK/dtmtl1VZeq+aVjRuNuPUSaXgDdOUfKE=; b=2jRT6otd7j1sVwzAz5u7WyvTfE
	OtPcjJFH/TzeGdPY4NCf5GvbUXANb+5+CmRG1Pb5G/xPGL89XNJx9s7N1AKr56YWY3KcTU+4fbeOo
	t4ifx9jNIfMbA96QTFWHrnHU2ATcoxRZESc2ffJRDrxP5T0gY8DsMQ9pEXyXJFBeLFfgV/TTJ8drh
	aF3wg+1RC+RpkdZy26GvvGQrBkE1DSG0NcW2O5Rngteo4Y0BVzbSu+VwF6AOMLGfpdPKK2fIa+xio
	q5/EfpYo5hya9p95INWrVA7OPrWcytIlslyiPxS326Y/KPR6gpkUSoPWf1KhIfJn5AN2sxwFRhXYs
	GtC/YPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjakJ-008Dbl-2E;
	Fri, 22 Sep 2023 07:38:39 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjakG-008DaM-0x
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 07:38:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E9929B82272;
	Fri, 22 Sep 2023 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7347FC433C8;
	Fri, 22 Sep 2023 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695368313;
	bh=xqJRYJ65z8ZCEW/tkOSG2viZcuPAtzTx2CRy/CMNdRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XxYSXbjWUAASSBuRVGA0KOx0PbBxsXC/m9qqmFggy3rqTVKjShXOOpOjJJF1D9tl9
	 iyQ28LsxGOgidhKDcfITcBx9QXD7LDAu7tvOf1cJL0VbD5svULHfZVV4RvCwVkLAWp
	 oTwrFvU6w9DgzpgTNcqhLnLmUx4IPJu/0hsBcgKMxj9f1t9ykk8vVpaLKS9cMtwH6S
	 SgeskXBAh9ZmWkEFuOhD6XhNNpyMnF/o86jZ56thB5ut692NtK77QHIcZS/LS9jmI9
	 kwMS7NV20DTNrB2UWAMVoKz7mIkdpKylp8L7t7hh+ipBJdHOLDiKRoyjxXU7dTMmQ2
	 bW0ZVveJyLRPw==
Date: Fri, 22 Sep 2023 08:38:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC v1 1/6] riscv: dts: microchip: convert isa detection to new
 properties
Message-ID: <20230922-ruined-deplored-a4c5b5866ad2@spud>
References: <20230921095723.26456-1-conor@kernel.org>
 <20230921095723.26456-2-conor@kernel.org>
 <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB033245E15897C496789A0979FEFFA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_003836_476007_EC11682A 
X-CRM114-Status: GOOD (  10.49  )
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
Content-Type: multipart/mixed; boundary="===============4681827815449601459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4681827815449601459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="whMU1h3Bx3QRMe1H"
Content-Disposition: inline


--whMU1h3Bx3QRMe1H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 03:33:13PM +0800, Chen Wang wrote:
> =E5=9C=A8 2023/9/21 17:57, Conor Dooley =E5=86=99=E9=81=93:

> > +			riscv,base-isa =3D "rv64i";

> should be "isa-base". This applies everywhere.

Yeah, I was expecting exactly something like this to go wrong given the
limited environment! Thanks for pointing that out, I'll fix it up when I
am back up and running.

Cheers,
Conor.

--whMU1h3Bx3QRMe1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ1EcwAKCRB4tDGHoIJi
0knQAQDmHSJ0t81Lx1txBho+/P6JM6zJKeSXcYFtPiTtZSZYXQD/cU3exXwYZvy5
K17M7n0PpNtl8Gs9h8jhmv8p3ieyngU=
=PPuZ
-----END PGP SIGNATURE-----

--whMU1h3Bx3QRMe1H--


--===============4681827815449601459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4681827815449601459==--

