Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83ACC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzvXE2b3guHvPx0bjO76HZJE79J7l+vDNPa60F4ic1E=; b=B1rr6WpN8uv677
	VL72au8QkT6MqT7Vc7962ykFtqnZZdyV4Il4rxhnSwauAh5it4DDuoT+M7mTaKUkgWKFuv00s/0nR
	akRpv6uQmNFYqz5OWWURm5JwJLGqHb6XFp7bccJJc5egZXvxZ2eOzqrYaWiY0EjzegH2BNVBAeEVG
	RE8Et/nLp0RK8a37k0bv+5RDn4VSlh4Y0g9YNVo2qR1u6Mof6mBYqu81qwEPkU6KgaJFy+R0yNvyo
	fpFDXiJ76BehETKBmfJbnUk35206WTNdValqH3B/0Zt9enO378nLe0Xh1vSjmQ9Y1ATfmSO30VVXK
	7emUW8LiPDKA3qG8JBjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhYo-00Gm2O-1k; Mon, 14 Feb 2022 20:02:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhYk-00Gm0i-4L
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:02:56 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJhYY-0002ir-VS; Mon, 14 Feb 2022 21:02:43 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Wei Fu <wefu@redhat.com>,
 liush <liush@allwinnertech.com>, Guo Ren <guoren@kernel.org>,
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>,
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>,
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: Re: [PATCH v6 00/14] riscv: support for Svpbmt and D1 memory types
Date: Mon, 14 Feb 2022 21:02:41 +0100
Message-ID: <1644870918.0lLKBYk3Mk@diego>
In-Reply-To: <CAOnJCUJX9bmPDN1S+dhjCi1RE5D=d2yHeHmfy9y8NLWrDDazvQ@mail.gmail.com>
References: <20220209123800.269774-1-heiko@sntech.de>
 <2177281.3HUnQTRebA@diego>
 <CAOnJCUJX9bmPDN1S+dhjCi1RE5D=d2yHeHmfy9y8NLWrDDazvQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120254_497773_D5D6F880 
X-CRM114-Status: GOOD (  51.48  )
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

Hi Atish,

Am Samstag, 12. Februar 2022, 01:25:53 CET schrieb Atish Patra:
> On Thu, Feb 10, 2022 at 6:04 PM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Am Freitag, 11. Februar 2022, 02:48:38 CET schrieb Atish Patra:
> > > On Thu, Feb 10, 2022 at 4:25 PM Atish Patra <atishp@atishpatra.org> w=
rote:
> > > >
> > > > On Wed, Feb 9, 2022 at 4:38 AM Heiko Stuebner <heiko@sntech.de> wro=
te:
> > > > >
> > > > > Svpbmt is an extension defining "Supervisor-mode: page-based memo=
ry types"
> > > > > for things like non-cacheable pages or I/O memory pages.
> > > > >
> > > > >
> > > > > So this is my 2nd try at implementing Svpbmt (and the diverging D=
1 memory
> > > > > types) using the alternatives framework.
> > > > >
> > > > > This includes a number of changes to the alternatives mechanism i=
tself.
> > > > > The biggest one being the move to a more central location, as I e=
xpect
> > > > > in the future, nearly every chip needing some sort of patching, b=
e it
> > > > > either for erratas or for optional features (svpbmt or others).
> > > > >
> > > > > The dt-binding for svpbmt itself is of course not finished and is=
 still
