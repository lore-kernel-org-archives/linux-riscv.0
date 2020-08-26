Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0066DC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 16:27:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C9C20825
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 16:27:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mXZeNYtI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="l/x8gyc+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C9C20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=DHpGEJSY59DCp2LiHqao9AtTvvMtrAaMIuwAIXlV62I=; b=mXZeNYtIJ3AkIyBdpKjxczIgS
	7hqtOXS1QA2QPqZMuqG4WnihljMMlYFpXu6RtGx0odc4pEFp4couHw3/arqpN+foGNPGJLwO3RZeS
	QAQlevxhxWonc0HIFLlRZhCPqj6NCnDMZPKUJEaij0z7c50XX2rnyyW4XSITY5ZRC8ngsWRwqGqAw
	T6v71sXH1NECTxihKoH0ykWYmf88ccKS9Hgnn+wzXTjLlUJUmMqAxrgasN/+Eu9M5tQin/jFvuYcJ
	JbgmlIYcsdTJCFWQ+T1eNXCZpECXmM3+j+iAZ0yBPLQtbSBR7KmPc1UqlefCYaElsZ/wvGlkKQKM+
	Ors09dPjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAyGo-00062d-6P; Wed, 26 Aug 2020 16:27:30 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAyGl-00061n-PN
 for linux-riscv@lists.infradead.org; Wed, 26 Aug 2020 16:27:28 +0000
Received: by mail-pj1-x1044.google.com with SMTP id g6so1102413pjl.0
 for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2020 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=lJ3G0gTR9+Iw0B9/g5WZ2HvqezgldzfGfwfapbSA23Y=;
 b=l/x8gyc+V7Ew88lbrlQZHFhl/r8ABCsqqNroUrPSvz0jwcRY9jjfgauDPK19wtuAXD
 EILb+Fh9Le9NiEfVwDxkjhtBEgP0KGnz2O/QSUmX9Xt0TPy5ewVPbiYzXEtYSopJnUBK
 NHCNHHhklVNVI2P4Xu2AOuNIUtLDahFHnkS/D1gjbqwDp9+fRNv1aQvKt/1U9jfXgtDI
 idq8bFyRlqs9p7Eleo8upUmSodK8LGZn0+d2GCGaUoLSTtaRxJl+lfQjS0FkzJay2L7s
 2gBxJ5BOmB2ykLvvBeBgswAFjQQ9FJLuLj7GfEiv8IpqEPtcgl2wwOrEvhSAfrQ2GMcl
 t5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=lJ3G0gTR9+Iw0B9/g5WZ2HvqezgldzfGfwfapbSA23Y=;
 b=KPXb9002wIjFNFZCa1nIR30QBdAmF4C09e+J/JTZYYcw/lb/ie+U7Pymcsv8T3nO+u
 WgXO6XOPAmU/HivZB247taI+R3VpLkNRA+M9W77BETBW7SoT80MCL7GI+PX6DTAmcmmq
 EWpehP4AQ5KFXog9A4bbBi0NqrTErby/j5bQ90nMpnyFhrhBX2GmW39Bxw/fs4ptSEBq
 6NqSOKdqHNCp9ZDW1e+wQ/n4b5ZcDy9W6wzvtCP7dI9LVTDMAd0840MZ6OXY6w8PO0zB
 ky8Jj94ZAQ69IF0GonGXDHwm2yKs1MifqYXaoM7DBGwb8B8BwFgXfSXcZWeKkm5zaq1g
 /J8g==
X-Gm-Message-State: AOAM533MiaJDOTUnhdqf2Ga68x9yWST1Hmv8mjKBS2WW0T0BowwdjUjp
 jA58arqX8Ntb5hHoog0iSSddKA==
X-Google-Smtp-Source: ABdhPJxvmex3/pI48JqWEpOtzt6q3XJkInaFmpqLe+d+QpfhKT+ODj79oec2SDDm5C6Kmj5RWprrCQ==
X-Received: by 2002:a17:902:6bc2:: with SMTP id
 m2mr12388170plt.114.1598459244972; 
 Wed, 26 Aug 2020 09:27:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q7sm3498303pfl.156.2020.08.26.09.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 09:27:24 -0700 (PDT)
