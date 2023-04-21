Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEC5C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jeSANfyfMH2csJwH1B/uFJpAHJ3W5K7Cs5bGfXSU3ks=; b=fyQjL53xW72zjre047WX6gaNkD
	N2McBIeo1rPoO85cM/UZ677IXim8Sawilvo7RCT7dH6dcWnD855gSLgIGrIvRKiIVOx4or4w5Dfbq
	d5Ta9D/ptaagtYwJDaMuudIuQYzmc5zXpvd/lW3hcMKkgZd5I+ep4UJbG7Uh1pMFbBo8gjkqAJxVF
	x/ojDKCDTUYUWyP+khLADWSbxAInjOirXmIE+Sm7in8cpIHfsUWl1tG+eGurTd75JzStEr0o4vXGt
	nu/lD7UjgncXvd3aTWBIuVv7hZ/0FYoNf+5/IWhnPlqBPaToqc+DJc3bFlP4Woy8QrQWfQctkTCC1
	YfcRW+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvyk-00BftT-0Z;
	Fri, 21 Apr 2023 18:59:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvye-00Bfr3-1h
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 18:59:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1a66888cb89so21648185ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682103562; x=1684695562;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FS3xd+GxAsAM22DtQ8EZILFt6ljQaMvOWy1hQtNJeRI=;
        b=npcCe58zYvv1Q6YVOAIpfMxs/qcn/n3bq+Y2B/kyhgrQ2IwgNZsxdK9FrRF3J4dTgx
         YPGdpqPIpEye6AlFSBOpIxJlceRyot6Lcc0IRC3dj1G7B6gr3MrPA/A1NElUGrVoY53Z
         rnCogjjVEwKQgiuL7DG0+0Nqiz8lvWlf1/Y2Re++oGfgI6xYE8O0YibIDswxz1LljMWF
         4pB7LSAEZDN/niJMqEiXAS+y/uGoEayNq18mhRc2gGbryI7zhJ/2vGks7sCE4FWq4h9R
         dH7rr4jcpK2pwlb9XffOkm3s1hMe1cpIOFpPU5spiIgfag/16tCoJG3CXz3k5vOh+WFb
         kX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682103562; x=1684695562;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS3xd+GxAsAM22DtQ8EZILFt6ljQaMvOWy1hQtNJeRI=;
        b=TsKDnaPCKQEeaoIfFZLrWEW26dMQLaazQUqp30i4c7ezZlLnh0wGlOT+FYjPtbDai6
         Jislujx8/PtZ9RvgWJJDSzNk3genKbyRsCFuylI2ol4ILI41tW/87WcNt0cdR3cpcZ7t
         Q7BcmA2TWdH7In6wz3bd+QDS++4G+UKsivz1zZdwb+W8AjUHldEYQvxFwPMwXbZtBLE7
         uah0j6iJI/rTb6SNTLroEXFR7r+viW19LdGPXXybYPebEY85qY2ec79/rSgK960bTvgJ
         0v4CkxKQKcHYnpTBAwE2FZIyEZafCutm/oOTZ2cfjiYByMNyx2VWmUmiSU0imcUQdJLT
         Q3Qw==
X-Gm-Message-State: AAQBX9fnQ7mKkkLiw4EtxlhvhVwajZQ7V0zijRWSXXZIvXMDxnc6D2R0
	0oODWVL+8b1bLFVDsyVut1hF9g==
X-Google-Smtp-Source: AKy350Zk9u1sIOJGf2PvJ1wX8lSj0Nf1O/kXAYgAfDfeDXmtve5mj6ldwrjQYrqdOoqd6Tcu0TGTlw==
X-Received: by 2002:a17:903:188:b0:1a8:ce:afd1 with SMTP id z8-20020a170903018800b001a800ceafd1mr7743984plg.20.1682103562246;
        Fri, 21 Apr 2023 11:59:22 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id bh7-20020a170902a98700b001a19cf1b37esm3057504plb.40.2023.04.21.11.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 11:59:21 -0700 (PDT)
