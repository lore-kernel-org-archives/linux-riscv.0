Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D90C6FD1C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9GRQvFTt6CBIkZSdLY0PaQzyFKOhUEBiu5TkH/2OtU=; b=CwXUDLs0xYhhlf7RPS+cgyu7Hb
	NeoCCLTJG0hqZkgdSiBAHk9SB+S5a0uyTdN8MiT/+IIRE50et/7T45JZZnZkMtXcfPhw9GOWDGyrB
	RNhjvoaAO9w6PLkW+h9IJ6atIQ9b9SbZXBWDDZ0o2NHZRjO7Ck81OEM6r6R+x/XEVVZ/4rHz+Yrvb
	JRyt6DQW/prSqDwrKYHLUdxoC706rTDoEUkT7HeO7Smcwwmh30LwfwHKnAFpojtTZCLommGBHs+k+
	41y0ixmpAbf0bDNbk0MHs44DABfiM9DJA6vORU47SJ42XKgH5Ch4SIDUGqiiohUVzrOtPkDGu2dvX
	mLlPTlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf5es-00HQPe-2l;
	Wed, 22 Mar 2023 21:06:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf5ep-00HQOc-2L
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 21:06:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1AAB462285;
	Wed, 22 Mar 2023 21:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8BEBC433D2;
	Wed, 22 Mar 2023 21:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679519166;
	bh=IwqcGZUb+JAwQ49B5qlPxqjaSl7Z1L+y305zKBfg5xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPpZBwRMbkG1hrPfdnOcabVKfBq9aOmy9U0hxbSGokCQcO0A8voh1JNXTo9Ui92e7
	 +oAT/mkzC3IcamAvCYtXv0yTUIfBeDgEbC1MtOWfzRWSdLSQnaSLHdaV4FSCSe0TaZ
	 MgWIkW/D5X8HBrSCyZyol0h6+jAai0ufW/Qz0HupiQKtpHtQhG8C2btGprgZi5lbFX
	 XEETgsDVJW0AEOVdeeiRlES75/Q25qQBvRYyGWVWpeLAuCmv6YHGGG+PhdExIvkXaA
	 j5UADPATWWUwZYM8aOmlJMFlGbHg83GJ9xvkYI1IpGGjzsIqtCCV8lEJLLkmdqBKb6
	 dOtDrHnzD9i/g==
Date: Wed, 22 Mar 2023 21:06:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Hal Feng <hal.feng@starfivetech.com>, kernel@esmil.dk,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
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
Subject: Re: [PATCH v6 00/21] Basic clock, reset & device tree support for
 StarFive JH7110 RISC-V SoC
Message-ID: <a6358a5f-bbfd-4a14-a828-a3c28f82709a@spud>
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <95f11f7c-611f-49a9-97e8-0de89846e430@spud>
 <62b766cef78d95793af95f428693c359.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <62b766cef78d95793af95f428693c359.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_140607_827571_ED8FE57C 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Type: multipart/mixed; boundary="===============5706735464023205379=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5706735464023205379==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qDgrhF5nMeMRIFyO"
Content-Disposition: inline


--qDgrhF5nMeMRIFyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 04:57:52PM -0700, Stephen Boyd wrote:
> Quoting Conor Dooley (2023-03-21 16:03:54)
> >=20
> > If you're happy on the driver side of things, do you want to pick those
> > patches up on top of the bindings and send a PR to Stephen?
>=20
> This sounds fine to me. Let me know if you plan to send a PR with the
> starfive clk bits.

Since it was off-list:
Emil and I spoke about this briefly today at the weekly linux-riscv
meeting, the upshot of which is that it is likely to be me, rather than
him, sending you a PR as he's pretty busy at the moment.
That said, Emil mentioned that he has some doubts as to whether the
bindings are correct, and from taking a look - he's right, so there'll
likely not be a PR just yet! I'll go leave a comment about that...

I've got no real desire to maintain these drivers going forward though,
so perhaps Hal, or one of the other StarFive folks, can get themselves
set up to send them to you going forwards?

Cheers,
Conor.

--qDgrhF5nMeMRIFyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBttuAAKCRB4tDGHoIJi
0ov6AQCours97BTI/h1YoGjIRSzsJumk9V2x34rQsvT3HtmqjwEAsc+9b9pMzD1r
LJ0vwnpZibKnjwdjkP9faV1TdgSO7Ac=
=SQwY
-----END PGP SIGNATURE-----

--qDgrhF5nMeMRIFyO--


--===============5706735464023205379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5706735464023205379==--

