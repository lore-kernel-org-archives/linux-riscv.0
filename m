Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EB4C433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 07:29:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7981C2080C
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 07:29:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rQpdMUY8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vomabbUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7981C2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3LnU4Byy+Kf87NT/T1M9ofi7hpKOcZ5OlibHAQ99GFo=; b=rQpdMUY8l1EkmaxEgtJaUNAkw
	2mTgsR7TNTPgskQ8k5beetoK0M3PMT/V8/dXx5kxpzf5lxBuHMel9XwjkLVtJWW1q0GeAPw0/6Cqk
	Tvbox4Pf+L+qBWMPGr8iZ8aSNRdkMkytEE9PzsHqEr6h304n/k/smoGiQ1ey9KY40hiq92T6dOmzJ
	GgU3t4BBS1wK7lIPhCWxPyMaMfm2vZ+ks1fw89vWAFxZYH/+uzYnpVydohRYSbNeOP8W0Uj+G07ER
	wkmk9VjjumH0R7ESgD7Q8qKK2HP+mhwnbskmgxjdPlB07N8aXLfgBwv50p7EUqLAkfvDBDBhZcJzO
	1VxJM+8Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFuXz-0002Y5-8D; Wed, 09 Sep 2020 07:29:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFuXw-0002XD-9w
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 07:29:37 +0000
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5640321D81
 for <linux-riscv@lists.infradead.org>; Wed,  9 Sep 2020 07:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599636574;
 bh=YTjibJJgcTMrv+eyJ7e8ROuPqmNOZQrNBZ1Olqx36VA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vomabbUdlBUZCb5hWdG3jTmcOKZWOqZW/KEMslFPeytqmYVHqCSK5j3fVVSpoPYhg
 VWdGS4UzTTXxXpO01yleS3Nkz9jTEL29ycjTKfPaWKq0ILd22IIVMZasaefqhyr4gL
 YQJXK/C4Z5aW9Q69E8gSSOuauhB0Uf07oogBbYLE=
Received: by mail-oo1-f46.google.com with SMTP id z1so355634ooj.3
 for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2020 00:29:34 -0700 (PDT)
X-Gm-Message-State: AOAM532l55aWzobusIK+tfL8qh1mcmLOSr4tvN15otTNii0VSaPxWseh
 lH3DsBqlTKG+syU9sKTbcO79k/MuQSQCcqJJV28=
X-Google-Smtp-Source: ABdhPJz8CHoTy/4ozaB74PFoPx5NTfNI2VB50LmNes0q+PYB7j3+VKj02l78mhwpgGCX8YDM4zdCyUcnGaOW4uPk4E4=
X-Received: by 2002:a4a:b443:: with SMTP id h3mr1810033ooo.45.1599636573457;
 Wed, 09 Sep 2020 00:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200828172036.8056-1-atish.patra@wdc.com>
 <mhng-755265fc-a7d4-442d-a49c-698914350116@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-755265fc-a7d4-442d-a49c-698914350116@palmerdabbelt-glaptop1>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 9 Sep 2020 10:29:22 +0300
