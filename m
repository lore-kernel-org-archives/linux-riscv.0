Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BFAC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hgTsOLTy6d4b5OSDGJL5pmoQQM/iAshUqjwUPA0o+dI=; b=y16lp+yLrgsBMd
	6Vo53i0VNtUlOdl1uyShmtzJLbDXYT+TgV216Z3F0BHbEDLIQla6g1LGYrXf09VTFG0TkEqLVUtsS
	ANILX652ela0pXPWc02RrMwv2MZKER7i989WHytGNQrZINzdpCDGUehpt0v/HDHbYW1Zr4XvaU5Aa
	M03eg0ix3b7bhzkHJrKcokwSdVgqEx2zY7wzFVd/MP4+k/pvPeu6X68Z1MJNOe6Y6sqx1G7vtmYzw
	hVaj04Ie+341JL1HfoDlFEvGQzwCV8B34i8EcPKPitgAm+2E21qQEIOlMk0mAhvFxWaDvdxszsRkE
	tkjYWH1re1aYt1LUCZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF6N-000m5p-S4; Mon, 21 Nov 2022 22:17:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF6I-000m4n-F5
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:17:18 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxF6F-0004jX-UP; Mon, 21 Nov 2022 23:17:12 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, ajones@ventanamicro.com, emil.renner.berthing@canonical.com
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
Date: Mon, 21 Nov 2022 23:17:11 +0100
Message-ID: <14108757.uLZWGnKmhe@diego>
In-Reply-To: <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com>
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8vSVY590SUkg81cC8Kq7FjzxdcJ5m2VG=94m0ntis7+8w@mail.gmail.com> <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141714_825545_ABE8CCB8 
X-CRM114-Status: GOOD (  44.17  )
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

Am Montag, 21. November 2022, 22:31:36 CET schrieb Lad, Prabhakar:
> Hi Heiko,
> =

> On Mon, Nov 21, 2022 at 3:06 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > Hi Heiko,
> >
> > On Mon, Nov 21, 2022 at 11:27 AM Heiko St=FCbner <heiko@sntech.de> wrot=
e:
> > >
> > > Hi,
> > >
> > > Am Montag, 21. November 2022, 10:50:09 CET schrieb Lad, Prabhakar:
> > > > On Thu, Nov 10, 2022 at 4:50 PM Heiko Stuebner <heiko@sntech.de> wr=
ote:
> > > > >
> > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > >
> > > > > Alternatives live in a different section, so addresses used by ca=
ll
> > > > > functions will point to wrong locations after the patch got appli=
ed.
> > > > >
> > > > > Similar to arm64, adjust the location to consider that offset.
> > > > >
> > > > > Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > > ---
> > >
> > > [...]
> > >
> > > > I have the below assembly code which I have tested without the
> > > > alternatives for the RZ/Five CMO,
> > > >
> > > > #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)     =
   \
> > > > asm volatile(".option push\n\t\n\t"                    \
> > > >          ".option norvc\n\t"                    \
> > > >          ".option norelax\n\t"                    \
> > > >          "addi sp,sp,-16\n\t"                    \
> > > >          "sd    s0,0(sp)\n\t"                    \
> > > >          "sd    ra,8(sp)\n\t"                    \
> > > >          "addi    s0,sp,16\n\t"                    \
> > > >          "mv a4,%6\n\t"                        \
> > > >          "mv a3,%5\n\t"                        \
> > > >          "mv a2,%4\n\t"                        \
> > > >          "mv a1,%3\n\t"                        \
> > > >          "mv a0,%0\n\t"                        \
> > > >          "call rzfive_cmo\n\t"                    \
> > > >          "ld    ra,8(sp)\n\t"                    \
> > > >          "ld    s0,0(sp)\n\t"                    \
> > > >          "addi    sp,sp,16\n\t"                    \
> > > >          ".option pop\n\t"                        \
> > > >          : : "r"(_cachesize),                    \
> > > >          "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
> > > >          "r"((unsigned long)(_start) + (_size)),            \
> > > >          "r"((unsigned long) (_start)),                \
> > > >          "r"((unsigned long) (_size)),                \
> > > >          "r"((unsigned long) (_dir)),                \
> > > >          "r"((unsigned long) (_ops))                \
> > > >          : "a0", "a1", "a2", "a3", "a4", "memory")
> > > >
> > > > Now when integrate this with ALTERNATIVE_2() as below,
> > > >
> > > > #define ALT_CMO_OP(_op, _start, _size, _cachesize, _dir, _ops)     =
   \
