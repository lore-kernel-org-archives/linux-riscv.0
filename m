Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282CDC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBXlvJN6j3g/o2GGd3fkHN2SK0tSZIW9A6Uj+3PBlIk=; b=DWD47TZE+/p24ZEJdmhrPLifd/
	Uyiq/MgyI1P2Hh0kAIwystMMqVy69Bz7v+ib6HwFiAEGkt4rgICZOIV/6VzQnb6X2LO2RXIxAZyLX
	etV4aStxr3LPPqXjY4IPuqmB8Jvj0D5kX+QuweR7iSmRTXwHhTjTG4Rb60Dp/FKBmqO2MkjYBUkJ1
	qRCZTkp6DsX6naNYAvV3VRWk98wYonnE8v1yjQN2CpxVD0gR6pYfMagEJ1A23ivHScE/lqJ20d23K
	S2BGCrGU17IV6LdwUvQNxe5ym9ovSLa1yFAVzhmvaSQKHaf/6q3UsZZWXq5+AYWTDthSDUcJOh0Kx
	YSJAZsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWeh-00FLXe-0m; Thu, 02 Feb 2023 10:17:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNWec-00FLWk-Rv
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 10:17:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675333038; x=1706869038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RE8KppuriIpS4OnnUNQ77ZJQmWIyQI5KLTAW/JHbLfQ=;
  b=Hs3PfYrUaDC5h5TVoHaWfn+nWhg16CEXNOY3e7U0lf8RGq9Xf0HonF3T
   A04Wb7Q8tqwQ+Rs9RqAmSmfvmtEGQhkze+KihhYG1WNq/eTof06lNGlPt
   PSCoJF++MF6e6M2tUOdwdw3HkYKbIJKq7UzyOpUVDuR6bnD9Z58elnWFE
   xuYmN3JglK9AHyb0PsIgHJ4HqSuUR2vviGl0i8OzhbfZIrQ8KJAgO+w5M
   pvtLwiCgoa3QvLRMdyPOgLFfKPYrJb7ke3g6vPPkUiB0e2Ry+Vf9xBFV1
   OYrTKPbYc1gIrsIGn8K+Zg9WOw1X1qaUaJzw8ICpmjBwQXcR9IIIZx2fO
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,267,1669100400"; 
   d="asc'?scan'208";a="198596478"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 03:17:10 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 03:17:08 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 2 Feb 2023 03:17:06 -0700
Date: Thu, 2 Feb 2023 10:16:42 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, <bjorn@kernel.org>,
	<heiko@sntech.de>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <sfr@canb.auug.org.au>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<liaochang1@huawei.com>
Subject: Re: [PATCH v6 04/13] riscv/kprobe: Add common RVI and RVC
 instruction decoder code
Message-ID: <Y9uNinPr0jR2+5H/@wendy>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
 <20230127130541.1250865-5-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20230127130541.1250865-5-chenguokai17@mails.ucas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_021718_999760_65D62C26 
X-CRM114-Status: GOOD (  28.86  )
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
Content-Type: multipart/mixed; boundary="===============7947252827233796861=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7947252827233796861==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ceVEnnn1dnSN8Qbv"
Content-Disposition: inline

--ceVEnnn1dnSN8Qbv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Chen, Liao, Bjorn, Heiko,

Heiko certainly has a more complete understanding of the newly added
stuff in insn*.h, but I've attempted to have a look at the insn stuff
that you have added here...

On Fri, Jan 27, 2023 at 09:05:32PM +0800, Chen Guokai wrote:
> From: Liao Chang <liaochang1@huawei.com>
>=20
> These RVI and RVC instruction decoder are used in the free register
> searching algorithm, each instruction of instrumented function needs to
> decode and test if it contains a free register to form AUIPC/JALR.
>=20
> For RVI instruction format, the position and length of rs1/rs2/rd/opcode
> parts are uniform [1], but RVC instruction formats are complicated, so
> it addresses a series of functions to decode rs1/rs2/rd for RVC [1].
>=20
> [1] https://github.com/riscv/riscv-isa-manual/releases

Please make these regular link tags, so:
Link: https://github.com/riscv/riscv-isa-manual/releases [1]

> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
> ---
>  arch/riscv/include/asm/bug.h             |   5 +-
>  arch/riscv/kernel/probes/decode-insn.h   | 148 +++++++++++++++++++++++
>  arch/riscv/kernel/probes/simulate-insn.h |  42 +++++++
>  3 files changed, 194 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index 1aaea81fb141..9c33d3b58225 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -19,11 +19,14 @@
>  #define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
>  #define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */
> =20
> +#define RVI_INSN_LEN	4UL
> +#define RVC_INSN_LEN	2UL
> +
>  #define GET_INSN_LENGTH(insn)						\
>  ({									\
>  	unsigned long __len;						\
>  	__len =3D ((insn & __INSN_LENGTH_MASK) =3D=3D __INSN_LENGTH_32) ?	\
> -		4UL : 2UL;						\
> +		RVI_INSN_LEN : RVC_INSN_LEN;				\
>  	__len;								\
>  })
> =20
> diff --git a/arch/riscv/kernel/probes/decode-insn.h b/arch/riscv/kernel/p=
robes/decode-insn.h
> index 42269a7d676d..785b023a62ea 100644
> --- a/arch/riscv/kernel/probes/decode-insn.h
> +++ b/arch/riscv/kernel/probes/decode-insn.h
> @@ -3,6 +3,7 @@
>  #ifndef _RISCV_KERNEL_KPROBES_DECODE_INSN_H
>  #define _RISCV_KERNEL_KPROBES_DECODE_INSN_H
> =20
> +#include <linux/bitops.h>
>  #include <asm/sections.h>
>  #include <asm/kprobes.h>
> =20
> @@ -15,4 +16,151 @@ enum probe_insn {
>  enum probe_insn __kprobes
>  riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *as=
i);
> =20
> +#ifdef CONFIG_KPROBES
> +
> +static inline u16 rvi_rs1(kprobe_opcode_t opcode)
> +{
> +	return (u16)((opcode >> 15) & 0x1f);

insn.h has a bunch of defines for this kind of thing, that have all been
reviewed. We definitely should be using those here, at the very least,
rather than having to review all of these numbers for a second time.
eg:
#define RVG_RS1_OPOFF		15

IMO, anything you need here should either be in that file, or added to
that file by this patch.

> +}
> +
> +static inline u16 rvi_rs2(kprobe_opcode_t opcode)

Also a note, these functions look really odd in their callsites:
+               if (riscv_insn_is_c_jr(insn)) {
+                       READ_ON(rvc_r_rs1(insn));
+                       break;
+               }

Sticking with the existing naming scheme would be great, thanks.
I think these should be moved to insn.h and renamed to:
riscv_insn_extract_rs1(), and ditto for the other things you are newly
adding here.

> +{
> +	return (u16)((opcode >> 20) & 0x1f);
> +}
> +
> +static inline u16 rvi_rd(kprobe_opcode_t opcode)
> +{
> +	return (u16)((opcode >> 7) & 0x1f);
> +}
> +
> +static inline s32 rvi_branch_imme(kprobe_opcode_t opcode)

RV_EXTRACT_BTYPE_IMM() already exists and provides the same capability,
no? I think the whole patch here should be moved to insn.h, reuse the
defines there and have the function names changed to match the existing,
similar functions.

> +{
> +	u32 imme =3D 0;
> +
> +	imme |=3D (((opcode >> 8)  & 0xf)   << 1)  |
> +		(((opcode >> 25) & 0x3f)  << 5)  |
> +		(((opcode >> 7)  & 0x1)   << 11) |
> +		(((opcode >> 31) & 0x1)   << 12);
> +
> +	return sign_extend32(imme, 13);
> +}
> +
> +static inline s32 rvi_jal_imme(kprobe_opcode_t opcode)

This is a re-implementation of riscv_insn_extract_jtype_imm() except
without the nice defines etc used there.

