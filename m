Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AD5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Feb 2022 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pv1lo/YDiac7hlBhAfRC73+KGQd2WxBTDHEKEin6WxY=; b=PH/+coYiHoMFm4
	Vee3p0FCcD2Tf2vlaCPy8UcLtyKr5hReicqNKf4XxUHpWqwk8xWeJ0vqKif85APmtQCbY7dkg2HJr
	BU/mI7cKjUWShhxGhoNsajvCCfw3JdrHWKLknPEwW2pZOdxOX5SKJg98sBroIJo0y/QNdlr2+5UQk
	MeKfdMZh48QtgCGDnD4aXeRKxuz7v0tTG0m1NOPy4ppIMsYvl4bAiAAMVRssP8p5H+2F0fZnA5zv3
	enzACv5BCL8pShqc04fUtfZN9+HoWlE9YvR77B1gMvzhX8A0m0h/5fqmpeaGbcr6k5SifH+Hx+ykH
	DoZefecelF91ug92aN9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIL3O-005Rza-Jg; Fri, 11 Feb 2022 01:48:54 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIL3L-005RyB-48
 for linux-riscv@lists.infradead.org; Fri, 11 Feb 2022 01:48:53 +0000
Received: by mail-yb1-xb36.google.com with SMTP id v186so20803401ybg.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 17:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MtclKlVPNmwnTMdbXaKV9k92p96q79s2Kk3rmNWUESA=;
 b=qUimIxmfcjg0W3N64aSiuhN3eTxdaSR1VL+PTnyfwQjh/27t9ZAheo0dGkDC+ROOEv
 5wM7dSlcsaD2Pcf1LcsNpIsiq4I+f2r26RenZzRSUAf+QTJEAMlzdQ7+K/Iv12iuAd4/
 QklsA2TaI3QRD7K846L1m9RqeUINAhNzJo3Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MtclKlVPNmwnTMdbXaKV9k92p96q79s2Kk3rmNWUESA=;
 b=Hzfg1os3+ql88fdgCQY8Opx3wWEvjiHkR/77jGXb47j7JNK/Ttls72gfiJX5fn+YAw
 3Z5i3Dq5lLftDyOXmgLfjLYiGFUFh+y/DcnyooIG6zlxZNrTbkZSSQCVVd5TM6p3jCc+
 N9YDURJKoOnqWLMZIzl3rfBvBbCE0SOl2omdxs7VcSUyn1mKS7Dw81V6Otw/3BDWs7PT
 vNfPGHDNB2sx4K+7Mvos8KIjMJYgjWO9hKHaXgMcqOSFzHPm2mG/lEcqqH/SBQukWKHa
 /o3GGKa9B1FINK00GjfXt2sb1Rub30cA359XFFY9Xa1lNn52jp8PzHYGYJ/eH0qpguzZ
 mkRw==
X-Gm-Message-State: AOAM5303oGKLUdx06uLh+PDMZijX+G7bvWaJ0DYLS1hG6gNyal/MyLBl
 mb+/AF3Vz1CNMROBYD1diAkZFgNOUUXqCn/RZ9zU
X-Google-Smtp-Source: ABdhPJwh/Kjq3wxUmzIVchUKWgqmk7NfvUUzdnil9CQ4SvT2PKlIimKUyLApJ+kvMumKy/ztXpSwEpOuffVt2o+Prbc=
X-Received: by 2002:a81:1a0c:: with SMTP id a12mr10438464ywa.271.1644544129465; 
 Thu, 10 Feb 2022 17:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20220209123800.269774-1-heiko@sntech.de>
 <CAOnJCUL5w4+_zJvu-BxP+LGN2ohv6arY+uh0DOU586v_5mCE8g@mail.gmail.com>
In-Reply-To: <CAOnJCUL5w4+_zJvu-BxP+LGN2ohv6arY+uh0DOU586v_5mCE8g@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 10 Feb 2022 17:48:38 -0800
Message-ID: <CAOnJCUKzE3uBfu0Aqpr19b-XB76qY7qtaeK87FF7H4Tw5B+d_Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/14] riscv: support for Svpbmt and D1 memory types
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Wei Fu <wefu@redhat.com>, liush <liush@allwinnertech.com>,
 Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 Xinhaoqu <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_174851_270601_876BF0D0 
