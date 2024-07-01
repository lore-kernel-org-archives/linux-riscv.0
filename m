Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B80CC30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 14:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqNEFcPlbVRW7seYd4Jo8u/37/Ef0+bNses1n7kI0zw=; b=qhS7kerHwYBdLGXFeVHxI3sSZ4
	cXJJToQ0H9jJJd13kLhYLE1mwBtJ6GkEDxehfzWMB2KzhU+ICPlAa0B1rjUvMaBHL1baXW8MpKNEv
	8SeIxkixvMKwj5RUI0pZGMPQwNTrl0zAkfQ+eXVlO0of5hFUO26dP/iIUf3g3Bt58p9fLbJfj9kqY
	kb/2kf6ijLssqS8hPZXC8WoB5mRyKPTaKTNCx26n8xX5EulfooF8GQD2Cdmq+fLWdtMPVgTjqQQMq
	2S/RyPoQC7VdqSx2sJcO3Qh3A2hU3YjIG03UzqQ3NwbTm1lY2mHuCkAOWuHYYq0vPefbUBr/2WDiP
	eyrV8Tyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHgH-00000003eCw-15qP;
	Mon, 01 Jul 2024 14:06:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOHgD-00000003eAz-3o6A
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 14:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D42F4CE167C;
	Mon,  1 Jul 2024 14:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A0DC2BD10;
	Mon,  1 Jul 2024 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719842811;
	bh=pQIIGvTZUYi99XxRe0YcnEpYQcYwdZfuFQQL2fvkEHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3kAHJ0+G9KnnnwtkBej5oeluZnuuPHiG/QzE5zXykCiPGWlWac9i8fppS4JJJbrp
	 nKCII4vGqtm1cm2BcgA0FMTfrKgDZxAE1amRMkFK3QsKeDirIP4a9oPf1Up9iHkX8N
	 39GnlQ60qejy4aKS51Jp4Rmf3V7kB9JZ6lFipLISScRugEpUwYwM0rNA8d8pbzQCax
	 lSUZAHzxtps7hTrTtg412zkZ1Aznhy1wYoBSr15veRsCJnDsFWN4IRMYym9o/H7raR
	 EPZHwQIYV19puDb/7KR1ZbKkAZSuULkxdW25gKsSdYN7mIKqU0XjS1OtPYWTRt26XD
	 T4D2XR/TRYB6A==
Date: Mon, 1 Jul 2024 15:06:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 05/13] riscv: vector: Use vlenb from DT for thead
Message-ID: <20240701-hybrid-kitchen-2051f8a8ee86@spud>
References: <20240619-xtheadvector-v3-0-bff39eb9668e@rivosinc.com>
 <20240619-xtheadvector-v3-5-bff39eb9668e@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240619-xtheadvector-v3-5-bff39eb9668e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_070654_172862_B38AC81E 
X-CRM114-Status: UNSURE (   9.54  )
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
Content-Type: multipart/mixed; boundary="===============5917548678536111023=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5917548678536111023==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TK00VZtfKVU6+hsk"
Content-Disposition: inline


--TK00VZtfKVU6+hsk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 04:57:18PM -0700, Charlie Jenkins wrote:
> If thead,vlenb is provided in the device tree, prefer that over reading
> the vlenb csr.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--TK00VZtfKVU6+hsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoK39AAKCRB4tDGHoIJi
0oZ2AP9wLY8qWGouPJdOJukMSsLuFzcc2RXdh+CXIFhJZWObAwD8DnRG3q8GIDBV
lsqKFk1HciXkBCw2+musvfI7br12WAE=
=yHvA
-----END PGP SIGNATURE-----

--TK00VZtfKVU6+hsk--


--===============5917548678536111023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5917548678536111023==--

