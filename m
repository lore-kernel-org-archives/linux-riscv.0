Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671BDC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 20:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nIAV7BddI1dddOrcwXkumomSG1Ar/n4+mzyY3IgnlM=; b=n5sJgDBlcQigCT4xwCtXNdoVKg
	BAw/vcjGyiXYeghDnhP/mV069fIxbWZ8x1QvnFm/+YEZD0vKysylP9gDiBorEdC12PKpDdMcfqlzL
	pkOl/F5hkm9IXl8Msfxf477rQ2BUxRGZbZ6gl4u03Gqrc00W2too7nkVhZ7AoVY4p6BBsErj6mwhY
	EtNR71fVVo/hE2pojwfVvaiLHC9Mevm3Uqmi8O5oTVS/t8pPDu+8aBa0morVDbAQwWNZe2ihVkSdV
	QNPVna5KTw94TtJ7h6NnpOqKckmh5VtvPlDZOjOq7DoZNWo/q0mUEjytBOCU4KfP79vx45hEP+/bC
	YSj1ZVKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyJ5-00CKXG-Vj; Fri, 20 Jan 2023 20:48:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyJ2-00CKWW-TH
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 20:48:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E8F562003;
	Fri, 20 Jan 2023 20:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F3BC433EF;
	Fri, 20 Jan 2023 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674247691;
	bh=HLJz5mVXt+pHy3+fwjL5Cb4NBiJCx55ZoB36nq8D6y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/42VN/+vvPkBrILi7fgsYKOcd32Jkk1apuhCWlIHw4UkYn2t5ESvhcePsFACYhB9
	 q8eR1otdpqog/vZ0V2HERjTGp7jOixGvHHFKp1IBPtwajNJ9VeHIBC+3z8IFWgv6lL
	 V29x+M3OQJBoXUNLIfNL3xqFw7VuGJvaOVU1Z8/vk3ShRSxpuQV6oOpBduEEzaz3+Z
	 Ocn/g7s4J3DumXs/Y/gVD3uep1UXSdWUgQO2TWaQG0CwLnt8u7ZnSxxCV5pClU11KO
	 S3+8B6i9pfuLO9RjNeEHfiJ+8/4dBZ5J9Gryd6EylT6ezemUcsq2VCmhICTd0S6k/Z
	 nydhIGDb5Yv7Q==
Date: Fri, 20 Jan 2023 20:48:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yimin Gu <ustcymgu@gmail.com>, Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v1 1/2] riscv: Kconfig: Allow RV32 to build with no MMU
Message-ID: <Y8r+B3TZpeI32iTz@spud>
References: <20230119052642.1112171-1-Mr.Bossman075@gmail.com>
 <20230119052642.1112171-2-Mr.Bossman075@gmail.com>
 <Y8pJ4y7FyBDQPqIT@wendy>
 <056f0d30-d340-fdc4-3744-1cdedd8b4048@gmail.com>
 <Y8r9GuyUAfJWYY5Z@spud>
MIME-Version: 1.0
In-Reply-To: <Y8r9GuyUAfJWYY5Z@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_124813_068535_5F167334 
X-CRM114-Status: GOOD (  38.77  )
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
Content-Type: multipart/mixed; boundary="===============4078171066220863186=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4078171066220863186==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eI6pjRJiLt/IAbwd"
Content-Disposition: inline


--eI6pjRJiLt/IAbwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 08:44:10PM +0000, Conor Dooley wrote:
> On Fri, Jan 20, 2023 at 12:39:06PM -0500, Jesse Taube wrote:
> > On 1/20/23 02:59, Conor Dooley wrote:
> > > Since you'll have to re-submit, making sure that allowing !MMU on rv32
> > > doesn't break the build due to canaan k210 drivers being enabled desp=
ite
> > > relying on 64-bit divisions, I've got some nits for you.
> > Not sure what driver needs 64bit, but sense !MMU was only selected by 6=
4BIT.
>=20
> LKP reported a build error for it:
> https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
>=20
> > This should work.
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index 69774bb362d6..b9835b8ede86 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -43,7 +43,7 @@ config SOC_VIRT
> >=20
> >  config SOC_CANAAN
> >         bool "Canaan Kendryte K210 SoC"
> > -       depends on !MMU
> > +       depends on !MMU && 64BIT
> >         select CLINT_TIMER if RISCV_M_MODE
> >         select SERIAL_SIFIVE if TTY
> >         select SERIAL_SIFIVE_CONSOLE if TTY
>=20
> I don't think this is the correct fix for the problem - the drivers
> really should not do implicit 64-bit divisions IMO.
> Linux has division helpers for them in math64.h.
> None of the other SoCs have a dependency on 64BIT and I'd not been keen
> on adding on here.
>=20
> I suspect the fix is as simple as the below, but I'd need to go test it.
>=20
> Thanks,
> Conor.
>=20
> --- 8< ---
> From ecfa79ad1b24f68cfccb77d666e443293d52d066 Mon Sep 17 00:00:00 2001
> From: Conor Dooley <conor.dooley@microchip.com>
> Date: Fri, 20 Jan 2023 20:36:29 +0000
> Subject: [PATCH] clk: k210: remove an implicit 64-bit division
>=20
> The K210 clock driver depends on SOC_CANAAN, which is only selectable
> when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
> have been sent for its enabling. The kernel test robot reported this
> implicit 64-bit division there.
>=20
> Replace the implicit division with an explicit one.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel=
=2Ecom/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Since it was always guarded such that it only ever built for 64-bit, I
> am not sure that a fixes tag is needed, but it would be:
> Fixes: c6ca7616f7d5 ("clk: Add RISC-V Canaan Kendryte K210 clock driver")
> ---
>  drivers/clk/clk-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
> index 67a7cb3503c3..17c5bfb384ad 100644
> --- a/drivers/clk/clk-k210.c
> +++ b/drivers/clk/clk-k210.c
> @@ -495,7 +495,7 @@ static unsigned long k210_pll_get_rate(struct clk_hw =
*hw,
>  	f =3D FIELD_GET(K210_PLL_CLKF, reg) + 1;
>  	od =3D FIELD_GET(K210_PLL_CLKOD, reg) + 1;
> =20
> -	return (u64)parent_rate * f / (r * od);
> +	return div_u64(parent_rate * f, r * od);

Nope, that's wrong. I omitted the cast...

	return div_u64((u64)parent_rate * f, r * od);

>  }
> =20
>  static const struct clk_ops k210_pll_ops =3D {
> --=20
> 2.39.0
>=20



> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--eI6pjRJiLt/IAbwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8r+BwAKCRB4tDGHoIJi
0lIiAP9JEWs8JgsWVeOrMTPG5dN2vOcAFqgntTONudKYjMh8PQD/VL9eO7dqi1SC
VejMrIZYqYtonWbl99n60ESam8WynQk=
=HAcZ
-----END PGP SIGNATURE-----

--eI6pjRJiLt/IAbwd--


--===============4078171066220863186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4078171066220863186==--

