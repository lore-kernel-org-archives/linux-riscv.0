Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F6AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxTjDw2pP7+lydaw/KO4wZZO1UFQXjVHUFdOIM/YxhI=; b=omCluYbMttku7fPSJTw9pO5KGJ
	xw4RKh/buu3GIfWB4f7xpr/E41G1Hvfkj3Rd6XN4DV4cB3hSCQR2cpuAKgewUhjZcDSkMGvRczuBS
	9cPDXi1e1WtZqLKTSEcAPSvqAGQFjAz1sb/mpyS7ZNcI9rpYZPMaEb4gkjZrbxUk0vVN1dP5tZ5z4
	RO5fL0SJp85HyCeX9JFEJHKMq8+akfoKvKiDwi7HTWLw/Zj+FXrZxA6KNWgq4BsOPwxtyWdCTf4DZ
	Ee/Z1Ld4uE5MYc8sPdwJVXHePJR5Nb+Eq9sCMr57fSrMkbddgyEGpG6VUCMrRERyNb9ql8cSAbCAP
	4c5LPY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMEg-00Ay1w-0M;
	Mon, 03 Jul 2023 16:17:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMEe-00Ay19-0D
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 16:17:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 607DB60FA1;
	Mon,  3 Jul 2023 16:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF160C433C8;
	Mon,  3 Jul 2023 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688401026;
	bh=JTevVLvj3EYl1fWMMxi04EGyH5Dsiv3lYD+IRooLid4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiCpscVmtLwtlr03C+J+S7pOm5HBjzckjCfZojZuaIiGVt8r77DyLUSGk8NY/Rsbh
	 NWzznjLAAzD0GOk0U/pWNhIRGbzeW65vHHQ3e2eooHEbX///fV4ui76SNSIVaK0noN
	 ZPQt92CgOTxtsxrmcS2bB62OdVIXhbLh6efBXBbKjuXh6CnA+IF8b+d3aw3pjQjmWt
	 4HG1UOlxh000Pjiz9eYovhb1CDPEiVxlF7nshYTi5iPCPAKI7rNBFb518iM18c5N0r
	 c6Jkv60zDjasmQAAj8mO8UuBntpS4VHm7DpAa/0VyIytTbr5neZN8ZsGo/ujywc9hj
	 gs+Pq4VAeMi7Q==
Date: Mon, 3 Jul 2023 17:17:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 02/11] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230703-baboon-panning-b8a7268899c7@spud>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-foothill-enforced-86baba776d5e@wendy>
MIME-Version: 1.0
In-Reply-To: <20230703-foothill-enforced-86baba776d5e@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_091708_147457_64FEF4C0 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============3923895456806905077=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3923895456806905077==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="S8rcp5QksxDE+03r"
Content-Disposition: inline


--S8rcp5QksxDE+03r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 11:27:54AM +0100, Conor Dooley wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> When filling hwcap the kernel already expects the isa string to start with
> rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.
>=20
> So when recreating the runtime isa-string we can also just go the other w=
ay
> to get the correct starting point for it.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

=46rom v(n-1) that I forgot:
Reviewed-by: Evan Green <evan@rivosinc.com>
https://lore.kernel.org/all/CALs-HstMTxJFHEoSCaAUtYzT+a-2RSYAhWMQmkVw2+WE=
=3Dy0agQ@mail.gmail.com/

--S8rcp5QksxDE+03r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKL0fQAKCRB4tDGHoIJi
0p+RAP0SaOTCcjlKb7lby+pG6VFLS58+FyrQcXkCBeY7K51RPAEAux82L+HUS/zt
evbKbKhrJ9v/b2UtdBwW0tyrIdyLCQA=
=9aI/
-----END PGP SIGNATURE-----

--S8rcp5QksxDE+03r--


--===============3923895456806905077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3923895456806905077==--

