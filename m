Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9035EB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZR5t6mhiuebYayQAWGPkZTLxENcFUchFqTNrc1dSQ0=; b=rwUETOSb0qAHYYcScwiwEt3Sqc
	x9fEp4zCDuPbop2zBVEsikiVtdFxGrfoeZuxEHndyYewhaWLPOVLDEn2QrKFxdj0YI0CX6OiCMtL2
	QWHc0h3BQ2BBH+S9CHQ/yC8RvfeJH7yrot7LTx99hP2nRcBhXszw8KHfnT4KwtcLkDjvGEO76Tw8C
	9gXlrwwfe80w7V1wtlR6TumbFbT+/W8/nunjNDuTkKLvyq1eTsn1JAnS2xnMXBrOk0+aaLGcNlmwk
	O3apfau8oivCgk5FVcSmyQe9asPjJ1SU3KXTwq1zEz+LmuRgEe32FYvkzS5HIBvYKedS8iWBSOK0K
	2aqDxb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZCO-00GJKl-2H;
	Wed, 28 Jun 2023 17:43:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEZCL-00GJKA-2Y
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:43:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 471C261408;
	Wed, 28 Jun 2023 17:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EEFC433C0;
	Wed, 28 Jun 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687974200;
	bh=DigUiMepEKZdpHMPnpx95fJpEWDaT/7V9w+BxtVC7MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VU27FEMGNX7uLNDp3McHl6GNJMB5ErsahJsW4e9nUmvJxj0MpsU25chnCjvQ1uL0K
	 4GpFU2m7sSJO+j1nW2wWRD7jXl4G50U5jcGM4AW0e1kiKdQxl4TnLpjaJfVljtaKJN
	 bspgesvLD/sPcVRNqAc/ujhS342ec46lPfoHu0OB0DmCnia/xQCQ8wjuDZgpSoCgu7
	 1dE0bCEezgL54Vn/yltVu9Aoe9w1DbZhKuMwfw9YcIo3jJGjMTlTKR56gSGbP1c39f
	 7RvYs+Dt6s9ZK9vJszZlui9OrDVZkFb+excIzKhfJ1bKnhCnNkMV9rsqJ50malblT6
	 QwaXTZrA7hV6w==
Date: Wed, 28 Jun 2023 18:43:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 6/9] RISC-V: add single letter extensions to
 riscv_isa_ext
Message-ID: <20230628-gizzard-trading-a5f9785128b5@spud>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-sensuous-clothing-124f7ae0aedf@wendy>
 <CALs-HstDV3PjBk_8WDecwuvVK9rno1CKFzT1+8ohoUXE7X0GwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HstDV3PjBk_8WDecwuvVK9rno1CKFzT1+8ohoUXE7X0GwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_104321_906501_E91E8BC1 
X-CRM114-Status: GOOD (  23.86  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============2369215172257651894=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2369215172257651894==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IEb0IsuCCuZUv+Ab"
Content-Disposition: inline


--IEb0IsuCCuZUv+Ab
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 10:33:20AM -0700, Evan Green wrote:
> On Mon, Jun 26, 2023 at 4:21=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > So that riscv_fill_hwcap() can use riscv_isa_ext to probe for single
> > letter extensions, add them to it. riscv_isa_ext_data grows a new
> > member, signifying whether an extension is multi-letter & thus requiring
> > special handling.
> > As a result, what gets spat out in /proc/cpuinfo will become borked, as
> > single letter extensions will be printed as part of the base extensions
> > and while printing from riscv_isa_arr. Take the opportunity to unify the
> > printing of the isa string, using the new member of riscv_isa_ext_data
> > in the process.
> >
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/hwcap.h |  1 +
> >  arch/riscv/kernel/cpu.c        | 36 ++++++----------------
> >  arch/riscv/kernel/cpufeature.c | 56 +++++++++++++++++++++-------------
> >  3 files changed, 46 insertions(+), 47 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index a35bee219dd7..6ad896dc4342 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -77,6 +77,7 @@ unsigned long riscv_get_elf_hwcap(void);
> >  struct riscv_isa_ext_data {
> >         const unsigned int id;
> >         const char *name;
> > +       const bool multi_letter;
>=20
> Instead of defining a new member, could we just infer this by making a
> macro like #define MULTI_LETTER(name) (name[0] && name[1])?

Or don't even try to be clever like this and just call strnlen on the
name & check if it is 1? It's only used in 2 places.

--IEb0IsuCCuZUv+Ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJxxMwAKCRB4tDGHoIJi
0hp+AP91DhkjewdtfZP1vKzJeISjYAdB7Bdm2bRrgqMPsu3f1AD/VqublU31lGDa
NFdXAaLNImqjgRoRJ3JGTBfpN5735AM=
=udNR
-----END PGP SIGNATURE-----

--IEb0IsuCCuZUv+Ab--


--===============2369215172257651894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2369215172257651894==--

