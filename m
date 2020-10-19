Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F70C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 19:08:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9260C2224F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 19:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="16qnhque";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ECSpZCYe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9260C2224F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCMQFuLxgBVzx1/LYXon3PZSgobYspe6Egz+vU4Sz1E=; b=16qnhqueBUYh5c3l24wmv3msTa
	AgFG7aKKmRu5cs75mZ9Q5HkicoCF9LVf323qJKZPvNvHtrqlusPSD0cmgIyaJoVcqzFl0bGC8sz0G
	reXy6l0iYvEDupTu/jYpzYdAoOGFX00HQscgPXZp7v7TIFRiWKON4ZV3qGnZ/mHh/axaxcdJfS61k
	kYRcgI0wnWwCJ/1So1XCFuwU60M6/yYqOFL6tx25JfvJ269aLhFfCRlyNoG9GU4hffE8frGxVd1EF
	OFKTqOol4mF0SPvMn6j3l5EXPvmKCtrhLOcr9Y54rmw6T/VmK0lbno9QjqeQJaTR7xipEi0gRY1Gf
	ojTYlIzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUaW3-0005SJ-HT; Mon, 19 Oct 2020 19:08:19 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUaW1-0005RV-1Y
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 19:08:18 +0000
Received: by mail-pj1-x1041.google.com with SMTP id gv6so312660pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=8tGLxiz79H94oyuXwt68AJpgGVw0fGCvyBhofOmupQY=;
 b=ECSpZCYeKug6rF3RXrjlnGVA17/KBmL8gWPJxVJ9iHFOAYNw0E/EXoN+K3V9N/gpG9
 XaDvH1UEbOPjzlAxxkgB9VhPHxNv4FLoR0clFwvIZ/zRpYVP6D502RlYbNVgRx5tsFFu
 svyMw7RCaSBDp/lwXB88AC7zfYdOA71a+qlYXtKgwjJJ24WvzDISsA2jm1kTm5Ftz2nG
 uD6S9SUSmQLHLlFpGzFX9ttzf7bnjjhdUnlnE1yqFdo5Hs6gEzoUUmXLv6D4EiC9Xa/q
 Z69yczxxEYWL40lvrC5v6x0YVDO4T01sNf3vrs2fNuCXkDTvPKRFImtghj/soH7eJerU
 IFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=8tGLxiz79H94oyuXwt68AJpgGVw0fGCvyBhofOmupQY=;
 b=KH2e2s8aOeFQzMtt0ROkrwZN47YM3TEPJ0WA/zopCBwh86tWz/JxYspsUtRlOriYi/
 KEPehkdxdrcVBv8Ueq5AZNxqVxT/xCnYteI76j1ZWwevwyTWRAHk7B1CoFA+W/mhRVkv
 um9GwDuBZ6OYvhBjRo5mmiI55Zeucy0XEnpO8e1oLAmiGzxPE1VNm1fZ6Md3gChnGTIw
 bRXWUGobjcP3sztYeblROnjE7fmvrH3KmvVdgXRl2XN+J/dr72zL6NjfRg3SOVOyJCAW
 /FKFwELEcEEDV7iI1Ig8dj4YooHQrsUX43Q/bcqg6c49sPcnEBQk7p4Anac3PH/t5Gm6
 wlIw==
X-Gm-Message-State: AOAM531ohXSPeu5Ya32b52p+iU+fJ1lN1+71gvjI0u9ioZt8L80Dsom3
 mHXKQhHM1w9aglLutTLpIspZrSvMOhfaBw==
X-Google-Smtp-Source: ABdhPJwcw1vhs9ZMVodQtYhPHO2Io1vOOEv/d1ESaDJgS22DeSiudXW//nypi1km8L1k7TFCJa8p+w==
X-Received: by 2002:a17:902:6bc4:b029:d5:ef85:1a63 with SMTP id
 m4-20020a1709026bc4b02900d5ef851a63mr434565plt.73.1603134491603; 
 Mon, 19 Oct 2020 12:08:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p6sm261472pjd.1.2020.10.19.12.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 12:08:11 -0700 (PDT)
Date: Mon, 19 Oct 2020 12:08:11 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 12:08:06 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 1
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_150817_104367_EA638DD8 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw0

for you to fetch changes up to de22d2107ced3cc5355cc9dbbd85e44183546bd5:

  RISC-V: Add page table dump support for uefi (2020-10-02 14:31:33 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.10 Merge Window, Part 1

This contains a handful of cleanups and new features, including:

* A handful of cleanups for our page fault handling.
* Improvements to how we fill out cacheinfo.
* Support for EFI-based systems.

---

This contains a merge from the EFI tree that was necessary as some of the EFI
support landed over there.  It's my first time doing something like this,

I haven't included the set_fs stuff because the base branch it depends on
hasn't been merged yet.  I'll probably have another merge window PR, as
there's more in flight (most notably the fix for new binutils I just sent out),
but I figured there was no reason to delay this any longer.

There is one merge conflict, which is between my fixes and for-next branches:

    diff --cc arch/riscv/kernel/vmlinux.lds.S
    index 67db80e12d1f,9795359cb9da..ffaa3da375c2
    --- a/arch/riscv/kernel/vmlinux.lds.S
    +++ b/arch/riscv/kernel/vmlinux.lds.S
    @@@ -66,8 -71,11 +70,13 @@@ SECTION
                    _etext = .;
            }
      
     +      INIT_DATA_SECTION(16)
     +
    + #ifdef CONFIG_EFI
    +       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
    +       __pecoff_text_end = .;
    + #endif
    + 
            /* Start of data section */
            _sdata = .;
            RO_DATA(SECTION_ALIGN)

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Move DT mapping outof fixmap