> +{
> +	u32 imme =3D 0;
> +
> +	imme |=3D (((opcode >> 21) & 0x3ff) << 1)  |
> +		(((opcode >> 20) & 0x1)   << 11) |
> +		(((opcode >> 12) & 0xff)  << 12) |
> +		(((opcode >> 31) & 0x1)   << 20);
> +
> +	return sign_extend32(imme, 21);
> +}
> +
> +#ifdef CONFIG_RISCV_ISA_C

As Bjorn pointed out, this guard can go.

> +static inline u16 rvc_r_rs1(kprobe_opcode_t opcode)
> +{
> +	return (u16)((opcode >> 2) & 0x1f);

Again, defines exist for all of this stuff already that you can go and
use.
rvc_r_rs1() should be renamed to riscv_insn_extract_csstype_rs1() or
something like that to match the existing users IMO.

Also, perhaps I've missed something, but how does a shift of 2 work for
a CR format rs1? Shouldn't it be a shift of 7?

> +}
> +
> +static inline u16 rvc_r_rs2(kprobe_opcode_t opcode)
> +{
> +	return (u16)((opcode >> 2) & 0x1f);
> +}

(snip)

> +static inline u16 rvc_b_rd(kprobe_opcode_t opcode)
> +{
> +	return (u16)((opcode >> 7) & 0x7);
> +}

All of these are so common, that I feel you'd be very well served by
defines and some macros.

> +static inline s32 rvc_branch_imme(kprobe_opcode_t opcode)

Similar comments apply here as in the G case, in particular you can use
RVC_EXTRACT_JTYPE_IMM(), no?

> +{
> +	u32 imme =3D 0;
> +
> +	imme |=3D (((opcode >> 3)  & 0x3) << 1) |
> +		(((opcode >> 10) & 0x3) << 3) |
> +		(((opcode >> 2)  & 0x1) << 5) |
> +		(((opcode >> 5)  & 0x3) << 6) |
> +		(((opcode >> 12) & 0x1) << 8);
> +
> +	return sign_extend32(imme, 9);
> +}
> +
> +static inline s32 rvc_jal_imme(kprobe_opcode_t opcode)

Ditto here, but BTYPE instead?

> +{
> +	u32 imme =3D 0;
> +
> +	imme |=3D (((opcode >> 3)  & 0x3) << 1) |
> +		(((opcode >> 11) & 0x1) << 4) |
> +		(((opcode >> 2)  & 0x1) << 5) |
> +		(((opcode >> 7)  & 0x1) << 6) |
> +		(((opcode >> 6)  & 0x1) << 7) |
> +		(((opcode >> 9)  & 0x3) << 8) |
> +		(((opcode >> 8)  & 0x1) << 10) |
> +		(((opcode >> 12) & 0x1) << 11);
> +
> +	return sign_extend32(imme, 12);
> +}
> +#endif /* CONFIG_KPROBES */
> +#endif /* CONFIG_RISCV_ISA_C */
>  #endif /* _RISCV_KERNEL_KPROBES_DECODE_INSN_H */
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel=
/probes/simulate-insn.h
> index a19aaa0feb44..e89747dfabbb 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -28,4 +28,46 @@ bool simulate_branch(u32 opcode, unsigned long addr, s=
truct pt_regs *regs);
>  bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
>  bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
> =20
> +/* RVC(S) instructions contain rs1 and rs2 */
> +__RISCV_INSN_FUNCS(c_sq,	0xe003, 0xa000);
> +__RISCV_INSN_FUNCS(c_sw,	0xe003, 0xc000);
> +__RISCV_INSN_FUNCS(c_sd,	0xe003, 0xe000);

I think all of these should move to insn.h too, and have defines to
match the existing __RISCV_INSN_FUNCS there.
Perhaps Heiko has a more nuanced opinion on this.

Thanks,
Conor.

--ceVEnnn1dnSN8Qbv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9uNigAKCRB4tDGHoIJi
0oRRAQDOeCLUPMkEPAxghxxpVc3PvNRbNG5Mx7ee10SmsKMEAwEAquK2rnZjHTAj
HBiP7cUl9yIPjuXWxAzVdpM3dX8XRAY=
=Cf46
-----END PGP SIGNATURE-----

--ceVEnnn1dnSN8Qbv--


--===============7947252827233796861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7947252827233796861==--

