Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A64CF857C
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 10:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQAlHwTRB8VZbAZJPwXuA6BZ5GNUcPH/3N0y1O3Htgw=; b=RJWk4vCUXEvmLNX5ic/NIqjtVE
	Fcr0iWrXJy4zsi03I1nz6muAssY9TTe9vdaT/zSWVtJvpPNBdlQVIP08MtYkvUdnxS/FzT2NLhfo0
	AW11jF6JWD7eHZBLyO2KzEv0ThyRlI5ptpFeJVMlVx4J50F2dTkD2Ib5ykEiuZ8k8gRGb4tGB8ocq
	Vgt6gpRIMUbmoGjqpd1LRum65xh5r6sLdvrSd7q8oaB4mQfXL4IL+ubEHoPfJ7zhDv4pJFLmmJUGk
	vHRICXf51VTxnkJ5O67evaTdoESEHPIyupef2Q/FEXS4ntMgO9pY9jw/VZfjhR6T1CN6jfaTwwmmF
	yfFNGE5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJWJ-00000008qAQ-2FSb;
	Thu, 03 Oct 2024 10:57:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJWD-00000008q9m-0ykh
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 10:57:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86F135C59CA;
	Thu,  3 Oct 2024 10:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6414BC4CEC5;
	Thu,  3 Oct 2024 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727953032;
	bh=lW5/aA3G67iZr2w6iM+wouTZ9PieLhmJS7salj68Teo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1nOdzJ67ejd17CGrPzr70Q3qDMFfZmk2fH1J86zpfGDFdM2LZ1rm0zYMz2tESZOz
	 i3aLk3z2ICzgP9siSD76TpY4Z0QnKiPIgbQu4HfEHPmWyk4+pa+HVA8E7B58E+Ywu2
	 nmssgtX37oKcQGPBrrGnl3RM7LJ1RLLARkOOJec1+6HjCFrL0bMVDdXwtPaPKCddpX
	 MchD7fKFtxIg3QLnA43C/g9yKjXZTrLE8XLoQJDL5b75sy0jgxcsMIVuGi/9CRG2SY
	 Ieww/7NLZli6/f60Jd/v/ugOwpEsdpu51LMEmN1C39/+UAnvoEGdG+oQC/19DJOHpA
	 p3kg6qkHLqvpw==
Date: Thu, 3 Oct 2024 11:57:08 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v1 2/5] RISC-V: add f & d extension validation checks
Message-ID: <20241003-flagship-agreeably-5df992b50618@spud>
References: <20241002-defeat-pavestone-73d712895f0b@spud>
 <20241002-stuffed-trance-1323386dd80b@spud>
 <6b735be2-93d2-4cc2-b690-438f6e71cf0b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <6b735be2-93d2-4cc2-b690-438f6e71cf0b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_035713_387485_1889CED0 
X-CRM114-Status: GOOD (  24.83  )
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
Content-Type: multipart/mixed; boundary="===============8191414527451697989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8191414527451697989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uBRiSkFYYfARJUOC"
Content-Disposition: inline


--uBRiSkFYYfARJUOC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2024 at 09:49:51AM +0200, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 02/10/2024 18:10, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the floating point extensions.
> >=20
> > The check for "d" might be slightly confusingly shorter than that of "f=
",
> > despite "d" depending on "f". This is because the requirement that a
> > hart supporting double precision must also support single precision,
> > should be validated by dt-bindings etc, not the kernel but lack of
> > support for single precision only is a limitation of the kernel.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpufeature.c | 36 +++++++++++++++++++++++-----------
> >  1 file changed, 25 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 84a2ad2581cb0..b8a22ee76c2ef 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -101,6 +101,29 @@ static int riscv_ext_zicboz_validate(const struct =
riscv_isa_ext_data *data,
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
> > +				const unsigned long *isa_bitmap)
> > +{
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
> > +		pr_warn_once("This kernel does not support systems with F but not D\=
n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (IS_ENABLED(CONFIG_FPU))
> > +		return -EINVAL;
>=20
> Shouldn't this be !IS_ENABLED(CONFIG_FPU)) ? I mean, if the f extension
> is enabled but not CONFIG_FPU, then disable it.

Of course. I wonder how my userspace didn't blow up.

--uBRiSkFYYfARJUOC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZv54hAAKCRB4tDGHoIJi
0urMAP9vnpPnNEIzZU6g+gTkhAI3tiTM4cxcg8onIB2X4bm7PAEAwH+RtvErh42o
oyWpKScFE/nYaxMZCoJlcxn+ZVfsVwI=
=HwoX
-----END PGP SIGNATURE-----

--uBRiSkFYYfARJUOC--


--===============8191414527451697989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8191414527451697989==--

