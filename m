Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DFCC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 21:01:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B60F721741
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 21:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/biGryZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="hZf7y6KI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B60F721741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8XQbAdJPCHMeMDq6hv7yBjw4plbxo/mdWUuzOG3lcXI=; b=c/biGryZiMVOOqFfLVy1bW5Si
	GTcbi/Zjo3mcGdow3LYZLVD+4Za/hyiGCxGbXkOGvQ2rl+7Kdv0LFhWa9YCyjCBLTanioM9eNdvG6
	LXnY5rGGPSMUrnDV1gsOPvV2US9Zu9/ZEXj5gYE17qdQ7eZ7YzR1nc1WJ/OKm8kAsrexskML1uGSC
	4iklmfML4zPrfb2z+r2HKahzVUBbC6TpGcA+4pAfAL3rsimhkEj9Ck2hxAdM02fibdMlNDX1VLBuQ
	EUIe1A7VEmHc+7heVi4Z1sq7AVtWiSRxqWgW9nuLKTfnMHpJ97wYXYuaB41TJ9R7Pi6NLsm16zyUy
	FPAAO38jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUcGx-0007A6-F3; Mon, 19 Oct 2020 21:00:51 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUcGt-000793-FM
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 21:00:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id b26so713321pff.3
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 14:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=0NTGtDn/33Pw3u4VstNPKOHvXDTy/KGjb/nhjj8rNBE=;
 b=hZf7y6KIDAFSDpejN1MH7zjZf/OBwAdSvdZUWkxxoYD7jDqnnLROn2neG90RO0+4Eb
 Dh3+8DKiJ7JIbcWX30Oj+fU1jN2jFWFUy6I4PBnSMkl1QyeO1UWuZkgGvaBqK/pNPAIU
 mLpQ3emrofGATkW5BQXY/YsRjhyTLiqbmFGZ3WpF1Iiah8cdcSUJva4d2JlbeONnl77Y
 6idBzC7s3mSA+pEuO/tnAA6HIg/4PQ4YiqlWlnH9w7yxjs6PnSoaDDoGDYyeOivTSr+Y
 LPSc+oDz5oCWIg2FEBDldnenR4cpwBm9Cg73EmguzgWQ3wUsu9pxxtNo9+WAZ6z+FeK3
 ESsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=0NTGtDn/33Pw3u4VstNPKOHvXDTy/KGjb/nhjj8rNBE=;
 b=BNEqEqucqTzGe8VnginIDF29Z52Cu8vgQLBG7K8I1DQNEHwAY0B1/BmGi6a12nMuwe
 5RL4p0jOXhobmWC5A0SfG4SJsUlC8dRm0ehTP12JUqEBzAKQyfJ/XlbX7Yfdz+23veNz
 9daR20nHOtIksrIP9K3glwk+1o30mB7p5jQS2Zth2HaVaVUIOOWAYZ9roXZrUvdpqGwR
 iWATITtufERwjNpTPm/lSazMLLNmXI1FLM8/sg+PDRWp/q7QF3SpELjehBkNNefGMKYU
 MOVC6pFLfaEef8HCPQUH6CGMhrPUGAmVD1ke69VHCrV3xDs+CUdfZo6K7ZcgPN9dJqWv
 Cyjw==
X-Gm-Message-State: AOAM530V4R6zy1ClixHWC5M3QossekDQ1vP+4gw4YREEFUBhhCeJlGJa
 2SYAvWBH/AMqHrnkJtqiGxZouA==
X-Google-Smtp-Source: ABdhPJzpGNtm7u/WtOYfzt0O6J4jb66hN7qc6BZRCnuB94Ljoi5p6ZKSdjdKRFVzggkGNyPJI1efVw==
X-Received: by 2002:a63:5c05:: with SMTP id q5mr1381083pgb.352.1603141244766; 
 Mon, 19 Oct 2020 14:00:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 145sm432007pga.46.2020.10.19.14.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:00:44 -0700 (PDT)
