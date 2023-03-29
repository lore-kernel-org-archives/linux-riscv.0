Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63195C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 04:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sSapYjd8bgqt9gNyxNg8bRaudHVcXD0HD8yk9hVjxD4=; b=sNrQYF6pBSls/M
	9hBnQfxMO0Ij9wu7OP9IvoBhsGm2RhLm/lsuJyHdG8FoP1OMHUkbM2Mmz3vgsTKq1da6uCY5GV0mi
	4ylQuWwru8ylPi6jej/Br4cU8MPvb+BW3ZDLWh5gmsa0ena38H4v621xWbnVW1KslGJv//DZ+6oNP
	J3ZIYbVmj9Yu5hdqPjxn+G8opkZXsD4eme8nbh2XH/zmR8xO6n0GBwYYoT850zG9OtmJyghDwPucs
	1sasSC7Z6/CFn34fpjqL5QxTIINl2QbSwHhziof6cAh4vVP/7UJ9BHaPemp4tRvbT7J1SmqjLaF3/
	hHTNvEW6ulwpgiUypdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNoa-00GbTi-1h;
	Wed, 29 Mar 2023 04:53:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNoW-00GbSV-2Z
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 04:53:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso10670908wmb.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 21:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo0pBz6wf3kyiWYQ9fjYRy+Wu64GhON7Bmz6ajIouOI=;
        b=dT3vR+5BCE0d2cD8qefotDYbxWqPr15i/uHQCi1YF886RpaVStPW6F27dSe9spSiBr
         nSo/S/VtEpndi0j2dD/H1lMx8HaUY3qjH1EQ0q68rn++tg5lbeV9YItR3H0UmqtidEr4
         GKRKJRhc5o+iNCRWeEZHO5kblPX5hYBdEfCMio2bAlbhW/sSelRb5v3N5WHsZkyfM5Gj
         becrsvXvlUJx1Mi33oacQC/hIR35TWFoCcR6S6AhtBxCZ8C9wt3Pf9FlTe+EOUXVxDTu
         KpQUXUSJ49y/XaC9UKkb06EVDpFkbGgNuj1x5g1oHnS0J3RO9jlYM2uhXRKwop3WEa/o
         XeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo0pBz6wf3kyiWYQ9fjYRy+Wu64GhON7Bmz6ajIouOI=;
        b=CWfziidoUCoexhgLXnQSzTCsQ22cYNYNJ3z4gE6Owpqh//IGtmAK1YajO3Dklqp55U
         JTClpRWMdyeirzzEKNPW7vEPKavQ+ruTXh12Ngt7zRYYoh/JONR3FZts/6etBCVp92GH
         XGn1KRt7o7GA5Gq7pmlzqCsHTwxR111GqId/cdHiFaTm90fDY48tHKW+4hfYtUHqALzd
         z8ltCI/fo0+5BMJKNAV/IfC7YgV/P1/Ze58OjSFEZd8PDHjc/8J2AeSrfAJH+zrvo/yY
         /bgB2vtjPIn8mDd62zkm95PAYcFT+fTj11dfZLvDHBHEzZ+7LBDAVI4WKy+ThPbHUr2Y
         D78A==
X-Gm-Message-State: AO0yUKViSFa35A41kTAws6TTM2Sj5NrdUHoWBZHUB89luKud/3FFgn9q
	Y/NJfie7X+cw4kqU/DtRGrDu7g==
X-Google-Smtp-Source: AK7set9J+TBd/c5WkVGXfbeJnMQvLgoUo8YsvVH4bgNXSXp/VtTgvyfk23V2+90Kw1vfaq4rCqyaVA==
X-Received: by 2002:a7b:c850:0:b0:3ed:29db:cb80 with SMTP id c16-20020a7bc850000000b003ed29dbcb80mr13580773wml.18.1680065613023;
        Tue, 28 Mar 2023 21:53:33 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o6-20020a1c7506000000b003ee63fe5203sm757591wmc.36.2023.03.28.21.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:53:32 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 0/6] Introduce 64b relocatable kernel
Date: Wed, 29 Mar 2023 06:53:23 +0200
Message-Id: <20230329045329.64565-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_215337_072302_EBF0E10D 
X-CRM114-Status: GOOD (  20.55  )
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

