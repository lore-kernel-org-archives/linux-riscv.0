Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77421C43461
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 01:16:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C71216C4
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 01:16:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iUn3wR7x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="N+faQGtb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6C71216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8q6QXOhf7VhfVIs1CkXbuxxoUd4dXyo2iBr0wNNN9LI=; b=iUn3wR7xJ2ZDCxUvCduULX73j
	WMtJwq99f0Q/fZ0uwp5iotYXuhOWfN7VhJiyCq7aZJhKznoyw1K+btv1zdwJCKc+u596wO1k+PaBV
	HkhIP8z7M95VjUOsGQYB1nxbimcF1ObkVvk6SYnQ1IcLxnVV7zh0qK2QIb6Z/5NYIpfelXK3MNfYF
	cLQ7skvg9Hv2GZWnR4jhvO5PRfuSFEpGk6b0QY+Wi9j0QP7HB0iLSp9lexNuP6IcKhFPs68P40OVI
	J+yD8af0fHWJk6AqScqlQl5+5BsgHHQ6KjZN92vvsqxSU0gwNw2arWbH7BuOFbJniVBBUY+ncLPjs
	JMA/L4eLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFoit-0004Mv-FW; Wed, 09 Sep 2020 01:16:31 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFoiq-0004MY-In
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 01:16:29 +0000
Received: by mail-pj1-x1043.google.com with SMTP id o16so491989pjr.2
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 18:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=WKRHwoOXDB0eVxHsEx1hEwul9R96gJI8i23WjxeBUv4=;
 b=N+faQGtb5z/kpBr6cK9HpGcuHd/PRIAcnn0uA4S696hx/DS3h8Z7bnS7D4HkAZQM94
 PsD973LgzmyAHTE96aXTyEpgHnABhDLQqeYJ8ff/6GbOQyHHaU1cfFS7/grlehP35Nkw
 x+1glZpTufy+LancD47T2XLiGKIlIJGyAPNlocg4A1pBy55iwQxTBWAGFz89yZU83rVO
 BCSxC7XayDD6jxSVhoiI0m15SXT/JashZTDbvk7H//oYrR0n6K1//rs+TSQ0XMGzVo6i
 9oCMELHf/cgSwqDoNmcMUL1Um05qn1EBRfDdXyXeQAUjRUVkGqcamieo1jPVtDzQeJPw
 5ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=WKRHwoOXDB0eVxHsEx1hEwul9R96gJI8i23WjxeBUv4=;
 b=b5UwM0m6BAKwZMocZF5maave7KQqRUP5k3Uro4MZMtgLdDxARaKWQ+ez10n2OJlxfv
 qCzmTBMFpKvSum5HmUdtBsgfr2xRgv43Cscmhxb9WSkHvyuEO2QY0epr9rf7lOVTeAq4
 9EQFZr9x57VBnx08rud+dwo1nlEWuXoTGPFXlhEM2s5E4gUbNnIfP+IBbmnfdeyt5D0s
 SnqKbNnCBLlo1loiZ3/c5KVmF1DKQMa6mgmabERMCCCUSz+w5bQmXc9fZXdh5mV3rJ6c
 GPoBGOcpHFe6d21Alnm9/iEIMQBNSR4YVgUxQ0KpGj2l3K8sFD1n/RVJstC8HE2aPiMT
 umRQ==
X-Gm-Message-State: AOAM533NQjQb3X5Un33AoHAOqSYO1MzOzXe/t/eDlb8JNWhiIB5Q6W8P
 BpaaPrrPUDoLviiOtu5JkbmupQ==
X-Google-Smtp-Source: ABdhPJy/9leJGa7TnkJIpm8WIUaUh9K2uzM/7yfpXsWuGYRpDPK1wPDcY30nnNawzoMMMgoyVcTiQw==
X-Received: by 2002:a17:90b:4acf:: with SMTP id
 mh15mr1330512pjb.204.1599614184277; 
 Tue, 08 Sep 2020 18:16:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z9sm595153pfk.118.2020.09.08.18.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 18:16:23 -0700 (PDT)