Date: Mon, 19 Oct 2020 14:00:44 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 14:00:34 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 1
In-Reply-To: <CAOnJCUJBCLdFRNPNi1z+F5-cfbu8sPOrvG8LVn5GQRepxHrBDA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org, ardb@kernel.org
Message-ID: <mhng-02f9ec68-743e-45d3-96a9-8675c7e1147b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_170047_583310_693B826C 
X-CRM114-Status: GOOD (  31.43  )
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
Cc: linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 13:43:27 PDT (-0700), atishp@atishpatra.org wrote:
> On Mon, Oct 19, 2020 at 12:08 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:
>>
>>   Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw0
>>
>> for you to fetch changes up to de22d2107ced3cc5355cc9dbbd85e44183546bd5:
>>
>>   RISC-V: Add page table dump support for uefi (2020-10-02 14:31:33 -0700)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for the 5.10 Merge Window, Part 1
>>
>> This contains a handful of cleanups and new features, including:
>>
>> * A handful of cleanups for our page fault handling.
>> * Improvements to how we fill out cacheinfo.
>> * Support for EFI-based systems.
>>
>> ---
>>
>> This contains a merge from the EFI tree that was necessary as some of the EFI
>> support landed over there.  It's my first time doing something like this,
>>
>> I haven't included the set_fs stuff because the base branch it depends on
>> hasn't been merged yet.  I'll probably have another merge window PR, as
>> there's more in flight (most notably the fix for new binutils I just sent out),
>> but I figured there was no reason to delay this any longer.
>>
>> There is one merge conflict, which is between my fixes and for-next branches:
>>
>>     diff --cc arch/riscv/kernel/vmlinux.lds.S
>>     index 67db80e12d1f,9795359cb9da..ffaa3da375c2
>>     --- a/arch/riscv/kernel/vmlinux.lds.S
>>     +++ b/arch/riscv/kernel/vmlinux.lds.S
>>     @@@ -66,8 -71,11 +70,13 @@@ SECTION
>>                     _etext = .;
>>             }
>>
>>      +      INIT_DATA_SECTION(16)
>>      +
>>     + #ifdef CONFIG_EFI
>>     +       . = ALIGN(PECOFF_SECTION_ALIGNMENT);
>>     +       __pecoff_text_end = .;
>>     + #endif
>>     +
>>             /* Start of data section */
>>             _sdata = .;
>>             RO_DATA(SECTION_ALIGN)
>>
>> ----------------------------------------------------------------
>> Anup Patel (1):
>>       RISC-V: Move DT mapping outof fixmap
>>
>> Ard Biesheuvel (3):
>>       efi/libstub: arm32: Base FDT and initrd placement on image address
>>       efi/libstub: Export efi_low_alloc_above() to other units
>>       efi/libstub: arm32: Use low allocation for the uncompressed kernel
>>
>
> I thought these 3 were being taken through the EFI tree. I already see
> them in the master branch.
>
> 762cd288fc4a efi/libstub: arm32: Use low allocation for the uncompressed kernel
> 1a895dbf4b66 efi/libstub: Export efi_low_alloc_above() to other units
> 6208857b8f7e efi/libstub: arm32: Base FDT and initrd placement on image address

I see them in Linus' master with those exact hashes, so IIUC this is all OK?  I
guess I just assumed they were supposed to show up in the shortlog, but it's my
first time trying one of these multi-tree merges so maybe I screwed something
up?

I obtained these by merging a tag from the EFI tree (that's already been
merged) into my tree, which looks OK to me:

    commit 8a3f30c4319dc70547f11c18da2e7b5987543aa1
    gpg: Signature made Fri 02 Oct 2020 02:30:05 PM PDT
    gpg:                using RSA key 2B3C3747446843B24A943A7A2E1319F35FBB1889
    gpg:                issuer "palmer@dabbelt.com"
    gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
    gpg:                 aka "Palmer Dabbelt <palmerdabbelt@google.com>" [ultimate]
    merged tag 'efi-riscv-shared-for-v5.10'
    gpg: Signature made Wed 16 Sep 2020 08:57:07 AM PDT
    gpg:                using RSA key 9CD2A0DA6AD8F7330175E2BBC237207E9574FA7D
    gpg: Good signature from "Adriaan (Ard) Biesheuvel <ard.biesheuvel@linaro.org>" [unknown]
    gpg:                 aka "Adriaan (Ard) Biesheuvel <ard.biesheuvel@gmail.com>" [unknown]
    gpg:                 aka "Adriaan (Ard) Biesheuvel <ardb@kernel.org>" [unknown]
    gpg:                 aka "Adriaan (Ard) Biesheuvel <ard.biesheuvel@arm.com>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: F43D 0332 8115 A198 C900  1688 3D20 0E9C A632 9909
         Subkey fingerprint: 9CD2 A0DA 6AD8 F733 0175  E2BB C237 207E 9574 FA7D
    Merge: 54701a0d12e2 762cd288fc4a
    Author: Palmer Dabbelt <palmerdabbelt@google.com>
    Date:   Fri Oct 2 14:29:51 2020 -0700
    
        Merge tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/efi/efi into for-next
        
        Stable branch for v5.10 shared between the EFI and RISC-V trees
        
        The RISC-V EFI boot and runtime support will be merged for v5.10 via
        the RISC-V tree. However, it incorporates some changes that conflict
        with other EFI changes that are in flight, so this tag serves as a
        shared base that allows those conflicts to be resolved beforehand.
        
        * tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/efi/efi:
          efi/libstub: arm32: Use low allocation for the uncompressed kernel
          efi/libstub: Export efi_low_alloc_above() to other units
          efi/libstub: arm32: Base FDT and initrd placement on image address
          efi: Rename arm-init to efi-init common for all arch
          include: pe.h: Add RISC-V related PE definition

I think the actual issue here is just that whatever I pointed git to when
generating the PR didn't contain the merge of the shared code yet, so
git-shortlog included it?

