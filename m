Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD696C678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyu2VUKQvp/6RLYQaLkZI03bz0+EFPhhnBMDnR7bJtM=; b=ng3V4spEtnODjQ/3og8nEy2Jlu
	UuOJpDcPgW7vjOV2q3sdLMtZzJ2lu35AusBjxM7qm1jo7HEE6GaJQt3XX5+7M2ZFgtBp9cs2LCoE0
	sTo4z3OgM+09RciWC6AgQFtHuWbRuQ6b8Qrlc3ObAjzke+Bi0ho7iQ8WLrKHEpVljp3yBM53yfj+c
	xM9JTHwnY8JSv2ySBanrLcKe4+pvTlVbxPP8jDtTPibZsa05ZzzfZo0o3fbgKEb+HfUNGBlaI6V7b
	RZt1+DW7j6kg2TYu1wFiOH70R/4hilYKka1St9r/vy5OXJd8GzHGtGlOEtblVOYLdxSvgo7GaxKyS
	6MycpTFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcIn-0024Yf-D2; Tue, 07 Mar 2023 18:44:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcIk-0024Wp-7H
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 18:44:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C23DF61526;
	Tue,  7 Mar 2023 18:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2A7C433D2;
	Tue,  7 Mar 2023 18:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678214681;
	bh=98GSn9Nd5lbsZB8GQDRpBCln3pvxy2GNE1Kh/iUgG4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ci9N7xCRe3wAWKGx/fHN59ZdShHG3aGjM0ECdLco4W7QTTaolajEJDHRwxvUfIbl2
	 JEdttpeYOYKITpWFhrQ8yqGYNxjMeIspbBV7yKxPZAQK3I5HeeJEKokX3QBFsITDmW
	 9V8fMq3OnQktdbltjtKV1bfjg11yg2ZQvNHVgB9RuKE1fSY7Orgz/DmJeDCIadnSAi
	 Rrp5S+qhFFAb7qkLDwhwzqdlBSZHO5aIyprEzfJ3x0t2e4euG1/C/Vp9wBJ17qEr/w
	 iHo/7rodCX7H5a6n6XPg12/FabuzP9TBNbJ4Nww8tewlRAbmb1il3mvTUy2TpzQyHC
	 3DzJX5Sv83O4w==
Date: Tue, 7 Mar 2023 18:44:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>, llvm@lists.linux.dev
Subject: Re: [PATCH V3 00/20] Add basic ACPI support for RISC-V
Message-ID: <a9823561-2e32-49e8-b6c9-73e4b8f8cf8d@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <16007014-c5f2-4b07-baec-e19952236aa5@spud>
 <ZAbGSA6F0kfv9YYw@sunil-laptop>
 <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org>
MIME-Version: 1.0
In-Reply-To: <E7FB4927-1FE6-435A-914E-9615C2AD9D34@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_104442_361620_5FB64588 
X-CRM114-Status: GOOD (  28.61  )
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
Content-Type: multipart/mixed; boundary="===============0636548861375218887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0636548861375218887==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Syeh4y7IR+Jnz+iK"
Content-Disposition: inline


--Syeh4y7IR+Jnz+iK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 07, 2023 at 06:13:22AM +0000, Conor Dooley wrote:
>=20
>=20
> On 7 March 2023 05:06:16 GMT, Sunil V L <sunilvl@ventanamicro.com> wrote:
> >On Mon, Mar 06, 2023 at 09:51:09PM +0000, Conor Dooley wrote:
> >> Hey Sunil,
> >>=20
> >> On Fri, Mar 03, 2023 at 07:06:27PM +0530, Sunil V L wrote:
> >> > This patch series enables the basic ACPI infrastructure for RISC-V.
> >> > Supporting external interrupt controllers is in progress and hence i=
t is
> >> > tested using poll based HVC SBI console and RAM disk.
> >> >=20
> >> > The first patch in this series is one of the patch from Jisheng's
> >> > series [1] which is not merged yet. This patch is required to support
> >> > ACPI since efi_init() which gets called before sbi_init() can enable
> >> > static branches and hits a panic.
> >> >=20
> >> > Patch 2 and 3 are ACPICA patches which are not merged into acpica yet
> >> > but a PR is raised already.
> >> >=20
> >> > Below are two ECRs approved by ASWG.
> >> > RINTC - https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xS=
EqK2l/view
> >> > RHCT - https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR=
-tia/view
> >> >=20
> >> > The series depends on Anup's IPI improvement series [2].
> >> >=20
> >> > [1] https://lore.kernel.org/all/20220821140918.3613-1-jszhang@kernel=
=2Eorg/
> >> > [2] https://lore.kernel.org/lkml/20230103141221.772261-7-apatel@vent=
anamicro.com/T/
> >>=20
> >> Building a clang-15 allmodconfig (I didn't try gcc) with this series, =
and
> >> Anup's IPI bits, results in a broken build, due to failings in cmpxchg:
> >>=20
> >> /stuff/linux/drivers/platform/surface/aggregator/controller.c:61:25: e=
rror: call to __compiletime_assert_335 declared with 'error' attribute: BUI=
LD_BUG failed
> >>         while (unlikely((ret =3D cmpxchg(&c->value, old, new)) !=3D ol=
d)) {
> >>                                ^

> > I am able to build without any of these issues using clang-15. I am
> > wondering whether the base is proper. I had rebased on top of the master
> > and couple of patches from IPI series were already merged in the master.
> >=20
> > Do you mind verifying with my branch
> > https://github.com/vlsunil/linux/commits/acpi_b1_us_review_ipi17_V3?
>=20
> I can check that later I suppose.

That's broken too.

> > Or if you could provide me your branch details, I can look further.
>=20
> 6.3-rc1, with both series applied, sans Anups applied patches.

I've pushed my stuff here, but unlikely that it makes any odds since
your branch experiences the same build issue.
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ borked-acp=
i-surface

My build commands are wrapped in a script, but it's an LLVM=3D1
allmodconfig run w/ clang-15(.0.7) etc.

Chees,
Conor.

--Syeh4y7IR+Jnz+iK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAeGEwAKCRB4tDGHoIJi
0pBJAQC6eUPL8agYJlDStZNq2bNTc9yH0rw+9QH9WnR5mdEIxwD+Ikx1pSDTQT/o
2vHNHYLroiHM+zN28aBpih7YsooWjQI=
=4gdL
-----END PGP SIGNATURE-----

--Syeh4y7IR+Jnz+iK--


--===============0636548861375218887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0636548861375218887==--

