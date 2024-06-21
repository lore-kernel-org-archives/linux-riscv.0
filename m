Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3562C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 11:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCjFiFs1V4CxIRAzrGzByZM/6gmBZTxck86vGbsf3qY=; b=E1liyIDlXnR2ECF5frM6jIeWwk
	Ykfv5MRPL+zP/Ikal0kITr4tft0tuWiOoEy5RO0IjGYGdIgQDbKL6qAbT5mu+0dsKEdQ1vY2Xb22E
	J6LRJT2uwgLNJ8RD11Vvdh5SpypN1t50iPQs4t0wXcrwjRpAO652wYL1ge5oA062QCFUOMnBZQh4s
	VQ3gaDtmcUkRFTum9jD8F4Q6TpZCPnwGs8vFgMgDX7qzRv1WO6VwX3Rh6xDflnO3hXrezoZBGVwVC
	aM3XUnN3FV9IJG7oO9uBb2BknlWQA04APCAlMRj6BdTABqTAB4o0Oswh9m7OyKrvsfeq2GS53gI+Y
	3ECxBjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKc1X-00000008raH-38Ef;
	Fri, 21 Jun 2024 11:01:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKc1U-00000008rYj-0DPZ;
	Fri, 21 Jun 2024 11:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718967699; x=1750503699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huSqFb7QJrg5Jt2IrO99cEWuRUtFXR+yCp9tT26u6VU=;
  b=1vlYN1SWjmwmZUNwS4TDWVs8P/RuVOE2LnWoDlvD8ilBFdjZ1r7hle23
   3U6pgyXwPkg+AhMWvYF2weZdzb+F6G608Wz/ofRS0Yb7O7bf1vzKVkg5W
   pZIZ5vRXzCo8dT/plpLZ2HmbJ4hX3YiDbdj6nDSWLl2ZCncyCnv8u/UVb
   +tKaug8hqasdIkSdhptl+ebZwpWJUoHSOAZ3jiEWb7Iz+ROsYavEOYtj0
   H6s0mAigfE2gvEKspsnrt77leHcApNr2rU6cws9bIcIT0gocmduXmba0T
   bGa40ibKNeGG5YLnnnoDlnn+3mxNX73SHc2qEDpYpLOd+F2uxNK9Zjz7p
   w==;
X-CSE-ConnectionGUID: GrWk//cZSFSK0iEb2lv5/g==
X-CSE-MsgGUID: 3LNQH6NsT8CI3/alLgRniQ==
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="asc'?scan'208";a="30855809"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jun 2024 04:01:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 21 Jun 2024 04:00:56 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 21 Jun 2024 04:00:51 -0700
Date: Fri, 21 Jun 2024 12:00:32 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Yong-Xuan Wang <yongxuan.wang@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <kvm-riscv@lists.infradead.org>,
	<kvm@vger.kernel.org>, <apatel@ventanamicro.com>, <alex@ghiti.fr>,
	<greentime.hu@sifive.com>, <vincent.chen@sifive.com>, Jinyu Tang
	<tjytimi@163.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel
	<anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, Atish
 Patra <atishp@rivosinc.com>, wchen <waylingii@gmail.com>, Samuel Ortiz
	<sameo@rivosinc.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?=
	<cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, Xiao Wang
	<xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew
 Morton <akpm@linux-foundation.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>, Samuel Holland
	<samuel.holland@sifive.com>, Jisheng Zhang <jszhang@kernel.org>, Charlie
 Jenkins <charlie@rivosinc.com>, "Matthew Wilcox (Oracle)"
	<willy@infradead.org>, Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v5 1/4] RISC-V: Add Svade and Svadu Extensions Support
Message-ID: <20240621-pushpin-exclude-1b4f38ae7e8d@wendy>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-2-yongxuan.wang@sifive.com>
 <20240621-d1b77d43adacaa34337238c2@orel>
 <20240621-nutty-penknife-ca541ee5108d@wendy>
 <20240621-b22a7c677a8d61c26feaa75b@orel>
MIME-Version: 1.0
In-Reply-To: <20240621-b22a7c677a8d61c26feaa75b@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_040140_388959_4831F696 
X-CRM114-Status: GOOD (  49.46  )
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
Content-Type: multipart/mixed; boundary="===============7134666562303283484=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7134666562303283484==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pCXJhPrWw6SKifaM"
Content-Disposition: inline

