Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBLDFoIOxaHWyBtEI3AxyoA1LvZv0qlv2LtWWTqVgpI=; b=AtSj6s06SLLNiYToAEvltGsq77
	w3O7d9EiM/eA1MS4w4qJCnQu7kiCtZ7C1H+YjOBfhmcDL/FG0hVHdAD3c3O9tkHDhPOLV/bzJ74Z/
	WLtH+fSPSf+hxVWaXSW1pUi3vM1ISuBC+uOENh3hcjCIaSMMoYucYIrrs5NJvgZdo7U0QnrZV8qcl
	18jY/LOH/LjEaIs8wL1s8Ht41ONC++mbSUkAtQ9HB+CcopZ/PFmh42MWMgkytwed2VjDyWHASE8X0
	jAkKKyDyw5K1b/HPaFhNa8GkoeMHJUQIqEduLtvNzQu8SUo64HNi0qwt0rz3ys8GxwUBaP6Ja6Eev
	7M/Odb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GKk-008SUN-Kb; Mon, 05 Dec 2022 18:36:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2GKh-008STf-I4; Mon, 05 Dec 2022 18:36:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBC73612F1;
	Mon,  5 Dec 2022 18:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5B86C433D6;
	Mon,  5 Dec 2022 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670265410;
	bh=OQdvaLSoaiBbTTeKD827k+4rYmwOJ9xbFSL1aPRYkUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+9IUmmxBh5gC369f8/d/uPzj6Zkb+7CI3SvLvLo7xJHLH0rBA21oTgkmVrPWOViT
	 rBQy1UaWCVNWSCxSCPIsD0emZrqBpxiBVLv3QYarlQaYthhWsUkj1x0WCRTHeM1Wfd
	 D0BEi6k9iFMCNmtqzN+bd0wndTufsRWdRrd+1yJH5Pi6xCLbUzOyki2MUBtjCK7BUr
	 IuOqXY0BT0velhXHVw2msD1Iuf4jDJ6hh8LttPHoxVnbAFFmpw4gENyBZV41CNb2R7
	 QTOchzLUTlY/Hb/Wpq7nlC/ShzOBLStlp9KyP7Mfe+ERAYA69bfrwQFjsiL4r2KrG5
	 uU05A4S2JhIYg==
Date: Mon, 5 Dec 2022 18:36:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <Y446PdlUPGw5iB71@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-2-jszhang@kernel.org>
 <4764569.GXAFRqVoOG@diego>
 <Y44Q/B6THtP38eyL@xhacker>
MIME-Version: 1.0
In-Reply-To: <Y44Q/B6THtP38eyL@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_103651_707952_AE1B8117 
X-CRM114-Status: GOOD (  36.57  )
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
Content-Type: multipart/mixed; boundary="===============7174005380734787945=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7174005380734787945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ygsvAbVCNFXeErrf"
Content-Disposition: inline


--ygsvAbVCNFXeErrf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Heiko, Jisheng,

