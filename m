Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C46EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 18:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vl0pdnO0tL2g/m6BoGUYIXHlOs4fNOWUI3ma12S9v5g=; b=Im65R+OzkGmEiRVs1MA3OmaSyD
	disxiGA+pDy5+UaRuUTRNGTURPPvMaKfFR8ssnWKvuYQmWiN1An5gooQ5iFFwMkPW200+jFGGPGGf
	M6G0Qlh28BCtZOWJbcn4ZrSsNJQH2hwcJlgmSFURc1DvsnbeEZlFvHw1goo94TUHbJ2w7OznBJXCV
	vSgL0/sumZhb4LoV5Hv4gJU90+4Q22bkjIjsG6pYpIk43fIwmYc69soOASW4Hd3Mv5ZwmQd/KioH0
	y1Ifz0j/eAgdvi5M2CFki9K2GMbkzUQ7wSTK2P/H2Zkl9TOP//ObOMFjmKm+6KuiXn/XNThIkzHyL
	gbWY8W+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJ1q-004KHg-1t;
	Fri, 30 Jun 2023 18:39:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJ1n-004KHA-1r
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 18:39:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CCC1617E9;
	Fri, 30 Jun 2023 18:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D9C433C9;
	Fri, 30 Jun 2023 18:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688150369;
	bh=JbGXqFMUL4n0IXDBBVJY0wDuDAmp//TQtfDTWQWC1S0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHWU2HJsleIlof4nj8Jezwrh779vlPlDUF/E19/a8nRNhPg0nyO1iycU0B1Vp1w3a
	 eOneXB9PV9oAQkCaabaVFi+qWqKe0ASFeB4uKYXQDUU247VO40VWKzIRY4U4gVwgvg
	 AEiFHBMkmd23uILQI7joEgd80EDaPtdRf5C7xFYwdK3ZMWCqqrSu6fN2Lg+LDM1iE+
	 nn0J5LREsxGsH3T15/rhFJBpOoCDyIfYXmXTK0sDQh/sd7iF4OrquzvHP5HTCj/AFf
	 h/LjnNc+0kBnODOcDqdf2puXiQP6TdQn1o8RSF8V8NK0IZcuePfWWchJMETCQfdVjf
	 QPtHjSVng1oTA==
Date: Fri, 30 Jun 2023 19:39:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>
Subject: Re: [PATCH V2] riscv: Add BUG_ON() for no cpu nodes in devicetree
Message-ID: <20230630-blasphemy-tapestry-85755d24cbc3@spud>
References: <20230630105938.1377262-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230630105938.1377262-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_113931_694986_04EC0291 
X-CRM114-Status: GOOD (  22.79  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, evan@rivosinc.com, paul.walmsley@sifive.com, greentime.hu@sifive.com, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Type: multipart/mixed; boundary="===============2387514321646820659=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2387514321646820659==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pEfCFaD3T3JEELWO"
Content-Disposition: inline


--pEfCFaD3T3JEELWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:59:38PM +0800, Song Shuai wrote:
> When only the ACPI tables are passed to kernel, the tiny devictree created
> by EFI Stub doesn't provide cpu nodes.
>=20
> While if append the "acpi=3Doff" to kernel cmdline to disable ACPI for ke=
rnel
> the BUG_ON() in of_parse_and_init_cpus() indicates there's no boot cpu
> found in the devicetree, not there're no cpu nodes in the devicetree.
>=20
> Add BUG_ON() in the first place of of_parse_and_init_cpus() to make it cl=
ear.
>=20
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>

I'm still not really convinced that this is needed - not finding the
boot CPU is a strong a hint as any that your DT is completely broken.
Especially if you intentionally go out of your way to disable ACPI on a
system that requires it to boot.

I'll leave it up to Palmer or whoever to determine whether this is a
valuable change. Code change itself much improved though, thanks - I'd
give an R-b/A-b other than that I question whether there's any value in
adding another BUG_ON(). You could've kept the part of the comment that
explained what the error meant though, but that's not a big deal.

Thanks,
Conor.

> ---
> Changes since V1:
> https://lore.kernel.org/linux-riscv/20230629105839.1160895-1-suagrfillet@=
gmail.com/
> - revise the commit-msg and move the BUG_ON into of_parse_and_init_cpus()=
 as Conor suggests
>=20
> ---
>  arch/riscv/kernel/smpboot.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 6ca2b5309aab..04d33afbdf55 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -147,6 +147,8 @@ static void __init of_parse_and_init_cpus(void)
>  	int cpuid =3D 1;
>  	int rc;
> =20
> +	BUG_ON(!of_get_next_cpu_node(NULL));
> +
>  	cpu_set_ops(0);
> =20
>  	for_each_of_cpu_node(dn) {
> --=20
> 2.20.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--pEfCFaD3T3JEELWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8hXAAKCRB4tDGHoIJi
0n0fAQDjUvMTHOr4kKEEdu3GUgoPc+gt3psWvOlqlbuqIZRUbgEA/2rTzeDYuN95
qa96Tk5EV4N8Xwu5/juvgz8Ob3nQ5AA=
=Y0wJ
-----END PGP SIGNATURE-----

--pEfCFaD3T3JEELWO--


--===============2387514321646820659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2387514321646820659==--

