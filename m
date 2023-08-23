Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE36BEE49A3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 13:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHu1PHo2DQzb6Oek21efk4/R8/omqlW4oWVl3xdV5fU=; b=uEsIG+i1VbVfcI192WW0eqZCek
	3hYsxie8ibOc6ABRa6m5aBYyjp5FWIHEYybLjzs/pFO2UFu0H3SCNpkl8XQCkuhX5lDR2VNhi0/1Y
	Mzj5RU30xdU9li2QDWuCkGELF3gy94ARhGAyuvXnkmi0faPF8cF58S61n5wQ31Yh1DN+sxLno7R1u
	s3aeb+52sfezhRIgNdsU3ULeeHAKGKu/1BjmdC/6KIh/m1J4FzFnG/VSt9ccxK0RQ9OsxnJgaEUUD
	MFdYyGZlgr9spCBd8ov7ivoRtZkVtTus3c5nxANpjb/1f8dFv4lUVpw6EsdFJrYbdSOX2+/KZALfG
	s3ZwGKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnvZ-000gTS-0i;
	Wed, 23 Aug 2023 13:29:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYnvW-000gSX-1F;
	Wed, 23 Aug 2023 13:29:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58E51662E0;
	Wed, 23 Aug 2023 13:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD46BC433C7;
	Wed, 23 Aug 2023 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692797376;
	bh=NFe09BLTwI6EXzfx6Y6VNCzXPE7zpcUy4rcY7EE0zr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCj+wBUt/EmZ6GHed1VrFjaZS9DehCo3T5PWHyIWqvgodHG1bOIrm+qPEnyUWXEAr
	 FgRt+2lYfXgJ1AKEfXFoITnrr/Z9GoUUVWQhVXu4FLWS9L7p71Tl+6JnK9c5cuhn8R
	 MydBvrMO1sAnNo+ZDOzU1slqaO0/Sb3gSn6/mFe+qiWZUs94NiXhyVXvf+xlGWmesq
	 vsEkPTKLhaI3R6r4rVjVoJupi6Awv4iRbUKj0WaHHIYnYgZlDvV47dMGxpzjbykHsJ
	 x8M4t6U1QhNo5Vhu386uzZp0hcFeMuqP6+2/WgmcF+2RcY+xoMrzGK2IlzGbV+eaJZ
	 iUE6uqbS0mnZQ==
Date: Wed, 23 Aug 2023 14:29:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in
 SPDX
Message-ID: <20230823-alabaster-omission-a35a29198fd0@spud>
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_062938_486348_D536EB8F 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Type: multipart/mixed; boundary="===============3548512936990289820=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3548512936990289820==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zwG12TuW3Ar4PyZi"
Content-Disposition: inline


--zwG12TuW3Ar4PyZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 10:52:38AM +0200, Krzysztof Kozlowski wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--zwG12TuW3Ar4PyZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOYJuwAKCRB4tDGHoIJi
0gLyAQD/H6s2mLMFq0aJbyPKB3WgSjepxLVIu2NsGm8Vn5FfeQEAqpZfLXseCpH3
tYdgNMuExBww/q2bYbRydZH7E/cbXAk=
=in4T
-----END PGP SIGNATURE-----

--zwG12TuW3Ar4PyZi--


--===============3548512936990289820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3548512936990289820==--