>> Atish Patra (8):
>>       include: pe.h: Add RISC-V related PE definition
>>       efi: Rename arm-init to efi-init common for all arch
>>       RISC-V: Add early ioremap support
>>       RISC-V: Implement late mapping page table allocation functions
>>       RISC-V: Add PE/COFF header for EFI stub
>>       RISC-V: Add EFI stub support.
>>       RISC-V: Add EFI runtime services
>>       RISC-V: Add page table dump support for uefi
>>
>> Palmer Dabbelt (1):
>>       Merge tag 'efi-riscv-shared-for-v5.10' of ssh://gitolite.kernel.org/.../efi/efi into for-next
>>
>> Pekka Enberg (11):
>>       riscv/mm: Simplify retry logic in do_page_fault()
>>       riscv/mm/fault: Move no context handling to no_context()
>>       riscv/mm/fault: Move bad area handling to bad_area()
>>       riscv/mm/fault: Move vmalloc fault handling to vmalloc_fault()
>>       riscv/mm/fault: Simplify fault error handling
>>       riscv/mm/fault: Move fault error handling to mm_fault_error()
>>       riscv/mm/fault: Simplify mm_fault_error()
>>       riscv/mm/fault: Move FAULT_FLAG_WRITE handling in do_page_fault()
>>       riscv/mm/fault: Move access error check to function
>>       riscv/mm/fault: Fix inline placement in vmalloc_fault() declaration
>>       riscv/mm/fault: Set FAULT_FLAG_INSTRUCTION flag in do_page_fault()
>>
>> Tian Tao (1):
>>       RISC-V: Fix duplicate included thread_info.h
>>
>> Zong Li (3):
>>       riscv: Set more data to cacheinfo
>>       riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
>>       riscv: Add cache information in AUX vector
>>
>>  arch/arm/include/asm/efi.h                      |  23 +-
>>  arch/arm64/include/asm/efi.h                    |   5 +-
>>  arch/riscv/Kconfig                              |  25 ++
>>  arch/riscv/Makefile                             |   1 +
>>  arch/riscv/configs/defconfig                    |   1 +
>>  arch/riscv/include/asm/Kbuild                   |   1 +
>>  arch/riscv/include/asm/cacheinfo.h              |   5 +
>>  arch/riscv/include/asm/efi.h                    |  55 ++++
>>  arch/riscv/include/asm/elf.h                    |  13 +
>>  arch/riscv/include/asm/fixmap.h                 |  16 +-
>>  arch/riscv/include/asm/io.h                     |   1 +
>>  arch/riscv/include/asm/mmu.h                    |   2 +
>>  arch/riscv/include/asm/pgtable.h                |   5 +
>>  arch/riscv/include/asm/sections.h               |  13 +
>>  arch/riscv/include/uapi/asm/auxvec.h            |  24 ++
>>  arch/riscv/kernel/Makefile                      |   2 +
>>  arch/riscv/kernel/cacheinfo.c                   |  98 +++++--
>>  arch/riscv/kernel/efi-header.S                  | 111 ++++++++
>>  arch/riscv/kernel/efi.c                         |  96 +++++++
>>  arch/riscv/kernel/head.S                        |  18 +-
>>  arch/riscv/kernel/head.h                        |   2 -
>>  arch/riscv/kernel/image-vars.h                  |  51 ++++
>>  arch/riscv/kernel/setup.c                       |  18 +-
>>  arch/riscv/kernel/vmlinux.lds.S                 |  23 +-
>>  arch/riscv/mm/fault.c                           | 356 +++++++++++++-----------
>>  arch/riscv/mm/init.c                            | 191 ++++++++++---
>>  arch/riscv/mm/ptdump.c                          |  48 +++-
>>  drivers/firmware/efi/Kconfig                    |   3 +-
>>  drivers/firmware/efi/Makefile                   |   4 +-
>>  drivers/firmware/efi/{arm-init.c => efi-init.c} |   0
>>  drivers/firmware/efi/libstub/Makefile           |  10 +
>>  drivers/firmware/efi/libstub/arm32-stub.c       | 178 +++---------
>>  drivers/firmware/efi/libstub/arm64-stub.c       |   1 -
>>  drivers/firmware/efi/libstub/efi-stub.c         |  59 +---
>>  drivers/firmware/efi/libstub/efistub.h          |   7 +-
>>  drivers/firmware/efi/libstub/relocate.c         |   4 +-
>>  drivers/firmware/efi/libstub/riscv-stub.c       | 109 ++++++++
>>  drivers/firmware/efi/riscv-runtime.c            | 143 ++++++++++
>>  include/linux/pe.h                              |   3 +
>>  39 files changed, 1275 insertions(+), 450 deletions(-)
>>  create mode 100644 arch/riscv/include/asm/efi.h
>>  create mode 100644 arch/riscv/include/asm/sections.h
>>  create mode 100644 arch/riscv/kernel/efi-header.S
>>  create mode 100644 arch/riscv/kernel/efi.c
>>  create mode 100644 arch/riscv/kernel/image-vars.h
>>  rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)
>>  create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c
>>  create mode 100644 drivers/firmware/efi/riscv-runtime.c
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
