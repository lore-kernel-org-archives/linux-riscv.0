Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA76EC5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FD0aIylx0MsKNjtmOAtxDVPwF+yu4ph6iZV2pvPHGNw=; b=OEPkui9RoX3qwk
	TogxgcgJK+q9F4ysytXPk2pBLDrfZlRcx0LhSti3kIK9GtEF72QWKlRpLjF00qXVrFn2tEmM640LW
	iMczAgt6ax+irujTmSYppZb4pbQNlH0GATdiq8Wcl+uZo3GnnDCDiy5lkS6lg0FjTYWsSLOCx9IEc
	hdm7xY/eOW9yJMST6TtKmnP+eWG9VVqF6iUl28IskUPhDzMWpts9rPBuxWa2PpMJrzcbfl4jNl0od
	OBHqA2g857t3+eMIPrbGOJTutWlXfiM7CsNLG8EPIrkJB9UCpbZn52ShRRn6DkALNhVXEuSyA4YvQ
	pVcPQxIULwxZhNji1lOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4ZV-00000000qlu-1J0R;
	Fri, 01 Mar 2024 15:13:13 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg4ZS-00000000qlK-1C6c
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 15:13:11 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e56787e691so2213226b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 07:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709305988; x=1709910788; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMVK9+p+tkA+fohUNY71dFJvaJ/Hs/TdoD21E/6FbxQ=;
        b=Y00VGWKD1wTI8A7AXzOzQqsNxpRQj/wOIkGy1M1Q2JU8IzMMVZkWhHlQHGoAazPqTW
         4F2QydkyUoxH3T6XIGmjCkE0QNXhnmQwQw/9RRXwxvGY63LDKvErjDN/sQxgMaqA3Ylc
         c6RBZjKPk7bLNahIPFwaTdz2A0jxfI3UXAIOZ0png11t5Okygb8FSNlEd9C0Rr0zgGJk
         9KV8edJJgdWdi9YD6+yvWTmvKmkgyiQr8OZiyLn9AyolkeWtu79MGGXS3FZX0FLhCtix
         FVGsSgUz8tJvQogJdE7uX8Fk7mxe1CUy2RLyidrUQQOoDqTSg6s9Ksf2xTGov5Adymhy
         vjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709305988; x=1709910788;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMVK9+p+tkA+fohUNY71dFJvaJ/Hs/TdoD21E/6FbxQ=;
        b=gKbJlCPPNpBSfah7jknW84EqXHDzPoO5qzw5ZVCESw1H68kklwH6jeCGRDBKkOoQnn
         8WkzqNuFk5tl9wdwY77EG7wlxBCU8Tp9fQkL8mkDPOdxhUvPAOr5Ei4iQ5AY7yJsyLGm
         wnbP6Gy4fMVulod3DU09tixImUl0yuEU0a6P4DrHAgd+ET0nb7PjYCkozi+8tcuQ8I16
         cOhZTbdeSQT84L4j6hWLB2Go+PRIYh06j9bcma99jDl5V6T1DJx+f+Ef7tE4PxUqutG8
         6wVqmWkrVhzYTL76mO9XByI4jpq/5kd39cFKYEHtQtLjORjKcZOMXl1CzS1xQoW8FzrX
         xb+g==
X-Gm-Message-State: AOJu0YwM3lgGiO2MXB1Or+dBHjzSVM/Zvt+IAv34cCNF2YyXvICrzx7L
	n1KdgLRzkuxwi11jbsFH+H+Xcg7vF2OznBaXlM1b04CNc/pbm07g3B729xdUM8TLePlQ3gw3aag
	c
X-Google-Smtp-Source: AGHT+IGGb89ySbuv4ZT1f5mSZidSaCgG1DqN2pG1O4LijsieItM5uUQOPBJf9JXkYUi8mjuawf81Lw==
X-Received: by 2002:a05:6a21:189:b0:19e:cf1a:5369 with SMTP id le9-20020a056a21018900b0019ecf1a5369mr2333877pzb.24.1709305988298;
        Fri, 01 Mar 2024 07:13:08 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id ff11-20020a056a002f4b00b006e57b37a932sm3084044pfb.9.2024.03.01.07.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 07:13:07 -0800 (PST)
