Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2766BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tx4esRlssf12fNrfpYg2SnSSHxIcssyxq5jg5vrchiU=; b=KT72UaebBWENbeqd7z2jA5OlTo
	r9JNhsXmdRVxG4PqNh4oeBXP2U5YIPvVp35VqwWWNSbRwwln6FxNpAh9PR1tz78ON4Tq8YTIK38Ev
	1+tHXc9iDp6tkKAo+qAKUmYmByyOu96cQ0YcJC/wEcRW58kZixe/WmgJWHM9YoCyEnHn9dWug/xiL
	CUz3DIPRiiIZHaSgMa5GaUnRmEBOCy+0oJ9v1R1eQ+ZcR3b8ibjFLV1VcDQMikJ2lC/ieZP91R3X2
	/2XWbnJpjzaR6I8zA7N+30RNhdvU0k5bx/AtGhlwTcw7i5I5TlA3nCdiTyrUYfdPh1LkEFPSqY6AY
	sJhMHl7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgUR-00GNqq-2x;
	Fri, 08 Dec 2023 19:26:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBgUO-00GNp8-2C
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 19:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5DDB8CE2973;
	Fri,  8 Dec 2023 19:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761F0C433C8;
	Fri,  8 Dec 2023 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702063576;
	bh=HmU9LMehAw9DeUV8uCa+TBiQ2MWNpmsc6U26C4PITlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q0jHp+lrFGrxQQ5fEQ0yYQ4fe+W9y4ZBbiIbF5Fm6XNgANu/LLyFCi7GKBQlImOK1
	 zQ5FX411R3rVVBA++4kibVU+Ry2zU52I2LBtZFygSsz/2u+K0JWWcT+JXE2mM3eQa5
	 aMaNS4Jl0owLVOpVhyAh5+5NDmpWsy7qBKYlhrzdxgnBQPmrOGOcSpTvp+Y7TY454O
	 WxcxrL2t/YvNsOiGxmkthRidpOyy3nyHyi8BYNeIuulbHZ7ApFNEULZz6fP97KusN/
	 TGdMkp+mrZygRRBt5EpnO283TOKGmC2DO1viuGwbfey/SpXfK9+mVbEe3SEJjdhIMr
	 WKX33bNQlujUg==
Date: Fri, 8 Dec 2023 19:26:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND v1 1/7] dt-bindings: clock: mpfs: add more MSSPLL
 output definitions
Message-ID: <20231208-cauterize-hacker-f63dddf39af0@spud>
References: <20231208-reenter-ajar-b6223e5134b3@spud>
 <20231208-unripe-maximum-fc77f4967561@spud>
 <CAJM55Z_ozf=MwOJCSM154L__TE1Gv7Ec=gM8LFJ31-_eX66OKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z_ozf=MwOJCSM154L__TE1Gv7Ec=gM8LFJ31-_eX66OKA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_112620_955480_EF0CB081 
X-CRM114-Status: GOOD (  17.96  )
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
Content-Type: multipart/mixed; boundary="===============8134169958726412108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8134169958726412108==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="keUDLXTW9SCPY39T"
Content-Disposition: inline


--keUDLXTW9SCPY39T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 09:40:00AM -0800, Emil Renner Berthing wrote:
> Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >
> > There are 3 undocumented outputs of the MSSPLL that are used for the CAN
> > bus, "user crypto" module and eMMC. Add their clock IDs so that they can
> > be hooked up in DT.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  include/dt-bindings/clock/microchip,mpfs-clock.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/include/dt-bindings/clock/microchip,mpfs-clock.h b/include=
/dt-bindings/clock/microchip,mpfs-clock.h
> > index 79775a5134ca..b52f19a2b480 100644
> > --- a/include/dt-bindings/clock/microchip,mpfs-clock.h
> > +++ b/include/dt-bindings/clock/microchip,mpfs-clock.h
> > @@ -44,6 +44,11 @@
> >
> >  #define CLK_RTCREF	33
> >  #define CLK_MSSPLL	34
> > +#define CLK_MSSPLL0	34
>=20
> You add this new CLK_MSSPLL0 macro with the same value as CLK_MSSPLL, but
> never seem to use it in this series. Did you mean to rename the CLK_MSSPLL
> instances CLK_MSSPLL0?

Yes, that was my intention.

--keUDLXTW9SCPY39T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXNt0gAKCRB4tDGHoIJi
0mr/AQDAPWA0oJFGAgd3kwzO+18/rBTPVxEGkrO5J9+fukpyOAEAyrgQk4472IpW
41zAPoXiQ9UbdlNLIljJi2H7VMzCYAw=
=YxhE
-----END PGP SIGNATURE-----

--keUDLXTW9SCPY39T--


--===============8134169958726412108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8134169958726412108==--

