Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634DC64ED9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/5uRppztvTMIyS/KZsTo+L5feJs4Wa6iuYWTUWcbyk=; b=Fog/67xpSE2iJmD7Bj7RDRR1TM
	SLypn4vN8nhKfpXqgnXO0AiMY8Wn6v5xX2MQx4qaefAeXQJDJuRoUI1LfKEHk5lyka8DGKHioKNUi
	nwZryqhxILEiFb62jDD7C2zoX28fpuQpdrR8XzBOafcKyxpcrTIEvKSMNDEc8GAtGeaOL0coEeTpX
	fPVCztDet7duLAnjtpQfBtoxwp86CMlpsrLXyd5DWHhiV6YNkEx2dIBQIFTfOrSACtGICJ/9t6LP/
	pftY0HTQvOlZ1NZolFyNuRAOkAC4lDebVofalM/Z2dDK/w+NQzUsgdDpMZboKK0BHuiaGNHzmjxxO
	14Muov9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWAG-0095ol-BK; Tue, 21 Feb 2023 17:10:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUWAE-0095n5-1A
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 17:10:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4F3F0B81025;
	Tue, 21 Feb 2023 17:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860EEC433D2;
	Tue, 21 Feb 2023 17:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676999447;
	bh=8u6YDNc9yy+b2FhC1l0g6cqoBb6ZINj+1i2P4m3Xzwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdYFftk+6mfKGKJOCRNmPo/FcmGyA9bUoIxhDwtbpO8mD5Z38jIc1eRd64veNMbiK
	 lNUU4+PQ0XYkBokC+bcklQeI9R7e+ij34o7+JiegYT/bSs0SFiZclzUYdV8LIbEnli
	 FRiS2oMShuJkRrprJDKLsopsp2csI/rtQYFRbqW3vIbBOIPb2T3CcH9UyxGSiJzD4q
	 pqXQy7aaFCsThi6oSqUwJMzXaj0UZlxdoLaEZRBBQ/0hHD2BKiD1B05mqC+wBhw5Ka
	 yvpPjBq7HanEGeDORkJmLQB1ZAgZhGRlAzBZzJ0e05WHq1ZHHRlRfk/BdGqpizXFAG
	 0oSb8FfW1ZfyQ==
Date: Tue, 21 Feb 2023 17:10:41 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/19] reset: starfive: Factor out common JH71X0 reset
 code
Message-ID: <Y/T7EYISh0Zx9xWY@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-6-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230221024645.127922-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_091050_246357_97196C54 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Type: multipart/mixed; boundary="===============3071560216149883748=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3071560216149883748==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j5HBhd3GwB1YKNyE"
Content-Disposition: inline


--j5HBhd3GwB1YKNyE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 10:46:31AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> The StarFive JH7100 SoC has additional reset controllers for audio and
> video, but the registers follow the same structure. On the JH7110 the
> reset registers don't get their own memory range, but instead follow the
> clock control registers. The registers still follow the same structure
> though, so let's factor out the common code to handle all these cases.

I think you split this out compared to the previous version of t he
series, and does look as described.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--j5HBhd3GwB1YKNyE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/T7EAAKCRB4tDGHoIJi
0rVDAQCw3IZVbliwp83FiyQgHXpcHyUxrgL7eMvpDar3M4hgrwD/Vm55fmaYja6Y
OJb164Udw7J1FW02H+ccQHNJXHsUdQs=
=UY4d
-----END PGP SIGNATURE-----

--j5HBhd3GwB1YKNyE--


--===============3071560216149883748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3071560216149883748==--

