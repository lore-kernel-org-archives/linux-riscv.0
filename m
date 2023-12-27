Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A2C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 23:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rt9xNDDL9rqkNSPS64lwblk9km/LpN/w/GKUfEgAalk=; b=pmq2K2bU7LgpLQHlLNw39vms97
	AcqrTN/K42AwmV4+Qerpm0zhxC0nldRBeS3g4pjWplOEWA39/0eYLKr7cOdBEokDzTjCG1H0y7Jmv
	Sb0TI3lbAFH7RZytSUALFTPfn2dNC6I0CA+RgeRXgILiKE4aaeTgmAshkoKyPf+3YzBtRXjA5chjD
	Bu6mtcLppI4OtF23fONxJdS2Z/6bkPRPcU9vwI9tI9+WI/tPc0shhrhhb0TYxkNR+UcNqUuET5YAp
	Nkv9e2zXU2Vk7HLAVNefWlwu8g3opNgraOHAUm1JFy/XbD35AVVf5A4bibDFddN8uqj+2xG8mgTGj
	tv39/Uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIdVA-00FhA4-2Q;
	Wed, 27 Dec 2023 23:39:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIdV8-00Fh91-1Y
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 23:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3413A60F6E;
	Wed, 27 Dec 2023 23:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6898C433C7;
	Wed, 27 Dec 2023 23:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703720381;
	bh=0sMsmWI7zpqMUswHtDGmxyLjwwWkq5VVZjSm6+7mC0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y+YnbUCH97W0yN/0z0J8/vystbcMeY2xbp/FyWcTe2iVOXJBuSbXme4eNL92BZ3kQ
	 x2XyrPkNg3a4Nk+aB+OiBBtdCu2Lauej14m5QegAQkfU7oIshitEkXBdaJ6k9GdRq/
	 NpfJzxUm8oog1P33916yPwWNKuNcXN3hecmQI1Ac6dp5Ms+VlUzLgX35SVqCw/frw1
	 paeb6PBuFYMfaZL3oNQtCCv1WbDy3yq03fAB8ofB0KyO4aeqWA4egLz0YYiT7H/onS
	 4WvJVFz07zGlbMevKSGNLztJFknvaB59SczZn+AaVKWrYLkzm0wVs7Lx4Tkzy6Udfp
	 /fWGAL6BC/l2g==
Date: Wed, 27 Dec 2023 23:39:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Clarify mmu-type interpretation
Message-ID: <20231227-confined-dotted-4e255dd2475e@spud>
References: <20231227175739.1453782-1-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231227175739.1453782-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_153950_589389_18C36EFF 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Type: multipart/mixed; boundary="===============0324946572792225683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0324946572792225683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vRdODWm3L/LvIb8k"
Content-Disposition: inline


--vRdODWm3L/LvIb8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 09:57:38AM -0800, Samuel Holland wrote:
> The current description implies that only a single address translation
> mode is available to the operating system. However, some implementations
> support multiple address translation modes, and the operating system is
> free to choose between them.
>=20
> Per the RISC-V privileged specification, Sv48 implementations must also
> implement Sv39, and likewise Sv57 implies support for Sv48. This means
> it is possible to describe all supported address translation modes using
> a single value, by naming the largest supported mode. This appears to
> have been the intended usage of the property, so note it explicitly.
>=20
> Fixes: 4fd669a8c487 ("dt-bindings: riscv: convert cpu binding to json-sch=
ema")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.



--vRdODWm3L/LvIb8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYy1uQAKCRB4tDGHoIJi
0oJzAP4m7KQu4HlKHw94QgFw60+7HtiWm+9c2ClBe/2m03XVZwEAjpAM8ZucmBLh
gpAv0Rb3inYNpeyNYtkXVly/S+55Dwk=
=BSxd
-----END PGP SIGNATURE-----

--vRdODWm3L/LvIb8k--


--===============0324946572792225683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0324946572792225683==--

