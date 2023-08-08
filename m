Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECA5C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlIqsF/R93YjTFQjMuTkJJgpSZ571OePRtywSeHweeI=; b=vVBK+dz1hQ5N/lGOYFTZZAxte8
	aI4tKDxtk3m+ClY3G7H5QIjQe8n0rQemascxcfg/D4My8UBlf3S+pPYm68OjMV8oU3/iv24cDBwAi
	4r1WnxaYT0QN8425UD/rYUkCBVUeXwZfCWzTAlgNFWl6WnndBH9CNpBTHyF3cYwR4b36dPLZ6xeVb
	YzqHXUJyo1rgPQeTjSQUAZ799RzQ2WtMDhq17nL/QwEL5uCo2C96K9sYtep6yQBmeb2Uy5NA/M5zx
	iCu9pd8rUexOEAROH15t6a/f2znFl/MJFxAx/GcMOqN3oVE8v9/2HNpOJMx6d57ZihxnjmrfBU74t
	JY/3LLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMvh-002ffR-2X;
	Tue, 08 Aug 2023 13:39:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTMvd-002fej-2M
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 13:39:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C558A62555;
	Tue,  8 Aug 2023 13:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB753C433C7;
	Tue,  8 Aug 2023 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691501956;
	bh=Ki1HzhNVrEMQqJYK0ubVbjtanH8DpF6Ky5gGu4/0x4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoX/eMO017CMAZkvb5eeeZSwrGoo7OhaWXNBUPAwkABu5o8SDL76hkMVFaXDUR5Io
	 Nn0o252MBpOGGoZYWuNRNgFRx5bOTLOTY993hG6hJUjbz1nIX/5ukgMnMXkxGl1zba
	 Mo3kuaoicSI+nGJ9g/AG+ieTHPdLvzThSBQorQGCGt9p17fq4lkAUz4SwEW0stHdO7
	 Szagd69E8U2I5XXZ4IV7JaHi9SYjiOGvOnevorrizcM64DnADzW35VYq4e0ljaSbXr
	 rpWSPeHnMcHVQVEklx3CorOhu5FBhpKItIdm9k2lUzS56OGu2NCv4S+5jgbvr6Wbmo
	 qCqtSFuHo4lFA==
Date: Tue, 8 Aug 2023 14:39:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Song Shuai <suagrfillet@gmail.com>,
	JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	Petr Tesarik <petrtesarik@huaweicloud.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Message-ID: <20230808-handbag-mushily-f884178d29f5@spud>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
 <CAHBxVyGgSJ66zMj65tRup2u23KP4=RJ5zN7hj5=K9e91NA9eog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyGgSJ66zMj65tRup2u23KP4=RJ5zN7hj5=K9e91NA9eog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_063917_853476_F30E79E8 
X-CRM114-Status: GOOD (  49.13  )
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
Content-Type: multipart/mixed; boundary="===============6768086568697399878=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6768086568697399878==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rx7tRWhyclYJdoyr"
Content-Disposition: inline


--rx7tRWhyclYJdoyr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2023 at 12:54:11AM -0700, Atish Kumar Patra wrote:
> On Wed, Aug 2, 2023 at 4:14=E2=80=AFAM Conor Dooley <conor.dooley@microch=
ip.com> wrote:
> >
> > Add an erratum for versions [v0.8 to v1.3) of OpenSBI which fail to add
> > the "no-map" property to the reserved memory nodes for the regions it
> > has protected using PMPs.
> >
> > Our existing fix sweeping hibernation under the carpet by marking it
> > NONPORTABLE is insufficient as there are other ways to generate
> > accesses to these reserved memory regions, as Petr discovered [1]
> > while testing crash kernels & kdump.
> >
> > Intercede during the boot process when the afflicted versions of OpenSBI
> > are present & set the "no-map" property in all "mmode_resv" nodes before
> > the kernel does its reserved memory region initialisation.
> >
>=20
> We have different mechanisms of DT being passed to the kernel.
>=20
> 1. A prior stage(e.g U-Boot SPL) to M-mode runtime firmware (e.g.
> OpenSBI, rustSBI) passes the DT to M-mode runtime firmware and it
> passes to the next stage.
> In this case, M-mode runtime firmware gets a chance to update the
> no-map property in DT that the kernel can parse.
>=20
> 2. User loads the DT from the boot loader (e.g EDK2, U-Boot proper).
> Any DT patching done by the M-mode firmware is useless. If these DTBs
> don't have the no-map
> property, hibernation or EFI booting will have issues as well.
>=20