--pCXJhPrWw6SKifaM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 12:42:32PM +0200, Andrew Jones wrote:
> On Fri, Jun 21, 2024 at 11:24:19AM GMT, Conor Dooley wrote:
> > On Fri, Jun 21, 2024 at 10:43:58AM +0200, Andrew Jones wrote:
> > > On Wed, Jun 05, 2024 at 08:15:07PM GMT, Yong-Xuan Wang wrote:
> > > > Svade and Svadu extensions represent two schemes for managing the P=
TE A/D
> > > > bits. When the PTE A/D bits need to be set, Svade extension intdica=
tes
> > > > that a related page fault will be raised. In contrast, the Svadu ex=
tension
> > > > supports hardware updating of PTE A/D bits. Since the Svade extensi=
on is
> > > > mandatory and the Svadu extension is optional in RVA23 profile, by =
default
> > > > the M-mode firmware will enable the Svadu extension in the menvcfg =
CSR
> > > > when only Svadu is present in DT.
> > > >=20
> > > > This patch detects Svade and Svadu extensions from DT and adds
> > > > arch_has_hw_pte_young() to enable optimization in MGLRU and
> > > > __wp_page_copy_user() when we have the PTE A/D bits hardware updati=
ng
> > > > support.
> > > >=20
> > > > Co-developed-by: Jinyu Tang <tjytimi@163.com>
> > > > Signed-off-by: Jinyu Tang <tjytimi@163.com>
> > > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > > ---
> > > >  arch/riscv/Kconfig               |  1 +
> > > >  arch/riscv/include/asm/csr.h     |  1 +
> > > >  arch/riscv/include/asm/hwcap.h   |  2 ++
> > > >  arch/riscv/include/asm/pgtable.h | 14 +++++++++++++-
> > > >  arch/riscv/kernel/cpufeature.c   |  2 ++
> > > >  5 files changed, 19 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index b94176e25be1..dbfe2be99bf9 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -36,6 +36,7 @@ config RISCV
> > > >  	select ARCH_HAS_PMEM_API
> > > >  	select ARCH_HAS_PREPARE_SYNC_CORE_CMD
> > > >  	select ARCH_HAS_PTE_SPECIAL
> > > > +	select ARCH_HAS_HW_PTE_YOUNG
> > > >  	select ARCH_HAS_SET_DIRECT_MAP if MMU
> > > >  	select ARCH_HAS_SET_MEMORY if MMU
> > > >  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
> > > > diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/=
csr.h
> > > > index 25966995da04..524cd4131c71 100644
> > > > --- a/arch/riscv/include/asm/csr.h
> > > > +++ b/arch/riscv/include/asm/csr.h
> > > > @@ -195,6 +195,7 @@
> > > >  /* xENVCFG flags */
> > > >  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
> > > >  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> > > > +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
> > > >  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
> > > >  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
> > > >  #define ENVCFG_CBIE_SHIFT		4
> > > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/as=
m/hwcap.h
> > > > index e17d0078a651..35d7aa49785d 100644
> > > > --- a/arch/riscv/include/asm/hwcap.h
> > > > +++ b/arch/riscv/include/asm/hwcap.h
> > > > @@ -81,6 +81,8 @@
> > > >  #define RISCV_ISA_EXT_ZTSO		72
> > > >  #define RISCV_ISA_EXT_ZACAS		73
> > > >  #define RISCV_ISA_EXT_XANDESPMU		74
> > > > +#define RISCV_ISA_EXT_SVADE             75
> > > > +#define RISCV_ISA_EXT_SVADU		76
> > > > =20
> > > >  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > > =20
> > > > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/=
asm/pgtable.h
> > > > index aad8b8ca51f1..7287ea4a6160 100644
> > > > --- a/arch/riscv/include/asm/pgtable.h
> > > > +++ b/arch/riscv/include/asm/pgtable.h
> > > > @@ -120,6 +120,7 @@
> > > >  #include <asm/tlbflush.h>
> > > >  #include <linux/mm_types.h>
> > > >  #include <asm/compat.h>
> > > > +#include <asm/cpufeature.h>
> > > > =20
> > > >  #define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PA=
GE_PFN_SHIFT)
> > > > =20
> > > > @@ -288,7 +289,6 @@ static inline pte_t pud_pte(pud_t pud)
> > > >  }
> > > > =20
> > > >  #ifdef CONFIG_RISCV_ISA_SVNAPOT
> > > > -#include <asm/cpufeature.h>
> > > > =20
> > > >  static __always_inline bool has_svnapot(void)
> > > >  {
> > > > @@ -624,6 +624,18 @@ static inline pgprot_t pgprot_writecombine(pgp=
rot_t _prot)
> > > >  	return __pgprot(prot);
> > > >  }
> > > > =20
> > > > +/*
> > > > + * Both Svade and Svadu control the hardware behavior when the PTE=
 A/D bits need to be set. By
> > > > + * default the M-mode firmware enables the hardware updating schem=
e when only Svadu is present in
> > > > + * DT.
> > > > + */
> > > > +#define arch_has_hw_pte_young arch_has_hw_pte_young
> > > > +static inline bool arch_has_hw_pte_young(void)
> > > > +{
> > > > +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU) &&
> > > > +	       !riscv_has_extension_likely(RISCV_ISA_EXT_SVADE);
> > >=20
> > > It's hard to guess what is, or will be, more likely to be the correct
> > > choice of call between the _unlikely and _likely variants. But, while=
 we
