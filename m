Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC15C25B78
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLP9AfYiwccj9ttBkSSJ3mFtCV0ytftu2MYHZltbkHo=; b=heBSPYyy65jGzgAdMfOn/AjT9T
	cSIEwkJ9+MFvo6V9PHKjuI4FZiKE7ZYz1fdB6d7jwWovbkH8dIAP44whqyffya6EHD+tjAIAugFk8
	T5XB+rdYRTpcdmMqbxAy/cpM0ZqTeD7B0wWwxDFf+M+5Zxb0MZI8kl7SMf2Dsi6AHHKL7Fx0HG3Jq
	xH59NJOvTLuEWtkWJZt14wJaSLmpIdPh0eyc2QbVNPi32+zTi2Dfa70bWNHUZ2YWfGfbZUH5m0z9X
	PxwVRTaS8Cshfqg7lVaww0OThDs7FnfY7cuqMzQHZ/hfdI2rQHtgCsa4+DqBisH1+M4dgPrdQXsN0
	cH6tLywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdNQ-0000000FtPZ-2SCt;
	Mon, 27 May 2024 16:39:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBdNN-0000000FtPC-1K2u
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:39:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 743D9CE0FE5;
	Mon, 27 May 2024 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC76EC2BBFC;
	Mon, 27 May 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716827946;
	bh=nZai3wSxMfczIOwG1N88zrdt0uoepTu3YmE3rL46WOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=riMOUc4NVSfS0ecagO6O0oeM3MuZde99/wOVQLfVD1Rw+o1uNkZ2OJUcFWRztAUGn
	 1UyERoNxFQnIy6XetRWZ08rZlAvfXpRR8EB8sz5/K+pykZNl2nrAQO6WVljwBDBpF1
	 n70AOzQtJx4DWiVQXoscukA2nKEADRrwoZ431uNA+CzFtQ2J9v2Ga7guDqru5J0IPf
	 ghSiEEJmo9RsHGWryP9QnEHzAowOuTwOID9NdCv3orVYDSTAMrZAWTfeFcxLhQmtK+
	 +blgvpRq0RzZlRPJx8RCWPwTbykccmZutO7Oyqn7MsH1zGBf/URh4o1yi/I8/Cy49C
	 WEjOYvw2fmm6w==
Date: Mon, 27 May 2024 17:39:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: timer: Add SOPHGO SG2002 clint
Message-ID: <20240527-gem-perceive-b3b33cb8b2f9@spud>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
 <20240527-sg2002-v1-2-1b6cb38ce8f4@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20240527-sg2002-v1-2-1b6cb38ce8f4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_093909_551866_6B7BFDFE 
X-CRM114-Status: UNSURE (   8.14  )
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
Content-Type: multipart/mixed; boundary="===============6995445321314470268=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6995445321314470268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/0iu3V337FLgXjyV"
Content-Disposition: inline


--/0iu3V337FLgXjyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 12:28:18PM +0200, Thomas Bonnefille wrote:
> Add compatible string for SOPHGO SG2002 Core-Local Interrupt Controller.
>=20
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/0iu3V337FLgXjyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlS3JAAKCRB4tDGHoIJi
0kiaAP9spLCvPOWUuuMl+xxQ/ZlirHHi7Fr8SWxQ95LtWYyC1gD/V8c/NyHHIjMs
L70GsY3xpX5Zb5FnWWEJro/UzARXyAU=
=816W
-----END PGP SIGNATURE-----

--/0iu3V337FLgXjyV--


--===============6995445321314470268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6995445321314470268==--

