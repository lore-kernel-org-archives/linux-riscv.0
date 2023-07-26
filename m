Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FEDC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XI23jMaZPNDuY4ssHleuTDtbozQmgD+oe3PqzFvA1FE=; b=wuPGNWan4wXSWC
	squ0CREX7qZTQ4pL9GXrLTUt3HYz/suzOqytAwHAtd8BX9iqg50wKxkbHeOGMgSyXoJBe9Z/lOncg
	JgdB/0wb9hsNIG1g3F0b2JcdwhnC8Ab5wYuFBdpXLhSVhmzlD3lTcfHPVjTlhnUH0Mrlb7WxaX7jI
	Q734x+3VTp1CZN8XCJu6kIS3ZcQXx1B9dOy/YZTUWuhr1HWSVKpdj4fB5wS+EmYHQpYz3YuJuk/2m
	JoSGGYgZYI6j1xkS7lhSyU6VdDGnKlR1EFpEIoJnLj5DxrD27HY6W7x2HTvK0ES+ARar72ibo8lrl
	GmKR/np8xZNARGcyxb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhel-00B3AG-2h;
	Wed, 26 Jul 2023 16:46:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhei-00B37x-2V
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 16:46:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1bb2468257fso38365475ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690389989; x=1690994789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=taA43ETpLC9XelDxU6ZtNji2uVvqZo51XsvT9ZpAUOw=;
        b=VZu9MJSwZY921d+CgkyRoxwMZ9iNSRGcNwXdvnISwMB6ZrvGY+S7PdYNnCTN09Ml//
         9OT/zZSv24aoMTT4p8YMqfNMaKALTuecJg7AAfyMvLYvUtCBWMHD8HmcPWG3A6DhHADY
         9zndIIv6HUn5DPGDsaK9svaN+56XhvqriI612ahHA8eL4BMQerz9GE7C7DWqrlrqyhrD
         2oFORFcvVABTahHZpXH/yATcrYwkLWjanAhlDeD98fff8tZGesgkvYndd+KcVx+PyB7n
         x3UZ7zYxPGWO/u8h37KPbndip2DXWlV/eE+HdzkbisNcgPAZzhTJsRw9oxmYcPU+eeIu
         4kFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389989; x=1690994789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taA43ETpLC9XelDxU6ZtNji2uVvqZo51XsvT9ZpAUOw=;
        b=hBk1jFdIvT5nSnpAEGalugbKYh82YlWKJFRNifEn6+zMh8y0p7mEagq0k5V0s3AP3e
         irOq4xkJx6Q6PWY7lyIM+c/jz9ABLE/xvUG/7VmNqOrgXNyRnXvRcMfoJCf4CZEYaiRm
         mhN6Wf3RVTb6TL/q0l3koOAKIrsEVjhLpasZkvXkwWLS6x2FPBfQAmmDH8Yg+0VB1mGL
         JiKpbfOf9JTf4RKqwv/D8rAknuPpH73Qe/0HG6YwYjs98arC/6s51NSQm2jgWCdj8ZqP
         txrhQFh+/6IAH9k+s8AiHV0hbgtjY5Pnub9t8Vc0MK1pi/+XzprIu3iayqF0TLE9gKNN
         uoQg==
X-Gm-Message-State: ABy/qLYvLnE/OQOWWSN6S238UjTdwutnOaISYEHb9ee0DXOeaMMSuf58
	hdlyHAuGtIkevSOFp2wtNuUizfhPsu9V0tD1chU=
X-Google-Smtp-Source: APBJJlH6j0Ww1otYztDyN7R8yPQEX4DMdjE4EaTSbvjzsuEj6+yeD2BZI9v3UPAjEZlsbhq1mBWpeg==
X-Received: by 2002:a17:903:2308:b0:1b8:aef2:773e with SMTP id d8-20020a170903230800b001b8aef2773emr2582222plh.46.1690389989599;
        Wed, 26 Jul 2023 09:46:29 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b001bb6c5ff4edsm11628870plf.173.2023.07.26.09.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:46:29 -0700 (PDT)
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
Subject: [PATCH v7 0/4] RISC-V: mm: Make SV48 the default address space
Date: Wed, 26 Jul 2023 09:45:54 -0700
Message-ID: <20230726164620.717288-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_094632_838638_82F1B32C 
X-CRM114-Status: GOOD (  12.72  )
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
 arch/riscv/include/asm/pgtable.h              | 21 ++++--
 arch/riscv/include/asm/processor.h            | 47 ++++++++++++--
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |  2 +
 tools/testing/selftests/riscv/mm/Makefile     | 15 +++++
 .../riscv/mm/testcases/mmap_bottomup.c        | 35 ++++++++++
 .../riscv/mm/testcases/mmap_default.c         | 35 ++++++++++
 .../selftests/riscv/mm/testcases/mmap_test.h  | 64 +++++++++++++++++++
 .../selftests/riscv/mm/testcases/run_mmap.sh  | 12 ++++
 11 files changed, 244 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_bottomup.c
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_default.c
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap_test.h
 create mode 100755 tools/testing/selftests/riscv/mm/testcases/run_mmap.sh

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
