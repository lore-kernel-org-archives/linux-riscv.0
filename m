Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F8C54EBE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7Zo4tZA/tZaHkdDJdhob0w8odZ0gD88viqBx6mBaSE=; b=bb4G6IFEVYojz2hirmsX/jS3ci
	wZOoHHtvHHTJIBhgu8b7DbDEG+ugrwZLeOtj+YBJFBav95wQJT9DDNxvwTlcJ7L2LJQzjg8Z4qb+g
	gIU8d5OB1rBdvtSCfW5fgCIYNYxekiCdKDMbvJk8PIhpSQvHS2HOKoXOFj5dWGdz7Iq+4A+6p091E
	JMX89758bm1oaOeWIQCyRjsDn8yk8UxarLyCdoQHLkv0qZkFXyrMHvj0DLE6YIOvFOjsipg4lFA95
	w7buv6C4zOUUn5n1XII67pIZi7Um0VU6DDLCa8cGV4akt+D2vm8KqqadewcpKedXGHZRQLcoZLTF7
	nFmYcv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5Z0-00HGqf-0q; Thu, 12 Jan 2023 21:56:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5YF-00HGJE-NJ; Thu, 12 Jan 2023 21:56:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D90B621B4;
	Thu, 12 Jan 2023 21:55:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2D7C433EF;
	Thu, 12 Jan 2023 21:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673560557;
	bh=PiMWPgePScKOV0uoyAba+JA0J1HRl0Cq4MC1tYQpJ2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ieaVvY3nG9tFozYB829OQL4xsKrLLExAZQQ/gKKeLggpsaa7ibA0jEqO73ITQggos
	 v0TRc4N275UabsCNRMqf0ae6dxvAGVmADjDesNdW4wn24Fweou7DJHu2G49sABOElM
	 fF3ThLKH3cldAsnBbIsBlCvU/srsCqL1G6MXK9QPlQrccCpCRivPbqzOLllK6OkiRA
	 tcd6txb3MbRKzs4cCbOh7GJMHZyVWpTYbeVyHgWjuoyMik23zCm4kk3+9FQHSyoxmF
	 ISmPED5Z+8hgi5nL5LIo10efpRJMggv5sWl9hYbQ81HeUy1Wlh2vvliRWkxuX0tI8A
	 x7oOmaLMRaPyQ==
Date: Thu, 12 Jan 2023 21:55:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, jszhang@kernel.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 10/13] riscv: alternative: patch alternatives in the
 vDSO
Message-ID: <Y8CB6Cy5ZrTMIkFL@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-11-jszhang@kernel.org>
 <Y7+7TRv7+V0nKNiZ@wendy>
MIME-Version: 1.0
In-Reply-To: <Y7+7TRv7+V0nKNiZ@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_135559_943950_C688E414 
X-CRM114-Status: GOOD (  14.93  )
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
Content-Type: multipart/mixed; boundary="===============0964162772952118679=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0964162772952118679==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t6Mgjx3f2BNOzJab"
Content-Disposition: inline


--t6Mgjx3f2BNOzJab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 07:48:29AM +0000, Conor Dooley wrote:
> Hey Jisheng,
>=20
> On Thu, Jan 12, 2023 at 01:10:24AM +0800, Jisheng Zhang wrote:
> > Make it possible to use alternatives in the vDSO, so that better
> > implementations can be used if possible.
> >=20
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>=20
> FYI, from this patch onwards the rv32 build is broken.
> Should be reproduceable with the in-tree rv32_defconfig.
>=20
> Unfortunately no logs for you, I've got a CI bug to fix!

Here's the error:

=2E./arch/riscv/kernel/alternative.c:174:21: error: incompatible pointer ty=
pes passing 'const struct elf64_hdr *' to parameter of type 'const Elf32_Eh=
dr *' (aka 'const struct elf32_hdr *') [-Werror,-Wincompatible-pointer-type=
s]
        alt =3D find_section(hdr, shdr, ".alternative");
                           ^~~
=2E./arch/riscv/include/asm/module.h:115:60: note: passing argument to para=
meter 'hdr' here
static inline const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
                                                           ^
=2E./arch/riscv/kernel/alternative.c:174:26: error: incompatible pointer ty=
pes passing 'const struct elf64_shdr *' to parameter of type 'const Elf32_S=
hdr *' (aka 'const struct elf32_shdr *') [-Werror,-Wincompatible-pointer-ty=
pes]
        alt =3D find_section(hdr, shdr, ".alternative");
                                ^~~~
=2E./arch/riscv/include/asm/module.h:116:25: note: passing argument to para=
meter 'sechdrs' here
                                           const Elf_Shdr *sechdrs,
                                                           ^
=2E./arch/riscv/kernel/alternative.c:174:6: error: incompatible pointer typ=
es assigning to 'const struct elf64_shdr *' from 'const Elf32_Shdr *' (aka =
'const struct elf32_shdr *') [-Werror,-Wincompatible-pointer-types]
        alt =3D find_section(hdr, shdr, ".alternative");
            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
3 errors generated.

Thanks,
Conor.


--t6Mgjx3f2BNOzJab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8CB6AAKCRB4tDGHoIJi
0tFCAP0SCpBMI4iFNNCGroUlQ0Fd+5ofL2sPC2i+e4AjAW6TugD8Do9NPn+zAurA
/29Zj40trR91yfFMsLQgNM2qHVlkZAU=
=kql5
-----END PGP SIGNATURE-----

--t6Mgjx3f2BNOzJab--


--===============0964162772952118679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0964162772952118679==--