Date: Wed, 26 Aug 2020 09:27:24 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Aug 2020 09:27:22 PDT (-0700)
Subject: Re: [PATCH v6 0/9] Add UEFI support for RISC-V
In-Reply-To: <CAMj1kXFstJ-hh=+HyNMA_E8eLWZFobrGBcFKFf13OgrHiTce8g@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb@kernel.org
Message-ID: <mhng-aca02cc6-bb2f-404e-bcdf-e6703e9fc938@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_122727_839836_62E700BD 
X-CRM114-Status: GOOD (  42.29  )
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
Cc: linux-efi@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 nivedita@alum.mit.edu, Alistair Francis <Alistair.Francis@wdc.com>,
 zong.li@sifive.com, linux-riscv@lists.infradead.org, mingo@kernel.org,
 masahiroy@kernel.org, michal.simek@xilinx.com, steven.price@arm.com,
 longman@redhat.com, greentime.hu@sifive.com, daniel.schaefer@hpe.com,
 keescook@chromium.org, abner.chang@hpe.com, hca@linux.ibm.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 04:22:07 PDT (-0700), ardb@kernel.org wrote:
> On Tue, 25 Aug 2020 at 20:04, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 19 Aug 2020 15:24:16 PDT (-0700), Atish Patra wrote:
>> > This series adds UEFI support for RISC-V.
>> >
>> > Linux kernel: v5.9-rc1
>> > U-Boot: v2020.07
>> > OpenSBI: master
>> >
>> > Patch 1-3 are generic riscv feature addition required for UEFI support.
>> > Patch 4-7 adds the efi stub support for RISC-V which was reviewed few months back.
>> > https://www.spinics.net/lists/linux-efi/msg19144.html
>> > Patch 8 just renames arm-init code so that it can be used across different
>> > architectures.
>> > Patch 9 adds the runtime services for RISC-V.
>> >
>> > The working set of patches can also be found in following git repo.
>> > https://github.com/atishp04/linux/tree/uefi_riscv_5.10_v6
>> >
>> > The patches have been verified on following platforms:
>> > 1. Qemu (both RV32 & RV64) for the following bootflow
>> >    OpenSBI->U-Boot->Linux
>> >    EDK2->Linux
>> > 2. HiFive unleashed using (RV64) for the following bootflow
>> >    OpenSBI->U-Boot->Linux
>> >    EDK2->Linux
>> >
>> > Thanks Abner & Daniel for all work done for EDK2.
>> > The EDK2 instructions are available here.
>> > https://github.com/JohnAZoidberg/riscv-edk2-docker/
>> >
>> > Note:
>> > 1. Currently, EDK2 RISC-V port doesn't support OVMF package. That's why
>> > EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER should be enabled to load initrd via
>> > commandline until OVMF patches are available.
>> >
>> > 2. For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
>> > beyond 1G of physical memory for RV32.
>> >
>> > 3. Runtime services have been verified with fwts on EDK2.
>> >
>> > ***********************************************************************
>> > [root@fedora-riscv ~]# fwts uefirtvariable
>> > Running 1 tests, results appended to results.log
>> > Test: UEFI Runtime service variable interface tests.
>> >   Test UEFI RT service get variable interface.            1 passed
>> >   Test UEFI RT service get next variable name interface.  4 passed
>> >   Test UEFI RT service set variable interface.            7 passed, 1 warning
>> >   Test UEFI RT service query variable info interface.     1 passed
>> >   Test UEFI RT service variable interface stress test.    2 passed
>> >   Test UEFI RT service set variable interface stress t..  4 passed
>> >   Test UEFI RT service query variable info interface s..  1 passed
>> >   Test UEFI RT service get variable interface, invalid..  5 passed
>> >   Test UEFI RT variable services supported status.        1 skipped
>> >
>> > Test           |Pass |Fail |Abort|Warn |Skip |Info |
>> > uefirtvariable |   25|     |     |    1|    1|     |
>> > Total:         |   25|    0|    0|    1|    1|    0|
>> >
>> > ***********************************************************************
>> >
>> > Changes from v5->v6:
>> > 1. Fixed the static declaration for pt_ops.
>> > 2. Added Reviewed/Acked-by.
>> >
>> > Changes from v4->v5:
>> > 1. Late mappings allocations are now done through function pointers.
>> > 2. EFI run time services are verified using full linux boot and fwts using EDK2.
>> >
>> > Changes from v3->v4:
>> > 1. Used pgd mapping to avoid copying DT to bss.
>> >
>> > Changes from v2->v3:
>> > 1. Fixed few bugs in run time services page table mapping.
>> > 2. Dropped patch 1 as it is already taken into efi-tree.
>> > 3. Sent few generic mmu fixes as a separate series to ease the merge conflicts.
>> >
>> > Changes from v1->v2:
>> > 1. Removed patch 1 as it is already taken into efi-tree.
>> > 2. Fixed compilation issues with patch 9.
>> > 3. Moved few function prototype declaration to header file to keep kbuild happy.
>> >
>> > Changes from previous version:
>> > 1. Added full ioremap support.
>> > 2. Added efi runtime services support.
>> > 3. Fixes mm issues
>> >
>> > Anup Patel (1):
>> > RISC-V: Move DT mapping outof fixmap
>> >
>> > Atish Patra (8):
>> > RISC-V: Add early ioremap support
>> > RISC-V: Implement late mapping page table allocation functions
>> > include: pe.h: Add RISC-V related PE definition
>> > RISC-V: Add PE/COFF header for EFI stub
>> > RISC-V: Add EFI stub support.
>> > efi: Rename arm-init to efi-init common for all arch
>> > RISC-V: Add EFI runtime services
>> > RISC-V: Add page table dump support for uefi
>> >
>> > arch/riscv/Kconfig                            |  25 +++
>> > arch/riscv/Makefile                           |   1 +
>> > arch/riscv/configs/defconfig                  |   1 +
>> > arch/riscv/include/asm/Kbuild                 |   1 +
>> > arch/riscv/include/asm/efi.h                  |  56 +++++
>> > arch/riscv/include/asm/fixmap.h               |  16 +-
>> > arch/riscv/include/asm/io.h                   |   1 +
>> > arch/riscv/include/asm/mmu.h                  |   2 +
>> > arch/riscv/include/asm/pgtable.h              |   5 +
>> > arch/riscv/include/asm/sections.h             |  13 ++
>> > arch/riscv/kernel/Makefile                    |   5 +
>> > arch/riscv/kernel/efi-header.S                | 104 ++++++++++
>> > arch/riscv/kernel/efi.c                       | 105 ++++++++++
>> > arch/riscv/kernel/head.S                      |  17 +-
>> > arch/riscv/kernel/head.h                      |   2 -
>> > arch/riscv/kernel/image-vars.h                |  51 +++++
>> > arch/riscv/kernel/setup.c                     |  17 +-
>> > arch/riscv/kernel/vmlinux.lds.S               |  22 +-
>> > arch/riscv/mm/init.c                          | 191 +++++++++++++-----
>> > arch/riscv/mm/ptdump.c                        |  48 ++++-
>> > drivers/firmware/efi/Kconfig                  |   3 +-
>> > drivers/firmware/efi/Makefile                 |   4 +-
>> > .../firmware/efi/{arm-init.c => efi-init.c}   |   0
>> > drivers/firmware/efi/libstub/Makefile         |  10 +
>> > drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
>> > drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++
>> > drivers/firmware/efi/riscv-runtime.c          | 143 +++++++++++++
>> > include/linux/pe.h                            |   3 +
>> > 28 files changed, 900 insertions(+), 67 deletions(-)
>> > create mode 100644 arch/riscv/include/asm/efi.h
>> > create mode 100644 arch/riscv/include/asm/sections.h
>> > create mode 100644 arch/riscv/kernel/efi-header.S
>> > create mode 100644 arch/riscv/kernel/efi.c
>> > create mode 100644 arch/riscv/kernel/image-vars.h
>> > rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
>> > create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
>> > create mode 100644 drivers/firmware/efi/riscv-runtime.c
>>
>> I've put these on for-next.  It's still pretty early in the cycle so there's
>> some time to fix stuff up, but it looks like we've pretty much come to
>> consensus on this.
>>
>
> I requested the following when acking these changes:
>
> """
> Note to the maintainer: to the extent possible, please put the patches
> in this series that touch drivers/firmware/efi on a separate branch
> based on v5.9-rc1, and merge that into your for-v5.10 branch at the
> appropriate spot. I don't have anything queued in the EFI tree at the
> moment, and so these changes can happily go through the riscv tree, as
> long as I am not forced to merge a bunch of unrelated changes on the
> off chance that something does come up.
> """
>
> Something has come up, and given that the patch
>
> efi: Rename arm-init to efi-init common for all arch
>
> lives on your for-next branch after a bunch of RISCV changes, I cannot
> merge anything for EFI without pulling all of that into the EFI tree
> as well.
>
> Also, it is not clear to me whether the current ordering does not
> break bisect, given that efi-init.o is referenced in patch #8 but is
> not created until patch #9
>
> So could you please do the following:
>
> - drop 'efi: Rename arm-init to efi-init common for all arch' from the
> top of your for-next branch
> - create a separate topic branch that carries the dropped patch
> - recreate the for-next branch so the topic branch is merged into it
> at the right spot (i.e., before patch #8)
>
> That way, I can merge your topic branch into the EFI tree as well, and
> apply the other EFI changes on top of it.

Sorry, I forgot about that.  I'll go deal with this, but probably not today
because of Plumbers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
