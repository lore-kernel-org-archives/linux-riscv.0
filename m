Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F29CC433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:04:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28821206EB
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aZnJuH2f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="NvfXG/mE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28821206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4dxLL9pCFb4o9F0W+KhR3vMd1gXsGJGgEzGkL5qcv4Y=; b=aZnJuH2folASUIuMJVrVkTJAB
	Kjy8bhMOVj7ksgeoo0dXsZdp6vPGansiu4rgAf9GSfFxMRpCkyUShIk1v9BRJpbl1tUvR9LjZfewO
	4elhnKcr1vT1ugQKZL5Zh3RXSDzjmirWUbv1xiXy4pIWCo8lJ2UBwPaoWhVQdGJEdd9JfmjIouTAw
	34oS+kKqDnzEF2oEi2F7pn40HCsgxFQU1sYvT4x3wwAs+KuT0Y4apqhVLtMPm76gPNjRTwrZeHRfy
	/RdQeTjC4qXQEv0PT7ZZbU1kmlJ82iMEBc2sSC6E8tzvA732d0g0Wbn/ZpJZrI/OB2H1wUaiYan9Y
	TLTE95kUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdJ1-0005LO-Ng; Tue, 25 Aug 2020 18:04:23 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdIz-0005Jc-I0
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:04:22 +0000
Received: by mail-pj1-x1044.google.com with SMTP id q1so1636062pjd.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=unJx/AzD7rdTCw/jD4G4JEZLozi40v1kfEHzI+xQZEg=;
 b=NvfXG/mEdni4nkYkIhfffa1lsMJLqSdW07IpnZmqGfLDCd0K5cMCn5kOhboiO4hKBk
 PEe2qg8FVvV7SjqDgOqIELM7Pg2wrvJ2WVl/s6Hf2wmWtn02x5l/frR6aPBlnDzz7mqi
 QizUBC6ckKkcAnvQXPer0YJjbdtMh+0x1BRLReW/Aq3U1HNvZgxHgj+GHxeAbZ/6spaC
 /sNBL6DX2QjlCq/LdbyY1+seWlw6EkBQXWiy6q7kY/2VGWG+8muM1WLmIJUAa5G1EnsT
 ykH6wnUz5BYWHRw/9bHI/4hMM0zoNc9s96S708px5GORojfamPixyK5PI+6QYQdmR8Ih
 HRHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=unJx/AzD7rdTCw/jD4G4JEZLozi40v1kfEHzI+xQZEg=;
 b=DuzP9kfhezJW9L/C7B5/AO0bg6jOL338UreGBTAP+cwvR1BzkN4sGyHVIJ95LFh4ZZ
 oIkhwNhSeSZrLWcXB+aCx/bRB7uggeLLDW47GXsVWwEHRztDNA5byx8QmIS/BZ9M2SWR
 RFcskzDU2zluMcgQ7J3BxbBn4AdVHbQmA/+zOIzDxV63I9qOEVmiAbMT1f9KWouLFE4e
 z23Z/M9iRne/vw27h2JLji7neyHWpFjZ+DwryBqLNmtpE05qjTbgkG1o5Ic0dUx+ULkH
 PZB7OvgR6HWoNNN4lIMgPzvS9FSAt5XyqLOSAj71yFJE2lt13O/wU+mlOhVrTjW1d6A9
 devw==
X-Gm-Message-State: AOAM532oDkN5Hcq68ex2pWWoBqz7pFwfpSuxyeHZ/7Rt1x1DfH7BxxY5
 FgxcFhS7h49UZnqRxhDHjpFmUA==
X-Google-Smtp-Source: ABdhPJwqiY4f9Fxs6D0+egbR/M14e8zFnbrj4erR2Olz2SXJCdOGEZJNlPwi7iT/VQzoT4qwuMeRsw==
X-Received: by 2002:a17:90a:bf86:: with SMTP id
 d6mr2526677pjs.83.1598378656888; 
 Tue, 25 Aug 2020 11:04:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 78sm7785298pfv.200.2020.08.25.11.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:04:16 -0700 (PDT)
Date: Tue, 25 Aug 2020 11:04:16 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Aug 2020 11:04:12 PDT (-0700)
Subject: Re: [PATCH v6 0/9] Add UEFI support for RISC-V
In-Reply-To: <20200819222425.30721-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-e74548a1-7be6-4cc1-a47b-917e0a02dc68@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_140421_663167_0D1EBC1E 
X-CRM114-Status: GOOD (  26.52  )
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
Cc: linux-efi@vger.kernel.org, ardb@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, nivedita@alum.mit.edu,
 Alistair Francis <Alistair.Francis@wdc.com>, zong.li@sifive.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org, masahiroy@kernel.org,
 michal.simek@xilinx.com, steven.price@arm.com, longman@redhat.com,
 greentime.hu@sifive.com, daniel.schaefer@hpe.com, keescook@chromium.org,
 abner.chang@hpe.com, hca@linux.ibm.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 19 Aug 2020 15:24:16 PDT (-0700), Atish Patra wrote:
> This series adds UEFI support for RISC-V.
>
> Linux kernel: v5.9-rc1
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
> https://github.com/atishp04/linux/tree/uefi_riscv_5.10_v6
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
> arch/riscv/kernel/setup.c                     |  17 +-
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
> 28 files changed, 900 insertions(+), 67 deletions(-)
> create mode 100644 arch/riscv/include/asm/efi.h
> create mode 100644 arch/riscv/include/asm/sections.h
> create mode 100644 arch/riscv/kernel/efi-header.S
> create mode 100644 arch/riscv/kernel/efi.c
> create mode 100644 arch/riscv/kernel/image-vars.h
> rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
> create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
> create mode 100644 drivers/firmware/efi/riscv-runtime.c

I've put these on for-next.  It's still pretty early in the cycle so there's
some time to fix stuff up, but it looks like we've pretty much come to
consensus on this.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