> We are trying to solve only one part of problem #1 in this patch.

Correct.

If someone's second stage is also providing an incorrect devicetree
then, yeah, this approach would fall apart - but it's the firmware
provided devicetree being incorrect that I am trying to account for
here. If a person incorrectly constructed one, I am not really sure what
we can do for them, they incorrect described their hardware /shrug
My patch should of course help in some of the scenarios you mention above
if the name of the reserved memory region from OpenSBI is propagated by
the second-stage bootloader, but that is just an extension of case 1,
not case 2.

> I
> don't think any other M-mode runtime firmware patches DT with no-map
> property as well.
> Please let me know if I am wrong about that. The problem is not
> restricted to [v0.8 to v1.3) of OpenSBI.

It comes down to Alex's question - do we want to fix this kind of
firmware issue in the kernel? Ultimately this is a policy decision that
"somebody" has to make. Maybe the list of firmwares that need this
grows, but hopefully this bug will be fixed everywhere going forward,
since, as you say, we now have a document.
The reason I've only targeted OpenSBI here is that it's what is being
shipped on people's SBCs etc by default & is also what is in the
versions of QEMU that people seem to be using. Unless there's some
example that I am missing, other firmwares are either not affected or
not actually being shipped on to consumers?

> The booting doc now says that no-map property must be set and any
> usage of DTBs without that (via #1 or #2) will have unintended
> consequences.

Which is great. It unfortunately does not help one iota with stuff
that's already in the wild.

Thanks,
Conor.

> > Reported-by: Song Shuai <suagrfillet@gmail.com>
> > Link: https://lore.kernel.org/all/CAAYs2=3DgQvkhTeioMmqRDVGjdtNF_vhB+vm=
_1dHJxPNi75YDQ_Q@mail.gmail.com/
> > Reported-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> > Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6=
z8
> > Reported-by: Petr Tesarik <petrtesarik@huaweicloud.com>
> > Closes: https://lore.kernel.org/linux-riscv/76ff0f51-d6c1-580d-f943-061=
e93073306@huaweicloud.com/ [1]
> > CC: stable@vger.kernel.org
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/include/asm/sbi.h |  5 +++++
> >  arch/riscv/kernel/sbi.c      | 42 +++++++++++++++++++++++++++++++++++-
> >  arch/riscv/mm/init.c         |  3 +++
> >  3 files changed, 49 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 5b4a1bf5f439..5360f3476278 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -252,6 +252,9 @@ enum sbi_pmu_ctr_type {
> >  #define SBI_ERR_ALREADY_STARTED -7
> >  #define SBI_ERR_ALREADY_STOPPED -8
> >
> > +/* SBI implementation IDs */
> > +#define SBI_IMP_OPENSBI        1
> > +
> >  extern unsigned long sbi_spec_version;
> >  struct sbiret {
> >         long error;
> > @@ -259,6 +262,8 @@ struct sbiret {
> >  };
> >
> >  void sbi_init(void);
> > +void sbi_apply_reserved_mem_erratum(void *dtb_va);
> > +
> >  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> >                         unsigned long arg1, unsigned long arg2,
> >                         unsigned long arg3, unsigned long arg4,
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index c672c8ba9a2a..aeb27263fa53 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -5,8 +5,10 @@
> >   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/bits.h>
> >  #include <linux/init.h>
> > +#include <linux/libfdt.h>
> >  #include <linux/pm.h>
> >  #include <linux/reboot.h>
> >  #include <asm/sbi.h>
> > @@ -583,6 +585,40 @@ long sbi_get_mimpid(void)
> >  }
> >  EXPORT_SYMBOL_GPL(sbi_get_mimpid);
> >
> > +static long sbi_firmware_id;
> > +static long sbi_firmware_version;
> > +
> > +/*
> > + * For devicetrees patched by OpenSBI a "mmode_resv" node is added to =
cover
> > + * the region OpenSBI has protected by means of a PMP. Some versions o=
f OpenSBI,
> > + * [v0.8 to v1.3), omitted the "no-map" property, but this trips up hi=
bernation
> > + * among other things.
> > + */
> > +void __init sbi_apply_reserved_mem_erratum(void *dtb_pa)
> > +{
> > +       int child, reserved_mem;
> > +
> > +       if (sbi_firmware_id !=3D SBI_IMP_OPENSBI)
> > +               return;
> > +
> > +       if (!acpi_disabled)
> > +               return;
> > +
> > +       if (sbi_firmware_version >=3D 0x10003 || sbi_firmware_version <=
 0x8)
> > +               return;
> > +
> > +       reserved_mem =3D fdt_path_offset((void *)dtb_pa, "/reserved-mem=
ory");
> > +       if (reserved_mem < 0)
> > +               return;
> > +
> > +       fdt_for_each_subnode(child, (void *)dtb_pa, reserved_mem) {
> > +               const char *name =3D fdt_get_name((void *)dtb_pa, child=
, NULL);
> > +
> > +               if (!strncmp(name, "mmode_resv", 10))
> > +                       fdt_setprop((void *)dtb_pa, child, "no-map", NU=
LL, 0);
> > +       }
> > +};
> > +
> >  void __init sbi_init(void)
> >  {
> >         int ret;
> > @@ -596,8 +632,12 @@ void __init sbi_init(void)
> >                 sbi_major_version(), sbi_minor_version());
> >
> >         if (!sbi_spec_is_0_1()) {
> > +               sbi_firmware_id =3D sbi_get_firmware_id();
> > +               sbi_firmware_version =3D sbi_get_firmware_version();
> > +
> >                 pr_info("SBI implementation ID=3D0x%lx Version=3D0x%lx\=
n",
> > -                       sbi_get_firmware_id(), sbi_get_firmware_version=
());
> > +                       sbi_firmware_id, sbi_firmware_version);
> > +
> >                 if (sbi_probe_extension(SBI_EXT_TIME)) {
> >                         __sbi_set_timer =3D __sbi_set_timer_v02;
> >                         pr_info("SBI TIME extension detected\n");
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 70fb31960b63..cb16bfdeacdb 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -29,6 +29,7 @@
> >  #include <asm/tlbflush.h>
> >  #include <asm/sections.h>
> >  #include <asm/soc.h>
> > +#include <asm/sbi.h>
> >  #include <asm/io.h>
> >  #include <asm/ptdump.h>
> >  #include <asm/numa.h>
> > @@ -253,6 +254,8 @@ static void __init setup_bootmem(void)
> >          * in the device tree, otherwise the allocation could end up in=
 a
> >          * reserved region.
> >          */
> > +
> > +       sbi_apply_reserved_mem_erratum(dtb_early_va);
> >         early_init_fdt_scan_reserved_mem();
> >
> >         /*
> > --
> > 2.40.1
> >

--rx7tRWhyclYJdoyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZNJFfwAKCRB4tDGHoIJi
0uEqAP9hw6Quu+1eFhYzWMHbD4zSBoRmdSPjufPiD7IKziLVzgD/XlkWXPdZ+Ror
6EFOBSXlAVHRbpzcs80M/sl1y1Z46wc=
=rpvq
-----END PGP SIGNATURE-----

--rx7tRWhyclYJdoyr--


--===============6768086568697399878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6768086568697399878==--