> > > > > using the binding introduced in previous versions, as where to put
> > > > > a svpbmt-property in the devicetree is still under dicussion.
> > > > > Atish seems to be working on a framework for extensions [0],
> > > > >
> > > >
> > > > Here is the patch series
> > > > https://lore.kernel.org/lkml/20220210214018.55739-1-atishp@rivosinc=
.com/
> > > >
> > > > I think we can simplify the cpu feature probing in PATCH 10 with the
> > > > above series
> > > > which simply relies on the existing riscv_isa bitmap.
> > > >
> > > > We also don't need the separate svpbmt property in DT mmu node.
> > > > Let me know what you think.
> > > >
> > > > > The series also introduces support for the memory types of the D1
> > > > > which are implemented differently to svpbmt. But when patching an=
yway
> > > > > it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the =
same
> > > > > location.
> > > > >
> > > > > The only slightly bigger difference is that the "normal" type is =
not 0
> > > > > as with svpbmt, so kernel patches for this PMA type need to be ap=
plied
> > > > > even before the MMU is brought up, so the series introduces a sep=
arate
> > > > > stage for that.
> > > > >
> > > > >
> > > > > In theory this series is 3 parts:
> > > > > - sbi cache-flush / null-ptr
> > > > > - alternatives improvements
> > > > > - svpbmt+d1
> > > > >
> > > > > So expecially patches from the first 2 areas could be applied when
> > > > > deemed ready, I just thought to keep it together to show-case whe=
re
> > > > > the end-goal is and not requiring jumping between different serie=
s.
> > > > >
> > > > >
> > > > > The sbi cache-flush patch is based on Atish's sparse-hartid patch=
 [1],
> > > > > as it touches a similar area in mm/cacheflush.c
> > > > >
> > > > >
> > > > > I picked the recipient list from the previous version, hopefully
> > > > > I didn't forget anybody.
> > > > >
> > >
> > > I am also getting a load access fault while booting this series in Qe=
mu.
> > >
> > > <with additional debug message when before sbi_trap_redirect in OpenS=
BI>
> > > sbi_trap_error_debug: hart1: trap handler failed (error -2)
> > > sbi_trap_error_debug: hart1: mcause=3D0x0000000000000005 mtval=3D0x00=
00000080046468
> > > sbi_trap_error_debug: hart1: mtval2=3D0x0000000000000000 mtinst=3D0x0=
000000000000000
> > > sbi_trap_error_debug: hart1: mepc=3D0x000000008080a8b8 mstatus=3D0x00=
00000a00000800
> > > sbi_trap_error_debug: hart1: ra=3D0x0000000080202b06 sp=3D0x000000008=
1203f00
> > > sbi_trap_error_debug: hart1: gp=3D0x00000000812d9db8 tp=3D0x000000008=
0046000
> > > sbi_trap_error_debug: hart1: s0=3D0x0000000081203f80 s1=3D0x000000008=
0c1a8a8
> > > sbi_trap_error_debug: hart1: a0=3D0x0000000080c1a8a8 a1=3D0x000000008=
0c1b0d0
> > > sbi_trap_error_debug: hart1: a2=3D0x0000000000000002 a3=3D0x000000000=
0000000
> > > sbi_trap_error_debug: hart1: a4=3D0x00000000812da902 a5=3D0x000000000=
0000000
> > > sbi_trap_error_debug: hart1: a6=3D0x0000000000000006 a7=3D0x000000000=
0000010
> > > sbi_trap_error_debug: hart1: s2=3D0x0000000080c1b0d0 s3=3D0x000000000=
0000002
> > > sbi_trap_error_debug: hart1: s4=3D0x00000000bf000000 s5=3D0x000000000=
0000000
> > > sbi_trap_error_debug: hart1: s6=3D0x8000000a00006800 s7=3D0x000000000=
000007f
> > > sbi_trap_error_debug: hart1: s8=3D0x0000000080018038 s9=3D0x000000008=
0039eac
> > > sbi_trap_error_debug: hart1: s10=3D0x0000000000000000 s11=3D0x0000000=
000000000
> > > sbi_trap_error_debug: hart1: t0=3D0x0000000080c04000 t1=3D0x000000000=
0000002
> > > sbi_trap_error_debug: hart1: t2=3D0x0000000000001000 t3=3D0x000000000=
0000010
> > > sbi_trap_error_debug: hart1: t4=3D0x00000000800168be t5=3D0x000000000=
0000027
> > > sbi_trap_error_debug: hart1: t6=3D0x0000000000000001
> > >
> > > mepc : 0x000000008080a8b8 - call_function_init (kernel/smp.c)
> > >
> > > Kernel - 5.17-rc2 + my patches
> > > Qemu - Alistairs next tree + my patches
> >
> > very strange. I was testing of course with Qemu as well, though never s=
aw
> > anything like this.
> >
> > But of course it was Qemu master + the then still pending svpbmt patchs=
et [0]
> > [looks like Alistair applied this today] + a patch that made qemu inser=
t the
> > svpbmt dt-property for the virt machine.
> >
> > Oh ... just to make sure, did you enable the svpbmt parameter when star=
ting
> > Qemu? (-cpu ...,svpbmt=3Dtrue)
> >
> =

