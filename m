Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF7CC27C50
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R8U0e6/cWMGiity/2dIpY0/qkkcA3bGqeq8wEG3Siew=; b=2wxkRkpd8g7poJ
	6TyFIJJL2cjxN6vWp4K5/eIkZx2G3yIhxLLKsUY+wX4ImMDcnYbZ9LYtWLrDVk61ELBO6+Dt1jQJd
	F0lNSTmcwGqFafue2XGnQXlbEjDkpWj2Wp0bRb+L4bvxPVOPrFbXQ2dnuAOAk7nIu0R9gKEr1gJw1
	TO8ULQvs5zVbYa3vG5zzj63L7gLKXSeHNUAmohw+YWCXth8AT4t6gvW54Xpy/Cbd29DU/PRCzpTTy
	9azI0pZOPP+zaem7//RDhaefs8WZ4inPU9wijiC0jTWcM/335+c0TdiDI1JsndBgVyFbp4H10jX77
	O6bdufTisQTCAgk3/lZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4mP-0000000AlkT-1mDb;
	Fri, 31 May 2024 16:06:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4mL-0000000Alir-0UfC
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 16:06:55 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2c1afe1751cso1422776a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 09:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717171609; x=1717776409; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59bPOkit/bk/X5CUNpKpOBEpf+FwqR7nda+qLGURm8M=;
        b=lx2s0wY0KOloOxR72iyFEdMRDh1cTgrY4vyrPqieUVQaunYEYt/jWlyB0KyA4SQbPk
         JI5qZ9icbF1ikYBT+jeT0mrAJZd3sAVomeOT97oe4BVmBTWwWDjaOM8WGph1+3VT5CFG
         M5W7b5pCd/IL3MD3GjtAR2Q1k5I0YEUZ+Cpcrij4eakrs1rocHyC/UL7XdGE2TbaPYpJ
         AxeizWMBGBLdt7FV02x70+LXQaJ2sZB03jBYCoIpgchuOJougM47L9gaStyLk6XqyOy4
         6TXPoyp8bPGMonZhnuTa+BJfduzoHvbaqKQTolLyUE4fQAHhq1I+ctbbBHvo0D5RAx99
         9NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717171609; x=1717776409;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59bPOkit/bk/X5CUNpKpOBEpf+FwqR7nda+qLGURm8M=;
        b=j4XxOjCTq/SaZroN51B+92kbyHVYtnmEMU4d+6T4KsEvz2Rk/UlcYufv3CKnbhdVNC
         jSSJMm12c3WupPtrYWfYn91DID357JGPnlxUaYAe34qG1GxbarM/umrPXnA/TjnuqfD/
         bBQfOAAELDWGUGcRHbgR4quIFHbqtqf0bbtbzBuQdZMUGOmF1RtcrtqDv3wxHSEEj+TB
         Jfm53S8kUwL4KZ5EvzfjcOH34XW+0oBzRgUw9m6yZB1Y1ErfSaVYL4V2t8FZR3fn/leN
         Y1vqloRQLzSKiyA5TWwcUnCkPotKnZ9G1rOH2F35jdDcGzkmnJjonsA8JFRAEseS+NqE
         uv+g==
X-Gm-Message-State: AOJu0Yxf+01Id5d/K2Fcme7GHux2W1C0+dAw7I9WbDpmvNzM6+l5Wy5l
	cdFNu/VEeviYceaXtx8Bv+ORI9P42a9m6kKRa7rbmzxIzLQIaMETzmmNGXS6mFDdKXezGAnmBea
	P
X-Google-Smtp-Source: AGHT+IEMigNfn1r6huzicsFKt2kn2Nt7nxSoyfkxZfZCNNTaNpu9jKUKM5YvL/KwFqdKX7px3NAhtg==
X-Received: by 2002:a17:90a:d593:b0:2ab:eff6:e2ce with SMTP id 98e67ed59e1d1-2c1dc4b3f75mr2568823a91.0.1717171609109;
        Fri, 31 May 2024 09:06:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c28450d4sm1651552a91.55.2024.05.31.09.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:06:48 -0700 (PDT)
Date: Fri, 31 May 2024 09:06:48 -0700 (PDT)
X-Google-Original-Date: Fri, 31 May 2024 09:06:37 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.10-rc2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-d5ff54e8-e0e4-4b50-8461-c23eeb95b31d@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_090653_336729_E21A7F41 
X-CRM114-Status: UNSURE (   8.79  )
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

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.10-rc2

for you to fetch changes up to 1d84afaf02524d2558e8ca3ca169be2ef720380b:

  riscv: Fix fully ordered LR/SC xchg[8|16]() implementations (2024-05-30 09:43:14 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.10-rc2

* A fix to avoid pt_regs aliasing with idle thread stacks on secondary
  harts.
* HAVE_ARCH_HUGE_VMAP is enabled on XIP kernels, which fixes boot issues
  on XIP systems with huge pages.
* An update to the uABI documentation clarifying that only scalar
  misaligned accesses were grandfathered in as supported, as the vector
  extension did not exist at the time the uABI was frozen.
* A fix for the recently-added byte/half atomics to avoid losing the
  fully ordered decorations.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix fully ordered LR/SC xchg[8|16]() implementations

Nam Cao (1):
      riscv: enable HAVE_ARCH_HUGE_VMAP for XIP kernel

Palmer Dabbelt (1):
      Documentation: RISC-V: uabi: Only scalar misaligned loads are supported

Sergey Matyukevich (1):
      riscv: prevent pt_regs corruption for secondary idle threads

 Documentation/arch/riscv/uabi.rst    |  4 +++-
 arch/riscv/Kconfig                   |  2 +-
 arch/riscv/include/asm/cmpxchg.h     | 22 ++++++++++++----------
 arch/riscv/kernel/cpu_ops_sbi.c      |  2 +-
 arch/riscv/kernel/cpu_ops_spinwait.c |  3 +--
 5 files changed, 18 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