X-CRM114-Status: GOOD (  50.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 10, 2022 at 4:25 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Wed, Feb 9, 2022 at 4:38 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Svpbmt is an extension defining "Supervisor-mode: page-based memory types"
> > for things like non-cacheable pages or I/O memory pages.
> >
> >
> > So this is my 2nd try at implementing Svpbmt (and the diverging D1 memory
> > types) using the alternatives framework.
> >
> > This includes a number of changes to the alternatives mechanism itself.
> > The biggest one being the move to a more central location, as I expect
> > in the future, nearly every chip needing some sort of patching, be it
> > either for erratas or for optional features (svpbmt or others).
> >
> > The dt-binding for svpbmt itself is of course not finished and is still
> > using the binding introduced in previous versions, as where to put
> > a svpbmt-property in the devicetree is still under dicussion.
> > Atish seems to be working on a framework for extensions [0],
> >
>
> Here is the patch series
> https://lore.kernel.org/lkml/20220210214018.55739-1-atishp@rivosinc.com/
>
> I think we can simplify the cpu feature probing in PATCH 10 with the
> above series
> which simply relies on the existing riscv_isa bitmap.
>
> We also don't need the separate svpbmt property in DT mmu node.
> Let me know what you think.
>
> > The series also introduces support for the memory types of the D1
> > which are implemented differently to svpbmt. But when patching anyway
> > it's pretty clean to add the D1 variant via ALTERNATIVE_2 to the same
> > location.
> >
> > The only slightly bigger difference is that the "normal" type is not 0
> > as with svpbmt, so kernel patches for this PMA type need to be applied
> > even before the MMU is brought up, so the series introduces a separate
> > stage for that.
> >
> >
> > In theory this series is 3 parts:
> > - sbi cache-flush / null-ptr
> > - alternatives improvements
> > - svpbmt+d1
> >
> > So expecially patches from the first 2 areas could be applied when
> > deemed ready, I just thought to keep it together to show-case where
> > the end-goal is and not requiring jumping between different series.
> >
> >
> > The sbi cache-flush patch is based on Atish's sparse-hartid patch [1],
> > as it touches a similar area in mm/cacheflush.c
> >
> >
> > I picked the recipient list from the previous version, hopefully
> > I didn't forget anybody.
> >

I am also getting a load access fault while booting this series in Qemu.

<with additional debug message when before sbi_trap_redirect in OpenSBI>
sbi_trap_error_debug: hart1: trap handler failed (error -2)
sbi_trap_error_debug: hart1: mcause=0x0000000000000005 mtval=0x0000000080046468
sbi_trap_error_debug: hart1: mtval2=0x0000000000000000 mtinst=0x0000000000000000
sbi_trap_error_debug: hart1: mepc=0x000000008080a8b8 mstatus=0x0000000a00000800
sbi_trap_error_debug: hart1: ra=0x0000000080202b06 sp=0x0000000081203f00
sbi_trap_error_debug: hart1: gp=0x00000000812d9db8 tp=0x0000000080046000
sbi_trap_error_debug: hart1: s0=0x0000000081203f80 s1=0x0000000080c1a8a8
sbi_trap_error_debug: hart1: a0=0x0000000080c1a8a8 a1=0x0000000080c1b0d0
sbi_trap_error_debug: hart1: a2=0x0000000000000002 a3=0x0000000000000000
sbi_trap_error_debug: hart1: a4=0x00000000812da902 a5=0x0000000000000000
sbi_trap_error_debug: hart1: a6=0x0000000000000006 a7=0x0000000000000010
sbi_trap_error_debug: hart1: s2=0x0000000080c1b0d0 s3=0x0000000000000002
sbi_trap_error_debug: hart1: s4=0x00000000bf000000 s5=0x0000000000000000
sbi_trap_error_debug: hart1: s6=0x8000000a00006800 s7=0x000000000000007f
sbi_trap_error_debug: hart1: s8=0x0000000080018038 s9=0x0000000080039eac
sbi_trap_error_debug: hart1: s10=0x0000000000000000 s11=0x0000000000000000
sbi_trap_error_debug: hart1: t0=0x0000000080c04000 t1=0x0000000000000002
sbi_trap_error_debug: hart1: t2=0x0000000000001000 t3=0x0000000000000010
sbi_trap_error_debug: hart1: t4=0x00000000800168be t5=0x0000000000000027
sbi_trap_error_debug: hart1: t6=0x0000000000000001

mepc : 0x000000008080a8b8 - call_function_init (kernel/smp.c)

Kernel - 5.17-rc2 + my patches
Qemu - Alistairs next tree + my patches

I do have some out-of-tree patches but that shouldn't be an issue as I
am able to boot without your patches.
Commenting the *_boot_alternatives at both the places works fine as well.

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 0e1bb97f9749..bdeb7ab3e719 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -342,7 +342,7 @@ clear_bss_done:
        call kasan_early_init
 #endif
        /* Start the kernel */
-       call apply_boot_alternatives
+       //call apply_boot_alternatives
        call soc_early_init
        tail start_kernel

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 7216db5d6a2c..c6bf8f4d3d16 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -819,7 +819,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
        BUG_ON((kernel_map.virt_addr + kernel_map.size) >
ADDRESS_SPACE_END - SZ_4K);
 #endif

-       apply_early_boot_alternatives();
+       //apply_early_boot_alternatives();
        pt_ops_set_early();

        /* Setup early PGD for fixmap */

I am currently debugging it and will let you know if I find the root cause.

> > changes in v6:
> > - rebase onto 5.17-rc1
> > - handle sbi null-ptr differently
> > - improve commit messages
> > - use riscv,mmu as property name
> >
> > changes in v5:
> > - move to use alternatives for runtime-patching
> > - add D1 variant
> >
> >
> > [0] https://lore.kernel.org/r/20211224211632.1698523-1-atishp@rivosinc.com
> > [1] https://lore.kernel.org/r/20220120090918.2646626-1-atishp@rivosinc.com
> >
> >
> > Heiko Stuebner (12):
> >   riscv: prevent null-pointer dereference with sbi_remote_fence_i
> >   riscv: integrate alternatives better into the main architecture
> >   riscv: allow different stages with alternatives
> >   riscv: implement module alternatives
> >   riscv: implement ALTERNATIVE_2 macro
> >   riscv: extend concatenated alternatives-lines to the same length
> >   riscv: prevent compressed instructions in alternatives
> >   riscv: move boot alternatives to a slightly earlier position
> >   riscv: Fix accessing pfn bits in PTEs for non-32bit variants
> >   riscv: add cpufeature handling via alternatives
> >   riscv: remove FIXMAP_PAGE_IO and fall back to its default value
> >   riscv: add memory-type errata for T-Head
> >
> > Wei Fu (2):
> >   dt-bindings: riscv: add MMU Standard Extensions support for Svpbmt
> >   riscv: add RISC-V Svpbmt extension support
> >
> >  .../devicetree/bindings/riscv/cpus.yaml       |  10 ++
> >  arch/riscv/Kconfig.erratas                    |  29 ++--
> >  arch/riscv/Kconfig.socs                       |   1 -
> >  arch/riscv/Makefile                           |   2 +-
> >  arch/riscv/errata/Makefile                    |   2 +-
> >  arch/riscv/errata/sifive/errata.c             |  10 +-
> >  arch/riscv/errata/thead/Makefile              |   1 +
> >  arch/riscv/errata/thead/errata.c              |  85 +++++++++++
> >  arch/riscv/include/asm/alternative-macros.h   | 114 ++++++++-------
> >  arch/riscv/include/asm/alternative.h          |  16 ++-
> >  arch/riscv/include/asm/errata_list.h          |  52 +++++++
> >  arch/riscv/include/asm/fixmap.h               |   2 -
> >  arch/riscv/include/asm/pgtable-32.h           |  17 +++
> >  arch/riscv/include/asm/pgtable-64.h           |  79 +++++++++-
> >  arch/riscv/include/asm/pgtable-bits.h         |  10 --
> >  arch/riscv/include/asm/pgtable.h              |  53 +++++--
> >  arch/riscv/include/asm/vendorid_list.h        |   1 +
> >  arch/riscv/kernel/Makefile                    |   1 +
> >  arch/riscv/{errata => kernel}/alternative.c   |  48 ++++++-
> >  arch/riscv/kernel/cpufeature.c                | 136 +++++++++++++++++-
> >  arch/riscv/kernel/head.S                      |   2 +
> >  arch/riscv/kernel/module.c                    |  29 ++++
> >  arch/riscv/kernel/sbi.c                       |  10 +-
> >  arch/riscv/kernel/smpboot.c                   |   4 -
> >  arch/riscv/kernel/traps.c                     |   2 +-
> >  arch/riscv/mm/init.c                          |   1 +
> >  26 files changed, 606 insertions(+), 111 deletions(-)
> >  create mode 100644 arch/riscv/errata/thead/Makefile
> >  create mode 100644 arch/riscv/errata/thead/errata.c
> >  rename arch/riscv/{errata => kernel}/alternative.c (59%)
> >
> > --
> > 2.30.2
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
