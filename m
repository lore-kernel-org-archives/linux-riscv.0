Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEEAC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=amhL5vLM7p3BDnmvJYO9lmhuHdBjUderFJLKZBihhoA=; b=5Bj9rojUb3jEY7
	csyLf+zWuVMeNyUK6ghYNcKSk3Chv1jTZpiuoyrdHEgSP+JeHbAancBHfLoK56c+Q7xuOE1gjAR2T
	olu+X9vdm8i7R5kCl7SuRG1xxfP5s9XKEaYo6M7LcvFrkkEs/m1QRoO8lNI6VMd8L6wz017JJ8kMS
	48poFxRgE40Zl+RC2xOKApAOn4omnzGLiHgj4Am7w5nnpzgMqsOvoQICl6Kl50n3NxTpdPdXzwnv/
	kB4/8W3UK+9iLRhBc2ThKML2AMeFG7eYOM9ZuqGGVo/9RhTLRyMnfqoh66t979IKZdTosz2up69ua
	KVV8v86QYUbAllBz42gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIth-006EAS-B2; Wed, 15 Feb 2023 14:36:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIte-006E98-Jp
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:36:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id h16so19344593wrz.12
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRBV0SjOH4m1jqJftOHPSfzIM3NEGl9hHTTwCxPywOE=;
        b=3Y9vxYu6ar2dSB1kCRjCTzicJeTftRBdXwzP+5fueQmlRdReC3ZqXOQCw66BayRRw4
         t3XNyatq5AjKpvkWNSeSyD3WoE/CFp3DcFJeJCPHHEF//3aYjSd/uacqdvw/GQqsCYdo
         wSH2haym4J25PhWHEu/Uz7mNTc9n3wmHR4bw9pswNCnwq8f5ElyGeRw/31e1Cox/ZgxY
         kQ/PMH72LSyKwfKcxeBqbTD6pEvf7lnmcCv8NBu5010VHTEwugEgEaGlpGN9pMplxDNI
         2KEFNrML6RHJ2FAyHwNXamlbaa3LC6ywSeDdgQESFnQ47ia5GVKqv4DTGxGGblmQ/vCf
         W9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRBV0SjOH4m1jqJftOHPSfzIM3NEGl9hHTTwCxPywOE=;
        b=kc4qSobOsmGF4OubjetO81tOX3v5S6we628r6gU8VmMs3VbDgU9D3MwQl06lkDayzf
         nspkEtk+kTIhfvgdJAlakP/rxRQTPdBzCwsW2kWZgs6JWoihYsMGuZK0xOUV9kunKcpN
         Me5KA3/ITyr9zg9MhwJhAc/hpNJlbvHGDioMxQr2tY2y6AHXBkYlr/iHlFKH3hIhIgj3
         YvtdYMiK72gzf2WV9m5dKboloqp2ZL/ngC+k27ZLH8Kf644ge8iXi4/x0+GujgkcteZ+
         p5TMi8KTrSrCjixzrB0A1OCogNOVpUZoyhkTHmWXRl78hEbRJp5hHBX2a4bSYj/BLjgC
         k1xw==
X-Gm-Message-State: AO0yUKWWTfhjfxK8uKU+TG3zsTuBeGBG4MjHm/Lp3uFIJOvCoVT7yCPQ
	J/LpCKItamM6kwkG0ZR4QpbThQ==
X-Google-Smtp-Source: AK7set9r973hQ5UHjGnbObY0O9BnXI60Uko7b5o7mmb/X0KABjEgyxP2XnPeDtYgbbaurkyV430ZZg==
X-Received: by 2002:a05:6000:10c1:b0:2c5:56ff:4321 with SMTP id b1-20020a05600010c100b002c556ff4321mr2138475wrx.4.1676471789041;
        Wed, 15 Feb 2023 06:36:29 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c024400b003e01493b136sm2232092wmj.43.2023.02.15.06.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:36:28 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 0/3] Introduce 64b relocatable kernel
Date: Wed, 15 Feb 2023 15:36:23 +0100
Message-Id: <20230215143626.453491-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_063634_891301_AFF58A80 
X-CRM114-Status: GOOD (  17.59  )
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

RISC-V kasan rework (https://lore.kernel.org/lkml/Y6TTvku%2FyuSjm42j@spud/T/)
riscv: Use PUD/P4D/PGD pages for the linear mapping (https://lore.kernel.org/lkml/20230125114229.hrhsyw4aegrnmoau@orel/T/)
riscv: Allow to downgrade paging mode from the command line (https://lore.kernel.org/lkml/CAHVXubjeSMvfTPnvrnYRupOGx6+vUvUGfRS3piTeo=TH2cHKNg@mail.gmail.com/)
base-commit-tag: v6.2-rc7

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

Alexandre Ghiti (3):
  riscv: Introduce CONFIG_RELOCATABLE
  powerpc: Move script to check relocations at compile time in scripts/
  riscv: Check relocations at compile time

 arch/powerpc/tools/relocs_check.sh | 18 ++--------
 arch/riscv/Kconfig                 | 14 ++++++++
 arch/riscv/Makefile                |  7 ++--
 arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++
 arch/riscv/kernel/efi-header.S     |  6 ++--
 arch/riscv/kernel/vmlinux.lds.S    | 10 ++++--
 arch/riscv/mm/Makefile             |  4 +++
 arch/riscv/mm/init.c               | 54 +++++++++++++++++++++++++++++-
 arch/riscv/tools/relocs_check.sh   | 26 ++++++++++++++
 scripts/relocs_check.sh            | 20 +++++++++++
 10 files changed, 171 insertions(+), 24 deletions(-)
 create mode 100644 arch/riscv/Makefile.postlink
 create mode 100755 arch/riscv/tools/relocs_check.sh
 create mode 100755 scripts/relocs_check.sh

--
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
