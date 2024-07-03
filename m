Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA38FC2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjRH3yNDX6uztWAKvR7Wu8oQnNNeOcGPuTudG2T/jX0=; b=yh9Y+5Hg3AaY2DboSikHOLVcha
	h/+0NRYsKnugZsxPGz5SVYMgAe9XzctFqx7xru8Z4KhMd0B8ZK99HhIANnfII84Tz3KXo346paIxz
	vbdVOzhcmd996da7GQWp5f/PwM060rGAbqRRntE1ni69Q2dGTJh0reRhhddhHVxITzC8eljy0qvPN
	k+Tqw+DDcaKg1oliOTLSMgpB5RY5bv1W3mI79XjpKjIxNAK2FNSbc817abXz1JrIklcnkTxmKYPSr
	JpBzSaAocMWK5tNhpACGmN44pyOHLWSvYkp/YrkPxVbE1Ndh9OCaDGN+BT4SBk7u8NZ4SF4roe9U2
	uUO5zwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2PR-0000000Am79-44Vi;
	Wed, 03 Jul 2024 16:00:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2PO-0000000Am5y-2aH4
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 16:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA980CE2D06;
	Wed,  3 Jul 2024 16:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE426C2BD10;
	Wed,  3 Jul 2024 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720022436;
	bh=yTHPhsfhAJ4WGzKRVVKRBjIFVfZM0LD+fCx3Igm2aDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uY81kNSbilY4ZonPDrgVSVcb9Z2MfLNKP4iLLJKyUj603l7fOKWEmqCr4wmc9O8AV
	 2bHJlWpmyV9Jgfk+ONc46Jiwz2DEubRsPRE5xMBllLoSk6+tz6UBwP2QrmnUum0RrN
	 3+QaqRtiXYJLpXEiQEXnw1Y5KzBgpp3BUm/ZPBzobpU/5+U4AyZfGikR33KaHCYVu4
	 zmQ2JftAJatnT3Lfx8viPu5FFLE9FW/+X/fGnpdmrdJuq8z+HP6ziaRROzpkaFPJEO
	 qGqqyVLUIevBOcnyU3/9hfptkoyl3bRTu0tTG6Q1FxLq+MTQZ84K2SlDaFBA1zn/c3
	 2KJyo0s7PqrIg==
Date: Wed, 3 Jul 2024 17:00:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3 05/11] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
Message-ID: <20240703-oncoming-chamomile-4f7132d3374a@spud>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
 <20240703-k1-01-basic-dt-v3-5-12f73b47461e@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240703-k1-01-basic-dt-v3-5-12f73b47461e@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_090038_862311_1A5F2700 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yangyu Chen <cyy@cyyself.name>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>, Lubomir Rintel <lkundrak@v3.sk>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: multipart/mixed; boundary="===============5644234899221450600=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5644234899221450600==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t4wAf3UbGKQdKw+B"
Content-Disposition: inline


--t4wAf3UbGKQdKw+B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2024 at 02:55:08PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
>=20
> Add compatible string for SpacemiT K1 PLIC.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--t4wAf3UbGKQdKw+B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoV1nQAKCRB4tDGHoIJi
0uXPAP91uQ09kipQ21Z4FRKIaHGfIeBoJeYNSe9AEAAi/N98RAEA7wB6F4xpZyKi
X/gn7dAw72lrmSbMyUTANxeKtwTuMgw=
=4qhD
-----END PGP SIGNATURE-----

--t4wAf3UbGKQdKw+B--


--===============5644234899221450600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5644234899221450600==--

