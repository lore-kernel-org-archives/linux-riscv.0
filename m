Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6015BC61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejBE9Y3MT/5hD4RWrPWPoyYnearGPGXjXfdlk4MDrKM=; b=aGZQRoIrw9dmmCYo4djWP5f5B/
	qlXdy37tVkDj2QQyu/MMWFa4X0X18RHaJscBGKIO73RpO73GDWlQ0hXT5lQwX87uLhUxlx+RJ/s2x
	G2KuI5F/75CFFc3Frud+QsDWU1sNJ3XY8JpOgth7fwuxmM4oAmWhupKloyvIXuOJp1flDEHeHXFkM
	X9aIyURT1867VfM8sUoF3b7hRcpNMzlRt+En9VqK6/PnvUtQ7xUe5blL+U2bIwyilu9IDwNZ0wVqq
	zUdNPDT4ypL1Qfzfg9XhIv8VcK5gKioLHXz/7sHfrQzm52DL0IfTUSe2Eb0l54bI8dvc7da+tgWoT
	V0rW03yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XlZ-007V7M-2Y;
	Fri, 24 Nov 2023 15:06:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XlU-007V5e-0O;
	Fri, 24 Nov 2023 15:06:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4551CE29F8;
	Fri, 24 Nov 2023 15:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7D9C43395;
	Fri, 24 Nov 2023 15:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700838357;
	bh=W6AcqzGG834X7Fnc1UesSToakM1vJZCmLFY+BobYw5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uaoFZYrBiO3kZphuGBjihIKIKUCMOApnXvYR1zIFol9BJfuQ28O9efIrmvj1Za6xd
	 quIZitQbBWw78wUv4dr5ZBdM1Pje08v9/aB/8V1Zo/vGxwLXCffJvfPF5rYQl//gam
	 aGhwDvxGAHY5LeSGttX3wCaWMipeJw6Ic/4qTHiSWl9csFx95vPcmItREKo1sIG+gA
	 nxcaIJHRPj37fGKOWCYJTWo9w+M/75RLhPgY6VOXE4VwnhYZH0U/D/XwaWfc0ItpzY
	 qJg3IjdIlPczQ0fd24mFKl6lqGX2T211GbkYIVM8OSOV1T0aENh3kvVjX6jYo6FQ5e
	 XmuGmH5A1SJlg==
Date: Fri, 24 Nov 2023 15:05:46 +0000
From: Conor Dooley <conor@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 04/13] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
Message-ID: <20231124-nemesis-vanity-a92814b5c3a3@spud>
References: <20231122121235.827122-1-peterlin@andestech.com>
 <20231122121235.827122-5-peterlin@andestech.com>
 <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8t+vgrwDe9OxqMNHdcVX+qq76DuskF0ETCri4VeP-FAbg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_070644_520491_EC36B37B 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, jszhang@kernel.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org
Content-Type: multipart/mixed; boundary="===============1746150943523845640=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1746150943523845640==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cF2+7KTXsnpo6E+a"
Content-Disposition: inline


--cF2+7KTXsnpo6E+a
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 03:03:51PM +0000, Lad, Prabhakar wrote:
> On Wed, Nov 22, 2023 at 12:18=E2=80=AFPM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Add "andestech,cpu-intc" compatible string to indicate that
> > Andes specific local interrupt is supported on the core,
> > e.g. AX45MP cores have 3 types of non-standard local interrupt
> > can be handled in supervisor mode:
> >
> > - Slave port ECC error interrupt
> > - Bus write transaction error interrupt
> > - Performance monitor overflow interrupt
> >
> > These interrupts are enabled/disabled via a custom register
> > SLIE instead of the standard interrupt enable register SIE.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > Changes v2 -> v3:
> >   - Updated commit message
> >   - Fixed possible compatibles for Andes INTC
> > Changes v3 -> v4:
> >   - Add const entry instead of enum (Suggested by Conor)
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docume=
ntation/devicetree/bindings/riscv/cpus.yaml
> > index f392e367d673..50307554478f 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -100,7 +100,11 @@ properties:
> >          const: 1
> >
> >        compatible:
> > -        const: riscv,cpu-intc
> > +        oneOf:
> > +          - items:
> > +              - const: andestech,cpu-intc
> given that the first patch renames andestech -> andes, do you want to
> follow the same here?

No, that's their vendor prefix, they're stuck with it.

--cF2+7KTXsnpo6E+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWC7ygAKCRB4tDGHoIJi
0skKAQDHe25no3r1QiuhIMPJ/3Knjbs0n62oqRjWcYDWRV8dMAEA1nbRbhQHzGem
C4VGWHQ58F49vu2OigDkep60E3k4tQs=
=9K1r
-----END PGP SIGNATURE-----

--cF2+7KTXsnpo6E+a--


--===============1746150943523845640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1746150943523845640==--

