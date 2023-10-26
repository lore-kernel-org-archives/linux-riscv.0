Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF7DC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fdjfBDzCxEg5r2rgfARFUw48a55dzxgSE5RiMHIda0=; b=r3sCbCMeLAbgHrWXCjgBkoT7Ht
	/G2CE5hiWEPxXMzL23dflBGoCCSuTkwSecjLUQ62kyl5Fy609fgsISw5uDEB7V6GXcJAoxP2TdF3F
	4rtuLf3IFoyEb+urVrD50gqyqdZdl6sticbXtWDRrNWg2+4gaz2ZpZBY/CxG74H/CLccO8lIQtQd4
	/fWaJNeLvGylFc6+iATas4Ret1MJgPri6FzUSAvDHLarEEg1uZQ8oamINsXNg5dTIt8emA/GHuBgK
	SNxmdRaTujyC6qu+xLcLDXGLyiNeKY9ktDJEClbkCOR/0cPekY0hnDLbuemsf59tCpkYy5KwSgNzO
	Ay3vYyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw13S-00EdDz-05;
	Thu, 26 Oct 2023 14:09:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw13O-00EdCO-1c;
	Thu, 26 Oct 2023 14:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AB6163489;
	Thu, 26 Oct 2023 14:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FC4C433C7;
	Thu, 26 Oct 2023 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698329381;
	bh=o+qCmd2p2pNBcodf0yPjWJ37AbBRRvl8Nu1y76ub5Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6xjc64FizKqY/UFZYzRexqwanb6HD1mvGz5Mjl2Oe/EWUThAH391tDMEG60AtLAF
	 n/69z9xHH1rbXwDaQM/Ng+Z9f+CnRVd2alD7vxO1Be1OIyvzcNfMYkybzD55tObSPw
	 vkGW/4TFkvQwrwqJh5hZcGo9Sslw/YHNXh17Ez6jyDxXZBN3zRYl2mumQGfSY7+NIc
	 LeGuyM20Yphheryl8vCIlwO9SnpaYfHeN99qsy+4WKt7z06ZpbKBkVK209nQIetQVV
	 M/RuSLZ0PdIi5fBoJ0XxCaiEcuN/QFzogBlfwpcDK0cPOVYC5wjRS05wcUD0j26hH1
	 u+Gy7TnP/udVQ==
Date: Thu, 26 Oct 2023 15:09:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Yu-Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 RESEND 10/13] dt-bindings: riscv: Add Andes PMU
 extension description
Message-ID: <20231026-concierge-perfume-6c327fc5282f@spud>
References: <20231023004100.2663486-1-peterlin@andestech.com>
 <20231023004100.2663486-11-peterlin@andestech.com>
 <20231023-spectacle-module-0516fb35995a@spud>
 <ZTohvi7TPyVoO-Sl@APC323>
MIME-Version: 1.0
In-Reply-To: <ZTohvi7TPyVoO-Sl@APC323>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_070942_627039_46F1C723 
X-CRM114-Status: GOOD (  19.20  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============0645501557429595514=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0645501557429595514==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BzI6JdR1d6DrVYK+"
Content-Disposition: inline


--BzI6JdR1d6DrVYK+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 04:22:22PM +0800, Yu-Chien Peter Lin wrote:
> Hi Conor,
>=20
> On Mon, Oct 23, 2023 at 01:03:53PM +0100, Conor Dooley wrote:
> > On Mon, Oct 23, 2023 at 08:40:57AM +0800, Yu Chien Peter Lin wrote:
> > > Document the ISA string for Andes Technology performance monitor
> > > extension which provides counter overflow interrupt and mode
> > > filtering mechanisms.
> > >=20
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > ---
> > > Changes v2 -> v3:
> > >   - New patch
> > > ---
> > >  Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml =
b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > index 5e9291d258d5..e0694e2adbc2 100644
> > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > @@ -246,6 +246,13 @@ properties:
> > >              in commit 2e5236 ("Ztso is now ratified.") of the
> > >              riscv-isa-manual.
> > > =20
> > > +        - const: xandespmu
> > > +          description:
> > > +            The Andes Technology performance monitor extension for c=
ounter overflow
> > > +            and privilege mode filtering. For more details, see Coun=
ter Related
> > > +            Registers in the AX45MP datasheet.
> > > +            https://www.andestech.com/wp-content/uploads/AX45MP-1C-R=
ev.-5.0.0-Datasheet.pdf
> >=20
> > Does/will this PMU function identically on the other CPUs that support =
it?
>=20
> Yes, I can confirm that.

If there's a more generic document available, that'd be good.
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--BzI6JdR1d6DrVYK+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTpzGgAKCRB4tDGHoIJi
0uXdAQCoseBoG7Xs6hmuy7UdTh5kG8f+pMwygEI1z4FoVKXYlAEAttRxz9XXoQKp
UzeNDgGlP1WLp7aj7fbSai8IToBZtgM=
=eR7X
-----END PGP SIGNATURE-----

--BzI6JdR1d6DrVYK+--


--===============0645501557429595514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0645501557429595514==--

