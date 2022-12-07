Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EC1C63705
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTBzDCFkliJPpt/Y/CwzbSKwPR15kNgT7wdWDyafysE=; b=ejRLRFNVwMT/NwnhQqh7QHC3iG
	G+vknK5NNmosNAbz4LWdF8WY3bSWXIo4574bMM/HdxJbYTK54NzN5PaRe6AYsMRGj3v5SpkrYHTi/
	2gGt+pjTobsh1iLGZG5sqvKiP6CklyyzLx6pVF/Ztglih5s0s+X+0J96WN4nENBbJzvegz1SIQTZ6
	DPW/iduxdbqKWo2DusSPb4auZbSZCVEIFNgrjWQZCYpO26uAI+lAw0OwokF/wD1e1tLVmaqiCYjeN
	rMZQanlPsHAkSeIHElCHoDsAht1RmanWHugPNDkjBLH6e/1ti2mZdSqEdt0LQNzNWU+Oux0w4M0R8
	zMM8vZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p31Ky-00CFyF-JW; Wed, 07 Dec 2022 20:48:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p31Kv-00CFvt-KT
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 20:48:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3100D61BFD;
	Wed,  7 Dec 2022 20:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88131C433D7;
	Wed,  7 Dec 2022 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670446092;
	bh=yK3+4xNataiZhLugcMd6BjoxUSdPpansBSvrpmBauiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WA0IdG67z5ISnxsDEeM6dR3/0pAylE0l6XVmP2jp52q87odkSJKacajbHjy+LT/jY
	 0VxcqCrqk5Lq1G/R1JaT+9IQUEXeLDVaDKuy8+sfk8w0s0YLgvpMtX/Xp2VocdjqSn
	 lwqK+ieYwwkFwmX77LlpKPEB7a9SkKzjJOrbhZfHUjkbjX53jv0Y4dxTA02TbzowUp
	 KsypMNdOt2aLYYkBKem+YQSdkbZ7dyNJmkFL7TL2OojH95of3BRnhWGy1LM6s2Qnbr
	 p2OS9tHi2feMYGSSo/ErxoWpS2FacukyhMuTf7lwLUGoZXZ1dFIagsrk7QPTfF1q3i
	 E6cukESZyaaag==
Date: Wed, 7 Dec 2022 20:48:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <Y5D8CHkJZGmQKxdh@spud>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-13-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20221207180821.2479987-13-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_124813_771954_83497BF5 
X-CRM114-Status: GOOD (  38.60  )
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
Content-Type: multipart/mixed; boundary="===============2296219422253105463=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2296219422253105463==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tk8KsdIKSg33QDPD"
Content-Disposition: inline


--Tk8KsdIKSg33QDPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 07:08:21PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Alternatives live in a different section, so addresses used by call
> functions will point to wrong locations after the patch got applied.
>=20
> Similar to arm64, adjust the location to consider that offset.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/alternative.h |  3 ++
>  arch/riscv/kernel/alternative.c      | 56 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c       |  5 ++-
>  3 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/as=
m/alternative.h
> index 6511dd73e812..1bd4027d34ca 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
>  void __init apply_early_boot_alternatives(void);
>  void apply_module_alternatives(void *start, size_t length);
> =20
> +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> +				   int patch_offset);
> +
>  struct alt_entry {
>  	void *old_ptr;		 /* address of original instruciton or data  */
>  	void *alt_ptr;		 /* address of replacement instruction or data */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternat=
ive.c
> index a7d26a00beea..c29e198ed9df 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -15,6 +15,8 @@
>  #include <asm/vendorid_list.h>
>  #include <asm/sbi.h>
>  #include <asm/csr.h>
> +#include <asm/insn.h>
> +#include <asm/patch.h>
> =20
>  struct cpu_manufacturer_info_t {
>  	unsigned long vendor_id;
> @@ -53,6 +55,60 @@ static void __init_or_module riscv_fill_cpu_mfr_info(s=
truct cpu_manufacturer_inf
>  	}
>  }
> =20
> +static u32 riscv_instruction_at(void *p)
> +{
> +	u16 *parcel =3D p;
> +
> +	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;

I feel bad for not mentioning this before - can we replace this magic 16
with something self documenting?

> +}
> +
> +static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 insn1, u32 i=
nsn2, int patch_offset)
> +{
> +	/* pick the original auipc + jalr */
> +	u32 call[2] =3D { insn1, insn2 };
> +	s32 imm;
> +
> +	/* get and adjust new target address */
> +	imm =3D riscv_insn_extract_utype_itype_imm(insn1, insn2);
> +	imm -=3D patch_offset;
> +
> +	/* update instructions */
> +	riscv_insn_insert_utype_itype_imm(call, imm);
> +
> +	/* patch the call place again */
> +	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> +}

Obv. I have not left R-b tags on stuff without trying to understand
what's going on, but from a lay-observer point of view, I think these
function names & flow does a good job of explaining some of the black
magic in this neck of the woods.

> +
> +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> +				      int patch_offset)
> +{
> +	int num_instr =3D len / sizeof(u32);

instr...

> +	int i;
> +
> +	/*
> +	 * stop one instruction before the end, as we're checking
> +	 * for auipc + jalr
> +	 */
> +	for (i =3D 0; i < num_instr; i++) {
> +		u32 inst =3D riscv_instruction_at(alt_ptr + i * sizeof(u32));

=2E..inst...

> +
> +		/* may be the start of an auipc + jalr pair */
> +		if (riscv_insn_is_auipc(inst) && i < num_instr - 1) {

=2E..insn.

Is there a reason for that?

Also, I've gotten myself slightly confused about the loop. You "stop one
instruction before the end" but the main loop goes from 0 -> num_instr.
The inner loop then checks for i < num_instr - 1. What am I missing that
prevents the outer loop from stopping at num_instr - 1 instead?
> +			u32 inst2 =3D riscv_instruction_at(alt_ptr + (i + 1) * sizeof(u32));
> +
> +			if (!riscv_insn_is_jalr(inst2))
> +				continue;
> +
> +			/* call will use ra register */

Super minor, but "call will use ra register" is a little unclear. As
written, it makes perfect sense when you've been staring at this code,
but not so much if you're passing through.. How about:
/* if this instruction pair is a call, it will use the ra register */

> +			if (RV_EXTRACT_RD_REG(inst) !=3D 1)
> +				continue;
>

All minor stuff though, so you can re-add my R-b either way:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> +							 inst, inst2, patch_offset);
> +		}
> +	}
> +}
> +
>  /*
>   * This is called very early in the boot process (directly after we run
>   * a feature detect on the boot CPU). No need to worry about other CPUs
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 694267d1fe81..e91ec3d8e240 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -316,8 +316,11 @@ void __init_or_module riscv_cpufeature_patch_func(st=
ruct alt_entry *begin,
>  		}
> =20
>  		tmp =3D (1U << alt->errata_id);
> -		if (cpu_req_feature & tmp)
> +		if (cpu_req_feature & tmp) {
>  			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
> +						      alt->old_ptr - alt->alt_ptr);
> +		}
>  	}
>  }
>  #endif
> --=20
> 2.35.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--Tk8KsdIKSg33QDPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5D8BwAKCRB4tDGHoIJi
0sHlAP49aDWAQ6nLdpv86NcfH5+8L3UmLTgKIkZxABpxML6tFAD/TRm6YJPFbnln
y9oWi78ufxpfC+JlEde+l8OpnO7g2gc=
=8boQ
-----END PGP SIGNATURE-----

--Tk8KsdIKSg33QDPD--


--===============2296219422253105463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2296219422253105463==--

