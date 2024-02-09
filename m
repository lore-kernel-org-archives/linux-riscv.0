Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE8CC48297
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLMilDRaeqGf/b/XF+fw8xttF6yc1TGwK6Xq0+vlvCg=; b=1GHxvd5eL45T+j
	iz8Gt7v1OFj0ieSYGcv8D40H10Yyk0poTnoc8Xj09zW2NmCZnipt1y+bK0N/Wz7zAq+e5QmGgY47P
	tiHDLzhMgbekY5TQKy2LUHmhgU4fwGBSWcqas7PYwS7MSL7j+UxfSIne60ZLOXYbfn7+DQ5wBmSst
	Kkef5hkUKY47PF46wjJSXDj7fahrBmBnCCTc+bEitNN4dUYzBpDu65RtdIw6seSrCnSAwLG4G4ScX
	B3QvqJgYZkShVg+d9qE5ouRcYzQu2fAgsVgJhOyNwUg6KFqKaG2POSOqJOusBcqhqy4Z+ZHbKVxr2
	QamuP73ItwBgj/9v8lig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTxW-0000000HYTy-0XCw;
	Fri, 09 Feb 2024 16:42:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYTxT-0000000HYT7-1GBP
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 16:42:36 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e096229192so508670b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 08:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707496953; x=1708101753; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1v5hrasURtpD/QMj4+535HVGtxG6NrfgYnEY0yoBLM=;
        b=AloXvj9FP7bEqK3i0beoTrEaKOKnKA1z7nVnT6kP1kGcw3lXN8qff2/6LRdBB83vEd
         mk+JqpXs+8DM0YFLVrgbAj+r5QLS5tQTdnftlZmhp/4OwgZRzja9SCkY1f2kcpgyLDZm
         KEixakGA/3wZEUYZACc4UUAQGTkIgDYI2/CuYpctDfZM80/XDhLxGVH3s0bSZjloQcCl
         vVRDlcdKVwQecv3dqBoIGwqweqt+fMgBGhMNlORAHwvBn78JlpvHau85/DqOq987mort
         IvjE2o+kIcC6Nchg99Os3D94O5btsbUFX2bjkxpqQNdtI/KutmySWb/92nJMeWq9nCY8
         QRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707496953; x=1708101753;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1v5hrasURtpD/QMj4+535HVGtxG6NrfgYnEY0yoBLM=;
        b=SmnuFL3GmqlR7jqjAliXFzrdMlIR4aJx09ZMhU54a5uxmi1VFcXb6Awi1lzNBSdKAK
         KMRdyO2v2wk1dV1Pf+QHom4wLbQEUi8J1Jr+ZYsbLPkmD263NuL9w+Pnm+Z4zpS+NKnY
         rck9zDXYjcumFZ6VGKnrUvkzZh2BujcNq8MEQszLnsrZQ4H0Hy75nsr+z/JQ2aK5Q2b+
         SFsuivMis+k6j8k3YsvCObOfd/DSs5JOz5TEUzQqXFi/rAMA/QfsXzlZOWMLZVfjXpKb
         tt0x2O1LoiHqiNkqMF/9sbgn4YE5ttYFzqOVtStb+TODgM07Kcbm2fZ72sDeRqYgh1zE
         8HYQ==
X-Gm-Message-State: AOJu0YwgTGXh2vqtlo/mDd8PsKr3mGVNUmEX5K85v+pYk4/jukihayrZ
	ssgCxNgRDP2QTuBB+WYZTuCdXcR2NxxSVirrGlHhPpjQS1ppSlJQiqNSEG1FLScjWShjMnklrOr
	b
X-Google-Smtp-Source: AGHT+IHQ8ulGq5yLVFV55EPMdjwvCn4c4QEOlCrtTBjH67j3LIx3p7IRoBVmzb9VXfX8b1kwPgADgg==
X-Received: by 2002:a05:6a20:6f88:b0:19e:a3cc:2496 with SMTP id gv8-20020a056a206f8800b0019ea3cc2496mr2620520pzb.10.1707496952759;
        Fri, 09 Feb 2024 08:42:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWn5RWWHW8OAa0SKSbuR1orGWLhvB+3zYtjirNj6oNZzHvH3Co8RgbpDbPSFdNKd55FRmpA6YKQv494p3WCS1VpeoU/AC8QH5n9f3Hn
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x40-20020a056a000be800b006dde10a12b6sm722039pfu.211.2024.02.09.08.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:42:32 -0800 (PST)
Date: Fri, 09 Feb 2024 08:42:32 -0800 (PST)
X-Google-Original-Date: Fri, 09 Feb 2024 08:42:19 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.8-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-cb58eea8-c84e-4aaf-ab71-f445d3b46de0@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_084235_509921_9FB98DD1 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.8-rc4

for you to fetch changes up to 3951f6add519a8e954bf78691a412f65b24f4715:

  riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask (2024-02-07 10:19:37 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.8-rc4

* A fix for a missing TLB flush during early boot on SPARSEMEM_VMEMMAP
  configurations.
* A handful of fixes to correctly implement the break-before-make
  behavior requried by the ISA for NAPOT mappings.
* A fix for a missing TLB flush on intermediate mapping changes.
* A fix for a build warning about a missing declaration of
  overflow_stack.
* A fix for a performace regression related to incorrect tracking of
  completed batch TLB flushes.

----------------------------------------------------------------
Alexandre Ghiti (5):
      riscv: Fix set_huge_pte_at() for NAPOT mapping
      riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled
      riscv: Flush the tlb when a page directory is freed
      riscv: Fix arch_hugetlb_migration_supported() for NAPOT
      riscv: Fix arch_tlbbatch_flush() by clearing the batch cpumask

Ben Dooks (1):
      riscv: declare overflow_stack as exported from traps.c

Palmer Dabbelt (1):
      Merge patch series "svnapot fixes"

Vincent Chen (1):
      riscv: mm: execute local TLB flush after populating vmemmap

 arch/riscv/include/asm/hugetlb.h    |  3 ++
 arch/riscv/include/asm/stacktrace.h |  5 +++
 arch/riscv/include/asm/tlb.h        |  2 +-
 arch/riscv/include/asm/tlbflush.h   |  1 +
 arch/riscv/mm/hugetlbpage.c         | 78 ++++++++++++++++++++++++++++++++++---
 arch/riscv/mm/init.c                |  4 ++
 arch/riscv/mm/tlbflush.c            |  4 +-
 7 files changed, 90 insertions(+), 7 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
