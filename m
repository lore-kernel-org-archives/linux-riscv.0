Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5898C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTu7x4QUXyEX1+dvDJoiq74KfRYl+Ntl2a9gk6cku2w=; b=YSthwmDrcd9GFR2WUAfuSxDeaP
	vs0JQvN4pJYUTpdB+mYZoLF8nio27XlftFpNX9PB9eHNjGX31OnMGnrGoXX/5o32HoKsfgSaaGPlD
	EO0eY8xIm+cpAYL8lxYDOY7jboi0Y7hq4QJZt9GxNIoY0hPXyG24ja6p7jbqphLfBeQZNBLEADuqm
	ehJwcL1giSJ+AZEpLxmmneWkTG0XvyYFgzzA9nwp4M3C1qTPHQxQSElv6K/Ojgpv8j5SvuiVtGOV1
	pNu8dLe0xPwVKLDhJ/+ce6ODTv99vbFv7yZv2tGuLkkVth63ThuZ+VqXqoqiUpXZeeTbelm75dcn3
	j72UaaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHP-00000003Gh1-0VE0;
	Mon, 01 Jul 2024 12:37:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG2e-000000038sk-25Zp
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB638CE131F;
	Mon,  1 Jul 2024 12:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7517C2BD10;
	Mon,  1 Jul 2024 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836514;
	bh=JE+ce2Bc6XEJf7VUJZSkFPrL8gf2uYh6gE14BffD4dY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hy/8gJxDh10XMHIVf2L/WFukvLq9st//F2wTuXY1GNnedZ2pnJ9iRhYSHhIaqYmsV
	 pzod3J5cLEbGR8r9GmALkRTMlcxSfY1jzi9YmRb5+8AJN3HDDFRWUoaYLeM0b8jvsI
	 yBxl2SzeSSERFG7Laqu27v9GzL6fFncVeAqy/HzerJazbLOUsXUXYKBT8BS1KdxQc6
	 aRbyH+Ppu/BgPYTh6ic8BSRmYN/QXiLrw06nMatGgh3Gcf/ksknugWmMFXmRXtSfK0
	 Y6PYPqEKbr3lH80bmwVB3Tyh4ONx4pUuJ/gyrjtLpcQpdfQWu13sMH3G76kWLuEevv
	 GW8Ah9pRD4sQQ==
Date: Mon, 1 Jul 2024 13:21:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 10/10] riscv: defconfig: enable SpacemiT SoC
Message-ID: <20240701-tasty-haste-077c00f16517@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-10-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-10-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052156_838827_3765C498 
X-CRM114-Status: GOOD (  10.12  )
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
Content-Type: multipart/mixed; boundary="===============4532716904397360494=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4532716904397360494==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X8NqZcBC5f6Zm1Wv"
Content-Disposition: inline


--X8NqZcBC5f6Zm1Wv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:24PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
>=20
> Enable SpacemiT SoC config in defconfig to allow the default upstream
> kernel to boot on Banana Pi BPI-F3 board.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--X8NqZcBC5f6Zm1Wv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKfWwAKCRB4tDGHoIJi
0nTFAP9sN0UVi6fNDmbNrKem4UC/W4WV0G+AduAgSpqYdf2OKgEAyY4CNEkClU32
2u5Z24HDzzALjaBwylOnZLuOMuVWUws=
=WJ5T
-----END PGP SIGNATURE-----

--X8NqZcBC5f6Zm1Wv--


--===============4532716904397360494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4532716904397360494==--

