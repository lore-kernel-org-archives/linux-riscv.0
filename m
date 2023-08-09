Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E006FC04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n/oBxVYQwMS152bwuj6vyjRNpcdAkJNNsQc80Tj7JdY=; b=nmES54jGz2Ysp/
	FfIQbuEIpZxzpmQoOZfs8w7JE56b1iOecSdu72YzA1iccf8MtG7lJcNcvMBkobYJjL2zrXF2p+10V
	TH15dbpCQ0fYh6kn7XVzHY467dI7SOhwXy3ULPHm2SMplq5a/9psckxOW6m38ySHQTzD6oFBurXYW
	qM3lXIpYxt+EoVYHbq3aIE4OuV0uYVrYn2lJhP1cpxLQ7L+ptNF1R0u5RIYJUTzmrSCtXMeIlBzaw
	TyJsYKzETWlwh9Cdm6QasVUBHXeD9yG3NA2vTAGE/AYvh5K6V2Zl11kTy7lJHLfMdQDVs1N5s8Khm
	RHpM9GR/DAA8xGtEiKRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNt-003q3q-2I;
	Wed, 09 Aug 2023 01:53:13 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNp-003pzb-24
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:53:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bbbbb77b38so39899495ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691545986; x=1692150786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UtoNrqFUKslO70ZXL4UNEXOjKDOXZBueUpk6sT8KlRA=;
        b=StgyxgerM/v48ko0wif1IouoNrGfeAt0DQ9gH4XXOfXEvWdda9w/lRT/W0WLrYHw8Y
         HCI7mRrtJwdyITpgruffl82O3nc4neJFoCZmYn2rwc6n5b5kkyueu/OV3qwN5pQNXVjl
         gD8c72+AoAbNzG6wi0yhhdTdeZvrG/v/2GNuSusbIxt4H5XAhxp95/5j4s6pBgDkjjgj
         F/RYJYuDwMyJLNFUBnuiYtOePN6sMW+75O0ck7p0+zzR2FqrHGhUp0KePrWL3VR1nPHt
         GqWhS4Dsi1mH1CKzHnPDOBNf/lzH42O7nktuH/HgyW4DJE8IY/sa6GNje/dgSwG+MxS+
         CteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691545986; x=1692150786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtoNrqFUKslO70ZXL4UNEXOjKDOXZBueUpk6sT8KlRA=;
        b=hCvkZ/WTV+oS/IyvhE0Q6gFe9GMAUn1zazzlJM9/FSoGracV+EV6piyuWxjSqdP2Ih
         tPbrjq2aR9CjtyzK3tSfN+k7VPRwyb8R/ejjPmUjG40mlWtbtVVk/O6O6OHSnpeGV8TJ
         WGFDYSaEVPNAlAch/ky47aC0cFnxGX6KhOvo4F2kF5JqZ6iWKLW4HmZ0JYUwzp0dA1Cb
         DK6uBcVvFrWiosPVq+UWUgzBshYOfTyUcEUHy/TH/wcu8L/v2RCI4Y3qB7Iqkb8goLqU
         4ZaqId/WJvCzYjpUNfCDQ/meSDQyYWmXwYjV+ViadKqTIVjzUP0RiUC7qcAzv+1JUj0e
         CFkA==
X-Gm-Message-State: AOJu0YyBoG/PPvGx8lK1IxU8AkeA68AvBAVnXpPziB35v26S+ZZorNgi
	1S7UO/WSmDKjCZYML4E09aa9dn2EaTEoZHzI8ps=
X-Google-Smtp-Source: AGHT+IETK47y7WHfs1Fi+VVpMxPGO7IsKhzhbeCiVg2BmCKUP+WGC7R8S47dwV+JENhl+KILQ0Yv9A==
X-Received: by 2002:a17:903:2351:b0:1b8:9ecd:8b86 with SMTP id c17-20020a170903235100b001b89ecd8b86mr1790925plh.5.1691545986411;
        Tue, 08 Aug 2023 18:53:06 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id bj7-20020a170902850700b001b87bedcc6fsm9657591plb.93.2023.08.08.18.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:53:05 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v9 0/4] RISC-V: mm: Make SV48 the default address space
Date: Tue,  8 Aug 2023 18:51:06 -0700
Message-Id: <20230809015110.3290774-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_185309_704140_A62B9A09 
X-CRM114-Status: GOOD (  13.88  )
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

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Users can now select a
desired address space using a non-zero hint address to mmap. Previously,
requesting the default address space from mmap by passing zero as the hint
address would result in using the largest address space possible. Some
applications depend on empty bits in the virtual address space, like Go and
Java, so this patch provides more flexibility for application developers.

-Charlie

---
v9:
- Raise the mmap_end default to STACK_TOP_MAX to allow the address space to grow
  beyond the default of sv48 on sv57 machines as suggested by Alexandre
- Some of the mmap macros had unnecessary conditionals that I have removed

v8:
- Fix RV32 and the RV32 compat mode of RV64 (suggested by Conor)
- Extract out addr and base from the mmap macros (suggested by Alexandre)

v7:
- Changing RLIMIT_STACK inside of an executing program does not trigger
  arch_pick_mmap_layout(), so rewrite tests to change RLIMIT_STACK from a
  script before executing tests. RLIMIT_STACK of infinity forces bottomup
  mmap allocation.
- Make arch_get_mmap_base macro more readible by extracting out the rnd
  calculation.
- Use MMAP_MIN_VA_BITS in TASK_UNMAPPED_BASE to support case when mmap
  attempts to allocate address smaller than DEFAULT_MAP_WINDOW.
- Fix incorrect wording in documentation.

v6:
- Rebase onto the correct base

v5:
- Minor wording change in documentation
- Change some parenthesis in arch_get_mmap_ macros
- Added case for addr==0 in arch_get_mmap_ because without this, programs would
  crash if RLIMIT_STACK was modified before executing the program. This was
  tested using the libhugetlbfs tests. 

v4:
- Split testcases/document patch into test cases, in-code documentation, and
  formal documentation patches
- Modified the mmap_base macro to be more legible and better represent memory
  layout
- Fixed documentation to better reflect the implmentation
- Renamed DEFAULT_VA_BITS to MMAP_VA_BITS
- Added additional test case for rlimit changes
---


Charlie Jenkins (4):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Add tests for RISC-V mm
  RISC-V: mm: Update pgtable comment documentation
  RISC-V: mm: Document mmap changes

 Documentation/riscv/vm-layout.rst             | 22 +++++++
 arch/riscv/include/asm/elf.h                  |  2 +-
 arch/riscv/include/asm/pgtable.h              | 29 +++++++--
 arch/riscv/include/asm/processor.h            | 52 +++++++++++++--
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |  2 +
 tools/testing/selftests/riscv/mm/Makefile     | 15 +++++
 .../riscv/mm/testcases/mmap_bottomup.c        | 35 ++++++++++
 .../riscv/mm/testcases/mmap_default.c         | 35 ++++++++++
 .../selftests/riscv/mm/testcases/mmap_test.h  | 64 +++++++++++++++++++
 .../selftests/riscv/mm/testcases/run_mmap.sh  | 12 ++++
 11 files changed, 258 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_default.c
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_test.h
 create mode 100755 tools/testing/selftests/riscv/mm/testcases/run_mmap.sh

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
