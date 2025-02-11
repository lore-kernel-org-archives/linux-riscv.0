Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953ADC0219B
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FIqzN+fkzzvwlCLYOkyEPBhKvxlyNhscvBHre0Rk+I=; b=pvZznf4tG5W+l9FLUAuxj51KQ9
	dJrpuVebKe0XX/X9mLYcRilDX7EOyZzwxbB093TgOhscLNUEhj2P2UAY/4GRIQf1X0bnRFyHXWjrk
	3dSlaSI7erpUppG5la5jb5/vAWl+oPKRHr+MU2IdguZVMtimd8+6QuBKXFNTfOPlhvrE+Z5teBHm4
	B4dBzpxFM8UN/TabqQYvqavL5HvIFvxY6NgFj0k7Qpm6rPG/hhEzvcYPOOomCiaH4BNEsa0Cg5yJC
	tqC88umtnCTIJ2UnRsTp7Rg20UvQJtMiOog1Z28kyvzfrCkkdrGKESRbq+vGAEv/fYVeOelFbZWi7
	WqTti8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thraV-00000004Bf4-1JCi;
	Tue, 11 Feb 2025 14:50:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrTu-00000004APN-3cEo
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 14:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFF455C1188;
	Tue, 11 Feb 2025 14:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5763C4CEDD;
	Tue, 11 Feb 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739285002;
	bh=7XJ6sQ813gzNVi5Pa7MHabJXhmjCnD8PQpmTLIBUuuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJsTwJOPPIOkN+bybboObQfcrCNtKQklymfNMMm5DRS4232F30N5KrYSmwTmrg8lN
	 bKnELzFvf9aUiHiVmpuBZwgCBy+wF/clIuWhKveLR7BYxeT4X9tsWYIhupG3CFoNMm
	 hjFA7xyFRQ+b1eviFDGjfjZPt1NckdixJCrZ8n2Q+/g9vC++W4edliV6Muj1DFQ/CI
	 NyLtpNhuhQSYDP9euLuGHNb63FJ7ZHCycgu9XRkpIr46TfLh5kl5AXRzwEg/5EN2Zt
	 dI7AN8RwAUc1Tm5P9kPQtrX3BiuhxvEGSIH7S54BPGCc1HJg1jf4Hd6kky+H8X0fbj
	 aYlh2S4Coaquw==
Date: Tue, 11 Feb 2025 14:43:17 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] RISC-V: add vector extension validation checks
Message-ID: <20250211-crier-gas-7efc51783cf3@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
 <20250205-defensive-lent-04936dac6bdd@spud>
 <579dbdce-e61e-48ed-8685-a2cda9d753c3@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <579dbdce-e61e-48ed-8685-a2cda9d753c3@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_064322_989559_BBA1F5EC 
X-CRM114-Status: GOOD (  31.54  )
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
Content-Type: multipart/mixed; boundary="===============5599062613701896856=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5599062613701896856==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yP3MvfkNzMIcLd+h"
Content-Disposition: inline


--yP3MvfkNzMIcLd+h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:16:45AM +0100, Cl=E9ment L=E9ger wrote:
>=20
>=20
> On 05/02/2025 17:05, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > Using Clement's new validation callbacks, support checking that
> > dependencies have been satisfied for the vector extensions. From the
> > kernel's perfective, it's not required to differentiate between the
> > conditions for all the various vector subsets - it's the firmware's job
> > to not report impossible combinations. Instead, the kernel only has to
> > check that the correct config options are enabled and to enforce its
> > requirement of the d extension being present for FPU support.
> >=20
> > Since vector will now be disabled proactively, there's no need to clear
> > the bit in elf_hwcap in riscv_fill_hwcap() any longer.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  3 ++
> >  arch/riscv/kernel/cpufeature.c      | 57 +++++++++++++++++++----------
> >  2 files changed, 40 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/a=
sm/cpufeature.h
> > index 569140d6e639..5d9427ccbc7a 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -56,6 +56,9 @@ void __init riscv_user_isa_enable(void);
> >  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> >  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> >  			    ARRAY_SIZE(_bundled_exts), NULL)
> > +#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validat=
e) \
> > +	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> > +			    ARRAY_SIZE(_bundled_exts), _validate)
> > =20
> >  /* Used to declare extensions that are a superset of other extensions =
(Zvbb for instance) */
> >  #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index c6ba750536c3..40a24b08d905 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -109,6 +109,35 @@ static int riscv_ext_zicboz_validate(const struct =
riscv_isa_ext_data *data,
> >  	return 0;
> >  }
> > =20
> > +static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data=
 *data,
> > +				       const unsigned long *isa_bitmap)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_=
data *data,
> > +					   const unsigned long *isa_bitmap)
> > +{
> > +	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
> > +		return -EINVAL;
> > +
> > +	if (!IS_ENABLED(CONFIG_FPU))
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The kernel doesn't support systems that don't implement both of
> > +	 * F and D, so if any of the vector extensions that do floating point
> > +	 * are to be usable, both floating point extensions need to be usable.
> > +	 */
> > +	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
>=20
> I think this should also be modified to be like this:
>=20
>   if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
> 	  return 0;
>=20
>   return -EPROBEDEFER;
>=20
> That won't actually change the way it works since RISCV_ISA_EXT_d (and
> all single letter extensions) is always probed before the others though.

I don't think so, there's no point deferring since we know that the
extensions this is used for cannot become true afterwards. I'll add a
comment justifying it.

--yP3MvfkNzMIcLd+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tiBQAKCRB4tDGHoIJi
0muEAPsGqCMsvt9Wk798W6VjgLphAcoDAkn3u/euA10G3WgSlAD+PzU6dcrNPwC/
TRcmECWfmlyz3+wAVQTlJeZFAyoK/w8=
=TcVj
-----END PGP SIGNATURE-----

--yP3MvfkNzMIcLd+h--


--===============5599062613701896856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5599062613701896856==--