> > > > asm volatile(ALTERNATIVE_2(                        \
> > > >     __nops(14),                            \
> > > >     "mv a0, %1\n\t"                            \
> > > >     "j 2f\n\t"                            \
> > > >     "3:\n\t"                            \
> > > >     "cbo." __stringify(_op) " (a0)\n\t"                \
> > > >     "add a0, a0, %0\n\t"                        \
> > > >     "2:\n\t"                            \
> > > >     "bltu a0, %2, 3b\n\t"                        \
> > > >     __nops(8), 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,    \
> > > >     ".option push\n\t\n\t"                        \
> > > >     ".option norvc\n\t"                        \
> > > >     ".option norelax\n\t"                        \
> > > >     "addi sp,sp,-16\n\t"                        \
> > > >     "sd    s0,0(sp)\n\t"                        \
> > > >     "sd    ra,8(sp)\n\t"                        \
> > > >     "addi    s0,sp,16\n\t"                        \
> > > >     "mv a4,%6\n\t"                            \
> > > >     "mv a3,%5\n\t"                            \
> > > >     "mv a2,%4\n\t"                            \
> > > >     "mv a1,%3\n\t"                            \
> > > >     "mv a0,%0\n\t"                            \
> > > >     "call rzfive_cmo\n\t"                \
> > > >     "ld    ra,8(sp)\n\t"                        \
> > > >     "ld    s0,0(sp)\n\t"                        \
> > > >     "addi    sp,sp,16\n\t"                        \
> > > >     ".option pop\n\t"                        \
> > > >     , ANDESTECH_VENDOR_ID,                        \
> > > >             ERRATA_ANDESTECH_NO_IOCP, CONFIG_ERRATA_RZFIVE_CMO)    \
> > > >     : : "r"(_cachesize),                        \
> > > >     "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),    \
> > > >     "r"((unsigned long)(_start) + (_size)),            \
> > > >     "r"((unsigned long) (_start)),                \
> > > >     "r"((unsigned long) (_size)),                \
> > > >     "r"((unsigned long) (_dir)),                \
> > > >     "r"((unsigned long) (_ops))                \
> > > >     : "a0", "a1", "a2", "a3", "a4", "memory")
> > > >
> > > > I am seeing kernel panic with this change. Looking at the
> > > > riscv_alternative_fix_auipc_jalr() implementation it assumes the re=
st
> > > > of the alternative options are calls too. Is my understanding corre=
ct
> > > > here?
> > >
> > > The loop walks through the instructions after the location got patche=
d and
> > > checks if an instruction is an auipc and the next one is a jalr and o=
nly then
> > > adjusts the address accordingly.
> > >
> > Ok so my understanding was wrong here.
> >
> > > So it _should_ leave all other (non auipc+jalr) instructions alone.
> > > (hopefully)
> > >
> > Agreed.
> >
> > >
> > > > Do you think this is the correct approach in my case?
> > >
> > > It does look correct on first glance.
> > >
> > \o/
> >
> > > As I had that passing thought, are you actually calling
> > >         riscv_alternative_fix_auipc_jalr()
> > > from your errata/.../foo.c after doing the patching?
> > >
> > > I.e. with the current patchset, that function is only called from the
> > > cpufeature part, but for example not from the other patching location=
s.
> > > [and a future revision should probably change that :-) ]
> > >
> > >
> > I have made a local copy of riscv_alternative_fix_auipc_jalr() and
> > then calling it after patch_text_nosync() referring to your patch for
> > str functions.
> >
> > > After making sure that function actually runs, the next thing you cou=
ld try
> > > is to have both the "original" code and the patch be identical, i.e.
> > > replace the cbo* part with your code as well and then just output the
> > > instructions via printk to check what the addresses do in both.
> > >
> > > After riscv_alternative_fix_auipc_jalr() ran then both code variants
> > > should be identical when using the same code in both areas.
> > >
> > So I have added debug prints to match the instructions as below after
> > and before patching:
> >
> > static void riscv_alternative_print_inst(unsigned int *alt_ptr,
> >                      unsigned int len)
> > {
> >     int num_instr =3D len / sizeof(u32);
> >     int i;
> >
> >     for (i =3D 0; i < num_instr; i++)
> >         pr_err("%s instruction: 0x%x\n", __func__, *(alt_ptr + i));
> >
> > }
> >
> > void __init_or_module andes_errata_patch_func(struct alt_entry *begin,
> > struct alt_entry *end,
> >                           unsigned long archid, unsigned long impid,
> >                           unsigned int stage)
> > {
> > ....
> >     if (cpu_req_errata & tmp) {
> >         pr_err("stage: %x -> %px--> %x %x %x\n", stage, alt, tmp,
> > cpu_req_errata, alt->errata_id);
> >         pr_err("old:%ps alt:%ps len:%lx\n", alt->old_ptr,
> > alt->alt_ptr, alt->alt_len);
> >         pr_err("Print old start\n");
> >         riscv_alternative_print_inst(alt->old_ptr, alt->alt_len);
> >         pr_err("Print old end\n");
> >         patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> >
> >         riscv_alternative_fix_auipc_jalr(alt->old_ptr, alt->alt_len,
> >                         alt->old_ptr - alt->alt_ptr);
> >         pr_err("Print patch start\n");
> >         riscv_alternative_print_inst(alt->alt_ptr, alt->alt_len);
> >         pr_err("Print patch end\n");
> >     }
> > .....
> > }
> >
> > Below is the log:
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] Print new old end
> > [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> > [    0.000000] Print patch start
> > [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> > [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> > [    0.000000] riscv_alternative_print_inst instruction: 0xf0713
> > [    0.000000] riscv_alternative_print_inst instruction: 0x78693
> > [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> > [    0.000000] riscv_alternative_print_inst instruction: 0x80593
> > [    0.000000] riscv_alternative_print_inst instruction: 0xe0513
> > [    0.000000] riscv_alternative_print_inst instruction: 0x97
> > [    0.000000] riscv_alternative_print_inst instruction: 0xcba080e7
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> > [    0.000000] Print patch end
> > [    0.000000] stage: 0 -> ffffffff80a2492c--> 1 1 0
> > [    0.000000] old:arch_sync_dma_for_device
> > alt:riscv_noncoherent_supported len:38
> > [    0.000000] Print  old start
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x970013
> >     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This =
instruction doesn't look correct it
> > should be 0x13?
> > [    0.000000] Print  old end
> > [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> > [    0.000000] Print patch start
> > [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> > [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> > [    0.000000] riscv_alternative_print_inst instruction: 0x78713
> > [    0.000000] riscv_alternative_print_inst instruction: 0x78693
> > [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> > [    0.000000] riscv_alternative_print_inst instruction: 0x80593
> > [    0.000000] riscv_alternative_print_inst instruction: 0xe0513
> > [    0.000000] riscv_alternative_print_inst instruction: 0x97
> > [    0.000000] riscv_alternative_print_inst instruction: 0xc82080e7
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct comparing
> > to objdump output this should be 000080e7 or does it require the
> > offset too?
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> > [    0.000000] Print patch end
> > [    0.000000] stage: 0 -> ffffffff80a24950--> 1 1 0
> > [    0.000000] old:arch_sync_dma_for_cpu alt:riscv_noncoherent_supporte=
d len:38
> > [    0.000000] Print old start
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x97
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct it should
> > be 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0xeee080e7
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> Thi=
s instruction doesn't look correct it
> > should be 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] Print old end
> > [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> > [    0.000000] Print patch start
> > [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> > [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> > [    0.000000] riscv_alternative_print_inst instruction: 0xf0713
> > [    0.000000] riscv_alternative_print_inst instruction: 0x80693
> > [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> > [    0.000000] riscv_alternative_print_inst instruction: 0x78593
> > [    0.000000] riscv_alternative_print_inst instruction: 0xe0513
> > [    0.000000] riscv_alternative_print_inst instruction: 0x97
> > [    0.000000] riscv_alternative_print_inst instruction: 0xc4a080e7
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct comparing
> > to objdump output this should be 000080e7 or does it require the
> > offset too?
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> > [    0.000000] Print patch end
> > [    0.000000] stage: 0 -> ffffffff80a24974--> 1 1 0
> > [    0.000000] old:arch_dma_prep_coherent alt:riscv_noncoherent_support=
ed len:38
> > [    0.000000] Print old start
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x970013
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct it should
> > be 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x80e70000
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct it should
> > be 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0xe720
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct it should
> > be 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13
> > [    0.000000] Print old end
> > [    0.000000] riscv_alternative_fix_auipc_jalr num instruction: 14
> > [    0.000000] Print patch start
> > [    0.000000] riscv_alternative_print_inst instruction: 0xff010113
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813023
> > [    0.000000] riscv_alternative_print_inst instruction: 0x113423
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010413
> > [    0.000000] riscv_alternative_print_inst instruction: 0xf0713
> > [    0.000000] riscv_alternative_print_inst instruction: 0xe8693
> > [    0.000000] riscv_alternative_print_inst instruction: 0x88613
> > [    0.000000] riscv_alternative_print_inst instruction: 0x78593
> > [    0.000000] riscv_alternative_print_inst instruction: 0x30513
> > [    0.000000] riscv_alternative_print_inst instruction: 0x97
> > [    0.000000] riscv_alternative_print_inst instruction: 0xc12080e7
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D> This inst=
ruction doesn't look correct comparing
> > to objdump output this should be 000080e7 + offset?
> > [    0.000000] riscv_alternative_print_inst instruction: 0x813083
> > [    0.000000] riscv_alternative_print_inst instruction: 0x13403
> > [    0.000000] riscv_alternative_print_inst instruction: 0x1010113
> > [    0.000000] Print patch end
> >
> > Here is the output from objdump of the file (dma-noncoherent.o):
> >
> > 000000000000032e <.L888^B1>:
> >  32e:    ff010113              addi    sp,sp,-16
> >  332:    00813023              sd    s0,0(sp)
> >  336:    00113423              sd    ra,8(sp)
> >  33a:    01010413              addi    s0,sp,16
> >  33e:    000f0713              mv    a4,t5
> >  342:    00078693              mv    a3,a5
> >  346:    00088613              mv    a2,a7
> >  34a:    00080593              mv    a1,a6
> >  34e:    000e0513              mv    a0,t3
> >  352:    00000097              auipc    ra,0x0
> >  356:    000080e7              jalr    ra # 352 <.L888^B1+0x24>
> >  35a:    00813083              ld    ra,8(sp)
> >  35e:    00013403              ld    s0,0(sp)
> >  362:    01010113              addi    sp,sp,16
> >
> > 0000000000000366 <.L888^B2>:
> >  366:    ff010113              addi    sp,sp,-16
> >  36a:    00813023              sd    s0,0(sp)
> >  36e:    00113423              sd    ra,8(sp)
> >  372:    01010413              addi    s0,sp,16
> >  376:    00078713              mv    a4,a5
> >  37a:    00078693              mv    a3,a5
> >  37e:    00088613              mv    a2,a7
> >  382:    00080593              mv    a1,a6
> >  386:    000e0513              mv    a0,t3
> >  38a:    00000097              auipc    ra,0x0
> >  38e:    000080e7              jalr    ra # 38a <.L888^B2+0x24>
> >  392:    00813083              ld    ra,8(sp)
> >  396:    00013403              ld    s0,0(sp)
> >  39a:    01010113              addi    sp,sp,16
> >
> > 000000000000039e <.L888^B3>:
> >  39e:    ff010113              addi    sp,sp,-16
> >  3a2:    00813023              sd    s0,0(sp)
> >  3a6:    00113423              sd    ra,8(sp)
> >  3aa:    01010413              addi    s0,sp,16
> >  3ae:    000f0713              mv    a4,t5
> >  3b2:    00080693              mv    a3,a6
> >  3b6:    00088613              mv    a2,a7
> >  3ba:    00078593              mv    a1,a5
> >  3be:    000e0513              mv    a0,t3
> >  3c2:    00000097              auipc    ra,0x0
> >  3c6:    000080e7              jalr    ra # 3c2 <.L888^B3+0x24>
> >  3ca:    00813083              ld    ra,8(sp)
> >  3ce:    00013403              ld    s0,0(sp)
> >  3d2:    01010113              addi    sp,sp,16
> >
> > 00000000000003d6 <.L888^B4>:
> >  3d6:    ff010113              addi    sp,sp,-16
> >  3da:    00813023              sd    s0,0(sp)
> >  3de:    00113423              sd    ra,8(sp)
> >  3e2:    01010413              addi    s0,sp,16
> >  3e6:    000f0713              mv    a4,t5
> >  3ea:    000e8693              mv    a3,t4
> >  3ee:    00088613              mv    a2,a7
> >  3f2:    00078593              mv    a1,a5
> >  3f6:    00030513              mv    a0,t1
> >  3fa:    00000097              auipc    ra,0x0
> >  3fe:    000080e7              jalr    ra # 3fa <.L888^B4+0x24>
> >  402:    00813083              ld    ra,8(sp)
> >  406:    00013403              ld    s0,0(sp)
> >  40a:    01010113              addi    sp,sp,16
> >
> > Disassembly of section __ksymtab_strings:
> >
> > Any pointers what could be happening?
> >
> =

> Some more information,
> =

> - If I drop the riscv_alternative_fix_auipc_jalr() call after
> patch_text_nosync() and then print the alt->old_ptr instructions
> before patching I can see the instructions as 0x13 (nop) which is
> correct.
> =

> - if I call riscv_alternative_fix_auipc_jalr() call after
> patch_text_nosync() and then print the alt->old_ptr instructions
> before patching I dont see 0x13 (nop) consistently for old
> instructions.

which is to be expected I guess.

alt->old_ptr points to the memory location where the live kernel code
lives.

I.e. the code at this location is the thing the kernel actually runs.
The code at this location then gets overwritten by the alternative
assembly.


> - If I replace the nop's in the old instructions with my assembly code
> of rz/five cmo and then just use patch_text_nosync() I can see the
> correct actual instruction being printed apart from jalr (is some sort
> of offset added to it as I see last 4 bits match?) and then is
> replaced correctly by the same alt instructions apart from the jalr
> (log [0]).
> =

> - If I replace the nop's in the old instructions with my assembly code
> of rz/five cmo and then use patch_text_nosync() and
> riscv_alternative_fix_auipc_jalr() I can see the actual old
> instructions differs a bit and again the jalr instruction differs too
> in the patched code (log [1]).
> =

> [0] https://paste.debian.net/1261412/
> [1] https://paste.debian.net/1261413/
> =

> Attached is the objump of dma-noncoherent.o for reference.

I did read that objdumps are not really conclusive when looking
at auipc + jalr instructions, hence the printing of the actual instructions.

As either manually or with a helper like

	https://luplab.gitlab.io/rvcodecjs/#q=3D0xf4c080e7

you can then decode the actual instruction and compare.

In your log the two jalr instructions decode to different offsets,
	jalr x1, x1, -180
vs
	jalr x1, x1, -834

Can you check what the patch_offset value is in your case?

Interestingly the
	auipc x1, 0
is 0 for both cases.

I'll try to build a real test-setup mimicing what you're doing
tomorrow (european tomorrow).


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
