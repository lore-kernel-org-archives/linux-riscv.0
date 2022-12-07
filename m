Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5757CC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/8RfpKwQnBCK4CnUDx3RRJN9JNEy9g76GKgLe3+OBI=; b=wr58WsnjEoXcC1
	kKuDS6uOXABbw1A6eKo+Ux5ulLLj7/qyAuIeOn7DwCle9ki6x7Veuy2lY6yOEzdhhieI4hZVn26tx
	biTbmfKkjIPbkZBBUnUo7VBO++p/9QWtCXPWXBZYhhsoN5l/6S41qnbNGqtAWmi6ITjlYcVIGn+sh
	XyRTmlg58wgXs8S2FEZtYiY+ufG9JbGf6q9pTFoQc+xjISiIzSiq1QpxFAOcIajptF2AD905As020
	UM+z+sIpo3fo3P1Oq8CbZC9uLv2VvmaUS0P0kz58FKgHQ5PJoyayZFmaSmetb0ofKSHXneZEzp8Am
	R3h5u7Q40j0NEgBGjAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qqp-00GHej-O0; Wed, 07 Dec 2022 09:36:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2qqV-00GGqD-7B
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 09:36:14 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2qqF-0001zD-K0; Wed, 07 Dec 2022 10:35:51 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com, conor@kernel.org, philipp.tomsich@vrull.eu, emil.renner.berthing@canonical.com, ardb@kernel.org, linux-efi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 11/14] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Wed, 07 Dec 2022 10:35:50 +0100
Message-ID: <2256630.NgBsaNRSFp@diego>
In-Reply-To: <3628021.R56niFO833@diego>
References: <20221130225614.1594256-1-heiko@sntech.de> <20221201193353.7rtpqrkk7ws34e3k@kamzik> <3628021.R56niFO833@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_013607_958656_5143A78E 
X-CRM114-Status: GOOD (  59.02  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Dienstag, 6. Dezember 2022, 23:10:01 CET schrieb Heiko St=FCbner:
> Am Donnerstag, 1. Dezember 2022, 20:33:53 CET schrieb Andrew Jones:
> > On Wed, Nov 30, 2022 at 11:56:11PM +0100, Heiko Stuebner wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > =

> > > Alternatives live in a different section, so addresses used by call
> > > functions will point to wrong locations after the patch got applied.
> > > =

> > > Similar to arm64, adjust the location to consider that offset.
> > > =

> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > ---
> > >  arch/riscv/include/asm/alternative.h |  3 ++
> > >  arch/riscv/kernel/alternative.c      | 72 ++++++++++++++++++++++++++=
++
> > >  arch/riscv/kernel/cpufeature.c       | 11 ++++-
> > >  3 files changed, 84 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/includ=
e/asm/alternative.h
> > > index 6511dd73e812..c58ec3cc4bc3 100644
> > > --- a/arch/riscv/include/asm/alternative.h
> > > +++ b/arch/riscv/include/asm/alternative.h
> > > @@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
> > >  void __init apply_early_boot_alternatives(void);
> > >  void apply_module_alternatives(void *start, size_t length);
> > >  =

> > > +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int le=
n,
> > > +				      int patch_offset);
> > > +
> > >  struct alt_entry {
> > >  	void *old_ptr;		 /* address of original instruciton or data  */
> > >  	void *alt_ptr;		 /* address of replacement instruction or data */
> > > diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alte=
rnative.c
> > > index a7d26a00beea..292cc42dc3be 100644
> > > --- a/arch/riscv/kernel/alternative.c
> > > +++ b/arch/riscv/kernel/alternative.c
> > > @@ -15,6 +15,8 @@
> > >  #include <asm/vendorid_list.h>
> > >  #include <asm/sbi.h>
> > >  #include <asm/csr.h>
> > > +#include <asm/insn.h>
> > > +#include <asm/patch.h>
> > >  =

> > >  struct cpu_manufacturer_info_t {
> > >  	unsigned long vendor_id;
> > > @@ -53,6 +55,76 @@ static void __init_or_module riscv_fill_cpu_mfr_in=
fo(struct cpu_manufacturer_inf
> > >  	}
> > >  }
> > >  =

> > > +static unsigned int riscv_instruction_at(void *p, unsigned int offse=
t)
> > =

> > How about explicitly returning a u32?
> =

> ok
> =

> > > +{
> > > +	u16 *parcel =3D p + (offset * sizeof(u32));
> > =

> > nit: I realize this is just a helper function, but I think a cleaner
> > interface would require the caller do this math, or at least the offset
> > scaling, since only the caller knows it's necessary. And, the call to
> > patch_text_nosync() requires all the math, so it'd be consistent for
> > riscv_instruction_at() to only take a pointer too.
> =

> ok
> =

> > =

> > > +
> > > +	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
> > > +}
> > > +
> > > +static inline bool riscv_insn_is_auipc_jalr(u32 insn1, u32 insn2)
> > > +{
> > > +	return riscv_insn_is_auipc(insn1) && riscv_insn_is_jalr(insn2);
> > > +}
> > > +
> > > +#define JALR_SIGN_MASK		BIT(RV_I_IMM_SIGN_OPOFF - RV_I_IMM_11_0_OPOF=
F)
> > =