> Yeah. I tried with or without. It's failing in both cases. I found a
> fix but that may be unrelated and hiding the real issue.
> Marking the cpufeature_svpbmt_check_of functions inline allows me to boot.
> =

> Here is my analysis:
> =

> Here is the trace of the trap:
> sbi_trap_error_debug: hart0: trap handler failed (error -2)
> sbi_trap_error_debug: hart0: mcause=3D0x0000000000000005 mtval=3D0x000000=
0080048468
> sbi_trap_error_debug: hart0: mtval2=3D0x0000000000000000 mtinst=3D0x00000=
00000000000
> sbi_trap_error_debug: hart0: mepc=3D0x000000008080a8b8 mstatus=3D0x000000=
0a00000800
> sbi_trap_error_debug: hart0: ra=3D0x0000000080202b06 sp=3D0x0000000081203=
f00
> sbi_trap_error_debug: hart0: gp=3D0x00000000812d9db8 tp=3D0x0000000080048=
000
> sbi_trap_error_debug: hart0: s0=3D0x0000000081203f80 s1=3D0x0000000080c1a=
8a8
> sbi_trap_error_debug: hart0: a0=3D0x0000000080c1a8a8 a1=3D0x0000000080c1b=
0d0
> sbi_trap_error_debug: hart0: a2=3D0x0000000000000002 a3=3D0x0000000000000=
000
> sbi_trap_error_debug: hart0: a4=3D0x00000000812da902 a5=3D0x0000000000000=
000
> sbi_trap_error_debug: hart0: a6=3D0x0000000000000006 a7=3D0x0000000000000=
010
> sbi_trap_error_debug: hart0: s2=3D0x0000000080c1b0d0 s3=3D0x0000000000000=
002
> sbi_trap_error_debug: hart0: s4=3D0x00000000bf000000 s5=3D0x0000000000000=
000
> sbi_trap_error_debug: hart0: s6=3D0x8000000a00006800 s7=3D0x0000000000000=
07f
> sbi_trap_error_debug: hart0: s8=3D0x0000000080018038 s9=3D0x0000000080039=
ea8
> sbi_trap_error_debug: hart0: s10=3D0x0000000000000000 s11=3D0x00000000000=
00000
> sbi_trap_error_debug: hart0: t0=3D0x0000000080c04000 t1=3D0x0000000000000=
002
> sbi_trap_error_debug: hart0: t2=3D0x0000000000001000 t3=3D0x0000000000000=
010
> sbi_trap_error_debug: hart0: t4=3D0x00000000800168be t5=3D0x0000000000000=
027
> sbi_trap_error_debug: hart0: t6=3D0x0000000000000001
> =

> mepc : 0x000000008080a8b8 - should be ffffffff8060a8b8 in objdump
> output after offset
> =

> Here is the snippet of the objdump output for riscv_cpufeature_patch_func
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> inline output: (booting fails with above dump)
> =