Date: Fri, 01 Mar 2024 07:13:07 -0800 (PST)
X-Google-Original-Date: Fri, 01 Mar 2024 07:12:59 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.8-rc7
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-17aa05c6-25a6-481d-ab1e-cd01d8b4da43@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_071310_537880_5B8516CE 
X-CRM114-Status: GOOD (  11.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 3951f6add519a8e954bf78691a412f65b24f4715:

  riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask (2024-02-07 10:19:37 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-rc7

for you to fetch changes up to a11dd49dcb9376776193e15641f84fcc1e5980c9:

  riscv: Sparse-Memory/vmemmap out-of-bounds fix (2024-02-29 12:24:31 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.8-rc7

* A fix for detecting ".option arch" support on not-yet-released LLVM
  builds.
* A fix for a missing TLB flush when modifying non-leaf PTEs.
* A handufl of fixes for T-Head custom extensions.
* A fix for systems with the legacy PMU, that manifests as a crash on
  kernels built without SBI PMU support.
* A fix for systems that clear *envcfg on suspend, which manifests as
  cbo.zero trapping after resume.
* A pair of fixes for Svnapot systems, including removing Svnapot
  support for huge vmalloc/vmap regions.

----------------------------------------------------------------
Alexandre Ghiti (3):
      riscv: Fix build error if !CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
      Revert "riscv: mm: support Svnapot in huge vmap"
      riscv: Fix pte_leaf_size() for NAPOT

Conor Dooley (1):
      RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs

Dimitris Vlachos (1):
      riscv: Sparse-Memory/vmemmap out-of-bounds fix

Fei Wu (1):
      perf: RISCV: Fix panic on pmu overflow handler

Jisheng Zhang (1):
      riscv: tlb: fix __p*d_free_tlb()

Nathan Chancellor (2):
      kbuild: Add -Wa,--fatal-warnings to as-instr invocation
      RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH

Palmer Dabbelt (5):
      Merge patch series "RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of tree LLVM"
      Merge commit '8246601a7d391ce8207408149d65732f28af81a1' into fixes
      Merge patch series "drivers: perf: fix crash with the legacy riscv driver"
      Merge patch series "riscv: cbo.zero fixes"
      Merge patch series "NAPOT Fixes"

Samuel Holland (4):
      MAINTAINERS: Update SiFive driver maintainers
      riscv: Fix enabling cbo.zero when running in M-mode
      riscv: Add a custom ISA extension for the [ms]envcfg CSR
      riscv: Save/restore envcfg CSR during CPU suspend

Vadim Shakirov (2):
      drivers: perf: added capabilities for legacy PMU
      drivers: perf: ctr_get_width function for legacy is not defined

Yangyu Chen (1):
      riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly

Zong Li (1):
      riscv: add CALLER_ADDRx support

 MAINTAINERS                         | 29 +++---------------
 arch/riscv/Kconfig                  |  1 -
 arch/riscv/include/asm/csr.h        |  2 ++
 arch/riscv/include/asm/ftrace.h     |  5 +++
 arch/riscv/include/asm/hugetlb.h    |  2 ++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/include/asm/pgalloc.h    | 20 ++++++++++--
 arch/riscv/include/asm/pgtable-64.h |  2 +-
 arch/riscv/include/asm/pgtable.h    |  6 +++-
 arch/riscv/include/asm/suspend.h    |  1 +
 arch/riscv/include/asm/vmalloc.h    | 61 +------------------------------------
 arch/riscv/kernel/Makefile          |  2 ++
 arch/riscv/kernel/cpufeature.c      | 31 +++++++++++++++++--
 arch/riscv/kernel/return_address.c  | 48 +++++++++++++++++++++++++++++
 arch/riscv/kernel/suspend.c         |  4 +++
 arch/riscv/mm/hugetlbpage.c         |  2 ++
 drivers/perf/riscv_pmu.c            | 18 +++--------
 drivers/perf/riscv_pmu_legacy.c     | 10 +++++-
 drivers/perf/riscv_pmu_sbi.c        |  8 ++---
 scripts/Kconfig.include             |  2 +-
 scripts/Makefile.compiler           |  2 +-
 21 files changed, 145 insertions(+), 113 deletions(-)
 create mode 100644 arch/riscv/kernel/return_address.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
