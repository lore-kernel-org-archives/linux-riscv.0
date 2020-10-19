Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DBEC433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 20:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE1B2223EA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 20:43:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWkNkSpM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="QuEx1G6n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE1B2223EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3YIfpXzVhpW0fIE/O/efucYjiuuyjkleCco62ywG8k0=; b=dWkNkSpMLH6QVm5ZoPXiknJas
	hGRQgsmLSbSScwwXBKPY/fK1Wd55bnlpKVkc7X+p4tDiYiiOc6utunAJTjzWvQAFTwcuacIIYp026
	Xr7iJ/fkF3SXgK5WJKgOIf3l2hm4ciBs3GQR4Fw/LqWXL8jCQjSqgnnx7uN82a4rsBJsZPw+EdnRz
	SxwtlCkwTSoSnGD9r28QKbYG6lD1plf91VT5vs4TBcmwyJV3vE0I+qSW8v1N117IcYpbHoGmpM1sQ
	KrzhaRLSxsAPMEtbmDPMRN4j7aRNZev9HfD/4H+5tWOo1eMWG1w5ixVgxeeWOfeL2xnqIu7qhx8wb
	AVVQP0T/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUc0N-0005hX-Fi; Mon, 19 Oct 2020 20:43:43 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUc0K-0005hC-Tw
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 20:43:42 +0000
Received: by mail-io1-xd41.google.com with SMTP id q25so1473041ioh.4
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MxXdQXPWOcsFCnbTGx9EElxEZnBvrgFn7oXweVU7M5o=;
 b=QuEx1G6nKfqlkG0PV9dk+cAaJ5tUlv8Tm1ya9kbeOzgpPQKCe+cXi9PQPhdl4wgE17
 1UMXeEh790Bh1spFZNLlfgI/FXqsccxQIB+RbH/GxrOygQ0VfRSz+10w9oFcY7RZSMic
 MGmALs4Yw3cHTeg0EJ5xdRSXs3tOJJQl3tvhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MxXdQXPWOcsFCnbTGx9EElxEZnBvrgFn7oXweVU7M5o=;
 b=lBfM8qKCLMMfAYr+vXOTWVNS/KoKkkhP3LQMcwAJRlIhVFTZYMJEvbPFUKVG/nKchC
 3lf5rLIg1p8h0Wrc6LnYaKhce74z1yS6eEuQ/tn++Veq9GoW4farOVBJ6tmmRqAlzm7S
 IoBP92nSR2s5ewzJLQX7emZ+SpdlUEPB8Ujt+ff2EzNHYwTfSVDLUAEAwRkE1zE+V9hg
 hl+hNLuG0x6Mmy9v3ijMxcezK3VAaeDiJv4GZyqZWYymv39ksYGTVoGkfnnkj4GheuM0
 4zB4OtEiABygQWLTAT8OgtEXOh/Kqkftlv2Mu5ysvFGgJT0C0lwHSDE1cRjHru1gzq3O
 9Ncg==
X-Gm-Message-State: AOAM531hZs+vP/dlJ19i8gxzpPJAcUTabfF/1TDtWIm/5ZR2MVl0ZZ0C
 CcX60YJ/LFG6ekK7xq5n37zxrDWpeVbf9F1L2BLt
X-Google-Smtp-Source: ABdhPJzpGpxdbSGAaNsD4zYRzRS8JDhm1+aQU4p2IlCmHvTGvkvCSSG9PRFGHQvUWeauCPnyiGJoYykoZZgtfrPGcak=
X-Received: by 2002:a5d:9842:: with SMTP id p2mr1068682ios.113.1603140219104; 
 Mon, 19 Oct 2020 13:43:39 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-a46615be-f4b5-4861-81b2-f370964a9583@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Oct 2020 13:43:27 -0700
Message-ID: <CAOnJCUJBCLdFRNPNi1z+F5-cfbu8sPOrvG8LVn5GQRepxHrBDA@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 1
To: Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_164341_110767_5F5EFBDF 
X-CRM114-Status: GOOD (  27.81  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 19, 2020 at 12:08 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:
>
>   Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw0
>
> for you to fetch changes up to de22d2107ced3cc5355cc9dbbd85e44183546bd5:
>
>   RISC-V: Add page table dump support for uefi (2020-10-02 14:31:33 -0700)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.10 Merge Window, Part 1
>
> This contains a handful of cleanups and new features, including:
>
> * A handful of cleanups for our page fault handling.
> * Improvements to how we fill out cacheinfo.
> * Support for EFI-based systems.
>
> ---
>
> This contains a merge from the EFI tree that was necessary as some of the EFI
> support landed over there.  It's my first time doing something like this,
>
> I haven't included the set_fs stuff because the base branch it depends on
> hasn't been merged yet.  I'll probably have another merge window PR, as
> there's more in flight (most notably the fix for new binutils I just sent out),
> but I figured there was no reason to delay this any longer.
>
> There is one merge conflict, which is between my fixes and for-next branches:
>
>     diff --cc arch/riscv/kernel/vmlinux.lds.S
>     index 67db80e12d1f,9795359cb9da..ffaa3da375c2
>     --- a/arch/riscv/kernel/vmlinux.lds.S
>     +++ b/arch/riscv/kernel/vmlinux.lds.S
>     @@@ -66,8 -71,11 +70,13 @@@ SECTION
>                     _etext = .;
>             }
>
>      +      INIT_DATA_SECTION(16)
>      +
>     + #ifdef CONFIG_EFI
>     +       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
>     +       __pecoff_text_end = .;
>     + #endif
>     +
>             /* Start of data section */
>             _sdata = .;
>             RO_DATA(SECTION_ALIGN)
>
> ----------------------------------------------------------------
> Anup Patel (1):
>       RISC-V: Move DT mapping outof fixmap
>
> Ard Biesheuvel (3):
>       efi/libstub: arm32: Base FDT and initrd placement on image address
>       efi/libstub: Export efi_low_alloc_above() to other units
>       efi/libstub: arm32: Use low allocation for the uncompressed kernel
>