After multiple attempts, this patchset is now based on the fact that the
64b kernel mapping was moved outside the linear mapping.

The first patch allows to build relocatable kernels but is not selected
by default. That patch is a requirement for KASLR.
The second and third patches take advantage of an already existing powerpc
script that checks relocations at compile-time, and uses it for riscv.

This patchset is rebased on top of:

riscv: Use PUD/P4D/PGD pages for the linear mapping
(https://patchwork.kernel.org/project/linux-riscv/list/?series=733603)
base-commit-tag: v6.3-rc1

Changes in v9:
  * Fix gcc/llvm compilation errors by adding patch 1, thanks to Bjorn
  * Move a patch to move rela.dyn outside of init (patch 2): it is a
    separate patch to clearly explain why
  * To effectively move rela.dyn to init, we need to add patch 6: separate patch since we may be
    able at some point to revert (along with patch 2).
  * Add a lot of orphan sections to the linker script

Changes in v8:
  * Fix UEFI boot by moving rela.dyn section into the data so that PE/COFF
    loader actually copies the relocations too
  * Fix check that used PGDIR instead of PUD which was not correct
    for sv48 and sv57
  * Fix PE/COFF header data size definition as it led to size of 0

Changes in v7:
  * Rebase on top of v5.15
  * Fix LDFLAGS_vmlinux which was overriden when CONFIG_DYNAMIC_FTRACE was
    set
  * Make relocate_kernel static
  * Add Ack from Michael

Changes in v6:
  * Remove the kernel move to vmalloc zone
  * Rebased on top of for-next
  * Remove relocatable property from 32b kernel as the kernel is mapped in
    the linear mapping and would then need to be copied physically too
  * CONFIG_RELOCATABLE depends on !XIP_KERNEL
  * Remove Reviewed-by from first patch as it changed a bit

Changes in v5:
  * Add "static __init" to create_kernel_page_table function as reported by
    Kbuild test robot
  * Add reviewed-by from Zong
  * Rebase onto v5.7

Changes in v4:
  * Fix BPF region that overlapped with kernel's as suggested by Zong
  * Fix end of module region that could be larger than 2GB as suggested by Zong
  * Fix the size of the vm area reserved for the kernel as we could lose
    PMD_SIZE if the size was already aligned on PMD_SIZE
  * Split compile time relocations check patch into 2 patches as suggested by Anup
  * Applied Reviewed-by from Zong and Anup

Changes in v3:
  * Move kernel mapping to vmalloc

Changes in v2:
  * Make RELOCATABLE depend on MMU as suggested by Anup
  * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
  * Use __pa_symbol instead of __pa, as suggested by Zong
  * Rebased on top of v5.6-rc3
  * Tested with sv48 patchset
  * Add Reviewed/Tested-by from Zong and Anup

Alexandre Ghiti (6):
  riscv: Prepare EFI header for relocatable kernels
  riscv: Move .rela.dyn outside of init to avoid empty relocations
  riscv: Introduce CONFIG_RELOCATABLE
  powerpc: Move script to check relocations at compile time in scripts/
  riscv: Check relocations at compile time
  riscv: Use --emit-relocs in order to move .rela.dyn in init

 arch/powerpc/tools/relocs_check.sh  | 18 ++--------
 arch/riscv/Kconfig                  | 14 ++++++++
 arch/riscv/Makefile                 |  7 ++--
 arch/riscv/Makefile.postlink        | 49 ++++++++++++++++++++++++++
 arch/riscv/boot/Makefile            |  7 ++++
 arch/riscv/include/asm/set_memory.h |  3 ++
 arch/riscv/kernel/efi-header.S      | 19 ++++++++--
 arch/riscv/kernel/vmlinux.lds.S     | 26 ++++++++++----
 arch/riscv/mm/Makefile              |  4 +++
 arch/riscv/mm/init.c                | 54 ++++++++++++++++++++++++++++-
 arch/riscv/tools/relocs_check.sh    | 26 ++++++++++++++
 scripts/relocs_check.sh             | 20 +++++++++++
 12 files changed, 218 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh
 create mode 100755 scripts/relocs_check.sh

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
