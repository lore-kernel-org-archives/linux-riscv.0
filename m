Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A95C41513
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU1rBsTCUBVlqqu60gu2WRqvxsvYcXSMM8ytsZ3n7tg=; b=y22QBR3+Nx4hrIYFsKTUGYuDyQ
	QisiOXk+J9oY1kU8+qnqb7c8k+R6Dmfq9I+poBLUIgGRTn9Ne1YeLexcXMnio4YMco+pl8gvOw/J3
	DRAro8Tcvh1Kt9qU7Wm6XZJ4Kr5SIDgWntYwy60a/mHXJkgbisEozMtGwW4Nht2MnQ9qkmd+g2mE4
	xIpATGDg+ybF2xBt/qcyXB3bJua9PqakHRtQfBq/fjXVEP4ZY1wGB6HQL9NPqJ8o+aam4L3HOslht
	Q31oAaMUZdNXlQchHE4FcqWCgU1XoFBrBWbkMdpOIB15b27USgYURjw9Zv86Z9SvXsg6+Zz/M1vOd
	4pOBw90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXQi-00000003D0B-29Fe;
	Tue, 04 Jun 2024 16:54:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXQf-00000003CzX-1eZH
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 16:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7BB9BCE0E62;
	Tue,  4 Jun 2024 16:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A47C2BBFC;
	Tue,  4 Jun 2024 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717520070;
	bh=9QxiAFyRtObELcKE8Pdt8Q3G8VNOVmS0MGj3q8rQD1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vfjd0UrE2T+Gw7EaDN2F9IKww+eROskhaELkjqCbX0lg+lVJ+MLsrQfelrViaAjRK
	 vrTuTLxSPpypv72kmQAt8Cde37e0dM0by7sRAXP0j2/P0ICSo/VDotdM1ThDn23VKx
	 nchFMcSkJp3H1Go+ZPvoQgK90QywEjPLEfPc5m0fmGSr4lmmVyUpdTi9T1esqkrB7z
	 jFUz8p5LZUBgPwHI4sb84alubcVZSfqIdk1ar2MEhpeU0hXfVlNr6Mm8btlKkr6y7g
	 8V5ZydI77l33AdOWULTvZm554rTgl5qkqVRCqnb5gvWo5bWP4Btsqp0X02t8eUcyp3
	 H/GbHVznSCciA==
Date: Tue, 4 Jun 2024 17:54:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: snps-dw-apb-uart: Add one
 more reset signal for StarFive JH7110 SoC
Message-ID: <20240604-sagging-unbiased-17083b875576@spud>
References: <20240604084729.57239-1-hal.feng@starfivetech.com>
 <20240604084729.57239-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240604084729.57239-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_095433_635734_72315581 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4161529539068383987=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4161529539068383987==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gEvQNIf624IsR0Q/"
Content-Disposition: inline


--gEvQNIf624IsR0Q/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 04:47:27PM +0800, Hal Feng wrote:
> The UART of StarFive JH7110 has two reset signals.
> Both of them are necessary for JH7110 to initialize UART.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--gEvQNIf624IsR0Q/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl9GwQAKCRB4tDGHoIJi
0pIEAQCPDEC7F3bwjXqRwHk8slfZh89WNAGHTG3bfBDIyQqRJAD/Rel/CIsjO73v
ESIZqBFtkTn9zKJuSZN0Z3XX9Kv1qwc=
=tyjt
-----END PGP SIGNATURE-----

--gEvQNIf624IsR0Q/--


--===============4161529539068383987==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4161529539068383987==--