> > > assume svade is most prevalent right now, it's actually quite unlikely
> > > that 'svade' will be in the DT, since DTs haven't been putting it the=
re
> > > yet. Anyway, it doesn't really matter much and maybe the _unlikely vs.
> > > _likely variants are better for documenting expectations than for
> > > performance.
> >=20
> > binding hat off, and kernel hat on, what do we actually do if there's
> > neither Svadu or Svade in the firmware's description of the hardware?
> > Do we just arbitrarily turn on Svade, like we already do for some
> > extensions:
> > 	/*
> > 	 * These ones were as they were part of the base ISA when the
> > 	 * port & dt-bindings were upstreamed, and so can be set
> > 	 * unconditionally where `i` is in riscv,isa on DT systems.
> > 	 */
> > 	if (acpi_disabled) {
> > 		set_bit(RISCV_ISA_EXT_ZICSR, isainfo->isa);
> > 		set_bit(RISCV_ISA_EXT_ZIFENCEI, isainfo->isa);
> > 		set_bit(RISCV_ISA_EXT_ZICNTR, isainfo->isa);
> > 		set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
> > 	}
> >
>=20
> Yes, I think that's reasonable, assuming we do it in the final "pass",
> where we're sure svadu isn't present.

I haven't thought about specifically when to do it, but does it need to
be in the final pass? If we were to, on each CPU, enable it if Svadu
isn't there, we'd either end up with a system that I suspect we're not
going to be supporting or the correct result. Or am I misunderstanding,
and it will be valid to have a subset of CPUs that have Svadu enabled
=66rom the bootloader?

Note that it would not be problematic to have 3 CPUs with Svade + Svadu
and a 4th with only Svade in the DT because we would just not use the
FWFT mechanism to enable Svadu. It's just the Svadu in isolation case
that I'm asking about.

> Doing this is a good idea since
> we'll be able to simplify conditions, as we can just use 'if (svade)'
> since !svade would imply svadu. With FWFT and both, we'll want to remove
> svade from the isa bitmap when enabling svadu.

Right I would like to move the various extension stuff in this
direction, where they have a bit more intelligence to them, and don't
just reflect the state in DT/ACPI directly.
I've got some patches in mind once Clement's Zca etc patchset
is merged, think I posted one or two as replies to conversations on
the list already. An example would be disabling the vector crypto
extensions if we've had to disable vector, or as you suggest here,
dropping Svade if we have turned on Svadu using FWFT. I think that makes
the APIs more understandable to developers and more useful than they are
at the moment, where to use vector crypto you also need to check vector
itself for the code to be correct. If I call
riscv_isa_extension_available(), and it returns true, the extension
should be usable IMO.

--pCXJhPrWw6SKifaM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnVdUAAKCRB4tDGHoIJi
0us5AQDjhCtwq6B0eziUOyCgZN1e810EXdmK6L2MzfQwhni3gAEA0YHddmw3/DZ7
hjZOoogBaW/172TwK7PJGwVV77U0TAs=
=P8X2
-----END PGP SIGNATURE-----

--pCXJhPrWw6SKifaM--


--===============7134666562303283484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7134666562303283484==--

