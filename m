Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0E9C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDicvf1ckaLzEjggicSqcMLE05zdH9Ch7ZlSFsG9mJg=; b=bvHHIGlH3IqlWMrsFUAjE0oGdO
	YPLpfZ9FDWKp4OwVd3xYMTm5dVpVje8+OBNVEQwVFH3U/xk4jMwbdP8CEYaqObHqiWp9fS4IImmOV
	a7SFvA21YZ4bNeqrl303yAxId4HqGddX2avItpCs6N3L9CvvqWizm7PZqhyjGEXhzdRt7Onic04TC
	G2CDpe3uFoohhsqMKMAIRNytmVTCdtZNQfCFKpJXujGRXmNMepE3XwKlFJM7HiZt21VEFHFM/jrk9
	1961vN0eqyin33NoH0Qp6I4fMAHEj5OToOO3X84kg8C4bzT2Oz56Ci3KEF4mx5TPNUSs2XVMOhqfN
	iVQRTgKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2YuU-002tYS-2A;
	Fri, 26 May 2023 14:59:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2YuR-002tXd-06
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 14:59:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A069650A9;
	Fri, 26 May 2023 14:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59389C433EF;
	Fri, 26 May 2023 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685113153;
	bh=sitqOm/6zJmBP4jWENyUeSzOhGYn9pOlxdwDFtsAhwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWkNqRad42i5yqHE7tRSrudeWxWuGOe2HcG7AmlwQH3CUEn/SdPmrsr+3s9VuOAYj
	 k/CwqrBP531RCmx6kscDU8EXUQkS9Nwro3dVEphqfiNTPE3NRd2m7lcMTL5czl4Suv
	 qoJvju4aWRuWypFyq6zWlkya2M/GumcxXFOmM1hRav3WZb4ti1sWe4qRXNQ0FMpR9s
	 T9V6+OBWsustn9Vf/ExJOEyYvPx+bFem9o5OgrNoePFUM1MQ1P8mA3Q1ZuIf0qXqwk
	 QSd0qmrrRzp+O8csEq6dBOFLn6s+LU5miSQAPnkmk4bTOfu4it4V9EJmrPGHtjAYAm
	 FLy2XEj6P0Mxg==
Date: Fri, 26 May 2023 15:59:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>, robh@kernel.org,
	jeeheng.sia@starfivetech.com, linux-kernel@vger.kernel.org,
	palmer@rivosinc.com, leyfoon.tan@starfivetech.com,
	mason.huo@starfivetech.com, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Song Shuai <suagrfillet@gmail.com>, linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230526-steep-omen-a5a46a1086bf@spud>
References: <20230525-shrapnel-precut-26500fca4a48@wendy>
 <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
 <20230525-citric-waged-a2f78d27eb0c@wendy>
 <CAOnJCULfC0jmiucLNMeJZwJf4QbGAN6r4B-ubUbP16KVpxrCfA@mail.gmail.com>
 <20230525-flaring-trading-f2bf0713ae26@spud>
 <CAOnJCUK_EgX-En1QNS8yX1WA1nj8w2kpvXMQcvgWuR3dvzEQYw@mail.gmail.com>
 <20230525-desecrate-imposing-d97ab34e06ad@spud>
 <CAOnJCUKfRv68Bh8ue=ZhMGxai9_UEHLpm3553g2c2NXh-RP-TQ@mail.gmail.com>
 <20230525-batting-botch-7e03393a2d97@spud>
 <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubiDezbwZO6X2btvgpq-XqHnxZjXzaMnSK2YrHc_ioLx8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_075915_153318_703BB87B 
X-CRM114-Status: GOOD (  27.37  )
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
Content-Type: multipart/mixed; boundary="===============0350963661735009316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0350963661735009316==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ef3JPkhRFJJ4TK9g"
Content-Disposition: inline


--ef3JPkhRFJJ4TK9g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 03:14:33PM +0200, Alexandre Ghiti wrote:
> Hi everyone,
>=20
> On Thu, May 25, 2023 at 11:24=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, May 25, 2023 at 01:06:04PM -0700, Atish Patra wrote:
> > > On Thu, May 25, 2023 at 11:39=E2=80=AFAM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > >
> > > > On Thu, May 25, 2023 at 11:37:40AM -0700, Atish Patra wrote:
> > > >
> > > > > Any testing of hibernation still needs to revert the patch until =
we
> > > > > have the proper fix.
> > > >
> > > > "the patch" is what exactly? I assume you don't mean depending on
> > > > NONPORTABLE, since that is a Kconfig option.
> > >
> > > Nope. Sorry I meant the commit
> > >
> > > 3335068 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
> >
> > Ah, if your SBI implementation is one of the affected ones, yeah.
> > If not, you can just set NONPORTABLE :)
>=20
> @Bj=C3=B6rn T=C3=B6pel emitted the idea of excluding from the hibernation=
 all
> the memory nodes in the "/reserved-memory" node
> (https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/devicetre=
e/bindings/reserved-memory/reserved-memory.yaml):
> I have to admit that I don't see why it is not done by default by the
> kernel.

My understanding was that it was perfectly fine to use reserved memory
nodes to fence off some memory to use in device drivers etc, which then
may need to be saved/restored.

> Unless there is stuff in this node that needs to be "hibernated", I
> think that would be a very good solution since we would not rely on
> the name of the "internal" nodes of "/reserved-memory" (i.e.
> "mmode_resv").
>=20
> I'm digging into why it is not done by default, just wanted to have
> your feedback before the week-end :)

--ef3JPkhRFJJ4TK9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHDJOwAKCRB4tDGHoIJi
0l3QAP47nHaHce2IUnUL/pN8daI31zZR83VfWQj28DyW4rjhsQD/RQnT/DzFIfIE
GegmPqf0UP9KetTHlacsi+MttWjg0AY=
=zVRf
-----END PGP SIGNATURE-----

--ef3JPkhRFJJ4TK9g--


--===============0350963661735009316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0350963661735009316==--