Date: Fri, 21 Apr 2023 11:59:21 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 07:55:56 PDT (-0700)
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
CC: ndesaulniers@google.com, bjorn@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kbuild@vger.kernel.org, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_115924_753106_B0734B0D 
X-CRM114-Status: GOOD (  32.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 Mar 2023 21:53:23 PDT (-0700), alexghiti@rivosinc.com wrote:
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
>
> The first patch allows to build relocatable kernels but is not selected
> by default. That patch is a requirement for KASLR.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
>
> This patchset is rebased on top of:
>
> riscv: Use PUD/P4D/PGD pages for the linear mapping
> (https://patchwork.kernel.org/project/linux-riscv/list/?series=733603)
> base-commit-tag: v6.3-rc1

The QEMU CI has some way to say "this depends on an un-merged patch set 
sent as $MESSAGE_ID", not sure if that's a b4-ism but it's a bit less 
confusing.

I merged this on top of the pre-merge hugepage linear mapping changes, 
it's on for-next.

> Changes in v9:
>   * Fix gcc/llvm compilation errors by adding patch 1, thanks to Bjorn
>   * Move a patch to move rela.dyn outside of init (patch 2): it is a
>     separate patch to clearly explain why
>   * To effectively move rela.dyn to init, we need to add patch 6: separate patch since we may be
>     able at some point to revert (along with patch 2).
>   * Add a lot of orphan sections to the linker script
>
> Changes in v8:
>   * Fix UEFI boot by moving rela.dyn section into the data so that PE/COFF
>     loader actually copies the relocations too
>   * Fix check that used PGDIR instead of PUD which was not correct
>     for sv48 and sv57
>   * Fix PE/COFF header data size definition as it led to size of 0
>
> Changes in v7:
>   * Rebase on top of v5.15
>   * Fix LDFLAGS_vmlinux which was overriden when CONFIG_DYNAMIC_FTRACE was
>     set
>   * Make relocate_kernel static
>   * Add Ack from Michael
>
> Changes in v6:
>   * Remove the kernel move to vmalloc zone
>   * Rebased on top of for-next
>   * Remove relocatable property from 32b kernel as the kernel is mapped in
>     the linear mapping and would then need to be copied physically too
>   * CONFIG_RELOCATABLE depends on !XIP_KERNEL
>   * Remove Reviewed-by from first patch as it changed a bit
>
> Changes in v5:
>   * Add "static __init" to create_kernel_page_table function as reported by
>     Kbuild test robot
>   * Add reviewed-by from Zong
>   * Rebase onto v5.7
>
> Changes in v4:
>   * Fix BPF region that overlapped with kernel's as suggested by Zong
>   * Fix end of module region that could be larger than 2GB as suggested by Zong
>   * Fix the size of the vm area reserved for the kernel as we could lose
>     PMD_SIZE if the size was already aligned on PMD_SIZE
>   * Split compile time relocations check patch into 2 patches as suggested by Anup
>   * Applied Reviewed-by from Zong and Anup
>
> Changes in v3:
>   * Move kernel mapping to vmalloc
>
> Changes in v2:
>   * Make RELOCATABLE depend on MMU as suggested by Anup
>   * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
>   * Use __pa_symbol instead of __pa, as suggested by Zong
>   * Rebased on top of v5.6-rc3
>   * Tested with sv48 patchset
>   * Add Reviewed/Tested-by from Zong and Anup
>
> Alexandre Ghiti (6):
>   riscv: Prepare EFI header for relocatable kernels
>   riscv: Move .rela.dyn outside of init to avoid empty relocations
>   riscv: Introduce CONFIG_RELOCATABLE
>   powerpc: Move script to check relocations at compile time in scripts/
>   riscv: Check relocations at compile time
>   riscv: Use --emit-relocs in order to move .rela.dyn in init
>
>  arch/powerpc/tools/relocs_check.sh  | 18 ++--------
>  arch/riscv/Kconfig                  | 14 ++++++++
>  arch/riscv/Makefile                 |  7 ++--
>  arch/riscv/Makefile.postlink        | 49 ++++++++++++++++++++++++++
>  arch/riscv/boot/Makefile            |  7 ++++
>  arch/riscv/include/asm/set_memory.h |  3 ++
>  arch/riscv/kernel/efi-header.S      | 19 ++++++++--
>  arch/riscv/kernel/vmlinux.lds.S     | 26 ++++++++++----
>  arch/riscv/mm/Makefile              |  4 +++
>  arch/riscv/mm/init.c                | 54 ++++++++++++++++++++++++++++-
>  arch/riscv/tools/relocs_check.sh    | 26 ++++++++++++++
>  scripts/relocs_check.sh             | 20 +++++++++++
>  12 files changed, 218 insertions(+), 29 deletions(-)
>  create mode 100644 arch/riscv/Makefile.postlink
>  create mode 100755 arch/riscv/tools/relocs_check.sh
>  create mode 100755 scripts/relocs_check.sh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