> void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entr=
y *end,
>                                  unsigned int stage)
> {
> ffffffff8060a89a:       7119                    addi    sp,sp,-128
> ffffffff8060a89c:       f8a2                    sd      s0,112(sp)
> ffffffff8060a89e:       f4a6                    sd      s1,104(sp)
> ffffffff8060a8a0:       f0ca                    sd      s2,96(sp)
> ffffffff8060a8a2:       e4d6                    sd      s5,72(sp)
> ffffffff8060a8a4:       fc86                    sd      ra,120(sp)
> ffffffff8060a8a6:       ecce                    sd      s3,88(sp)
> ffffffff8060a8a8:       e8d2                    sd      s4,80(sp)
> ffffffff8060a8aa:       e0da                    sd      s6,64(sp)
> ffffffff8060a8ac:       fc5e                    sd      s7,56(sp)
> ffffffff8060a8ae:       f862                    sd      s8,48(sp)
> ffffffff8060a8b0:       f466                    sd      s9,40(sp)
> ffffffff8060a8b2:       f06a                    sd      s10,32(sp)
> ffffffff8060a8b4:       ec6e                    sd      s11,24(sp)
> ffffffff8060a8b6:       0100                    addi    s0,sp,128
> ffffffff8060a8b8:       46823783                ld      a5,1128(tp) #
> 468 <__efistub_.L0 +0x5> --------> Faulting instruction
> ffffffff8060a8bc:       f8f43423                sd      a5,-120(s0)
> ffffffff8060a8c0:       4781                    li      a5,0
> ffffffff8060a8c2:       8932                    mv      s2,a2
> ffffffff8060a8c4:       84aa                    mv      s1,a0
> ffffffff8060a8c6:       8aae                    mv      s5,a1
>         switch (stage) {
> ffffffff8060a8c8:       ca1d                    beqz
> a2,ffffffff8060a8fe <riscv_cpufeature_patch_func+0x64>
> ffffffff8060a8ca:       4789                    li      a5,2
> ffffffff8060a8cc:       18f60363                beq
> a2,a5,ffffffff8060aa52 <riscv_cpufeature_patch_func+0x1b8>
>         for_each_of_cpu_node(node) {
> ffffffff8060a8d0:       4501                    li      a0,0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> noinline output (boots fine)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entr=
y *end,
>                                  unsigned int stage)
> {
> ffffffff8060a968:       7159                    addi    sp,sp,-112
> ffffffff8060a96a:       f0a2                    sd      s0,96(sp)
> ffffffff8060a96c:       eca6                    sd      s1,88(sp)
> ffffffff8060a96e:       e8ca                    sd      s2,80(sp)
> ffffffff8060a970:       fc56                    sd      s5,56(sp)
> ffffffff8060a972:       f486                    sd      ra,104(sp)
> ffffffff8060a974:       e4ce                    sd      s3,72(sp)
> ffffffff8060a976:       e0d2                    sd      s4,64(sp)
> ffffffff8060a978:       f85a                    sd      s6,48(sp)
> ffffffff8060a97a:       f45e                    sd      s7,40(sp)
> ffffffff8060a97c:       f062                    sd      s8,32(sp)
> ffffffff8060a97e:       ec66                    sd      s9,24(sp)
> ffffffff8060a980:       e86a                    sd      s10,16(sp)
> ffffffff8060a982:       e46e                    sd      s11,8(sp)
> ffffffff8060a984:       1880                    addi    s0,sp,112
> ffffffff8060a986:       8932                    mv      s2,a2
> ffffffff8060a988:       84aa                    mv      s1,a0
> ffffffff8060a98a:       8aae                    mv      s5,a1
>         switch (stage) {
> ffffffff8060a98c:       ca09                    beqz
> a2,ffffffff8060a99e <riscv_cpufeature_patch_func+0x36>
> ffffffff8060a98e:       4789                    li      a5,2
> ffffffff8060a990:       0ef60f63                beq
> a2,a5,ffffffff8060aa8e <riscv_cpufeature_patch_func+0x126>
>                 return cpufeature_svpbmt_check_of();
> ffffffff8060a994:       f07ff0ef                jal
> ra,ffffffff8060a89a <cpufeature_svpbmt_check_of>
>                         cpu_req_feature |=3D (1U << idx);
> ffffffff8060a998:       0005091b                sext.w  s2,a0
> ffffffff8060a99c:       a8d5                    j
> ffffffff8060aa90 <riscv_cpufeature_patch_func+0x128>
>         const void *fdt =3D dtb_early_va;
> =

> =

> Any thoughts ? It looks like it may related to "tp"

Faulting instruction "efistub", so maybe something between efi
and the devicetree not agreeing?

Though at least on my build I also have efistub enabled, so it
should be the same. So it's very strange that you're seeing that
trap, which I've never seen so far.


In any case, I tried your + Tsukasa's patches regarding the isa-extensions
today, and obviously that works fine, so we wil get rid of the devicetree-
parts anyway I guess.

With the change below on top of that v2/v3 version-mix, I also get a
working svpbmt of course. After hacking qemu to generate a
suitable isa-string for me :-) .


Heiko

-------------- 8< ------------------
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 691fc9c8099b..656cd626eb1a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -51,6 +51,7 @@ extern unsigned long elf_hwcap;
  * available logical extension id.
  */
 enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_SVPBMT =3D RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_ID_MAX =3D RISCV_ISA_EXT_MAX,
 };
 =

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ced7e5be8641..b5130b15ca8d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -71,6 +71,7 @@ int riscv_of_parent_hartid(struct device_node *node)
 	}
 =

 static struct riscv_isa_ext_data isa_ext_arr[] =3D {
+	__RISCV_ISA_EXT_DATA("svpbmt", RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 =

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2e4eaedbf7f5..d82033ece1fd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -192,6 +192,8 @@ void __init riscv_fill_hwcap(void)
 			if (!ext_long) {
 				this_hwcap |=3D isa2hwcap[(unsigned char)(*ext)];
 				this_isa |=3D (1UL << (*ext - 'a'));
+			} else {
+				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
 			}
 #undef SET_ISA_EXT_MAP
 		}
@@ -253,64 +255,6 @@ struct cpufeature_info {
 	bool (*check_func)(unsigned int stage);
 };
 =

-#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
-static bool __init_or_module cpufeature_svpbmt_check_fdt(void)
-{
-	const void *fdt =3D dtb_early_va;
-	const char *str;
-	int offset;
-
-	offset =3D fdt_path_offset(fdt, "/cpus");
-	if (offset < 0)
-		return false;
-
-	for (offset =3D fdt_next_node(fdt, offset, NULL); offset >=3D 0;
-	     offset =3D fdt_next_node(fdt, offset, NULL)) {
-		str =3D fdt_getprop(fdt, offset, "device_type", NULL);
-		if (!str || strcmp(str, "cpu"))
-			break;
-
-		str =3D fdt_getprop(fdt, offset, "mmu-type", NULL);
-		if (!str)
-			continue;
-
-		if (!strncmp(str + 6, "none", 4))
-			continue;
-
-		str =3D fdt_getprop(fdt, offset, "riscv,mmu", NULL);
-		if (!str)
-			continue;
-
-		if (!strncmp(str + 6, "svpbmt", 6))
-			return true;
-	}
-
-	return false;
-}
-
-static bool __init_or_module cpufeature_svpbmt_check_of(void)
-{
-	struct device_node *node;
-	const char *str;
-
-	for_each_of_cpu_node(node) {
-		if (of_property_read_string(node, "mmu-type", &str))
-			continue;
-
-		if (!strncmp(str + 6, "none", 4))
-			continue;
-
-		if (of_property_read_string(node, "riscv,mmu", &str))
-			continue;
-
-		if (!strncmp(str + 6, "svpbmt", 6))
-			return true;
-	}
-
-	return false;
-}
-#endif
-
 static bool __init_or_module cpufeature_svpbmt_check_func(unsigned int sta=
ge)
 {
 	bool ret =3D false;
@@ -319,10 +263,8 @@ static bool __init_or_module cpufeature_svpbmt_check_f=
unc(unsigned int stage)
 	switch (stage) {
 	case RISCV_ALTERNATIVES_EARLY_BOOT:
 		return false;
-	case RISCV_ALTERNATIVES_BOOT:
-		return cpufeature_svpbmt_check_fdt();
 	default:
-		return cpufeature_svpbmt_check_of();
+		return riscv_isa_extension_available(NULL, SVPBMT);
 	}
 #endif
 =

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index c01012f3740d..ec07f991866a 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -10,7 +10,6 @@
 #include <asm/thread_info.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
-#include <asm/alternative.h>
 #include <asm/csr.h>
 #include <asm/cpu_ops_sbi.h>
 #include <asm/hwcap.h>
@@ -341,7 +340,6 @@ clear_bss_done:
 	call kasan_early_init
 #endif
 	/* Start the kernel */
-	call apply_boot_alternatives
 	call soc_early_init
 	tail start_kernel
 =

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 339ceb595b38..b4879c942b42 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,7 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 =

+#include <asm/alternative.h>
 #include <asm/cpu_ops.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgtable.h>
@@ -295,6 +296,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 =

 	riscv_fill_hwcap();
+	apply_boot_alternatives();
 }
 =

 static int __init topology_init(void)




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
