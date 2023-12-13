Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8A2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9icvDOZKkMIlPbo6HSta//QBq/IXUQTocbpxKHpMr9Q=; b=jhd8k800OQNWFFEsTxaV8kTGsr
	ScqJLYhcWygsWUeHUzklyi/xD5JWbmCG6uszOgcwUMI+81ZMvtOUy/R4t8fRXZJwC3oJE7hEKvBdY
	7DolDH0TnJF5QgmR9JG6wmGaJ/YDVZI3/kECbCBBYUAEw+BHh9W9m9z/I8+W1sO1AosD97rytK+Gw
	Ooab5uJCChYH2Fv9+yuCr74d+Y3nAYOKeRiXaIMKP80uV+pJH1D3QqNujuiVST49nONasO3Z7qz6y
	pWSm9Qo/b4MAUxmV4LTnvD2S8bexzVonftHdzdCWaNPytX4x2OQtOTBhh+YFBcsL9RIW/jkBpVXfc
	5DTlwHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDREV-00FFzH-2B;
	Wed, 13 Dec 2023 15:33:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRER-00FFwF-0h;
	Wed, 13 Dec 2023 15:33:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6464E61C44;
	Wed, 13 Dec 2023 15:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39377C433C8;
	Wed, 13 Dec 2023 15:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702481586;
	bh=d7g/An6tj1meavK9KfeQnpMkp+2FDg23+65lC9a5QiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkYwO/fjoLD2gAZ2b3rLdvfKUYBIUfIj0u7GtXIEpv9XnMn/eeS09zwJH73Qc+vd0
	 ZnrhcnsBekydmjRl67nJ8Yi0w69hKYTJlrd5WSUmCWw68ELifwovjCrXCpYk0c8U04
	 xgLXYkjm1UzJjA9btEyrnq22OBEi2Mr4Qc7V4FgZUzdtAuA7XpzOH7Ia8uiGC2l/eH
	 QJT8nEkg8Aj1rWg5w7LI4onIlYBeBOgQUS+vcNc7qlj7s83jCmIrZ88U9Snp0nZ7d3
	 nu/NxI8zjYEN1IL/aA/2cI4dLkdg9FYwFXevnOvJKgJZu5HaAZBEPTii5XaJg7Mt9g
	 5dlxyInpwqBKw==
Date: Wed, 13 Dec 2023 15:32:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v5 07/16] RISC-V: Move T-Head PMU to CPU feature
 alternative framework
Message-ID: <20231213-embattled-makeshift-914c2dc0d678@spud>
References: <20231213070301.1684751-1-peterlin@andestech.com>
 <20231213070301.1684751-8-peterlin@andestech.com>
 <20231213-prewar-poison-f2781b4a6e84@spud>
MIME-Version: 1.0
In-Reply-To: <20231213-prewar-poison-f2781b4a6e84@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_073307_342255_D8A32357 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============9092298972298673381=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9092298972298673381==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SNv4aXwN7leT+bpI"
Content-Disposition: inline


--SNv4aXwN7leT+bpI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 03:27:25PM +0000, Conor Dooley wrote:
> On Wed, Dec 13, 2023 at 03:02:52PM +0800, Yu Chien Peter Lin wrote:
> > The custom PMU extension aims to support perf event sampling prior
> > to the ratification of Sscofpmf. Instead of diverting the bits and
> > register reserved for future standard, a set of custom registers is
> > added.  Hence, we may consider it as a CPU feature rather than an
> > erratum.
> >=20
> > T-Head cores need to append "xtheadpmu" to the riscv,isa-extensions
> > for each cpu node in device tree, and enable CONFIG_THEAD_CUSTOM_PMU
> > for proper functioning as of this commit.
> >=20
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I think it is also worth mentioning that the only SoC, to my knowledge,
that works with a mainline kernel, and supports the SBI PMU is the D1,
and only recently has the OpenSBI port for the SoC been fixed to
actually work correctly, and that has apparently not yet made it to
a release of OpenSBI, making the "damage" caused by requiring a DT
property for PMU support not all that bad since the firmware needs to be
changed anyway.

Thanks for your work on this,
Conor.

--SNv4aXwN7leT+bpI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXnOpgAKCRB4tDGHoIJi
0vFSAP4vVxuYhNOszazQh5QRosrPv3AJ+es7VDyK7fJJn7PemAEA00lcLHa8pVPg
zVv6tom5ELmLTpytrjK7gWjeiOgWggI=
=DW10
-----END PGP SIGNATURE-----

--SNv4aXwN7leT+bpI--


--===============9092298972298673381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9092298972298673381==--