Ard Biesheuvel (3):
      efi/libstub: arm32: Base FDT and initrd placement on image address
      efi/libstub: Export efi_low_alloc_above() to other units
      efi/libstub: arm32: Use low allocation for the uncompressed kernel

Atish Patra (8):
      include: pe.h: Add RISC-V related PE definition
      efi: Rename arm-init to efi-init common for all arch
      RISC-V: Add early ioremap support
      RISC-V: Implement late mapping page table allocation functions
      RISC-V: Add PE/COFF header for EFI stub
      RISC-V: Add EFI stub support.
      RISC-V: Add EFI runtime services
      RISC-V: Add page table dump support for uefi

Palmer Dabbelt (1):
      Merge tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/.../efi/efi into for-next

Pekka Enberg (11):
      riscv/mm: Simplify retry logic in do_page_fault()
      riscv/mm/fault: Move no context handling to no_context()
      riscv/mm/fault: Move bad area handling to bad_area()
      riscv/mm/fault: Move vmalloc fault handling to vmalloc_fault()
      riscv/mm/fault: Simplify fault error handling
      riscv/mm/fault: Move fault error handling to mm_fault_error()
      riscv/mm/fault: Simplify mm_fault_error()
      riscv/mm/fault: Move FAULT_FLAG_WRITE handling in do_page_fault()
      riscv/mm/fault: Move access error check to function
      riscv/mm/fault: Fix inline placement in vmalloc_fault() declaration
      riscv/mm/fault: Set FAULT_FLAG_INSTRUCTION flag in do_page_fault()

Tian Tao (1):
      RISC-V: Fix duplicate included thread_info.h

Zong Li (3):
      riscv: Set more data to cacheinfo
      riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
      riscv: Add cache information in AUX vector

 arch/arm/include/asm/efi.h                      |  23 +-
 arch/arm64/include/asm/efi.h                    |   5 +-
 arch/riscv/Kconfig                              |  25 ++
 arch/riscv/Makefile                             |   1 +
 arch/riscv/configs/defconfig                    |   1 +
 arch/riscv/include/asm/Kbuild                   |   1 +
 arch/riscv/include/asm/cacheinfo.h              |   5 +
 arch/riscv/include/asm/efi.h                    |  55 ++++
 arch/riscv/include/asm/elf.h                    |  13 +
 arch/riscv/include/asm/fixmap.h                 |  16 +-
 arch/riscv/include/asm/io.h                     |   1 +
 arch/riscv/include/asm/mmu.h                    |   2 +
 arch/riscv/include/asm/pgtable.h                |   5 +
 arch/riscv/include/asm/sections.h               |  13 +
 arch/riscv/include/uapi/asm/auxvec.h            |  24 ++
 arch/riscv/kernel/Makefile                      |   2 +
 arch/riscv/kernel/cacheinfo.c                   |  98 +++++--
 arch/riscv/kernel/efi-header.S                  | 111 ++++++++
 arch/riscv/kernel/efi.c                         |  96 +++++++
 arch/riscv/kernel/head.S                        |  18 +-
 arch/riscv/kernel/head.h                        |   2 -
 arch/riscv/kernel/image-vars.h                  |  51 ++++
 arch/riscv/kernel/setup.c                       |  18 +-
 arch/riscv/kernel/vmlinux.lds.S                 |  23 +-
 arch/riscv/mm/fault.c                           | 356 +++++++++++++-----------
 arch/riscv/mm/init.c                            | 191 ++++++++++---
 arch/riscv/mm/ptdump.c                          |  48 +++-
 drivers/firmware/efi/Kconfig                    |   3 +-
 drivers/firmware/efi/Makefile                   |   4 +-
 drivers/firmware/efi/{arm-init.c => efi-init.c} |   0
 drivers/firmware/efi/libstub/Makefile           |  10 +
 drivers/firmware/efi/libstub/arm32-stub.c       | 178 +++---------
 drivers/firmware/efi/libstub/arm64-stub.c       |   1 -
 drivers/firmware/efi/libstub/efi-stub.c         |  59 +---
 drivers/firmware/efi/libstub/efistub.h          |   7 +-
 drivers/firmware/efi/libstub/relocate.c         |   4 +-
 drivers/firmware/efi/libstub/riscv-stub.c       | 109 ++++++++
 drivers/firmware/efi/riscv-runtime.c            | 143 ++++++++++
 include/linux/pe.h                              |   3 +
 39 files changed, 1275 insertions(+), 450 deletions(-)
 create mode 100644 arch/riscv/include/asm/efi.h
 create mode 100644 arch/riscv/include/asm/sections.h
 create mode 100644 arch/riscv/kernel/efi-header.S
 create mode 100644 arch/riscv/kernel/efi.c
 create mode 100644 arch/riscv/kernel/image-vars.h
 rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
 create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
 create mode 100644 drivers/firmware/efi/riscv-runtime.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
