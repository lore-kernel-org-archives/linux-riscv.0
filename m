Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56833C4707C
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jan 2024 00:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAYF+/SWrTfqJp17INiw4etijMmXcuLjB+YVbqh5gio=; b=r65EtkDNO9V9koV6t6QQWkaZqi
	HJBLNXIdA7LdcjJNlVrdi9bgyLT5TFXkGez9po0Ri+UdDBAW87wIG/ARa/10VuC5XFbHn3DPKtNt6
	bh1ssXNhgAWYw+eF20f+YFjTR9kGYe+jzzBE5xrfAdkibu0W/lf+TIFED5a3JahuMX2UjnGZauq7d
	Zsgw/y/jgNmzgyx1KEyvWjdfMms5I7hAj62He2Qt3DfnMVhrfdXcykw6o0zDm1tdYI91vnsiIRMJx
	j9okOdrw7n618srhZQBMr5rqc+Ebz4d3UECAFY92tbFbhWhaieYPds/klJqhwVNhxhmHboF3qDI0J
	EXESToIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rORkI-004JxA-3A;
	Sat, 13 Jan 2024 00:19:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rORkF-004JuC-0a;
	Sat, 13 Jan 2024 00:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D73760B2E;
	Sat, 13 Jan 2024 00:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1428CC433C7;
	Sat, 13 Jan 2024 00:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705105154;
	bh=jkYHmyccI1i0Ro3AnbMF7bjGr5rPQLyGrDauXfxXpDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XLmCdfswI58RUzss1uuJ0ktawrWsZUBtQj+a6Ep/XyC4PAZ5Ze5y4X6DdsPXVVa2n
	 aJnYdXmdsy3EU+Fnkl24ZjoPqp4RaDaG+auyHTCo2TuYHQKjbobfa6oaG8mGRGmkDR
	 Xxr3mCSxf5axMay7yjiSJ6d9TqU3hACc5b9rK06j1dI7b5GHsiwPSg67WLkNUJxnXU
	 DrqAkQVtVD35t8xAdWjPQqIfUdMRw0l4qPIEOM8qic3d1518GZukE0EdZKKS/x5EL1
	 MacBhfkQnOEblZmKk1O33hrIXuC7ZAsaBNUciaRf5J6sB+UskC60LvOfSNkjQr21nq
	 XFn6IhthHn6Vg==
Date: Sat, 13 Jan 2024 00:19:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v7 04/16] dt-bindings: riscv: Add Andes interrupt
 controller compatible string
Message-ID: <20240113-sensuous-scraggly-dee35f3e213f@spud>
References: <20240110073917.2398826-1-peterlin@andestech.com>
 <20240110073917.2398826-5-peterlin@andestech.com>
 <CAOnJCUJ0fN5=+b4jDx+NPqUwgwGKuBNYt7d86dXYNyjzUYFAWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCUJ0fN5=+b4jDx+NPqUwgwGKuBNYt7d86dXYNyjzUYFAWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_161927_304887_4967C877 
X-CRM114-Status: GOOD (  25.30  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, Yu Chien Peter Lin <peterlin@andestech.com>, samuel@sholland.org, anup@brainfault.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, paul.walmsley@sifive.com, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: multipart/mixed; boundary="===============8787532684328994892=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8787532684328994892==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9j3hNYTLiVCjPwOZ"
Content-Disposition: inline


--9j3hNYTLiVCjPwOZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 03:50:15PM -0800, Atish Patra wrote:
> On Tue, Jan 9, 2024 at 11:40=E2=80=AFPM Yu Chien Peter Lin
> <peterlin@andestech.com> wrote:
> >
> > Add "andestech,cpu-intc" compatible string to indicate that
> > Andes specific local interrupt is supported on the core,
> > e.g. AX45MP cores have 3 types of non-standard local interrupt
> > which can be handled in supervisor mode:
> >
>=20
> PATCH1 in this series renames everything from ANDESTECH to ANDES to be
> consistent.
> Here you are adding DT binding with "andestech". Is there any
> fundamental difference between these two to demand
> this change ?

This one is the vendor prefix and the company has been assigned
"andestech" and they're not getting a second one. The rename of the
variables is a bit gratuitous tbf.

Cheers,
Conor.

> FYI: I don't mind either way as I don't have skin in the game. Just
> something I noticed while reviewing the series.
>=20
> > - Slave port ECC error interrupt
> > - Bus write transaction error interrupt
> > - Performance monitor overflow interrupt
> >
> > These interrupts are enabled/disabled via a custom register
> > SLIE instead of the standard interrupt enable register SIE.
> >
> > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Changes v1 -> v2:
> >   - New patch
> > Changes v2 -> v3:
> >   - Updated commit message
> >   - Fixed possible compatibles for Andes INTC
> > Changes v3 -> v4:
> >   - Add const entry instead of enum (Suggested by Conor)
> > Changes v4 -> v5:
> >   - Include Conor's Acked-by
> >   - Include Prabhakar's Reviewed-by
> > Changes v5 -> v6:
> >   - No change
> > Changes v6 -> v7:
> >   - No change
> > ---
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Docume=
ntation/devicetree/bindings/riscv/cpus.yaml
> > index 23646b684ea2..33c2b620a59f 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -101,7 +101,11 @@ properties:
> >          const: 1
> >
> >        compatible:
> > -        const: riscv,cpu-intc
> > +        oneOf:
> > +          - items:
> > +              - const: andestech,cpu-intc
> > +              - const: riscv,cpu-intc
> > +          - const: riscv,cpu-intc
> >
> >        interrupt-controller: true
> >
> > --
> > 2.34.1
> >
>=20
>=20
> --=20
> Regards,
> Atish

--9j3hNYTLiVCjPwOZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaHW9gAKCRB4tDGHoIJi
0k35AP9VKffvTBJtcf4LlW9yLeSkC4w/hmPUD8G6HFAB6oraGAEA3gp73X31G721
TR1o3EqGGSx+AvLvQPGz0Q4EWLyWFQc=
=ur8w
-----END PGP SIGNATURE-----

--9j3hNYTLiVCjPwOZ--


--===============8787532684328994892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8787532684328994892==--