On Mon, Dec 05, 2022 at 11:40:44PM +0800, Jisheng Zhang wrote:
> On Mon, Dec 05, 2022 at 04:31:08PM +0100, Heiko St=FCbner wrote:
> > Am Sonntag, 4. Dezember 2022, 18:46:20 CET schrieb Jisheng Zhang:
> > > Alternatives live in a different section, so offsets used by jal
> > > instruction will point to wrong locations after the patch got applied.
> > >=20
> > > Similar to arm64, adjust the location to consider that offset.
> > >=20
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/include/asm/alternative.h |  2 ++
> > >  arch/riscv/kernel/alternative.c      | 38 ++++++++++++++++++++++++++=
++
> > >  arch/riscv/kernel/cpufeature.c       |  3 +++
> > >  3 files changed, 43 insertions(+)
> > >=20
> > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/includ=
e/asm/alternative.h
> > > index c58ec3cc4bc3..33eae9541684 100644
> > > --- a/arch/riscv/include/asm/alternative.h
> > > +++ b/arch/riscv/include/asm/alternative.h
> > > @@ -29,6 +29,8 @@ void apply_module_alternatives(void *start, size_t =
length);
> > > =20
> > >  void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int le=
n,
> > >  				      int patch_offset);
> > > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > > +			       int patch_offset);
> > > =20
> > >  struct alt_entry {
> > >  	void *old_ptr;		 /* address of original instruciton or data  */
> > > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alte=
rnative.c
> > > index 292cc42dc3be..9d88375624b5 100644
> > > --- a/arch/riscv/kernel/alternative.c
> > > +++ b/arch/riscv/kernel/alternative.c
> > > @@ -125,6 +125,44 @@ void riscv_alternative_fix_auipc_jalr(void *alt_=
ptr, unsigned int len,
> > >  	}
> > >  }
> > > =20
> > > +#define to_jal_imm(value)						\
> > > +	(((value & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_1=
1_0_OPOFF) | \
> > > +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OP=
OFF) | \
> > > +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IM=
M_19_12_OPOFF) | \
> > > +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
> > > +
> > > +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> > > +			       int patch_offset)
> > > +{
> >=20
> > I think we might want to unfiy this into a common function like
> >=20
> > 	riscv_alternative_fix_offsets(...)
> >=20
> > so that we only run through the code block once
> >=20
> > 	for (i =3D 0; i < num_instr; i++) {
> > 		if (riscv_insn_is_auipc_jalr(inst1, inst2)) {
> > 			riscv_alternative_fix_auipc_jalr(...)
> > 			continue;
> > 		}
> >=20
> > 		if (riscv_insn_is_jal(inst)) {
> > 			riscv_alternative_fix_jal(...)
> > 			continue;
> > 		}
> > 	}
> >=20
> > This would also remove the need from calling multiple functions
> > after patching alternatives.
>=20
> Yesterday, I also wanted to unify the two instruction fix into
> one. But that would need to roll back the
> riscv_alternative_fix_auipc_jalr() to your v1 version. And IMHO,
> it's better if you can split the Zbb string optimizations series
> into two: one for alternative improvements, another for Zbb. Then
> we may get the alternative improvements and this inst extension
> series merged in v6.2-rc1.

Heiko, perhaps you can correct me here:

Last Wednesday you & Palmer agreed that it was too late in the cycle to
apply any of the stuff touching alternatives?
If I do recall correctly, gives plenty of time to sort out any
interdependent changes here.

Could easily be misremembering, wouldn't be the first time!

Thanks,
Conor.

> > > +	int num_instr =3D len / sizeof(u32);
> > > +	unsigned int call;
> > > +	int i;
> > > +	int imm;
> > > +
> > > +	for (i =3D 0; i < num_instr; i++) {
> > > +		u32 inst =3D riscv_instruction_at(alt_ptr, i);
> > > +
> > > +		if (!riscv_insn_is_jal(inst))
> > > +			continue;
> > > +
> > > +		/* get and adjust new target address */
> > > +		imm =3D RV_EXTRACT_JTYPE_IMM(inst);
> > > +		imm -=3D patch_offset;
> > > +
> > > +		/* pick the original jal */
> > > +		call =3D inst;
> > > +
> > > +		/* drop the old IMMs, all jal imm bits sit at 31:12 */
> > > +		call &=3D ~GENMASK(31, 12);
> > > +
> > > +		/* add the adapted IMMs */
> > > +		call |=3D to_jal_imm(imm);
> > > +
> > > +		/* patch the call place again */
> > > +		patch_text_nosync(alt_ptr + i * sizeof(u32), &call, 4);
> > > +	}
> > > +}
> > > +
> > >  /*
> > >   * This is called very early in the boot process (directly after we =
run
> > >   * a feature detect on the boot CPU). No need to worry about other C=
PUs
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufe=
ature.c
> > > index ba62a4ff5ccd..c743f0adc794 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -324,6 +324,9 @@ void __init_or_module riscv_cpufeature_patch_func=
(struct alt_entry *begin,
> > >  			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > >  							 alt->alt_len,
> > >  							 alt->old_ptr - alt->alt_ptr);
> > > +			riscv_alternative_fix_jal(alt->old_ptr,
> > > +						  alt->alt_len,
> > > +						  alt->old_ptr - alt->alt_ptr);
> > >  		}
> > >  	}
> > >  }
> > >=20
> >=20
> >=20
> >=20
> >=20

--ygsvAbVCNFXeErrf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY446PQAKCRB4tDGHoIJi
0ldEAPwJgljT3AEEEsnqENoQ+sR344tG9T7LxDrQkdoYyWpvjgEAuK3E28qSwJLI
qWSBSkWndIm2Tg+iQ+ibDY6yCGsg5w4=
=2L1g
-----END PGP SIGNATURE-----

--ygsvAbVCNFXeErrf--


--===============7174005380734787945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7174005380734787945==--