X-Gmail-Original-Message-ID: <CAMj1kXHp6JFRL7tgy5yMt2=_9OMbKHy16rzunpqhJ8t_sUnwzQ@mail.gmail.com>
Message-ID: <CAMj1kXHp6JFRL7tgy5yMt2=_9OMbKHy16rzunpqhJ8t_sUnwzQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] Add UEFI support for RISC-V
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_032936_476051_85ED0A29 
X-CRM114-Status: GOOD (  31.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi <linux-efi@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 9 Sep 2020 at 04:16, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 28 Aug 2020 10:20:27 PDT (-0700), Atish Patra wrote:
> > This series adds UEFI support for RISC-V.
> >
> > Linux kernel: v5.9-rc2
> > U-Boot: v2020.07
> > OpenSBI: master
> >
> > Patch 1-3 are generic riscv feature addition required for UEFI support.
> > Patch 4-7 adds the efi stub support for RISC-V which was reviewed few months back.
> > https://www.spinics.net/lists/linux-efi/msg19144.html
> > Patch 8 just renames arm-init code so that it can be used across different
> > architectures.
> > Patch 9 adds the runtime services for RISC-V.
> >
> > The working set of patches can also be found in following git repo.
> > https://github.com/atishp04/linux/tree/uefi_riscv_5.10_v7
> >
> > The patches have been verified on following platforms:
> > 1. Qemu (both RV32 & RV64) for the following bootflow
> >    OpenSBI->U-Boot->Linux
> >    EDK2->Linux
> > 2. HiFive unleashed using (RV64) for the following bootflow
> >    OpenSBI->U-Boot->Linux
> >    EDK2->Linux
> >
> > Thanks Abner & Daniel for all work done for EDK2.
> > The EDK2 instructions are available here.
> > https://github.com/JohnAZoidberg/riscv-edk2-docker/
> >
> > Note:
> > 1. Currently, EDK2 RISC-V port doesn't support OVMF package. That's why
> > EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER should be enabled to load initrd via
> > commandline until OVMF patches are available.
> >
> > 2. For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
> > beyond 1G of physical memory for RV32.
> >
> > 3. Runtime services have been verified with fwts on EDK2.
> >
> > ***********************************************************************
> > [root@fedora-riscv ~]# fwts uefirtvariable
> > Running 1 tests, results appended to results.log
> > Test: UEFI Runtime service variable interface tests.
> >   Test UEFI RT service get variable interface.            1 passed
> >   Test UEFI RT service get next variable name interface.  4 passed
> >   Test UEFI RT service set variable interface.            7 passed, 1 warning
> >   Test UEFI RT service query variable info interface.     1 passed
> >   Test UEFI RT service variable interface stress test.    2 passed
> >   Test UEFI RT service set variable interface stress t..  4 passed
> >   Test UEFI RT service query variable info interface s..  1 passed
> >   Test UEFI RT service get variable interface, invalid..  5 passed
> >   Test UEFI RT variable services supported status.        1 skipped
> >
> > Test           |Pass |Fail |Abort|Warn |Skip |Info |
> > uefirtvariable |   25|     |     |    1|    1|     |
> > Total:         |   25|    0|    0|    1|    1|    0|
> >
> > ***********************************************************************
> >
> > Changes from v6->v7:
> > 1. Fixed build error reported on linux-next for patch2.
> >
> > Changes from v5->v6:
> > 1. Fixed the static declaration for pt_ops.
> > 2. Added Reviewed/Acked-by.
> >
> > Changes from v4->v5:
> > 1. Late mappings allocations are now done through function pointers.
> > 2. EFI run time services are verified using full linux boot and fwts using EDK2.
> >
> > Changes from v3->v4:
> > 1. Used pgd mapping to avoid copying DT to bss.
> >
> > Changes from v2->v3:
> > 1. Fixed few bugs in run time services page table mapping.
> > 2. Dropped patch 1 as it is already taken into efi-tree.
> > 3. Sent few generic mmu fixes as a separate series to ease the merge conflicts.
> >
> > Changes from v1->v2:
> > 1. Removed patch 1 as it is already taken into efi-tree.
> > 2. Fixed compilation issues with patch 9.
> > 3. Moved few function prototype declaration to header file to keep kbuild happy.
> >
> > Changes from previous version:
> > 1. Added full ioremap support.
> > 2. Added efi runtime services support.
> > 3. Fixes mm issues
> >
> > Anup Patel (1):
> > RISC-V: Move DT mapping outof fixmap
> >
> > Atish Patra (8):
> > RISC-V: Add early ioremap support
> > RISC-V: Implement late mapping page table allocation functions
> > include: pe.h: Add RISC-V related PE definition
> > RISC-V: Add PE/COFF header for EFI stub
> > RISC-V: Add EFI stub support.
> > efi: Rename arm-init to efi-init common for all arch
> > RISC-V: Add EFI runtime services
> > RISC-V: Add page table dump support for uefi
> >
> > arch/riscv/Kconfig                            |  25 +++
> > arch/riscv/Makefile                           |   1 +
> > arch/riscv/configs/defconfig                  |   1 +
> > arch/riscv/include/asm/Kbuild                 |   1 +
> > arch/riscv/include/asm/efi.h                  |  56 +++++
> > arch/riscv/include/asm/fixmap.h               |  16 +-
> > arch/riscv/include/asm/io.h                   |   1 +
> > arch/riscv/include/asm/mmu.h                  |   2 +
> > arch/riscv/include/asm/pgtable.h              |   5 +
> > arch/riscv/include/asm/sections.h             |  13 ++
> > arch/riscv/kernel/Makefile                    |   5 +
> > arch/riscv/kernel/efi-header.S                | 104 ++++++++++
> > arch/riscv/kernel/efi.c                       | 105 ++++++++++
> > arch/riscv/kernel/head.S                      |  17 +-
> > arch/riscv/kernel/head.h                      |   2 -
> > arch/riscv/kernel/image-vars.h                |  51 +++++
> > arch/riscv/kernel/setup.c                     |  18 +-
> > arch/riscv/kernel/vmlinux.lds.S               |  22 +-
> > arch/riscv/mm/init.c                          | 191 +++++++++++++-----
> > arch/riscv/mm/ptdump.c                        |  48 ++++-
> > drivers/firmware/efi/Kconfig                  |   3 +-
> > drivers/firmware/efi/Makefile                 |   4 +-
> > .../firmware/efi/{arm-init.c => efi-init.c}   |   0
> > drivers/firmware/efi/libstub/Makefile         |  10 +
> > drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
> > drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++
> > drivers/firmware/efi/riscv-runtime.c          | 143 +++++++++++++
> > include/linux/pe.h                            |   3 +
> > 28 files changed, 901 insertions(+), 67 deletions(-)
> > create mode 100644 arch/riscv/include/asm/efi.h
> > create mode 100644 arch/riscv/include/asm/sections.h
> > create mode 100644 arch/riscv/kernel/efi-header.S
> > create mode 100644 arch/riscv/kernel/efi.c
> > create mode 100644 arch/riscv/kernel/image-vars.h
> > rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
> > create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
> > create mode 100644 drivers/firmware/efi/riscv-runtime.c
>
> Thanks.  I've also got the tag "riscv-for-efi-5.10", which consists of
>
>     6bf710098245 ("efi: Rename arm-init to efi-init common for all arch")
>     f7305a30f0ec ("include: pe.h: Add RISC-V related PE definition")
>     d012a7190fc1 ("Linux 5.9-rc2")
>
> and is the base of my for-next.  The rest of the patches are also on for-next,
> but quite a bit later.
>
> Ard: IIUC that's what you were looking for?  Those two as-is definately aren't
> going to break bisecting, so I think we should be good to start both of our
> for-next branches there.  LMK if you were looking for something else.

Yeah that looks fine.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