Date: Tue, 08 Sep 2020 18:16:23 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 18:16:21 PDT (-0700)
Subject: Re: [PATCH v7 0/9] Add UEFI support for RISC-V
In-Reply-To: <20200828172036.8056-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>, ardb@kernel.org
Message-ID: <mhng-755265fc-a7d4-442d-a49c-698914350116@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_211628_628981_919EB8B5 
X-CRM114-Status: GOOD (  27.10  )
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
Cc: linux-efi@vger.kernel.org, masahiroy@kernel.org,
 Anup Patel <Anup.Patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 nivedita@alum.mit.edu, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 28 Aug 2020 10:20:27 PDT (-0700), Atish Patra wrote:
> This series adds UEFI support for RISC-V.
>
> Linux kernel: v5.9-rc2
> U-Boot: v2020.07
> OpenSBI: master
>
> Patch 1-3 are generic riscv feature addition required for UEFI support.
> Patch 4-7 adds the efi stub support for RISC-V which was reviewed few months back.
> https://www.spinics.net/lists/linux-efi/msg19144.html
> Patch 8 just renames arm-init code so that it can be used across different
> architectures.
> Patch 9 adds the runtime services for RISC-V.
>
> The working set of patches can also be found in following git repo.
> https://github.com/atishp04/linux/tree/uefi_riscv_5.10_v7
>
> The patches have been verified on following platforms:
> 1. Qemu (both RV32 & RV64) for the following bootflow
>    OpenSBI->U-Boot->Linux
>    EDK2->Linux
> 2. HiFive unleashed using (RV64) for the following bootflow
>    OpenSBI->U-Boot->Linux
>    EDK2->Linux
>
> Thanks Abner & Daniel for all work done for EDK2.
> The EDK2 instructions are available here.
> https://github.com/JohnAZoidberg/riscv-edk2-docker/
>
> Note:
> 1. Currently, EDK2 RISC-V port doesn't support OVMF package. That's why
> EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER should be enabled to load initrd via
> commandline until OVMF patches are available.
>
> 2. For RV32, maximum allocated memory should be 1G as RISC-V kernel can not map
> beyond 1G of physical memory for RV32.
>
> 3. Runtime services have been verified with fwts on EDK2.
>
> ***********************************************************************
> [root@fedora-riscv ~]# fwts uefirtvariable
> Running 1 tests, results appended to results.log
> Test: UEFI Runtime service variable interface tests.
>   Test UEFI RT service get variable interface.            1 passed
>   Test UEFI RT service get next variable name interface.  4 passed
>   Test UEFI RT service set variable interface.            7 passed, 1 warning
>   Test UEFI RT service query variable info interface.     1 passed
>   Test UEFI RT service variable interface stress test.    2 passed
>   Test UEFI RT service set variable interface stress t..  4 passed
>   Test UEFI RT service query variable info interface s..  1 passed
>   Test UEFI RT service get variable interface, invalid..  5 passed
>   Test UEFI RT variable services supported status.        1 skipped
>
> Test           |Pass |Fail |Abort|Warn |Skip |Info |
> uefirtvariable |   25|     |     |    1|    1|     |
> Total:         |   25|    0|    0|    1|    1|    0|
>
> ***********************************************************************
>
> Changes from v6->v7:
> 1. Fixed build error reported on linux-next for patch2.
>
> Changes from v5->v6:
> 1. Fixed the static declaration for pt_ops.
> 2. Added Reviewed/Acked-by.
>
> Changes from v4->v5:
> 1. Late mappings allocations are now done through function pointers.
> 2. EFI run time services are verified using full linux boot and fwts using EDK2.
>
> Changes from v3->v4:
> 1. Used pgd mapping to avoid copying DT to bss.
>
> Changes from v2->v3:
> 1. Fixed few bugs in run time services page table mapping.
> 2. Dropped patch 1 as it is already taken into efi-tree.
> 3. Sent few generic mmu fixes as a separate series to ease the merge conflicts.
>
> Changes from v1->v2:
> 1. Removed patch 1 as it is already taken into efi-tree.
> 2. Fixed compilation issues with patch 9.
> 3. Moved few function prototype declaration to header file to keep kbuild happy.
>
> Changes from previous version:
> 1. Added full ioremap support.
> 2. Added efi runtime services support.
> 3. Fixes mm issues
>
> Anup Patel (1):
> RISC-V: Move DT mapping outof fixmap
>
> Atish Patra (8):
> RISC-V: Add early ioremap support
> RISC-V: Implement late mapping page table allocation functions
> include: pe.h: Add RISC-V related PE definition
> RISC-V: Add PE/COFF header for EFI stub
> RISC-V: Add EFI stub support.
> efi: Rename arm-init to efi-init common for all arch
> RISC-V: Add EFI runtime services
> RISC-V: Add page table dump support for uefi
>
> arch/riscv/Kconfig                            |  25 +++
> arch/riscv/Makefile                           |   1 +
> arch/riscv/configs/defconfig                  |   1 +
> arch/riscv/include/asm/Kbuild                 |   1 +
> arch/riscv/include/asm/efi.h                  |  56 +++++
> arch/riscv/include/asm/fixmap.h               |  16 +-
> arch/riscv/include/asm/io.h                   |   1 +
> arch/riscv/include/asm/mmu.h                  |   2 +
> arch/riscv/include/asm/pgtable.h              |   5 +
> arch/riscv/include/asm/sections.h             |  13 ++
> arch/riscv/kernel/Makefile                    |   5 +
> arch/riscv/kernel/efi-header.S                | 104 ++++++++++
> arch/riscv/kernel/efi.c                       | 105 ++++++++++
> arch/riscv/kernel/head.S                      |  17 +-
> arch/riscv/kernel/head.h                      |   2 -
> arch/riscv/kernel/image-vars.h                |  51 +++++
> arch/riscv/kernel/setup.c                     |  18 +-
> arch/riscv/kernel/vmlinux.lds.S               |  22 +-
> arch/riscv/mm/init.c                          | 191 +++++++++++++-----
> arch/riscv/mm/ptdump.c                        |  48 ++++-
> drivers/firmware/efi/Kconfig                  |   3 +-
> drivers/firmware/efi/Makefile                 |   4 +-
> .../firmware/efi/{arm-init.c => efi-init.c}   |   0
> drivers/firmware/efi/libstub/Makefile         |  10 +
> drivers/firmware/efi/libstub/efi-stub.c       |  11 +-
> drivers/firmware/efi/libstub/riscv-stub.c     | 110 ++++++++++
> drivers/firmware/efi/riscv-runtime.c          | 143 +++++++++++++
> include/linux/pe.h                            |   3 +
> 28 files changed, 901 insertions(+), 67 deletions(-)
> create mode 100644 arch/riscv/include/asm/efi.h
> create mode 100644 arch/riscv/include/asm/sections.h
> create mode 100644 arch/riscv/kernel/efi-header.S
> create mode 100644 arch/riscv/kernel/efi.c
> create mode 100644 arch/riscv/kernel/image-vars.h
> rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
> create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
> create mode 100644 drivers/firmware/efi/riscv-runtime.c

Thanks.  I've also got the tag "riscv-for-efi-5.10", which consists of

    6bf710098245 ("efi: Rename arm-init to efi-init common for all arch")
    f7305a30f0ec ("include: pe.h: Add RISC-V related PE definition")
    d012a7190fc1 ("Linux 5.9-rc2")

and is the base of my for-next.  The rest of the patches are also on for-next,
but quite a bit later.

Ard: IIUC that's what you were looking for?  Those two as-is definately aren't
going to break bisecting, so I think we should be good to start both of our
for-next branches there.  LMK if you were looking for something else.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
