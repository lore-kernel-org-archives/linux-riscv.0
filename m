Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910F4C4167B
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtkMZMHmZYwNOVjA7LCRb4j1XeQJUlPBSLLxb3N5E00=; b=ppO0KuCKTl7MO4+F4+vwmmijhI
	o2qmlsSo/BRdrq5pve8xjTZGHrVzhIE63Ach4J8XU7ANEE8D8SRR8rAEPMhfE62NFQanG83kEPnnw
	TgE/gru3Pjq6mHV8Mpi9IOYjORPTGz1IrtKXi+72LYJ3t+x0kSh85rrrhDhkr+9p4U5GBLHAaDq9Y
	yJXRK6HgsKtNpjFK6LsVVrBu++GA9oMr8XDThErGiPXNyAT3qvddyl0uVaV45FAyD0kcOsosttkZY
	ILWIZTki3f7ttk216I6VM9nA05Dz5ku2KlJbdLlvNdiozwL5n+NBMI6eejkJFTUl/xlLcn/1ZlCxE
	LzGctYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9kGe-00Gfqs-1a;
	Sun, 03 Dec 2023 11:04:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9kGb-00GfqC-0x
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 11:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 379D5CE0B23;
	Sun,  3 Dec 2023 11:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4313C433C7;
	Sun,  3 Dec 2023 11:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701601437;
	bh=RL9hj4/npBVWsIIkeQ9nIijIaQvVjE1SR3pmSj6oEg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRgOQtlY1EdSeAzCqTTGDvINRhqHIMsl8+LQeFZaNzcd/5G3CZAlbg+SOtS9kuIMv
	 68YQgJfICsQHDs9pFWFtFwyUmm3Nae8OnqyIx+HkdZXP8KxoEmQdLJj4BK+wSvgzm5
	 uSLa3Dyo+XY6EPvYNR7WSB0ZOWGtBK0d6ZodlAVj9fd1WLXUHVo3BgJs0Qq5Lyq+hY
	 csPMxzR7YNBQiYIUf7jDrYeh2m1eGixPIPQDZCI67+UI49nEbxz7CHGj3x8K7dW9Q7
	 id7NTjtXqaCvnU005DSuJPlRgnM4plT34q3XmH2A/94r74ekRCYG+X3/C5OZPhA59J
	 Do5H20Z90k9ng==
Date: Sun, 3 Dec 2023 11:03:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Walker Chen <walker.chen@starfivetech.com>,
	JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: move timebase-frequency to .dtsi
Message-ID: <20231203-mountable-snowsuit-24e4252c9eb5@spud>
References: <20231130-bobbing-valid-b97f26fe8edc@spud>
 <CAJM55Z9=smqcZ=su1oNdk1YZL_XdYAKrwtrZS7ScS=cAVmxZOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9=smqcZ=su1oNdk1YZL_XdYAKrwtrZS7ScS=cAVmxZOA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_030405_580481_EBA3B25B 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Type: multipart/mixed; boundary="===============4672920082547973456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4672920082547973456==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gsgU8ZMzlqhOxgDu"
Content-Disposition: inline


--gsgU8ZMzlqhOxgDu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 02:44:58PM +0100, Emil Renner Berthing wrote:
> Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > Properties fixed by the SoC should be defined in the $soc.dtsi, and the
> > timebase-frequency is not sourced directly from an off-chip oscillator.
>=20
> Yes, according to the JH7100 docs[1] the mtime register is sourced from t=
he
> osc_sys external oscillator through u74rtc_toggle. However I haven't yet =
found
> a place in the docs that describe where that clock is divided by 4 to get
> 6.25MHz from the 25MHz.
>=20
> I expect the JH7110 mtime is set up in a similar way, but haven't yet dug=
 into
> the available documentation.

Your other reply suggests that this is a fixed division for the jh7110,
in which case it makes sense to leave it as-is. mpfs is different in
that it is fixed to 1 MHz regardless of which of the permitted external
oscillator frequencies you use.

--gsgU8ZMzlqhOxgDu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWxgmAAKCRB4tDGHoIJi
0sJtAP4pMEN4NONQarXTexQ+6rwQOXlXvIdECO8PYelODQxL6gD9EEx+82qjL5N0
b/REnWOnOFlHnGcBijTAen08Qqc6uAA=
=tfLH
-----END PGP SIGNATURE-----

--gsgU8ZMzlqhOxgDu--


--===============4672920082547973456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4672920082547973456==--