I thought these 3 were being taken through the EFI tree. I already see
them in the master branch.

762cd288fc4a efi/libstub: arm32: Use low allocation for the uncompressed kernel
1a895dbf4b66 efi/libstub: Export efi_low_alloc_above() to other units
6208857b8f7e efi/libstub: arm32: Base FDT and initrd placement on image address

> Atish Patra (8):
>       include: pe.h: Add RISC-V related PE definition
>       efi: Rename arm-init to efi-init common for all arch
>       RISC-V: Add early ioremap support
>       RISC-V: Implement late mapping page table allocation functions
>       RISC-V: Add PE/COFF header for EFI stub
>       RISC-V: Add EFI stub support.
>       RISC-V: Add EFI runtime services
>       RISC-V: Add page table dump support for uefi
>
> Palmer Dabbelt (1):
>       Merge tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/.../efi/efi into for-next
>
> Pekka Enberg (11):
>       riscv/mm: Simplify retry logic in do_page_fault()
>       riscv/mm/fault: Move no context handling to no_context()
>       riscv/mm/fault: Move bad area handling to bad_area()
>       riscv/mm/fault: Move vmalloc fault handling to vmalloc_fault()
>       riscv/mm/fault: Simplify fault error handling
>       riscv/mm/fault: Move fault error handling to mm_fault_error()
>       riscv/mm/fault: Simplify mm_fault_error()
>       riscv/mm/fault: Move FAULT_FLAG_WRITE handling in do_page_fault()
>       riscv/mm/fault: Move access error check to function
>       riscv/mm/fault: Fix inline placement in vmalloc_fault() declaration
>       riscv/mm/fault: Set FAULT_FLAG_INSTRUCTION flag in do_page_fault()
>
> Tian Tao (1):
>       RISC-V: Fix duplicate included thread_info.h
>
> Zong Li (3):
>       riscv: Set more data to cacheinfo
>       riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
>       riscv: Add cache information in AUX vector
>
>  arch/arm/include/asm/efi.h                      |  23 +-
>  arch/arm64/include/asm/efi.h                    |   5 +-
>  arch/riscv/Kconfig                              |  25 ++
>  arch/riscv/Makefile                             |   1 +
>  arch/riscv/configs/defconfig                    |   1 +
>  arch/riscv/include/asm/Kbuild                   |   1 +
>  arch/riscv/include/asm/cacheinfo.h              |   5 +
>  arch/riscv/include/asm/efi.h                    |  55 ++++
>  arch/riscv/include/asm/elf.h                    |  13 +
>  arch/riscv/include/asm/fixmap.h                 |  16 +-
>  arch/riscv/include/asm/io.h                     |   1 +
>  arch/riscv/include/asm/mmu.h                    |   2 +
>  arch/riscv/include/asm/pgtable.h                |   5 +
>  arch/riscv/include/asm/sections.h               |  13 +
>  arch/riscv/include/uapi/asm/auxvec.h            |  24 ++
>  arch/riscv/kernel/Makefile                      |   2 +
>  arch/riscv/kernel/cacheinfo.c                   |  98 +++++--
>  arch/riscv/kernel/efi-header.S                  | 111 ++++++++
>  arch/riscv/kernel/efi.c                         |  96 +++++++
>  arch/riscv/kernel/head.S                        |  18 +-
>  arch/riscv/kernel/head.h                        |   2 -
>  arch/riscv/kernel/image-vars.h                  |  51 ++++
>  arch/riscv/kernel/setup.c                       |  18 +-
>  arch/riscv/kernel/vmlinux.lds.S                 |  23 +-
>  arch/riscv/mm/fault.c                           | 356 +++++++++++++-----------
>  arch/riscv/mm/init.c                            | 191 ++++++++++---
>  arch/riscv/mm/ptdump.c                          |  48 +++-
>  drivers/firmware/efi/Kconfig                    |   3 +-
>  drivers/firmware/efi/Makefile                   |   4 +-
>  drivers/firmware/efi/{arm-init.c => efi-init.c} |   0
>  drivers/firmware/efi/libstub/Makefile           |  10 +
>  drivers/firmware/efi/libstub/arm32-stub.c       | 178 +++---------
>  drivers/firmware/efi/libstub/arm64-stub.c       |   1 -
>  drivers/firmware/efi/libstub/efi-stub.c         |  59 +---
>  drivers/firmware/efi/libstub/efistub.h          |   7 +-
>  drivers/firmware/efi/libstub/relocate.c         |   4 +-
>  drivers/firmware/efi/libstub/riscv-stub.c       | 109 ++++++++
>  drivers/firmware/efi/riscv-runtime.c            | 143 ++++++++++
>  include/linux/pe.h                              |   3 +
>  39 files changed, 1275 insertions(+), 450 deletions(-)
>  create mode 100644 arch/riscv/include/asm/efi.h
>  create mode 100644 arch/riscv/include/asm/sections.h
>  create mode 100644 arch/riscv/kernel/efi-header.S
>  create mode 100644 arch/riscv/kernel/efi.c
>  create mode 100644 arch/riscv/kernel/image-vars.h
>  rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
>  create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
>  create mode 100644 drivers/firmware/efi/riscv-runtime.c
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