> > We know I-type IMM is 11 bits, so we could just define this as BIT(11).
> > =

> > > +#define AUIPC_PAD		(0x00001000)
> > > +
> > > +#define to_jalr_imm(value)						\
> > > +	((value & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF)
> > =

> > Should put () around the macro argument, (value)
> > =

> > > +
> > > +#define to_auipc_imm(value)						\
> > > +	((value & JALR_SIGN_MASK) ?					\
> > > +	((value & RV_U_IMM_31_12_MASK) + AUIPC_PAD) :	\
> > > +	(value & RV_U_IMM_31_12_MASK))
> > =

> > I know RV_U_IMM_31_12_OPOFF is 0, but it looks odd not shifting
> > RV_U_IMM_31_12_MASK when we do shift RV_I_IMM_11_0_MASK.
> > =

> > So, it looks like to_auipc_imm() is doing
> > =

> >    offset[31:12] + ((value & BIT(11)) ? (1 << 12) : 0)
> > =

> > but the spec says the auipc part of the 'call' pseudoinstruction should=
 be
> =

> can you point me to that part of the spec?
> =

> For educational purposes, because in the main riscv-spec I only found
> the main auipc + jalr descriptions, but nothing about the actual
> "call" pseudoinstruction.
> =

> [and I'm probably just looking at the wrong document]
> =

> =

> >    offset[31:12] + offset[11]
> >  =

> > which I think would be written as
> > =

> >  ((((value) & RV_U_IMM_31_12_MASK) << RV_U_IMM_31_12_OPOFF) + ((value) =
& BIT(11)))
> > =

> > or what am I missing?

So far I've found the riscv-asm-manual [0], which only states for call
	auipc x1, offset[31:12]
	jalr x1, x1, offset[11:0]

and the psABI spec [1], neither mention your "offset[31:12] + offset[11]" ?

But [1] does contain that tiny sentence
"The successive instruction has a signed 12-bit immediate so the value
 of the preceding high 20-bit relocation may have 1 added to it."


I.e. the lower 12 bits become themself a signed number [-2048:2047]

Take an example:
- address is 1862116 ( 0b 111000110 100111100100 )
- address[31:12] becomes 1859584 (as 0b 111000110 000000000000)
- while address[11:0] is 2532 as part of the bigger number
- as lone 12bit signed IMM it becomes -1564
- so you need to add this 4096 to the auipc IMM to compensate


Heiko


[0] https://github.com/riscv-non-isa/riscv-asm-manual/blob/master/riscv-asm=
.md
[1] https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0

> =

> that whole thing came from the ftrace parts, also doing call fixup voodoo
> And I can't really say that I understand every nook and cranny of it.
> =

> But for practical purposes, the addresses generated now work,
> and also seem to work for the ftrace counterpart (see include/asm/ftrace.=
h)
> =

> [another place that will profit from more generalization :-) ]
> =

> =

> > > +
> > > +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int le=
n,
> > > +				      int patch_offset)
> > > +{
> > > +	int num_instr =3D len / sizeof(u32);
> > > +	unsigned int call[2];
> > > +	int i;
> > > +	int imm;
> > > +	u32 rd1;
> > > +
> > > +	/*
> > > +	 * stop one instruction before the end, as we're checking
> > > +	 * for auipc + jalr
> > > +	 */
> > > +	for (i =3D 0; i < num_instr - 1; i++) {
> > =

> > If we change riscv_instruction_at() to just take a pointer then we can =
do
> > the math in the for() and actually just use pointer arithmetic.
> > =

> >         uint32_t *p =3D alt_ptr;
> >         for (i =3D 0; i < num_instr - 1; i++, p++) {
> =

> Wasn't not using uint32 pointers the whole point of going with the access=
or?
> =

> =

> > > +		u32 inst1 =3D riscv_instruction_at(alt_ptr, i);
> >                                                  p
> > > +		u32 inst2 =3D riscv_instruction_at(alt_ptr, i + 1);
> >                                                  p + 1
> > > +
> > > +		if (!riscv_insn_is_auipc_jalr(inst1, inst2))
> > > +			continue;
> > > +
> > > +		/* call will use ra register */
> > > +		rd1 =3D RV_EXTRACT_RD_REG(inst1);
> > > +		if (rd1 !=3D 1)
> > > +			continue;
> > =

> > nit: rd1 is only used once, how about
> > =

> >  if (RV_EXTRACT_RD_REG(inst1) !=3D 1)
> =

> ok
> =

> =

> Need to look at the rest tomorrow
> Heiko
> =

> =

> > > +
> > > +		/* get and adjust new target address */
> > > +		imm =3D RV_EXTRACT_UTYPE_IMM(inst1);
> > =

> > Based on my understanding of a auipc part of the 'call', it seems we
> > should be subtracting BIT(11) here. And, since RV_EXTRACT_* does sign-
> > extension for I-type, then I'm not sure we should use it. So,
> > =

> >         imm =3D (inst2 >> RV_I_IMM_11_0_OPOFF) & RV_I_IMM_11_0_MASK;
> > 	imm +=3D ((inst1 >> RV_U_IMM_31_12_OPOFF) & RV_U_IMM_31_12_MASK) - (im=
m & BIT(11));
> > =

> > > +		imm +=3D RV_EXTRACT_ITYPE_IMM(inst2);
> > > +		imm -=3D patch_offset;
> > > +
> > > +		/* pick the original auipc + jalr */
> > > +		call[0] =3D inst1;
> > > +		call[1] =3D inst2;
> > > +
> > > +		/* drop the old IMMs */
> > > +		call[0] &=3D ~(RV_U_IMM_31_12_MASK);
> > =

> > Same comment as above about RV_U_IMM_31_12_OPOFF. IMO, this would be mo=
re
> > consistent with the shift, even though it's zero.
> > =

> >                 call[0] &=3D ~(RV_U_IMM_31_12_MASK << RV_U_IMM_31_12_OP=
OFF);
> > =

> > > +		call[1] &=3D ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
> > > +
> > > +		/* add the adapted IMMs */
> > > +		call[0] |=3D to_auipc_imm(imm);
> > =

> > As pointed out above, I'm not sure about to_auipc_imm().
> > =

> > > +		call[1] |=3D to_jalr_imm(imm);
> > > +
> > > +		/* patch the call place again */
> > > +		patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
> >                                   ^                                ^
> > 				  p		       sizeof(u32) * 2
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
> > > index 694267d1fe81..ba62a4ff5ccd 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -316,8 +316,15 @@ void __init_or_module riscv_cpufeature_patch_fun=
c(struct alt_entry *begin,
> > >  		}
> > >  =

> > >  		tmp =3D (1U << alt->errata_id);
> > > -		if (cpu_req_feature & tmp)
> > > -			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> > > +		if (cpu_req_feature & tmp) {
> > > +			/* do the basic patching */
> > > +			patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> > > +					  alt->alt_len);
> > =

> > nit: I'd leave this line long and only have one wrap in the line below
> > =

> > > +
> > > +			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> > > +							 alt->alt_len,
> > > +							 alt->old_ptr - alt->alt_ptr);
> > > +		}
> > >  	}
> > >  }
> > >  #endif
> > >
> > =

> > Thanks,
> > drew
> > =

> =

> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
